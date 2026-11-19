Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085406;
	b=QYDDxbcsrSNgnp5iFK20KEA1662B+sElf5h37RPrwPrS1+/GW8G10x2GTS+MxwgqD82R
	 jH/QsyS+SM/w8J3D4iKQTIQ+m5HU2+klcCiJOKZxIBtiO/Rsu+Kez9DgrxUpnUCsEYvLv
	 Z3c68se0LWfZjsSArsAm3mk3a507wya3lalGPmyq/JQeJw2fahZcz2dx6lHF81XYztunc
	 WlFyNNbHh3cDqqiOBnpiNHGTbDtar7JGlTdJXzZkENrgjnPygz8d3+2Zphdv1daqTbUQn
	 /O8h8nFRTuCf9Jwa0xjxMn8cYP9aE1ATw3u4ENwpD93QPHOyvkF5KdKINk/vmlkx2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=s4cvZp5AvfgYLV2auk5QpJzzeS5J6/LvcVBr+ffVl4c=;
	b=EQY4S11lUwCDBLMPvIuqXdEurZZ/yQO2UJg8sohxTT6wkXgm0aYUmQhue5JfxTfOrDWR
	 +FrP/M8Ml0p7OPpEBdi3wZebY7wm1ah55QY2oCbfpcfEqxEvndcB0xb9sEFSmOIzQ2JpW
	 ygvseopCbPoy6IuG2QZPL6GwpZeoaCTCbZUYKGz/b50hHhLk3FXqZo7cT1scprk5khxco
	 9LfkCSxPF7CUHdy1YadiyssofLfdGwEFeS+zbGgf8mlJ1wfwC6LBMvkc7QBddhc+x+NUx
	 nzGC3Jg6jkcP1ebgwJVtmbDvJpXQN7zH6l9kj6eBOJk7+ujEEuJ3zNb+vLixVuZzD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HmUe4j2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A867606A320;
	Thu, 19 Nov 2026 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HmUe4j2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B9B1F000C4;
	Thu, 19 Nov 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795085406;
	bh=s4cvZp5AvfgYLV2auk5QpJzzeS5J6/LvcVBr+ffVl4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HmUe4j2yxQ2oTG5s3dCpl9cKQqmsi8aXFlSZf0aKdCdb9hkDH+VtEQfkB1Cuka+Vr
	 Cn02+Yoj3ihwV5cN6K6BlQvByc1z1VA2JNp+RcMauZyuAHZ0hlJfwtk1iwMxrHwDSo
	 ZRKNKmcyYGbKxC3u5eGRQEUZlYR94gZ3rVVEyz8gFE3gtu0HjlMdThPATxq47uAoCd
	 RAe7DRW4VJcW/AhbQZx/SPst251mFJ913kfwOqafR1fvnEpiUP+cS2E+hBQ7ty3ZUc
	 SX1SLXNoEuPucrnM1KpZWNDv/0BO0Xh2C2qgKLX/iq7j3Kt2tWZJ36EccIMovx/4wT
	 tkb3pGAJx6kqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14BE3808210;
	Thu, 19 Nov 2026 10:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508540478.3012506.10510829402469868625.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 10:50:04 +0000
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
In-Reply-To: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
To: Igor Velkov <iav@iav.lv>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 17 Nov 2026 00:54:06 +0000 you wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO
    https://git.kernel.org/netdev/net-next/c/cf0dd134a16e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



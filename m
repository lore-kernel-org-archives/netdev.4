Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222210;
	b=3DoWw5ckxciyuYawufeNLh+16E1miFEpfcJG4YV3KRz+W+wTJ2YpAs2vHfA7FI4jqlvA
	 TIbftrKbvl/YbOAxFwOYYOfzfREeJE/416Wf0C+fUpVbUzNL44yYNOHut403mFPVovjtH
	 7w/ZGn1Hken4ojb5FA7LIPfGA4zE14D52Lv1HQj8FNLxashIFY7HUcBvbCe7EH80tpoK6
	 h1ALl3tmooAr5TUuQtJKtoaUk5THLrM6pX438wuov6Z+6cltFTdI41c2seaCRu0bqIPHd
	 hCe3f/vh6eMSqBGspbI3SDeVjYf1wgC3ZOo+66XQh9Z+U/i2TyykZsD6PST+xcqxMfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Up2cFk5w62BEtco6hx3g7yToc/DUMq6gy1VzglFX7TU=;
	b=vNiZauQGl+KVoaUOnMFQWHV2NICwfbBrQ42U/G9cV4H6ANTa/noj40xNY/5rGZnM5qHs
	 4gDkiOxB+Lsm+3u5muFmUe2V3a1fhLo0mRQs91AQCEo7CIvWHHOEwBpDOtaPkQcLLV1/2
	 RUNJZVwEPO0P9lj5piHi6ObANfafMu8Gn31ZGttUbaHaBAL4S3C8U5+/IprL8Bd6nNd4d
	 Ie1AUSoYG3iUvCX2ojloRdQiO70M8kVjxXhSG3arlhsjWwWhYmAZpSI50wyJ06EH9FXkm
	 DdOUU0g81eHUoUOp8JpBEYe69lbv2jhjqrDAWo0x5/FzEhynIr1LZ7TZfyLbQG+kGgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHtiqf+m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFB606A6AB;
	Sat, 21 Nov 2026 00:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHtiqf+m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069FE1F000CA;
	Sat, 21 Nov 2026 00:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222210;
	bh=Up2cFk5w62BEtco6hx3g7yToc/DUMq6gy1VzglFX7TU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dHtiqf+mc0oc/6z5VIN5xiSZW7BsVHlo8E2p2RbE60CTmgqhXX5gBuUehkFWOPenO
	 9MPPLZ1khDHR49A/ZPvhH1FL2FZQmWq7gkXcUdT14gIXVOwpCk4TcrrhkfvgHkfunV
	 djbDLlHo93OMEmfr8EQPV+fLsUXiBE8OLgYSuQgsYLFXzQxI6svc6LFjgr3otzfwiA
	 5yynzkWm3NQTibmX1qNENlXgYnyuK9Qyui04zW2TzkHfcTvkTzN8SBt9dYteeIxugQ
	 KWoDJU7TSvofB0JfuBNk5aCdtLkfEAOgU8aAab5wlskN81ucyH38Jdvd3TvszguF0M
	 rgpfikQM1so7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1526380AA4D;
	Sat, 21 Nov 2026 00:50:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from
 the descriptor
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522220852.862800.14468159947649215133.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:50:08 +0000
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 ovidiu.panait.rb@renesas.com, recv.jo@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 17:21:34 +0100 you wrote:
> Stmmac's double VLAN handling hasn't been working great for a while,
> it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
> it was found that the tag stripping hardcodes the 8021Q tag type for
> XGMAC while stripping the tag, while the IP actually reports the outer
> tag type in the descriptor.
> 
> The tag type can be one of 6 different values (note inner/outer is
> reversed in the macro names):
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: xgmac: Report the VLAN tag type from the descriptor
    https://git.kernel.org/netdev/net-next/c/d82b4f3a8a2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



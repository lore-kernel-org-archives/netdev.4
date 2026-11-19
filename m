Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047017;
	b=3m0XpJs+vg0oyu+BCuMp9M5RaZX+/Afv723td/6FqwLe2dMbmiHvtqAElghh1mguFufv
	 iWX6M/SRaklVbtMf3+WEPrBCXFP8TO36nJIMe//6MD5mRL72VpftFMEMc3C6ytX19WjLF
	 olPjNv+4FAyAjjViV5P1FfGMkfHKo/VVZHa66G3k2ci53wS/1IssRNsh5fk7stmVzHVK/
	 9yWsRr8qqtb8Ds0FYFZGDizkICGgPEDF4BEZumUz08ACBwsj5Esqgxa6WHgoYlPRn1tOQ
	 z+Y+d9w2xiPGqgLyP48xRNOkRqMbkIVyBYTthC88jl2RedAU+sqjl4r7K3M+cHkZZoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047017;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kYm9XtU7bhwaGxWBMMEvmHGPIYX2Rp5d2KeRu7i0438=;
	b=MWTx35c8AOoyIl+zXTDMOegeShvHiuxDsYWKQXyXIz4WP6rYH/5hxwakc+2ZtnHFnEE+
	 5YAoPCHcI5XLU9pKJnbAvZpnbXjZ5ew2vqvl4QTC0MyWeDvsrC85VrGYG6/u+UlToebUd
	 8rZpI89Vk2ahCyNT8wSdnmL0L82eIEI6gRbREv3GwW1Scc5xpf3BKDaUxx4A65e12ZDw9
	 rSFkmfHPX90J7hhVhBEvGACj9VFjuM5+lHj1GWAzf80o7sm9OYGIzqnRXRZr9jl8WdIkT
	 5zGT0WxLgQJ3YBb3fJotb8QUbwKoGXajtwrSucEPgzGP3CHXKhvsJGawCJu8sV01Mzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e2mQtDA/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B240D60A2638;
	Thu, 19 Nov 2026 00:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2mQtDA/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8531F000C4;
	Thu, 19 Nov 2026 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047017;
	bh=kYm9XtU7bhwaGxWBMMEvmHGPIYX2Rp5d2KeRu7i0438=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=e2mQtDA/1qs6A/a6bfAXzSrN+d8P/B3R+P/UJTH0+uAm432BvGcgJybpde+NFCmRY
	 0qNpjfezDNR0Hs9YsJystUyOJPXGe9keli/D3LVlWE/bd8NEeIQnv1Iy8dJispi1+y
	 BwW27jfeRSU7Nj5CmGDQKeoDLgGIL45rRSmlDXrMshZZEPjHhAPkolPEZAMHmtf+Jy
	 IxLsxr1tSmX18M4HLXHlCfciXMxRtiJv86P9XS5Wu6POIMBGu1mmV2Kxg2cnAtk/Ta
	 Tj8tZMFm+5HuXtOifKpY7s5OyJ/J/SL0fxfwvmo7ruCnvRGwON05Bs4zT631AN2qJ0
	 cVxvvozRTYeyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773B43808210;
	Thu, 19 Nov 2026 00:10:17 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2 0/2] ipvlan/macvlan: fix local RX byte
 accounting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504701602.2637749.15558079674577414264.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:10:16 +0000
References: <20261112025619.563195-1-yanxia@cmss.chinamobile.com>
In-Reply-To: <20261112025619.563195-1-yanxia@cmss.chinamobile.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, maheshb@google.com,
 arnd@arndb.de, kaber@trash.net, dskr99@gmail.com,
 linux-kernel@vger.kernel.org, yana06070@163.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 10:56:17 +0800 you wrote:
> Both ipvlan and macvlan count the Ethernet header twice for some
> traffic between virtual devices sharing one lower device.
> 
> Patch 1 fixes ipvlan local unicast, broadcast and multicast RX
> accounting. Patch 2 fixes macvlan bridge-mode local broadcast and
> multicast RX accounting. The lower-device receive paths retain
> their existing Ethernet-header adjustment.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] ipvlan: fix RX byte accounting for local traffic
    https://git.kernel.org/netdev/net-next/c/d7c994e96af3
  - [net-next,v2,2/2] macvlan: fix RX byte accounting for local broadcast and multicast
    https://git.kernel.org/netdev/net-next/c/65addda143d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



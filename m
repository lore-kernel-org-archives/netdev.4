Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965407;
	b=khdiGzsqDiOLbNB940gwviXX+aNcja7kz2I5sOXM/yKUVRXzFQOJusbSruAlk6AF3WTs
	 pOv1aC2FA/tj5YbvBwmAowAq8tECNgoWbqYJwactF3msh7/YeOZ7Lj3SbPZv/Rg/BUjOX
	 tn5HVN4nkZoJNE5c/0zTqI/mg3MGcRp1wptvFm2xk6xaKCxxjjgAHXacx/tyFBLVXLfIl
	 GNIrhtXdsltOeO7nWYp2J4vyTRs9L1h1M8aSCWiz1GfvUo55bCE1F20gjdD546cQkAtfy
	 pv9/XqNtQr67GO9IJHrjeuuOXyaLT/nXZUsuNfAWDJ+OsMVgadhEfVOsIPh1LAqVgIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965407;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=oVIXCjT2i+8v4dmw99tiiF8r7jsI6OPB3S22458cUTI=;
	b=NzsFfQRVyeDAsZzT2K99zlmCbHMbds+YAC0FfvxPtdeOVn/gPLaKTUK2Ll0pyahtz4Ig
	 892C0uk4hRff1pZMm14l3wz94VrYEpf0WDdZRz2vHPYl4TPVazvKHHGmly3zlL4fgpcvd
	 xY+nm4HZwLkLDKJjYyMpioTs+VtjTnKwrMLOdYtbEu897FqW1A3vaoJlfhI6YTNZ1wNiJ
	 Jscv4cl7nMfWO4X0EhUP+8eXgpxGJllhTOR8GAy926uhNWRtnc2kZ0GHJVPx31RlUTQwv
	 4kBAW7OWwXP+bHA+hG1hebjeCi6Ceccuilaox22NpIKY/k3ShIrUxW3mKX9NvzLaQcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flWnZoPh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441FA606A32A;
	Wed, 18 Nov 2026 01:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flWnZoPh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427A41F000C4;
	Wed, 18 Nov 2026 01:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794965406;
	bh=oVIXCjT2i+8v4dmw99tiiF8r7jsI6OPB3S22458cUTI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=flWnZoPhMGLFGq7iLDCC05rOsIwL4jH4gaiaW3Z1y477p8WpLe+DSAtGkvBLp38J8
	 nfntYr1kAsNTw+zEpIaTYfnIpH1NRyzcakuvjNhKL6nZzOtbGnLvetvMDBpdJmNUX0
	 nxFHAa4RR1XFesKIMjhZvYwjpmylcG4u+xWtzcLYSN8VVSZvWv3+2ZUijD4fsiBBMd
	 IMacbyYVvSqqZF6QqaOI16pm6JppWAqz+nrtKDKJ0iQuO2zH7Mpj/UNbtb43tnM0nl
	 hmcD5tN3fCqufTUOLYHV7kkYwjzpTCUsO3+BvY8wKznPJUPjBSvgrXSEZFh1GYoiNI
	 Ro03lTw7ZaQjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3A5392E98A;
	Wed, 18 Nov 2026 01:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net] bnx2x: Fix potential IRO array leak on removal
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496540503.1393228.9574068348383642294.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:30:05 +0000
References: <20261112-88a3a7ff32-net-bnx2x@mail.sdu.edu.cn>
In-Reply-To: <20261112-88a3a7ff32-net-bnx2x@mail.sdu.edu.cn>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: skalluru@marvell.com, manishc@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 21:59:10 +0800 you wrote:
> Firmware initialization allocates a separate IRO array, but
> bnx2x_release_firmware() only frees the other parsed tables. Removing
> the device loses the array pointer with the netdev.
> 
> Free the IRO array with the remaining firmware tables.
> 
> This issue was found by our static analysis tool under development.
> 
> [...]

Here is the summary with links:
  - [net] bnx2x: Fix potential IRO array leak on removal
    https://git.kernel.org/netdev/net-next/c/155ee7139278

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



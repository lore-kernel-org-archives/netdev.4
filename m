Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047006;
	b=ekJqryn0cOfKjJ5lj43VBVeHOMfiCRfzucf8/Bf9MyxJj68IqWL1HBI34hAR2nOd2omD
	 ZG6Wz7+bx7vhcxxnEx6fUuIOUKiFOqnylYhW+TiilO7AI6QzXp/yu/yPfvdYr+zHngX/C
	 ZX+INmara1qiphHo5rOLnglV2i1sl1b0uIxM6Y0jKitgpfeoAR/D/pq11laDchDFLTyKt
	 gB16mBFowf9dGWwGX2bhUU1w17LZUrlqxxR0TgNc77/Um/jii2E8mNZ0yJ5UHF6SHDsVP
	 utwO9NHxl5O5UqsxZTTaFCOP0c9FemyTe0//IwRP7JdL65/Zgw4YDz1/q3w2OxKuZqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=3zqfOVb1L8J8UWMRAbLSQuaScgqx98kUOPdW2k8ykvY=;
	b=4alTMKH2ZRT7DPCdJSkwUX9OBYnknUmIioIldXm8ge9UYSSqocTeGt17n5bXUtORYbrb
	 EEhhvzBEyyRDz4yCRBpPtPjDVZ40VXxj1wDkX1yXTXcFKw8zsz42golupRP16sYHzINew
	 tgN8A5Na+lqPwBRMYNnc5oiCqDqsonhkMZ6hsszQZCZ2M5ieE+pv1TCAqJlSMxMkJ9Ozi
	 qgL9vKpIs02BkfK8V7x+Vy4ZEKrsy/dJgS4dmP64LOSKBa0wTaH7OD0+wrD/SJKY5lXjo
	 NWHlstH+Gewd5yVXqqJT5N7zZj9tr9vp2t+06EiyZtD0qL3rfK5toOTsDJ746kwKHrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjJxXbOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18BE60A261F;
	Thu, 19 Nov 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AjJxXbOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFD91F000C5;
	Thu, 19 Nov 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047006;
	bh=3zqfOVb1L8J8UWMRAbLSQuaScgqx98kUOPdW2k8ykvY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AjJxXbOpBvx8yGxtFK18oSjI1UlVApu8sJgBcZ+28jA+KoHpX+YU9+xNRxeozF33B
	 fvmUpEdN/8CTZ1jfoDARW+1UKYO1vJfEJAFyX9vBs9J8YYRZewn3GmSzBevB7mL95w
	 rChbsBQtlH3D1sgvEI6/+DGMVW+tiCMTCx2Ugr8FCxRRiEzw8krrqDTzkZYLglpFau
	 X9M3YWqZaRPIl+5TcySKCFOEKDpzNEWWKS3xoSEWSQmC1oDSSP5lMKHdc6YBZSo8dy
	 0UPFN7hqemhxLt2MEAIeCMtRPByzrvKCupocU31VIWHSFFuyS6cK7KiPzhNhABD6Qt
	 4gWBSAdkuFXVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773DA3808210;
	Thu, 19 Nov 2026 00:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net] net: via-rhine: Stop the NIC on platform device
 shutdown
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504700528.2637749.17488188558430878185.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:10:05 +0000
References: <20261113-vt8500-rhine-shutdown-v1-1-9448ea9548ec@gmail.com>
In-Reply-To: <20261113-vt8500-rhine-shutdown-v1-1-9448ea9548ec@gmail.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: kevinbrace@bracecomputerlab.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 17:01:05 +0400 you wrote:
> Close a running interface on platform device shutdown, so that the chip
> stops its receive DMA before kexec hands its memory to the next kernel.
> Do it in the driver, as the platform (OF) variant lacks a .shutdown
> callback and nothing else stops it, unlike for PCI, where the core
> clears bus mastering ahead of kexec.
> 
> Keep incoming frames from landing in receive buffers the old kernel had
> allocated: on a WonderMedia WM8950 board, broadcast traffic alone
> corrupts the next kernel at random points as it decompresses and boots,
> hanging about a third of kexec attempts early on, e.g. with
> "unrecognized/unsupported processor variant".
> 
> [...]

Here is the summary with links:
  - [net] net: via-rhine: Stop the NIC on platform device shutdown
    https://git.kernel.org/netdev/net/c/3d10dc3ae1f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



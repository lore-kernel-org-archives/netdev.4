Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295406;
	b=t6cdz+vPyzDBHT8D71bZu8nKC3PodpSxHTq3Wciq0zIr9GXDcmA3jRA/bsO8u5+7+P3J
	 O9dSL2HGw20aZK0ZEjnmakTCp4CpafS8H0npS71vngNEuw9Uh4QnF6XhK83y20twAvD9c
	 Hj4iT+LM9Z7yUmVaop0Ze+dxUoG8yBtyXUaf+W/C3yPi7g8L6Lksx92sb8uTeWRTvTIN9
	 eFNfdC2OAaGbS7dMSqJlhRXVW56vl7JLOf4wNemuInkwETchePBjGx3nPKsx4TuWNuefg
	 A/6lea9KYyzVt3YCMA2rjys1KgyuUSsSQHVSPqReLCutsWa0iB1skYJv6oZq6NJ7hlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=pfr8GT494AuNnsOrr7hIjt+NMCLaWo0vXBfbnkx/mtc=;
	b=1McACarorMwykJtCBSuPH5UZmys4HVK47SB1I0MgNuxhOdJE+cglI7CG6GcZc+0tuirR
	 8hBp+GnkDGwb6nD7wARmwBnGPG2puE/JsiKyYXZ22Uwt9FIqWqzoC9zOdHXYDupRTShD5
	 Ya85SUIYlK/l//tp8nk2mkoTi36xEWFsOpDE1MTD+Obc2fx/wi0iHpucoBs6/gtCzwDU3
	 J3SPS56IgnL6Ij94K4FEhKU+t3MSrIQ4cZ0AzNLW7GBAADXGVkdciomsSb4tJsaw4LbNw
	 0AIjbwTvQdjrEJ62zrfFj+8gYw5CKrXDNesb2hpxO7Noe99dJqQFAd7KXCeurbkNl6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORptBL9J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68843606A320;
	Sat, 21 Nov 2026 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORptBL9J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AE01F000C0;
	Sat, 21 Nov 2026 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795295406;
	bh=pfr8GT494AuNnsOrr7hIjt+NMCLaWo0vXBfbnkx/mtc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ORptBL9JKPPjTLUVPbOdVpOdR0aXTk5eoKBDFAW0h1ugNxkZfuZsVw5lPfp+6zBMe
	 xfEPbKzqN0y6shY96pQkaK1mQrTICfyv2TDv06raCqaphjovXIO5cm8q/fQERtT94C
	 V7jSvecgKQS5Z3k9bM+dBz7xX8gm1CjDwK432DxLnxfhq4EIAOUcok1hwZcjCR4jI6
	 nWxyXefS224dHm4YCGBR33xS+GLYmhZuiuLVZ/XBQg86Pd4F72fDZ2XbVRxy3Tk/Yi
	 Lk99SRs38w+2WaKtNZdZ2gMILpKV/opNIdaMH75ue1nIiBKDdG58Ku0k3qebjCkBgh
	 6/5AFRCfctBJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A425391B072;
	Sat, 21 Nov 2026 21:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net] net: lib8390: avoid truncating the expected receive
 page
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179529540503.1173579.951432100954985281.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 21:10:05 +0000
References: <20261118022217.84500-1-me@timdoug.com>
In-Reply-To: <20261118022217.84500-1-me@timdoug.com>
To: Tim Douglas <me@timdoug.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 21:22:17 -0500 you wrote:
> For a receive ring ending at page 0xff, the expected next page can
> exceed 0xff before the ring size is subtracted. The value is
> truncated when stored in an unsigned char, so a valid frame that
> wraps around the ring can be rejected and queued frames dropped.
> Store the intermediate value in an int.
> 
> This was observed with the 64 KiB receive ring enabled on a
> Farallon EtherMac LC-TP. With the fix, three 16 MiB downloads on a
> Performa 6200CD using a kernel with local platform support completed
> without receive errors. The pcnet_cs driver also uses a receive ring
> ending at page 0xff for Socket EA cards with the large buffer enabled.
> 
> [...]

Here is the summary with links:
  - [net] net: lib8390: avoid truncating the expected receive page
    https://git.kernel.org/netdev/net-next/c/720a6f58c0ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



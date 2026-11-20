Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140613;
	b=FtCWrF0MFc0MFYkJKcXgS+THySunB2q86mTYG+WnoKoRk0ikupcpIketxscDV5GbuovO
	 RBEc/7rdnAeLU+djZV5a47AhnITaokROS3GwYVHL8LUpIhcI+pK2dVe/huhJth+rZZTfv
	 LGr1J72ZcfbSAkPT/IruDxbKr+u4OLPtTvMoFXbmDMhuMGOq6SW2KgrWMttt0qVBAKRj7
	 v07pXTfL07Tozw+r4CwklaYEAJdwIlK1Jx9q2Iq0v1FX6QO3w6VrO6VsDicvwfIZfA1Mp
	 yHRFJiKveHBSudoLdYlCMovlrcs6KNwEtt7y0BGjm+j/9CgoDB2BZHqQ1i+14bZHysA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140613;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=+qtJFN7QZfkUAvN4tcrM+mBSIcyecVu9QDWttC0tv7w=;
	b=0OtYb0zlx5eQL4FOYcsZ0I82G308EIwSmZpB6iuv8tfed3PzyxVJwuu8kU/fN2H3LNLK
	 RbamVjMfGgM6oOrFVuNH+8vWu4Th6yC1hHbEHnDX2ApsP2NbNcjjnxxZnQgqxIyUvWmrG
	 yRz9x1bY0MEErVNnR26PMvUzDn6l5azgQH93lX/r8HV3fRr7fsYySKWr4brp6h8xpi4GP
	 Lq9I3aQbGyKUGwDHOJ6b+ac4CBm6wbLRNdPda1ezc2K6BobJlEIcYILVhEnFru64GVmNE
	 rU/1/shyjMACQDVLpv5f5P+eK4YSg807U3+2WIWJNWyZzBf1IzMysfjUa+EQ6SQ5vFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvtP7O7j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149E606A334;
	Fri, 20 Nov 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hvtP7O7j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4276D1F000D1;
	Fri, 20 Nov 2026 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795140613;
	bh=+qtJFN7QZfkUAvN4tcrM+mBSIcyecVu9QDWttC0tv7w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hvtP7O7jK1zryM/ExBbjIJX7Lv273rghFzUz1iHciwHCPbG6Rk58KkZvnvB397/OW
	 gFQYqEE90GfSsTaK/4PraNIhEkUC9iIdcaCmN/sq5U6/rUE7poy3zVl7Fl5G0gica6
	 +XvEksMCff0BK1eiBS0tlwHLEfWwd9/us7HmfoGHBbBLRcqq6n0Bz3f6pLSwgu1P/k
	 Bl90g5KB1VX/tlxVxLJqdiFCJxwKw5/mnMVlgRFo6h9VQKRPDmMZ/B0BjNf1r/FZqS
	 0CSI8Qk2wZFNDB3gp76s7RVrT+LcrJk2Xv/B0T3ot6REPy86j+7tCj+Q7F5XY4mz11
	 wQ9Z+0yGX0zXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2EE3808209;
	Fri, 20 Nov 2026 02:10:13 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4] net: phy: aquantia: Poll global status
 register for provision ID
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514061177.3979015.6848094959866976600.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:10:11 +0000
References: 
 <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
In-Reply-To: 
 <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
To: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 sagar.cheluvegowda@oss.qualcomm.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 19:14:50 +0800 you wrote:
> According to the AQR113 PHY databook, after firmware reset, a 20ms
> timer needs to be engaged to allow the supplies to settle prior to
> allowing the PHY to boot. The working flow is:
>   -After the 20 ms timer has completed, hardware state machines
>    designed to guarantee PLL and band-gap stability engage.
>   -After the PLLs and band-gap are locked and functioning properly,
>    the processor and digital circuitry are released from reset.
>   -The PHY image is then loaded through MDIO boot-load and the
>    processor boots.
>   -After the processor boots, any provisioned register values are
>    set, and the PHY enters the provisioned operating state.
> 
> [...]

Here is the summary with links:
  - [net-next,v4] net: phy: aquantia: Poll global status register for provision ID
    https://git.kernel.org/netdev/net-next/c/d3f362a76211

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



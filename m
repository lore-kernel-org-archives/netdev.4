Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964807;
	b=5niK+s8Ohm2XXl+IynQWpA3har7v+SYEbjPANqMFoF/8wnbnxjVwhrtHRebbfpZjaICu
	 rrUWbH/epRFEO9qdNc91O8i+aFA2qIb3wLUoT2uQaBCE3etCSa9U79M1dCR3r9NhSCQ9R
	 8v19x1yUrqybYPm86kza3s9/GZa69wk/H/lWiwN6jSuiT5kXSd3GKcVVd6q87kLrgAFD0
	 BbHvyYjwjsVlNGPzNhIt6qu2h+mmsOGsT6gSXohENm3VKgSblhgtkQEwB+BeIfzMsTXZI
	 /9vdjk0LidlaXsz9mu5TemfBk0GjhfTzIIcTTxkDqfSDgt54/HwdmWJaQf4YBOYHJiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=stKX8v7egk0zZugg0clBzB0g2nXPfMAc1nM463RQGB4=;
	b=4Ev66E9bjzsa92VDqbPwDXvr6xuAHRCuoYHfFXauZgalZhsxlwI41UOgJz9TQV/ym+T7
	 scrSZsOyzn18ehwPsQ9EbrCPvTiqwlcFPXnQshrZCNrSiCdxBCGNMQAGwOUd+czWiBe6T
	 57sCcRBKIc42dYBGQ8Ow3+8Xjvrjh6O/ql1pc+6bj+9uc+xO6Xtb27xj/xHnJirND3EV4
	 2Zy1bdMyyjRuA58ES1QHmB+5qZTyazdr/Jm3kHJEVd5C2v56VdVZWYjkntkPfWypt8NIJ
	 Qw6/U6JO4tMIeVsNKr4qTQRZnsHdZ7eyKgjtyM+2GWWXtHWOm+BNyAiWO+1/pryAssg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QahyQvvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB5606A31C;
	Wed, 18 Nov 2026 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QahyQvvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED301F000C5;
	Wed, 18 Nov 2026 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964806;
	bh=stKX8v7egk0zZugg0clBzB0g2nXPfMAc1nM463RQGB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QahyQvvrlN7RALoJe9aq16eLMxP9iicXG3Yl12vxxJtUx8KNmd/M6fGueR+YS263A
	 RnQY7q6VA79+3ydrTZkZpdzHFzTpx+iYuuXkhDhP7UcBroDKRnUBTDRXUp5pFE5ZgA
	 SKcpkc3DBjnfMdRvFey4vIID2piRaJLo0v0ClkvIM+hXXiRpx5/17b58gc5Icmed+K
	 7TsALGVCM1vVWahyg5nqssu3SDdehcG/9gjjZcNvyX5ZajyH/dZIaF36lyFNyi2ngW
	 xhDub4R/48lRthEajHIsuFpYe62xpfZBufHsv46L2GfEMjcNN3eNnia0RIsXaSmJkx
	 9T3D7h2xjPA8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43A1392B1FE;
	Wed, 18 Nov 2026 01:20:06 +0000 (UTC)
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
Subject: Re: [PATCH net v3] net: stmmac: Clear DMA errors for multi-channel
 interrupts
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496480553.1388923.380362008993952961.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:20:05 +0000
References: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20261113103236.2184751-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 magnusleatti@kernelriot.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 11:32:35 +0100 you wrote:
> The Multi-MSI interrupt handler doesn't clear the DMA error interrupts,
> and this leads to interrupt storms when one of these interrupts starts
> firing :
> 
>  - The RBU (rx buff unav) which triggers under high traffic load
> 
>    This triggers easily with iperf3 and small udp packets, and shows
>    when running the netpoll kselftest
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: Clear DMA errors for multi-channel interrupts
    https://git.kernel.org/netdev/net/c/686b5f47f8cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



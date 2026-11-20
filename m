Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134611;
	b=T4ZB2QPwMD5uwD7DMa3bbxRYa3LT9jHLgrt9QOTaYM7wOb+rk0mg2zFAHpfRVX8WVQ3w
	 joFmuYtHBxs+VJsmQ6ZHAqrfmIsEHuT3q0cYhgS9q/Q8HzlV3GI6BXxmxlQnH/cw09cvP
	 dD5xiiF7Nc4IGB4facTSqTV5C2jo7Wm61rqFXkpGbugkOf0R/sqxciMTlyAZE+XeSzu7S
	 L7vXysUsGlp0dEt5Ebda7YZAYd7dz0dDn6g/fuKQGGH1xqiGYkWmx+Ag5f9ZKUVeaADUe
	 xMB48sf8Arx0k3rw5+qrU8AWjBc6bNV/oGjt9nGa8ZSZGf69MGrRL/QO6Lo6lh6O3GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134611;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=9xP4xwcK5kOcRn7SAoxwRpEUwmKNR21ZDqqlTDsiBdY=;
	b=eWRFbLP7B1LQ5Kop07TFr37ffsTzm4iQ0P1/JRlwxs3HVOPq9y9TtFaSmooIiTUqkMRn
	 ONVjnwW0kZ1LVfr4EZQDnr1D1xujZ9/qTUWRVAgPG6Txq3IUzZJy4M61pEc1P2uYIIn4W
	 jPQLNQNFHM0w3xMUWoLUQlRisIFtE/IXD/oXZCB6yV+b3L2VyL2QkaCiPmkhi9Xm3x/5q
	 xQO/L4Axwl4K1MO1E9b84SoXZioniz7RhQE1zQ0wov7UodgNGuei+ScAGHI3i4D3ef/5R
	 VMSpP1UqvDJ2/aIt6hKRccHiYKdV6oKzI0A91FmFGENhBn5X4DuT4ldBCBRhnm7GLsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g/elI8+n";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA26606A334;
	Fri, 20 Nov 2026 00:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g/elI8+n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813CB1F000D1;
	Fri, 20 Nov 2026 00:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134611;
	bh=9xP4xwcK5kOcRn7SAoxwRpEUwmKNR21ZDqqlTDsiBdY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=g/elI8+nKNyMWS+xkiZqihaJAir7sWz+scHfjVq6NDxoVjUSeA6WPR+bwq4efDHsb
	 fF6H7ArIuLQQDfZPeih8lIEPVF9y5+ZOs7pPyUPC6rH+6OMo/Ghlik7jih2FG4GUXH
	 8JZTTmQejrM7D+A/l6RFnSarM55LC9IgtnyzPGHVuY+8V7Qyf+0fLXVxsHbgfSmatY
	 4V6bQEH/pMyx921mVa8OGFUSjQpJia63f+QAQ3qIcdaqrmK2tDkX1ysDXWDcwXYS5l
	 cr/tzvtw6HDRKDB9a3NWOvno1n4TjWiVR+ohgwKRs1YTkDwSNypSsLyX2ZupAz17dD
	 ciwHOus8aVdYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7740D3808209;
	Fri, 20 Nov 2026 00:30:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable
 into
 enable/disable
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513461002.3945374.16377819686637031916.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 00:30:10 +0000
References: <20261117182502.3045841-2-coiaprant@gmail.com>
In-Reply-To: <20261117182502.3045841-2-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 02:25:03 +0800 you wrote:
> As the great Linus Torvalds once said in
> Documentation/process/coding-style.rst:
> 
>   "If you need more than 3 levels of indentation, you're screwed anyway,
>    and should fix your program."
> 
> The gmac_clk_enable() function previously used a 'bool enable' parameter
> to handle both clock enabling and disabling. This resulted in deeply
> nested if/else blocks, which made the error handling and rollback paths
> cumbersome and prone to bugs.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-rk: split gmac_clk_enable into enable/disable
    https://git.kernel.org/netdev/net-next/c/bb7cdcfc80a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



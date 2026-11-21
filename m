Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219207;
	b=uimEn7yI9tRtrusF3nph6Tl3WXtOn23OOYaDVMAcWl+64GXeA24CPP27IiP1x79k7Is8
	 KpuadlKK04bedswi7SvkdRXrGD/zw6WYFm7JQTvG8iT6xJsPQg/5SxyVIcsqFH899EXLN
	 0m6BV4hIRU3jOOKl9VSXttC/xvWM2FDWG4RVE63zDhpVFUM7nY/R7/ongJZa2uje3d8O1
	 KwpUSP/ZgMLt8G/fJh6INcZIZvdhFhfat76BgkVcWs6KZH43Hiam6w0RcD0G0lwMjVmE9
	 1mpy732y88qZrN7OxaMFHp5VBz1Jlu8NFgdLELkOizXOsTAgxhznCiujbajIOg74lVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=zIJCcnRs42Ibend6LFR4X1s5kjiXV/FF6JdjlWGdK18=;
	b=XtWv63Dg5SxBD3cnXDIQt14nSHN5rVnE9KbK8AbKm1RXfVXC8viDU01VkNIYRNS0wPCy
	 XcJ8u/MGNO8i+xdyMe2BG4V/H3rjlLT4Nz9bSEBsLwsvxkTimfrEHSNcm5xfsb9fItequ
	 dxfELvf0VlAN552Q4KW+ryZlrK1d+U3wcDFNVpGaWkYJrotqAB5K/UOUYUKSEHzvYEBpO
	 8A+FypZkWikmYkyRsAgOkwD8XxU7blsoF+foSsDPf4ppgmaRkcQY/Pn4BL1puZMiZoPWq
	 c9lzEiHfk/WYNzL5XAbDr7zG8EMs05DPb/AFSaa9+pGcXdjt/YogbBV5G/TZVUTNS+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2404+EH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9E606A6A1;
	Sat, 21 Nov 2026 00:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2404+EH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F511F000C0;
	Sat, 21 Nov 2026 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795219207;
	bh=zIJCcnRs42Ibend6LFR4X1s5kjiXV/FF6JdjlWGdK18=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X2404+EHmp7h2rjrQIXPGaSP6ZtPRRPA3cGzPH5H3MYPKf63xJYkd8wPpNUI8QXUG
	 6mLJKWb1SdOb98bW/iOTvFD5FcO9g5k9ELWRSMB/4VTwr/7S65nHc7pMTkMpPIq0XR
	 O1xw6SkiJFs/A0lzmYBcCWnb3nxvh0DJusgg5fTPWAtXVCqu0OriWXacpwh/S1CDG/
	 9hxcPol4S79Vd6U8ldDn2efHVVcXF7sc7CQUwNCqYgoxn7a40UlNoPFq1wwd5O5XfA
	 yCdR10LOyPbkV8nfXG0KtG0d81VKR1Ha2QE2YOL3sPP+6uTvMbah+f0dWdfNeQOlB+
	 7b7CdtfJLBhVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1554380AA4D;
	Sat, 21 Nov 2026 00:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179521920552.845527.13696974973741520819.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:00:05 +0000
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
In-Reply-To: <20261116204313.23023-1-narcisav.kernel@gmail.com>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 12:43:13 -0800 you wrote:
> Expose counters for HW GSO skbs and the wire packets they produce through
> netdev queue statistics. Update the counters when TX completions are
> processed.
> 
> The tso.py selftests are skipped for drivers that don't report
> these counters, so this also lets them run on bnxt.
> 
> [...]

Here is the summary with links:
  - [net-next] eth: bnxt: report TX HW GSO queue stats
    https://git.kernel.org/netdev/net-next/c/04c6b6c90e32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



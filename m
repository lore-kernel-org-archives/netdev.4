Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966009;
	b=JvzEx1df/sGYltwXOWo9aq+9aHCA3FKm6D4fKflG791886m6IVXQ5qmPmuykULlUwcrG
	 wF9IpkXYZK9HR8c76+KpWuSRUOtmq4IzQRwq71eyXPmvhUmKukMNcGpnNO3Ra4ST6DWGw
	 y7GKsCa+Vlb98PrCJewvZOI5Yvx+MeUOV5AtzObjh0v/KqIipiDUM9hB29kBELJV95DqV
	 iLS0pzGwoaD0jMUZqGL1dmbm9LS631UILf20oH8h+ruJ2r7AL+B4HEMDxkoSK13wMRw2u
	 jWmeHJphBYMpuJK0CYs7kSH0JZ5hCW1Z6yp4FQ3DZFFiBLRM77am8Qz/uW7kUcdIPZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966009;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=7g7un8cfaI127Z3S+mYBsyl09TWbFX1ZiPI+Mtq3nHk=;
	b=2+IQMiXli68K9jdMwBnN591SqhO4oXCV22JrGDCyD1QIkgxdIqvNvddFeBIndDkex56p
	 uFwc+LDOI4vXTDs8vksCaoFqDI0xuK7hI4sovXTLaEHCQ2jvWbCy6LEprcdq7KjUnMM6N
	 gzES9itnBcG91318qougBl0MHYUAiW7jNn9a+EjNT5tsDJwX/1L3yicfa//8j5EbCHie1
	 pjmqr4kJeK/dzbBK7ibp9axLqlhZoTxJPv0T+7OyyCtkNIEiPfqx94wJz3FG5PFMJg9CZ
	 ncKbtib4KBxpGWrZvuXDKfwhmcXAZGQ2U9y/rVUpbnVp70bq9YbYckIawbP2Fq8n2gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAgOjtZd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCF606A338
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAgOjtZd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE4B1F000C5;
	Wed, 18 Nov 2026 01:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794966008;
	bh=7g7un8cfaI127Z3S+mYBsyl09TWbFX1ZiPI+Mtq3nHk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KAgOjtZdd4QKCgalUK0R3UykVxMOWWpv4RJDlk/QD1wl6JVWGKJbl8fHEDdo5NgU3
	 uYsjukYlfOKJ5/L2JxC/iQA/7XyPz7DjXt0ii480sxR/EfGobNN0yTSzmZtDHDyKmc
	 VT5ln8OaA1fADGRSWCxXdXZvTqLpgPyEL2wKdD63leGrm+F6+uS90ZOU27rrgnQ6QY
	 bfIt0Vm0juvqCR0hCRamkkn857AgwqdPPKLiSOkl8Kr4v6L534M+cDpHq1shpI83FK
	 XrMzLgO7+Ns2M3VoVmSqtWN6HRjiwFnh4K7E+TzbsZu90huhozAFfrYWpVpWX/B4ze
	 VLkDG+qq0xF+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4345392B1FE;
	Wed, 18 Nov 2026 01:40:08 +0000 (UTC)
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
Subject: Re: [PATCH net v2 RESEND] net: ena: avoid double-counting TX DMA
 mappings
 on failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496600727.1396957.5369288833503943166.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:40:07 +0000
References: <20261115114233.2307630-2-thnkslprpt@gmail.com>
In-Reply-To: <20261115114233.2307630-2-thnkslprpt@gmail.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: netdev@vger.kernel.org, akiyano@amazon.com, darinzon@amazon.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, evostrov@amazon.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 13:42:34 +0200 you wrote:
> ena_tx_map_skb() increments tx_info->num_of_bufs after each successful
> DMA mapping. If a later fragment mapping fails, the error path adds the
> fragment index to this count before calling ena_unmap_tx_buff(). This
> can cause DMA unmapping of buffers that were never mapped and
> out-of-bounds access to the buffer array.
> 
> Remove the extra increment so that cleanup uses only the number of
> successfully mapped buffers.
> 
> [...]

Here is the summary with links:
  - [net,v2,RESEND] net: ena: avoid double-counting TX DMA mappings on failure
    https://git.kernel.org/netdev/net/c/6e9764591bcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



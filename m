Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084806;
	b=FB4XfqawK2QkJsq48CX4hOy8xHbobrql1ogKRPJgC5RhT9x+RNgn8RaG2hpPzH4MDR9D
	 Cnwn39kjxc7UIK8hgaHzIqJdHWgyieJpEw+M8HZEyAmsvFL8oWRsYQHUEqKee5pd0uh8d
	 enU/gH4W2aOqUAAGKWrE9zTcZvzARUsuZ7kE9lPFuqwJDEYGuKJWefthUfZ/74LcxhKUZ
	 diCGcg5urNAmHy7C78XWJdT5vGfuFxNjHCEM0osl2AGw7lWclbBWtQgL83txFJovBKpu6
	 ZLU0QuJff3g5vwlfQ6ONhgBFwfPDWNNz6pZrid6x4ktTr1GT4rkP+PxOiOWWWgQSyCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084806;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=qClnFdnIXSv8ggcYjhcg5SqRGLbJLXAeg3zpZ6bzI98=;
	b=b7I6zgs9wjX69OsGOTl5OBbPhKz8goAnG/XbDGWCt9dX4UMvouBDA239iO1HG/SISiHZ
	 xEwNIxOtb1zE3oe0sQbHWuoc3vA0XqcoWY956MX4VqLzv9ZXnqstO3uBYcIn5GHRYoGDa
	 eumPzglKHxS/pRdQHPSEtxdOjVxjuxcDTYMu+xhmvgbUULvRo1br69qfnniBsMb3f5JV3
	 xOkD4Thd7eXEWxIIHk6kvA0TXPsWchrCe6DcFLAmNkEgjPk/5GpJoh9hk2+730oAoqLcE
	 B9lei/3oydOSQP8Jwb856eCw6ANKOsaZVWxNCHQALafwTpmIr/ZPLwLEv0NrkZtubsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpD3yaXi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEC606A330;
	Thu, 19 Nov 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpD3yaXi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5881F000C5;
	Thu, 19 Nov 2026 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084805;
	bh=qClnFdnIXSv8ggcYjhcg5SqRGLbJLXAeg3zpZ6bzI98=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YpD3yaXiafw2NODmK/mVXqJN/2d1r6ih99n8fboKSENc6ougLlZj51EfA0H/mzTkf
	 EhxAqzQ/E3QLIMnwC/XtVLMjRPRYvz1IHGQS4UEiN0J+4clxYWY1VMgfgm6H7auyhl
	 XsHI/G96EkhIzHNp2EfXWcdMV2bAM8tuatdJlI7a8WObn5Xbb9TrJrUeSbp1mYG1hi
	 8zJCH6/bbAispAP7f5USYSQ9w00Ptf24/kRg71TgStnxsdW98wKv9D0sk4kCP8qcM6
	 SgbECPuOFFbWDO/IKXiIc/jUIX70iaI6/AdARuSOT1ZxnSJCEA5yYLb7+mUSgTvXMn
	 T871tIu2f0DRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B451C3808210;
	Thu, 19 Nov 2026 10:40:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: lan966x: free the RX pages when the TX
 allocation fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508480455.3007189.2973939300732086595.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 10:40:04 +0000
References: 
 <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
In-Reply-To: 
 <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 17 Nov 2026 13:49:50 +0100 you wrote:
> lan966x_fdma_init() allocates the RX ring and fills its DCBs with pages
> from the RX page pool, then allocates the TX ring. If the TX allocation
> fails, the error path frees the RX ring and destroys the page pool, but
> does not return the pages to the pool first.
> 
> The pool then never finishes its shutdown, and page_pool_release_retry()
> keeps warning about the pages still in flight.
> 
> [...]

Here is the summary with links:
  - [net-next] net: lan966x: free the RX pages when the TX allocation fails
    https://git.kernel.org/netdev/net-next/c/ac9dfaeb9cd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



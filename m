Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132211;
	b=Y4ebgsC/RkbIo05ESfhOTzbARU8KZMUl3Zudq/Hdr0u6bT5otUSF0JXhc6jmpjn7pTjX
	 1ZZvqgcb3stQYQ0/1xJ2Y80/DkXyIY32tTJpSNjvIxOT0B1YfSyTdhR/4R8xscs9glwFi
	 pdjMw81cBtDVJsV44jVqN/GlJVo8ewAP/GErOc/qqrdVuL+pzBCAdHFLmK69nNwyosQaT
	 2sTUYa+9+StFurO5IqHv9sPuJzvBrxvTkf38ecDYQ8WRJeXHf8H5paLBnsXam5WsajAcT
	 a0NxlNG4Bf+jYV1OdjbOdJZ6O0JlU0EEk/mXwrxW7ZN0n9S03ZhIeTNguXTUqusP0Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132211;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vrnoAeWkZq1Y2mgk+CBWZedbSiUfIe+IJTUknMWvsV0=;
	b=1m7nli/3WE1jFzlCrzCYlz6/+XFmSlYVWOpEkYb36WtvZqJf5ZbexO9Flgs2+caH4XDe
	 wngDk5+3TLLgKZgkwjvLcyN9LqtsDr7FIv7XKgjBNBO4Wn0gW+nnv2jJLEA3G3AmPEzh8
	 2MUuk6kHkJWh/zXzBinUng090h4RSOsNOYOFfabQR6xPHn62tFwAqMf4Obi5B59aqwZ44
	 DRYcJGiQlAQpA87jwxz8nVKGxgbMWWeGrLemm+TMPhLpsMDqGq8VnKyMrO43mcPB0Wy0R
	 XLtd4BOb4741JLn1XYD+XTi0aOCzSFuE748/OwCdoe6lvNWTZL53HwCfqHxPvONVx0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yhs1JW7o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5DA606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yhs1JW7o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE79C1F000C4;
	Thu, 19 Nov 2026 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132210;
	bh=vrnoAeWkZq1Y2mgk+CBWZedbSiUfIe+IJTUknMWvsV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Yhs1JW7omTtNtS+M+Xgwn/fn07rSdYpk3uebfRbmRdrE4iy0V5k/tDZBNQDVk+Lw9
	 Bz9ECBaeIfWSnHgb6g6lex7Hfx4KFT8eFAQZvAXm8r6QLJ9PU4EUmgM0yFS9gvnHTS
	 C6/GvNMQXuxsQcMCsf/i50ys9qD8boheuVUAUpw7W5st7WhSzuMFlrrcFjoHDoqeiT
	 6tEL9OS5Vy+fs6/TNuDV6VQW7DKQOFZ7DY0/Q+mmgAZxvBUbn3j03SkEz6AwpmOxH1
	 WvaBnrnXAHEOzfLrNGXHMRJ3XEUAAf99NUQx+io4JrNkxBP4RkTtj3g90iItfdcxaA
	 r0kwjZQdCDYnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44163808209;
	Thu, 19 Nov 2026 23:50:10 +0000 (UTC)
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
Subject: Re: [net PATCH 0/6] fbnic: Follow-up fixes for the Tx idle check,
 HW stats and FW mailbox allocations    
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513220927.3927581.15064062874489023327.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 23:50:09 +0000
References: 
 <179460241885.8819.7179935130629202331.stgit@ahduyck-xeon-server.home.arpa>
In-Reply-To: 
 <179460241885.8819.7179935130629202331.stgit@ahduyck-xeon-server.home.arpa>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org,
 pabeni@redhat.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 12:41:19 -0800 you wrote:
> Follow-up fixes for fbnic on top of the series that was just applied
> to net, plus two fixes for FW mailbox allocations under memory pressure.
> 
> Patch 1 makes the Tx idle check wait for in-flight PTP timestamps. The
> QM idle registers do not cover the TMI completion path, so they can
> report idle while a timestamp completion is still outstanding.
> 
> [...]

Here is the summary with links:
  - [net,1/6] fbnic: Wait for in-flight PTP timestamps before treating Tx as idle
    (no matching commit)
  - [net,2/6] fbnic: Do not accumulate HW stats from failed register reads
    https://git.kernel.org/netdev/net-next/c/2d3c52a43b9d
  - [net,3/6] fbnic: Cover all of the HW stats with the stats lock
    (no matching commit)
  - [net,4/6] fbnic: Initialize and reset the HW stats before they can be read
    (no matching commit)
  - [net,5/6] fbnic: Stamp heartbeat and ownership requests after allocating them
    https://git.kernel.org/netdev/net-next/c/73694a4a031b
  - [net,6/6] fbnic: Allocate FW completions with kvzalloc
    https://git.kernel.org/netdev/net-next/c/3abdc3aa3390

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



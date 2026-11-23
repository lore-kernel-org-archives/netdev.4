Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405785;
	b=ZJHxSXxXvcWrT8ofSmceL8WxK4LyEWBQ+bHPZTaoUHP3V0Tezxx1oncgI0IgN7lnICCw
	 cCUtjsPtVDYEuH67qVEQSWEHj/BVInaCzLAsjQhnaSujJJrajB3QqaUMGQVrxaZf5gkE8
	 31SdOwpwFzeW2Mkpyvy+o73phryyBTjrd2ecdTMGVzUwKKL4Edh1DpiGJt/vAlTQ7zilh
	 DRNb5OFZT0JWq9Bjbk/Ey1NCG0zfdLU0Ww8JwpKVr10tl/S7wVqeUmF85UBdSnuBZRLN7
	 ur3syuJf8Vs1K1h+CMamDhWAyyToVFc1YmwwGeRIfXH5708OHW7sgi9qZcxunjiODUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405785;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=f8iyGXNmQvV5cTF4wbciC3whz9LR368QT9AC0uWH/+U=;
	b=28HeGlafclZuoZgLSRoo97T3dKMpOMNpsiE6L+hOF7rFSGI/U2hGQUM+0jDjPgvJyNub
	 UvN/+uNtE9h1/dn+uI/H4FaFpPbjq5LdkMe/MnQ6U9JTJIz4kykt6VD83KhfR8LWRRjjj
	 CYBgAuYsi3w6kqARek85q5dCo18ZJTiFJVNppxkqD6HX2uPFmdCdcPPSAGh1lQDJ4+MZZ
	 51oUQsnZTX5cmx1tNSjV818ibu4NFgG9JR8/ovUF+Vv7y+WLUdBAYyksWdffxuOH7n4zW
	 jNSp5MUm0E8d5i0Yd1AFEXTPZr/xkZ2voTWB6WIlEJvDX/HEEIy6/2KC6bMmSUNrSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PaPdDxiT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC5606A31A;
	Mon, 23 Nov 2026 03:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PaPdDxiT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F971F000CF;
	Mon, 23 Nov 2026 03:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795405784;
	bh=f8iyGXNmQvV5cTF4wbciC3whz9LR368QT9AC0uWH/+U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PaPdDxiT0ZzWJF7DBMqH3luU5AtZBAAviGm8XkUt3lzOWMwrjtqRn0qsY7WboX0eQ
	 iQq4Wt32cHVBgluXJkcGpBEXZqtLLbyGTgK2jecATH3j9mHHDx7wI31iG2Gnmt52hO
	 5giAxFTkg+jhbJFx7atKXv1e5e+ILcl1P5jlOK11ROhC2Pt9oCjH5mAGgTqIx4P7PV
	 ZvaSjb063KI14Uoi8nAmIqJ3NZd9ClfFOhs2P/ObLiDKjH5IG3a6rybHiQRiRxiAe1
	 H9SaWC8u5Yes/8w1n5XWUbjnOU4XSQGbtD7NM6mMY103TMqqdKLus6+13k7RtXzJnd
	 m1qnrmvOQRbeQ==
Subject: Re: [BUG] netdevsim: nsim_start_peer_tx_queue() indexes the peer's TX
 queues with an RX queue index
From: netdev-bot+sashiko@kernel.org
To: kyuwoncho18@gmail.com
Cc: kuba@kernel.org, leitao@debian.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 03:49:43 +0000
Message-ID: <179540578385.3135.5126417737226790045@kernel.org>
In-Reply-To: <179505710275.3511681.13434978152402269948@gmail.com>
References: <179505710275.3511681.13434978152402269948@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message for 7bdc53e966c0 is the raw multipart MIME
  email.

--

netdevsim: nsim_start_peer_tx_queue() indexes the peer's TX queues with an RX queue index

This commit adds a check to nsim_start_peer_tx_queue() in
drivers/net/netdevsim/netdev.c. The peer's TX queue is now woken only when
rq->napi.index is below peer_dev->real_num_tx_queues.

This fixes a KASAN slab-out-of-bounds read in nsim_poll(). The read happens
when a device is relinked to a peer that has fewer TX queues while its RX
queues still hold traffic from the old peer.

> netdevsim: nsim_start_peer_tx_queue() indexes the peer's TX queues with an RX queue index
>
> --===============8293946977515997899==
> Content-Type: text/plain; charset="us-ascii"
> Content-Transfer-Encoding: 7bit
>
> Hi Jakub,

[Severity: Medium]
It looks like the cover email was applied here instead of the attached
patch. The subject is the title of the bug report. The attached
format-patch has its own subject:

  netdevsim: bound the peer TX queue index in nsim_start_peer_tx_queue()

The changelog body is the raw multipart MIME message. It includes the MIME
boundary lines, the per-part Content-Type, Content-Transfer-Encoding and
Content-Disposition headers, and the full repro.c source. It also includes
the base64-encoded config.gz attachment:

> --===============8293946977515997899==
> Content-Type: application/gzip
> Content-Transfer-Encoding: base64
> Content-Disposition: attachment; filename="config.gz"
> MIME-Version: 1.0
>
[ ... ]

The real changelog and its trailers come at the very end, inside the
embedded attachment, after a nested format-patch header:

> >>From 0a9629d8c7c93ef16dd000ab4cf04e9792044987 Mon Sep 17 00:00:00 2001
> From: Kyuwon Cho <kyuwoncho18@gmail.com>
> Date: Thu, 19 Nov 2026 11:36:52 +0900
> Subject: [PATCH net] netdevsim: bound the peer TX queue index in
>  nsim_start_peer_tx_queue()
[ ... ]
> Fixes: ff2ac4df58ad ("netdevsim: implement peer queue flow control")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Could this be re-applied from
0001-netdevsim-bound-the-peer-TX-queue-index-in-nsim_star.patch? Then the
subject and body would be the patch's own changelog, with the Fixes: and
Signed-off-by: tags kept. The reproducer and kernel config could stay in
the mail thread and be referenced with a Link: tag.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179505710275.3511681.13434978152402269948%40gmail.com

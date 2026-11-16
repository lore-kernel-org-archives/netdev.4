Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870359;
	b=e+0sIUzONwsrRGL+laz987S/Gax4mqQbmXn8vpT4cRt5+OZ7KkTN7mzufpt9UMh74s7t
	 XC/IXZdBKj5w9ckFRdRwxxzDFYNYVToS1EgZFgfB3y5VbXD5qFAcMyESfRRiOogNhniRY
	 X0/ddemjljPkLnDM2/RBVS7iuS9xhaNV06AlhdR9BEg6bjHdwezDdc5ly0HMShllm5+6b
	 ltTSAFALB1537PlKBrjrV2MsGY0cUpcBtYgxotOuwGDJYUIkG+OunA+cy7CD/34CS26LW
	 vBwgaFlJuAUh/BnncS1Z2US1s0sU8UunYzx8qEZrS+UAr/Mt9nza+q2nvS4Aq/8TzZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=g/6+wyu9qz354Ltln9/JyzH/JPOQeQrdOSPG0Vge1TE=;
	b=04Nqm0hFskMpFJvUY5rIruh7fr0G+tuKKBuBl5pRZoDj8oFOAU144YV2P8yvX54PtqvV
	 cLNwvz54yX4KaD2QS2TgiwamkYr0K522ux0IbNzVgtkcsNERR+DFn1kTwGKGBsCQHMaab
	 kAa2PKof42Sx0BrWQZBGMZuUC8h9p17DZSkEe6IVTzCz8rUJcu/kfPv2szzEpeTeqJRrc
	 koXi5zGqvu32j8b3qhX6eW0IOXb9uFRUG+F6oMJxDXLKRl0Di/ismi4376hbjCVdDM54r
	 n2Enc2tjWqvx+if8ppdUVfy7zsF1/N5pVeHskA8qZIFNfhkHYeJRD5JYnJfiKs4u3Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5RdokfW;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9531606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9531606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I5RdokfW
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efa29ad91cso17278565ad.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870358; x=1795475158; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/6+wyu9qz354Ltln9/JyzH/JPOQeQrdOSPG0Vge1TE=;
        b=I5RdokfWjqaFFpoBsaLfI+Wpv9oFZ7wr1e2wUykW3Y7eNb8DEw6vPEO+9xNDn+nQut
         xOzvhCxSlzVg2SbPKPrtnGBwmHNdRycUZoOG2AzEPzZ/tNxfBupg/HPia3eLj1oHzDlN
         tynw8jqtI0RlDaInRUXO8hgpwhz/FH8Np/KfvHn0uU97PJi2m20RfuWdu/tQq1JGhO/0
         241dC3FrWF7JRmFcBj93g+soMUO1MSMnHFReWJQAbc1utVqeCsyNsjQqPhCO4Jsao0JV
         GqJOi8YY/fLnDEsVTXijoqZWN33mLGtniNuomZ0ihWLxCHr/oBvi34UcrplrTa5S4CmP
         lVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870358; x=1795475158;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/6+wyu9qz354Ltln9/JyzH/JPOQeQrdOSPG0Vge1TE=;
        b=V7HUobaZ3/y1rWFqpn1hOiuutivrsYayF5KgP3bwjLIbu76e1qdSQUuJXyFP6L9356
         2JqPUi8fmpBOlxieNFZZiiK6kgBMWdRHr8ZBL/lvC1L/t6fBJwlMPWxx/3o9xDKR4oDC
         WjF3SvLcW4mVJlNHMsK4Hmg3x1Z8GtQbLYBzEg5krdfbaSCRFQwGhY9eatEfJ32tL+OE
         X0L8G+eQVWQSPjOZBpyjmRzfK0KXzm5I+VWnkSlEXWeUgOYWyKgAzZaYtUN5tVB+/3DC
         OIcICXyI76YR7jWgLVrWUMXSeYnyUQb3po455E8S5YzJbZaouT0ppNDrtfCDzp/yHf6u
         Exmg==
X-Forwarded-Encrypted: i=1; AL+hErEiSn2pwByvdNRbd/Y+sUvlK58WbvmAU0Y+6NWp1bnE+LuGRHzwPRuH2AEHu8YYJfw7wmsuL7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sblrBXVzE8e/vmvWQZ0IeZ4SYgMgHyX0fsZFZal8OzvuTqvJV
	PBw4IrDThddosx8NBuxWV8xGzUpr5t8PZs+ws/p924ltnfPfFt9gFSN+oiSlXPju6XVAiRIJwih
	8gpcjMQ==
X-Received: from plbmi14.prod.google.com ([2002:a17:902:fcce:b0:2ef:d548:58a9])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3903:b0:2e9:7ff5:5459
 with SMTP id d9443c01a7336-2ee0de0eaaamr116231095ad.15.1794870357672; Mon, 16
 Nov 2026 15:05:57 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:24 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116230555.2305867-1-kuniyu@google.com>
Subject: [PATCH v2 net-next 0/7] tcp: Prevent tcp_collapse() from bloating queue.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a follow-up for commit 031c403d13e5 ("tcp: do not let
tcp_collapse() drive sk_forward_alloc negative").

The core algorithm in tcp_collapse() is so simple and has not
been changed since commit 1da177e4c3f4 ("Linux-2.6.12-rc2");
finding a collapsible skb and repacking it into up-to-SKB_MAX_ORDER()
skb.

Now that we use 4K MSS and tp->scaling_ratio, the simple algorithm
does not work well, and it could even end up consuming more memory
contrary to the intention.

For example, the scaling ratio of SKB_MAX_ORDER() is 222, but
typically tp->scaling_ratio for 4K MSS flow is 252, and repacking
data rather bloats high-density skb.

Also, once a low-density skb starts collapsing, it drags all the
following skbs into collapsing regardless of the density.

This series changes the algorithm so that it skips high-density
skb and a single low-density skb between high-density skbs, batches
memory accounting at the end, and removes sk_forced_mem_schedule().

This series still keeps linear SKB_MAX_ORDER(0, 0) skbs as the
collapse target, and Eric is working on a follow-up patch to
store the collapsed payload in order-0 page frags instead.

https://lore.kernel.org/netdev/CAL4WiiqekjxZw3EoDYXLc0Phd3i0GStE2ZHWQkH2iAkSM5D8TQ@mail.gmail.com/


Changes:
  v2:
    * Patch 1: Describe SYN/FIN behaviour change
    * Patch 3: Describe behavioural change for MPTCP
    * Patch 4: Add compute_skb_truesize() instead of macro
    * Patch 7: Rename test to tcp_rcv_collapse_bloated.pkt

  v1: https://lore.kernel.org/netdev/20261114040101.1043546-1-kuniyu@google.com/


Kuniyuki Iwashima (7):
  tcp: Refactor the first loop in tcp_collapse().
  tcp: Don't collapse high density skb.
  tcp: Stop collapsing if not bloated.
  tcp: Skip collapsing if collapsed skb is less-dense.
  tcp: Allocate all new skb before collapsing.
  tcp: Batch memory accounting in tcp_collapse().
  selftest: packetdrill: Add test for tcp_collapse().

 include/linux/skbuff.h                        |   2 +
 net/core/skbuff.c                             |  26 ++-
 net/ipv4/tcp_input.c                          | 171 +++++++++++++-----
 .../selftests/net/packetdrill/ksft_runner.sh  |   9 +
 .../packetdrill/tcp_rcv_collapse_bloated.pkt  | 135 ++++++++++++++
 5 files changed, 292 insertions(+), 51 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_rcv_collapse_bloated.pkt

-- 
2.56.0.679.gc527c65306-goog


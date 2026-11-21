Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288880;
	b=vC9yRKa9H1P0vKD3n4QQ4bsHnLKIno+Z6lZQfa1a0Sx/qlj9czFfe7UIRQF+BMX4Q/PZ
	 hv46s+6VbOcpiLIo0XjPBOtbYFWPj5E5rx9x5UYr7hm4UcbaJCY4fsbzp170Rlae7CBsY
	 O5q1rqJpkFRCkg2G8anh4x4qXV55T3ZT2PmKv14vgwbHClPIb6M2cgMcDcqCP1n24oxMG
	 dnvsTSqY99Fwephv8hj6ExguJmUKQNHf8TmRPI4vJ0+C9pI1xia4lQ8Rr5Lu5jOzPOwMO
	 VsyCEGXeVZKbK6KVQ2WLf4XSb096FNg6uyYGduoXw/3CoCnJBTr3EvllCWKw5h6d9fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WEJifOM4btmMBaQz1LYQ7o7civsENMQIMXfkruPOJrM=;
	b=P2RGomMOyr/GScj5GXpaUGmnzZW9riV3CMqnBc2KCUjaQ+ZAOHUBiB5XzoXp5SbEUhyj
	 tqqJTnHt0z9hcIKRG3SKjoUIdbP6GL9MNbqZXw19hAsydW6beLuxzRHaNOZXhwg0xm1/e
	 ZS+ylNR/r4jfMihwyCZmnbM5SldflWfYSepWOnKeEGIEtrzacvKOUakXr+sDZuPtQPjM7
	 gASedfMoqu0yaY0hLgsNwRR9pSz5ILe3mLFj8mnLepXJfBGllSsiHmqy/RID6r1/ceYHC
	 x2+tf5LBunrOHZktUNLfIBkWOlU3chER3+Quk+3qQOlcBMAdkUGMacKHw6O16Q4IzTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=lHfjkRP5;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BB1606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BB1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=lHfjkRP5
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-949680e6d82so253666885a.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795288878; x=1795893678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEJifOM4btmMBaQz1LYQ7o7civsENMQIMXfkruPOJrM=;
        b=lHfjkRP5F1XP3scjEL4C36b1J9XZNXLWpYuNQptqUC4A6ovhKhFin1joXfNnvNnOKg
         TXAzsImnEe6JfzsOEIF29AxgEa89ZB5XYkVua1xueum33yi2/oTwt1VgJ2Z0Ai0i9uE0
         nKGnXVKiEhoXnNO68bFKNDXhusrfuX4k912YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288878; x=1795893678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEJifOM4btmMBaQz1LYQ7o7civsENMQIMXfkruPOJrM=;
        b=rZDd+xPqv2fxjrpmRduLkvA7fV3+fuZhA4sb+JCwxBG/D5tjd3MbEDQ+/FgsmRo5PQ
         Sq1ITghMPuF3Z4yHWJGX5BD/jhoG5NmCAkAeOvbaYGZPla7V5bHwu7RngGzOvBs21RZY
         z0LGTVU5maNsz4IMrj3bwQpfy/ipy4Y5I4Hdouw8W/Jk3XGkIQtwEZcuNT0YyRM/6PIp
         6+27B1Wsv/RWdsQOMiqRVgyYrSIK+JzlaqvG9tpybIJL+6iDbvVBl4YSYAqb+hjb4E4L
         X4z1tx2JZjazzre6G7AGdQNKMzB0bU1CZ04J89X79HsKatx6EN4NSFaLWR/wGST4tGzZ
         +WkA==
X-Gm-Message-State: APuU4Z8bStBlQ43/Md/etpQVUXm6uacEjVh84g+qb8vp+DbVgnxIFL6n
	9G7mp66SB0b9ubUoT8zBm4yXLs9NT+D/j5WorW+lx2Sigpg6Qog/CF/V11Z+0/1F0GECeTBExVd
	BnNo=
X-Gm-Gg: AZFdTZctFmZjrQH4AnrzGvDnNawvTLjDQkVuEP2H1PS+S+00WBNOkX47nihLwSkEDOT
	cgwzdL/HYNV1CfpcrupHuG/DzQvvZdH/iF3qpr1SvEsAEItpN4+Db/4oJNSe1kftyHyo2ElNOym
	0jU0CUV4RzRGLVPzWTQJhu9y790nt8WmHPfjUo6KUk15tR/kzHKO6dzk1lhWCNcJeqxCpfhFgRK
	HEX8cPn6JfAwA8jP7LQqGq/NiKZhz7L3Rf3pjPrjxQVDASvLtQlaV4otOctaO84wZaodx4Xb9I0
	cNcY+m59oB/pTn2SVmTKMzYorazM49ug3cVhuuXPrMKm9XBkvQe49rDLH7bS+4+3bIfTqXulD3T
	y68xH8rgs4cXhme11QJS/sltofmwn77TfMoqfOANqL4HEtgwaL5WA6McOUJAMX2IjkcqNvJeQYT
	9acCWvJhrqA1/jF0yBhV1m7BB7q87OCeezFJUso/w1x1LYXcSXhGBA0FRPOxhS43KkwtC0D/Pu7
	pOCbJhQQoTycdzJjlm4hpz4mP/h1UH//Heu0pVQe+tGUIjg83jR7C5kUenIIQrmW29N7Sx8eMus
	G/J88ynfEVPPZyO2lJFUxLcG0ulHt/l5C5tU+xrvrqEBIILvAAxm/U5O3e7ZIDAaVFJKECNKzW0
	=
X-Received: by 2002:a05:620a:6493:b0:940:e34a:aead with SMTP id af79cd13be357-949ba80fa2fmr1057892685a.5.1795288878566;
        Sat, 21 Nov 2026 11:21:18 -0800 (PST)
Received: from mbili.waya ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3cb882sm472764685a.27.2026.11.21.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:21:17 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Victor Nogueira <victor@mojatatu.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	cake@lists.bufferbloat.net,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next v12 2/4] net/sched: cake: use a dedicated split-GSO list iterator
Date: Sat, 21 Nov 2026 14:21:08 -0500
Message-Id: <QDISC-BA27.v12.r0.20261120184210-2@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <QDISC-BA27.v12.r0.20261120184210@mojatatu.com>
References: <QDISC-BA27.v12.r0.20261120184210@mojatatu.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

skb_list_walk_safe(segs, segs, nskb) reuses the list head as the walk
cursor, so segs no longer names the segment list once the walk finishes.
Use a separate seg cursor to keep the head and the walker distinct. No
behaviour change.

Reviewed-by: Victor Nogueira <victor@mojatatu.com>
Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
 net/sched/sch_cake.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 24853d90c17e..88ff3e4f6754 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1814,7 +1814,7 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		WRITE_ONCE(b->max_skblen, len);
 
 	if (qdisc_pkt_segs(skb) > 1 && q->config->rate_flags & CAKE_FLAG_SPLIT_GSO) {
-		struct sk_buff *segs, *nskb;
+		struct sk_buff *segs, *nskb, *seg;
 		netdev_features_t features = netif_skb_features(skb);
 		unsigned int slen = 0, numsegs = 0;
 
@@ -1822,19 +1822,19 @@ static s32 cake_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		if (IS_ERR_OR_NULL(segs))
 			return qdisc_drop(skb, sch, to_free);
 
-		skb_list_walk_safe(segs, segs, nskb) {
-			skb_mark_not_on_list(segs);
-			qdisc_skb_cb(segs)->pkt_len = segs->len;
-			qdisc_skb_cb(segs)->pkt_segs = 1;
-			cobalt_set_enqueue_time(segs, now);
-			get_cobalt_cb(segs)->adjusted_len = cake_overhead(q,
-									  segs);
-			flow_queue_add(flow, segs);
+		skb_list_walk_safe(segs, seg, nskb) {
+			skb_mark_not_on_list(seg);
+			qdisc_skb_cb(seg)->pkt_len = seg->len;
+			qdisc_skb_cb(seg)->pkt_segs = 1;
+			cobalt_set_enqueue_time(seg, now);
+			get_cobalt_cb(seg)->adjusted_len = cake_overhead(q,
+									 seg);
+			flow_queue_add(flow, seg);
 
 			qdisc_qlen_inc(sch);
 			numsegs++;
-			slen += segs->len;
-			q->buffer_used += segs->truesize;
+			q->buffer_used += seg->truesize;
+			slen += seg->len;
 			WRITE_ONCE(b->packets, b->packets + 1);
 		}
 
-- 
2.43.0


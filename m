Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072617;
	b=K5iZAG6qGqSW+8+H63CVMs1jXxWxiEmDx91LL1L68aLvXNWVr8sFK1HfzItvbB1+tQzh
	 7RiUxPPWBWksgpqpK8vrnzevg9+ToMEHj6BdKKGgW5UiduvpT0ueyY/I6+Hyd+lJKty8r
	 3gnlzVkDr6XdrNRFWFkhydDgcTjksgdNV6OENWh2/VG+ytHRkT965GdkzgfBnHlSe/n2n
	 B2Boc3MtrUcYS9qJMBYEUnIxLVE7rm0XEHWYPO9Vrzmzx7qxj0I9dSRxu/mXScK0MS1eS
	 3hIyCWDnl1QGGXmSO83u2eauxeUqx4u6mA3WmCltZcwNF/ZLJywhgOe39E9iSTT4bPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WTJSAbVd18SG4y7u4B/Xr6BzdN9hE6nrl/zI/oyvASw=;
	b=qZzFaEKxO+OPfsfaaHd6H8Zs5OPpJmMAx5hZIzWu3DbU2xYdedKUYF4JVIKA1/7jLFX1
	 E8b/Ef6+f2ZZJQ6wT0Q4oL0ANRsOwSwNe3nRgOTNiq1egg7GIVyg4muHaOMPCQsqsBgDR
	 0sFY27eGUqyCBZVGSU0lgwvjAYhm8TTWwEr+W/b/0VG3VJlYSE3P7wPuD4paNs4L2X1iq
	 SClEgGV8foSKN+Xzk4RhiZdwllpzNyEmOJQnCSoR8TWcJ0d0QqmaYuiSS+bf7sAEGkNG3
	 BjjJTTmfNODsg03dr5cV0N/HCaDCU8GibyoVwpB/LDe1uPlHKPMXg1wj4p1Avxz8XIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zn0DVm9k;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06C60A2614
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C06C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zn0DVm9k
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd6969473a4so1121750a12.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072617; x=1795677417; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTJSAbVd18SG4y7u4B/Xr6BzdN9hE6nrl/zI/oyvASw=;
        b=Zn0DVm9k+I595eH4KSKxnLF2RjLzO/+IYa6WR9JzmYAf4A6t0ECwPTvua5WMCJfTdK
         YhblXVZt1d7otaq1f1slPElWuSgcNk/4LOK3TJpuHNe14EnZvRzCD2Cyok+TC5aYqWGi
         05jIa4zF3lo+dQV+e2AQN300RQtf8BEWBG1AXrYMh2lVYz6SsWeRQ2R/eZm0tegrau3g
         5r/ADTWs6VbPt4IpxmQm5gzcKMipGGaZ3d1HMHGbO68tHZZsg1IS139a0b5WI5LMAOJn
         OY8MozPwoh1fiajwsqBzq2JSjcypzB0dPurAVcc3V7+ICLbgqoVtyLVurZtmrbTukggO
         04pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072617; x=1795677417;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTJSAbVd18SG4y7u4B/Xr6BzdN9hE6nrl/zI/oyvASw=;
        b=BVGMHBA5piNQtXId9oZVf4nut7kaXgN8sw+D+0/HZgjuzwIoD9JFKENlKUrEJ8GVtP
         Hgqwr40DwbZKgM5BvEjbB5lfgjN2Hkoqtig1nquva35x7/a/SddW60UDKL5Af1rzqnAU
         IQoaut8GRcJkZ4pNaW5oMwWbRZ4FtpMBIzbD9LAooZ+UxrutfQ6NbVmUCcYVHS43Ni2u
         JWuVdrSKlmKyuu8YIkWuch2PS6bMQeV1vnPr05E+H3P8N9KHnquSMChh3URQhS+VhDsK
         aDrOTdAO0u8zY9SCl83mDc4DOEP8rjz6NZN3z9I83rq7AJSWBnDVHWeyyJto23dw3VM3
         Cs9g==
X-Forwarded-Encrypted: i=1; AL+hErHbJMqxlHStww+NQXVEe4VlVal23ImXwY6MYyk0h7vinqymDdp2QiT33qgF5kDEstRFd73tF24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w+z4zLmQVFlF45sch55ohnX2Y4uJrF8FhiwWh8H1fNhSYEZT+
	oQ/MZ9FCi3/vMH85PU/EE94HbkKfUjPWrVUHkEwwrJAqGTXxV5Qrr60jNCMGM14C4NqyLw4AAqp
	v9AS23w==
X-Received: from pjbhs15.prod.google.com ([2002:a17:90b:200f:b0:3b4:a90:5a08])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:254e:b0:3ad:1b31:92d8
 with SMTP id 98e67ed59e1d1-3b3d07e37e7mr4576279a91.60.1795072616783; Wed, 18
 Nov 2026 23:16:56 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:57 +0000
In-Reply-To: <20261119071649.374106-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119071649.374106-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119071649.374106-6-kuniyu@google.com>
Subject: [PATCH v3 net-next 5/7] tcp: Allocate all new skb before collapsing.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

At the final stage, tcp_collapse() iterates over collapsible
candidate skbs and repacks them to new skbs.

In each iteration, a new skb is allocated and inserted to the
receive queue or a temporary list for RB tree.

If alloc_skb() fails while splitting a large bloated skb across
multiple new skbs, the partially-copied skb is not removed and
new skbs remain in the queue as duplicates, consuming more memory.

It is only when all candidates are properly collapsed that
we can save memory.

To avoid complicated rollback, let's preallocate skbs before
collapsing.

Now all skb in [start, sub_end) must be allocated in a batch,
so the section size is capped at TCP_COLLAPSE_MAX_TOTAL_SIZE
(16 skbs), except for the first single skb.

Once the size exceeds the limit, the remaining skbs are
re-evaluated from restart:.

Legitimate overlaps (retransmits with a different segmentation)
only involve a few skbs, so if an overlapping OOO chain reaches
the limit, we simply skip it.

Note that the next skb can be skipped if its density already meets
tp->scaling_ratio, and each cut adds at most one remainder skb
(~3.4% worst-case truesize overhead on 4 KiB pages), which is a
small tradeoff to bound the temporary allocation.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
v3: Make TCP_COLLAPSE_MAX_TOTAL_SIZE hard-limit for multiple skbs
---
 net/ipv4/tcp_input.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 27ed9ba11ec9..990e34896373 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5822,6 +5822,11 @@ static struct sk_buff *tcp_skb_next(struct sk_buff *skb, struct sk_buff_head *li
 #define TCP_COLLAPSE_SCALING_RATIO				\
 	((TCP_COLLAPSE_MAX_SIZE << TCP_RMEM_TO_WIN_SCALE) /	\
 	 (SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE)))
+/* Cap pool preallocation per sub-range to at most 16 skbs in seq
+ * space.  A single first skb exceeding this is still collapsed,
+ * whereas an exceeding overlapping ofo range is skipped.
+ */
+#define TCP_COLLAPSE_MAX_TOTAL_SIZE (TCP_COLLAPSE_MAX_SIZE * 16)
 
 static bool tcp_collapse_skb_bloated(const struct sk_buff *skb,
 				     u32 start, u8 scaling_ratio)
@@ -5862,8 +5867,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 {
 	unsigned int old_truesize, new_truesize;
 	struct sk_buff *skb = head, *n;
-	struct sk_buff_head tmp;
+	struct sk_buff_head tmp, pool;
 	int remainder, nskbs;
+	struct sk_buff *nskb;
 	u8 scaling_ratio;
 	u32 sub_end;
 
@@ -5871,6 +5877,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			    TCP_COLLAPSE_SCALING_RATIO);
 
 	__skb_queue_head_init(&tmp);
+	__skb_queue_head_init(&pool);
 
 	/* First, check that queue is collapsible and find
 	 * the point where collapsing can be useful.
@@ -5926,8 +5933,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		}
 
 		if (!overlap &&
-		    !tcp_collapse_skb_bloated(n, sub_end,
-					      TCP_COLLAPSE_SCALING_RATIO))
+		    (TCP_SKB_CB(n)->end_seq - start >= TCP_COLLAPSE_MAX_TOTAL_SIZE ||
+		     !tcp_collapse_skb_bloated(n, sub_end,
+					       TCP_COLLAPSE_SCALING_RATIO)))
 			break;
 
 		sub_end = TCP_SKB_CB(n)->end_seq;
@@ -5935,25 +5943,38 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		n = tcp_skb_next(n, list);
 	}
 
+	if (sub_end != TCP_SKB_CB(skb)->end_seq &&
+	    sub_end - start >= TCP_COLLAPSE_MAX_TOTAL_SIZE)
+		goto skip;
+
 	/* Third, check if the new skbs have high density. */
 	nskbs = (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
 	new_truesize = nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
 
 	remainder = (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
-	if (remainder)
+	if (remainder) {
+		nskbs++;
 		new_truesize += skb_head_truesize(remainder, GFP_ATOMIC);
+	} else {
+		remainder = TCP_COLLAPSE_MAX_SIZE;
+	}
 
 	if (old_truesize <= new_truesize)
 		goto skip;
 
-	while (before(start, sub_end)) {
-		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
-		struct sk_buff *nskb;
-
-		nskb = alloc_skb(copy, GFP_ATOMIC);
+	while (nskbs--) {
+		nskb = alloc_skb(nskbs ? TCP_COLLAPSE_MAX_SIZE : remainder,
+				 GFP_ATOMIC);
 		if (!nskb)
 			goto end;
 
+		__skb_queue_tail(&pool, nskb);
+	}
+
+	while (before(start, sub_end)) {
+		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
+
+		nskb = __skb_dequeue(&pool);
 		memcpy(nskb->cb, skb->cb, sizeof(skb->cb));
 		TCP_SKB_CB(nskb)->has_rxtstamp = false;
 		skb_copy_decrypted(nskb, skb);
@@ -6003,6 +6024,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 end:
 	skb_queue_walk_safe(&tmp, skb, n)
 		tcp_rbtree_insert(root, skb);
+
+	__skb_queue_purge_reason(&pool, SKB_CONSUMED);
 }
 
 /* Collapse ofo queue. Algorithm: select contiguous sequence of skbs
-- 
2.56.1.708.g77570a6a1d-goog


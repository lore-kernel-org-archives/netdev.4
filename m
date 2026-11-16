Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870363;
	b=QPqtWlpoFq1AjN4ehLrYxDlEhNZnXK0mTIlAeiEOVMEzfZOfxfMxeji7PG9vEPKiLyHd
	 bgmnWheXOF4gxdzWXa0WifrKlMvlwJ8bTr2FdbqOGdqhDzR54hR+s4TqiS7MUuFtRWkCk
	 8rMbuAAd4AzoqrMV+5Bx47zD1uemX8ikDWnubjNO1mxtGXlfmDN8jOELEk1YxJKH6rGFs
	 5Rpu6ZkdVM+3XVwFT39uk9OYtylIBCwU7pqBZH5rZgtPczc3dHTbP+IrhbcwCB9NSXvUe
	 6GJUOe3FRo9aAz7Nu5GOFnCc4HKEfOZFqdkop4dE4PpRyqz2+So1PF5GrH0EIT5/7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Oxki1cduy7Jlef3gLyF5h+aCOZHnxGDcLpRSm3QnCQM=;
	b=YYKDRrHktDTHxSbcSU2uhLH+Ob3GETm3sp7s616AkbD6i/adRAcJhWqiQWTU05OVHtso
	 YdaloB29TxVF7aesE3j7Zp9SqBbRFeYnDgkthClcQqh9hynCuWREz3BEYc273Qo7G1BJK
	 z1FGQmB3fuHiK/b37n1WgHrZz715d5CboidhNVmCA4eJCcNyZMuyhlWVAG+FQiQy4kbgT
	 KjSvU7B22o3tL2oxE4bF/85/hbBqnd50PD9Vo9211cXpx0iJVlChbZw4dVi+lSiggtVnG
	 PrIxY+xjCcxoBA8ytKH3gAm3Nz1eUXQugglOmzIwEiGbnq74JDJNdmSTR35yyhjM6Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YRkIHTRq;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC78606A33F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACC78606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YRkIHTRq
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1920241a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870362; x=1795475162; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxki1cduy7Jlef3gLyF5h+aCOZHnxGDcLpRSm3QnCQM=;
        b=YRkIHTRqVFsR/UROhGB/ckikoKpmufaaBeGdcm+iK2TzEGdYIY/8it44cezdWXXxhd
         huvV1lRyShaQsctQJJfwZClco0vIXc4r2huM4IuYs+IkZSdOhL2iW/mEk2lIdEJOlZEp
         LLSOfYTAFdVLAlzGeq2/Vqyp/85xsnaW3YBwzHzi+c0jGlQsubblMnBIajMmmYA+FSh7
         aboGBdfrY6tw10Jii3amg1qczCHeQnblBjQwirb81mAEQId2jv4RVY+Cl91duxe20GAk
         6E4J+tTgbX0MLnPa2PG6AueO4YA2uo6UnsGuvhukJjDt2bNBeRsLgQ22vXVSjsPUvPqt
         OttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870362; x=1795475162;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oxki1cduy7Jlef3gLyF5h+aCOZHnxGDcLpRSm3QnCQM=;
        b=HQJ0WYVLXlpT3KViKqmn7P3R4jQeBVjKQJUW0lkFBE1u9CgpnekR5EtJXM8L6O1TbX
         5hOOhXDsFBESvSm4n0KLDpErnx1Rk5xZE2+BYdltV61MXwR7bENYlmWKgTrPvhl4kbjk
         6eKtocHfbjJcoTW9D3F2V+i8ece8qKn0HeqGVzgMJ/IdBCxJtYW9UGYZ+zYs0zyh5c/V
         oySgj7hEq1vdEuxzLUvAMCRwAj2pP++oanGImsGfEaNU5cval9BHSK3yMrzBYn6Yf3iS
         gOugzm1mKx6mopRqNupURVKKaEkm5hxo9fcYpUOMkt1tYEd9AdUqzEvKpUypRzFOKj0U
         cyKg==
X-Forwarded-Encrypted: i=1; AL+hErG48LpRX/mbWo+p72lXaBpBYDrnf9zXjHnZeci8MS/9un9PDBT6mBBRNvnfMFk/xR4CNNgHgGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xMQj5gqLjuSKXSRrNu5RGwfyNCb9Y2MRaPI2P5DCNuuLVT1xQ
	iInHIPSaUCUpZYyaz+GYGc0O81rwvbyPRWs+kiV9AeykGgeb+30hQthvpcxQqpnP48iHmoWQLlP
	QDM2r5w==
X-Received: from pgam4.prod.google.com ([2002:a05:6a02:2b44:b0:cd8:bcc7:e588])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:890e:b0:3e2:9f41:9f63
 with SMTP id adf61e73a8af0-3f7a49c08f7mr9647355637.1.1794870361768; Mon, 16
 Nov 2026 15:06:01 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:29 +0000
In-Reply-To: <20261116230555.2305867-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116230555.2305867-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116230555.2305867-6-kuniyu@google.com>
Subject: [PATCH v2 net-next 5/7] tcp: Allocate all new skb before collapsing.
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
so the section size is normally capped at TCP_COLLAPSE_MAX_TOTAL_SIZE
(16 skbs), except when a single bloated skb or overlapping OOO skbs
must be collapsed together to free the original skb or keep the
rbtree monotonic.

Once the size exceeds the limit, the remaining skbs are re-evaluated
from restart:.

Note that the next skb can be skipped if its density already meets
tp->scaling_ratio, and each cut adds at most one remainder skb
(~3.4% worst-case truesize overhead on 4 KiB pages), which is a
small tradeoff to bound the temporary allocation.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp_input.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 0815e1891fba..ca4cdb93373d 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5812,6 +5812,7 @@ static struct sk_buff *tcp_skb_next(struct sk_buff *skb, struct sk_buff_head *li
 #define TCP_COLLAPSE_SCALING_RATIO				\
 	((TCP_COLLAPSE_MAX_SIZE << TCP_RMEM_TO_WIN_SCALE) /	\
 	 (SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE)))
+#define TCP_COLLAPSE_MAX_TOTAL_SIZE (TCP_COLLAPSE_MAX_SIZE * 16)
 
 static bool tcp_collapse_skb_bloated(const struct sk_buff *skb,
 				     u32 start, u8 scaling_ratio)
@@ -5852,8 +5853,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 {
 	int old_truesize, new_truesize;
 	struct sk_buff *skb = head, *n;
-	struct sk_buff_head tmp;
+	struct sk_buff_head tmp, pool;
 	int remainder, nskbs;
+	struct sk_buff *nskb;
 	u8 scaling_ratio;
 	u32 sub_end;
 
@@ -5861,6 +5863,7 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			    TCP_COLLAPSE_SCALING_RATIO);
 
 	__skb_queue_head_init(&tmp);
+	__skb_queue_head_init(&pool);
 
 	/* First, check that queue is collapsible and find
 	 * the point where collapsing can be useful.
@@ -5908,8 +5911,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 		/* seq and end_seq must increase monotonically for rbtree. */
 		if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
-		    !tcp_collapse_skb_bloated(n, sub_end,
-					      TCP_COLLAPSE_SCALING_RATIO))
+		    (TCP_SKB_CB(n)->end_seq - start >= TCP_COLLAPSE_MAX_TOTAL_SIZE ||
+		     !tcp_collapse_skb_bloated(n, sub_end,
+					       TCP_COLLAPSE_SCALING_RATIO)))
 			break;
 
 		sub_end = TCP_SKB_CB(n)->end_seq;
@@ -5924,6 +5928,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	if (remainder) {
 		nskbs++;
 		new_truesize += compute_skb_truesize(remainder, GFP_ATOMIC);
+	} else {
+		remainder = TCP_COLLAPSE_MAX_SIZE;
 	}
 
 	if (old_truesize <= new_truesize) {
@@ -5932,14 +5938,19 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 		goto restart;
 	}
 
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
@@ -5985,6 +5996,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 end:
 	skb_queue_walk_safe(&tmp, skb, n)
 		tcp_rbtree_insert(root, skb);
+
+	__skb_queue_purge_reason(&pool, SKB_CONSUMED);
 }
 
 /* Collapse ofo queue. Algorithm: select contiguous sequence of skbs
-- 
2.56.0.679.gc527c65306-goog


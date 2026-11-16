Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870361;
	b=Ge49D+++VcHjZxHAZu/FHxF6JdNgJMUUwUoR4mY/ibdrDywyR7l1kqu/vQI2J2tCTKQd
	 mhsIswbcarURp53BDNwivolNnGfFHPcYIU44QnRYFIIRkwrKrM9CbWY/f6XKqcuevC8zg
	 zKcg1b2YTP+NtskE3J6m+5tFhZKpAe2wmyjb5l5HdIqyrZNpyg1w1Y+5/BLjBPkZhgsUN
	 gJH5DVO/w4NwKuiswZGxYlFYLVLmlk8Q6ztncZ3WuQTOyuSGyOHz5fusNNL9JDbR20YRM
	 yl4NnQZ2dDz4Ll3KKbT4I7kqOtKjV9vMRexA+9SRZ/Z8mEIs+IX/ZLpHxZUSdj7ml6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aoUoBk1HZavue3Km3O2AQLSN8BcEHTWpRN3NYo57aBs=;
	b=ma3bumgAX+cdb/K8GnRuuZ6QpHdht9cK546kU89staWnzc7cVrSTjwAz7dlCfGUtnxwL
	 iyhUW/NWqW+xUb5bDRrLbBhC9R94+xIqUFs2tN86zcN3XeHLAqAlSHdoq4E2Ik+UNa3cH
	 0h/LZDP1slmKRCrgi2GP5rdTt2nO7BsLRU/KdsveYHbyPH83mcZhPFGOIObn87OuSdqhu
	 oVyZA/1YuITeIdni9H24HmXLtbD2oOHHZoX5qjNvZix+SkRaN8+GrCKqkJDHzoCAyF42P
	 VN7Y5B+vY/O4qs5viI7DeJRwHOblsOKP8p6fBxxa8hl+TGzCE45Lx9JW0Trf91EJXtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jp0mIkuk;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7FB606A335
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B7FB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jp0mIkuk
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cde080a93b6so152469a12.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870360; x=1795475160; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoUoBk1HZavue3Km3O2AQLSN8BcEHTWpRN3NYo57aBs=;
        b=Jp0mIkukSQ+WW4K7jAtykaR074apSCwIixr2Y9vGVSmulAQS/zpm5xtgRgUes/MJE6
         WfyKsMAUrqkKRquLslcGc4UJ4zCF7yJkL394FyUc/xKX7pMVvduXjUai86FrsDqspMLV
         o4/3IEgwrVPSuMmExZn4m0pn46xOY/eQcwaO1+M/xPJZQj7Wbev0to1Wvqt3a8VbAtd8
         1H27TtkpqVDVUfJKBmJ9VxMk/Eb+WWzonL4rvmmfvDMpIbgxdp5MFD7tS//EQQrKLI13
         vkhevyHLby9ucK9eJ1wozo/uq+eE9I045c1ptjktcoTy0zsumJZxNk+9dFIaI67/Ocbg
         Nmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870360; x=1795475160;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoUoBk1HZavue3Km3O2AQLSN8BcEHTWpRN3NYo57aBs=;
        b=XL4H5o+GxWMMhlvUMEMdgRLDjJWC7UXMAifPZF3VgW9yXQFTzyV7Kb1XH+d49TGWuT
         t4snusvaZWdE3eZ/TTj3JNYzpTczzUqIZwyHh/yszQbLXfs6+OxkkeSEeEe5+IqMLQSf
         wdetKvdxQq3idUSZLIAyYDbb/+ywAeUQFC6gcJFy4Za25ovAY3Jp9Pn20Y6yBsFzyDMS
         9+b0rN5DdXVh2s+YN3K53m85AhNoLTOyClKmXlxmYaI/E96nWa9XjaDPMqISAndq3vGE
         3YXp52/RR6GvKAVy/6KGefbihIYzo66MmKmyAeYY35vIlizNKPR7+tS3MlWIBmj5Bipr
         NaOw==
X-Forwarded-Encrypted: i=1; AL+hErFTIrogfwr/5mnDA+x1kUj9yMkP5o7QkZJItoVRN+fUlGzSkAYISyv3bAVjgD8CF8C3XJc8GSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Nb331wllDvwFQqqa3rzaHZtZ3LaY2OQDgblAb8UdUuWgfMm5
	SJbiRgxZ9hxxlFIUASqnA8kHIta7M/am4DQMXm4x0KUvSOj7tEQPa0ddZvh8nyzbBRfvsnAsxeV
	9YKS92w==
X-Received: from pjwo1.prod.google.com ([2002:a17:90a:d241:b0:3b1:166b:a646])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d06:b0:3b1:bd6d:fcc2
 with SMTP id 98e67ed59e1d1-3b3abe7e796mr467017a91.40.1794870360098; Mon, 16
 Nov 2026 15:06:00 -0800 (PST)
Date: Mon, 16 Nov 2026 23:05:27 +0000
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
Message-ID: <20261116230555.2305867-4-kuniyu@google.com>
Subject: [PATCH v2 net-next 3/7] tcp: Stop collapsing if not bloated.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Even when a skb is not bloated, tcp_collapse() starts collapsing
if the next skb has overlapping data.

Also, tcp_collapse() does not stop until it reaches the tail or
unmergable skb (SYN/FIN, unreadable frags).

Assume we detect a low-density skb followed by fully-packed 4K-MSS
GRO skbs:

             skb->len  truesize  scaling_ratio
  skb    #1      1448      2944      125 (49%)
  skb    #2     65536     66432      252 (98%)
  skb    #3     65536     66432      252 (98%)
  ...
  skb    #9     65536     66432      252 (98%)
  --------------------------------------------
  total                  534400

Then, even the high-density skbs are repacked into lower-density
skbs, and we end up consuming much more memory.

             skb->len  truesize  scaling_ratio
  nskb   #1      3776      4352      222 (86%)
  nskb   #2      3776      4352      222 (86%)
  ...
  nskb #139      3776      4352      222 (86%)
  nskb #140       872      2304       96 (37%)
  --------------------------------------------
  total                  607232 (+72832!)

Even if we find a collapsible skb, we should not collapse
subsequent skbs with scaling_ratio >= TCP_COLLAPSE_SCALING_RATIO.

Conversely, even if tp->scaling_ratio is smaller than
TCP_COLLAPSE_SCALING_RATIO, we should repack skbs once we
start collapsing, which results in higher-density skb.

Let's remove the next skb condition in the first loop,
search for collapsible bloated skb range, and repeat
collapsing for each range.

Note that even when the next skb is not bloated, we must
collapse it for OOO rbtree if it has overlapping data.

	if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
	    !tcp_collapse_skb_bloated(n, sub_end,
				      TCP_COLLAPSE_SCALING_RATIO))

For example, bloated skb_1 and non-bloated skb_2 have overlapping
data and only skb_1 is collapsed to nskb_1 and nskb_2.

   skb_1 = [1000, 5000]
   skb_2 = [2000, 66000]

Then, nskb_2 will be inserted after skb_2 in rbtree, wrongly
setting tp->ooo_last_skb to 5000.

  nskb_1 = [1000, 4776]
   skb_2 = [2000, 66000]
  nskb_2 = [4776, 5000]

This case is still inefficient, but a later patch handles this.

Another notable thing is that tcp_skb_can_collapse_rx() now checks
candidates against the first skb before mptcp_skb_ext_move(),
not against each nskb.

When a skb with an MPTCP ext spans multiple nskbs, collapsing
previously stopped at the next skb with the same ext because later
nskbs lacked the ext.

   skb1 (ext A),                  skb2 (ext A)
  nskb1 (ext A), nskb2 (no ext)             ^
                        ^- not collapsible -'

Now such skbs are also collapsed with the redundant ext dropped,
while the first nskb still carries the same mapping in sequence
order.

   skb1 (ext A),                  skb2 (ext A)
  nskb1 (ext A), nskb2 (no ext) <-' collapsed into nskb2

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
v2: Describe slight behavioural change for MPTCP
---
 net/ipv4/tcp_input.c | 66 +++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index e07f43347409..5bd42a74c6f5 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5839,7 +5839,7 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
 }
 
 /* Collapse contiguous sequence of skbs head..tail with
- * sequence numbers start..end.
+ * sequence numbers start..sub_end.
  *
  * If tail is NULL, this means until the end of the queue.
  *
@@ -5848,15 +5848,18 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
  */
 static void
 tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
-	     struct sk_buff *head, struct sk_buff *tail, u32 start, u32 end)
+	     struct sk_buff *head, struct sk_buff *tail, u32 start)
 {
 	struct sk_buff *skb = head, *n;
 	struct sk_buff_head tmp;
 	u8 scaling_ratio;
+	u32 sub_end;
 
 	scaling_ratio = min(tcp_sk(sk)->scaling_ratio,
 			    TCP_COLLAPSE_SCALING_RATIO);
 
+	__skb_queue_head_init(&tmp);
+
 	/* First, check that queue is collapsible and find
 	 * the point where collapsing can be useful.
 	 */
@@ -5872,38 +5875,48 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
 		/* The first skb to collapse is:
 		 * - not SYN/FIN and
-		 * - the unread portion starting from "start" is bloated, or
-		 *   overlaps to the next one and mptcp allow collapsing.
+		 * - the unread portion starting from "start" is bloated.
 		 */
-		if (!skb_frags_readable(skb) ||
-		    TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN))
-			goto skip_this;
-
-		if (tcp_collapse_skb_bloated(skb, start, scaling_ratio))
-			break;
-
-		if (n && n != tail && skb_frags_readable(n) &&
-		    tcp_skb_can_collapse_rx(skb, n) &&
-		    TCP_SKB_CB(skb)->end_seq != TCP_SKB_CB(n)->seq)
+		if (skb_frags_readable(skb) &&
+		    !(TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) &&
+		    tcp_collapse_skb_bloated(skb, start, scaling_ratio))
 			break;
 
-skip_this:
 		/* Decided to skip this, advance start seq. */
 		start = TCP_SKB_CB(skb)->end_seq;
 	}
 
 	if (!skb || skb == tail)
-		return;
+		goto end;
 
-	__skb_queue_head_init(&tmp);
+	/* Second, find consecutive collapsible skb. */
+	sub_end = TCP_SKB_CB(skb)->end_seq;
+
+	for (n = tcp_skb_next(skb, list); n && n != tail; n = tcp_skb_next(n, list)) {
+		if (!skb_frags_readable(n) ||
+		    TCP_SKB_CB(n)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN) ||
+		    !tcp_skb_can_collapse_rx(skb, n))
+			break;
+
+		if (!after(TCP_SKB_CB(n)->end_seq, sub_end))
+			continue;
+
+		/* seq and end_seq must increase monotonically for rbtree. */
+		if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
+		    !tcp_collapse_skb_bloated(n, sub_end,
+					      TCP_COLLAPSE_SCALING_RATIO))
+			break;
 
-	while (before(start, end)) {
-		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, end - start);
+		sub_end = TCP_SKB_CB(n)->end_seq;
+	}
+
+	while (before(start, sub_end)) {
+		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
 		struct sk_buff *nskb;
 
 		nskb = alloc_skb(copy, GFP_ATOMIC);
 		if (!nskb)
-			break;
+			goto end;
 
 		memcpy(nskb->cb, skb->cb, sizeof(skb->cb));
 		TCP_SKB_CB(nskb)->has_rxtstamp = false;
@@ -5942,15 +5955,11 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			}
 			if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
 				skb = tcp_collapse_one(sk, skb, list, root);
-				if (!skb ||
-				    skb == tail ||
-				    !tcp_skb_can_collapse_rx(nskb, skb) ||
-				    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) ||
-				    !skb_frags_readable(skb))
-					goto end;
 			}
 		}
 	}
+
+	goto restart;
 end:
 	skb_queue_walk_safe(&tmp, skb, n)
 		tcp_rbtree_insert(root, skb);
@@ -5989,7 +5998,7 @@ static void tcp_collapse_ofo_queue(struct sock *sk)
 			if (range_truesize != head->truesize ||
 			    end - start >= SKB_WITH_OVERHEAD(PAGE_SIZE)) {
 				tcp_collapse(sk, NULL, &tp->out_of_order_queue,
-					     head, skb, start, end);
+					     head, skb, start);
 			} else {
 				sum_tiny += range_truesize;
 				if (sum_tiny > sk->sk_rcvbuf >> 3)
@@ -6103,8 +6112,7 @@ static int tcp_prune_queue(struct sock *sk, const struct sk_buff *in_skb)
 		if (!skb_queue_empty(&sk->sk_receive_queue))
 			tcp_collapse(sk, &sk->sk_receive_queue, NULL,
 				     skb_peek(&sk->sk_receive_queue),
-				     NULL,
-				     tp->copied_seq, tp->rcv_nxt);
+				     NULL, tp->copied_seq);
 
 		if (tcp_can_ingest(sk, in_skb))
 			return 0;
-- 
2.56.0.679.gc527c65306-goog


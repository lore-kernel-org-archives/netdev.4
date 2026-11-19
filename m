Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072616;
	b=0QkvP92lLzWvUWR8Wo/2bT8t9j1qvP3d9YpgM7WBP1d9RfvjUODWYeK9fGEvsbyD8aZE
	 in/OcD4jO6XuqPGtmcMIs/CAMecKXVmgeoXEcRT2pY6Tnu71gxDRBgSnATD+mXQCpBWqR
	 XA4VVLHyfTKAG8FuZ4JwTau8+CuwIkEpEmrlncFhkyfrnOUD0dIOjHNMvbXxaEAkxIXqu
	 eMwqJqoxeuUYsRFDPjMQ8cZD3SeJqGAJ2uJ4bN/5cpmMFcxfcPfqTOZN+6errlsCkJEZW
	 DhCoD5G0SsPlNf7zhFIO5PXqDfi0t8FXyMqh3xFfwmLfozR0Z6dc5ABTOBSIzrheBUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sk613CXrO9EacllX0bH/zjFtjs0j/DkIQHD5olKyDpE=;
	b=OGk44Xiy3J4KYO5T3DYJzX9QxNtqQ6t1LP61ffIFZGLC3+tFsLeYwoXsHn0TN8hsHlH4
	 yxKn0F148jikix/9D6YV/qJoyf5kuOLjnjt75EaTliSVx8WrDAOAzISnqV0K6a8KeZzHJ
	 CmP/affjAVoVmqOnMbnxK3Q6msif1CrhUrUNXegXjf14d0eoGPwndf6kscwEUZKcayk/0
	 zeTLq2Gd1WEDjqz+ERxDjuXsD787xpHS3PeL0xHRjOfSBhq7pdZEFA0CEpr9EawA21ymH
	 U11MCBhgp7hbj5LTusSNwmSsfiXu/crzVrOdnEftLaI0CWbLt6qPedBECcBChT4gwOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m9UsOUQj;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB560A2605
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 07:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DB560A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m9UsOUQj
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso1569570b3a.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795072615; x=1795677415; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sk613CXrO9EacllX0bH/zjFtjs0j/DkIQHD5olKyDpE=;
        b=m9UsOUQjCqmug1xwgKWHOHG8s+t5K0yWF2IUGsSZAAQpKwjhDf2Cy1ndRJfQovbuF5
         RcIE7AJfb+y3M6/6O9M/nPbeBzjHm5iTJ6K0Ef2fe0OhdidETX1KoUMMWZrw4fJ8GAJ9
         mce2P3CHBSbnizgnbb85uNDg5b+QXkv4ydROEeTb95A2gZxaQo1xB7tJ4PQ0XPzSk6Hi
         P1Wyk18iSKULU/0BcRaUdZ4OWZk55QFV03u9/4CNoUFixTqrLLe1kHN70rCTvsmAuHhW
         MlMVfPZXndbbvIGZwhhmiLkhcTPD1U+c2wLDWkasLU2S+HRka7/7CmqasxroIYKJVhjt
         LgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072615; x=1795677415;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sk613CXrO9EacllX0bH/zjFtjs0j/DkIQHD5olKyDpE=;
        b=aLf3T/Z8/GEQWtgm6AZ5kTIXswRBAxO92QZ6DYUdWOBmPBvMMzTc3hyik4ims1fqdJ
         KEH9+1tVyV4gHmL/4dam0aAtIChmC0Qsn6i4fpaoFrKY64YPg6szudMAocZm/WE6WB1v
         auJ4uV9l4Ugftzou57C7wKlnBSG0MP98U0qRPABsId71p/F616D5xyAG6uqT8JWi9rcO
         UobRb2bqXBDB19cfdGamy5R4usTlHhbi0JwF2i98qFgNzfk+IbOdqlqIGDsGCvqixAVc
         PIf2CRG+zKkGPnok7UQua+1wekn2mdMz03F11mb9nPUD6m0CeQ3pU7IOopBrwIcOCXbq
         /BHw==
X-Forwarded-Encrypted: i=1; AL+hErHr6GDi0CjaOcRqodOZFi8F6BFBLsKJOTsyCfJIMti0eaNk7O4XAd28yGU603pDP3uNCJTNqAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ALWFhSyzRpondaqk6KobkjYAHQmYsMtvJqUaLZn1FrEflYiN
	rmrQiBuscnI59gA7x8xoTMzU9qa+8Sgl2o/AOtRCxW/++ZaeU0RZfOBgCF1HvSEPNlSsef6V9wn
	mrr3J9A==
X-Received: from pgaa6-n2.prod.google.com ([2002:a05:6a02:6486:20b0:cd8:c1b3:bd8e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a92:b0:3e2:47cf:17f1
 with SMTP id adf61e73a8af0-3fe983fe65fmr5073627637.51.1795072615168; Wed, 18
 Nov 2026 23:16:55 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:55 +0000
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
Message-ID: <20261119071649.374106-4-kuniyu@google.com>
Subject: [PATCH v3 net-next 3/7] tcp: Stop collapsing if not bloated.
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

	overlap = !list && before(TCP_SKB_CB(n)->seq, sub_end);
	...
	if (!overlap &&
	    !tcp_collapse_skb_bloated(n, sub_end,
				      TCP_COLLAPSE_SCALING_RATIO))
		break;

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

On the other hand, if an overlapping skb on the OOO rbtree cannot
be collapsed, we skip the range instead of breaking out, as
splitting the range could insert the tail nskb after that skb and
break the same rbtree ordering.

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
v3:
  * Remove fully-overlapping skb in the 2nd loop
  * Skip range on overlapping unmergeable ofo skb
  * Update tcp_collapse() comment
v2: Describe slight behavioural change for MPTCP
---
 net/ipv4/tcp_input.c | 83 ++++++++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index b4e3d623c4a2..5df60dd35afe 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5848,8 +5848,8 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
 	return next;
 }
 
-/* Collapse contiguous sequence of skbs head..tail with
- * sequence numbers start..end.
+/* Collapse bloated sub-ranges in contiguous sequence of skbs
+ * head..tail starting from sequence number start.
  *
  * If tail is NULL, this means until the end of the queue.
  *
@@ -5858,15 +5858,18 @@ static struct sk_buff *tcp_collapse_one(struct sock *sk, struct sk_buff *skb,
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
@@ -5882,38 +5885,59 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 
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
+		if (skb_frags_readable(skb) &&
+		    !(TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) &&
+		    tcp_collapse_skb_bloated(skb, start, scaling_ratio))
 			break;
 
-		if (n && n != tail && skb_frags_readable(n) &&
-		    tcp_skb_can_collapse_rx(skb, n) &&
-		    TCP_SKB_CB(skb)->end_seq != TCP_SKB_CB(n)->seq)
-			break;
-
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
+	n = tcp_skb_next(skb, list);
+
+	while (n && n != tail) {
+		bool overlap;
+
+		if (!after(TCP_SKB_CB(n)->end_seq, sub_end)) {
+			n = tcp_collapse_one(sk, n, list, root);
+			continue;
+		}
+
+		/* seq and end_seq must increase monotonically for rbtree. */
+		overlap = !list && before(TCP_SKB_CB(n)->seq, sub_end);
+
+		if (!skb_frags_readable(n) ||
+		    TCP_SKB_CB(n)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN) ||
+		    !tcp_skb_can_collapse_rx(skb, n)) {
+			if (overlap)
+				goto skip;
+			break;
+		}
 
-	while (before(start, end)) {
-		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, end - start);
+		if (!overlap &&
+		    !tcp_collapse_skb_bloated(n, sub_end,
+					      TCP_COLLAPSE_SCALING_RATIO))
+			break;
+
+		sub_end = TCP_SKB_CB(n)->end_seq;
+		n = tcp_skb_next(n, list);
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
@@ -5952,15 +5976,15 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
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
+skip:
+	start = sub_end;
+	skb = n;
+	goto restart;
 end:
 	skb_queue_walk_safe(&tmp, skb, n)
 		tcp_rbtree_insert(root, skb);
@@ -5999,7 +6023,7 @@ static void tcp_collapse_ofo_queue(struct sock *sk)
 			if (range_truesize != head->truesize ||
 			    end - start >= SKB_WITH_OVERHEAD(PAGE_SIZE)) {
 				tcp_collapse(sk, NULL, &tp->out_of_order_queue,
-					     head, skb, start, end);
+					     head, skb, start);
 			} else {
 				sum_tiny += range_truesize;
 				if (sum_tiny > sk->sk_rcvbuf >> 3)
@@ -6113,8 +6137,7 @@ static int tcp_prune_queue(struct sock *sk, const struct sk_buff *in_skb)
 		if (!skb_queue_empty(&sk->sk_receive_queue))
 			tcp_collapse(sk, &sk->sk_receive_queue, NULL,
 				     skb_peek(&sk->sk_receive_queue),
-				     NULL,
-				     tp->copied_seq, tp->rcv_nxt);
+				     NULL, tp->copied_seq);
 
 		if (tcp_can_ingest(sk, in_skb))
 			return 0;
-- 
2.56.1.708.g77570a6a1d-goog


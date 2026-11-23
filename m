Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450859;
	b=SOQ8IafTe2jTOtYPzNQVnsBAUEUAfy/Jp2S1lo5UJE9kX2UyJk8s0SCtPh1+Y5VTTHoq
	 8Yvcw6ucb8/av570C30/kiTHDaZs/hO/US8wjGyc2buDW1CdgNadV0IUGS50ta6uHzOzU
	 06mtYj8dCKoeh+kYULletIOaR2rmqFVcio36VWTi6cgGftUQopShVzYbBLxlhOBsDl55y
	 zEI9rnZTBxunH+WPnIkuClHC+1PQcLMpmE4WG9XJS+bBMdzX8pIWYPbLcwLXNokzzMqIR
	 +ifhhT/CplVreNe2+wbWUTJBehDuTFdY6LJdhF+3UI3+tCgmDpwwsqbJja4W7MrBvCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TmIqF2P+q9U9cgliLZiOfFZM/Y8lVSOb4Gor7gRVsNo=;
	b=eKcdGN4lLzNMEa3g6M20O9/AzXhsuDaUDHgqMwVx01Vvkc145EowDyec3FYVC3xSzYxA
	 1TVBI8R3rTmMLtLR6aKs+2qOMaa4H+iGIk5b+XqLLAogiiR9ehmnHJEBaaZUvoLKRkeqE
	 +N/EbPBj4CdV84qyEf5zY2jgxwRKzVkfM0GI3U5E3uG7XNj42VIPnwN08Ecg4V3Sgas5R
	 QPs067VkDnrHgEAJgs+UNC8HjeWyH4NPKvkgdOWvEboq+K9WbU7LTv5HuS7PTKQdm5qUm
	 kkHvpdzXzJXjnrMAtuUf0TLiEqxlbJl1NMU4t9oOl4WHac41BhbvRDWG4h0GQYLjjmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=qHymQqd0;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7704606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7704606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=qHymQqd0
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1413699a12.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795450858; x=1796055658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmIqF2P+q9U9cgliLZiOfFZM/Y8lVSOb4Gor7gRVsNo=;
        b=qHymQqd0/i0YItsh/QqpxsPKuDvRtMW8NOUow+cSgJ0p9ERNJDmHCgGyAPyJBaBDvX
         P/111zZmpkintMA5aplYksG7DA5/fXTc304/HR0OXBZUJ7zu1suC/zQ5WNlf63P7b4b/
         EtdmfnbmlW+w7deUo8W0UC7+25+gvMLgv0iwmNcnX7ICH6P8gEKTgH6tdjUtWdZM6X9A
         41tIy70YYYYQVE8ysWHz2w6ldN74ubJwNHw28XkUtxYNpaZFQ/tFdaOHjEkTD+q+5Ims
         BKQa9Nzb684zAcw/u9ncvxcdlOc+v/rmu1f4G0+w7V7r1mpHsd4VwAS5+hOy/4XpJ137
         YLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450858; x=1796055658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmIqF2P+q9U9cgliLZiOfFZM/Y8lVSOb4Gor7gRVsNo=;
        b=KopbGMA6LgNE0hRwCK3zeWzvwG8BlcDeqlv6UsoeAkPKpyNVUxZudb6YJXC0yFbLmF
         ZQLgFYL8APfCUGezGMl9BTfE9jX2S1JoNlO2rdMjNXoRaLBwqC+gLEuFkIad+4p3w6d4
         KODv7KNLzKUsBHKuPZ3tGRjWy5eg01S8ZqxiHy1K0ffn/vAHTTyOgMj4igYYMsJ6Hr+O
         6bQvTrKbKm/INwaQ3hB8u5GZbDM+eIePUlhzxjsTqfjaMo2lgqZnJj8UFOwNdDUeHkfh
         bZmR2BL9r5+DDsLQccKUw55CnuwxqgU0u9il4Kh17aLQcLqbvbN9yDAA0DUhjSk+vgYd
         EV/Q==
X-Gm-Message-State: APuU4Z/zE2nO3VF1YofaDno7yKTJDMOzfqeEDB0piZCy3mPsP3Zyx03m
	VzaHeKco1wu95p/QgHy0gv+SNsBCP1JwwbXy242U+CuE2km/0AnHlbkd814wwi53cAI2B1Fkupa
	3AtBEp5shVVU=
X-Gm-Gg: AZFdTZdr9DpukmPdXvCXmr7+3In40qya8mikVvSzBOEKHBqufzU6Dm65r74anWW8wJx
	UhtCPDZCtSLGL4d7CNYMpIH5v0T1zTF1s0ACpI8d46xhXgKu4KI8+9alEmBowsKZorFeMSp61Kq
	QFESZeuHjvBCvGXEg7XXw9bsUxmDNEzm1+xemTj+IJNqFPnQP5fVulg39PGuRGBwibc+jI/e2lF
	hGN2sci0IPjHj9hpOSxIGFx+41unjYX5AIUafnE581GStXMDAWH1ccl8X5pkroItI6joR9CoLJZ
	RHMWLs4n5ifqJnnO2eZ707tBvqMRNA/m+UX5Ss3YqUqZL2VrO+E8kts+6CdiuqepTA1hu03NIeN
	Cj9vcuSNB9+J3oUTsAlt8yxnPQ8Fpd2ZV570nxCxihhWdiG02ffXDZog2ftyYRZbn+fH71lACXZ
	IZTJhyWp7AOXgNFFvlVnOAT7vOMRgammAqbGDYH9Vt1XA9Nu7RarrUg3/7ZDp3Oz7Oia5g1JjSO
	lkL5KY47Voxkr5YRhuraRlj/ib1RsBy/X2LXqOh05CDy9ANkwRzDAEr/ePFnfK3Xj7/ddENy68L
	7+ZTNWJehmvZNJyLbD8lmRMbx464fLI6ipYMYSFOoujtEhezoUc2iO0N6NVa
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr11455580a91.37.1795450857933;
        Mon, 23 Nov 2026 08:20:57 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([191.223.218.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm21350633a91.14.2026.11.23.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:20:57 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: netdev@vger.kernel.org,
	edumazet@kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	gnault@redhat.com,
	kuniyu@google.com,
	michael.bommarito@gmail.com,
	alice.kernel@fastmail.im,
	nicoyip.dev@gmail.com,
	hengyul@cs.unc.edu,
	jchapman@katalix.com,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net v2] l2tp: bound the reorder queue
Date: Tue, 24 Nov 2026 00:20:51 +0800
Message-ID: <ccbcb9ac392bc81663a7a14691058b3f03eac3c0.1795437306.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Ruide Cao <caoruide123@gmail.com>

The receive-window check accepts every sequence number in the large
window. If the peer omits the expected packet, distinct future packets
can therefore fill the ordered reorder queue. Since insertion walks the
queue and expiration was checked only while receiving another packet,
this allowed unbounded memory and CPU use.

Reject duplicate sequence numbers and cap the reorder queue at 64
packets. Packets beyond the cap are discarded, except that the expected
sequence number is admitted so an in-order packet can drain the queue.
The no-reorder tail-enqueue path uses the same exception, and also
admits a sequenced recovery packet once reorder_skip is set. That
exception is limited to a single extra slot and is refused when the
queue head cannot be dequeued, so a stalled head cannot grow the
queue without bound. Advance session->nr under the reorder queue lock
when unlinking a sequenced skb, so the cap checks observe a consistent
expected sequence number. Declare the dequeued flag first in
l2tp_recv_dequeue() to follow reverse xmas tree.

The existing timeout recovery then skips a missing sequence number when
the queue limit is reached.

Use a session timer to run the existing dequeue path at the head
expiration and shut it down before purging a session. This bounds the
queue and services expiration even when the peer stops sending.

Insert into the reorder queue by walking from the tail so an in-order
packet after a gap does not scan the queue from the head. Compare
sequence numbers only for skbs with has_seq set, and use modular
comparison in the 16-bit or 24-bit space so wrap-around is handled.
Refuse enqueue once session->dead is set under the queue lock, and
purge the queue again in l2tp_session_free() so an in-flight receive
path cannot leak an skb after the deletion purge.

Fixes: 3557baabf280 ("[L2TP]: PPP over L2TP driver core")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>

---
Changes in v2:
- Insert in-order-after-gap packets by walking the reorder queue from
  the tail, as suggested by Eric Dumazet, so insertion does not always
  scan from the head.
- Compare Ns only when has_seq is set, and use modular comparison in
  the L2TPv2 16-bit / L2TPv3 24-bit sequence space instead of a raw
  '>' check.
- Check session->dead under reorder_q.lock at the enqueue sites, and
  purge the queue again in l2tp_session_free(), so an in-flight receive
  path cannot leak an skb after timer_shutdown_sync() and the deletion
  purge.
- Advance session->nr under reorder_q.lock when unlinking a sequenced
  skb, so the full-queue expected-Ns exception cannot race with dequeue.
- On the no-reorder tail path, admit one sequenced expected or recovery
  packet when the queue is at the cap, but only if the head can be
  dequeued. Further packets are rejected until dequeue makes progress,
  so a stalled head cannot bypass the cap.
- Declare the dequeued flag first in l2tp_recv_dequeue() to follow
  reverse xmas tree.
- Keep dropping non-expected packets when the queue is full; that is
  the cap. After the head times out, reorder_skip lets the queue drain.
- Leave the dequeue-timer dst lifetime unchanged: teardown already
  uses timer_shutdown_sync() and a second purge, and this path does
  not dereference dst on its own.
- Leave concurrent timer and receive dequeue otherwise unchanged;
  the Nr race is fixed by updating session->nr under the queue lock.
- Leave the l2tp_recv_data_seq() return-value comment unchanged; a
  rejected skb stays with the caller and is freed on the discard path.
- Leave timer rearming unchanged if reorder_timeout is shortened at
  runtime; a tighter deadline is left for a follow-up.
- v1 link:
  https://lore.kernel.org/netdev/cover.1790136447.git.caoruide123@gmail.com/
---
 net/l2tp/l2tp_core.c | 136 +++++++++++++++++++++++++++++++++++++------
 net/l2tp/l2tp_core.h |   2 +
 2 files changed, 121 insertions(+), 17 deletions(-)

diff --git a/net/l2tp/l2tp_core.c b/net/l2tp/l2tp_core.c
index 0cd3e38bf662..42900c3cff63 100644
--- a/net/l2tp/l2tp_core.c
+++ b/net/l2tp/l2tp_core.c
@@ -82,6 +82,7 @@
 #define L2TP_SL_SEQ_MASK   0x00ffffff
 
 #define L2TP_HDR_SIZE_MAX		14
+#define L2TP_REORDER_MAX_QUEUE	64
 
 /* Default trace flags */
 #define L2TP_DEFAULT_DEBUG_FLAGS	0
@@ -166,9 +167,13 @@ static void l2tp_tunnel_free(struct l2tp_tunnel *tunnel)
 	kfree_rcu(tunnel, rcu);
 }
 
+static void l2tp_session_queue_purge(struct l2tp_session *session);
+
 static void l2tp_session_free(struct l2tp_session *session)
 {
 	trace_free_session(session);
+	/* Catch a post-purge enqueue from an in-flight receive path. */
+	l2tp_session_queue_purge(session);
 	if (session->tunnel)
 		l2tp_tunnel_put(session->tunnel);
 	kfree_rcu(session, rcu);
@@ -636,30 +641,104 @@ EXPORT_SYMBOL_GPL(l2tp_session_register);
  * Receive data handling
  *****************************************************************************/
 
+/* True if sequence number a precedes b in the 16-bit (L2TPv2) or
+ * 24-bit (L2TPv3) sequence space.
+ */
+static bool l2tp_seq_before(const struct l2tp_session *session, u32 a, u32 b)
+{
+	u32 dist = (b - a) & session->nr_max;
+
+	return dist && dist <= session->nr_max / 2;
+}
+
 /* Queue a skb in order. We come here only if the skb has an L2TP sequence
- * number.
+ * number. Walk from the tail so an in-order packet after a gap is not
+ * inserted by scanning the whole queue from the head.
  */
 static void l2tp_recv_queue_skb(struct l2tp_session *session, struct sk_buff *skb)
 {
 	struct sk_buff *skbp;
-	struct sk_buff *tmp;
 	u32 ns = L2TP_SKB_CB(skb)->ns;
+	bool saw_seq = false;
 
 	spin_lock_bh(&session->reorder_q.lock);
-	skb_queue_walk_safe(&session->reorder_q, skbp, tmp) {
-		if (L2TP_SKB_CB(skbp)->ns > ns) {
-			__skb_queue_before(&session->reorder_q, skbp, skb);
-			atomic_long_inc(&session->stats.rx_oos_packets);
+	if (test_bit(0, &session->dead)) {
+		kfree_skb(skb);
+		goto out;
+	}
+	if (skb_queue_len(&session->reorder_q) >= L2TP_REORDER_MAX_QUEUE &&
+	    ns != session->nr) {
+		atomic_long_inc(&session->stats.rx_seq_discards);
+		atomic_long_inc(&session->stats.rx_errors);
+		kfree_skb(skb);
+		goto out;
+	}
+
+	skb_queue_reverse_walk(&session->reorder_q, skbp) {
+		if (!L2TP_SKB_CB(skbp)->has_seq)
+			continue;
+		if (unlikely(L2TP_SKB_CB(skbp)->ns == ns)) {
+			atomic_long_inc(&session->stats.rx_seq_discards);
+			atomic_long_inc(&session->stats.rx_errors);
+			kfree_skb(skb);
 			goto out;
 		}
+		if (l2tp_seq_before(session, L2TP_SKB_CB(skbp)->ns, ns)) {
+			__skb_queue_after(&session->reorder_q, skbp, skb);
+			if (saw_seq)
+				atomic_long_inc(&session->stats.rx_oos_packets);
+			goto out;
+		}
+		saw_seq = true;
 	}
 
-	__skb_queue_tail(&session->reorder_q, skb);
+	if (saw_seq)
+		atomic_long_inc(&session->stats.rx_oos_packets);
+	__skb_queue_head(&session->reorder_q, skb);
 
 out:
 	spin_unlock_bh(&session->reorder_q.lock);
 }
 
+static bool l2tp_recv_queue_tail_skb(struct l2tp_session *session,
+				     struct sk_buff *skb)
+{
+	struct l2tp_skb_cb *cb = L2TP_SKB_CB(skb);
+	struct l2tp_skb_cb *hcb;
+	struct sk_buff *head;
+	unsigned int qlen;
+
+	spin_lock_bh(&session->reorder_q.lock);
+	if (test_bit(0, &session->dead))
+		goto reject;
+	/* Admit one expected or recovery packet when the queue is at
+	 * the cap, but only if the head can be dequeued. Further
+	 * packets are rejected until dequeue makes progress.
+	 */
+	qlen = skb_queue_len(&session->reorder_q);
+	if (qlen >= L2TP_REORDER_MAX_QUEUE) {
+		if (qlen > L2TP_REORDER_MAX_QUEUE)
+			goto reject;
+		if (!(cb->has_seq &&
+		      (cb->ns == session->nr || session->reorder_skip)))
+			goto reject;
+
+		head = skb_peek(&session->reorder_q);
+		hcb = L2TP_SKB_CB(head);
+		if (!time_after(jiffies, hcb->expires) &&
+		    hcb->has_seq && !session->reorder_skip &&
+		    hcb->ns != session->nr)
+			goto reject;
+	}
+	__skb_queue_tail(&session->reorder_q, skb);
+	spin_unlock_bh(&session->reorder_q.lock);
+	return true;
+
+reject:
+	spin_unlock_bh(&session->reorder_q.lock);
+	return false;
+}
+
 /* Dequeue a single skb.
  */
 static void l2tp_recv_dequeue_skb(struct l2tp_session *session, struct sk_buff *skb)
@@ -677,13 +756,6 @@ static void l2tp_recv_dequeue_skb(struct l2tp_session *session, struct sk_buff *
 	atomic_long_inc(&session->stats.rx_packets);
 	atomic_long_add(length, &session->stats.rx_bytes);
 
-	if (L2TP_SKB_CB(skb)->has_seq) {
-		/* Bump our Nr */
-		session->nr++;
-		session->nr &= session->nr_max;
-		trace_session_seqnum_update(session);
-	}
-
 	/* call private receive handler */
 	if (session->recv_skb)
 		(*session->recv_skb)(session, skb, L2TP_SKB_CB(skb)->length);
@@ -696,6 +768,7 @@ static void l2tp_recv_dequeue_skb(struct l2tp_session *session, struct sk_buff *
  */
 static void l2tp_recv_dequeue(struct l2tp_session *session)
 {
+	bool dequeued = false;
 	struct sk_buff *skb;
 	struct sk_buff *tmp;
 
@@ -715,6 +788,7 @@ static void l2tp_recv_dequeue(struct l2tp_session *session)
 			trace_session_pkt_expired(session, cb->ns);
 			session->reorder_skip = 1;
 			__skb_unlink(skb, &session->reorder_q);
+			dequeued = true;
 			kfree_skb(skb);
 			continue;
 		}
@@ -729,6 +803,16 @@ static void l2tp_recv_dequeue(struct l2tp_session *session)
 				goto out;
 		}
 		__skb_unlink(skb, &session->reorder_q);
+		dequeued = true;
+
+		/* Advance Nr under the queue lock so the enqueue cap
+		 * checks observe a consistent expected sequence number.
+		 */
+		if (cb->has_seq) {
+			session->nr++;
+			session->nr &= session->nr_max;
+			trace_session_seqnum_update(session);
+		}
 
 		/* Process the skb. We release the queue lock while we
 		 * do so to let other contexts process the queue.
@@ -739,9 +823,22 @@ static void l2tp_recv_dequeue(struct l2tp_session *session)
 	}
 
 out:
+	if (skb_queue_empty(&session->reorder_q))
+		timer_delete(&session->reorder_timer);
+	else if (dequeued || !timer_pending(&session->reorder_timer))
+		timer_reduce(&session->reorder_timer,
+			     L2TP_SKB_CB(skb_peek(&session->reorder_q))->expires);
 	spin_unlock_bh(&session->reorder_q.lock);
 }
 
+static void l2tp_recv_dequeue_timer(struct timer_list *timer)
+{
+	struct l2tp_session *session = timer_container_of(session, timer,
+							 reorder_timer);
+
+	l2tp_recv_dequeue(session);
+}
+
 static int l2tp_seq_check_rx_window(struct l2tp_session *session, u32 nr)
 {
 	u32 nws;
@@ -783,7 +880,8 @@ static int l2tp_recv_data_seq(struct l2tp_session *session, struct sk_buff *skb)
 	 * sequence number to re-enable packet reception.
 	 */
 	if (cb->ns == session->nr) {
-		skb_queue_tail(&session->reorder_q, skb);
+		if (!l2tp_recv_queue_tail_skb(session, skb))
+			goto discard;
 	} else {
 		u32 nr_oos = cb->ns;
 		u32 nr_next = (session->nr_oos + 1) & session->nr_max;
@@ -802,7 +900,8 @@ static int l2tp_recv_data_seq(struct l2tp_session *session, struct sk_buff *skb)
 			trace_session_pkt_oos(session, cb->ns);
 			goto discard;
 		}
-		skb_queue_tail(&session->reorder_q, skb);
+		if (!l2tp_recv_queue_tail_skb(session, skb))
+			goto discard;
 	}
 
 out:
@@ -991,7 +1090,8 @@ void l2tp_recv_common(struct l2tp_session *session, struct sk_buff *skb,
 		 * reorder queue. This ensures that it will be
 		 * delivered after all previous sequenced skbs.
 		 */
-		skb_queue_tail(&session->reorder_q, skb);
+		if (!l2tp_recv_queue_tail_skb(session, skb))
+			goto discard;
 	}
 
 	/* Try to dequeue as many skbs from reorder_q as we can. */
@@ -1760,6 +1860,7 @@ static void l2tp_session_del_work(struct work_struct *work)
 						    del_work);
 
 	l2tp_session_unhash(session);
+	timer_shutdown_sync(&session->reorder_timer);
 	l2tp_session_queue_purge(session);
 	if (session->session_close)
 		(*session->session_close)(session);
@@ -1810,6 +1911,7 @@ struct l2tp_session *l2tp_session_create(int priv_size, struct l2tp_tunnel *tunn
 			tunnel->tunnel_id, session->session_id);
 
 		skb_queue_head_init(&session->reorder_q);
+		timer_setup(&session->reorder_timer, l2tp_recv_dequeue_timer, 0);
 
 		session->hlist_key = l2tp_v3_session_hashkey(tunnel->sock, session->session_id);
 		INIT_HLIST_NODE(&session->hlist);
diff --git a/net/l2tp/l2tp_core.h b/net/l2tp/l2tp_core.h
index 25ae4c25d3ef..bf403598fff8 100644
--- a/net/l2tp/l2tp_core.h
+++ b/net/l2tp/l2tp_core.h
@@ -4,6 +4,7 @@
  * Copyright (c) 2008,2009 Katalix Systems Ltd
  */
 #include <linux/refcount.h>
+#include <linux/timer.h>
 
 #ifndef _L2TP_CORE_H_
 #define _L2TP_CORE_H_
@@ -80,6 +81,7 @@ struct l2tp_session {
 	u32			nr;		/* session NR state (receive) */
 	u32			ns;		/* session NR state (send) */
 	struct sk_buff_head	reorder_q;	/* receive reorder queue */
+	struct timer_list	reorder_timer;
 	u32			nr_max;		/* max NR. Depends on tunnel */
 	u32			nr_window_size;	/* NR window size */
 	u32			nr_oos;		/* NR of last OOS packet */

base-commit: ad2c7240a3981fd5f0142b61ca913b02ab476ede
-- 
2.47.3


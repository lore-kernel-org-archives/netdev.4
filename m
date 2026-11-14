Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671526;
	b=EqGxRHY7BLijkpbFjEY/fVBqUwfExAQfZkemP7bpAwa4apYg1xmolayl8c5PPark4bhY
	 5H0TQ1iERTerb2DhOrikFV1q1n31KVeJjVAzyiwG8ZLdspeJMPR/Tjgh+XRmeyAV5R3Dm
	 oH2JHbZmR4yx66hmpF+y0K9HhoqqEDI3xbpDfKYr4qSIzQicKgWnS0hB67SKBeHk5MGMi
	 donKkIWIUzcN3v3A+DBGNuhnihg1M9hp4QOPpVWN8p0SJURTutzkFGxRI5PTQj1xIfjI8
	 xs7LTHdQSdmM+Pm5R/WVBop/77nyW5Z57qXXLvFsmLFdnDOOgCWEiwHHjir1XX0MENw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671526;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=trLit4WWJU1/jK213I9DjXIFi2mSTx2I/eZJLSxqL5E=;
	b=b3zt6mlgAgGSBxCNNOjX8jIBrqnuIK8PsIfTshe6HIEfQc0i55i8Udj3MlF579TK6xWw
	 9T4cJ2CABhIvMg/2Q6xzGZL1tsnPPKUoTYxHRXp3fKjbrr5wfXYLgbr+fuSkioz4KRlO4
	 dZzjj4d6fwLz9KI1FeU4kFQqeLmQbgqjQUWmxGsqE2sWl25GsBBNzQ2BKsr6G7FT4FShR
	 Ijbe8YkeOGwEvFJBOZQgPRiiOfydiv5HYKamnWIGHaj1YPnUbPhY2YZYjvTMV9Vpb3E7q
	 p49ET1PR/Kf7U05u6n7OyP6EYtDaf8PV7d0M9y9WuBw5CdRIYXS93q0XZwqUB6pYQrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LwuJ15wd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18574606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LwuJ15wd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637F11F000C4;
	Sat, 14 Nov 2026 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671525;
	bh=trLit4WWJU1/jK213I9DjXIFi2mSTx2I/eZJLSxqL5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LwuJ15wdOwJyXBMhPowTDRpYmhCFlRCtwC7hrm65Xc2dnSlU9AnB55n6s/FjSTMpV
	 zmtF2roBhGlMBzc9L+2iOAnMjQ/mU9fLaxzGYrKiqlpIyJ/CqytHQXzGwtbTNdRLCl
	 FwaKzh8hJ1N85Kf5/bwTdHVw/onB9sI8oPYOMIU8MCLhB+8FbaAnO7ZC5NJrTTvfCe
	 vRaSx8yDZROFzMk7N2u3+DYpW2WLFGiys8EzjIiNEXfZhoMYfX7cZ3tJNdc8Gbwu0g
	 jmek1YAnjEcn6Aip9G6iw12cteJNmbRmS4Rw3U05tNvUvWVFivOCbj4qmNQ9NnCix9
	 Yt+/F2Ds29DYw==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next 3/5] tcp: use SKB_DROP_REASON_SOCKET_RCVBUFF when over sk_rcvbuf
Date: Sat, 14 Nov 2026 16:51:48 +0100
Message-ID: <20261114155150.235743-4-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114155150.235743-1-edumazet@kernel.org>
References: <20261114155150.235743-1-edumazet@kernel.org>
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

tcp_data_queue() and tcp_data_queue_ofo() use SKB_DROP_REASON_PROTO_MEM
for all packets that can not be queued, whether the socket is over its
receive buffer, or the protocol memory limits (tcp_mem) are reached.

Make tcp_try_rmem_schedule() return a drop reason:

- SKB_DROP_REASON_SOCKET_RCVBUFF when the socket is over sk_rcvbuf,
  as already used by UDP and sock_queue_rcv_skb().

- SKB_DROP_REASON_PROTO_MEM when sk_rmem_schedule() fails.

This helps to identify peers repeatedly sending segments that can not
be queued, with tools like drop monitor or perf.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv4/tcp_input.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 80f8f262bc44..2d8f224f9bf0 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5400,21 +5400,28 @@ static bool tcp_can_ingest(const struct sock *sk, const struct sk_buff *skb)
 	return rmem <= sk->sk_rcvbuf;
 }
 
-static int tcp_try_rmem_schedule(struct sock *sk, const struct sk_buff *skb,
-				 unsigned int size)
+/* Return SKB_NOT_DROPPED_YET if @skb can be queued, or the drop reason. */
+static enum skb_drop_reason
+tcp_try_rmem_schedule(struct sock *sk, const struct sk_buff *skb,
+		      unsigned int size)
 {
-	if (!tcp_can_ingest(sk, skb) ||
-	    !sk_rmem_schedule(sk, skb, size)) {
+	enum skb_drop_reason reason;
 
-		if (tcp_prune_queue(sk, skb) < 0)
-			return -1;
+	if (!tcp_can_ingest(sk, skb))
+		reason = SKB_DROP_REASON_SOCKET_RCVBUFF;
+	else if (!sk_rmem_schedule(sk, skb, size))
+		reason = SKB_DROP_REASON_PROTO_MEM;
+	else
+		return SKB_NOT_DROPPED_YET;
 
-		while (!sk_rmem_schedule(sk, skb, size)) {
-			if (!tcp_prune_ofo_queue(sk, skb))
-				return -1;
-		}
+	if (tcp_prune_queue(sk, skb) < 0)
+		return reason;
+
+	while (!sk_rmem_schedule(sk, skb, size)) {
+		if (!tcp_prune_ofo_queue(sk, skb))
+			return SKB_DROP_REASON_PROTO_MEM;
 	}
-	return 0;
+	return SKB_NOT_DROPPED_YET;
 }
 
 /* Credit the memory added to the receive queues since @rmem was sampled
@@ -5434,6 +5441,7 @@ static void tcp_collapse_credit_add(struct sock *sk, int rmem)
 static void tcp_data_queue_ofo(struct sock *sk, struct sk_buff *skb)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
+	enum skb_drop_reason reason;
 	struct rb_node **p, *parent;
 	struct sk_buff *skb1;
 	u32 seq, end_seq;
@@ -5443,10 +5451,11 @@ static void tcp_data_queue_ofo(struct sock *sk, struct sk_buff *skb)
 	tcp_save_lrcv_flowlabel(sk, skb);
 	tcp_data_ecn_check(sk, skb);
 
-	if (unlikely(tcp_try_rmem_schedule(sk, skb, skb->truesize))) {
+	reason = tcp_try_rmem_schedule(sk, skb, skb->truesize);
+	if (unlikely(reason)) {
 		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPOFODROP);
 		READ_ONCE(sk->sk_data_ready)(sk);
-		tcp_drop_reason(sk, skb, SKB_DROP_REASON_PROTO_MEM);
+		tcp_drop_reason(sk, skb, reason);
 		return;
 	}
 	/* Sampled after tcp_try_rmem_schedule(), which can prune. */
@@ -5716,7 +5725,8 @@ static void tcp_data_queue(struct sock *sk, struct sk_buff *skb)
 
 		/* Ok. In sequence. In window. */
 queue_and_out:
-		if (tcp_try_rmem_schedule(sk, skb, skb->truesize)) {
+		reason = tcp_try_rmem_schedule(sk, skb, skb->truesize);
+		if (reason) {
 			/* TODO: maybe ratelimit these WIN 0 ACK ? */
 			inet_csk(sk)->icsk_ack.pending |=
 					(ICSK_ACK_NOMEM | ICSK_ACK_NOW);
@@ -5724,7 +5734,6 @@ static void tcp_data_queue(struct sock *sk, struct sk_buff *skb)
 			READ_ONCE(sk->sk_data_ready)(sk);
 
 			if (skb_queue_len(&sk->sk_receive_queue) && skb->len) {
-				reason = SKB_DROP_REASON_PROTO_MEM;
 				NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPRCVQDROP);
 				goto drop;
 			}
-- 
2.53.0


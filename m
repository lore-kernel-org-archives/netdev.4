Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654773;
	b=IqeRxmJye8/GO41eZBN0xCcMxify1BK0GpOdEr0WJfwWGPM0rDh/94sPoldBwa61tbaM
	 Gnkfn6LAopwZsWViv3htaXsuEsdK6D952tYYs5EHXGlD6ME9JmPDINgJPDkhLi+hQnZYq
	 LtYiF9BkoqEQTj6vQf04p1UKrLM/NhNivBc67LUuYwrUo2tB+YfyLiSfNAU+8rnqLYu8y
	 jYpwmC0/vpEVlizyMjTvdnt0Yo9QnkqtRuoKt1gH1LFpved6Rn+XLlnYM4t9cba/fVEVa
	 iMnBiGlC+8AJmnUrpqF7cC/Rj04FKG2Z82NZavPMXStgdswkVLaXwGUBkWSbtxan9Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654773;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8QXVtF48z1Zaj9v2yxtVx7PI2wxT1CnV6yf8WI+jot8=;
	b=epl6M0w0YpfzNET8xP8j2fNajzXwdG7w4cFRrbKnLW5Mzec2cTA2fk4NovGYtpHd4qzF
	 /1yx1pN4JENkgDaKgeKCXEatiFhI4i3G3xTh7WOeSrJq8rxXUFkqURMe8Z9o7YCHNTxel
	 KVZNy+ekJucoaOCM0uCSrtPO4J2IyxIBMmTNFhcEQWux6PxPhiO2DHRFuNkLZIcAL5YxH
	 4Lx7ikm94E+PW45QpG97Zf1IVcO++HuBhe39RgeuWiddNSn4Y2r0EOhoFG244izOsWLCu
	 tRpYv/Wd5BHO/mXdcXy5HAnIYlhJrN3cCYvV6DcjE4KROso9+Z6INsM89jS2XNB5Jdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKwigTuB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0147606A88A
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKwigTuB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317C71F000C4;
	Sat, 14 Nov 2026 11:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794654773;
	bh=8QXVtF48z1Zaj9v2yxtVx7PI2wxT1CnV6yf8WI+jot8=;
	h=From:To:Cc:Subject:Date;
	b=kKwigTuBWWHo44pmQ/erafNT3N/45nfr1tp5z6D4kFOgHmq+wJmyKTLP3M8EvrFXS
	 0CDXM9U3oXxEKCgpv24vXC4qKztOSX+o0s6U0d72a8gDQQnb+IIDF8yJAKhGiSb0s1
	 KjAwgGgLZn+4fD1Xo6WRj7UpX82NHKK06h6ErC/XApKE2M+vobqrgRqAm/cRtDOTIq
	 JLSj0hGysXm4cJIxr6OlA5F3wv1iTPMds/Cr3Qc+gOppjUiJXakiSCEIZfq6E3tSKu
	 DhNSmvoNp95FWnbhj6YIxpr9Fusyu70g31qm//sc00uKPJm6UFOvvQ/pRQqBEEcv+c
	 YWC0sV+F25spQ==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Neal Cardwell <ncardwell@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Sashiko AI review <netdev-bot+sashiko@kernel.org>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH net] tcp: purge Fast Open RST queue when listen() fails
Date: Sat, 14 Nov 2026 12:12:47 +0100
Message-ID: <20261114111247.21995-1-edumazet@kernel.org>
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

inet_csk_listen_start() moves the socket to TCP_LISTEN before calling
->get_port() and ->hash(). If one of them fails, the socket goes back
to TCP_CLOSE without going through inet_csk_listen_stop().

If the socket was a Fast Open listener in a previous life, and was
stopped with shutdown(SHUT_RD) or connect(AF_UNSPEC) while an accepted
Fast Open child was still in TCP_SYN_RECV state, the request_sock of
this child still points to the listener.

A valid RST received for this child while the listener is transiently
in TCP_LISTEN state makes reqsk_fastopen_remove() queue the
request_sock in rskq_rst_head. When listen() fails, for instance with
-EADDRINUSE because another SO_REUSEADDR socket started listening on
the same port, nothing reclaims it:

- __tcp_close(), tcp_disconnect() and tcp_abort() only call
  inet_csk_listen_stop() for sockets in TCP_LISTEN state.

- A later successful listen() overwrites rskq_rst_head in
  reqsk_queue_alloc().

The request_sock is leaked, together with the reference it holds
on the listener.

Move the rskq_rst_head purge to a helper, and call it from the
inet_csk_listen_start() error path as well, after the socket state
has been set back to TCP_CLOSE: reqsk_fastopen_remove() checks
sk_state under fastopenq.lock, so it either queued the request before
the purge acquires the lock, or does not queue it at all.

Reported-by: Sashiko AI review <netdev-bot+sashiko@kernel.org>
Closes: https://lore.kernel.org/netdev/179450310167.2199510.18107423940014989443@kernel.org/
Fixes: 0536fcc039a8 ("tcp: prepare fastopen code for upcoming listener changes")
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
Cc: Hyunwoo Kim <imv4bel@gmail.com>
---
 net/ipv4/inet_connection_sock.c | 35 ++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
index ca3057192e6d..c33b0095468a 100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1331,6 +1331,22 @@ static int inet_ulp_can_listen(const struct sock *sk)
 	return 0;
 }
 
+/* Free all the reqs queued in rskq_rst_head. */
+static void reqsk_fastopen_purge_rst(struct request_sock_queue *queue)
+{
+	struct request_sock *next, *req;
+
+	spin_lock_bh(&queue->fastopenq.lock);
+	req = queue->fastopenq.rskq_rst_head;
+	queue->fastopenq.rskq_rst_head = NULL;
+	spin_unlock_bh(&queue->fastopenq.lock);
+	while (req != NULL) {
+		next = req->dl_next;
+		reqsk_put(req);
+		req = next;
+	}
+}
+
 static void reqsk_queue_alloc(struct request_sock_queue *queue)
 {
 	queue->fastopenq.rskq_rst_head = NULL;
@@ -1373,6 +1389,12 @@ int inet_csk_listen_start(struct sock *sk)
 	}
 
 	inet_sk_set_state(sk, TCP_CLOSE);
+
+	/* A Fast Open child accepted before a previous shutdown() of this
+	 * listener might have queued its request in rskq_rst_head while
+	 * we were transiently in TCP_LISTEN state.
+	 */
+	reqsk_fastopen_purge_rst(&icsk->icsk_accept_queue);
 	return err;
 }
 
@@ -1477,7 +1499,7 @@ void inet_csk_listen_stop(struct sock *sk)
 {
 	struct inet_connection_sock *icsk = inet_csk(sk);
 	struct request_sock_queue *queue = &icsk->icsk_accept_queue;
-	struct request_sock *next, *req;
+	struct request_sock *req;
 
 	/* Following specs, it would be better either to send FIN
 	 * (and enter FIN-WAIT-1, it is normal close)
@@ -1533,16 +1555,7 @@ void inet_csk_listen_stop(struct sock *sk)
 		if (!has_current_bpf_ctx())
 			cond_resched();
 	}
-	/* Free all the reqs queued in rskq_rst_head. */
-	spin_lock_bh(&queue->fastopenq.lock);
-	req = queue->fastopenq.rskq_rst_head;
-	queue->fastopenq.rskq_rst_head = NULL;
-	spin_unlock_bh(&queue->fastopenq.lock);
-	while (req != NULL) {
-		next = req->dl_next;
-		reqsk_put(req);
-		req = next;
-	}
+	reqsk_fastopen_purge_rst(queue);
 	WARN_ON_ONCE(sk->sk_ack_backlog);
 }
 
-- 
2.53.0


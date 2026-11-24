Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501596;
	b=eGZtoR/nFmqB7cCztfjBV+/nXx9s0JKnTRxBqezze3Y0odHTJLCYbQj5WJNhqOBcyYOF
	 pKWaDgnkqofjrY3CQxVR4wMmw1giViKrippvQBnFo53W90Sg6AvLW9whaRXbzs4OSfe5v
	 kY9z4glNGvrO9QOKdpNdZruBO0DQhCwKTnclJZNil78auUnL3bDjb1mSWCcvqUzNLL7vb
	 sMUjLdBC95mB43ut/0fPPYKnuNw5kJfDCAwDmXqd72zFczQxGWJn6PC07bi/ZndYKBvMw
	 f4GmeFJdwa0Iiw3El2HkQIwTzz54Ed/kMBTE9sPnFCMZU3dJQ99fJMfJ/z3vQx0MaSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501596;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UToQbuNcK5DCGtMPsmz26BXf75Fd4f2y7nwL39lM1lI=;
	b=BnYtwELndiDRRjP1Ob/4arMNvv/8RkolWYYZafr13BNxbxIjTrm5odLgvqaBzLxPB1o4
	 NVjInc3n144OTdU16uTGGsHZ/A/gM2M4N1EhT9NYPOhgiie8P6/ynfjKD6tBscbXkFUoy
	 cYE4K00luYScMTz6NxGIxdXcu1n6UmRUwsnXTysAHHOq3jNmLZq9vihfjp+iNySi5XQUF
	 /r7rFKCJTa3lQd5r1jOy2/X6N/AkSi4rL5xFMdcCinTGNsWDXVqr2FgMES2VEQ5kpnLcn
	 fbGcuJeQmVMpofMAZdNQvD1dW6f+6/YcK7bCn9l4hEoY9e5N99ld2RcBFWO4rL49Dsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WvebJkB6;
	arc=none smtp.remote-ip=91.218.175.69
Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551B606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C551B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WvebJkB6
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=r2VL/0aEgO4eKDKOiYsncvbfGzRHrO9uCcvMnl2AXpw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795501593; v=1; x=1796106393;
 b=WvebJkB62/efEXZQD7y1khGV7+l8WGM3zC7SybX6Deyop8TyAfCayebC9D5CB5LeGu/KfTXb
 /XgSc9ru8kh3hcX5tZ31VyJERt1Z7vX6UIrgkFWc5xfXVyoAYrhMbZjI+uB56ufH1m+w4ERl69A
 j6djPIKCsEhkzcKcsaLErxyI=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 734e0f106dabc218;
	Tue, 24 Nov 2026 06:26:33 +0000
X-Mizu-Trace-ID: 734e0f106dabc218
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Florian Westphal <fw@strlen.de>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net] tcp: fix CA module refcount underflow in tcp_v4_syn_recv_sock()
Date: Tue, 24 Nov 2026 14:26:24 +0800
Message-ID: <20261124062625.264148-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

Issue found by sashiko [1].

tcp_v4_syn_recv_sock() creates the child with tcp_create_openreq_child(),
which inherits icsk->icsk_ca_ops from the listener without taking a
reference. The reference is only taken later in tcp_ca_openreq_child().
If inet_csk_route_child_sock() fails in between, we go to put_and_exit
and tcp_done() ends up in tcp_cleanup_congestion_control(), which puts
the reference unconditionally. The one dropped belongs to the listener.

Seen with a listener using bbr (built as a module) and TCP_DEFER_ACCEPT:
make the route to the client prohibited once the handshake is done, then
let the client send data.

  WARNING: kernel/module/main.c:969 at module_put.part.0+0x97/0x160, CPU#1: swapper/1/0
  Modules linked in: tcp_bbr(OE)
  RIP: 0010:module_put.part.0+0x97/0x160
  Call Trace:
   <IRQ>
   module_put+0x13/0x30
   tcp_cleanup_congestion_control+0xae/0xe0
   tcp_v4_destroy_sock+0x103/0x360
   inet_csk_destroy_sock+0xb7/0x1e0
   tcp_done+0x146/0x1e0
   tcp_v4_syn_recv_sock+0x73a/0x9f0
   tcp_check_req+0x351/0x1130
   tcp_v4_rcv+0xe82/0x22e0
   ip_protocol_deliver_rcu+0x5f/0x340
   ip_local_deliver_finish+0x19f/0x3a0
   ip_local_deliver+0xc9/0xf0
   ip_rcv+0x1b1/0x1c0
   __netif_receive_skb_one_core+0xc4/0xe0
   __netif_receive_skb+0x23/0xb0
   process_backlog+0x27a/0x950
   __napi_poll.constprop.0+0x61/0x2c0
   net_rx_action+0x372/0x800
   handle_softirqs+0x109/0x570
   </IRQ>

Options considered:
 1. Take the reference in tcp_create_openreq_child(), see the diff below
    the "---". It adds a get/put pair on the passive open path.
 2. Point the child at tcp_reno (built in, no owner) on this error path,
    so the put becomes a no-op. It works but looks odd.

Instead, clear icsk_ca_ops on this error path and make
tcp_cleanup_congestion_control() skip a socket without a CA.

[1] https://sashiko.dev/#/message/20260606095014.2531B1F00893%40smtp.kernel.org

Fixes: 81164413ad09 ("net: tcp: add per route congestion control")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
security_inet_csk_clone() -> bpf_setsockopt(TCP_CONGESTION) from a
lsm_cgroup prog has a similar problem, the child puts a reference it
never took. That one is being fixed in the bpf tree.

The root cause can be fixed as below instead, but I am worried that the
extra refcounting may hurt performance (not tested):

    diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
    --- a/net/ipv4/tcp_minisocks.c
    +++ b/net/ipv4/tcp_minisocks.c
    @@ -506,6 +506,8 @@ void tcp_ca_openreq_child(struct sock *sk, const struct dst_entry *dst)
     		rcu_read_lock();
     		ca = tcp_ca_find_key(ca_key);
     		if (likely(ca && bpf_try_module_get(ca, ca->owner))) {
    +			bpf_module_put(icsk->icsk_ca_ops,
    +				       icsk->icsk_ca_ops->owner);
     			icsk->icsk_ca_dst_locked = tcp_ca_dst_locked(dst);
     			WRITE_ONCE(icsk->icsk_ca_ops, ca);
     			ca_got_dst = true;
    @@ -514,10 +516,10 @@ void tcp_ca_openreq_child(struct sock *sk, const struct dst_entry *dst)
     	}

     	/* If no valid choice made yet, assign current system default ca. */
    -	if (!ca_got_dst &&
    -	    (!icsk->icsk_ca_setsockopt ||
    -	     !bpf_try_module_get(icsk->icsk_ca_ops, icsk->icsk_ca_ops->owner)))
    +	if (!ca_got_dst && !icsk->icsk_ca_setsockopt) {
    +		bpf_module_put(icsk->icsk_ca_ops, icsk->icsk_ca_ops->owner);
     		tcp_assign_congestion_control(sk);
    +	}

     	tcp_set_ca_state(sk, TCP_CA_Open);
     }
    @@ -590,6 +592,13 @@ struct sock *tcp_create_openreq_child(const struct sock *sk,
     	newsk->sk_txhash = READ_ONCE(treq->txhash);
     	newtp->total_retrans = req->num_retrans;

    +	/* Hold the inherited CA until tcp_ca_openreq_child() makes the choice. */
    +	if (!bpf_try_module_get(newicsk->icsk_ca_ops,
    +				newicsk->icsk_ca_ops->owner)) {
    +		WRITE_ONCE(newicsk->icsk_ca_ops, &tcp_reno);
    +		newicsk->icsk_ca_setsockopt = 0;
    +	}
    +
     	tcp_init_xmit_timers(newsk);
     	WRITE_ONCE(newtp->write_seq, newtp->pushed_seq = treq->snt_isn + 1);
---
 net/ipv4/tcp_cong.c | 3 +++
 net/ipv4/tcp_ipv4.c | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_cong.c b/net/ipv4/tcp_cong.c
index e3f462f161dd..0f99405a78b1 100644
--- a/net/ipv4/tcp_cong.c
+++ b/net/ipv4/tcp_cong.c
@@ -271,6 +271,9 @@ void tcp_cleanup_congestion_control(struct sock *sk)
 {
 	struct inet_connection_sock *icsk = inet_csk(sk);
 
+	if (!icsk->icsk_ca_ops)
+		return;
+
 	if (icsk->icsk_ca_initialized && icsk->icsk_ca_ops->release)
 		icsk->icsk_ca_ops->release(sk);
 	icsk->icsk_ca_initialized = 0;
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index f2a5c8f3bf9d..991fb249323e 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1732,7 +1732,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 	if (!dst) {
 		dst = inet_csk_route_child_sock(sk, newsk, req);
 		if (!dst)
-			goto put_and_exit;
+			goto clear_ca_and_exit;
 	} else {
 		/* syncookie case : see end of cookie_v4_check() */
 	}
@@ -1790,6 +1790,9 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 exit:
 	tcp_listendrop(sk);
 	return NULL;
+clear_ca_and_exit:
+	/* newsk holds no reference on the inherited CA yet. */
+	inet_csk(newsk)->icsk_ca_ops = NULL;
 put_and_exit:
 	newinet->inet_opt = NULL;
 	inet_csk_prepare_forced_close(newsk);
-- 
2.43.0


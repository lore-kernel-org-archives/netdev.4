Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796658;
	b=FYAxX91QpVu8r5D2qiWEzpM/OQ3f1BIK7TZ5kPU3x8aM2TwChGLu9NSm1DAUpiMOydWS
	 fkFGb57f4zK2ezMy84rLrCm3FhREyjKoVZd6MKc7kRmjg9AE66zSYCUv+mb1fNZolidIN
	 QunHVjt8CpOMeN3R1EIfDNDJsh75Uh8AHovBoWoXU3XTSFihffEyRdgPmMAYQmx1/w5Oy
	 kLs+Ui/HNjXXQn6gZI1LTtH9kUbLjEHppj0a+o380Y/wEGoOZpA+T+23tpnMGpcadtJO2
	 eejMXNJiU3VeJew2cVRp1XLffkSx9Y59E2Qf3DeU2AqsPpJS6Hn34qRHKDu1tJr0o2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1DE1zx2VFa9qUd9Uu0O8FBnLLNz1IzGMo61cjsDi4Ak=;
	b=17f7P3TMzDtC6/+JhKK77ohHBQbwdJVnMKU2PCdoaPIKRGeMLttPIb7mUquY6xBHKWFG
	 rTX8Aut/aex6OrC8KN/aRIL/MvR9FSDiif9VvxwWGgjqC4w3AR1kLRJkcLAcCRHapYXTn
	 zsoaRCeD14h+PNibSkbAdhWQNh/Ft1Nvzb7zYxv3SjLf1ZXIOa0J+2EVRa84Wq2wWOGCz
	 1uwjomwxh6zKy9zYibCOUAo7FRlJ4ZyseDCoEk3kMVJQE/LxXDH9q+AyEqPdLieuelfX/
	 lGyhhePLvEjM90XXlAAqydsouNSQ/w0prEEpYrwQLZHAOXYFZGdwuDg0stRWAXMvi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CopQe4R8;
	arc=none smtp.remote-ip=209.85.217.72
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B62606A334
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B62606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CopQe4R8
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so362619137.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796657; x=1795401457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1DE1zx2VFa9qUd9Uu0O8FBnLLNz1IzGMo61cjsDi4Ak=;
        b=CopQe4R8yNIYcFAOCuocpcLGRTybJxLmbZljpji/v8rU3tpkbXhVXZgfclaKE7mPb+
         zvOJSiBTZX3G6/m82v914mXwDTC91a7QxArzfGhQjp6WlDdjyS2HGCS5RGZmK9VjcwuO
         s8JMX73Y/M/cuWrR7MKSvUfCBYgMNYCj4OxayHKRusdl80+L6utnXrpQCfgNVBZAvOcC
         mWOh1EW2qV8kpZSwunqhQVr4CHg/c/R52rd1GoDRJ0te0+8xwxCZJIyfijXsHaUfrGNz
         /GaX8JzHF/lbQBRTA0azp152J/WpJvu8/qEJq/cFXtNp7jwL2ooPNE+iaW4l2tiICYrN
         FK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796657; x=1795401457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DE1zx2VFa9qUd9Uu0O8FBnLLNz1IzGMo61cjsDi4Ak=;
        b=fdR7BLrqMTn5RWXCu4gxGkXRAAugpxETQo7FFiERhTd/W7uoKuFaIL/ksSxTHc3Lrd
         ZsCP7YIdXFatDSHumI5g6ixfi29+mhsmbi/+0I47JnxBxytyEoKOm/OVUSkm+JVBWkjo
         m2LtDJaUsxxdtsng+9KY0VJykQpFTEzAriyTWT9Voj2wrR6pqDS/P3t3H/jD1CS6DoV0
         YqaT/cBNQd70JByg5y22OHplleWcBDikY/X5bz8Ph9O2+4VBp01NxWTRAq/07EkFMgCT
         lfYjLTXRbIE7o1ziGyxrPl1y2l4+GunDOCVro/n6/gtPNihcknig9lzb7WWqwgGwKJPT
         tK6A==
X-Forwarded-Encrypted: i=1; AL+hErF+ClWJDHvdI9coUoLS07oLq2sDHkGs//YMd5/h34qdQ/jmhCQzzY2UfRdBRlE0LSZz2kMt4jE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fs7ccz6DEx88FWbQOLc9kxUFZs8yDpp97FspbF+SQlETSjsCW
	w985pKTFcKHPDeOxo9STcUa3kvZ9ctxBBHHK81n5HM61V/wlPFZRPG8hImORr60Nwb9xhbZdODk
	bX79PGxGsRAD+LMENnQyH4a8lMA==
X-Received: from vscc8-n1.prod.google.com ([2002:a05:6102:6308:10b0:7d6:46f2:b6a0])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr2307128137.25.1794796656540;
 Sun, 15 Nov 2026 18:37:36 -0800 (PST)
Date: Mon, 16 Nov 2026 02:37:09 +0000
In-Reply-To: <20261116023709.132684-1-thaisonphan@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116023709.132684-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023709.132684-3-thaisonphan@google.com>
Subject: [PATCH net v2 2/2] tcp: accecn: initialize AccECN fields in syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
request_sock without __GFP_ZERO, leaving saw_accecn_opt,
accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
accecn_ok is negotiated in cookie_{v4,v6}_check(),
tcp_ecn_openreq_child() reads all four fields to initialize the child
socket's AccECN state.

In addition, because the temporary request_sock used to send a cookie
SYN-ACK is immediately freed, treq->syn_ect_snt is lost. If the listener
marks ECT (e.g. DCTCP), failing to record syn_ect_snt causes
tcp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer
reflects ECT, disabling ECT for the rest of the connection.

Initialize saw_accecn_opt, accecn_fail_mode, and syn_ect_rcv in
cookie_tcp_reqsk_init() to match tcp_openreq_init(), and set syn_ect_snt
from the listener's TOS/tclass in cookie_{v4,v6}_check() to match
tcp_{v4,v6}_send_synack().

Found by AI-assisted code inspection comparing tcp_openreq_init() and
cookie_tcp_reqsk_init() while investigating the cookie_v6_check()
LOOPBACK4_IPV6 bug. Reproduced in a QEMU VM with tcp_syncookies=2,
tcp_ecn=3, SLUB_RCU_DEBUG=y, and slub_debug=P, observing bogus
tcpi_accecn_fail_mode and tcpi_accecn_opt_seen values in TCP_INFO on the
accepted child socket (and tcpi_accecn_fail_mode=0x2 on ECT(0)
listeners), and tested with packetdrill AccECN and syncookie selftests.

Fixes: 3cae34274c79 ("tcp: accecn: AccECN negotiation")
Fixes: b40671b5ee58 ("tcp: accecn: AccECN option failure handling")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
---
v2:
  - drop redundant treq->syn_ect_snt = 0 in cookie_tcp_reqsk_init()
    (Eric Dumazet)
  - clarify how the bug was discovered and observed via TCP_INFO
    (Eric Dumazet)
  - add Reviewed-by tag from Eric Dumazet
v1: https://lore.kernel.org/netdev/20261114161248.3428695-3-thaisonphan@google.com/

 net/ipv4/syncookies.c | 4 ++++
 net/ipv6/syncookies.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
index 4e0ff3b82062..1a837ed6efa0 100644
--- a/net/ipv4/syncookies.c
+++ b/net/ipv4/syncookies.c
@@ -290,6 +290,9 @@ static int cookie_tcp_reqsk_init(struct sock *sk, struct sk_buff *skb,
 	 */
 	treq->txhash = treq->snt_isn;
 	treq->syn_tos = TCP_SKB_CB(skb)->ip_dsfield;
+	treq->saw_accecn_opt = TCP_ACCECN_OPT_NOT_SEEN;
+	treq->accecn_fail_mode = 0;
+	treq->syn_ect_rcv = 0;
 
 #if IS_ENABLED(CONFIG_MPTCP)
 	treq->is_mptcp = sk_is_mptcp(sk);
@@ -502,6 +505,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
 		ireq->rcv_wscale = rcv_wscale;
 	ireq->ecn_ok &= cookie_ecn_ok(net, &rt->dst);
 	treq->accecn_ok = ireq->ecn_ok && cookie_accecn_ok(th);
+	treq->syn_ect_snt = READ_ONCE(inet_sk(sk)->tos) & INET_ECN_MASK;
 
 	ret = tcp_get_cookie_sock(sk, skb, req, &rt->dst);
 	/* ip_queue_xmit() depends on our flow being setup
diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
index b33011b71fff..7435ebcc366c 100644
--- a/net/ipv6/syncookies.c
+++ b/net/ipv6/syncookies.c
@@ -276,6 +276,7 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
 		ireq->rcv_wscale = rcv_wscale;
 	ireq->ecn_ok &= cookie_ecn_ok(net, dst);
 	tcp_rsk(req)->accecn_ok = ireq->ecn_ok && cookie_accecn_ok(th);
+	tcp_rsk(req)->syn_ect_snt = READ_ONCE(np->tclass) & INET_ECN_MASK;
 
 	ret = tcp_get_cookie_sock(sk, skb, req, dst);
 	if (!ret) {
-- 
2.56.0.611.g1030f0b940-goog


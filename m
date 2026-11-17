Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893747;
	b=14fwayvr2wGwgSzxp3ORBQTsw8fRCSGkbV0s/xmoXXs1EQ8Nm86lmW8ubkiNo6JMJ4GV
	 cJCInBxWjeqCvvHP9EveuTsFzoS9qHdlT+MMtHa3nxJlnWW1u678SXPLtSHyLJgfY5jt5
	 4HiBxujnHW7aycPFNs2O6luD7vtdjR0yzXJkCsLN5OWOJ6gKORzsK2mZqBIthlrx7mzBb
	 G/4U/TBlOLesX454/ZCVkVBnIHqMA95lIuD+h5ZMdP4NhQuy3yIuxeFzQ36/a7Sp0GzoH
	 R0KRdDivgT/6vs0OaLcB0gTziDNluldpt5SYZ0tqvHvzqQW57c50gdIoRaKY9/otL1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+LR57DbF8/kBaZXHmmzxmclwFG5btE57s4oeYyvPJPE=;
	b=r/TX+FN+dvSb7wNNmucYfG/DihAzUHFaWB3DGW63XvzYUaya3b4WHVAKLukFG61Z/g2t
	 Sjli3eIeiHDukLPuoaw6xQtj5NI1drrG9DfOz8U8Y72S8AbFMq52laON6PBo6Nmv5LZzX
	 WwkBaMU7OrhD6tWPUTf3ZxXJrALnMaRFqMKE4c6UzLZPASTjgtlo08lfEGPUrZBKzMTzJ
	 1PgzX9rlH2Mbm8Uo3t/OkiazXkehtAuBhIBFFIndt3DKGHDVHIM+SG+IA/RY9Ic/IdXHz
	 /eaV42+fGMF3WdbQvZ/6GlBGVDugnsrGYdUiJm9MLO5Jur7iaeRsVI0XxDeV+GQ07wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="SNMFPJV/";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6A7606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F6A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SNMFPJV/
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso3279429a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794893747; x=1795498547; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LR57DbF8/kBaZXHmmzxmclwFG5btE57s4oeYyvPJPE=;
        b=SNMFPJV/mMUQvQD+mApuQbpR317Nua43BEN0G5+YiT4EgtbLS20VNLWucCPxvTeJ+U
         e/QImPZoETFrn8Xi6Cd7m+/AVaXR2pzickmm3+Wt4TIu6h/5T5O8liqkA1IPkj/xZZww
         44r1EWsTfsQE3Cqu83c30d5lvsmxck04oxoii7/+kQkpuXWWAaOt/aPXJ1OIJcxmlgkI
         C0oCYkgcOHyL2QAhre7wn/zaq5cKpv1cAnVCzpkK4Dq6JDzRULmJblsN97gU7TJZYrcJ
         OjKUB+J62c4sOkl5mHraZkYTjmaj7chTunP8PfvZwRptLFIWm4Pra/A/ztcFkD37n5eu
         LEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893747; x=1795498547;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LR57DbF8/kBaZXHmmzxmclwFG5btE57s4oeYyvPJPE=;
        b=0pzloZOCVygZs8yeOS1ro7fZMlyIiYGTc3hpTntVgdtwaRDM9g2xjzRaoQEsd+UiJA
         qyG4NWKgQXcsy/DmEgQyA15jJ/sRr/FSQMcrVRjEXdnehWugjxksZUSPniyIz4WMGERM
         7vKjL5iQ2neoh/md7/hpOPcQU/bccMj38hm6VD4VlZjdyUlv73j8smaMzIffHOOKrEEB
         NdPKhS7hcZJShKxPegTCCTFUZGecLOW1ffw3bdTiJg6QlE2MRA6wlWsnMNNFlspvdGeC
         YuW4sHPVPrSRrIQFeKAu0/UgXDPSzzRPDGnhie1iUhwQrAB4vV4FMzFYbDv4dZRcoRC2
         gggw==
X-Forwarded-Encrypted: i=1; AL+hErFzHP8EYS6aLDzYEP6wAiBKeMzUqQWl1BhaUIJebzaea5wz9OHWylS7l5IcvGxrTnUh0QB8tWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z96P8Nz/VEI0N4r38n0L0XFycOJszYOiXjGPfcjw7tGkspMh2F1
	qJrE1D8sSDu2DijiGudo1SfHCob/oT+W4ssC4JNi5jD9QqQgnUTJxXcHk8jWx0NFeuBBTR07eAx
	O103QjQ==
X-Received: from pjbqi5.prod.google.com ([2002:a17:90b:2745:b0:3b1:4ea3:b63])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:ed1:b0:3b3:bb55:d9c
 with SMTP id 98e67ed59e1d1-3b3bb55159cmr131087a91.2.1794893746553; Mon, 16
 Nov 2026 21:35:46 -0800 (PST)
Date: Tue, 17 Nov 2026 05:35:19 +0000
In-Reply-To: <20261117053543.84032-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117053543.84032-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117053543.84032-2-kuniyu@google.com>
Subject: [PATCH v1 net 1/8] tcp: Don't accept ICMP for SND.NXT in TCP_SYN_SENT.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

RFC 5927 states that the acceptable ICMP has seq in
SND.UNA =< SEG.SEQ < SND.NXT:

  These implementations check that the TCP sequence number
  contained in the payload of the ICMP error message is within
  the range SND.UNA =< SEG.SEQ < SND.NXT.

tcp_v4_err() and tcp_v6_err() accept packets if seq meets

  between(seq, snd_una, tp->snd_nxt)
  -> tp->snd_nxt - snd_una >= seq - snd_una

, which includes both ends.

This is fine once connection is established because
tcp_acceptable_seq() uses SND_NXT for ACK and RST.

However, we should not accept ICMP to SND_NXT for SYN_SENT.

The minimal repro is:

   --ip_version=ipv4
    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
   +0 fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK) = 0
   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
   +0 > S 0:0(0) <...>
   +0 < icmp unreachable host_unreachable [1:1(0)]
   +0 %{assert tcpi_state == TCP_SYN_SENT}%

Let's fix off-by-one.

Note that we need to check seq != snd_una because tp->snd_nxt
is only advanced to tp->write_seq after tcp_transmit_skb().
Otherwise, ICMP for SYN could be dropped before tcp_connect()
advances tp->snd_nxt.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 net/ipv4/tcp_ipv4.c | 9 ++++++---
 net/ipv6/tcp_ipv6.c | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 2fc92a7884fc..7d58f522068d 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -499,8 +499,8 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 	const int type = icmp_hdr(skb)->type;
 	const int code = icmp_hdr(skb)->code;
 	struct request_sock *fastopen;
+	u32 seq, snd_una, snd_nxt;
 	struct tcp_sock *tp;
-	u32 seq, snd_una;
 	struct sock *sk;
 	int err;
 
@@ -555,9 +555,12 @@ int tcp_v4_err(struct sk_buff *skb, u32 info)
 	tp = tcp_sk(sk);
 	/* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_child() */
 	fastopen = rcu_dereference(tp->fastopen_rsk);
-	snd_una = fastopen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una;
+	snd_una = fastopen ? tcp_rsk(fastopen)->snt_isn : READ_ONCE(tp->snd_una);
+	snd_nxt = READ_ONCE(tp->snd_nxt);
 	if (sk->sk_state != TCP_LISTEN &&
-	    !between(seq, snd_una, tp->snd_nxt)) {
+	    (!between(seq, snd_una, snd_nxt) ||
+	     (sk->sk_state == TCP_SYN_SENT &&
+	      seq != snd_una && seq == snd_nxt))) {
 		__NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
 		goto out;
 	}
diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
index 5c7ed38f1f56..8691d220cf94 100644
--- a/net/ipv6/tcp_ipv6.c
+++ b/net/ipv6/tcp_ipv6.c
@@ -410,9 +410,9 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	const struct tcphdr *th = (struct tcphdr *)(skb->data+offset);
 	struct net *net = dev_net_rcu(skb->dev);
 	struct request_sock *fastopen;
+	__u32 seq, snd_una, snd_nxt;
 	struct ipv6_pinfo *np;
 	struct tcp_sock *tp;
-	__u32 seq, snd_una;
 	struct sock *sk;
 	bool fatal;
 	int err;
@@ -463,9 +463,12 @@ static int tcp_v6_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	tp = tcp_sk(sk);
 	/* XXX (TFO) - tp->snd_una should be ISN (tcp_create_openreq_child() */
 	fastopen = rcu_dereference(tp->fastopen_rsk);
-	snd_una = fastopen ? tcp_rsk(fastopen)->snt_isn : tp->snd_una;
+	snd_una = fastopen ? tcp_rsk(fastopen)->snt_isn : READ_ONCE(tp->snd_una);
+	snd_nxt = READ_ONCE(tp->snd_nxt);
 	if (sk->sk_state != TCP_LISTEN &&
-	    !between(seq, snd_una, tp->snd_nxt)) {
+	    (!between(seq, snd_una, snd_nxt) ||
+	     (sk->sk_state == TCP_SYN_SENT &&
+	      seq != snd_una && seq == snd_nxt))) {
 		__NET_INC_STATS(net, LINUX_MIB_OUTOFWINDOWICMPS);
 		goto out;
 	}
-- 
2.56.0.679.gc527c65306-goog


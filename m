Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097484;
	b=fNjdmQnLre5xvSK1YlWZxDV8Laf1C0FNavf+JM3EOfmMAL/MibCbV1R+TAbZaTwyWtKE
	 TGIIXf8nOXuyOnDPjfE18E08x+WUBUGzO5WTWCBt0922oNFzP1/9zrVkatikTmJxWGYd9
	 YxG3TYedXQ97b7Azd/iCA1P70fsl1QqVoJ0Z0r35bHW8ReEJTy0hTQ1ofPjxIgSKTXTbP
	 2n+SQ3ClMxoAkIYMGrRm5xXX12VFM3QQQNZ824gYaCmohJoGWpEwLEXNz94yCBPquJ/xi
	 cQWLcZYq7qAnPmAvUTisqzOp4HiMrx4WbREpK/v3EWSv2B9Lcn/9XWiy1ybPDB6/RoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NlHcMsNltoA1RVaZWqS6lSMU0wyom7V9Dy7Nz9l2BTs=;
	b=eillllohW0ptO31UoMoJWHb/xa319aGgqAmFfgW9cpYNYvV3zxneDIdQxlsHbtdI7cqG
	 wBRiD2TDoPel6Sy1KSlcXvz9ZBNrFhAQ4qdOZKUlPnqE1UHutm1FwdujwDn83B4zAAxEd
	 T+dPtWX2MY5lfhTkxFy8yKw92KsXP/IC9IRf+GWUOA7pZtj8Uxd/TrtAD1Hr9acPYzbWw
	 BqiKB0YCUDyGJ6A6Nqr7XDnxHBYEunq4lnIwxq+DuQo/+Y8G9VGRqNk0QmvFLkHDgRsfL
	 9I3uRFefs7sX8UUpV5E51OYLFMn+RNDGUHehVHIaWAoYEFpzgU86ZT9TVU8uhXjUdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=C62OlvOA;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F166C606A337
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F166C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=C62OlvOA
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-94961b68685so198301385a.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795097483; x=1795702283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlHcMsNltoA1RVaZWqS6lSMU0wyom7V9Dy7Nz9l2BTs=;
        b=C62OlvOAXzi4l3BV2Zpwe4h2T9O9R2BzGDUfWmfgpUkF4npm0CMGEV42snp0axiNa3
         b/klUNHafSiWBMa2qJ75Cn99ns94DPkT6Lb9AcJGAB4o0QToYI0jHQ3KKfOx3OjhwLHu
         HixNHj6nbJ2L0bkg5u5KbN4/mQXS2IcE7erQkZB5HStMTu7y192zXERmzQHmXxSDZ6Hw
         x3UC+ccCWjd2Hq2epzA1tRikTa9xgBBwMN140CzcUQ97e3k9QI+5VvnSYHuo42VczYjB
         w/qUTEfWZzuMyqtUKprESNbwkMaAuMkMkWpwJEh1h0KukeMWzYz5IsW33P+4QRpgRJgr
         boGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097483; x=1795702283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlHcMsNltoA1RVaZWqS6lSMU0wyom7V9Dy7Nz9l2BTs=;
        b=CQsIiX90i2OcAJF02NM2/6wvlX7X+GCBMEv18+1G1n/tLnRCVnysHsUxaYwuN7aQ9F
         /2OfoHsmwMlWBz0ewlUFwHisu2dZesyTgsLME6gCnwXj9de7DpPRXFu51xaSK6PDiduh
         Kime78eoTBd/ruR8DZxR2RG6qIfoYACgSuXXbY8tCWY54HzRT7pEaV842bHDv5FXZjg+
         A3gUgBXvJu+fBR5Ps6C218Ees4iFcJWbZBSpI39FZn0YuU8mWHBAsaukuzkxuYgDBHln
         Xi2m7Vwooyp2Oc/R1g7dTfYL7lt/SUmaLH09VOSzR18P32aTdjKja9dR9/uRiihGUPE8
         eVHA==
X-Forwarded-Encrypted: i=1; AL+hErGAJUATqGDWWrcuzCFlmAYSxMNQWQJBrw0y7J4qY7rgJ4vao9+BankvMYIBmlvX3RpcZuPQ8yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8EBEfu9hx+bYp0ehm1oIp8XgKEIXY8OE2NkMjdc5IGtdyl0gc
	uvAttYG3xpbItbEvhqoI7jI/0LDG+a7Xbc2wPvk4LeeWcHRF6n++T+IhpojpEHDECA==
X-Gm-Gg: AYBFou3V+zhYigRd0moVT6CF13eo1nBudF3B9PBjoxnjN9bmCe/D+yMARLTzklEc955
	XnusecTLVwWW6Ob8EcUX3Q08gDiCRt7X2nYCzGA1Vq4jRWDwQTan7ksw7ACXkP0oxv6Rccri4ZE
	t/d9RHgxlwXELg2b42dxaC3HS//yog8nnNzbJsBISUM+F5RPz0nMsRjcwHToXTEjxeSQWbozwca
	ofF3JVEXwj4uiQ6a4249I3D1Pho53i/6c/EJZjTdGG1pRKsQU+KPbZHOFlFoEC7Vb5bJOaDu+AA
	r1/lKTFds/wG+kLvGBX3DIieSZB0TaBI/dFiVWncLqXp/AvzTG0nYHUAv/4FsJ7NqPPzfpyShkE
	tVALkim3Lx3ivQBXrQMT0WCvC6caaQWeoSqVetYkBqz54/frqp6NtbuKSu4rkXvkJsx47KarwqL
	O8zei6YF2wLer99M+eXfLFM8VXlH5z1rrMsxZA2rQcOZjF/uyNYvPn5z1aQbHjAdUZJ/1RscpG8
	QkkuejicERwnHMqAMXROqgVcOtKffMXy4/Sc2GgAU3EJ+KHtcn+DUIlc010OhwJBYNwNhW8KjUA
	KLxhGNGspbz7TYWMBFl0e+EeGYTkd9JENTIRCRg0O1i7YTE0uVw=
X-Received: by 2002:a05:620a:394c:b0:949:91c6:973e with SMTP id af79cd13be357-94999602219mr1058615385a.65.1795097482486;
        Thu, 19 Nov 2026 06:11:22 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9ad0cdfsm57885a.39.2026.11.19.06.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:11:22 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Benjamin Coddington <ben.coddington@hammerspace.com>,
	Rishikesh Jethwani <rjethwani@purestorage.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] tls: fix send() returning success after the TCP send failed
Date: Thu, 19 Nov 2026 09:11:06 -0500
Message-ID: <20261119141106.840038-1-hengyul@cs.unc.edu>
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

Commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling") made
tls_tx_records() pass the error of the TCP send to tls_err_abort()
instead of -EBADMSG.

However, the transmit path relied on EBADMSG in two places.
bpf_exec_tx_verdict() looks for it in sk_err to tell that the record
was not sent, and sk_stream_error() leaves it in sk_err, so later sends
failed early. Neither holds for EPIPE. As of now, send() on a kTLS
socket returns success after the TCP connection can no longer send, for
example after shutdown(SHUT_WR) or after a reset. Nothing reaches the
peer, the caller is not told, and every send queues one more record
until the socket is closed.

The issue can be reproduced with:

    python3 - <<'EOF'
    import socket, struct
    l = socket.create_server(("127.0.0.1", 0))
    c = socket.create_connection(l.getsockname())
    c.setsockopt(socket.SOL_TCP, 31, b"tls")
    c.setsockopt(282, 1, struct.pack("HH", 0x0303, 51) + bytes(36))
    c.shutdown(socket.SHUT_WR)
    print(c.send(b"hello"))
    EOF

Before commit b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling"),
the result is:

    OSError: [Errno 74] Bad message

After that commit, the result is:

    5

Record the error in the TX context when tls_tx_records() aborts the
connection. Do not count the record as sent, and fail later sends with
that error before they take any data. The send() above then fails with
EPIPE, as it does on a plain TCP socket.

Found while comparing the behaviour of different kernel versions. The
program above reproduces it on an unmodified kernel. Tested with that
program and with the tls selftests.

Fixes: b341ca51d267 ("tls: Fix tls_sw_sendmsg error handling")
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behaviour of different kernel versions.
I used an LLM to analyse the problem and to draft the patch and this
message, and I analyzed the result myself.

Changes in v2:
- Keep the abort in the TX context, so that later sends fail and queue
  nothing. v1 only fixed the send that hit the error.
- Tell that the record was not sent from that state, not from sk_err.
- Cc the address of the fixed commit's author and the bpf list.
v1: https://lore.kernel.org/netdev/20261113193649.3822306-1-hengyul@cs.unc.edu/

With 20000 sends of 16 KiB after shutdown(SHUT_WR), net reports 19856
of them as sent and TCP memory grows from 15 to 158882 pages. With this
patch, all of them fail with EPIPE and TCP memory stays at 0 pages.

Rishikesh's "tls: make the record number wrap abort final" adds a
similar state for another abort. I can rebase on it if it goes in first.

 include/net/tls.h |  1 +
 net/tls/tls_sw.c  | 22 +++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index 0b001b8ab1c3..7d43ffe46f33 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -100,6 +100,7 @@ struct tls_sw_context_tx {
 	struct tls_rec *open_rec;
 	struct list_head tx_list;
 	atomic_t encrypt_pending;
+	int abort_err; /* error of the send that aborted TX, never cleared */
 	u8 async_capable:1;
 
 #define BIT_TX_SCHEDULED	0
diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 226e0f176fdc..795cbfe5fb2a 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -413,6 +413,9 @@ int tls_tx_records(struct sock *sk, int flags)
 	struct sk_msg *msg_en;
 	int tx_flags, rc = 0;
 
+	if (unlikely(ctx->abort_err))
+		return ctx->abort_err;
+
 	if (tls_is_partially_sent_record(tls_ctx)) {
 		rec = list_first_entry(&ctx->tx_list,
 				       struct tls_rec, list);
@@ -459,8 +462,11 @@ int tls_tx_records(struct sock *sk, int flags)
 	}
 
 tx_err:
-	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS)
+	if (rc < 0 && rc != -EAGAIN && rc != -EINTR && rc != -ERESTARTSYS) {
+		/* sk_err is cleared when it is reported, keep the abort */
+		ctx->abort_err = rc;
 		tls_err_abort(sk, rc);
+	}
 
 	return rc;
 }
@@ -636,6 +642,9 @@ static int tls_push_record(struct sock *sk, int flags,
 	if (!rec)
 		return 0;
 
+	if (unlikely(ctx->abort_err))
+		return ctx->abort_err;
+
 	msg_pl = &rec->msg_plaintext;
 	msg_en = &rec->msg_encrypted;
 
@@ -708,13 +717,15 @@ static int tls_push_record(struct sock *sk, int flags,
 static int bpf_exec_tx_verdict(struct sk_msg *msg, struct sock *sk,
 			       u8 record_type, ssize_t *copied, int flags)
 {
+	struct tls_sw_context_tx *ctx = tls_sw_ctx_tx(tls_get_ctx(sk));
 	int err;
 
 	err = tls_push_record(sk, flags, record_type);
-	if (err && err != -EINPROGRESS && sk->sk_err == EBADMSG) {
+	if (err && err != -EINPROGRESS &&
+	    (ctx->abort_err || sk->sk_err == EBADMSG)) {
 		*copied -= sk_msg_free(sk, msg);
 		tls_free_open_rec(sk);
-		err = -sk->sk_err;
+		err = ctx->abort_err ?: -EBADMSG;
 	}
 	return err;
 }
@@ -807,6 +818,11 @@ static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
 	}
 
 	while (msg_data_left(msg)) {
+		if (unlikely(ctx->abort_err)) {
+			ret = ctx->abort_err;
+			goto send_end;
+		}
+
 		if (sk->sk_err) {
 			ret = -sk->sk_err;
 			goto send_end;

base-commit: a8aeac0b1883206cf72461258e6bfd991589049e
-- 
2.53.0


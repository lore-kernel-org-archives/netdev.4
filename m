Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795211084;
	b=37NyHAnj7zmW919sLoCKpyeCCuLTS7wgzPJf7LwabLU6myXTAqujIUpixJVz8mTDZpu4
	 mAvyrMQMz9QxZD5cOmrCI5gGHFgHYuBnug5xNhsAggXDge5Kbf4Dq6Ujmm2G9Y++no9sZ
	 tGo3GLGbmt4jBLnI8M38eupSL1AX1AuTSErj0NtizU31ADj0a6qS4iw/OFhJfh3pSP5El
	 8iEjHlt3T+y/lekaOawuz9ZZ/NvtKWbL+bdXoOiKBk/eqDwdpCYh2O8daDcUnOYz/Dimk
	 zUk7jQqGZ9Ffscfx7S/xwoT58VH1UNWDFNLn2BPAbmzmSOhI1IoH1iMDd8std+oR7Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795211084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p/0Ox3V5BO+3FpnWN22VOHbyRzkEWm7sZC7QWkt+6DI=;
	b=06Tk1ozoikroIUt36QzUMPyFe5zonEu3FPBY7arC0gZLvolD/gVjo6mAE8qQ0hEcUpFG
	 s4n7B2BxnshGyACtyxCZ+htkoHmR8dX6/XrGXHiq2gS3O3qYYW6WUvftNhV/JVGkEUGnC
	 F7fVUJbJ46SSKnymAw5IKc4asMgXWGpiYRAEyuiH8JuvfxQaG37b2Rs8OkYLQJq7X2iKF
	 Dvp5lYb6pr7FDJ95QXn8h0aDX1W5Dyn7+NCVx3lGWTkjH5cCbbkORr39fNQkSdIYw+FiX
	 lyd3MMk9Tz2XI1lGzqFJWeo2lX51LVSnufXYsMj2eBRQXRY7g4u2OSicgv4GY2SRwlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMmUAfIy;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5D606A33D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 21:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D5D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMmUAfIy
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9495e8ae23aso117046685a.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795211082; x=1795815882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/0Ox3V5BO+3FpnWN22VOHbyRzkEWm7sZC7QWkt+6DI=;
        b=VMmUAfIyNMrmGOB7JZt9y9kNN1YLbwThlBQBxrf/KO4MG67XStnTce0XqCUS/3nHo0
         Nky4kGslYEqsoTFHmxBnnwjmqXQE/7y9cQ7MU+wmcjBuLEJ9vnFLzJ0ygJAYFbNzfCRH
         nYTMfSepxBopwhSVVNtceCH16ak2Yu89c0zlAzR1AFr/pzOH0/rtWWT81xI62Zho8LoB
         kZUSuBctS5P6hj1ocFVe/I2Ho8qs1FHtiDfYAqpLdsCXZynvlOwcOrsR1/YMi5caFaGk
         0Zwxp4dM+hXcIkCbYH4AL/mmEsZi2owEjok4zuxe6QgjFGC93ErTwGzsk6h35KmJXUaT
         WcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795211082; x=1795815882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/0Ox3V5BO+3FpnWN22VOHbyRzkEWm7sZC7QWkt+6DI=;
        b=ehKatIj4quP17ILqyk4BLaiXT2Qy/zUUOiy5pGKsucc/cjiFqRP63iVTWf1aH+cuh6
         W23zsdHVFuVm0/Elkavh5uB0CWs4bW4/VmJMbAjLlCTS5z1MRj792qhZeozCE4iYMRez
         YWxqoSJehLxkYL/R+UYzK8pWIOyGZ61mHWQrJobmAgh3qfnci+Dj76XFXcMF1b/v3I17
         Ae7snNykJX2x85HhBnS4is5KkSkUAOKUdcttlU7zvbJFCLZwcYPl4De+ZTBendAjDHuF
         NbIcWBR5LXUqgVJSmJF0XeJMryLbFS+7axKH8zoXf9yxf9JLsuXcpLlbUrowTr1H3Fy0
         tFuw==
X-Forwarded-Encrypted: i=1; AL+hErGPXZdjCejxmmLURtdzvgav+geKTewipq2Y9FGq3qoknVkcCZsfYe8JQqaGbTDelGL5NXkMOL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VaoK2h9aJKSCreOxlx/VKbPazMJ2w+2cM5ClYLU8LoxualU87
	+ZnuhIl+DPJv4GrQCbZIlPHgQf+vqQ/UFQyt5l3M3zB0XeNCt3cCbWXpuLS1tn6RqrI=
X-Gm-Gg: AYBFou0t6QzybqlPDo1qQtO7RzD78xKajV1rOSof6JJtcSbVSpv1cphJW4E9NGPWIat
	QVFz6jmBm2/1SX2sQ48QwvaroJXVFC8/K8AUflaW/W3PSuZrKRXy3gBRxU5Bwr9KYNm7exsN7BM
	GSCaPKnJWcPswFdCbT3Q5O9ZLbQK33cgPFxYAAovHFLla2fXR1byzzVIKPm9wyE/LjWuM1y2bCI
	QOO6JrVYFEbwZCirzGPK7h7SZmrkzpRVcue0Y6mI8PIhC6QBCyOp+tNB/2sOGfFCa6ASntqXh7G
	OPou/ogsZkGjFvi90fRSlBtmpV+sSaxkOVvbfliiF3BOb2G2Pba1sb/a4pnoq71l3lDtes/hDSw
	Y4/BJ3XLtgGGV1Ua+fKQfQUXiwKKcXStbc+VYKdQ8X75x4NodXNUKeu3Fz42/BNHLrn/oxX3DMW
	MkQBlloGJr9s6848qLkBJHB0PXL4FiXIvSc33Ub4InQVrcRN/RJo51pjsD6NHrz1jAMvSPJe2x5
	sZb+AbzcEWpVclX2anFtnqdKymAWmSeEipG/hVc0Cft9FBo5x27rSZEHoBxX4wEURgtG512OAfs
	skODmyM+ZZWeQ6fOrfH4GQIgDRAyJXK5oGhfZLVRhb1VWFBpq7YUIWuA8ZN5YZUUiHcoRxSli+9
	mAdWhMQ5oljS1kuxLr2kEgjqZ1xpciX6q4BG7K/3OcU6vVzK4WqSCnH/8M+XqwKrKQ/jY/47wjN
	XvXWpMMt+EHkNIHKyZvMXiNZNd1KuRrdWhALvmTwLxz09k9At+
X-Received: by 2002:a05:620a:28d5:b0:949:6d4d:2396 with SMTP id af79cd13be357-949ba9c6ac4mr704755285a.27.1795211082080;
        Fri, 20 Nov 2026 13:44:42 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4d9:d040:5fad:8738])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031601sm290337685a.6.2026.11.20.13.44.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 13:44:41 -0800 (PST)
Sender: Andrew Stellman <stellman@gmail.com>
From: Andrew Stellman <astellman@stellman-greene.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] rxrpc: Fix RxGK server to reject an expired ticket
Date: Fri, 20 Nov 2026 16:44:39 -0500
Message-ID: <20261120214439.44958-1-astellman@stellman-greene.com>
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

rxgk_yfs_decode_ticket() decodes the ticket in a RESPONSE and builds a
key from it. Nothing checks the ticket's expiration time before the
connection is set up, so a client holding a token whose ticket has
expired can still open a connection and have its calls delivered to the
service. Section 6.3 of draft-wilkinson-afs3-rxgk-afs-08 says servers
must reject connections secured with an expired token, and rxkad
already rejects an expired ticket in rxkad_decrypt_ticket().

Compare the ticket's end time with the current time before the key is
built, and abort the connection with RXGK_EXPIRED if the ticket has
expired. The key's expiry can't be used for this. An end time less than
one second from 1970 is truncated to 0 in key->expiry, which means no
expiry. An end time one second or more before 1970 makes building the
key fail with -EKEYEXPIRED, and rxgk_extract_token() drops the RESPONSE
without aborting.

A ticket that expires while a connection is open is not handled here.
As with rxkad, the server keeps accepting calls on that connection but
can't send replies.

Reproduced on v7.4-rc3 under QEMU with the in-kernel rxperf server and a
small userspace client. The client's token has an end time in the
future, because the client won't use an expired token, but the ticket
inside it (encrypted with rxperf's test server key) has expired. Without
the patch, a ticket that expired 30 days ago gets a connection and
rxperf reads the whole request. Only its reply fails, with -EKEYEXPIRED.
Tickets with an end time half a second before or after the start of 1970
also get a connection, and their replies succeed. A ticket with an end
time a day before 1970 gets no abort, and the client times out. With the
patch all four are aborted with RXGK_EXPIRED and no request data reaches
rxperf. A token with an unexpired ticket works either way. No other
kernel changes, debug code or error injection were used. There is no
rxrpc selftest.

The issue was found by Claude Opus 5.5 running Quality Playbook, an
LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix and this changelog were drafted with the same tool and reviewed
by me.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)")
Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
v2: Check the ticket's end time directly instead of calling
key_validate() on the new key, which missed end times before or near
1970 (Sashiko).
v1: https://lore.kernel.org/netdev/20261119184541.26343-1-astellman@stellman-greene.com/

A reproducer is available on request.

David, this takes enum rxrpc_abort_reason to 128 entries. Your pending
"rxrpc: Fix packet encryption error handling" adds one more, so with
both it has 129. In a small test, clang treats a __mode(byte) enum as
signed and warns that the 129th value wraps to -128. I can reuse an
existing reason instead if you prefer.

 include/trace/events/rxrpc.h |  1 +
 net/rxrpc/rxgk_app.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index 56dc9b614071..684034c67c69 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -97,6 +97,7 @@
 	EM(rxgk_abort_resp_short_yfs_key,	"rxgk-resp-short-yfs-key") \
 	EM(rxgk_abort_resp_short_yfs_tkt,	"rxgk-resp-short-yfs-tkt") \
 	EM(rxgk_abort_resp_tok_dec,		"rxgk-resp-tok-dec")	\
+	EM(rxgk_abort_resp_tok_expired,		"rxgk-resp-tok-expired") \
 	EM(rxgk_abort_resp_tok_internal_error,	"rxgk-resp-tok-int-err") \
 	EM(rxgk_abort_resp_tok_keyerr,		"rxgk-resp-tok-keyerr")	\
 	EM(rxgk_abort_resp_tok_nokey,		"rxgk-resp-tok-nokey")	\
diff --git a/net/rxrpc/rxgk_app.c b/net/rxrpc/rxgk_app.c
index 200a30064fae..93ee8b84316f 100644
--- a/net/rxrpc/rxgk_app.c
+++ b/net/rxrpc/rxgk_app.c
@@ -47,6 +47,7 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 	const struct cred *cred = current_cred(); // TODO - use socket creds
 	struct key *key;
 	size_t pre_ticket_len, payload_len;
+	s64 endtime, now;
 	unsigned int klen, enctype;
 	void *payload, *ticket;
 	__be32 *t, *p, *q, *tmp;
@@ -96,6 +97,16 @@ int rxgk_yfs_decode_ticket(struct rxrpc_connection *conn, struct sk_buff *skb,
 	 * the ticket.
 	 */
 	t = ticket + sizeof(__be32) * 2 + xdr_round_up(klen);
+
+	/* Reject an expired ticket.  An end time of 0 means no expiry. */
+	endtime = (s64)((u64)ntohl(t[5]) << 32 | ntohl(t[6]));
+	now = div_s64(ktime_get_real_ns(), 100);
+	if (endtime != 0 && endtime <= now) {
+		ret = rxrpc_abort_conn(conn, skb, RXGK_EXPIRED, -EKEYEXPIRED,
+				       rxgk_abort_resp_tok_expired);
+		goto error;
+	}
+
 	q = payload + 5 * sizeof(__be32);
 	q[0]  = htonl(RXRPC_SECURITY_YFS_RXGK);
 	q[1]  = t[1];		/* begintime - msw */
-- 
2.43.0


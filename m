Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672791;
	b=nXuaHlXf41fjG2QDpvsU8wPZ7sMEBFxO8IdQxUn1Y8CMR4U6vqG65U0fZ20OzsTizYPT
	 +8qB4VebCoMdXNTrF7JjVkVDIRagRhp/m5GhCrST1r2t9g/iNXpTUfUOdHnTPnPyxGy1e
	 iH6siWDtI8BlYx3adkzvXqrujFZskCM8EWqQcJ7hS2Nq6Subxay/ZxUIBpcDGvVqZuniZ
	 txWH3/r3deH1q8Y6Qkub83zWwqAiHtcFHpR8RJpJ8U2j3ffuedb4Lr5I0sacumasXGNRa
	 t575lXqpWx2mep62mZtz31do6UTDTloSAMkE1ZWVYLLbF8xOkeVqzzaP3WXVJM8OCTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=O5FcYAxpzNrueyZ+u2nvAHJTc1htMLsknfa/hCd72sU=;
	b=LB8/kn+nkLzh5xRE2qVHy+HM58FPloZTnBpp2UrgtJuRWFk9G8r2d4OEqMLQcwdJFgw2
	 F1A8tNdoAAhqejWUWfUVEwdFMB6mT3BSZAff+Gf5/9nq1LHJqWK89HZPBIPxYCAm2zN2z
	 N8mDvyQXHH8rUosyQIv6BF2uouucoABbEsJCK6lAhHDtqIj5nGZnwP3GTr8IvhMy/+Ahx
	 BAuUwVB92UL8wbeLSlvr00K11oRkKCFWj7yVRVS6VKZNDcKUZ5Q2mg00zm0Q5oY/lG11P
	 oBohVABQjYhxswzrhpabD0YPHecdcV7Tybxr11oK92QPScJLoGj9z0x6UwlGjIoGu9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LoYyA0uf;
	arc=none smtp.remote-ip=209.85.222.71
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E360A2603
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263E360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LoYyA0uf
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso200780241.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672790; x=1795277590; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O5FcYAxpzNrueyZ+u2nvAHJTc1htMLsknfa/hCd72sU=;
        b=LoYyA0ufL//mcIv4hXzAoVD9Ohz+mnOGJW44mmawOC0k7Y5xlzjc/jhcbQr91j74D3
         cgU+bxdSYKXEhoWZy7rB2sKd9y2sD0s8vEgeR6bFx0z/QBlwV3tW7bf3AVKe4sNEpcqZ
         wWlmCVxmBvvLo4JDXo2rQev0fPDb0Lr9gaADdWYLLbqBBgYuScMQ86G4qMdNuM47BQq5
         AFc76I5kspPtmZAwWB6vp9Bc18iWAUby04jZb5iBGU4MXdePUFckQUYu0DRng1urId2g
         LM+WaVVX5VCO8AWYD9G7louf/slpEgEQdj0aJ2ZXhK59coD9wsO91tnk94l3X6cRjvPI
         wdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672790; x=1795277590;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5FcYAxpzNrueyZ+u2nvAHJTc1htMLsknfa/hCd72sU=;
        b=2fUlTJKFYzmm7tc+oCq4d7G5iSihZyeFYouzpB41FRUq5OhtX2bro3MtevgsrI7JEg
         APfNsPFeVi4Me/Gmt26WK8yXD0gvPFBq3cD7gPbIwh6dFJvuaCt0vm0VFvge/7dWlryp
         7Kqpx17Snm7FXvGSaogBzPlroHwJ2/wweHktAsrvKv9PtHopTZL0+bOi2wnKiT1i0zxC
         +7uuXR2l6A8JNEZ3AF8vGvzVbBXcaYPLVcMXgWeESuDHCXa86eUD5USr8WzVLDR9m1cA
         9wHE2MkSNrg6j2c6XgVK91mDrQXtUndzqDtZWN/4eAE1p4PvYEgc/r9BQbwFFDDPSYcX
         MK+g==
X-Forwarded-Encrypted: i=1; AL+hErFtosdkStaGpnfrew1wJd39ETnXUMhBY3HLc0VPOiu9JanOAIbJFlX6d7fHqZm769xcg0+SO10=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EGbqc1NafgP9B1mUJIOhNd7ZZP1eSbIwf4mnnGeiP8Z3FZIqg
	+KOo3mvYRfjeZjb6dWzzaIIxE7Tj89nDMCmOdOmSh05fnyu4ASn9XgkhYhM25yd/xsDCXNtxg8e
	B/kLxwjGr4JTOOoLOcH4ixocwzA==
X-Received: from vsbjo28.prod.google.com ([2002:a05:6102:641c:b0:7cc:c8dd:8e1d])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3ec5:b0:7ce:645a:13a4 with SMTP id ada2fe7eead31-7d64d6f7957mr1626036137.20.1794672789794;
 Sat, 14 Nov 2026 08:13:09 -0800 (PST)
Date: Sat, 14 Nov 2026 16:12:48 +0000
In-Reply-To: <20261114161248.3428695-1-thaisonphan@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114161248.3428695-3-thaisonphan@google.com>
Subject: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Cc: Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
request_sock without __GFP_ZERO, leaving saw_accecn_opt,
accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
accecn_ok is negotiated in cookie_{v4,v6}_check(),
tcp_ecn_openreq_child() reads all four fields to initialize the child
socket's AccECN state.

In addition, because the temporary request_sock used to send a cookie
SYN-ACK is immediately freed, treq->syn_ect_snt is lost. If the listener
marks ECT (e.g. DCTCP), leaving syn_ect_snt at 0 causes
tcp_accecn_third_ack() to flag TCP_ACCECN_ACE_FAIL_RECV when the peer
reflects ECT, disabling ECT for the rest of the connection.

Initialize the AccECN fields in cookie_tcp_reqsk_init() to match
tcp_openreq_init(), and set syn_ect_snt from the listener's TOS/tclass
in cookie_{v4,v6}_check() to match tcp_{v4,v6}_send_synack().

Found by code inspection while auditing request_sock initialization in
the syncookie path; reproduced without kernel modifications in a KASAN
VM (tcp_syncookies=2, tcp_ecn=3) and tested against the reproducer and
packetdrill AccECN/syncookie selftests.

Fixes: 3cae34274c79 ("tcp: accecn: AccECN negotiation")
Fixes: b40671b5ee58 ("tcp: accecn: AccECN option failure handling")
Signed-off-by: Thaison Phan <thaisonphan@google.com>
---
 net/ipv4/syncookies.c | 5 +++++
 net/ipv6/syncookies.c | 1 +
 2 files changed, 6 insertions(+)

diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
index 4e0ff3b82062..5747f9a5a6d1 100644
--- a/net/ipv4/syncookies.c
+++ b/net/ipv4/syncookies.c
@@ -290,6 +290,10 @@ static int cookie_tcp_reqsk_init(struct sock *sk, struct sk_buff *skb,
 	 */
 	treq->txhash = treq->snt_isn;
 	treq->syn_tos = TCP_SKB_CB(skb)->ip_dsfield;
+	treq->saw_accecn_opt = TCP_ACCECN_OPT_NOT_SEEN;
+	treq->accecn_fail_mode = 0;
+	treq->syn_ect_rcv = 0;
+	treq->syn_ect_snt = 0;
 
 #if IS_ENABLED(CONFIG_MPTCP)
 	treq->is_mptcp = sk_is_mptcp(sk);
@@ -502,6 +506,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
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


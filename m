Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919647;
	b=cGRDccNo02MjdSvPqjTQyUzkuTdYa4/yIUnc8OsqkbseEhFPd7aFD1Y/3hLVWmTAF3W0
	 LcYL7qwhRhtWumDe71movBugU86CwZq4msY6VMDzXENO4iiNFX9i5XI0RrWEgi7BUq+Pb
	 hmk1KlXQBc2y8hCGRpqknVE3scrs21prKiJW6pRKm6FqaMzp7SH4uXvONukG+AWr9C005
	 s8V7+Z1zs0N96/j1FWmctdSRdeJbSffC4hDO94XnaXzvqPbRyWIqE6zGRJmKbyaEu81ZG
	 oL+tObZ7IPUxpZgCJgIKFUpGP8Wl5QyOy9hYp+W4N5+y6Vqbj2orhT7ZIhKeiRsMyMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=cn6UENZGdLiJytyF84lr/H5zLWzIbtUmLBUEsnq8LiA=;
	b=cVtt3jmsXv6WSXf8BctoEWa0jNFBPaCEsSiQGTmWhajj3GjIzxRPFiqAJPs1fqZ/j1bl
	 dqTUjr/pEFhEqYyW/Nb2+2KUa4JVMjGvQdk17ypzHLukb0YKuQtpaeEQjhmO70Atb7wy8
	 6N37Vjz9ZfOZOX4uX7ngI4t45SRNJmb6DbREeeJYgH9LgNxIla72ZznIDOc1hnjTKOAAL
	 iVrQxOFxMKQAbvs7V6KQT8NKDx5hfrUU+zLuanrHBM68d9c8eJ1rA1T5ZFl0EIJm9t7Ng
	 Vs/ds04tGPbqcEb9f8F6utnqDIouOlpllHvqW4aalwxKCKuNyXQw1lMnuvWG49DWMWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qMJe0xgB;
	arc=none smtp.remote-ip=209.85.217.72
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D19606A8A0
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D19606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qMJe0xgB
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d57f6ea49bso756022137.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794919646; x=1795524446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn6UENZGdLiJytyF84lr/H5zLWzIbtUmLBUEsnq8LiA=;
        b=qMJe0xgBt/Ma2L16LJ/0vSNlg+wqa8kiePgu4qJKUzAoL3knHgHnYYnINqFWVt6MLs
         nrulCpYHqeulZaf1X65zquVjyGMhT98I3De7CXkn9jfWsC4tmYtmYCIJh2xLzyUCing+
         Pv+GNeWNjfi4xjDE5QqHzkeT5nKndOlNtNzANQ79DdgayyjYOQ1JMjYGJ/6tyexuLtVs
         TOPNntSvrFL47tcVhwq8aHzhov9RI3u5U4MC9BPrwXyL7bpxlHWdVKx/pq+EDaceeqEL
         p++h2haY5izvn9cVly/uKRDzMnracQlzePDFxvrmDyYMvzCg+hga3UL0OudUGM06e/L2
         1uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919646; x=1795524446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn6UENZGdLiJytyF84lr/H5zLWzIbtUmLBUEsnq8LiA=;
        b=0sDmNXjE2IFKZ513QeUsY+IlMZfrelJRpBO0qZiYPJfakOxRFUNKVRYm/HFPJY38hQ
         0LJ2D7EhTZhZfYbS05X7GF5fijbnic/kvjgMG2yPKRkPd44TaswSylKgpcOaB2w9//gw
         zIOgnem14UcQndTThj2rFbsgHPlxi02wN3gwJ2bbnkWm4xk7I5OXwOmFhU/s8N9iS6Cw
         4rbhIdxRdoAifaod+H64E3+GWLWiRntw2lKHaIZvsuEWWFBLNZtsvD5uhJjlS7mekcBa
         jgdwksahHYmqhTbY/vfU8p/KwXr8SXhzpT2jKok9l/kvCkHL7tScFVzGX08xqbjiDFZB
         DOuA==
X-Forwarded-Encrypted: i=1; AL+hErEzi/Tr8e+16TV0Sg34teUc6LWf6m7sfcZm5BfHClODHzUWoKKeM1vYROk3CCUTwpAa9TQBCjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sNWCnex/gDR9lVgBtpEvX48ENeUVSN+3lxXFrD3T+FV0YWtOY
	GfF9Q7PoEzRwbYyvlCMgComYe1MYhKU8DiI9lUHG7Rr97v2wGpQy5PPBgSwSKzV6kCqlpoX6tO6
	glVFHCkvxuirrqRojCMq7qxcWOA==
X-Received: from uakn9.prod.google.com ([2002:ab0:1e49:0:b0:99e:e0e:e2af])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:6cf:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d64d6d70eamr3852994137.8.1794919646079;
 Tue, 17 Nov 2026 04:47:26 -0800 (PST)
Date: Tue, 17 Nov 2026 12:47:10 +0000
In-Reply-To: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117124710.1338951-1-thaisonphan@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117124710.1338951-3-thaisonphan@google.com>
Subject: [PATCH net v3 2/2] tcp: accecn: initialize AccECN fields in syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

cookie_tcp_reqsk_alloc() and bpf_sk_assign_tcp_reqsk() allocate struct
request_sock without __GFP_ZERO, leaving saw_accecn_opt,
accecn_fail_mode, syn_ect_rcv, and syn_ect_snt uninitialized. When
accecn_ok is negotiated in cookie_{v4,v6}_check(),
tcp_ecn_openreq_child() reads all four fields to initialize the child
socket's AccECN state.

In addition, because the temporary request_sock used to send a cookie
SYN-ACK is immediately freed, treq->syn_ect_snt is lost. For AccECN
connections where the listener marks ECT on the SYN-ACK, leaving
syn_ect_snt as 0 causes tcp_accecn_third_ack() to see a mismatch between
the expected Not-ECT and the peer's reflected ECT in the ACE field,
erroneously flagging TCP_ACCECN_ACE_FAIL_RECV in accecn_fail_mode. Refer
to Table 4 of RFC 9768 for more details.

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
v3:
  - clarify syn_ect_snt / tcp_accecn_third_ack() description for
    AccECN connections and reference RFC 9768 Table 4 (Chia-Yu Chang)
v2: https://lore.kernel.org/netdev/20261116023709.132684-3-thaisonphan@google.com/
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
2.56.1.703.gf848ed807c-goog


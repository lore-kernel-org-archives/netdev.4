Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533182;
	b=m0JwBRw8cqbXbdSZOJ/a7l7FaS9QuSIMHVwTPz1JeBkwCupYsJKORePSc/txGb7s/nXg
	 P6+L8nh376n2fxFr1A3X/CPpwBN5fHdie03VTIUW1AFYkbwpXRmnw/QvqbpYQhWy51amt
	 KlKLlIt1ZR2+kaTvduTX/oIuYsnhrfecVR+LcSZTcniRvthw2gqsG6v6VJ44aOlSYaICp
	 n6uDm4jzeys5nVNobak1q/uiAXuNr5aDUnEK/JariXDyYz6wgcxSiCTuxvY9i04hPevNo
	 Z+JrghG3joV/UA1i7ySHPzC+R1yfmjM/ltDYpoOWJZM6nktzoex033btR281xViZ0NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lmsH11/9DkTlIQ6/VeThZwrNe3KS4D5hoTSxGmm1QUg=;
	b=zjyYQlBW3wwsj6b8Lnjm9sM7Av7hI6qckzfLBO7L6MFgdo1Ed9BjsXyRSoLPCN9UHuSO
	 s/g1Lae8uylibu6M1Uz/+S8dtpsKrUx58NG/ti363kJxzYTRL9JA2/+TrAAaiFraBaUr9
	 wSixKlRgX06PSttFM8wp1/KDokLNtLldh8b2HOad63By3KL56MlrFIYHIsEjajZOLRdGm
	 3scIj8QehIqHMhVRAqfpEONPVAlx0nADT4iYgsNUOxkcCWkHL6KSCHz5hRSpbaHV6BAUt
	 hvvfGWSdhCzWmHYF7s29EWVlvBIvmQDLeo5gelVd8V0FrE2uy+B6RKkCfC/zti0xTmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=OnTlYDJ7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A979606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A979606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=OnTlYDJ7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2723574f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795533180; x=1796137980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmsH11/9DkTlIQ6/VeThZwrNe3KS4D5hoTSxGmm1QUg=;
        b=OnTlYDJ7PbcIKV8JLOGSwV+u3z3kCJF/LuK2QXbopoQg/k5OHls8DopNe6yrnmaMDr
         SXRRjqMezM7zdzApO3pOAYkKaEpEfJu021LK3lFk3yxS6+lDZuQ7ZlobsRp+FxZ5zOqR
         eapRxxvY8rWyzAIkpk0b2RtAn4lp3BHVdbEYQvj+KQlGMnDJD+Ei04R0jo2oMlAO8+NH
         zsXAOEk3b1F1wH9FQQSGCxKUyknmXGIJTuM+rUOLzo3CaBNQ/IqUW53TYpE+8tb8UFG6
         wHkMCwugZ42wY4cihIZXQSPzQlr2MVniqOhonS9t52nqrXqHoVHbwp/7iPHYiAZwaxMt
         SWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533180; x=1796137980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmsH11/9DkTlIQ6/VeThZwrNe3KS4D5hoTSxGmm1QUg=;
        b=yawH8oQPPGVZdD8/LzftQeH7a07bvIP3gqu9E8P+P/JcrTpCw/A1Oky8KSgTmfoJVv
         UGsKKM1/mg50tb5F1T/WYQQEBqrYLqNjNFEsTU5KAJSe1lg7+5Qfk7DG8jLcf3ERnsse
         QLZCX+nUSO8foHcZDLjlDAo+XlsSmaSxHLRV533+iB2YWu0iCAcEZG0RyYe56/nwv7iM
         a8bLQtRhtUxwFo0X5E8jOxTSxnVr9IRip0l8ztu3M+PaD/IY9ZAvx5wqk6kIb/1jfckw
         qUfFw8bFDoxsbCYQomPZh8FzlnL28RZMRiaTgy1kAmzIDk3LP1W4T21FWz6LCEC4QHk1
         EKFw==
X-Forwarded-Encrypted: i=1; AL+hErFA72QcVOQQQqHgD7zOPcOo4ONXx6MUvw7GVu0IBPSfMohR7NG6hWwCbkK3hceM14TSm3aibuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TRn3KawnTMPHJ5kZTy5FyHwhBY8hSSELQKKuYJAD+GTX0q4XK
	O3FRJEsbE4/oxgXYTq1EjijohoLtwLWTp6CCkdUmPsS0vzx4Y+ZB+c5ewLzVQpAHb9w=
X-Gm-Gg: AZFdTZc4JNLAi3QmrYpkwzWbSJlrZgqFydrVd1+6YFitO/KU05Nh55Yr5EhnYwYBa5w
	YIcJIT7XXxR8gjCKs7vGfEVAt5pTGloZ7xV6uFcBiPWQUD3fcPTRHrX9nqEFvnvLABIMs/Lk3jc
	YR67j6SigyS1JSfYXIjUqeFjZBkE0PsKj8xjsq4ZJrOLiWg2eeSToNopwtvwA2bThg2Q7jHMwUr
	KEcEQe8P9LaG8DDPQZL8ecyjT6f4K/iPgNkNS6tvafMyw0M0PLt8QtvFZdafJmB0Teou62U9oZT
	4C849DjaLHqQ5f7p6xtHnrehaGoyCqCBzZoZheX2In9TMuyEG5rKAYjModTg+YBquIRsi+o0iIK
	15Lyd7YtbWs7XkhNxyvi9m+kQhnlHlaWPQ/LW3g3W4OMqBbbqTJIVTouOTto0csoMCmFSiwR4ca
	Vs19nTgEMkYIR7L1CO/mXd6eRDwRUqqNv2qIR296+QRYgHsR5iM3vQWxAaGPGDPaXsrSbhfp+AB
	c+fx3syYTG3hV4zQQcOt8suAnt+7HwgQ1K08AM07uKWI9W6NMPr1VYfGqDUuYpeiTb/UA+PoVk2
	4x09kREcozoZ714JfTeA8fHviNzYWcVGBoQDA2ArVBrZugDAyz4+hL/tIUvFFwkem6t9gnza
X-Received: by 2002:a05:6000:111:b0:490:71a7:6f51 with SMTP id ffacd0b85a97d-4abb4c7aab0mr22220450f8f.45.1795533179678;
        Tue, 24 Nov 2026 07:12:59 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b2052c8sm28719088f8f.41.2026.11.24.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:12:59 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH RFC bpf-next 1/4] net: track references owned by prefetched socket assignments
Date: Tue, 24 Nov 2026 17:12:41 +0200
Message-ID: <20261124151244.1423343-2-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124151244.1423343-1-razor@blackwall.org>
References: <20261124151244.1423343-1-razor@blackwall.org>
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

Add sock_pfree_ref for skb-owned references whose release mustn't depend on
SOCK_RCU_FREE. Teach receive lookup, NFQUEUE and reuseport selection to
preserve and transfer this ownership.

A following patch lets netkit programs assign sockets. The skb is then
queued to the backlog before the receive path consumes the socket so a
borrowed RCU reference isn't enough and the skb must own a reference.

The reference must be on a full socket. skb_steal_sock returns the
listener of a syncookie request socket before it looks at the
destructor so a reference taken on such a request socket would leak.
DEBUG_NET builds warn if sock_pfree_ref meets a socket that is not
full either there or when the skb is freed.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
 include/net/inet6_hashtables.h | 10 +++++++---
 include/net/inet_hashtables.h  | 10 +++++++---
 include/net/request_sock.h     | 10 +++++++---
 include/net/sock.h             |  4 +++-
 net/core/sock.c                |  7 +++++++
 net/netfilter/nf_queue.c       | 16 +++++++---------
 6 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/include/net/inet6_hashtables.h b/include/net/inet6_hashtables.h
index 2cc5d416bbb5..e461a86f8eaf 100644
--- a/include/net/inet6_hashtables.h
+++ b/include/net/inet6_hashtables.h
@@ -134,10 +134,14 @@ struct sock *inet6_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	if (!reuse_sk)
 		return sk;
 
-	/* We've chosen a new reuseport sock which is never refcounted. This
-	 * implies that sk also isn't refcounted.
+	/* netkit bpf assignment holds a reference on the prefetched
+	 * socket and reuseport returns an rcu protected socket so if it
+	 * differs we have to release the original reference
 	 */
-	WARN_ON_ONCE(*refcounted);
+	if (reuse_sk != sk && *refcounted) {
+		sock_put(sk);
+		*refcounted = false;
+	}
 
 	return reuse_sk;
 }
diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
index 44b7e39a1245..d4dd9c3487d8 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -476,10 +476,14 @@ struct sock *inet_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	if (!reuse_sk)
 		return sk;
 
-	/* We've chosen a new reuseport sock which is never refcounted. This
-	 * implies that sk also isn't refcounted.
+	/* netkit bpf assignment holds a reference on the prefetched
+	 * socket and reuseport returns an rcu protected socket so if it
+	 * differs we have to release the original reference
 	 */
-	WARN_ON_ONCE(*refcounted);
+	if (reuse_sk != sk && *refcounted) {
+		sock_put(sk);
+		*refcounted = false;
+	}
 
 	return reuse_sk;
 }
diff --git a/include/net/request_sock.h b/include/net/request_sock.h
index faa6dc49cea8..72fdbf0dccbc 100644
--- a/include/net/request_sock.h
+++ b/include/net/request_sock.h
@@ -103,21 +103,25 @@ static inline struct sock *skb_steal_sock(struct sk_buff *skb,
 	}
 
 	*prefetched = skb_sk_is_prefetched(skb);
+	*refcounted = true;
+#ifdef CONFIG_INET
 	if (*prefetched) {
 #if IS_ENABLED(CONFIG_SYN_COOKIES)
 		if (sk->sk_state == TCP_NEW_SYN_RECV && inet_reqsk(sk)->syncookie) {
 			struct request_sock *req = inet_reqsk(sk);
 
+			DEBUG_NET_WARN_ON_ONCE(skb->destructor ==
+					       sock_pfree_ref);
 			*refcounted = false;
 			sk = req->rsk_listener;
 			req->rsk_listener = NULL;
 			return sk;
 		}
 #endif
-		*refcounted = sk_is_refcounted(sk);
-	} else {
-		*refcounted = true;
+		*refcounted = skb->destructor == sock_pfree_ref ||
+			      sk_is_refcounted(sk);
 	}
+#endif
 
 	skb->destructor = NULL;
 	skb->sk = NULL;
diff --git a/include/net/sock.h b/include/net/sock.h
index 3144efad8c36..33cc361e941f 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1874,6 +1874,7 @@ void sock_efree(struct sk_buff *skb);
 #ifdef CONFIG_INET
 void sock_edemux(struct sk_buff *skb);
 void sock_pfree(struct sk_buff *skb);
+void sock_pfree_ref(struct sk_buff *skb);
 
 static inline void skb_set_owner_edemux(struct sk_buff *skb, struct sock *sk)
 {
@@ -3034,7 +3035,8 @@ static inline bool
 skb_sk_is_prefetched(struct sk_buff *skb)
 {
 #ifdef CONFIG_INET
-	return skb->destructor == sock_pfree;
+	return skb->destructor == sock_pfree ||
+	       skb->destructor == sock_pfree_ref;
 #else
 	return false;
 #endif /* CONFIG_INET */
diff --git a/net/core/sock.c b/net/core/sock.c
index ad414878dc5b..11d5d221a2fe 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2871,6 +2871,13 @@ void sock_pfree(struct sk_buff *skb)
 	sock_gen_put(sk);
 }
 EXPORT_SYMBOL(sock_pfree);
+
+void sock_pfree_ref(struct sk_buff *skb)
+{
+	DEBUG_NET_WARN_ON_ONCE(!sk_fullsock(skb->sk));
+	sock_gen_put(skb->sk);
+}
+EXPORT_SYMBOL(sock_pfree_ref);
 #endif /* CONFIG_INET */
 
 /*
diff --git a/net/netfilter/nf_queue.c b/net/netfilter/nf_queue.c
index bd603e3a99a5..d920a67b6fa0 100644
--- a/net/netfilter/nf_queue.c
+++ b/net/netfilter/nf_queue.c
@@ -195,17 +195,15 @@ static int __nf_queue(struct sk_buff *skb, const struct nf_hook_state *state,
 		break;
 	}
 
-	if (skb_sk_is_prefetched(skb)) {
-		struct sock *sk = skb->sk;
-
-		if (!sk_is_refcounted(sk)) {
-			if (!refcount_inc_not_zero(&sk->sk_refcnt))
-				return -ENOTCONN;
+#ifdef CONFIG_INET
+	if (skb->destructor == sock_pfree && !sk_is_refcounted(skb->sk)) {
+		if (!refcount_inc_not_zero(&skb->sk->sk_refcnt))
+			return -ENOTCONN;
 
-			/* drop refcount on skb_orphan */
-			skb->destructor = sock_edemux;
-		}
+		/* drop refcount on skb_orphan */
+		skb->destructor = sock_edemux;
 	}
+#endif
 
 	entry = kmalloc(sizeof(*entry) + route_key_size, GFP_ATOMIC);
 	if (!entry)
-- 
2.47.3


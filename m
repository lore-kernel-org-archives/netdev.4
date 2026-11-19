Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098500;
	b=1Y4ekwzuSVgQrPT1cOQ6OeZ4cNqEGwYq6y0LFL3LLawLWmXhEZ/+ubUDMZA0TiMiDntw
	 GAOKmAM300e5Of6U64RMmiGC0lo4VJKMN18QPuV3ZvcPCXbo45DGrXmZVB4xTKBgA8GgG
	 OrUR9SYH2snAVeKcjjOkBhFV4c2OvFVT4LMYVr38OmzFOql1yQgU7q42Me4jBDSaWbplW
	 Ef9Aw8NBjl9dXS6u5t6V3HDkiMoIN2i0WLm2OItUIZVT/xPrzVNtrJ9lTlxf45qWPaYs/
	 OuxlTAuqpoeeKT9sxvt0uipfBNIBMInF8wBYeA0myrYiFhcwPioqYsVpebmxeNNdhqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9T6tFEDCgpYCKcFgHJzfl3vLbUXzdhPs6It4k/cVCSk=;
	b=Nmf9n0Cd5te/bHdndCKNOm2N83XNg/HVN8wklWwK970vVvgREodp31ZK79KxxvMIYCVh
	 HJctvlu65m2zisDMebCg7ar8dL7EUrc+0Ip+gOpvB0m98iznRDBEUXLsdl++HyiuqqKpQ
	 6RYYDXWyrBj+CJRcMT5cXQaPeCiIhc/p6QpOV9Cvd9VYEb5N6b4xCwMAEEir/TEuvqTsP
	 X6qzm/Pz8z2lWk3av3sVu3gUhKSA/FHaweXir3ATsYDjLe3Zr2eGWr1aEKn4Nhjreer+c
	 ZYEk1JP5c2OwDYy3GPRt86Iva3Jum3NjWiujGm8bqq9Xif0jWp5IqIb+p8cPZWeETtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=awp6Bwub;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E8606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D5E8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=awp6Bwub
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492f563d1c6so895136f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795098498; x=1795703298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T6tFEDCgpYCKcFgHJzfl3vLbUXzdhPs6It4k/cVCSk=;
        b=awp6Bwub+sVdEgAt2b7Ki9zjLVh5kXE+aVJmbNL1CsstYlUKCluufG71VxXFmzE1hT
         57MJc/jEBaIc7BLUAvlRFS0mWRevKIZ+17dbiHN2vYeSnqcQlTevGXBA9SPJfn69vYix
         bXscRm7zvDdldiE9Cie5M/VDVNTUUmOV2OQVSty9R4iOHUDAw6DlAfL82xP6WQLhEfJW
         1qxyoZN7IOygBHOQztHhtls7Tly7gb5TIZ8GLQTj5m6zciyE8LhJXGR+O2fid8omqJth
         aOKYUCzNGBOxMCR54fwbbxZly+M9hGqCTLs+lanrJpHoWRv3PYB4mmDaeMIeTwOWFXWJ
         PYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098498; x=1795703298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9T6tFEDCgpYCKcFgHJzfl3vLbUXzdhPs6It4k/cVCSk=;
        b=EXzkI22hBWC5BFeH7TaEMXu4CbGIWa7vRDAzEWHVK1l1mlMAVLKhbm1n9xMGDco89s
         kFXcHl80W6Q4qCyU0P2tmBA1WOECkUGRvuh2Ux7j/X80MET18z4ZrW62fE7/I1YbY5Ce
         jt/W0oe/PaykHIkOWeE75+jpMyur30+CTLOmu2Gb+n+BeGXy3EjIclJ2mgZJ/R/k24Ql
         A4Bzjli40482/kShEs9J+vZki8N/nu9oid7oW6w0ydQ0bdjWKUtRiLV6R+abaHipkfTW
         83dIgWbopeHeLR6YzVjguFskwV1nwGfP4ZvCXa7Y31zDonvKI3xd3gQCKTf+hy9joovY
         1cFQ==
X-Forwarded-Encrypted: i=1; AL+hErFt6aXEIT3/9xHK99qYmB0xw2BIwcZa4tcgZD9pNBPM5ygaDAm9i4OErHdaIPnHutFzYE2/b3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jl8XdYNtYb+JxZg+N4ntTJAAIuUZYAHQaEOVQJZipLgjBQoBz
	9ZnWxiSnM71V2CbBihIGum1vb6jT5BTvc9OU620e52E3baa3X42h8Su4pOTehd5tRIU=
X-Gm-Gg: AZFdTZdORWGp4A9KTQ2G5kFi+/I/47GrwpWHKli1uAUg22asTb9yrDuECTAXVyMGPwf
	yqGOKsSFfeX7t713g9MlR9b5+4UpeFZN4616P11sgsXJuSPcVloxZDcWoJOWgOZ4fIskkh03RlZ
	myS2yh/Xl7WlGKteoQtXGdruoAxEqBcp13e849FINKPGnr9bzREv9F2gh0GZ9sX6DaxK7XuXkYx
	Xm6FWQRAUv/r79BV4HRIsvg7M8RdM4Gc7II2Z3G71zJ3so6gaDZ9JwKOdkpThtvABOwOKivXvkT
	BlOOWY/Zn54bgJaluSLx6EliN+BL8Ya+uQHeTEIHgoXvmpRZp0HsWqgi+UoyC4Zdgxyv7tVFviQ
	g2JBDn3D5AdYbL72BauFGiMRWYZORmm0uJ9fQBAW512TKC8njylx5Tfymq7m/WGNzERtll3+aed
	ZmQm2ySFvmEr1ijQqrN9TzPoRvPhYsFCV6ediB98c5DsQijhgbK72Ild9qQO/bcHXU3KpONtsjJ
	XGNMI0zjS8f6+YJSPTispVHnsQDRnTq7aONAA1K/gyEY53YI49L7ZeavKaie6rTDLAZtbSTvmpX
	9x8ualfahpQaayH95bXR636DOkgMplahLSWCilduX2Fe2ICey3R8ZnJ8WpboopRuLXS6C2ma
X-Received: by 2002:a05:6000:22c5:b0:4a6:ed6f:7a6d with SMTP id ffacd0b85a97d-4a6ed6f7c2dmr11897798f8f.28.1795098498460;
        Thu, 19 Nov 2026 06:28:18 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab53e89050sm121821f8f.16.2026.11.19.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:28:16 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Paul Chaignon <paul@isovalent.com>,
	Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH bpf-next 2/8] net: track references owned by prefetched socket assignments
Date: Thu, 19 Nov 2026 16:22:24 +0200
Message-ID: <20261119142231.2612515-3-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119142231.2612515-1-razor@blackwall.org>
References: <20261119142231.2612515-1-razor@blackwall.org>
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

Add sock_pfree_ref() for skb-owned references whose release must not
depend on SOCK_RCU_FREE. Teach receive lookup, NFQUEUE and reuseport
selection to preserve and transfer this ownership for egress assignment.
This ownership bookkeeping is needed for subsequent patches that allow
bpf_sk_assign to be used in egress paths.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: Paul Chaignon <paul@isovalent.com>
CC: Alasdair McWilliam <alasdair.mcwilliam@isovalent.com>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Pablo Neira Ayuso <pablo@netfilter.org>
CC: Florian Westphal <fw@strlen.de>
CC: Phil Sutter <phil@nwl.cc>
CC: netdev@vger.kernel.org
CC: netfilter-devel@vger.kernel.org
CC: coreteam@netfilter.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Emil Tsalapatis <emil@etsalapatis.com>
CC: Ihor Solodrai <ihor.solodrai@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: Stanislav Fomichev <sdf@fomichev.me>

 include/net/inet6_hashtables.h | 10 +++++++---
 include/net/inet_hashtables.h  | 10 +++++++---
 include/net/request_sock.h     |  8 +++++---
 include/net/sock.h             |  4 +++-
 net/core/sock.c                |  7 +++++++
 net/netfilter/nf_queue.c       | 16 +++++++---------
 6 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/include/net/inet6_hashtables.h b/include/net/inet6_hashtables.h
index 2cc5d416bbb5..5a109a48cc14 100644
--- a/include/net/inet6_hashtables.h
+++ b/include/net/inet6_hashtables.h
@@ -134,10 +134,14 @@ struct sock *inet6_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	if (!reuse_sk)
 		return sk;
 
-	/* We've chosen a new reuseport sock which is never refcounted. This
-	 * implies that sk also isn't refcounted.
+	/* egress bpf assignment can hold a reference on the prefetched
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
index 6e2fe186d0dc..787bf9e394a8 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -474,10 +474,14 @@ struct sock *inet_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	if (!reuse_sk)
 		return sk;
 
-	/* We've chosen a new reuseport sock which is never refcounted. This
-	 * implies that sk also isn't refcounted.
+	/* egress bpf assignment can hold a reference on the prefetched
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
index faa6dc49cea8..1d1204e4f754 100644
--- a/include/net/request_sock.h
+++ b/include/net/request_sock.h
@@ -103,6 +103,8 @@ static inline struct sock *skb_steal_sock(struct sk_buff *skb,
 	}
 
 	*prefetched = skb_sk_is_prefetched(skb);
+	*refcounted = true;
+#ifdef CONFIG_INET
 	if (*prefetched) {
 #if IS_ENABLED(CONFIG_SYN_COOKIES)
 		if (sk->sk_state == TCP_NEW_SYN_RECV && inet_reqsk(sk)->syncookie) {
@@ -114,10 +116,10 @@ static inline struct sock *skb_steal_sock(struct sk_buff *skb,
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
index ad414878dc5b..3b1f60eaa73e 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2871,6 +2871,13 @@ void sock_pfree(struct sk_buff *skb)
 	sock_gen_put(sk);
 }
 EXPORT_SYMBOL(sock_pfree);
+
+/* variant of sock_pfree for sockets where a refcount was explicitly taken */
+void sock_pfree_ref(struct sk_buff *skb)
+{
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423392;
	b=4DLBlCbiiBfYK2OlScMeK7Z9gRsVqx9P+8RYhPlz5tfHkjoTrXAymmekEv64bn2T2Te/
	 GxyRBTY/DK+mAZiRdkm2KcNgeO2PxuvCFTWqN9YfusAZ9rx9pLpTV4eMddmJMfpU8Z5GI
	 M8MWMsVNBVju09BIMVomC/FNeXBOWuJeBD/oUTVkIYufN6zHjw5j+03W9q+g0O9QrIQK5
	 Aq08qZOlCKXxCtdSn6OAByAscveG8eD9bNVBfDeIE47OfNsDDYPJ1WD9DHsidjYnaANfo
	 MAdAJvNlD5mOeul5P3wFyrdFzigc8FoQIa99qrTLaRCFHmenREJCqrov8hfGBA+eSLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CBIrGc2MWaw06JqurWdbfsggiM3MgsvPgye+6NxYKkg=;
	b=GC1k1jepog0MTl04i4YTrGRZ4uhzsHgIYP55QsG3P8rwiIE5NmrBqZrKVQPIAj+Bh8Wb
	 p15lpNLUVTgzGNAhbtekjzrWUrgE37j+ETzYZjoR5+J9+oUOVXgVUJ6SCurNgFkFmNtn5
	 Cr7WnnGYbR0Lz1xz9yMx/2UINbvenJK+Hq2n/hZIkJ4yxjhcvPYxYS3gjEGfTn41JG1RL
	 8iaPDr8HSWgH7wy304asHb7/CNcGgmSx7xG9NVrhSSXlnQh9Qd4+wBdn54gJ/9UA4u4Hj
	 cLgWUAZqitzAfOPN0OLLQGT6dD+LutMan9Iwb1IEgdquG1wi0M5z9rj8HzrERvdNLqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=PCbUfyD+;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168BA606A33D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168BA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=PCbUfyD+
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so36606475e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795423390; x=1796028190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBIrGc2MWaw06JqurWdbfsggiM3MgsvPgye+6NxYKkg=;
        b=PCbUfyD+MzcMTzKGLZWc8UavbD3wRHmmyXEKWks6LSJMl04uxyKv+0JoDPE2YBevM7
         sBAXXz1Z7NZ3j2ZJLVKZEljOCcQVGSo/zHLcBFwEfTEvHHOc3584c62r6IqqRBj8Pvxx
         Xf1JC3znCULHUsbL8RhQl+cQy/4oepLo1k87y6BJb0gS5yh6OGxNALld+70vYygeVCxi
         WiaTQ7lMF2OZN/8s0B7Apy8h+25Uu/9qDgsYVPpU4AxQOolbnOWJNKLjqsPzhKw7nCJg
         6qjAI6YDPVYa6OFVf3Yf0EudtBKVZMpIU2kodBvDnL58zemQ8HGhUCtvx6hIAdl1YWdw
         Wjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423390; x=1796028190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBIrGc2MWaw06JqurWdbfsggiM3MgsvPgye+6NxYKkg=;
        b=pZjv9rmNwPZXGLIb5DDJkvWDERvuqfZhyXWrYWdqZr8nHpg64CmnBqIPDQUNypRreu
         AEL1pdJuVtY4E2ktuy7JcfARGinJ51C3aF/3m9eBVW7IwOgX3XriYG4nEKdbdqIMYblh
         1NSCi5/WqnjBiI0Pw4EWqzJ0taRZJSkrBv7iwG9zLcr2bOfgcrUoxA1uWKk5RVJY2V7F
         XU1r35WSPr3/gqsniIrcjOy51YR4I8uZY/Ufc4Yuv6NnJfNMeQlH6GYtljN3xKePvJoc
         WQUlDBVrxtCqlQSOJmG+wAB7eODVWyxzmuijWmjVJu18oR87XoA3QsRnT4TnDwNb6Xza
         v2yA==
X-Forwarded-Encrypted: i=1; AL+hErFvKbhYQm8nei06xXWQ1/t8id6Ok+qtS0gsM3wp600IkokhzN3yS+8uwb88RzZHvX2BK+J7zWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w8699jCPM+tu/SJsnSH3C/Tlew+Js2Wklr12YrnbkNdEy6hoE
	aDJeWvvIM2F4/iA6Soy8niAwGgERimHNWa3TIr7EtHSOk0zD2x1yW1veC5cJv1ot9AQ=
X-Gm-Gg: AZFdTZdo2ThsuONcQJDEqwUDQKuhomkic4SVk0wkTG4/0Fwhrjke9uBeiWr+z+TI+5K
	B5ZwyAl0TMcJycinsoMrEb1qzPVdB2Rc/mC6RFt2RU1ZgVKq35VRCZKYusemnQhYkJiGQ3iik3F
	BmJS53GVdknxR6IfMRN1dA2HdEnlVDpQY2umntTyk2rbeIk5VyOtGBuDTwNX+ybAueO7Z/xS8Pu
	vOqR0+DUROLhyNTPDnKpAthvVOa1msZjX1EmM5wNYJyMJ/EYEJDsSV+uKosAG/l+FGqiIpUXcYD
	p8ljshW1DqDtKZxzD98oATlPZ0bVpEln9GwYNc8RmIjP+8dojWnlcbzXK7gp+9YIteImNejwqiQ
	llpTryGPcZj7nQpcuziYUujf1kZHzK24evsy1IMMx1SuLH7lqb6niO08hY0vv9npGSNpDpFu/OT
	yqBjleVbca7hQu00xX+aWIql1Z0DJHdzBT/VvDtA4cFtCzAqedOucB1FtDbkWkZLg9q4C3i5swL
	trtXCZvSPKwiokSJryGlkSWOJzpVVldKqaotRdAg5UO1MTy1Y7yGM9G6gLSv+XFDdHuamTlyUsB
	k6yATynuARPLcTqMUW9Clobm/A+ADl+2KuiHNVb0tz7hfBsrpLHV
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr221239065e9.16.1795423390381;
        Mon, 23 Nov 2026 00:43:10 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8526cbd0sm437670855e9.0.2026.11.23.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:43:09 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Martin KaFai Lau <kafai@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH bpf 1/2] bpf, net: validate assigned socket on receive
Date: Mon, 23 Nov 2026 10:41:37 +0200
Message-ID: <20261123084138.723275-2-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123084138.723275-1-razor@blackwall.org>
References: <20261123084138.723275-1-razor@blackwall.org>
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

bpf_sk_assign accepts any hashed socket and the rx path uses it without
checking against the packet which can also be rewritten after the
assignment. A TCP socket can then reach UDP receive, AF_INET socket
IPv6 receive, a v6only AF_INET6 socket IPv4 receive etc. A queued skb can
also be delivered in another netns than the one checked at assignment, e.g.
after an rx_handler forwards it to an upper device there.

Check the socket where it is consumed: inet_steal_sock and
inet6_steal_sock take the protocol of the caller and drop a prefetched
socket on a mismatch. Like bpf_sk_lookup_assign, IPv4 also rejects v6only
sockets which tcp_v6_conn_request would otherwise accept through
tcp_v4_conn_request. A syncookie request socket left on the skb is released
as well.

The normal packet path is not affected: the checks run only after the
prefetched test and the protocol is a constant at every call site. The
full socket test before the listener test is dropped as only TCP accepts
request and time wait sockets and they are never TCP_LISTEN. The release
of a mismatched socket is intentionally out of line, when inlined it adds
~220 bytes to each of tcp_v4_rcv, tcp_v6_rcv, udp_rcv and udpv6_rcv on
x86_64 for a path only a bad assignment takes.

Tested on v7.4-rc3 with KASAN: a tcx ingress program on a veth assigned
a tcp listener to an IPv4 udp datagram and udp receive used it:

  BUG: KASAN: null-ptr-deref in __udp_enqueue_schedule_skb+0x173/0x1300
  Read of size 4 at addr 0000000000000008 by task test_progs/88
  __udp_enqueue_schedule_skb (net/ipv4/udp.c:1697)
  udp_queue_rcv_one_skb (net/ipv4/udp.c:2365 net/ipv4/udp.c:2455)
  udp_unicast_rcv_skb (net/ipv4/udp.c:2627)
  udp_rcv (net/ipv4/udp.c:2687)
  ip_protocol_deliver_rcu (net/ipv4/ip_input.c:209)
  Kernel panic - not syncing: Fatal exception in interrupt

The problem was found during review of bpf_sk_assign egress support
patch-set.

Fixes: cf7fbe660f2d ("bpf: Add socket assign support")
Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
CC: Martin KaFai Lau <kafai@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: John Fastabend <john.fastabend@gmail.com>
CC: netdev@vger.kernel.org

 include/net/inet6_hashtables.h | 33 +++++++++++++++++++++++++--------
 include/net/inet_hashtables.h  | 34 ++++++++++++++++++++++++++--------
 include/net/inet_sock.h        |  2 ++
 net/ipv4/inet_hashtables.c     | 13 +++++++++++++
 net/ipv4/udp.c                 |  2 +-
 net/ipv6/udp.c                 |  2 +-
 6 files changed, 68 insertions(+), 18 deletions(-)

diff --git a/include/net/inet6_hashtables.h b/include/net/inet6_hashtables.h
index 2cc5d416bbb5..9733d5b84bda 100644
--- a/include/net/inet6_hashtables.h
+++ b/include/net/inet6_hashtables.h
@@ -102,11 +102,23 @@ static inline struct sock *__inet6_lookup(const struct net *net,
 				     daddr, hnum, dif, sdif);
 }
 
+static inline bool inet6_prefetched_sk_mismatch(const struct sock *sk,
+						const struct net *net,
+						u8 protocol)
+{
+	if (unlikely(sk->sk_family != AF_INET6 || !net_eq(sock_net(sk), net)))
+		return true;
+	if (!sk_fullsock(sk))
+		return unlikely(protocol != IPPROTO_TCP);
+	return unlikely(sk->sk_protocol != protocol);
+}
+
 static inline
 struct sock *inet6_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 			      const struct in6_addr *saddr, const __be16 sport,
 			      const struct in6_addr *daddr, const __be16 dport,
-			      bool *refcounted, inet6_ehashfn_t *ehashfn)
+			      bool *refcounted, inet6_ehashfn_t *ehashfn,
+			      u8 protocol)
 {
 	struct sock *sk, *reuse_sk;
 	bool prefetched;
@@ -115,16 +127,16 @@ struct sock *inet6_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	if (!sk)
 		return NULL;
 
-	if (!prefetched || !sk_fullsock(sk))
+	if (!prefetched)
 		return sk;
 
-	if (sk->sk_protocol == IPPROTO_TCP) {
+	if (unlikely(inet6_prefetched_sk_mismatch(sk, net, protocol)))
+		goto mismatch;
+
+	if (protocol == IPPROTO_TCP) {
 		if (sk->sk_state != TCP_LISTEN)
 			return sk;
-	} else if (sk->sk_protocol == IPPROTO_UDP) {
-		if (sk->sk_state != TCP_CLOSE)
-			return sk;
-	} else {
+	} else if (sk->sk_state != TCP_CLOSE) {
 		return sk;
 	}
 
@@ -140,6 +152,11 @@ struct sock *inet6_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	WARN_ON_ONCE(*refcounted);
 
 	return reuse_sk;
+
+mismatch:
+	inet_prefetched_sk_release(skb, sk, *refcounted);
+	*refcounted = false;
+	return NULL;
 }
 
 static inline struct sock *__inet6_lookup_skb(struct sk_buff *skb, int doff,
@@ -153,7 +170,7 @@ static inline struct sock *__inet6_lookup_skb(struct sk_buff *skb, int doff,
 	struct sock *sk;
 
 	sk = inet6_steal_sock(net, skb, doff, &ip6h->saddr, sport, &ip6h->daddr, dport,
-			      refcounted, inet6_ehashfn);
+			      refcounted, inet6_ehashfn, IPPROTO_TCP);
 	if (IS_ERR(sk))
 		return NULL;
 	if (sk)
diff --git a/include/net/inet_hashtables.h b/include/net/inet_hashtables.h
index 44b7e39a1245..ad8a7af17ddb 100644
--- a/include/net/inet_hashtables.h
+++ b/include/net/inet_hashtables.h
@@ -444,11 +444,24 @@ static inline struct sock *inet_lookup(struct net *net,
 	return sk;
 }
 
+static inline bool inet_prefetched_sk_mismatch(const struct sock *sk,
+					       const struct net *net,
+					       u8 protocol)
+{
+	if (unlikely(!net_eq(sock_net(sk), net)))
+		return true;
+	if (!sk_fullsock(sk))
+		return unlikely(protocol != IPPROTO_TCP);
+	return unlikely(sk->sk_protocol != protocol ||
+			(sk->sk_family == AF_INET6 && ipv6_only_sock(sk)));
+}
+
 static inline
 struct sock *inet_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 			     const __be32 saddr, const __be16 sport,
 			     const __be32 daddr, const __be16 dport,
-			     bool *refcounted, inet_ehashfn_t *ehashfn)
+			     bool *refcounted, inet_ehashfn_t *ehashfn,
+			     u8 protocol)
 {
 	struct sock *sk, *reuse_sk;
 	bool prefetched;
@@ -457,16 +470,16 @@ struct sock *inet_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	if (!sk)
 		return NULL;
 
-	if (!prefetched || !sk_fullsock(sk))
+	if (!prefetched)
 		return sk;
 
-	if (sk->sk_protocol == IPPROTO_TCP) {
+	if (unlikely(inet_prefetched_sk_mismatch(sk, net, protocol)))
+		goto mismatch;
+
+	if (protocol == IPPROTO_TCP) {
 		if (sk->sk_state != TCP_LISTEN)
 			return sk;
-	} else if (sk->sk_protocol == IPPROTO_UDP) {
-		if (sk->sk_state != TCP_CLOSE)
-			return sk;
-	} else {
+	} else if (sk->sk_state != TCP_CLOSE) {
 		return sk;
 	}
 
@@ -482,6 +495,11 @@ struct sock *inet_steal_sock(struct net *net, struct sk_buff *skb, int doff,
 	WARN_ON_ONCE(*refcounted);
 
 	return reuse_sk;
+
+mismatch:
+	inet_prefetched_sk_release(skb, sk, *refcounted);
+	*refcounted = false;
+	return NULL;
 }
 
 static inline struct sock *__inet_lookup_skb(struct sk_buff *skb,
@@ -496,7 +514,7 @@ static inline struct sock *__inet_lookup_skb(struct sk_buff *skb,
 	struct sock *sk;
 
 	sk = inet_steal_sock(net, skb, doff, iph->saddr, sport, iph->daddr, dport,
-			     refcounted, inet_ehashfn);
+			     refcounted, inet_ehashfn, IPPROTO_TCP);
 	if (IS_ERR(sk))
 		return NULL;
 	if (sk)
diff --git a/include/net/inet_sock.h b/include/net/inet_sock.h
index 24cbabc24582..840ec8495f51 100644
--- a/include/net/inet_sock.h
+++ b/include/net/inet_sock.h
@@ -403,6 +403,8 @@ static inline unsigned int __inet_ehashfn(const __be32 laddr,
 struct request_sock *inet_reqsk_alloc(const struct request_sock_ops *ops,
 				      struct sock *sk_listener,
 				      bool attach_listener);
+void inet_prefetched_sk_release(struct sk_buff *skb, struct sock *sk,
+				bool refcounted);
 
 static inline __u8 inet_sk_flowi_flags(const struct sock *sk)
 {
diff --git a/net/ipv4/inet_hashtables.c b/net/ipv4/inet_hashtables.c
index 860145d810ed..fbd0e0e67798 100644
--- a/net/ipv4/inet_hashtables.c
+++ b/net/ipv4/inet_hashtables.c
@@ -521,6 +521,19 @@ void sock_gen_put(struct sock *sk)
 }
 EXPORT_SYMBOL_GPL(sock_gen_put);
 
+/* release a prefetched socket that won't be used, drop the reference
+ * on @sk if @refcounted is set and orphan the skb to release any socket
+ * still attached to it (e.g. bpf syncookie request sock)
+ */
+void inet_prefetched_sk_release(struct sk_buff *skb, struct sock *sk,
+				bool refcounted)
+{
+	if (refcounted)
+		sock_gen_put(sk);
+	skb_orphan(skb);
+}
+EXPORT_SYMBOL_GPL(inet_prefetched_sk_release);
+
 void sock_edemux(struct sk_buff *skb)
 {
 	sock_gen_put(skb->sk);
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..6841e447a14f 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2673,7 +2673,7 @@ int udp_rcv(struct sk_buff *skb)
 		goto csum_error;
 
 	sk = inet_steal_sock(net, skb, sizeof(struct udphdr), saddr, uh->source, daddr, uh->dest,
-			     &refcounted, udp_ehashfn);
+			     &refcounted, udp_ehashfn, IPPROTO_UDP);
 	if (IS_ERR(sk))
 		goto no_sk;
 
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index a6886a0432f9..f51f2495f103 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -1116,7 +1116,7 @@ INDIRECT_CALLABLE_SCOPE int udpv6_rcv(struct sk_buff *skb)
 
 	/* Check if the socket is already available, e.g. due to early demux */
 	sk = inet6_steal_sock(net, skb, sizeof(struct udphdr), saddr, uh->source, daddr, uh->dest,
-			      &refcounted, udp6_ehashfn);
+			      &refcounted, udp6_ehashfn, IPPROTO_UDP);
 	if (IS_ERR(sk))
 		goto no_sk;
 
-- 
2.47.3


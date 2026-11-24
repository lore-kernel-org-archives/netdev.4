Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543569;
	b=ptXwfJYpxor/2ahItKRkxjrh5pl8YBnsroatbKOdKm7ZFbdJv81aks4VldPS3YcLfpAd
	 49DEuZDT0Ujq0qjxajYNR60s/uUoC2lZvT0hSfmv91pwcKIueQpszRWbLEzuXsTuNqb27
	 9P8DwOdYGXtCPmnL65TahS9lIvoPdNmzFs124hzuX/xOjle27yE/J1T2qgLyEX3cZKWAF
	 m9L1he1vlgN8PNW1pcIq6KO76DIoSFoK91n62QyFaKLeaFGwgGbdCcumuXd6GfQJRBbxi
	 DJoHZcQnk0o2NLK2coeEi15GJet33JzjerBtIe3iQOqArscc/thCS5VJTCY4G6vq93w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HbUi2SrRumGdrMXApO/Hn76zy4LvyTUPLeKOuIN0RAM=;
	b=xWXdw4cXtXcSMh38rwoH47804MnpufqkXVVVWpzbZ4YxdA/1+yGg6wnFxJKIwtTho2dc
	 2+blW4e678QoDgpIcDkgWtTCMZAdkMwVGWRsROtl2C5Cioy9GixnhRZRPgPYeSj/16h57
	 GGfUKnxuOBQVDNcj1hHw7j+sDXbpdcFRuKi0VWg7q1VW5jNvbxAN12P6lF5QhYOya5Nky
	 MK8+1yHhaUXBmdNalyVF/BLRfGN8hID8kGckK9s9rH3txvmXuWbqw/lebX4sD2B+cVEFE
	 tPwo0KUcmtHUOgC4llXrVdkaXDSU+KLm3nUK3mifVww2n986kCJXcHIZruNaypOqKAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mkw+lolN;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB1606A685
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DB1606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mkw+lolN
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso25589205e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795543566; x=1796148366; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbUi2SrRumGdrMXApO/Hn76zy4LvyTUPLeKOuIN0RAM=;
        b=mkw+lolNenNseVdNQFHEYUZT/fq70ZJXwGtin2NuW5K3CyDIej9LKdINVjUZVlA8U3
         heVAQ0XWBEXvyQBBIpH82DXmlB2IIk/c+08CFRt1Dfm4+uhvVvrOzfcHGPEddSW40IzW
         q8h+p8w1undbNUjDlTqv22JWlG67f6BdZf0s3CIIp5i7dBdjA4wHOVuVVZwd2ctl0f9q
         yw1rwzM93kzFStjZvj4OHOVNjdHYp67Red8OwyuOjacHosYaMeNOamtW3r0TEQ0ABnOQ
         3o0qagjgVebklFYMtu/QmGtclgL0/+1tzWeOPBXfKUtUxD0Z/NgGlUt20hMrO7yxvTrb
         oz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543566; x=1796148366;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbUi2SrRumGdrMXApO/Hn76zy4LvyTUPLeKOuIN0RAM=;
        b=KgCI5VJG254tQzZJTVGGCABoRDcPoljANA28gJkB5s6hFuYFke4tG0wm337V0SYmBI
         t+O+grniOZPdnpudrKLGdEntHQaZ1/odezb+g81UvFST7jHtM9om9Jq5nnftOoBj3OO5
         NxZq5dHTtDhiEH6tNVteIKWYfrurzrhgpEgUyi2Yls5qajCJ1nRWByk05uCEadzeBMkX
         CgaPphYFXGQ47Sg10Nm8epC7h0FEQ3gDUn3bjWKUkFtehAyj1aWhzveYnLg+farFYjQU
         Fhi07SRdWn0noLMM5NL89H3lIdmMGVBY57d24ztlD5mLresEj5XDXaA5z8mSixBxCejX
         MlEQ==
X-Forwarded-Encrypted: i=1; AL+hErHE0XovoKZXI6n/ZCGgXuDPjWVY0IM9AYlv4mp8LDH5EnmEKffNK1xMX7Thn3ZZSPJiJduZXwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NB4FAj9mrqDAs3cguL1fTT62n29Fo0CXtNFIz00IrvowE3q2A
	kWh7xTnkRjhUg0/Z+VRmSjwiuVM9kA0HNoPtMPMtF9avD8i1V1dDwmLiEyAmyN20mRJe+gmm+Q=
	=
X-Received: from wmbgz8.prod.google.com ([2002:a05:600c:8888:b0:4a1:989a:a866])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:530f:b0:4ba:6d8:dfad
 with SMTP id 5b1f17b1804b1-4bb88811eecmr302443925e9.14.1795543565846; Tue, 24
 Nov 2026 10:06:05 -0800 (PST)
Date: Tue, 24 Nov 2026 18:06:04 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.663.g77904e546d
Message-ID: <20261124180604.73257-1-dmnk@google.com>
Subject: [PATCH net v2] net: avoid clobbering active cork flowi union on
 datagram connect
From: Dominik Maier <dmnk@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com
Content-Type: text/plain; charset="UTF-8"

ip6_datagram_dst_update() and __ip4_datagram_connect() use inet->cork.fl
(and np->final in IPv6) for route lookups to avoid stack-allocated flow
structures on the common connect path.

When a UDP or raw socket already has corked frames queued on
sk->sk_write_queue via UDP_CORK or MSG_MORE, calling connect() (or
refreshing the route in ip6_datagram_release_cb()) overwrites the active
union flowi in place. On a dual-stack AF_INET6 UDP socket with a corked
IPv4 datagram, an IPv6 connect() overwrites inet->cork.fl.u.ip4 with
flowi6 bytes, and uncorking sends the pending IPv4 packet with the
aliased IPv6 bytes as saddr without CAP_NET_RAW (and symmetrically for
a corked IPv6 datagram followed by a v4-mapped connect()).

Keep using inet->cork.fl and np->final when sk->sk_write_queue is empty,
and fall back to noinline_for_stack helpers with stack-allocated flow
keys when corked frames are queued. Once a UDP cork finishes on a
connected socket, restore the connected flow in inet->cork.fl (keeping
sk_dst_cache warm on normal IPv4 and IPv6 UDP paths, and resetting
sk_dst_cache only on cross-family IPv4 cork completion on a native-IPv6
socket or non-UDP datagram callers) so subsequent connected sends and
L2TP encapsulation never reuse the corked flow.

Fixes: 3038eeac027d ("ipv4: Lock socket and use cork flow in ip4_datagram_connect().")
Fixes: 4e6c91cf60f2 ("ipv6: use inet->cork.fl.u.ip6 and np->final in ip6_datagram_dst_update()")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
v2:
- Restore the connected flow in inet->cork.fl when a UDP cork finishes
  (keeping sk_dst_cache warm on IPv4 and IPv6 UDP paths, and resetting
  sk_dst_cache on cross-family or non-UDP datagram cases), keeping both
  udp_sendmsg()'s lockless fast path and L2TP encapsulation from sending
  with the corked flow.
- Add Fixes: 3038eeac027d for __ip4_datagram_connect() and move the
  testing note below ---.
- v1: https://lore.kernel.org/netdev/20261119192147.2640881-1-dmnk@google.com/

Found with AI-assisted code review; tested in QEMU across dual-stack
IPv4/IPv6 cork + connect sequences and connected AF_INET UDP cork/send
fast paths (confirmed tail-call fast path with no stack frame growth).
 include/net/ipv6.h  |  1 +
 include/net/udp.h   | 21 +++++++++++++++++++++
 net/ipv4/datagram.c | 32 +++++++++++++++++++++++++++-----
 net/ipv4/udp.c      |  8 ++++++--
 net/ipv6/datagram.c | 33 +++++++++++++++++++++++++++------
 net/ipv6/udp.c      | 19 +++++++++++++++++--
 6 files changed, 99 insertions(+), 15 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 3de07e738538..f3a066a4ddbf 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1151,6 +1151,7 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *addr,
 int ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *addr, int addr_len);
 int ip6_datagram_connect_v6_only(struct sock *sk, struct sockaddr_unsized *addr,
 				 int addr_len);
+void ip6_datagram_flow_key_init(struct flowi6 *fl6, const struct sock *sk);
 int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr);
 void ip6_datagram_release_cb(struct sock *sk);
 
diff --git a/include/net/udp.h b/include/net/udp.h
index 5bc25dcf25fb..cee5ebd1edec 100644
--- a/include/net/udp.h
+++ b/include/net/udp.h
@@ -417,6 +417,27 @@ INDIRECT_CALLABLE_DECLARE(int udp_recvmsg(struct sock *sk, struct msghdr *msg,
 					  size_t len, int flags));
 void udp_splice_eof(struct socket *sock);
 int udp_push_pending_frames(struct sock *sk);
+static inline void udp_cork_restore_connected(struct sock *sk)
+{
+	struct inet_sock *inet = inet_sk(sk);
+	struct flowi4 *fl4 = &inet->cork.fl.u.ip4;
+
+	if (sk->sk_state != TCP_ESTABLISHED)
+		return;
+
+#if IS_ENABLED(CONFIG_IPV6)
+	if (sk->sk_family == AF_INET6 &&
+	    !ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
+		sk_dst_reset(sk);
+		return;
+	}
+#endif
+	WRITE_ONCE(fl4->daddr, READ_ONCE(inet->inet_daddr));
+	WRITE_ONCE(fl4->saddr, inet->inet_saddr);
+	WRITE_ONCE(fl4->fl4_dport, inet->inet_dport);
+	WRITE_ONCE(fl4->fl4_sport, inet->inet_sport);
+}
+
 void udp_flush_pending_frames(struct sock *sk);
 int udp_cmsg_send(struct sock *sk, struct msghdr *msg, u16 *gso_size);
 void udp4_hwcsum(struct sk_buff *skb, __be32 src, __be32 dst);
diff --git a/net/ipv4/datagram.c b/net/ipv4/datagram.c
index 7d25519a6cdd..987676251db4 100644
--- a/net/ipv4/datagram.c
+++ b/net/ipv4/datagram.c
@@ -16,17 +16,17 @@
 #include <net/tcp_states.h>
 #include <net/sock_reuseport.h>
 
-int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len)
+static int ____ip4_datagram_connect(struct sock *sk,
+				    struct sockaddr_unsized *uaddr,
+				    int addr_len, struct flowi4 *fl4)
 {
+	struct sockaddr_in *usin = (struct sockaddr_in *)uaddr;
 	struct inet_sock *inet = inet_sk(sk);
-	struct sockaddr_in *usin = (struct sockaddr_in *) uaddr;
-	struct flowi4 *fl4;
 	struct rtable *rt;
 	__be32 saddr;
 	int oif;
 	int err;
 
-
 	if (addr_len < sizeof(*usin))
 		return -EINVAL;
 
@@ -45,7 +45,6 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int
 	} else if (!oif) {
 		oif = READ_ONCE(inet->uc_index);
 	}
-	fl4 = &inet->cork.fl.u.ip4;
 	rt = ip_route_connect(fl4, usin->sin_addr.s_addr, saddr, oif,
 			      sk->sk_protocol, inet->inet_sport,
 			      usin->sin_port, sk);
@@ -82,6 +81,29 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int
 out:
 	return err;
 }
+
+static noinline_for_stack int
+__ip4_datagram_connect_corked(struct sock *sk, struct sockaddr_unsized *uaddr,
+			      int addr_len)
+{
+	struct flowi4 fl4;
+	int err;
+
+	err = ____ip4_datagram_connect(sk, uaddr, addr_len, &fl4);
+	if (!err && !sk_is_udp(sk))
+		sk_dst_reset(sk);
+	return err;
+}
+
+int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
+			   int addr_len)
+{
+	if (unlikely(!skb_queue_empty(&sk->sk_write_queue)))
+		return __ip4_datagram_connect_corked(sk, uaddr, addr_len);
+
+	return ____ip4_datagram_connect(sk, uaddr, addr_len,
+					&inet_sk(sk)->cork.fl.u.ip4);
+}
 EXPORT_SYMBOL(__ip4_datagram_connect);
 
 int ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len)
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..8fb1accc7fd4 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -1034,8 +1034,9 @@ void udp_flush_pending_frames(struct sock *sk)
 
 	if (up->pending) {
 		up->len = 0;
-		WRITE_ONCE(up->pending, 0);
 		ip_flush_pending_frames(sk);
+		udp_cork_restore_connected(sk);
+		WRITE_ONCE(up->pending, 0);
 	}
 }
 
@@ -1213,6 +1214,7 @@ int udp_push_pending_frames(struct sock *sk)
 
 out:
 	up->len = 0;
+	udp_cork_restore_connected(sk);
 	WRITE_ONCE(up->pending, 0);
 	return err;
 }
@@ -1496,8 +1498,10 @@ int udp_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
 		udp_flush_pending_frames(sk);
 	else if (!corkreq)
 		err = udp_push_pending_frames(sk);
-	else if (unlikely(skb_queue_empty(&sk->sk_write_queue)))
+	else if (unlikely(skb_queue_empty(&sk->sk_write_queue))) {
+		udp_cork_restore_connected(sk);
 		WRITE_ONCE(up->pending, 0);
+	}
 	release_sock(sk);
 
 out:
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ffbf983..d42398835084 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -38,8 +38,7 @@ static bool ipv6_mapped_addr_any(const struct in6_addr *a)
 	return ipv6_addr_v4mapped(a) && (a->s6_addr32[3] == 0);
 }
 
-static void ip6_datagram_flow_key_init(struct flowi6 *fl6,
-				       const struct sock *sk)
+void ip6_datagram_flow_key_init(struct flowi6 *fl6, const struct sock *sk)
 {
 	const struct inet_sock *inet = inet_sk(sk);
 	const struct ipv6_pinfo *np = inet6_sk(sk);
@@ -69,7 +68,8 @@ static void ip6_datagram_flow_key_init(struct flowi6 *fl6,
 	security_sk_classify_flow(sk, flowi6_to_flowi_common(fl6));
 }
 
-int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
+static int __ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr,
+				     struct flowi6 *fl6, struct in6_addr *final)
 {
 	struct ip6_flowlabel *flowlabel = NULL;
 	struct inet_sock *inet = inet_sk(sk);
@@ -77,7 +77,6 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 	struct ipv6_txoptions *opt;
 	struct in6_addr *final_p;
 	struct dst_entry *dst;
-	struct flowi6 *fl6;
 	int err = 0;
 
 	if (inet6_test_bit(SNDFLOW, sk) &&
@@ -86,12 +85,11 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 		if (IS_ERR(flowlabel))
 			return -EINVAL;
 	}
-	fl6 = &inet_sk(sk)->cork.fl.u.ip6;
 	ip6_datagram_flow_key_init(fl6, sk);
 
 	rcu_read_lock();
 	opt = flowlabel ? flowlabel->opt : rcu_dereference(np->opt);
-	final_p = fl6_update_dst(fl6, opt, &np->final);
+	final_p = fl6_update_dst(fl6, opt, final);
 	rcu_read_unlock();
 
 	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
@@ -119,6 +117,29 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 	return err;
 }
 
+static noinline_for_stack int
+ip6_datagram_dst_update_corked(struct sock *sk, bool fix_sk_saddr)
+{
+	struct in6_addr final;
+	struct flowi6 fl6;
+	int err;
+
+	err = __ip6_datagram_dst_update(sk, fix_sk_saddr, &fl6, &final);
+	if (!err && !sk_is_udp(sk))
+		sk_dst_reset(sk);
+	return err;
+}
+
+int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
+{
+	if (unlikely(!skb_queue_empty(&sk->sk_write_queue)))
+		return ip6_datagram_dst_update_corked(sk, fix_sk_saddr);
+
+	return __ip6_datagram_dst_update(sk, fix_sk_saddr,
+					 &inet_sk(sk)->cork.fl.u.ip6,
+					 &inet6_sk(sk)->final);
+}
+
 void ip6_datagram_release_cb(struct sock *sk)
 {
 	struct dst_entry *dst;
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index a6886a0432f9..344071574122 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -1267,6 +1267,17 @@ void udp_v6_early_demux(struct sk_buff *skb)
 /*
  * Throw away all pending data and cancel the corking. Socket is locked.
  */
+static void udp_v6_cork_restore_connected(struct sock *sk)
+{
+	if (sk->sk_state != TCP_ESTABLISHED)
+		return;
+
+	if (ipv6_addr_v4mapped(&sk->sk_v6_daddr))
+		udp_cork_restore_connected(sk);
+	else
+		ip6_datagram_flow_key_init(&inet_sk(sk)->cork.fl.u.ip6, sk);
+}
+
 static void udp_v6_flush_pending_frames(struct sock *sk)
 {
 	struct udp_sock *up = udp_sk(sk);
@@ -1275,8 +1286,9 @@ static void udp_v6_flush_pending_frames(struct sock *sk)
 		udp_flush_pending_frames(sk);
 	else if (up->pending) {
 		up->len = 0;
-		WRITE_ONCE(up->pending, 0);
 		ip6_flush_pending_frames(sk);
+		udp_v6_cork_restore_connected(sk);
+		WRITE_ONCE(up->pending, 0);
 	}
 }
 
@@ -1463,6 +1475,7 @@ static int udp_v6_push_pending_frames(struct sock *sk)
 			      &inet_sk(sk)->cork.base);
 out:
 	up->len = 0;
+	udp_v6_cork_restore_connected(sk);
 	WRITE_ONCE(up->pending, 0);
 	return err;
 }
@@ -1749,8 +1762,10 @@ int udpv6_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
 		udp_v6_flush_pending_frames(sk);
 	else if (!corkreq)
 		err = udp_v6_push_pending_frames(sk);
-	else if (unlikely(skb_queue_empty(&sk->sk_write_queue)))
+	else if (unlikely(skb_queue_empty(&sk->sk_write_queue))) {
+		udp_v6_cork_restore_connected(sk);
 		WRITE_ONCE(up->pending, 0);
+	}
 
 	if (err > 0)
 		err = inet6_test_bit(RECVERR6, sk) ? net_xmit_errno(err) : 0;
-- 
2.56.1.831.g720f3f5937-goog


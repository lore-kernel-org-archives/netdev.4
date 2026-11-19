Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116111;
	b=jbFIATcR1goarMY2jLTUY83pCDC7V6D82PlUInYc6ThuxEjBctGyOoOl3gNhAWixC4DI
	 Rq0BGeF9mYl6rm1wwCUcFdeoakegguj6NCivA07aW2t6Zf2njhY+SJFuQggWFwOT1uRqJ
	 c0IOiC+ZorgmMN66Qwtkc7l4r4/YUxSMdtZ/vrqq6NtGCptt9jOZVWyq95tEYP/UumCrB
	 ir7vhjjCeWAWyFaw9Xwk8UGfSbcGbHiMYB1pcCFQlhNu6rZxNllci0Ll1C4dRzarkAf27
	 xgH7QS8l9PMYnAtxOathW2HRTcr7c3csnSAUQELh0gpd894nP/tsosftxIjuiDoQM4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cQO3JkeY09+OszjGU6ZLr3X+BgYKyRaG0D3SwTI3dAY=;
	b=A+ocVVnEKHgaWe9c2r0bRj1jOd+Y6pHuIvDcJesA/bZZNhBwROBdN59EDqaprDpw3jFs
	 cHJv9wZWzqi7InKEaiQ+UWQD4n9Tdn6v5w/AyaKlMLFCAuOh0uDKdcQITQjg/EzNzgDMZ
	 Di1c9x6I42FOS0aw82OG1fs48Hdr6csNxWVECWTcrm82iZMOu+NK6h99Z8v2LOtfnh2hH
	 K3aMt6Sp/T70bkOjjJggFdAffq3w4vO71sTVHiOa5AFd+YY61iG6CzbgRiq3METh0MLTU
	 /wWERE5NryG+NZxW2dBCZCs1CA2Thi2oLArd0n3gJJlnnRU8SX44+uUHDszvwFO64/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPO4x8Ca;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91037606A330
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91037606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPO4x8Ca
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso373995e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116109; x=1795720909; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cQO3JkeY09+OszjGU6ZLr3X+BgYKyRaG0D3SwTI3dAY=;
        b=SPO4x8CaIylaA2mN4tl8s+idNi3+GqsoyGvVuRBOagFaXlquaDjvab2mF9gcO2orpf
         tIl2L6ieVEPO4empFI3+RdjRhvPl104VOmRTv3TKTBtkjGRNHXmu16N9u+tIxrBNL1at
         xqVQkxFKHAIS0yu7+56VUyUd0ixsmSKG2Gz3VJtkrTOKtWaSSMXOSaNHqkkyEo/KuMiG
         gm4UZMllaO/pwNswXkiUGa0uqnApXFI7SJ+QES6aPus9gEFBAOXealK2fzUHXSMS0NmD
         CnrAUXh6nLMSIzT9dvR+8iyFeZuLXklTg/TBNLImilkPtqvtcsoBliKqBBR8uBuhFj+s
         HQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116109; x=1795720909;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQO3JkeY09+OszjGU6ZLr3X+BgYKyRaG0D3SwTI3dAY=;
        b=GEcWFVvMaKMsSeyLrRuh1bRZZqyOrvxNs4ORtCyj6UVbvchTBgkHA9aC1JJixswJnE
         Hw9mxUJMNpruoz7R5s4jNWaH4dCZcX36wMW+Z5YrSMswJ4IGMz8n0B/BTNRGQR55wu6q
         vqdsq3Cb4AwIM/ApQsYEiURD2hZJqRovfO6U8u9zG5Npms2DaUixmyM4biut1RMhFHUB
         cw3rtaHnfz/dHKbtMTR/akTnw0lFRUkNbYvVMXJRQuGAkbjdpU/mhKE8eZxEsM0vWqZk
         nTmE67eJ6LVABSLUH7VwOEviSuISXJ+skMpp/Z30D/uyAtIBMCfGZuk8Qda7b+z4o/M1
         Kfwg==
X-Forwarded-Encrypted: i=1; AL+hErGlD6vuBQ7dwiwtW/Vw/ZE4H5U+lVYUMYhPIZSutlRrBskxXAkjiQFjHLnt7Df7Gi/dddE+pX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x4DAQp7+ikr475RO1gzm8KZi6ZsULv/T7XM3dLN9MRFHEzNtk
	Z5qgA4Xgs4H6CHC2cNE8xwhoHwNPE9bmDhaKjpPuia/OUW7J2aDf5FsR+YwwuuepY9zuS4a5Jg=
	=
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4bb:52ec:7054])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a085:b0:4a2:a9:ed87
 with SMTP id 5b1f17b1804b1-4bb88811c75mr13866865e9.19.1795116108898; Thu, 19
 Nov 2026 11:21:48 -0800 (PST)
Date: Thu, 19 Nov 2026 20:21:47 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192147.2640881-1-dmnk@google.com>
Subject: [PATCH net] net: avoid clobbering active cork flowi union on datagram connect
From: Dominik Maier <dmnk@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com, Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

ip6_datagram_dst_update() and __ip4_datagram_connect() reuse
inet->cork.fl (and np->final in IPv6) as scratch storage for route
lookups to avoid stack-allocated flow structures in the common connect
path.

However, a UDP or raw socket may already hold pending corked frames on
sk->sk_write_queue queued via UDP_CORK or MSG_MORE. Connecting such a
socket (or refreshing its route via ip6_datagram_release_cb()) before
flushing the corked queue overwrites the active union flowi in place.
On a dual-stack AF_INET6 UDP socket holding a corked IPv4 datagram, a
subsequent IPv6 connect() overwrites inet->cork.fl.u.ip4 with flowi6
bytes; uncorking then transmits the pending IPv4 packet using the
aliased IPv6 address bytes as flowi4.saddr, allowing unprivileged IPv4
source address spoofing without CAP_NET_RAW. The symmetric overwrite of
inet->cork.fl.u.ip4 in __ip4_datagram_connect() when an IPv6 or IPv4
cork is active predates the IPv6 change (since <= v4.19).

Keep using inet->cork.fl and np->final on the common fast path when
sk->sk_write_queue is empty so no stack canary is introduced, and fall
back to noinline_for_stack helpers with stack-allocated flow keys when
corked frames are pending.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available upon maintainers' request. The fix was compile-tested with
-Werror (confirming no stack canary on the fast path) and checked with
checkpatch.pl --strict; an equivalent fix was verified against the
reproducer in QEMU/KVM.

Fixes: 4e6c91cf60f2 ("ipv6: use inet->cork.fl.u.ip6 and np->final in ip6_datagram_dst_update()")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 net/ipv4/datagram.c | 28 +++++++++++++++++++++++-----
 net/ipv6/datagram.c | 26 ++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/datagram.c b/net/ipv4/datagram.c
index 7d25519..4fdad1d 100644
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
@@ -82,6 +81,25 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int
 out:
 	return err;
 }
+
+static noinline_for_stack int
+__ip4_datagram_connect_corked(struct sock *sk, struct sockaddr_unsized *uaddr,
+			      int addr_len)
+{
+	struct flowi4 fl4;
+
+	return ____ip4_datagram_connect(sk, uaddr, addr_len, &fl4);
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
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ff..dc64235 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -69,7 +69,8 @@ static void ip6_datagram_flow_key_init(struct flowi6 *fl6,
 	security_sk_classify_flow(sk, flowi6_to_flowi_common(fl6));
 }
 
-int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
+static int __ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr,
+				     struct flowi6 *fl6, struct in6_addr *final)
 {
 	struct ip6_flowlabel *flowlabel = NULL;
 	struct inet_sock *inet = inet_sk(sk);
@@ -77,7 +78,6 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 	struct ipv6_txoptions *opt;
 	struct in6_addr *final_p;
 	struct dst_entry *dst;
-	struct flowi6 *fl6;
 	int err = 0;
 
 	if (inet6_test_bit(SNDFLOW, sk) &&
@@ -86,12 +86,11 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
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
@@ -119,6 +118,25 @@ int ip6_datagram_dst_update(struct sock *sk, bool fix_sk_saddr)
 	return err;
 }
 
+static noinline_for_stack int
+ip6_datagram_dst_update_corked(struct sock *sk, bool fix_sk_saddr)
+{
+	struct in6_addr final;
+	struct flowi6 fl6;
+
+	return __ip6_datagram_dst_update(sk, fix_sk_saddr, &fl6, &final);
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
-- 
2.56.1.750.gf70dc682cf-goog


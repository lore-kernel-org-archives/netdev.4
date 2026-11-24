Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543565;
	b=do1zIp9K7Cr6Vbs6pcvB4ShTV45Nn7wn3bNt/mOr9DRAujRRRFgb0Lhj5yOYE/FcshM3
	 OlVU4QE24mFHbS/7oHoOuNH4ubNPg27NhfVsIP8mkUP0WmYb2tVQxmjcPJlHpS7LC0bkt
	 gqa2HuX7ds5+BKvHgt/ESpjf1DIO3qiaKqQWaQd+NNG2UYPxy4xX9mFauShxa4mX0YW0b
	 ZbcxZCTK+64vuNMbNK2QYsqU9RZKTev++qtm0SUjAPhGPjVnqyfRxjAH0aU9hu+mHjQZ7
	 G9H76pQ9prCBT5v3CEwIHGbvvHX4SMty4icDBVGLOXh2F0x/e7UlTpgtWv4DQLgtwzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f5gu+8IGUNUhcxLt26gNvMwLLlebFOs+L9+aw1SaNNI=;
	b=qTNNTfBxz6chOEUI5pHt1O7CBWzDQDmAYmbXjOjxGBC9oCkPAiz4mpvl8qfj1ngDGV7f
	 HAlAuvZMRGQCXI4P5dq2MkRwykCrOpKtqGglsgoA89KbmaVfbOqlUHnpLapTAVHtIwOCW
	 qgYXfcp2MCZ/KGapaBZTkgLq2VY65iUcE32TCs7/3Vd0JgdqZvws/13gKeQcCe1QlQ09h
	 RqTA00dOFE21yhb1c919caPBKvymrDk804nEztmLcGaQwiWVxbrAg4xzumdMOLUclw5T0
	 ysNcAhuqkJsHn3AmnmETfC4ZW804zD7oMNW+bs0/Vk9q9oolFR6x69SbtGfbnRZiFjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nooHXywI;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9272606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9272606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nooHXywI
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6ba62acd927so3876528a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795543563; x=1796148363; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5gu+8IGUNUhcxLt26gNvMwLLlebFOs+L9+aw1SaNNI=;
        b=nooHXywIC7TyTRqaXwGEy+u8FGYnksV3BtiBYv6IwICEeo4q5TAGFmdiEaQOYjfxET
         uHCHHRciu8JCYI1R2OGspaliP+rrYvF0GIfmiaOXMEA7/zgM6gOW9B8ppJ2vXcA282rR
         I+YkCBA7w09v9nFbFHJm05zgYekce2yw+ZP7lUrQuwKK0NaQJT+bD1DLqzqUnWttVwet
         i4JF2fKy/hhqUNKL79M/Erl6Yf8RT/9F+8tgQLOADydroqiZYVIkF2inQM4b3kedWczt
         vli+gAztrVI4HGaf3tSPF2gcoFaNRtoOyonUPqIZTotbpK9ci1hdFsomm28fj6tLQwKN
         kh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543563; x=1796148363;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5gu+8IGUNUhcxLt26gNvMwLLlebFOs+L9+aw1SaNNI=;
        b=z1MH28QfBDhYXl8RFh6GXLEkiYICHn48DhrzGOzToy+c2fiT5syDSCUOq7Al7DzSa+
         IM+KX8DhwzCQVSIxI1ell3e6SgxHn4GINeu1Yil5kzDc3iy9P8Ll5PyI817gdPChZ0Py
         8lSHcH9WKYUj/aYAcn8so+al1E/KX4PW7h2EHcmRw2o3owIeFjS0AKRqx/akBIJGRwrg
         O8mMmnHKDTv6lH3vpc7mby2W0B8+yWa5Rm/Dsy2dfgNWt1RIgAR8pyAF3PlSJcQ1j8L7
         kjXpZaQCtT4yrH6ohHg6sVDha2p/qDUNt+J/3KoGh4oGQzdsCuaMQU1VyK0+Obp2rMaS
         icng==
X-Forwarded-Encrypted: i=1; AL+hErEfTAOBubKjePkmnBjpEA2zew8PJBWMEN137JFUWud6To8f4VwaSIGr2iIPKC+kggsXIfJXbUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HkReCYZozCYrYgPkISf02zW7qjtcw/NQCf2PbZ6Ml4gCWRdds
	uWoHGqyGZkoxj2rLeMdoVjOaReGCSbNxFtJnXxx+952fEEcwaR0u6d1PnfXMvUOiTCaz8RF2qA=
	=
X-Received: from edc6.prod.google.com ([2002:a05:6402:4606:b0:6ba:9da8:6116])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4028:b0:6bb:791:ff67
 with SMTP id 4fb4d7f45d1cf-6bb079203damr1666991a12.5.1795543562703; Tue, 24
 Nov 2026 10:06:02 -0800 (PST)
Date: Tue, 24 Nov 2026 18:06:01 +0000
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
Message-ID: <20261124180601.71719-1-dmnk@google.com>
Subject: [PATCH net v2] inet: reject multicast and broadcast bind addresses on SOCK_STREAM
From: Dominik Maier <dmnk@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	Joanne Koong <joannelkoong@gmail.com>, netdev@vger.kernel.org, dmnk+artist@google.com
Content-Type: text/plain; charset="UTF-8"

__inet6_bind() rejects native IPv6 multicast addresses on SOCK_STREAM
sockets with -EINVAL, while __inet_bind() and the IPV6_ADDR_MAPPED path
of __inet6_bind() still accept IPv4 multicast and broadcast addresses.

Binding a multicast or broadcast address stores that address in
inet->inet_rcv_saddr while clearing inet->inet_saddr to 0. Because bind
conflict checks compare receive addresses, binding 224.0.0.1:PORT does
not conflict with another user's exclusive unicast 127.0.0.1:PORT
socket. A subsequent tcp_v4_connect() then sees !inet->inet_saddr and
calls inet_bhash2_update_saddr(), moving the active-open socket into the
unicast (port, saddr) bhash2 bucket without re-running
inet_csk_bind_conflict().

Reject multicast, limited broadcast, and FIB-confirmed subnet broadcast
addresses on SOCK_STREAM sockets with -EINVAL in __inet_bind() and in
the IPV6_ADDR_MAPPED branch of __inet6_bind(). Exempt INADDR_ANY
(ipv4_is_zeronet()) and verify non-lbcast RTN_BROADCAST results against
the FIB table so the missing-table RTN_BROADCAST fallback (such as in a
fresh network namespace with loopback still down or an empty VRF table)
does not reject early unicast or nonlocal binds.

Fixes: 28044fc1d495 ("net: Add a bhash2 table hashed by port and address")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
v2:
- Add inet_addr_is_mcast_or_bcast() to confirm non-lbcast RTN_BROADCAST
  against the FIB table so the missing-table RTN_BROADCAST fallback in a
  fresh netns (before lo is up) or an empty VRF table does not reject
  unicast or nonlocal binds.
- Move the testing note below ---.
- v1: https://lore.kernel.org/netdev/20261119192152.2643304-1-dmnk@google.com/

Found with AI-assisted code review; tested in QEMU across IPv4 and
v4-mapped IPv6 sockets, including fresh netns with loopback down, empty
VRF tables, IP_FREEBIND, multicast, limited broadcast, and subnet
directed broadcast.
 include/net/route.h     |  2 ++
 net/ipv4/af_inet.c      |  6 ++++++
 net/ipv4/fib_frontend.c | 24 ++++++++++++++++++++++++
 net/ipv6/af_inet6.c     |  7 +++++++
 4 files changed, 39 insertions(+)

diff --git a/include/net/route.h b/include/net/route.h
index 3fccd31eb74d..4fddeb902c5f 100644
--- a/include/net/route.h
+++ b/include/net/route.h
@@ -263,6 +263,8 @@ unsigned int inet_dev_addr_type(struct net *net, const struct net_device *dev,
 unsigned int inet_addr_type_dev_table(struct net *net,
 				      const struct net_device *dev,
 				      __be32 addr);
+bool inet_addr_is_mcast_or_bcast(struct net *net, u32 tb_id, __be32 addr,
+				 unsigned int addr_type);
 void ip_rt_multicast_event(struct in_device *);
 int ip_rt_ioctl(struct net *, unsigned int cmd, struct rtentry *rt);
 void ip_rt_get_source(u8 *src, struct sk_buff *skb, struct rtable *rt);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 8822bae439f8..a7d4d78b4b38 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -500,6 +500,12 @@ int __inet_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 	tb_id = l3mdev_fib_table_by_index(net, sk->sk_bound_dev_if) ? : tb_id;
 	chk_addr_ret = inet_addr_type_table(net, addr->sin_addr.s_addr, tb_id);
 
+	err = -EINVAL;
+	if (sk->sk_type == SOCK_STREAM &&
+	    inet_addr_is_mcast_or_bcast(net, tb_id, addr->sin_addr.s_addr,
+					chk_addr_ret))
+		goto out;
+
 	/* Not specified by any standard per-se, however it breaks too
 	 * many applications when removed.  It is unfortunate since
 	 * allowing applications to make a non-local bind solves
diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
index 8c123b111b3d..5968aa29f4ab 100644
--- a/net/ipv4/fib_frontend.c
+++ b/net/ipv4/fib_frontend.c
@@ -289,6 +289,30 @@ unsigned int inet_addr_type_dev_table(struct net *net,
 }
 EXPORT_SYMBOL(inet_addr_type_dev_table);
 
+bool inet_addr_is_mcast_or_bcast(struct net *net, u32 tb_id, __be32 addr,
+				 unsigned int addr_type)
+{
+	struct flowi4 fl4 = { .daddr = addr };
+	struct fib_result res;
+	bool is_bcast = false;
+	struct fib_table *tb;
+
+	if (addr_type == RTN_MULTICAST)
+		return true;
+	if (addr_type != RTN_BROADCAST || ipv4_is_zeronet(addr))
+		return false;
+	if (ipv4_is_lbcast(addr))
+		return true;
+
+	rcu_read_lock();
+	tb = fib_get_table(net, tb_id);
+	if (tb && !fib_table_lookup(tb, &fl4, &res, FIB_LOOKUP_NOREF))
+		is_bcast = res.type == RTN_BROADCAST;
+	rcu_read_unlock();
+	return is_bcast;
+}
+EXPORT_SYMBOL(inet_addr_is_mcast_or_bcast);
+
 __be32 fib_compute_spec_dst(struct sk_buff *skb)
 {
 	struct net_device *dev = skb->dev;
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b42a1a..2b5d5ee9d0df 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -322,6 +322,13 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 		/* Reproduce AF_INET checks to make the bindings consistent */
 		v4addr = addr->sin6_addr.s6_addr32[3];
 		chk_addr_ret = inet_addr_type_dev_table(net, dev, v4addr);
+		if (sk->sk_type == SOCK_STREAM &&
+		    inet_addr_is_mcast_or_bcast(net,
+						l3mdev_fib_table_rcu(dev) ? : RT_TABLE_LOCAL,
+						v4addr, chk_addr_ret)) {
+			err = -EINVAL;
+			goto out_unlock;
+		}
 		rcu_read_unlock();
 
 		if (!inet_addr_valid_or_nonlocal(net, inet, v4addr,
-- 
2.56.1.831.g720f3f5937-goog


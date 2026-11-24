Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543566;
	b=WqmOQLXyqXDTXzUcOnAj/ZTB5Q52mRAU6Nkwh/VdnvlbQz3p66DS143BhXlliFVa+RUs
	 c5uiZHN9cky1nmqf7PIXzmshvcnjy3S3LpXHKe+1z5tIiarwPxI/mgAMT1I7OC+kpB0IZ
	 HMrn2ZwdM6JVqwYVznkFIv7t7XCi2XBroKNoTH1YVQDuOiLvxp2fvoCNwFShuEKdtjx7Q
	 8n4L6OzqJqBArFYORNwtNSxAju84TdcZ8M+Cz/5q8+t0yRBtrGTIniM0sQ9ZMYkQuQGRt
	 5fzySJP9OhxYu7b3DC/b3VZ24bcLDivTLwnN+zpcIcMO9/Ao0lJVgYCv57RNiPcLToQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vgWAOL0V860QFpYrw3vZb4l4pJFeGIdKjE7LmMKQg2E=;
	b=gD6YrENxpD8B91WNYz7mZ9wBVhZnxyLi2a52R5T+aBgyv0rBkCYSojGzpWMtIUvImxgs
	 KaHGYKW3nBEhpDdzspToTEX/iKxE5881B3p80hN4GTx+JgfxxdHos5OIwHlIJbrYpHjGn
	 tYR9hcJNAmhgTIEVtuX+h5z/e/xd0s6/IQ02jEovgIbsjNxfXpi57mJWtGhOOWrBQXRhx
	 fTFAvWyW13gjj5Eq9jX+N3+qoFOeE2srXO7nYPMY0q1DajW1kKBR6b+JF3b2/TALGxlq9
	 sHKZYng7WI5NMFqzZaefnVvJHFbzWp+0ONkKVGr3vReRsprLX0l3sT5oU6zKCFpKICA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qm6i2EWz;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B8D606A687
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B8D606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qm6i2EWz
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso41607425e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795543565; x=1796148365; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgWAOL0V860QFpYrw3vZb4l4pJFeGIdKjE7LmMKQg2E=;
        b=Qm6i2EWzp63OEbILSi2+81mhmWXmjAQleqyXx6GWhP1sa0vjbbMN97fTUFbfrYhoYH
         +h3Yztfxzi6+aTo2JK1wpfnPs3CZVX5diK6RwE7dlRxh/RXiwvp2uSwgpYnHfstMEEKE
         TuzV7O5D4U9pqq/QpU8QTJvi8pQZmupwlt6WDzfh9z2GF2Qu5rMowUbcOwqKuROkuQvp
         BuIVdH0nv8X6dVY/j539N+qTKRmqXKP46XZzh6afSiLJbPYv89kJcbCRpJK6gMYQJaJE
         b2kgIwvyRIZ0LCWjdqtv9t59wdc6MSO7wIl8Ms+iAJNUco4ms6OoHRVK5/bQzLx0o/+f
         kz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543565; x=1796148365;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vgWAOL0V860QFpYrw3vZb4l4pJFeGIdKjE7LmMKQg2E=;
        b=cZI0C6YOTjsTEqVIvIEuZvcuAUTv+ce2zw8l/tSMe7Sg6Onmu1Urbl/JTIWzbwHJHA
         kQO/3j8XWQfQijUwMT6rgaiLMOKW8GsgGR1JPH9XNdLkYANxQYjS5rrXHayQhR9A0qM6
         fadywLcQje5EH1Au0v+bmw788XGRgFgRPzSowLKn/t/eo/kvynwvnk2u/WYTlUzSAqC5
         iWmPgwYLTCKLKIJZguCQro25MVrj2wddbUpDPGwifnJNjqHm9G7mvaY/xK8XFItqppqu
         +895Y3grXb3TA7FB+BGabmmNcEOrdK2Pu2ODY9ZIkB0iEh2j/wZJ7FJkIkz+w4sZOqFU
         KfFg==
X-Forwarded-Encrypted: i=1; AL+hErHXZQLo76dxgcZzMBWJ3JK7JqyT2VQGB1oP5cVMjvZOX2by7Q2puVLyfmK+ajsuJIxpKrUGcIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z990RVkY0VBg29IYzn+ZM/g0zB5bH5WANYpSqilKqLgbfq0wtu7
	wtamDU9Tsa0w4c00gfuSePUZF1Ei+i3eih6oqLTCVlee0sMWZvuX+ZrxQidRyvnE6FFUqayu9A=
	=
X-Received: from wmfq8.prod.google.com ([2002:a05:600c:2e48:b0:4bb:5bb3:d156])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:64c8:b0:4bb:6848:d433
 with SMTP id 5b1f17b1804b1-4bb8881d141mr306278615e9.26.1795543564207; Tue, 24
 Nov 2026 10:06:04 -0800 (PST)
Date: Tue, 24 Nov 2026 18:06:03 +0000
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
Message-ID: <20261124180603.72523-1-dmnk@google.com>
Subject: [PATCH net v2] udp: preserve explicit sk_bound_dev_if across __udp_disconnect()
From: Dominik Maier <dmnk@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org, 
	dmnk+artist@google.com
Content-Type: text/plain; charset="UTF-8"

sock_bindtoindex_locked() lets unprivileged users bind an unbound socket
to an interface via SO_BINDTODEVICE or SO_BINDTOIFINDEX, and requires
CAP_NET_RAW to clear or change sk_bound_dev_if afterwards. Sockets can
also get sk_bound_dev_if from a scoped bind() address or cgroup BPF
(such as ip vrf exec).

__udp_disconnect() unconditionally zeroes sk->sk_bound_dev_if on
AF_UNSPEC disconnect, which is only needed to undo an implicit scoped
interface selected at connect() time by __ip6_datagram_connect(). An
unprivileged user can bind a UDP socket to a disjoint interface alongside
another user's SO_BINDTODEVICE listener on the same port, disconnect via
AF_UNSPEC, and stay hashed on that port with sk_bound_dev_if reset to 0
(or clear a VRF binding without CAP_NET_RAW).

Save the pre-connect sk_bound_dev_if in struct inet_sock (using existing
padding holes on 64-bit) whenever __ip6_datagram_connect() updates
sk_bound_dev_if, so __udp_disconnect() restores either 0 (for previously
unbound sockets) or a prior VRF L3 master ifindex (when a VRF-bound
socket connected to an enslaved link-local peer). Clear the saved state
on explicit SO_BINDTODEVICE or scoped bind(), and hold lock_sock() across
rawv6, pingv6, and l2tp_ip6 disconnect callbacks to serialize with
connect(), bind(), and setsockopt().

Fixes: c427bfec18f2 ("net: core: enable SO_BINDTODEVICE for non-root users")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
v2:
- Save the prior sk_bound_dev_if in inet_sock instead of using an
  sk_userlocks flag, restoring a prior VRF L3 master binding when a
  scoped connect() to an enslaved device is disconnected and avoiding
  any RMW on sk_userlocks in __udp_disconnect().
- Hold lock_sock() in rawv6, pingv6, and l2tp_ip6 disconnect callbacks,
  and also clear saved connect state on ping6 and l2tp_ip6 binds.
- Move the testing note below ---.
- v1: https://lore.kernel.org/netdev/20261119192138.2635070-1-dmnk@google.com/

Found with AI-assisted code review; tested in QEMU across unprivileged
SO_BINDTODEVICE (including non-IPv6 sockets), scoped IPv6 bind and
connect, VRF master with multiple enslaved link-local interfaces, and
concurrent rawv6 disconnect.
 include/net/inet_sock.h | 20 ++++++++++++++++++++
 include/net/udp.h       |  1 +
 net/core/sock.c         |  1 +
 net/ipv4/ping.c         |  8 ++++++--
 net/ipv4/udp.c          | 17 ++++++++++++++++-
 net/ipv6/af_inet6.c     |  1 +
 net/ipv6/datagram.c     | 13 ++++++++++++-
 net/ipv6/ping.c         |  2 +-
 net/ipv6/raw.c          |  3 ++-
 net/l2tp/l2tp_ip6.c     | 14 ++++++++++----
 10 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/include/net/inet_sock.h b/include/net/inet_sock.h
index 24cbabc24582..069b1586a10a 100644
--- a/include/net/inet_sock.h
+++ b/include/net/inet_sock.h
@@ -241,10 +241,16 @@ struct inet_sock {
 	__u8			pmtudisc;
 	__u8			rcv_tos;
 	__u8			convert_csum;
+#if IS_ENABLED(CONFIG_IPV6)
+	bool			bound_dev_if_connect;
+#endif
 	int			uc_index;
 	int			mc_index;
 	__be32			mc_addr;
 	u32			local_port_range;	/* high << 16 | low */
+#if IS_ENABLED(CONFIG_IPV6)
+	int			bound_dev_if_orig;
+#endif
 
 	struct ip_mc_socklist __rcu	*mc_list;
 	struct inet_cork_full	cork;
@@ -450,4 +456,18 @@ static inline bool inet_addr_valid_or_nonlocal(struct net *net,
 		addr_type == RTN_BROADCAST;
 }
 
+static inline void inet6_clear_connect_ifindex(struct sock *sk)
+{
+#if IS_ENABLED(CONFIG_IPV6)
+	if (sk->sk_family == AF_INET6 && sk_fullsock(sk) &&
+	    sk->sk_prot->ipv6_pinfo_offset &&
+	    sk->sk_prot->obj_size >= sizeof(struct inet_sock)) {
+		struct inet_sock *inet = inet_sk(sk);
+
+		inet->bound_dev_if_connect = false;
+		inet->bound_dev_if_orig = 0;
+	}
+#endif
+}
+
 #endif	/* _INET_SOCK_H */
diff --git a/include/net/udp.h b/include/net/udp.h
index 5bc25dcf25fb..65c59686e347 100644
--- a/include/net/udp.h
+++ b/include/net/udp.h
@@ -424,6 +424,7 @@ int udp_rcv(struct sk_buff *skb);
 int udp_ioctl(struct sock *sk, int cmd, int *karg);
 int udp_pre_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len);
 int __udp_disconnect(struct sock *sk, int flags);
+int udp_locked_disconnect(struct sock *sk, int flags);
 int udp_disconnect(struct sock *sk, int flags);
 __poll_t udp_poll(struct file *file, struct socket *sock, poll_table *wait);
 struct sk_buff *skb_udp_tunnel_segment(struct sk_buff *skb,
diff --git a/net/core/sock.c b/net/core/sock.c
index 5675053625e6..54078b53d973 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -650,6 +650,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
+	inet6_clear_connect_ifindex(sk);
 
 	if (sk->sk_prot->rehash)
 		sk->sk_prot->rehash(sk);
diff --git a/net/ipv4/ping.c b/net/ipv4/ping.c
index 223a0108b74c..a160c24323d9 100644
--- a/net/ipv4/ping.c
+++ b/net/ipv4/ping.c
@@ -442,8 +442,12 @@ int ping_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len)
 	if (sk->sk_family == AF_INET && isk->inet_rcv_saddr)
 		sk->sk_userlocks |= SOCK_BINDADDR_LOCK;
 #if IS_ENABLED(CONFIG_IPV6)
-	if (sk->sk_family == AF_INET6 && !ipv6_addr_any(&sk->sk_v6_rcv_saddr))
-		sk->sk_userlocks |= SOCK_BINDADDR_LOCK;
+	if (sk->sk_family == AF_INET6) {
+		if (!ipv6_addr_any(&sk->sk_v6_rcv_saddr))
+			sk->sk_userlocks |= SOCK_BINDADDR_LOCK;
+		if (sk->sk_bound_dev_if != dif)
+			inet6_clear_connect_ifindex(sk);
+	}
 #endif
 
 	if (snum)
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..2673ff3b01d9 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2190,7 +2190,13 @@ int __udp_disconnect(struct sock *sk, int flags)
 	WRITE_ONCE(inet->inet_daddr, 0);
 	inet->inet_dport = 0;
 	sock_rps_reset_rxhash(sk);
-	WRITE_ONCE(sk->sk_bound_dev_if, 0);
+#if IS_ENABLED(CONFIG_IPV6)
+	if (sk->sk_family == AF_INET6 && inet->bound_dev_if_connect) {
+		WRITE_ONCE(sk->sk_bound_dev_if, inet->bound_dev_if_orig);
+		inet->bound_dev_if_orig = 0;
+		inet->bound_dev_if_connect = false;
+	}
+#endif
 	if (!(sk->sk_userlocks & SOCK_BINDADDR_LOCK)) {
 		inet_reset_saddr(sk);
 		if (sk->sk_prot->rehash &&
@@ -2207,6 +2213,15 @@ int __udp_disconnect(struct sock *sk, int flags)
 }
 EXPORT_SYMBOL(__udp_disconnect);
 
+int udp_locked_disconnect(struct sock *sk, int flags)
+{
+	lock_sock(sk);
+	__udp_disconnect(sk, flags);
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(udp_locked_disconnect);
+
 /* __udp_disconnect() takes a socket out of the 4-tuple hash table only via
  * ->rehash() or ->unhash(), and neither runs for a socket bound to a
  * specific address and port. Remove it here, before its peer is cleared.
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b42a1a..3724129b00e7 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -341,6 +341,7 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 					 * is supplied by user.
 					 */
 					sk->sk_bound_dev_if = addr->sin6_scope_id;
+					inet6_clear_connect_ifindex(sk);
 				}
 
 				/* Binding to link-local address requires an interface */
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ffbf983..fc29b48b7411 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -149,7 +149,8 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	__be32			fl6_flowlabel = 0;
 	__be32			old_fl6_flowlabel;
 	__be16			old_dport;
-	int			old_bound_dev_if;
+	int			old_bound_dev_if, old_orig_if;
+	bool			old_connect_if;
 	int			addr_type;
 	int			err;
 
@@ -221,6 +222,8 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 	}
 
 	old_bound_dev_if = sk->sk_bound_dev_if;
+	old_connect_if = inet->bound_dev_if_connect;
+	old_orig_if = inet->bound_dev_if_orig;
 
 	if (__ipv6_addr_needs_scope_id(addr_type)) {
 		if (addr_len >= sizeof(struct sockaddr_in6) &&
@@ -240,6 +243,12 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 			err = -EINVAL;
 			goto out;
 		}
+
+		if (sk->sk_bound_dev_if != old_bound_dev_if &&
+		    !inet->bound_dev_if_connect) {
+			inet->bound_dev_if_orig = old_bound_dev_if;
+			inet->bound_dev_if_connect = true;
+		}
 	}
 
 	/* save the current peer information before updating it */
@@ -264,6 +273,8 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 		sk->sk_v6_daddr = old_daddr;
 		np->flow_label = old_fl6_flowlabel;
 		inet->inet_dport = old_dport;
+		inet->bound_dev_if_connect = old_connect_if;
+		inet->bound_dev_if_orig = old_orig_if;
 		WRITE_ONCE(sk->sk_bound_dev_if, old_bound_dev_if);
 		goto out;
 	}
diff --git a/net/ipv6/ping.c b/net/ipv6/ping.c
index 6e90d0bf9f3d..481d966d2129 100644
--- a/net/ipv6/ping.c
+++ b/net/ipv6/ping.c
@@ -200,7 +200,7 @@ struct proto pingv6_prot = {
 	.close =	ping_close,
 	.pre_connect =	ping_v6_pre_connect,
 	.connect =	ip6_datagram_connect_v6_only,
-	.disconnect =	__udp_disconnect,
+	.disconnect =	udp_locked_disconnect,
 	.setsockopt =	ipv6_setsockopt,
 	.getsockopt =	ipv6_getsockopt,
 	.sendmsg =	ping_v6_sendmsg,
diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
index 00d832c7cdae..71c35f5230c0 100644
--- a/net/ipv6/raw.c
+++ b/net/ipv6/raw.c
@@ -255,6 +255,7 @@ static int rawv6_bind(struct sock *sk, struct sockaddr_unsized *uaddr,
 				 * one is supplied by user.
 				 */
 				sk->sk_bound_dev_if = addr->sin6_scope_id;
+				inet6_clear_connect_ifindex(sk);
 			}
 
 			/* Binding to link-local address requires an interface */
@@ -1214,7 +1215,7 @@ struct proto rawv6_prot = {
 	.close		   = rawv6_close,
 	.destroy	   = raw6_destroy,
 	.connect	   = ip6_datagram_connect_v6_only,
-	.disconnect	   = __udp_disconnect,
+	.disconnect	   = udp_locked_disconnect,
 	.ioctl		   = rawv6_ioctl,
 	.init		   = rawv6_init_sk,
 	.setsockopt	   = rawv6_setsockopt,
diff --git a/net/l2tp/l2tp_ip6.c b/net/l2tp/l2tp_ip6.c
index bdaae1b64d25..08fb1b6422cc 100644
--- a/net/l2tp/l2tp_ip6.c
+++ b/net/l2tp/l2tp_ip6.c
@@ -362,7 +362,10 @@ static int l2tp_ip6_bind(struct sock *sk, struct sockaddr_unsized *uaddr,
 
 	inet->inet_saddr = v4addr;
 	inet->inet_rcv_saddr = v4addr;
-	sk->sk_bound_dev_if = bound_dev_if;
+	if (sk->sk_bound_dev_if != bound_dev_if) {
+		sk->sk_bound_dev_if = bound_dev_if;
+		inet6_clear_connect_ifindex(sk);
+	}
 	sk->sk_v6_rcv_saddr = addr->l2tp_addr;
 	np->saddr = addr->l2tp_addr;
 
@@ -438,10 +441,13 @@ static int l2tp_ip6_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 
 static int l2tp_ip6_disconnect(struct sock *sk, int flags)
 {
-	if (sock_flag(sk, SOCK_ZAPPED))
-		return 0;
+	int err = 0;
 
-	return __udp_disconnect(sk, flags);
+	lock_sock(sk);
+	if (!sock_flag(sk, SOCK_ZAPPED))
+		err = __udp_disconnect(sk, flags);
+	release_sock(sk);
+	return err;
 }
 
 static int l2tp_ip6_getname(struct socket *sock, struct sockaddr *uaddr,
-- 
2.56.1.831.g720f3f5937-goog


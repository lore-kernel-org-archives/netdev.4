Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116101;
	b=NngL+wnqO3FrzluUhCoO8WW/UdJblXsujGamLi1IkU7fP/e46uwtDyjuch9LSp+RyGci
	 vr9HP7XvX5rzE2m52c2HHm1Mtrp/ld0akpb7/C5q4hJzsUJfYvHoneCDMd1+rzj986W/f
	 5enNrhEBrmlv6DpN6JoqHKZSheBfyZShbsAPIDT5Vw7D5dH4znWLi8cfTHEOxN4koCpFT
	 0/YjKBGc6ZW1HI2BCJErIvm//x0DRZuQ5IgoSbjEc6QffMYoj63+6FRu8vjTnqQqWpCib
	 rNuHQXb1AlW6vgMijIwbCuPnjE2o79aKbWZkDi7rJjMZWowEHdPtWNxXYkP61+zaiOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KA+AIq6ZwsbxBvep/7v3u6dpINbVFVguoBPLydSsM2g=;
	b=J45tZdMoo6hwsS8TCJQ+ai7fWHT6rqAPTbNQqDsmKnpV6gdIeBsr99e/F8CKr4a6c/IW
	 /4pI0JWEUP8HLnsE0+hLjKOVIvAUOQnekh+g4riIpUyPLknWC3M9JPQKSVtF70LAB2uhb
	 rJZSQTTgRn1p//6tvLoY7XZliTBvEil/AGBOXYg5wX6ywjM5WGmaT3kYURoMNpGt8Gjw9
	 p6ohxTA8L/nnMtpc9FkY4s1xgeRJHRSpI2oDwKIUoWC5O2GYQERGN+ZC9ZnPZO3hw8rmu
	 SdjZpZpqN4MkSQyLCLWikDvn7DoVor7ebHoQ6oXTi2m9p2GA2AbQTKcnABwHIXM4NOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XfvlqE+t;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADD606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24ADD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XfvlqE+t
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4ab855a8c21so31151f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116099; x=1795720899; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KA+AIq6ZwsbxBvep/7v3u6dpINbVFVguoBPLydSsM2g=;
        b=XfvlqE+tFmw7ogJlIYlfej/krlsuj+CrU8VzalBx1Dv3yfV8JvC3rAVbIe4KlNzMKg
         MkaS/21G9MsYRKHUFNPFtq5u+PkGXL/IcJvpNUKt87UBgTvi4cHDDTk5EuwZxDn77quM
         jwB4WO2Ke+SH8nNrNwMGveRD2Wp7+PlN+cOrBP3vIICGbls1BadVOziKH6nXbRRyUoFM
         AfZ+dvC0KFR7OixydT/uyJWV65D6LoSrzeqptHCSrJ1UEPZELnbz8FcIdj8bgBhjew35
         lH/XO4ZS2qr4zFxcFCmSePEz7Mv88bOLOv/NEha24l+eeQY/zlGfD0VJujKMG7YkSaup
         eobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116099; x=1795720899;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA+AIq6ZwsbxBvep/7v3u6dpINbVFVguoBPLydSsM2g=;
        b=w3aEc3glujHCGaXdb7qU+cikCW4/mAmY7S6eJzdfVCth1mGDorTJRGdxdTqf5fUy45
         VjxREF3Kft7Omz7icehuBvgCHNrzWzmARMNSK7knDjCo1Ywx/AECvwMu7Cs1LXg0ayNR
         BlSEywGEckDAVoYY8zvg0WYpUCtdxRpRQGtjnWGRFUfdq6WmyuMG1fIk1TyYeCwF2wqS
         OKoZa43V3Q/AERtcXdeQ6kRNSNa2wIyMpLQXMVVUoPoxNN44HigNdvNyJUabZBzTSnZ7
         Hs3dOGyiTdRM6n2D1gtYitVPWJcIr4LXFokEd4OZ4h6Dy/mS+1aD4ThDTsn/we3zb4Vb
         m1Hw==
X-Forwarded-Encrypted: i=1; AL+hErERsKzkJwMyPP7IlYQguUM4GDt+kNy0WG3q+Ow6FjDAsEfmfRwrlAxINYhlcAWNlbMu4+x7PVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qv+i5a3ZW1IX4Slrb1eWDHTQ/luT2ncrtTDIwCMJJ3i7nZTbi
	tMCKB4MSg5kw5zsaUNAiSstKCYKNqbY+5YFa6YjH6IaRjYVEvQ9eOe3bAeHP+lAX7bA32Ulyig=
	=
X-Received: from wrbgv29.prod.google.com ([2002:a05:6000:461d:b0:48e:662f:5b55])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:848d:b0:4bb:694e:496c
 with SMTP id 5b1f17b1804b1-4bb88810b39mr12868455e9.22.1795116099262; Thu, 19
 Nov 2026 11:21:39 -0800 (PST)
Date: Thu, 19 Nov 2026 20:21:38 +0100
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
Message-ID: <20261119192138.2635070-1-dmnk@google.com>
Subject: [PATCH net] udp: preserve explicit sk_bound_dev_if across __udp_disconnect()
From: Dominik Maier <dmnk@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, David Ahern <dsahern@gmail.com>, netdev@vger.kernel.org, 
	dmnk+artist@google.com, Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

sock_bindtoindex_locked() allows unprivileged users to bind an unbound
socket to a network interface via SO_BINDTODEVICE or SO_BINDTOIFINDEX,
and enforces CAP_NET_RAW before unbinding or changing sk_bound_dev_if
once set. Sockets may also have sk_bound_dev_if set via a scoped bind()
address or via cgroup BPF (such as ip vrf exec).

However, __udp_disconnect() unconditionally zeroes sk->sk_bound_dev_if
when disconnecting via AF_UNSPEC, which is only intended to undo
implicit scoped-address bindings assigned at connect() time by
__ip6_datagram_connect(). When a socket was also explicitly bound to an
address and port (SOCK_BINDADDR_LOCK | SOCK_BINDPORT_LOCK), it remains
hashed at the head of its UDP portaddr hash chain with sk_bound_dev_if
reset to 0. An unprivileged local user can therefore bind to a disjoint
interface index alongside another user's exclusive SO_BINDTODEVICE or
scoped UDP listener, disconnect via AF_UNSPEC, and intercept cross-UID
UDP packets on all interfaces (or clear a BPF-assigned VRF binding).

Add SOCK_CONNECT_IFINDEX to sk->sk_userlocks (matching
SOCK_CONNECT_BIND), set it in __ip6_datagram_connect() only when
sk->sk_bound_dev_if transitions from 0 to non-zero (clearing it again if
ip6_datagram_dst_update() fails), clear it when an explicit interface or
scoped bind overrides sk_bound_dev_if, and only reset
sk->sk_bound_dev_if in __udp_disconnect() when SOCK_CONNECT_IFINDEX is
set.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available on request. This revised SOCK_CONNECT_IFINDEX patch was
compile-tested with -Werror and checked with checkpatch.pl --strict; it
has not yet been runtime-tested against the reproducer or kernel
selftests.

Fixes: c427bfec18f2 ("net: core: enable SO_BINDTODEVICE for non-root users")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 include/net/sock.h  | 4 ++++
 net/core/sock.c     | 1 +
 net/ipv4/udp.c      | 5 ++++-
 net/ipv6/af_inet6.c | 1 +
 net/ipv6/datagram.c | 4 ++++
 net/ipv6/raw.c      | 1 +
 6 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index 3144efa..5700807 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1534,6 +1534,10 @@ static inline int __sk_prot_rehash(struct sock *sk)
  * define SOCK_CONNECT_BIND - &sock->sk_userlocks flag for auto-bind at connect() time
  */
 #define SOCK_CONNECT_BIND	16
+/**
+ * define SOCK_CONNECT_IFINDEX - &sock->sk_userlocks flag for scoped connect() ifindex
+ */
+#define SOCK_CONNECT_IFINDEX	32
 
 struct socket_alloc {
 	struct socket socket;
diff --git a/net/core/sock.c b/net/core/sock.c
index ad41487..211b7f1 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -650,6 +650,7 @@ static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 
 	/* Paired with all READ_ONCE() done locklessly. */
 	WRITE_ONCE(sk->sk_bound_dev_if, ifindex);
+	sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX;
 
 	if (sk->sk_prot->rehash)
 		sk->sk_prot->rehash(sk);
diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f..4943afe 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2190,7 +2190,10 @@ int __udp_disconnect(struct sock *sk, int flags)
 	WRITE_ONCE(inet->inet_daddr, 0);
 	inet->inet_dport = 0;
 	sock_rps_reset_rxhash(sk);
-	WRITE_ONCE(sk->sk_bound_dev_if, 0);
+	if (sk->sk_userlocks & SOCK_CONNECT_IFINDEX) {
+		WRITE_ONCE(sk->sk_bound_dev_if, 0);
+		sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX;
+	}
 	if (!(sk->sk_userlocks & SOCK_BINDADDR_LOCK)) {
 		inet_reset_saddr(sk);
 		if (sk->sk_prot->rehash &&
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index a9b8b4b..b402f0e 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -341,6 +341,7 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
 					 * is supplied by user.
 					 */
 					sk->sk_bound_dev_if = addr->sin6_scope_id;
+					sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX;
 				}
 
 				/* Binding to link-local address requires an interface */
diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
index ff7a7ff..36581c6 100644
--- a/net/ipv6/datagram.c
+++ b/net/ipv6/datagram.c
@@ -240,6 +240,8 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 			err = -EINVAL;
 			goto out;
 		}
+		if (!old_bound_dev_if)
+			sk->sk_userlocks |= SOCK_CONNECT_IFINDEX;
 	}
 
 	/* save the current peer information before updating it */
@@ -264,6 +266,8 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
 		sk->sk_v6_daddr = old_daddr;
 		np->flow_label = old_fl6_flowlabel;
 		inet->inet_dport = old_dport;
+		if (!old_bound_dev_if)
+			sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX;
 		WRITE_ONCE(sk->sk_bound_dev_if, old_bound_dev_if);
 		goto out;
 	}
diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
index 00d832c..643f732 100644
--- a/net/ipv6/raw.c
+++ b/net/ipv6/raw.c
@@ -255,6 +255,7 @@ static int rawv6_bind(struct sock *sk, struct sockaddr_unsized *uaddr,
 				 * one is supplied by user.
 				 */
 				sk->sk_bound_dev_if = addr->sin6_scope_id;
+				sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX;
 			}
 
 			/* Binding to link-local address requires an interface */
-- 
2.56.1.750.gf70dc682cf-goog


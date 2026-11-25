Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566168;
	b=slgUhoEIqnflNmRlnEPxnlA4sHxBE5KBPdn6L7uQjChAQJqjkS+6d2zCp6fUlNgnFY1O
	 6Hyg7NM6oZWop8BsC1jiC3P2WS9Nha1wdWXoUrl0sLncmkMyWeUMVbPta03+m+lFf91K+
	 lDVJyrLUfY+Uczgjvt69UliiJph6WtB432UBcYnLoX6W74hO6yJ+sOHUPI5axnRsbXOU9
	 LPL6eTTMcNNUaCzFSAN3erD6QyLUoQCmA4gqdcHGdCr4nN6mAyyYvrzGFhLO4LdvyUMhf
	 2CkySrCnYeZSf7c4sgVx7DR3pwG81KT8abJeMW9GJq1tetbP9X8UCfa+YkIy9kBSeUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fFHXo58/fNBdfaSZCGyJqa/5U7TOcz5+BW067Fe/1IU=;
	b=xRJbckOM8iV1oXah8n1rWRgOrxtyqaT0qFKmNepKtZ+D5lyJQN/H5oYqoOUZyJyRMKtu
	 E8QQUV/1Kv3FzQpXJlAx4seop5xEu6JH1AlWEAyCPC7e03FUnBsx0phdeXIqa3xsmKOss
	 MfPkp6GzLaMegV/jpMQZ5tFBiW03PS5lms8wYLPX8h8oEQeanTycDW+uTuKDnOi7WlgSf
	 +CTzTf73AgfdC/jK7kB2C0LGxCErqdUa/IzK4Pq6iIX4mSpiwKb3Q/TJ0pHxQ4GpBgAbq
	 T5XY6arxAtjeXKibRxoZd5b9OMx+Os1Z2qT/RN5Vs4cikL6xvfkkNpqGfTcDdhGOPpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=Q84vMVwo;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE73606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE73606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=Q84vMVwo
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3003370f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566166; x=1796170966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFHXo58/fNBdfaSZCGyJqa/5U7TOcz5+BW067Fe/1IU=;
        b=Q84vMVwoDZNQgAzJNZlilxcv/iQ1Cb0dv+hHwqGihFxDMueuznGGRUB2dCzO2eaxKJ
         7z8J8NltHhMnbgeRlqLj+XMxqPynj9OdOgEN+34A5kLCaFVUXpqqKPTmD0Drwk9qdwsz
         a35Xe6Vi/fpJmRZpA4mWfUJ4J1iWLqi8doVmg2yj4bHGOtZRmu/gk+mQqz1Dfo5Zm3JK
         46XZMqAHy2ls6Q+BR+PxLtPe2WUnXCUt0EDQj7N439y7sST1rd5TWzJeQrbw/7ZnuZZ1
         uFKHJvLX2jSFgVVlbE0MtrxT/1Cy/3o9h9c23pXwbW8SJArZkS8wnnGFyFmEz/o93V/N
         /dTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566166; x=1796170966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFHXo58/fNBdfaSZCGyJqa/5U7TOcz5+BW067Fe/1IU=;
        b=gveYLQ4k8sHBXhQZyTgSUoZoAy9PXg6Ib+fcn4kRnLLVSZA+/wr3Tvy8GNeXyau15h
         0cGmgsmNXMsXGbnAaRrsdUG0gWxu7IiHq/uj3/LD9/JtMFKNgOFjsp7Sj4opDBuZfanF
         Xm6MbJ/1+7x6Nq61SisyR0fdSYv4TNOHKImcoszokDQ2ggyNVMUjDsXNqvmrcTMwILMn
         u+uLqlz2wRIP3tGul4TlnfiA2ytn4S3zu7Jepryma7znVPSH7AOQB4p7bhvvKkWuL80p
         XCEYirK4FEdYmIQobajsJJiRmtxeWDpp6IQgUbAsxaqaisgGH3F/9c5Cijxw9ldjHhRI
         u8tA==
X-Gm-Message-State: APuU4Z8URtOJ3YePJTalWZaF02e/gBB7UuqA+PHef5CcihP2PG3y8xIQ
	BNU5zJ9tecVi/gf3KURUQV2hyy/56douNpNef/ofkrvkqj5ZYphMTO7DknFeJsBHXEGdbyKqaiT
	kpTJtNSdNkb9c82REGQ+ZNdvMsh14sJ7VmVtCbpfTqM3E4bLy4pe/UdwIIthb7Ob2X5Q=
X-Gm-Gg: AZFdTZfFioP0C/QTJ65nRE1JUc0oSDCs65B3+FAkUtKZZl97EwRib4XqQ4idfnsaCh5
	hi0GcaWipnuFIpUhH4JqTZrLol3HKCx4WMcW/bXC0b1fw/uwHrz8T1p/y3GUys+nIEiaPWqij5S
	RiLrgNsXtPyINLRVcjHHin89tRPt0v75BtaenHRsRB98tNGEmkK6IDeLK5TYBSzIgLtHZN0ifwa
	gjmokojdUwRv5I98zEwYIo31Bixonbk3qZm8NHJ05l9pYKHB0Y0jXi5dA3X4KyeglqH6BNspg/Z
	fsag/kDbzDDT6nY6KroZ/63G+owPETXjOA0mOoXL5ibH3YRPnELi8sqKCdmCraFgyEw2EmNfT6Q
	fP/2wU4iRpiHexSEukbtuNn2RRMmRtEwDXZWbbwhUMS4IhSWTwwteGp4chRn2dN0KjxIf5S5Mtd
	tMNQHTxf6wxqfjVAzuJBwQ6kr/oCYqBwu0cQslo14GWFaJVWYeNRI0zM1e/yKiH8XGl9D8vvu/W
	zW4HrZzeWacvhr3t2wj6hvekqLXoqE8YKKiyTO+HnIGaPS/S300OlsdGEIUoDpeRsAnwa3KFp+k
	1zQG36Q7ZgRiqTHnR9wghGXnpnIkUxrzRYAdC/qUiCUeVU4vYMYb
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr33601207f8f.42.1795566166626;
        Tue, 24 Nov 2026 16:22:46 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:45 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net 2/7] ovpn: validate sockets before attaching peer transports
Date: Wed, 25 Nov 2026 01:22:33 +0100
Message-ID: <20261125002239.1191542-3-antonio@openvpn.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125002239.1191542-1-antonio@openvpn.net>
References: <20261125002239.1191542-1-antonio@openvpn.net>
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

From: Ralf Lici <ralf@mandelbit.com>

ovpn accepts a userspace-provided socket and attaches transport-specific
state to it. The current checks use sk_protocol to select the UDP or TCP
attach path, but sk_protocol alone does not identify the socket layout.
For example, a raw socket can have sk_protocol set to IPPROTO_UDP while
its storage is not a struct udp_sock. Passing such a socket to the UDP
attach path would make ovpn read and write udp_sock fields on the wrong
object, potentially accessing memory beyond the actual socket storage.

Reject sockets unless they are real UDP datagram or TCP stream sockets
before attaching them to ovpn in the peer creation path. This lets
netlink report a clear error before calling the socket attach helper.

Also switch ovpn_socket_new to sk_is_tcp and sk_is_udp, matching the
netlink validation performed before the helper is called. This does not
change the accepted socket types, but makes the helper's assumptions
explicit.

Fixes: f6226ae7a0cd ("ovpn: introduce the ovpn_socket object")
Fixes: 1d36a36f6d53 ("ovpn: implement peer add/get/dump/delete via netlink")
Cc: stable@vger.kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/netlink.c | 15 +++++++++++++--
 drivers/net/ovpn/socket.c  | 16 +++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ovpn/netlink.c b/drivers/net/ovpn/netlink.c
index 5432bc2eb8e8..1af7e0e624ba 100644
--- a/drivers/net/ovpn/netlink.c
+++ b/drivers/net/ovpn/netlink.c
@@ -448,10 +448,21 @@ int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
 		goto peer_release;
 	}
 
+	/* sk_protocol is not enough to determine if this is a real UDP or TCP
+	 * socket
+	 */
+	if (!sk_is_udp(sock->sk) && !sk_is_tcp(sock->sk)) {
+		NL_SET_ERR_MSG_FMT_MOD(info->extack,
+				       "socket is not TCP or UDP");
+		sockfd_put(sock);
+		ret = -EOPNOTSUPP;
+		goto peer_release;
+	}
+
 	/* Only when using UDP as transport protocol the remote endpoint
 	 * can be configured so that ovpn knows where to send packets to.
 	 */
-	if (sock->sk->sk_protocol == IPPROTO_UDP &&
+	if (sk_is_udp(sock->sk) &&
 	    !attrs[OVPN_A_PEER_REMOTE_IPV4] &&
 	    !attrs[OVPN_A_PEER_REMOTE_IPV6]) {
 		NL_SET_ERR_MSG_FMT_MOD(info->extack,
@@ -465,7 +476,7 @@ int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
 	 * will just send bytes over it, without the need to specify a
 	 * destination.
 	 */
-	if (sock->sk->sk_protocol == IPPROTO_TCP &&
+	if (sk_is_tcp(sock->sk) &&
 	    (attrs[OVPN_A_PEER_REMOTE_IPV4] ||
 	     attrs[OVPN_A_PEER_REMOTE_IPV6])) {
 		NL_SET_ERR_MSG_FMT_MOD(info->extack,
diff --git a/drivers/net/ovpn/socket.c b/drivers/net/ovpn/socket.c
index 6cbeb2caaeec..4765f4063b71 100644
--- a/drivers/net/ovpn/socket.c
+++ b/drivers/net/ovpn/socket.c
@@ -126,13 +126,15 @@ static int ovpn_socket_attach(struct ovpn_socket *ovpn_sock,
 
 /**
  * ovpn_socket_new - create a new socket and initialize it
- * @sock: the kernel socket to embed
+ * @sock: the kernel socket to embed; must be a real UDP or TCP socket
  * @peer: the peer reachable via this socket
  *
  * Return: an openvpn socket on success or a negative error code otherwise
  */
 struct ovpn_socket *ovpn_socket_new(struct socket *sock, struct ovpn_peer *peer)
 {
+	const bool tcp = sk_is_tcp(sock->sk);
+	const bool udp = sk_is_udp(sock->sk);
 	struct ovpn_socket *ovpn_sock;
 	struct sock *sk = sock->sk;
 	int ret;
@@ -142,7 +144,7 @@ struct ovpn_socket *ovpn_socket_new(struct socket *sock, struct ovpn_peer *peer)
 	/* a TCP socket can only be owned by a single peer, therefore there
 	 * can't be any other user
 	 */
-	if (sk->sk_protocol == IPPROTO_TCP && sk->sk_user_data) {
+	if (tcp && sk->sk_user_data) {
 		ovpn_sock = ERR_PTR(-EBUSY);
 		goto sock_release;
 	}
@@ -150,7 +152,7 @@ struct ovpn_socket *ovpn_socket_new(struct socket *sock, struct ovpn_peer *peer)
 	/* a UDP socket can be shared across multiple peers, but we must make
 	 * sure it is not owned by something else
 	 */
-	if (sk->sk_protocol == IPPROTO_UDP) {
+	if (udp) {
 		u8 type = READ_ONCE(udp_sk(sk)->encap_type);
 
 		/* socket owned by other encapsulation module */
@@ -212,11 +214,11 @@ struct ovpn_socket *ovpn_socket_new(struct socket *sock, struct ovpn_peer *peer)
 	/* TCP sockets are per-peer, therefore they are linked to their unique
 	 * peer
 	 */
-	if (sk->sk_protocol == IPPROTO_TCP) {
+	if (tcp) {
 		INIT_WORK(&ovpn_sock->tcp_tx_work, ovpn_tcp_tx_work);
 		ovpn_sock->peer = peer;
 		ovpn_peer_hold(peer);
-	} else if (sk->sk_protocol == IPPROTO_UDP) {
+	} else if (udp) {
 		/* in UDP we only link the ovpn instance since the socket is
 		 * shared among multiple peers
 		 */
@@ -237,9 +239,9 @@ struct ovpn_socket *ovpn_socket_new(struct socket *sock, struct ovpn_peer *peer)
 
 	ret = ovpn_socket_attach(ovpn_sock, sock, peer);
 	if (ret < 0) {
-		if (sk->sk_protocol == IPPROTO_TCP)
+		if (tcp)
 			ovpn_peer_put(peer);
-		else if (sk->sk_protocol == IPPROTO_UDP)
+		else if (udp)
 			netdev_put(peer->ovpn->dev, &ovpn_sock->dev_tracker);
 
 		sock_put(sk);

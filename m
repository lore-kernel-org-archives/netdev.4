Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566171;
	b=c8K5otChmApQAjwrx30+fsVeyO3w43QsQmDdg5+xT2rkI+XfE17/i23QxNtJdmonuP53
	 /ZjXDP0hw8AN75ZlfZb3CpuQfkpb2hnT60F+JqvTzsn8OwQIjJBuU8VdcHmdstJQX3CEG
	 Q3qX9CSM6/fdKEThmyECL8xKRCoLCtSd2oxJr+7ss83FdFUSpTzjmLT+ROs2hA45+qGmo
	 7QoI6OVNsk+iPvr1HAapb6aF7DVpE8ASRe68Mzg/KxlF9Qe/ino+/e/uWZanjjg6WuGo+
	 0xO6A0nlr25U4qWYczfUN5FE+60RqQjWiuu3yaHMyM7DvILgwuTgFq1wuydvdrKegoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KHHHr0SM/T2s4jZq5GOtf7zF3qLtJzGFhWPknayndBg=;
	b=qPVr8dAA+MpNFFxQmzyioi2gQEMbh3D86RHNfA1XuCysDMo712PU/g0xWPoP1+4aNvjm
	 BngG4jnDWK0Ki/B0hm18JKTiSyhZrFORhhEWODyUEAjyt1LOX6MtxTCihk75JdLRm8+S4
	 w5OxRDAfPwkLzdQarPnruIrn0FqMormqes1IFHFHD7uwfkJ8td1U7DhaGrXqSB0P5NFgT
	 WeQi0mJJl70oLMh1lCwYbTmVyFBUV16rYE8Tnp24pJts5JDVyVc7NCHI9JXoHnnJCqqS2
	 rw1WYPIVR+qyaV2yjAikgWF3t7lH1RkjecHZ5nVipaxcM1B8Va5qqxAYmIN87PmG6eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=RSX1gcpR;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F125606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F125606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=RSX1gcpR
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2942418f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795566169; x=1796170969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHHHr0SM/T2s4jZq5GOtf7zF3qLtJzGFhWPknayndBg=;
        b=RSX1gcpRmM7s3A2Kg1OlCVI7K4wBkx9MR48RV4sItwz5qwf84r/nNC84xr6MRBuNha
         efLo/ufp1Cxdnp5WACLGGsVqPQKLvYv58zqstfw3BEZkjAD22OyMacbTOaEyDi0wSYWm
         PzCK03MhNXaGSkjEL+rpTJbqlDI/veguqarYGSIJCu/J3c5M9ssdturir9cGKZ4jmoO5
         p3DHLiHZ+QvRl8wRF3dAEKrDcGnNRoaDPZLLdERec2q/u8oELURPBBF8Wj9KuGTxQXLo
         Mo9LgKlmG6iWjiszTrmKfADAuKoastPxx7eDgElUNiTXeJrWUG1+3U6+qmz45HfzN4NT
         cGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566169; x=1796170969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHHHr0SM/T2s4jZq5GOtf7zF3qLtJzGFhWPknayndBg=;
        b=I1h902jpULcwOpXVvxTfKGIxiWRC+70088ZBhcOELx0d6edCE40zFOcHMm5MaclMHw
         SxDxM8qie2mrXlsLHXqfTny9TzUKYcfV8jG2htkEO0IVCP0iQBZN/jtWAwiUxPf1+yiv
         hd4zlC17Q1tosBkA8aurGJwTKPK/3Psh5uMGAr3Cw0Xhe8kuQG0P+5gijGKMuDQxV+TQ
         PquaH7sOkfSTDdPEkIVzCSbZZ4Pbghc+kmkRgn8i62ElsgZYyQ8xiA+SOvxj3WZTMTig
         OItweFKp8P64XEJEnCW1VOXrRgB6PcthexOpDQyqDAHwRtrCmm6O9Th1U4eFBcgOYEcG
         f0xg==
X-Gm-Message-State: APuU4Z87P5L82a/swXNxVXvCtRJl0w3q6YDjTaeZrevcA130F8/YKaWy
	3WCECajcN/URE+S4MC0Z4Uz8meEzytttUShu69Jyq0eK300AB12WZTAfIqpGD0QTkbKclXIuHWQ
	jF1S1IB9VjxpXCYljljKnWht1tESksMErX9vj7Bfvqzm7gYRUrIZmK5OxrHx3urBlNVU=
X-Gm-Gg: AZFdTZd6/7ar+XoM+Fi2xOHyBlbNkfL1AjbUxZu8n+JJXT4vOxJg+TZn0PtB4qO+tlG
	eHVa5s03jvgJtf2nZJsI6ZUhxbxI96PUpSUZDV0O/gjSDQDgjyFomb55CqFhez3FkUYw3KREbvK
	fz4misf7ZbDcjBEl53CDRNOATEsiWrjp7jb9TSStgC6K7RjgeOkZ1Xzw94LLXTQfwC7272KG8eb
	kdSRhdIUm/VGvlV34u2HR8go7H3+u3A1Is1evm2PG3HuhhRIv3A43cI5WB9e3+imWkmYzTHYhi/
	O/ECdJmaj6NCevBcT/xV/K6vVSVX2TTHuZRt0GM1eqBmX+xq/FszIE4qbDLwlKkdHTqLsux7S36
	opXmLqzjiDHgyvIMa1q16abXMgfU3CdSH+agUMUtM2yMUev/9D71rOPRqfTrKygqG0ZLBLCpwjf
	CK1XkoajPU87hkF2mMoX/vVsDXKN6GtBWy6W7iIlVpk67lgnXDwhLOuPgLnJahv7Hb5wUclIitn
	XHQbLL/uNq4D724xLofgC4OgOh9k+Ap3OuL46x9UB85KovIiCr/dmoBOOyQ6UNvACafDheXFh6z
	L3aGQRPPACFrddDItnXZLr+MSCT8/LgxO5AHJt4Lg/RRmIPmcw0Z
X-Received: by 2002:a05:6000:200e:b0:4aa:76ce:4b9f with SMTP id ffacd0b85a97d-4abb6746af3mr31641905f8f.56.1795566168947;
        Tue, 24 Nov 2026 16:22:48 -0800 (PST)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:5c82:5cd3:7bc5:2809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm31518448f8f.16.2026.11.24.16.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:22:47 -0800 (PST)
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
Subject: [PATCH net 3/7] ovpn: reject UDP remotes incompatible with socket family
Date: Wed, 25 Nov 2026 01:22:34 +0100
Message-ID: <20261125002239.1191542-4-antonio@openvpn.net>
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

ovpn accepts a userspace-provided socket and a peer remote endpoint
through netlink. For UDP peers, the remote endpoint family selects the
transmit path used later by ovpn_udp_output.

Reject UDP peer remotes that are incompatible with the socket state when
they are configured through netlink. An IPv4 UDP socket cannot be used
with an IPv6 remote endpoint, and an IPv6-only UDP socket cannot receive
from an IPv4 remote endpoint. Reporting this at setup time gives
userspace a clear extack and avoids installing a peer that cannot work.

Accepting an IPv6 remote on an AF_INET socket is also unsafe. On TX,
ovpn_udp6_output() hands the socket to ip6_dst_lookup_flow(), which
dereferences inet6_sk(sk), e.g. to read srcprefs in
ip6_route_output_flags() when no local address is set. inet6_sk() is
NULL for AF_INET sockets, therefore the first packet sent to such a
peer triggers a NULL pointer dereference.

This validation only covers the socket state visible while the netlink
request is handled. The socket remains owned by userspace after it is
attached to ovpn, so userspace can later change properties such as
IPV6_V6ONLY or IPV6_ADDRFORM. The transmit path therefore still has to
re-check socket/remote compatibility before sending.

Parse the remote endpoint once in the peer new/set paths and reject UDP
remotes when the provided socket cannot send to them. Pass the parsed
endpoint into the common peer modify helper so the validation and the
stored endpoint use the same normalized sockaddr.

Fixes: 1d36a36f6d53 ("ovpn: implement peer add/get/dump/delete via netlink")
Cc: stable@vger.kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 drivers/net/ovpn/netlink.c | 128 ++++++++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 36 deletions(-)

diff --git a/drivers/net/ovpn/netlink.c b/drivers/net/ovpn/netlink.c
index 1af7e0e624ba..bf27a7a89f76 100644
--- a/drivers/net/ovpn/netlink.c
+++ b/drivers/net/ovpn/netlink.c
@@ -310,15 +310,17 @@ static int ovpn_nl_peer_precheck(struct ovpn_priv *ovpn,
  * @peer: the peer to modify
  * @info: generic netlink info from the user request
  * @attrs: the attributes from the user request
+ * @remote: remote address, if provided
  *
  * Return: a negative error code in case of failure, 0 on success or 1 on
  *	   success and the VPN IPs have been modified (requires rehashing in MP
  *	   mode)
  */
 static int ovpn_nl_peer_modify(struct ovpn_peer *peer, struct genl_info *info,
-			       struct nlattr **attrs)
+			       struct nlattr **attrs,
+			       const struct sockaddr_storage *remote)
 {
-	struct sockaddr_storage ss = {};
+	struct sockaddr_storage empty_remote = {};
 	void *local_ip = NULL;
 	u32 interv, timeout;
 	bool rehash = false;
@@ -326,15 +328,15 @@ static int ovpn_nl_peer_modify(struct ovpn_peer *peer, struct genl_info *info,
 
 	spin_lock_bh(&peer->lock);
 
-	if (ovpn_nl_attr_sockaddr_remote(attrs, &ss)) {
+	if (remote) {
 		/* we carry the local IP in a generic container.
 		 * ovpn_peer_reset_sockaddr() will properly interpret it
-		 * based on ss.ss_family
+		 * based on remote->ss_family
 		 */
 		local_ip = ovpn_nl_attr_local_ip(attrs);
 
 		/* set peer sockaddr */
-		ret = ovpn_peer_reset_sockaddr(peer, &ss, local_ip);
+		ret = ovpn_peer_reset_sockaddr(peer, remote, local_ip);
 		if (ret < 0) {
 			NL_SET_ERR_MSG_FMT_MOD(info->extack,
 					       "cannot set peer sockaddr: %d",
@@ -372,7 +374,7 @@ static int ovpn_nl_peer_modify(struct ovpn_peer *peer, struct genl_info *info,
 
 	netdev_dbg(peer->ovpn->dev,
 		   "modify peer id=%u tx_id=%u endpoint=%pIScp VPN-IPv4=%pI4 VPN-IPv6=%pI6c\n",
-		   peer->id, peer->tx_id, &ss,
+		   peer->id, peer->tx_id, remote ?: &empty_remote,
 		   &peer->vpn_addrs.ipv4.s_addr, &peer->vpn_addrs.ipv6);
 
 	spin_unlock_bh(&peer->lock);
@@ -383,12 +385,45 @@ static int ovpn_nl_peer_modify(struct ovpn_peer *peer, struct genl_info *info,
 	return ret;
 }
 
+/**
+ * ovpn_nl_udp_remote_compatible - check if a UDP socket can use a remote
+ * @sk: UDP socket to validate
+ * @remote: remote endpoint to validate against the socket
+ * @extack: netlink extended ACK for reporting validation errors
+ *
+ * Return: 0 if the remote endpoint is compatible with the socket or a negative
+ * error code otherwise.
+ */
+static int ovpn_nl_udp_remote_compatible(const struct sock *sk,
+					 const struct sockaddr_storage *remote,
+					 struct netlink_ext_ack *extack)
+{
+	const unsigned short sock_family = READ_ONCE(sk->sk_family);
+
+	if (sock_family == AF_INET && remote->ss_family == AF_INET6) {
+		NL_SET_ERR_MSG_FMT_MOD(extack,
+				       "UDP socket is IPv4 but remote is IPv6");
+		return -EAFNOSUPPORT;
+	}
+
+	if (sock_family == AF_INET6 && ipv6_only_sock(sk) &&
+	    remote->ss_family == AF_INET) {
+		NL_SET_ERR_MSG_FMT_MOD(extack,
+				       "UDP socket is IPv6-only but remote is IPv4");
+		return -EAFNOSUPPORT;
+	}
+
+	return 0;
+}
+
 int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct in_addr vpn_addr4 = { .s_addr = htonl(INADDR_ANY) };
+	const struct sockaddr_storage *remote = NULL;
 	struct in6_addr vpn_addr6 = IN6ADDR_ANY_INIT;
 	struct ovpn_priv *ovpn = info->user_ptr[0];
 	struct nlattr *attrs[OVPN_A_PEER_MAX + 1];
+	struct sockaddr_storage ss = {};
 	struct ovpn_socket *ovpn_sock;
 	struct socket *sock = NULL;
 	struct ovpn_peer *peer;
@@ -459,26 +494,34 @@ int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
 		goto peer_release;
 	}
 
-	/* Only when using UDP as transport protocol the remote endpoint
-	 * can be configured so that ovpn knows where to send packets to.
-	 */
-	if (sk_is_udp(sock->sk) &&
-	    !attrs[OVPN_A_PEER_REMOTE_IPV4] &&
-	    !attrs[OVPN_A_PEER_REMOTE_IPV6]) {
-		NL_SET_ERR_MSG_FMT_MOD(info->extack,
-				       "missing remote IP address for UDP socket");
-		sockfd_put(sock);
-		ret = -EINVAL;
-		goto peer_release;
-	}
+	if (ovpn_nl_attr_sockaddr_remote(attrs, &ss))
+		remote = &ss;
 
-	/* In case of TCP, the socket is connected to the peer and ovpn
-	 * will just send bytes over it, without the need to specify a
-	 * destination.
-	 */
-	if (sk_is_tcp(sock->sk) &&
-	    (attrs[OVPN_A_PEER_REMOTE_IPV4] ||
-	     attrs[OVPN_A_PEER_REMOTE_IPV6])) {
+	if (sk_is_udp(sock->sk)) {
+		/* Only when using UDP as transport protocol the remote
+		 * endpoint can be configured so that ovpn knows where to send
+		 * packets to.
+		 */
+		if (!remote) {
+			NL_SET_ERR_MSG_FMT_MOD(info->extack,
+					       "missing remote IP address for UDP socket");
+			sockfd_put(sock);
+			ret = -EINVAL;
+			goto peer_release;
+		}
+
+		/* can the socket be used with this remote? */
+		ret = ovpn_nl_udp_remote_compatible(sock->sk, remote,
+						    info->extack);
+		if (ret < 0) {
+			sockfd_put(sock);
+			goto peer_release;
+		}
+	} else if (remote) {
+		/* In case of TCP, the socket is connected to the peer and ovpn
+		 * will just send bytes over it, without the need to specify a
+		 * destination.
+		 */
 		NL_SET_ERR_MSG_FMT_MOD(info->extack,
 				       "unexpected remote IP address with TCP socket");
 		sockfd_put(sock);
@@ -504,7 +547,7 @@ int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
 
 	rcu_assign_pointer(peer->sock, ovpn_sock);
 
-	ret = ovpn_nl_peer_modify(peer, info, attrs);
+	ret = ovpn_nl_peer_modify(peer, info, attrs, remote);
 	if (ret < 0)
 		goto sock_release;
 
@@ -533,8 +576,10 @@ int ovpn_nl_peer_new_doit(struct sk_buff *skb, struct genl_info *info)
 
 int ovpn_nl_peer_set_doit(struct sk_buff *skb, struct genl_info *info)
 {
+	const struct sockaddr_storage *remote = NULL;
 	struct ovpn_priv *ovpn = info->user_ptr[0];
 	struct nlattr *attrs[OVPN_A_PEER_MAX + 1];
+	struct sockaddr_storage ss = {};
 	struct in6_addr vpn_addr6;
 	struct in_addr vpn_addr4;
 	struct ovpn_socket *sock;
@@ -568,17 +613,28 @@ int ovpn_nl_peer_set_doit(struct sk_buff *skb, struct genl_info *info)
 		return -ENOENT;
 	}
 
-	/* when using a TCP socket the remote IP is not expected */
+	if (ovpn_nl_attr_sockaddr_remote(attrs, &ss))
+		remote = &ss;
+
 	rcu_read_lock();
 	sock = rcu_dereference(peer->sock);
-	if (sock && sock->sk->sk_protocol == IPPROTO_TCP &&
-	    (attrs[OVPN_A_PEER_REMOTE_IPV4] ||
-	     attrs[OVPN_A_PEER_REMOTE_IPV6])) {
-		rcu_read_unlock();
-		NL_SET_ERR_MSG_FMT_MOD(info->extack,
-				       "unexpected remote IP address with TCP socket");
-		ovpn_peer_put(peer);
-		return -EINVAL;
+	if (sock && remote) {
+		if (sk_is_udp(sock->sk)) {
+			ret = ovpn_nl_udp_remote_compatible(sock->sk, remote,
+							    info->extack);
+			if (ret < 0) {
+				rcu_read_unlock();
+				ovpn_peer_put(peer);
+				return ret;
+			}
+		} else if (sk_is_tcp(sock->sk)) {
+			/* when using a TCP socket remote IP is not expected */
+			NL_SET_ERR_MSG_FMT_MOD(info->extack,
+					       "unexpected remote IP address with TCP socket");
+			rcu_read_unlock();
+			ovpn_peer_put(peer);
+			return -EINVAL;
+		}
 	}
 	rcu_read_unlock();
 
@@ -607,7 +663,7 @@ int ovpn_nl_peer_set_doit(struct sk_buff *skb, struct genl_info *info)
 			goto unlock;
 	}
 
-	ret = ovpn_nl_peer_modify(peer, info, attrs);
+	ret = ovpn_nl_peer_modify(peer, info, attrs, remote);
 	if (ret < 0)
 		goto unlock;
 

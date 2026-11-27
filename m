Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772836;
	b=sLZsgzxlVIBqBmYK18+FFkuzj5Xymk5uwoKtn1YpUzapqwo1iXBUNelRkrOqBEX2mFr1
	 TqI8h7mmHSLZX59M6o/abmN5qdgkkuvAuRLTUgXkoNAGFWK4yzFAfEsNNnWeNk+/6W2mi
	 k1aji/uLGoJoTuvP3nZtiYb22aUWX+m6IxZSqtrAzO1Iw4uivysIVeoZnhW2ePW1a0S2G
	 yUaLBdWbQI642md6RozMunnXe4e6lAZXa6j+8wtAD9O5Idm8+mmEFyG6EscOxVojk2jQI
	 s3GJrGPtPNuh3C/6z36VC+Rt1qBTTCgYMoXDVomjVkkky0XqDHlWA1X9LzdG3+PWGSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qD2CzWhTKay28R8ZJ8I7bIN4IqLjNHw19HMT+v7y59k=;
	b=lbRtTIvKRcKjOhIauTTAC9Q6PbDU6st8zmopKb5vKGV3fhtZtpjvVoBnf0e0goVuo4kQ
	 ticyzgTD1EG5ilWPsRbhM/agNVjGTSFnfK1+5/JRAnMV2X7C5+jVWPkNmgcF3kCBExpgE
	 IyHPb4WpBodHIhBRc2k5zhiSuM7DVFnbKUXLDqZp0lYoBKMXhouYSIQsR5YScyZ0BQjzN
	 4prtRmO03DqW2ekzwvzR12oZ+Z7/IUPEaMcL323CtEOuQ50BSD9vODD3vN7eQex+89x9d
	 Os8dDZ3JRYHnd9ixp5m9e0zUTiovxpDfmBvvHsvoMon9rpwML22oKTMh0V6G88dME9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=hVxjud8U;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FD60A260C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 195FD60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=hVxjud8U
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b563e32936so3766244c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772834; x=1796377634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qD2CzWhTKay28R8ZJ8I7bIN4IqLjNHw19HMT+v7y59k=;
        b=hVxjud8UIs8KTUNOW+QLR3svKk5q+GcDBBurHHi6aW0GjXV0WOyt08bUF8yG4YGt/q
         2nhiYE5RzrCtay9ur/5ExUwU7xXECJHjvKBbH5ryoxuX+92MI7y0rhLRTzcK3U09HR0U
         vhmRMbrxQDK36U0vZLd1DGPIicQ15XVgQPBXo4mRCYaO3CRA69SoAEVGi2019w2gMBn6
         gdociw/JF9YRjjVQLF1nx+8jtQfvpDlqRksexe3yUKdJ9rZcPF0n37wB+6cd8H3sh+WW
         uUJwcFEbavx4QTTGi4x9zmUMio1i/K8VPsBlFSOWMynLDZdgr5713kpEjUgm+PKIUiJf
         Clsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772834; x=1796377634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qD2CzWhTKay28R8ZJ8I7bIN4IqLjNHw19HMT+v7y59k=;
        b=k9DhunhsGpvbQYKtOIoAqqmG0q0ggMrTpO5iFjXzerKbPSuGF+mgwORd9k7B/hoSX/
         XvQKplAcRYZXtVA9aS7mHrGavMcZHRUGap/273QPdWlNl9Yl9BHYgCwKLKsU7H6afPBQ
         xYimQplTeo8X9jypydqj8YZ16ZR3bOVQi43C8hax5zsG4KZKYKab0BcHd0hJ+mdMHk57
         MDhR1ileZlqCpj0B2mSNKeQFtmAyEeaHjaN5EXdCJa/4iHwNUd6fs2CL/PMFFTkNOGuK
         DofXiq+7LGD73ZKjfFZ7hR5VA/wLwepyagZg5w2euxmq8LmkvtyzZRIpkN9If339qag+
         96IQ==
X-Forwarded-Encrypted: i=1; AL+hErFfS9PAuMneFwureo0pMPggm9OfYkRXlIorACEfcFy/IIxeuIVsTXO8pwDLwV4OTkwW1mr/6fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sssSJS9Rcv2iNtiAEEOy9lmaHejMt6y1KXCfAq7CU2aBeGsf8
	tXC2rmGSRafYijepZJrG9JBDuoPadE5ned5WqZMR5qKZ+QGKD2cexFUAIF6o2N877fs=
X-Gm-Gg: AZFdTZfY6cokcotzsfzZ3DxRn4ir4JS3EVUJZWvDbxL0EBgp+9f5t4UOXf92R0DkPRW
	+4r+SLtaTYlC449jbdS0nhkOcGCQpa1Kn/OWBE/4oz76v73KG+PN0SS8nplMt243JoJSDfca9SD
	GsxR3+w9n2VZUqhT9mGwYq7a4RTkDvEkF/s9XG1X9D3gQIMRwQC7MkQRMnPHNBhWQnCZ71BP4t3
	lSFoTm30Q1B5RCym8pOymppubVg34IiUdqSNFG0lxrMNze+BxOFZqEWD+e/L6FP/zz4Nk/95hnl
	v9eFhhU8JTOZfLnm5/XMH/k5+8oxpPiIMceSgMWf/zGiDpaF5fVY51QiTBFWFLz6/UOfPK45Jcv
	Ox7gueGhF0PiURUFdQsdXjG9HXKoQxINTHiVaYmDjHXjB7LKpJZxaAwQexljC3XA0kyYGz8x/O+
	io+dmcoYbAwQ+0E3qud34w3OvTe7F75oczT/vIysE+To37/KqwPJW+kk3FKBA6myeW7mJZBRmAp
	1qbi4jgIRoJoaSENA0pJcKO/BexjN/pCghadp6QmghTRXKUL9lUtbT/l6Ft9LqnsbEQ45T9+u+Q
	G/gMYihszOKYwZT0pxd/hPNWhRzGCU2szvi63vuBnND5N5CxWRcqyRkp3g4fgZ9YBCHxojkSEB4
	aGSPBLFCWca0GLEr7orZkiSbx4kQ=
X-Received: by 2002:a05:701a:cccd:20b0:1b5:3819:f8f with SMTP id a92af1059eb24-1b55692aa4emr23196680c88.36.1795772834106;
        Fri, 27 Nov 2026 01:47:14 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:13 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 05/12] amt: forward multicast data over IPv6
Date: Fri, 27 Nov 2026 09:46:56 +0000
Message-ID: <20261127094703.3025517-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

amt_send_multicast_data() routes and transmits the relay's copy of a
multicast packet only over IPv4, so an IPv6 relay could establish
tunnels but not deliver traffic through them.

Size the copy's headroom for the outer family and send it through
amt_udp_xmit(), which already carries the Membership Query over either
family. The IPv4 route lookup still sets no DSCP. A copy that cannot be
sent is still freed, but it is now counted in tx_dropped and freed with
a drop reason; before, nothing recorded the drop, as amt_dev_xmit()
returns NETDEV_TX_OK for the packet. The inner protocol stays
independent of the outer family, so an IPv6 tunnel carries both IPv4 and
IPv6 multicast.

RFC 7450 s5.3.3.6.3.2 forbids a Fragment header on a Multicast Data
message sent over IPv6, and s5.3.3.6.2.2 wants an IPv6 payload that
exceeds the tunnel MTU dropped with a Packet Too Big to its source.
The device MTU is derived from the link MTU only, so a smaller path MTU
to a gateway is found at the route. The scrub in amt_udp_xmit() clears
ignore_df, so ip6_fragment() never adds a Fragment header, but on its
own it drops such a packet and sends the Packet Too Big to the relay
itself. amt_send_multicast_data() therefore routes first and compares
the inner packet with the route's MTU less the outer headers and the
AMT header. The device offers software GSO, so a GSO skb is checked
per segment with skb_gso_validate_network_len(), before the tunnel
offloads are set up. A payload that does not fit is dropped.

The inner IPv6 packet may carry extension headers. ipv6_mc_check_mld()
leaves the transport header just past the fixed header, also for a
packet it rejects as not MLD, and the per-segment length of a GSO skb is
taken from that offset, so amt_dev_xmit() puts the transport header of a
data packet back before it is checked and sent. A route MTU below the
outer headers gives a tunnel MTU of zero instead of a wrapped one: every
payload is dropped, and none is sent a Packet Too Big.

A multicast packet can match every tunnel, and an attacker can create
tunnels, so the Packet Too Big is not sent per tunnel. Each failing
tunnel only lowers a value, and amt_dev_xmit() sends one Packet Too Big
through icmpv6_ndo_send(), as ip6_tunnel does, after it has walked all
tunnels, reporting the smallest failing tunnel MTU. A tunnel MTU below
IPV6_MIN_MTU is left out, as a source ignores a smaller Packet Too Big,
so such a tunnel only drops the payload. The inner version is the v6
flag the caller already computed, not skb->protocol.

The tunnel MTU follows the route's path MTU, which ICMPv6 Packet Too
Big messages lower, as it does on every IPv6 UDP tunnel in the tree.
RFC 7450 s5.3.3.6.1 and s6.1 ask a relay that adjusts the tunnel MTU
dynamically to offer a way to turn that off. The IPv6 stack gives a
tunnel no such way: udpv6_err() records the lowered MTU in a route
exception before it looks up a socket, "mtu lock" does not stop it
(IPv6 path MTU discovery is not optional, see __ip6_rt_update_pmtu()),
and ip6_skb_dst_mtu() ignores the socket's pmtudisc inside a tunnel's
transmit. This series does not add one. The route MTU never drops
below IPV6_MIN_MTU, as a smaller Packet Too Big is ignored, so a forged
Packet Too Big can at most lower the tunnel MTU to 1280 bytes less the
outer headers; an IPv6 payload between that and 1280 bytes is then
undeliverable.

skb_tunnel_check_pmtu() is not used: with reply false it only updates
the route's PMTU and sends nothing. An IPv4 payload is dropped without
an ICMP error, since icmp_send() does not answer multicast datagrams,
and it is not fragmented before encapsulation as s5.3.3.6.2.1 asks for
DF=0. The IPv4 tunnel does not do that either; it clears DF on the
outer header instead.

With this, every relay message has an IPv6 path: Discovery and
Advertisement, Request and Membership Query, Membership Update and
Multicast Data.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 140 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 99 insertions(+), 41 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 70be70ed5..3972b3ecc 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1254,26 +1254,54 @@ static void amt_req_work(struct work_struct *work)
 				 msecs_to_jiffies(100));
 }
 
+/* RFC 7450 s5.3.3.6: a Multicast Data message sent over IPv6 must not
+ * carry a Fragment header, so a payload larger than the tunnel MTU is
+ * dropped, and an IPv6 source is sent a Packet Too Big. An IPv4 source is
+ * not told, as icmp_send() never answers a multicast datagram. The tunnel
+ * MTU follows the route's path MTU, as on every IPv6 UDP tunnel.
+ */
+static u32 amt_tmtu(const struct dst_entry *dst)
+{
+	u32 hlen = sizeof(struct ipv6hdr) + sizeof(struct udphdr) +
+		   sizeof(struct amt_header_mcast_data);
+	u32 mtu = dst_mtu(dst);
+
+	return mtu > hlen ? mtu - hlen : 0;
+}
+
+/* True if @skb, the inner packet before encapsulation, or any segment of
+ * it, is larger than @tmtu.
+ */
+static bool amt_tmtu_exceeded(const struct sk_buff *skb, u32 tmtu)
+{
+	if (skb_is_gso(skb))
+		return !skb_gso_validate_network_len(skb, tmtu);
+	return skb->len > tmtu;
+}
+
 /* Route an AMT-encapsulated skb to @daddr and send it over the device's
  * outer family. The caller has already pushed the AMT header; @dscp only
- * steers the IPv4 route lookup.
+ * steers the IPv4 route lookup. Over IPv6 the caller may pass the route it
+ * already looked up in @dst, which is consumed; otherwise it is looked up
+ * here.
  */
 static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
 			struct sk_buff *skb, const union amt_addr *daddr,
-			__be16 sport, __be16 dport, dscp_t dscp)
+			__be16 sport, __be16 dport, dscp_t dscp,
+			struct dst_entry *dst)
 {
 	struct rtable *rt;
 	struct flowi4 fl4;
 
 	if (amt_v6(amt)) {
-		struct dst_entry *dst;
-
-		dst = amt_route6(amt, sk, &amt->local_ipv6, &daddr->ip6,
-				 sport, dport);
-		if (IS_ERR(dst)) {
-			netdev_dbg(amt->dev, "no route to %pI6c\n",
-				   &daddr->ip6);
-			return PTR_ERR(dst);
+		if (!dst) {
+			dst = amt_route6(amt, sk, &amt->local_ipv6,
+					 &daddr->ip6, sport, dport);
+			if (IS_ERR(dst)) {
+				netdev_dbg(amt->dev, "no route to %pI6c\n",
+					   &daddr->ip6);
+				return PTR_ERR(dst);
+			}
 		}
 		/* iptunnel_xmit() scrubs the IPv4 tunnel skb, but
 		 * udp_tunnel6_xmit_skb() does not, so drop the inner
@@ -1374,26 +1402,58 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 	return false;
 }
 
+/* Send the relay's copy of a multicast packet to one gateway. Over IPv6 a
+ * payload that does not fit the tunnel MTU is dropped, and *@ptb is lowered
+ * to that MTU so that amt_dev_xmit() can send a single Packet Too Big to
+ * the source once it has walked every tunnel.
+ */
 static void amt_send_multicast_data(struct amt_dev *amt,
 				    const struct sk_buff *oskb,
 				    struct amt_tunnel_list *tunnel,
-				    bool v6)
+				    bool v6, u32 *ptb)
 {
 	struct amt_header_mcast_data *amtmd;
+	struct dst_entry *dst = NULL;
 	struct sk_buff *skb;
-	struct iphdr *iph;
-	struct flowi4 fl4;
-	struct rtable *rt;
 	struct sock *sk;
+	int err;
 
 	sk = rcu_dereference_bh(amt->sk);
 	if (!sk)
 		return;
 
-	skb = skb_copy_expand(oskb, sizeof(*amtmd) + sizeof(*iph) +
+	if (amt_v6(amt)) {
+		u32 tmtu;
+
+		dst = amt_route6(amt, sk, &amt->local_ipv6, &tunnel->addr.ip6,
+				 amt->relay_port, tunnel->source_port);
+		if (IS_ERR(dst)) {
+			netdev_dbg(amt->dev, "no route to %pI6c\n",
+				   &tunnel->addr.ip6);
+			DEV_STATS_INC(amt->dev, tx_dropped);
+			return;
+		}
+
+		tmtu = amt_tmtu(dst);
+		if (amt_tmtu_exceeded(oskb, tmtu)) {
+			dst_release(dst);
+			/* A source ignores a Packet Too Big below
+			 * IPV6_MIN_MTU, so a tunnel that small is only
+			 * dropped for.
+			 */
+			if (tmtu >= IPV6_MIN_MTU && (!*ptb || tmtu < *ptb))
+				*ptb = tmtu;
+			DEV_STATS_INC(amt->dev, tx_dropped);
+			return;
+		}
+	}
+
+	skb = skb_copy_expand(oskb, sizeof(*amtmd) + amt_ip_hlen(amt) +
 			      sizeof(struct udphdr), 0, GFP_ATOMIC);
-	if (!skb)
+	if (!skb) {
+		dst_release(dst);
 		return;
+	}
 
 	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
 	 * header. The tunnelled payload has no link-layer header, so the
@@ -1402,18 +1462,7 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
 	if (udp_tunnel_handle_offloads(skb, true)) {
-		kfree_skb(skb);
-		return;
-	}
-
-	memset(&fl4, 0, sizeof(struct flowi4));
-	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = tunnel->addr.ip4;
-	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_proto       = IPPROTO_UDP;
-	rt = ip_route_output_key(amt->net, &fl4);
-	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->addr.ip4);
+		dst_release(dst);
 		kfree_skb(skb);
 		return;
 	}
@@ -1427,17 +1476,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 		skb_set_inner_protocol(skb, htons(ETH_P_IP));
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
-	udp_tunnel_xmit_skb(rt, sk, skb,
-			    fl4.saddr,
-			    fl4.daddr,
-			    AMT_TOS,
-			    ip4_dst_hoplimit(&rt->dst),
-			    0,
-			    amt->relay_port,
-			    tunnel->source_port,
-			    false,
-			    false,
-			    0);
+	err = amt_udp_xmit(amt, sk, skb, &tunnel->addr, amt->relay_port,
+			   tunnel->source_port, 0, dst);
+	if (err) {
+		DEV_STATS_INC(amt->dev, tx_dropped);
+		kfree_skb_reason(skb, SKB_DROP_REASON_IP_OUTNOROUTES);
+	}
 }
 
 /* Send a Membership Query in reply to an unauthenticated Request.
@@ -1482,7 +1526,7 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
 	return amt_udp_xmit(amt, sk, skb, daddr, amt->relay_port, dport,
-			    inet_dsfield_to_dscp(AMT_TOS));
+			    inet_dsfield_to_dscp(AMT_TOS), NULL);
 }
 
 static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
@@ -1500,6 +1544,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct iphdr *iph;
 	bool data = false;
 	bool v6 = false;
+	u32 ptb = 0;
 	u32 hash;
 
 	iph = ip_hdr(skb);
@@ -1524,6 +1569,9 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		group.ip4 = ip_hdr(skb)->daddr;
 #if IS_ENABLED(CONFIG_IPV6)
 	} else if (iph->version == 6) {
+		bool th_set = skb_transport_header_was_set(skb);
+		int th_off = th_set ? skb_transport_offset(skb) : 0;
+
 		ip6h = ipv6_hdr(skb);
 		if (!ipv6_addr_is_multicast(&ip6h->daddr))
 			goto free;
@@ -1540,6 +1588,14 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 			}
 		} else {
 			data = true;
+			/* ipv6_mc_check_mld() set the transport header
+			 * just past the fixed IPv6 header, even when
+			 * extension headers follow, which would make the
+			 * segments of a GSO skb look shorter than they
+			 * are. Put it back.
+			 */
+			if (th_set)
+				skb_set_transport_header(skb, th_off);
 		}
 		v6 = true;
 		group.ip6 = ipv6_hdr(skb)->daddr;
@@ -1593,8 +1649,10 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 			}
 			continue;
 found:
-			amt_send_multicast_data(amt, skb, tunnel, v6);
+			amt_send_multicast_data(amt, skb, tunnel, v6, &ptb);
 		}
+		if (ptb && v6)
+			icmpv6_ndo_send(skb, ICMPV6_PKT_TOOBIG, 0, ptb);
 	}
 
 	dev_kfree_skb(skb);

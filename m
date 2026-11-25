Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634100;
	b=0A5YPJfB6NzxfhZ3oUWC44RmdKuA6VwiO92lat3ssPkSsUh6WgC8mOKGi1WeMB2+/e/H
	 BA5u71rNKRlY3aQtEdqhGmPgV14N+L4WLClwoIAFhJjkUtFRskBr36HFwRvT6FMcLTYXA
	 GnTvcfntoX4vftciyGE5SNX3jkn9JTNqwl3TLPDRDz5aTNReuwnDlqLFuVp6UzWi+13WT
	 ElaR1rLRBmDTgz0mxvJhkgU+ZJXjTf/aTZ05PGQca7kAUgugQszHam4XpSQTqhVvdP6aE
	 IsjcUqwxA1ibvp3cQnF+hrGL3amW8McGKDGhtXkiDBWux1TfXwchfjsbvQUbiNTlUbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VXAZ8Kr8JXgDmkXxStkx6xLqLFftpXmGJY9tWvIpUSg=;
	b=l7J4rvUh9cp1hJHR1jLLlBshRgYCwBkHVr///wxLIkTKQrloOLfiu7wlPZUF86iBKTpt
	 bMPv27rKRD3WECc0M/HEKq5ackzcUYEPjfg4w7dUaBAwHrtdlNuDE1wwgTESFL4vVx6HN
	 LSA/aXXjQ4PlDGfA/gRI8whF6VF9RqCLRyjhQFRutyjJ1YZDb079aih7XBNBEZ07AhkkR
	 KJdAec9Yr/BXXALFZmhGO3YPrFxxcMKleEFgcKdpAjdVnKHuRafMx/GaiduibnN1ulSfF
	 QsCWZV+IeKgI9eqmBAZv3k1eGiyIdjp7MVV7EYAOyItMZxk+UxKXzExtwffo4Kyy+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=I1L3kDCh;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6960A2606
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB6960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=I1L3kDCh
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f04244c3d0so50359325ad.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634099; x=1796238899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXAZ8Kr8JXgDmkXxStkx6xLqLFftpXmGJY9tWvIpUSg=;
        b=I1L3kDChQj82UIPOyRZDxTzUME45aFpYjNUMisXCMVqfQem2OtYrPwZdBZtgRf6zNz
         xn11OVsrrASx97OT/akVIuPIsPeqrxhq9ZFK/KCyjhWuybxMQ80q4VruVsYmi71KiMis
         7aM3hGVwxtRIIJKJGG8y+grsbPzGmItD62WCl4omrKcz+AlQscbAhlTOFi/evaYOq29j
         m3D9tgw+tHjkowJbSA/yfuL2qTDmDuBA76oSKxRHu6mxZSgyvtpBjz5p/Ydhtg60scOa
         whbjvc61+kAyKv0DUqr5pc9xeQ3+pHVnaT+JdzfqpodpZPrPtpW32b96PPHXEm/zWIb/
         8PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634099; x=1796238899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXAZ8Kr8JXgDmkXxStkx6xLqLFftpXmGJY9tWvIpUSg=;
        b=joP/ZktbNxoltHuhWld6OmHxWzp1J05zRDoKKVp/LNhT4IqJdApGFSekWPb0bDHGtl
         GaYNNWvXWVumuKyvWKuWP8iSidhBvRVdtcIm8kJ7e6ePVqXre5NKwkQ4lpoV6FQXMVNj
         FccCyQw6GWkAn+19/+0AO+hdI8r2iChJvzaKQ2dRTF2r7qQV4QQ4ZvKjdpb/CwHH+8px
         0WrlxvbK8uIEk7mPMrPKQd9+XOWiy6MgLrYLMF7ga0ovs0Ens75B6Jc6LNgepEXwQBGy
         o4YZEcSnHUdbWIXaO5/rBW6J/liOrT5I9ARDdYeAmCSvvh97mQ2lT2ZYKkS1n61f4ozO
         BM1g==
X-Forwarded-Encrypted: i=1; AL+hErFqynEW60fQ6ILffwt5UyVVO+oefkXeZ4EIGxSKo55mpqEptyBjVo2poqugbW0g71CVjSrgv80=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vLTOGEaMOsx4ju9AGZ4v4+xqBHYFODc0hblgs0LA9A3m/sLw8
	VE94X1yZYfkoyCNoIAq7emmkQAargPk4Hiu+/mmPE9Mlc8klS2Kt32eeyyfz0U6LIg0=
X-Gm-Gg: AZFdTZdCMWXb4F2Os8Ga6xC0w1Yv0C05zfGgHXgE2jWxW4jhZk19SbTWRNDq9CBq8tG
	YXdJ6LI1m1YcdYcQuXC/IQ/FFtv3M7t/NXWBTnofZ8Fo/Djl+tfiGADlUDn/mHG6BM4gLSJ+b8K
	4p2KX0kLPMt3Dy7ITFCn3Y6iJrosrIVJLBjZdEGm+/0AMphbuwd62xJYzzlsoQlZEmLykRYr2ck
	5u+Cqo4wa71DjtS4HqiWmNhBiRZkfIbST84LcTGLN4EyuTDypuB8mwtev9HuL6IPRExNX5YPQh8
	KrFOO5eFzMTcixJ0G5S+erMrx9gtrOQJJy0T/iKeChXCgjcDnmT/X32mx7R5+u0Y/SOsUM0jMuW
	wVrL9i5yRDVM/txNMtLHxkenfzhL5lAObVs7buHOzekFNHtdatLuTOIsyIu6erPyGHQX/MzEh8j
	T/TGXTx5XmMaDoy37ViKBIQVhNT+K02drNk04zseOqLQ8iSn2ZMIWo+PxWOjGy70TB0WNFsx3p9
	MXnQIXtiz+4I1yZF+ncZQxPXy0TRiKmZu7UMWCzK9JMQZHrF/72mtyA+ZEoY26qdFK7w/Zdncrd
	lRfNTX0qaICZF96vs0HD6oWIUBl3dBPtMbL4AbdiPepZU6PxUj2jFTvnvrfa+Tzx3jq9O4Qau7X
	X/Ql1KPhL4uO5wUGXf1JkaMKAtUaGA/4DB4EExmtQN1Qra0Vrhrq0
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr177773115ad.35.1795634099295;
        Wed, 25 Nov 2026 11:14:59 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:58 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 05/12] amt: forward multicast data over IPv6
Date: Wed, 25 Nov 2026 19:14:43 +0000
Message-ID: <20261125191450.2497936-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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
 drivers/net/amt.c | 126 +++++++++++++++++++++++++++++++---------------
 1 file changed, 85 insertions(+), 41 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 7e8219a0c..823367e82 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1237,26 +1237,51 @@ static void amt_req_work(struct work_struct *work)
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
+	return dst_mtu(dst) - sizeof(struct ipv6hdr) - sizeof(struct udphdr) -
+	       sizeof(struct amt_header_mcast_data);
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
@@ -1357,26 +1382,58 @@ static bool amt_send_membership_update(struct amt_dev *amt,
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
@@ -1385,18 +1442,7 @@ static void amt_send_multicast_data(struct amt_dev *amt,
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
@@ -1410,17 +1456,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
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
@@ -1464,7 +1505,7 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
 	return amt_udp_xmit(amt, sk, skb, daddr, amt->relay_port, dport,
-			    inet_dsfield_to_dscp(AMT_TOS));
+			    inet_dsfield_to_dscp(AMT_TOS), NULL);
 }
 
 static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
@@ -1482,6 +1523,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct iphdr *iph;
 	bool data = false;
 	bool v6 = false;
+	u32 ptb = 0;
 	u32 hash;
 
 	iph = ip_hdr(skb);
@@ -1575,8 +1617,10 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
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
-- 
2.47.3


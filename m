Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772833;
	b=fXw9B0qWSEhu1WKTDvRcDdZ22KjcRPJLR2klVebWZEunbMLwTGuftkeMOhW1F78INqYg
	 X16o7ddfbsB/bOI4p7jI+2b5MXRB8NtbMfx9ZeK0RiZyaZStNKEKIaysi8t3+jmKrdmir
	 cY70XKxaecQ1KKdDitHmbXX+sFFiLCwCBqJY53R8DGqElM1p/1uuUFIKPnhDLwNSBkJ/J
	 dIOz3fl3xneZxzcOp+s/kFf7BSRcFNQXiUyGfWUN4Yq+9XPi0/b8TT4lZLcfFIuoQKtIt
	 zftdUKWdgJqvvvCCsiPI2t1ylYjZR3hPmz7KGT9nPmBQtXSsXaCsM6n8La8P51q4gZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpeGcuAAsAJX5vFRWR3fQdx6srNpY25xfCbAcbfjdnQ=;
	b=yWmuT08FqpHNFLyDxOFua8Q1fOWla8BQLFKOm2aCoDZmN/C3U7PDyNde2iwIC0K9VrpA
	 MGsCGcWJD/XrWQ0QJ1DwpCiZX1fII4LYJg7PDBA7ihVvEVwWJiduvqXxzz2Pqwa+eGl/J
	 K7etQueNPAWobt+OysRJRlJk49noBPhT6pQuZFOvNagksMYXSjSLqBlb0oq3rkcS9+l5h
	 gweIiFRfbl1Dk2YZtlJ1kVRsRP6YaJdZkhyjK1iOcELdAj0AeTrRyarnWQFbYHfBLMl0/
	 R18Hmv8pXl5teECtkl6NubE7qLsQccJgpeCv55TLmkZHk9hJ0wH7Fby8gFGoCdN9JXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=AQoQYRjd;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F0606A6BD
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895F0606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=AQoQYRjd
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so9089781c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772833; x=1796377633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpeGcuAAsAJX5vFRWR3fQdx6srNpY25xfCbAcbfjdnQ=;
        b=AQoQYRjdNBK7lexGHpxSlW3exmCb2ueeDBdkNJbIQ5PYoKpUsyPRK1SxJLt7vV3oe+
         kSZQurKmMrCklbVvkgfLhTSavgVpisZmYUq5EIlsR08coqoJfz7+x4SuFppW9Y8/YpjW
         bxsiEzyAXHjBOHXgCTHNIGBQR0w6og4cpyGdkWmz4iDaxtK7X+D+s3lvwHA6kGSMD+EZ
         CEOzyW/kB3HxRWAUZNGt5wA5wYjRnfm9o7+AuTKAWThIFIFvZrneIde0hLsG8EnUmuIT
         L2u9MvbWuFkTCNy6JLOhNgv5UaP5iOLKzchYynw4oI57oiiZBD1fXNgBVCYqj2UBglDV
         s3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772833; x=1796377633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpeGcuAAsAJX5vFRWR3fQdx6srNpY25xfCbAcbfjdnQ=;
        b=KWnfqf784fP6E5j4MevEfcMEf+T4OT54SD5fclzeERI0DPt1BhliJuX1FWSWuogY0x
         /Ul05AcO71tIYPCuoJfqp8TajHvXMo/PA874Whjj0dvQuwxH8zL0ZaNZkrK7oF9FZuYc
         fqp/GRnyWI0Sda16hRk1BLVq2NEKyMtJ+nVdnJyMyynluW6qokvORaX3dKdloou/GAZt
         ZoC5Vhv+XNg5X8dU6q8loJFW4fmwkowLPye/+/Vrghe+7yQAFT8o0MGsjJfinriFG2Ou
         HjV+MauRR9vlPDwJwI4fUEdawQdt/pJ3hSDELtF9EExaFE9G2PDPd1Jvm5kBTwzqABKO
         VUlg==
X-Forwarded-Encrypted: i=1; AL+hErF44XYlo6uGC6ELhoFCDWwRvjYO+JRZLk9HZj5k6k8Q+M6dWLg/T+EOjJyafBEhDIRxUojlwrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QbUJgLUUECjPXVl78W+7Bze/FEYTirBgc64RlhqA9vTIm9rxi
	fL8WGS1j3Tb7VFT/gWAfwJepDTrIKGnSRWVjd6yFVgkyaVQFrMDzs1NU61dYWaOm75g=
X-Gm-Gg: AZFdTZfrhUYqXsJVeCmmeMrFy9fR+yDjdk6EeFkPe609s21ZsSIKsfTdxZpP5dv4Ikp
	LHi5REdSseYdakRg+70CijCbAdsNua2kuTXBV0bUqNBYGyOKwuPYkNaU7Yvj2HmWupaB1Kz2gFO
	0nMJmFr6W0Ir/qf0XUUT8pFgJ/ms5V90YoC2kKAoPyZgGbSPscoJQrDXxm725YNFjNRx34vIKhl
	SUm+7vY5ddaTRZVhod9zfV4cHXLgCLEayAKnzjst5527iOt1WhIsf+62quyu7sh+HVit8spMEaN
	QjFi4mpW6wsnIfNhY+F3U+qhN9pdttiA1TwQWEFZ885teWYeefvXRcqF8RCyu1EarjwvpAJLIL9
	vzyPndqyJ47DLs+4UB7Msw6sOVK/CT8wE4olgThM3RgpmsQgxAqC4PC+nRU8VT5O3koN8KSTw5p
	58GbmOxLAt+RVWHH1n9vAW5+OFuSCZ8Qk9ypSkAQZPGG9Yrwc9AFequ7sAlr5g7mhV20+rZCORm
	Z8/13fafhLYkwnUPgTZw2EQKqGz254TknyWmNQ1W8CTcsWLS6s2W8JadUx2Ox09/l5r5N8FfoiB
	IPoxrel5uPKg056xHk+ysN2Hho8NAuM15b5Uf4EihzkVBUlD7NyU6OmNqpNQqE4l2i3J1GNrIWf
	MJxn2ER4eS03TI4UZmMdVkd881Uw=
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr23520194c88.32.1795772832531;
        Fri, 27 Nov 2026 01:47:12 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:11 -0800 (PST)
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
Subject: [PATCH net-next v3 04/12] amt: send the Membership Query over IPv6
Date: Fri, 27 Nov 2026 09:46:55 +0000
Message-ID: <20261127094703.3025517-5-omar@blockcast.net>
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

After the Request, a relay answers each gateway with a Membership Query
through amt_send_membership_query(), which routes and transmits only
over IPv4.

Rather than adding an IPv6 twin of the function, move its routing and
transmit step into amt_udp_xmit(). Given an skb that already carries
the AMT message, a union amt_addr destination and the port pair, it
sends over the device's family: ip_route_output_key() and
udp_tunnel_xmit_skb() for IPv4, as before, and amt_route6() and
udp_tunnel6_xmit_skb(), which fills in the mandatory IPv6 UDP checksum,
for IPv6. Both use AMT_TOS, as the IPv4 path and the IPv6 control
messages do. udp_tunnel_xmit_skb() scrubs the skb in iptunnel_xmit(),
but udp_tunnel6_xmit_skb() does not, so the IPv6 path calls
skb_scrub_packet() itself. Otherwise the conntrack entry and extensions
of the inner packet would stay on the outer one, which conntrack would
then pass as an already tracked flow.

amt_send_membership_query() sizes its headroom for the outer family
with amt_ip_hlen(), builds the AMT header and hands the skb to
amt_udp_xmit(). The route lookup now runs after the header push; on a
route failure the caller still frees the skb.

The v6 argument keeps its meaning: it selects the inner protocol, IGMP
or MLD, which is independent of the outer family, so an IPv6 relay
queries for both. The relay's General Query, which amt_send_igmp_gq()
and amt_send_mld_gq() now send directly through
amt_send_membership_query(), takes the IPv6 path. Both now take the
gateway's endpoint as a union amt_addr, as amt_send_membership_query()
does.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 121 +++++++++++++++++++++++++++++++---------------
 1 file changed, 83 insertions(+), 38 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 83e666a02..70be70ed5 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -98,6 +98,12 @@ static bool amt_v6(const struct amt_dev *amt)
 	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
 }
 
+/* Length of the outer IP header for the device's family. */
+static unsigned int amt_ip_hlen(const struct amt_dev *amt)
+{
+	return amt_v6(amt) ? sizeof(struct ipv6hdr) : sizeof(struct iphdr);
+}
+
 /* Snapshot the outer source address of a received AMT message. */
 static void amt_outer_saddr(const struct amt_dev *amt,
 			    const struct sk_buff *skb, union amt_addr *addr)
@@ -1014,7 +1020,8 @@ out:
 
 static bool amt_send_membership_query(struct amt_dev *amt,
 				      struct sk_buff *skb,
-				      __be32 daddr, __be16 dport,
+				      const union amt_addr *daddr,
+				      __be16 dport,
 				      __be32 nonce, u64 mac,
 				      bool v6);
 
@@ -1022,8 +1029,8 @@ static bool amt_send_membership_query(struct amt_dev *amt,
  * unauthenticated, so no tunnel state is created or changed for it - see
  * amt_request_handler().
  */
-static void amt_send_igmp_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
-			     __be32 nonce, u64 mac)
+static void amt_send_igmp_gq(struct amt_dev *amt, const union amt_addr *daddr,
+			     __be16 dport, __be32 nonce, u64 mac)
 {
 	struct sk_buff *skb;
 
@@ -1112,8 +1119,8 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 	return skb;
 }
 
-static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
-			    __be32 nonce, u64 mac)
+static void amt_send_mld_gq(struct amt_dev *amt, const union amt_addr *daddr,
+			    __be16 dport, __be32 nonce, u64 mac)
 {
 	struct sk_buff *skb;
 
@@ -1129,8 +1136,8 @@ static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
 	}
 }
 #else
-static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
-			    __be32 nonce, u64 mac)
+static void amt_send_mld_gq(struct amt_dev *amt, const union amt_addr *daddr,
+			    __be16 dport, __be32 nonce, u64 mac)
 {
 }
 #endif
@@ -1247,6 +1254,66 @@ static void amt_req_work(struct work_struct *work)
 				 msecs_to_jiffies(100));
 }
 
+/* Route an AMT-encapsulated skb to @daddr and send it over the device's
+ * outer family. The caller has already pushed the AMT header; @dscp only
+ * steers the IPv4 route lookup.
+ */
+static int amt_udp_xmit(struct amt_dev *amt, struct sock *sk,
+			struct sk_buff *skb, const union amt_addr *daddr,
+			__be16 sport, __be16 dport, dscp_t dscp)
+{
+	struct rtable *rt;
+	struct flowi4 fl4;
+
+	if (amt_v6(amt)) {
+		struct dst_entry *dst;
+
+		dst = amt_route6(amt, sk, &amt->local_ipv6, &daddr->ip6,
+				 sport, dport);
+		if (IS_ERR(dst)) {
+			netdev_dbg(amt->dev, "no route to %pI6c\n",
+				   &daddr->ip6);
+			return PTR_ERR(dst);
+		}
+		/* iptunnel_xmit() scrubs the IPv4 tunnel skb, but
+		 * udp_tunnel6_xmit_skb() does not, so drop the inner
+		 * packet's conntrack and extensions here. Links cannot
+		 * cross netns, so this is never xnet.
+		 */
+		skb_scrub_packet(skb, false);
+		udp_tunnel6_xmit_skb(dst, sk, skb, amt->dev, &amt->local_ipv6,
+				     &daddr->ip6, AMT_TOS,
+				     ip6_dst_hoplimit(dst), 0, sport, dport,
+				     false, 0);
+		return 0;
+	}
+
+	memset(&fl4, 0, sizeof(struct flowi4));
+	fl4.flowi4_oif         = amt->stream_dev->ifindex;
+	fl4.daddr              = daddr->ip4;
+	fl4.saddr              = amt->local_ip;
+	fl4.flowi4_dscp        = dscp;
+	fl4.flowi4_proto       = IPPROTO_UDP;
+	rt = ip_route_output_key(amt->net, &fl4);
+	if (IS_ERR(rt)) {
+		netdev_dbg(amt->dev, "no route to %pI4\n", &daddr->ip4);
+		return PTR_ERR(rt);
+	}
+
+	udp_tunnel_xmit_skb(rt, sk, skb,
+			    fl4.saddr,
+			    fl4.daddr,
+			    AMT_TOS,
+			    ip4_dst_hoplimit(&rt->dst),
+			    0,
+			    sport,
+			    dport,
+			    false,
+			    false,
+			    0);
+	return 0;
+}
+
 static bool amt_send_membership_update(struct amt_dev *amt,
 				       struct sk_buff *skb,
 				       bool v6)
@@ -1377,17 +1444,17 @@ static void amt_send_multicast_data(struct amt_dev *amt,
  *
  * No per-source state is read or created: the gateway echoes the nonce and
  * the keyed MAC in its Membership Update, where the MAC is recomputed, so
- * everything this needs is passed by value.
+ * everything this needs is passed in: the nonce and the MAC by value, the
+ * endpoint as a pointer to the caller's copy.
  */
 static bool amt_send_membership_query(struct amt_dev *amt,
 				      struct sk_buff *skb,
-				      __be32 daddr, __be16 dport,
+				      const union amt_addr *daddr,
+				      __be16 dport,
 				      __be32 nonce, u64 mac,
 				      bool v6)
 {
 	struct amt_header_membership_query *amtmq;
-	struct rtable *rt;
-	struct flowi4 fl4;
 	struct sock *sk;
 	int err;
 
@@ -1396,23 +1463,11 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 		return true;
 
 	err = skb_cow_head(skb, LL_RESERVED_SPACE(amt->dev) + sizeof(*amtmq) +
-			   sizeof(struct iphdr) + sizeof(struct udphdr));
+			   amt_ip_hlen(amt) + sizeof(struct udphdr));
 	if (err)
 		return true;
 
 	skb_reset_inner_headers(skb);
-	memset(&fl4, 0, sizeof(struct flowi4));
-	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = daddr;
-	fl4.saddr              = amt->local_ip;
-	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
-	fl4.flowi4_proto       = IPPROTO_UDP;
-	rt = ip_route_output_key(amt->net, &fl4);
-	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &daddr);
-		return true;
-	}
-
 	amtmq		= skb_push(skb, sizeof(*amtmq));
 	amtmq->version	= 0;
 	amtmq->type	= AMT_MSG_MEMBERSHIP_QUERY;
@@ -1426,18 +1481,8 @@ static bool amt_send_membership_query(struct amt_dev *amt,
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
-			    dport,
-			    false,
-			    false,
-			    0);
-	return false;
+	return amt_udp_xmit(amt, sk, skb, daddr, amt->relay_port, dport,
+			    inet_dsfield_to_dscp(AMT_TOS));
 }
 
 static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
@@ -3265,10 +3310,10 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 
 	mac = amt_relay_mac(&saddr, udph->source, amtrh->nonce, &key);
 	if (!amtrh->p)
-		amt_send_igmp_gq(amt, saddr.ip4, udph->source, amtrh->nonce,
+		amt_send_igmp_gq(amt, &saddr, udph->source, amtrh->nonce,
 				 mac);
 	else
-		amt_send_mld_gq(amt, saddr.ip4, udph->source, amtrh->nonce,
+		amt_send_mld_gq(amt, &saddr, udph->source, amtrh->nonce,
 				mac);
 
 	return false;

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634098;
	b=0OUnBWJwS/BmrmzHnNmohkvKu/cF1BNBtoTa+JGovMVPDtTQIVmd1pmq/bKOsws4gfR7
	 CsIcCBjIPaD5JOfHtA1a+vrQDvkIUw+gKXClfhaKD57dcQaaw3SN4V9TpG6RXxZRcPj9Q
	 FGv6Ckfj9U5TQUpNxet9daZD1VP2p071vV/dDI0b86hF9DHiZ9y3wO7hVksdBUtdqtPpV
	 Rvqr3JE7wCpWekQgQ98FtgeveAt5TZ9uk6YV90KQedkbcBGtjLv2ufH7ytrLUGAYm8Z6N
	 YmJXlngUX6G08TweXHcjG5wLOwm3ZMl+sqv8F7FMV0xxyygWZceIEBJB1wpEqUxNoQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=57pwRq8FX5ZkVCLWkO5DE84y+KCQ5pcHSKwoGNXQ56o=;
	b=xO3/UAYbghyGfiX067x7qnD85im/6OU1P+CX+1QmWyxaf0Pt71divEbG3pjMG2IjD2+c
	 zld2tYJt11sc/zhYhxo76PrCSK4Jjc1bGlZRuf8t0S14hWHctQjJOii4vktDQaqMu80DM
	 Piglp1Bd7I20RteV8AFjxNbljwylOsVDqzKBhF4fpRt5unC8zRtd5dmH8GV0FSB/sjQda
	 OlDZ1kMEf4IKSHmHhcbMnnJ+ud2GZu5EPGqk2VQzle2B9RGgf4S7gd1xE/kKGDNzLzcdF
	 YzaCNQDeTJDTJdzXduyWUh6YXxDn4XIdfBQvNmgxkC7tgNrMMHK662sL8NaUiOB3c2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=y3m8bQrj;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816C606A6AD
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4816C606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=y3m8bQrj
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f04ad2c46dso38594775ad.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634098; x=1796238898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=57pwRq8FX5ZkVCLWkO5DE84y+KCQ5pcHSKwoGNXQ56o=;
        b=y3m8bQrjkgQhkbUKcJIfcaPcEaPmJA3H/YXhlEohfBE6CPvJXdMQgQAKK/g4gvnzkh
         kJ46bsa1io2UxTy0OexjM+4BmdO6ZWkyQ3qQXAe/fViHmUCsW/HzAdkcP9KnBaLYOJgy
         TBZCVYscQvSdmnRrjt+mDA3OiXBTpjId3lt3ltWvCwUYje/omTPXG/Sfw5DmwW68JvLU
         2g55z3FNxMC4x0jbu4zXQRn1CdFsLheihxbiuukranR2MT2yzput0/VfwyuLTiLesagR
         6F6Nakh3jv/N1P0BZRFhaiRTQ/QWj6Mp2KkRuugsraoN0g2kxiPAzSdiAtcjSIbDIRfC
         QAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634098; x=1796238898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=57pwRq8FX5ZkVCLWkO5DE84y+KCQ5pcHSKwoGNXQ56o=;
        b=STKDnbn4GsUiLwGe2HkWhyFs/p2GnDuUqoSgXaNQ99A9dVYOihDal4ovrZVeLmn8bE
         6o1GrJ/RfNLUq3wuTmy0X0HHW9ww+rkJC8aOWDtgLu2WPOxyVU5wLRde8kVYhQV267+k
         9OfPmk9VmDP717V5DZFSZaSKpAV0NB1QxNbLm/5X+IJEBMd/YMDV5tX5rrvUiQpbr0MZ
         BMgonofR+zBFF5AB9GgbJtYF7W8ooAB7C/NAZZD3la//T5qwd4vVVi0THbk08aC+sICQ
         3Y3WKc9MZuy434zkeOAA/lWTjWYdgsj3U81gMYIDF7h78Y1dlpFnDpP+ezotrbL6BNhd
         TwxQ==
X-Forwarded-Encrypted: i=1; AL+hErHG8k2WzPtgH2STDtJqtiOGsTaUsJ+I07UhWA8l1ZPXp+o4Vc7/iV64bCdjS1VsmsWxqxq/YG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AeL2eDt9iyD5rnhe9lqJTrOscLiz5gr5tniopfKnoLy6Y8nc3
	KaXx9tsns6oc9NIvvFN9z4PYbp1t7ggnrVDbPjUp76BJRxP4e9cwWqf4K3K8flSfzcQ=
X-Gm-Gg: AZFdTZdXrIpqpYWSur7cjXj2WIGNvqT2QvICCwR4H9mUcVEQE3lrbjeO7YHjE36TO79
	CTU4alR4gG/pIOOf/3L0ThbA+LWmQ0WDlXUr1rfcisU646EKyZ8b+BliMQfDFA+a19JQmpDrL+a
	/zon1i3x7Y94tOiIT/F9D9aUmbFSwkQCD8p7mtwNzjlyC37YEbgUVBuHZhYEOH97KyNuaUIcw8A
	RPhTpQjAAO7BAkx/sAH4T+lBLw5NnBoETIOonaU/9kmzIbfAxcfKssnAUOTXO8HClHI/UrbgtLK
	bDoVtAvlUO0xgNjD9vTVGeXWGxYG55zR++N44K3L+Q1bIiX6aEE6cXJ7cT8Rd6Wy8m+k0niiVj4
	YxjgXQ7HfJM27OtbvrghA6kG36DKgaV+w284/lQOxyNX1a9hFFvPBQTPqYjgW7l70FsGi3F8g46
	Av/0aokrkLtHrTw1hn+uOSdEQgNbi579bvdaCY6xJCdeb5PTBm6FfyYpwQTH8ywBtw2s+PzT8if
	Cwck0gseODy7govt3t9ALAM7+vHfu1Iuf8czUZuVFUjg7PxY0XSFZ+wCQOqFAklaat1xhBh6v4u
	B64E2o/9OAj8LxgG2zCOaJk1vPm7LuhgC+t9082H7CCv7nk2zIMrb5/GQIXkkQuwF31yibKhIwZ
	6JzV2cEMu+BzQ7b19VxBwISTICSVH2JrNKlD5bG1Ld0CsvXRQ28U=
X-Received: by 2002:a17:903:2a88:b0:2f0:4fa1:9661 with SMTP id d9443c01a7336-2f04fa19715mr158615015ad.18.1795634097728;
        Wed, 25 Nov 2026 11:14:57 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:57 -0800 (PST)
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
Subject: [PATCH net-next v2 04/12] amt: send the Membership Query over IPv6
Date: Wed, 25 Nov 2026 19:14:42 +0000
Message-ID: <20261125191450.2497936-5-omar@blockcast.net>
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
 drivers/net/amt.c | 118 +++++++++++++++++++++++++++++++---------------
 1 file changed, 81 insertions(+), 37 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 38740e0ac..7e8219a0c 100644
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
@@ -997,7 +1003,8 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 
 static bool amt_send_membership_query(struct amt_dev *amt,
 				      struct sk_buff *skb,
-				      __be32 daddr, __be16 dport,
+				      const union amt_addr *daddr,
+				      __be16 dport,
 				      __be32 nonce, u64 mac,
 				      bool v6);
 
@@ -1005,8 +1012,8 @@ static bool amt_send_membership_query(struct amt_dev *amt,
  * unauthenticated, so no tunnel state is created or changed for it - see
  * amt_request_handler().
  */
-static void amt_send_igmp_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
-			     __be32 nonce, u64 mac)
+static void amt_send_igmp_gq(struct amt_dev *amt, const union amt_addr *daddr,
+			     __be16 dport, __be32 nonce, u64 mac)
 {
 	struct sk_buff *skb;
 
@@ -1095,8 +1102,8 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 	return skb;
 }
 
-static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
-			    __be32 nonce, u64 mac)
+static void amt_send_mld_gq(struct amt_dev *amt, const union amt_addr *daddr,
+			    __be16 dport, __be32 nonce, u64 mac)
 {
 	struct sk_buff *skb;
 
@@ -1112,8 +1119,8 @@ static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
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
@@ -1230,6 +1237,66 @@ static void amt_req_work(struct work_struct *work)
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
@@ -1364,13 +1431,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
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
 
@@ -1379,23 +1445,11 @@ static bool amt_send_membership_query(struct amt_dev *amt,
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
@@ -1409,18 +1463,8 @@ static bool amt_send_membership_query(struct amt_dev *amt,
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
@@ -3246,10 +3290,10 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 
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
-- 
2.47.3


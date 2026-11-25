Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634097;
	b=GdSUFAEzY4o7cc+/77BvomAXFh76OOSQEAwkSK+L/VjLlr1dIU0MC0WiXP3reJtUzbl1
	 1beZ2v4aibtdnB4KZnAVp4Fi/C37G4jhdJWcpZO+Ybk4PtMEUEMOzTWjwJt8aGef/wRkE
	 yiX44GDZ7wnGnQAB425IDwixi7ePcS+cgBH76d+A1PcRX1xCZ6jRn50+p2Jh/pNgX+i7N
	 uBaMuMap45ryHN5s6WMCBMBdfiicZj+dOA01dGdVEuMsMcY7T+vrW/EYm8yTHwIpmqENu
	 MV3MX7k8gXntn/MzsWfvx70SkWZBuywVXhrsGigU3Nz3QFiehAxE0NEJwU3FWymCZGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9BpKB4m/LgseQPWZIqEOC2AJS7lGmcrvFWEcNNyL79c=;
	b=Lti3u4WgnAB50m7RYTQYaqZ0hVXVdIPQPxQJGoGS3LVSy8FZjWk9Dsy7lTdws89gKSpu
	 FGYUHA8NCLdI7eBvzTHL/nuMPPPQhf9R+3lAGbhxgXLTntMIEpj1h+XNCECKRhktHp7wm
	 JnM9JrNuHJVWaos5d/JbTdjNkdHMjOzNYRqUstzzBO+enhCFSUd+XS/jPQV7z3/PP1QNM
	 jlTYUKzEHNdpX/1QXwN5BKp36OyNkouzHcrCUX/fggDiXyTI5XXt83iB/hbEKDK0d9X2P
	 VYnfnHL+FfQHZjl9RbbgxLFzulWZNm0SBjrLzA5HAImB6+33w0kN2TVKp7OIJNPrx4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=QAFgiYS9;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551E606A684
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5551E606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=QAFgiYS9
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f02ee04378so49459215ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634096; x=1796238896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BpKB4m/LgseQPWZIqEOC2AJS7lGmcrvFWEcNNyL79c=;
        b=QAFgiYS9W2LOjbj9KCXBCxY10knhyH+fOKXOsz+0yB/nk6R5LeR1s0Wuvvdv6x2VXI
         0N4ntpeAG65m60+HKpzcz++1JWJg0PcI0sAbFpWKQGWTzi2Z03pyapKneSJMa+nVL80U
         uSOgnADbkWok4AjtDHS/JrjgTHumqOnX5mjdklQLmpTTB/SIFoXpQwGB1iXLxgxUn50t
         AaaqTsGrIUYjAaMC+GeC5L84HgYPJYkOOLYrJDoxS5pinH1Ko9cTLo7gFgKHLWQDfq9f
         nVbWTmt4cOH+aouO71zRsPDPubNyUSnd8jQbhmzh5PCnTb7BfwgrSaaLR1JawjBMvDq6
         nN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634096; x=1796238896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9BpKB4m/LgseQPWZIqEOC2AJS7lGmcrvFWEcNNyL79c=;
        b=LXkitRCj2bknEcA3h1ifmIz1WAsUKvRhPKllTNrTyn/ZLosXpZcwg+TCHqrZbPj6pG
         JcctEe9AiHP0YHboj8NT/UmZTB4MiY3/hxwendEFo/dgnXTEDj5ngVzpBmMt8qaeMJZT
         q08icP8svRLSP69IGmr9uBirA5WVlE0Zs+FE9iuyOV/ZZBRRu1CkhSDd5yVtfFyMhYAq
         mB/pKkIXUl13lTgFfNwnBVp8d3akyb+AQNoVwemKg0QmIPHyLt32r+YI3G1ecoL3guwh
         YNkHA+cU6ZHpYgfuSv2dBvUiWcICThq8pxqktfBgpqvmKu3Nc1nt3BOePZLG4q2HlymT
         bneA==
X-Forwarded-Encrypted: i=1; AL+hErGJhItbY3t9eeZpRIH+IOr/wR0E2uNlg+Wemiixe+6Pi8aczLwO2LKEc2ZDrkEVBSH3VYLLgT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gv43NxJHRWvK48uXpbB+ieH/HdUPBDeAyg5L4Q2s+iEaNcGO2
	iww+l43um/hIGVNQQYrf1YzUhevDlp/DTZnSzmki0QBXcBWr2HzPO+8kkIR8pWPMti4=
X-Gm-Gg: AZFdTZepf7pJNdNYqZowfC/K62jhm+PvY2t4BkFpLs7V860ulkdpGZ3xucRenaVVylo
	rjXRnS/DafgR89+Gsq4UUK7rutbeliDAAm5rpeXvOFQ65Q5FuJepQYQ4wzxAiG0BCiGFfPQckAI
	Ks9Kf+rOJUrNCY1py4S48h3X5lDhLdLxopj57QBowWoGwLEDEi9hHyGNC8slhCIBw1B2DOE+Whp
	9AlLnZ18/auaRbCcx9fzDYnbrRo/2O5l7Kyfl+wNIps4lpghugJBl1O98FEN0x9wAQdNxxPXjC1
	QS+JzwULkUDCKXqvbWEkaCsLs2fpgTaoZD6rw1IgBOHqFAnkxU5ni2+//6YRZelcHnNJgKPgI+N
	JDXXXTwmcMLEn4sTjvRjyc8H91RxDF2IdCZgJM7xJNxUEN1LrbO/Cy9xpAO/HKywSbIuohAXpDV
	XREwLdMbDRBXhY4gDlu4zJi5eiRgiEQbtJg2mF9ZjRCdrWtp8l1rzMUSaj1nxx5jGOzdItAPBnT
	E7r2onVzVSpGpgzaW6bhXhc9nN//USuhigslqbxd9hfdNGv/8H6GCnB02cPhrZx2zdVxHHPzktq
	osRNoPyBsatELi3NX4GGSTv66A7t2KDE28KMxq33UHoijB/xZ5EBF/v6B2k3PUUDkVvG9P2xZio
	3jOTW2P7phMlJ9NNlZPwEQOOGrmsrWKRRMPp/qe00v97dRCsisrA=
X-Received: by 2002:a17:902:ea0c:b0:2ea:e084:332a with SMTP id d9443c01a7336-2f03f268784mr223800055ad.56.1795634096380;
        Wed, 25 Nov 2026 11:14:56 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:55 -0800 (PST)
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
Subject: [PATCH net-next v2 03/12] amt: key relay tunnels on a union amt_addr endpoint
Date: Wed, 25 Nov 2026 19:14:41 +0000
Message-ID: <20261125191450.2497936-4-omar@blockcast.net>
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

A relay keeps one struct amt_tunnel_list per gateway endpoint and finds
it by the gateway's IPv4 address, stored as __be32 ip4 and taken from
ip_hdr(skb)->saddr, together with its UDP source port. On an IPv6 outer
transport that reads the traffic class and flow label of the IPv6
header as an address, and the field cannot hold the gateway's address
anyway.

Store the endpoint as a union amt_addr, which group and source nodes
already use, and move the union above struct amt_tunnel_list so the
tunnel can embed it. Its ip6 member is no longer under CONFIG_IPV6, so
code that only copies, compares or prints an endpoint compiles without
an #if and relies on amt_v6() being false. A kernel without IPv6 pays 12
bytes per group and source node, which it already zeroes. The tunnel
needs no family of its own: the relay's socket is bound to one family,
so every tunnel has the device's family, which amt_v6() reports.

amt_outer_saddr() copies the outer source address of a received message
by value into a zeroed union amt_addr. amt_request_handler() and
amt_update_handler() take that snapshot on entry, before
pskb_may_pull() and iptunnel_pull_header() can reallocate the header,
and pass it to amt_tunnel_lookup(), amt_tunnel_get_or_create() and
amt_update_tunnel(). They match endpoints with the existing
amt_addr_equal(); the union is zero-padded for IPv4, so one memcmp()
serves both families. The per-source tunnel count in
amt_request_handler() and amt_tunnel_get_or_create() compares the same
way.

The Membership Update MAC becomes amt_relay_mac(), one siphash() over the
packed {address, port, nonce} tuple instead of siphash_3u32() over the
IPv4 address. The Request and Update handlers both compute it with the
helper. Only the relay computes and checks the MAC; the gateway echoes it
verbatim, so the different IPv4 value is not visible on the wire.

The IPv4 senders and the relay status debug message are converted to
tunnel->addr.ip4, and the debug message prints an IPv6 endpoint with
%pI6c. amt_v6() is still false for every device, so there is no
functional change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 89 ++++++++++++++++++++++++++++++++---------------
 include/net/amt.h | 20 ++++++-----
 2 files changed, 72 insertions(+), 37 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 52ccaca08..38740e0ac 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -98,6 +98,32 @@ static bool amt_v6(const struct amt_dev *amt)
 	return IS_ENABLED(CONFIG_IPV6) && !ipv6_addr_any(&amt->local_ipv6);
 }
 
+/* Snapshot the outer source address of a received AMT message. */
+static void amt_outer_saddr(const struct amt_dev *amt,
+			    const struct sk_buff *skb, union amt_addr *addr)
+{
+	memset(addr, 0, sizeof(*addr));
+	if (amt_v6(amt))
+		addr->ip6 = ipv6_hdr(skb)->saddr;
+	else
+		addr->ip4 = ip_hdr(skb)->saddr;
+}
+
+/* The Membership Update MAC for a gateway endpoint.  The gateway only echoes
+ * it, so one siphash() over the zero-padded endpoint serves both families.
+ */
+static u64 amt_relay_mac(const union amt_addr *addr, __be16 port, __be32 nonce,
+			 const siphash_key_t *key)
+{
+	struct {
+		union amt_addr	addr;
+		__be16		port;
+		__be32		nonce;
+	} __packed in = { .addr = *addr, .port = port, .nonce = nonce };
+
+	return siphash(&in, sizeof(in), key) >> 16;
+}
+
 static void __amt_source_gc_work(void)
 {
 	struct amt_source_node *snode;
@@ -701,10 +727,16 @@ static void __amt_update_relay_status(struct amt_tunnel_list *tunnel,
 {
 	if (validate && tunnel->status >= status)
 		return;
-	netdev_dbg(tunnel->amt->dev,
-		   "Update Tunnel(IP = %pI4, PORT = %u) status %s -> %s",
-		   &tunnel->ip4, ntohs(tunnel->source_port),
-		   status_str[tunnel->status], status_str[status]);
+	if (amt_v6(tunnel->amt))
+		netdev_dbg(tunnel->amt->dev,
+			   "Update Tunnel(IP = %pI6c, PORT = %u) status %s -> %s",
+			   &tunnel->addr.ip6, ntohs(tunnel->source_port),
+			   status_str[tunnel->status], status_str[status]);
+	else
+		netdev_dbg(tunnel->amt->dev,
+			   "Update Tunnel(IP = %pI4, PORT = %u) status %s -> %s",
+			   &tunnel->addr.ip4, ntohs(tunnel->source_port),
+			   status_str[tunnel->status], status_str[status]);
 	tunnel->status = status;
 }
 
@@ -1292,12 +1324,12 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = tunnel->ip4;
+	fl4.daddr              = tunnel->addr.ip4;
 	fl4.saddr              = amt->local_ip;
 	fl4.flowi4_proto       = IPPROTO_UDP;
 	rt = ip_route_output_key(amt->net, &fl4);
 	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->ip4);
+		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->addr.ip4);
 		kfree_skb(skb);
 		return;
 	}
@@ -2728,12 +2760,14 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
  * race with amt_tunnel_expire() creates the replacement.
  */
 static struct amt_tunnel_list *amt_tunnel_lookup(struct amt_dev *amt,
-						 __be32 saddr, __be16 sport)
+						 union amt_addr *saddr,
+						 __be16 sport)
 {
 	struct amt_tunnel_list *tunnel;
 
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 == saddr && tunnel->source_port == sport &&
+		if (amt_addr_equal(&tunnel->addr, saddr) &&
+		    tunnel->source_port == sport &&
 		    !READ_ONCE(tunnel->dead))
 			return tunnel;
 	}
@@ -2759,7 +2793,7 @@ static u32 amt_max_tunnels_per_src(const struct amt_dev *amt)
  * verified source address may hold.
  */
 static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
-							__be32 saddr,
+							union amt_addr *saddr,
 							__be16 sport)
 {
 	struct amt_tunnel_list *tunnel;
@@ -2779,7 +2813,8 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
 	 * against its address.
 	 */
 	list_for_each_entry(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 != saddr || READ_ONCE(tunnel->dead))
+		if (!amt_addr_equal(&tunnel->addr, saddr) ||
+		    READ_ONCE(tunnel->dead))
 			continue;
 		if (tunnel->source_port == sport) {
 			spin_unlock_bh(&amt->lock);
@@ -2808,7 +2843,7 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
 	}
 
 	tunnel->source_port = sport;
-	tunnel->ip4 = saddr;
+	tunnel->addr = *saddr;
 	tunnel->amt = amt;
 	spin_lock_init(&tunnel->lock);
 	for (i = 0; i < amt->hash_buckets; i++)
@@ -2838,7 +2873,7 @@ static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
  * second amt_tunnel_get_or_create() call, which creates its replacement.
  */
 static bool amt_update_tunnel(struct amt_dev *amt, struct sk_buff *skb,
-			      __be32 saddr, __be16 sport, bool v6)
+			      union amt_addr *saddr, __be16 sport, bool v6)
 {
 	struct amt_tunnel_list *tunnel;
 	int i;
@@ -2878,12 +2913,13 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	struct ethhdr *eth;
 	struct iphdr *iph;
 	unsigned int seq;
+	union amt_addr saddr;
 	u64 response_mac;
-	__be32 saddr;
 	__be32 nonce;
 	__be16 sport;
 
-	saddr = ip_hdr(skb)->saddr;
+	/* Snapshot the outer source before any pull can move the header. */
+	amt_outer_saddr(amt, skb, &saddr);
 
 	hdr_size = sizeof(*amtmu) + sizeof(struct udphdr);
 	if (!pskb_may_pull(skb, hdr_size))
@@ -2910,10 +2946,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	} while (read_seqcount_retry(&amt->key_seq, seq));
 
 	for (i = 0; i < ARRAY_SIZE(key); i++) {
-		u64 mac = siphash_3u32((__force u32)saddr,
-				       (__force u32)sport,
-				       (__force u32)nonce,
-				       &key[i]) >> 16;
+		u64 mac = amt_relay_mac(&saddr, sport, nonce, &key[i]);
 
 		if (response_mac == mac) {
 			verified = true;
@@ -2947,7 +2980,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 			return true;
 		}
 
-		if (!amt_update_tunnel(amt, skb, saddr, sport, false))
+		if (!amt_update_tunnel(amt, skb, &saddr, sport, false))
 			return true;
 
 		skb_push(skb, sizeof(struct ethhdr));
@@ -2966,7 +2999,7 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 			return true;
 		}
 
-		if (!amt_update_tunnel(amt, skb, saddr, sport, true))
+		if (!amt_update_tunnel(amt, skb, &saddr, sport, true))
 			return true;
 
 		skb_push(skb, sizeof(struct ethhdr));
@@ -3165,8 +3198,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	struct amt_header_request *amtrh;
 	struct amt_tunnel_list *tunnel;
 	bool full, have = false;
+	union amt_addr saddr;
 	struct udphdr *udph;
-	struct iphdr *iph;
 	siphash_key_t key;
 	u32 per_src = 0;
 	u64 mac;
@@ -3174,7 +3207,7 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (!pskb_may_pull(skb, sizeof(*udph) + sizeof(*amtrh)))
 		return true;
 
-	iph = ip_hdr(skb);
+	amt_outer_saddr(amt, skb, &saddr);
 	udph = udp_hdr(skb);
 	amtrh = (struct amt_header_request *)(udp_hdr(skb) + 1);
 
@@ -3198,7 +3231,8 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	 */
 	rcu_read_lock();
 	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 != iph->saddr || READ_ONCE(tunnel->dead))
+		if (!amt_addr_equal(&tunnel->addr, &saddr) ||
+		    READ_ONCE(tunnel->dead))
 			continue;
 		per_src++;
 		if (tunnel->source_port == udph->source)
@@ -3210,15 +3244,12 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (!have && (full || per_src >= amt_max_tunnels_per_src(amt)))
 		return true;
 
-	mac = siphash_3u32((__force u32)iph->saddr,
-			   (__force u32)udph->source,
-			   (__force u32)amtrh->nonce,
-			   &key) >> 16;
+	mac = amt_relay_mac(&saddr, udph->source, amtrh->nonce, &key);
 	if (!amtrh->p)
-		amt_send_igmp_gq(amt, iph->saddr, udph->source, amtrh->nonce,
+		amt_send_igmp_gq(amt, saddr.ip4, udph->source, amtrh->nonce,
 				 mac);
 	else
-		amt_send_mld_gq(amt, iph->saddr, udph->source, amtrh->nonce,
+		amt_send_mld_gq(amt, saddr.ip4, udph->source, amtrh->nonce,
 				mac);
 
 	return false;
diff --git a/include/net/amt.h b/include/net/amt.h
index 52d77bc6b..245947113 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -252,6 +252,14 @@ struct amt_relay_headers {
 	};
 } __packed;
 
+/* ip6 is present without CONFIG_IPV6 too, so that code which only copies
+ * or compares addresses needs no #if; amt_v6() is then false.
+ */
+union amt_addr {
+	__be32			ip4;
+	struct in6_addr		ip6;
+};
+
 struct amt_tunnel_list {
 	struct list_head	list;
 	/* Protect All resources under an amt_tunne_list */
@@ -273,18 +281,14 @@ struct amt_tunnel_list {
 	 */
 	bool			dead;
 	__be16			source_port;
-	__be32			ip4;
+	/* Outer source address of the gateway endpoint, in the device's
+	 * outer family (amt_v6()).
+	 */
+	union amt_addr		addr;
 	struct rcu_head		rcu;
 	struct hlist_head	groups[];
 };
 
-union amt_addr {
-	__be32			ip4;
-#if IS_ENABLED(CONFIG_IPV6)
-	struct in6_addr		ip6;
-#endif
-};
-
 /* RFC 3810
  *
  * When the router is in EXCLUDE mode, the router state is represented
-- 
2.47.3


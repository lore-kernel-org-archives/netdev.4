Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634105;
	b=CXAnZ1xQ74eGcOHFnNcEMAFKGi0vWWoRQiKHAB0ALWrpArhzhWgdHvw33xjWWd4ZWS16
	 NCKhr6GM1Gu+SiW9N1/tY+FBRBf6PbtK/Ct7MF6XtAYxS83XRUZD1k8xzUiyHtNr8dGAl
	 xM8mtgwBFjPdh/HwjSS7JeRp4C6Z8L+P5yX7h4eHRDHOCT6np1In+YdawyZo7J/dVmaXF
	 TrfWMYUW8sKuK3IYp2iRVXEpxzz3WY+W5Wi6BVVVxC1UsQPBD37DJ+srtkyASo9ZSt4hk
	 lTK81dHNf16hMLvUEH+UXHPNr0tducXkyacQMQ/Ox5oEHjWCuPl0UxoJUe9n9y7+vTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d3zi6bNI7UNmRSGuVMXbafzrNoBdS/JdjTuPuwpbnpw=;
	b=ztxVcd20fd94R9QK7UoiBdrWKo3DJRp9QQdEM1+ZnJ0jLHXCb2DFEhvAWUSaNwSqrB2L
	 9rCUdxuBB5UDNHdapK39gG9Z1UXVQUT7O32kkV6bdtArezosV6l/4vcaImW0efizEyNez
	 hUtywtHP3WryKIpNq+4HgzzqGtobo4dXCaJpro2p9Y5Nd4nnJ4z/zR1vSFHDVD6UQWUqa
	 Rnm6dWpmMVx7oeF1l64qgl/rqkQxY2jk8U1rNcd5BX7Jgt1nov0XS7EwLqGDRiF8r8JMF
	 c5VuVx7bHPDP5LVZ0lOR6iRX1rDe1UBYwinHiSM4L5wg76Yc5p7U9UxokeO3GsfDp1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=utLjt339;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF460A2613
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAF460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=utLjt339
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f03eeda984so34658395ad.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634104; x=1796238904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3zi6bNI7UNmRSGuVMXbafzrNoBdS/JdjTuPuwpbnpw=;
        b=utLjt339tuHDxYQtQT+MowLIjQEihru2vTuCgtEn7BUwomALxM/p/IL6+GnV2feZMG
         DYDyimxYmQGbq1rrXXIxWNOb1YzV1V6V7qscIp8Qv2IRRBbOBnG+nc1TyBDu2U1HjPHS
         n9eBd5dmf6ZQG8Ze6zW5AksnbISDt3ltUV91Aq7hjK+oLRJSVd0qRPQ2YG9Li7lOcmx2
         xZc2XizH734HASu7rkNxhS5kbEqIBMocvGLAoOhS8SjJX7XEig1PZ7QzoN6HEuZXk57G
         R5T0n841Q60weADKz0jvfGP4IEIOP0Vtn6het9r/I+Lpn3aL5K1nWh9eI3ZRxqVuyNm+
         gqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634104; x=1796238904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3zi6bNI7UNmRSGuVMXbafzrNoBdS/JdjTuPuwpbnpw=;
        b=eHLmFudxogYRonjMb0JtlP9Zgvm0pkKYNLwKdyTCiM9hMM8XVWelLkj7bD4zERg10g
         ObrY8rb3VYzztFQNEGOyg9qd3lDHF2+oeAaTMEDt/Ow2B9cVHKJ/W6gSWly5h0Mgnwqp
         K0qv5ElMZSwiHrA6nKz2QPNk+E0MQqN6lCyiekgdKzvCei37iuSxIcARhl44bJxHNtdp
         yC5VT6plY3Wvr6Y5GDvDBnAJRjxcH/8DxkbaWuTJHcvBFJqWLkqoGeLAQfC4eTgUg4HA
         M5qzxbUoiEoBSG1XO9frGdbxDdP1y9v4Y/mDm8i6F1Q4h4p29bK2/YiHHpgrXuU7kl+q
         3GaQ==
X-Forwarded-Encrypted: i=1; AL+hErFjuYhy0sPO+wUreFbniiW2nTZnN31+bvBz20W1+1g5tlGR2yg6aGMC6+8S3q1B9CONPh3fDa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hPw1yiES59BNOPg2AfNQKW42A0CrLQy64Mpjsu86NML9RgG6U
	rCpBlyddC1Sf7eg0grVSVVUhRqIW0R5pUsNtbnybU1gwYW8omnMwXV1BDY0BNutTSt0=
X-Gm-Gg: AZFdTZdVp7/HtNKVSQguJ2YicI1Rs2UESvJqOMLRASqjHlCa/1SwlibwPlEbLNf5Pk5
	ZJbuicEndVyOaRREQAnGmwyPiRWYfj4BZWHTjj8BJnEDnKinjSZ2ShC6wRN+/6jaFcb08m+aSFx
	fqH6rxwzrgWkhkLOdq5HyHWDl/gsEYi5HUEJQyg0GQTjGj1ycJqEsTIRBoE1SsVvf+Nm1nxfALW
	PyS/ZxEwEn9RJXE/43YXCvCvhaeOSFRdAita1puxxbeBO3uQ1wUdDOJRFTaQPtYkDa9CveqrYmj
	YQmi+BINV3MjtAK2n8SGVxt3eMyPkQxc5HiUxUcRiVFFuEXssnaWOQ+C0MvfF+Id+m9iTya/Mpf
	bkadmGfVY3TVfxP/th9w9mTFr0K+YHiZnMb7yt7s1Ux7iduu4GG1n1kNfipfRmQ+vNtNQoeJeFJ
	UQdGhhWksV2H4At8n/yE/ORqk91ab0b9hEPIJwtgmNFRmri1S+jsggWU8DCqtL8d5pJb3v6dACg
	lOpZyuWuhoioyLjcmjCyBQQ9y/nZ0Cv5ZuPUFPm79WjhTJpruYw5mR78/CxVdJevN4DHvZeZuKv
	Ne2k/I7B+F+81AqxZk1odXFnkgttShPWpLhyrdxxhtovTNw+FgeLmtneg9GMkvubUDsUZBgdbE/
	WNGM5cjPn3y3vUusj2Th5Lp2bC9Sebip55erRw4MZjQsdWWbu3rUS
X-Received: by 2002:a17:902:dac6:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2f03f17d22bmr180370055ad.10.1795634103789;
        Wed, 25 Nov 2026 11:15:03 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:03 -0800 (PST)
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
Subject: [PATCH net-next v2 08/12] amt: receive the AMT gateway control plane over IPv6
Date: Wed, 25 Nov 2026 19:14:46 +0000
Message-ID: <20261125191450.2497936-9-omar@blockcast.net>
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

An IPv6 gateway now sends its Discovery, Request and Updates over IPv6,
but it cannot take the replies. amt_rcv() checks the outer source of an
Advertisement against the discovery address, and that of Multicast Data
and a Membership Query against the learned relay address, by reading
ip_hdr(skb)->saddr, which on an IPv6 outer header is part of the flow
label and payload length. amt_advertisement_handler() parses only the
IPv4 form, so the gateway never learns an IPv6 relay address.

amt_rcv() now takes the outer source by value with amt_outer_saddr()
before amt_parse_type() pulls, and checks it through amt_from_relay(),
which compares it with the discovery address for an Advertisement and
with the learned relay address otherwise, in the device's family.
The IPv4 comparison it replaces is the one "amt: reject a gateway Query
or Data from 0.0.0.0" fixed in net for IPv4, so this patch carries only
the IPv6 half. amt_membership_query_handler() repeats the check for a
Query that waited in the event queue, now through amt_from_relay() too.
amt_advertisement_handler() pulls the 24-byte IPv6 form on an IPv6
gateway. Its fixed header and nonce are laid out as in the IPv4 form, so
the shared checks run once and only the relay address is checked and
recorded per family. An IPv6 relay address is refused when it is
unspecified, loopback, multicast or IPv4-mapped, the IPv6 counterparts
of the checks on the IPv4 address; the V6ONLY socket could not reach an
IPv4-mapped relay.

The IPv6 relay address needs more care than the IPv4 one. The
Advertisement handler, its only writer, runs from the event workqueue,
while it is read in softirq, on receive and on transmit, and from
amt_fill_info(), which no longer relies on RTNL. Nothing serialises
them. remote_ip is a single 32-bit word, but a struct in6_addr is copied
word by word, so with a plain assignment a reader could see half of an
old and half of a new address: a packet sent to a spliced destination,
or a valid relay's traffic dropped as "Invalid Relay IP". Publish it
with amt_set_remote_ipv6() under a seqlock, remote_ipv6_lock, and read
it with amt_get_remote_ipv6(), which retries until it has a consistent
copy. Readers take no lock, so the receive path does not contend with
the worker. Every consumer takes one snapshot per packet and uses it
throughout, and amt_rcv() takes it only for the message types that use
it. amt_newlink() initialises the seqlock before the device is
registered.

amt_clear_remote() forgets the learned relay in both families. It
replaces the IPv4-only reset in amt_event_send_request(), amt_dev_open()
and amt_dev_stop(), so a gateway that is taken down and up again neither
accepts traffic from its previous relay's IPv6 address nor keeps
reporting it.

IPv6 input does not drop a packet from the unspecified address, as
IPv4 input drops a 0.0.0.0 source as a martian. Such a packet would
match the cleared relay address of a gateway that has lost its relay,
and with a zero nonce in that window it could inject a Membership
Query; a relay would create a tunnel for it. amt_rcv() drops it, and
amt_from_relay() matches nothing against a relay address that is not
known, in either family.

RFC 7450 s5.2.3.3 says a gateway that processes Multicast Data itself,
as amt_rcv() does, must not discard it for a zero UDP checksum, and
s5.1.6 lets a relay send one, the RFC 6936 exception to RFC 8200 s8.1.
The socket of an IPv6 gateway therefore accepts a zero checksum; a
non-zero one is still verified. amt_rcv() drops a zero checksum on
every other message a gateway receives, as RFC 6936 s5 asks, and the
socket of a relay keeps requiring the checksum.

The Membership Query and Multicast Data handlers dispatch on the inner
family and work on the AMT payload behind the outer header, so they
need no change. With this an IPv6 gateway discovers an IPv6 relay,
completes the Request, Query and Update exchange and receives multicast,
as an IPv4 gateway does.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 151 ++++++++++++++++++++++++++++++++++++++--------
 include/net/amt.h |   2 +
 2 files changed, 127 insertions(+), 26 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 6158e13f5..7dd1d544f 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -831,6 +831,61 @@ static int amt_send_ctrl_v6(struct amt_dev *amt, const struct in6_addr *saddr,
 	return err;
 }
 
+/* The learned relay address is written by the event worker and read by the
+ * softirq RX and TX paths. A struct in6_addr cannot be stored or loaded in
+ * one access, so it is published under a seqlock, and every consumer takes
+ * one snapshot per packet.
+ */
+static void amt_set_remote_ipv6(struct amt_dev *amt,
+				const struct in6_addr *addr)
+{
+	write_seqlock_bh(&amt->remote_ipv6_lock);
+	amt->remote_ipv6 = *addr;
+	write_sequnlock_bh(&amt->remote_ipv6_lock);
+}
+
+static void amt_get_remote_ipv6(const struct amt_dev *amt,
+				struct in6_addr *addr)
+{
+	unsigned int seq;
+
+	do {
+		seq = read_seqbegin(&amt->remote_ipv6_lock);
+		*addr = amt->remote_ipv6;
+	} while (read_seqretry(&amt->remote_ipv6_lock, seq));
+}
+
+/* Forget the relay a gateway learned, in both outer families. */
+static void amt_clear_remote(struct amt_dev *amt)
+{
+	WRITE_ONCE(amt->remote_ip, 0);
+	amt_set_remote_ipv6(amt, &in6addr_any);
+}
+
+/* Whether a message a gateway received came from its relay: the discovery
+ * address for an Advertisement, the learned relay address otherwise. A
+ * relay address that is not known, the unspecified address, matches
+ * nothing.
+ */
+static bool amt_from_relay(const struct amt_dev *amt,
+			   const union amt_addr *saddr, bool discovery)
+{
+	__be32 relay4;
+
+	if (amt_v6(amt)) {
+		struct in6_addr relay;
+
+		if (discovery)
+			relay = amt->discovery_ipv6;
+		else
+			amt_get_remote_ipv6(amt, &relay);
+		return !ipv6_addr_any(&relay) &&
+		       ipv6_addr_equal(&saddr->ip6, &relay);
+	}
+	relay4 = discovery ? amt->discovery_ip : READ_ONCE(amt->remote_ip);
+	return relay4 && saddr->ip4 == relay4;
+}
+
 /* IPv6-outer variant of amt_send_discovery(). */
 static void amt_send_discovery_v6(struct amt_dev *amt)
 {
@@ -855,9 +910,11 @@ static void amt_send_request_v6(struct amt_dev *amt, bool v6)
 		.p	= v6,
 		.nonce	= amt->nonce,
 	};
+	struct in6_addr remote6;
 
-	amt_send_ctrl_v6(amt, &amt->local_ipv6, &amt->remote_ipv6,
-			 amt->gw_port, amt->relay_port, &amtrh, sizeof(amtrh));
+	amt_get_remote_ipv6(amt, &remote6);
+	amt_send_ctrl_v6(amt, &amt->local_ipv6, &remote6, amt->gw_port,
+			 amt->relay_port, &amtrh, sizeof(amtrh));
 }
 
 static void amt_send_discovery(struct amt_dev *amt)
@@ -1254,7 +1311,7 @@ static void amt_event_send_request(struct amt_dev *amt)
 		amt->qi = AMT_INIT_REQ_TIMEOUT;
 		WRITE_ONCE(amt->ready4, false);
 		WRITE_ONCE(amt->ready6, false);
-		WRITE_ONCE(amt->remote_ip, 0);
+		amt_clear_remote(amt);
 		amt_update_gw_status(amt, AMT_STATUS_INIT, false);
 		amt->req_cnt = 0;
 		amt->nonce = 0;
@@ -1404,7 +1461,7 @@ static bool amt_send_membership_update(struct amt_dev *amt,
 	else
 		skb_set_inner_protocol(skb, htons(ETH_P_IPV6));
 	if (amt_v6(amt))
-		remote.ip6 = amt->remote_ipv6;
+		amt_get_remote_ipv6(amt, &remote.ip6);
 	else
 		remote.ip4 = remote_ip;
 	if (amt_udp_xmit(amt, sk, skb, &remote, amt->gw_port,
@@ -2662,27 +2719,48 @@ static bool amt_advertisement_handler(struct amt_dev *amt, struct sk_buff *skb)
 	struct amt_header_advertisement *amta;
 	int hdr_size;
 
-	hdr_size = sizeof(*amta) + sizeof(struct udphdr);
+	/* The IPv6 form (RFC 7450 s5.1.2) has the same header and nonce, with
+	 * a 16-byte relay address in place of ip4.
+	 */
+	hdr_size = sizeof(struct udphdr) +
+		   (amt_v6(amt) ? sizeof(struct amt_header_advertisement_v6) :
+				  sizeof(*amta));
 	if (!pskb_may_pull(skb, hdr_size))
 		return true;
 
-	amta = (struct amt_header_advertisement *)(udp_hdr(skb) + 1);
-	if (!amta->ip4)
+	/* The two forms differ only in their length, and the device's family
+	 * picks one, so a message of the other form is not accepted.
+	 */
+	if (ntohs(udp_hdr(skb)->len) != hdr_size)
 		return true;
 
+	amta = (struct amt_header_advertisement *)(udp_hdr(skb) + 1);
 	if (amta->reserved || amta->version)
 		return true;
 
-	if (ipv4_is_loopback(amta->ip4) || ipv4_is_multicast(amta->ip4) ||
-	    ipv4_is_zeronet(amta->ip4))
-		return true;
-
 	if (amt->status != AMT_STATUS_SENT_DISCOVERY ||
 	    amt->nonce != amta->nonce)
 		return true;
 
-	WRITE_ONCE(amt->remote_ip, amta->ip4);
-	netdev_dbg(amt->dev, "advertised remote ip = %pI4\n", &amta->ip4);
+	if (amt_v6(amt)) {
+		const struct in6_addr *ip6;
+
+		ip6 = &((struct amt_header_advertisement_v6 *)amta)->ip6;
+		if (ipv6_addr_any(ip6) || ipv6_addr_loopback(ip6) ||
+		    ipv6_addr_is_multicast(ip6) || ipv6_addr_v4mapped(ip6))
+			return true;
+
+		amt_set_remote_ipv6(amt, ip6);
+		netdev_dbg(amt->dev, "advertised remote ipv6 = %pI6c\n", ip6);
+	} else {
+		if (!amta->ip4 || ipv4_is_loopback(amta->ip4) ||
+		    ipv4_is_multicast(amta->ip4) || ipv4_is_zeronet(amta->ip4))
+			return true;
+
+		WRITE_ONCE(amt->remote_ip, amta->ip4);
+		netdev_dbg(amt->dev, "advertised remote ip = %pI4\n",
+			   &amta->ip4);
+	}
 	mod_delayed_work(amt_wq, &amt->req_wq, 0);
 
 	amt_update_gw_status(amt, AMT_STATUS_RECEIVED_ADVERTISEMENT, true);
@@ -2767,6 +2845,7 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	struct ethhdr *eth, *oeth;
 	struct igmpv3_query *ihv3;
 	u8 h_source[ETH_ALEN];
+	union amt_addr saddr;
 	struct iphdr *iph;
 	int hdr_size, len;
 	u64 response_mac;
@@ -2780,7 +2859,8 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 		return true;
 
 	/* A deferred query may outlive a relay address change. */
-	if (ip_hdr(skb)->saddr != READ_ONCE(amt->remote_ip))
+	amt_outer_saddr(amt, skb, &saddr);
+	if (!amt_from_relay(amt, &saddr, false))
 		return true;
 
 	if (amtmq->nonce != amt->nonce)
@@ -3409,9 +3489,8 @@ static void amt_gw_rcv(struct amt_dev *amt, struct sk_buff *skb)
 
 static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 {
+	union amt_addr saddr;
 	struct amt_dev *amt;
-	__be32 remote_ip;
-	__be32 saddr;
 	int type;
 	bool err;
 
@@ -3422,10 +3501,17 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 		kfree_skb(skb);
 		goto out;
 	}
-	remote_ip = READ_ONCE(amt->remote_ip);
 
 	skb->dev = amt->dev;
-	saddr = ip_hdr(skb)->saddr;
+	/* Snapshot the outer source before amt_parse_type() pulls. */
+	amt_outer_saddr(amt, skb, &saddr);
+	/* IPv4 input drops a 0.0.0.0 source as a martian, but IPv6 input
+	 * delivers ::, which no relay or gateway can be.
+	 */
+	if (amt_v6(amt) && ipv6_addr_any(&saddr.ip6)) {
+		err = true;
+		goto drop;
+	}
 	type = amt_parse_type(skb);
 	if (type == -1) {
 		err = true;
@@ -3433,9 +3519,17 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 	}
 
 	if (amt->mode == AMT_MODE_GATEWAY) {
+		/* RFC 6936 s5: accept the zero checksum only on the message
+		 * that needs it.
+		 */
+		if (amt_v6(amt) && !udp_hdr(skb)->check &&
+		    type != AMT_MSG_MULTICAST_DATA) {
+			err = true;
+			goto drop;
+		}
 		switch (type) {
 		case AMT_MSG_ADVERTISEMENT:
-			if (saddr != amt->discovery_ip) {
+			if (!amt_from_relay(amt, &saddr, true)) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -3447,7 +3541,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			}
 			goto out;
 		case AMT_MSG_MULTICAST_DATA:
-			if (!remote_ip || saddr != remote_ip) {
+			if (!amt_from_relay(amt, &saddr, false)) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -3458,7 +3552,7 @@ static int amt_rcv(struct sock *sk, struct sk_buff *skb)
 			else
 				goto out;
 		case AMT_MSG_MEMBERSHIP_QUERY:
-			if (!remote_ip || saddr != remote_ip) {
+			if (!amt_from_relay(amt, &saddr, false)) {
 				netdev_dbg(amt->dev, "Invalid Relay IP\n");
 				err = true;
 				goto drop;
@@ -3597,13 +3691,17 @@ static struct sock *amt_create_sock(const struct amt_dev *amt)
 		 * the output interface, as the IPv4 lookup is, and receives
 		 * from that link only, where a link-local peer is unique.
 		 * V6ONLY keeps the socket off the IPv4 wildcard, so an IPv4
-		 * amt device can use the same port in the netns. The UDP
-		 * checksum is mandatory over IPv6.
+		 * amt device can use the same port in the netns.
+		 *
+		 * The UDP checksum is always sent (RFC 8200 s8.1). A gateway
+		 * also accepts a zero checksum, as RFC 7450 s5.2.3.3 requires
+		 * for Multicast Data, and amt_rcv() drops it on the other
+		 * messages; a non-zero checksum is still verified.
 		 */
 		udp_conf.family = AF_INET6;
 		udp_conf.bind_ifindex = amt->stream_dev->ifindex;
 		udp_conf.use_udp6_tx_checksums = true;
-		udp_conf.use_udp6_rx_checksums = true;
+		udp_conf.use_udp6_rx_checksums = amt->mode == AMT_MODE_RELAY;
 		udp_conf.ipv6_v6only = true;
 	} else {
 		udp_conf.family = AF_INET;
@@ -3672,7 +3770,7 @@ static int amt_dev_open(struct net_device *dev)
 	}
 
 	amt->req_cnt = 0;
-	WRITE_ONCE(amt->remote_ip, 0);
+	amt_clear_remote(amt);
 	amt->nonce = 0;
 
 	amt->status = AMT_STATUS_INIT;
@@ -3721,7 +3819,7 @@ static int amt_dev_stop(struct net_device *dev)
 	amt->ready4 = false;
 	amt->ready6 = false;
 	amt->req_cnt = 0;
-	WRITE_ONCE(amt->remote_ip, 0);
+	amt_clear_remote(amt);
 
 	/* Mark every tunnel dead first, so a concurrent amt_tunnel_expire()
 	 * sees ->dead and bails instead of freeing a tunnel in parallel; this
@@ -3891,6 +3989,7 @@ static int amt_newlink(struct net_device *dev,
 		amt->max_tunnels = AMT_MAX_TUNNELS;
 
 	spin_lock_init(&amt->lock);
+	seqlock_init(&amt->remote_ipv6_lock);
 	seqcount_spinlock_init(&amt->key_seq, &amt->lock);
 	amt->max_groups = AMT_MAX_GROUP;
 	amt->max_sources = AMT_MAX_SOURCE;
diff --git a/include/net/amt.h b/include/net/amt.h
index be564c710..4fc1452e0 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -394,6 +394,8 @@ struct amt_dev {
 	 * in6addr_any in v4 mode, mutually exclusive with remote_ip)
 	 */
 	struct in6_addr		remote_ipv6;
+	/* Publishes remote_ipv6, which is too wide for a single access */
+	seqlock_t		remote_ipv6_lock;
 	/* Outer discovery ip */
 	__be32			discovery_ip;
 	/* Outer discovery ipv6 (v6 gateway only; in6addr_any in v4 mode,
-- 
2.47.3


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950341;
	b=P7TZI8yNaokylm0CoAyrd7Q+yroPODmu2Dcx3vahSIyG3RWhomZIEbsCYE7iWGIRGrF5
	 IPV2hMnBN70zKYI1ONENl2iEHl3u15IBEotCyzLRvkbQSR8KZabIm0pinOKdPx0cvnnjX
	 QtC3C+K0Nm/vcov2R7dvsT89H9BcWf9aNdqGgiTRssz6gUtJbin3pb7icsejhrQsefc9p
	 aCoEs5GKtZNeR/HnZbFLyAswZYAM0QikqPubT1lVC2Vctn6vjiL6MEAju6LuSi/oHe73x
	 4XkrWm9GD2qdo+Y5MLbu17gkob5TJlHZXbg8+j5+kdJPnVWxhtRPLB7R1SyiQdoXwpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7A5Ot0PsXifuUJ5IbMDqAAIHHfOd9ICvCrnu7reZ0cE=;
	b=B3FfmpLfWYI1rsXoOcZIltLSfaesYc5PvNLtyK/+hNMFLoTnQusVmXYRwcUV/1w+h0RB
	 Il9HSv0hFULR6eGPBYjsO0It9t+AEfMFEBYbd1TSvOnhLpePBcKLTKvJcZb3+B1cjU1YH
	 Db8GfV8gfQUCqYrbbte7Q+bvjgArdger9SrnJm0i6MWfg/Grr9Eq3hyK0rRKxZsquwexp
	 FpW4q+V3TkorabWvD9R2phv98dm4GrX/go6XnrrG4/ePAeqhgrEDpQH5PN5RFT8uLhyme
	 aSOFr+ttjIhi+q+7OXbVkAK2euIzdY4KhPgKHQ5XPpvWSuLF1hMd0hLovtoq0zWY6NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRtDfXxK;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39A5606A8AD
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D39A5606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRtDfXxK
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c151178f0cso220601e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950339; x=1795555139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7A5Ot0PsXifuUJ5IbMDqAAIHHfOd9ICvCrnu7reZ0cE=;
        b=lRtDfXxKBFrUvMIyduBLxYqGLPqBvbvDlAiGYPFzrm3paIMYPX2IIFPynKSU+YGpM2
         eXoRFNF7uynoToYhf/3nmTYwqjxPpc4WYx7acCscxaG4RH1hUDBH6pDtqNITSDC+a27r
         Gf/bRrB20Ro8NC4ArzkK7clxmEQ8S2rpj4HPMEg5naKxcDmD3mI5kKVvdGfDTfuYWhmV
         XT6yuK6eQ0TX4cu4Y45P/bEidmIVT5par1+VR96ZI8iAb/ZHMiEhy/KKoZAiOjMBgpqc
         c07GpYHmr/mHZzZedGHvIsVr104PCrGd8J4DTs2f6+nUv0AwVsoQgqyrPYFIkCX9G5qx
         mghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950339; x=1795555139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7A5Ot0PsXifuUJ5IbMDqAAIHHfOd9ICvCrnu7reZ0cE=;
        b=GOaqCoRZbtbsSmsdLJwC52rBDvDojfoEHdTgBxY2CIq7e70FAbLlAA0n58MiWmCWV5
         kVQQFHGUpzsKg+C/Pxuwz9zRCTi8Ibm4dMuygMVZ6DTVUI978UmGcp+6zIwW5O6BPlV8
         TPwsXwnTiCDBp8UeqQlCSFCzBoGKqj5vGN4eWuiHEpeYsxkv8s0HEcJgV4zSeZPANXpB
         HdDehZwh+IanrSgJ8Sm3/HTJGFV1VayBcWhcvXr4FIOhzJOUpu+6TWljortH1hWU841p
         TzBhiqv+8vdGynf3De0j0KqzRjWpglw9prgSgRt9Bn1n/sQ8cuJt6lj8XsYE71q/XD9w
         lt1g==
X-Gm-Message-State: APuU4Z89M+2z0qMk4+kBfc4943b2iMu7YzPyZj0hKuCmmZ+CZzkwTDkF
	I1Qvf6thMgI9e8bqZvzrqEP+1jjCi5DB4KWMtruWlCT7HODiWn7Le1Rh9WiQrrPGhH/L6g==
X-Gm-Gg: AYBFou1gNrE4Pm3KuWgp/yjeShKRZNbklPh2eymC9SBkvPHD5Ol1TygJnc2DvI4xlY+
	EnIr7hoE21jgfWuHmOiRjY2Utm1Ax5A4T42hNFW8UqN3rgXIsO44j25te8OByIcktuaXcTkF0o0
	rImiWlb+4U1XTeq4o9uk9x6J3CxvfthwnOuzGys7G2bgmQSmzcE/hwaZLV9JXlYlxI3sNZroOt1
	QyGtIwwAUiInnNv/+mHOE8+3Nhk8+ncf7ASiGVfHaZrvZzbXoZ8TPj1ML6zX1/g/C42UFhCUDbR
	pRF1YGBdmK+IeZQ5VibTk/GfFTgRtPRgwD8YbfYpAkI0qIE12tR3lMjjUadCQWtWixoaoaFWbhD
	VVJ/4NuAWFvoV5B/zcILl+qu1KFhMr7rlUFwixegRxv5I0CY4VaSparDUE76qgm7p0jQRiR+ny3
	0X+Xe6voNkfgAuKfX3XF2BDJd4mzCnm2Whf8zp6DXecygA3xKvDgONs4f2dIRox/wHMmOMsIy5y
	uW+1vGwlxjI3selS6wfrCh5aY69dAFuDI5vQgoSvS46lPiG8HXfZKmcx4D1DBHnOjwN14206IOL
	XjP/GEeddCFPX1fyTPzS1zHAV7m3MZVtnY17h/ZGZHSuoAsjFvvGqEEmPiSErr11buUAy8Nc0vg
	J5sNlcLqO1QsFaATen3c=
X-Received: by 2002:a05:6512:3e13:b0:5c1:4a8d:9f15 with SMTP id 2adb3069b0e04-5c1a9c232c9mr125431e87.17.1794950338892;
        Tue, 17 Nov 2026 13:18:58 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:58 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v7 3/8] gre: make gre_parse_header() report a drop reason
Date: Wed, 18 Nov 2026 00:18:48 +0300
Message-ID: <20261117211853.3733250-4-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
References: <20261117211853.3733250-1-littlesmilingcloud@gmail.com>
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

gre_parse_header() returns -EINVAL for every failure. Neither receive
caller uses its csum_err output. Return a drop reason and let callers
read the parsed header length from tpi->hdr_len.

Use GRE_CSUM for a bad checksum and TUNNEL_INVALID_HDR for unsupported
version or routing bits. Propagate header pull failures. The WCCP byte
read with skb_header_pointer() has no detailed error, so use
PKT_TOO_SMALL there. In the demux, distinguish an invalid version from
a valid version with no registered handler (UNHANDLED_PROTO).

ICMP error handlers may see only part of the original packet. Preserve
their checksum handling by passing ignore_csum_err explicitly. After a
successful parse, reset the receive drop reason to NOT_SPECIFIED until
the tunnel handlers themselves return reasons.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h |  4 +++
 include/net/gre.h             |  5 +--
 net/ipv4/gre_demux.c          | 64 ++++++++++++++++++++++++-----------
 net/ipv4/ip_gre.c             | 23 +++++++------
 net/ipv6/ip6_gre.c            | 19 ++++++-----
 5 files changed, 74 insertions(+), 41 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 03c6f6aa1510..922862f9ad88 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -131,6 +131,7 @@
 	FN(RECURSION_LIMIT)		\
 	FN(TUNNEL_OPT_MISMATCH)		\
 	FN(TUNNEL_OLD_SEQ)		\
+	FN(GRE_CSUM)			\
 	FNe(MAX)
 
 /**
@@ -543,6 +544,7 @@ enum skb_drop_reason {
 	 * @SKB_DROP_REASON_TUNNEL_INVALID_HDR: tunnel header is invalid. E.g.:
 	 * 1) VXLAN reserved fields are not zero
 	 * 2) VXLAN "I" flag is not set
+	 * 3) GRE version is not supported or the routing bit is set
 	 */
 	SKB_DROP_REASON_TUNNEL_INVALID_HDR,
 	/**
@@ -635,6 +637,8 @@ enum skb_drop_reason {
 	 * remote endpoint restarted and reset its sequence numbering.
 	 */
 	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
+	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
+	SKB_DROP_REASON_GRE_CSUM,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/include/net/gre.h b/include/net/gre.h
index b55f67ecd2fc..b5dbe00ab15e 100644
--- a/include/net/gre.h
+++ b/include/net/gre.h
@@ -32,8 +32,9 @@ struct gre_protocol {
 int gre_add_protocol(const struct gre_protocol *proto, u8 version);
 int gre_del_protocol(const struct gre_protocol *proto, u8 version);
 
-int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs);
+enum skb_drop_reason
+gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
+		 bool ignore_csum_err, __be16 proto, int nhs);
 
 static inline bool netif_is_gretap(const struct net_device *dev)
 {
diff --git a/net/ipv4/gre_demux.c b/net/ipv4/gre_demux.c
index 96fd7dc6d82d..6c1d1fe914b8 100644
--- a/net/ipv4/gre_demux.c
+++ b/net/ipv4/gre_demux.c
@@ -56,28 +56,47 @@ int gre_del_protocol(const struct gre_protocol *proto, u8 version)
 }
 EXPORT_SYMBOL_GPL(gre_del_protocol);
 
-/* Fills in tpi and returns header length to be pulled.
- * Note that caller must use pskb_may_pull() before pulling GRE header.
+/**
+ * gre_parse_header() - parse the GRE header of a packet
+ * @skb: the packet; the GRE header starts @nhs bytes past skb->data
+ * @tpi: filled in with the fields of the header, and with the length of
+ *	the header to be pulled in tpi->hdr_len
+ * @ignore_csum_err: do not reject the header when its checksum does not
+ *	match. The ICMP error handlers set it, as they only get a part of the
+ *	original packet; the checksum is still computed and the rest of the
+ *	header is parsed.
+ * @proto: the protocol to report for a WCCP payload, ETH_P_IP or
+ *	ETH_P_IPV6
+ * @nhs: the offset of the GRE header from skb->data
+ *
+ * The caller must use pskb_may_pull() before pulling the GRE header.
+ *
+ * Return: SKB_NOT_DROPPED_YET, or the reason to drop the packet if the
+ * header is rejected.
  */
-int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		     bool *csum_err, __be16 proto, int nhs)
+enum skb_drop_reason
+gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
+		 bool ignore_csum_err, __be16 proto, int nhs)
 {
 	const struct gre_base_hdr *greh;
+	enum skb_drop_reason reason;
 	__be32 *options;
 	int hdr_len;
 
-	if (unlikely(!pskb_may_pull(skb, nhs + sizeof(struct gre_base_hdr))))
-		return -EINVAL;
+	reason = pskb_may_pull_reason(skb, nhs + sizeof(struct gre_base_hdr));
+	if (unlikely(reason))
+		return reason;
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
 	if (unlikely(greh->flags & (GRE_VERSION | GRE_ROUTING)))
-		return -EINVAL;
+		return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
 	gre_flags_to_tnl_flags(tpi->flags, greh->flags);
 	hdr_len = gre_calc_hlen(tpi->flags);
 
-	if (!pskb_may_pull(skb, nhs + hdr_len))
-		return -EINVAL;
+	reason = pskb_may_pull_reason(skb, nhs + hdr_len);
+	if (reason)
+		return reason;
 
 	greh = (struct gre_base_hdr *)(skb->data + nhs);
 	tpi->proto = greh->protocol;
@@ -87,9 +106,8 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		if (!skb_checksum_simple_validate(skb)) {
 			skb_checksum_try_convert(skb, IPPROTO_GRE,
 						 null_compute_pseudo);
-		} else if (csum_err) {
-			*csum_err = true;
-			return -EINVAL;
+		} else if (!ignore_csum_err) {
+			return SKB_DROP_REASON_GRE_CSUM;
 		}
 
 		options++;
@@ -117,7 +135,7 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		val = skb_header_pointer(skb, nhs + hdr_len,
 					 sizeof(_val), &_val);
 		if (!val)
-			return -EINVAL;
+			return SKB_DROP_REASON_PKT_TOO_SMALL;
 		tpi->proto = proto;
 		if ((*val & 0xF0) != 0x40)
 			hdr_len += 4;
@@ -132,29 +150,35 @@ int gre_parse_header(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 	    greh->protocol == htons(ETH_P_ERSPAN2)) {
 		struct erspan_base_hdr *ershdr;
 
-		if (!pskb_may_pull(skb, nhs + hdr_len + sizeof(*ershdr)))
-			return -EINVAL;
+		reason = pskb_may_pull_reason(skb,
+					      nhs + hdr_len + sizeof(*ershdr));
+		if (reason)
+			return reason;
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + nhs + hdr_len);
 		tpi->key = cpu_to_be32(get_session_id(ershdr));
 	}
 
-	return hdr_len;
+	return SKB_NOT_DROPPED_YET;
 }
 EXPORT_SYMBOL(gre_parse_header);
 
 static int gre_rcv(struct sk_buff *skb)
 {
 	const struct gre_protocol *proto;
+	enum skb_drop_reason reason;
 	u8 ver;
 	int ret;
 
-	if (!pskb_may_pull(skb, 12))
+	reason = pskb_may_pull_reason(skb, 12);
+	if (reason)
 		goto drop;
 
 	ver = skb->data[1]&0x7f;
-	if (ver >= GREPROTO_MAX)
+	if (ver >= GREPROTO_MAX) {
+		reason = SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 		goto drop;
+	}
 
 	rcu_read_lock();
 	proto = rcu_dereference(gre_proto[ver]);
@@ -167,11 +191,11 @@ static int gre_rcv(struct sk_buff *skb)
 drop_nohandler:
 	rcu_read_unlock();
 	dev_core_stats_rx_nohandler_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, SKB_DROP_REASON_UNHANDLED_PROTO);
 	return NET_RX_DROP;
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return NET_RX_DROP;
 }
 
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index f8a7c4353502..be880f69c06c 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -237,8 +237,8 @@ static void gre_err(struct sk_buff *skb, u32 info)
 	const int code = icmp_hdr(skb)->code;
 	struct tnl_ptk_info tpi;
 
-	if (gre_parse_header(skb, &tpi, NULL, htons(ETH_P_IP),
-			     iph->ihl * 4) < 0)
+	if (gre_parse_header(skb, &tpi, true, htons(ETH_P_IP),
+			     iph->ihl * 4))
 		return;
 
 	if (type == ICMP_DEST_UNREACH && code == ICMP_FRAG_NEEDED) {
@@ -441,37 +441,40 @@ static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
-	int hdr_len;
 
 #ifdef CONFIG_NET_IPGRE_BROADCAST
 	if (ipv4_is_multicast(ip_hdr(skb)->daddr)) {
 		/* Looped back packet, drop it! */
-		if (rt_is_output_route(skb_rtable(skb)))
+		if (rt_is_output_route(skb_rtable(skb))) {
+			reason = SKB_DROP_REASON_NOT_SPECIFIED;
 			goto drop;
+		}
 	}
 #endif
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IP), 0);
-	if (hdr_len < 0)
+	reason = gre_parse_header(skb, &tpi, false, htons(ETH_P_IP), 0);
+	if (reason)
 		goto drop;
 
+	reason = SKB_DROP_REASON_NOT_SPECIFIED;
+
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
 
-	if (ipgre_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+	if (ipgre_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
 		return 0;
 
 out:
 	icmp_send(skb, ICMP_DEST_UNREACH, ICMP_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 26c0e1c4de18..d91161e7ed78 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -389,8 +389,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	struct tnl_ptk_info tpi;
 	struct ip6_tnl *t;
 
-	if (gre_parse_header(skb, &tpi, NULL, htons(ETH_P_IPV6),
-			     offset) < 0)
+	if (gre_parse_header(skb, &tpi, true, htons(ETH_P_IPV6),
+			     offset))
 		return -EINVAL;
 
 	ipv6h = (const struct ipv6hdr *)skb->data;
@@ -575,20 +575,21 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 static int gre_rcv(struct sk_buff *skb)
 {
+	enum skb_drop_reason reason;
 	struct tnl_ptk_info tpi;
-	bool csum_err = false;
-	int hdr_len;
 
-	hdr_len = gre_parse_header(skb, &tpi, &csum_err, htons(ETH_P_IPV6), 0);
-	if (hdr_len < 0)
+	reason = gre_parse_header(skb, &tpi, false, htons(ETH_P_IPV6), 0);
+	if (reason)
 		goto drop;
 
-	if (iptunnel_pull_header(skb, hdr_len, tpi.proto, false))
+	reason = SKB_DROP_REASON_NOT_SPECIFIED;
+
+	if (iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false))
 		goto drop;
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, hdr_len) == PACKET_RCVD)
+		if (ip6erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
 			return 0;
 		goto out;
 	}
@@ -600,7 +601,7 @@ static int gre_rcv(struct sk_buff *skb)
 	icmpv6_send(skb, ICMPV6_DEST_UNREACH, ICMPV6_PORT_UNREACH, 0);
 drop:
 	dev_core_stats_rx_dropped_inc(skb->dev);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3


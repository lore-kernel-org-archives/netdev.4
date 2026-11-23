Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430540;
	b=frMpIzPyv1frviNiIV5rFmLjFrJl+bG/4s7GMsh/qQW+b92zqGj8enfVXxbxT0A9Dxbr
	 KL4t+7IuVgrfiDS6atiTV0DLzCtcjMddf7mxtQkletSKRiZRQglOFhD1RJj6lusRFylav
	 yg/bdBBsXWK0gdavuMqmoeAH5g+6jakCZ5+4Vorf95efRY3obif4Qx2Z/c1lxRtrFujJ6
	 38PwrJhWDtRb4gvB0NvbN5TiBA0gctXd9hil59lqLjMoO0ViykungrLBtxG3IOQtfwXZT
	 TPjZFzDcv+QG7tJwDanJT8fXu/39HTXnEPqD+/S+YDWkXv7DWBOUjTIOJkwTgqfK5EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430540;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVMqERs8JIv/9/6CunsVV9YAxV6U9y+jbs6vmxajrB8=;
	b=X4eB+Okmkoon4wZyuTZbSOdaogQv7FvMELczzxISDppIAzRhziYgX4/p5SD9ZNBsNcd8
	 9YXmVdCpibUmgzelJ5/vYUEznWV9entlB+rsUJhhQWoGLRuFnpzB8hxWMF3+9g36UcbHy
	 4WDBrOioCuv37qtC/EHiwaqlINFNgMl5nNJ6VHUWjOM+BKJYpJdMpiIWCMwWZZw2Vj4UR
	 AsN8wvpyFaFMw3aN5oyuBxFaKlQ5IIi+3811jp+90aAmxNYhI6Huc+pI3nHXubE9u6dHl
	 f/QUwEhyKXkKG655LyT9b21chOVj98XBaEJHMqkB/8KNAoNW+eLcPoIgUT5awjxj4Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OvE+HNKW;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0131606A6B0
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0131606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OvE+HNKW
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14470729eso3049779e87.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430538; x=1796035338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVMqERs8JIv/9/6CunsVV9YAxV6U9y+jbs6vmxajrB8=;
        b=OvE+HNKWo5VoiQX7+7y3vh3HgRP9D1MeZ7viapi0o9N5t3eaDnQ/7i4nGaHpJQuwrv
         z6FPHJTEK+MCeqV8UMaLyZcGc2pXXUrBfH2iNdVozBlqbhorMtJbIGOihZmBWEu7NOhQ
         lpt1pWYd7gVC7jVJbYz7ws2a6dy89okVJ4L8xL4p58o81UAsoRHOgfB0yzBdjING/j8t
         EoZmUZho/IGiexTwaeyd2piw0fhnyCmi1Kq6JD8z4kYenGdm5K2g/Umph9GuZZ0zWYoQ
         PoxamQHwSlBwnQqJ/6KKAAVZPf2qZZOhzRpp1gjAJCEnGp3ruFbgIM2avagbS/wpC0hv
         mNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430538; x=1796035338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVMqERs8JIv/9/6CunsVV9YAxV6U9y+jbs6vmxajrB8=;
        b=GH6sn39iFrXaod7NBybP2gER7PLAvt8eq8NqRqG2S2VpQWQiGCpd/t2TntMn7SK0zg
         mQXmwqGBqyxzgPm1RwiXmRP6fDjJYZZmj3I+Gnui80qT4+uzANMc0Xv2AeaHBj1Sihc+
         I8E55Rm+iyZHDavGljDBR9py2Zpb68QANs43sFz+9tdWnPG20kyFX5BID+/f1stSKiI4
         JN35EUlI3kc//OEBZ4nPThtXsDjsu3ZF+Nra6+/FFap6acCXACxkKafyc0jybNg5TvZh
         oXcAUKmDCEWsAxigVRSGCDEMC8/GGc/Z9cnMC9CD0W8Z1RG1fAw5myGcQKgE/lZa+R0w
         9o5Q==
X-Gm-Message-State: APuU4Z/n9IfBrwkx/2JcGhzxIFWQveqtLNR4AonuKwoMyMj4bOWqGCtZ
	81LL3ZiX36F1UfgBu2sMDqe9EPgfxjCVmyHdPUqfPVVfkwVEyRwt5JR3kfGmv08PrFROVA==
X-Gm-Gg: AZFdTZfdtxt4A+SMbthHIODep4ez0cr/JtoN1ivV9F3ZxMQHNEMEVcXZ5TIv7IKBTOz
	oSSjA0s90J3aaoFGJUrHQnby2r1ARssXEz0T7BcDZwO36ZfXv75Qqo9RE33Jp8NGL7MlQs44IVe
	afwSGHDL3SeEGYcE/amZNAjsKWV02bsZIUuahwOqgGtNDc8LxjwNxWZ+Y9TZ14rYC/5CYVu52BB
	s6u6+0aDRiScmsPFt6mplmoxwoPHsjh5m35SU8VDcwjvZ8cBV5kRkxUpCqvJYQ16q7n9mKv6X59
	/WFCWvFu67qnrDc0gknKAT1yMSiaBHiOBCAI+bg/+09EdMelnNG7Ysen5ScWUtkkDghqhof3P0c
	59bMmJCfE2haAxcWf2AG63F3HPGnWkLrJ3PWFCe3AnLYlnS6wSKU8p8XvoqUVUueLS6Ey+2+wqY
	RNXUFwbPnkcN2Cj7xlBSsofOcH5fvarqe/EtcFCAAdB/t76ylCveGysJWTfL8K+G8Lx+wSWpe+g
	QVV3VOcBIM4PPi5LcTHkH7ybuqSIdMFUgVMGvwyq6I3YXVc5aWdqO4j0XmNCMfO1vPr4t85zOjW
	eUXUZEJXM7r1Xd+Oy/DRN2rNDXsI9chGwjFyTGRJxTVkpVVxLmx8SkshyqNSX1jKqgXGbDCxWYX
	wWmebkU14TvtYhsmhFA==
X-Received: by 2002:ac2:4e11:0:b0:5bf:d54c:1fb6 with SMTP id 2adb3069b0e04-5c1bc862493mr2572337e87.44.1795430537700;
        Mon, 23 Nov 2026 02:42:17 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:17 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 3/8] gre: make gre_parse_header() report a drop reason
Date: Mon, 23 Nov 2026 13:42:05 +0300
Message-ID: <20261123104210.199916-4-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
References: <20261123104210.199916-1-littlesmilingcloud@gmail.com>
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
index 4c89485b98e6..a41980085af0 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -115,6 +115,7 @@
 	FN(TUNNEL_NOT_FOUND)		\
 	FN(TUNNEL_OPT_MISMATCH)		\
 	FN(TUNNEL_OLD_SEQ)		\
+	FN(GRE_CSUM)			\
 	FN(MAC_INVALID_SOURCE)		\
 	FN(VXLAN_ENTRY_EXISTS)		\
 	FN(NO_TX_TARGET)		\
@@ -545,6 +546,7 @@ enum skb_drop_reason {
 	 * @SKB_DROP_REASON_TUNNEL_INVALID_HDR: tunnel header is invalid. E.g.:
 	 * 1) VXLAN reserved fields are not zero
 	 * 2) VXLAN "I" flag is not set
+	 * 3) GRE version is not supported or the routing bit is set
 	 */
 	SKB_DROP_REASON_TUNNEL_INVALID_HDR,
 	/**
@@ -567,6 +569,8 @@ enum skb_drop_reason {
 	 * remote endpoint restarted and reset its sequence numbering.
 	 */
 	SKB_DROP_REASON_TUNNEL_OLD_SEQ,
+	/** @SKB_DROP_REASON_GRE_CSUM: GRE checksum error */
+	SKB_DROP_REASON_GRE_CSUM,
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
 	SKB_DROP_REASON_MAC_INVALID_SOURCE,
 	/**
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


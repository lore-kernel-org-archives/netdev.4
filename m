Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950343;
	b=e3h95EXVW/5VMEHIbIq2nWVTJtNY2V4OMIFdGtmFZFG4Ht1x6qIGWokTlnq40M1cWL8X
	 zOLlOnIE2O5yPtnIlGkaxlqvn0NLZNEm91CHnImhOaIQ+ztkR8ivbTl4ghY2bjjF30vNo
	 /ecQm/ni7i8ah7gFCC0dkgKAzqDPhKx3+7CKEXQG0Yp3qoFOn8KSPfm39utGcNxO10iQq
	 Lwd/yFsrAFz+VFNNvbpW0+4qnbP+kQsqRqDBymg6LHdS1gS1lsPYnns1MqWuF5lzEaIN1
	 YLGcZd+YDcvpV/BKJEcfrg8dqzTeaAEW5ZxEKbwR3rRSzPO573qnE6qO8SPUZET+6dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6T+2m0dmOKP5vkDIbMYrm0qs8uTzh+5F0gq417om3g0=;
	b=ar7t+U42VmQ0iUnIrj8ttG+D3v+YkwFG+Cqru1fWi2LOMXrRaGaEih16DWZYNhUprnSo
	 vwCp+5JvM6kb/iP5YOSKPmLoLnGsLh70YnwvbOjVmmbDVuHlAK3E0OLj05CNtnX9nGVBF
	 mGu1jnEAn3ncaA4Ewcr1Ko87iIj3QXhPeYphYoMuy+7wYmooLEspVT0Pr+ZeDndEsqAnX
	 RqszTykZakbubLvF3+KZlDFyhmZKkjnZWxHLWwstf2PXK1ztJCpY11gxZtWx2hxNU/QwM
	 hSiRjZnNYqYjxCDyUVU6Uqd7dz0864yD8kKNSJ+XcTgGBItP8hYywklvCtWdQXeVb8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8d8+rU0;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F15606A88D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F15606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8d8+rU0
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso214798e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950340; x=1795555140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6T+2m0dmOKP5vkDIbMYrm0qs8uTzh+5F0gq417om3g0=;
        b=L8d8+rU0wIijXiQakcKLrOi39w3lO/krLgQBP+NzpQ06QsqbllkPzhbRkT5KEt07Bm
         iM8XfWcgjjBFN39zW0T56i8HiyLFS6pJ5jydM2DAo4GtII+JxF4QtTF2zHTw8av4n6nX
         nK8QumViCqcYFmIt+JB6Rz93U3gS+GD92LneRy0fHkM27WiIaiZIn44KS5PuJs7yEn96
         tEjT/akHeRnfIAmJJNsmBUQJFi/VqmygSh99gsW9IoPdvkHbHyCOe04EwUc4FIIPt1ZU
         mSQbvtw7tvEAI5HkJouypJFkXfyOCftMC7Pf3smtDEZCjU1eADfbiugsk0O4ekWAof/a
         0ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950340; x=1795555140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6T+2m0dmOKP5vkDIbMYrm0qs8uTzh+5F0gq417om3g0=;
        b=1BoGCV1RU69KapCEatR5aOkiJ67cYJ37ZRsl8KX4Qlicj16utF2jw6AH00VAE7VLA8
         47+sudX4MGWW8N0zoQqmZi94xrBa7GvzmUqZdCTgOwjIqudQ4rWP66PbRPEoTdDCNatJ
         ukVuaJcu0LP+F3iKA299S0CffL6Sqkuww4u87U5imcMLb26xADOFqvJbExqln24j2W8o
         pa1pHrfbTYNvagbVGAA9M1zF3So0PH+h35SSebb8ierMHtu38Gx2cAMl7dyuCdGa8EDM
         HbZYxTT6PcRq7RahyTgCR9wk1z3WCF11mpQLma8R3mEhOt/KkZ/8CeVpytzooL7zbWYy
         Q2rQ==
X-Gm-Message-State: APuU4Z858ab4r2lg6iQkzMtJlSwESnIw1xW+jQTlxdefcUv2u5qClksP
	ka9jmjSK9ReM3kR6TxGO+x2RKFXwYUc1QN7HhHDXap2TcuhROO1ZfV58qRcTXs0SBgb78g==
X-Gm-Gg: AYBFou0d72dyNCUfsDtN/JniFB4LEiFiiNFSkO1zol8IzxfKhYZZ++EDDdjTHJEXWm4
	Ayo9XYsijNW+AaaKv2BMhPDapKp4lo6rLWaEvQjCie8ETmhkSVkNDiDzZH2a8F7CpxGxx4HPORe
	tmR2SSSC8QiPLvu8WTk+UJyPc45UxsHz8cXfZpAMoBXND1zah7TBs5OKA+qjOEDcppEbqeV2xTB
	j6dheSYCwFT2BR9HD+yQFAgRjxq4+zeOOdok0jJctk2kAyzOXwabOXl7lGH6nbzGMEonwgLdEgU
	/2YqZoVamLhuPhklDIzGrUTChiov5d5ADK556PBTEaYMgYU06lBhgeKbw5L9VoXaQkmZU+MZR3w
	kkdJdecUv9xlJCHTIXa6CCcuziHIRS707NPcQhu21siF//7/G57xSHGfM02oyyQ0X4kZ+xNqw8T
	mM1PidasSQpmALfplwETu5WNk9IICvqbotgG0rVtofyl4Am212lA0c0eKmFggqANLVp/h27jTEP
	NqmgBMBR+ZJCzXwYJwKgprzkDWqSFlRJ4G65PM52O7v12FM10r7PZqA99nyzAxo+a7njCO/3Rxa
	z8Lf4kbIWtMhz2lSjI/RL3Sq8KlRnJN5sSJUT/KnGaQk6gQHuLcMNJC4VsoITDIdFe3wpzFT8Nt
	NKEjz3D1VT2q65PJ30A==
X-Received: by 2002:a05:6512:3411:b0:5bf:a01e:8fa0 with SMTP id 2adb3069b0e04-5c1a9f1fc17mr137644e87.57.1794950340027;
        Tue, 17 Nov 2026 13:19:00 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:18:59 -0800 (PST)
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
Subject: [PATCH net-next v7 4/8] ip_gre: add drop reasons to the RX path
Date: Wed, 18 Nov 2026 00:18:49 +0300
Message-ID: <20261117211853.3733250-5-littlesmilingcloud@gmail.com>
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

An IPv4 GRE packet that matches no tunnel is reported at the same
drop site as a truncated header. Report TUNNEL_NOT_FOUND for a lookup
miss and preserve the ETH_P_TEB fallback lookup only for that result.

Have the receive handlers return a drop reason when the caller must
free the skb, and zero when they have consumed it. Propagate header
pull failures, use NOMEM for metadata allocation failures, and report
an unsupported ERSPAN version as TUNNEL_INVALID_HDR.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
v7: Report TUNNEL_INVALID_HDR for the new ERSPAN version check.
Omit Ido's Reviewed-by pending review of this change.

 include/net/dropreason-core.h |  3 +-
 net/ipv4/ip_gre.c             | 83 +++++++++++++++++++----------------
 2 files changed, 48 insertions(+), 38 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 922862f9ad88..83a17e36fed5 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -549,7 +549,8 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_TUNNEL_INVALID_HDR,
 	/**
 	 * @SKB_DROP_REASON_TUNNEL_NOT_FOUND: no tunnel device found for the
-	 * packet, e.g. no VXLAN device for its VNI
+	 * packet, e.g. no VXLAN device for its VNI or no GRE tunnel for its
+	 * endpoints and key
 	 */
 	SKB_DROP_REASON_TUNNEL_NOT_FOUND,
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index be880f69c06c..7ad68392ecda 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -264,9 +264,11 @@ static bool is_erspan_type1(const struct tnl_ptk_info *tpi, int gre_hdr_len)
 	return tpi->proto == htons(ETH_P_ERSPAN) && gre_hdr_len == 4;
 }
 
-static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
-		      int gre_hdr_len)
+static enum skb_drop_reason erspan_rcv(struct sk_buff *skb,
+				       struct tnl_ptk_info *tpi,
+				       int gre_hdr_len)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct net *net = dev_net(skb->dev);
 	struct metadata_dst *tun_dst = NULL;
 	struct erspan_base_hdr *ershdr;
@@ -288,9 +290,10 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		tunnel = ip_tunnel_lookup(itn, skb->dev->ifindex, flags,
 					  iph->saddr, iph->daddr, 0);
 	} else {
-		if (unlikely(!pskb_may_pull(skb,
-					    gre_hdr_len + sizeof(*ershdr))))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb,
+					      gre_hdr_len + sizeof(*ershdr));
+		if (unlikely(reason))
+			return reason;
 
 		ershdr = (struct erspan_base_hdr *)(skb->data + gre_hdr_len);
 		ver = ershdr->ver;
@@ -306,15 +309,15 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		else if (ver == ERSPAN_VERSION || ver == ERSPAN_VERSION2)
 			len = gre_hdr_len + erspan_hdr_len(ver);
 		else
-			return PACKET_REJECT;
+			return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
-		if (unlikely(!pskb_may_pull(skb, len)))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb, len);
+		if (unlikely(reason))
+			return reason;
 
-		if (__iptunnel_pull_header(skb,
-					   len,
-					   htons(ETH_P_TEB),
-					   false, false))
+		reason = __iptunnel_pull_header(skb, len, htons(ETH_P_TEB),
+						false, false);
+		if (reason)
 			goto drop;
 
 		if (tunnel->collect_md) {
@@ -330,7 +333,7 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 			tun_dst = ip_tun_rx_dst(skb, flags,
 						tun_id, sizeof(*md));
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -356,18 +359,21 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 
 		skb_reset_mac_header(skb);
 		ip_tunnel_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 
 drop:
-	kfree_skb(skb);
-	return PACKET_RCVD;
+	kfree_skb_reason(skb, reason);
+	return SKB_NOT_DROPPED_YET;
 }
 
-static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
-		       struct ip_tunnel_net *itn, int hdr_len, bool raw_proto)
+static enum skb_drop_reason __ipgre_rcv(struct sk_buff *skb,
+					const struct tnl_ptk_info *tpi,
+					struct ip_tunnel_net *itn,
+					int hdr_len, bool raw_proto)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct metadata_dst *tun_dst = NULL;
 	const struct iphdr *iph;
 	struct ip_tunnel *tunnel;
@@ -379,8 +385,9 @@ static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 	if (tunnel) {
 		const struct iphdr *tnl_params;
 
-		if (__iptunnel_pull_header(skb, hdr_len, tpi->proto,
-					   raw_proto, false))
+		reason = __iptunnel_pull_header(skb, hdr_len, tpi->proto,
+						raw_proto, false);
+		if (reason)
 			goto drop;
 
 		/* Special case for ipgre_header_parse(), which expects the
@@ -403,40 +410,42 @@ static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 			tun_id = key32_to_tunnel_id(tpi->key);
 			tun_dst = ip_tun_rx_dst(skb, flags, tun_id, 0);
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 		}
 
 		ip_tunnel_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
-	return PACKET_NEXT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 
 drop:
-	kfree_skb(skb);
-	return PACKET_RCVD;
+	kfree_skb_reason(skb, reason);
+	return SKB_NOT_DROPPED_YET;
 }
 
-static int ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
-		     int hdr_len)
+static enum skb_drop_reason ipgre_rcv(struct sk_buff *skb,
+				      const struct tnl_ptk_info *tpi,
+				      int hdr_len)
 {
 	struct net *net = dev_net(skb->dev);
+	enum skb_drop_reason reason;
 	struct ip_tunnel_net *itn;
-	int res;
 
 	if (tpi->proto == htons(ETH_P_TEB))
 		itn = net_generic(net, gre_tap_net_id);
 	else
 		itn = net_generic(net, ipgre_net_id);
 
-	res = __ipgre_rcv(skb, tpi, itn, hdr_len, false);
-	if (res == PACKET_NEXT && tpi->proto == htons(ETH_P_TEB)) {
+	reason = __ipgre_rcv(skb, tpi, itn, hdr_len, false);
+	if (reason == SKB_DROP_REASON_TUNNEL_NOT_FOUND &&
+	    tpi->proto == htons(ETH_P_TEB)) {
 		/* ipgre tunnels in collect metadata mode should receive
 		 * also ETH_P_TEB traffic.
 		 */
 		itn = net_generic(net, ipgre_net_id);
-		res = __ipgre_rcv(skb, tpi, itn, hdr_len, true);
+		reason = __ipgre_rcv(skb, tpi, itn, hdr_len, true);
 	}
-	return res;
+	return reason;
 }
 
 static int gre_rcv(struct sk_buff *skb)
@@ -458,16 +467,16 @@ static int gre_rcv(struct sk_buff *skb)
 	if (reason)
 		goto drop;
 
-	reason = SKB_DROP_REASON_NOT_SPECIFIED;
-
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+		reason = erspan_rcv(skb, &tpi, tpi.hdr_len);
+		if (!reason)
 			return 0;
 		goto out;
 	}
 
-	if (ipgre_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+	reason = ipgre_rcv(skb, &tpi, tpi.hdr_len);
+	if (!reason)
 		return 0;
 
 out:
-- 
2.47.3


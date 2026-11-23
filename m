Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430541;
	b=jpNAyHO3RLxiVNtLFBMTJ8+ffbJ4OZEB1rtYVgl8rKlD8oObgvKhD9oxyNHha+HEmq4W
	 u0hzUiTBRwLWs1mSESYpubLfyuqkBC0dm5CPrYVWoYrnRy1QDVdreQydH/FfxfsOZ/Y+j
	 OGL6FOGXUrRqstevEBoyOW5/wTTX6VmdDTMYKaTnyamJY+4rGvIAdffKXS2EsPDbF6aGe
	 RJSIRLIR1WkAQB6IbvXM0SmQb7cEotUAUJIY4J/Ie4o/+lCy5UXXHqrKrXGdH6cyaNoRz
	 3XjiRXnpzvjQ8vgXbuKAB2dLRHsfgKXe4Blj0/c4BQHj2IIzeeIwkUyp9EcDIwR9XjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sDMuKm3fBSv4wGBvcE55z+UmrkIUm4ia2K9L8L5W15Y=;
	b=kBAYYdc11IU3FjozmP17fuj1wuDVhC9L14rUeYqTY2yq/1XWHT/4SEfTYHvaj8jygqJ1
	 HHQPcxWfNw/TL3ARtFH5GFlCPcK/SvUwOrshgiEy6NiJikeeAIQQTI47TpozLQpO6shJ3
	 DgjpMCUgLJBS+1MfPaqemjIMb5ozh9CLuh9Qg52eBY3XLQ5athauDWBOnhDOCQGmfZPDi
	 WYDpbUStvQYXd1R/IbM2GVLFtUGo2N1L6MshCN+T1YZJCjrD4QVxdeCIJ+FagAd7CJs98
	 qnO5IbMGgqqCuLo4NaPpx9h6Irm6ME248yaDb5omArlCP5gq4/feJ3775HOVFNaF31w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN1bT4sX;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591B560A2609
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591B560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RN1bT4sX
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso2017155e87.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430539; x=1796035339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sDMuKm3fBSv4wGBvcE55z+UmrkIUm4ia2K9L8L5W15Y=;
        b=RN1bT4sXFk9ZbpXfmOBtsKcJHkruaQoeeBsBeb1GXvSalc1k0kYBDL889WRWXKHep1
         9dq23M7r8R6Z9oKbLvOmlntVfiFhDUKhdJAW93aY7ZjBF7C1Y/m7hSpTLfLQMunTy2iI
         gjliQo4Mecr955jbTtgXBXwDMfa0zTNmDlsQa7c7UvugqyY9PyHjf2ZmpDVwldi2BNoK
         XZzwtVGMPfqrR9cPQYv3VF/4O1ttvEUPQZgr9zd4T+s68qqVWOd/hRL9ohUfuOygBC2s
         JOYtHDQEYAukwvVjfo++74IVDnrC9yP4NU7deI8zzkIrn1XSL41///KBlY4uWnv4VZ0v
         nEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430539; x=1796035339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDMuKm3fBSv4wGBvcE55z+UmrkIUm4ia2K9L8L5W15Y=;
        b=IS6pARPGCLhG0yX1iTojvte4Rk+Lkj3boUVUPn2sbDOVMtIJ2OPH3lue+iQER5tXAh
         bxkKFMHsfqDkIMadRaB2KsiyNl173bMRlS3xdiE/ghQBI3tfqx0//uW1Xd2udCxfF0Ng
         9GL+cQNgiIbiUFczXT5N+sk/yf5vaj6z8BPW8Jpqgfck21+3QJZTMquxAurJxC7oVA75
         yqnvm7kIfZf/kVoAAKMJidZ4NUPaHqnnCIUobD2O61M5GOjMcXBlWfRDL2QLMd77Ky/7
         vm8YkBGLDs3gOACWkTv8odlLOTqH1acP+WIp6mBrpB/Cs3LnL2RWhg4M11w+ZL+l6Eds
         RtvA==
X-Gm-Message-State: APuU4Z8bVKamkMgQ0gQhm7FvORRblmQoywsPfXUMga4AFP6yAGxr/c43
	2FsO/8wTXtZ5Nj5k6/q4lG7r5tAXUEuq7+nau2oyc94hmomYuHzYMbRoGl0SsBjAeHjicA==
X-Gm-Gg: AZFdTZfDex0Y7MfM6jNz8NoyZhaECDXaZPMkC59TByvcBqcdDYKY1DVw+Hg2qDNjAPH
	siALZklxNo9iqhM33MxZdyP/ADsViotCRlxhf0pvxaC8ZjGs+eh4csA0toXmXCNKuVij4Oz/O/D
	Osv84RX2ha+ZdXyNZCWqjuZUHyIt0/d2lutYVkmE7a+M7ZTJteoKbkjtjUgmFaP6XjwitPtUVEe
	h95OD7WGvopEpQGlmFDcLcBM6f7jN73ErdPMiPom5WQ6+CXf3nZTjbZnP/laC/4iipS7DZF1gxW
	lqJctqnsGt4p2K/UX877UXiySEJF3uGQytoOP9VfsOXuCve61O2xlcKswpqK4b5qvWzhFlxyWed
	HuWZF9v7s5y+IfGK0Vfe7TUPNCqUIobbMH8BUGL2V8tvNKesH+NrVsX1RkGCMHoJOz0s1sPjkc/
	xPCSGjnXiONVAuQKD53jyonqXiekPrxB3kQy8WGLIVDMboyxZf6nZDhaUcCpcDiTcg8Rgd9HQ8c
	oeyda41olDLIQnR76Oa05gueJPzvpHGeMyrdRpWK0KwkwCoQvTO+5TJ2AaVLHHhnlOK4ok7Kftn
	acRWJT1mR/xvCPAiachHd+XvOxAd0Mk+yxHnQ7TBUqoRk/1jJykev/FuRo6rT9qn0Ib2gUcj44w
	I4Z1HRPrdl7+p09MBLVc=
X-Received: by 2002:a05:6512:3a8b:b0:5ba:4408:77fc with SMTP id 2adb3069b0e04-5c1bc89cc28mr2982796e87.64.1795430539315;
        Mon, 23 Nov 2026 02:42:19 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:18 -0800 (PST)
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
Subject: [PATCH net-next v8 4/8] ip_gre: add drop reasons to the RX path
Date: Mon, 23 Nov 2026 13:42:06 +0300
Message-ID: <20261123104210.199916-5-littlesmilingcloud@gmail.com>
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
index a41980085af0..7150f357c1c6 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -551,7 +551,8 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_TUNNEL_INVALID_HDR,
 	/**
 	 * @SKB_DROP_REASON_TUNNEL_NOT_FOUND: no tunnel device found for the
-	 * packet, e.g. no VXLAN device for its VNI
+	 * packet, e.g. no VXLAN device for its VNI or no GRE tunnel for its
+	 * endpoints and key
 	 */
 	SKB_DROP_REASON_TUNNEL_NOT_FOUND,
 	/**
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


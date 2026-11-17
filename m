Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950343;
	b=das30MGEORELuY2arFrFABpRFjLt1ONsEEP8771W+Mc8xC0Xd1gSzZjYnu5Fy90XZN6J
	 YCf0lZ76gYZm/AWK2yTY9qzSqrY/BCXV9nTCD2c8q0UyZEmh3DXdm7bbTUk5+sWBgbHTP
	 v0AYtlW+O0czTxvJFK3xXb65pLxdnzVsRJ71jymsou/3y2ZIVU66D09Y5SFberIy70ZZu
	 ++3vEcx3tPflZRcBfOgUaGzIGqBNR14TvQfJwAmc/X4HOXKOFjPXnMSh2cvUMSdyosZKb
	 XCPzPItUsnj46c7x2zi27w4p26AZv5KsR+gW9kS3UfoYzdaiD9UgHY4lQWiBWpSql4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
	b=FCfsvSF6OlD/4MFLipXNmVNffiumR/+cSfESO4EWLKlgsc0Y1qI6ID2//JVAJXNgPi79
	 lWqS0Ro20SG+RNI0iyAolfvpHbzfG5jxdzi9Fc7V11sjwESIks6vgON1Kl6aeqAyFj7Oo
	 x48paEJ5rujtm1hEkJqroMrd6D44uvUsWm4oIH4dO2wUS3sDH5RH70LJZkaNs4DuDi9KP
	 0KDQwRyS0smMuOy+ruqq7AfPdFnCr+yAIX3gzJhIcqQMlW8ovsKbq8dE8RoQ+pi8fK+WX
	 DE7rmJBZNGC6hQ+TQ1TWK4sv+XQuco2gqzCfAB51f5ShDYsjlgMvpv4n50tUsg3uBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a68WpQw6;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B671606A334
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B671606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a68WpQw6
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso272804e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950341; x=1795555141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=a68WpQw6NPs0VzisZgA6hwnYbabkEKkbfekZC4Ie505iQjA/dzdW5InR5J9kIZS2Zw
         tNxBO4S53WEcPOxztE6jIh/+jjXSSKUHhDO7p0XQE2glH1M/HcTR50InCaXInVko6Ah7
         zBvLpBNtgG2Lq0kjSyIguRO60gDCkiIEqagpjWLnppIvyAFnUDr0LWcblssmO0Fckf6m
         k6Tip9NzfC9LW6zs48LqDq1HNvVgA3mfMdAzCTo/L3JH0ZGRdXBAhsCZ2yjPuPhfQFst
         9FUdMmG3UgMPG6tqscqwDAd+Q3McJgAJDt5RcZjXqiUknFtZ6mn+X3P0HSCM0b0ttllA
         RUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950341; x=1795555141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=Y3DwoApaidGXtsOALtjg2TqejTDpdX1Y0ny93+x+N7QaNjFe/4s5wYJTXwdT/xeP0e
         E76IjF10DaRa4lRamujjx2fkvvrW2QGI5qRgsHiCJmP9kEa8qlREMQlVvhwtmwb+rmWe
         SEpgESfcGJTLtlVLAxMpcUk9QSbKNyHvX5cU9qzRbz2CWa4/NhPhrC2QV2d8g4goLC7E
         VKFHVjXs3Xbsfq3QIL/rLgPNlnsCdrlS/AHnwt9Q977rcZAJnUNEGEuXHS6XjU/7+QbK
         N25pz3t5ZqXp0+4kqIpD++WSgoMei8QkiY5EvVNfy6Few1I/5/X4Hng3x7R764lI7JCT
         FMug==
X-Gm-Message-State: APuU4Z+jqOg0K5KY/H8ixx90VvuU5D8dgElGX09pFaWcRyS44BFPcLn9
	JyFKHZUDDTx5FYaDGk9LHpsTc316E4of0cnFi400zc/A0PZPySx7OFvZTNnIPOyCzN1n2w==
X-Gm-Gg: AYBFou0A1EBzS5CoBhMDsnKExXzSC6J7Yl/DFf86VR1TSl3QUddcBEpgwwOb8HiRknN
	ehrwo8ZxJ5fzpK4v7BXpP4b8RtDfuhvb5Vt+FaquqzRWQYoBmuUWPK+ZFgWadVIohix70fLX/+k
	SWbcdQ8h+xK/V75TuFtsJsbh+Qtr36Zaj0bic0rST9PLoWthkFHMDgm9mPPtxZNR9b6JTBw9sd+
	xjXUN9XZTaV0q0m7go1NZaPGWLtJNj6vv038qUAHhVX+ZZLjsRzheOdxcSrrwEgll5ttD+GY20z
	HoXeXxOb5nkBt9dq5wKlPP+jBsFedqFmT7dibxxDJzGMFefUMpvyly+oX924pDokC+LujIOQyrN
	5mTnDSzkjwWzzV/QgEYmtv6A2hLEGwT9mVL7jXSIfkzCWjyGwNMpx0cMiAXaJn3Xu8udDonnC2G
	teyONqX1+i1QxajT7fCyF3acAirKa8zwNfAoJ9jd1CVHrCnDarGvq6kE+fNqzdrcNERhBOWOX/A
	VUIFiuX8rQ/98VgO6pUvw6jroJUmaquJW9ZIju6geHgb5wljnyW/YVe4/WU/Lw40r//p93tzA70
	pxKDa8w2jzhLzi/nfJa/PT6GuZbx7qRhgBzm1LP5P6+N12fg5EGQyz7Ju9rzL9h2E6VfVyEAVcl
	RhvMLnc/fCFbgiSGPp4KswA/wmdzQuejFNO5+1AQ=
X-Received: by 2002:a05:6512:124d:b0:5c0:bd3:d7da with SMTP id 2adb3069b0e04-5c1aa0662e5mr132585e87.27.1794950341179;
        Tue, 17 Nov 2026 13:19:01 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:19:00 -0800 (PST)
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
Subject: [PATCH net-next v7 5/8] ip6_gre: add drop reasons to the RX path
Date: Wed, 18 Nov 2026 00:18:50 +0300
Message-ID: <20261117211853.3733250-6-littlesmilingcloud@gmail.com>
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

Have the IPv6 GRE and ERSPAN receive handlers return the reason for
rejecting an skb. Report TUNNEL_NOT_FOUND for a lookup miss and NOMEM
for a metadata allocation failure. Use TUNNEL_INVALID_HDR for an
unsupported ERSPAN version or ERSPAN type I over IPv6.

Preserve the reason from header pulls. IPv6 GRE pulls the inner header
before tunnel lookup, so a truncated ETH_P_TEB header is reported even
if no tunnel would match.

Remove the now unused PACKET_* return codes. In particular, a leftover
PACKET_REJECT would compile as a drop reason with the value of
SKB_CONSUMED.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
v7: Report TUNNEL_INVALID_HDR for the new ERSPAN version and type I checks.
Omit Ido's Reviewed-by pending review of this change.

 include/net/ip_tunnels.h |  4 ---
 net/ipv6/ip6_gre.c       | 55 ++++++++++++++++++++++------------------
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 5cccf4c0e691..792690ae4f26 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -207,10 +207,6 @@ struct tnl_ptk_info {
 	int hdr_len;
 };
 
-#define PACKET_RCVD	0
-#define PACKET_REJECT	1
-#define PACKET_NEXT	2
-
 #define IP_TNL_HASH_BITS   7
 #define IP_TNL_HASH_SIZE   (1 << IP_TNL_HASH_BITS)
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index d91161e7ed78..579df41fa5b4 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -451,7 +451,8 @@ static int ip6gre_err(struct sk_buff *skb, struct inet6_skb_parm *opt,
 	return 0;
 }
 
-static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
+static enum skb_drop_reason ip6gre_rcv(struct sk_buff *skb,
+				       const struct tnl_ptk_info *tpi)
 {
 	const struct ipv6hdr *ipv6h;
 	struct ip6_tnl *tunnel;
@@ -471,25 +472,26 @@ static int ip6gre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi)
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id, 0);
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			ip6_tnl_rcv(tunnel, skb, tpi, tun_dst, log_ecn_error);
 		} else {
 			ip6_tnl_rcv(tunnel, skb, tpi, NULL, log_ecn_error);
 		}
 
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
 
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 }
 
-static int ip6erspan_rcv(struct sk_buff *skb,
-			 struct tnl_ptk_info *tpi,
-			 int gre_hdr_len)
+static enum skb_drop_reason ip6erspan_rcv(struct sk_buff *skb,
+					  struct tnl_ptk_info *tpi,
+					  int gre_hdr_len)
 {
 	struct erspan_base_hdr *ershdr;
 	const struct ipv6hdr *ipv6h;
+	enum skb_drop_reason reason;
 	struct erspan_md2 *md2;
 	struct ip6_tnl *tunnel;
 	u8 ver;
@@ -498,10 +500,11 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 	 * IPv6, and such a packet carries no ERSPAN header to look at.
 	 */
 	if (unlikely(tpi->proto == htons(ETH_P_ERSPAN) && gre_hdr_len == 4))
-		return PACKET_REJECT;
+		return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
-	if (unlikely(!pskb_may_pull(skb, sizeof(*ershdr))))
-		return PACKET_REJECT;
+	reason = pskb_may_pull_reason(skb, sizeof(*ershdr));
+	if (unlikely(reason))
+		return reason;
 
 	ipv6h = ipv6_hdr(skb);
 	ershdr = (struct erspan_base_hdr *)skb->data;
@@ -514,15 +517,16 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 		int len = erspan_hdr_len(ver);
 
 		if (unlikely(ver != ERSPAN_VERSION && ver != ERSPAN_VERSION2))
-			return PACKET_REJECT;
+			return SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 
-		if (unlikely(!pskb_may_pull(skb, len)))
-			return PACKET_REJECT;
+		reason = pskb_may_pull_reason(skb, len);
+		if (unlikely(reason))
+			return reason;
 
-		if (__iptunnel_pull_header(skb, len,
-					   htons(ETH_P_TEB),
-					   false, false))
-			return PACKET_REJECT;
+		reason = __iptunnel_pull_header(skb, len, htons(ETH_P_TEB),
+						false, false);
+		if (reason)
+			return reason;
 
 		if (tunnel->parms.collect_md) {
 			struct erspan_metadata *pkt_md, *md;
@@ -539,7 +543,7 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 			tun_dst = ipv6_tun_rx_dst(skb, flags, tun_id,
 						  sizeof(*md));
 			if (!tun_dst)
-				return PACKET_REJECT;
+				return SKB_DROP_REASON_NOMEM;
 
 			/* MUST set options_len before referencing options */
 			info = &tun_dst->u.tun_info;
@@ -567,10 +571,10 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 			ip6_tnl_rcv(tunnel, skb, tpi, NULL, log_ecn_error);
 		}
 
-		return PACKET_RCVD;
+		return SKB_NOT_DROPPED_YET;
 	}
 
-	return PACKET_REJECT;
+	return SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 }
 
 static int gre_rcv(struct sk_buff *skb)
@@ -582,19 +586,20 @@ static int gre_rcv(struct sk_buff *skb)
 	if (reason)
 		goto drop;
 
-	reason = SKB_DROP_REASON_NOT_SPECIFIED;
-
-	if (iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false))
+	reason = iptunnel_pull_header(skb, tpi.hdr_len, tpi.proto, false);
+	if (reason)
 		goto drop;
 
 	if (unlikely(tpi.proto == htons(ETH_P_ERSPAN) ||
 		     tpi.proto == htons(ETH_P_ERSPAN2))) {
-		if (ip6erspan_rcv(skb, &tpi, tpi.hdr_len) == PACKET_RCVD)
+		reason = ip6erspan_rcv(skb, &tpi, tpi.hdr_len);
+		if (!reason)
 			return 0;
 		goto out;
 	}
 
-	if (ip6gre_rcv(skb, &tpi) == PACKET_RCVD)
+	reason = ip6gre_rcv(skb, &tpi);
+	if (!reason)
 		return 0;
 
 out:
-- 
2.47.3


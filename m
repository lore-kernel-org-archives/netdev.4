Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430543;
	b=rBLGs+DOjjfas10/8sl2kgiGW0d03a4oaLq/lD0OavQQWnXIu1uJ12g1NAOIPBpgW93f
	 jc+9rqU/4vAgGZ233XfnKw9rpAG0qhQ+rqUUSOFvfsfWlw+Z30seiEGfZLRPlH8I82O7s
	 2eUC3sf3CaBQKfdm+ckq8o4wbpdytEmjWu2B1rANrG6k9LY5rYyLrNULx2A6L2x/6hKgL
	 bLztYvWmFioXQpvZRtLemViz+BnzdTKbHtM5UgTunKKVXY5Twsvpu8efveA8lyPSzIjaK
	 RULnqjCEqX3R/UQuECsDxK7cVqMc7WRYgaCx25CXW4qiSy8koqNM0kd3b6RC5mHKnLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
	b=2xYc87Y+s8NjOyTm/fIX5C+eVY1NJVr50htp+mwjOsmlsufGWYe7IwVIKP3uLQ3dGBRv
	 tNipteLvTknOCikakcGZ3jhYdfnibr8brOOH8qwfBay5abr40oS600C3+i/7OXMq/9+o/
	 xBg15JoT2YLhIOYEDwMNwbWcPqbZBYfi3E93UhLleEpmue0yUYMDRmuFLa76kW6NjHjHr
	 yuxueiLzUqoABQpoAQkYCsxbuYRdOOAKoBGWOEyAZ4zUQ3gZZq9EufkrHdW8jHoMbd6cM
	 cEXfMA8CkcfY1pAii6S5RnAZhP8Shig4eT6XF54vBbsFcB5jLNc4AcPscdQM1AqrjcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xApP/Kwu";
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D960A261A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3D960A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xApP/Kwu
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14f3dab09so1434369e87.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430541; x=1796035341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=xApP/KwuuhynMahw00bFWESMO1DwXSsh68+mU7XcyalUzn2jD0WxQJ6I+tvGgBXp8w
         A0qze2/z48m/kJFpK/I7vLcYjMV+ggOx12s7eRuw/hM1Hz6Kn+BFTLkwkNd7hCm8G45R
         5Iv/tP65qQHFfJH21ZHrZ6L7l/DboUAgRctWv/I1sqwpYakJkDG3rIjaYxk8QfNVmDhr
         fM5EutW5EYFlTf/BWtnUXndj1RDunGA9NVy0jVFraV3hse6C0R6EWt5DXdIoGqbMrXvp
         WENWxKFwxMNOLqVc9z64i+VWN1mA3MVwsfPs2cKOUfcNSNXCkPg/U0T1oCENM5N77lAT
         /sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430541; x=1796035341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nLQBYNMUocnbmb/hG7Ffmqg4ItL7VmOCCnTkk0C8hE=;
        b=vZChb310XQeW2em5hAYCPFCEG8P8SCAleLc62mdur5zgerQeU3TW0Srys8Iev+6fBR
         uB1Ofrh7hDF138Zmt4y7YJLLi7MCgP6XJLjdWMDKLHfUubMrToKiTez5xQ0QSwsJWSeF
         /ngzyRr2OX97Xb61yWB9wu8EC//98q3EKNPy995mM33wTH2zFC4/aMBQkjAP/Ewu0Cqn
         MZqpE9uLp9U5P5NWFyO/sNPNeI4PuFo8opdLCQ795UtnLeZ3AIRWluaQyZjFx87KUVgN
         V7tNH9RsGaanegmHtcbERd6+nynv0ozOBXYaGNwg84XwowXPxGfAV6oVAb1iFSmqEUg9
         uFSQ==
X-Gm-Message-State: APuU4Z8KdylkipOtRiowShxFF6ETSCKw3YrEK2J0y5gYB4VmqZa+FKGS
	vSOlUNmJEX+DoJwUiEfQLTl0cwS6DLIpOz9lj4MV8bvexUfecqtlZ8koQiM9PGI+NmwcgQ==
X-Gm-Gg: AZFdTZclZvGdvnurzgkEIoWZp1LOO8oIpDOcDUWlYNdo7zymI0k8X45XOdGa9/n2jOQ
	vJEkGLiK5O5Ne78/Reah/2t2U5B4wl1sBshOqNIRfJuU8TN2LizLn38njjHgPzZ0XcRwUD3n75B
	4QlTJfIeEis44bMyJe5IOLy/bu2zIJsU7FfmM/YPbfYcSHe80fBFKf/M5FtRZFdLbrFgpEFoFZu
	eC7rDS0RxfqkIX/6mNb86x6mDRa2uw2bId3N8YOlfsgZnOKTNHEf0pQgfMMcmHc08m8eDYjFwYu
	o7DF2MibbHPoEoT6tx+ubs2tm5Z+CMDmYR+8jL8bhSMuPvG813/TzCcOkjPkSMp0MQkpTbNl4xE
	UPclAGDCkIxjR4aA9skn+1ZVy2zV1HMthO4D5edD07AefPAGLiMcbbMcT27Autp0OMnOTeX/Q/v
	9I5BiUYGYUMshhS/sZELQ4q6zuqNrgawpXKDe1KTd1+0RejBr+aQqg+Qp/SYsuwabUVMSm+YDkO
	6C1CsoTh8wVrdXMO3KH7Pvcq7Yz7pdLf2BHuODtXsU1MBpfoaw++MK3f2obWYrQJzRqvkIpJk/N
	HXBRzn6wL0I+kddgzGImAR2XC0CIVq44K4Ns8WVNcpQWdbHSVRB3R8w8pNf/Wf97ko75TluZk5H
	5IEIHs90EsAbIvWWkuVJT148SOXMIdtfjbAGkmM0=
X-Received: by 2002:a05:6512:32d4:b0:5bf:e246:d38e with SMTP id 2adb3069b0e04-5c1bc7db0c9mr3118227e87.36.1795430540888;
        Mon, 23 Nov 2026 02:42:20 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:20 -0800 (PST)
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
Subject: [PATCH net-next v8 5/8] ip6_gre: add drop reasons to the RX path
Date: Mon, 23 Nov 2026 13:42:07 +0300
Message-ID: <20261123104210.199916-6-littlesmilingcloud@gmail.com>
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


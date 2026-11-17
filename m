Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950346;
	b=HEN2B1JhDLI1d6QK/c80/3vGey8B2/XbEg3q2nq6IdUGZD+KCmhzbvmG4eNXqdvZJFIN
	 0tTJXAMq1ln8zwBMx/2zApBsvh82e2IqJbSF7J0XJHIB6rqdAhOK8ktscaX7flIdIePum
	 /bz3ELY7oYjHLIHJv4vY+1v4mSHMB4Q3PelmRVhQOBSAZnVq+bHANKP38Qx9mSOOLFnmU
	 dtof5u5UxJvc/Wa9z+rYvrhjAehJArshybVoB6als+0M+tqD/XD/gBAu7SsG1+17W4ay+
	 TZJpQgKAPkjVdhpi4DJzYGAHaMSLjiuoSZaFBMUR7V1Ks+DgpAdFgy3LwertJwpZzWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+81+UGbUeaaM2H46VNBCNEhFBBQ+0TieXIC4MYh2jYY=;
	b=tvh6SrSao0BOJ24Q5Xk2BXaoo51vCgbp7Bvr8NS8VE9ZwrGJLIzkOI3l2bdY2oI6rNe2
	 Yg4UOwCCVh0RvJfqA5W/d0zUFcmKsjr/CqEe2azydLiGfr0jC1u4W9F4hFVZsCzzEaBkK
	 Eahcf23nndc/lLyvCMk+tHAQADBVqOGLDiPCJkTUVbq4ioKImsXocw9Mnfyw0YBoZYp/r
	 8CGz1TGxxD/uSxp/yeYdGKRyMaQNIJlLoYO6fCCVy69/QUSk5e78x2jxIR+8whO+0+pGE
	 ywFSBfAHLCITuhOzPp5kh/u/1iEv2FeFXdTxPYtu9TfxNFDCcvjouVRckSDzs6zu2+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zqJyRq1/";
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759C606A336
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C759C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqJyRq1/
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso180926e87.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794950344; x=1795555144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+81+UGbUeaaM2H46VNBCNEhFBBQ+0TieXIC4MYh2jYY=;
        b=zqJyRq1/H1C3gWMbg83wc1wjt1QXj/rgSrZ9HtnFkBOVj5VeErgzWhG1+V2RrBeG9y
         +/CnHUTxE0wuFRwgB91DJHuimInuM0vpyF+V/syimW2vPDR0IRPp5dPyNP7QBiDDCE8a
         MQaFBhKOJkHs9/Axtz6jtAyPKXl3PSw5Qo6P4LeFScpiL2y948BVYR3FIh9B2WcmGmXb
         htHF+esx2OgMr8PD+ODZjHFppOJAEWteTS6ZSDqlSVuPC5BUcINK8MZcdEy/Bt0F2Aql
         qKR6DZKRRH9Ft0PYzT4zX9uO2bPme3RTT5pvg5OZssfzoPQLvUiqmE0FPY4R4IlS6a1K
         AO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950344; x=1795555144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+81+UGbUeaaM2H46VNBCNEhFBBQ+0TieXIC4MYh2jYY=;
        b=ayE1T0pssOD7kAvsc1R5eyPspcJP0dyuDJt92EbSFdyst/zVeLSgm0FREcVK6Ta9VB
         Oi+dA19dK9H2WprMvgm+3oJYnnpkfgIKQiX9KoMaq/FHs0lFT6SRwLJ8+gJNCzdFQZ8G
         VmOaHwRWhbgo+K/TW7mlG5U+oBuc6UFOw6tI1KiKL72yrKkEkJDKLI9D8jWDIITtXQ0O
         26Qp2N8lRRo+CnibpHRmIGBLx8gjWXEQunoh+XvGEblJDNpgo24qtdPtDk/1AL5PFpt7
         cXH/1t3JQ45eNR8ZLGKHDepmJbwioPub2c4vtw1c/g6ZtS6ylrFlZ8GuqKXqIQy2ptmS
         lezw==
X-Gm-Message-State: APuU4Z/BFEeztOrL2E0qvsWow6T8sxdRfH2zg7wUcb0bS1skgmUqQ25Q
	697rRvKH/ciSk1ARSSre04ma95NLVIWYfPwS+dTLK4vtgCENXRpcIJbVyYwtxovsxg+FsA==
X-Gm-Gg: AYBFou0EGLKwQF6n+TLEnrdXrJKcEfHi0iAYYj6w7A13S28N4ChA3cLkaSABRWsBX4X
	HdJykz7ZqiQSIpWhxz/C8onsiemR+NitvSXoXoYHr5GBZ4CCcRgBPuY+sborWmxv0rGA2KaR4Lz
	wfJK+Q8rVR9fboOoTDmNmMTSUBSNRfdqWZOHiwvNlukc6jlCiGmcw0dezWy6AC9aJSont3Gee7G
	uhXMZpfD2A/KppJ6oa4Iu2xcZw88SAp2KB1CCc0SM+gxBzXn0maT5PHAD8tQ7gl3KgrGque51r0
	ad7w/zvEsVDreQDbBU+7WDy3L2+E/Tn7UjhEVCMdTEbPD5fORGYL5x/ZPU2CAXnaOHJfjh+DNz+
	ipOf4HlBuSuXuSSiyyAQEJYUVqTtdymo5clbSBvPxFc67nYBslRPf+ri3S3tQW/tTalAY3OylWI
	p/FKpn7XtSaBPU1cNJKaFpfmo68Kq4qlZ56JBJzuu0I8VJHtd1rYHtm8etYBynIn0j0kHGlGGSL
	B4jPro0Pqy+nVoxN0j0ciF9E+i19BqtYYZUEy91gx35qyBDtqUr638JcJAA6dzjAB3nIVQWT9T4
	f9bm1mIPckxN233mG84uYzg6adTexeandNOiFl24dIaTwdBjUJQNXE5wbQwboNohPVvnp74Hktf
	PnQPoHGCsyETRU+UK+A==
X-Received: by 2002:a05:6512:3e1e:b0:5bf:d959:6ee9 with SMTP id 2adb3069b0e04-5c1a9c0a65dmr122956e87.35.1794950343739;
        Tue, 17 Nov 2026 13:19:03 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.239.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76037bsm66124e87.15.2026.11.17.13.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:19:03 -0800 (PST)
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
Subject: [PATCH net-next v7 7/8] ip_tunnel: add drop reasons to the transmit path
Date: Wed, 18 Nov 2026 00:18:52 +0300
Message-ID: <20261117211853.3733250-8-littlesmilingcloud@gmail.com>
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

ip_tunnel_xmit() and ip_md_tunnel_xmit() free packets from unrelated
failures at a common drop site in each function. In particular, a PMTU
drop after sending an ICMP error and a failed encapsulation both
increment tx_errors. Report PKT_TOO_BIG for the former and propagate
the reason from ip_tunnel_encap() for the latter.

Use IP_OUTNOROUTES for a failed route lookup, RECURSION_LIMIT for a
route back to the tunnel device and NOMEM for headroom allocation.
Distinguish an NBMA neighbour lookup failure from a missing transmit
target, and report TUNNEL_TXINFO for invalid external-mode metadata.

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv4/ip_tunnel.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index f3c5d8424925..924d02d0cc7b 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -586,6 +586,7 @@ static int tnl_update_pmtu(struct net_device *dev, struct sk_buff *skb,
 void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		       u8 proto, int tunnel_hlen)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	u32 headroom = sizeof(struct iphdr);
 	struct ip_tunnel_info *tun_info;
@@ -599,8 +600,10 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	tun_info = skb_tunnel_info(skb);
 	if (unlikely(!tun_info || !(tun_info->mode & IP_TUNNEL_INFO_TX) ||
-		     ip_tunnel_info_af(tun_info) != AF_INET))
+		     ip_tunnel_info_af(tun_info) != AF_INET)) {
+		reason = SKB_DROP_REASON_TUNNEL_TXINFO;
 		goto tx_error;
+	}
 	key = &tun_info->key;
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
@@ -619,7 +622,8 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (!tunnel_hlen)
 		tunnel_hlen = ip_encap_hlen(&tun_info->encap);
 
-	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4))
+	reason = ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4);
+	if (reason)
 		goto tx_error;
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -629,6 +633,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -638,6 +643,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -646,6 +652,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -663,6 +670,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -677,13 +685,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 tx_dropped:
 	DEV_STATS_INC(dev, tx_dropped);
 kfree:
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_md_tunnel_xmit);
 
 void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		    const struct iphdr *tnl_params, u8 protocol)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 	struct ip_tunnel_info *tun_info = NULL;
 	const struct iphdr *inner_iph;
@@ -711,6 +720,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (!skb_dst(skb)) {
 			DEV_STATS_INC(dev, tx_fifo_errors);
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
 		}
 
@@ -724,9 +734,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		} else if (payload_protocol == htons(ETH_P_IP)) {
 			rt = skb_rtable(skb);
 			dst = rt_nexthop(rt, inner_iph->daddr);
-		}
 #if IS_ENABLED(CONFIG_IPV6)
-		else if (payload_protocol == htons(ETH_P_IPV6)) {
+		} else if (payload_protocol == htons(ETH_P_IPV6)) {
 			const struct in6_addr *addr6;
 			struct neighbour *neigh;
 			bool do_tx_error_icmp;
@@ -734,8 +743,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -752,12 +763,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 				dst = addr6->s6_addr32[3];
 			}
 			neigh_release(neigh);
-			if (do_tx_error_icmp)
+			if (do_tx_error_icmp) {
+				reason = SKB_DROP_REASON_NO_TX_TARGET;
 				goto tx_error_icmp;
-		}
+			}
 #endif
-		else
+		} else {
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
+		}
 
 		if (!md)
 			connected = false;
@@ -780,7 +794,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
+	reason = ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4);
+	if (reason)
 		goto tx_error;
 
 	if (connected && md) {
@@ -798,6 +813,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -811,6 +827,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -820,6 +837,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -854,7 +872,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -870,7 +888,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3


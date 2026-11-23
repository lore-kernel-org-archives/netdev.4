Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430546;
	b=4rx5Jo4jrFVI2BXUJPdy0kJZ9fSt060uk5Mf+qlBeuoacUv43Ll2KtWTkc/PA7JBikIV
	 BrfUwr4AYPf0aFGszW1UPB6SoQr9V68wHHtig7c/LoQr+PMXdZbTUReb3cffQc4iY/Cin
	 6HkUf5yb9gbTRku2xoe8IByODEAyZr4mepdESM5gr1JNMghmWH+hiseDovxEnMHOEq6UP
	 WIzM4PlH9T3gkf7KLx35GI1C59Pr62TNGv3HJtTFaYwE1Teaoyihf25NDWewndT/yZQev
	 w3LXwoyMZqIwYObUIrMe2JIYqGfyiy0qooj6ALPmKNRuV8K5djDb75N4s9RO47GdiDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gad8maG51xc8AbUCmKdDWoozq/MazB8gSdOzFhjzxk8=;
	b=KC0nPP74lj7BoysplR4J0wFKWlaGZl5Rj13bVcu+1S4nhsSRf6EjVCHQuc5QOhB5A6e6
	 ZDYo91NpN3laUmDu2p6vXAw3QC2eizOuRSKSkqrC9SPy1J3MC56ovjrcjolvsLmcgD/pu
	 jtWIiQGRUxoSWZZGGiJ7ZT/miaqW6aMRxRIYyqA+OZHuc9+XJ93huRR7dDtrldPtmNL2R
	 zII9YldRXYUbophekZuw9Bhbtz+mzNbYOP97YdSU93/dCCmZ1ocqe3zTnbV+9KAo356P3
	 TI7pI5Rb8g1n9ejx3mP1Pri9zAY4qGIx8fHJNHNvIQdnjIe4fb/xr3UFE+ptDaFlodQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymkCQdTW;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FED606A6AE
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FED606A6AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ymkCQdTW
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso30480181fa.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795430544; x=1796035344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gad8maG51xc8AbUCmKdDWoozq/MazB8gSdOzFhjzxk8=;
        b=ymkCQdTWKblUKs3zneEL136fZwgL0BVU141HIPhQHMYDESoNywylQm6YsWRakkpfuk
         4mwKaw1xLZ1i5kmigwPkvF+sPZ81GrEb2LlAyszT4+v3PBuehlrywmKXsba44zlOxpMg
         u+I3Js9PNwurbfDhsHMElrF0XHRTvuHKbsvLXQhsNt9vwzneNlfwhAG/icZnlyv2YjRN
         CkRrMWkZDjEUwXKCZMPdlm++2l3453FqVs1+EmdLyOtYtfJY9dp63O5XVbMHy/P8hPk3
         3rOiMKffleMr6iFQ6I5bON9DoMlGq+oic0VHJMb/DLe8wbeSvAZY/dvKKN11cBV2kaKa
         oxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430544; x=1796035344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gad8maG51xc8AbUCmKdDWoozq/MazB8gSdOzFhjzxk8=;
        b=BliK6fb31NlBbqplCgZ8QcKJKA0+T8QJfi3NLq+2KVQnnKXJq8HilM0mX0ob8FyIen
         /TIRqomBBjUnqSU2XERK/+ms32Zt+tS/TqTSzGA2Rl/cU5eYyTzVqZomRTGAf5s43msR
         82H6aQDsW2raWu0vpyz8aBKf0rJ34R5i0u+BAJerXUFykaFFSzPVuH38wp1JQG31Hkrq
         hOjOLxV0vWCrXFT9OJCdzGQ81co8D96fiRd97Lq2+MARn73q0+8Ea0uAHYsO0PI7nPey
         j4OLSMxRNYKSofBnayLH9sbDB68iqvXFVFapRaqwlKvi0DKHppKa2TxkAsKCyYj0OcW2
         kCng==
X-Gm-Message-State: APuU4Z+TjGqcQ7yragarBW4aeXXUDrhwJ3R5/hhLQyIOQyimxFyYK3uO
	qku0qUZIOkBijIQldXA15HbionZH9a5NZrPnMIi7c2PxjXILFVBDAFeZmDdW7xAF6k2V0A==
X-Gm-Gg: AZFdTZdDGmyxdYLBt5JXr0CFB2ArSvG7+C89AmO2O6NhpgQm6G3kkfxlkcCxMwG5aZP
	8HGhoOGjsBn7VaR3pQIjEUmVTmhKIx3MSvhD1fAUzzBA0ggGH7TsFFOUA+w336YanJy1WvZRhfg
	8OI3Qb442tXKud3u4YP2K+VSFWm0Z0FmHJuGOSokBNPelLe8OfecxxJogtAuVPUImyCwFFWUpdO
	B0fMbWicrydvJjjqeenQULxn4CZ0xB2HubMveXE7NR64GyLPP04LDyCAmnKBm7Jxr7nxaQxo77Q
	mL1WQiBXUoUBGhe7dRoNAiLEAu/hkc+AZfOSexIBAImTfrGqWuYGwNVc0w4BkaPC0oCqcFCQnn/
	wmREkhC7Gx4KWA0fs4V2Sdam7TANTIW//VDBzbKgXGGN/cbBrMcmXfA+B8od48yrCgPBZ4NyOLt
	6p+nnX0cZxIbZPb1hhS9Da5+p/kkdbbMNgZNzFsPo5fL9S0HcuFCCuQXVmz9tHORf9h6vKBW6wt
	1BRQzYqBsyY/OgynnzG6ZPBesaa/SRq96rOnzjz3Xhvk1iKCxEKy3tgJcyPJme8C1CfNMzIdQDz
	gvBqtqVDcsRd+i9h9SR0mIm95Bves837AO0eZqVHLHLQV/8ab3boh6bGcJPzc76jMhw5WaWWWnZ
	d1i+rYPRcmfgIr0HOLQ==
X-Received: by 2002:a05:6512:2249:b0:5c0:b73:a3d2 with SMTP id 2adb3069b0e04-5c1bc717115mr2954781e87.2.1795430543999;
        Mon, 23 Nov 2026 02:42:23 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([212.35.163.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332e3sm2859535e87.1.2026.11.23.02.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:42:23 -0800 (PST)
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
Subject: [PATCH net-next v8 7/8] ip_tunnel: add drop reasons to the transmit path
Date: Mon, 23 Nov 2026 13:42:09 +0300
Message-ID: <20261123104210.199916-8-littlesmilingcloud@gmail.com>
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
index 92e26464f2ee..c73a53df07dc 100644
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
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
@@ -630,6 +634,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		rt = ip_route_output_key(tunnel->net, &fl4);
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -639,6 +644,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -647,6 +653,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, tunnel_hlen,
 			    key->u.ipv4.dst, true)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -664,6 +671,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	headroom += LL_RESERVED_SPACE(rt->dst.dev) + rt->dst.header_len;
 	if (skb_cow_head(skb, headroom)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_NOMEM;
 		goto tx_dropped;
 	}
 
@@ -678,13 +686,14 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -712,6 +721,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (!skb_dst(skb)) {
 			DEV_STATS_INC(dev, tx_fifo_errors);
+			reason = SKB_DROP_REASON_NO_TX_TARGET;
 			goto tx_error;
 		}
 
@@ -725,9 +735,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -735,8 +744,10 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 			neigh = dst_neigh_lookup(skb_dst(skb),
 						 &ipv6_hdr(skb)->daddr);
-			if (!neigh)
+			if (!neigh) {
+				reason = SKB_DROP_REASON_NEIGH_CREATEFAIL;
 				goto tx_error;
+			}
 
 			addr6 = (const struct in6_addr *)&neigh->primary_key;
 			addr_type = ipv6_addr_type(addr6);
@@ -753,12 +764,15 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
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
@@ -783,7 +797,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 			    tunnel->net, READ_ONCE(tunnel->parms.link),
 			    tunnel->fwmark, skb_get_hash(skb), 0);
 
-	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4))
+	reason = ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4);
+	if (reason)
 		goto tx_error;
 	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
@@ -802,6 +817,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 		if (IS_ERR(rt)) {
 			DEV_STATS_INC(dev, tx_carrier_errors);
+			reason = SKB_DROP_REASON_IP_OUTNOROUTES;
 			goto tx_error;
 		}
 		if (use_cache)
@@ -815,6 +831,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (rt->dst.dev == dev) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, collisions);
+		reason = SKB_DROP_REASON_RECURSION_LIMIT;
 		goto tx_error;
 	}
 
@@ -823,6 +840,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (tnl_update_pmtu(dev, skb, rt, df, inner_iph, 0, 0, false)) {
 		ip_rt_put(rt);
+		reason = SKB_DROP_REASON_PKT_TOO_BIG;
 		goto tx_error;
 	}
 
@@ -856,7 +874,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow_head(skb, max_headroom)) {
 		ip_rt_put(rt);
 		DEV_STATS_INC(dev, tx_dropped);
-		kfree_skb(skb);
+		kfree_skb_reason(skb, SKB_DROP_REASON_NOMEM);
 		return;
 	}
 
@@ -872,7 +890,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 #endif
 tx_error:
 	DEV_STATS_INC(dev, tx_errors);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_xmit);
 
-- 
2.47.3


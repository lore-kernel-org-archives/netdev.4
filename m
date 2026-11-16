Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829156;
	b=O0OxXDQOQeCaV1Qh7hCTZWae3cY7p+QnQ4Fk8NaMYoD8eztWJ/dM7AqGkQCZj169wLde
	 wpbbWIcw0oPRs/twj67GKW7mHcXfybJwi26VWsfU+7Ixe8PLnhAKFdohnOu0lYMgFoyc1
	 ikHGUrLkK5OunjgnSGUpIFUy1fRfVAsy5QymuyncFlrDwx5XnOurm2ghZlRehGhGRvzzB
	 ezgHxH4fMtiMm2tKaCt2QhkIVHtHKvB/vBGAZopyamFhZGkrp9NkmIiRuPBywAigosW9T
	 qVuy4V89K952HhFCaz53Ve/zxEs8rDaObNdP6OPxBqAmH4Xui8nTV1bUd/9cel0DddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mtHYw5OaKDN8DoGkwZkuSkrcLIXlnB7FERN3X1s4sY0=;
	b=K8cuDFe9ICtcb2FlAqHPXxRwFgkTLYo5Mlnkwq9nQzfw5SHbbwHyW2wbs3dmiuJ4/R86
	 REz0EVFg+IGAEARVHyprqwDrtPWFlsGES7r3KopQfNfF4A0AEasptJuzUzlCDQgDo+/PV
	 GC+P3YasIIUnfh7w/M2XIQP8vcSj5vrAZfBnriS3d7xdXJ+m2T6Gbl+N+vKZUYHxFyyq1
	 vZ+9dXNSNTprm5Q47t75NrzEITFYX7FRAaoUYSIxKp4HEpzUqUYFL/XA3W04QQuLUfxIp
	 K+2R+f0j6vHoSENwCeHU1pBGJ0QA/B9vDFnb5WP1E64C43FIoZIDArTWmuu5xqSPJEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBMeUjZG;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D845606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D845606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBMeUjZG
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso3789632a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794829155; x=1795433955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtHYw5OaKDN8DoGkwZkuSkrcLIXlnB7FERN3X1s4sY0=;
        b=TBMeUjZGvITvjl8gVlJf/6V4jGaucO/H9dnGg2vTFzrYxikub0Ry7MAsLbe2Xvu1Fa
         blVaU1KwsKBhrkXLnmWb4Wrq4GbnePDa8HBU/NuGulMjA1MTwOW2OGLCYRpYl1SSSUBr
         EfzSJagEkYocV0Jdc4w5AqraEhJDQ2DMp7u3cjmhOlLRIBPKsDc6zPgoXhl4xqL60DyD
         n7uccJ18kr5hc3tqrMkD4SYboABoyudei83T0ZIb5eubJoWoa5XKXIQ+qMysdJmUNvas
         193s+kIAaj5JQEG+gqOhAsrTpuex8gkiWzI4qpE3shsls/ZDHa7Qlwg4P+MlQPynMth+
         JRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829155; x=1795433955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtHYw5OaKDN8DoGkwZkuSkrcLIXlnB7FERN3X1s4sY0=;
        b=T+l3FZdLdunih9f6ksA2h4SFOzqKrnftwMJrPzebxzpoc48loz5+gQtmizav0mAprS
         XMqJsVhM6IFVe/pEisa7Q+SGRfAQrl7r/JNskrihPuHshcqQ/Fefsdj7CRFKgmApHOpJ
         zw5VRGMut9Xgh0JfHW7nwe023hoUxnILYmYAj8w18DLdNu9YiP22TXOAUJnmbzc0mObX
         cwP1dqXg74yue52lPep1Oiz1YbFx2uOWhRkvCb1Y05oAROhtwk+QOlX4KjwGoi1+zAzv
         PCi+GtrwIFX2EI23KKWJnmzBrzhWwt1VVO88rRXOsy6ZanvFZ1TrqjOe6fqOMJJe1lfH
         wpOw==
X-Forwarded-Encrypted: i=1; AL+hErH66C/dt8CD5I9QefBbCSq9Ti/Uk3SL+Z+M80xHPpVDoXjYfMmvmNcEdCUkj5CqWVX5oJaA19w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zfeKo1JNlRq4ci1Q5+zAYIGkhtrTwGZp3Tr8C1S6FWUhJmiqG
	bV5UqC05FBjf34pDWWjZxKyDjt/gZS7+c0PFBgh8AfoecuvvMIxmRjcw
X-Gm-Gg: AYBFou3M4wl02H8hZtF9map9yc63YvOWKjexfd4vi21bdzABBL6SF8fZoybWlxbYmcr
	p1CSrBFdYpW+WOyrMljTWK15kmb0/MC261xSIclf3A74ezjG7xQTcY3MmVeztBYvDJIC8/aBPVq
	tp2JKvCpKw6L/FphT+advGJxS/TSbX9hrSaEAOBRWGAll2wrWjijLQVYz+9FS1FdPmLf2JEkH+P
	YjtQ15PiTPWduhs0IlkIv409n5vtioXhFsTNCWiTY/bVWJGFEEn6mK504PSMrx9JdyKWNvOUmjN
	zu4oK7vJU3bfLKRdLxn/R78LIil9n++NqD6E7uG1pv00+Fo1VmEMWxQSxKOmcTxU12AyalAehRD
	oxNjuup+4QRQyTQcIWM510587fAKB+1shcQhf3ogQPwU/hztMoDxKSnmehEMJbp+R6A+aGXfxI1
	ozS86qeRIIQehJ6i2Y+VtEQl6vHhAVEZpnId8Bhp+Sc9v45tHi8xxdWXqcnh4c1npv4AGyPe37y
	YXYcu7y09+z+/49keI9SYlTqgSE95wCBtORxsxWFANMjvFEnrR7J7WNxk/JyoK2EXhFdTyA0Cu6
	EtFKgWqREv50ekDBJ3BGtkJFfmTxmtLJxqx50T6J
X-Received: by 2002:a05:6402:1ed5:b0:6b7:e861:8f50 with SMTP id 4fb4d7f45d1cf-6b7e8619543mr4119301a12.37.1794829154617;
        Mon, 16 Nov 2026 03:39:14 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c235e605sm4639689a12.11.2026.11.16.03.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:39:14 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	netdev@vger.kernel.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v3] fou: reserve headroom before pushing the encap header
Date: Mon, 16 Nov 2026 14:38:45 +0300
Message-Id: <20261116113845.166280-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ip_tunnel_xmit() and ip_md_tunnel_xmit() push the encap header before
reserving headroom. A packet redirected into the tunnel (tc mirred, nft
fwd/dup) keeps the headroom of its original device, so fou_build_udp()
panics:

  kernel BUG at net/core/skbuff.c:214!
  Call Trace:
   skb_push+0xcc/0xf0
   fou_build_udp+0x2f/0x380
   gue_build_header+0xfa/0x150
   ip_tunnel_xmit+0x87f/0x21c0

With a mirred mirror, the push overwrites the original packet instead.
Reachable with CAP_NET_ADMIN in a user namespace.

Reserve the headroom in fou_build_header() and gue_build_header(); GUE
sizes and builds the header from one copy of the encap fields. The skb
head may move, so reload inner_iph after ip_tunnel_encap() and read
tnl_params, which points into the head for GRE with header_ops, before
the call. sit's ipip6_tunnel_xmit() holds no head pointer across it.

Fixes: 56328486539d ("net: Changes to ip_tunnel to support foo-over-udp encapsulation")
Fixes: ac931d4cdec3 ("ipip,ip_tunnel,sit: Add FOU support for externally controlled ipip devices")
Reported-by: Chengfeng Ye <nicoyip.dev@gmail.com>
Closes: https://lore.kernel.org/netdev/20260801060115.3538849-1-nicoyip.dev@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v3: read the GUE encap fields one by one with READ_ONCE(), as the
review of v2 asked; add Chengfeng's Reported-by.
v2: https://lore.kernel.org/netdev/20261021065517.198322-1-theodorlarionov@gmail.com/

 net/ipv4/fou_core.c  | 19 +++++++++++++++----
 net/ipv4/ip_tunnel.c |  6 ++++--
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
index 5c3c8f55d057..bff4dc488def 100644
--- a/net/ipv4/fou_core.c
+++ b/net/ipv4/fou_core.c
@@ -1071,6 +1071,9 @@ static int fou_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
 	__be16 sport;
 	int err;
 
+	if (skb_cow_head(skb, fou_encap_hlen(e)))
+		return -ENOMEM;
+
 	err = __fou_build_header(skb, e, protocol, &sport, type);
 	if (err)
 		return err;
@@ -1083,16 +1086,24 @@ static int fou_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
 static int gue_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
 			    u8 *protocol, struct flowi4 *fl4)
 {
-	int type = e->flags & TUNNEL_ENCAP_FLAG_CSUM ? SKB_GSO_UDP_TUNNEL_CSUM :
-						       SKB_GSO_UDP_TUNNEL;
+	struct ip_tunnel_encap encap = {
+		.flags = READ_ONCE(e->flags),
+		.sport = READ_ONCE(e->sport),
+		.dport = READ_ONCE(e->dport),
+	};
+	int type = encap.flags & TUNNEL_ENCAP_FLAG_CSUM ?
+		   SKB_GSO_UDP_TUNNEL_CSUM : SKB_GSO_UDP_TUNNEL;
 	__be16 sport;
 	int err;
 
-	err = __gue_build_header(skb, e, protocol, &sport, type);
+	if (skb_cow_head(skb, gue_encap_hlen(&encap)))
+		return -ENOMEM;
+
+	err = __gue_build_header(skb, &encap, protocol, &sport, type);
 	if (err)
 		return err;
 
-	fou_build_udp(skb, e, fl4, protocol, sport);
+	fou_build_udp(skb, &encap, fl4, protocol, sport);
 
 	return 0;
 }
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 0875474a578a..1052af6245df 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -610,6 +610,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
 		goto tx_error;
+	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
 	if (use_cache)
@@ -753,6 +754,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	}
 
 	tos = tnl_params->tos;
+	df = tnl_params->frag_off;
+	ttl = tnl_params->ttl;
 	if (tos & 0x1) {
 		tos &= ~0x1;
 		if (payload_protocol == htons(ETH_P_IP)) {
@@ -771,6 +774,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
 		goto tx_error;
+	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
 	if (connected && md) {
 		use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -803,7 +807,6 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		goto tx_error;
 	}
 
-	df = tnl_params->frag_off;
 	if (payload_protocol == htons(ETH_P_IP) && !tunnel->ignore_df)
 		df |= (inner_iph->frag_off & htons(IP_DF));
 
@@ -825,7 +828,6 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	}
 
 	tos = ip_tunnel_ecn_encap(tos, inner_iph, skb);
-	ttl = tnl_params->ttl;
 	if (ttl == 0) {
 		if (payload_protocol == htons(ETH_P_IP))
 			ttl = inner_iph->ttl;
-- 
2.34.1


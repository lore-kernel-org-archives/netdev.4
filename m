Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437341;
	b=2LEpd/v1pq8bm7Cjl4Ff8rJ5LsaAYTXynXhHNfCUd/g7pYkCv1FtN/ZEHZN1ryJSPcAz
	 98Z1Fr0hBKVZDiwUc6+zyT7f4dg9pXp5CgE5L3Zo2tOionbj4y287OGsK7R8iyffOooSe
	 VcvWOqhnBbqGRYu2EKC1WjjlrNHjGL/ZQ4fgsaoYzIeE0F4gY2F4g6r7HOWyTQpYTfhsh
	 m7qpJwqb31DXya1drOWjiPSCeovjetazxDD7tnf9JGLkkUvvYmZp5r/GhF7qbvTgyEdTP
	 vCtidivzcb3ISyvlq1s+vNyUoppw9N4l9wqATpCGeE4UyeCPTi6GDbMb7zChhsQ5Hdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qe/Q/ARV0u0Im9fJCrx5hjfd7NIQP7L9RyqkMc8X/yw=;
	b=ktqXUJh/9pGGvvHr6OlmtzSRKWrgnxP6Mi9/9EGKiGVAA4lE+QC7HxKvyYqXU/nxhUs6
	 shm2eh/mZ7EGYcT7NTox5IEYERT7hsmY7geNBrLEOKCyLT5ILkARRBau1QXICg2njFrUn
	 CJy9oGrRlOPqmt1s71bkstbrpWoiPUY0DMLyNgyJh0iG20z4Gu7fu2SOxTIwYzkZQxE6H
	 lmjAvM0yFqIZL1ZMPY9QArX+E2Lw5MINSGQaVNxumLgPdPRe2wgQdHbzY4FZ5Gb3Vtb9e
	 7YtU3EaHbQiufSHXHSoLTNDZi7+lfjlSmlg5cPlUD2/YDh6UFu1lNc+09gmcUyq65Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yok7jPq1;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159A606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C159A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yok7jPq1
Received: by mail-oo2-f5.google.com with SMTP id 006d021491bc7-7033e26cb19so1092623eaf.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437340; x=1796042140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qe/Q/ARV0u0Im9fJCrx5hjfd7NIQP7L9RyqkMc8X/yw=;
        b=yok7jPq1fMwWsXVj4vs4vyxWPZFrgDjkVHxC8vbzRqAZgE71hU1VX+Mw94X7ihuouX
         vLb3qwzVCyQ/ri+6Rgs/FxKh5sdynQU0qQSpLoLuuIqYg2eDTObCu5VbN3CSuDQYCglD
         v4PlxitbMng5Hj2boENWUYxD6y9ZldMU2Ds/TZLKRRX5lYgU1kSwaxUynMIVayTX1Xna
         XY/3hCHQs3U7vY2Jk2EMuKLeAb63ZhjqXzDya5hp0kI9Fcijo360K7GOF2viGSr1SUe5
         oap0lEMEq0eVh5UBEOAsdDi9a+YhEFsdX/yd24Dw2gmC0C3RbDTuME6BDNSVRjpnrznc
         DMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437340; x=1796042140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe/Q/ARV0u0Im9fJCrx5hjfd7NIQP7L9RyqkMc8X/yw=;
        b=mEBJexpmF7y35ytX5pn1C5vZ+w9c6VJZJi0Ro6hG6a08DSValQBu+vAstPM5XRJY7l
         IPz7USg6rv7Basyxx1clEGPCD4L9isARa38u9T01eHWsxgj3W1tC/H4OYuhGqHhG2RGn
         rWC1RjS9kSqtyCKF5Zr6GkGLRML72/FkPfKwv/e0FrVn19vb9BEjPjMXu6VZl7/L7W5j
         OKOhJGnbIFvtVeI0o+0FqnPeAVpGYlruEnOdN0N5kmogOkSekBB/D8los2tk76X56qBV
         Oa2EhMY1vLiHVzCk+MagO6M7LqAulWblKG9Ge7LaO/mekKv9LwZou2wJEbiuT7LTPFEZ
         CDMA==
X-Forwarded-Encrypted: i=1; AL+hErHz0EeenhL606lPXg23O3bSMf7lCHOq+DZrcnAYgC3541SQ2OMC7XicWlzaDb+h8rPyh5aXMfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+X2CVMT68oqYV1zAXDsij3KqrsoOOdh3UryPoNWJ/TnJyOkKa
	vSn9PtqiVKP/79IVCN2zJecnyJforUHx/NHMuMEmmL59JGtSfzk9PQV1
X-Gm-Gg: AZFdTZdEFbFHL6737CPuwFomhikopBHkWO7+fuNfANSpQB75tO1MtHqlW3WpdoT5WyB
	qwzdR5u1485T997TQDTXAJMAWUXuV94cpu1iw66d3G/iWIkicAiWlv1zqTotnd3cTBxDCiXCUCY
	u3KoI8hX+hjgB7ai/4Vw7ZC9xsY6qtvQZjJBocx4x1oe1Phn+Ce/TXL3Y1XEGyOQGDOOeW9o+af
	tZUijd0i8lVU7oc5GD9Bu7sfwQk+neqS7YJmgSngJz0QqpUUEGtyF/9LMtIqwZyE3khdreOgbnb
	AhabEMKgdAB3IkCoO1PU/H8j4Ll9hlncbxQMOU5bE+CTfnwPq3/p7bvoP0bMrz5wH3t29CZj06a
	A7UFid9672cu9V7t7U7LAnJ1pZZWIYnE37UnN8tBmU0mxr+RieW5um0XbJdfqWN/qJ4P4frCjSy
	QD4H6JvsO2ogyNpFGODWVISJZ0P7qzlsc2tNGanmxK0Pms3zawPp13L5JW/Dzdh5gvbPSBWRH56
	SrfwB5EXwQ6KAFYQfiHsN5PY+89lyUB2GTMbIh2N9O91vKTil9se2j+MOILhfUo+7cKSFfXKrPu
	l7CoHmxLlJKKP8VfhAypBep2fdxAGq0SrKiRkA17jaDizNWxYt7RXH8p0Pfb4s1DA2+l
X-Received: by 2002:a05:6820:c7c6:b0:71a:fcbf:246b with SMTP id 006d021491bc7-71b39035f74mr6606350eaf.0.1795437339594;
        Mon, 23 Nov 2026 04:35:39 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.38])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm7125412eaf.7.2026.11.23.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:35:38 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	yanhaishuang@cmss.chinamobile.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] ip_gre: fix stale header length after erspan version change
Date: Mon, 23 Nov 2026 20:35:29 +0800
Message-ID: <20261123123529.3183627-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

erspan_changelink() can switch an existing tunnel between erspan
versions, but the GRE header length is only computed once in
erspan_tunnel_init(). After downgrading a tunnel from version 1 or 2
to version 0, tun_hlen stays 8 while the version 0 transmit path
clears the SEQ and KEY flags, so gre_build_header() writes only the
4-byte base header. The upper 4 bytes of the pushed header are
uninitialized skb headroom and are sent to the tunnel peer with every
packet. Switching in the other direction leaves tun_hlen at 4, so the
version 1 transmit path writes the GRE sequence field over the ERSPAN
base header, and the ERSPAN header grows without growing
needed_headroom.

Triggered on v7.4-rc3 with a version 1 tunnel switched to version 0:
the four bytes above the GRE base header carried the heap marker
sprayed into skb headroom instead of the GRE sequence number, in
1056/1550 and 744/1552 frames over two independent boots, while the
version 1 baseline carried the expected 1..65 sequence.

Recompute the header lengths in erspan_changelink() on every change,
mirroring what the IPv6 side does in ip6erspan_tnl_change(). The old
length has to be sampled before ipgre_newlink_encap_setup(), which
resets t->hlen to tun_hlen + encap_hlen, and the delta propagated to
needed_headroom and the MTU.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: f989d546a2d5 ("erspan: Add type I version 0 support.")
Link: https://lore.kernel.org/netdev/20261123062752.27920-1-yanhaishuang@cmss.chinamobile.com/
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v1 -> v2: sample hlen before ipgre_newlink_encap_setup() and recompute it
          on every changelink. v1 sampled it after the encap setup had
          already reset t->hlen, so the delta was always the new ERSPAN
          header length and every "ip link set" on a version 1 device
          shrank the MTU by 8 and grew needed_headroom by 8 (reported by
          Haishuang Yan). Add the runtime trigger observations.
 net/ipv4/ip_gre.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 5485586fa0e6..2a1d6ff16dfe 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1346,28 +1346,35 @@ static const struct net_device_ops gre_tap_netdev_ops = {
 	.ndo_set_mac_address 	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= ip_tunnel_change_mtu,
 	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_get_iflink		= ip_tunnel_get_iflink,
 	.ndo_fill_metadata_dst	= gre_fill_metadata_dst,
 };
 
-static int erspan_tunnel_init(struct net_device *dev)
+static void erspan_calc_hlen(struct net_device *dev)
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 
 	if (tunnel->erspan_ver == 0)
 		tunnel->tun_hlen = 4; /* 4-byte GRE hdr. */
 	else
 		tunnel->tun_hlen = 8; /* 8-byte GRE hdr. */
 
-	tunnel->parms.iph.protocol = IPPROTO_GRE;
 	tunnel->hlen = tunnel->tun_hlen + tunnel->encap_hlen +
 		       erspan_hdr_len(tunnel->erspan_ver);
+}
+
+static int erspan_tunnel_init(struct net_device *dev)
+{
+	struct ip_tunnel *tunnel = netdev_priv(dev);
+
+	erspan_calc_hlen(dev);
+	tunnel->parms.iph.protocol = IPPROTO_GRE;
 
 	dev->features		|= GRE_FEATURES;
 	dev->hw_features	|= GRE_FEATURES;
 	dev->priv_flags		|= IFF_LIVE_ADDR_CHANGE;
 	dev->lltx = true;
 	netif_keep_dst(dev);
 
 	return ip_tunnel_init(dev);
@@ -1494,41 +1501,52 @@ static int ipgre_changelink(struct net_device *dev, struct nlattr *tb[],
 static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 			     struct nlattr *data[],
 			     struct netlink_ext_ack *extack)
 {
 	struct ip_tunnel *t = netdev_priv(dev);
 	struct ip_tunnel_parm_kern p;
 	__u32 fwmark = t->fwmark;
 	int err;
+	int hlen;
 
 	if (!rtnl_dev_link_net_capable(dev, t->net))
 		return -EPERM;
 
 	if (data && data[IFLA_GRE_COLLECT_METADATA] && !t->collect_md) {
 		NL_SET_ERR_MSG(extack,
 			       "Enabling collect_md on an existing device is not supported");
 		return -EOPNOTSUPP;
 	}
 
+	hlen = t->hlen;
+
 	err = ipgre_newlink_encap_setup(dev, data);
 	if (err)
 		return err;
 
 	err = erspan_netlink_parms(dev, data, tb, &p, &fwmark);
 	if (err < 0)
 		return err;
 
 	err = ip_tunnel_changelink(dev, tb, &p, fwmark);
 	if (err < 0)
 		return err;
 
 	ip_tunnel_flags_copy(t->parms.i_flags, p.i_flags);
 	ip_tunnel_flags_copy(t->parms.o_flags, p.o_flags);
 
+	erspan_calc_hlen(dev);
+	hlen = t->hlen - hlen;
+	if (hlen) {
+		dev->needed_headroom += hlen;
+		if (!tb[IFLA_MTU])
+			WRITE_ONCE(dev->mtu, max_t(int, dev->mtu - hlen, 68));
+	}
+
 	return 0;
 }
 
 static size_t ipgre_get_size(const struct net_device *dev)
 {
 	return
 		/* IFLA_GRE_LINK */
 		nla_total_size(4) +
-- 
2.43.7

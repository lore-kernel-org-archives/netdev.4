Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662754;
	b=UD41NC9GWm4ld+PD5S7pn1RRiuQDlpitgQK06OtgWGoIba0L0e3HqWHS6VBggoMFObj5
	 O6lTrColpFFKJFgo2I79IzbnjPJZXEP+EH85jBDGLBqemCyMSoczuyA6vbDb7GPOETygC
	 YfAwKDia9fmvBkuOHehP/zrNT1oTuOZo2zVcZD88VwVzjM5XsnnL/Gd9DQuyqg5+x0FYc
	 vsfXSFOGvx6/vHthxbRFyvM+t52sYMqZrH+d8rq7yJK/hsgdkoYfnUqzqlsOAm24v8fzX
	 LHcEqEEAwm5NzO3WTl7x0kAzeZ+BFB3fGwZla6IAjGCHBpe44XeHOvfwtcRi/16fHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pSx+cwaYj6d7FBSuXNFNtOr8390tE4CLrT3hLG+WtOY=;
	b=mi+usTBFiBker5yLFfKaSrFjbT95+5HJIgxTRs++vvWeTMkRYCTFD8bXRm7eolRtP3T3
	 xON9yLDh1Zm/gAemmERql1c489PBOv+itA8Y9cMailALRKLcq/Za0oD8ZKEfvEzNHFD51
	 65Si86Ba+QvK/0Q8dz7kZRViKgJB7m5ncHEZuDF1f0zz6kdM9G8SHHjRCnt2h/9d3VfJl
	 5Zxm/YWz78c+Z9mx6Y0lDXmxc3sCiRlkcNfzLYkVn3+he2De4SKGFiVVGgcnO1eDdcYhL
	 8jUZzjTRKsv5Y143J4KNuG1B53DAMbaInrVPRnAcX16JmIr6+tUhzpNW6U9uzWk0Zbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wc6qSvcK;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409EC606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 409EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wc6qSvcK
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-862a5ac28e9so2941042a34.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662752; x=1796267552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSx+cwaYj6d7FBSuXNFNtOr8390tE4CLrT3hLG+WtOY=;
        b=Wc6qSvcKiqg7RxUIgo7kMqz97ReQUsnHo6MOX32ZNb54juz+MLsIDRe9nROf13CoMb
         jdNP79UhphROZ3m/hAyBBAV/VvYewLKfmBXMr8HYjwDlOALmxWupETj0cCsI02t8vjGe
         ypGP6exX+LAC51up+WuBKQKrqE6kZSTrFX/IsuPo9Q8nIPWG6CEhLLA4non0dRVvPPkJ
         /ZPuoaI6usMlkWFXt08GylA3MsJCzaJ+Zkjlx7T0WE5qa5Lu2OJRJ1+JDm7lTkpo/ei9
         bLWqI3NTTGvHdB7d5YSJbNAeUWMbxHv3g0m3SCAAGG7cElrC6FbKrD0U0+JvOpi88P6l
         v4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662752; x=1796267552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSx+cwaYj6d7FBSuXNFNtOr8390tE4CLrT3hLG+WtOY=;
        b=r35u75qyXE3dsaiat6RG8niSd5Zdcn4CJ628WNmvDzK7RcBs9uOzPj8OPS4bEvKtly
         vjgl5g1v3ewlBJ8MH1EGX8PhMSKXi4/vGaETW74d6vncQuNXKARnS5T40fV8ZlnOZNbJ
         ceLU7mj/2K47Go21tQpjeCDu2QxI48yPO93ms0tBHJpP43hEf4XMJvo0ntoB01LzmGNx
         47fOGC+0BIp4TS4jHZBGl1cUlRlmAC010hLGRow1ttUb7JdqS/gOV6Vq9iw1Oodt+XE6
         IIOQLL5R7/5CubmCGa65PF5G++2bRo5aRt0NeKOyvxhj84FisQwMJ84hofaTY2pu0iUU
         EJDA==
X-Forwarded-Encrypted: i=1; AL+hErHCpIzlMJ+iMLZ10inQvE5HRc2tjfTjydaQJcW8H+zivCk5nrMLUKJ1Idk5VcbbpiXYUIXtakM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FZyMI5Jl0b8fSnbLbdiXeA8hUStYkawhdA1DC+zAOlsqDSh32
	Ma6KTJYaqxpxY9I0KIEn1z9UEZrEBBJjyeCltbDQOrH9WPqBJwb6Sm9w
X-Gm-Gg: AZFdTZfWFb2gfmF6Chi7vtBefadKrVg0eeAFfTkZtS3dwZ7mlGnhkvxSQ9we733ZEwJ
	Hm2luJedqqTzPm6TAzuNZ7+wxX5KnBH+am2GsVcXcNALYbdHLBgEf69LIhhJSPc4PaOgFNoQq9H
	mWgW7SYVzdTU50Oxk9JDLjTU8tz1g/enEeDa28ddzx82lLHXT3NNouQTf76xfZiGZq2iegoYS2q
	mfV+JlEXIUPolqxA5/2Wvkzihs3szyPQdDXfsUPJ15ctEW5MRWLgAn0JfyQsKOEb6+HEielOd4S
	CrO9KBnaYMa24JyjNXZYeldKYXn1YbuXbJFY+dPFkKpclHhBfBq14fg4BRQHEv5ttV9m6gCJPQP
	jsbXhCTil6WPyC/oUp+BsN27PpVG94/7TaEcUSB1a8yXD9LFe0aUjqqDL73tsWEb9qD4gSoJ4E1
	ZGZXcRSE4n54ZQGLZhjAQaTzxUpiBby6Ea8P1YvbTUshRh6OVYSwZvswAPJL7QIpYYuAP2GVN2q
	brVPnUZcYfkl3uYZCPcUmhwKLvF93+hANnmrZC2cDj44ifnz+ytxzhfpYuu6RHxMyJjx6KnkCtT
	0pihX/uuUwiGz1Lq0QTgTii9aQVhk9yLLhPLhHRB/MkMo6g3u1vbWR3y20XA2FWb4Rzj
X-Received: by 2002:a05:6830:3150:b0:81b:a5f9:3490 with SMTP id 46e09a7af769-863159adbfamr26546009a34.24.1795662752145;
        Wed, 25 Nov 2026 19:12:32 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm13980311a34.2.2026.11.25.19.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:12:31 -0800 (PST)
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
Subject: [PATCH net v4] net: fix stale header length after erspan version change
Date: Thu, 26 Nov 2026 11:12:24 +0800
Message-ID: <20261126031224.430850-1-bsdhenrymartin@gmail.com>
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
erspan_tunnel_init().  After a downgrade to version 0, tun_hlen stays 8
while the version 0 transmit path clears the SEQ and KEY flags, so the
upper 4 bytes of every pushed header are uninitialized skb headroom sent
to the tunnel peer.  An upgrade leaves tun_hlen at 4, so the version 1
transmit path writes the GRE sequence field over the GRE base header,
and the ERSPAN header grows without growing needed_headroom.

Triggered with a version 1 tunnel switched to version 0: the four bytes
above the GRE base header carried the heap marker sprayed into skb
headroom instead of the GRE sequence number.

Recompute the header lengths in erspan_changelink() on every change,
mirroring the IPv6 side in ip6erspan_tnl_change().  Sample the old
length before ipgre_newlink_encap_setup() resets t->hlen, and run the
recompute right after erspan_netlink_parms(), before checking its error:
ip_tunnel_changelink() -> ip_tunnel_bind_dev() consumes t->hlen, and a
failed changelink must not leave the reset value for the next call to
sample.

Verified on v7.4-rc4 (KASAN, uid 1000): unpatched, 708 post-switch
frames carry the sprayed heap marker; with the patch the tag hits drop to
0, and repeating a failed (hwid 0xff) followed by a successful
changelink keeps the MTU at 1446, as before the change.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: f989d546a2d5 ("erspan: Add type I version 0 support.")
Link: https://lore.kernel.org/netdev/20261123062752.27920-1-yanhaishuang@cmss.chinamobile.com/
Link: https://lore.kernel.org/netdev/20261124014646.7954-1-yanhaishuang@cmss.chinamobile.com/
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
v3 -> v4: fix the placement of the int hlen; declaration: the hunk
          matched the identical declaration block at the top of
          ipgre_changelink(), leaving an unused variable there and
          breaking the build of erspan_changelink() with -Werror.
          Declare it in erspan_changelink() and order the declarations
          per reverse christmas tree.  No functional change.
v2 -> v3: move the recompute block right after erspan_netlink_parms()
          and run it before checking its error, so a failed changelink
          leaves t->hlen consistent and ip_tunnel_bind_dev() no longer
          sees the reset value (both reported by Haishuang Yan on v2).
          Fix the changelog wording: the sequence number overwrites the
          GRE base header, not the ERSPAN base header.
v1 -> v2: sample hlen before ipgre_newlink_encap_setup() and recompute it
          on every changelink. v1 sampled it after the encap setup had
          already reset t->hlen, so the delta was always the new ERSPAN
          header length and every "ip link set" on a version 1 device
          shrank the MTU by 8 and grew needed_headroom by 8 (reported by
          Haishuang Yan). Add the runtime trigger observations.
---
 net/ipv4/ip_gre.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 5485586fa0e6..16f52b9e77b3 100644
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
@@ -1493,32 +1500,50 @@ static int ipgre_changelink(struct net_device *dev, struct nlattr *tb[],
 
 static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 			     struct nlattr *data[],
 			     struct netlink_ext_ack *extack)
 {
 	struct ip_tunnel *t = netdev_priv(dev);
 	struct ip_tunnel_parm_kern p;
 	__u32 fwmark = t->fwmark;
+	int hlen;
 	int err;
 
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
+
+	/*
+	 * ipgre_newlink_encap_setup() reset t->hlen without the ERSPAN part.
+	 * Restore it before ip_tunnel_changelink() (and its
+	 * ip_tunnel_bind_dev()) consumes it, and even when the parms above
+	 * failed, so a failed changelink leaves no stale value for the next
+	 * one to sample.
+	 */
+	erspan_calc_hlen(dev);
+	hlen = t->hlen - hlen;
+	if (hlen) {
+		dev->needed_headroom += hlen;
+		if (!tb[IFLA_MTU])
+			WRITE_ONCE(dev->mtu, max_t(int, dev->mtu - hlen, 68));
+	}
 	if (err < 0)
 		return err;
 
 	err = ip_tunnel_changelink(dev, tb, &p, fwmark);
 	if (err < 0)
 		return err;
 
 	ip_tunnel_flags_copy(t->parms.i_flags, p.i_flags);
-- 
2.43.7


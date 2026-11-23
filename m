Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429726;
	b=Zg4lyBMC85o2Y9NFazwofsmpYYIfYGNbsrRHyzFz4QHKOCTiIOQRLjuaEQWPB05mGe6h
	 8UcKhqa0JFkHc5K1iRgMX0fWCeusuf+Z0oFtdyHbjeEOAoI9ay4Jd+lCa7CAupfc/LjUC
	 mJkQsmGmGseNDK1rPhsZv864g3FtuI5pLhewVT2IeJeSdSdK/UspzPIJBoxN0PdQ8aZ8w
	 3R5uTUjsIB5/W2CL8TL9NxQiX4aI1zVLmh5EIs1igvZKM7I9gzDH0ZsNTErPejxphpWlL
	 jWbOOiGypCvbCvEf71k4HpdnfTU033iEkvdGwPRhOMHV8zr4+jz4djRppoXMWYpGdSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vvhL2dudRhqTXrzfmMeH03EnlFMuQX0Rpev63eT5Nl8=;
	b=r8mNrGXxFztVtZwIVQ85Z3dH3QeS7YT5TAjiAS3I/jzh/Gq54JbFD0ogATBZfa00yjlC
	 8pjHYj8uu7gosIQvfsa5Y6tjN0//mS4R3Fx9ixDnkctGeGf1MDzz0wzzNEbhBMmANl3tC
	 z0YxTf1dLwkEW364HReUTTTlDz13Eui3Mw5rxgpzzfkVeW+POUK2UymN72CnDXIedvZKW
	 vFnd1xlmgq8ieutsAe2aUO2gn/P40nObzfKk8kiswOo5LaHrlXnY8rq24Rw5k2/IO+/1X
	 4h1oHuBMfVQBHKvX8zhmCKd0TGCegIgw7++F2GhOSaFbHxzRdjDc9GnxjNaRwsmmGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=DwyxMWk4;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E834606A33C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E834606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=DwyxMWk4
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2577864f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795429724; x=1796034524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvhL2dudRhqTXrzfmMeH03EnlFMuQX0Rpev63eT5Nl8=;
        b=DwyxMWk4zNFfPX1m2Skc8WoPtXy0LDfyCLNDJkDbPNzR717UvDB1+YfAj7F2T2WcCn
         j+MQHCCSRtK87E6S3RKZbqQM/68uf9Q24pQsC8CJ07Tmz7zHnHWIK2ndzuIUzJiYpA0N
         oRylfhFrwfz9myRZCLvQUY7ikYQYqGPDkMDh3ArEuHoDS1vMd2CaA212ls6fau8e+pCX
         ewF0MbBHWWt9ypPuw3wLZq7ZG4aUe8P4ao68nEgbgqtXq0mpQxvcHJC8dIFQDrFBT2Bf
         HZb45iu4NvQTvUSJeHL4Ztt61X48aks+cfxic74pMbuT/gaeWp05PvFCMiJqRQigCGcW
         yBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429724; x=1796034524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvhL2dudRhqTXrzfmMeH03EnlFMuQX0Rpev63eT5Nl8=;
        b=Rgmy2uMTp/7DreIQ25DzTOk2+UI/nKC9kmoSOzNj5Rnoq6f7XDLFN/CWPsQ/enxgdf
         v0PEHBLaxzyzyNdETk95GeKmBKuG4JPASIwWs7s4wDZh6LOaC4sdK/KESLkcKj1tWH3g
         GxiIoXELakmfMKqFqigmM1UfDQREdEiX0SrTqBL/uRm9C40fPtK4ymSCQBMrVdwERM3t
         jNxUaZfrh+9x8Km27dvYC4Wk1Q5f8rZDQp3ThB+5nxwrCPgGUw3TF374TR60QjdZesrx
         eSNvlvPE1u33adhakUYQVpaBYLsI7neG0tMIMAK+GFqwgYaZmA17qPBWQx/LtuRLgtvo
         Mxiw==
X-Gm-Message-State: APuU4Z/4RtdWhbpM3Z/McT3zQkoannbAQ5BThZQJDKlzgWBQ0iNznVxB
	cOo6Fkyju8MapB3t0OcavoWWAPV/e25MJXyF5h5UWalZpPMaJoFixgN/EMgHSywnQ8HMihqqprz
	p+g1I2rApVg==
X-Gm-Gg: AZFdTZepEkIVM/Q2UgWFJaeKiGm7q8ASzNT5L88oGPEWQFwlvf+DhGr0TZKAqJX/ego
	Zjsrp1x+qcCHVCfzkUuJzvMHh9QE4+LCBRt9xaJi5zCWz0aGJZVQTvu2yfF2rrS82jjrrKegO0A
	TFBmwBgANZnl1W1/KuBqEHMCUIjx+SjKegvO9bt6ReDoN22ufzwd9UG1fKwSLRWBQ5Nj1xvdwWN
	iBbdqzuRz07xAJHd4t7hcbFLlU62JUKB0L1JaYGu7sE2D+R/+Wsvr/c4FcLXvgKrOCZQ5ICNxYf
	6ERO2a1MjeaaNGESwlepnYr7NPOLw1CoHCob7E1iOUEUQdb/qDb91aM6rmoTybwXbKKe3sVO64L
	usbx2D9zHwUWAtJuo2FtLWEMAuBaSj5j7zrBwcLiF7nKI+CVBpVdY1g+ELwSqMAkVYb+bDNavG3
	3L7H8lbfxV8stcm/68fz4YZ8T2huOj+TjdFtT7azw7gs5coYhCsUpKY9/dvP4MKlLYoMtS1dkW6
	vShdNh4kl58gjlI+T7kT3E3a1Sx2hMj9k5puUeu6/gny6Kre5Z13VIUJy1K5izf8op3HFdJRafD
	BriRiWmZ7KZKmPdulMY4q6NMMeRa0anaL8GhZB99+XZI3XcwLjU=
X-Received: by 2002:a05:6000:29d3:b0:4a2:6542:989a with SMTP id ffacd0b85a97d-4abb4b85a5cmr11933643f8f.52.1795429724549;
        Mon, 23 Nov 2026 02:28:44 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4abbd84e661sm19882368f8f.18.2026.11.23.02.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:28:44 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: netdev@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev
Subject: [PATCH net-next 3/3] net: bridge: mdb: avoid VLAN lookups in listener forwarding
Date: Mon, 23 Nov 2026 12:28:33 +0200
Message-ID: <20261123102833.924427-4-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123102833.924427-1-razor@blackwall.org>
References: <20261123102833.924427-1-razor@blackwall.org>
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

Cache a port or port-VLAN destination in each mdb port group and pass
its resolved VLAN to listener and multicast-to-unicast forwarding.
Groups with port VLAN membership can validate egress and handle tagging
without VLAN lookups.

Adding or deleting a port VLAN rewrites the cached destination of every
group in that VLAN so its cost grows linearly with the VLAN's groups.

When a listener is also a global multicast router, use its cached
destination while retaining router delivery semantics.

VLAN forwarding improvement:
  VLANs  Listeners  Mpps before  Mpps after  Gain %  Cycles before  Cycles after  Saved %
  ---------------------------------------------------------------------------------------
    8          4     0.785571    0.865156  +10.13         3771.2        3381.2    10.34
    8          8     0.454257    0.511490  +12.60         6900.5        6091.0    11.73
    8         16     0.249896    0.288575  +15.48        13144.0       11362.9    13.55
   64          4     0.765468    0.841916   +9.99         3881.6        3462.1    10.81
   64          8     0.437448    0.501744  +14.70         7153.6        6215.6    13.11
   64         16     0.238901    0.279188  +16.86        13690.2       11674.2    14.73
 4094          4     0.583447    0.695246  +19.16         5271.6        4339.3    17.68
 4094          8     0.293712    0.373710  +27.24        11001.0        8492.8    22.80
 4094         16     0.140026    0.191269  +36.60        23509.6       17213.7    26.78

Medians of 6 runs, 64b frames, one group per VLAN and packet VIDs
chosen at random. Cycles are PMU cycles / input packet on the fwding CPU.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: Ido Schimmel <idosch@nvidia.com>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: bridge@lists.linux.dev

 net/bridge/br_forward.c   | 16 +++++++++-------
 net/bridge/br_multicast.c | 24 ++++++++++++++++++++++++
 net/bridge/br_private.h   |  7 +++++++
 net/bridge/br_vlan.c      |  2 ++
 4 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/net/bridge/br_forward.c b/net/bridge/br_forward.c
index b725e8f1b29a..321e63495548 100644
--- a/net/bridge/br_forward.c
+++ b/net/bridge/br_forward.c
@@ -353,17 +353,15 @@ void br_flood(struct net_bridge *br, struct net_bridge_vlan *v,
 }
 
 #ifdef CONFIG_BRIDGE_IGMP_SNOOPING
-static void maybe_deliver_addr(struct net_bridge_port *p, struct sk_buff *skb,
+static void maybe_deliver_addr(struct br_fwd_dst *fwd, struct sk_buff *skb,
 			       const unsigned char *addr, bool local_orig)
 {
 	struct net_device *dev = BR_INPUT_SKB_CB(skb)->brdev;
 	const unsigned char *src = eth_hdr(skb)->h_source;
-	struct br_fwd_dst fwd = {
-		.port = p,
-	};
+	struct net_bridge_port *p = fwd->port;
 	struct sk_buff *nskb;
 
-	if (!should_deliver(&fwd, skb))
+	if (!should_deliver(fwd, skb))
 		return;
 
 	/* Even with hairpin, no soliloquies - prevent breaking IPv6 DAD */
@@ -383,7 +381,7 @@ static void maybe_deliver_addr(struct net_bridge_port *p, struct sk_buff *skb,
 	if (!is_broadcast_ether_addr(addr))
 		memcpy(eth_hdr(skb)->h_dest, addr, ETH_ALEN);
 
-	__br_forward(&fwd, skb, local_orig);
+	__br_forward(fwd, skb, local_orig);
 }
 
 /* called with rcu_read_lock */
@@ -421,10 +419,11 @@ void br_multicast_flood(struct net_bridge_mdb_entry *mdst,
 
 		if ((unsigned long)lport > (unsigned long)rport) {
 			port = lport;
+			br_dst_decode(br_dst_read(&p->dst), &fwd.port, &fwd.vlan);
 
 			if (test_bit(BR_MULTICAST_TO_UNICAST_BIT,
 				     &port->flags)) {
-				maybe_deliver_addr(lport, skb, p->eth_addr,
+				maybe_deliver_addr(&fwd, skb, p->eth_addr,
 						   local_orig);
 				goto delivered;
 			}
@@ -435,6 +434,9 @@ void br_multicast_flood(struct net_bridge_mdb_entry *mdst,
 		} else {
 			port = rport;
 			fwd.vlan = rpmctx->vlan;
+			if (!fwd.vlan && lport == rport)
+				br_dst_decode(br_dst_read(&p->dst),
+					      &fwd.port, &fwd.vlan);
 		}
 
 		fwd.port = port;
diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index 7285229ca6d7..907918b31251 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -1423,6 +1423,22 @@ br_multicast_new_group_src(struct net_bridge_port_group *pg, struct br_ip *src_i
 	return grp_src;
 }
 
+void br_multicast_update_vlan_dst(struct net_bridge_vlan *vlan, bool add)
+{
+	struct net_bridge_port *port = vlan->port;
+	struct net_bridge_port_group *pg;
+	struct net_bridge_dst dst;
+
+	ASSERT_RTNL();
+
+	dst = add ? br_vlan_to_dst(vlan) : br_port_to_dst(port);
+	spin_lock_bh(&port->br->multicast_lock);
+	hash_for_each_possible(port->mdb_vlan_hash, pg, vlan_node, vlan->vid)
+		if (pg->key.addr.vid == vlan->vid)
+			br_dst_write(&pg->dst, dst);
+	spin_unlock_bh(&port->br->multicast_lock);
+}
+
 struct net_bridge_port_group *br_multicast_new_port_group(
 			struct net_bridge_port *port,
 			const struct br_ip *group,
@@ -1433,9 +1449,12 @@ struct net_bridge_port_group *br_multicast_new_port_group(
 			u8 rt_protocol,
 			struct netlink_ext_ack *extack)
 {
+	struct net_bridge_vlan *vlan = NULL;
 	struct net_bridge_port_group *p;
 	int err;
 
+	lockdep_assert_held_once(&port->br->multicast_lock);
+
 	err = br_multicast_port_ngroups_inc(port, group, extack);
 	if (err)
 		return NULL;
@@ -1448,6 +1467,11 @@ struct net_bridge_port_group *br_multicast_new_port_group(
 
 	p->key.addr = *group;
 	p->key.port = port;
+	rcu_read_lock();
+	if (group->vid)
+		vlan = br_vlan_find(nbp_vlan_group_rcu(port), group->vid);
+	br_dst_write(&p->dst, vlan ? br_vlan_to_dst(vlan) : br_port_to_dst(port));
+	rcu_read_unlock();
 	p->flags = flags;
 	p->filter_mode = filter_mode;
 	p->rt_protocol = rt_protocol;
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 04430dc32d02..b4a35bd05879 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -377,6 +377,7 @@ struct net_bridge_port_group_sg_key {
 struct net_bridge_port_group {
 	struct net_bridge_port_group __rcu *next;
 	struct net_bridge_port_group_sg_key key;
+	struct net_bridge_dst		dst;
 	unsigned char			eth_addr[ETH_ALEN] __aligned(2);
 	unsigned char			flags;
 	unsigned char			filter_mode;
@@ -1211,6 +1212,7 @@ void br_multicast_port_ctx_init(struct net_bridge_port *port,
 				struct net_bridge_vlan *vlan,
 				struct net_bridge_mcast_port *pmctx);
 void br_multicast_port_ctx_deinit(struct net_bridge_mcast_port *pmctx);
+void br_multicast_update_vlan_dst(struct net_bridge_vlan *vlan, bool add);
 void br_multicast_update_vlan_mcast_ctx(struct net_bridge_vlan *v, u8 state);
 void br_multicast_toggle_one_vlan(struct net_bridge_vlan *vlan, bool on);
 int br_multicast_toggle_vlan_snooping(struct net_bridge *br, bool on,
@@ -1682,6 +1684,11 @@ static inline void br_multicast_port_ctx_deinit(struct net_bridge_mcast_port *pm
 {
 }
 
+static inline void br_multicast_update_vlan_dst(struct net_bridge_vlan *vlan,
+						bool add)
+{
+}
+
 static inline void br_multicast_update_vlan_mcast_ctx(struct net_bridge_vlan *v,
 						      u8 state)
 {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 6f6b574a359d..43ca46a5b926 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -383,6 +383,7 @@ static int __vlan_add(struct net_bridge_vlan *v, u16 flags,
 	br_multicast_toggle_one_vlan(v, true);
 
 	if (p) {
+		br_multicast_update_vlan_dst(v, true);
 		br_vlan_rebuild_port_array(masterv, br_vlan_num_ports(masterv));
 		nbp_vlan_set_vlan_dev_state(p, v->vid);
 	}
@@ -424,6 +425,7 @@ static void __vlan_unpublish(struct net_bridge_vlan_group *vg,
 		rhashtable_remove_fast(&vg->vlan_hash, &v->vnode,
 				       br_vlan_rht_params);
 		__vlan_del_list(v);
+		br_multicast_update_vlan_dst(v, false);
 		/* -1 because br_vlan_put_master() is called later */
 		br_vlan_rebuild_port_array(masterv,
 					   br_vlan_num_ports(masterv) - 1);
-- 
2.47.3


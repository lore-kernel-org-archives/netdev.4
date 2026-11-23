Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429725;
	b=gB15QHAWYBCDbupv8ACb8d3HTUfRy1DWOq+EFp1Ry+rSrV8xP2kkHUmKiHkP4YuDy+GY
	 rcP2/PIMYcvnNU6xhIWg85pCuDzaLtN1WSAtgfKQ/LfMtKRWNl8TDDQG0AhvebfNBi4oX
	 B4ikLQygldYSWF7a6u8rnlniqVLtBspEKIWLkDrnuIJ0cgSTOhiVMO7xRd3O1oWz5PnYF
	 cyaOzMHvDPS8qAkeTqNbgpjDIzcj6lCd/++qCZ30Ia8k0c2pNobOdXEUkKQJuo+RSeDzE
	 sVJCqC/LJ8ESvFbMTOMcB4GZQC9sOVwO2trporNbCWs3fy6DjQaFWw6oxI//6nBhKIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MbCT6kMCgXiWS2cYOuIzCOxXqN/CG0QGdZHpCWESMQY=;
	b=GBWl9b6yxaOZAT8H98A5ervymrkqQj3YEzGYuK0uJf74PGIbW6VJrjP5Bn3K/UHwFdEG
	 TztgabcWNP9+HwvbFimU/rsRVsQUQ075d6yFKALq+0oLuU/mIf6IzWSuDOhmVTIuY/WwR
	 zgz7z/PpkmfEJ2GXVVxclumu5EvYFE0NeIf4fpybaRylASdAspwaIi9XchIuc8DJy05id
	 +fTQTB885F3PSNM0xwliH/DFTxtGiFgXofY4ODJC34rjZUgzy1yIXplXDo0D9p4vE6iWc
	 pctfAjqJwy4UoN2lutwWDn1+8tYHTvxtJ4AGPoyL2htD1I+UIkwvxVhYu+z+bUUDqAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=bcI0QGu7;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BED606A688
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BED606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=bcI0QGu7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so1779894f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795429723; x=1796034523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MbCT6kMCgXiWS2cYOuIzCOxXqN/CG0QGdZHpCWESMQY=;
        b=bcI0QGu7SJwdfhaipffimHif+tei0gqUaGUNVY1enDJaSx2cF07yLAOpUU06C8rx1d
         BJo7LE8Wxq/98w5cSUnOZr+g31ZDo9daHYfSyuzxzyA7YwH72m++q7GKIfIzBqYW9deF
         Egzw4Df9dHQ/nU9RjwyeqcuLOEVxIkI3T45CB0OND8VmoeMLts5S5cyOk4ZlxE7oUVj9
         aGrt8cM9KEpzG2KcjKVlR3/hIDxFYshmCwaoT7Upt0XdHPf1GFxLiXMapOhizRrlvBqH
         eXXkyogxTn+CtfBSl8Zzdlbh3AHROSZjI7BYK6vO7TE4qRHVZ7imoTdXH9jFkWV0C5vm
         mQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429723; x=1796034523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MbCT6kMCgXiWS2cYOuIzCOxXqN/CG0QGdZHpCWESMQY=;
        b=cgtRTWeAE/sgfJeBeNA8FbgKyKVNtjTx4L+YZgA5PHR/72MwEjCCBpVAJlSwuDfRXA
         HES0hs2K+3xAWZSd0L/z57ePM//l4piP9XSaZfK9GUwPA/0maqhClTnh1XocUXARdJQq
         mELvdJgM43t5lPlJU7x81Y079kxERISqkAYTepwdFBFH8DpONCVaQq5InKccChErN4Ui
         3nPkAd/4crwy1xAuKb1lRLcJQy0DKv1yahws859K/YgO7Z28ACJEyxlabNEZAGwEaFba
         7DKzq7JuI3l8FL4/OT9oWj9x9RQA9rs9TVShHWAaeirjBO/7Ne97TGPKaKKHlFq9MrG1
         yXgg==
X-Gm-Message-State: APuU4Z+VcYaGr2qY8LY2YuwiCiZLK3Vo7u2vFDnMnUFZMIHbaNSA28UQ
	GrwLLSEHwmgLU2LOphxpWvOHVkItb/WK3QjIYJgBTutaVE2p+guhlnMpKisl1+qLO0aY7ciX2dR
	KAYNgl18F+g==
X-Gm-Gg: AZFdTZees9QnXoN+FPxZ8hF+8gv4BTRtbh+V2eAvoXRzEyFdTnfDjDxI14rsJ8w+rH1
	/UBkPRFJdc3ksj3Z8AFRJfTDWdjFJSJEDRG6Njz9d7nbi81qO4+7lO1AAfSq5NxEXxz0rXOJ4Fl
	7CYGkshnLjujxgI4fmm9VDHikvnQMrozi7hnZcUbsz7qBsdVWnsxprKmi0kddGHPPy2F69UIqmA
	CEOZihZk5ZkyBbvPrvNOZ46Oc/Am5czsXB2E2SnNHTsGwKuw4MKA+7/lafdnJpU1LkmFXB3Tr8n
	JvGwJYt/fa+kTcFECC3XXR8pPVrmFMZn+u3iRJ8T+WCosQUev8e8WtKrAol5/8g3Rg0Nh+5FTIf
	8EaJVpu5lS2Z92gIAQMUqCR4I3dPEWhMJtlJpdHfQrYondK8PdVWlkw1cducy6q7b00jD6ZJ9bS
	NSLm/M0ByyJfjZW/za4k46C5MFcAtSv7f4d00BzW9MlgJIBhWt5skMTgPqCoj4Yr6ANmQAJaDM+
	P6Pwbhhq8N2oi8VWUVoWr6QrskHK9bBPgwa5WPxX/Fifk1chSYcI9ABncCzRwb2tbOQg/GtkU0s
	UgnmfJBGj4gfsF6P0n0ER81vCGrINU+g+k5vzzKsjlCFECUSq+A=
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr18552786f8f.2.1795429723291;
        Mon, 23 Nov 2026 02:28:43 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab65cb4341sm21786888f8f.4.2026.11.23.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:28:42 -0800 (PST)
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
Subject: [PATCH net-next 2/3] net: bridge: mdb: index port groups by VLAN
Date: Mon, 23 Nov 2026 12:28:32 +0200
Message-ID: <20261123102833.924427-3-razor@blackwall.org>
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

Index each port's multicast groups by VID in a fixed 64-bucket hash
table. Maintain the index under multicast_lock alongside mglist,
including groups retained without port VLAN membership, and remove
entries on both port-group deletion paths.

Use the index when counting groups for a newly created port VLAN
context, avoiding a scan of all groups on the port for every added VLAN.
Keep mglist for its existing RCU readers and teardown walks. The index
also lets VLAN publication and unpublication update cached destinations
without repeatedly walking the full group list.

Operation  VLANs   Global ms before/after   Change %   Per-VLAN ms before/after   Change %
  ------------------------------------------------------------------------------------------
  add            1      0.0519 /   0.0900      +73.52       0.0481 /   0.0895      +86.16
  add           64      2.2500 /   0.7190      -68.04       2.2726 /   0.7441      -67.26
  add         1024     32.7464 /   5.7028      -82.58      32.9841 /   6.3116      -80.86
  add         4094    149.6750 /  34.3223      -77.07     151.5808 /  35.4586      -76.61

Note that the struct net_bridge_port_group increase pushes the allocations
above 256 bytes and into kmalloc-512, this can be kept compact by
introducing a kmalloc cache for these. It can be done separately.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
CC: Ido Schimmel <idosch@nvidia.com>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: bridge@lists.linux.dev

 net/bridge/br_multicast.c | 7 ++++++-
 net/bridge/br_private.h   | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
index ae4fa050be97..7285229ca6d7 100644
--- a/net/bridge/br_multicast.c
+++ b/net/bridge/br_multicast.c
@@ -826,6 +826,7 @@ static void __br_multicast_del_pg(struct net_bridge_mdb_entry *mp,
 	 * and deleting other groups of the same port must not truncate it.
 	 */
 	hlist_del_init_rcu(&pg->mglist);
+	hash_del(&pg->vlan_node);
 	br_multicast_eht_clean_sets(pg);
 	hlist_for_each_entry_safe(ent, tmp, &pg->src_list, node)
 		br_multicast_del_group_src(ent, false);
@@ -1472,6 +1473,7 @@ struct net_bridge_port_group *br_multicast_new_port_group(
 
 	RCU_INIT_POINTER(p->next, next);
 	hlist_add_head_rcu(&p->mglist, &port->mglist);
+	hash_add(port->mdb_vlan_hash, &p->vlan_node, group->vid);
 
 	return p;
 
@@ -1488,6 +1490,7 @@ void br_multicast_del_port_group(struct net_bridge_port_group *p)
 	__u16 vid = p->key.addr.vid;
 
 	hlist_del_init_rcu(&p->mglist);
+	hash_del(&p->vlan_node);
 	if (!br_multicast_is_star_g(&p->key.addr))
 		rhashtable_remove_fast(&port->br->sg_port_tbl, &p->rhnode,
 				       br_sg_port_rht_params);
@@ -2105,7 +2108,8 @@ void br_multicast_port_ctx_init(struct net_bridge_port *port,
 		u32 n = 0;
 
 		spin_lock_bh(&port->br->multicast_lock);
-		hlist_for_each_entry(pg, &port->mglist, mglist)
+		hash_for_each_possible(port->mdb_vlan_hash, pg, vlan_node,
+				       vlan->vid)
 			if (pg->key.addr.vid == vlan->vid)
 				n++;
 		WRITE_ONCE(pmctx->mdb_n_entries, n);
@@ -2138,6 +2142,7 @@ int br_multicast_add_port(struct net_bridge_port *port)
 {
 	int err;
 
+	hash_init(port->mdb_vlan_hash);
 	port->multicast_eht_hosts_limit = BR_MCAST_DEFAULT_EHT_HOSTS_LIMIT;
 	br_multicast_port_ctx_init(port, NULL, &port->multicast_ctx);
 
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 20e423e22132..04430dc32d02 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -18,6 +18,7 @@
 #include <net/pkt_cls.h>
 #include <linux/if_vlan.h>
 #include <linux/rhashtable.h>
+#include <linux/hashtable.h>
 #include <linux/refcount.h>
 
 #define BR_HASH_BITS 8
@@ -29,6 +30,7 @@
 #define BR_MAX_PORTS	(1<<BR_PORT_BITS)
 
 #define BR_MULTICAST_DEFAULT_HASH_MAX 4096
+#define BR_MDB_VLAN_HASH_BITS 6
 #define BR_MULTICAST_QUERY_INTVL_MIN msecs_to_jiffies(1000)
 #define BR_MULTICAST_STARTUP_QUERY_INTVL_MIN BR_MULTICAST_QUERY_INTVL_MIN
 #define BR_MULTICAST_QUERY_INTVL_MAX msecs_to_jiffies(86400000) /* 24 hours */
@@ -386,6 +388,7 @@ struct net_bridge_port_group {
 	struct timer_list		timer;
 	struct timer_list		rexmit_timer;
 	struct hlist_node		mglist;
+	struct hlist_node		vlan_node;
 	struct rb_root			eht_set_tree;
 	struct rb_root			eht_host_tree;
 
@@ -449,6 +452,7 @@ struct net_bridge_port {
 	u32				multicast_eht_hosts_limit;
 	u32				multicast_eht_hosts_cnt;
 	struct hlist_head		mglist;
+	DECLARE_HASHTABLE(mdb_vlan_hash, BR_MDB_VLAN_HASH_BITS);
 #endif
 
 #ifdef CONFIG_SYSFS
-- 
2.47.3


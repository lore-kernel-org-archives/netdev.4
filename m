Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635940;
	b=fhqfsf+mntFlswX3cULqnlTY5uAgrQ+6YGAcakVmRbB2sOTlMD173idYyNyZrzTwyfFH
	 QAoefL/NmBUQJT5OHwXk5qiXkpeQwHvyTxh8xqgwnMMXNRRBu9NmQb8SsMZenjmjo1/pk
	 gS73LcHSvIvk0ZGdslsDIa4LTiX6SWckhxE4OK5sDTl59872mvbBS5Nwj4dkLujH4E82I
	 hL5Z5ItLVAKVRA8VSlyXdQBVnQsHuUlY+NoD8qZ2cnc9u0VkH4Dl7A3lnhmdWHpt0YIf5
	 LDdyMrN+gwMVfFSuPZIroliwGv49G1/tze6/6cgIbku9zg8vdqde4SW3eN95WC57mXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JuKztkIpsryL9CIxNkD9yrvhsnQIweUopipeldiEH+8=;
	b=CF78BYPz66PMl8eLo4hsozGFbZ7LmijVYBWOx265a+fGmGbtpYLzEkj8UjQP3wtPBDuM
	 Ms/z1Hxf7BCFlbNbBoza+OzPAeKdAJ8K3phnuPOyWDP/WIT14R476f9HlN836CtDFgH/H
	 lbnnOJJlPBwYUwF7LINMpZYd/hwu8uO7Qd8x6P3lGDkadOBlqTvgOQ93f3TDYkCixNJVs
	 2Hs/OXU/NMvXNrRNpm0/cuspvWh9byxeXinrESEl9xE61mbSV6ktZhRJodVFsVVCyFAyK
	 xBIZZqc+oeleHZzpbUssMrKZW0X7BURDgk3cjMcgZRg8OAhwvSZcIufphlCvlAKppSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=ehGeOO7p;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9D606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21F9D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=ehGeOO7p
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3866a784546so8430727eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795635939; x=1796240739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JuKztkIpsryL9CIxNkD9yrvhsnQIweUopipeldiEH+8=;
        b=ehGeOO7p1Neb6qdmTm2sZYg8WWizSZ3b18kAjOCErAddsEhHfYoy3lLMK7V44lP71W
         pFjcdBE6HxFSx7559psJ0RaoNXTrVhZErvTAu1Nva1CH+xMQNYRc7dtDneqrrHVjEexv
         kwV9W02Lpm4qITT0DsfLr7obn2ZyPhboK9b0dnhgG3Ph+3NO+Cx9mx7c2PPy/IxPymn6
         g9kFT6DaG3bE6BR8ppklSd6E9I0vNpLMY7BMthg3nkf0MJsIXaqfw/8gdo2woRYavVRK
         RctWCEqZa+QeGbUnREHfabxIX2Q+0Vqhb+SexZqJ4EJyaynKzEEwVzg3Sd3/WQqe0e9T
         308g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635939; x=1796240739;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuKztkIpsryL9CIxNkD9yrvhsnQIweUopipeldiEH+8=;
        b=BS/TozitfC4DG9kvExs8kirTs0oFlGSNLA2Ue/T5iZvUZQTskvfc10QlxNZL9jREx9
         Rue6IjpTrC1l2UOgjRkuepMWUL7nZZjdXTISk3cxF2rodIF/mGPjuObnyky4LYaow90B
         5De6OvZM+VLpS4y0CxaZ3svJB391H7uUoGR+T9f8v9Yaefw/d0yDQhg4bqNsTSsK69Yd
         sIvdLM8eu+3OEdRUK/zc4ga/K8ODxm8Ptb6U2NobfoZLjzeqspJhZvMhjvBB7VzkYSFS
         LfcJiOqD/gaxXuhcwxn4CdSEo+ssIs4M4S+wkH6jtE3i2ct/sx5ZpwRTfS4TRIo2qcfr
         u/DQ==
X-Forwarded-Encrypted: i=1; AL+hErH/jYFWfa1zJ1sJi+kan52dUZ2ZrYmg86oKk5vWBeUKX0Dq2WpQd8OnHqX3JvMtcpL69JCXpMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UwXpnsZeNVfkz/VL+LUobR5ysd6LdNuN8BeJTGmQ+ApbAdFq5
	qgLcEICEyBNlD9VQAen+huPtqi+zzu/p/xCBycgsFTujAC7HKkjp1DM/WEXkbiLF4nE=
X-Gm-Gg: AZFdTZe/JfmBAQQ/dvSs+Qcccr3O22Sr/H31CUSqMbc5RkZlf+7bGkuUcpbNxACnq0e
	cqk/aHQoLaAc39G/q7ivQyB/xvQhZ2zHD4IyqdaCe2sCIpMfI7aQ7NyaIGjYDfNDWYeCO5aDNT7
	LcyulLj9Ft/eipmucZfHuG/fZWh6/u1IoY/uQv6KFKQJ5oTzLK2UBsKqrDVRZ2PUNcCFjQdGh8w
	AG4JDGkj0AuATjeIDstXlWHu6BJFPw0mUwRLfDfLRlVmYqAlSU4gXdz/2rHIfoqaQ8xGtPmGsMF
	m0q5+FNy/0GmeY2+Ddk5/XMCIC7NlPLKarkjFeO9twtX7aCJSHjx3lMTqIQFDoNDpfEtO+OCZp8
	SimPgGjJUePu9giNnsPuX329lzE48YVtVtC3O4hGgio4d6FyN6UyFs96k3x7iWDSTj7Y6fibm5K
	TQa8E/pZMKtGB6mpS73XUro+jXjeKhgc/oo7kMcrq4PMzstKgOXIVzcIxf/b05EFcaPwl9OZ9zG
	Pel1LeY8vbjHk5yvkyDBJLn+cpShcgi9RfU9+dCHg3704+kBahibHDaFzpSQwS7zcj6HHDinMuC
	NJxstP2P1U3QkWrkba+oA3RthznyPCaupm9MT61kIT+QgHBmec7FXYUjq/E4pB92B1dONRmRRTF
	pc2ngfrxzFWiGSEVypClGGiNzIegWiFyVdrFq88ik8QOGKOo=
X-Received: by 2002:a05:7301:787:b0:386:c6f9:b56d with SMTP id 5a478bee46e88-386c6f9b68cmr4853582eec.16.1795635939146;
        Wed, 25 Nov 2026 11:45:39 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386d605c894sm3737730eec.2.2026.11.25.11.45.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:45:38 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	n05ec@lzu.edu.cn,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	ylong030@ucr.edu,
	yuantan098@gmail.com
Subject: [PATCH 6.18.y 1/2] 8021q: use RCU for egress QoS mappings
Date: Wed, 25 Nov 2026 14:45:33 -0500
Message-ID: <20261125194534.52951-2-artem@trailofbits.com>
In-Reply-To: <20261125194534.52951-1-artem@trailofbits.com>
References: <2026050408-ideology-liftoff-aa01@gregkh>
 <20261125194534.52951-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Longxuan Yu <ylong030@ucr.edu>
Date: Mon, 20 Apr 2026 11:18:45 +0800

[ Upstream commit fc69decc811b155a0ed8eef17ee940f28c4f6dbc ]

The TX fast path and reporting paths walk egress QoS mappings without
RTNL. Convert the mapping lists to RCU-protected pointers, use RCU
reader annotations in readers, and defer freeing mapping nodes with an
embedded rcu_head.

This prepares the egress QoS mapping code for safe removal of mapping
nodes in a follow-up change while preserving the current behavior.

Co-developed-by: Yuan Tan <yuantan098@gmail.com>
Signed-off-by: Yuan Tan <yuantan098@gmail.com>
Signed-off-by: Longxuan Yu <ylong030@ucr.edu>
Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>
Link: https://patch.msgid.link/9136768189f8c6d3f824f476c62d2fa1111688e8.1776647968.git.yuantan098@gmail.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>

[ Backport to 6.18.y: context adjusted in vlan_dev_set_egress_priority();
  6.18.y predates the kmalloc_obj() conversion. No functional change
  from upstream. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 include/linux/if_vlan.h  | 25 ++++++++++++++++---------
 net/8021q/vlan_dev.c     | 31 ++++++++++++++++---------------
 net/8021q/vlan_netlink.c | 10 ++++++----
 net/8021q/vlanproc.c     | 12 ++++++++----
 4 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
index 89472ba4425f..2c30c5b62fb5 100644
--- a/include/linux/if_vlan.h
+++ b/include/linux/if_vlan.h
@@ -147,11 +147,13 @@ extern __be16 vlan_dev_vlan_proto(const struct net_device *dev);
  *	@priority: skb priority
  *	@vlan_qos: vlan priority: (skb->priority << 13) & 0xE000
  *	@next: pointer to next struct
+ *	@rcu: used for deferred freeing of mapping nodes
  */
 struct vlan_priority_tci_mapping {
 	u32					priority;
 	u16					vlan_qos;
-	struct vlan_priority_tci_mapping	*next;
+	struct vlan_priority_tci_mapping __rcu	*next;
+	struct rcu_head			rcu;
 };
 
 struct proc_dir_entry;
@@ -177,7 +179,7 @@ struct vlan_dev_priv {
 	unsigned int				nr_ingress_mappings;
 	u32					ingress_priority_map[8];
 	unsigned int				nr_egress_mappings;
-	struct vlan_priority_tci_mapping	*egress_priority_map[16];
+	struct vlan_priority_tci_mapping __rcu	*egress_priority_map[16];
 
 	__be16					vlan_proto;
 	u16					vlan_id;
@@ -209,19 +211,24 @@ static inline u16
 vlan_dev_get_egress_qos_mask(struct net_device *dev, u32 skprio)
 {
 	struct vlan_priority_tci_mapping *mp;
+	u16 vlan_qos = 0;
 
-	smp_rmb(); /* coupled with smp_wmb() in vlan_dev_set_egress_priority() */
+	rcu_read_lock();
 
-	mp = vlan_dev_priv(dev)->egress_priority_map[(skprio & 0xF)];
+	mp = rcu_dereference(vlan_dev_priv(dev)->egress_priority_map[skprio & 0xF]);
 	while (mp) {
 		if (mp->priority == skprio) {
-			return mp->vlan_qos; /* This should already be shifted
-					      * to mask correctly with the
-					      * VLAN's TCI */
+			vlan_qos = READ_ONCE(mp->vlan_qos);
+			break;
 		}
-		mp = mp->next;
+		mp = rcu_dereference(mp->next);
 	}
-	return 0;
+	rcu_read_unlock();
+
+	/* This should already be shifted to mask correctly with
+	 * the VLAN's TCI.
+	 */
+	return vlan_qos;
 }
 
 extern bool vlan_do_receive(struct sk_buff **skb);
diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index 27b84c412008..f86f6b770609 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -208,39 +208,34 @@ int vlan_dev_set_egress_priority(const struct net_device *dev,
 				 u32 skb_prio, u16 vlan_prio)
 {
 	struct vlan_dev_priv *vlan = vlan_dev_priv(dev);
-	struct vlan_priority_tci_mapping *mp = NULL;
+	struct vlan_priority_tci_mapping *mp;
 	struct vlan_priority_tci_mapping *np;
+	u32 bucket = skb_prio & 0xF;
 	u32 vlan_qos = (vlan_prio << VLAN_PRIO_SHIFT) & VLAN_PRIO_MASK;
 
 	/* See if a priority mapping exists.. */
-	mp = vlan->egress_priority_map[skb_prio & 0xF];
+	mp = rtnl_dereference(vlan->egress_priority_map[bucket]);
 	while (mp) {
 		if (mp->priority == skb_prio) {
 			if (mp->vlan_qos && !vlan_qos)
 				vlan->nr_egress_mappings--;
 			else if (!mp->vlan_qos && vlan_qos)
 				vlan->nr_egress_mappings++;
-			mp->vlan_qos = vlan_qos;
+			WRITE_ONCE(mp->vlan_qos, vlan_qos);
 			return 0;
 		}
-		mp = mp->next;
+		mp = rtnl_dereference(mp->next);
 	}
 
 	/* Create a new mapping then. */
-	mp = vlan->egress_priority_map[skb_prio & 0xF];
 	np = kmalloc(sizeof(struct vlan_priority_tci_mapping), GFP_KERNEL);
 	if (!np)
 		return -ENOBUFS;
 
-	np->next = mp;
 	np->priority = skb_prio;
 	np->vlan_qos = vlan_qos;
-	/* Before inserting this element in hash table, make sure all its fields
-	 * are committed to memory.
-	 * coupled with smp_rmb() in vlan_dev_get_egress_qos_mask()
-	 */
-	smp_wmb();
-	vlan->egress_priority_map[skb_prio & 0xF] = np;
+	RCU_INIT_POINTER(np->next, rtnl_dereference(vlan->egress_priority_map[bucket]));
+	rcu_assign_pointer(vlan->egress_priority_map[bucket], np);
 	if (vlan_qos)
 		vlan->nr_egress_mappings++;
 	return 0;
@@ -616,11 +611,17 @@ void vlan_dev_free_egress_priority(const struct net_device *dev)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(vlan->egress_priority_map); i++) {
-		while ((pm = vlan->egress_priority_map[i]) != NULL) {
-			vlan->egress_priority_map[i] = pm->next;
-			kfree(pm);
+		pm = rtnl_dereference(vlan->egress_priority_map[i]);
+		RCU_INIT_POINTER(vlan->egress_priority_map[i], NULL);
+		while (pm) {
+			struct vlan_priority_tci_mapping *next;
+
+			next = rtnl_dereference(pm->next);
+			kfree_rcu(pm, rcu);
+			pm = next;
 		}
 	}
+	vlan->nr_egress_mappings = 0;
 }
 
 static void vlan_dev_uninit(struct net_device *dev)
diff --git a/net/8021q/vlan_netlink.c b/net/8021q/vlan_netlink.c
index a000b1ef0520..a5b16833e2ce 100644
--- a/net/8021q/vlan_netlink.c
+++ b/net/8021q/vlan_netlink.c
@@ -260,13 +260,15 @@ static int vlan_fill_info(struct sk_buff *skb, const struct net_device *dev)
 			goto nla_put_failure;
 
 		for (i = 0; i < ARRAY_SIZE(vlan->egress_priority_map); i++) {
-			for (pm = vlan->egress_priority_map[i]; pm;
-			     pm = pm->next) {
-				if (!pm->vlan_qos)
+			for (pm = rcu_dereference_rtnl(vlan->egress_priority_map[i]); pm;
+			     pm = rcu_dereference_rtnl(pm->next)) {
+				u16 vlan_qos = READ_ONCE(pm->vlan_qos);
+
+				if (!vlan_qos)
 					continue;
 
 				m.from = pm->priority;
-				m.to   = (pm->vlan_qos >> 13) & 0x7;
+				m.to   = (vlan_qos >> 13) & 0x7;
 				if (nla_put(skb, IFLA_VLAN_QOS_MAPPING,
 					    sizeof(m), &m))
 					goto nla_put_failure;
diff --git a/net/8021q/vlanproc.c b/net/8021q/vlanproc.c
index fa67374bda49..0e424e0895b7 100644
--- a/net/8021q/vlanproc.c
+++ b/net/8021q/vlanproc.c
@@ -262,15 +262,19 @@ static int vlandev_seq_show(struct seq_file *seq, void *offset)
 		   vlan->ingress_priority_map[7]);
 
 	seq_printf(seq, " EGRESS priority mappings: ");
+	rcu_read_lock();
 	for (i = 0; i < 16; i++) {
-		const struct vlan_priority_tci_mapping *mp
-			= vlan->egress_priority_map[i];
+		const struct vlan_priority_tci_mapping *mp =
+			rcu_dereference(vlan->egress_priority_map[i]);
 		while (mp) {
+			u16 vlan_qos = READ_ONCE(mp->vlan_qos);
+
 			seq_printf(seq, "%u:%d ",
-				   mp->priority, ((mp->vlan_qos >> 13) & 0x7));
-			mp = mp->next;
+				   mp->priority, ((vlan_qos >> 13) & 0x7));
+			mp = rcu_dereference(mp->next);
 		}
 	}
+	rcu_read_unlock();
 	seq_puts(seq, "\n");
 
 	return 0;

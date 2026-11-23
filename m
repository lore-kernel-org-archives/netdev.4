Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428685;
	b=284VwCYnJG+1CAx/iRhXH9D6NNl7tyW9LYNrpX7wHAvZF1LdzdT2P324BklR/2CjeJ9k
	 dFzvu2jNmDjU8tGzUpyNvbBrZhovqBxDmm3lh0yFiFx6PODyxT4sGkGrLnRNV6myYlUms
	 yEZOLKwj8sRMt0sped3lEdsM2N7vjghubFHb0+4Og1K5Lo8gYGhn61kyNsAXDT4gG8KBf
	 GvbETmEQbqEnhPnW7AGNOqWXbSfFBxV7YKCBlKkfv6s3kY4gnHBWsl0ziIPJ5zm40kq1x
	 RJDzyiTMZ3LYvmyLXDceDTvFzW8kFmn+8EBrCdgqJXWDO01dRULfXsbOIL3opM3315g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428685;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Chdr0V3w3xFh/z+Zc7OkuSNZnyVbkhm2zDu+1+DTc28=;
	b=Dfz1EZ36KVKEOcI9ZHXfmVtGayzo5znCK0mnbqTMsvKjyLOFstdtE1qCf8JZVib1M+Rp
	 TG72CnfZuVftaeGZV2YwfjifDVRwbnrYRcmKx1QejIOeGLsHRZHFFuLtWkNDYszudRvUa
	 W0WfKwDxa77pfbfDppPXd/v3Xxehv8uFK4rHHyFJkWB0cTmylE2rxse2PGIZ7VY1Wv3VX
	 DCjYKXBrdqlRBTIpPlwZicmNjhgPewr5KyU97Cz7GlUoJydUbrZHT29jWXghIrxwPpAYd
	 U7oviScl2vp0gBE/2+x+pOoqHOfDmyEKPLCZcrKUdlibPxNnDw6Du8JmFCRDC5YDtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Su2xX1EF;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768E606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C768E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Su2xX1EF
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so1554798a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428684; x=1796033484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Chdr0V3w3xFh/z+Zc7OkuSNZnyVbkhm2zDu+1+DTc28=;
        b=zQZnnmJ1IjnyTNrVmmitZ9eyVeKnzaVm35Poqde3hohxpGZVKRMaJV/QEOEumDG4hL
         lyvrFneu/wIQKKpPlf4aGL3/iYwPlR0trLCx+mfui0Z8DkM4DhZKGx5rC3za9Fb1EUhh
         tA75fg/kalDMmyFTW70y1kt4OoMcs5Q7s9sUm2pum0RJRxFTFUfwiRsQecsIRAOBMidC
         WDwMrlnbLdeW79g9lchhPQ3uZ/eLSBs8io265fwT1m5pSCNBwrsD7b3M5Z0PUD2Jl3Hs
         K98MPBXxUAhlIlok/GoK/etN0YTS2agExLUoJGnTkg/orgEOuv59PWKw5UsUhZbfIKeG
         cihA==
X-Gm-Message-State: APuU4Z+2DEGURimvPL1xrFM/L4qTJsAi+KF3fbF0nE0neHueYfpQMMaJ
	scaszMNfczK9iz/t/u2PX35c7l8mpRQBH+vvycthIrxvATPhnJWWwn7gHuTxQlmNmF6MLIEI8m0
	BBlzKdeVrDS9FNgss8xfiQDGcdmZJ/MsLE9jubzkr5+rmre+ptYt/Fb5LZ4JZI15LMBKCRhd/0h
	+NXGc+A6HzmdM1N2/oj73Vweh09rOVvnURWw1SRF8cROc3TE1klVLApaILk+1tvqItXcyZwBfop
	IugE0eYbA==
X-Gm-Gg: AZFdTZegc0N3poXl9+3W4XntaRbiGxTGxc8feQGzrSNIKzI8J4CXiera8jBw7aBh/gF
	EcHqvMFFD9UBY2xxXI4aVMNdPh/Vp14kDRs+M6gIB9baresUhkLYhisnhc2id6Y0DO8Dm1ljdx+
	Ma5ZNoOYCo0z+yb0tthy4+clcS3OkYMC+hIbAXidun2B1kYJPN5y9P7mQqmn70MPdsNf0Zn0KPP
	RNA+MhCJK+MMYzcSQA3nB1Qi6WWwPH27zRHUELh86xEimdx7PDLYzrQtu+RXq36dTwNmnL40rN3
	jzWEjV4G1rikVDbE+UoHaXQTGKZCGW/fQzMwHO2UyLFgk8CQ+kJKdRAGcZaXzNvY8qdA9H+74eu
	czEKXDfTgPMi6+fIg4EAvy6hfeoNIWykSRHK7EhqydZ+RMXEcRf++fk/O6evxfvQS7gHA623JyL
	6vkUg9GJdR3zcz3wRkN0NNPqe9vys48YZt0DVd
X-Received: by 2002:a17:90b:1d03:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3b41c5574f0mr10278858a91.0.1795428683970;
        Mon, 23 Nov 2026 02:11:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm8917212a91.1.2026.11.23.02.11.23
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:11:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so894991eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795428682; x=1796033482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Chdr0V3w3xFh/z+Zc7OkuSNZnyVbkhm2zDu+1+DTc28=;
        b=Su2xX1EFfD7WToxG4285p/yPa/E3wvNffxGGl+h7eC0HG0IlKT0W6CrgDP895mf2Lp
         Fl6ENbFWJNpFXuEXbrssTFlcxcmR3s5Tnww3uXtLMBlC5wugpEuERLw/hxenFir/vBds
         fd4gUa7PRyEq4UvU6bx+RqAzhizY8IhTEUskw=
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr13677058eec.3.1795428681933;
        Mon, 23 Nov 2026 02:11:21 -0800 (PST)
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr13677016eec.3.1795428681116;
        Mon, 23 Nov 2026 02:11:21 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm1084358eec.9.2026.11.23.02.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:11:20 -0800 (PST)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v9 09/10] bnge: add aRFS flow steering ndo support
Date: Mon, 23 Nov 2026 15:37:45 +0530
Message-ID: <20261123100746.1975030-10-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-1-vikas.gupta@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Introduce the ndo_rx_flow_steer callback (bnge_rx_flow_steer) to
support aRFS.

This callback creates an NTUPLE filter that steers matching packets
to the appropriate RX queue. The implementation dissects flow keys
from the SKB, creates an NTUPLE filter with the associated L2 filter,
inserts it into the NTUPLE hash table, and schedules the sp_task
workqueue via BNGE_RX_NTP_FLTR_SP_EVENT to program the filter
in the firmware.

Add bnge_cfg_ntp_filters() called from the periodic timer via sp_task
to handle deferred filter programming and expiration via
rps_may_expire_flow().

bnge_timer() queues aRFS aging only while NTUPLE is enabled. NTUPLE
can only be turned off with the interface closed, and
bnge_close_core() then deletes the timer and purges dynamic
aRFS filters.

An aRFS rule records the L2 filter it is bound to by key (MAC and
VLAN), and so does a user ntuple rule. The firmware id of the L2
filter changes whenever the filter is recreated, for example on open
or after a unicast address list change, so the id is only used to
program the rule: sp_task looks it up again from the key just before
it programs an aRFS rule, and drops the rule if the L2 filter is gone.

The patch also changes the existing ethtool n-tuple code:
  - bnge_fltr_match() compares l2_key and not l2_filter_id.
  - bnge_add_ntuple_cls_rule() and bnge_cfg_one_usr_fltr() set l2_key;
    the latter does it together with l2_filter_id, under
    ntp_fltr_lock.
  - bnge_get_all_fltr_ids_rcu() and bnge_get_one_fltr_rcu() select
    user rules with bnge_is_usr_fltr(), which is no longer static,
    and not with fltr->flags.
  - bnge_del_ntp_filter_rcu() uses hlist_del_init_rcu().

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c |   6 +-
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 133 ++++++++++++++-
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  12 +-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   2 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 152 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   1 +
 6 files changed, 296 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 77edcd564b61..7b1b1a188013 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -1272,7 +1272,7 @@ static int bnge_get_all_fltr_ids_rcu(struct bnge_net *bn,
 
 		head = &tbl[i];
 		hlist_for_each_entry_rcu(fltr, head, hlist) {
-			if (!fltr->flags ||
+			if (!bnge_is_usr_fltr(fltr) ||
 			    test_bit(BNGE_FLTR_FW_DELETED, &fltr->state))
 				continue;
 			if (j == id_cnt)
@@ -1296,7 +1296,8 @@ static struct bnge_filter_base *bnge_get_one_fltr_rcu(struct bnge_net *bn,
 
 		head = &tbl[i];
 		hlist_for_each_entry_rcu(fltr, head, hlist) {
-			if (fltr->flags && fltr->sw_id + offset == id)
+			if (bnge_is_usr_fltr(fltr) &&
+			    fltr->sw_id + offset == id)
 				return fltr;
 		}
 	}
@@ -1535,6 +1536,7 @@ static int bnge_add_ntuple_cls_rule(struct bnge_net *bn,
 
 	l2_fltr = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
 	new_fltr->l2_filter_id = l2_fltr->base.filter_id;
+	new_fltr->l2_key = l2_fltr->l2_key;
 	fmasks = &new_fltr->fmasks;
 	fkeys = &new_fltr->fkeys;
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index 639c36d571f2..b7261018216b 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
@@ -56,7 +56,7 @@ const struct bnge_flow_masks BNGE_FLOW_IPV4_MASK_ALL = {
 	},
 };
 
-static bool bnge_is_usr_fltr(struct bnge_filter_base *fltr)
+bool bnge_is_usr_fltr(struct bnge_filter_base *fltr)
 {
 	return (fltr->type == BNGE_FLTR_TYPE_L2 &&
 		fltr->flags & BNGE_ACT_RING_DST) ||
@@ -116,7 +116,7 @@ void bnge_del_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *nfltr)
 	hlist_del(&fltr->hlist);
 	bnge_del_usr_fltr_node(bn, fltr);
 	clear_bit(fltr->sw_id, bn->ntp_fltr_bmap);
-	bn->ntp_fltr_count--;
+	WRITE_ONCE(bn->ntp_fltr_count, bn->ntp_fltr_count - 1);
 	kfree(fltr);
 }
 
@@ -124,10 +124,10 @@ void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
 			     struct bnge_ntuple_filter *fltr)
 {
 	spin_lock_bh(&bn->ntp_fltr_lock);
-	hlist_del_rcu(&fltr->base.hlist);
+	hlist_del_init_rcu(&fltr->base.hlist);
 	bnge_del_usr_fltr_node(bn, &fltr->base);
 	clear_bit(fltr->base.sw_id, bn->ntp_fltr_bmap);
-	bn->ntp_fltr_count--;
+	WRITE_ONCE(bn->ntp_fltr_count, bn->ntp_fltr_count - 1);
 	spin_unlock_bh(&bn->ntp_fltr_lock);
 
 	kfree_rcu(fltr, base.rcu);
@@ -208,6 +208,16 @@ __le64 bnge_lookup_l2_filter_rcu(struct bnge_net *bn,
 	return id;
 }
 
+__le64 bnge_lookup_l2_filter_from_key(struct bnge_net *bn,
+				      struct bnge_l2_key *key)
+{
+	u32 idx;
+
+	idx = jhash2(&key->filter_key, BNGE_L2_KEY_SIZE, bn->hash_seed) &
+	      BNGE_L2_FLTR_HASH_MASK;
+	return bnge_lookup_l2_filter_rcu(bn, key, idx);
+}
+
 static struct bnge_l2_filter *bnge_alloc_l2_filter(struct bnge_net *bn,
 						   struct bnge_l2_key *key,
 						   gfp_t gfp)
@@ -497,12 +507,17 @@ static bool bnge_fltr_match(struct bnge_ntuple_filter *f1,
 			return false;
 	}
 
+	/* Compare the L2 filter by key, not by firmware id: the id changes on
+	 * every open, the key does not.
+	 */
 	return keys1->ports.src == keys2->ports.src &&
 	       masks1->ports.src == masks2->ports.src &&
 	       keys1->ports.dst == keys2->ports.dst &&
 	       masks1->ports.dst == masks2->ports.dst &&
 	       keys1->control.flags == keys2->control.flags &&
-	       f1->l2_filter_id == f2->l2_filter_id;
+	       ether_addr_equal(f1->l2_key.dst_mac_addr,
+				f2->l2_key.dst_mac_addr) &&
+	       f1->l2_key.vlan == f2->l2_key.vlan;
 }
 
 int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
@@ -538,7 +553,7 @@ int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
 	hlist_add_head_rcu(&fltr->base.hlist, head);
 
 	bnge_insert_usr_fltr(bn, &fltr->base);
-	bn->ntp_fltr_count++;
+	WRITE_ONCE(bn->ntp_fltr_count, bn->ntp_fltr_count + 1);
 
 	spin_unlock_bh(&bn->ntp_fltr_lock);
 
@@ -643,7 +658,11 @@ static void bnge_cfg_one_usr_fltr(struct bnge_net *bn,
 	if (fltr->type == BNGE_FLTR_TYPE_NTUPLE) {
 		ntp_fltr = container_of(fltr, struct bnge_ntuple_filter, base);
 		l2_fltr = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
+		/* bnge_rx_flow_steer() can already run and match this rule */
+		spin_lock_bh(&bn->ntp_fltr_lock);
 		ntp_fltr->l2_filter_id = l2_fltr->base.filter_id;
+		ntp_fltr->l2_key = l2_fltr->l2_key;
+		spin_unlock_bh(&bn->ntp_fltr_lock);
 		if (bnge_usr_fltr_ring_lost(bn, fltr) ||
 		    bnge_hwrm_cfa_ntuple_filter_alloc(bn->bd, ntp_fltr)) {
 			netdev_err(bn->netdev,
@@ -716,3 +735,105 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
 		}
 	}
 }
+
+void bnge_cfg_ntp_filters(struct bnge_net *bn)
+{
+#ifdef CONFIG_RFS_ACCEL
+	struct bnge_ntuple_filter *fltr, *tmp;
+	LIST_HEAD(install_list);
+	LIST_HEAD(update_list);
+	LIST_HEAD(expire_list);
+	__le64 l2_id;
+	u32 flow_id;
+	int i, rc;
+	u16 rxq;
+
+	rcu_read_lock();
+	for (i = 0; i < BNGE_NTP_FLTR_HASH_SIZE; i++) {
+		hlist_for_each_entry_rcu(fltr, &bn->ntp_fltr_hash_tbl[i],
+					 base.hlist) {
+			if (test_bit(BNGE_FLTR_VALID, &fltr->base.state)) {
+				if (fltr->base.flags & BNGE_ACT_NO_AGING)
+					continue;
+				if (test_and_clear_bit(BNGE_FLTR_RXQ_UPDATE,
+						       &fltr->base.state)) {
+					list_add(&fltr->base.list_node,
+						 &update_list);
+					continue;
+				}
+				rxq = READ_ONCE(fltr->base.rxq);
+				flow_id = READ_ONCE(fltr->flow_id);
+				if (rps_may_expire_flow(bn->netdev, rxq,
+							flow_id,
+							fltr->base.sw_id))
+					list_add(&fltr->base.list_node,
+						 &expire_list);
+			} else {
+				clear_bit(BNGE_FLTR_RXQ_UPDATE,
+					  &fltr->base.state);
+				/* Order the clear before the rxq read in
+				 * the install below.
+				 */
+				smp_mb__after_atomic();
+				list_add(&fltr->base.list_node, &install_list);
+			}
+		}
+	}
+	rcu_read_unlock();
+
+	/* Free the old HW rule; reinstall it below on the new queue. */
+	list_for_each_entry_safe(fltr, tmp, &update_list, base.list_node) {
+		list_del_init(&fltr->base.list_node);
+		/* If the free fails the rule stays on the old queue. It is not
+		 * retried, so a firmware that keeps failing is not hit on every
+		 * tick.
+		 */
+		if (bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr))
+			continue;
+		clear_bit(BNGE_FLTR_FW_DELETED, &fltr->base.state);
+		list_add(&fltr->base.list_node, &install_list);
+	}
+
+	list_for_each_entry_safe(fltr, tmp, &install_list, base.list_node) {
+		list_del_init(&fltr->base.list_node);
+		/* The firmware id of the L2 filter changes whenever the filter
+		 * is recreated, so look it up again from the key before
+		 * programming the rule.
+		 */
+		l2_id = bnge_lookup_l2_filter_from_key(bn, &fltr->l2_key);
+		if (l2_id == BNGE_FLTR_ID_INVALID) {
+			bnge_del_ntp_filter_rcu(bn, fltr);
+			continue;
+		}
+		fltr->l2_filter_id = l2_id;
+		rc = bnge_hwrm_cfa_ntuple_filter_alloc(bn->bd, fltr);
+		if (rc)
+			bnge_del_ntp_filter_rcu(bn, fltr);
+		else
+			set_bit(BNGE_FLTR_VALID, &fltr->base.state);
+	}
+
+	list_for_each_entry_safe(fltr, tmp, &expire_list, base.list_node) {
+		list_del_init(&fltr->base.list_node);
+		/* Decide again under ntp_fltr_lock: the scan ran without it and
+		 * the firmware calls above can take long. Use the rxq and
+		 * flow_id that bnge_rx_flow_steer() writes under it. Unlink
+		 * here too, so a flow cannot be retargeted onto a filter that
+		 * is about to be freed. The firmware free comes after the
+		 * unlock.
+		 */
+		spin_lock_bh(&bn->ntp_fltr_lock);
+		if (test_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state) ||
+		    !rps_may_expire_flow(bn->netdev, fltr->base.rxq,
+					 fltr->flow_id, fltr->base.sw_id)) {
+			spin_unlock_bh(&bn->ntp_fltr_lock);
+			continue;
+		}
+		hlist_del_init_rcu(&fltr->base.hlist);
+		spin_unlock_bh(&bn->ntp_fltr_lock);
+
+		bnge_hwrm_cfa_ntuple_filter_free(bn->bd, fltr);
+		bnge_del_ntp_filter_rcu(bn, fltr);
+	}
+#endif
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
index 27fab050565e..f87d229a31cd 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_filter.h
@@ -19,7 +19,8 @@ enum {
 
 enum {
 	BNGE_FLTR_VALID,
-	BNGE_FLTR_FW_DELETED
+	BNGE_FLTR_FW_DELETED,
+	BNGE_FLTR_RXQ_UPDATE
 };
 
 enum {
@@ -88,6 +89,11 @@ struct bnge_ntuple_filter {
 	struct bnge_filter_base	base;
 	struct flow_keys	fkeys;
 	struct bnge_flow_masks	fmasks;
+	/* Key of the L2 filter the rule is bound to. It identifies the filter
+	 * across close/open, unlike l2_filter_id, which is reassigned by
+	 * firmware on every open and is only used to program the rule.
+	 */
+	struct bnge_l2_key	l2_key;
 	__le64			l2_filter_id;
 	u32			flow_id;
 };
@@ -97,6 +103,7 @@ struct bnge_ntuple_filter {
 #define BNGE_FLTR_ID_INVALID	cpu_to_le64(0xffffffffffffffffULL)
 
 void bnge_free_ntp_fltrs(struct bnge_net *bn, bool skip_user_filters);
+bool bnge_is_usr_fltr(struct bnge_filter_base *fltr);
 u32 bnge_get_ntp_filter_idx(struct bnge_net *bn, struct flow_keys *fkeys,
 			    const struct sk_buff *skb);
 int bnge_insert_ntp_filter(struct bnge_net *bn, struct bnge_ntuple_filter *fltr,
@@ -110,6 +117,8 @@ void bnge_del_usr_l2_filter(struct bnge_net *bn, struct bnge_l2_filter *fltr);
 __le64 bnge_lookup_l2_filter_rcu(struct bnge_net *bn,
 				 struct bnge_l2_key *key,
 				 u32 idx);
+__le64 bnge_lookup_l2_filter_from_key(struct bnge_net *bn,
+				      struct bnge_l2_key *key);
 void bnge_free_l2_filters(struct bnge_net *bn);
 int bnge_hwrm_set_vnic_filter(struct bnge_net *bn, u16 vnic_id, u16 idx,
 			      const u8 *mac_addr);
@@ -124,4 +133,5 @@ void bnge_del_ntp_filter_rcu(struct bnge_net *bn,
 void bnge_cfg_usr_fltrs(struct bnge_net *bn);
 void bnge_clear_usr_fltrs(struct bnge_net *bn);
 bool bnge_has_usr_ntp_fltr(struct bnge_net *bn);
+void bnge_cfg_ntp_filters(struct bnge_net *bn);
 #endif /* _BNGE_FILTER_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index 983f1b67df1f..4d535fdef2fa 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -986,8 +986,8 @@ bnge_cfg_rfs_ring_tbl_idx(struct bnge_dev *bd,
 			  struct bnge_ntuple_filter *fltr)
 {
 	struct bnge_net *bn = netdev_priv(bd->netdev);
+	u32 rxq = READ_ONCE(fltr->base.rxq);
 	struct bnge_vnic_info *def_vnic;
-	u32 rxq = fltr->base.rxq;
 	u32 enables;
 
 	if (fltr->base.flags & BNGE_ACT_RSS_CTX) {
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 44637152b075..de7320521a3e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -303,6 +303,12 @@ static void bnge_timer(struct timer_list *t)
 	if (BNGE_LINK_IS_UP(bd) && bn->stats_coal_ticks)
 		bnge_queue_sp_work(bn, BNGE_PERIODIC_STATS_SP_EVENT);
 
+#ifdef CONFIG_RFS_ACCEL
+	if ((bn->priv_flags & BNGE_NET_EN_NTUPLE) &&
+	    READ_ONCE(bn->ntp_fltr_count))
+		bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+#endif
+
 	mod_timer(&bn->timer, jiffies + bn->current_interval);
 }
 
@@ -444,6 +450,9 @@ static void bnge_sp_task(struct work_struct *work)
 			bnge_init_ethtool_link_settings(bn);
 	}
 
+	if (test_and_clear_bit(BNGE_RX_NTP_FLTR_SP_EVENT, &bn->sp_event))
+		bnge_cfg_ntp_filters(bn);
+
 	netdev_unlock(bn->netdev);
 }
 
@@ -3433,6 +3442,146 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)
 	return 0;
 }
 
+#ifdef CONFIG_RFS_ACCEL
+/* Called with ntp_fltr_lock held. Returns true if sp_task must be queued. */
+static bool bnge_ntp_fltr_retarget(struct bnge_net *bn,
+				   struct bnge_ntuple_filter *fltr,
+				   u16 rxq_index, u32 flow_id)
+{
+	if ((fltr->base.flags & BNGE_ACT_NO_AGING) ||
+	    READ_ONCE(fltr->base.rxq) == rxq_index)
+		return false;
+
+	WRITE_ONCE(fltr->base.rxq, rxq_index);
+	WRITE_ONCE(fltr->flow_id, flow_id);
+	/* Pairs with test_and_clear_bit() in sp_task */
+	smp_mb__before_atomic();
+	set_bit(BNGE_FLTR_RXQ_UPDATE, &fltr->base.state);
+	return true;
+}
+
+static int bnge_rx_flow_steer(struct net_device *dev, const struct sk_buff *skb,
+			      u16 rxq_index, u32 flow_id)
+{
+	struct ethhdr *eth = (struct ethhdr *)skb_mac_header(skb);
+	struct bnge_ntuple_filter *fltr, *new_fltr;
+	struct bnge_net *bn = netdev_priv(dev);
+	struct flow_keys *fkeys;
+	__le64 filter_id;
+	u32 flags, idx;
+	int rc = 0;
+
+	/* Hold rcu_read_lock() across the L2 filter lookup and check
+	 * BNGE_STATE_OPEN inside it. bnge_close_core() clears the
+	 * flag before bnge_shutdown_nic() frees the L2 filters via
+	 * kfree_rcu(), so if we observe the device open here the
+	 * filter cannot be freed under us for the duration of
+	 * this critical section.
+	 */
+	rcu_read_lock();
+	if (!test_bit(BNGE_STATE_OPEN, &bn->bd->state)) {
+		rcu_read_unlock();
+		return -EINVAL;
+	}
+
+	if (ether_addr_equal(dev->dev_addr, eth->h_dest)) {
+		struct bnge_vnic_info *vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
+		struct bnge_l2_filter *l2_filter;
+
+		if (!vnic->uc_filter_count) {
+			rcu_read_unlock();
+			return -EINVAL;
+		}
+		l2_filter = vnic->l2_filters[0];
+		filter_id = l2_filter->base.filter_id;
+	} else {
+		struct bnge_l2_key key;
+
+		ether_addr_copy(key.dst_mac_addr, eth->h_dest);
+		key.vlan = 0;
+
+		filter_id = bnge_lookup_l2_filter_from_key(bn, &key);
+		if (filter_id == BNGE_FLTR_ID_INVALID) {
+			rcu_read_unlock();
+			return -EINVAL;
+		}
+	}
+	rcu_read_unlock();
+
+	new_fltr = kzalloc_obj(*new_fltr, GFP_ATOMIC);
+	if (!new_fltr)
+		return -ENOMEM;
+
+	fkeys = &new_fltr->fkeys;
+	if (!skb_flow_dissect_flow_keys(skb, fkeys, 0)) {
+		rc = -EPROTONOSUPPORT;
+		goto err_free;
+	}
+
+	if ((fkeys->basic.n_proto != htons(ETH_P_IP) &&
+	     fkeys->basic.n_proto != htons(ETH_P_IPV6)) ||
+	    (fkeys->basic.ip_proto != IPPROTO_TCP &&
+	     fkeys->basic.ip_proto != IPPROTO_UDP)) {
+		rc = -EPROTONOSUPPORT;
+		goto err_free;
+	}
+	new_fltr->fmasks = BNGE_FLOW_IPV4_MASK_ALL;
+	if (fkeys->basic.n_proto == htons(ETH_P_IPV6))
+		new_fltr->fmasks = BNGE_FLOW_IPV6_MASK_ALL;
+
+	flags = fkeys->control.flags;
+	if (flags & FLOW_DIS_IS_FRAGMENT) {
+		rc = -EPROTONOSUPPORT;
+		goto err_free;
+	}
+
+	new_fltr->l2_filter_id = filter_id;
+	/* Both branches above look the L2 filter up by eth->h_dest, vlan 0 */
+	ether_addr_copy(new_fltr->l2_key.dst_mac_addr, eth->h_dest);
+	new_fltr->l2_key.vlan = 0;
+
+	idx = bnge_get_ntp_filter_idx(bn, fkeys, skb);
+	rcu_read_lock();
+	fltr = bnge_lookup_ntp_filter_from_idx(bn, new_fltr, idx);
+	/* Filter already exists. If the flow moved to another queue,
+	 * retarget it, sp_task reprograms it in hardware.
+	 */
+	if (fltr) {
+		bool kick = false;
+
+		spin_lock_bh(&bn->ntp_fltr_lock);
+		/* sp_task unlinked it to expire it, treat it as not found */
+		if (hlist_unhashed(&fltr->base.hlist)) {
+			fltr = NULL;
+		} else {
+			kick = bnge_ntp_fltr_retarget(bn, fltr, rxq_index,
+						      flow_id);
+			rc = fltr->base.sw_id;
+		}
+		spin_unlock_bh(&bn->ntp_fltr_lock);
+		if (kick)
+			bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+		if (fltr) {
+			rcu_read_unlock();
+			goto err_free;
+		}
+	}
+	rcu_read_unlock();
+
+	new_fltr->flow_id = flow_id;
+	new_fltr->base.rxq = rxq_index;
+	rc = bnge_insert_ntp_filter(bn, new_fltr, idx);
+	if (!rc) {
+		bnge_queue_sp_work(bn, BNGE_RX_NTP_FLTR_SP_EVENT);
+		return new_fltr->base.sw_id;
+	}
+
+err_free:
+	kfree(new_fltr);
+	return rc;
+}
+#endif
+
 static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_open		= bnge_open,
 	.ndo_stop		= bnge_close,
@@ -3442,6 +3591,9 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_features_check	= bnge_features_check,
 	.ndo_fix_features	= bnge_fix_features,
 	.ndo_set_features	= bnge_set_features,
+#ifdef CONFIG_RFS_ACCEL
+	.ndo_rx_flow_steer	= bnge_rx_flow_steer,
+#endif
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index e0efd0d35061..73879ba7f129 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -283,6 +283,7 @@ enum bnge_sp_event {
 	BNGE_LINK_CFG_CHANGE_SP_EVENT,
 	BNGE_UPDATE_PHY_SP_EVENT,
 	BNGE_PERIODIC_STATS_SP_EVENT,
+	BNGE_RX_NTP_FLTR_SP_EVENT,
 };
 
 #define BNGE_NTP_FLTR_HASH_SIZE	512
-- 
2.52.0


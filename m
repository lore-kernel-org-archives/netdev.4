Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838124;
	b=zEf0QKlmFcN30v/JInMgx/OOjLN4xcsDrXPl/1hMSgWCQ+IS4iXkt/RxVT60ElqaW3da
	 3XEUNtzu0mpT2XxRAv9R5dyZSrN6yo+PX6G8KeWnxSmKB6RXEbDAm9IbSVp5+aqYt5XZO
	 EXQ3sQXfB9Pvx7RgDHwRqrG7KSuXuXDky5Jz1FT05pqeryeUI3Vsp0R/E5tBuo4VlFzwU
	 DOUnSR4JnYqJpviN5xupVrXAvwppIzVXeRcYYxtkyJRWXJvceF2m7yN4smNGhq9fbXEgl
	 bmd2leGEUyhmCvglSSvAW9FGrWBCFugEUe1zhiH7zdbLwZUFP7gugCgjCjlz+dpdaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Bm/IC/2BJOhpNniLW5fyORj425ZY4rcbJAFzsUGIMDk=;
	b=XqUKB6YDiv76eTf1xsWHLPmzdcivzTaOypgyRSi+VFEx2W5sREuBC3Y6gIn1WvTdYBk6
	 bPUBi42Ekdo81MYasLJvHqX8iz7SO0uwuToi87GtBQkZRypzKdTFDrf63xU9U9lEZHWSm
	 7wC2D0epx0StVZTe9eJXlzX7rkwl/pfFZs9pZKFB0+XN4akMic70X6DqQe9xQrRE4y0v0
	 ZzG8ADg2z+fYBhZ2g9M+taX/A8GVNErV1vNR8EOdUnP11wANagX2qzcUqT2PXCp1DkRJX
	 9xptUbQeekBBPdTXHBza9AyTIMjfrb3yx/h6T/eEpFIIk4Udz3QQhSw41LbD0DmIuCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EwjxKKr3;
	arc=none smtp.remote-ip=209.85.222.99
Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E790606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E790606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EwjxKKr3
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-99e0082c434so357303241.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838123; x=1795442923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bm/IC/2BJOhpNniLW5fyORj425ZY4rcbJAFzsUGIMDk=;
        b=kESBrv/xpc7kX1hCZ4q8Lb20Ky0EPS+6jh+xFJNn+fVWktdlPBVlKsqjVQNcm5KD5f
         KjM9OnHFC4c8texnhrJzhs/Bwst6bnu86LSIZWqOtZWyQjoG4jAefphHfRW85zR4XDll
         qdfIaM7kHjBZOWV9KGh5QNfUtzdD6THVNs55zz0CejtcpI+m+x3eWbTvpQViySjQDCWV
         trJceU0qIRRQbdQ1oA0EppPKkQLhDAKNUfkd0m8reNpVSB8V2B/QEuvq7lf/afgnJbad
         tTUOsvECOJhkTcvnUjOgswWSK1ltDGdArDXGsYVthojFRfusKdsEjVDPpgsdhYohhrFG
         gIUA==
X-Gm-Message-State: APuU4Z9icZGlWxT54QuBL0LRYAFmyvnhxRhQxo1kEiRcWN+slTb0owHC
	TRLppq9025YFI7rtb3vJKdpMmRIdt9AvkYQFfhSdd6CvL/r47Pzez1Qq0h9d8D8j7F9FydpAAhY
	XblCHQ+MdYm85e8QDsGAi4oqQb76joufM+cSYCtAUwFfFBwmv1esyW2+hV097zdg3Ie6tjm0Teq
	CdMqjET8jGbVAp08fcbRE724jtg86b8cX79vRFgm2piRu5l8XZQnLAMdqQMVW2I2/df9nEQtLTx
	5mtMyILhw==
X-Gm-Gg: AYBFou2gKVmeUbZc6bUkeOvdNzd9w+yqAN8+u9bu39EZvLF6OqMvHtSv7ihH1lP9Ntk
	7Ps/rFqF9XKb+JrBT4Q8DqlVZ0I7j/SVtcPkJV+Uic2jF9FFhnuwtDXrql1TNGUrRFUqZLjZE+J
	WnkgxjRx/RPLMz9ZTQ6IdHUIyoECj8gMpk9V4ZZXvl82NtRtZ1qLdAYzJPjmh2i2L4Ag9KCSzDW
	hMErgVBzIvYkugcMVvNQF7IlDZ8JwOjK6HlGqCygJ/El+u/15IoFUgx2UoNc20GtZlfTTCqUnjI
	zCVUiYWyNRRP0z6HtFS3pRVuwImZCtfiMcdqwhNNQ5DqEwipUJdCt8SE1dGQXsVZWALJs/odDQY
	LdKXnUG9kHrVAbZD9vT8xVkBSAi+oyfW8D+As9fpczunll3wYtYGXoawOSs71CaJ8sFQVOcBSce
	JgeA26LFg0UwC7011GN/h6k8+pZykoZz6MqOXR
X-Received: by 2002:a05:6122:1d04:b0:5ec:b4ec:e93f with SMTP id 71dfb90a1353d-5ee34a7da36mr3347852e0c.10.1794838122297;
        Mon, 16 Nov 2026 06:08:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c8d351264sm917472241.18.2026.11.16.06.08.41
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:08:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so4348950c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794838121; x=1795442921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bm/IC/2BJOhpNniLW5fyORj425ZY4rcbJAFzsUGIMDk=;
        b=EwjxKKr327ZcQ81lJOrlnieCOxxhmTcw9WX7dykZRcxBK9hXNEa/bZl6LqRV/edqz3
         DH5OI9IvCWihdRuzDUvb9Xz+Fqq+KJnNuHh6SoKJ5iAaMJsjASBcmHIUkM/DXvxduU8o
         gHTNlnP0xO6uIdUzAuAOuWUaLTvW+QrsMwg1E=
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr5070919c88.42.1794838120748;
        Mon, 16 Nov 2026 06:08:40 -0800 (PST)
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr5070856c88.42.1794838119764;
        Mon, 16 Nov 2026 06:08:39 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm35251269c88.14.2026.11.16.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:08:37 -0800 (PST)
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
Subject: [PATCH net-next v8 09/10] bnge: add aRFS flow steering ndo support
Date: Mon, 16 Nov 2026 19:36:52 +0530
Message-ID: <20261116140653.1685797-10-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
References: <20261116140653.1685797-1-vikas.gupta@broadcom.com>
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

Note that, if the L2 filter is freed before sp_task programs the rule,
the captured firmware id is stale. The NTUPLE alloc either fails (id
gone) or binds to a recycled id for a different filter. The rule is
then dropped, or it stays until it ages out.

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
index ac93b0e123ad..6291e50bb969 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -1277,7 +1277,7 @@ static int bnge_get_all_fltr_ids_rcu(struct bnge_net *bn,
 
 		head = &tbl[i];
 		hlist_for_each_entry_rcu(fltr, head, hlist) {
-			if (!fltr->flags ||
+			if (!bnge_is_usr_fltr(fltr) ||
 			    test_bit(BNGE_FLTR_FW_DELETED, &fltr->state))
 				continue;
 			if (j == id_cnt)
@@ -1301,7 +1301,8 @@ static struct bnge_filter_base *bnge_get_one_fltr_rcu(struct bnge_net *bn,
 
 		head = &tbl[i];
 		hlist_for_each_entry_rcu(fltr, head, hlist) {
-			if (fltr->flags && fltr->sw_id + offset == id)
+			if (bnge_is_usr_fltr(fltr) &&
+			    fltr->sw_id + offset == id)
 				return fltr;
 		}
 	}
@@ -1540,6 +1541,7 @@ static int bnge_add_ntuple_cls_rule(struct bnge_net *bn,
 
 	l2_fltr = bn->vnic_info[BNGE_VNIC_DEFAULT].l2_filters[0];
 	new_fltr->l2_filter_id = l2_fltr->base.filter_id;
+	new_fltr->l2_key = l2_fltr->l2_key;
 	fmasks = &new_fltr->fmasks;
 	fkeys = &new_fltr->fkeys;
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_filter.c b/drivers/net/ethernet/broadcom/bnge/bnge_filter.c
index e2dc3a34cad3..a0a8aebad20b 100644
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
 
@@ -642,7 +657,11 @@ static void bnge_cfg_one_usr_fltr(struct bnge_net *bn,
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
@@ -715,3 +734,105 @@ void bnge_clear_usr_fltrs(struct bnge_net *bn)
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
index 305f0054742c..b80bd46b07ce 100644
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
index b71e427d3ba1..0e7c506af402 100644
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
 
@@ -3226,6 +3235,146 @@ static int bnge_set_features(struct net_device *dev, netdev_features_t features)
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
@@ -3235,6 +3384,9 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_features_check	= bnge_features_check,
 	.ndo_fix_features	= bnge_fix_features,
 	.ndo_set_features	= bnge_set_features,
+#ifdef CONFIG_RFS_ACCEL
+	.ndo_rx_flow_steer	= bnge_rx_flow_steer,
+#endif
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 2a1ec811de01..74dbca600cbe 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -282,6 +282,7 @@ enum bnge_sp_event {
 	BNGE_LINK_CFG_CHANGE_SP_EVENT,
 	BNGE_UPDATE_PHY_SP_EVENT,
 	BNGE_PERIODIC_STATS_SP_EVENT,
+	BNGE_RX_NTP_FLTR_SP_EVENT,
 };
 
 #define BNGE_NTP_FLTR_HASH_SIZE	512
-- 
2.52.0


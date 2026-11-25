Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647120;
	b=ayfrR6E84V2TZQUxV7bsjJgbJH5wFf2cZt8d5NlAjfQNYRhL2pzU6in1aLv+1Ov/ugTk
	 JU0ihMvanOFkr/tKKWk3C3M4yTU+TWdaCRDftnmKPKIOHFB5tYkhFxounhTcu4sYM4BiX
	 fltUhji1AJkwkB8z87Lthkmxixd8AgO1ybbgqMWn/vSVII4TKLDDgXKFCfw6Ze8V/9tjH
	 RNq0/ZeuUc/lF+liajD/7albu7wxBasv2hTFcjAFcnwFOi9N8yvBB3+pJy/hCnEXDfWil
	 KJXrzzfSGFfYlDK0axXMYKn6fWawwK74nQ277H3BBsIbk46WPnJ07IsyLZNgoNk2+aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=algrFJvJcW8F7zBuZYGn2Tokllub46qm8NNofOSiOBk=;
	b=yKR5Z6FSYnkoNM6nd+/QXM8YvlZdj38ECm49/I7odijlS6Dnn8OaBzTQLZWTrL3lcKKq
	 887qpLzWySJvretdOar9xIwm0L9bV11Vpv+Mrt1RfFMLbLAvtZC+7myrmNuCYHACV6rno
	 6bCN1BSl0pYT7/uk8kFYwOErK1htZp4CnoDFaT5DMhIXwTCGSTuTV2zfpQKcC+s0DvHxW
	 oJBahmA3PUAbDwUZnlTZuDL7Cn9e+2aYKyplyFA1h83/V4aaAXIhh9nJ690B9WE8h3ZxO
	 V+7ju0/SbCaNcbOm/pLI7aedu3wXZMDn9bzh7ewfAqoNcL8gANZsF9Q7CWaAalSskqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OyyUeUZI;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6A1606A69C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E6A1606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OyyUeUZI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795647119; x=1827183119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dBGs53hcYzMkJPfXBiGryL22ZqEG9mNS08Lw6/nVwFE=;
  b=OyyUeUZISowUcuXofQuE3WyCUVGE3S8OfLdG3etdB9KQvkeehrizh+wh
   BfHrtQiZBtauBH49eB6Nx+2X8D5ckc14PH6jwoaMUdLoWggy6yB3PC/N2
   IUthphO+zOu19mx+viQywndMgdP4oBMeZhOwwIUdRZRh5mv8kIBwwcHdz
   Pt/rKDx+ZfxuojWaE9KH2UR/A7uw8+9p2qdF0AXsqiQF+zFBHKIrqe5MS
   gcIwf51DjbiNA5X+K+MVZvxW7+8/Yw05lqoT7jy6OsVyvPhI9juo2/KZA
   B/IVhDgdAsTH6YyrYCY0dcoN19rKlWPxiSN++5PeTFovWWfQWxbQjrjQM
   g==;
X-CSE-ConnectionGUID: nquKTFv2TyanBuLuhkgIKw==
X-CSE-MsgGUID: q7VR0WMTSfClU9Dylr8lcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4450686"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4450686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:51:55 -0800
X-CSE-ConnectionGUID: kO/UA28eQ5W1Xuij1gLcUQ==
X-CSE-MsgGUID: DuFMK4XCRPC7uClA9c7wQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11996946"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 14:51:56 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	netdev@vger.kernel.org
Cc: Emil Tantilov <emil.s.tantilov@intel.com>,
	anthony.l.nguyen@intel.com,
	oss.patchbox@gmail.com,
	tianxun.ng@bytedance.com,
	richardcochran@gmail.com,
	milena.olech@intel.com,
	konstantin.ilichev@intel.com,
	Madhu Chittim <madhu.chittim@intel.com>,
	Naman Gulati <namangulati@google.com>,
	Samuel Salin <Samuel.salin@intel.com>
Subject: [PATCH net 5/6] idpf: fix use-after-free in the PTP auxiliary worker
Date: Wed, 25 Nov 2026 14:51:42 -0800
Message-ID: <20261125225145.4126333-6-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261125225145.4126333-1-anthony.l.nguyen@intel.com>
References: <20261125225145.4126333-1-anthony.l.nguyen@intel.com>
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

From: Emil Tantilov <emil.s.tantilov@intel.com>

idpf_ptp_update_cached_phctime() runs from the PTP auxiliary worker and
walks the Rx queues of every vport to refresh rxq->cached_phc_time. There
is a small window on down that can result in use-after-free, detected by
KASAN:

  BUG: KASAN: slab-use-after-free in idpf_ptp_update_cached_phctime+0x367/0x4a0 [idpf]
  Write of size 8 at addr ff11002146c2a4a0 by task ptp3/8084
  ...
  idpf_ptp_update_cached_phctime+0x367/0x4a0 [idpf]
  idpf_ptp_do_aux_work+0x37/0x50 [idpf]
  ptp_aux_kworker+0x64/0xd0
  kthread_worker_fn+0x289/0xa20
  ...
  Allocated by task 8615 on cpu 5 at 812.655509s:
  idpf_vport_queues_alloc+0x9e5/0x2580 [idpf]
  idpf_vport_open.constprop.0+0x12c/0x10f0 [idpf]
  idpf_open+0x1bb/0x230 [idpf]
  __dev_open+0x2f5/0x7c0
  ...
  Freed by task 8628 on cpu 10 at 814.925757s:
  idpf_rxq_group_rel.part.0+0xef/0x5a0 [idpf]
  idpf_vport_queues_rel+0xaf/0x140 [idpf]
  idpf_vport_stop+0x49e/0x850 [idpf]
  idpf_stop+0x6d/0xc0 [idpf]
  __dev_close_many+0x24c/0x650

The existing rxq_grps test does not help. It is evaluated before the
pointer is read again, so the worker can equally run past the kfree() and
dereference a NULL rxq_grps with a stale num_rxq_grp.

Add a per vport rxq_grps_lock and use it to serialize every transition of
rsrc->rxq_grps against the worker:

  - Teardown: idpf_rxq_group_rel() sets rsrc->rxq_grps to NULL under the
    lock before anything reachable through it is freed. The worker
    re-reads the pointer under the same lock, so it either sees a live
    array while the release path is still blocked on the lock, or sees
    NULL and skips that vport. The frees stay outside the lock.

  - Allocation: Build the rxq_grps array privately and publish it to
    rsrc->rxq_grps under the lock only once every group is complete. The
    freeing of the group contents moves to idpf_rxq_grps_free(), which
    takes the array explicitly so the allocation error path can unwind
    safely.

  - Soft reset: idpf_vport_stop() freed rxq_grps and cleared the live
    vport's copy under rxq_grps_lock. Drop the stale pointer in the clone
    so the memcpy() below does not republish the freed array to
    the PTP aux worker before idpf_vport_open() reallocates it. The lock
    sits past the offsetof(struct idpf_vport, link_up) boundary that
    idpf_initiate_soft_reset() stops its memcpy() at, next to the wait
    queues and mutexes that are already kept out of the copy, so a soft
    reset never byte-copies it. The data it guards, dflt_qv_rsrc, is
    inside that copied region, which is why the clone has to be cleared
    rather than relying on the lock alone.

Also, fix the NULL check in idpf_ptp_update_phctime_rxq_grp(). The split
queue case took the address of a member before testing it, which can never
be NULL, so test the rxq_sets[] entry itself.

Fixes: 1a49cf814fe1 ("idpf: add Tx timestamp flows")
Reviewed-by: Madhu Chittim <madhu.chittim@intel.com>
Signed-off-by: Emil Tantilov <emil.s.tantilov@intel.com>
Reviewed-by: Naman Gulati <namangulati@google.com>
Tested-by: Samuel Salin <Samuel.salin@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/idpf/idpf.h      |  5 ++
 drivers/net/ethernet/intel/idpf/idpf_lib.c  |  6 ++
 drivers/net/ethernet/intel/idpf/idpf_ptp.c  | 16 +++++-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c | 63 +++++++++++++++------
 4 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf.h b/drivers/net/ethernet/intel/idpf/idpf.h
index 533b069d97f9..c2631ac35a8b 100644
--- a/drivers/net/ethernet/intel/idpf/idpf.h
+++ b/drivers/net/ethernet/intel/idpf/idpf.h
@@ -373,6 +373,8 @@ struct idpf_q_vec_rsrc {
  * @default_vport: Use this vport if one isn't specified
  * @crc_enable: Enable CRC insertion offload
  * @link_up: True if link is up
+ * @rxq_grps_lock: Serializes every transition of the @dflt_qv_rsrc.rxq_grps
+ *		   pointer of a vport against the PTP auxiliary worker
  * @tx_tstamp_caps: Capabilities negotiated for Tx timestamping
  * @tstamp_config: The Tx tstamp config
  * @tstamp_task: Tx timestamping task
@@ -406,6 +408,9 @@ struct idpf_vport {
 	bool crc_enable;
 	bool link_up;
 
+	/* Must be past the point idpf_initiate_soft_reset() memcpy()s */
+	spinlock_t rxq_grps_lock;
+
 	struct idpf_ptp_vport_tx_tstamp_caps *tx_tstamp_caps;
 	struct kernel_hwtstamp_config tstamp_config;
 	struct work_struct tstamp_task;
diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/ethernet/intel/idpf/idpf_lib.c
index 062d2f540254..38cb91beacd0 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
@@ -1295,6 +1295,7 @@ static struct idpf_vport *idpf_vport_alloc(struct idpf_adapter *adapter,
 	vport->compln_clean_budget = IDPF_TX_COMPLQ_CLEAN_BUDGET;
 	vport->default_vport = adapter->num_alloc_vports <
 			       idpf_get_default_vports(adapter);
+	spin_lock_init(&vport->rxq_grps_lock);
 
 	rsrc = &vport->dflt_qv_rsrc;
 	rsrc->dev = &adapter->pdev->dev;
@@ -2097,6 +2098,11 @@ int idpf_initiate_soft_reset(struct idpf_vport *vport,
 	} else {
 		set_bit(IDPF_VPORT_DEL_QUEUES, vport->flags);
 		idpf_vport_stop(vport, false);
+
+		/* Drop the stale pointer in the clone, as rxq_grps was freed
+		 * by idpf_vport_stop().
+		 */
+		new_rsrc->rxq_grps = NULL;
 	}
 
 	err = idpf_send_add_queues_msg(adapter, vport_config, new_rsrc,
diff --git a/drivers/net/ethernet/intel/idpf/idpf_ptp.c b/drivers/net/ethernet/intel/idpf/idpf_ptp.c
index 71fe8b2a8b4e..9b15973d2f7e 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_ptp.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_ptp.c
@@ -348,9 +348,11 @@ idpf_ptp_update_phctime_rxq_grp(const struct idpf_rxq_group *grp, bool split,
 		}
 	} else {
 		for (i = 0; i < grp->splitq.num_rxq_sets; i++) {
+			if (!grp->splitq.rxq_sets[i])
+				continue;
+
 			rxq = &grp->splitq.rxq_sets[i]->rxq;
-			if (rxq)
-				WRITE_ONCE(rxq->cached_phc_time, systime);
+			WRITE_ONCE(rxq->cached_phc_time, systime);
 		}
 	}
 }
@@ -387,10 +389,17 @@ static int idpf_ptp_update_cached_phctime(struct idpf_adapter *adapter)
 		struct idpf_q_vec_rsrc *rsrc;
 		bool split;
 
-		if (!vport || !vport->dflt_qv_rsrc.rxq_grps)
+		if (!vport)
 			continue;
 
 		rsrc = &vport->dflt_qv_rsrc;
+
+		spin_lock(&vport->rxq_grps_lock);
+		if (!rsrc->rxq_grps) {
+			spin_unlock(&vport->rxq_grps_lock);
+			continue;
+		}
+
 		split = idpf_is_queue_model_split(rsrc->rxq_model);
 
 		for (u16 i = 0; i < rsrc->num_rxq_grp; i++) {
@@ -398,6 +407,7 @@ static int idpf_ptp_update_cached_phctime(struct idpf_adapter *adapter)
 
 			idpf_ptp_update_phctime_rxq_grp(grp, split, systime);
 		}
+		spin_unlock(&vport->rxq_grps_lock);
 	}
 
 	return 0;
diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
index 281b96daa5c1..968b62f89d87 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
@@ -1357,16 +1357,15 @@ static void idpf_rxq_sw_queue_rel(struct idpf_rxq_group *rx_qgrp)
 }
 
 /**
- * idpf_rxq_group_rel - Release all resources for rxq groups
+ * idpf_rxq_grps_free - Free an Rx queue group array and everything in it
  * @rsrc: pointer to queue and vector resources
+ * @rxq_grps: group array to free, not reachable through @rsrc any more
  */
-static void idpf_rxq_group_rel(struct idpf_q_vec_rsrc *rsrc)
+static void idpf_rxq_grps_free(struct idpf_q_vec_rsrc *rsrc,
+			       struct idpf_rxq_group *rxq_grps)
 {
-	if (!rsrc->rxq_grps)
-		return;
-
 	for (unsigned int i = 0; i < rsrc->num_rxq_grp; i++) {
-		struct idpf_rxq_group *rx_qgrp = &rsrc->rxq_grps[i];
+		struct idpf_rxq_group *rx_qgrp = &rxq_grps[i];
 		u16 num_rxq;
 
 		if (idpf_is_queue_model_split(rsrc->rxq_model)) {
@@ -1391,14 +1390,37 @@ static void idpf_rxq_group_rel(struct idpf_q_vec_rsrc *rsrc)
 	rsrc->rxq_grps = NULL;
 }
 
+/**
+ * idpf_rxq_group_rel - Release all resources for rxq groups
+ * @vport: vport the queue groups belong to
+ * @rsrc: pointer to queue and vector resources
+ */
+static void idpf_rxq_group_rel(struct idpf_vport *vport,
+			       struct idpf_q_vec_rsrc *rsrc)
+{
+	struct idpf_rxq_group *rxq_grps;
+
+	if (!rsrc->rxq_grps)
+		return;
+
+	spin_lock(&vport->rxq_grps_lock);
+	rxq_grps = rsrc->rxq_grps;
+	rsrc->rxq_grps = NULL;
+	spin_unlock(&vport->rxq_grps_lock);
+
+	idpf_rxq_grps_free(rsrc, rxq_grps);
+}
+
 /**
  * idpf_vport_queue_grp_rel_all - Release all queue groups
+ * @vport: vport the queue groups belong to
  * @rsrc: pointer to queue and vector resources
  */
-static void idpf_vport_queue_grp_rel_all(struct idpf_q_vec_rsrc *rsrc)
+static void idpf_vport_queue_grp_rel_all(struct idpf_vport *vport,
+					 struct idpf_q_vec_rsrc *rsrc)
 {
 	idpf_txq_group_rel(rsrc);
-	idpf_rxq_group_rel(rsrc);
+	idpf_rxq_group_rel(vport, rsrc);
 }
 
 /**
@@ -1417,7 +1439,7 @@ void idpf_vport_queues_rel(struct idpf_vport *vport,
 	idpf_rx_desc_rel_all(rsrc);
 
 	idpf_xdpsqs_put(vport);
-	idpf_vport_queue_grp_rel_all(rsrc);
+	idpf_vport_queue_grp_rel_all(vport, rsrc);
 
 	kfree(vport->txqs);
 	vport->txqs = NULL;
@@ -1802,18 +1824,19 @@ static int idpf_rxq_group_alloc(struct idpf_vport *vport,
 				u16 num_rxq)
 {
 	struct idpf_adapter *adapter = vport->adapter;
+	struct idpf_rxq_group *rxq_grps;
 	bool hs, rsc;
-	int err = 0;
+	int err;
 
-	rsrc->rxq_grps = kzalloc_objs(struct idpf_rxq_group, rsrc->num_rxq_grp);
-	if (!rsrc->rxq_grps)
+	rxq_grps = kzalloc_objs(struct idpf_rxq_group, rsrc->num_rxq_grp);
+	if (!rxq_grps)
 		return -ENOMEM;
 
 	hs = idpf_vport_get_hsplit(vport) == ETHTOOL_TCP_DATA_SPLIT_ENABLED;
 	rsc = idpf_is_feature_ena(vport, NETIF_F_GRO_HW);
 
 	for (unsigned int i = 0; i < rsrc->num_rxq_grp; i++) {
-		struct idpf_rxq_group *rx_qgrp = &rsrc->rxq_grps[i];
+		struct idpf_rxq_group *rx_qgrp = &rxq_grps[i];
 
 		rx_qgrp->vport = vport;
 		if (!idpf_is_queue_model_split(rsrc->rxq_model)) {
@@ -1914,9 +1937,17 @@ static int idpf_rxq_group_alloc(struct idpf_vport *vport,
 		}
 	}
 
+	/* Publish only once every group is built, the PTP aux worker reads
+	 * the array as soon as it becomes visible.
+	 */
+	spin_lock(&vport->rxq_grps_lock);
+	rsrc->rxq_grps = rxq_grps;
+	spin_unlock(&vport->rxq_grps_lock);
+
+	return 0;
+
 err_alloc:
-	if (err)
-		idpf_rxq_group_rel(rsrc);
+	idpf_rxq_grps_free(rsrc, rxq_grps);
 
 	return err;
 }
@@ -1947,7 +1978,7 @@ static int idpf_vport_queue_grp_alloc_all(struct idpf_vport *vport,
 	return 0;
 
 err_out:
-	idpf_vport_queue_grp_rel_all(rsrc);
+	idpf_vport_queue_grp_rel_all(vport, rsrc);
 
 	return err;
 }
-- 
2.47.1


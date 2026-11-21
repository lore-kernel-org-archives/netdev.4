Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302113;
	b=TactJpoFQn1Y+1MWLXLWc8PagMNnggStpts2yaitbd2pFzJ291Xhm8KUoq7vjFTsKyGz
	 h/Pa0007hZyv2q/9X7WeSVTz65EDz4fyqmifgDOr7VSoE5AJrlMWZIEZmoZlHI/5+dwHF
	 T2UaZfTSmpKIQXtQpjaspqv1vE7fkCoy+LjXFKvGKkJCT5G1jGcG50kjjSmPUPFw2GO9X
	 vZHb/tvmerlWHj3uaRSu+X6X60xd6vJ37Ba9SKngSstaNEvgMCh4S1z2ehzYOAA3Gi6TG
	 l3w2Kxlcqv2rSmj4vBSZ5vXO33uhZJZuEn6KT2IBULILqiqLec6+/1OUiHOJpb5DPbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eKhE8OcOpgC5GQ5sJhU/ZQMJIHhHP8xRQL9Pa1qecjs=;
	b=VrjMgjNI/N1bXoo6xl+bWNJRuKdxrjkkTEz8IbOhlpTu+2fb4Bgz79FUOguqTZfmn08L
	 +Zjm/G0BPZq4m5/tbbCPDBrxeSDVwXUK7nWvaSUmLn+ljXQY4Nob971hwkWJRl0TmY6/c
	 HpPjrOZSaGakNmiPHJQOLJFJgfQ5EtV2vAWoSuNtyiujLfIe95kCByMs/MP1esPdPjepe
	 EZy4YLiI8TrJob/VSGlipocetMQCFeV39aszUA4DsZIPt7xPyI31OMk1NPMITYjRhOojU
	 0vMWgy30MdglDZQGOYpEtqdo2UTQDlMZnY+WgUuxaIokTxvm5/NPJWeXat9dKGkeSCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ephcHrsM;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91563606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91563606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ephcHrsM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302113; x=1826838113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ovL1B7kvgpPGVCv+pxb7NX5pmB7JJJ0Chwzlv3ovMEE=;
  b=ephcHrsMTYuRKJ8nm5fIiNXwD1P8TgcYEV1b9RYuXj2qKTunKTTh4vPY
   /eWrKPKJFmDcZpxbiih8E4OYnuOZDZCRiQ9doYndQbyRsEhgEkk33as88
   78+dZD2g9tOB4HxKALf+1tBiNEE93Dv6D0fHT7dbtgcQpt7knUH5sN+6D
   xGkWCB47OTYkgT3gIB6/S4/D3mnnPmSz3BZKLfIupiWSNs3jfl4sYTRuR
   riE6Rv7++pj7vRL153Z7DSFhUSxANpydAmFUOFtkeDhZO5UwZPPp4GKTg
   34sy4PTyeojUhqDhihpmdE32HPeql+n+bUORHSvf/wdL1yKW7wzRZKScV
   g==;
X-CSE-ConnectionGUID: WomJn8NbThm8F227oTVC8g==
X-CSE-MsgGUID: Ia9Vp3NOQSO4rGpJg1MHhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="3996967"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="3996967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:01:52 -0800
X-CSE-ConnectionGUID: NHBk7F1FTCGU6zAkBlzamw==
X-CSE-MsgGUID: H0rnsyQ4Sm6BSWtVK7cyiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11273382"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2026 15:01:47 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 1E5F733BCA;
	Sat, 21 Nov 2026 23:01:44 +0000 (GMT)
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Michal Schmidt <mschmidt@redhat.com>,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	leon@kernel.org,
	mbloch@nvidia.com,
	jacob.e.keller@intel.com,
	jedrzej.jagielski@intel.com,
	anzaki@gmail.com,
	brett.creeley@amd.com,
	ohartoov@nvidia.com,
	Petr Oros <poros@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH net-next v7 06/15] ice: bump to 256qs for VF
Date: Sat, 21 Nov 2026 23:55:33 +0100
Message-ID: <20261121230123.316391-7-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
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

Adjust all bitmaps and arrays in ice to accept 256 VF queues.
Extend struct ice_vf::num_req_qs width to allow 256 queues.
Keep old/legacy size for virtchnl opcodes that were designed to accept
only up to 16 queues.

Raise also the limit for the default VF queue count to 256. New virtchnl
opcodes, needed to make use of more than 16 queues, are handled by
subsequent commits of this series, the work is split for easier review.
VIRTCHNL_OP_REQUEST_QUEUES keeps its limit of 16 queues for now, a later
commit raises it, together with a check that the queues fit in one free
range.

__ice_vsi_get_qs() falls back to scattered PF queues when no contiguous
range is free, but takes at most 16 of them, while the VSI keeps its
queue count, so the rings past 16 all map to PF queue 0. Fail instead
when the queues don't fit in the scatter count, as a VF can now have
more than 16 queues. Other VSI types and XDP rings had the same broken
mapping, now they fail too when more than 16 queues find no contiguous
range. ice_prepare_xdp_rings() then must not clear any queue bits, as it
got none.

Disable only the queue pairs that passed validation when
ice_vc_cfg_qs_msg() fails, by their queue IDs instead of their index in
the message, as the queue config can now come in many messages.

Move the Tx queues of a VF to another LAG port with ice_aq_cfg_lan_txq()
commands of up to U8_MAX queues each, as num_qs of the command is u8.
Allocate struct ice_lag with kvzalloc_obj(), as its q_home table for
256 queues of each VF makes it about 66 KB.

Reviewed-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v7:
 * fail __ice_vsi_get_qs() when the queues don't fit in the scatter
   count, instead of cutting the count to 16, while the VSI kept all its
   rings, and the rest of them used PF queue 0; don't clear XDP queue
   bits after such failure, ice_prepare_xdp_rings() got none (me)
 * keep the VIRTCHNL_OP_REQUEST_QUEUES limit of 16 here, raise it only
   in "ice: support up to 256 VF queues", with the check that the queues
   fit in one free range; in between, a request for more than 16 queues
   could fail the VF reset (me)
 * commit message: describe the ice_vc_cfg_qs_msg() rollback fix, the
   LAG queue moves in commands of up to U8_MAX queues, and the
   kvzalloc_obj() of struct ice_lag (me)

v5:
 * LAG: call ice_aq_cfg_lan_txq() for up to U8_MAX queues at a time, as
   num_qs of the command is u8, 256 VF queues were sent as 0 (Sashiko)

v3:
 * fix rollback in ice_vc_cfg_qs_msg() to disable queues by their IDs,
   not by qpair index, as config could be now split into many messages;
   unwind only the entries that got past validation (Sashiko)

v2:
 * change ice_lag allocations to kvzalloc(), as they have grown to
   66KB (Sashiko)
 * commit message: mention that the default and requested VF queue
   limits are raised already here, while more than 16 queues are
   enabled by subsequent commits

Sashiko suggestions I don't want to apply:
 S: there is an existing error handling issue in ice_init_lag()
 me: pre-existing and unrelated, will be fixed separately
---
 drivers/net/ethernet/intel/ice/ice_lag.h     |  2 +-
 drivers/net/ethernet/intel/ice/ice_vf_lib.h  |  9 ++--
 drivers/net/ethernet/intel/ice/ice_base.c    |  6 +--
 drivers/net/ethernet/intel/ice/ice_lag.c     | 54 ++++++++++++++++----
 drivers/net/ethernet/intel/ice/ice_lib.c     |  2 +-
 drivers/net/ethernet/intel/ice/ice_main.c    |  2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c   |  4 +-
 drivers/net/ethernet/intel/ice/ice_vf_lib.c  |  8 +--
 drivers/net/ethernet/intel/ice/virt/queues.c | 20 ++++----
 9 files changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_lag.h b/drivers/net/ethernet/intel/ice/ice_lag.h
index 4bfffecbdc97..39f6a6cc844d 100644
--- a/drivers/net/ethernet/intel/ice/ice_lag.h
+++ b/drivers/net/ethernet/intel/ice/ice_lag.h
@@ -52,7 +52,7 @@ struct ice_lag {
 	u8 bond_lport_sec; /* lport values for secondary PF */
 
 	/* q_home keeps track of which interface the q is currently on */
-	u8 q_home[ICE_MAX_SRIOV_VFS][ICE_MAX_QS_PER_VF_VCV1];
+	u8 q_home[ICE_MAX_SRIOV_VFS][ICE_MAX_QS_PER_VF];
 
 	/* placeholder VSI for hanging VF queues from on secondary interface */
 	struct ice_vsi *sec_vf[ICE_MAX_SRIOV_VFS];
diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.h b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
index 4959ecee0c21..a9e95c85bc98 100644
--- a/drivers/net/ethernet/intel/ice/ice_vf_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
@@ -21,6 +21,7 @@
 /* VF resource constraints */
 /* for "old" virtchnl opcodes that accept up to 16 queues */
 #define ICE_MAX_QS_PER_VF_VCV1	16
+#define ICE_MAX_QS_PER_VF	256
 
 struct ice_pf;
 struct ice_vf;
@@ -162,8 +163,8 @@ struct ice_vf {
 	u8 dev_lan_addr[ETH_ALEN];
 	u8 hw_lan_addr[ETH_ALEN];
 	struct ice_time_mac legacy_last_added_umac;
-	DECLARE_BITMAP(txq_ena, ICE_MAX_QS_PER_VF_VCV1);
-	DECLARE_BITMAP(rxq_ena, ICE_MAX_QS_PER_VF_VCV1);
+	DECLARE_BITMAP(txq_ena, ICE_MAX_QS_PER_VF);
+	DECLARE_BITMAP(rxq_ena, ICE_MAX_QS_PER_VF);
 	struct ice_vlan port_vlan_info;	/* Port VLAN ID, QoS, and TPID */
 	struct virtchnl_vlan_caps vlan_v2_caps;
 	struct ice_mbx_vf_info mbx_info;
@@ -185,7 +186,7 @@ struct ice_vf {
 	DECLARE_BITMAP(vf_states, ICE_VF_STATES_NBITS);	/* VF runtime states */
 
 	unsigned long vf_caps;		/* VF's adv. capabilities */
-	u8 num_req_qs;			/* num of queue pairs requested by VF */
+	u16 num_req_qs;			/* num of queue pairs requested by VF */
 	u16 num_mac;
 	u16 num_mac_lldp;
 	u16 num_vf_qs;			/* num of queue configured per VF */
@@ -206,7 +207,7 @@ struct ice_vf {
 	u16 lldp_recipe_id;
 	u16 lldp_rule_id;
 
-	struct ice_vf_qs_bw qs_bw[ICE_MAX_QS_PER_VF_VCV1];
+	struct ice_vf_qs_bw qs_bw[ICE_MAX_QS_PER_VF];
 };
 
 /* Flags for controlling behavior of ice_reset_vf */
diff --git a/drivers/net/ethernet/intel/ice/ice_base.c b/drivers/net/ethernet/intel/ice/ice_base.c
index 1667f686ff75..f65634e3d44e 100644
--- a/drivers/net/ethernet/intel/ice/ice_base.c
+++ b/drivers/net/ethernet/intel/ice/ice_base.c
@@ -808,20 +808,18 @@ int ice_vsi_cfg_rxqs(struct ice_vsi *vsi)
  * @qs_cfg: gathered variables needed for pf->vsi queues assignment
  *
  * This function first tries to find contiguous space. If it is not successful,
- * it tries with the scatter approach.
+ * it tries with the scatter approach, if all queues fit in scatter_count.
  *
  * Return 0 on success and -ENOMEM in case of no left space in PF queue bitmap
  */
 int __ice_vsi_get_qs(struct ice_qs_cfg *qs_cfg)
 {
 	int ret = 0;
 
 	ret = __ice_vsi_get_qs_contig(qs_cfg);
-	if (ret) {
+	if (ret && qs_cfg->q_count <= qs_cfg->scatter_count) {
 		/* contig failed, so try with scatter approach */
 		qs_cfg->mapping_mode = ICE_VSI_MAP_SCATTER;
-		qs_cfg->q_count = min_t(unsigned int, qs_cfg->q_count,
-					qs_cfg->scatter_count);
 		ret = __ice_vsi_get_qs_sc(qs_cfg);
 	}
 	return ret;
diff --git a/drivers/net/ethernet/intel/ice/ice_lag.c b/drivers/net/ethernet/intel/ice/ice_lag.c
index 08a17ded0ad5..4bb28564c0d6 100644
--- a/drivers/net/ethernet/intel/ice/ice_lag.c
+++ b/drivers/net/ethernet/intel/ice/ice_lag.c
@@ -549,6 +549,41 @@ ice_lag_qbuf_recfg(struct ice_hw *hw, struct ice_aqc_cfg_txqs_buf *qbuf,
 	return count;
 }
 
+/**
+ * ice_lag_cfg_lan_txq - reconfigure queues for a new port
+ * @hw: HW struct to send the command on
+ * @qbuf: buffer filled by ice_lag_qbuf_recfg(), gets modified
+ * @numq: number of queues in @qbuf
+ * @oldport: lport of the current queues location
+ * @newport: lport of the destination queues location
+ *
+ * One command takes up to U8_MAX queues, a VF could have more.
+ *
+ * Return: 0 on success, negative on failure.
+ */
+static int
+ice_lag_cfg_lan_txq(struct ice_hw *hw, struct ice_aqc_cfg_txqs_buf *qbuf,
+		    u16 numq, u8 oldport, u8 newport)
+{
+	while (numq) {
+		int num = min(numq, U8_MAX);
+		int err;
+
+		err = ice_aq_cfg_lan_txq(hw, qbuf,
+					 struct_size(qbuf, queue_info, num),
+					 num, oldport, newport,
+					 ICE_AQC_Q_CFG_TC_CHNG, NULL);
+		if (err)
+			return err;
+
+		numq -= num;
+		memmove(qbuf->queue_info, &qbuf->queue_info[num],
+			numq * sizeof(*qbuf->queue_info));
+	}
+
+	return 0;
+}
+
 /**
  * ice_lag_get_sched_parent - locate or create a sched node parent
  * @hw: HW struct for getting parent in
@@ -689,8 +724,7 @@ ice_lag_move_vf_node_tc(struct ice_lag *lag, u8 oldport, u8 newport,
 		goto qbuf_none;
 	}
 
-	if (ice_aq_cfg_lan_txq(&lag->pf->hw, qbuf, qbuf_size, valq, oldport,
-			       newport, ICE_AQC_Q_CFG_TC_CHNG, NULL)) {
+	if (ice_lag_cfg_lan_txq(&lag->pf->hw, qbuf, valq, oldport, newport)) {
 		dev_warn(dev, "Failure to configure queues for LAG failover\n");
 		goto qbuf_err;
 	}
@@ -1277,9 +1311,8 @@ ice_lag_reclaim_vf_tc(struct ice_lag *lag, struct ice_hw *src_hw, u16 vsi_num,
 		goto reclaim_none;
 	}
 
-	if (ice_aq_cfg_lan_txq(hw, qbuf, qbuf_size, numq,
-			       src_hw->port_info->lport, hw->port_info->lport,
-			       ICE_AQC_Q_CFG_TC_CHNG, NULL)) {
+	if (ice_lag_cfg_lan_txq(hw, qbuf, numq, src_hw->port_info->lport,
+				hw->port_info->lport)) {
 		dev_warn(dev, "Failure to configure queues for LAG failover\n");
 		goto reclaim_qerr;
 	}
@@ -2495,9 +2528,8 @@ ice_lag_move_vf_nodes_tc_sync(struct ice_lag *lag, struct ice_hw *dest_hw,
 		goto sync_none;
 	}
 
-	if (ice_aq_cfg_lan_txq(hw, qbuf, qbuf_size, numq, hw->port_info->lport,
-			       dest_hw->port_info->lport,
-			       ICE_AQC_Q_CFG_TC_CHNG, NULL)) {
+	if (ice_lag_cfg_lan_txq(hw, qbuf, numq, hw->port_info->lport,
+				dest_hw->port_info->lport)) {
 		dev_warn(dev, "Failure to configure queues for LAG reset rebuild\n");
 		goto sync_qerr;
 	}
@@ -2577,7 +2609,7 @@ int ice_init_lag(struct ice_pf *pf)
 	if (!ice_is_feature_supported(pf, ICE_F_SRIOV_LAG))
 		return 0;
 
-	pf->lag = kzalloc_obj(*lag);
+	pf->lag = kvzalloc_obj(*lag);
 	if (!pf->lag)
 		return -ENOMEM;
 	lag = pf->lag;
@@ -2651,7 +2683,7 @@ int ice_init_lag(struct ice_pf *pf)
 	ice_free_hw_res(&pf->hw, ICE_AQC_RES_TYPE_RECIPE, 1,
 			&lag->pf_recipe);
 lag_error:
-	kfree(lag);
+	kvfree(lag);
 	pf->lag = NULL;
 	return err;
 }
@@ -2680,7 +2712,7 @@ void ice_deinit_lag(struct ice_pf *pf)
 	ice_free_hw_res(&pf->hw, ICE_AQC_RES_TYPE_RECIPE, 1,
 			&pf->lag->lport_recipe);
 
-	kfree(lag);
+	kvfree(lag);
 
 	pf->lag = NULL;
 }
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 7b9f0ddcaa2b..57425683c0d4 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -1062,7 +1062,7 @@ static void ice_vsi_set_rss_params(struct ice_vsi *vsi)
 				      max_rss_size);
 		break;
 	case ICE_VSI_VF:
-		vsi->rss_size = ICE_MAX_QS_PER_VF_VCV1;
+		vsi->rss_size = ICE_MAX_QS_PER_VF;
 		break;
 	case ICE_VSI_LB:
 		break;
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 0bc53f404957..3e8cf1c5f0e8 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -2758,14 +2758,14 @@ int ice_prepare_xdp_rings(struct ice_vsi *vsi, struct bpf_prog *prog,
 			vsi->xdp_rings[i] = NULL;
 		}
 
-err_map_xdp:
 	mutex_lock(&pf->avail_q_mutex);
 	ice_for_each_xdp_txq(vsi, i) {
 		clear_bit(vsi->txq_map[i + vsi->alloc_txq], pf->avail_txqs);
 		vsi->txq_map[i + vsi->alloc_txq] = ICE_INVAL_Q_INDEX;
 	}
 	mutex_unlock(&pf->avail_q_mutex);
 
+err_map_xdp:
 	devm_kfree(dev, vsi->xdp_rings);
 	vsi->xdp_rings = NULL;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
index dcd6d48ea38d..d7c4a6540008 100644
--- a/drivers/net/ethernet/intel/ice/ice_sriov.c
+++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
@@ -398,15 +398,15 @@ static int ice_set_per_vf_res(struct ice_pf *pf, u16 num_vfs)
 	}
 
 	num_txq = min_t(u16, num_msix_per_vf - ICE_NONQ_VECS_VF,
-			ICE_MAX_QS_PER_VF_VCV1);
+			ICE_MAX_QS_PER_VF);
 	avail_qs = ice_get_avail_txq_count(pf) / num_vfs;
 	if (!avail_qs)
 		num_txq = 0;
 	else if (num_txq > avail_qs)
 		num_txq = rounddown_pow_of_two(avail_qs);
 
 	num_rxq = min_t(u16, num_msix_per_vf - ICE_NONQ_VECS_VF,
-			ICE_MAX_QS_PER_VF_VCV1);
+			ICE_MAX_QS_PER_VF);
 	avail_qs = ice_get_avail_rxq_count(pf) / num_vfs;
 	if (!avail_qs)
 		num_rxq = 0;
diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
index be87a83d2599..320b393ddaaf 100644
--- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
@@ -528,8 +528,8 @@ static void ice_vf_rebuild_host_cfg(struct ice_vf *vf)
 static void ice_set_vf_state_qs_dis(struct ice_vf *vf)
 {
 	/* Clear Rx/Tx enabled queues flag */
-	bitmap_zero(vf->txq_ena, ICE_MAX_QS_PER_VF_VCV1);
-	bitmap_zero(vf->rxq_ena, ICE_MAX_QS_PER_VF_VCV1);
+	bitmap_zero(vf->txq_ena, ICE_MAX_QS_PER_VF);
+	bitmap_zero(vf->rxq_ena, ICE_MAX_QS_PER_VF);
 	clear_bit(ICE_VF_STATE_QS_ENA, vf->vf_states);
 }
 
@@ -1243,8 +1243,8 @@ bool ice_is_vf_trusted(struct ice_vf *vf)
  */
 bool ice_vf_has_no_qs_ena(struct ice_vf *vf)
 {
-	return bitmap_empty(vf->rxq_ena, ICE_MAX_QS_PER_VF_VCV1) &&
-	       bitmap_empty(vf->txq_ena, ICE_MAX_QS_PER_VF_VCV1);
+	return bitmap_empty(vf->rxq_ena, ICE_MAX_QS_PER_VF) &&
+	       bitmap_empty(vf->txq_ena, ICE_MAX_QS_PER_VF);
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
index 2667634e3c8c..a8a2f5e5b322 100644
--- a/drivers/net/ethernet/intel/ice/virt/queues.c
+++ b/drivers/net/ethernet/intel/ice/virt/queues.c
@@ -681,7 +681,7 @@ int ice_vc_cfg_q_bw(struct ice_vf *vf, u8 *msg)
 		goto err;
 	}
 
-	if (qbw->num_queues > ICE_MAX_QS_PER_VF_VCV1 ||
+	if (qbw->num_queues > ICE_MAX_QS_PER_VF ||
 	    qbw->num_queues > min_t(u16, vsi->alloc_txq, vsi->alloc_rxq)) {
 		dev_err(ice_pf_to_dev(vf->pf), "VF-%d trying to configure more than allocated number of queues: %d\n",
 			vf->vf_id, min_t(u16, vsi->alloc_txq, vsi->alloc_rxq));
@@ -773,7 +773,7 @@ int ice_vc_cfg_q_quanta(struct ice_vf *vf, u8 *msg)
 		goto err;
 	}
 
-	if (end_qid > ICE_MAX_QS_PER_VF_VCV1 ||
+	if (end_qid > ICE_MAX_QS_PER_VF ||
 	    end_qid > min_t(u16, vsi->alloc_txq, vsi->alloc_rxq)) {
 		dev_err(ice_pf_to_dev(vf->pf), "VF-%d trying to configure more than allocated number of queues: %d\n",
 			vf->vf_id, min_t(u16, vsi->alloc_txq, vsi->alloc_rxq));
@@ -822,9 +822,9 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)
 	struct virtchnl_vsi_queue_config_info *qci =
 	    (struct virtchnl_vsi_queue_config_info *)msg;
 	struct virtchnl_queue_pair_info *qpi;
+	int i, q_idx, last_valid = -1;
 	struct ice_pf *pf = vf->pf;
 	struct ice_vsi *vsi;
-	int i = -1, q_idx;
 	bool ena_ts;
 	u8 act_prt;
 
@@ -841,7 +841,7 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)
 	if (!vsi)
 		goto error_param;
 
-	if (qci->num_queue_pairs > ICE_MAX_QS_PER_VF_VCV1 ||
+	if (qci->num_queue_pairs > ICE_MAX_QS_PER_VF ||
 	    qci->num_queue_pairs > min_t(u16, vsi->alloc_txq, vsi->alloc_rxq)) {
 		dev_err(ice_pf_to_dev(pf), "VF-%d requesting more than supported number of queues: %d\n",
 			vf->vf_id, min_t(u16, vsi->alloc_txq, vsi->alloc_rxq));
@@ -877,6 +877,7 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)
 		if (q_idx >= vsi->alloc_txq || q_idx >= vsi->alloc_rxq) {
 			goto error_param;
 		}
+		last_valid = i;
 
 		/* copy Tx queue info from VF into VSI */
 		if (qpi->txq.ring_len > 0) {
@@ -967,13 +968,14 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)
 				     VIRTCHNL_STATUS_SUCCESS, NULL, 0);
 error_param:
 	/* disable whatever we can */
-	for (; i >= 0; i--) {
-		if (ice_vsi_ctrl_one_rx_ring(vsi, false, i, true))
+	for (; last_valid >= 0; last_valid--) {
+		q_idx = qci->qpair[last_valid].rxq.queue_id;
+		if (ice_vsi_ctrl_one_rx_ring(vsi, false, q_idx, true))
 			dev_err(ice_pf_to_dev(pf), "VF-%d could not disable RX queue %d\n",
-				vf->vf_id, i);
-		if (ice_vf_vsi_dis_single_txq(vf, vsi, i))
+				vf->vf_id, q_idx);
+		if (ice_vf_vsi_dis_single_txq(vf, vsi, q_idx))
 			dev_err(ice_pf_to_dev(pf), "VF-%d could not disable TX queue %d\n",
-				vf->vf_id, i);
+				vf->vf_id, q_idx);
 	}
 
 	ice_lag_complete_vf_reset(pf->lag, act_prt);
-- 
2.51.1


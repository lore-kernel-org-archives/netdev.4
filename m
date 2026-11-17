Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908498;
	b=RabCAFa6X42vufn+dhk1G9s2g6DE2cTdtzcXK45ScClcLJn/0k9oahBxChX9403wbqb4
	 QCpuv+eB1fU+G0FF0k2qKrPaQLVk7f7+8dls6mP3LHYPMjuxyUmR0f/Fk82H+BbIe6V7l
	 RwrlRsJ8u4PvaP5gH8Rm0lhCqpoUqXckSqpzXGxocjgqq0eAN/sJCmJ+ASuebV/YYH4pY
	 KvoqGRRFaVP08SDL2evJvOqtXA57ZrnOGn7w3zJL0WEFWR4roF+4x9Fa2GIY08rQ6oigB
	 Qz0CZ3p1v6bcm+YJfoX6TN+LVGb+yy86DCTWd5dxojojhOSCRqTFQWBxZM8hHXnGBvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908498;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Xz4qx+fJOyGwvKonl/cQDCPTsUwTSh6kDgagiwStE0=;
	b=VVcXqtpQconLHJNjhcNL2hPLvPngqeqiUajt9Jax9fe0cSJ6PwULE2oqZGa5SikM2LLM
	 h/9/ZB8cvnQcw2l5YL24PhvGHvZRw9KiOgFtT+1/rR490Npc69V1aYhXr1dG0f1GmXrU5
	 JBNlUiwTaSbetaeaQh7HkQIFfyO8e+++HpEluObXpfHZevhzKjr9aqiuweDdhnRXb0eGB
	 6fDU6QvSWyXW/NBjBBJ/LaCYzOxVLOiYLSHNM4sGf9kf0CA2hUcdH9fK6lDXbGmBTszdo
	 mGl0iu40lwAJU6vTvPjsh53EslsywbAf8PNUpGU7gUMA6vHAPSsBHNtNxBXN5cCT9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt7stvcY;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0EC606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt7stvcY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908498; x=1826444498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EqAkF5qHau9S/fBf6g1RSJOjxQsL9Ys/X5JUgS1O4C8=;
  b=mt7stvcY8u/cDmfcF9+56hYHSngEnX15hpwyoIxKZ3KHwsm9tgF+aBC9
   WjXN9AMdoRJYTjjr3m+nrOcRmESLEMEFgq86eaPT+LapECumM479l+OJI
   lZKEtOZx2oQNvUJ4YrKeopLf+BxuTjWU/iz5jSiE1xIjSubn77JsxhOGa
   HybCmyGRLRDehPg9mLjV6t3MLO5kh8qX8XcS5pxmeWEWc9WoNyPI0YOdR
   uwEqmgxDiH3FPnZNNmlOznyDwre3ak4UtMIEQxjkBBqteNyBNuJP0Ztto
   QcA+HDwuscM7KquDU0paLi89nBMU6hwq6KUVhPjMQ9Gah2P9sWsDlRpwo
   w==;
X-CSE-ConnectionGUID: vO+j1K43QBuBDLjFm6YhdA==
X-CSE-MsgGUID: +/oBDLxsRmqXcp0NHE+zhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3571146"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3571146"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:38 -0800
X-CSE-ConnectionGUID: l+X8YfcdSTGyvXAF3N7p+A==
X-CSE-MsgGUID: uwgMEcAXTRmv3EiQjmRXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10056603"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2026 01:41:33 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id A1C1828199;
	Tue, 17 Nov 2026 09:41:30 +0000 (GMT)
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: kuba@kernel.org,
	netdev@vger.kernel.org
Cc: aleksandr.loktionov@intel.com,
	andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	anzaki@gmail.com,
	brett.creeley@amd.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	jedrzej.jagielski@intel.com,
	jiri@resnulli.us,
	leon@kernel.org,
	mbloch@nvidia.com,
	mschmidt@redhat.com,
	ohartoov@nvidia.com,
	pabeni@redhat.com,
	poros@redhat.com,
	rdunlap@infradead.org,
	saeedm@nvidia.com,
	skhan@linuxfoundation.org,
	tariqt@nvidia.com,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [net-next v6 04/15] ice: add helpers for Global RSS LUT alloc, free, vsi_update
Date: Tue, 17 Nov 2026 10:44:42 +0100
Message-ID: <20261117094913.100756-5-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
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

Add AQ commands for RSS Global LUT allocation and free operations.
The new functions are used by subsequent commits.

Add programming code for GLOBAL LUT ID of UPDATE VSI AQ,
do the same for RSS LUT "type", also for PF LUT in case of VF VSI.

Co-developed-by: Brett Creeley <brett.creeley@intel.com>
Signed-off-by: Brett Creeley <brett.creeley@intel.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v2: fix whitespace (Sashiko)
---
 drivers/net/ethernet/intel/ice/ice.h          |  1 +
 .../net/ethernet/intel/ice/ice_adminq_cmd.h   |  1 +
 drivers/net/ethernet/intel/ice/ice_switch.h   |  2 +
 drivers/net/ethernet/intel/ice/ice_lib.c      | 28 +++++++++++--
 drivers/net/ethernet/intel/ice/ice_switch.c   | 41 +++++++++++++++++++
 5 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 432da05c48c0..89a2bdbecf60 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -367,6 +367,7 @@ struct ice_vsi {
 	u8 *rss_hkey_user;	/* User configured hash keys */
 	u8 *rss_lut_user;	/* User configured lookup table entries */
 	u8 rss_lut_type;	/* used to configure Get/Set RSS LUT AQ call */
+	u8 global_lut_id;       /* valid when lut_type == GLOBAL_LUT */
 
 	/* aRFS members only allocated for the PF VSI */
 #define ICE_MAX_ARFS_LIST	1024
diff --git a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
index 42878abac9eb..90c5587642d0 100644
--- a/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
+++ b/drivers/net/ethernet/intel/ice/ice_adminq_cmd.h
@@ -169,6 +169,7 @@ struct ice_aqc_set_port_params {
 #define ICE_AQC_RES_TYPE_VSI_LIST_PRUNE			0x04
 #define ICE_AQC_RES_TYPE_RECIPE				0x05
 #define ICE_AQC_RES_TYPE_SWID				0x07
+#define ICE_AQC_RES_TYPE_GLOBAL_RSS_HASH		0x20
 #define ICE_AQC_RES_TYPE_FDIR_COUNTER_BLOCK		0x21
 #define ICE_AQC_RES_TYPE_FDIR_GUARANTEED_ENTRIES	0x22
 #define ICE_AQC_RES_TYPE_FDIR_SHARED_ENTRIES		0x23
diff --git a/drivers/net/ethernet/intel/ice/ice_switch.h b/drivers/net/ethernet/intel/ice/ice_switch.h
index 671d7a5f359f..99b593b68bd0 100644
--- a/drivers/net/ethernet/intel/ice/ice_switch.h
+++ b/drivers/net/ethernet/intel/ice/ice_switch.h
@@ -387,6 +387,8 @@ ice_rem_adv_rule_by_id(struct ice_hw *hw,
 		       struct ice_rule_query_data *remove_entry);
 
 int ice_init_def_sw_recp(struct ice_hw *hw);
+int ice_alloc_rss_global_lut(struct ice_hw *hw, u16 *global_lut_id);
+int ice_free_rss_global_lut(struct ice_hw *hw, u16 global_lut_id);
 u16 ice_get_hw_vsi_num(struct ice_hw *hw, u16 vsi_handle);
 
 int ice_replay_vsi_all_fltr(struct ice_hw *hw, u16 vsi_handle);
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 977cd8dd6e31..015b1886ba4e 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -1244,30 +1244,46 @@ static void ice_set_fd_vsi_ctx(struct ice_vsi_ctx *ctxt, struct ice_vsi *vsi)
 	ctxt->info.fd_report_opt = cpu_to_le16(val);
 }
 
+/* Translate @lut_type used in most of the places to the Admin Queue
+ * Q_OPT value for RSS.
+ * Used with VSI ADD and VSI UPDATE AQs (opcodes 0x0210, 0x0211).
+ */
+static u8 ice_lut_type_to_aq_qopt_rss_val(enum ice_lut_type lut_type)
+{
+	switch (lut_type) {
+	case ICE_LUT_PF:
+		return ICE_AQ_VSI_Q_OPT_RSS_LUT_PF;
+	case ICE_LUT_GLOBAL:
+		return ICE_AQ_VSI_Q_OPT_RSS_LUT_GBL;
+	case ICE_LUT_VSI:
+	default:
+		return ICE_AQ_VSI_Q_OPT_RSS_LUT_VSI;
+	}
+}
+
 /**
  * ice_set_rss_vsi_ctx - Set RSS VSI context before adding a VSI
  * @ctxt: the VSI context being set
  * @vsi: the VSI being configured
  */
 static void ice_set_rss_vsi_ctx(struct ice_vsi_ctx *ctxt, struct ice_vsi *vsi)
 {
 	u8 lut_type, hash_type;
+	u8 global_lut_id = 0;
 	struct device *dev;
 	struct ice_pf *pf;
 
 	pf = vsi->back;
 	dev = ice_pf_to_dev(pf);
 
 	switch (vsi->type) {
 	case ICE_VSI_CHNL:
-	case ICE_VSI_PF:
-		/* PF VSI will inherit RSS instance of PF */
 		lut_type = ICE_AQ_VSI_Q_OPT_RSS_LUT_PF;
 		break;
+	case ICE_VSI_PF:
 	case ICE_VSI_VF:
 	case ICE_VSI_SF:
-		/* VF VSI will gets a small RSS table which is a VSI LUT type */
-		lut_type = ICE_AQ_VSI_Q_OPT_RSS_LUT_VSI;
+		lut_type = ice_lut_type_to_aq_qopt_rss_val(vsi->rss_lut_type);
 		break;
 	default:
 		dev_dbg(dev, "Unsupported VSI type %s\n",
@@ -1278,8 +1294,12 @@ static void ice_set_rss_vsi_ctx(struct ice_vsi_ctx *ctxt, struct ice_vsi *vsi)
 	hash_type = ICE_AQ_VSI_Q_OPT_RSS_HASH_TPLZ;
 	vsi->rss_hfunc = hash_type;
 
+	if (vsi->rss_lut_type == ICE_LUT_GLOBAL)
+		global_lut_id = vsi->global_lut_id;
+
 	ctxt->info.q_opt_rss =
 		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_LUT_M, lut_type) |
+		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_M, global_lut_id) |
 		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_HASH_M, hash_type);
 }
 
diff --git a/drivers/net/ethernet/intel/ice/ice_switch.c b/drivers/net/ethernet/intel/ice/ice_switch.c
index d873eda9af82..567b85bc5a39 100644
--- a/drivers/net/ethernet/intel/ice/ice_switch.c
+++ b/drivers/net/ethernet/intel/ice/ice_switch.c
@@ -1527,6 +1527,47 @@ ice_aq_get_sw_cfg(struct ice_hw *hw, struct ice_aqc_get_sw_cfg_resp_elem *buf,
 	return status;
 }
 
+/* Allocate a new Global LUT for the caller.
+ * LUT ID is returned via @global_lut_id.
+ */
+int ice_alloc_rss_global_lut(struct ice_hw *hw, u16 *global_lut_id)
+{
+	DEFINE_RAW_FLEX(struct ice_aqc_alloc_free_res_elem, buf, elem, 1);
+	u16 buf_len = __struct_size(buf);
+	int err;
+
+	buf->num_elems = cpu_to_le16(1);
+	buf->res_type = cpu_to_le16(ICE_AQC_RES_TYPE_GLOBAL_RSS_HASH);
+
+	err = ice_aq_alloc_free_res(hw, buf, buf_len, ice_aqc_opc_alloc_res);
+	if (err)
+		ice_debug(hw, ICE_DBG_RES, "Failed to allocate RSS global LUT, err %d\n",
+			  err);
+	else
+		*global_lut_id = le16_to_cpu(buf->elem[0].e.sw_resp);
+
+	return err;
+}
+
+/* Free Global LUT at @global_lut_id. */
+int ice_free_rss_global_lut(struct ice_hw *hw, u16 global_lut_id)
+{
+	DEFINE_RAW_FLEX(struct ice_aqc_alloc_free_res_elem, buf, elem, 1);
+	u16 buf_len = __struct_size(buf);
+	int err;
+
+	buf->num_elems = cpu_to_le16(1);
+	buf->res_type = cpu_to_le16(ICE_AQC_RES_TYPE_GLOBAL_RSS_HASH);
+	buf->elem[0].e.sw_resp = cpu_to_le16(global_lut_id);
+
+	err = ice_aq_alloc_free_res(hw, buf, buf_len, ice_aqc_opc_free_res);
+	if (err)
+		ice_debug(hw, ICE_DBG_RES, "Failed to free RSS global LUT %d, err %d\n",
+			  global_lut_id, err);
+
+	return err;
+}
+
 /**
  * ice_aq_add_vsi
  * @hw: pointer to the HW struct
-- 
2.54.0


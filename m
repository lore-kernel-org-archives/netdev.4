Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302104;
	b=Dys2zH7zJCqL3nfbpU3DiH0hZ1ZTAb3RIWfOc7knkpa9kwAcvo7evvdhvItn3YAsUKpD
	 QHPvlCxRunvIJ8Cs0xUHDuMIHOwCVEEECLRKhpe2zCfgAILS9l8/ko49hmSh0d/evCm4+
	 RlnA0J6uipMhYNi+ovUjtAyt9Um6qUyNs12EHT45HxcZwlSlyTAF5bKjLGw8nBgAqYoW0
	 PpyKK834pt7Ks/hJGOeYTC1VcwlMcMwYPmtPOn5omo74FGP3o9LAnLy8FG37RYimhBUqh
	 DW+1utvAo7it2exzJw1/UbOd4TgzPU7swe944uN30HLQGGRCKLA+Sc4fcbHbLcCoUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302104;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aAfBngRmTqmcT1lnuutVK4hmZLemq9IIL0sbGrdlgAI=;
	b=MKcJ06K/Obfx2+5sG+iFRZMJ2o0Jg0eh1m0NMdaZEHh5jKDEUgDjyZMD7lXmuz9nFbEY
	 6cix8fhgzmetsRs6SeABzQ0USqYDdSvAhdzFIkPEHh4XJz1m507HLCLaDhN4nY3fKnqmO
	 LC19JuqwgYqzkOp3iRSW4EWdH+rCnNQZ54EnajN9E5oHwfIISkdExw9Q99jRdpsfQ2IWW
	 A13s9vFJMVYtEGCzp8KP+7VQS1P3lN/8S46TxqCfeS5IzboXYnv4if4GbAiDWMaBgWNT1
	 8YldUZ3wbujIivXnWlcwftX/hynr/CMe/LhzXkMUyIb+MBWCnkFCJCZZDHdspDW0jIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="e/K17Bpr";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A0606A332
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D57A0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e/K17Bpr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302104; x=1826838104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wRwI557D3diNRlVn4w9sngCk6gczc0KayYT8u/zG8ac=;
  b=e/K17BprKHLw8uHLIIZ0yc8lepzZHrOdcGGQD2mtMt8vumgaEjnavoJH
   YWxh+0sjaPytX8h9kAwvxmKboaeAxgfzvorDhMkfEGrIN8Y4GuG8e3mZM
   Mjw6jxY6N2sqZYTm8RbZNyvdJUORlEkwr/NqDPDvNjJVf1o4e+CunkVW5
   40ILJsabFKEPq0GqXoUKwzZXg3eKLY90o8+upjgOzkYTlWtNYfGM5OATv
   wFLatSPYh12GfS1Fqe6z5UGnPAbzPW/XeRHKgxQScinmXegLBAW62oaqf
   GJZ1PC1zB+1HJaxcOW0uiN+5h/IySrgBYtlIyJW3mD8CMpH1LAeuyOTgg
   g==;
X-CSE-ConnectionGUID: BdcmHcWbSCWGLNevlFJ1Xw==
X-CSE-MsgGUID: TscBaNQASNKYFvYc981K1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040172"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:01:44 -0800
X-CSE-ConnectionGUID: oMpBOF7sQiiC8/qYNBGeMQ==
X-CSE-MsgGUID: DlMU6dQfR1WHNjh0nerr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857035"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:01:38 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 1AEE233BC3;
	Sat, 21 Nov 2026 23:01:36 +0000 (GMT)
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
Subject: [PATCH net-next v7 02/15] ice: prepare RSS LUT config for runtime LUT changes
Date: Sat, 21 Nov 2026 23:55:29 +0100
Message-ID: <20261121230123.316391-3-przemyslaw.kitszel@intel.com>
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

The RSS LUT of a VSI can be changed via devlink at runtime, later in
this series. Prepare the RSS LUT config for that.

Add pf->rss_lut_lock, to protect the RSS LUT config of a VSI: the LUT
type and size, the LUT set by the user, and q_opt_rss of the VSI
context, which carries the LUT type. Take it in ethtool RSS ops, in the
RSS LUT setup of a VSI, and around VSI context writes that include
q_opt_rss.

Set the default RSS LUT type and size of a VSI only on its init, so
a VSI rebuild will keep a LUT changed via devlink.

Cap the RSS queue count of a VSI to what its RSS LUT type can address:
16 for a VSI LUT, 64 for a GLOBAL LUT, 256 for a PF LUT. Do it on
ethtool -L, when setting the default LUT, and on each RSS config of the
VSI. VFs and SFs have up to 16 queues yet, so nothing changes for them.

Take the Q_OPT section from vsi->info when toggling the RDMA filter.
The cached VSI context misses later changes, like the RSS hash function
set via ethtool, which the toggle reverted.

Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v7:
 * new patch, split out of "ice: represent RSS LUTs as devlink
   resources" and "ice: support up to 256 VF queues" (Jakub)
---
 drivers/net/ethernet/intel/ice/ice.h         |   1 +
 drivers/net/ethernet/intel/ice/ice_lib.h     |   2 +
 drivers/net/ethernet/intel/ice/ice_switch.h  |   3 +-
 drivers/net/ethernet/intel/ice/ice_ethtool.c |  90 ++++++++-------
 drivers/net/ethernet/intel/ice/ice_idc.c     |  24 ++--
 drivers/net/ethernet/intel/ice/ice_lib.c     | 112 ++++++++++++++-----
 drivers/net/ethernet/intel/ice/ice_main.c    |   2 +
 drivers/net/ethernet/intel/ice/ice_switch.c  |  11 +-
 8 files changed, 161 insertions(+), 84 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 432da05c48c0..f614b9360f7b 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -595,6 +595,7 @@ struct ice_pf {
 	struct mutex tc_mutex;		/* lock to protect TC changes */
 	struct mutex adev_mutex;	/* lock to protect aux device access */
 	struct mutex lag_mutex;		/* protect ice_lag struct in PF */
+	struct mutex rss_lut_lock;	/* protect VSI RSS LUT config */
 	u32 msg_enable;
 	struct ice_ptp ptp;
 	struct gnss_serial *gnss_serial;
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.h b/drivers/net/ethernet/intel/ice/ice_lib.h
index 49454d98dcfe..e0d3ae067f35 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_lib.h
@@ -18,6 +18,8 @@ enum ice_l2tsel {
 	ICE_L2TSEL_EXTRACT_FIRST_TAG_L2TAG1,
 };
 
+u16 ice_lut_type_to_qs_num(enum ice_lut_type lut_type);
+
 const char *ice_vsi_type_str(enum ice_vsi_type vsi_type);
 
 bool ice_pf_state_is_nominal(struct ice_pf *pf);
diff --git a/drivers/net/ethernet/intel/ice/ice_switch.h b/drivers/net/ethernet/intel/ice/ice_switch.h
index 671d7a5f359f..0d1ef9cd0535 100644
--- a/drivers/net/ethernet/intel/ice/ice_switch.h
+++ b/drivers/net/ethernet/intel/ice/ice_switch.h
@@ -361,7 +361,8 @@ int ice_remove_mac(struct ice_hw *hw, struct list_head *m_lst);
 bool ice_vlan_fltr_exist(struct ice_hw *hw, u16 vlan_id, u16 vsi_handle);
 int ice_add_eth_mac(struct ice_hw *hw, struct list_head *em_list);
 int ice_remove_eth_mac(struct ice_hw *hw, struct list_head *em_list);
-int ice_cfg_rdma_fltr(struct ice_hw *hw, u16 vsi_handle, bool enable);
+int ice_cfg_rdma_fltr(struct ice_hw *hw, u16 vsi_handle,
+		      const struct ice_aqc_vsi_props *info, bool enable);
 void ice_remove_vsi_fltr(struct ice_hw *hw, u16 vsi_handle);
 
 /* Promisc/defport setup for VSIs */
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool.c b/drivers/net/ethernet/intel/ice/ice_ethtool.c
index dffa213734f1..6d1e506b69cd 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool.c
@@ -3645,11 +3645,13 @@ ice_get_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh)
 	if (!rxfh->indir)
 		return 0;
 
-	lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
-	if (!lut)
-		return -ENOMEM;
+	scoped_guard(mutex, &pf->rss_lut_lock) {
+		lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
+		if (!lut)
+			return -ENOMEM;
 
-	err = ice_get_rss(vsi, rxfh->key, lut, vsi->rss_table_size);
+		err = ice_get_rss(vsi, rxfh->key, lut, vsi->rss_table_size);
+	}
 	if (err)
 		goto out;
 
@@ -3707,7 +3709,8 @@ ice_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh,
 	if (rxfh->input_xfrm & RXH_XFRM_SYM_XOR)
 		hfunc = ICE_AQ_VSI_Q_OPT_RSS_HASH_SYM_TPLZ;
 
-	err = ice_set_rss_hfunc(vsi, hfunc);
+	scoped_guard(mutex, &pf->rss_lut_lock)
+		err = ice_set_rss_hfunc(vsi, hfunc);
 	if (err)
 		return err;
 
@@ -3727,29 +3730,31 @@ ice_set_rxfh(struct net_device *netdev, struct ethtool_rxfh_param *rxfh,
 			return err;
 	}
 
-	if (!vsi->rss_lut_user) {
-		vsi->rss_lut_user = devm_kzalloc(dev, vsi->rss_table_size,
-						 GFP_KERNEL);
-		if (!vsi->rss_lut_user)
-			return -ENOMEM;
-	}
+	scoped_guard(mutex, &pf->rss_lut_lock) {
+		if (!vsi->rss_lut_user) {
+			vsi->rss_lut_user = devm_kzalloc(dev,
+							 vsi->rss_table_size,
+							 GFP_KERNEL);
+			if (!vsi->rss_lut_user)
+				return -ENOMEM;
+		}
 
-	/* Each 32 bits pointed by 'indir' is stored with a lut entry */
-	if (rxfh->indir) {
-		int i;
+		/* Each 32 bits pointed by 'indir' is stored with a lut entry */
+		if (rxfh->indir) {
+			int i;
 
-		for (i = 0; i < vsi->rss_table_size; i++)
-			vsi->rss_lut_user[i] = (u8)(rxfh->indir[i]);
-	} else {
-		ice_fill_rss_lut(vsi->rss_lut_user, vsi->rss_table_size,
-				 vsi->rss_size);
-	}
+			for (i = 0; i < vsi->rss_table_size; i++)
+				vsi->rss_lut_user[i] = (u8)(rxfh->indir[i]);
+		} else {
+			ice_fill_rss_lut(vsi->rss_lut_user, vsi->rss_table_size,
+					 vsi->rss_size);
+		}
 
-	err = ice_set_rss_lut(vsi, vsi->rss_lut_user, vsi->rss_table_size);
-	if (err)
-		return err;
+		err = ice_set_rss_lut(vsi, vsi->rss_lut_user,
+				      vsi->rss_table_size);
+	}
 
-	return 0;
+	return err;
 }
 
 static int
@@ -3825,14 +3830,15 @@ ice_get_channels(struct net_device *dev, struct ethtool_channels *ch)
 
 /**
  * ice_get_valid_rss_size - return valid number of RSS queues
- * @hw: pointer to the HW structure
+ * @vsi: VSI to get the RSS LUT type of
  * @new_size: requested RSS queues
  */
-static int ice_get_valid_rss_size(struct ice_hw *hw, int new_size)
+static int ice_get_valid_rss_size(struct ice_vsi *vsi, int new_size)
 {
-	struct ice_hw_common_caps *caps = &hw->func_caps.common_cap;
+	struct ice_hw_common_caps *caps = &vsi->back->hw.func_caps.common_cap;
 
-	return min_t(int, new_size, BIT(caps->rss_table_entry_width));
+	new_size = min_t(int, new_size, BIT(caps->rss_table_entry_width));
+	return min_t(int, new_size, ice_lut_type_to_qs_num(vsi->rss_lut_type));
 }
 
 /**
@@ -3856,19 +3862,22 @@ static int ice_vsi_set_dflt_rss_lut(struct ice_vsi *vsi, int req_rss_size)
 	if (!req_rss_size)
 		return -EINVAL;
 
-	lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
-	if (!lut)
-		return -ENOMEM;
+	scoped_guard(mutex, &pf->rss_lut_lock) {
+		lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
+		if (!lut)
+			return -ENOMEM;
 
-	/* set RSS LUT parameters */
-	if (!test_bit(ICE_FLAG_RSS_ENA, pf->flags))
-		vsi->rss_size = 1;
-	else
-		vsi->rss_size = ice_get_valid_rss_size(hw, req_rss_size);
+		/* set RSS LUT parameters */
+		if (!test_bit(ICE_FLAG_RSS_ENA, pf->flags))
+			vsi->rss_size = 1;
+		else
+			vsi->rss_size = ice_get_valid_rss_size(vsi,
+							       req_rss_size);
 
-	/* create/set RSS LUT */
-	ice_fill_rss_lut(lut, vsi->rss_table_size, vsi->rss_size);
-	err = ice_set_rss_lut(vsi, lut, vsi->rss_table_size);
+		/* create/set RSS LUT */
+		ice_fill_rss_lut(lut, vsi->rss_table_size, vsi->rss_size);
+		err = ice_set_rss_lut(vsi, lut, vsi->rss_table_size);
+	}
 	if (err)
 		dev_err(dev, "Cannot set RSS lut, err %d aq_err %s\n", err,
 			libie_aq_str(hw->adminq.sq_last_status));
@@ -3959,7 +3968,8 @@ static int ice_set_channels(struct net_device *dev, struct ethtool_channels *ch)
 	}
 
 	/* Update rss_size due to change in Rx queues */
-	vsi->rss_size = ice_get_valid_rss_size(&pf->hw, new_rx);
+	scoped_guard(mutex, &pf->rss_lut_lock)
+		vsi->rss_size = ice_get_valid_rss_size(vsi, new_rx);
 
 adev_unlock:
 	if (locked) {
diff --git a/drivers/net/ethernet/intel/ice/ice_idc.c b/drivers/net/ethernet/intel/ice/ice_idc.c
index 102d63c3018b..3827d7b490aa 100644
--- a/drivers/net/ethernet/intel/ice/ice_idc.c
+++ b/drivers/net/ethernet/intel/ice/ice_idc.c
@@ -207,15 +207,21 @@ int ice_rdma_update_vsi_filter(struct iidc_rdma_core_dev_info *cdev,
 	if (!vsi)
 		return -EINVAL;
 
-	status = ice_cfg_rdma_fltr(&pf->hw, vsi->idx, enable);
-	if (status) {
-		dev_err(ice_pf_to_dev(pf), "Failed to  %sable RDMA filtering\n",
-			enable ? "en" : "dis");
-	} else {
-		if (enable)
-			vsi->info.q_opt_flags |= ICE_AQ_VSI_Q_OPT_PE_FLTR_EN;
-		else
-			vsi->info.q_opt_flags &= ~ICE_AQ_VSI_Q_OPT_PE_FLTR_EN;
+	scoped_guard(mutex, &pf->rss_lut_lock) {
+		status = ice_cfg_rdma_fltr(&pf->hw, vsi->idx, &vsi->info,
+					   enable);
+		if (status) {
+			dev_err(ice_pf_to_dev(pf),
+				"Failed to  %sable RDMA filtering\n",
+				enable ? "en" : "dis");
+		} else {
+			if (enable)
+				vsi->info.q_opt_flags |=
+					ICE_AQ_VSI_Q_OPT_PE_FLTR_EN;
+			else
+				vsi->info.q_opt_flags &=
+					~ICE_AQ_VSI_Q_OPT_PE_FLTR_EN;
+		}
 	}
 
 	return status;
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 977cd8dd6e31..bd59c0a12215 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -10,6 +10,23 @@
 #include "ice_type.h"
 #include "ice_vsi_vlan_ops.h"
 
+#define ICE_LUT_VSI_MAX_QS	16
+#define ICE_LUT_GLOBAL_MAX_QS	64
+#define ICE_LUT_PF_MAX_QS	256
+
+u16 ice_lut_type_to_qs_num(enum ice_lut_type lut_type)
+{
+	switch (lut_type) {
+	case ICE_LUT_PF:
+		return ICE_LUT_PF_MAX_QS;
+	case ICE_LUT_GLOBAL:
+		return ICE_LUT_GLOBAL_MAX_QS;
+	case ICE_LUT_VSI:
+	default:
+		return ICE_LUT_VSI_MAX_QS;
+	}
+}
+
 /**
  * ice_vsi_type_str - maps VSI type enum to string equivalents
  * @vsi_type: VSI type enum
@@ -982,6 +999,37 @@ static void ice_rss_clean(struct ice_vsi *vsi)
 		ice_rem_vsi_rss_list(&pf->hw, vsi->idx);
 }
 
+/**
+ * ice_vsi_set_dflt_rss_lut_type - Setup default RSS LUT per VSI type
+ * @vsi: the VSI being configured
+ */
+static void ice_vsi_set_dflt_rss_lut_type(struct ice_vsi *vsi)
+{
+	struct ice_hw_common_caps *cap = &vsi->back->hw.func_caps.common_cap;
+
+	if (!test_bit(ICE_FLAG_RSS_ENA, vsi->back->flags))
+		return;
+
+	switch (vsi->type) {
+	case ICE_VSI_CHNL:
+	case ICE_VSI_PF:
+		/* PF VSI will inherit RSS instance of PF */
+		vsi->rss_table_size = (u16)cap->rss_table_size;
+		vsi->rss_lut_type = ICE_LUT_PF;
+		break;
+	case ICE_VSI_SF:
+	case ICE_VSI_VF:
+		/* VF and SF VSIs will get a small RSS table.
+		 * For VSI_LUT, LUT size should be set to 64 bytes.
+		 */
+		vsi->rss_table_size = ICE_LUT_VSI_SIZE;
+		vsi->rss_lut_type = ICE_LUT_VSI;
+		break;
+	default:
+		break;
+	}
+}
+
 /**
  * ice_vsi_set_rss_params - Setup RSS capabilities per VSI type
  * @vsi: the VSI being configured
@@ -1002,29 +1050,19 @@ static void ice_vsi_set_rss_params(struct ice_vsi *vsi)
 	switch (vsi->type) {
 	case ICE_VSI_CHNL:
 	case ICE_VSI_PF:
-		/* PF VSI will inherit RSS instance of PF */
-		vsi->rss_table_size = (u16)cap->rss_table_size;
 		if (vsi->type == ICE_VSI_CHNL)
 			vsi->rss_size = min_t(u16, vsi->num_rxq, max_rss_size);
 		else
 			vsi->rss_size = min_t(u16,
 					      netif_get_num_default_rss_queues(),
 					      max_rss_size);
-		vsi->rss_lut_type = ICE_LUT_PF;
 		break;
 	case ICE_VSI_SF:
-		vsi->rss_table_size = ICE_LUT_VSI_SIZE;
 		vsi->rss_size = min_t(u16, netif_get_num_default_rss_queues(),
 				      max_rss_size);
-		vsi->rss_lut_type = ICE_LUT_VSI;
 		break;
 	case ICE_VSI_VF:
-		/* VF VSI will get a small RSS table.
-		 * For VSI_LUT, LUT size should be set to 64 bytes.
-		 */
-		vsi->rss_table_size = ICE_LUT_VSI_SIZE;
 		vsi->rss_size = ICE_MAX_RSS_QS_PER_VF;
-		vsi->rss_lut_type = ICE_LUT_VSI;
 		break;
 	case ICE_VSI_LB:
 		break;
@@ -1558,19 +1596,22 @@ void ice_vsi_manage_rss_lut(struct ice_vsi *vsi, bool ena)
 {
 	u8 *lut;
 
-	lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
-	if (!lut)
-		return;
+	scoped_guard(mutex, &vsi->back->rss_lut_lock) {
+		lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
+		if (!lut)
+			return;
 
-	if (ena) {
-		if (vsi->rss_lut_user)
-			memcpy(lut, vsi->rss_lut_user, vsi->rss_table_size);
-		else
-			ice_fill_rss_lut(lut, vsi->rss_table_size,
-					 vsi->rss_size);
-	}
+		if (ena) {
+			if (vsi->rss_lut_user)
+				memcpy(lut, vsi->rss_lut_user,
+				       vsi->rss_table_size);
+			else
+				ice_fill_rss_lut(lut, vsi->rss_table_size,
+						 vsi->rss_size);
+		}
 
-	ice_set_rss_lut(vsi, lut, vsi->rss_table_size);
+		ice_set_rss_lut(vsi, lut, vsi->rss_table_size);
+	}
 	kfree(lut);
 }
 
@@ -1622,16 +1663,21 @@ int ice_vsi_cfg_rss_lut_key(struct ice_vsi *vsi)
 		}
 	}
 
-	lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
-	if (!lut)
-		return -ENOMEM;
+	scoped_guard(mutex, &pf->rss_lut_lock) {
+		vsi->rss_size = min(vsi->rss_size,
+				    ice_lut_type_to_qs_num(vsi->rss_lut_type));
+		lut = kzalloc(vsi->rss_table_size, GFP_KERNEL);
+		if (!lut)
+			return -ENOMEM;
 
-	if (vsi->rss_lut_user)
-		memcpy(lut, vsi->rss_lut_user, vsi->rss_table_size);
-	else
-		ice_fill_rss_lut(lut, vsi->rss_table_size, vsi->rss_size);
+		if (vsi->rss_lut_user)
+			memcpy(lut, vsi->rss_lut_user, vsi->rss_table_size);
+		else
+			ice_fill_rss_lut(lut, vsi->rss_table_size,
+					 vsi->rss_size);
 
-	err = ice_set_rss_lut(vsi, lut, vsi->rss_table_size);
+		err = ice_set_rss_lut(vsi, lut, vsi->rss_table_size);
+	}
 	if (err) {
 		dev_err(dev, "set_rss_lut failed, error %d\n", err);
 		goto ice_vsi_cfg_rss_exit;
@@ -2404,6 +2450,11 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
 
 	vsi->vsw = pf->first_sw;
 
+	if (vsi->flags & ICE_VSI_FLAG_INIT) {
+		scoped_guard(mutex, &pf->rss_lut_lock)
+			ice_vsi_set_dflt_rss_lut_type(vsi);
+	}
+
 	ret = ice_vsi_alloc_def(vsi, vsi->ch);
 	if (ret)
 		return ret;
@@ -2429,7 +2480,8 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
 	ice_vsi_set_tc_cfg(vsi);
 
 	/* create the VSI */
-	ret = ice_vsi_init(vsi, vsi->flags);
+	scoped_guard(mutex, &pf->rss_lut_lock)
+		ret = ice_vsi_init(vsi, vsi->flags);
 	if (ret)
 		goto unroll_get_qs;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index c8f06c3d0fdf..0bc53f404957 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -3873,6 +3873,7 @@ void ice_deinit_pf(struct ice_pf *pf)
 {
 	/* note that we unroll also on ice_init_pf() failure here */
 
+	mutex_destroy(&pf->rss_lut_lock);
 	mutex_destroy(&pf->lag_mutex);
 	mutex_destroy(&pf->adev_mutex);
 	mutex_destroy(&pf->sw_mutex);
@@ -3978,6 +3979,7 @@ int ice_init_pf(struct ice_pf *pf)
 	mutex_init(&pf->tc_mutex);
 	mutex_init(&pf->adev_mutex);
 	mutex_init(&pf->lag_mutex);
+	mutex_init(&pf->rss_lut_lock);
 
 	INIT_HLIST_HEAD(&pf->aq_wait_list);
 	spin_lock_init(&pf->aq_wait_lock);
diff --git a/drivers/net/ethernet/intel/ice/ice_switch.c b/drivers/net/ethernet/intel/ice/ice_switch.c
index d873eda9af82..70eed3bcc404 100644
--- a/drivers/net/ethernet/intel/ice/ice_switch.c
+++ b/drivers/net/ethernet/intel/ice/ice_switch.c
@@ -1834,10 +1834,12 @@ ice_update_vsi(struct ice_hw *hw, u16 vsi_handle, struct ice_vsi_ctx *vsi_ctx,
  * ice_cfg_rdma_fltr - enable/disable RDMA filtering on VSI
  * @hw: pointer to HW struct
  * @vsi_handle: VSI SW index
+ * @info: current VSI properties, the rest of the Q_OPT section is kept
  * @enable: boolean for enable/disable
  */
 int
-ice_cfg_rdma_fltr(struct ice_hw *hw, u16 vsi_handle, bool enable)
+ice_cfg_rdma_fltr(struct ice_hw *hw, u16 vsi_handle,
+		  const struct ice_aqc_vsi_props *info, bool enable)
 {
 	struct ice_vsi_ctx *ctx, *cached_ctx;
 	int status;
@@ -1850,9 +1852,10 @@ ice_cfg_rdma_fltr(struct ice_hw *hw, u16 vsi_handle, bool enable)
 	if (!ctx)
 		return -ENOMEM;
 
-	ctx->info.q_opt_rss = cached_ctx->info.q_opt_rss;
-	ctx->info.q_opt_tc = cached_ctx->info.q_opt_tc;
-	ctx->info.q_opt_flags = cached_ctx->info.q_opt_flags;
+	/* not from the cached ctx, that misses later RSS changes */
+	ctx->info.q_opt_rss = info->q_opt_rss;
+	ctx->info.q_opt_tc = info->q_opt_tc;
+	ctx->info.q_opt_flags = info->q_opt_flags;
 
 	ctx->info.valid_sections = cpu_to_le16(ICE_AQ_VSI_PROP_Q_OPT_VALID);
 
-- 
2.51.1


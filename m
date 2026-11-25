Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646680;
	b=MHsOmHJCBwFoCrVWHKWkjXWPBL8471eRKFqK+uYT7TOcucDaF9Szl4kmLUhPlDn0kAIn
	 qPmuoDIS68yvSmsTQcXDGzuhbcK/X52PnDWsPhLS391p6ctLMH1zXiA6l2Sr+36OLDgKv
	 K63BlYx9M70ZzGlUcuZm1SXu2lTrvly4K8Lu+XSU3nJMHQNyT8s/VbzCnIhxgW6Dgove0
	 j1Z5RdwL2V5XgBiCSWHNraUQX++VWzoEOjBWE3WvM5WU6ixdROBWhQM7W4sE96+m1MKK7
	 qgZ2mkfHR+Ud+UtPv8C33kACPvo8k3vxQl+uG7ZsHiD+c48q/DoY0+hKEtSF20hEYIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hfOdVoAr4rDope8V/Y/G8XQ24UA7gnji4j+/xPRwH3w=;
	b=jAKHMXrU3Qrw8Ae+EPGrtNUOQE23DFbDbnEaGZF75OrNzRVO5yZjA1L403Nn8dlTGLuB
	 CQbFN9xzjnVeo8P24xH0WFmgiSTYUdyHEioqFejf7eDAeMCpBd0blwaHLH0QOQ2IcG9x8
	 NGzzbZg/9EYdtHWo7QA5gszNjjSmnGkR+qbo2oL8g3VLpx8GPRJkAJfYxecosZt0t+ezc
	 5X/rK9nRL1OnEM3Nb0yrslRsyw0yVxJdMlYMNpsfFVGOYIoD6UGkm3X8N0YEjct5xqqiC
	 fvzoCYQdWf5nztm8tzr6z2A71I2aZM1iZSwD7baI9JuXVtToPGngVu8BCUkyhRBe3Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HROlhGi0;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADE6606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADE6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HROlhGi0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795646679; x=1827182679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ivUk4555AKH8HzMx/yEH5Jb9/D85ghRJ4mmm4BLcZ3g=;
  b=HROlhGi0iO87xt+tyskqo5f4bNHRiXcI7lHPji8JjqElC607upbOk3yC
   kIzsbf/lWNDplcPFHBizWe5IACj7OGvNoOTzUDOlbO4HdxLjxE8UBiB1U
   dH4mDCw5hC8Eq1VqNx6CQNeCUGFpfFFkEOrltWcdsbpi3g9s4By+gAlp5
   Aezv5B1w29W8qCDxQFgscBxLzfgy2Zajy8/j3QLFS7KUhBe7hIVwh6FDA
   FL11PHj7FkyUnFqdAzjLWoT/zHT546C+edspwMzKxoROc9dog2mvSOT8Z
   Melwub/miSB+Jr1oe7kLBMSaxZSAUaYk8rvu6zq+WV1a+lUp4zlb+5KwF
   w==;
X-CSE-ConnectionGUID: GIUsZioPSHCLaKmvC+aRqw==
X-CSE-MsgGUID: +GmGhIDMQJacYitZNmIYXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4449960"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4449960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:44:37 -0800
X-CSE-ConnectionGUID: QeMLMUYHTVqmhQ01RpvTFQ==
X-CSE-MsgGUID: iapQOXA1SGak86z3RJC/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11862058"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa004.jf.intel.com with ESMTP; 25 Nov 2026 14:44:37 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	netdev@vger.kernel.org
Cc: Aaron Ma <aaron.ma@canonical.com>,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	maciej.machnikowski@intel.com,
	grzegorz.nitka@intel.com,
	jacob.e.keller@intel.com,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Simon Horman <horms@kernel.org>,
	Ayush Singh <ayush1x.singh@intel.com>
Subject: [PATCH net 1/5] ice: restore DDP state during PFR recovery
Date: Wed, 25 Nov 2026 14:44:20 -0800
Message-ID: <20261125224428.4126195-2-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
References: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
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

From: Aaron Ma <aaron.ma@canonical.com>

The firmware package and switch recipes are shared by all PFs of an
adapter. However, each PF rebuilds independently after system resume. The
resulting package downloads and recipe updates can interleave, causing
firmware timeouts and leaving interfaces unusable.

PFR also clears package-derived firmware state on affected devices. The
existing PFR path only rebuilds the driver's block tables, so VLAN recipe
programming can fail after the reset.

The failure is reported as:

  ice 0000:04:00.0: Update pkg failed: err -5
  ice 0000:04:00.0: package load failed, -12
  ice 0000:04:00.0: Rebuild failed, unload and reload driver

This was observed on an Intel E810-XXV-2 adapter (PCI ID 8086:159b,
revision 02) with NVM package 1.0.0.18 and ICE OS Default DDP package
1.3.43.0.

Serialize rebuilds across PFs of the same adapter, while allowing each PFR
to complete independently. Reload the DDP package from its cached copy and
restore the default DVM recipes before rebuilding the remaining PF state.
Abort recovery if either operation fails.

In addition, stop the service task before tearing down resources in
ice_remove() so that an in-flight rebuild completes and cannot dereference
pf->adapter after ice_adapter_put().

Fixes: 462acf6aca85 ("ice: Enable DDP package download")
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Ayush Singh <ayush1x.singh@intel.com> (A Contingent worker at Intel)
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  2 ++
 drivers/net/ethernet/intel/ice/ice_adapter.h  |  3 ++
 drivers/net/ethernet/intel/ice/ice_main.c     | 35 ++++++++++++++-----
 .../net/ethernet/intel/ice/ice_vlan_mode.c    |  2 +-
 .../net/ethernet/intel/ice/ice_vlan_mode.h    |  1 +
 5 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.c b/drivers/net/ethernet/intel/ice/ice_adapter.c
index aa2d8addae5b..01b6d3f751ed 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.c
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.c
@@ -73,6 +73,7 @@ static struct ice_adapter *ice_adapter_new(struct pci_dev *pdev)
 	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
 		mutex_init(&adapter->cpi_phy_lock[i]);
 	mutex_init(&adapter->cgu_synce_lock);
+	mutex_init(&adapter->rebuild_lock);
 	refcount_set(&adapter->refcount, 1);
 
 	spin_lock_init(&adapter->ports.lock);
@@ -86,6 +87,7 @@ static void ice_adapter_free(struct ice_adapter *adapter)
 	WARN_ON(!list_empty(&adapter->ports.list));
 	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
 		mutex_destroy(&adapter->cpi_phy_lock[i]);
+	mutex_destroy(&adapter->rebuild_lock);
 	mutex_destroy(&adapter->cgu_synce_lock);
 
 	cleanup_srcu_struct(&adapter->ports.srcu);
diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.h b/drivers/net/ethernet/intel/ice/ice_adapter.h
index fd5585005d91..231abb8bbe1f 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.h
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.h
@@ -43,6 +43,7 @@ struct ice_port_list {
  *               Index 0 = PHY0, index 1 = PHY1. Used on E825C devices.
  * @cgu_synce_lock: Mutex serializing changes of the CGU registers R10 and R11,
  *                  which all PFs reach. Used on E825C devices.
+ * @rebuild_lock: serialize PFR recovery across PFs of the same adapter
  * @ctrl_pf: Control PF of the adapter
  * @ports: Ports list
  * @index: 64-bit index cached for collision detection on 32bit systems
@@ -57,6 +58,8 @@ struct ice_adapter {
 	struct mutex cpi_phy_lock[ICE_E825_MAX_PHYS];
 	/* Serialize changes of the SyncE CGU registers (E825C only) */
 	struct mutex cgu_synce_lock;
+	/* Serialize PFR recovery touching shared FW global state */
+	struct mutex rebuild_lock;
 
 	struct ice_pf *ctrl_pf;
 	struct ice_port_list ports;
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 47c6798c97e8..f858473f6f53 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -659,7 +659,9 @@ static void ice_do_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
 	 */
 	if (reset_type == ICE_RESET_PFR) {
 		pf->pfr_count++;
+		mutex_lock(&pf->adapter->rebuild_lock);
 		ice_rebuild(pf, reset_type);
+		mutex_unlock(&pf->adapter->rebuild_lock);
 		clear_bit(ICE_PREPARED_FOR_RESET, pf->state);
 		clear_bit(ICE_PFR_REQ, pf->state);
 		wake_up(&pf->reset_wait_queue);
@@ -704,7 +706,9 @@ static void ice_reset_subtask(struct ice_pf *pf)
 		} else {
 			/* done with reset. start rebuild */
 			pf->hw.reset_ongoing = false;
+			mutex_lock(&pf->adapter->rebuild_lock);
 			ice_rebuild(pf, reset_type);
+			mutex_unlock(&pf->adapter->rebuild_lock);
 			/* clear bit to resume normal operations, but
 			 * ICE_NEEDS_RESTART bit is set in case rebuild failed
 			 */
@@ -5382,6 +5386,8 @@ static void ice_remove(struct pci_dev *pdev)
 		return;
 	}
 
+	ice_service_task_stop(pf);
+
 	if (test_bit(ICE_FLAG_SRIOV_ENA, pf->flags)) {
 		set_bit(ICE_VF_RESETS_DISABLED, pf->state);
 		ice_free_vfs(pf);
@@ -7682,14 +7688,27 @@ static void ice_rebuild(struct ice_pf *pf, enum ice_reset_req reset_type)
 		goto err_init_ctrlq;
 	}
 
-	/* if DDP was previously loaded successfully */
-	if (!ice_is_safe_mode(pf)) {
-		/* reload the SW DB of filter tables */
-		if (reset_type == ICE_RESET_PFR)
-			ice_fill_blk_tbls(hw);
-		else
-			/* Reload DDP Package after CORER/GLOBR reset */
-			ice_load_pkg(NULL, pf);
+	if (!ice_is_safe_mode(pf) && reset_type == ICE_RESET_PFR) {
+		enum ice_ddp_state state;
+
+		state = ice_init_pkg(hw, hw->pkg_copy, hw->pkg_size);
+		ice_log_pkg_init(hw, state);
+		if (!ice_is_init_pkg_successful(state))
+			goto err_init_ctrlq;
+	} else if (!ice_is_safe_mode(pf)) {
+		/* Reload DDP Package after CORER/GLOBR reset */
+		ice_load_pkg(NULL, pf);
+	}
+
+	/* PFR can lose DVM recipes after system suspend. */
+	if (!ice_is_safe_mode(pf) && reset_type == ICE_RESET_PFR &&
+	    ice_is_dvm_ena(hw)) {
+		err = ice_dvm_update_dflt_recipes(hw);
+		if (err) {
+			dev_err(dev, "failed to restore default DVM recipes: %d\n",
+				err);
+			goto err_init_ctrlq;
+		}
 	}
 
 	err = ice_clear_pf_cfg(hw);
diff --git a/drivers/net/ethernet/intel/ice/ice_vlan_mode.c b/drivers/net/ethernet/intel/ice/ice_vlan_mode.c
index 92c6f83a7efe..69dce2997845 100644
--- a/drivers/net/ethernet/intel/ice/ice_vlan_mode.c
+++ b/drivers/net/ethernet/intel/ice/ice_vlan_mode.c
@@ -240,7 +240,7 @@ static struct ice_update_recipe_lkup_idx_params ice_dvm_dflt_recipes[] = {
  * ice_dvm_update_dflt_recipes - update default switch recipes in DVM
  * @hw: hardware structure used to update the recipes
  */
-static int ice_dvm_update_dflt_recipes(struct ice_hw *hw)
+int ice_dvm_update_dflt_recipes(struct ice_hw *hw)
 {
 	unsigned long i;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_vlan_mode.h b/drivers/net/ethernet/intel/ice/ice_vlan_mode.h
index a0fb743d08e2..5dc705435f56 100644
--- a/drivers/net/ethernet/intel/ice/ice_vlan_mode.h
+++ b/drivers/net/ethernet/intel/ice/ice_vlan_mode.h
@@ -8,6 +8,7 @@ struct ice_hw;
 
 bool ice_is_dvm_ena(struct ice_hw *hw);
 int ice_set_vlan_mode(struct ice_hw *hw);
+int ice_dvm_update_dflt_recipes(struct ice_hw *hw);
 void ice_post_pkg_dwnld_vlan_mode_cfg(struct ice_hw *hw);
 
 #endif /* _ICE_VLAN_MODE_H */
-- 
2.47.1


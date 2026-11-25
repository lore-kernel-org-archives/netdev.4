Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646681;
	b=Es66bdpmB2Xtz2Nu2Wvp24T6hvorwdgjTG32EhAPi2znuo5xll8No5BzNPuIGas1ljwk
	 b6ksQeLrD+/nLNwLh3udRtN++/Jyjfyg+rh0AweTzs2fSiZqL/1s6lr55+cMU4GWAOt7W
	 MkyfICmtqA2jmF3kK6nKierr3fVVyt6YM+sbQvXpLRJnXvHysfjQJ0Wk/WLvREYkVzHSc
	 yvQnRC8WZeYBcVpWwEIldc1Mci0K1ucahbKai/HzLNpAOORYq1tyewegweNii+s3TdWyp
	 e/jutQdrEBwVq6xltl3ve4vrkOS3dGqfuTRsSLRcdftZKm7Sibv+/KEPKx5MmCja3FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646681;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8K41F1IfDndZhNnhPJZ08QQAkmUbJfVXDl9N97oOlsk=;
	b=cLylxmK8ahC9wjPkb5hbH84A+q4+UN4e9KUO9GB9rCbRsqp070SA0MbB9LKsSVCtYYLg
	 9zf6a6srLnUIxseRWbSMrDEW/ST1ES3w7Q2BN5ssoLlTZWmjXTFGh7ADNr+8V35MWiXNy
	 ammYU4bl6z/umGzUvSfIhhOunLBhi6vuM5y0DBl2ZHtHzOZN6bN4/eXnRd10P8ynzklic
	 sjwur3WJUt8cXGD4QslxsuaVOwQZ4cljEffVJKhOKyz+nHnCJymC8L5aFxuVAJrwYdbFy
	 X7WKb5j8Hz67XT/ZnH+oRauG+M0l1hE3IFTIfFcGSO/zzte7Xc8Z7fIDZnuJYMZ48CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="D1PUXSN/";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C06606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C06606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1PUXSN/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795646681; x=1827182681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ll6TpiEX8/fpjQLdo+eS6QDOdsabAW512fXHmt0Dc94=;
  b=D1PUXSN/CdqZkLnC8JWfTYee4HxiqcyvakdkN9IFwf18Hu8mmTASW/yh
   VPO4S4/6YbAb0Oju+G3V5R0Fn9NahsjXxwMTBNUc984Fjo+1zk2liFmMi
   9dg5ocgGVEMCRtthsK/FXfrZM1Sn7QTyGPw6IWq/LxXx0CBbQ1qCGK/sA
   KQuVU+i5d/erACtZQ3Q2pAxrjBQ5PxnVjPXCIb1SNFE8csN1mSe3gql8C
   ZdKX+InJNKsvdwUFqZNF0ATLunD63RCbjunoJ+sXfjcOMeccj0emgMxsP
   4i5c9Gzu+gvoDUiQdxgQV8QOFQoWkbZQMCHmU80q2zCMfhBV8AxscgSTn
   A==;
X-CSE-ConnectionGUID: ejavQ6DsS2+/CR7wEgODFw==
X-CSE-MsgGUID: oTtWMIbzS1OuQdDlx80Auw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4449974"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4449974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:44:38 -0800
X-CSE-ConnectionGUID: r3ywMXrQRpa8VzDlMMw5wA==
X-CSE-MsgGUID: qrv/33/PSJeAYzZ5aSwuDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11862065"
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
Cc: Maciek Machnikowski <maciej.machnikowski@intel.com>,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	aaron.ma@canonical.com,
	grzegorz.nitka@intel.com,
	jacob.e.keller@intel.com,
	richardcochran@gmail.com,
	Marc Neustadter <marc.neustadter@intel.com>,
	Sergey Temerkhanov <sergey.temerkhanov@intel.com>,
	Milena Olech <milena.olech@intel.com>,
	Simon Horman <horms@kernel.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Ayush Singh <ayush1x.singh@intel.com>
Subject: [PATCH net 3/5] ice: ptp: serialize E825 PHY timer start with PTP lock and incval
Date: Wed, 25 Nov 2026 14:44:22 -0800
Message-ID: <20261125224428.4126195-4-anthony.l.nguyen@intel.com>
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

From: Maciek Machnikowski <maciej.machnikowski@intel.com>

ice_start_phy_timer_eth56g() programmed the PHY increment value and
performed the PHY-to-PHC phase synchronization in two separate PTP
semaphore critical sections, and touched the shared source command
register (GLTSYN_CMD via ice_ptp_src_cmd()) and read the source incval
before acquiring the semaphore at all.

Because GLTSYN_CMD is a single global register latched for the source
timer and all PHY ports by GLTSYN_CMD_SYNC, a concurrent adjtime (small
offset, <= S32_MAX) or adjfine could clobber the source command between
the incval-init and the phase-sync steps. In the worst case the source
timer command written by ice_ptp_adj_clock() (ICE_PTP_ADJ_TIME) was
overwritten by the unlocked ICE_PTP_NOP from ice_start_phy_timer_eth56g(),
so the adjustment was applied to the PHY ports but not to the PHC. This
left the E825 PHY clock permanently offset from the PHC, showing up as an
intermittent clock drift.

Hold the PTP semaphore across the entire start sequence: acquire it
before the first shared-register access (ice_ptp_src_cmd()), keep it held
through the incval read, PHY incval init, and the phase synchronization,
then release it once. Since the hardware semaphore is not recursive, split
the phase-sync helper into ice_sync_phy_timer_eth56g_unlocked(), which
assumes the caller already holds the lock, and call it directly from
ice_start_phy_timer_eth56g(). The locking wrapper is removed as it no
longer has any callers.

Fixes: 781ff8f2d575 ("ice: ptp: serialize E825 PHY timer start with PTP lock")
Signed-off-by: Maciek Machnikowski <maciej.machnikowski@intel.com>
Co-developed-by: Grzegorz Nitka <grzegorz.nitka@intel.com>
Signed-off-by: Grzegorz Nitka <grzegorz.nitka@intel.com>
Suggested-by: Marc Neustadter <marc.neustadter@intel.com>
Reviewed-by: Sergey Temerkhanov <sergey.temerkhanov@intel.com>
Reviewed-by: Milena Olech <milena.olech@intel.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Tested-by: Ayush Singh <ayush1x.singh@intel.com> (A Contingent worker at Intel)
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c | 48 +++++++++------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
index 3a41c711e751..16333d4a34cc 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
+++ b/drivers/net/ethernet/intel/ice/ice_ptp_hw.c
@@ -2028,7 +2028,7 @@ static int ice_read_phy_and_phc_time_eth56g(struct ice_hw *hw, u8 port,
 }
 
 /**
- * ice_sync_phy_timer_eth56g - Synchronize the PHY timer with PHC timer
+ * ice_sync_phy_timer_eth56g_unlocked - Synchronize the PHY timer with PHC timer
  * @hw: pointer to the HW struct
  * @port: the PHY port to synchronize
  *
@@ -2041,22 +2041,18 @@ static int ice_read_phy_and_phc_time_eth56g(struct ice_hw *hw, u8 port,
  *
  * Return:
  * * %0     - success
- * * %-EBUSY- failed to acquire PTP semaphore
  * * %other - PHY read/write failed
+ *
+ * The caller must acquire PTP semaphore lock
  */
-static int ice_sync_phy_timer_eth56g(struct ice_hw *hw, u8 port)
+static int ice_sync_phy_timer_eth56g_unlocked(struct ice_hw *hw, u8 port)
 {
 	u64 phc_time, phy_time, difference;
 	int err;
 
-	if (!ice_ptp_lock(hw)) {
-		ice_debug(hw, ICE_DBG_PTP, "Failed to acquire PTP semaphore\n");
-		return -EBUSY;
-	}
-
 	err = ice_read_phy_and_phc_time_eth56g(hw, port, &phy_time, &phc_time);
 	if (err)
-		goto err_unlock;
+		return err;
 
 	/* Calculate the amount required to add to the port time in order for
 	 * it to match the PHC time.
@@ -2072,11 +2068,11 @@ static int ice_sync_phy_timer_eth56g(struct ice_hw *hw, u8 port)
 
 	err = ice_ptp_prep_port_adj_eth56g(hw, port, (s64)difference);
 	if (err)
-		goto err_unlock;
+		return err;
 
 	err = ice_ptp_one_port_cmd(hw, port, ICE_PTP_ADJ_TIME);
 	if (err)
-		goto err_unlock;
+		return err;
 
 	/* Issue the sync to activate the time adjustment */
 	ice_ptp_exec_tmr_cmd(hw);
@@ -2086,15 +2082,13 @@ static int ice_sync_phy_timer_eth56g(struct ice_hw *hw, u8 port)
 	 */
 	err = ice_read_phy_and_phc_time_eth56g(hw, port, &phy_time, &phc_time);
 	if (err)
-		goto err_unlock;
+		return err;
 
 	dev_info(ice_hw_to_dev(hw),
 		 "Port %u PHY time synced to PHC: 0x%016llX, 0x%016llX\n",
 		 port, phy_time, phc_time);
 
-err_unlock:
-	ice_ptp_unlock(hw);
-	return err;
+	return 0;
 }
 
 /**
@@ -2155,19 +2149,24 @@ int ice_start_phy_timer_eth56g(struct ice_hw *hw, u8 port)
 	if (err)
 		return err;
 
+	if (!ice_ptp_lock(hw)) {
+		dev_err(ice_hw_to_dev(hw), "Failed to acquire PTP semaphore\n");
+		return -EBUSY;
+	}
+
 	ice_ptp_src_cmd(hw, ICE_PTP_NOP);
 
 	err = ice_phy_cfg_parpcs_eth56g(hw, port);
 	if (err)
-		return err;
+		goto err_ptp_unlock;
 
 	err = ice_phy_cfg_ptp_1step_eth56g(hw, port);
 	if (err)
-		return err;
+		goto err_ptp_unlock;
 
 	err = ice_phy_cfg_mac_eth56g(hw, port);
 	if (err)
-		return err;
+		goto err_ptp_unlock;
 
 	if (ice_is_primary(hw)) {
 		lo = rd32(hw, GLTSYN_INCVAL_L(tmr_idx));
@@ -2178,11 +2177,6 @@ int ice_start_phy_timer_eth56g(struct ice_hw *hw, u8 port)
 	}
 	incval = (u64)hi << 32 | lo;
 
-	if (!ice_ptp_lock(hw)) {
-		dev_err(ice_hw_to_dev(hw), "Failed to acquire PTP semaphore\n");
-		return -EBUSY;
-	}
-
 	err = ice_write_40b_ptp_reg_eth56g(hw, port, PHY_REG_TIMETUS_L, incval);
 	if (err)
 		goto err_ptp_unlock;
@@ -2193,11 +2187,11 @@ int ice_start_phy_timer_eth56g(struct ice_hw *hw, u8 port)
 
 	ice_ptp_exec_tmr_cmd(hw);
 
-	ice_ptp_unlock(hw);
-
-	err = ice_sync_phy_timer_eth56g(hw, port);
+	err = ice_sync_phy_timer_eth56g_unlocked(hw, port);
 	if (err)
-		return err;
+		goto err_ptp_unlock;
+
+	ice_ptp_unlock(hw);
 
 	err = ice_write_ptp_reg_eth56g(hw, port, PHY_REG_TX_OFFSET_READY, 1);
 	if (err)
-- 
2.47.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646680;
	b=F4qvIja1E1IOr8mJj6fAzVd8scOPl1quJwI21lLbrioA+nXZ0LACoVTdQkj/W/0pJVxm
	 NUhhXTmi9jpEiq6KFp2P/mVubKKHXhjUPt8jbXQb0NkR9ZeFRo9D8ilD9rCpqsVXEFNRf
	 JjarFUVrv7lir+Tydb/rxnl5NVPKsnlI5VN74YpnwhNVd/1R70POgoVbhcDTJ6N1pijkp
	 KFpyMf4a0tK4WsEZh5jlVOQJbpveqkAGeJx41nw9Mr6gYnrUmS9TXPBY8ZpF5GalIFERj
	 4+Ze3LTOinY/gkZOyMu11sxGIPb/L3/xAJ5DN7z4fIdMA9t+XRUNXfJTSDlF3dKVI9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5FzTxbfVDOeaBGYbES4suZD2moKRtJibFWl14Ut4ivs=;
	b=Tghsc8b/Axtja4/5Vf4Z27fXUYo8T11ETSMpjkOr3G3XKok9ibN/K1923Ruf3J/+OVTI
	 +FJZRO9CIrWa0Lkxs2/xegWTqGr8knykdNMJ0Jg1NUjjP3YHIChnLwLAW4hqpRQMxcnUO
	 7ucPr2rTJLcXEJVXJkNsh/a00WRkLLInjPHufgup2N7qhsxQY2tRgE0UkMdN8HxmHo6i5
	 lztDBUARwtlJEY1SVQBWDFeQ7pub1cNwxaM3wlIZClCPV+l7nH/IJT22tXGPQ3bxL9Yjg
	 nrt+qTS4u0Fu78vP0WYrI8j1QhF+tKGw/2m9RMwzkJ0BVmGQBB9WgnsYFoTUKFC5wLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BDrtB4dC;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD4606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCD4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BDrtB4dC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795646681; x=1827182681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UcXUDt5Vl0nO2aViLNyP/vMHGsqhov08VoC5Rk+Tdt4=;
  b=BDrtB4dCEjI1E4YBppk8xV8LUNAmT9JRUyRFCEj/ztmxbjxKID0Ewv5m
   pxcxlv04nWHdq8qe5cr+nGjQyg+yKW+ldbGadlp+1KGHLCPLQDzJG1+kA
   sACCZ5ekF5le8YZz5GGEY2MOleyY3uDocG/KwQmgFKXTWNnh383yixHhz
   9BeDHAgQrmFcqci3X1iowaAnNWJqJmuZSY2HzTk9XLFtEdRm8quzWkNpZ
   TQpjsWsQaX1EbKVPaZPdEDST7k/UoHEhHH+Cv/X9JIBB6kNkDYaDhwEfS
   CO5LLgbGqigoHsGMftk49PmH9OwD9mbcWls3A6fHgFF0cYZcympoRtU+9
   g==;
X-CSE-ConnectionGUID: h2Oy8omtSSSRd85dgXd8aw==
X-CSE-MsgGUID: XullcBTgQKO3DtTOLS/gbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4449967"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4449967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:44:38 -0800
X-CSE-ConnectionGUID: oWhEvSZnSVy8Yucq9Lo2iQ==
X-CSE-MsgGUID: Tf6A6kz8St+V9tuP758g6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11862062"
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
Subject: [PATCH net 2/5] ice: clear Flow Director entries before reset cleanup
Date: Wed, 25 Nov 2026 14:44:21 -0800
Message-ID: <20261125224428.4126195-3-anthony.l.nguyen@intel.com>
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

Flow Director profiles retain handles to generic flow entries. Reset calls
ice_clear_hw_tbls() to free those entries, but leaves the Flow Director
handles unchanged until replay replaces them.

If rebuild fails before replay completes, later driver removal follows a
stale handle and dereferences a freed flow entry in ice_flow_rem_entry().
KASAN reports a wild access to list poison from
ice_fdir_erase_flow_from_hw().

The failure is reported as:

  KASAN: maybe wild-memory-access in range [0xdead000000000108-...]
  RIP: ice_flow_rem_entry+0xaf/0x170 [ice]
  ice_fdir_erase_flow_from_hw+0x1ee/0x420 [ice]

Clear the Flow Director handles while holding hw->fdir_fltr_lock before
the hardware tables free their entries. A successful replay installs new
handles, while a failed rebuild leaves them invalid for later cleanup.

Fixes: 148beb612031 ("ice: Initialize Flow Director resources")
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Ayush Singh <ayush1x.singh@intel.com> (A Contingent worker at Intel)
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ice/ice.h          |  1 +
 .../ethernet/intel/ice/ice_ethtool_ntuple.c   | 26 +++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_main.c     |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 432da05c48c0..865f299a6ac1 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -1032,6 +1032,7 @@ ice_get_fdir_fltr_ids(struct ice_hw *hw, struct ethtool_rxnfc *cmd,
 		      u32 *rule_locs);
 void ice_fdir_rem_adq_chnl(struct ice_hw *hw, u16 vsi_idx);
 void ice_fdir_release_flows(struct ice_hw *hw);
+void ice_fdir_clear_flow_handles(struct ice_hw *hw);
 void ice_fdir_replay_flows(struct ice_hw *hw);
 void ice_fdir_replay_fltrs(struct ice_pf *pf);
 int ice_fdir_create_dflt_rules(struct ice_pf *pf);
diff --git a/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c b/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c
index 8805f0efe977..3b77a3cf6c64 100644
--- a/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c
+++ b/drivers/net/ethernet/intel/ice/ice_ethtool_ntuple.c
@@ -415,6 +415,32 @@ void ice_fdir_release_flows(struct ice_hw *hw)
 		ice_fdir_erase_flow_from_hw(hw, ICE_BLK_FD, flow);
 }
 
+/**
+ * ice_fdir_clear_flow_handles - clear handles freed during reset
+ * @hw: pointer to HW instance
+ */
+void ice_fdir_clear_flow_handles(struct ice_hw *hw)
+{
+	int flow;
+
+	if (!hw->fdir_prof)
+		return;
+
+	mutex_lock(&hw->fdir_fltr_lock);
+	for (flow = 0; flow < ICE_FLTR_PTYPE_MAX; flow++) {
+		struct ice_fd_hw_prof *prof = hw->fdir_prof[flow];
+		int tun, i;
+
+		if (!prof)
+			continue;
+
+		for (tun = 0; tun < ICE_FD_HW_SEG_MAX; tun++)
+			for (i = 0; i < prof->cnt; i++)
+				prof->entry_h[i][tun] = 0;
+	}
+	mutex_unlock(&hw->fdir_fltr_lock);
+}
+
 /**
  * ice_fdir_replay_flows - replay HW Flow Director filter info
  * @hw: pointer to HW instance
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index f858473f6f53..706172e149b9 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -601,6 +601,8 @@ ice_prepare_for_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
 		netif_device_detach(vsi->netdev);
 skip:
 
+	if (hw->fdir_prof)
+		ice_fdir_clear_flow_handles(hw);
 	/* clear SW filtering DB */
 	ice_clear_hw_tbls(hw);
 	/* disable the VSIs and their queues that are not already DOWN */
-- 
2.47.1


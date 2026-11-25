Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646681;
	b=qgkYKTHNOHzuSPrM7Mm45JVDhG2KKE4m8FqbCEAevMvNdB2ZFjYzqwtqea2N9z2PJ/pp
	 2hdihptAjCz22B6ZP/RA//E9uWaT5nM4864KIVsYESCW0v5e/P5Yvq1Bsoh7o6HerYiC4
	 U86hOsaom1TdMsdLPzyX5RTARlLA36lkUgd0j5MSXTqm9AF/wGmUP8fpd3dOwbByoj+Uu
	 uwpNA8RR2GbVL6m/SPE4WdjashNrA1uGRpY0iWSVs2pE7PXuSN4RaSL78vmFA45bFIaQB
	 DiIXOgNzJOXgxa7RoYqwwJls1k/ktvb/DC9I/hxIRrheTDHvTLUSGzq9mN3XJQLzbYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646681;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qYeLGoAwgm/cgx6pTq18obql2cDJa5frceZYseB5iP8=;
	b=0XR6M/xjQ/pZKABQFWlnsm90rd12SWGiETeCZkogI38QrJHX+dsKOlxSr/d0Fj6Xy3cG
	 GCg01deB2TuvcQ89A2W5ZiPhgO8yfaihh6WMEWGCF53UhEWrlTwPat98KVUPxWEvSPulY
	 VSXFAdpQvqVOlW0U6B6BQq8iW2Ix1Bfm6BWRMDujSQ4QK1ZRqtQJ/bZ6URy2/SwSXqi0I
	 ElFym+1m1j+/wNn7YNda/yN7F14xPm7eo3voB7mrFdYGsnDNqIG5lFPgIXOSh4sOVYrSi
	 ZdVsAhK3A67NYA6qRVQ0RzzkzA9aSXVM4piJ5Nt34u2Hr1XMiwVzQY06bJge3ozHQmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FEHv0fN6;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17626606A334
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17626606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FEHv0fN6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795646681; x=1827182681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LzejK4EOwQqhinmsyJ3mMLb/tyA6WLCl2ry2vCHEvXU=;
  b=FEHv0fN6y2hlDNKeYpnvYJ/x7Jrd6RiH5NawlOUT6MnG7gPmAoOMZgGG
   M1XJQI3Dc16DT2P4Pp/B7Rhmrbl23cbod4NFMgj+tsN+rcSEerWvT96cB
   94m1+pb4mMFm/yFBgsTMa78S7yuXJU2Cv5Ut+4jP9vtCRK8GADdaOJlXm
   gZzoghcMYDCA37vRW8Sh/4eLJ2I/4Ql6zcBhnC/5JbwHIhx7T+2p4Dj/i
   D3CUXlxxYol1598myt6v4RcF3aKrAzszl1o0gkBmhCOFqMaMutGmZmvgr
   YeQmKQy0iqd9iTl5C+OOpRqNJK/AjXK449GsNv3uHHai1N+C85m0z1Ul+
   w==;
X-CSE-ConnectionGUID: 3T9hXiToQISjd6Xmkb+zwQ==
X-CSE-MsgGUID: VpAZhjIJQteirKfr5lIytw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4449982"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4449982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:44:38 -0800
X-CSE-ConnectionGUID: NV8YZMZNS8OX6QQ24Azzbw==
X-CSE-MsgGUID: mG1R7vLiSuyuU7ekUP2+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11862068"
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
Cc: Grzegorz Nitka <grzegorz.nitka@intel.com>,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	aaron.ma@canonical.com,
	maciej.machnikowski@intel.com,
	jacob.e.keller@intel.com,
	richardcochran@gmail.com,
	Sergey Temerkhanov <sergey.temerkhanov@intel.com>,
	Milena Olech <milena.olech@intel.com>,
	Simon Horman <horms@kernel.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Ayush Singh <ayush1x.singh@intel.com>
Subject: [PATCH net 4/5] ice: remove redundant cross-timestamp PTP command
Date: Wed, 25 Nov 2026 14:44:23 -0800
Message-ID: <20261125224428.4126195-5-anthony.l.nguyen@intel.com>
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

From: Grzegorz Nitka <grzegorz.nitka@intel.com>

The cross-timestamp capture path programs GLTSYN_CMD with READ_TIME before
starting the ART/device capture and clears it with NOP afterwards.

It was assumed that this change was needed for E823 devices, which
turned out to be not true. The hardware supported by this driver
does not require it.

Since GLTSYN_CMD is shared with other PTP operations, touching it here
only adds a potential race source.
Remove the redundant source command programming instead of adding another
guard around it.

Testing hints:
Verify crosstimestamp path, for example with phc2sys tool, on
E822/E823/E825/E830 devices. Please note that the phc2sys tool performs
cross-timestamping by default when supported by the hardware. This can
be observed when the reported delay is 0, indicating that the system
time and PHC time were latched simultaneously.

Fixes: 88c360e49f51 ("ice: Support cross-timestamping for E823 devices")
Signed-off-by: Grzegorz Nitka <grzegorz.nitka@intel.com>
Reviewed-by: Sergey Temerkhanov <sergey.temerkhanov@intel.com>
Reviewed-by: Milena Olech <milena.olech@intel.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Tested-by: Ayush Singh <ayush1x.singh@intel.com> (A Contingent worker at Intel)
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ice/ice_ptp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
index 8908b4f3db35..db1d0e42ae52 100644
--- a/drivers/net/ethernet/intel/ice/ice_ptp.c
+++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
@@ -2183,9 +2183,6 @@ static int ice_capture_crosststamp(ktime_t *device,
 	/* Snapshot system time for historic interpolation */
 	ktime_get_snapshot_id(ctx->snapshot_clock_id, &ctx->snapshot);
 
-	/* Program cmd to master timer */
-	ice_ptp_src_cmd(hw, ICE_PTP_READ_TIME);
-
 	/* Start the ART and device clock sync sequence */
 	ctl = rd32(hw, cfg->ctl_reg);
 	ctl |= cfg->ctl_active;
@@ -2212,9 +2209,6 @@ static int ice_capture_crosststamp(ktime_t *device,
 	*device = ns_to_ktime(ts);
 
 err_timeout:
-	/* Clear the master timer */
-	ice_ptp_src_cmd(hw, ICE_PTP_NOP);
-
 	/* Release HW lock */
 	lock = rd32(hw, cfg->lock_reg);
 	lock &= ~cfg->lock_busy;
-- 
2.47.1


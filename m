Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647120;
	b=1OBLKep+AIMmlb1BpFKbxKCieayfucj0tw1qpvzdp6T8e6xt44Vhm52wHIFVU8dTXSFA
	 ShbV7arBeIm9nRgMNrFCOSzjoiVELzdfl2FcGtRSaS+AONKWliqfDmW6N2Xp3QqCjzsb7
	 oO1vxpdUdrbW7PMFqe4Yv5CuG9rxl3BcluXrMabJ0EfRhEIvy4QqmMRGh7NEfz2YOBSp2
	 Nla1U0joIxFp5/G/3giiQrh0Quxne7BetRMUr36pC0ZV3A4xJT4pgTvfBIubwQ/a3TT6g
	 eZiLi2WAnv2lD5T8pgCYbiueCjnpwpaJdubm6DsYpKunVA3Ig3rOLXk+tQEENsRNDwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d2K7FkKO8vnqdznDesy8jOHJxWm+6sfNSxcbqGZSJ2g=;
	b=NcOALsTQOfDDNof1a1w8cPMLgZGjoKiBgbEdxvtxymAu1ojdrPzlC/TcOsvk7PomtmiD
	 Uy4bsuE2laKXUoplzCHUh71u27bGbq5ml0MQmrGf4351WjsbsnNvMJCJnqu2Oxs0FiH7K
	 hPjgAlt04bz6HD9EUP1ECbglMwhGop66WG1GqqPp3CZrnjRRhVFBV9oM4aS5SYLXfJKdL
	 QGnTEEYgW0YQDiMudPM+nLCmrbeceLLDTCihtWFVBylBXOX5pB7FUwrHY2HBne2e4/cXE
	 2dOYSlvauvqDdT/g7m0bCbiqlADGecRywwqrRkhMBvHSCl1Ng7UITBraRlIPIAIcViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aSICK0Lk;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65822606A68D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65822606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aSICK0Lk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795647120; x=1827183120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ri3vNvyrQhYhZ+gWNQxuaIvcOOYo2H6YiN4KlBE/NeM=;
  b=aSICK0LklyT8L0V026ma5odGZgJ7jvkaAt625UOdbs3V5NzcdnBmq0ux
   m0TdUyJhRDGd0YmNGIyf4/ErvLR4V8OVqhOnQfs8yn9g6ZWGSfRlAjRqb
   e9nJCs8tMuqEJmYiPThY2LK+ewcVSDuA0X19RndwLsOM3ajEN4i78VG8T
   UnRa6a5JIcXceKrCcCzRyvq+tIM3m7xFh7Vo7ScB7NIMToJVSfTtwRHB9
   N5nr8SS19oBs6AWt2ptqh8dwyiHJZVF4F5t20tlJeaidWHmIlihB7fngF
   OozjFMc67z+lunWkot6f4dqzKJSVqTOiwdgcLzXYiwTqVUR3eaqXxkriD
   w==;
X-CSE-ConnectionGUID: fo1ERCjeRQOPvLrFUkfEHA==
X-CSE-MsgGUID: ERWNglb5RL2qaOP13PxqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4450694"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4450694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:51:55 -0800
X-CSE-ConnectionGUID: QvRFcJIpTF6MhpEmm/sEgQ==
X-CSE-MsgGUID: 0fMoGpS/RsinlulzW48VdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11996949"
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
Subject: [PATCH net 6/6] idpf: release PTP before freeing vports on the init task error path
Date: Wed, 25 Nov 2026 14:51:43 -0800
Message-ID: <20261125225145.4126333-7-anthony.l.nguyen@intel.com>
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

Release PTP, which cancels the aux worker, before the unwind frees the
vports, matching the idpf_vc_core_deinit() order. Previously it was
possible for idpf_ptp_update_cached_phctime() which runs via the PTP
auxiliary worker to read a non-NULL but already freed slot, pass its NULL
check, and dereference the freed vport. This can happen on driver load,
where any vport past the first fails to initialize:

  BUG: KASAN: slab-use-after-free in idpf_ptp_update_cached_phctime+0x4ad/0x4d0 [idpf]
  Read of size 8 at addr ff11002129215050 by task ptp3/10120
  ...
  idpf_ptp_update_cached_phctime+0x4ad/0x4d0 [idpf]
  idpf_ptp_do_aux_work+0x37/0x50 [idpf]
  ptp_aux_kworker+0x64/0xd0
  kthread_worker_fn+0x289/0xa20
  ...
  Allocated by task 8820 on cpu 32 at 2113.761375s:
  idpf_init_task+0x321/0x21c0 [idpf]a
  process_one_work+0x917/0x1940
  worker_thread+0x5a5/0xfe0
  ...
  Freed by task 8820 on cpu 32 at 2113.809014s:
  idpf_vport_dealloc+0x8cf/0x16b0 [idpf]
  idpf_init_task+0x245/0x21c0 [idpf]
  process_one_work+0x917/0x1940
  worker_thread+0x5a5/0xfe0

The aux worker is armed in idpf_vc_core_init() before idpf_init_task() is
queued, so it is live throughout a failing init, leading to the scenario
above.

Fixes: 1a49cf814fe1 ("idpf: add Tx timestamp flows")
Reviewed-by: Madhu Chittim <madhu.chittim@intel.com>
Signed-off-by: Emil Tantilov <emil.s.tantilov@intel.com>
Reported-by: Konstantin Ilichev <konstantin.ilichev@intel.com>
Reviewed-by: Naman Gulati <namangulati@google.com>
Tested-by: Samuel Salin <Samuel.salin@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/idpf/idpf_lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/ethernet/intel/idpf/idpf_lib.c
index 38cb91beacd0..bf59d63bb7ec 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
@@ -1769,6 +1769,8 @@ void idpf_init_task(struct work_struct *work)
 	return;
 
 unwind_vports:
+	idpf_ptp_release(adapter);
+
 	if (default_vport) {
 		for (index = 0; index < adapter->max_vports; index++) {
 			if (adapter->vports[index])
@@ -1782,7 +1784,6 @@ void idpf_init_task(struct work_struct *work)
 		cancel_delayed_work_sync(&adapter->serv_task);
 		cancel_delayed_work_sync(&adapter->mbx_task);
 	}
-	idpf_ptp_release(adapter);
 
 	clear_bit(IDPF_HR_RESET_IN_PROG, adapter->flags);
 }
-- 
2.47.1


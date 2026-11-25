Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646680;
	b=dEDKBap7PM4YBUv4CGW8GsRlNKxNXgJsw9N81+/Fd85KNRrPOUgxQboXl0LechifQ2R/
	 nfp/boibINgHilaEgUQ4ThMFqVeLcqK8PBPqyj0zl/J1yirtHvyqixeKD2cN1Lzq45/mR
	 JEJp1zeqo6PHYWdObbNXOauS+LC58wdWTlF/ZBmK+tIAFR6+9zIObZ2dY6B/764o9oh0O
	 Xge12yhILj0G/qdDCoX1gNqKFwFY85U+j1Mrf25+TpQZfMCEgEwF0xBS6nSjyE7QHKbw/
	 jUZnl3h3X8vVbxNmZC8RRxc2eyTVgI6o9fSSwcUembz+h1rkNF/343cQGB2LwEI6LKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646680;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3/7psO+j+B1dtBowFKAKKFRUUvgxD285ZwR7JqC9Mtw=;
	b=OYzc1l5TWVvECo/E0WXOfFEeXQ06ptd1pykb3TRp5KhtvB3hx2ug3HscpPL2Z8AKGlZG
	 12rhU7Da86Msw3m+TI6QKBF5dqi16TydAoSq+o9cLbAlwdXXi3tBJz78YiacA4yLTClBN
	 nwOKPuB16JjPfKLhuXORNnvZD/Axk39T7xofvMOrzplDdCIuSkI0nhZhYG3ocXh6dR2Ot
	 4XCDtUkLVPCTX1oZvubtz5JqQdqljZZ6qKG1+nLIFyUwqjwIohFeNQQ0Q9Lk5VrLuSB6c
	 U8HvJwjBPQr5Kh3B/koc9Nv3zXirGK2GRJC1z1alRQdYHG1vy6ZpE4vcEkdZ5TrRAjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j4XXdd+e;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A039606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A039606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j4XXdd+e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795646680; x=1827182680;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NuS2CXH34KQrD9bIGvk1dwgROreut5F+EZWR2pebJLE=;
  b=j4XXdd+esHskRyeGffLD1pQmQ187awr6uBmyDuv2iVhxP7yRQXHAx9X5
   fkYKi2vI34igS8RKg/9W4ABulCaRYX1RnIB0j0RQbMi1ZhMzc5nOXXyHK
   IKsAncrD0CIQDV/gTWFyHIfqCKSpdlQ2jyxT0fqPFjoMdSmeGdAY7pVQn
   G34KgO2RBUHmmRGhc8SnUFrCKVqs5mTF/cY44klcTqJ2riXdyCxXeXLR9
   0vNHSKs+oZHgsbKclBtTGnK010Q8Qz/2hNl1pqhXvTQ5MxAtwscPjPJwC
   yCH5YClmE6PhIFsic3f84SXhDXn77Zb2UZ+tMDqMFsJ9GClb00XpRFRp9
   w==;
X-CSE-ConnectionGUID: nPHstTceRlCwZm7i5JpafQ==
X-CSE-MsgGUID: VdrQot2kSCiwJtWrcHaHIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4449954"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4449954"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:44:37 -0800
X-CSE-ConnectionGUID: wdtZ4XQxSC+UdPHqApVE6w==
X-CSE-MsgGUID: a4pr68JOTmWyuv8aNYtAyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11862054"
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
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	przemyslaw.kitszel@intel.com,
	aaron.ma@canonical.com,
	maciej.machnikowski@intel.com,
	grzegorz.nitka@intel.com,
	jacob.e.keller@intel.com
Subject: [PATCH net 0/5][pull request] Intel Wired LAN Driver Updates 2026-11-25 (ice)
Date: Wed, 25 Nov 2026 14:44:19 -0800
Message-ID: <20261125224428.4126195-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
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

Aaron Ma fixes issues around reset; serializing PF rebuilds and clearing
Flow Director handles to prevent stale references.

Maciek Machnikowski stops E825 PHY/PHC clock drift by holding the PTP
semaphore throughout PHY timer startup; protecting shared register
access from concurrent clock adjustments.

Grzegorz Nitka removes redundant PTP command programming to prevent
potential races with other PTP operations.

Jake Keller fixes E830 ETF timestamp calculation by converting the full
ktime value to nanoseconds to scheduled transmit times match the packet
timestamps.
---
Note:
This will have merge conflicts with net-next.

Resolution is:
diff --cc drivers/net/ethernet/intel/ice/ice_adapter.c
index 8cb61f145d27,01b6d3f751ed..a4261568c8d5
--- a/drivers/net/ethernet/intel/ice/ice_adapter.c
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.c
@@@ -49,6 -73,8 +49,7 @@@ static int ice_adapter_init(void *priv
        for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
                mutex_init(&adapter->cpi_phy_lock[i]);
        mutex_init(&adapter->cgu_synce_lock);
+       mutex_init(&adapter->rebuild_lock);
 -      refcount_set(&adapter->refcount, 1);

        spin_lock_init(&adapter->ports.lock);
        INIT_LIST_HEAD(&adapter->ports.list);
---
The following are changes since commit 7ed616970b652ae76d99a01b468588e491021648:
  mptcp: gate diag sequence counters on CAP_NET_ADMIN
and are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue 100GbE

Aaron Ma (2):
  ice: restore DDP state during PFR recovery
  ice: clear Flow Director entries before reset cleanup

Grzegorz Nitka (1):
  ice: remove redundant cross-timestamp PTP command

Jacob Keller (1):
  ice: fix computation of ETF timestamps for E830

Maciek Machnikowski (1):
  ice: ptp: serialize E825 PHY timer start with PTP lock and incval

 drivers/net/ethernet/intel/ice/ice.h          |  1 +
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  2 +
 drivers/net/ethernet/intel/ice/ice_adapter.h  |  3 ++
 .../ethernet/intel/ice/ice_ethtool_ntuple.c   | 26 ++++++++++
 drivers/net/ethernet/intel/ice/ice_main.c     | 37 ++++++++++----
 drivers/net/ethernet/intel/ice/ice_ptp.c      |  6 ---
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c   | 48 ++++++++-----------
 drivers/net/ethernet/intel/ice/ice_txrx.c     |  9 ++--
 .../net/ethernet/intel/ice/ice_vlan_mode.c    |  2 +-
 .../net/ethernet/intel/ice/ice_vlan_mode.h    |  1 +
 10 files changed, 88 insertions(+), 47 deletions(-)

-- 
2.47.1


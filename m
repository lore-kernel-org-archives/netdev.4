Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212052;
	b=au0zYKeVDtIjfgKciFKoZodnw1eJa9hY/WkqpFMVkR8Rt20LLD/WtRtxYUH9ZODismn+
	 1z2Dp+PhRnXga+41evLOsSJDgG52m9LMb/2ne3CNqhW0lKEycISOKirPKXF8kUw7T3ew+
	 swAVQ/pa2aPpqN9nseZFcfQjKyEtDwl87EUqMUfvykB/x0qNf99NdSQEUsWLE5wJxWBny
	 Q9KiMJ/vBvaTkw8ZDz7YBbuxKolv3h+O+8FbASow4fTLxsjKSx0rROcWlMeCzFqMfzqfS
	 FxZxy42Qs6ie1JjRpuoC44iO8NdkT9XCL1lF5w11fZP7aQYx1Kc3Au3JpNoLhR4D6uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212052;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VhngPZ66d6KP3A3aPLmQCW5WQbr/WZdccRoCQPCc6J8=;
	b=okQ3jR6qK5r4rHFVo5m7soB0Eiiu6pahlsma25X/vPbqxeYyHkZuOyoqe3+5wCyAT8xg
	 Byq132Gea9iNUooa0YaduJUb7ynChK5dtF5BJUjzR0HjQDX0tc3synhvxJyBCtHWpxngP
	 WheT/EZNJPsHQLA89SP7eTrbKcH5sIM903B6i2BMazqmVb7N/X9DgpXIM15zEsFA+6FNq
	 K15/m1jtgdKzpB62D1o/fBQMFeHD+Pj0Rz/JnJY8Xr9RgxeLGGpTYtflXdLGVFZn9zozs
	 7lc4K+whb1gs24ewKS3Yoa/dj/Rn5tk+VG1R85XT70KUvhWKW/i77TSgIv5tx7Vo7FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVHXdGMG;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7F606A6A7
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB7F606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVHXdGMG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795212041; x=1826748041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x5ZhLgQo9kJ0zJF1/GsefuMSdRPj8jqNuQjJHhadCYM=;
  b=GVHXdGMGlp05L/uXPqqidALKUZgDCfVwORi41eXnEsxS73CuujZdfkTv
   EAiaLj69u8ndC7TemIqaQnc/bhY49qocIfvWLwCv45+3bjelhAVuJZs7N
   Wj0x7Dv7nRggm+vllxqfzL2fvlBOmILfzk1zyspMJz9M6TVIVf/o/Yq6d
   zLu8DExZIyXnKUn4MDzBDxDjvLpvvooXnrLHMoyyFJYoThIDXqzE8CYnA
   hU/NoPNZ6pJuCtllrB6VKC12kz71ywrBrJzuH+Qds2vU5Y6PkuPHlXFtV
   VcCC1gwFCiMHmewTndRWpc5l5yV67qtAgxacD0LCGrgFAS+CB8vNHgrcW
   g==;
X-CSE-ConnectionGUID: kKJusS03SLmiiYrml651iA==
X-CSE-MsgGUID: ViGs9WPKSCy+D54+1NQqTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3995030"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3995030"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 14:00:37 -0800
X-CSE-ConnectionGUID: jcLnako0QHazDdVHp8emuQ==
X-CSE-MsgGUID: Fznb8oePR6KjSaLT+xbjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10775817"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 14:00:35 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Richard Patel <ripatel@wii.dev>,
	anthony.l.nguyen@intel.com,
	xiaolinkui@kylinos.cn,
	xiaolinkui@126.com,
	tomasz.lichwala@linux.intel.com,
	runyu.xiao@seu.edu.cn,
	stephend@silicom-usa.com,
	f.fainelli@gmail.com,
	Andrew Lunn <andrew@lunn.ch>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Simon Horman <horms@kernel.org>,
	Sunitha Mekala <sunithax.d.mekala@intel.com>
Subject: [PATCH net 1/4] ixgbe: fix MDIO bus lifetime
Date: Fri, 20 Nov 2026 14:00:17 -0800
Message-ID: <20261120220022.3133664-2-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
References: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
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

From: Richard Patel <ripatel@wii.dev>

Plugging in an unsupported SFP module caused ixgbe NICs to get
wedged permanently.

ixgbe unregisters the netdev when rejecting an SFP transceiver as
unsupported.

  ixgbe 0000:3b:00.0: failed to initialize because an unsupported SFP+ module type was detected.
  ixgbe 0000:3b:00.0: Reload the driver after installing a supported module.
  ixgbe 0000:3b:00.0: removed PHC on enp59s0

This code path failed to unregister an MDIO bus owned by that
netdev, so when unregister_netdev() tries to tear it down
(via device_del() -> devres_release_all() -> mdiobus_free()),
it trips over the leaked registration.

  ixgbe-mdio-0000:3b:00.0: not in UNREGISTERED state
  WARNING: drivers/net/phy/mdio_bus_provider.c:711 at mdiobus_free+0x3d/0x50, CPU#21: kworker/u128:0/12

This prevents ixgbe from reloading, even after PCIe remove/rescan:

  sysfs: cannot create duplicate filename '/class/mdio_bus/ixgbe-mdio-0000:3b:00.0'

Switch to devm_mdiobus_register(), drop custom unregister calls.
This is safe because the bus is already devm-allocated, so unregister
always happens before free.

Fixes: 8fa10ef01260 ("ixgbe: register a mdiobus")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Richard Patel <ripatel@wii.dev>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Tested-by: Sunitha Mekala <sunithax.d.mekala@intel.com> (A Contingent worker at Intel)
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 9 ++-------
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c  | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index b9496f0bee13..2b6d1177adda 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -8471,6 +8471,7 @@ static void ixgbe_sfp_detection_subtask(struct ixgbe_adapter *adapter)
 		e_dev_err("Reload the driver after installing a "
 			  "supported module.\n");
 		unregister_netdev(adapter->netdev);
+		adapter->mii_bus = NULL;
 	}
 }
 
@@ -8693,11 +8694,8 @@ static void ixgbe_service_task(struct work_struct *work)
 	}
 	if (ixgbe_check_fw_error(adapter)) {
 		if (!test_bit(__IXGBE_DOWN, &adapter->state)) {
-			if (adapter->mii_bus) {
-				mdiobus_unregister(adapter->mii_bus);
-				adapter->mii_bus = NULL;
-			}
 			unregister_netdev(adapter->netdev);
+			adapter->mii_bus = NULL;
 		}
 		ixgbe_service_event_complete(adapter);
 		return;
@@ -12110,9 +12108,6 @@ static void ixgbe_remove(struct pci_dev *pdev)
 	if (adapter->hw.mac.type == ixgbe_mac_e610)
 		ixgbe_disable_link_status_events(adapter);
 
-	if (adapter->mii_bus)
-		mdiobus_unregister(adapter->mii_bus);
-
 #ifdef CONFIG_IXGBE_DCA
 	if (adapter->flags & IXGBE_FLAG_DCA_ENABLED) {
 		adapter->flags &= ~IXGBE_FLAG_DCA_ENABLED;
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
index ab733e73927d..74631cb2ddbc 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c
@@ -1086,7 +1086,7 @@ int ixgbe_mii_bus_init(struct ixgbe_hw *hw)
 	hw->phy.mdio.mode_support = MDIO_SUPPORTS_C45 | MDIO_SUPPORTS_C22;
 
 	adapter->mii_bus = bus;
-	return mdiobus_register(bus);
+	return devm_mdiobus_register(dev, bus);
 }
 
 /**
-- 
2.47.1


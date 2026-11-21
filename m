Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302129;
	b=iH2K9wc5MExPRPJ9ceK3PTjxqPz900B4lcjN+r+OVRE2KHy65bPvARguombxfhvDcRdG
	 1niEKBF/OS8OA4D6kwaaYlYqo2SvYkvuzP18jGGrgspPUL7pfffjQqSqT1hZl2gIIrGi7
	 logQ3fpwGvpGPbqey8vwwoWXW1zZETT6I61mWf4LGMInvyf2gp4Hwuhu8kL2riNur7zuF
	 vh2NCQixcd3+VyFEjvQfByAC10M/xa7xx6JosMyXzMytpjcSf6WUBMUIdAyjcpQbmJUJ0
	 zv13ncSoBkUNRLQQpQ8Z9eA9ZTW2m+7my0wLr+T2iKnHlwmbZ1cHdKAOlc0raDJHcow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ai0KPY/1t3BeA2h3zzLOwbyQWRS1Ng4gr+Z23LqTJpU=;
	b=qHMY7fBgNY+3vOpoEBlB0/mRB0BNly1GH9yWseppgnfDptpEZ5nQzff2rEAOyJ5IGUJR
	 TczvBNBAhUg7Ej2F1T88Cukpjfq9XBoxs4SKjLwo8OTUhi6ou/COk7YO3TraU1yLudAI7
	 zElhyi7X8JbtVC1MgQVdZwC2NHUSk7VvDJlvFWDGDvJRqTQ5Bt/gvANGcGTfoTfIEKxbu
	 bcMypODFDrEXQ8T67YpyonTPaPvbVTRP3m8wfKM9NMPv3YrGAitkCjDKBKBrrzv26ipmW
	 XIjuXhanBdxnzB1iX3g3IE2c0pBfcOjcbXlJeiSINTh+cOcqUg+3XF7H20pzVmFe7Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SOCE3n9A;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6B606A335
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA6B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SOCE3n9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302129; x=1826838129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=En8AutN3engXEC4Y+dDqk7YBHXkCgEYMcNS00QYO3rY=;
  b=SOCE3n9A4c27VhEST+Bb++OHFFO8v+SxdgCmqWnn2oM12Bu8W0tXnrZJ
   qmsHqivJUVZ488qJUZ4LzNZ/PwQ9NvF7tjVKRZVXRcRbYywkxXeWaKTyO
   Ad/MOBmC7zDt9pmPPfKCdAw/Yxln8+DU1bXCS+KvARuy31vVYI5WJnsdx
   S3nmWNf9TV48OYLVnGValVFpFmTFPFYI8tDCpwkHZRBmeGqW1GwXznXlv
   FhdadmXn1cqshdCWFfT4QDUfAK/jWVjkzJ8XGNos3s3e3A5iYiHsxQMzU
   CQzf0ahRItcvmQdDhy2ltHWflWqTd6yRWX+6rj+tKfkKG7oGdUVZkDDh/
   w==;
X-CSE-ConnectionGUID: xnLEjupOQpKUN1kRAXbSGw==
X-CSE-MsgGUID: /IdfG5YKT8Cmk+GhrVPJlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4032429"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4032429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:02:08 -0800
X-CSE-ConnectionGUID: m82V1nFxRgmdx9Pk29WasA==
X-CSE-MsgGUID: PkQNd/JOQCKwWAUstZiTOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11316608"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2026 15:02:00 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id D4F7D33BC3;
	Sat, 21 Nov 2026 23:01:57 +0000 (GMT)
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
Subject: [PATCH net-next v7 13/15] ice: represent RSS LUTs as devlink resources
Date: Sat, 21 Nov 2026 23:55:40 +0100
Message-ID: <20261121230123.316391-14-przemyslaw.kitszel@intel.com>
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

E800 family offers three kinds of RSS LUTs: VSI LUT (sized 64), GLOBAL LUT
(sized 512), and PF LUT (sized 2048). Until now the GLOBAL kind was not
used at all. There are two possible usages for it, subsequent commit will
give VF option to acquire it, and this one enables PF to switch between PF
LUT and GLOBAL LUT - switching to smaller one is, again, to make it
possible for VF to then acquire the former one.

Devlink resources are used to let user show current usage and change the
allocation, see examples below.

Each PF has a "rss_lut" resource, the size of its RSS LUT in entries.
It is a runtime resource, a new size applies immediately. The whole
device devlink instance reports how many LUTs of each kind the device has,
and how many of them are in use (occ), those are read-only.

Default state on a card with 8 PFs, asking the "whole device" instance,
note that there are as many PF LUTs as there are PFs, and, for e810, there
are 16 GLOBAL LUTs:
$ devlink resource show devlink_index/11
devlink_index/11:
  name rss_lut_512 size 16 occ 0 unit entry dpipe_tables none
  name rss_lut_2048 size 8 occ 8 unit entry dpipe_tables none

Now let's switch a PF to a GLOBAL LUT:
$ sudo devlink resource set pci/0000:18:00.0 path rss_lut size 512
And show its resources after that:
$ devlink resource show pci/0000:18:00.0
pci/0000:18:00.0:
  name rss_lut size 512 unit entry size_min 512 size_max 2048 size_gran 512 dpipe_tables none
now `ethtool -x $ifacename` will report smaller RSS table.

Changing the LUT of a PF keeps the RSS indirection table set by the user,
ethtool_rxfh_indir_resize() repeats it to fill a bigger LUT, and folds it
into a smaller one. A change to a smaller LUT that the table can't be
folded into is rejected. Without a user table the new LUT gets the
default spread. The PF LUT change is done under rtnl, as the ethtool core
sizes its RSS buffers by the table size, and records the size of the user
table, under rtnl.

FW drops RSS LUT assignments on reset, so the driver gives the PF its PF
LUT back after each reset, with the user table repeated to fill it, and
logs when that discards a devlink change. Changes are rejected with -EBUSY
while a reset is in progress.

RSS LUTs can't be changed while ADQ is configured, or with RSS disabled,
e.g. in safe mode. ADQ can't be configured while the RSS LUTs of the PF
are reassigned.

Keep the NAC topology in the safe mode caps, otherwise the PFs of the
secondary NAC collide with the primary ones in the table of LUT owners.
ice_is_dual() and ice_is_primary() now answer the same in safe mode as
in the normal mode.

Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v7:
 * keep the user RSS indirection table when the PF LUT changes, also on
   reset, instead of resetting it to the default spread: it is repeated
   to fill a bigger LUT, and folded into a smaller one, with
   ethtool_rxfh_indir_resize(); a change to a smaller LUT that the table
   can't be folded into is rejected (Jakub)
 * reject a PF LUT change when the user RSS indirection table uses
   queues that the new LUT can't spread traffic to (me)
 * one runtime "rss_lut" resource per PF, the size of its LUT in entries,
   no more two-step switch via lut_512/lut_2048 counts, no "rss" parent
   resource (Jakub); a small deviation: a new size applies right away,
   it is the LUT in use, not a cap for the next LUT allocation
 * whole device rss_lut_512 and rss_lut_2048: size is the number of LUTs
   of the device, occ is how many of them are in use, read-only (Jakub)
 * move rss_lut_lock, setting the default RSS LUT type only on VSI
   init, and the Q_OPT source of the RDMA filter toggle to a new patch,
   "ice: prepare RSS LUT config for runtime LUT changes" (Jakub)
 * move the PF rss_size limit on a LUT change here from "ice: support
   up to 256 VF queues", along with its changelog entries; with this
   patch alone a PF with more than 64 queues put queue ids above 63 into
   a GLOBAL LUT (me)
 * reject RSS LUT changes with RSS disabled, e.g. in safe mode (me)
 * ice.rst: say how many queues each kind of RSS LUT spreads traffic
   to (Sashiko)
 * check the global LUT ID from FW against the size of the table, it is
   used as an index (Sashiko)
 * one owner table for PF LUTs and one per NAC for global LUTs, instead
   of a table per devlink resource ID plus one for global LUTs of the
   secondary NAC (me)
 * clear ICE_FLAG_TC_MQPRIO when the ADQ setup fails, it blocked RSS
   LUT changes until mqprio was reconfigured (Sashiko)
 * commit message: describe the ADQ and safe mode handling (Sashiko)

v5:
 * keep the NAC topology in safe mode caps, secondary NAC PFs collided
   with primary ones in the devlink RSS LUT table (Sashiko)
 * fix the kernel-doc opener of ice_rss_lut_resource_state(), the whole
   comment was ignored (me)
 * assert rss_lut_lock in ice_vsi_update_rss_lut() (me)
 * don't set rss_size of the PF VSI when restoring its PF LUT after
   reset, the PF VSI rebuild right after sets the default anyway
   (Sashiko)

v4:
 * take rtnl when devlink changes the RSS LUT of the PF, the new LUT is
   filled based on NETIF_F_RXHASH, which raced with ndo_set_features
   (Sashiko)
 * drop the -EAGAIN checks from get/set_rxfh, they broke ethtool -L after
   ethtool -X, and were hit after the hash function and key were already
   written (Sashiko); the PF RSS LUT size now changes only under rtnl,
   also on reset (me)
 * tell the ethtool core when the user RSS LUT is dropped, on devlink LUT
   change and on reset (Sashiko)
 * reject devlink RSS LUT changes while a reset is in progress, they
   could leak a global LUT (Sashiko)
 * log when a reset discards a devlink RSS LUT assignment (Sashiko)
 * drop global RSS LUTs of the PF from the table already in
   ice_prepare_for_reset(), FW frees them on reset and could give them
   to other PFs before our rebuild cleaned the table, that hit the WARN
   in ice_devl_res_take() when LUT changes raced resets of other PFs (me)
 * taking adapter devl there also waits for devlink RSS LUT changes that
   checked for a reset just before it was requested, they could still
   leak a global LUT (Sashiko)
 * keep the specific extack message and the real errno when a LUT change
   fails (Sashiko)
 * declare rel_err at function scope, a declaration right after a label
   does not build with GCC < 11 and breaks sparse (Jakub)
 * document the devlink resources in ice.rst (Sashiko)

v3:
 * don't free the user RSS LUT in ice_vsi_decfg(), it was done outside
   of pf->rss_lut_lock, and is redundant anyway: ice_vsi_cfg_def() frees
   it under the lock when the LUT size changes (Sashiko)
 * fill the new RSS LUT under rss_lut_lock (me)
 * keep PF RSS LUT zeroed on change when RXHASH is disabled (me)
 * restore default RSS LUT assignment of PF after reset, FW drops it
 * dual-NAC: each NAC numbers its PFs from 0, offset secondary NAC PFs by
   ICE_PORTS_PER_QUAD in the devlink resource table, reserve
   2 * ICE_PORTS_PER_QUAD PF LUT slots
 * dual-NAC: FW of each NAC numbers its global LUTs from 0, keep a separate
   global LUT table for the secondary NAC
 * register PF devlink resources only in the regular probe path, not in
   FW recovery mode, where pf->adapter is NULL
 * restore VF aggregator node accounting in ice_vsi_decfg(), removed by
   mistake (me)
 * drop PF RSS LUT ownership also in ice_deinit_pf(), ice_vsi_decfg()
   skips it after a NO_INIT VSI rebuild (me)
 * drop a stray debug change of the error message in ice_get_rss_lut()

v2:
 * replace -ENOANO with proper WARN_ON for "assumption error" (Alex)
 * fix goto label (Sashiko)
 * avoid queues being 0 in ADQ mode (Sashiko)
 * undo ice_take_rss_lut_pf() on error path (Sashiko)
 * program the PF VSI context with the new LUT type and global LUT ID
   after writing the LUT, so the PF really switches to the new table;
   publish the global LUT ID to the VSI only after a successful switch
 * limit PF rss_size to the queue capacity of its current RSS LUT
   (64 for GLOBAL) on devlink LUT switch; restore it from num_rxq when
   switching back to the PF LUT
 * drop the cached user RSS LUT when the RSS table size changes, on
   devlink LUT switch and on reset
 * use logical_pf_id for all PF bookkeeping of devlink resources, as the
   PF LUT resource is sized by the number of functions
 * warn when FW fails to free a global RSS LUT
 * return -EAGAIN from get/set_rxfh when the LUT was resized after
   the core sized the indirection table
 * reject ADQ when RSS LUTs are reassigned via devlink, and reject
   devlink RSS LUT changes when ADQ is configured (-EOPNOTSUPP)
 * remove trailing whitespace
 * commit message: GLOBAL LUT is sized 512, not 256
---
 Documentation/networking/devlink/ice.rst      |  59 ++
 drivers/net/ethernet/intel/ice/Makefile       |   1 +
 .../net/ethernet/intel/ice/devlink/resource.h |  25 +
 drivers/net/ethernet/intel/ice/ice.h          |   2 +-
 drivers/net/ethernet/intel/ice/ice_adapter.h  |  29 +
 drivers/net/ethernet/intel/ice/ice_common.h   |   1 +
 drivers/net/ethernet/intel/ice/ice_lib.h      |   3 +
 .../net/ethernet/intel/ice/devlink/resource.c | 643 ++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  19 +-
 drivers/net/ethernet/intel/ice/ice_common.c   |   5 +-
 drivers/net/ethernet/intel/ice/ice_lib.c      |  57 +-
 drivers/net/ethernet/intel/ice/ice_main.c     |  27 +-
 12 files changed, 864 insertions(+), 7 deletions(-)
 create mode 100644 drivers/net/ethernet/intel/ice/devlink/resource.h
 create mode 100644 drivers/net/ethernet/intel/ice/devlink/resource.c

diff --git a/Documentation/networking/devlink/ice.rst b/Documentation/networking/devlink/ice.rst
index 792e9f8c846a..d410dd6bb29f 100644
--- a/Documentation/networking/devlink/ice.rst
+++ b/Documentation/networking/devlink/ice.rst
@@ -485,3 +485,62 @@ and arbitration among them is based on assigned weights.
 
     # assign tx_share to the VF
     $ devlink port function rate set pci/0000:4b:00.0/2 tx_share 500Mbps
+
+Resources
+=========
+
+The ``ice`` driver exposes the RSS lookup tables (LUTs) of the device as
+devlink resources. E800 devices have three kinds of RSS LUTs: a VSI LUT
+(64 entries) for each VSI, 16 global LUTs (512 entries) for each NAC of the
+device, and a PF LUT (2048 entries) for each PF. By default each PF uses its
+PF LUT. RSS spreads traffic over up to 16 queues with a VSI LUT, 64 with
+a global LUT, and 256 with a PF LUT.
+
+.. list-table:: Resources implemented
+    :widths: 15 15 70
+
+    * - Name
+      - Instance
+      - Description
+    * - ``rss_lut``
+      - PF
+      - The size of the RSS LUT of the function, 512 or 2048 for a PF.
+        Only these sizes are accepted, not every multiple of ``size_gran``.
+        A new size applies immediately (``runtime`` configuration mode).
+    * - ``rss_lut_512``
+      - whole device
+      - The number of global LUTs of the device, ``occ`` is how many of them
+        are in use. Read-only.
+    * - ``rss_lut_2048``
+      - whole device
+      - The number of PF LUTs of the device, ``occ`` is how many of them are
+        in use. Read-only.
+
+The whole device devlink instance is shared by all PFs of the device.
+
+Changing the LUT of a PF keeps the RSS indirection table set with
+``ethtool -X``, also when a reset gives the PF LUT back to the PF. The table
+is repeated to fill a bigger LUT. A change to a smaller LUT is rejected if
+the table doesn't fit it, reset the table with ``ethtool -X <dev> default``
+first.
+
+RSS LUTs can't be changed while ADQ is configured, and ADQ can't be
+configured while the RSS LUTs of the PF are reassigned.
+
+Firmware drops the LUT assignments on reset (PFR, CORER or GLOBR). The
+driver then restores the default assignment, and logs that it did so.
+Changes are rejected with ``EBUSY`` while a reset is in progress.
+
+.. code:: shell
+
+    # whole device on a card with 8 PFs
+    $ devlink resource show devlink_index/11
+    devlink_index/11:
+      name rss_lut_512 size 16 occ 0 unit entry dpipe_tables none
+      name rss_lut_2048 size 8 occ 8 unit entry dpipe_tables none
+
+    # switch a PF to a global LUT
+    $ devlink resource set pci/0000:18:00.0 path rss_lut size 512
+    $ devlink resource show pci/0000:18:00.0
+    pci/0000:18:00.0:
+      name rss_lut size 512 unit entry size_min 512 size_max 2048 size_gran 512 dpipe_tables none
diff --git a/drivers/net/ethernet/intel/ice/Makefile b/drivers/net/ethernet/intel/ice/Makefile
index a952bacb7ec7..e50e02efbf7a 100644
--- a/drivers/net/ethernet/intel/ice/Makefile
+++ b/drivers/net/ethernet/intel/ice/Makefile
@@ -34,6 +34,7 @@ ice-y := ice_main.o	\
 	 devlink/devlink.o	\
 	 devlink/health.o \
 	 devlink/port.o \
+	 devlink/resource.o \
 	 ice_sf_eth.o	\
 	 ice_sf_vsi_vlan_ops.o \
 	 ice_ddp.o	\
diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.h b/drivers/net/ethernet/intel/ice/devlink/resource.h
new file mode 100644
index 000000000000..a41bda0ff6c8
--- /dev/null
+++ b/drivers/net/ethernet/intel/ice/devlink/resource.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2026, Intel Corporation. */
+
+#ifndef _ICE_DEVL_RESOURCE_H_
+#define _ICE_DEVL_RESOURCE_H_
+
+#include <linux/types.h>
+
+struct devlink;
+struct ice_adapter;
+struct ice_hw;
+struct ice_pf;
+
+void ice_devl_pf_resources_register(struct ice_pf *pf);
+void ice_devl_whole_dev_resources_register(const struct ice_hw *hw,
+					   struct ice_adapter *adapter);
+
+bool ice_rss_lut_is_reassigned(struct ice_pf *pf);
+int ice_take_rss_lut_pf(struct ice_pf *pf);
+void ice_release_rss_lut_pf(struct ice_pf *pf);
+void ice_prepare_rss_luts_for_reset(struct ice_pf *pf);
+int ice_rebuild_rss_luts(struct ice_pf *pf);
+void ice_free_rss_lut_flr(struct ice_pf *pf);
+
+#endif /* _ICE_DEVL_RESOURCE_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 4de947165a08..611f1346b4a7 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -1114,7 +1114,7 @@ extern const struct xdp_metadata_ops ice_xdp_md_ops;
  * Acceleration Complex) configuration variant, false otherwise
  * (always false for non-E825 devices).
  */
-static inline bool ice_is_dual(struct ice_hw *hw)
+static inline bool ice_is_dual(const struct ice_hw *hw)
 {
 	return hw->mac_type == ICE_MAC_GENERIC_3K_E825 &&
 	       (hw->dev_caps.nac_topo.mode & ICE_NAC_TOPO_DUAL_M);
diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.h b/drivers/net/ethernet/intel/ice/ice_adapter.h
index 698a5b9af82f..f031b0596032 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.h
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.h
@@ -16,6 +16,26 @@
 struct pci_dev;
 struct ice_pf;
 
+enum ice_devl_resource_id {
+	ICE_TOP_RESOURCE = DEVLINK_RESOURCE_ID_PARENT_TOP,
+	ICE_RSS_LUT,		/* RSS LUT size of a PF or VF */
+	ICE_RSS_LUT_GLOBAL,	/* global RSS LUTs of the device */
+	ICE_RSS_LUT_PF,		/* PF RSS LUTs of the device */
+};
+
+#define ICE_MAX_DEVL_RESOURCE_UNITS 16
+
+/**
+ * struct ice_devl_resource - owners of the RSS LUTs of one type
+ *
+ * @owner: entity that owns given resource (like ptr to ice_pf or ice_vf)
+ * @pf_id: on which PF the VF is (or just PF id when PF is the owner)
+ */
+struct ice_devl_resource {
+	void *owner[ICE_MAX_DEVL_RESOURCE_UNITS];
+	u8 pf_id[ICE_MAX_DEVL_RESOURCE_UNITS];
+};
+
 /**
  * struct ice_port_list - data used to store the list of adapter ports
  *
@@ -46,6 +66,9 @@ struct ice_port_list {
  *                  which all PFs reach. Used on E825C devices.
  * @ctrl_pf: Control PF of the adapter
  * @ports: Ports list
+ * @pf_luts: owners of the PF RSS LUTs of the device
+ * @global_luts: owners of the global RSS LUTs of the primary and the
+ *		 secondary NAC, FW of each NAC numbers them from 0
  */
 struct ice_adapter {
 	struct devlink *devlink;
@@ -61,9 +84,15 @@ struct ice_adapter {
 
 	struct ice_pf *ctrl_pf;
 	struct ice_port_list ports;
+
+	struct ice_devl_resource pf_luts;
+	struct ice_devl_resource global_luts[2];
 };
 
 struct ice_adapter *ice_adapter_get(struct pci_dev *pdev);
 void ice_adapter_put(struct ice_adapter *adapter);
 
+DEFINE_GUARD(ice_adapter_devl, struct ice_adapter *,
+	     devl_lock((_T)->devlink), devl_unlock((_T)->devlink))
+
 #endif /* _ICE_ADAPTER_H */
diff --git a/drivers/net/ethernet/intel/ice/ice_common.h b/drivers/net/ethernet/intel/ice/ice_common.h
index d1d674ca644f..d019ec759eda 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.h
+++ b/drivers/net/ethernet/intel/ice/ice_common.h
@@ -125,6 +125,7 @@ int ice_read_txq_ctx(struct ice_hw *hw, struct ice_tlan_ctx *tlan_ctx,
 int ice_write_txq_ctx(struct ice_hw *hw, struct ice_tlan_ctx *tlan_ctx,
 		      u32 txq_index);
 
+enum ice_lut_size ice_lut_type_to_size(enum ice_lut_type type);
 int
 ice_aq_get_rss_lut(struct ice_hw *hw, struct ice_aq_get_set_rss_lut_params *get_params);
 int
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.h b/drivers/net/ethernet/intel/ice/ice_lib.h
index e0d3ae067f35..320edbdece3d 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_lib.h
@@ -49,6 +49,9 @@ int ice_vsi_cfg_tc(struct ice_vsi *vsi, u8 ena_tc);
 
 int ice_vsi_cfg_rss_lut_key(struct ice_vsi *vsi);
 
+int ice_vsi_update_rss_lut(struct ice_vsi *vsi, enum ice_lut_type lut_type,
+			   u8 global_lut_id);
+
 void ice_vsi_cfg_netdev_tc(struct ice_vsi *vsi, u8 ena_tc);
 
 struct ice_vsi *
diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.c b/drivers/net/ethernet/intel/ice/devlink/resource.c
new file mode 100644
index 000000000000..c07f61acdaed
--- /dev/null
+++ b/drivers/net/ethernet/intel/ice/devlink/resource.c
@@ -0,0 +1,643 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026, Intel Corporation. */
+
+#include "resource.h"
+#include "ice_adapter.h"
+#include "ice.h"
+#include "ice_lib.h"
+
+#define ICE_NUM_GLOBAL_LUTS	16
+#define ICE_ANY_SLOT		-1
+
+/* each NAC numbers its PFs from 0, secondary NAC ones go after primary ones */
+static int ice_devl_pf_id(struct ice_pf *pf)
+{
+	struct ice_hw *hw = &pf->hw;
+
+	if (ice_is_primary(hw))
+		return hw->logical_pf_id;
+
+	return hw->logical_pf_id + ICE_PORTS_PER_QUAD;
+}
+
+/* each NAC has its own global LUTs, with IDs given by its FW */
+static struct ice_devl_resource *
+ice_devl_res_tbl(struct ice_pf *pf, enum ice_devl_resource_id res_id)
+{
+	if (res_id == ICE_RSS_LUT_GLOBAL)
+		return &pf->adapter->global_luts[!ice_is_primary(&pf->hw)];
+
+	return &pf->adapter->pf_luts;
+}
+
+static u32 ice_devl_res_cnt(const struct ice_devl_resource *res)
+{
+	u32 sum = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(res->owner); i++)
+		sum += res->owner[i] != NULL;
+
+	return sum;
+}
+
+static int ice_devl_res_take(struct ice_pf *pf,
+			     enum ice_devl_resource_id res_id, int slot,
+			     void *owner)
+{
+	struct ice_devl_resource *res = ice_devl_res_tbl(pf, res_id);
+	int beg, end, new_id = ICE_ANY_SLOT;
+	u16 lut_id;
+
+	if (res_id == ICE_RSS_LUT_GLOBAL) {
+		int err;
+
+		WARN_ON_ONCE(slot != ICE_ANY_SLOT);
+
+		err = ice_alloc_rss_global_lut(&pf->hw, &lut_id);
+		if (err)
+			return err;
+		if (lut_id >= ARRAY_SIZE(res->owner)) {
+			ice_free_rss_global_lut(&pf->hw, lut_id);
+			return -EIO;
+		}
+
+		slot = lut_id;
+	}
+
+	end = slot == ICE_ANY_SLOT ? ARRAY_SIZE(res->owner) : slot + 1;
+	beg = slot == ICE_ANY_SLOT ? 0 : slot;
+	for (int id = beg; id < end; id++) {
+		if (!res->owner[id]) {
+			new_id = id;
+			break;
+		}
+	}
+	if (new_id == ICE_ANY_SLOT) {
+		if (WARN_ON(res_id == ICE_RSS_LUT_GLOBAL))
+			ice_free_rss_global_lut(&pf->hw, lut_id);
+
+		return -ENOSPC;
+	}
+
+	res->owner[new_id] = owner;
+	res->pf_id[new_id] = ice_devl_pf_id(pf);
+	return new_id;
+}
+
+static int ice_devl_res_free(struct ice_pf *pf,
+			     enum ice_devl_resource_id res_id, void *owner)
+{
+	struct ice_devl_resource *res = ice_devl_res_tbl(pf, res_id);
+	int err = 0, id_to_free = ICE_ANY_SLOT;
+
+	for (int i = 0; i < ARRAY_SIZE(res->owner); i++) {
+		if (res->owner[i] == owner) {
+			id_to_free = i;
+			break;
+		}
+	}
+	if (id_to_free == ICE_ANY_SLOT)
+		return 0;
+
+	if (res_id == ICE_RSS_LUT_GLOBAL) {
+		err = ice_free_rss_global_lut(&pf->hw, id_to_free);
+		if (err)
+			dev_warn(ice_pf_to_dev(pf), "failed to free global RSS LUT %d, leaked until PF reset: %d\n",
+				 id_to_free, err);
+	}
+
+	res->owner[id_to_free] = NULL;
+	return err;
+}
+
+static void ice_free_rss_lut_flr_locked(struct ice_pf *pf)
+{
+	int pf_id = ice_devl_pf_id(pf);
+	struct ice_devl_resource *res;
+
+	devl_assert_locked(pf->adapter->devlink);
+	pf->adapter->pf_luts.owner[pf_id] = NULL;
+
+	res = ice_devl_res_tbl(pf, ICE_RSS_LUT_GLOBAL);
+	for (int i = 0; i < ARRAY_SIZE(res->owner); i++) {
+		/* On FLR/PFR resources assigned to PF are cleared by FW,
+		 * reflect that in the SW table.
+		 * VFs on given PF must be de-programmed too.
+		 */
+		if (res->pf_id[i] == pf_id)
+			res->owner[i] = NULL;
+	}
+}
+
+void ice_free_rss_lut_flr(struct ice_pf *pf)
+{
+	scoped_guard(ice_adapter_devl, pf->adapter)
+		ice_free_rss_lut_flr_locked(pf);
+}
+
+static int ice_devl_res_owned_idx(struct ice_pf *pf,
+				  enum ice_devl_resource_id res_id, void *owner)
+{
+	const struct ice_devl_resource *res = ice_devl_res_tbl(pf, res_id);
+
+	for (int i = 0; i < ARRAY_SIZE(res->owner); i++) {
+		if (res->owner[i] == owner)
+			return i;
+	}
+
+	return -ENXIO;
+}
+
+static bool ice_is_devl_res_owned_by(struct ice_pf *pf,
+				     enum ice_devl_resource_id res_id,
+				     void *owner)
+{
+	return ice_devl_res_owned_idx(pf, res_id, owner) >= 0;
+}
+
+static u64 ice_rss_lut_whole_dev_occ_get_global(void *priv)
+{
+	struct ice_adapter *adapter = priv;
+
+	return ice_devl_res_cnt(&adapter->global_luts[0]) +
+	       ice_devl_res_cnt(&adapter->global_luts[1]);
+}
+
+static u64 ice_rss_lut_whole_dev_occ_get_pf(void *priv)
+{
+	struct ice_adapter *adapter = priv;
+
+	return ice_devl_res_cnt(&adapter->pf_luts);
+}
+
+static enum ice_lut_type ice_rss_lut_type(struct ice_pf *pf, void *owner)
+{
+	if (ice_is_devl_res_owned_by(pf, ICE_RSS_LUT_PF, owner))
+		return ICE_LUT_PF;
+	if (ice_is_devl_res_owned_by(pf, ICE_RSS_LUT_GLOBAL, owner))
+		return ICE_LUT_GLOBAL;
+
+	return ICE_LUT_VSI;
+}
+
+static u64 ice_rss_lut_pf_size_get(void *priv)
+{
+	struct ice_pf *pf = priv;
+
+	scoped_guard(ice_adapter_devl, pf->adapter) {
+		enum ice_lut_type type = ice_rss_lut_type(pf, pf);
+
+		/* reset in progress, it gives the PF its PF LUT back */
+		if (type == ICE_LUT_VSI)
+			type = ICE_LUT_PF;
+		return ice_lut_type_to_size(type);
+	}
+}
+
+static int ice_rss_lut_user_resize(struct ice_vsi *vsi,
+				   enum ice_lut_type lut_type, u8 **user_lut,
+				   struct netlink_ext_ack *extack)
+{
+	int qs_num = ice_lut_type_to_qs_num(lut_type);
+	int size = ice_lut_type_to_size(lut_type);
+	struct net_device *netdev = vsi->netdev;
+	int old_size = vsi->rss_table_size;
+	u32 max_q = 0;
+	int err = 0;
+	u32 *indir;
+	u8 *lut;
+
+	if (!netdev || !vsi->rss_lut_user || !netif_is_rxfh_configured(netdev))
+		return 0;
+
+	indir = kmalloc_objs(*indir, max(old_size, size));
+	if (!indir)
+		return -ENOMEM;
+
+	for (int i = 0; i < old_size; i++) {
+		indir[i] = vsi->rss_lut_user[i];
+		max_q = max(max_q, indir[i]);
+	}
+	if (!ethtool_rxfh_indir_can_resize(netdev, indir, old_size, size)) {
+		NL_SET_ERR_MSG_FMT_MOD(extack,
+				       "can't fold the RSS indirection table to %d entries, reset it first",
+				       size);
+		err = -EINVAL;
+		goto out;
+	}
+	if (max_q >= qs_num) {
+		NL_SET_ERR_MSG_FMT_MOD(extack,
+				       "RSS indirection table uses queue %u, the new LUT is limited to %d queues",
+				       max_q, qs_num);
+		err = -EINVAL;
+		goto out;
+	}
+
+	lut = devm_kmalloc(ice_pf_to_dev(vsi->back), size, GFP_KERNEL);
+	if (!lut) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	ethtool_rxfh_indir_resize(netdev, indir, old_size, size);
+	for (int i = 0; i < size; i++)
+		lut[i] = indir[i];
+	*user_lut = lut;
+out:
+	kfree(indir);
+	return err;
+}
+
+static int ice_change_rss_lut(struct ice_pf *pf, void *owner,
+			      enum ice_lut_type lut_type,
+			      struct netlink_ext_ack *extack)
+{
+	struct ice_aq_get_set_rss_lut_params params = {};
+	struct ice_hw *hw = &pf->hw;
+	int err, lut_size, lut_id;
+	struct ice_vsi *vsi;
+	u8 *user_lut = NULL;
+	u16 rss_size;
+	u8 *lut;
+
+	if (lut_type == ICE_LUT_GLOBAL) {
+		lut_id = ice_devl_res_owned_idx(pf, ICE_RSS_LUT_GLOBAL, owner);
+		if (lut_id < 0)
+			return lut_id;
+
+		params.global_lut_id = lut_id;
+	}
+
+	if (pf == owner) {
+		vsi = ice_get_main_vsi(pf);
+	} else {
+		return -EOPNOTSUPP;
+	}
+
+	lut_size = ice_lut_type_to_size(lut_type);
+	lut = kzalloc(lut_size, GFP_KERNEL);
+	if (!lut)
+		return -ENOMEM;
+	params.lut = lut;
+	params.lut_size = lut_size;
+	params.lut_type = lut_type;
+	params.vsi_handle = vsi->idx;
+	mutex_lock(&pf->rss_lut_lock);
+	rss_size = min(vsi->num_rxq, ice_lut_type_to_qs_num(lut_type));
+	err = ice_rss_lut_user_resize(vsi, lut_type, &user_lut, extack);
+	if (err)
+		goto out;
+	/* PF with RXHASH disabled keeps its LUT zeroed */
+	if (!vsi->netdev || vsi->netdev->features & NETIF_F_RXHASH) {
+		if (user_lut)
+			memcpy(lut, user_lut, lut_size);
+		else
+			ice_fill_rss_lut(lut, lut_size, rss_size);
+	}
+	err = ice_aq_set_rss_lut(hw, &params);
+	if (err) {
+		NL_SET_ERR_MSG_FMT(extack, "AQ failed: %s", libie_aq_str(hw->adminq.sq_last_status));
+		goto out;
+	}
+
+	err = ice_vsi_update_rss_lut(vsi, lut_type, params.global_lut_id);
+	if (err)
+		goto out;
+
+	devm_kfree(ice_pf_to_dev(pf), vsi->rss_lut_user);
+	vsi->rss_lut_user = user_lut;
+	user_lut = NULL;
+	if (lut_type == ICE_LUT_GLOBAL)
+		vsi->global_lut_id = params.global_lut_id;
+	vsi->rss_table_size = lut_size;
+	vsi->rss_lut_type = lut_type;
+	vsi->rss_size = rss_size;
+out:
+	mutex_unlock(&pf->rss_lut_lock);
+	devm_kfree(ice_pf_to_dev(pf), user_lut);
+	kfree(lut);
+	return err;
+}
+
+static enum ice_devl_resource_id ice_rss_lut_res_id(enum ice_lut_type type)
+{
+	return type == ICE_LUT_PF ? ICE_RSS_LUT_PF : ICE_RSS_LUT_GLOBAL;
+}
+
+static int ice_rss_lut_set(struct ice_pf *pf, void *owner, u64 size,
+			   struct netlink_ext_ack *extack)
+{
+	enum ice_lut_type old_type, new_type;
+	int err, slot;
+
+	if (!test_bit(ICE_FLAG_RSS_ENA, pf->flags)) {
+		NL_SET_ERR_MSG_MOD(extack, "RSS is not supported");
+		return -EOPNOTSUPP;
+	}
+
+	switch (size) {
+	case ICE_LUT_VSI_SIZE:
+		new_type = ICE_LUT_VSI;
+		break;
+	case ICE_LUT_GLOBAL_SIZE:
+		new_type = ICE_LUT_GLOBAL;
+		break;
+	case ICE_LUT_PF_SIZE:
+		new_type = ICE_LUT_PF;
+		break;
+	default:
+		NL_SET_ERR_MSG_MOD(extack, "RSS LUT size must be 512 or 2048");
+		return -EINVAL;
+	}
+
+	old_type = ice_rss_lut_type(pf, owner);
+	if (new_type == old_type)
+		return 0;
+
+	/* reset rebuilds the table and the VSIs, see ice_rebuild_rss_luts(),
+	 * pairs with adapter devl taken in ice_prepare_rss_luts_for_reset()
+	 */
+	if (ice_is_reset_in_progress(pf->state)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "reset in progress, try again later");
+		return -EBUSY;
+	}
+
+	/* pairs with set_bit() under adapter devl in ice_setup_tc_mqprio_qdisc() */
+	if (test_bit(ICE_FLAG_TC_MQPRIO, pf->flags)) {
+		NL_SET_ERR_MSG_MOD(extack, "ADQ configured, can't change RSS LUTs");
+		return -EOPNOTSUPP;
+	}
+
+	if (new_type != ICE_LUT_VSI) {
+		slot = ICE_ANY_SLOT;
+		if (new_type == ICE_LUT_PF)
+			slot = ice_devl_pf_id(pf);
+		err = ice_devl_res_take(pf, ice_rss_lut_res_id(new_type), slot,
+					owner);
+		if (err < 0) {
+			if (new_type == ICE_LUT_PF)
+				NL_SET_ERR_MSG_MOD(extack,
+						   "PF LUT is used by another function");
+			else
+				NL_SET_ERR_MSG_MOD(extack,
+						   "failed to get a global RSS LUT");
+			return err;
+		}
+	}
+
+	err = ice_change_rss_lut(pf, owner, new_type, extack);
+	if (err) {
+		NL_SET_ERR_MSG_WEAK_MOD(extack, "failed to change RSS LUT");
+		if (new_type != ICE_LUT_VSI)
+			ice_devl_res_free(pf, ice_rss_lut_res_id(new_type),
+					  owner);
+		return err;
+	}
+
+	if (old_type != ICE_LUT_VSI)
+		ice_devl_res_free(pf, ice_rss_lut_res_id(old_type), owner);
+
+	return 0;
+}
+
+/* ethtool core sizes RSS buffers by rss_table_size under rtnl, and the new
+ * LUT is filled based on NETIF_F_RXHASH, which is also changed under rtnl
+ */
+static int ice_rss_lut_pf_size_set(u64 size, struct netlink_ext_ack *extack,
+				   void *priv)
+{
+	struct ice_pf *pf = priv;
+	int err;
+
+	rtnl_lock();
+	scoped_guard(ice_adapter_devl, pf->adapter)
+		err = ice_rss_lut_set(pf, pf, size, extack);
+	rtnl_unlock();
+
+	return err;
+}
+
+/**
+ * ice_rss_lut_is_reassigned - check if RSS LUTs of PF are in non-default state
+ * @pf: the PF to check
+ *
+ * Return: true if @pf lost its PF LUT, or @pf or any of its VFs owns a
+ * global LUT. Caller must hold the adapter devlink lock.
+ */
+bool ice_rss_lut_is_reassigned(struct ice_pf *pf)
+{
+	int pf_id = ice_devl_pf_id(pf);
+	struct ice_devl_resource *res;
+
+	devl_assert_locked(pf->adapter->devlink);
+	if (pf->adapter->pf_luts.owner[pf_id] != pf)
+		return true;
+
+	res = ice_devl_res_tbl(pf, ICE_RSS_LUT_GLOBAL);
+	for (int i = 0; i < ARRAY_SIZE(res->owner); i++)
+		if (res->owner[i] && res->pf_id[i] == pf_id)
+			return true;
+
+	return false;
+}
+
+/**
+ * ice_take_rss_lut_pf - allocate PF RSS LUT for PF
+ * @pf: the PF device that PF LUT is physically on, and to allocate it for
+ *
+ * Acquire PF RSS LUT for the caller.
+ *
+ * Return: 0 on success, negative on error.
+ */
+int ice_take_rss_lut_pf(struct ice_pf *pf)
+{
+	int ret, pf_id = ice_devl_pf_id(pf);
+
+	scoped_guard(ice_adapter_devl, pf->adapter) {
+		ret = ice_devl_res_take(pf, ICE_RSS_LUT_PF, pf_id, pf);
+		if (ret >= 0)
+			return 0;
+
+		return ret;
+	}
+}
+
+/**
+ * ice_release_rss_lut_pf - release PF RSS LUT of PF
+ * @pf: the PF device that PF LUT is physically on, and to release it from
+ *
+ * Release PF RSS LUT for the caller.
+ *
+ * No need to call this function in normal operation, provided for error path.
+ */
+void ice_release_rss_lut_pf(struct ice_pf *pf)
+{
+	scoped_guard(ice_adapter_devl, pf->adapter)
+		ice_devl_res_free(pf, ICE_RSS_LUT_PF, pf);
+}
+
+/**
+ * ice_prepare_rss_luts_for_reset - drop global RSS LUTs of PF from the table
+ * @pf: the PF that is about to be reset
+ *
+ * FW frees global RSS LUTs of the PF and its VFs on reset, and other PFs may
+ * get them from FW before ice_rebuild_rss_luts() of @pf, so drop them from
+ * the table now. Taking the lock also waits for RSS LUT changes that checked
+ * for reset just before it was requested.
+ */
+void ice_prepare_rss_luts_for_reset(struct ice_pf *pf)
+{
+	int pf_id = ice_devl_pf_id(pf);
+	struct ice_devl_resource *res;
+
+	scoped_guard(ice_adapter_devl, pf->adapter) {
+		if (ice_rss_lut_is_reassigned(pf))
+			dev_info(ice_pf_to_dev(pf),
+				 "reset restores the default RSS LUT assignment\n");
+
+		res = ice_devl_res_tbl(pf, ICE_RSS_LUT_GLOBAL);
+		for (int i = 0; i < ARRAY_SIZE(res->owner); i++)
+			if (res->pf_id[i] == pf_id)
+				res->owner[i] = NULL;
+	}
+}
+
+/**
+ * ice_rebuild_rss_lut_pf - restore default RSS LUT assignment after reset
+ * @pf: the PF that was reset
+ *
+ * FW drops RSS LUT assignments of the PF on reset, so give the PF LUT back to
+ * the PF, and make the PF VSI use it.
+ * Must be called before the VSIs are rebuilt.
+ *
+ * Return: 0 on success, negative on error.
+ */
+static int ice_rebuild_rss_lut_pf(struct ice_pf *pf)
+{
+	struct ice_vsi *vsi = ice_get_main_vsi(pf);
+	struct ice_adapter *adapter = pf->adapter;
+	u8 *user_lut = NULL;
+	int err;
+
+	devl_lock(adapter->devlink);
+	ice_free_rss_lut_flr_locked(pf);
+	err = ice_devl_res_take(pf, ICE_RSS_LUT_PF, ice_devl_pf_id(pf), pf);
+	if (err < 0)
+		goto unlock;
+
+	mutex_lock(&pf->rss_lut_lock);
+	if (vsi && vsi->rss_lut_type != ICE_LUT_PF) {
+		/* growing fails only on ENOMEM, losing the user RSS LUT */
+		ice_rss_lut_user_resize(vsi, ICE_LUT_PF, &user_lut, NULL);
+		devm_kfree(ice_pf_to_dev(pf), vsi->rss_lut_user);
+		vsi->rss_lut_user = user_lut;
+		vsi->rss_table_size = ice_lut_type_to_size(ICE_LUT_PF);
+		vsi->rss_lut_type = ICE_LUT_PF;
+	}
+	mutex_unlock(&pf->rss_lut_lock);
+	err = 0;
+unlock:
+	devl_unlock(adapter->devlink);
+
+	return err;
+}
+
+/**
+ * ice_rebuild_rss_luts - restore default RSS LUT assignment after reset
+ * @pf: the PF that was reset
+ *
+ * Wrapper of ice_rebuild_rss_lut_pf() that also tells the ethtool core when
+ * the user RSS LUT was dropped. Must be called without rtnl held.
+ *
+ * Return: 0 on success, negative on error.
+ */
+int ice_rebuild_rss_luts(struct ice_pf *pf)
+{
+	struct ice_vsi *vsi = ice_get_main_vsi(pf);
+	int err;
+
+	/* ethtool core sizes RSS buffers by rss_table_size under rtnl */
+	rtnl_lock();
+	err = ice_rebuild_rss_lut_pf(pf);
+	if (vsi && vsi->netdev && !vsi->rss_lut_user &&
+	    netif_is_rxfh_configured(vsi->netdev))
+		ethtool_rxfh_indir_lost(vsi->netdev);
+	rtnl_unlock();
+
+	return err;
+}
+
+static void ice_devl_hw_res_register(struct devlink *devlink, const char *name,
+				     enum ice_devl_resource_id res_id, u64 cnt,
+				     devlink_resource_occ_get_t *occ_get,
+				     struct ice_adapter *adapter)
+{
+	struct devlink_resource_size_params size_params;
+	int err;
+
+	devlink_resource_size_params_init(&size_params, cnt, cnt, 1,
+					  DEVLINK_RESOURCE_UNIT_ENTRY);
+	err = devl_resource_register(devlink, name, cnt, res_id,
+				     ICE_TOP_RESOURCE, &size_params);
+	if (WARN_ONCE(err, "failed to register devlink resource %s: %d\n",
+		      name, err))
+		return;
+
+	devl_resource_occ_get_register(devlink, res_id, occ_get, adapter);
+}
+
+static void ice_devl_rss_lut_register(struct devlink *devlink, u64 size_min,
+				      devlink_resource_size_get_t *size_get,
+				      devlink_resource_size_set_t *size_set,
+				      void *priv)
+{
+	struct devlink_resource_size_params size_params;
+	int err;
+
+	devlink_resource_size_params_init(&size_params, size_min,
+					  ICE_LUT_PF_SIZE, size_min,
+					  DEVLINK_RESOURCE_UNIT_ENTRY);
+	err = devl_resource_register(devlink, "rss_lut", size_get(priv),
+				     ICE_RSS_LUT, ICE_TOP_RESOURCE,
+				     &size_params);
+	if (WARN_ONCE(err, "failed to register devlink resource rss_lut: %d\n",
+		      err))
+		return;
+
+	devl_resource_runtime_register(devlink, ICE_RSS_LUT, size_get, size_set,
+				       priv);
+}
+
+void ice_devl_whole_dev_resources_register(const struct ice_hw *hw,
+					   struct ice_adapter *adapter)
+{
+	struct devlink *devlink = adapter->devlink;
+	int global_lut_cnt = ICE_NUM_GLOBAL_LUTS;
+	int pf_lut_cnt = hw->dev_caps.num_funcs;
+
+	devl_assert_locked(devlink);
+	/* see ice_devl_pf_id() and ice_devl_res_tbl() */
+	if (ice_is_dual(hw)) {
+		global_lut_cnt = 2 * ICE_NUM_GLOBAL_LUTS;
+		pf_lut_cnt = 2 * ICE_PORTS_PER_QUAD;
+	}
+
+	ice_devl_hw_res_register(devlink, "rss_lut_512", ICE_RSS_LUT_GLOBAL,
+				 global_lut_cnt,
+				 ice_rss_lut_whole_dev_occ_get_global, adapter);
+	ice_devl_hw_res_register(devlink, "rss_lut_2048", ICE_RSS_LUT_PF,
+				 pf_lut_cnt, ice_rss_lut_whole_dev_occ_get_pf,
+				 adapter);
+}
+
+void ice_devl_pf_resources_register(struct ice_pf *pf)
+{
+	struct devlink *devlink = priv_to_devlink(pf);
+
+	devl_assert_locked(devlink);
+	/* PF can't use a VSI LUT */
+	ice_devl_rss_lut_register(devlink, ICE_LUT_GLOBAL_SIZE,
+				  ice_rss_lut_pf_size_get,
+				  ice_rss_lut_pf_size_set, pf);
+}
diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.c b/drivers/net/ethernet/intel/ice/ice_adapter.c
index 8cb61f145d27..1d12af48f065 100644
--- a/drivers/net/ethernet/intel/ice/ice_adapter.c
+++ b/drivers/net/ethernet/intel/ice/ice_adapter.c
@@ -9,6 +9,8 @@
 #include "ice_adapter.h"
 #include "ice.h"
 
+#include "devlink/resource.h"
+
 #define ICE_ADAPTER_FIXED_INDEX	BIT_ULL(63)
 
 #define ICE_ADAPTER_INDEX_E825C	\
@@ -38,8 +40,10 @@ static u64 ice_adapter_index(struct pci_dev *pdev)
 
 static int ice_adapter_init(void *priv, void *init_param)
 {
+	const struct ice_hw *hw = init_param;
 	struct ice_adapter *adapter = priv;
 	struct devlink *devlink;
+	int err;
 
 	devlink = shd_priv_to_devlink(adapter);
 	adapter->devlink = devlink;
@@ -53,12 +57,22 @@ static int ice_adapter_init(void *priv, void *init_param)
 	spin_lock_init(&adapter->ports.lock);
 	INIT_LIST_HEAD(&adapter->ports.list);
 
-	return init_srcu_struct(&adapter->ports.srcu);
+	err = init_srcu_struct(&adapter->ports.srcu);
+	if (err)
+		return err;
+
+	ice_devl_whole_dev_resources_register(hw, adapter);
+
+	return 0;
 }
 
 static void ice_adapter_fini(void *priv)
 {
 	struct ice_adapter *adapter = priv;
+	struct devlink *devlink;
+
+	devlink = shd_priv_to_devlink(adapter);
+	devl_resources_unregister(devlink);
 
 	WARN_ON(!list_empty(&adapter->ports.list));
 	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
@@ -88,15 +102,16 @@ static const struct devlink_ops ice_adapter_devlink_ops = {
  */
 struct ice_adapter *ice_adapter_get(struct pci_dev *pdev)
 {
+	struct ice_pf *pf = pci_get_drvdata(pdev);
 	struct ice_adapter *adapter;
 	struct devlink *devlink;
 	char devlink_id[32];
 	u64 index;
 
 	index = ice_adapter_index(pdev);
 	snprintf(devlink_id, sizeof(devlink_id), "ice:%llx", index);
 	devlink = devlink_shd_get(devlink_id, &ice_adapter_devlink_ops,
-				  sizeof(*adapter), NULL, pdev->dev.driver);
+				  sizeof(*adapter), &pf->hw, pdev->dev.driver);
 	if (IS_ERR(devlink))
 		return ERR_CAST(devlink);
 
diff --git a/drivers/net/ethernet/intel/ice/ice_common.c b/drivers/net/ethernet/intel/ice/ice_common.c
index 90e01eb49ea2..48c3449a2434 100644
--- a/drivers/net/ethernet/intel/ice/ice_common.c
+++ b/drivers/net/ethernet/intel/ice/ice_common.c
@@ -3184,6 +3184,7 @@ void ice_set_safe_mode_caps(struct ice_hw *hw)
 	struct ice_hw_func_caps *func_caps = &hw->func_caps;
 	struct ice_hw_dev_caps *dev_caps = &hw->dev_caps;
 	struct ice_hw_common_caps cached_caps;
+	struct ice_nac_topology nac_topo;
 	u32 num_funcs;
 
 	/* cache some func_caps values that should be restored after memset */
@@ -3217,6 +3218,7 @@ void ice_set_safe_mode_caps(struct ice_hw *hw)
 	/* cache some dev_caps values that should be restored after memset */
 	cached_caps = dev_caps->common_cap;
 	num_funcs = dev_caps->num_funcs;
+	nac_topo = dev_caps->nac_topo;
 
 	/* unset dev capabilities */
 	memset(dev_caps, 0, sizeof(*dev_caps));
@@ -3235,6 +3237,7 @@ void ice_set_safe_mode_caps(struct ice_hw *hw)
 	ICE_RESTORE_DEV_CAP(nvm_update_pending_orom);
 	ICE_RESTORE_DEV_CAP(nvm_update_pending_netlist);
 	dev_caps->num_funcs = num_funcs;
+	dev_caps->nac_topo = nac_topo;
 
 	/* one Tx and one Rx queue per function in safe mode */
 	dev_caps->common_cap.num_rxq = num_funcs;
@@ -4450,7 +4453,7 @@ ice_aq_sff_eeprom(struct ice_hw *hw, u16 lport, u8 bus_addr,
 	return status;
 }
 
-static enum ice_lut_size ice_lut_type_to_size(enum ice_lut_type type)
+enum ice_lut_size ice_lut_type_to_size(enum ice_lut_type type)
 {
 	switch (type) {
 	case ICE_LUT_VSI:
diff --git a/drivers/net/ethernet/intel/ice/ice_lib.c b/drivers/net/ethernet/intel/ice/ice_lib.c
index 57425683c0d4..a65dd342246c 100644
--- a/drivers/net/ethernet/intel/ice/ice_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_lib.c
@@ -10,6 +10,8 @@
 #include "ice_type.h"
 #include "ice_vsi_vlan_ops.h"
 
+#include "devlink/resource.h"
+
 #define ICE_LUT_VSI_MAX_QS	16
 #define ICE_LUT_GLOBAL_MAX_QS	64
 #define ICE_LUT_PF_MAX_QS	256
@@ -1341,6 +1343,34 @@ static void ice_set_rss_vsi_ctx(struct ice_vsi_ctx *ctxt, struct ice_vsi *vsi)
 		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_HASH_M, hash_type);
 }
 
+int ice_vsi_update_rss_lut(struct ice_vsi *vsi, enum ice_lut_type lut_type,
+			   u8 global_lut_id)
+{
+	struct ice_vsi_ctx *ctx;
+	int err;
+
+	lockdep_assert_held(&vsi->back->rss_lut_lock);
+
+	ctx = kzalloc_obj(*ctx);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->info.valid_sections = cpu_to_le16(ICE_AQ_VSI_PROP_Q_OPT_VALID);
+	ctx->info.q_opt_rss = vsi->info.q_opt_rss &
+		~(ICE_AQ_VSI_Q_OPT_RSS_LUT_M | ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_M);
+	ctx->info.q_opt_rss |= FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_LUT_M,
+				ice_lut_type_to_aq_qopt_rss_val(lut_type)) |
+		FIELD_PREP(ICE_AQ_VSI_Q_OPT_RSS_GBL_LUT_M, global_lut_id);
+	ctx->info.q_opt_tc = vsi->info.q_opt_tc;
+	ctx->info.q_opt_flags = vsi->info.q_opt_flags;
+
+	err = ice_update_vsi(&vsi->back->hw, vsi->idx, ctx, NULL);
+	if (!err)
+		vsi->info.q_opt_rss = ctx->info.q_opt_rss;
+	kfree(ctx);
+	return err;
+}
+
 static void
 ice_chnl_vsi_setup_q_map(struct ice_vsi *vsi, struct ice_vsi_ctx *ctxt)
 {
@@ -2471,8 +2501,15 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
 	vsi->vsw = pf->first_sw;
 
 	if (vsi->flags & ICE_VSI_FLAG_INIT) {
-		scoped_guard(mutex, &pf->rss_lut_lock)
+		scoped_guard(mutex, &pf->rss_lut_lock) {
+			u16 lut_size = vsi->rss_table_size;
+
 			ice_vsi_set_dflt_rss_lut_type(vsi);
+			if (vsi->rss_table_size != lut_size) {
+				devm_kfree(dev, vsi->rss_lut_user);
+				vsi->rss_lut_user = NULL;
+			}
+		}
 	}
 
 	ret = ice_vsi_alloc_def(vsi, vsi->ch);
@@ -2495,15 +2532,23 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
 
 	/* set RSS capabilities */
 	ice_vsi_set_rss_params(vsi);
+	if ((vsi->flags & ICE_VSI_FLAG_INIT) && vsi->type == ICE_VSI_PF) {
+		ret = ice_take_rss_lut_pf(pf);
+		if (ret) {
+			dev_err(dev, "Failed to allocate RSS LUT for PF: %d\n",
+				ret);
+			goto unroll_get_qs;
+		}
+	}
 
 	/* set TC configuration */
 	ice_vsi_set_tc_cfg(vsi);
 
 	/* create the VSI */
 	scoped_guard(mutex, &pf->rss_lut_lock)
 		ret = ice_vsi_init(vsi, vsi->flags);
 	if (ret)
-		goto unroll_get_qs;
+		goto unroll_pf_rss_lut;
 
 	ice_vsi_init_vlan_ops(vsi);
 
@@ -2615,6 +2660,9 @@ static int ice_vsi_cfg_def(struct ice_vsi *vsi)
 	ice_vsi_free_q_vectors(vsi);
 unroll_vsi_init:
 	ice_vsi_delete_from_hw(vsi);
+unroll_pf_rss_lut:
+	if ((vsi->flags & ICE_VSI_FLAG_INIT) && vsi->type == ICE_VSI_PF)
+		ice_release_rss_lut_pf(pf);
 unroll_get_qs:
 	ice_vsi_put_qs(vsi);
 unroll_vsi_alloc_stat:
@@ -2692,6 +2740,11 @@ void ice_vsi_decfg(struct ice_vsi *vsi)
 	if (vsi->type == ICE_VSI_VF &&
 	    vsi->agg_node && vsi->agg_node->valid)
 		vsi->agg_node->num_vsis--;
+
+	if (vsi->flags & ICE_VSI_FLAG_INIT) {
+		if (vsi->type == ICE_VSI_PF)
+			ice_free_rss_lut_flr(pf);
+	}
 }
 
 /**
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 3e8cf1c5f0e8..5f0de7cf0a8e 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -15,6 +15,7 @@
 #include "ice_dcb_nl.h"
 #include "devlink/devlink.h"
 #include "devlink/port.h"
+#include "devlink/resource.h"
 #include "ice_sf_eth.h"
 #include "ice_hwmon.h"
 /* Including ice_trace.h with CREATE_TRACE_POINTS defined will generate the
@@ -546,6 +547,8 @@ ice_prepare_for_reset(struct ice_pf *pf, enum ice_reset_req reset_type)
 	if (test_bit(ICE_PREPARED_FOR_RESET, pf->state))
 		return;
 
+	ice_prepare_rss_luts_for_reset(pf);
+
 	synchronize_irq(pf->oicr_irq.virq);
 
 	ice_unplug_aux_dev(pf);
@@ -3873,6 +3876,8 @@ void ice_deinit_pf(struct ice_pf *pf)
 {
 	/* note that we unroll also on ice_init_pf() failure here */
 
+	/* ice_vsi_decfg() skips it if the last VSI rebuild was NO_INIT */
+	ice_free_rss_lut_flr(pf);
 	mutex_destroy(&pf->rss_lut_lock);
 	mutex_destroy(&pf->lag_mutex);
 	mutex_destroy(&pf->adev_mutex);
@@ -4964,6 +4969,7 @@ static void ice_deinit_devlink(struct ice_pf *pf)
 	ice_devlink_unregister(pf);
 	ice_devlink_destroy_regions(pf);
 	ice_devlink_unregister_params(pf);
+	devl_resources_unregister(priv_to_devlink(pf));
 }
 
 static int ice_init(struct ice_pf *pf)
@@ -5285,6 +5291,7 @@ ice_probe(struct pci_dev *pdev, const struct pci_device_id __always_unused *ent)
 	err = ice_init_devlink(pf);
 	if (err)
 		goto unroll_load;
+	ice_devl_pf_resources_register(pf);
 	devl_unlock(priv_to_devlink(pf));
 
 	return 0;
@@ -7770,6 +7777,12 @@ static void ice_rebuild(struct ice_pf *pf, enum ice_reset_req reset_type)
 	if (ice_is_feature_supported(pf, ICE_F_GNSS))
 		ice_gnss_init(pf);
 
+	err = ice_rebuild_rss_luts(pf);
+	if (err) {
+		dev_err(dev, "RSS LUT rebuild failed: %d\n", err);
+		goto err_vsi_rebuild;
+	}
+
 	/* rebuild PF VSI */
 	err = ice_vsi_rebuild_by_type(pf, ICE_VSI_PF);
 	if (err) {
@@ -7927,6 +7940,8 @@ int ice_set_rss_lut(struct ice_vsi *vsi, u8 *lut, u16 lut_size)
 	params.lut_size = lut_size;
 	params.lut_type = vsi->rss_lut_type;
 	params.lut = lut;
+	if (params.lut_type == ICE_LUT_GLOBAL)
+		params.global_lut_id = vsi->global_lut_id;
 
 	status = ice_aq_set_rss_lut(hw, &params);
 	if (status)
@@ -7980,6 +7995,8 @@ int ice_get_rss_lut(struct ice_vsi *vsi, u8 *lut, u16 lut_size)
 	params.lut_size = lut_size;
 	params.lut_type = vsi->rss_lut_type;
 	params.lut = lut;
+	if (params.lut_type == ICE_LUT_GLOBAL)
+		params.global_lut_id = vsi->global_lut_id;
 
 	status = ice_aq_get_rss_lut(hw, &params);
 	if (status)
@@ -9194,8 +9211,14 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
 				   ret);
 			return ret;
 		}
+		scoped_guard(ice_adapter_devl, pf->adapter) {
+			if (ice_rss_lut_is_reassigned(pf)) {
+				dev_err(dev, "RSS LUTs reassigned via devlink, can't configure ADQ\n");
+				return -EOPNOTSUPP;
+			}
+			set_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
+		}
 		memcpy(&vsi->mqprio_qopt, mqprio_qopt, sizeof(*mqprio_qopt));
-		set_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
 		/* don't assume state of hw_tc_offload during driver load
 		 * and set the flag for TC flower filter if hw_tc_offload
 		 * already ON
@@ -9263,6 +9286,7 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
 		clear_bit(ICE_RESET_FAILED, pf->state);
 		if (ice_vsi_rebuild(vsi, ICE_VSI_FLAG_NO_INIT)) {
 			dev_err(dev, "Rebuild of main VSI failed again\n");
+			clear_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
 			return ret;
 		}
 	}
@@ -9315,6 +9339,7 @@ static int ice_setup_tc_mqprio_qdisc(struct net_device *netdev, void *type_data)
 	if (ret) {
 		vsi->all_numtc = 0;
 		vsi->all_enatc = 0;
+		clear_bit(ICE_FLAG_TC_MQPRIO, pf->flags);
 	}
 	/* resume VSI */
 	ice_ena_vsi(vsi, true);
-- 
2.51.1


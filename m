Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302132;
	b=uB51G26A14uqE03V80tEXm5jaNllOWSQqyUIvc+VeppO8Yt69z767BDXPNfTiUBTkBL9
	 BgGFgjFO4yd3SvdgHBeVPlib2GDchREnIunWtAn0hwoVKa4k3eZXJrdsJJ4B5l7W2F8Cm
	 PbqHSmr+Mp//N5RS1SmdcrG9vay/+TJYg9zBkAkmVstss7PTg68zebGVySM01EPoT9no3
	 7TY6xcKr83HmtyLID5Q2izNRqQHYaYIZ7ZHbPIplDjj1Svb9DphfP0wZV9c9Vatdxw0ug
	 a1DYkBYQYlq1fEIeE35wKGBUQ5IS1Cz1bPiw+PJdk3Yrkr/14pjLBvY54qR9E1PyLHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302132;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KcY38Fl+YwQTiCHcNvp4uO2Rc3qq5/1cyZJYuBUANso=;
	b=KmhVMqNxNvZgkt56hFBIdkBqbQHZlnfzlagot/Qf/y15JS4BKGum+zPwq56CqzJD2B46
	 gpiLOAD/+diBpmzvpYM3NJzp8s4IE94vKctKedoCQkmKvCsgnMrgJN7t4snxIZQp6EOvN
	 /8hW7BluxThWneScPk8nhXld8p6QsLVejQB2ckxaC91mH9oQF69ZchNno59VSJppTfsQx
	 lGnSsl+AAS0hPQoZQSCcfirv1gdUhPfjQ6DH4qbS3iOyb6G8Nq9F1S7ULmQnuzNalJpuW
	 F1MepI8C2TwSIQL0a6fwNu4mnwTS8cvD0gOTi6RqQEpAMRlI+ofAhRzD7qChxmhhwhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GowGlVL0;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0A606A338
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B0A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GowGlVL0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302132; x=1826838132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ISCbdul4F8CJ18ZK+Oz/cm3m68NJ8bsVbMysugPoHkw=;
  b=GowGlVL0ulLnFeJz5EoVOou6zEu7JdM1qxRsTdD2YtK1UHZKCt39Ck1T
   DvlIKQuUawDIYpZMu1CUr6kXKMlkvqqh1jvqwC1eTej6pJFlLbF40Y+aX
   tIe4wf4FRXqZJSawXded0UtJEUHoK6c6ZC8tknYezpuLeT7pT16kDL0LU
   vaOss4SN5ndf4sx5OMcnrLboOtcFAl4l7LZZZXJulzYCAbLgaVbIqcvf8
   9hjPiLXzCEo+ETyyHbpJXo4vN0d8EcDO6Rfi9mpnMUxoj7HIMA5B1Jf25
   5WubYf0TbG5uF/wNQV1pW+IURigs4wJWQztCby/lYJo1r0P5qjP44w/3Z
   g==;
X-CSE-ConnectionGUID: tTI8H8uLQDaj0qXZru+bQA==
X-CSE-MsgGUID: fAO39f7+S8ORPh5pPs7Y7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040283"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:02:11 -0800
X-CSE-ConnectionGUID: wLcyNlw6SuWLjSVrsAoX9A==
X-CSE-MsgGUID: U8BmqLJlT5yoQPnpU4mskQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857093"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:02:04 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id D573033BC4;
	Sat, 21 Nov 2026 23:02:01 +0000 (GMT)
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
Subject: [PATCH net-next v7 15/15] ice: support up to 256 VF queues
Date: Sat, 21 Nov 2026 23:55:42 +0100
Message-ID: <20261121230123.316391-16-przemyslaw.kitszel@intel.com>
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

Add support for up to 256 VF queues. To enable more than usual 16, user
needs to give the VF a bigger RSS LUT, via devlink resource "rss_lut" of
the VF: size 512 (one of GLOBAL LUTs) for 64 queues, or size 2048 (the PF
LUT of its PF) for maximum of 256 queues. The PF LUT is initially used by
the PF, so the PF has to switch to a GLOBAL LUT first, see examples further
below. iavf asks for one queue pair per CPU when it initializes on a VF
with a bigger RSS LUT. A VF that is already up keeps its queue count,
until more queues are requested by usual ethtool -L command.

Hook up the VIRTCHNL_OP_ENABLE_QUEUES_V2, VIRTCHNL_OP_DISABLE_QUEUES_V2
and VIRTCHNL_OP_MAP_QUEUE_VECTOR handlers, with the get_q_vector
callback of SR-IOV VFs, add the VIRTCHNL_OP_GET_MAX_RSS_QREGION handler,
and grant VIRTCHNL_VF_LARGE_NUM_QPAIRS to VFs with a GLOBAL or PF LUT.

Add devlink instance of VF device to track RSS LUT resources under
a respective PF devlink instance.

Number of MSI-X vectors assigned to VF is orthogonal to this.

Note that VF reset is deferred to service task. A message from the VF
while that reset is pending does the reset instead, without a reply, so
the VF never sees a half-applied change.

Raise the VIRTCHNL_OP_REQUEST_QUEUES limit of 16 queues to what the RSS
LUT of the VF can address. A VF request for more queues is granted only
when the VF fits in one free range of PF queues (its own queues count as
free), as scattered queue mapping is not implemented for VFs. A write
to sriov_vf_msix_count fails with -ENOSPC when the VF would not fit. A
VF without VIRTCHNL_VF_LARGE_NUM_QPAIRS can still request at most 16
queues, and its RSS LUT of 64 entries is repeated to fill the bigger LUT
of its VSI.

Mark VFs disabled when preparing for a PF reset, until
ice_reset_all_vfs() rebuilds them, so devlink does not change the RSS
LUT of a VF in between. If the VSI rebuild of a VF fails, clear that
mark anyway, so a VFLR can still reset the VF.

How to use:
1. Up to 64 queues
   a. give the VF one of 16 GLOBAL LUTs:
      sudo devlink resource set pci/0000:18:01.0 path rss_lut size 512
   b. if more queues are wanted:
      sudo ethtool -L $vfiface combined $more

2. Up to 256 queues
   a. switch the PF to a GLOBAL LUT, that frees its PF LUT:
      sudo devlink resource set pci/0000:18:00.0 path rss_lut size 512
   b. give the PF LUT to the VF:
      sudo devlink resource set pci/0000:18:01.0 path rss_lut size 2048
   c. if more queues are wanted:
      sudo ethtool -L $vfiface combined $more

3. display current RSS LUT or RSS table:
   a. see if RSS is mapped correctly (e.g. for size 512 there are 512
      entries expected):
      ethtool -x $vfiface
   b. see what devlink devices are present:
      devlink dev show # note the "whole dev aggregate" device over your pci netdevs
   c. see PF, VF, and "whole device aggregate" resources:
      devlink resource show pci/0000:18:00.0 # PF
      devlink resource show pci/0000:18:01.0 # VF
      devlink resource show devlink_index/3 # whole dev

output will look like below, for a VF with a GLOBAL LUT:
pci/0000:18:01.0:
  name rss_lut size 512 unit entry size_min 64 size_max 2048 size_gran 64 dpipe_tables none

Big thanks to Mateusz for working together on the whole story for long
time! Big thanks to Alex Loktionov for pointing the reason of one nasty
bug with the message size!

Co-developed-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Signed-off-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Signed-off-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Reviewed-by: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v7:
 * one runtime "rss_lut" resource per VF, like for the PF, the size of
   its RSS LUT in entries (Jakub); a VF switches between LUTs in one
   step, and goes back to its VSI LUT with size 64
 * move capping the RSS queue count by the RSS LUT type to a new patch,
   "ice: prepare RSS LUT config for runtime LUT changes" (Jakub)
 * move the PF rss_size limit on a LUT change, with its changelog
   entries, to "ice: represent RSS LUTs as devlink resources", which
   needs it already (me)
 * raise the VIRTCHNL_OP_REQUEST_QUEUES limit here, not in "ice: bump to
   256qs for VF", which lacked the check that the queues fit in one free
   range (me)
 * don't join the ret and len declarations in ice_vc_get_vf_res_msg(),
   this patch doesn't touch them otherwise (me)
 * unregister the VF devlink instances before pci_disable_sriov(), not
   after the VF PCI devices they belong to are gone (me)
 * clear the disabled state of a VF whose VSI rebuild failed on a PF
   reset, it blocked the VFLR that can recover the VF (me)
 * check that the VF queues fit in one free range of PF queues also when
   sriov_vf_msix_count changes their count, and return -ENOSPC before
   anything is torn down (me)
 * commit message: describe the deferred VF reset done by the next VF
   message, the queue range check, the 16 queue limit without
   VIRTCHNL_VF_LARGE_NUM_QPAIRS, and VFs marked disabled on PF reset
   (Sashiko)
 * commit message: a VF that is already up keeps its queue count when it
   gets a bigger RSS LUT, until ethtool -L asks for more; list the LARGE
   VF opcodes hooked up here (me)

v6:
 * document in ice.rst that VF queues must fit in one free range of PF
   queues, so with many VFs only a few get 64 queues, and 256 may not be
   available even with a PF LUT (Petr)

v5:
 * keep reporting the 64 entry RSS LUT to VFs without
   VIRTCHNL_VF_LARGE_NUM_QPAIRS, and repeat their LUT over the bigger
   LUT of the VSI; iavf before this series allocates its LUT buffer
   only once, and overflowed it after a bigger LUT was assigned (Petr)
 * grant REQUEST_QUEUES only when the VF fits in one free range of Tx
   and Rx queues, counting its own queues as free; scattered mapping
   is not implemented for VFs, and requests of 64 or 256 queues
   fragmented the PF queue space, so VFs came up with unprogrammed
   queues (Petr)
 * offer no more queues than that in the reply to a too big request,
   not just the RSS LUT limit (Sashiko)
 * drop the check against ICE_MAX_QS_PER_VF, the RSS LUT limit is never
   bigger (me)
 * mark VFs disabled when preparing for PF reset, until
   ice_reset_all_vfs() rebuilds them; devlink could change the RSS LUT
   of a VF just after the PF rebuild, and the VF VSI rebuild then went
   back to the VSI LUT, with the LUT still taken in the table (Sashiko)
 * register VF devlink resources before devl_register(), and unregister
   them after devl_unregister(), under one devl lock section, so the
   VF devlink instance is never visible without them (Sashiko)
 * drop the second ice_get_vf_vsi() call in ice_vc_config_rss_lut(),
   the VSI is now looked up before the LUT size check (Sashiko)

v4:
 * after a PF reset, lower the queue count only of VFs that lost a bigger
   RSS LUT, and only to 16; ice_vsi_decfg() set every VF back to the
   default count, dropping queues granted by REQUEST_QUEUES or set via
   sriov_vf_msix_count, and took the PF from vsi->back, which is not the
   VF's PF for the SR-IOV LAG placeholder VSIs (Sashiko)
 * cap REQUEST_QUEUES at 16 for VFs without VIRTCHNL_VF_LARGE_NUM_QPAIRS,
   also when they use a bigger RSS LUT (Sashiko)
 * report ICE_VF_VSI_ID as vport_id in GET_MAX_RSS_QREGION reply, not the
   HW VSI number (Sashiko)
 * clear ICE_VF_STATE_NEEDS_RESET on every VF reset, so a VF is not reset
   again for a change that was already applied (Sashiko)
 * don't create VF devlink instance without VF pci_dev, e.g. on s390
   (Sashiko)
 * document the VF devlink instance and its RSS LUT resources in ice.rst
   (Sashiko)
 * do a pending deferred VF reset before handling the next message from
   that VF, instead of answering it from a half-applied RSS LUT change
   (GET_VF_RESOURCES offered 64 queues without LARGE_NUM_QPAIRS)
 * re-run service task at once if a deferred VF reset was scheduled
   during its pass, after ice_handle_deferred_vf_reset(); the wake-up
   from ice_schedule_vf_reset() is a no-op while the task runs, so the
   reset waited for the service timer, up to 1 s (me)
 * report the VF queue allocation in num_queue_pairs also with
   VIRTCHNL_VF_LARGE_NUM_QPAIRS, as in legacy mode and as the
   out-of-tree ice does, instead of the RSS LUT queue limit; VF learns
   the limit from GET_MAX_RSS_QREGION or from a REQUEST_QUEUES denial
   (Sashiko)
 * declare ret and len in one line in ice_vc_get_vf_res_msg()

v3:
 * allocate VF devlink with ice as the owning driver, via new
   devlink_alloc_drv(); VF device could be unbound or bound to iavf at
   that point (me)
 * create VF devlinks only after all VFs are started, not while
   ice_start_vfs() can still fail and release their VSIs (me)
 * check VF VSI for NULL in ice_vc_request_qs_msg() (me)
 * restore default RSS LUT assignment of VFs after PF reset, FW drops it
 * wake up service task when scheduling a deferred VF reset (Sashiko)
 * lower VF queue count to the capacity of its new RSS LUT when the LUT
   shrinks, instead of keeping the queues allocated and offering them
   to iavf without VIRTCHNL_VF_LARGE_NUM_QPAIRS (me)

v2:
 * drop getting VF ref around vf->needs_deferred_reset, it only opened
   a window for resource leak and was not needed anyway (Sashiko)
 * replace needs_deferred_reset bitfield with ICE_VF_STATE_NEEDS_RESET
   bit, consumed by test_and_clear_bit() before the reset, so a request
   coming in during the reset is not lost
 * take vfs.table_lock in service task only when a deferred VF reset
   is pending, so freshly enabled VFs do not time out on
   VIRTCHNL_OP_VERSION
 * add !CONFIG_PCI_IOV stub for ice_schedule_vf_reset()
 * create VF devlink in ice_start_vfs() under vfs.table_lock instead
   of lazily from the virtchnl handler; take PF devlink lock around
   devl_nested_devlink_set(); handle VF without devlink on teardown
 * take cfg_lock before the adapter devlink lock in VF resource setters,
   and reject changes while the VF is not ready (ice_vf_is_ready())
 * switch VF VSI context to the new LUT synchronously, so HW no longer
   uses the old LUT when it is released
 * use logical_pf_id for VF allocation of PF LUT slots
 * report the RSS qregion width from LUT capacity, and reject VF queue
   requests above it
 * drop ICE_VSI_FLAG_RELOAD, it was set but never tested (and
   overwritten on VF reset anyway)
 * use ice_get_vf_vsi() instead of open coding it (Sashiko)
 * commit message: the whole device aggregate is a shared devlink
   instance (devlink_index/N), not a faux device
 * check devl_nested_devlink_set() return value (Sashiko)
---
 Documentation/networking/devlink/ice.rst      | 30 +++++-
 .../net/ethernet/intel/ice/devlink/resource.h |  3 +
 drivers/net/ethernet/intel/ice/ice.h          |  1 +
 drivers/net/ethernet/intel/ice/ice_vf_lib.h   | 23 +++++
 drivers/net/ethernet/intel/ice/virt/queues.h  |  2 +
 drivers/net/ethernet/intel/ice/virt/rss.h     |  1 +
 .../net/ethernet/intel/ice/virt/virtchnl.h    |  4 +
 .../net/ethernet/intel/ice/devlink/resource.c | 94 ++++++++++++++++++-
 drivers/net/ethernet/intel/ice/ice_main.c     | 26 +++++
 drivers/net/ethernet/intel/ice/ice_sriov.c    | 28 ++++++
 drivers/net/ethernet/intel/ice/ice_vf_lib.c   | 73 ++++++++++++++
 drivers/net/ethernet/intel/ice/virt/queues.c  | 82 ++++++++++++----
 drivers/net/ethernet/intel/ice/virt/rss.c     | 54 ++++++++++-
 .../net/ethernet/intel/ice/virt/virtchnl.c    | 36 +++++++
 14 files changed, 428 insertions(+), 29 deletions(-)

diff --git a/Documentation/networking/devlink/ice.rst b/Documentation/networking/devlink/ice.rst
index d410dd6bb29f..1cb4f9182849 100644
--- a/Documentation/networking/devlink/ice.rst
+++ b/Documentation/networking/devlink/ice.rst
@@ -503,8 +503,9 @@ a global LUT, and 256 with a PF LUT.
       - Instance
       - Description
     * - ``rss_lut``
-      - PF
-      - The size of the RSS LUT of the function, 512 or 2048 for a PF.
+      - PF, VF
+      - The size of the RSS LUT of the function, 512 or 2048 for a PF, and
+        64, 512 or 2048 for a VF.
         Only these sizes are accepted, not every multiple of ``size_gran``.
         A new size applies immediately (``runtime`` configuration mode).
     * - ``rss_lut_512``
@@ -517,6 +518,24 @@ a global LUT, and 256 with a PF LUT.
         in use. Read-only.
 
 The whole device devlink instance is shared by all PFs of the device.
+The devlink instance of each VF (``pci/<VF BDF>``) is nested in the devlink
+instance of its PF. A VF can use a global LUT, or the PF LUT of its PF,
+once the PF switched to a global LUT.
+
+A VF uses its VSI LUT by default, which spreads traffic over up to 16
+queues. With a global LUT the VF can use up to 64 queues, and up to 256 with
+a PF LUT. Changing the LUT of a VF resets the VF, and lowers its queue count
+if the new LUT can't spread traffic over all of them. The VF driver picks
+the queue count as usual, more queues are requested with ``ethtool -L``.
+More than 16 queues need a VF driver that supports
+``VIRTCHNL_VF_LARGE_NUM_QPAIRS``, like ``iavf``.
+
+The queues of a VF must be one contiguous range of the PF Tx and Rx queues,
+so a request is granted only when the VF fits in one free range (its own
+queues count as free), and the driver logs how many are free otherwise.
+The queues of other VFs fragment that space, so with many VFs only a few
+of them can get 64 queues, and a VF may not get 256 queues even with a PF
+LUT.
 
 Changing the LUT of a PF keeps the RSS indirection table set with
 ``ethtool -X``, also when a reset gives the PF LUT back to the PF. The table
@@ -528,7 +547,8 @@ RSS LUTs can't be changed while ADQ is configured, and ADQ can't be
 configured while the RSS LUTs of the PF are reassigned.
 
 Firmware drops the LUT assignments on reset (PFR, CORER or GLOBR). The
-driver then restores the default assignment, and logs that it did so.
+driver then restores the default assignment, and logs that it did so. VFs
+that used a bigger LUT get at most 16 queues after that.
 Changes are rejected with ``EBUSY`` while a reset is in progress.
 
 .. code:: shell
@@ -544,3 +564,7 @@ Changes are rejected with ``EBUSY`` while a reset is in progress.
     $ devlink resource show pci/0000:18:00.0
     pci/0000:18:00.0:
       name rss_lut size 512 unit entry size_min 512 size_max 2048 size_gran 512 dpipe_tables none
+
+    # give the freed PF LUT to a VF of that PF, and use 256 queues there
+    $ devlink resource set pci/0000:18:01.0 path rss_lut size 2048
+    $ ethtool -L $VF_NETDEV combined 256
diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.h b/drivers/net/ethernet/intel/ice/devlink/resource.h
index a41bda0ff6c8..4401ce0171e1 100644
--- a/drivers/net/ethernet/intel/ice/devlink/resource.h
+++ b/drivers/net/ethernet/intel/ice/devlink/resource.h
@@ -10,7 +10,9 @@ struct devlink;
 struct ice_adapter;
 struct ice_hw;
 struct ice_pf;
+struct ice_vf;
 
+void ice_devlink_vf_resources_register(struct ice_vf *vf);
 void ice_devl_pf_resources_register(struct ice_pf *pf);
 void ice_devl_whole_dev_resources_register(const struct ice_hw *hw,
 					   struct ice_adapter *adapter);
@@ -21,5 +23,6 @@ void ice_release_rss_lut_pf(struct ice_pf *pf);
 void ice_prepare_rss_luts_for_reset(struct ice_pf *pf);
 int ice_rebuild_rss_luts(struct ice_pf *pf);
 void ice_free_rss_lut_flr(struct ice_pf *pf);
+void ice_free_rss_lut_vf(struct ice_vf *vf);
 
 #endif /* _ICE_DEVL_RESOURCE_H_ */
diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index 611f1346b4a7..daa417edc9b7 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -297,6 +297,7 @@ enum ice_pf_state {
 	ICE_SIDEBANDQ_EVENT_PENDING,
 	ICE_MDD_EVENT_PENDING,
 	ICE_VFLR_EVENT_PENDING,
+	ICE_VF_RESET_PENDING,
 	ICE_FLTR_OVERFLOW_PROMISC,
 	ICE_VF_DIS,
 	ICE_CFG_BUSY,
diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.h b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
index 396dfb2b2d97..8abc8c844c96 100644
--- a/drivers/net/ethernet/intel/ice/ice_vf_lib.h
+++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.h
@@ -40,6 +40,7 @@ enum ice_vf_states {
 	ICE_VF_STATE_DIS,
 	ICE_VF_STATE_MC_PROMISC,
 	ICE_VF_STATE_UC_PROMISC,
+	ICE_VF_STATE_NEEDS_RESET,	/* reset deferred to service task */
 	ICE_VF_STATES_NBITS
 };
 
@@ -145,6 +146,7 @@ struct ice_vf {
 	struct kref refcnt;
 	struct ice_pf *pf;
 	struct pci_dev *vfdev;
+	struct devlink *devlink;
 	/* Used during virtchnl message handling and NDO ops against the VF
 	 * that will trigger a VFR
 	 */
@@ -243,6 +245,12 @@ static inline bool ice_vf_is_lldp_ena(struct ice_vf *vf)
 	return vf->num_mac_lldp && vf->trusted;
 }
 
+static inline bool ice_vf_is_ready(struct ice_vf *vf)
+{
+	return test_bit(ICE_VF_STATE_INIT, vf->vf_states) &&
+	       !test_bit(ICE_VF_STATE_DIS, vf->vf_states);
+}
+
 /* VF Hash Table access functions
  *
  * These functions provide abstraction for interacting with the VF hash table.
@@ -319,9 +327,12 @@ int
 ice_vf_clear_vsi_promisc(struct ice_vf *vf, struct ice_vsi *vsi, u8 promisc_m);
 int ice_reset_vf(struct ice_vf *vf, u32 flags);
 void ice_reset_all_vfs(struct ice_pf *pf);
+void ice_schedule_vf_reset(struct ice_vf *vf);
 struct ice_vsi *ice_get_vf_ctrl_vsi(struct ice_pf *pf, struct ice_vsi *vsi);
 void ice_vf_update_mac_lldp_num(struct ice_vf *vf, struct ice_vsi *vsi,
 				bool incr);
+void ice_init_vf_devlink(struct ice_vf *vf);
+void ice_deinit_vf_devlink(struct ice_vf *vf);
 #else /* CONFIG_PCI_IOV */
 static inline struct ice_vf *ice_get_vf_by_id(struct ice_pf *pf, u16 vf_id)
 {
@@ -393,11 +404,23 @@ static inline void ice_reset_all_vfs(struct ice_pf *pf)
 {
 }
 
+static inline void ice_schedule_vf_reset(struct ice_vf *vf)
+{
+}
+
 static inline struct ice_vsi *
 ice_get_vf_ctrl_vsi(struct ice_pf *pf, struct ice_vsi *vsi)
 {
 	return NULL;
 }
+
+static inline void ice_init_vf_devlink(struct ice_vf *vf)
+{
+}
+
+static inline void ice_deinit_vf_devlink(struct ice_vf *vf)
+{
+}
 #endif /* !CONFIG_PCI_IOV */
 
 #endif /* _ICE_VF_LIB_H_ */
diff --git a/drivers/net/ethernet/intel/ice/virt/queues.h b/drivers/net/ethernet/intel/ice/virt/queues.h
index 223f609dd4f3..d9aa0153db4e 100644
--- a/drivers/net/ethernet/intel/ice/virt/queues.h
+++ b/drivers/net/ethernet/intel/ice/virt/queues.h
@@ -7,7 +7,9 @@
 #include <linux/types.h>
 
 struct ice_vf;
+struct ice_vsi;
 
+int ice_vf_max_contig_qs(struct ice_vf *vf, struct ice_vsi *vsi);
 u16 ice_vc_get_max_frame_size(struct ice_vf *vf);
 int ice_vc_ena_qs_msg(struct ice_vf *vf, u8 *msg);
 int ice_vc_dis_qs_msg(struct ice_vf *vf, u8 *msg);
diff --git a/drivers/net/ethernet/intel/ice/virt/rss.h b/drivers/net/ethernet/intel/ice/virt/rss.h
index 784d4c43ce8b..388f980b4cdf 100644
--- a/drivers/net/ethernet/intel/ice/virt/rss.h
+++ b/drivers/net/ethernet/intel/ice/virt/rss.h
@@ -14,5 +14,6 @@ int ice_vc_config_rss_lut(struct ice_vf *vf, u8 *msg);
 int ice_vc_config_rss_hfunc(struct ice_vf *vf, u8 *msg);
 int ice_vc_get_rss_hashcfg(struct ice_vf *vf);
 int ice_vc_set_rss_hashcfg(struct ice_vf *vf, u8 *msg);
+int ice_vc_get_max_rss_qregion(struct ice_vf *vf);
 
 #endif /* _ICE_VIRT_RSS_H_ */
diff --git a/drivers/net/ethernet/intel/ice/virt/virtchnl.h b/drivers/net/ethernet/intel/ice/virt/virtchnl.h
index d11789b3ae1f..18024f13fb5d 100644
--- a/drivers/net/ethernet/intel/ice/virt/virtchnl.h
+++ b/drivers/net/ethernet/intel/ice/virt/virtchnl.h
@@ -78,6 +78,10 @@ struct ice_virtchnl_ops {
 	int (*get_ptp_cap)(struct ice_vf *vf,
 			   const struct virtchnl_ptp_caps *msg);
 	int (*get_phc_time)(struct ice_vf *vf);
+	int (*get_max_rss_qregion)(struct ice_vf *vf);
+	int (*ena_qs_v2_msg)(struct ice_vf *vf, u8 *msg, u16 msglen);
+	int (*dis_qs_v2_msg)(struct ice_vf *vf, u8 *msg, u16 msglen);
+	int (*map_q_vector_msg)(struct ice_vf *vf, u8 *msg, u16 msglen);
 };
 
 #ifdef CONFIG_PCI_IOV
diff --git a/drivers/net/ethernet/intel/ice/devlink/resource.c b/drivers/net/ethernet/intel/ice/devlink/resource.c
index c07f61acdaed..34286404d475 100644
--- a/drivers/net/ethernet/intel/ice/devlink/resource.c
+++ b/drivers/net/ethernet/intel/ice/devlink/resource.c
@@ -135,6 +135,16 @@ void ice_free_rss_lut_flr(struct ice_pf *pf)
 		ice_free_rss_lut_flr_locked(pf);
 }
 
+void ice_free_rss_lut_vf(struct ice_vf *vf)
+{
+	struct ice_pf *pf = vf->pf;
+
+	scoped_guard(ice_adapter_devl, pf->adapter) {
+		ice_devl_res_free(pf, ICE_RSS_LUT_GLOBAL, vf);
+		ice_devl_res_free(pf, ICE_RSS_LUT_PF, vf);
+	}
+}
+
 static int ice_devl_res_owned_idx(struct ice_pf *pf,
 				  enum ice_devl_resource_id res_id, void *owner)
 {
@@ -194,6 +204,16 @@ static u64 ice_rss_lut_pf_size_get(void *priv)
 	}
 }
 
+static u64 ice_rss_lut_vf_size_get(void *priv)
+{
+	struct ice_vf *vf = priv;
+	struct ice_pf *pf;
+
+	pf = vf->pf;
+	scoped_guard(ice_adapter_devl, pf->adapter)
+		return ice_lut_type_to_size(ice_rss_lut_type(pf, vf));
+}
+
 static int ice_rss_lut_user_resize(struct ice_vsi *vsi,
 				   enum ice_lut_type lut_type, u8 **user_lut,
 				   struct netlink_ext_ack *extack)
@@ -255,6 +275,7 @@ static int ice_change_rss_lut(struct ice_pf *pf, void *owner,
 	struct ice_aq_get_set_rss_lut_params params = {};
 	struct ice_hw *hw = &pf->hw;
 	int err, lut_size, lut_id;
+	struct ice_vf *vf = NULL;
 	struct ice_vsi *vsi;
 	u8 *user_lut = NULL;
 	u16 rss_size;
@@ -271,7 +292,8 @@ static int ice_change_rss_lut(struct ice_pf *pf, void *owner,
 	if (pf == owner) {
 		vsi = ice_get_main_vsi(pf);
 	} else {
-		return -EOPNOTSUPP;
+		vf = owner;
+		vsi = ice_get_vf_vsi(vf);
 	}
 
 	lut_size = ice_lut_type_to_size(lut_type);
@@ -288,7 +310,7 @@ static int ice_change_rss_lut(struct ice_pf *pf, void *owner,
 	if (err)
 		goto out;
 	/* PF with RXHASH disabled keeps its LUT zeroed */
-	if (!vsi->netdev || vsi->netdev->features & NETIF_F_RXHASH) {
+	if (vf || !vsi->netdev || vsi->netdev->features & NETIF_F_RXHASH) {
 		if (user_lut)
 			memcpy(lut, user_lut, lut_size);
 		else
@@ -312,6 +334,14 @@ static int ice_change_rss_lut(struct ice_pf *pf, void *owner,
 	vsi->rss_table_size = lut_size;
 	vsi->rss_lut_type = lut_type;
 	vsi->rss_size = rss_size;
+	if (vf) {
+		u16 max_qs = ice_lut_type_to_qs_num(lut_type);
+
+		/* don't keep queues that the new LUT can't spread traffic to */
+		if ((vf->num_req_qs ?: vf->num_vf_qs) > max_qs)
+			vf->num_req_qs = max_qs;
+		ice_schedule_vf_reset(vf);
+	}
 out:
 	mutex_unlock(&pf->rss_lut_lock);
 	devm_kfree(ice_pf_to_dev(pf), user_lut);
@@ -346,7 +376,12 @@ static int ice_rss_lut_set(struct ice_pf *pf, void *owner, u64 size,
 		new_type = ICE_LUT_PF;
 		break;
 	default:
-		NL_SET_ERR_MSG_MOD(extack, "RSS LUT size must be 512 or 2048");
+		if (owner == pf)
+			NL_SET_ERR_MSG_MOD(extack,
+					   "RSS LUT size must be 512 or 2048");
+		else
+			NL_SET_ERR_MSG_MOD(extack,
+					   "RSS LUT size must be 64, 512 or 2048");
 		return -EINVAL;
 	}
 
@@ -418,6 +453,22 @@ static int ice_rss_lut_pf_size_set(u64 size, struct netlink_ext_ack *extack,
 	return err;
 }
 
+static int ice_rss_lut_vf_size_set(u64 size, struct netlink_ext_ack *extack,
+				   void *priv)
+{
+	struct ice_vf *vf = priv;
+	struct ice_pf *pf;
+
+	pf = vf->pf;
+	scoped_guard(mutex, &vf->cfg_lock) {
+		if (!ice_vf_is_ready(vf))
+			return -EBUSY;
+
+		scoped_guard(ice_adapter_devl, pf->adapter)
+			return ice_rss_lut_set(pf, vf, size, extack);
+	}
+}
+
 /**
  * ice_rss_lut_is_reassigned - check if RSS LUTs of PF are in non-default state
  * @pf: the PF to check
@@ -548,24 +599,47 @@ static int ice_rebuild_rss_lut_pf(struct ice_pf *pf)
  * @pf: the PF that was reset
  *
  * Wrapper of ice_rebuild_rss_lut_pf() that also tells the ethtool core when
- * the user RSS LUT was dropped. Must be called without rtnl held.
+ * the user RSS LUT was dropped, and makes the VF VSIs use their default LUTs.
+ * Must be called without rtnl held.
  *
  * Return: 0 on success, negative on error.
  */
 int ice_rebuild_rss_luts(struct ice_pf *pf)
 {
+	u16 max_qs = ice_lut_type_to_qs_num(ICE_LUT_VSI);
 	struct ice_vsi *vsi = ice_get_main_vsi(pf);
+	struct ice_vf *vf;
+	unsigned int bkt;
 	int err;
 
 	/* ethtool core sizes RSS buffers by rss_table_size under rtnl */
 	rtnl_lock();
 	err = ice_rebuild_rss_lut_pf(pf);
 	if (vsi && vsi->netdev && !vsi->rss_lut_user &&
 	    netif_is_rxfh_configured(vsi->netdev))
 		ethtool_rxfh_indir_lost(vsi->netdev);
 	rtnl_unlock();
+	if (err)
+		return err;
 
-	return err;
+	/* VF creation takes rtnl under table_lock, so don't nest them here */
+	mutex_lock(&pf->vfs.table_lock);
+	mutex_lock(&pf->rss_lut_lock);
+	ice_for_each_vf(pf, bkt, vf) {
+		vsi = ice_get_vf_vsi(vf);
+		if (!vsi || vsi->rss_lut_type == ICE_LUT_VSI)
+			continue;
+
+		vsi->rss_table_size = ice_lut_type_to_size(ICE_LUT_VSI);
+		vsi->rss_lut_type = ICE_LUT_VSI;
+		/* don't keep queues that the VSI LUT can't spread traffic to */
+		if ((vf->num_req_qs ?: vf->num_vf_qs) > max_qs)
+			vf->num_req_qs = max_qs;
+	}
+	mutex_unlock(&pf->rss_lut_lock);
+	mutex_unlock(&pf->vfs.table_lock);
+
+	return 0;
 }
 
 static void ice_devl_hw_res_register(struct devlink *devlink, const char *name,
@@ -641,3 +715,13 @@ void ice_devl_pf_resources_register(struct ice_pf *pf)
 				  ice_rss_lut_pf_size_get,
 				  ice_rss_lut_pf_size_set, pf);
 }
+
+void ice_devlink_vf_resources_register(struct ice_vf *vf)
+{
+	struct devlink *devlink = vf->devlink;
+
+	devl_assert_locked(devlink);
+	ice_devl_rss_lut_register(devlink, ICE_LUT_VSI_SIZE,
+				  ice_rss_lut_vf_size_get,
+				  ice_rss_lut_vf_size_set, vf);
+}
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 5f0de7cf0a8e..43c6c1093d27 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -2276,6 +2276,30 @@ static void ice_check_media_subtask(struct ice_pf *pf)
 	}
 }
 
+static void ice_handle_deferred_vf_reset(struct ice_pf *pf)
+{
+	struct ice_vf *vf;
+	unsigned int bkt;
+	int err;
+
+	if (!test_and_clear_bit(ICE_VF_RESET_PENDING, pf->state))
+		return;
+
+	mutex_lock(&pf->vfs.table_lock);
+	ice_for_each_vf(pf, bkt, vf) {
+		if (!test_and_clear_bit(ICE_VF_STATE_NEEDS_RESET, vf->vf_states))
+			continue;
+
+		dev_info(ice_pf_to_dev(pf), "doing deferred reset of VF %d\n",
+			 vf->vf_id);
+		err = ice_reset_vf(vf, ICE_VF_RESET_NOTIFY | ICE_VF_RESET_LOCK);
+		if (err)
+			dev_warn(ice_pf_to_dev(pf), "deferred reset of VF %d failed: %d\n",
+				 vf->vf_id, err);
+	}
+	mutex_unlock(&pf->vfs.table_lock);
+}
+
 static void ice_service_task_recovery_mode(struct work_struct *work)
 {
 	struct ice_pf *pf = container_of(work, struct ice_pf, serv_task);
@@ -2358,6 +2382,7 @@ static void ice_service_task(struct work_struct *work)
 		return;
 	}
 
+	ice_handle_deferred_vf_reset(pf);
 	ice_process_vflr_event(pf);
 	ice_clean_mailboxq_subtask(pf);
 	ice_clean_sbq_subtask(pf);
@@ -2374,6 +2399,7 @@ static void ice_service_task(struct work_struct *work)
 	if (time_after(jiffies, (start_time + pf->serv_tmr_period)) ||
 	    test_bit(ICE_MDD_EVENT_PENDING, pf->state) ||
 	    test_bit(ICE_VFLR_EVENT_PENDING, pf->state) ||
+	    test_bit(ICE_VF_RESET_PENDING, pf->state) ||
 	    test_bit(ICE_MAILBOXQ_EVENT_PENDING, pf->state) ||
 	    test_bit(ICE_FD_VF_FLUSH_CTX, pf->state) ||
 	    test_bit(ICE_SIDEBANDQ_EVENT_PENDING, pf->state) ||
diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
index d7c4a6540008..24c521aaf3f3 100644
--- a/drivers/net/ethernet/intel/ice/ice_sriov.c
+++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
@@ -10,6 +10,7 @@
 #include "ice_flow.h"
 #include "ice_eswitch.h"
 #include "virt/allowlist.h"
+#include "virt/queues.h"
 #include "ice_flex_pipe.h"
 #include "ice_vf_vsi_vlan_ops.h"
 #include "ice_vlan.h"
@@ -142,6 +143,12 @@ void ice_free_vfs(struct ice_pf *pf)
 	while (test_and_set_bit(ICE_VF_DIS, pf->state))
 		usleep_range(1000, 2000);
 
+	/* unregister VF devlinks while their VF pci_devs still exist */
+	mutex_lock(&vfs->table_lock);
+	ice_for_each_vf(pf, bkt, vf)
+		ice_deinit_vf_devlink(vf);
+	mutex_unlock(&vfs->table_lock);
+
 	/* Disable IOV before freeing resources. This lets any VF drivers
 	 * running in the host get themselves cleaned up before we yank
 	 * the carpet out from underneath their feet.
@@ -501,6 +508,11 @@ static int ice_start_vfs(struct ice_pf *pf)
 	}
 
 	ice_flush(hw);
+
+	/* only now, so the teardown below has no VF devlink to unregister */
+	ice_for_each_vf(pf, bkt, vf)
+		ice_init_vf_devlink(vf);
+
 	return 0;
 
 teardown:
@@ -657,6 +669,15 @@ static void ice_sriov_post_vsi_rebuild(struct ice_vf *vf)
 	wr32(&vf->pf->hw, VFGEN_RSTAT(vf->vf_id), VIRTCHNL_VFR_VFACTIVE);
 }
 
+static struct ice_q_vector *ice_sriov_get_q_vector(struct ice_vsi *vsi,
+						   u16 vector_id)
+{
+	/* Subtract non queue vector from vector_id passed by VF
+	 * to get actual number of VSI queue vector array index
+	 */
+	return vsi->q_vectors[vector_id - ICE_NONQ_VECS_VF];
+}
+
 static const struct ice_vf_ops ice_sriov_vf_ops = {
 	.reset_type = ICE_VF_RESET,
 	.free = ice_sriov_free_vf,
@@ -667,6 +688,7 @@ static const struct ice_vf_ops ice_sriov_vf_ops = {
 	.clear_reset_trigger = ice_sriov_clear_reset_trigger,
 	.irq_close = NULL,
 	.post_vsi_rebuild = ice_sriov_post_vsi_rebuild,
+	.get_q_vector = ice_sriov_get_q_vector,
 };
 
 /**
@@ -969,6 +991,12 @@ int ice_sriov_set_msix_vec_count(struct pci_dev *vf_dev, int msix_vec_count)
 		return 0;
 	}
 
+	/* VSI rebuild takes one free range for all queues of the VF */
+	if ((vf->num_req_qs ?: queues) > ice_vf_max_contig_qs(vf, vsi)) {
+		ice_put_vf(vf);
+		return -ENOSPC;
+	}
+
 	prev_msix = vf->num_msix;
 	prev_queues = vf->num_vf_qs;
 
diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
index 320b393ddaaf..015b50c70bdc 100644
--- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
@@ -6,6 +6,7 @@
 #include "ice_lib.h"
 #include "ice_fltr.h"
 #include "virt/allowlist.h"
+#include "devlink/resource.h"
 
 /* Public functions which may be accessed by all driver files */
 
@@ -794,6 +795,8 @@ void ice_reset_all_vfs(struct ice_pf *pf)
 		ice_eswitch_detach_vf(pf, vf);
 		vf->driver_caps = 0;
 		ice_vc_set_default_allowlist(vf);
+		/* the VSI rebuild applies what a deferred reset was for */
+		clear_bit(ICE_VF_STATE_NEEDS_RESET, vf->vf_states);
 
 		ice_vf_fdir_exit(vf);
 		ice_vf_fdir_init(vf);
@@ -807,6 +810,8 @@ void ice_reset_all_vfs(struct ice_pf *pf)
 		if (ice_vf_rebuild_vsi(vf)) {
 			dev_err(dev, "VF %u VSI rebuild failed, leaving VF disabled\n",
 				vf->vf_id);
+			/* INIT stays clear, but let a VFLR reset the VF */
+			clear_bit(ICE_VF_STATE_DIS, vf->vf_states);
 			mutex_unlock(&vf->cfg_lock);
 			continue;
 		}
@@ -933,6 +938,8 @@ int ice_reset_vf(struct ice_vf *vf, u32 flags)
 
 	/* Set VF disable bit state here, before triggering reset */
 	set_bit(ICE_VF_STATE_DIS, vf->vf_states);
+	/* this reset applies what a deferred reset was requested for */
+	clear_bit(ICE_VF_STATE_NEEDS_RESET, vf->vf_states);
 	ice_trigger_vf_reset(vf, flags & ICE_VF_RESET_VFLR, false);
 
 	vsi = ice_get_vf_vsi(vf);
@@ -1010,14 +1017,29 @@ int ice_reset_vf(struct ice_vf *vf, u32 flags)
 	return err;
 }
 
+/**
+ * ice_schedule_vf_reset - reset VF, deferred to next service_task context
+ * @vf: VF to reset
+ */
+void ice_schedule_vf_reset(struct ice_vf *vf)
+{
+	set_bit(ICE_VF_STATE_NEEDS_RESET, vf->vf_states);
+	/* pairs with test_and_clear_bit() in ice_handle_deferred_vf_reset() */
+	smp_mb__after_atomic();
+	set_bit(ICE_VF_RESET_PENDING, vf->pf->state);
+	ice_service_task_schedule(vf->pf);
+}
+
 /**
  * ice_set_vf_state_dis - Set VF state to disabled
  * @vf: pointer to the VF structure
  */
 void ice_set_vf_state_dis(struct ice_vf *vf)
 {
 	ice_set_vf_state_qs_dis(vf);
 	vf->vf_ops->clear_reset_state(vf);
+	/* until ice_reset_all_vfs() rebuilds the VF */
+	set_bit(ICE_VF_STATE_DIS, vf->vf_states);
 }
 
 /* Private functions only accessed from other virtualization files */
@@ -1064,6 +1086,8 @@ void ice_deinitialize_vf_entry(struct ice_vf *vf)
 {
 	struct ice_pf *pf = vf->pf;
 
+	ice_free_rss_lut_vf(vf);
+
 	if (!ice_is_feature_supported(pf, ICE_F_MBX_LIMIT))
 		list_del(&vf->mbx_info.list_entry);
 }
@@ -1450,3 +1474,52 @@ void ice_vf_update_mac_lldp_num(struct ice_vf *vf, struct ice_vsi *vsi,
 	if (was_ena != is_ena)
 		ice_vsi_cfg_sw_lldp(vsi, false, is_ena);
 }
+
+void ice_init_vf_devlink(struct ice_vf *vf)
+{
+	struct devlink *pf_devlink = priv_to_devlink(vf->pf);
+	static const struct devlink_ops noop = {};
+	struct devlink *devlink;
+	int err;
+
+	lockdep_assert_held(&vf->pf->vfs.table_lock);
+
+	/* no VF pci_dev when the VFs were not scanned, e.g. on s390 */
+	if (!vf->vfdev)
+		return;
+
+	devlink = devlink_alloc_drv(&noop, 0, &vf->vfdev->dev,
+				    ice_pf_to_dev(vf->pf)->driver);
+	if (!devlink)
+		return;
+
+	scoped_guard(devl, pf_devlink)
+		err = devl_nested_devlink_set(pf_devlink, devlink);
+	if (err) {
+		devlink_free(devlink);
+		return;
+	}
+
+	vf->devlink = devlink;
+	scoped_guard(devl, devlink) {
+		ice_devlink_vf_resources_register(vf);
+		devl_register(devlink);
+	}
+}
+
+void ice_deinit_vf_devlink(struct ice_vf *vf)
+{
+	struct devlink *devlink = vf->devlink;
+
+	lockdep_assert_held(&vf->pf->vfs.table_lock);
+
+	if (!devlink)
+		return;
+
+	vf->devlink = NULL;
+	scoped_guard(devl, devlink) {
+		devl_unregister(devlink);
+		devl_resources_unregister(devlink);
+	}
+	devlink_free(devlink);
+}
diff --git a/drivers/net/ethernet/intel/ice/virt/queues.c b/drivers/net/ethernet/intel/ice/virt/queues.c
index e8635236cb6c..1afb7a2946fe 100644
--- a/drivers/net/ethernet/intel/ice/virt/queues.c
+++ b/drivers/net/ethernet/intel/ice/virt/queues.c
@@ -986,6 +986,48 @@ int ice_vc_cfg_qs_msg(struct ice_vf *vf, u8 *msg)
 				     VIRTCHNL_STATUS_ERR_PARAM, NULL, 0);
 }
 
+/**
+ * ice_vf_max_contig_qs - get the most queues VF could get in one range
+ * @vf: pointer to the VF info
+ * @vsi: VSI of the VF
+ *
+ * Scattered queue mapping is not implemented for VFs. Queues of the VF count
+ * as free, as VSI rebuild releases them before it takes the new range.
+ *
+ * Return: length of the longest range of free Tx queues and Rx queues.
+ */
+int ice_vf_max_contig_qs(struct ice_vf *vf, struct ice_vsi *vsi)
+{
+	struct ice_pf *pf = vf->pf;
+	unsigned long *txqs, *rxqs;
+	int max_tx = 0, max_rx = 0;
+	int b, e;
+
+	txqs = bitmap_alloc(pf->max_pf_txqs, GFP_KERNEL);
+	rxqs = bitmap_alloc(pf->max_pf_rxqs, GFP_KERNEL);
+	if (!txqs || !rxqs)
+		goto out;
+
+	scoped_guard(mutex, &pf->avail_q_mutex) {
+		bitmap_copy(txqs, pf->avail_txqs, pf->max_pf_txqs);
+		bitmap_copy(rxqs, pf->avail_rxqs, pf->max_pf_rxqs);
+	}
+	for (int i = 0; i < vsi->alloc_txq; i++)
+		clear_bit(vsi->txq_map[i], txqs);
+	for (int i = 0; i < vsi->alloc_rxq; i++)
+		clear_bit(vsi->rxq_map[i], rxqs);
+
+	for_each_clear_bitrange(b, e, txqs, pf->max_pf_txqs)
+		max_tx = max(max_tx, e - b);
+	for_each_clear_bitrange(b, e, rxqs, pf->max_pf_rxqs)
+		max_rx = max(max_rx, e - b);
+out:
+	bitmap_free(txqs);
+	bitmap_free(rxqs);
+
+	return min(max_tx, max_rx);
+}
+
 /**
  * ice_vc_request_qs_msg
  * @vf: pointer to the VF info
@@ -1004,33 +1046,41 @@ int ice_vc_request_qs_msg(struct ice_vf *vf, u8 *msg)
 	u16 req_queues = vfres->num_queue_pairs;
 	struct ice_pf *pf = vf->pf;
 	u16 max_allowed_vf_queues;
-	u16 tx_rx_queue_left;
+	struct ice_vsi *vsi;
 	struct device *dev;
-	u16 cur_queues;
+	u16 max_lut_queues;
 
 	dev = ice_pf_to_dev(pf);
 	if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states)) {
 		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
 		goto error_param;
 	}
 
-	cur_queues = vf->num_vf_qs;
-	tx_rx_queue_left = min_t(u16, ice_get_avail_txq_count(pf),
-				 ice_get_avail_rxq_count(pf));
-	max_allowed_vf_queues = tx_rx_queue_left + cur_queues;
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi) {
+		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
+		goto error_param;
+	}
+
+	/* without LARGE_NUM_QPAIRS, VF can only use the v1 queue opcodes */
+	if (vf->driver_caps & VIRTCHNL_VF_LARGE_NUM_QPAIRS)
+		max_lut_queues = ice_lut_type_to_qs_num(vsi->rss_lut_type);
+	else
+		max_lut_queues = ICE_MAX_QS_PER_VF_VCV1;
+	max_allowed_vf_queues = min(ice_vf_max_contig_qs(vf, vsi),
+				    max_lut_queues);
+	if (req_queues > max_lut_queues) {
+		vfres->num_queue_pairs = max_allowed_vf_queues;
+		goto error_param;
+	}
+
 	if (!req_queues) {
 		dev_err(dev, "VF %d tried to request 0 queues. Ignoring.\n",
 			vf->vf_id);
-	} else if (req_queues > ICE_MAX_QS_PER_VF_VCV1) {
-		dev_err(dev, "VF %d tried to request more than %d queues.\n",
-			vf->vf_id, ICE_MAX_QS_PER_VF_VCV1);
-		vfres->num_queue_pairs = ICE_MAX_QS_PER_VF_VCV1;
-	} else if (req_queues > cur_queues &&
-		   req_queues - cur_queues > tx_rx_queue_left) {
-		dev_warn(dev, "VF %d requested %u more queues, but only %u left.\n",
-			 vf->vf_id, req_queues - cur_queues, tx_rx_queue_left);
-		vfres->num_queue_pairs = min_t(u16, max_allowed_vf_queues,
-					       ICE_MAX_QS_PER_VF_VCV1);
+	} else if (req_queues > max_allowed_vf_queues) {
+		dev_warn(dev, "VF %d requested %u queues, but only %u are free in one range.\n",
+			 vf->vf_id, req_queues, max_allowed_vf_queues);
+		vfres->num_queue_pairs = max_allowed_vf_queues;
 	} else {
 		/* request is successful, then reset VF */
 		vf->num_req_qs = req_queues;
diff --git a/drivers/net/ethernet/intel/ice/virt/rss.c b/drivers/net/ethernet/intel/ice/virt/rss.c
index 960012ca91b5..99d9295af79c 100644
--- a/drivers/net/ethernet/intel/ice/virt/rss.c
+++ b/drivers/net/ethernet/intel/ice/virt/rss.c
@@ -3,6 +3,7 @@
 
 #include "rss.h"
 #include "ice_vf_lib_private.h"
+#include "ice_lib.h"
 #include "ice.h"
 
 #define FIELD_SELECTOR(proto_hdr_field) \
@@ -1734,7 +1735,9 @@ int ice_vc_config_rss_lut(struct ice_vf *vf, u8 *msg)
 {
 	struct virtchnl_rss_lut *vrl = (struct virtchnl_rss_lut *)msg;
 	enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_SUCCESS;
+	int lut_size = ICE_LUT_VSI_SIZE;
 	struct ice_vsi *vsi;
+	u8 *lut;
 
 	if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states)) {
 		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
@@ -1746,24 +1749,38 @@ int ice_vc_config_rss_lut(struct ice_vf *vf, u8 *msg)
 		goto error_param;
 	}
 
-	if (vrl->lut_entries != ICE_LUT_VSI_SIZE) {
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi) {
 		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
 		goto error_param;
 	}
 
-	if (!test_bit(ICE_FLAG_RSS_ENA, vf->pf->flags)) {
+	/* the LUT size reported in the GET_VF_RESOURCES reply */
+	if (vf->driver_caps & VIRTCHNL_VF_LARGE_NUM_QPAIRS)
+		lut_size = vsi->rss_table_size;
+	if (vrl->lut_entries != lut_size) {
 		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
 		goto error_param;
 	}
 
-	vsi = ice_get_vf_vsi(vf);
-	if (!vsi) {
+	if (!test_bit(ICE_FLAG_RSS_ENA, vf->pf->flags)) {
 		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
 		goto error_param;
 	}
 
-	if (ice_set_rss_lut(vsi, vrl->lut, ICE_LUT_VSI_SIZE))
+	lut = kmalloc(vsi->rss_table_size, GFP_KERNEL);
+	if (!lut) {
+		v_ret = VIRTCHNL_STATUS_ERR_NO_MEMORY;
+		goto error_param;
+	}
+
+	/* repeat the LUT of the VF over the whole RSS LUT of its VSI */
+	for (int i = 0; i < vsi->rss_table_size; i++)
+		lut[i] = vrl->lut[i % lut_size];
+
+	if (ice_set_rss_lut(vsi, lut, vsi->rss_table_size))
 		v_ret = VIRTCHNL_STATUS_ERR_ADMIN_QUEUE_ERROR;
+	kfree(lut);
 error_param:
 	return ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_CONFIG_RSS_LUT, v_ret,
 				     NULL, 0);
@@ -1920,3 +1937,30 @@ int ice_vc_set_rss_hashcfg(struct ice_vf *vf, u8 *msg)
 				     NULL, 0);
 }
 
+int ice_vc_get_max_rss_qregion(struct ice_vf *vf)
+{
+	enum virtchnl_status_code v_ret = VIRTCHNL_STATUS_SUCCESS;
+	struct virtchnl_max_rss_qregion max_rss_qregion = {};
+	struct ice_vsi *vsi;
+	int err, len = 0;
+
+	if (!test_bit(ICE_VF_STATE_ACTIVE, vf->vf_states)) {
+		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
+		goto reply;
+	}
+
+	vsi = ice_get_vf_vsi(vf);
+	if (!vsi) {
+		v_ret = VIRTCHNL_STATUS_ERR_PARAM;
+		goto reply;
+	}
+
+	len = sizeof(max_rss_qregion);
+	max_rss_qregion.vport_id = ICE_VF_VSI_ID;
+	max_rss_qregion.qregion_width =
+		ilog2(ice_lut_type_to_qs_num(vsi->rss_lut_type));
+reply:
+	err = ice_vc_send_msg_to_vf(vf, VIRTCHNL_OP_GET_MAX_RSS_QREGION, v_ret,
+				    (u8 *)&max_rss_qregion, len);
+	return err;
+}
diff --git a/drivers/net/ethernet/intel/ice/virt/virtchnl.c b/drivers/net/ethernet/intel/ice/virt/virtchnl.c
index ca8018e3dd42..8ea68c95f13c 100644
--- a/drivers/net/ethernet/intel/ice/virt/virtchnl.c
+++ b/drivers/net/ethernet/intel/ice/virt/virtchnl.c
@@ -329,12 +329,19 @@ static int ice_vc_get_vf_res_msg(struct ice_vf *vf, u8 *msg)
 	if (vf->driver_caps & VIRTCHNL_VF_CAP_PTP)
 		vfres->vf_cap_flags |= VIRTCHNL_VF_CAP_PTP;
 
+	if (vf->driver_caps & VIRTCHNL_VF_LARGE_NUM_QPAIRS &&
+	    vsi->rss_lut_type != ICE_LUT_VSI)
+		vfres->vf_cap_flags |= VIRTCHNL_VF_LARGE_NUM_QPAIRS;
+
 	vfres->num_vsis = 1;
 	/* Tx and Rx queue are equal for VF */
 	vfres->num_queue_pairs = vsi->num_txq;
 	vfres->max_vectors = vf->num_msix;
 	vfres->rss_key_size = ICE_VSIQF_HKEY_ARRAY_SIZE;
 	vfres->rss_lut_size = ICE_LUT_VSI_SIZE;
+	/* older VF drivers allocate their RSS LUT only once, at init */
+	if (vfres->vf_cap_flags & VIRTCHNL_VF_LARGE_NUM_QPAIRS)
+		vfres->rss_lut_size = vsi->rss_table_size;
 	vfres->max_mtu = ice_vc_get_max_frame_size(vf);
 
 	vfres->vsi_res[0].vsi_id = ICE_VF_VSI_ID;
@@ -2533,6 +2540,10 @@ static const struct ice_virtchnl_ops ice_virtchnl_dflt_ops = {
 	.cfg_q_quanta = ice_vc_cfg_q_quanta,
 	.get_ptp_cap = ice_vc_get_ptp_cap,
 	.get_phc_time = ice_vc_get_phc_time,
+	.get_max_rss_qregion = ice_vc_get_max_rss_qregion,
+	.ena_qs_v2_msg = ice_vc_ena_qs_v2_msg,
+	.dis_qs_v2_msg = ice_vc_dis_qs_v2_msg,
+	.map_q_vector_msg = ice_vc_map_q_vector_msg,
 	/* If you add a new op here please make sure to add it to
 	 * ice_virtchnl_repr_ops as well.
 	 */
@@ -2670,6 +2681,10 @@ static const struct ice_virtchnl_ops ice_virtchnl_repr_ops = {
 	.cfg_q_quanta = ice_vc_cfg_q_quanta,
 	.get_ptp_cap = ice_vc_get_ptp_cap,
 	.get_phc_time = ice_vc_get_phc_time,
+	.get_max_rss_qregion = ice_vc_get_max_rss_qregion,
+	.ena_qs_v2_msg = ice_vc_ena_qs_v2_msg,
+	.dis_qs_v2_msg = ice_vc_dis_qs_v2_msg,
+	.map_q_vector_msg = ice_vc_map_q_vector_msg,
 };
 
 /**
@@ -2766,6 +2781,13 @@ void ice_vc_process_vf_msg(struct ice_pf *pf, struct ice_rq_event_info *event,
 		goto error_handler;
 	}
 
+	/* VF must not see a config change before the reset that applies it */
+	if (test_and_clear_bit(ICE_VF_STATE_NEEDS_RESET, vf->vf_states)) {
+		dev_info(dev, "doing deferred reset of VF %d\n", vf_id);
+		ice_reset_vf(vf, ICE_VF_RESET_NOTIFY);
+		goto finish;
+	}
+
 	ops = vf->virtchnl_ops;
 
 	/* Perform basic checks on the msg */
@@ -2901,6 +2923,20 @@ void ice_vc_process_vf_msg(struct ice_pf *pf, struct ice_rq_event_info *event,
 	case VIRTCHNL_OP_GET_QOS_CAPS:
 		err = ops->get_qos_caps(vf);
 		break;
+	case VIRTCHNL_OP_GET_MAX_RSS_QREGION:
+		err = ops->get_max_rss_qregion(vf);
+		break;
+	case VIRTCHNL_OP_ENABLE_QUEUES_V2:
+		err = ops->ena_qs_v2_msg(vf, msg, msglen);
+		if (!err)
+			ice_vc_notify_vf_link_state(vf);
+		break;
+	case VIRTCHNL_OP_DISABLE_QUEUES_V2:
+		err = ops->dis_qs_v2_msg(vf, msg, msglen);
+		break;
+	case VIRTCHNL_OP_MAP_QUEUE_VECTOR:
+		err = ops->map_q_vector_msg(vf, msg, msglen);
+		break;
 	case VIRTCHNL_OP_CONFIG_QUEUE_BW:
 		err = ops->cfg_q_bw(vf, msg);
 		break;
-- 
2.51.1


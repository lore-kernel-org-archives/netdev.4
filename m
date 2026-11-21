Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302101;
	b=f/LNl6Rk9/aMFHr3Ntdc2azK48BD2OENOXgRNxGk3DhaM8wFX12IwRQqAW5xLqPdNNts
	 7U8hE5Fp/UpmdXY2YVVHjjMXktO2broWnErHJero/jhGcsbYObnPeXD2ZzlM/843lKj5l
	 DlNHowK067QoX+PjPu4gdCCTPFpDVCgBb1z1E3cJtY+WjnabJBgaF1PpfacOItNkdRZDI
	 NYo6JrZtRl8j8goe6U6c6/Bwi6IV/gcPBO37Z+CwcI+cLlSMwxXMXDGFQmlAo6VLZUsR5
	 YsEKGjk5YiawtrGhZwECGBSXnqHDpbe3lxGXmwPutGdw9MtxBOTebIgboDIMbXDdKfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302101;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5kAw8QmtVA3sbJWl4+dcG89mi1ccLjQcld0Yv3qxVIE=;
	b=XUAVXmqY2eMwDVDuKH9O7fQoAJQ0fG4IZk4lDzqrfS9lcpdgYypP5tMVDzKXQEO4wuOu
	 qpkLlMn3n5QIeWBsxb1NesdBs974Jfru/qp6FiowTWP0olW6QaMOaB2woXCUpXTpii/yp
	 9HhAjzexjkKSv2Z4duWnlc263JOtiuN51D4ztrMWnMkrAO8oLBErROUD+agn6qXFQrSbP
	 kRPPu3UBdRP+64KswKZLAELL0U4PieRmROoaOd1v6VWpTd2uWTxo2VO3bABEYGITraNzx
	 1upb9x9jw8mLJgP63J4inHAZBMKEGcQv550nza9Gvy5g+/WsJW2m0sl/MjoJNf+tClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yf3R92ha;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B2A606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yf3R92ha
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302100; x=1826838100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UB1tVxw4gUb8UKh8+xQFzYnjo//hojbNVktzDudDK8M=;
  b=Yf3R92haET7oNNihcbHyuLXPkCHbAxwkTcC2k+615/w+dxzlHfIxRs3g
   oQtgBgYZ13fY3Igy36QbCoO3JXo8ShCEMDSOFRbNtnHpB8j/RkjVAUdVQ
   4jQLdj5tHTWAf9qFYlLHD05hjzeIxgJDNTVmKcj0tUzkLC4vIPMVHX2vB
   gwuW8jIPwwOccXffqDb3/AwXylGgm4JxaSLwlNJtD5DnfxymDTeAoEPXf
   jboAtwIF6Np1Q7tQ0KvdE6A2MwhmpRcrEyQpgX4V2TFNVrHIDqcN1Pg5G
   56ETBe+pKX/NnaoTP1dj3s9+bVOrboPyOhTMQE46W8BgcY7veI8xSY74r
   w==;
X-CSE-ConnectionGUID: n9VlAViyQpueWPniwRx1tQ==
X-CSE-MsgGUID: mL2vRiQDR2ekdgKFuGicXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040158"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:01:40 -0800
X-CSE-ConnectionGUID: QqltqS8cSnq6cjV+UK/GjA==
X-CSE-MsgGUID: TRsK95StS9eCX1LHtlXm1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857014"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:01:34 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 2C91233BC4;
	Sat, 21 Nov 2026 23:01:32 +0000 (GMT)
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
Subject: [PATCH net-next v7 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
Date: Sat, 21 Nov 2026 23:55:27 +0100
Message-ID: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.51.1
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

Also available here
https://github.com/pkitszel/linux/tree/xlvf-v7
(no mlx changes, just kept series name)

The purpose of this series is to allow iavf to use more than 16 queue
pairs, in two modes: up to 64 and up to 256 queue pairs.

In order to support more queues for VF, we must give it a bigger RSS
table (GLOBAL LUT or PF LUT). There are 16 GLOBAL LUTs on E810, and one
PF LUT for every PF on given card. Both kinds could be (re)assigned to
a VF, while a PF must hold at least one of them at any given moment.
GLOBAL LUT allows VF to use up to 64 queues, PF LUT lets it use up to
256 queues.

RSS LUTs are exposed to the user for assignment via devlink resources
API, which I have extended to make it possible.

The first two patches of v6 are in net-next already, thanks Jakub!
As he asked, v7 starts with two prep patches split out of the bigger
ones: "iavf: keep RSS config across resets" fixes old iavf bugs that
apply to every PF, and keeps the RSS config set by the user across
resets; "ice: prepare RSS LUT config for runtime LUT changes" adds
the locking and the queue caps needed to change an RSS LUT at runtime.

Devlink changes:
1. Add a configuration mode (cmode) to resources, reusing the values
   of enum devlink_param_cmode. Every resource reports its cmode, like
   each param value does. Existing resources are "driverinit": a size
   set by the user is staged as size_new until the next reload.
   The driver applies the size of a "runtime" resource right away, via
   .size_set(), or fails it with nothing changed, and reports the size
   via .size_get(); occ is the current use, as before. ice RSS LUTs are
   exposed that way. The first take on it was an RFC in Feb 2025, link
   in the patch. I will do the iproute2 change for the resource cmode as
   soon as this series is merged.
2. (minor) Add devlink_alloc_drv(), to allocate a devlink instance for
   a device on behalf of another driver. ice uses it for the VF devlink
   instance, which has to be owned by ice regardless of the driver bound
   to the VF device.

There are also patches for Admin Queue extension, GLOBAL RSS LUT
alloc/free, and two rather big "new opcodes" patches, by Ahmed (iavf)
and Brett (ice).

Finally there is a patch that adds devlink instance for VF and
registers devlink resources on it, combined with all the glue code to
make actual use of the whole series and accept the larger number of
queues for VF. This (the last) patch contains usage examples.

Each PF and each VF has one "rss_lut" resource, the size of the RSS LUT
it uses, in entries: 64 (VSI LUT, VF only), 512 (GLOBAL LUT), or 2048
(PF LUT). The "whole device" instance reports how many LUTs of each
kind the device has (size), and how many of them are in use (occ),
read-only. On a card with 8 PFs:
$ devlink resource show devlink_index/11
devlink_index/11:
  name rss_lut_512 size 16 occ 0 unit entry dpipe_tables none
  name rss_lut_2048 size 8 occ 8 unit entry dpipe_tables none
$ sudo devlink resource set pci/0000:18:00.0 path rss_lut size 512
$ devlink resource show pci/0000:18:00.0
pci/0000:18:00.0:
  name rss_lut size 512 unit entry size_min 512 size_max 2048 size_gran 512 dpipe_tables none

The RSS indirection table set by the user is kept on a LUT change, and
on reset: ethtool_rxfh_indir_resize() repeats it to fill a bigger LUT,
and folds it into a smaller one. ice rejects a PF LUT change when the
table can't be folded into the new LUT, or uses queues that the new LUT
can't spread traffic to. iavf drops the table only when it can't be
folded, or uses queues the VF no longer has.

Things AI reports but I don't want to change:
 * hardening against a malicious or buggy FW: we have to trust the FW
 * hardening of the VF against a malicious or buggy PF: likewise, VF has
   to trust its PF
 * iavf: ethtool -L max is the PF RSS region in LARGE mode, so iavf
   asks only for queues that RSS can spread traffic to; ice never
   grants a VF request for more queues than its RSS region, only the
   admin can give a VF more, via sriov_vf_msix_count
 * iavf: fixes of older bugs that apply to every PF are in the first
   patch, for net-next, not net: they are rarely hit without the rest
   of this series, which makes them common
 * non-atomic updates of iavf adapter->flags: pre-existing pattern in
   the whole driver, out of scope of this series

AI also reports lock inversions around
ice_tear_down_devlink_rate_tree(). They are pre-existing, patch 4/6 of
my DCB series fixes them. That series also fixes other pre-existing
issues reported by AI:
https://lore.kernel.org/netdev/20261102105346.30739-1-przemyslaw.kitszel@intel.com

My local Sashiko runs reported a few more pre-existing issues, I am
happy to work on them.

v7:
 * drop the shared devlink patches, applied to net-next by Jakub
 * split out two prep patches, and put them first (Jakub)
 * devlink: resource cmode instead of .occ_set(), occ is the current
   use again (Jakub); new DEVLINK_ATTR_RESOURCE_CMODE, reported for
   every resource; runtime resources documented in
   devlink-resource.rst; Alex's Reviewed-by dropped due to the rewrite
 * ice: one runtime "rss_lut" resource per PF and per VF, the size of
   its RSS LUT in entries, switched in one step; the whole device
   rss_lut_512 and rss_lut_2048 are read-only, size is the number of
   LUTs, occ is how many of them are in use; no "rss" parent resource
   (Jakub); a small deviation: a new size applies right away, it is the
   LUT in use, not a cap for the next LUT allocation
 * ice, iavf: keep the RSS indirection table set by the user when the
   RSS LUT size changes, and on reset: fold or unfold it with
   ethtool_rxfh_indir_resize(), instead of resetting it to the default
   spread; iavf keeps the RSS key set by the user across resets too
   (Jakub)
 * ice: reject a PF LUT change when the user RSS table uses queues that
   the new LUT can't spread traffic to, and RSS LUT changes with RSS
   disabled, e.g. in safe mode
 * ice: cap the total count of queues of each type in the chunks of
   ENABLE_QUEUES_V2 and DISABLE_QUEUES_V2, overlapping chunks made PF
   repeat the work on the same queues many times (Sashiko)
 * ice: fail __ice_vsi_get_qs() when the queues don't fit in the
   scatter count, instead of cutting the count to 16
 * ice: clear ICE_FLAG_TC_MQPRIO when the ADQ setup fails, it blocked
   RSS LUT changes (Sashiko)
 * ice: unregister the VF devlink instances before pci_disable_sriov()
 * ice: return -ENOSPC from sriov_vf_msix_count when the VF queues
   don't fit in one free range of PF queues, before anything is torn
   down
 * ice: clear the disabled state of a VF whose VSI rebuild failed on
   a PF reset, so a VFLR can recover it
 * iavf: check the length of the VIRTCHNL_OP_GET_MAX_RSS_QREGION reply,
   and cap qregion_width (Sashiko)
 * iavf: clear IAVF_FLAG_REINIT_MSIX_NEEDED also on a reset while down
   (Sashiko)
 * iavf: keep the RSS buffers on reinit after iavf_disable_vf(), they
   leaked
 * smaller fixes, mostly after Sashiko review; per-patch changelogs are
   under "---"

Previous versions (the v6 cover letter has the v2..v6 changelogs):
v6: https://lore.kernel.org/netdev/20261117094913.100756-1-przemyslaw.kitszel@intel.com
v5: https://lore.kernel.org/netdev/20261110141534.95614-1-przemyslaw.kitszel@intel.com
v4: https://lore.kernel.org/netdev/20261103141646.303620-1-przemyslaw.kitszel@intel.com
v3: https://lore.kernel.org/netdev/20261015185454.6332-1-przemyslaw.kitszel@intel.com
v2: https://lore.kernel.org/netdev/20261009121433.30347-1-przemyslaw.kitszel@intel.com
v1: https://lore.kernel.org/netdev/20260508124208.11622-1-przemyslaw.kitszel@intel.com


Ahmed Zaki (1):
  iavf: use new opcodes to request more than 16 queues

Brett Creeley (2):
  ice: add VF queue ena/dis helper functions
  ice: introduce handling of virtchnl LARGE VF opcodes

Przemek Kitszel (12):
  iavf: keep RSS config across resets
  ice: prepare RSS LUT config for runtime LUT changes
  ice: add helpers for Global RSS LUT alloc, free, vsi_update
  ice: rename ICE_MAX_RSS_QS_PER_VF to ICE_MAX_QS_PER_VF_VCV1
  ice: bump to 256qs for VF
  iavf: extend iavf_configure_queues() to support more queues
  iavf: temporary rename of IAVF_MAX_REQ_QUEUES to
    IAVF_MAX_REQ_QUEUES_VCV1
  iavf: increase max number of queues to 256
  devlink: add cmode to resources
  ice: represent RSS LUTs as devlink resources
  devlink: add devlink_alloc_drv()
  ice: support up to 256 VF queues

 Documentation/netlink/specs/devlink.yaml      |  10 +
 .../networking/devlink/devlink-info.rst       |   2 +
 .../networking/devlink/devlink-resource.rst   |  19 +
 Documentation/networking/devlink/ice.rst      |  83 ++
 drivers/net/ethernet/intel/ice/Makefile       |   1 +
 drivers/net/ethernet/intel/iavf/iavf.h        |  36 +-
 .../net/ethernet/intel/iavf/iavf_register.h   |   2 +
 .../net/ethernet/intel/ice/devlink/resource.h |  28 +
 drivers/net/ethernet/intel/ice/ice.h          |   9 +-
 drivers/net/ethernet/intel/ice/ice_adapter.h  |  29 +
 .../net/ethernet/intel/ice/ice_adminq_cmd.h   |   1 +
 drivers/net/ethernet/intel/ice/ice_common.h   |   1 +
 drivers/net/ethernet/intel/ice/ice_lag.h      |   2 +-
 drivers/net/ethernet/intel/ice/ice_lib.h      |   5 +
 drivers/net/ethernet/intel/ice/ice_switch.h   |   5 +-
 drivers/net/ethernet/intel/ice/ice_vf_lib.h   |  36 +-
 drivers/net/ethernet/intel/ice/virt/queues.h  |   5 +
 drivers/net/ethernet/intel/ice/virt/rss.h     |   1 +
 .../net/ethernet/intel/ice/virt/virtchnl.h    |   4 +
 include/linux/net/intel/virtchnl.h            | 129 +++-
 include/net/devlink.h                         |  12 +
 include/uapi/linux/devlink.h                  |   2 +
 .../net/ethernet/intel/iavf/iavf_ethtool.c    |  61 +-
 drivers/net/ethernet/intel/iavf/iavf_main.c   | 360 ++++++++-
 .../net/ethernet/intel/iavf/iavf_virtchnl.c   | 295 ++++++-
 .../net/ethernet/intel/ice/devlink/resource.c | 727 ++++++++++++++++++
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  19 +-
 drivers/net/ethernet/intel/ice/ice_base.c     |  14 +-
 drivers/net/ethernet/intel/ice/ice_common.c   |   5 +-
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |  90 ++-
 drivers/net/ethernet/intel/ice/ice_idc.c      |  24 +-
 drivers/net/ethernet/intel/ice/ice_lag.c      |  54 +-
 drivers/net/ethernet/intel/ice/ice_lib.c      | 197 ++++-
 drivers/net/ethernet/intel/ice/ice_main.c     |  57 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c    |  32 +-
 drivers/net/ethernet/intel/ice/ice_switch.c   |  52 +-
 drivers/net/ethernet/intel/ice/ice_vf_lib.c   |  85 +-
 .../net/ethernet/intel/ice/virt/allowlist.c   |   8 +
 drivers/net/ethernet/intel/ice/virt/queues.c  | 584 ++++++++++++--
 drivers/net/ethernet/intel/ice/virt/rss.c     |  54 +-
 .../net/ethernet/intel/ice/virt/virtchnl.c    |  36 +
 net/devlink/core.c                            |  24 +
 net/devlink/netlink_gen.c                     |   5 +-
 net/devlink/resource.c                        |  84 +-
 44 files changed, 3021 insertions(+), 268 deletions(-)
 create mode 100644 drivers/net/ethernet/intel/ice/devlink/resource.h
 create mode 100644 drivers/net/ethernet/intel/ice/devlink/resource.c

-- 
2.51.1


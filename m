Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212049;
	b=2l5YWtCI9o43neIWVtgIkES+FQCO97jBY6qP8jZFLVu26quZtoltbhc04xeG9Kvc8/6A
	 gVE06+U7tbeNM6GecladQhq6M0ivGegO813ERiW9p5t1Uli3+fMI1YIDOP/vWgGhBxo3s
	 nfuBHvdFW8Qn9fKSYbWUaHYe4mdK6Xrh6y0P2uQEwusIbavCEbbnIn0XZTSP4m7mWTeZ9
	 YohT0L0XijHceiSm/4w6ptsDrZB5enQokCXx/MW8/tFdOXf8TVqI4/0OUcfx+Dur0eaY/
	 INBOxTRPBVzf004vZG4VqtNNh2FDdh2bJ3mGJbmz0ZV7eNLEZCILduWkd4xwKck1dhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212049;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ODSbPXtL259OuvsdxS9aDDr7wxdthXv305hkV28XLeU=;
	b=tzMia9quaFnKz2CER3ZXsEj8CbIZ2h9itimj2SyRUZh4mSHlkc/wcTYQ8A6eXLqMB/Dv
	 o5e9dozTKO18aifPAvPU9qWNt96VWyKkEjW4+hMf4xkaMNTjqcQXdyzhb+Zc7rNxKYmzx
	 Z1deC+1TMrxvODpMxPinStxKKxOdxr3wph5brWpFiqUnf5gdSdRSuWXeex/Yjn3/EvFgA
	 kg8+Q2fLhL8MAZ+QDbJpDSq3j68yjinPIoVKW4cnMiZKVhqKQpEwKydf9TXxBUk0f+vj+
	 QfnNQg5yn3nN120LIhSz1IJHZxCc85abFVRkOJpsSHgs6Mxx6COBDg5JOE7s1aMz61A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="eAljX/2X";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB009606A6A6
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB009606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eAljX/2X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795212040; x=1826748040;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ScLT3+xkEYoLS8E1+WqfDJUvPVG/XUUTAgcSFhI0YyI=;
  b=eAljX/2XWigNI2ZsqT3YNTvnHne54yFl2/Jh1awg/oHLdHWOS2p34AZ3
   GtsRjLjfvEeT9jmIFiX8A3ZqEOZTOVyR+NjilKnoJeBDMyrm3fNntfGlz
   B9rMtMSbMPR5qXDnexl7dlhYetzIwp5Gw/qbZpcH842eHwilosmkWSa0V
   UqOCsg+XxLBYEX0rA3BCjjrdqELD7URvRTCweSK+YmT9ftOCJMpaHfjwd
   5cJAH6m1hzepD6CI5J3Py58GDbXyjOqQrjOc/mAaCjH1B3B6sjCyjRp3d
   H1qgQMuPtcdHGB2RYIiiTwghxpYeZzhMramiyLSuNURYGkPaDg/PGOp2d
   g==;
X-CSE-ConnectionGUID: rRKKTHB3QgGj3n1cZ+tyNA==
X-CSE-MsgGUID: d8vW7i9HRrCDO4JZBQDvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3995020"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3995020"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 14:00:37 -0800
X-CSE-ConnectionGUID: EDP6IQmLTxCgpJFBWlMN6g==
X-CSE-MsgGUID: +vkAbMyAQsyNNUNLKr300w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10775813"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 14:00:34 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	ripatel@wii.dev,
	xiaolinkui@kylinos.cn,
	xiaolinkui@126.com,
	tomasz.lichwala@linux.intel.com,
	runyu.xiao@seu.edu.cn
Subject: [PATCH net 0/4][pull request] Intel Wired LAN Driver Updates 2026-11-20 (ixgbe, ixgbevf, fm10k)
Date: Fri, 20 Nov 2026 14:00:16 -0800
Message-ID: <20261120220022.3133664-1-anthony.l.nguyen@intel.com>
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

Richard Patel fixes an MDIO bus lifetime issue on ixgbe by converting to
the managed MDIO registration over the driver's own handling.

Linkui Xiao preserves and restores the full ACI command data across
retries for ixgbe.

Tomasz Lichwala fixes Hyper-V link speed reporting for E610, on ixgbevf,
by obtaining the data from PCI config space.

Runyu Xiao prevents the service timer from being rearmed after removal by
replacing timer_delete_sync() with timer_shutdown_sync() on fm10k.

The following are changes since commit 00f445721c7f0e48aaff9813cfe1c065c6eb3b71:
  vsock/vmci: reject datagram binds in local network namespaces
and are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue 10GbE

Linkui Xiao (1):
  ixgbe: fix incomplete ACI command buffer backup on retry

Richard Patel (1):
  ixgbe: fix MDIO bus lifetime

Runyu Xiao (1):
  net: fm10k: shut down the service timer during removal

Tomasz Lichwala (1):
  ixgbevf: fix link speed reporting for Hyper-V E610 VFs

 drivers/net/ethernet/intel/fm10k/fm10k_pci.c  |  2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c |  7 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |  9 +--
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c  |  2 +-
 drivers/net/ethernet/intel/ixgbevf/ethtool.c  | 12 ++++
 drivers/net/ethernet/intel/ixgbevf/vf.c       | 68 ++++++++++++++++---
 6 files changed, 79 insertions(+), 21 deletions(-)

-- 
2.47.1


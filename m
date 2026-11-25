Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647116;
	b=3rpafygzj2PvLkrrv4Ve39YaL0/Mxc5tmWjxFPr2BZGlPkHXd4l26GBiamd7JhIrF9Rn
	 EyCJYbhYunQtJOmF6tZ16kEsvJwPl1ajcli8eEuvl1hS1sSVlUlAe3cdI62BI4oRFuNlB
	 JnxfE/4ZNofNiNK21lBG37ArfNeSMMBxIlM81zFIl6al90ykyP57RNwHwZBwC8J/kqhUT
	 06joysRwEG9sb6oLN3WAXq1csfB/gOSdWWx3AV5mtX09VI3BnQiEWjj7G9cojtwr3H2VE
	 qVFJ0jGO2j16nS0iFM9NXmlI4q7zli5EB4Z6B3S9wx1MVNRTRBwmDhcvZ6L/YxVOu/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647116;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=viFETnqkWBFpcncHCsQtO97OYYmjLJHZn4RSa+CUYFU=;
	b=ZgACDXwikUTHpaf0O8HCdJmBQhptIqDzXsGYJww+/CzRMUAlco51e4CMlYqJdMn1eg31
	 quNJibW+eCdD5J1aEfTLQscRl/zfvq7pBAAvWBvj6VVCXAnRB7x1AHIB70KyrsIdXvcpC
	 Epwx88fmt8iyUKq8fzZsgHqSBgU8qdQ4WIAdOpZ4NyEGeYo/XCvPlqTt0CezWcKXygkXp
	 AzwF9tdCQDwFJ+QbOyTpnjrZuP7BmQjoam9l+OjKXwUdcOajjo/zZbV7EItyGTGgUu2LH
	 mTfRoixKYXPW6l1rZ49QgjhHThNb9JRRhI5Q4NEbeUvVCJZHG+NNhbC+CJo7vvDxswA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VeMv5KFt;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB8606A337
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEB8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VeMv5KFt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795647115; x=1827183115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bMzude+mzTqDZ3KoS9xLJI8VEjBHxU+G9Uwnb5Y7SbQ=;
  b=VeMv5KFtjaN4VLSONi3Gz/19RgU0mBWeuJLHe9Q16GVkyTEtxCeWazV+
   DWbTJDzJOnsIcQ1rHngNI0kEYw5Yrkz6NEwMpzGMUJdWLQEnslqzhWc/x
   pr2dQTnNFG7QWpDv1lrypeOy4NbxVWhiF2TilWREzNyvzbgBbiikx4ozO
   WjCyaOZQsu4/ovezqFGCS1kqqTPMXBw9Wj1+V89tFZLWGVakeSa0CPu8j
   7Umeh7V8noxixgi/ZCsynP8amOWecDSkIV7itjn4dGUYTkTWgXsMl9XlJ
   NQPAEy7mDw5b9FcZjx0nwLuycA6suYFJ373ck22BrEMcuBa3UUJgk5f0n
   A==;
X-CSE-ConnectionGUID: +D2s2ZipSfaW8vIaOSt4SA==
X-CSE-MsgGUID: JkA7LKlOR1ql+M/uSH1exg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4450645"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4450645"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:51:54 -0800
X-CSE-ConnectionGUID: iTyorZgqQlK4NDrrDh04jA==
X-CSE-MsgGUID: x568yNxcTfazsCpBd7mgew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11996930"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 14:51:55 -0800
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	willemb@google.com,
	netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	oss.patchbox@gmail.com,
	tianxun.ng@bytedance.com,
	emil.s.tantilov@intel.com,
	richardcochran@gmail.com,
	milena.olech@intel.com,
	konstantin.ilichev@intel.com
Subject: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates 2026-11-25 (idpf)
Date: Wed, 25 Nov 2026 14:51:37 -0800
Message-ID: <20261125225145.4126333-1-anthony.l.nguyen@intel.com>
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

Yuho Choi fixes memory leak of IRQ name in failure path; also returns
-ENOMEM if name allocation fails.

Tian Xun Ng fixes shutdown and removal races by ignoring Tx timestamp
and link events during teardown and keeping the mailbox active long
enough to disable and remove vports.

Emil Tantilov resolves PTP use-after-free issues by introducing
rxq_grps_lock to serialize rsrc->rxq_grps transitions against the worker
and correcting unwind ordering during initialization failure.

The following are changes since commit 7ed616970b652ae76d99a01b468588e491021648:
  mptcp: gate diag sequence counters on CAP_NET_ADMIN
and are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue 200GbE

Emil Tantilov (2):
  idpf: fix use-after-free in the PTP auxiliary worker
  idpf: release PTP before freeing vports on the init task error path

Tian Xun Ng (3):
  idpf: ignore Tx timestamp replies once removal has started
  idpf: ignore link events once removal has started
  idpf: keep the mailbox up while tearing down vports on shutdown

Yuho Choi (1):
  idpf: Fix vport IRQ name leak on request failure

 drivers/net/ethernet/intel/idpf/idpf.h        | 10 ++-
 drivers/net/ethernet/intel/idpf/idpf_lib.c    | 12 +++-
 drivers/net/ethernet/intel/idpf/idpf_main.c   | 11 +++
 drivers/net/ethernet/intel/idpf/idpf_ptp.c    | 16 ++++-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   | 68 ++++++++++++++-----
 .../net/ethernet/intel/idpf/idpf_virtchnl.c   | 49 +++++++++++--
 .../net/ethernet/intel/idpf/idpf_virtchnl.h   |  1 +
 .../ethernet/intel/idpf/idpf_virtchnl_ptp.c   |  3 +-
 8 files changed, 142 insertions(+), 28 deletions(-)

-- 
2.47.1


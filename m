Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180737;
	b=lebNnziPAUtqONIrPTkRaZu3n8a3n9W0qgg7RK0cqiMM9sERokzn6s7vcA0lEa6f6hwg
	 abOtCSz/3fHuYj725TYDdVciGYsI5O1Lm1FSQ6kC97BH7pOUyMqmTcpmhmBsBu1PN3J7m
	 mkBjkJMcS29Z1gGQzVRmQpkTBD/vzgJ9cNdfN2fVjrqA9H9S+snjKH1t2bIHf2FkK9U+E
	 70SaxDC2ZMWlhNGvc+6GDyLwt40Q1e8aBWZO1DydXagjf5F5Twjr+V4StPNH/LN/ZRYNa
	 fbofmeRgtmwgnF8R1D93lHHJVYcqysVHGV0Z1VkjWJlbS3lZRpQfUT+1Cqxe0URvciw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180737;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7vhtwzXgoC5BMw/zcM6/KX8DJnRqVymglyCO+JLqz0c=;
	b=Uo4VsBcJuOFIvrr6I0cbh0CEF6vN3UEhuE11xLQkZ196MyQo5wP1efxYrJGnOkJDofly
	 d6rXmcnt54alfqYPfe1eIuuoR/1x1q3EB01vE3UILyJDML75vfvfUqKbfqM69UmXChE8H
	 keForHKh/puSnC3AwHMk996UMG5dmfEtOi9dPfvR9D9mJZJE2aoQEiaermUGjIb5WiZcQ
	 5fyZDU7tsloL2B+c9S4I3wGSlPqQnHtfpQ7Jnm1vwFRAEacq2V+YfXvK8fNnLckyfyeb1
	 FbDmW10DlDjMuBysgbuzYko4aZ3AIOIVI/bOOeZomQhWIR9T5EWn1YjxqW6M87eYqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7mQfuiI;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC6A606A326;
	Fri, 20 Nov 2026 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7mQfuiI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795180737; x=1826716737;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JpSwqpRYyuHGJVKnLsoDIc7PuNkmDWVSooM6fHdPxqM=;
  b=m7mQfuiI/1o0Swr4Zw7BOyhl8vg4inrSJfOVyGyUv+YfE6nLuTtv6yMT
   FSELKURrUjrUBvvobE+kStH7U5Vj0yJtYeWhA8P1BCTby2bWvJsp6ghMs
   aF1noCYGHlHQFDCna1KfAWFa2jE0acef3aAnhMZvhAVJOxOZg13OLLmz+
   FQG4pR9NmEUCIh1EZABWya7B6nAAl0cHpJ6W+p7EwuRBnsUxja7Yw4ula
   Vm6UR4ZtruyPvbkYxGA1q9QCbuOBR8t2yGmjNOrQcoeouF3T8wvqNLuZl
   plRAYbuHAeLVF7DwsZny4SdRcoAYEW/Qbize13jvl51e14/ogXpDxZ4DB
   Q==;
X-CSE-ConnectionGUID: Y38fTb/4QaWpx1PwKdM1fg==
X-CSE-MsgGUID: 4zjlGLpJSTCqHAluopv3vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4101477"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4101477"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:18:55 -0800
X-CSE-ConnectionGUID: SUQtMr9QRZqKrvVtf+8XOA==
X-CSE-MsgGUID: d1li8qXERXi9iAcLdgJ0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11269474"
Received: from emr-371.sh.intel.com ([10.112.106.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:18:53 -0800
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: jv@jvosburgh.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: jamie.iles@oss.qualcomm.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baoli Zhang <baoli.zhang@linux.intel.com>
Subject: [PATCH net] bonding: fix use-after-free in slave_kobj_release()
Date: Fri, 20 Nov 2026 21:08:14 +0800
Message-ID: <20261120130814.2131659-1-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

slave_kobj_release() dereferences slave->bond to check for 802.3ad mode
before freeing ad_info. The slave kobject's parent is the slave device,
not the bond, so the bond may already be gone when the release runs.

Normally the last reference is put while the bond is still alive, but
with CONFIG_DEBUG_KOBJECT_RELEASE the release is deferred and the bond
can be freed first:

  BUG: KASAN: slab-use-after-free in slave_kobj_release+0xe8/0x100 [bonding]
  Read of size 4 at addr ffff888112c99118 by task kworker/9:1/60681
  Workqueue: events kobject_delayed_cleanup
  ...
  Freed by task 60681:
   kvfree+0x31/0x40
   netdev_release+0x8b/0xc0
   device_release+0xdf/0x2a0
   kobject_delayed_cleanup+0x148/0x520

ad_info is only allocated in 802.3ad mode and is NULL otherwise, since
the slave is allocated with kzalloc(), and the mode cannot be changed
while the bond has slaves. Drop the mode check and free ad_info
unconditionally.

Fixes: b9ad3e9f5a7a ("bonding: wait for sysfs kobject destruction before freeing struct slave")
Signed-off-by: Baoli Zhang <baoli.zhang@linux.intel.com>
---
 drivers/net/bonding/bond_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index a1c156c145b2d..0ec5bc838b86e 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -1732,11 +1732,10 @@ static void bond_upper_dev_unlink(struct bonding *bond, struct slave *slave)
 static void slave_kobj_release(struct kobject *kobj)
 {
 	struct slave *slave = to_slave(kobj);
-	struct bonding *bond = bond_get_bond_by_slave(slave);
 
 	cancel_delayed_work_sync(&slave->notify_work);
-	if (BOND_MODE(bond) == BOND_MODE_8023AD)
-		kfree(SLAVE_AD_INFO(slave));
+	/* ad_info is only allocated in 802.3ad mode, NULL otherwise */
+	kfree(SLAVE_AD_INFO(slave));
 
 	kfree(slave);
 }

base-commit: bc4c8c146447f71534e80db39c2d1149c6af5fd6
-- 
2.43.0


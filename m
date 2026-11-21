Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302127;
	b=vzoxlTx0PvuFNHywl0ePIZ3Lg4TfoamFP8ziQ6Ds+3r9K/snnQXWfVxipRcmoH/vyywC
	 jfnUUtv+pYEHdVlTBJ/aTUo7aPQ/JiPlWa9q7vQfMHjRmj8ETDnMe9X3npG1DMVeJr2q+
	 ziqPg+M2Lg+S7da2fYBtPD6LsrB2gJgKkP5oMmNrEZKeJuMx8Ixg0iOsxtD8NKDu3Q79l
	 0LsQqbQN1FD8js/dp+chKrGzcf3hICA3IGKN+JkK8kdXc08XZ7MxtU0gtD68wQS1unU/W
	 8JK9jlbET9kNOb7Vwir3YHcoQEtwI4TbZzCnQgTFSbGJbTYnZv19JUGRxyMTzIekTqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302127;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YOzAeHegWCKot3GoFSd3bedbmM/yytvI3+AP9sYPSyU=;
	b=1cvAVXszjqY01SOOYYdFVXaRhEKiZeDPPsSFukcXOKStr3+XsaDKnnmQO61CyhWwbAcS
	 h9cf4viuRtKki1ttXqHRRNM4UC2UT3hjaApVUwNpLubmUEgY6hmoDLfvKNiPwvj8ZXpWj
	 gofwq+FVR5EijZGZ+l7DIs0zVpE8nK2PEFLW1MwxRrDBa1XtsBT2RkHY2FIgaW4kyL1fT
	 Z9kClMS47DYKshKqnDzkOvEbZbuwlHZz4ZMd99III6suxAzSp3bStMBGTSgI3uS5iIj9w
	 DoSmdWZsYxzMxGaQWBjnkxpnCdt3rkQ7APOK66JTpYP1owPHJgJ6gkEsUbljmd4/6uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jozp2K6Q;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE20606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE20606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jozp2K6Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302127; x=1826838127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pJm5DIJU6ZWCnBlLIeu3PeuFIKJzBpRJuUEZCNhVW5Q=;
  b=Jozp2K6Qj49hlsBv+xIX8fc4EvImKy3J1jMz8Q0mt67gJ09S3RbYej5/
   FgDDSWR3Q/tTL+hALghIgHuq9HohTZiSP0mwQSiJ+i45cNKtUGUMum165
   Q34h9PYPkZnoNyWhDgKeOfcKE3qtebb5aXP8nnrGB/SuNdFx+PnzZ9hbu
   gmuRywFFyr7gohAY0cI3cRZ1FKpd3iweu0I7S0NtnrR/ePg73Kpc3M1wH
   uh7PhDOd+BuytD6KfkMZVwEwcRiQ71av046D31x3+Wi1aJSw0OxhdhZ9c
   zSTVoapvxKwJxVHvDUASD3+nV1sxOlQ8AOGZvYV5txZk6LcGmGQd86Z6z
   Q==;
X-CSE-ConnectionGUID: p9RWm/jtRUKvqso3fC7mWg==
X-CSE-MsgGUID: dTYLkkrmTgCJxgsTg49g7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4040280"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4040280"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:02:07 -0800
X-CSE-ConnectionGUID: xGcgSVrSTsm6CEHEnW+K1Q==
X-CSE-MsgGUID: mJ3SawI2QvKaTkDVqEMMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10857078"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2026 15:02:02 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id C936D33BC6;
	Sat, 21 Nov 2026 23:01:59 +0000 (GMT)
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
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [PATCH net-next v7 14/15] devlink: add devlink_alloc_drv()
Date: Sat, 21 Nov 2026 23:55:41 +0100
Message-ID: <20261121230123.316391-15-przemyslaw.kitszel@intel.com>
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

devlink_alloc() records the driver bound to @dev at the time of the
call as the owner of the new instance. That fits the common case of
a driver creating an instance for the device it is bound to, but not
a PF driver that creates instances for its VFs, as the VF device could
be:
 * not bound to any driver yet (VF driver not loaded, or
   sriov_drivers_autoprobe disabled), what triggers the WARN_ON() in
   __devlink_alloc();
 * bound to another driver (VF driver, or vfio-pci), which could be
   unloaded while the instance is still registered, leaving the stored
   driver pointer dangling (it is used to report the driver name in
   devlink dev info).

Add devlink_alloc_drv(), a variant of devlink_alloc() that takes the
owning driver explicitly, as devlink_shd_get() already does.

The first user is ice, in the next patch, which creates a devlink
instance for each of its VFs.

Such an instance reports the owning driver in devlink dev info, not the
one bound to the device in sysfs. Document that in devlink-info.rst.

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
v5:
 * document @drv lifetime and device lock rules in kernel-doc (me)

v4:
 * document in devlink-info.rst that an instance created for another
   device reports the name of the creating driver (Sashiko)

v3:
 * new patch
---
 .../networking/devlink/devlink-info.rst       |  2 ++
 include/net/devlink.h                         |  4 ++++
 net/devlink/core.c                            | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/Documentation/networking/devlink/devlink-info.rst b/Documentation/networking/devlink/devlink-info.rst
index dd6adc4d0559..7ac5625e2934 100644
--- a/Documentation/networking/devlink/devlink-info.rst
+++ b/Documentation/networking/devlink/devlink-info.rst
@@ -25,6 +25,8 @@ versions is generally discouraged - here, and via any other Linux API.
      - Description
    * - ``driver``
      - Name of the currently used device driver, also available through sysfs.
+       For an instance that a driver creates for another device, e.g. a PF
+       driver for its VFs, the name of the creating driver.
 
    * - ``serial_number``
      - Serial number of the device.
diff --git a/include/net/devlink.h b/include/net/devlink.h
index dc9a642796f2..eb38f35a0ee6 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1695,6 +1695,10 @@ static inline struct devlink *devlink_alloc(const struct devlink_ops *ops,
 	return devlink_alloc_ns(ops, priv_size, &init_net, dev);
 }
 
+struct devlink *devlink_alloc_drv(const struct devlink_ops *ops,
+				  size_t priv_size, struct device *dev,
+				  const struct device_driver *drv);
+
 int devl_register(struct devlink *devlink);
 void devl_unregister(struct devlink *devlink);
 void devlink_register(struct devlink *devlink);
diff --git a/net/devlink/core.c b/net/devlink/core.c
index 9b844e0c1bd2..e2a7169287ec 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -531,6 +531,30 @@ struct devlink *devlink_alloc_ns(const struct devlink_ops *ops,
 }
 EXPORT_SYMBOL_GPL(devlink_alloc_ns);
 
+/**
+ * devlink_alloc_drv - Allocate new devlink instance resources for given driver
+ * @ops: ops
+ * @priv_size: size of user private data
+ * @dev: parent device
+ * @drv: driver that owns the instance
+ *
+ * Variant of devlink_alloc() for a driver that creates an instance for
+ * a device bound to another (or no) driver, e.g. a PF driver for its VFs.
+ *
+ * @drv must not be NULL and must outlive the instance, only a pointer to it
+ * is kept. Operations that take the device lock, like reload, lock @dev,
+ * not a device bound to @drv.
+ *
+ * Return: new devlink instance, NULL on failure.
+ */
+struct devlink *devlink_alloc_drv(const struct devlink_ops *ops,
+				  size_t priv_size, struct device *dev,
+				  const struct device_driver *drv)
+{
+	return __devlink_alloc(ops, priv_size, &init_net, dev, drv);
+}
+EXPORT_SYMBOL_GPL(devlink_alloc_drv);
+
 /**
  *	devlink_free - Free devlink instance resources
  *
-- 
2.51.1


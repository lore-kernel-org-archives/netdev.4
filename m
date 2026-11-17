Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908532;
	b=3pa4VAC2mcBUeKXp8NOCbnpeRSwDDwI+2D0baRurf6YOljUYw+WPPotaDjNJvoWhGrgA
	 RMyl21TDTIKhIKaz2goimrbfCPgdIm7lnuHSW8/e8rbWXbnOcNP9VsdeU9CtExfHQ+DlD
	 h1IgleceSXgmXqAYSkOlXEP//RxkfUnn+FFcIEJrO7wBx8UtjmkX7ZzcYTD7eZOEfma7J
	 VYrWq1ur+0e+ltZBVzWmoZGj3vLP475WH9lI1NLBT5kvkZCQnP6trpFZO72smniDoP9px
	 sEWpqxBNzxRltf9i29Z/XhWFjehaxXjOO8vR8S5eOP0+safOb9F4hup2qGd+urUJ5YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908532;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rnjQxJRQw4H/Sj755x7HEM8BhtkrTsTxhykh2iT8rHA=;
	b=uC6Q9zXFup/cBdcjceydFo9hzgTLTrlzyThLI8+KQvgh5TEvykjZ5i9eXvnRfnXaYRij
	 NQL4dZaY6MRrlBjuVSiJk2Kv2kAw8cJlvKm3XSWE+pbfASyJv+A3UzIDoYKOPIKoEP8HS
	 8YSYGztsiX5jXcy6o7JkkimtcMKQptfNRPrU2t8oZnUW0CmyRet/64QwSKi6ndgCpHnvT
	 rR/nmN9v6JkqI0p+1BSbaRCfIV3WTen4ABXyAp8REE1p25QJYItRcACpd7bQXzFXpInNZ
	 oqFQuEDsFBlXBKznKutG+ESJBa/bwN2UyGaV2Y4/WAF6aQV7h46VEI9ermNUp/bnP9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UtaXg7aS;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952D4606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 952D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UtaXg7aS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908532; x=1826444532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8tGd3lBufXOtbh0njJvg9T/ji2xEYsgN5K8McDXGt8A=;
  b=UtaXg7aSwql6atTx3wOnEeNeAKuSTOs0q206t+IUpL0vwjvQy/ZkxHmX
   jRNEECPy4AkDscJAL2MwlFzzE6Q64WtGwBIS4worJtYKZgiLYWtDT8wDO
   p1VuOadyO86DbO65+613ESZlwN6IRYhXA9MEzUMO4/lxUzE15ZxsvlyAM
   TNKEsxEV8FJ/KDE0H7ELdGtOIrOgBnIIM3WyILXvTSnN2sp42kCJ2UVzi
   G9gNM1ei8WnBNwRl1XSx3jt+y9Ga8Q5stOG2OjieCAfHBZsepvwjcvhX/
   dPcHrUmnja6sOJlzALTRHqmLIARKcP5Nnynk8CLOq7j98tyTVjDOi4IO7
   Q==;
X-CSE-ConnectionGUID: lQ+1D5vZRMqgpMglyY7Gvw==
X-CSE-MsgGUID: tloANNSeQ8CxzRHmnvZj9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3553812"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3553812"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:59 -0800
X-CSE-ConnectionGUID: qWVfhc4hSumKLzKflt2afQ==
X-CSE-MsgGUID: cW7Q/M4oSXaUOdjq0wHKbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11591395"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 01:41:49 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 81C8D28198;
	Tue, 17 Nov 2026 09:41:46 +0000 (GMT)
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
To: kuba@kernel.org,
	netdev@vger.kernel.org
Cc: aleksandr.loktionov@intel.com,
	andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com,
	anzaki@gmail.com,
	brett.creeley@amd.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	jedrzej.jagielski@intel.com,
	jiri@resnulli.us,
	leon@kernel.org,
	mbloch@nvidia.com,
	mschmidt@redhat.com,
	ohartoov@nvidia.com,
	pabeni@redhat.com,
	poros@redhat.com,
	rdunlap@infradead.org,
	saeedm@nvidia.com,
	skhan@linuxfoundation.org,
	tariqt@nvidia.com,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [net-next v6 14/15] devlink: add devlink_alloc_drv()
Date: Tue, 17 Nov 2026 10:44:52 +0100
Message-ID: <20261117094913.100756-15-przemyslaw.kitszel@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
References: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
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
index d01128ef393d..5c90edf9a92d 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1693,6 +1693,10 @@ static inline struct devlink *devlink_alloc(const struct devlink_ops *ops,
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
2.54.0


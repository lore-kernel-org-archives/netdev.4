Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908494;
	b=5UzZYj8QelS2X6n/tR1I3oMG3Np8XzmPhtN7sLDf0Drwqj58aS+MqkictMTk2FlZTLV2
	 2yG2DIySVfG8rHxmvBC+dcY6AyL7NOXKl5daNB8YJ+GtHHctHRtzSWamiXNGMpS4eBYlR
	 U0rvX7hDg1ke1wF9cwVPlvmdJodLOCUvvSyDmBPaVNth5GPWflDiUt5vaIubKuxQJdwvh
	 kuu1h6uKr30obREP6Ix/IWS7mUKDmHkTQOIE79oBo5cThhJDFWMQZnRlAZEo3z9EJM/i+
	 NO0oUHu0D9a7gl70E1TRTjJ7CmE9KWzlO6JOqPSp2fFNjzeh9vUa4uqHsDbhqmU2tGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908494;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zA7wxwsyOXD+JbYClGv0thjLbja6aZx//vIQdDw/K3M=;
	b=3VjM2WKL9RggokRVnFajgovlVB13rq4CQc7wR0KxxK3aLIckg8iKZldOxouSJJXT+UhC
	 tZ3OXubUFR7xRXWzZm/Ia6kfTx2RlSluGEK6L9d2a5DQc0YPiuL5Hng5oe8fZbsaTADXR
	 z7Hxut9TnFrrzNYBwY+CVA/5Z1mOQZium2G6x8iDCBhl8vROQUiyZEgQuM1hm8w0dVNXx
	 jszVR9seH5rp/PZdAyX8hm7lDT6Ds4HMEjsqAeCCOh4SdHz9xjSomQEmmXmpbWhJPSG9B
	 VqdLW88BqnBLjA5N5nrlk1++/t1RV1VYbWLFu79bToldxe9blGb5GNVrngLsx/PNQ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XNs6uoCy;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E61606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E61606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XNs6uoCy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908494; x=1826444494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P2FrtIvWSaw68nEwfkXfpFSnSbEj4V7y9yYQVVl4EO8=;
  b=XNs6uoCyIYqAtvUoYxIasYd0iP7MTZCPSeomJfchgF87jukH6eHdts6n
   gwTAkQgcFjR0z9K0EEDCLNF+fNOh1uOfo+qNZLtNWDuYb0lQPIzJFMaMH
   vlVdp7nE45d6xdMJhqVtYTxmNNmuL5fTvwCoQDN3owqpGau9XgrNWyLkd
   iKt08g2u+7bafbT2sQNRay17x4Qoao1MGqxZiGybQ3e6w9hIY09VhbyqR
   yk+1jrjvp8FnjbsWlciwf4UEKSEHnf/ALOyudkg0PtpLs2ym7tfiatIl2
   s2pCZA/y8wm2L7lsIkwPCeU3usIzGQ7SnRGtkWvow+fygnHlcg64ZTKIC
   g==;
X-CSE-ConnectionGUID: ZvlEW+Z8TsOfEanGqMvP2A==
X-CSE-MsgGUID: ddwNm4wEQtSsWT6hzdvBkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3571106"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3571106"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:33 -0800
X-CSE-ConnectionGUID: SwIXJkpCT6SWnNpUYV9YBQ==
X-CSE-MsgGUID: yvfan9d4R3+FPFl9SmXSAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10056591"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2026 01:41:28 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id AB1BB28194;
	Tue, 17 Nov 2026 09:41:25 +0000 (GMT)
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
Subject: [net-next v6 01/15] devlink, mlx5: add init/fini ops for shared devlink
Date: Tue, 17 Nov 2026 10:44:39 +0100
Message-ID: <20261117094913.100756-2-przemyslaw.kitszel@intel.com>
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

Add .shd_init() and .shd_fini() ops, that will be called for the first
devlink_shd_get() (to initialize driver's priv data) and on the last
devlink_shd_put() (to allow for the cleanup). Both ops are optional.

.shd_init() could return an error, which will stop creation of shd
instance. The initializer also gets an additional, optional param,
that driver could use for any needs.

devlink_shd_get() now returns ERR_PTR() on failure instead of NULL, so
the error from .shd_init() reaches the caller. Adjust mlx5, the only
user, to that and to the new param.

If any of the callbacks will need to get devlink instance, it could
be accessed by shd_priv_to_devlink().

Both callbacks are called with devl_lock held, .shd_init() before
devlink is registered, .shd_fini() after it is unregistered.

Next commit will make use of the callbacks, a later one will make use
also of the additional param.

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Acked-by: Tariq Toukan <tariqt@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
(v0) first discussed at:
https://lore.kernel.org/netdev/20260325063143.261806-3-przemyslaw.kitszel@intel.com

v1: remove redundant added blank line (Jiri)

v2:
 * call devl_register() only after .shd_init(), so there is no NEW/DEL
   notification pair when the init callback fails; adjust the order of
   devl_unregister() in devlink_shd_destroy() (Sashiko)
 * return the error from .shd_init() to the caller instead of
   collapsing every failure into -ENOMEM, devlink_shd_get() returns
   ERR_PTR() now (Sashiko)
 * commit message: .shd_init()/.shd_fini() are called outside of
   devlink registration; the init param is used within this series
 * kdoc: use @shd_init/@shd_fini member tags, fix the "shd_devlink'
   priv" wording, document the calling context (locks, before
   registration/after unregistration) and that a failed .shd_init()
   is retried on the next devlink_shd_get() (Sashiko)
 * devlink-shared.rst: document .shd_init()/.shd_fini(), init_param,
   ERR_PTR() return and shd_priv_to_devlink() (Sashiko)
---
 .../networking/devlink/devlink-shared.rst     | 19 ++++++-
 include/net/devlink.h                         | 30 ++++++++++
 .../ethernet/mellanox/mlx5/core/sh_devlink.c  |  6 +-
 net/devlink/sh_dev.c                          | 57 ++++++++++++++++---
 4 files changed, 98 insertions(+), 14 deletions(-)

diff --git a/Documentation/networking/devlink/devlink-shared.rst b/Documentation/networking/devlink/devlink-shared.rst
index 16bf6a7d25d9..f8b2a3d8aa82 100644
--- a/Documentation/networking/devlink/devlink-shared.rst
+++ b/Documentation/networking/devlink/devlink-shared.rst
@@ -45,6 +45,14 @@ The following functions are provided for managing shared devlink instances:
 * ``devlink_shd_get()``: Get or create a shared devlink instance identified by a string ID
 * ``devlink_shd_put()``: Release a reference on a shared devlink instance
 * ``devlink_shd_get_priv()``: Get private data from shared devlink instance
+* ``shd_priv_to_devlink()``: Get shared devlink instance from its private data
+
+``devlink_shd_get()`` returns ``ERR_PTR()`` on failure.
+
+The driver may initialize and clean up its private data of the shared
+instance in the optional ``shd_init()`` and ``shd_fini()`` callbacks of
+``struct devlink_ops``. The ``init_param`` argument of ``devlink_shd_get()``
+is passed to ``shd_init()``.
 
 Initialization Flow
 -------------------
@@ -55,7 +63,9 @@ Initialization Flow
 
    * The function looks up existing instance by identifier
    * If none exists, creates new instance:
-     - Allocates and registers devlink instance
+     - Allocates devlink instance
+     - Calls ``shd_init()`` (if set), on failure frees it and returns the error
+     - Registers devlink instance
      - Adds to global shared instances list
      - Increments reference count
 
@@ -67,7 +77,8 @@ Cleanup Flow
 
 1. **Cleanup** when PF is removed
 2. **Call** ``devlink_shd_put()`` to release reference (decrements reference count)
-3. **Shared instance is automatically destroyed** when the last PF removes (reference count reaches zero)
+3. **Shared instance is automatically destroyed** when the last PF removes (reference count reaches zero),
+   ``shd_fini()`` (if set) is called after unregistering it
 
 Chip Identification
 -------------------
@@ -85,6 +96,10 @@ Locking
 
 A global mutex (``shd_mutex``) protects the shared instances list during registration/deregistration.
 
+``shd_init()`` and ``shd_fini()`` are called with ``shd_mutex`` and the devlink
+lock of the shared instance held, thus must not call ``devlink_shd_get()`` nor
+``devlink_shd_put()``, and must use ``devl_*()`` variants of devlink API.
+
 Similarly to other nested devlink instance relationships, devlink lock of
 the shared instance should be always taken after the devlink lock of PF.
 
diff --git a/include/net/devlink.h b/include/net/devlink.h
index 7abd23376319..98bdde4f72ca 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1607,6 +1607,34 @@ struct devlink_ops {
 	 * with other operations.
 	 */
 	bool supported_cross_device_rate_nodes;
+	/**
+	 * @shd_init: Shared devlink instance initializer.
+	 *
+	 * Gets the driver's priv data of the shared instance (the same as
+	 * devlink_shd_get_priv() returns) and the init_param passed to
+	 * devlink_shd_get(). Should initialize the priv data. May be NULL.
+	 *
+	 * Called when devlink_shd_get() creates the shared instance, before
+	 * it is registered. If it fails, the instance is freed without calling
+	 * @shd_fini, and the next devlink_shd_get() for the same id will try to
+	 * create it (and call @shd_init) again.
+	 *
+	 * Called with the global shared devlink mutex and the devlink lock of
+	 * the shared instance held, thus must not call devlink_shd_get() nor
+	 * devlink_shd_put(), and must use devl_*() variants of devlink API.
+	 *
+	 * Return: 0 on success, negative errno to fail the creation.
+	 */
+	int (*shd_init)(void *priv, void *init_param);
+	/**
+	 * @shd_fini: Shared devlink instance finalizer.
+	 *
+	 * Gets the driver's priv data of the shared instance. Called when the
+	 * last reference is dropped, after the shared instance is unregistered,
+	 * in the same locking context as @shd_init. Should clean up the priv
+	 * data. May be NULL.
+	 */
+	void (*shd_fini)(void *priv);
 	/**
 	 * selftests_check() - queries if selftest is supported
 	 * @devlink: devlink instance
@@ -1672,9 +1700,11 @@ void devlink_free(struct devlink *devlink);
 struct devlink *devlink_shd_get(const char *id,
 				const struct devlink_ops *ops,
 				size_t priv_size,
+				void *init_param,
 				const struct device_driver *driver);
 void devlink_shd_put(struct devlink *devlink);
 void *devlink_shd_get_priv(struct devlink *devlink);
+struct devlink *shd_priv_to_devlink(void *priv);
 
 /**
  * struct devlink_port_ops - Port operations
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c b/drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c
index b925364765ac..2c58f820b018 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/sh_devlink.c
@@ -43,10 +43,10 @@ int mlx5_shd_init(struct mlx5_core_dev *dev)
 	*end = '\0';
 
 	/* Get or create shared devlink instance */
-	devlink = devlink_shd_get(sn, &mlx5_shd_ops, 0, pdev->dev.driver);
+	devlink = devlink_shd_get(sn, &mlx5_shd_ops, 0, NULL, pdev->dev.driver);
 	kfree(sn);
-	if (!devlink)
-		return -ENOMEM;
+	if (IS_ERR(devlink))
+		return PTR_ERR(devlink);
 
 	dev->shd = devlink;
 	return 0;
diff --git a/net/devlink/sh_dev.c b/net/devlink/sh_dev.c
index 85acce97e788..4f1b2f24b755 100644
--- a/net/devlink/sh_dev.c
+++ b/net/devlink/sh_dev.c
@@ -34,43 +34,61 @@ static struct devlink_shd *devlink_shd_lookup(const char *id)
 static struct devlink_shd *devlink_shd_create(const char *id,
 					      const struct devlink_ops *ops,
 					      size_t priv_size,
+					      void *init_param,
 					      const struct device_driver *driver)
 {
 	struct devlink_shd *shd;
 	struct devlink *devlink;
+	int err;
 
 	devlink = __devlink_alloc(ops, sizeof(struct devlink_shd) + priv_size,
 				  &init_net, NULL, driver);
 	if (!devlink)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	shd = devlink_priv(devlink);
 
 	shd->id = kstrdup(id, GFP_KERNEL);
-	if (!shd->id)
+	if (!shd->id) {
+		err = -ENOMEM;
 		goto err_devlink_free;
+	}
 	shd->priv_size = priv_size;
-	refcount_set(&shd->refcount, 1);
 
 	devl_lock(devlink);
+
+	if (ops->shd_init) {
+		err = ops->shd_init(shd->priv, init_param);
+		if (err)
+			goto err_unlock;
+	}
 	devl_register(devlink);
 	devl_unlock(devlink);
 
+	refcount_set(&shd->refcount, 1);
 	list_add_tail(&shd->list, &shd_list);
 
 	return shd;
 
+err_unlock:
+	devl_unlock(devlink);
+	kfree(shd->id);
+
 err_devlink_free:
 	devlink_free(devlink);
-	return NULL;
+	return ERR_PTR(err);
 }
 
 static void devlink_shd_destroy(struct devlink_shd *shd)
 {
 	struct devlink *devlink = priv_to_devlink(shd);
 
 	list_del(&shd->list);
 	devl_lock(devlink);
 	devl_unregister(devlink);
+
+	if (devlink->ops->shd_fini)
+		devlink->ops->shd_fini(shd->priv);
+
 	devl_unlock(devlink);
 	kfree(shd->id);
 	devlink_free(devlink);
@@ -81,46 +99,53 @@ static void devlink_shd_destroy(struct devlink_shd *shd)
  * @id: Identifier string (e.g., serial number) for the shared instance
  * @ops: Devlink operations structure
  * @priv_size: Size of private data structure
+ * @init_param: Passed to .shd_init() callback alongside driver's priv;
+ *              this value need not match across all users of the shared
+ *              instance
  * @driver: Driver associated with the shared devlink instance
  *
  * Get an existing shared devlink instance identified by @id, or create
  * a new one if it doesn't exist. Return the devlink instance with a
  * reference held. The caller must call devlink_shd_put() when done.
  *
+ * On creation, @ops->shd_init() is called (if set), see its description
+ * for the calling context. Its error is returned to the caller.
+ *
  * All callers sharing the same @id must pass identical @ops, @priv_size
- * and @driver. A mismatch triggers a warning and returns NULL.
+ * and @driver. A mismatch triggers a warning and returns ERR_PTR(-EINVAL).
  *
  * Return: Pointer to the shared devlink instance on success,
- *         NULL on failure
+ *         ERR_PTR() on failure
  */
 struct devlink *devlink_shd_get(const char *id,
 				const struct devlink_ops *ops,
 				size_t priv_size,
+				void *init_param,
 				const struct device_driver *driver)
 {
 	struct devlink *devlink;
 	struct devlink_shd *shd;
 
 	mutex_lock(&shd_mutex);
 
 	shd = devlink_shd_lookup(id);
 	if (!shd) {
-		shd = devlink_shd_create(id, ops, priv_size, driver);
+		shd = devlink_shd_create(id, ops, priv_size, init_param, driver);
 		goto unlock;
 	}
 
 	devlink = priv_to_devlink(shd);
 	if (WARN_ON_ONCE(devlink->ops != ops ||
 			 shd->priv_size != priv_size ||
 			 devlink->dev_driver != driver)) {
-		shd = NULL;
+		shd = ERR_PTR(-EINVAL);
 		goto unlock;
 	}
 	refcount_inc(&shd->refcount);
 
 unlock:
 	mutex_unlock(&shd_mutex);
-	return shd ? priv_to_devlink(shd) : NULL;
+	return IS_ERR(shd) ? ERR_CAST(shd) : priv_to_devlink(shd);
 }
 EXPORT_SYMBOL_GPL(devlink_shd_get);
 
@@ -159,3 +184,17 @@ void *devlink_shd_get_priv(struct devlink *devlink)
 	return shd->priv;
 }
 EXPORT_SYMBOL_GPL(devlink_shd_get_priv);
+
+/**
+ * shd_priv_to_devlink - Get shared devlink instance from its priv data
+ * @priv: Driver's priv data, as returned by devlink_shd_get_priv()
+ *
+ * Return: pointer to shared devlink instance the @priv belongs to.
+ */
+struct devlink *shd_priv_to_devlink(void *priv)
+{
+	struct devlink_shd *shd = container_of(priv, struct devlink_shd, priv);
+
+	return priv_to_devlink(shd);
+}
+EXPORT_SYMBOL_GPL(shd_priv_to_devlink);
-- 
2.54.0


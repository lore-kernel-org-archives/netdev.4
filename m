Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908511;
	b=iLEmNYdEoXGZ+iAqQjR+9bMhkY5MW+H23NX1pD+/wZ+C9B74MONy1KfF3cXJonSnovXh
	 ezCOH0Tn/mHVN43OQ+/I2vsp8r9Q/NoXrcT0GzJAOqv5DZbsyEQcGOHfSKFJ1XYRJ+MuZ
	 FMuwbc+Ds2U7sQbkJE6XAy2mPxfdu/HwrZe5l7B9/GKWagbgkDCZOV8iHUU5Dd7SviJ9b
	 pcOsNg7fvYpVJc257yC8JeJM41kactfA8hCU1XnKnogm6A5vNec2WShABiM2MTu0aTtvm
	 B5obHB33lRyQh+Z2R1WdL5fwPW9E4GKPKiV/yR1YTtMofKedAa4wc6mq5ZPPzNfTA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908511;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WHRmn6k5KSmfuWmG2ghyGkpoMqd+QfI5u6kQoILbLl4=;
	b=xAGEarGebxeMA/bvQXE++4QONbVOieUWgQ7W4kufZy9BucGaO1LLWWfizFiG1b/YdzsP
	 l0rTKujTxbpWlYxp8lXm0rFcB9wShnTdv3bzMmVD+v0Ii7MXWGD2koaSq2YpebDaThVRM
	 ZHiiFc5jEGsJ4eLbICnE4/EPsZ8zt7nIHdgY1SNLkfnzYAFL41nAZakpIBD932U2jcqOt
	 NfRu8pz1mf4mqXtoJvYIvqpzJgeAmvCEkgAwlSEiq9jYaoHrr6dcLomqWP93T3mtJR6g5
	 Gh+UHSKBIYzdk2iUdCkrjfml9M1IwV3V8uoUrRvv0hmD2DNYktgONuP7qo4DJJYZLBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYEcdRF6;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D5606A336
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6D5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYEcdRF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794908511; x=1826444511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lmFBNdHfMjbPi/q1OmGF2Is6ZeJ0VXNV5Cra2rCfN3I=;
  b=ZYEcdRF63k7OQp5K32L8t43fNGj7Q1TiooqaAq7X0sKl3MQoMCfwt5Md
   n9xGAqvtci8CVVzT2RAyy40ge2CENYhyxWF3z/C82M+GhegbMLcaWVwN8
   RCwf3Kxi2ABP/Mjr8tvuRHYHoQE1ZRgHDB9lp9sG/ceSvchPVvSSBMCYh
   5dAjH2386XSuCkYicECytCyBuRFSoAKh+aBD0AxKfHftzxkoIFEisGnWN
   znzW+TO4o9IeZik9zOM6xe/XUrfYOIuZjAYQp1U7w1kd6+jkx/YdKv4q3
   aSOiAah/3LQOZZD24Was4NOmAxtUTk3+qE+o2Sz3fvGBpgu6OpwDxFd6n
   w==;
X-CSE-ConnectionGUID: CCT6u4oVSUSdGC+R5IMKMg==
X-CSE-MsgGUID: bojopSvsSKqVR0qGAt76ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3553783"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3553783"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:41:50 -0800
X-CSE-ConnectionGUID: JwaBkJugS3qalUJxVUwx8A==
X-CSE-MsgGUID: 6qT1PwnQTROxXcfc3U0nrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11591374"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 01:41:45 -0800
Received: from pkitszel-desk1.igk.intel.com (pkitszel-desk1.igk.intel.com [10.217.184.18])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id 451A82819A;
	Tue, 17 Nov 2026 09:41:43 +0000 (GMT)
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
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [net-next v6 12/15] devlink: give user option to allocate resources
Date: Tue, 17 Nov 2026 10:44:50 +0100
Message-ID: <20261117094913.100756-13-przemyslaw.kitszel@intel.com>
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

Current devlink resources are designed as a thing that user could limit,
but there is not much otherwise that could be done with them.
Perhaps that's the reason there is not much adoption despite API being
there for multiple years.

Add new mode of operation, where user could allocate/assign resources
(from a common pool) to specific devices.

That requires a new .occ_set() driver callback, called on
DEVLINK_CMD_RESOURCE_SET with the requested DEVLINK_ATTR_RESOURCE_SIZE,
instead of staging the size until the next reload. Driver registers it
together with .occ_get() by devl_resource_occ_set_get_register(). For
such resources the getter value is reported as DEVLINK_ATTR_RESOURCE_SIZE,
as opposed to DEVLINK_ATTR_RESOURCE_OCC (current occupation) in the
"legacy" mode, and there is no DEVLINK_ATTR_RESOURCE_SIZE_NEW.

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
RFC, Feb '25
https://lore.kernel.org/intel-wired-lan/20250219164410.35665-3-przemyslaw.kitszel@intel.com

I have structured code to just choose "the mode" of operation based on
the presence of .occ_set callback, instead of naming the mode, what,
even if not the most clear code, avoids the need of naming the modes.

v4:
 * return -EMSGSIZE directly on devlink_resource_occ_size_put_legacy()
   failure (Jakub)

v3:
 * keep size and size_new of .occ_set() resources in sync with the
   getter, after a successful set and in devl_resource_size_get() (me)
 * WARN on registering .occ_set() without .occ_get(), or vice versa

v2:
 * avoid setting DEVLINK_ATTR_RESOURCE_SIZE_VALID for leaf resources
   (Sashiko)
 * minor kdoc update (Sashiko)
 * add more WARN_ONs (Sashiko)
 * document the occ_set mode in devlink-resource.rst
 * commit message: describe the .occ_set() callback and how the reported
   attributes differ from the "legacy" mode
---
 .../networking/devlink/devlink-resource.rst   |  5 +
 include/net/devlink.h                         |  7 ++
 net/devlink/resource.c                        | 97 ++++++++++++++++---
 3 files changed, 93 insertions(+), 16 deletions(-)

diff --git a/Documentation/networking/devlink/devlink-resource.rst b/Documentation/networking/devlink/devlink-resource.rst
index b7172d94b2c6..9c48155fcb1e 100644
--- a/Documentation/networking/devlink/devlink-resource.rst
+++ b/Documentation/networking/devlink/devlink-resource.rst
@@ -75,6 +75,11 @@ attribute, which represents the pending change in size. For example:
 Note that changes in resource size may require a device reload to properly
 take effect.
 
+Resources registered with ``devl_resource_occ_set_get_register()`` behave
+differently: the new size is passed to the driver and applies immediately,
+there is neither ``size_new`` nor ``occ`` reported, and ``size`` is the value
+returned by the driver's getter.
+
 Port-level Resources and Full Dump
 ==================================
 
diff --git a/include/net/devlink.h b/include/net/devlink.h
index 98bdde4f72ca..d01128ef393d 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -420,6 +420,8 @@ devlink_resource_size_params_init(struct devlink_resource_size_params *size_para
 }
 
 typedef u64 devlink_resource_occ_get_t(void *priv);
+typedef int devlink_resource_occ_set_t(u64 size, struct netlink_ext_ack *extack,
+				       void *priv);
 
 #define DEVLINK_RESOURCE_ID_PARENT_TOP 0
 
@@ -1959,6 +1961,11 @@ void devl_resource_occ_get_register(struct devlink *devlink,
 				    void *occ_get_priv);
 void devl_resource_occ_get_unregister(struct devlink *devlink,
 				      u64 resource_id);
+void devl_resource_occ_set_get_register(struct devlink *devlink,
+					u64 resource_id,
+					devlink_resource_occ_set_t *occ_set,
+					devlink_resource_occ_get_t *occ_get,
+					void *occ_priv);
 int devl_params_register(struct devlink *devlink,
 			 const struct devlink_param *params,
 			 size_t params_count);
diff --git a/net/devlink/resource.c b/net/devlink/resource.c
index c3cfda7ea070..c4502c480a6b 100644
--- a/net/devlink/resource.c
+++ b/net/devlink/resource.c
@@ -19,7 +19,8 @@
  * @list: parent list
  * @resource_list: list of child resources
  * @occ_get: occupancy getter callback
- * @occ_get_priv: occupancy getter callback priv
+ * @occ_set: occupancy setter callback
+ * @occ_priv: occupancy callbacks priv
  */
 struct devlink_resource {
 	const char *name;
@@ -32,7 +33,8 @@ struct devlink_resource {
 	struct list_head list;
 	struct list_head resource_list;
 	devlink_resource_occ_get_t *occ_get;
-	void *occ_get_priv;
+	devlink_resource_occ_set_t *occ_set;
+	void *occ_priv;
 };
 
 static struct devlink_resource *
@@ -137,6 +139,16 @@ int devlink_nl_resource_set_doit(struct sk_buff *skb, struct genl_info *info)
 	if (err)
 		return err;
 
+	if (resource->occ_set) {
+		err = resource->occ_set(size, info->extack, resource->occ_priv);
+		if (err)
+			return err;
+
+		resource->size = resource->occ_get(resource->occ_priv);
+		resource->size_new = resource->size;
+		return 0;
+	}
+
 	resource->size_new = size;
 	devlink_resource_validate_children(resource);
 	if (resource->parent)
@@ -162,13 +174,31 @@ devlink_resource_size_params_put(struct devlink_resource *resource,
 	return 0;
 }
 
-static int devlink_resource_occ_put(struct devlink_resource *resource,
-				    struct sk_buff *skb)
+static int
+devlink_resource_occ_size_put_legacy(struct devlink_resource *resource,
+				     struct sk_buff *skb)
 {
-	if (!resource->occ_get)
-		return 0;
-	return devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_OCC,
-				  resource->occ_get(resource->occ_get_priv));
+	if (devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE, resource->size))
+		return -EMSGSIZE;
+	if (resource->size != resource->size_new &&
+	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE_NEW,
+			       resource->size_new))
+		return -EMSGSIZE;
+	if (resource->occ_get &&
+	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_OCC,
+			       resource->occ_get(resource->occ_priv)))
+		return -EMSGSIZE;
+	return 0;
+}
+
+static int devlink_resource_occ_size_put(struct devlink_resource *resource,
+					 struct sk_buff *skb)
+{
+	if (!resource->occ_get || !resource->occ_set)
+		return devlink_resource_occ_size_put_legacy(resource, skb);
+
+	return devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE,
+				  resource->occ_get(resource->occ_priv));
 }
 
 static int devlink_resource_put(struct devlink *devlink, struct sk_buff *skb,
@@ -183,14 +213,9 @@ static int devlink_resource_put(struct devlink *devlink, struct sk_buff *skb,
 		return -EMSGSIZE;
 
 	if (nla_put_string(skb, DEVLINK_ATTR_RESOURCE_NAME, resource->name) ||
-	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE, resource->size) ||
 	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_ID, resource->id))
 		goto nla_put_failure;
-	if (resource->size != resource->size_new &&
-	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE_NEW,
-			       resource->size_new))
-		goto nla_put_failure;
-	if (devlink_resource_occ_put(resource, skb))
+	if (devlink_resource_occ_size_put(resource, skb))
 		goto nla_put_failure;
 	if (devlink_resource_size_params_put(resource, skb))
 		goto nla_put_failure;
@@ -634,12 +659,50 @@ int devl_resource_size_get(struct devlink *devlink,
 	resource = devlink_resource_find(devlink, NULL, resource_id);
 	if (!resource)
 		return -EINVAL;
+	if (resource->occ_set)
+		resource->size_new = resource->occ_get(resource->occ_priv);
 	*p_resource_size = resource->size_new;
 	resource->size = resource->size_new;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(devl_resource_size_get);
 
+/**
+ * devl_resource_occ_set_get_register - register occupancy getter and setter
+ *
+ * @devlink: devlink
+ * @resource_id: resource id
+ * @occ_set: occupancy setter callback
+ * @occ_get: occupancy getter callback
+ * @occ_priv: occupancy callbacks priv
+ *
+ * Setter will be called when the user wants to change the resource size,
+ * getter is called to show the user what is current size of the resource.
+ */
+void devl_resource_occ_set_get_register(struct devlink *devlink,
+					u64 resource_id,
+					devlink_resource_occ_set_t *occ_set,
+					devlink_resource_occ_get_t *occ_get,
+					void *occ_priv)
+{
+	struct devlink_resource *resource;
+
+	lockdep_assert_held(&devlink->lock);
+
+	if (WARN_ON(!occ_set || !occ_get))
+		return;
+
+	resource = devlink_resource_find(devlink, NULL, resource_id);
+	if (WARN_ON(!resource))
+		return;
+	WARN_ON(resource->occ_get || resource->occ_set);
+
+	resource->occ_set = occ_set;
+	resource->occ_get = occ_get;
+	resource->occ_priv = occ_priv;
+}
+EXPORT_SYMBOL_GPL(devl_resource_occ_set_get_register);
+
 /**
  * devl_resource_occ_get_register - register occupancy getter
  *
@@ -661,9 +724,10 @@ void devl_resource_occ_get_register(struct devlink *devlink,
 	if (WARN_ON(!resource))
 		return;
 	WARN_ON(resource->occ_get);
+	WARN_ON(resource->occ_set);
 
 	resource->occ_get = occ_get;
-	resource->occ_get_priv = occ_get_priv;
+	resource->occ_priv = occ_get_priv;
 }
 EXPORT_SYMBOL_GPL(devl_resource_occ_get_register);
 
@@ -684,9 +748,10 @@ void devl_resource_occ_get_unregister(struct devlink *devlink,
 	if (WARN_ON(!resource))
 		return;
 	WARN_ON(!resource->occ_get);
+	WARN_ON(resource->occ_set);
 
 	resource->occ_get = NULL;
-	resource->occ_get_priv = NULL;
+	resource->occ_priv = NULL;
 }
 EXPORT_SYMBOL_GPL(devl_resource_occ_get_unregister);
 
-- 
2.54.0


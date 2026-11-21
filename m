Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302124;
	b=PCAtcTK05/ForPo07aPuVr5GBNp68oGAez37pgLx/q4m96Fm7Yg3xRJ0M4GNHbfTdIG5
	 tAXwrvlY23PawZfdHcIbf0rrpfJh0UpWJhxGG6U/jvYOlxPnYCsjeSBX2CMfgfymYihSi
	 g5JJ0Ku4QmzNnultepQ9Rbd+t0N/k+Rd8k1JE0gU48t77q5lv9aAQ/MHSuvlZaYV5olnG
	 d9XqRX7bud6r5IYvqYVPNQeAem8s32CKWYWFg7qITyb5ooAYpL/zQJ0Jv4QmwoonerHap
	 nUJmm52lZCUchmv4HR5uwmySZ6+P8gudgfvGMxKEDgqatepAPf0VsV5RddIVCoupMdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302124;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cU9WnaoehxuI49eUrlm9GN0wrBFyGYkD63yO6uYCEwo=;
	b=q4QyPpvy6q4pQNZeNRS/jXbMluLQZpTdxGXboSRR6zVEsXBPSVhHNTqhSGF90zMq1a7Q
	 m5Po8XolwU/kAlIG3CLlApbyS7+oU+hw6nHLavKGRt2D6mLjmF2aLpNvvXAOtyGODKWfw
	 rOZnnOmJ7CSDQdscBxW7rQam0I+RPQV0OmshsSetVsA3Tq26e9dTUBQt3O0ttBhsqvKLx
	 C+vEhD+u7IfRnOTNWld0QJXkGKZ9kDMagYgL6+/9OZ3IgOagnzFe7Ji8vlMiD4XFRRlrM
	 h7uWOlWcXvSqQuCM7+5z9GvkYv0WXirnwznO4aAbge1ryXfSU7UmfaVSel8u7YS1bXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eV83Bz4x;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF8D606A682
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EF8D606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eV83Bz4x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795302124; x=1826838124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HQQ8So0latE2A+M5hYI/Xw5a+O7jtyYd1q1SfCffWPk=;
  b=eV83Bz4xXfeyHgXsCOnXLITOwMGIBEna9idZ2CJbtPlCLC0w1Oar1ISk
   EWa23midkDLNXWwcoueYbuSl307TPYx2LA9aOdZdEtIkdDHBUHuB45pVq
   Ra+YAK46+HyX5Sj0j6D/zP+iqO70DnKwwhYrwVknexQ6a2n3QPtqy390w
   SjBJv1rUkwWShwxeXeUNPVf1YwQoD8Y0mvy0Ka3QKDi3DnhQX/m3LByo0
   8y25HHVkpMPOVOPVsg6ClCTqHWJX60VlTlj8r0DLoOVWyYlPNmFsGis+j
   p7LVyuVHnEWqvw0t05idkSNdp6qTRGrCr1kr5vjHHT2rzXCk7W0K2VYjg
   Q==;
X-CSE-ConnectionGUID: j2iybTMrTlKNg1LaNPqoTg==
X-CSE-MsgGUID: Nig1zaoaSvOleyvCyzAEfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="3996996"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="3996996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 15:02:03 -0800
X-CSE-ConnectionGUID: xarELCDQTp+iuOpEUBo2Bg==
X-CSE-MsgGUID: K5nYcm2oTLmdcCifnbPTVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11273471"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2026 15:01:58 -0800
Received: from pkitszel-desk.tendawifi.com (unknown [10.245.244.136])
	by irvmail002.ir.intel.com (Postfix) with ESMTP id E215233BC2;
	Sat, 21 Nov 2026 23:01:55 +0000 (GMT)
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
Subject: [PATCH net-next v7 12/15] devlink: add cmode to resources
Date: Sat, 21 Nov 2026 23:55:39 +0100
Message-ID: <20261121230123.316391-13-przemyslaw.kitszel@intel.com>
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

The size of a devlink resource set by the user takes effect only on
the next reload, until then it is reported as size_new. That does not
fit resources that the driver could change right away, like the RSS
lookup tables, which ice hands out to its PFs and VFs.

Add a configuration mode (cmode) to resources, reusing the values of
enum devlink_param_cmode. Existing resources are "driverinit". A driver
may make a resource "runtime" with devl_resource_runtime_register(),
then DEVLINK_CMD_RESOURCE_SET calls its .size_set() callback with the
validated size, which applies the change synchronously, or fails it
with nothing changed. As for runtime params, the driver owns the value:
.size_get() reports the size, so it stays correct also when the driver
changes it on its own, e.g. when a device reset restores the default.
There is no size_new for runtime resources, and occ is still the
current use. A runtime resource must have no parent and no children,
as the sizes in a resource tree are validated with size_new.

Report the new DEVLINK_ATTR_RESOURCE_CMODE for every resource, like
params report the cmode of each value. DEVLINK_CMD_RESOURCE_SET may
carry the expected cmode, and fails with -EOPNOTSUPP on a mismatch.

Signed-off-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
RFC, Feb '25
https://lore.kernel.org/intel-wired-lan/20250219164410.35665-3-przemyslaw.kitszel@intel.com

v7:
 * rework: resource cmode instead of .occ_set(), occ is the current use
   again (Jakub); was "devlink: give user option to allocate resources",
   Alex's Reviewed-by dropped due to the rewrite
 * new DEVLINK_ATTR_RESOURCE_CMODE, reported for every resource, and
   checked when passed to DEVLINK_CMD_RESOURCE_SET
 * document runtime resources in devlink-resource.rst
---
 Documentation/netlink/specs/devlink.yaml      | 10 +++
 .../networking/devlink/devlink-resource.rst   | 19 +++++
 include/net/devlink.h                         |  8 ++
 include/uapi/linux/devlink.h                  |  2 +
 net/devlink/netlink_gen.c                     |  5 +-
 net/devlink/resource.c                        | 84 ++++++++++++++++++-
 6 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/Documentation/netlink/specs/devlink.yaml b/Documentation/netlink/specs/devlink.yaml
index 4706de628392..709e40f8afb4 100644
--- a/Documentation/netlink/specs/devlink.yaml
+++ b/Documentation/netlink/specs/devlink.yaml
@@ -917,6 +917,13 @@ attribute-sets:
           Used with rate-set and rate-new to parent a rate object to a node on
           a different devlink instance, enabling cross-device rate scheduling.
           When absent, the parent node is resolved on the same instance.
+      -
+        name: resource-cmode
+        type: u8
+        enum: param-cmode
+        doc: |
+          Configuration mode of the resource, when a new size takes effect.
+          Runtime resources apply it immediately, others on driver reload.
 
   -
     name: dl-dev-stats
@@ -1240,6 +1247,8 @@ attribute-sets:
         name: resource-unit
       -
         name: resource-occ
+      -
+        name: resource-cmode
       -
         name: pad
 
@@ -1913,6 +1922,7 @@ operations:
             - index
             - resource-id
             - resource-size
+            - resource-cmode
 
     -
       name: resource-dump
diff --git a/Documentation/networking/devlink/devlink-resource.rst b/Documentation/networking/devlink/devlink-resource.rst
index b7172d94b2c6..cff32e5c661c 100644
--- a/Documentation/networking/devlink/devlink-resource.rst
+++ b/Documentation/networking/devlink/devlink-resource.rst
@@ -75,6 +75,25 @@ attribute, which represents the pending change in size. For example:
 Note that changes in resource size may require a device reload to properly
 take effect.
 
+Runtime Resources
+=================
+
+The configuration mode (``cmode``) of a resource tells when a new size takes
+effect. The default, ``driverinit``, is described above. A driver may register
+a resource as ``runtime`` with ``devl_resource_runtime_register()``, then
+a new size takes effect immediately: the driver applies it right away, or
+fails the request with nothing changed.
+
+The driver owns the size of a ``runtime`` resource. There is no ``size_new``,
+``size`` is the current size reported by the driver, which may also change it
+on its own, e.g. a device reset may restore the default size. ``occ`` stays
+the current usage, if the driver reports it.
+
+Every resource reports its cmode in ``DEVLINK_ATTR_RESOURCE_CMODE``, like
+params report the cmode of each value. A ``DEVLINK_CMD_RESOURCE_SET`` request
+may carry the expected cmode, the request then fails with ``EOPNOTSUPP`` if
+the resource has a different one.
+
 Port-level Resources and Full Dump
 ==================================
 
diff --git a/include/net/devlink.h b/include/net/devlink.h
index 98bdde4f72ca..dc9a642796f2 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -420,6 +420,10 @@ devlink_resource_size_params_init(struct devlink_resource_size_params *size_para
 }
 
 typedef u64 devlink_resource_occ_get_t(void *priv);
+typedef u64 devlink_resource_size_get_t(void *priv);
+typedef int devlink_resource_size_set_t(u64 size,
+					struct netlink_ext_ack *extack,
+					void *priv);
 
 #define DEVLINK_RESOURCE_ID_PARENT_TOP 0
 
@@ -1959,6 +1963,10 @@ void devl_resource_occ_get_register(struct devlink *devlink,
 				    void *occ_get_priv);
 void devl_resource_occ_get_unregister(struct devlink *devlink,
 				      u64 resource_id);
+void devl_resource_runtime_register(struct devlink *devlink, u64 resource_id,
+				    devlink_resource_size_get_t *size_get,
+				    devlink_resource_size_set_t *size_set,
+				    void *priv);
 int devl_params_register(struct devlink *devlink,
 			 const struct devlink_param *params,
 			 size_t params_count);
diff --git a/include/uapi/linux/devlink.h b/include/uapi/linux/devlink.h
index a6801feb7744..599fe8ecf512 100644
--- a/include/uapi/linux/devlink.h
+++ b/include/uapi/linux/devlink.h
@@ -650,6 +650,8 @@ enum devlink_attr {
 
 	DEVLINK_ATTR_PARENT_DEV,		/* nested */
 
+	DEVLINK_ATTR_RESOURCE_CMODE,		/* u8 */
+
 	/* Add new attributes above here, update the spec in
 	 * Documentation/netlink/specs/devlink.yaml and re-generate
 	 * net/devlink/netlink_gen.c.
diff --git a/net/devlink/netlink_gen.c b/net/devlink/netlink_gen.c
index 9e1b4c081a7b..16e70810a395 100644
--- a/net/devlink/netlink_gen.c
+++ b/net/devlink/netlink_gen.c
@@ -304,12 +304,13 @@ static const struct nla_policy devlink_dpipe_table_counters_set_nl_policy[DEVLIN
 };
 
 /* DEVLINK_CMD_RESOURCE_SET - do */
-static const struct nla_policy devlink_resource_set_nl_policy[DEVLINK_ATTR_INDEX + 1] = {
+static const struct nla_policy devlink_resource_set_nl_policy[DEVLINK_ATTR_RESOURCE_CMODE + 1] = {
 	[DEVLINK_ATTR_BUS_NAME] = { .type = NLA_NUL_STRING, },
 	[DEVLINK_ATTR_DEV_NAME] = { .type = NLA_NUL_STRING, },
 	[DEVLINK_ATTR_INDEX] = NLA_POLICY_FULL_RANGE(NLA_UINT, &devlink_attr_index_range),
 	[DEVLINK_ATTR_RESOURCE_ID] = { .type = NLA_U64, },
 	[DEVLINK_ATTR_RESOURCE_SIZE] = { .type = NLA_U64, },
+	[DEVLINK_ATTR_RESOURCE_CMODE] = NLA_POLICY_MAX(NLA_U8, 2),
 };
 
 /* DEVLINK_CMD_RESOURCE_DUMP - do */
@@ -969,7 +970,7 @@ const struct genl_split_ops devlink_nl_ops[75] = {
 		.doit		= devlink_nl_resource_set_doit,
 		.post_doit	= devlink_nl_post_doit,
 		.policy		= devlink_resource_set_nl_policy,
-		.maxattr	= DEVLINK_ATTR_INDEX,
+		.maxattr	= DEVLINK_ATTR_RESOURCE_CMODE,
 		.flags		= GENL_ADMIN_PERM | GENL_CMD_CAP_DO,
 	},
 	{
diff --git a/net/devlink/resource.c b/net/devlink/resource.c
index c3cfda7ea070..2d31dac85eb1 100644
--- a/net/devlink/resource.c
+++ b/net/devlink/resource.c
@@ -20,6 +20,10 @@
  * @resource_list: list of child resources
  * @occ_get: occupancy getter callback
  * @occ_get_priv: occupancy getter callback priv
+ * @cmode: configuration mode, when a new size takes effect
+ * @size_get: size getter callback of a runtime resource
+ * @size_set: size setter callback of a runtime resource
+ * @size_priv: size callbacks priv
  */
 struct devlink_resource {
 	const char *name;
@@ -33,6 +37,10 @@ struct devlink_resource {
 	struct list_head resource_list;
 	devlink_resource_occ_get_t *occ_get;
 	void *occ_get_priv;
+	enum devlink_param_cmode cmode;
+	devlink_resource_size_get_t *size_get;
+	devlink_resource_size_set_t *size_set;
+	void *size_priv;
 };
 
 static struct devlink_resource *
@@ -119,6 +127,7 @@ int devlink_nl_resource_set_doit(struct sk_buff *skb, struct genl_info *info)
 {
 	struct devlink *devlink = devlink_nl_ctx(info)->devlink;
 	struct devlink_resource *resource;
+	struct nlattr *cmode_attr;
 	u64 resource_id;
 	u64 size;
 	int err;
@@ -132,11 +141,22 @@ int devlink_nl_resource_set_doit(struct sk_buff *skb, struct genl_info *info)
 	if (!resource)
 		return -EINVAL;
 
+	cmode_attr = info->attrs[DEVLINK_ATTR_RESOURCE_CMODE];
+	if (cmode_attr && nla_get_u8(cmode_attr) != resource->cmode) {
+		NL_SET_ERR_MSG_ATTR(info->extack, cmode_attr,
+				    "Configuration mode not supported by the resource");
+		return -EOPNOTSUPP;
+	}
+
 	size = nla_get_u64(info->attrs[DEVLINK_ATTR_RESOURCE_SIZE]);
 	err = devlink_resource_validate_size(resource, size, info->extack);
 	if (err)
 		return err;
 
+	if (resource->cmode == DEVLINK_PARAM_CMODE_RUNTIME)
+		return resource->size_set(size, info->extack,
+					  resource->size_priv);
+
 	resource->size_new = size;
 	devlink_resource_validate_children(resource);
 	if (resource->parent)
@@ -171,6 +191,13 @@ static int devlink_resource_occ_put(struct devlink_resource *resource,
 				  resource->occ_get(resource->occ_get_priv));
 }
 
+static u64 devlink_resource_size(struct devlink_resource *resource)
+{
+	if (resource->cmode == DEVLINK_PARAM_CMODE_RUNTIME)
+		return resource->size_get(resource->size_priv);
+	return resource->size;
+}
+
 static int devlink_resource_put(struct devlink *devlink, struct sk_buff *skb,
 				struct devlink_resource *resource)
 {
@@ -183,8 +210,10 @@ static int devlink_resource_put(struct devlink *devlink, struct sk_buff *skb,
 		return -EMSGSIZE;
 
 	if (nla_put_string(skb, DEVLINK_ATTR_RESOURCE_NAME, resource->name) ||
-	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE, resource->size) ||
-	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_ID, resource->id))
+	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE,
+			       devlink_resource_size(resource)) ||
+	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_ID, resource->id) ||
+	    nla_put_u8(skb, DEVLINK_ATTR_RESOURCE_CMODE, resource->cmode))
 		goto nla_put_failure;
 	if (resource->size != resource->size_new &&
 	    devlink_nl_put_u64(skb, DEVLINK_ATTR_RESOURCE_SIZE_NEW,
@@ -514,6 +543,11 @@ __devl_resource_register(struct devlink *devlink,
 							  NULL,
 							  parent_resource_id);
 		if (parent_resource) {
+			if (WARN_ON(parent_resource->cmode ==
+				    DEVLINK_PARAM_CMODE_RUNTIME)) {
+				kfree(resource);
+				return -EINVAL;
+			}
 			resource_list = &parent_resource->resource_list;
 			resource->parent = parent_resource;
 		} else {
@@ -527,6 +561,7 @@ __devl_resource_register(struct devlink *devlink,
 	resource->size_new = resource_size;
 	resource->id = resource_id;
 	resource->size_valid = true;
+	resource->cmode = DEVLINK_PARAM_CMODE_DRIVERINIT;
 	memcpy(&resource->size_params, params, sizeof(resource->size_params));
 	INIT_LIST_HEAD(&resource->resource_list);
 	list_add_tail(&resource->list, resource_list);
@@ -622,6 +657,8 @@ EXPORT_SYMBOL_GPL(devlink_resources_unregister);
  * @devlink: devlink
  * @resource_id: the requested resource id
  * @p_resource_size: ptr to update
+ *
+ * For a runtime resource, just get the size from its size_get() callback.
  */
 int devl_resource_size_get(struct devlink *devlink,
 			   u64 resource_id,
@@ -634,6 +671,10 @@ int devl_resource_size_get(struct devlink *devlink,
 	resource = devlink_resource_find(devlink, NULL, resource_id);
 	if (!resource)
 		return -EINVAL;
+	if (resource->cmode == DEVLINK_PARAM_CMODE_RUNTIME) {
+		*p_resource_size = resource->size_get(resource->size_priv);
+		return 0;
+	}
 	*p_resource_size = resource->size_new;
 	resource->size = resource->size_new;
 	return 0;
@@ -690,6 +731,45 @@ void devl_resource_occ_get_unregister(struct devlink *devlink,
 }
 EXPORT_SYMBOL_GPL(devl_resource_occ_get_unregister);
 
+/**
+ * devl_resource_runtime_register - make the resource size runtime configurable
+ *
+ * @devlink: devlink
+ * @resource_id: resource id
+ * @size_get: size getter callback
+ * @size_set: size setter callback
+ * @priv: size callbacks priv
+ *
+ * A new size of a runtime resource takes effect immediately: @size_set is
+ * called with a size that fits the size parameters of the resource, and must
+ * either apply it, or fail with nothing changed. The driver owns the size,
+ * @size_get reports it, also after the driver changed it on its own, e.g. when
+ * a device reset restored the default. Both callbacks are called with
+ * the instance lock held. The resource must have no parent and no children.
+ */
+void devl_resource_runtime_register(struct devlink *devlink, u64 resource_id,
+				    devlink_resource_size_get_t *size_get,
+				    devlink_resource_size_set_t *size_set,
+				    void *priv)
+{
+	struct devlink_resource *resource;
+
+	lockdep_assert_held(&devlink->lock);
+
+	resource = devlink_resource_find(devlink, NULL, resource_id);
+	if (WARN_ON(!resource || !size_get || !size_set))
+		return;
+	if (WARN_ON(resource->parent || !list_empty(&resource->resource_list)))
+		return;
+	WARN_ON(resource->cmode == DEVLINK_PARAM_CMODE_RUNTIME);
+
+	resource->cmode = DEVLINK_PARAM_CMODE_RUNTIME;
+	resource->size_get = size_get;
+	resource->size_set = size_set;
+	resource->size_priv = priv;
+}
+EXPORT_SYMBOL_GPL(devl_resource_runtime_register);
+
 /**
  * devl_port_resource_register - devlink port resource register
  *
-- 
2.51.1


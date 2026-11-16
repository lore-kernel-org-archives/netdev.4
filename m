Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831425;
	b=FFuE0WkFmTz5i6rObrHZp8PwYtn78BvFhgPnckWb+FIH1uc6rldluE31pJRqCGYYdV1+
	 0+s+y2D0Dl6QXYYtwP2g9E6424gjpjRftdqW1xQlPB8XhbM6nbhkpCgIFieShEra83Bxo
	 yYHmvcpo83YIyamymlrCASN8qSqcKU/Ah/l8PmUSqZ4rs3FTyC/pY8nwWHKgU5Pc197xY
	 cJ6tGrG9DYzme3uKIhuxNWyHxszDSLe2XN3vOUuPaVBqMI9lh2E2PlQ7XnGeJEgAhK+/L
	 zVJsX3eDTOomhlCkVdR3Hz/Y5gfTwrl/kyxiN/3e04IDDdUpHUVnw2UKwSe692TMJFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iSvaEjy9IzI6kwBztkoy0u/isiGlmqUnv+z6L5AeBTE=;
	b=Z8Y8AA9uiTmczNepFxv06APX3FW3PRHzVDBO0qepQy3Qfs1moAhhpgmRGy/M4rfoLqw1
	 RuWjP6ImnJ86D5IOfkMU9OgNItz/hav1Sjr+tafCwbE7VL4WvDDFgLKBmOtsuExFLds8r
	 bZAAgGCRvrfsd3plbYShVzXpEVAOlZH8x/c5fYRVTSBjBgrw3KW5JaYSO2mh3oymOvogO
	 sVsD+DDEHUCqPSwc1n8RzgC+TiEE0U6fvjnM8Luix+Dow8nMzgFTNoroMmBySlORsgK+4
	 PTCiYh29mSebm/MkvMIYkS5IiPrZNVMG8fTjimhvq7Bw4rKR2WVRdE0Fiu1QR0FonIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi9wuX2f;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2778606A32C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2778606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi9wuX2f
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2612804a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831424; x=1795436224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSvaEjy9IzI6kwBztkoy0u/isiGlmqUnv+z6L5AeBTE=;
        b=Gi9wuX2fF5XwStp1EEpTiA8z/nNuedR84VpH5zKMeblv5cuMSDG86Y6k6z5I7OyfBr
         MBQtdPDdZIdKBfQ7/e1xrqgfvww5SwWBIiMoLYJvTwZkIkgaHMl5RtXjVvCS+asv4EyR
         nJeSzRBVehcZdpUAip3rJYfu0ClUnxmst5FCR7bQ6NVGgt7BvSk7T9IPFxfOWH0SZRb2
         WhIcR/GXXc+fr+DAt0pq9w1XWcFBiyp5S0le+hNEB7Uo61QmlgCYx3MoYNHusUBDdul4
         1gcnJHQBdt5NW/cvtd6lw0xnAlw2rjtOhJqbLVasXDHgU6RPRhVscDyR0s7ykJRh/OxZ
         M7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831424; x=1795436224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSvaEjy9IzI6kwBztkoy0u/isiGlmqUnv+z6L5AeBTE=;
        b=pRKgqpRbXlBc7Ow7djoNPoI3LGE2jrJXdauDtxouoJaEJ3Lkzj8ev9EKM4yUtaeuqX
         F8eXLzCxEZ1yCrcpOSPctj+SdoPrr6vABlk+fSReNYXTVJIPkTzR71YNotpUAA6EVw0v
         i71KXKuay8nYSv8Dii1G/1EBjvnGv/DrIC1VYL+OTLAt4lkZc8lTENEn+3HJzVSbEDFw
         o+iDMjQVX7iJMEdCIgeGYuNGyi3RGGDWlhid/hhLT652yhC1qpR2FlK1M/33t6soRGZP
         5Ywx4LsthwV0Y8gssa12Vu4sZf3qf0RVpNzAzQgmMrABmhLpg0pJ52IXGFy6LH0stpux
         eh3A==
X-Gm-Message-State: APuU4Z+l+BPBPvMhxAp0u/D/N8v35XWMzhZKV/mYmROgWNaspPNx8sSc
	qfawd2FZ8D3m057LV8OnH3BzvqM1cKZtuc0GGyMrj6iUGOwbfN0+BC0imakgGg==
X-Gm-Gg: AZFdTZdSVFXhgY7djV2Hw6E38USZONpVbnlSwEBDi+rQR6MB+2KWgiyET4TH0HPHJ2H
	mLf4KSgHbIOO6vLmq3TtpILV2w7eEe1HqQUoz163WR+fIoIvJ7Ig5nMsylW4RGYG8Qvt351QV9f
	VsQaq8OZ7z+A1iLvx4k7JPrrV66ZUQypts6g/+AtbERHDARusmgFqENzILXwDno7WA73uJ2Rk4h
	NwUQEPiWF457LrZK4k97kwliFFedlX8JWWmDdX7X3ex+Cf1uMfLOKr4cbvu4f6CIRh/fcLhzHlo
	/3KNBiLeVRzVD09wpJFesDvdxppQvmz/7Q0fpgYnXd1EpQXDOc6rGvzu7CsQXyuc+kxMHWFROo9
	fSjvJOLtX9kz4QUEynLvLhp+0L8iXSOtaU47K1Weem0vmseItTratBdZH35RK6YSfDLvOe1xn9W
	yweITRvLb/+DjQbrQS18NprUw1O1cvdOhCBDBWb4e9Pq5LwyscgxGYXjg/7kd1ifdcpSZb530cm
	jt1e6If4Xtq08mjfFnrxW+3fGFYvpKfvO8sC0E0cI+Fg9ayritMOQQnj+fccYtX69Nc5GpsYGOq
	wEldMJuTjMalHWcVzzZQqDkpcwKybmD8BItvNr7QMoOalfCk8ZAfWQ==
X-Received: by 2002:a17:90b:1f86:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b1b0b5c1f6mr6657895a91.7.1794831423633;
        Mon, 16 Nov 2026 04:17:03 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm17110607a91.1.2026.11.16.04.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:17:02 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5] net: dsa: motorcomm: Add devlink info and resources
Date: Mon, 16 Nov 2026 20:16:20 +0800
Message-ID: <20261116121627.1182631-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Expose the ASIC model via devlink info (ASIC_ID), and register devlink
resources for ACLs and meters.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v5:
 - minor stylistic fixes
v4: https://lore.kernel.org/r/20261112002031.1475005-1-mmyangfl@gmail.com
 - remove FDB-related changes
v3: https://lore.kernel.org/r/20261109163117.1792478-1-mmyangfl@gmail.com
 - remove the buggy sub-resources
v2: https://lore.kernel.org/r/20261108094512.1285796-1-mmyangfl@gmail.com
 - fix issues reported by sashiko
v1: https://lore.kernel.org/r/20261106184811.350700-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/Makefile  |   1 +
 drivers/net/dsa/motorcomm/chip.c    |   8 +++
 drivers/net/dsa/motorcomm/devlink.c | 108 ++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/devlink.h |  18 +++++
 4 files changed, 135 insertions(+)
 create mode 100644 drivers/net/dsa/motorcomm/devlink.c
 create mode 100644 drivers/net/dsa/motorcomm/devlink.h

diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
index 9eaa59f699e8..0b31d815ce43 100644
--- a/drivers/net/dsa/motorcomm/Makefile
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 yt921x-objs := chip.o
 yt921x-$(CONFIG_NET_DSA_YT921X_LEDS) += leds.o
+yt921x-objs += devlink.o
 yt921x-objs += mdio_bus.o
 yt921x-objs += mib.o
 yt921x-objs += pcs-921x.o
diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a1d0ce35f4f3..855637d0548d 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -26,6 +26,7 @@
 #include <net/ieee8021q.h>
 
 #include "chip.h"
+#include "devlink.h"
 #include "leds.h"
 #include "mdio_bus.h"
 #include "mib.h"
@@ -2141,6 +2142,8 @@ static void yt921x_dsa_teardown(struct dsa_switch *ds)
 
 	yt921x_leds_remove(priv);
 #endif
+
+	dsa_devlink_resources_unregister(ds);
 }
 
 static int yt921x_chip_detect(struct yt921x_priv *priv)
@@ -2475,6 +2478,10 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 	if (res)
 		return res;
 
+	res = yt921x_devlink_setup(priv);
+	if (res)
+		return res;
+
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	res = yt921x_leds_setup(priv);
 	if (res)
@@ -2563,6 +2570,7 @@ static const struct dsa_switch_ops yt921x_dsa_switch_ops = {
 	.port_add_dscp_prio	= yt921x_dsa_port_add_dscp_prio,
 #endif
 	/* chip */
+	.devlink_info_get	= yt921x_dsa_devlink_info_get,
 	.teardown		= yt921x_dsa_teardown,
 	.setup			= yt921x_dsa_setup,
 };
diff --git a/drivers/net/dsa/motorcomm/devlink.c b/drivers/net/dsa/motorcomm/devlink.c
new file mode 100644
index 000000000000..7b4f3a460f1b
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/devlink.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#include "chip.h"
+#include "devlink.h"
+#include "tc.h"
+
+int
+yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
+			    struct netlink_ext_ack *extack)
+{
+	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
+	int res;
+
+	res = devlink_info_version_fixed_put(req,
+					     DEVLINK_INFO_VERSION_GENERIC_ASIC_ID,
+					     priv->info->name);
+	if (res)
+		return res;
+
+	return 0;
+}
+
+static u64 yt921x_devlink_occ_get_acl(void *ctx)
+{
+	struct yt921x_priv *priv = ctx;
+	unsigned int count = 0;
+
+	mutex_lock(&priv->reg_lock);
+	for (unsigned int i = 0; i < YT921X_ACL_BLK_NUM; i++)
+		count += hweight8(priv->acl_masks[i]);
+	mutex_unlock(&priv->reg_lock);
+
+	return count;
+}
+
+static u64 yt921x_devlink_occ_get_meter(void *ctx)
+{
+	struct yt921x_priv *priv = ctx;
+	u64 count;
+
+	mutex_lock(&priv->reg_lock);
+	count = bitmap_weight(priv->meters_map, YT921X_METER_NUM);
+	mutex_unlock(&priv->reg_lock);
+
+	return count;
+}
+
+enum yt921x_devlink_resource_id {
+	YT921X_DEVLINK_RESOURCE_ID_NONE,  /* DEVLINK_RESOURCE_ID_PARENT_TOP */
+	YT921X_DEVLINK_RESOURCE_ID_ACL,
+	YT921X_DEVLINK_RESOURCE_ID_METER,
+};
+
+struct yt921x_devlink_resource {
+	const char *name;
+	devlink_resource_occ_get_t *occ_get;
+	unsigned short size;
+	unsigned char id;
+	unsigned char parent_id;
+};
+
+static const struct yt921x_devlink_resource yt921x_devlink_resources[] = {
+	{
+		"ACL", yt921x_devlink_occ_get_acl,
+		YT921X_ACL_NUM,
+		YT921X_DEVLINK_RESOURCE_ID_ACL,
+		DEVLINK_RESOURCE_ID_PARENT_TOP,
+	},
+	{
+		"meters", yt921x_devlink_occ_get_meter,
+		YT921X_METER_NUM,
+		YT921X_DEVLINK_RESOURCE_ID_METER,
+		DEVLINK_RESOURCE_ID_PARENT_TOP,
+	},
+};
+
+int yt921x_devlink_setup(struct yt921x_priv *priv)
+{
+	struct dsa_switch *ds = &priv->ds;
+	int res;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(yt921x_devlink_resources);
+	     i++) {
+		struct devlink_resource_size_params size_params;
+		const struct yt921x_devlink_resource *r;
+
+		r = &yt921x_devlink_resources[i];
+
+		devlink_resource_size_params_init(&size_params, r->size,
+						  r->size, 1,
+						  DEVLINK_RESOURCE_UNIT_ENTRY);
+
+		res = dsa_devlink_resource_register(ds, r->name, r->size, r->id,
+						    r->parent_id, &size_params);
+		if (res) {
+			dsa_devlink_resources_unregister(ds);
+			return res;
+		}
+
+		dsa_devlink_resource_occ_get_register(ds, r->id, r->occ_get,
+						      priv);
+	}
+
+	return 0;
+}
diff --git a/drivers/net/dsa/motorcomm/devlink.h b/drivers/net/dsa/motorcomm/devlink.h
new file mode 100644
index 000000000000..184b9f05742e
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/devlink.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2026 David Yang
+ */
+
+#ifndef _YT_DEVLINK_H
+#define _YT_DEVLINK_H
+
+#include <net/dsa.h>
+
+struct yt921x_priv;
+
+int
+yt921x_dsa_devlink_info_get(struct dsa_switch *ds, struct devlink_info_req *req,
+			    struct netlink_ext_ack *extack);
+int yt921x_devlink_setup(struct yt921x_priv *priv);
+
+#endif
-- 
2.53.0


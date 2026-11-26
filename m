Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664907;
	b=SFzDGcmzfU/jgSfafqD696vjvah4ZLfB6n3euJ8E5krR1Np4V1Ke1kjxR3LjAVBA9KPj
	 igIqmGQsBaCmBGt1nWXAK68wyEArpic54OlSXGwIYlsSLBhnG0FUwjBPiu7+YTmCp8DfP
	 2sB4pBzOnrXwXNFeyvjXysc+uQd7S7o/yXGMdi6rj1A7j8ndfSASdxO810MMQIjXLRPIR
	 1UFhgp6tUnmPRf0kSqMcS31QCUC9+HKqB050cN5CILeR06m8hLS2AXp0It+7cSbNdnacU
	 Q4pAgTKlmHTr2BsNAITppwvC1B+SbdALgJfx5IzV2sKzwvQM8t9BqOmGzWt7lPg92cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tGuv7Sd3Oar8hNK6OuNWcswUY4gTV2JHooGICDa+Lmw=;
	b=QpIdw9l0Lx8F8T1X5fVBILMOzHxscxjVnpjsjxOrzTOyHCu5zVmyOQj4y4xlRST9mV8m
	 J2IJuI6Wu9OJ9a4au/5AlcBW66LRBH78usqYn5q4vTW4Jd2ztdCnvVjGjyHJxB22tXtOe
	 Ci37jxOO0RMyVRm4nH8Y/7i9gYHMtECWuMQ6pqDz362sC4Yl2ihkmQYtv43ZCBrk41glc
	 8dJMgIrfKk2+ugI21m6fcVwOwnlYl58iN9l9ZAoVL/MqeICqZ596BJ/tVo1D9xiBusxbM
	 nd2L2Yf0QNXC6+V7EUD0hIIATTkMrIjVbQUHM2lHZqudpOCUtC+uM/3WZYQSP4smoEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX8+tNUm;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DF606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX8+tNUm
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso2696644b3a.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795664906; x=1796269706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGuv7Sd3Oar8hNK6OuNWcswUY4gTV2JHooGICDa+Lmw=;
        b=ZX8+tNUmK5Ppbu/qoKrn5lrt3CVtEEv8idlNWiWylS6p+nt35zIx1akcysgBKBIPhB
         z9cPpV+ElQfLXVhPDn1b67wKdG6PBAKTNY66zFzKYAjZ8Il7uyRlTTeB6g6Xpi6zYY+t
         8bkALwjie/dgD0a19FI+I67DhB5EH8LrUybf0g0l1G3e3pK7eKQhMhxHicAGBOTHHyEi
         3hkrlAlMZ2Nc0/dbroIMsg79skl2PnVe4m7TpV7zy61CZTM42qx/hbeHs2KNAbgQfrVS
         sDppeD5BwKwwK8/JwKXAm/HB8IQCJJTDe4+so5zprskLFcxszA+83Sv3x/MLkPG8HVQ6
         tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795664906; x=1796269706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGuv7Sd3Oar8hNK6OuNWcswUY4gTV2JHooGICDa+Lmw=;
        b=FdavXS1UMaVLjG00a//SwXv/oBItKWkFMSQ51axjTPuEdqtICQ4ngC8FmFljOrTEe0
         j/He/+53xDsFy7PkDMwnvWOsxVny74HuLS/4kPnU05khuGHWJtgcOmGz1naRAYK87sKg
         ZBWMz8CZ/14KHMJnEoFt963BbjS+H2LKG12al2zzPLOiWvLO9YnfvyqOpPpMVHwm+MnL
         TyDeyG8db+fXS6UyDYiJ3aOe0QU0HV9zcrOccfQZCBSnzbtYTEY3CGh+ohN1bZL6WaLg
         1GLMT3O6bHGFIN3VZ00wtIwTjkScu3s7vjOSWhrjwKjDs4z47shzyfGo6aPXtHjfcumT
         rJQg==
X-Gm-Message-State: APuU4Z+s/NmGl8i00WmQ9++SqVl1VO7WoVh/t0xBXGW2zB2K3eT0WA07
	IVJv0nbLB4Wd7odKn1qq9/qANggaHywuE78H/JOg5/myFJhj8FZgdTb8c3v2EAYB
X-Gm-Gg: AZFdTZetH4gBSdz92hrQ9c3LwDp276aR12VKmZNCVsygZpZk1fGhCiNkxUoyu5QzKmO
	n8pu68M3zx/CyBNT9+klDLObMSvuk+hlDlv56qnqVZ9/lKQj17p4TDKV4tuzio3n2WuvTwVQxGj
	WzWLHJ1+BtXDjRx0aZrK2HY7+8wiBFPrplpQ2RNxCHs396bpGMG2xVuUdK/0Vu93YaGObjB3Gop
	dSrmQGii1PZaMa2n4gnET/y3SUmy//wAsjLU3OwlB9P4/gH+ti85CsTsvahKVSa9kjyw2qcFKvU
	DuP+q1+s23isqfZhCsCY52TnV6tRH13ikGuK4K8cYQwRCxmFYASV4pRvXPuAMEsiglhR0ezgK1C
	Z4W29OouwPFUwhP9dKYqWiwIcbFsTZRVZ7pWnG0ktbNsSkfRbSCl7D9axZVbe+MePwY3lnoPLz0
	8xkPHIVew8KX4sME6Rc7fycWR1vU3iaDyjvRpPN2BPHxs0eRfZeB/arY3cH5OkBoCMU++OZpzb+
	lm3BFKVIGBkRcGpfL7DLRnuXVV1Hz8/NtMLf+GabI4KSH6AMcLAzQXYnCuTEYmcC42W2xXay2QG
	8l22d+6bdSvzBa/9ntW6MRgPaw+GTcB0cHXPuFPxNQ8fCbv4K7pT4xg=
X-Received: by 2002:a05:6a00:2351:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8c87d32b6admr19177181b3a.46.1795664905533;
        Wed, 25 Nov 2026 19:48:25 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm10033413b3a.56.2026.11.25.19.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:48:25 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next] net: dsa: motorcomm: Unregister the MDIO buses on teardown
Date: Thu, 26 Nov 2026 11:47:22 +0800
Message-ID: <20261126034725.64709-1-mmyangfl@gmail.com>
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

.setup() can run again within one registration: removing another switch
from the tree tears the whole tree down, and re-probing sets every
member switch up again.

Since our MDIO buses are registered in .setup() and not released in
.teardown(), the second registration then collides with the bus that is
still registered (same name under the same parent) and fails in
__mdiobus_register(), so the whole tree setup fails.

Register the buses manually and free them in .teardown().

Not carrying a fix tag since there are no known multi-chip yt921x users.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c     | 18 ++++++++++---
 drivers/net/dsa/motorcomm/mdio_bus.c | 40 +++++++++++++++++++++++-----
 drivers/net/dsa/motorcomm/mdio_bus.h |  2 ++
 3 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a21d4bb5e141..789a08dbe3b9 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2240,13 +2240,16 @@ static int yt921x_edata_read(struct yt921x_priv *priv, u8 addr, u8 *valp)
 
 static void yt921x_dsa_teardown(struct dsa_switch *ds)
 {
-#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 
+#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	yt921x_leds_remove(priv);
 #endif
 
 	dsa_devlink_resources_unregister(ds);
+
+	yt921x_mbus_ext_remove(priv);
+	yt921x_mbus_int_remove(priv);
 }
 
 static int yt921x_chip_detect(struct yt921x_priv *priv)
@@ -2558,10 +2561,11 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 		res = yt921x_mbus_ext_init(priv, child);
 		of_node_put(child);
 		if (res)
-			return res;
+			goto err_mbus_int;
 
 		dev_err(dev, "Untested external mdio bus\n");
-		return -ENODEV;
+		res = -ENODEV;
+		goto err;
 	}
 
 	mask = priv->info->serdes_mask;
@@ -2586,7 +2590,7 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 	mutex_unlock(&priv->reg_lock);
 
 	if (res)
-		return res;
+		goto err;
 
 	res = yt921x_devlink_setup(priv);
 	if (res)
@@ -2599,6 +2603,12 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 #endif
 
 	return 0;
+
+err:
+	yt921x_mbus_ext_remove(priv);
+err_mbus_int:
+	yt921x_mbus_int_remove(priv);
+	return res;
 }
 
 static const struct phylink_mac_ops yt921x_phylink_mac_ops = {
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.c b/drivers/net/dsa/motorcomm/mdio_bus.c
index dd6c52f37bbf..3aea4fd3102e 100644
--- a/drivers/net/dsa/motorcomm/mdio_bus.c
+++ b/drivers/net/dsa/motorcomm/mdio_bus.c
@@ -147,7 +147,7 @@ int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp)
 	struct mii_bus *mbus;
 	int res;
 
-	mbus = devm_mdiobus_alloc(dev);
+	mbus = mdiobus_alloc();
 	if (!mbus)
 		return -ENOMEM;
 
@@ -159,15 +159,29 @@ int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp)
 	mbus->parent = dev;
 	mbus->phy_mask = (u32)~GENMASK(YT921X_PORT_NUM - 1, 0);
 
-	res = devm_of_mdiobus_register(dev, mbus, mnp);
-	if (res)
+	res = of_mdiobus_register(mbus, mnp);
+	if (res) {
+		mdiobus_free(mbus);
 		return res;
+	}
 
 	priv->mbus_int = mbus;
 
 	return 0;
 }
 
+void yt921x_mbus_int_remove(struct yt921x_priv *priv)
+{
+	struct mii_bus *mbus = priv->mbus_int;
+
+	if (!mbus)
+		return;
+	priv->mbus_int = NULL;
+
+	mdiobus_unregister(mbus);
+	mdiobus_free(mbus);
+}
+
 static int yt921x_extif_wait(struct yt921x_priv *priv)
 {
 	u32 val = 0;
@@ -277,7 +291,7 @@ int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
 	struct mii_bus *mbus;
 	int res;
 
-	mbus = devm_mdiobus_alloc(dev);
+	mbus = mdiobus_alloc();
 	if (!mbus)
 		return -ENOMEM;
 
@@ -289,11 +303,25 @@ int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
 	mbus->write = yt921x_mbus_ext_write;
 	mbus->parent = dev;
 
-	res = devm_of_mdiobus_register(dev, mbus, mnp);
-	if (res)
+	res = of_mdiobus_register(mbus, mnp);
+	if (res) {
+		mdiobus_free(mbus);
 		return res;
+	}
 
 	priv->mbus_ext = mbus;
 
 	return 0;
 }
+
+void yt921x_mbus_ext_remove(struct yt921x_priv *priv)
+{
+	struct mii_bus *mbus = priv->mbus_ext;
+
+	if (!mbus)
+		return;
+	priv->mbus_ext = NULL;
+
+	mdiobus_unregister(mbus);
+	mdiobus_free(mbus);
+}
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.h b/drivers/net/dsa/motorcomm/mdio_bus.h
index e79b725d435b..9cb1824714e3 100644
--- a/drivers/net/dsa/motorcomm/mdio_bus.h
+++ b/drivers/net/dsa/motorcomm/mdio_bus.h
@@ -49,6 +49,8 @@ yt921x_intif_modify(struct yt921x_priv *priv, int port, int reg, u16 mask,
 }
 
 int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp);
+void yt921x_mbus_int_remove(struct yt921x_priv *priv);
 int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp);
+void yt921x_mbus_ext_remove(struct yt921x_priv *priv);
 
 #endif
-- 
2.53.0


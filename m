Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763111;
	b=478MbtbKHHTFZK4uSezjJqfdT57CIQojpHP7L4YRzKML68BGUO2cS01HPQh15smdLDbW
	 eWb4lPKemFcicONIEjfjLZjee6r4whfc98n/rJoRa845AE2zdK815eRqr8wnPOJcS59WR
	 FWUfk2BR5OE3y/kNfqeCNun3+K7p+Y0dsuYyQ017nAJy5+QahecZ9fbZqIvZ2JZ8VDC+P
	 J7wvK3D+iNBWaJrkFaAGErx2pivPPwxZtivpxubanqM5JwE2i8Sp1WZdvZwbxw+na1R1j
	 19FGQ/OMaFkg7V/4V5Lq3d/0d2Gwb7pMOrY6rWy4ZxeCaM7OZKPiStYPDys5v39Cq2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Vzr+RIwjVwvgOUpAAoFsd4tc+dH91DR7QWMRpUVSh8w=;
	b=BHbY4vXpyTUoyK6KeUSvgxtH8QzbzsdBeWIWjYaMYchcUsfRSwAlLbI0MW5nl/0SAhWd
	 LFq8A3mXZP9mXjt8CXgWpryQmWC1pALZ1fR5Qcgr4UHGGfUBLgkVYnAhUSeIlFs2Z2FpX
	 NLLVSpk6o29KmXUuz9qu+gMEJlTqql0/ZWsryThKPwcc2u9Cn30DqyVZBIzosY5phHjB/
	 gFJzcus+vYcpL+S91h4AntWZy7om73rTk70QfIeBL9yyw7TBgnPYvvZDVFpJ3u0FKrHWS
	 yS72KV3ujVVu1yZZeehU8bydzblHU4e+avuMFXsn9l+bfUkE65HjXHU6LZXew9yRiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VX4Wokri;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BE1606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 07:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79BE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VX4Wokri
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4920282a12.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763111; x=1796367911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vzr+RIwjVwvgOUpAAoFsd4tc+dH91DR7QWMRpUVSh8w=;
        b=VX4WokriPt045m+LVRB0j1vEl+dJA4Ud6KDDP1S+Hslf/SwB9qb+VMIsUbQfXJwDx6
         dbiHcIXuSrh85tCg40GBPDgGjWgCAzEwh2obaxbmzY1RZLOE3MgkKfqfTaFIFowU/eZx
         YX19gK4Dco0fxDzWeo8zJbbmwQxvrP9XWyQqbZ31tcr6wxY/pAY5zuxER4BcHP8vuoAU
         1PpxQy2v662R1fQAbNLtA3/pHaBCK39Uo2WT2NorKfurCtwAKmZToOLkW7E7YUrFXqi3
         EaRSVpJgA/cSp9n1klUSXr8D3BPSdhgV6cXHoXkzgqpI8k62MiJkhysFVnKQCu7aEbkd
         ma4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763111; x=1796367911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vzr+RIwjVwvgOUpAAoFsd4tc+dH91DR7QWMRpUVSh8w=;
        b=sa28wMb6ZuILeV6S9KqH3Syz0TSPHPbkbAL7/35grxoaTj1r+GCJs4xcdz8bzDYneZ
         2qTBCt2Ja3cIINGcBAu/n5Qj9KWA/fsstdgcmIP7LWMtnIiwPrwn0xEjuTWT6JpTa3k5
         d1afMTrVZj7DWcpmSRYGx+pR5Q9OavtNtz+oirIuou8ZWJUqm6nfC8GAyZrGH4ENd9+1
         0nn4fABdWOo4VsBxMa+XCbb67jAUOsNEiL+D7ulIdjCzXkXpXApU8FlfnkQW4PqOxVrm
         Vz1ddRvQOHl+3saZV60uINgn1LBqzsSgkafyi11wN4pz7v5CTqQs1ER2TXLV0z4GF+UP
         5Icg==
X-Gm-Message-State: APuU4Z+r3LkvDBRgz0Vc5IDBBEpJBuiujErwwxCEG2prhMqZrrYzqTCw
	ae95DthPGKt7zrX1HO42TbUXEOQb/ITI5FHq+J9q5K2s6trIgNXBZEUbgVHieA==
X-Gm-Gg: AZFdTZdmXCKQ/9Zs7SzBt1h5z51FyPXm1PsVKBj6B4jjnTOZmp8WLLaH7W7kjWUk9mo
	G+k8bnyg/8Y7uhgphJQpuIaecEMSBP5ggJaYcUI/6HlljCkK7bDPyHJYP2qo1y857kTtUO88hIS
	Z91GQww6XPucPOXBt5P/iZ4fycVCjwVmVScDdeiui4T74nZ9ICA40Cc8yxwknqEQPIY95DwXQhl
	iQVBdbINv9lVo7qlbCttXqTKmtIsesRPz1vWDWhtZ88V4HU5M3HieSHaft+vqPZUU4zQG/AhjVY
	D+hWimjU6Kd1RErAISvovZVriXTvd+nSMz61+S1siK+HeAHsN+Z6+F6vixezNGh8Ay+hA8hZgOa
	7Jaencj8aAIWLtlply29lfgfEyWxqfPJ7CHIQ+LfwqEgmWEoFbYO2rDpkNOrAHrVNTUyVbaaLys
	arOtAiQ1fz/alP4HiOUOFrHI2hQwdm2HzP5OMOjVGbY1TuEBUGVrzEDkAx2rpYXGmfVAAQhjqGQ
	48MK+bAnWrb3/j5JvOJ9ljbqtod2AODNmWdzAZ/gN0ufm6+eyE2N/ILnVbq5qUC5Pgpl6qGLshq
	l8UozAbxqQ9aO0YTgyDEYtCyLlhikdC2R148jTY+VacvGR7HfK+x0r9a
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr22248421a91.26.1795763110595;
        Thu, 26 Nov 2026 23:05:10 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm37957390a91.1.2026.11.26.23.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:05:10 -0800 (PST)
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
Subject: [PATCH net-next v2] net: dsa: motorcomm: Unregister the MDIO buses on teardown
Date: Fri, 27 Nov 2026 15:03:52 +0800
Message-ID: <20261127070354.550198-1-mmyangfl@gmail.com>
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

Not carrying a fix tag since there are no multi-chip yt921x users.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c     | 24 +++++++++++++++----
 drivers/net/dsa/motorcomm/mdio_bus.c | 36 +++++++++++++++++++++++-----
 drivers/net/dsa/motorcomm/mdio_bus.h |  2 ++
 3 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index a21d4bb5e141..82f364986aeb 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -2240,13 +2240,18 @@ static int yt921x_edata_read(struct yt921x_priv *priv, u8 addr, u8 *valp)
 
 static void yt921x_dsa_teardown(struct dsa_switch *ds)
 {
-#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
 
+#if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	yt921x_leds_remove(priv);
 #endif
 
 	dsa_devlink_resources_unregister(ds);
+
+	if (priv->mbus_ext)
+		yt921x_mbus_ext_cleanup(priv);
+	if (priv->mbus_int)
+		yt921x_mbus_int_cleanup(priv);
 }
 
 static int yt921x_chip_detect(struct yt921x_priv *priv)
@@ -2558,10 +2563,11 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
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
@@ -2586,11 +2592,11 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 	mutex_unlock(&priv->reg_lock);
 
 	if (res)
-		return res;
+		goto err;
 
 	res = yt921x_devlink_setup(priv);
 	if (res)
-		return res;
+		goto err;
 
 #if IS_ENABLED(CONFIG_NET_DSA_YT921X_LEDS)
 	res = yt921x_leds_setup(priv);
@@ -2599,6 +2605,14 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
 #endif
 
 	return 0;
+
+err:
+	if (priv->mbus_ext)
+		yt921x_mbus_ext_cleanup(priv);
+err_mbus_int:
+	if (priv->mbus_int)
+		yt921x_mbus_int_cleanup(priv);
+	return res;
 }
 
 static const struct phylink_mac_ops yt921x_phylink_mac_ops = {
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.c b/drivers/net/dsa/motorcomm/mdio_bus.c
index dd6c52f37bbf..a4062e6b0f00 100644
--- a/drivers/net/dsa/motorcomm/mdio_bus.c
+++ b/drivers/net/dsa/motorcomm/mdio_bus.c
@@ -141,13 +141,23 @@ yt921x_mbus_int_write(struct mii_bus *mbus, int port, int reg, u16 data)
 	return res;
 }
 
+void yt921x_mbus_int_cleanup(struct yt921x_priv *priv)
+{
+	struct mii_bus *mbus = priv->mbus_int;
+
+	priv->mbus_int = NULL;
+
+	mdiobus_unregister(mbus);
+	mdiobus_free(mbus);
+}
+
 int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	struct mii_bus *mbus;
 	int res;
 
-	mbus = devm_mdiobus_alloc(dev);
+	mbus = mdiobus_alloc();
 	if (!mbus)
 		return -ENOMEM;
 
@@ -159,9 +169,11 @@ int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp)
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
 
@@ -271,13 +283,23 @@ yt921x_mbus_ext_write(struct mii_bus *mbus, int port, int reg, u16 data)
 	return res;
 }
 
+void yt921x_mbus_ext_cleanup(struct yt921x_priv *priv)
+{
+	struct mii_bus *mbus = priv->mbus_ext;
+
+	priv->mbus_ext = NULL;
+
+	mdiobus_unregister(mbus);
+	mdiobus_free(mbus);
+}
+
 int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
 {
 	struct device *dev = yt921x_priv_to_device(priv);
 	struct mii_bus *mbus;
 	int res;
 
-	mbus = devm_mdiobus_alloc(dev);
+	mbus = mdiobus_alloc();
 	if (!mbus)
 		return -ENOMEM;
 
@@ -289,9 +311,11 @@ int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp)
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
 
diff --git a/drivers/net/dsa/motorcomm/mdio_bus.h b/drivers/net/dsa/motorcomm/mdio_bus.h
index e79b725d435b..603088b5b8f4 100644
--- a/drivers/net/dsa/motorcomm/mdio_bus.h
+++ b/drivers/net/dsa/motorcomm/mdio_bus.h
@@ -48,7 +48,9 @@ yt921x_intif_modify(struct yt921x_priv *priv, int port, int reg, u16 mask,
 	return res >= 0 ? 0 : res;
 }
 
+void yt921x_mbus_int_cleanup(struct yt921x_priv *priv);
 int yt921x_mbus_int_init(struct yt921x_priv *priv, struct device_node *mnp);
+void yt921x_mbus_ext_cleanup(struct yt921x_priv *priv);
 int yt921x_mbus_ext_init(struct yt921x_priv *priv, struct device_node *mnp);
 
 #endif
-- 
2.53.0


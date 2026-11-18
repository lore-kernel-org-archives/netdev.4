Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966080;
	b=Sj4nAF+EEzWkdsWv7TijQEN91NRliJ5DBX39BUId84bk0mOVnpuLbWYN770xGC4UnwaS
	 FqcK0U4HeVo+jY/OjKAWUtwegPZVsD/Xb/SPlBL94sKUvo0WCRcdXzt1iPqKekg1EUN4A
	 ppxljPrLu9rHg9bPTpyK6dH44O7I5OaFutPGlIb0HKTfhr/dW1YwloaU09o9UIMui7/FE
	 RYY6Bj95q0aa+FRTTPHldJH5+fB2nL+3RJiq2dAjzZNbEts/GU6oonWchKoPE695mfWQm
	 eekc2XpAUkjmuHFoHvLOXkuW8uAF5UZW+X894paRH7eLmsVGLKrU+tYwWmNLYAZSfEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966080;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xzG0+4xLM7uNQNtuVBYTOXUsr0xkfMSlRPAWstD77hw=;
	b=USF8+troUTgcc5dSe3Q2LC3/ghbQdJE2A/kwxU9dZcGjwNBzSkmh6w7zeqA1m3MiwgY5
	 Y8svBFMcGQishiq7TNg1MGA+mMOMGz1Nzqg2AHciffdIqtcWp8hbYkOQAnCLJHlHamLf7
	 VYCcgJINGDFLds1fPtVVanSKTT2r7Ds7gZAfHZlmbtbm1MqpGeub9puaTudfc1aSn1e52
	 nc7UkDgNi/a8cel7jocv1ly8wTxDr4SSw6HhRbCp+3Ng5Lu0RdBjgeoioU7gtvFbIpJsj
	 DnFTqQB/fkMuvKy0dJYAKDZtubeR3NgsGioX8z8HWV/i3u9IVxicQbk5If6vIgF5Utg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LoG4A+aX;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F2606A31C;
	Wed, 18 Nov 2026 01:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LoG4A+aX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LoG4A+aXqO/LidqmZjUvtqsDclwgTczXcW/jNatRUw2eCzVYVDv0Xrsyw/7LWhE94avKezQj0Cufv
	 JZiFYiEvNEZFOdMbqhsxQr3bZajABkBAD5c5KKjo0m0h10gObbthfAEhUd5wl8yrj45AORs3IO8hzq
	 Vf5tzeFuO0t6B2NY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afd02395bf-0b099;
	Wed, 18 Nov 2026 09:41:16 +0800 (CST)
X-RM-TRANSID:2ee56afd02395bf-0b099
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afd023a665-2ca66;
	Wed, 18 Nov 2026 09:41:15 +0800 (CST)
X-RM-TRANSID:2ee86afd023a665-2ca66
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com
Cc: sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Wed, 18 Nov 2026 09:41:14 +0800
Message-ID: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

mt7530_setup() enables the "core" and "io" regulators of the MT7530,
but none of the error paths that follow (reset timeout, unsupported
chip ID, 20MHz XTAL, VLAN setup, PHY muxing, GPIO setup, FDB flush)
disables them again, leaving both regulators enabled after a failed
setup.

Add two error labels that disable what was enabled by then: the
io regulator failure path releases the already-enabled core
regulator, and all later failure paths disable both regulators.

MT7621 maps to the same sw_setup callback but skips the regulator
section entirely, so the cleanup at the common label is guarded
with a priv->id check to avoid unbalanced disables.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/net/dsa/mt7530.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4..2cf41282e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2425,7 +2425,7 @@ mt7530_setup(struct dsa_switch *ds)
 		if (ret < 0) {
 			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
 				ret);
-			return ret;
+			goto err_disable_core_pwr;
 		}
 	}
 
@@ -2447,20 +2447,22 @@ mt7530_setup(struct dsa_switch *ds)
 				       val != 0, 20, 1000000);
 	if (ret < 0) {
 		dev_err(priv->dev, "reset timeout\n");
-		return ret;
+		goto err_powers;
 	}
 
 	regmap_read(priv->regmap, MT7530_CREV, &id);
 	id = FIELD_GET(CHIP_NAME_MASK, id);
 	if (id != MT7530_ID) {
 		dev_err(priv->dev, "chip %x can't be supported\n", id);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_powers;
 	}
 
 	if ((val & MT7530_XTAL_MASK) == MT7530_XTAL_20MHZ) {
 		dev_err(priv->dev,
 			"MT7530 with a 20MHz XTAL is not supported!\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_powers;
 	}
 
 	/* Reset the switch through internal reset */
@@ -2527,7 +2529,7 @@ mt7530_setup(struct dsa_switch *ds)
 	/* Setup VLAN ID 0 for VLAN-unaware bridges */
 	ret = mt7530_setup_vlan0(priv);
 	if (ret)
-		return ret;
+		goto err_powers;
 
 	/* Check for PHY muxing on port 5 */
 	if (dsa_is_unused_port(ds, 5)) {
@@ -2554,7 +2556,7 @@ mt7530_setup(struct dsa_switch *ds)
 				if (ret && ret != -ENODEV) {
 					of_node_put(mac_np);
 					of_node_put(phy_node);
-					return ret;
+					goto err_powers;
 				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
 				if (id == 0)
@@ -2579,16 +2581,27 @@ mt7530_setup(struct dsa_switch *ds)
 	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
 		ret = mt7530_setup_gpio(priv);
 		if (ret)
-			return ret;
+			goto err_powers;
 	}
 #endif /* CONFIG_GPIOLIB */
 
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-		return ret;
+		goto err_powers;
 
 	return 0;
+
+err_disable_core_pwr:
+	regulator_disable(priv->core_pwr);
+	return ret;
+
+err_powers:
+	if (priv->id == ID_MT7530) {
+		regulator_disable(priv->io_pwr);
+		regulator_disable(priv->core_pwr);
+	}
+	return ret;
 }
 
 static int
-- 
2.50.1.windows.1




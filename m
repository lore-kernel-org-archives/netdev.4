Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068271;
	b=cJ6fJslj8IVZ9Ry5qtiu26QVL0Bofw3VfDmxu5w3pDZTfLbgWdr4gvk5Q/2fXo7VSaqG
	 jbfFtr6a3IixWBsPDx1G0tKqJ+ZzWyz6skbUgIj0iy2zy9Xn7LjKugSE+ZNOT6wre+8mA
	 hqbCRBK6JvnI0IlaC6F7ri+JFUa161JojjRsz/CtUGMpbPooEsiDp5S533wV9JaAkuo18
	 05wQU3NiFgq99VWoDU9Fpev7Od0QAT8ED58hEFRzXETEtSJVBYrHFZly54mRs8pshTOon
	 4LPc89ZhNU+/cUFGZEC4mqyKtXadsQc+gu1ayO7mGr59lDSfBZEX8EjcKLrZremavRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068271;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BsIlWZh9g/jVZer3U1yd7suuterKVn1WlCtXw9761gA=;
	b=WbEqbWfGoIzgA2nL+j5hfFKt02spCsnGGB/7a+iI5YkxtHVbErw3c92bc0N8U4EkkkjC
	 GNs55n84up2L4CSSvPl52NBDFMgpEtRqt6aHZoli0urrICIEnlfVNduI7vdzrORJcqkUV
	 eoSPQASnOKdPVZmu1rdlscMpKS5Ll/oTZyPPkubduuy6EHcZtAb97WsH0M84L5Q87+3zc
	 utxIC6+KdPCFgtWukB/QTB+rD55jFADUC7/14O/4FaJ0Fd9zmj1wVTasgSCbP1ymqnBmc
	 OD8vENVXvTfwsYtMa711jric0GwAeisGgHX3fSrdRM0QJHLQaknRy46IJtzdCpYbJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ni73PUbV;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1539C606A320;
	Thu, 19 Nov 2026 06:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1539C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ni73PUbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ni73PUbV31tyuNo3QzsUcQq1mm4TZ/UWGYcR4Pc16chdNoBzcdMaskcpsHj+WU+WAuvhVp4XCkaDP
	 c+i0YF2dF49/HYwnRr1/T2uxQaWGCebxaxDcZLjg3rKDfcbgRMqNeYjEuH7VCszpbrO3w5icOleo72
	 3Ofp1Tf5k0YXWa6E=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16afe9169604-f612b;
	Thu, 19 Nov 2026 14:04:26 +0800 (CST)
X-RM-TRANSID:2ee16afe9169604-f612b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afe9168edc-f1e51;
	Thu, 19 Nov 2026 14:04:26 +0800 (CST)
X-RM-TRANSID:2ee96afe9168edc-f1e51
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com
Cc: sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Thu, 19 Nov 2026 14:04:24 +0800
Message-ID: <20261119060424.1476-1-laixiangwu@cmss.chinamobile.com>
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

Add error labels that disable what was enabled by then, chained in
fall-through style so that the unwind mirrors the enable order and
there is a single return (suggested by Andrew Lunn).

MT7621 maps to the same sw_setup callback but skips the regulator
section entirely, so both labels are guarded with a priv->id check to
avoid unbalanced disables.

Found by code inspection, the issue has not been triggered at runtime
and no MT7530 hardware was available for testing.  The visible
symptom of the leak would be both regulators staying powered after a
failed probe and a WARN_ON(enable_count) splat from the regulator
core when the devm-acquired handles are released with a nonzero
enable count.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---

Changes in v2:
- restructure the new error labels into chained fall-through cleanup
  with a single return, as suggested by Andrew Lunn
- describe how the issue was found and its expected runtime symptom
  in the commit message, as requested by the netdev sinfo bot

Link: https://lore.kernel.org/all/20261118014114.1855-1-laixiangwu@cmss.chinamobile.com/
 drivers/net/dsa/mt7530.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4..1637ea22f 100644
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
@@ -2579,16 +2581,24 @@ mt7530_setup(struct dsa_switch *ds)
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
+err_powers:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->io_pwr);
+err_disable_core_pwr:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->core_pwr);
+	return ret;
 }
 
 static int
-- 
2.50.1.windows.1




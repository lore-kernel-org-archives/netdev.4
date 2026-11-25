Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573358;
	b=NX1dEzq78+yJLiyll1U7/R4OaWDn19ne6mTw0r4XGP1+VBcOAfgf0JedNOWWH8UA0/JZ
	 uckYEYScVGPLyF+fNSK1QvAkwLdAWCj4OwTwAx0ve0cFbwbHrXtnFMjtK/pe4bruYMVkN
	 Y2f/MujAgfa2Gt2K8b8VaEw9r34LwsZHz4nCha/pUWqF4p+ChbHWQg9VM0KXYAmlxKWSo
	 4P5pcyw+8XCPO4ge3nRnUItn2vmeGKGpgxSecS89E+HDsZNKgSM6HtPjadZvWtZSuoCPA
	 HRg3lpbUTJVifns4U8yckj17BqswZFIVINxpReILTlYubAvfBAXd0vO0VPehXhATUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573358;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VZUPOUml8Z7QMmIQLAEErFWrTkqLYi47llUNz2Msvxc=;
	b=hhnx7mwj7SYamZHLKBidF29JvsEvNPda7Ax8lo5z2/k5R3iiBXrd7V4sHNH/t1udD6v2
	 GW6z9oUhy48TmQN/GkxvEyyyBsKobKUlE63hSjjbHtj1ELAg0svzK8h7kScTXBhJa76AH
	 XouNrX9kH4h5gOmITOQPYM2Xwn+iv5VOIelRDWy/HFUpmNcAIz1FUOk2nMOJRbTMSuMPs
	 Pehb/diQZ9duqQMImFYJF2gLHW+tdhGGpj6TRxy668rcZ0CDtyFXsRTaoXFI3Jk1jv5dn
	 /yslL/m+yJddSLt8LMlbIXD7saE+oGP/JlSKEOEv2qxd2Fj2ECwrA6yhaLhDO66pz3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AE2PYD0e;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C50606A329;
	Wed, 25 Nov 2026 02:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C50606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AE2PYD0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AE2PYD0eraeDlLOYUxzctfs7qLEwOmOqlhLCD5sID96ASmIpkE6dmw9zmWCNdIfSV44R6gNsX1fVA
	 X0hGk17CmtCx7sFcwtdXxZNtlGKpEgM+YQ9o4SdpurV3F/NP/DLx+Oqxtp87lg0vUoQ77uXQPo+Bds
	 Qgv37vDlcWGUZxBw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b064668378-4d5fe;
	Wed, 25 Nov 2026 10:22:33 +0800 (CST)
X-RM-TRANSID:2ee76b064668378-4d5fe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b064667cc8-35135;
	Wed, 25 Nov 2026 10:22:33 +0800 (CST)
X-RM-TRANSID:2ee16b064667cc8-35135
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: chester.a.unal@arinc9.com
Cc: daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev-bot+sashiko@kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v5] net: dsa: mt7530: enable the regulators in probe() and unwind on error
Date: Wed, 25 Nov 2026 10:22:31 +0800
Message-ID: <20261125022231.1936-1-laixiangwu@cmss.chinamobile.com>
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

mt7530_setup() enables the core and io regulators of the MT7530, but the
only matching regulator_disable() calls live in mt7530_remove(), which
never runs when the probe fails.  A failure anywhere between the enables
and a fully registered switch - the remaining steps of mt7530_setup(),
the IRQ chip or MDIO bus registration in mt753x_setup() (both can also
return -EPROBE_DEFER), the SGMII PCS creation, or the DSA core itself -
therefore leaves both regulators enabled.  The devm-acquired handles
are then released with a non-zero enable_count, which triggers the
WARN_ON() in _regulator_put(), and each probe deferral grows the count
further.

Move the enables to mt7530_probe(), right after the regulators are
acquired, and unwind them with plain error labels if a later step in
the probe fails.  mt7530_setup() and mt7530_remove() keep their original
shape, so the enables and disables stay balanced in every combination of
probe, setup and unbind: a failed probe always unwinds, and a switch
that stays bound is always disabled exactly once by mt7530_remove().

On the boards that hold the switch in reset with a GPIO
(mt7623n-bananapi-bpi-r2 and mt7623n-rfb-emmc, which wire the supplies
inline), the reset line has been asserted since it was acquired in
mt7530_probe() with GPIOD_OUT_LOW, so the rails come up while the chip
is held in reset.

On the MCM boards (mt7623a-rfb-emmc and mt7623a-rfb-nand, which get
mediatek,mcm and the supplies from mt7623a.dtsi) there is no reset
GPIO; the reset control handle is only acquired in mt7530_probe() and
the first reset pulse still happens at the top of mt7530_setup().  With
the enables moved to probe, the chip therefore runs on its power-on
defaults during the window between the probe and that pulse.  The
window spans dsa_register_switch() up to the switch setup, it repeats
on every -EPROBE_DEFER retry, and it is unbounded while a multi-switch
tree waits for its other members.  The pulse at the start of
mt7530_setup() re-initializes the chip, so the window behaves like a
cold boot whose external reset arrives late; no configuration is lost.

All of these boards connect the supplies to switchable MT6323 PMIC
outputs, so a failed probe would otherwise leave them on and trip the
WARN_ON(enable_count) splat when the devm handles are released.  MT7621
does not have these supplies and is skipped by the priv->id ==
ID_MT7530 guards, and the MT7988 MMIO variant has no regulators at all.

Found by code inspection; the issue has not been triggered at runtime
and no MT7530 hardware was available for testing.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
Changes in v5:

- Rewrite the commit message safety argument.  The previous version
  claimed the reset line is always asserted since probe, which is only
  true for the boards with a reset GPIO.  On the MCM boards the reset
  control is only acquired in probe and the first reset pulse still
  happens at the start of mt7530_setup(), so the chip runs on its
  power-on defaults between probe and setup; this window is now
  described as it is instead of being masked by a wrong claim.
- Fix the list of affected boards: mt7623n-bananapi-bpi-r2 and
  mt7623n-rfb-emmc include mt7623n.dtsi and wire the supplies and the
  reset GPIO inline; the boards that get mediatek,mcm and the supplies
  from mt7623a.dtsi are mt7623a-rfb-emmc and mt7623a-rfb-nand.

No code change; the diff is identical to v4.

Link: https://lore.kernel.org/r/20261124013422.1408-1-laixiangwu@cmss.chinamobile.com

 drivers/net/dsa/mt7530-mdio.c | 38 ++++++++++++++++++++++++++++++++---
 drivers/net/dsa/mt7530.c      | 18 -----------------
 2 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 0be107dc6..b1daefc90 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -210,18 +210,50 @@ mt7530_probe(struct mdio_device *mdiodev)
 		priv->io_pwr = devm_regulator_get(&mdiodev->dev, "io");
 		if (IS_ERR(priv->io_pwr))
 			return PTR_ERR(priv->io_pwr);
+
+		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
+		ret = regulator_enable(priv->core_pwr);
+		if (ret < 0) {
+			dev_err(&mdiodev->dev,
+				"Failed to enable core power: %d\n", ret);
+			return ret;
+		}
+
+		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
+		ret = regulator_enable(priv->io_pwr);
+		if (ret < 0) {
+			dev_err(&mdiodev->dev,
+				"Failed to enable io pwr: %d\n", ret);
+			goto err_disable_core_pwr;
+		}
 	}
 
 	rc.lock_arg = &priv->bus->mdio_lock;
 	priv->regmap = devm_regmap_init(priv->dev, &mt7530_regmap_bus,
 					priv, &rc);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
+	if (IS_ERR(priv->regmap)) {
+		ret = PTR_ERR(priv->regmap);
+		goto err_disable_powers;
+	}
 
 	if (priv->id == ID_MT7531)
 		priv->create_sgmii = mt7531_create_sgmii;
 
-	return dsa_register_switch(priv->ds);
+	ret = dsa_register_switch(priv->ds);
+	if (ret)
+		goto err_disable_powers;
+
+	return 0;
+
+err_disable_powers:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->io_pwr);
+
+err_disable_core_pwr:
+	if (priv->id == ID_MT7530)
+		regulator_disable(priv->core_pwr);
+
+	return ret;
 }
 
 static void
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7781a63b4..b669a94d4 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2411,24 +2411,6 @@ mt7530_setup(struct dsa_switch *ds)
 	ds->ageing_time_min = 2 * 1000;
 	ds->ageing_time_max = (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;
 
-	if (priv->id == ID_MT7530) {
-		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
-		ret = regulator_enable(priv->core_pwr);
-		if (ret < 0) {
-			dev_err(priv->dev,
-				"Failed to enable core power: %d\n", ret);
-			return ret;
-		}
-
-		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
-		ret = regulator_enable(priv->io_pwr);
-		if (ret < 0) {
-			dev_err(priv->dev, "Failed to enable io pwr: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
 	/* Reset whole chip through gpio pin or memory-mapped registers for
 	 * different type of hardware
 	 */
-- 
2.50.1.windows.1




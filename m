Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484072;
	b=awaj7VdWOIm2VTlHE0WM3c2o4VQRCys3BJUKnO7UEbm8K7OhBDqDa1WBcu2KNawdZBjn
	 RZAhEMhI0FJoQophnt4zgnpcw29H4uROvG+v9I7Cc7ZwwJ7di1ScGb1PL2yiiB1X20y8/
	 D4RswXVUPdJTubK1krmiGD5y+4c1+FSyiucxoe4hv/Vjw0AlKdaBujdO4d/GJPClL5GT7
	 tOuU1LK0s/ReNY1dnNJfGkw/WjjkkiKg/4w4rj/B866hyMTDIsKng+qynUnf+q6mfGbiA
	 oqdR/263k1Xe2Q9fpTwL2wsndXAzm4Nxmc/rLoX3yJzZy2ide9iAc874Ia56aTDqQUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484072;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oB91cvLVv77J9+Q8wIXKUGWmJ4awD5QCFhfn5x2IOY4=;
	b=Ktc0zQcWzMGtFoLkO9PfxaoUNc9evJrs+IkxkZcLdCXhkm2aONqVmCr7M5StujYl5APg
	 7NZVktJFlD96KxkRVWO6xOJKJhme7+MpGJS0cczzZFCDjTrcyRQQ2mlicG3E16HdtLamJ
	 GiO1uiew6RFNx4d5Dm93F/WMjQm8Aq09AwMffDBSAoeHHewu5hnuqURIrmyrptRJXHAZj
	 9XPkxa2VPioLthcODQUT1inwjNjUpX1BlSjN+mMm3BaENdglB/dR5cJQMTzSexs9O15Is
	 sFvOXDkU9wb3Wwz+JzWQJoajSxepBpGsJQ3A5bpEFu4YFkJqRBeCRp1lkRDNaKHUDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=D92YFggw;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB37606A322;
	Tue, 24 Nov 2026 01:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB37606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=D92YFggw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=D92YFggwGQGjrgPVGdskHxrKIIwlhRMut53NQc7gUWDTrK8T8iwti0gwOrLQd+H6zLlOsoqf/Dgvj
	 mekEyQPcl8zusaOfEMOGqZn7E+FqNq23zc+YhN9sggUcYEnl1QSx2mO3KWmxzAUlhJxFMv9Bpy89Hg
	 m1KhVoQJ83AwBdpY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16b04e99fc52-1d9e1;
	Tue, 24 Nov 2026 09:34:24 +0800 (CST)
X-RM-TRANSID:2ee16b04e99fc52-1d9e1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46b04e99cf57-0e044;
	Tue, 24 Nov 2026 09:34:23 +0800 (CST)
X-RM-TRANSID:2ee46b04e99cf57-0e044
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
Subject: [PATCH v4] net: dsa: mt7530: enable the regulators in probe() and
 unwind on error
Date: Tue, 24 Nov 2026 09:34:21 +0800
Message-ID: <20261124013422.1408-1-laixiangwu@cmss.chinamobile.com>
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
Content-Transfer-Encoding: quoted-printable

mt7530_setup() enables the core and io regulators of the MT7530, but the=0D
only matching regulator_disable() calls live in mt7530_remove(), which=0D
never runs when the probe fails.  A failure anywhere between the enables=0D
and a fully registered switch - the remaining steps of mt7530_setup(),=0D
the IRQ chip or MDIO bus registration in mt753x_setup() (both can also=0D
return -EPROBE_DEFER), the SGMII PCS creation, or the DSA core itself -=0D
therefore leaves both regulators enabled.  The devm-acquired handles=0D
are then released with a non-zero enable_count, which triggers the=0D
WARN_ON() in _regulator_put(), and each probe deferral grows the count=0D
further.=0D
=0D
Move the enables to mt7530_probe(), right after the regulators are=0D
acquired, and unwind them with plain error labels if a later step in=0D
the probe fails.  mt7530_setup() and mt7530_remove() keep their original=0D
shape, so the enables and disables stay balanced in every combination of=0D
probe, setup and unbind: a failed probe always unwinds, and a switch=0D
that stays bound is always disabled exactly once by mt7530_remove().=0D
=0D
Enabling the supplies this early is safe.  Nothing accesses the switch=0D
between the enables and dsa_register_switch(): the reset line has been=0D
asserted since it was acquired in mt7530_probe() with GPIOD_OUT_LOW, so=0D
the rails come up while the chip is held in reset, and mt7530_setup()=0D
still releases the reset afterwards, unchanged.  MT7621 does not have=0D
these supplies and is skipped by the priv->id =3D=3D ID_MT7530 guards, and=
=0D
the MT7988 MMIO variant has no regulators at all.=0D
=0D
Found by code inspection; the issue has not been triggered at runtime=0D
and no MT7530 hardware was available for testing.  The in-tree boards=0D
that wire these supplies (the MT7623 boards mt7623n-bananapi-bpi-r2=0D
and mt7623n-rfb-emmc via mt7623a.dtsi) connect them to switchable=0D
MT6323 PMIC outputs, so on those boards a failed probe would leave the=0D
supplies on and trip the WARN_ON(enable_count) splat when the devm=0D
handles are released.=0D
=0D
Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 sw=
itch")=0D
Suggested-by: Andrew Lunn <andrew@lunn.ch>=0D
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>=0D
---=0D
=0D
Changes in v4:=0D
- Drop the devm_add_action_or_reset() approach and unwind the regulators=0D
  with plain error labels in mt7530_probe(), and restore the explicit=0D
  disables in mt7530_remove(), as requested by Andrew Lunn.=0D
- Extend the commit message: explain why enabling the regulators=0D
  early in probe() is safe, and state which boards are affected.=0D
=0D
Link: https://lore.kernel.org/r/20261123022415.433-1-laixiangwu@cmss.chinam=
obile.com=0D
=0D
 drivers/net/dsa/mt7530-mdio.c | 38 ++++++++++++++++++++++++++++++++---=0D
 drivers/net/dsa/mt7530.c      | 18 -----------------=0D
 2 files changed, 35 insertions(+), 21 deletions(-)=0D
=0D
diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c=
=0D
index 0be107dc6..b1daefc90 100644=0D
--- a/drivers/net/dsa/mt7530-mdio.c=0D
+++ b/drivers/net/dsa/mt7530-mdio.c=0D
@@ -210,18 +210,50 @@ mt7530_probe(struct mdio_device *mdiodev)=0D
 		priv->io_pwr =3D devm_regulator_get(&mdiodev->dev, "io");=0D
 		if (IS_ERR(priv->io_pwr))=0D
 			return PTR_ERR(priv->io_pwr);=0D
+=0D
+		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);=0D
+		ret =3D regulator_enable(priv->core_pwr);=0D
+		if (ret < 0) {=0D
+			dev_err(&mdiodev->dev,=0D
+				"Failed to enable core power: %d\n", ret);=0D
+			return ret;=0D
+		}=0D
+=0D
+		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);=0D
+		ret =3D regulator_enable(priv->io_pwr);=0D
+		if (ret < 0) {=0D
+			dev_err(&mdiodev->dev,=0D
+				"Failed to enable io pwr: %d\n", ret);=0D
+			goto err_disable_core_pwr;=0D
+		}=0D
 	}=0D
 =0D
 	rc.lock_arg =3D &priv->bus->mdio_lock;=0D
 	priv->regmap =3D devm_regmap_init(priv->dev, &mt7530_regmap_bus,=0D
 					priv, &rc);=0D
-	if (IS_ERR(priv->regmap))=0D
-		return PTR_ERR(priv->regmap);=0D
+	if (IS_ERR(priv->regmap)) {=0D
+		ret =3D PTR_ERR(priv->regmap);=0D
+		goto err_disable_powers;=0D
+	}=0D
 =0D
 	if (priv->id =3D=3D ID_MT7531)=0D
 		priv->create_sgmii =3D mt7531_create_sgmii;=0D
 =0D
-	return dsa_register_switch(priv->ds);=0D
+	ret =3D dsa_register_switch(priv->ds);=0D
+	if (ret)=0D
+		goto err_disable_powers;=0D
+=0D
+	return 0;=0D
+=0D
+err_disable_powers:=0D
+	if (priv->id =3D=3D ID_MT7530)=0D
+		regulator_disable(priv->io_pwr);=0D
+=0D
+err_disable_core_pwr:=0D
+	if (priv->id =3D=3D ID_MT7530)=0D
+		regulator_disable(priv->core_pwr);=0D
+=0D
+	return ret;=0D
 }=0D
 =0D
 static void=0D
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c=0D
index 7781a63b4..b669a94d4 100644=0D
--- a/drivers/net/dsa/mt7530.c=0D
+++ b/drivers/net/dsa/mt7530.c=0D
@@ -2411,24 +2411,6 @@ mt7530_setup(struct dsa_switch *ds)=0D
 	ds->ageing_time_min =3D 2 * 1000;=0D
 	ds->ageing_time_max =3D (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1) * 1000;=0D
 =0D
-	if (priv->id =3D=3D ID_MT7530) {=0D
-		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);=0D
-		ret =3D regulator_enable(priv->core_pwr);=0D
-		if (ret < 0) {=0D
-			dev_err(priv->dev,=0D
-				"Failed to enable core power: %d\n", ret);=0D
-			return ret;=0D
-		}=0D
-=0D
-		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);=0D
-		ret =3D regulator_enable(priv->io_pwr);=0D
-		if (ret < 0) {=0D
-			dev_err(priv->dev, "Failed to enable io pwr: %d\n",=0D
-				ret);=0D
-			return ret;=0D
-		}=0D
-	}=0D
-=0D
 	/* Reset whole chip through gpio pin or memory-mapped registers for=0D
 	 * different type of hardware=0D
 	 */=0D
-- =0D
2.50.1.windows.1=0D
=0D



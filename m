Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400660;
	b=3S8uj1S8oh2UIwToJn0hM87HmQqExkVRLx5JO7tX8ElAtCqjUKSCHEGDB48q7fdKEQxm
	 LwkjzX9UD1gLWwrVg+qrvbAKt+fk5nwR+oLL00ESuyXc0avZQgMt9AQ0mpxivrcY17v8Q
	 R7IzNR+WjuCSkKgYfDTQnNgdUQzSQoUGT1orD2vAMCBiNity8IaNNvxGftv4IPVcntcH9
	 hVKymF/uSeH5fSMxg6aIMAo6Uq2o66msi1ZUrLw4XW2PeQvXhrjVrz44vA/BXrEPJaq/M
	 iAcaYgdjKpk79z9WnUz911xmHT1MTj6/12CsH/qkM4g5RkxhLTjiOgu45uohzfCBtgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400660;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VUjnilYGMK6n8uRV96C20nGUmNVbpW+6JA21u4o9l+Y=;
	b=iQxw5wl3Z59I9DPbgUbud+449Se6b2P+CTKPGTaI3iwIGWCUwAQYk8eKH6RhRF3V8sES
	 J2LmtptYHYVYwHRiYRRVQdMcTJE5R+BvTRroj9oOnXw/s+Aekw4nmgLeF6XyUuChWxdX1
	 7M4J0XaclONyigRFG64TDLK5psPaKa6qrD1LPdQll7jmYyzMQSZuvWwb9mVJEdrxqrHfs
	 dnO1oGGsrieSg+vIF0CrsoZ6HmGiiqSduGesU4YrkZw2DplBsl77PblpZTbTyr4ncodBp
	 LJv1iwIV0AS+U5yX3SHVt2DcYX8rhRqDPApRdgVLZkyXinIhMsX6cH6nYYQtzdKBZMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=K2VMpE3x;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B382606A31A;
	Mon, 23 Nov 2026 02:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B382606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=K2VMpE3x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=K2VMpE3xFZwJoX/l9Aplb6D9Z22o/0VoN3wPthTYr628O17R/mNJPjvlRCov2DgCxXNcv6e5Jou3/
	 7PTWcYdBieZ8u0Nw0ZZIEeie+/ZX0rIrb8oPcCWSGj8R/DqSBOgvNPcMn045NlXoNXrOAtcq/RhJkD
	 dz9Xjwmy4mbFD8TY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b03a3cf244-d793a;
	Mon, 23 Nov 2026 10:24:15 +0800 (CST)
X-RM-TRANSID:2ee46b03a3cf244-d793a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b03a3cde27-eb193;
	Mon, 23 Nov 2026 10:24:15 +0800 (CST)
X-RM-TRANSID:2ee86b03a3cde27-eb193
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
Subject: [PATCH v3] net: dsa: mt7530: manage the core and io regulators with
 devm actions
Date: Mon, 23 Nov 2026 10:24:15 +0800
Message-ID: <20261123022415.433-1-laixiangwu@cmss.chinamobile.com>
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
acquired, and pair each regulator_enable() with a=0D
devm_add_action_or_reset() that disables it again.  This covers every=0D
error path after the enables, and replaces the explicit disables in=0D
mt7530_remove(), so the enables and disables stay balanced in all=0D
combinations of probe, setup and unbind.=0D
=0D
Found by code inspection, the issue has not been triggered at runtime=0D
and no MT7530 hardware was available for testing.  The visible symptom=0D
of the leak would be both regulators staying powered after a failed=0D
probe and a WARN_ON(enable_count) splat from the regulator core when=0D
the devm-acquired handles are released with a nonzero enable count.=0D
=0D
Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 sw=
itch")=0D
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>=0D
---=0D
=0D
Changes in v3:=0D
- Replaced the setup error-path unwinding of v2 with devm-managed regulator=
=0D
  enables in mt7530_probe(), and removed the explicit disables from=0D
  mt7530_remove().  The late error paths outside mt7530_setup() (IRQ chip=0D
  and MDIO bus registration, SGMII PCS creation, the DSA core) are now=0D
  covered too, as suggested in the review of v1 by the netdev AI bot.=0D
=0D
Link: https://lore.kernel.org/r/20261119060424.1476-1-laixiangwu@cmss.china=
mobile.com=0D
 drivers/net/dsa/mt7530-mdio.c | 48 +++++++++++++++++++++++++----------=0D
 drivers/net/dsa/mt7530.c      | 18 -------------=0D
 2 files changed, 35 insertions(+), 31 deletions(-)=0D
=0D
diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c=
=0D
index 0be107dc6..99432d658 100644=0D
--- a/drivers/net/dsa/mt7530-mdio.c=0D
+++ b/drivers/net/dsa/mt7530-mdio.c=0D
@@ -155,6 +155,14 @@ static const struct regmap_config regmap_config =3D {=
=0D
 	.unlock =3D mt7530_mdio_regmap_unlock,=0D
 };=0D
 =0D
+static void=0D
+mt7530_disable_regulator(void *data)=0D
+{=0D
+	struct regulator *regulator =3D data;=0D
+=0D
+	regulator_disable(regulator);=0D
+}=0D
+=0D
 static int=0D
 mt7530_probe(struct mdio_device *mdiodev)=0D
 {=0D
@@ -210,6 +218,32 @@ mt7530_probe(struct mdio_device *mdiodev)=0D
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
+		ret =3D devm_add_action_or_reset(&mdiodev->dev,=0D
+					       mt7530_disable_regulator,=0D
+					       priv->core_pwr);=0D
+		if (ret)=0D
+			return ret;=0D
+=0D
+		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);=0D
+		ret =3D regulator_enable(priv->io_pwr);=0D
+		if (ret < 0) {=0D
+			dev_err(&mdiodev->dev,=0D
+				"Failed to enable io pwr: %d\n", ret);=0D
+			return ret;=0D
+		}=0D
+		ret =3D devm_add_action_or_reset(&mdiodev->dev,=0D
+					       mt7530_disable_regulator,=0D
+					       priv->io_pwr);=0D
+		if (ret)=0D
+			return ret;=0D
 	}=0D
 =0D
 	rc.lock_arg =3D &priv->bus->mdio_lock;=0D
@@ -228,23 +262,11 @@ static void=0D
 mt7530_remove(struct mdio_device *mdiodev)=0D
 {=0D
 	struct mt7530_priv *priv =3D dev_get_drvdata(&mdiodev->dev);=0D
-	int ret =3D 0, i;=0D
+	int i;=0D
 =0D
 	if (!priv)=0D
 		return;=0D
 =0D
-	if (priv->id =3D=3D ID_MT7530) {=0D
-		ret =3D regulator_disable(priv->core_pwr);=0D
-		if (ret < 0)=0D
-			dev_err(priv->dev,=0D
-				"Failed to disable core power: %d\n", ret);=0D
-=0D
-		ret =3D regulator_disable(priv->io_pwr);=0D
-		if (ret < 0)=0D
-			dev_err(priv->dev, "Failed to disable io pwr: %d\n",=0D
-				ret);=0D
-	}=0D
-=0D
 	mt7530_remove_common(priv);=0D
 =0D
 	for (i =3D 0; i < 2; ++i)=0D
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



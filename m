Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795383048;
	b=tLo37jwAbLnP52w5rN0b4c2bBrSUXTdEt0ePxPzYRQZLe818uwnJ5Xj3jy2QJxDwr+Zo
	 crF+PX+XSv/6qE/kw4t+dWKtpWTw151LFbsRLzMDOtzB2gTCfpMLh/JD5fvRr0qJvSq1/
	 angBlwo+sez8PuusOCXRfUmQbC+9gdfOn37pV/pTjYFC8RwfyE0YQ1X/q1B4MzqfSqGf3
	 7kbGiDbzK7T238CabJd3kVJB23/3vQ7xM83qVch3qejNorgnDhAJe3304qpYCKpJpF8ha
	 kr/owLW4172GgqAZO3SNP3HQZfDykCu8dJFs3tJWbE0ZVkUtwhVAMqQX28iaCg4O/DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-WP-DKIM-Status:X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=+r6mZIgYDOPDGHSWoaI2JNlvt7lyaD7ZvTwPxoAYMZs=;
	b=WJtDAIVNqngXBOc+TkWMZKlMEEgPfyk+jvecf2GnYbdzRHNdve9U0C9T3sRkNF1goaXK
	 Sj/6fOwP96Be+Amsooj+0jQXQck/QgoM1Vbuj2elemCw4pF2Y9OuagyU3onm9DOm1jrYG
	 d7HH+ywHLgeEFVLSu8FSrqEaniH4+jmCbPu+ZZxG/nsFlaAHdvWnSMrX3kbmNDKGt6dJW
	 vZmyGuHaX/pOp/aOg34Mhr8CNqeJEoPisg+Rq0qIIPDn8BhtEuGcEV2bT7Uqq5ab88M9L
	 mXp9e1q0iTSQ73agQJjQuNM9ozP5+k5pGOGwG+k6qiB4oK11LybFCcwIPZIvIdFPWwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=ACvi74FL;
	arc=none smtp.remote-ip=212.77.101.12
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2334606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2334606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=ACvi74FL
Received: (wp-smtpd smtp.wp.pl 23031 invoked from network); 22 Nov 2026 22:30:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1795383038; bh=+r6mZIgYDOPDGHSWoaI2JNlvt7lyaD7ZvTwPxoAYMZs=;
          h=From:To:Cc:Subject;
          b=ACvi74FLxJmqLGydKWnzFXQVT+fDSPPlk0gcFhTa2mgtpYLAoNaU170YcXiVFv3mj
           tgXYHKKO2s/tyrKH/6FcXcOw3QiuAXfyB4mZXe378qOWt+bd8SMQo9BrkKIbmyjbaW
           1oEIT96r1Pv9/0r9AiBFy6dNmCzbezsptGchpvrq48l4fssWOJfji7UPctg2M5YGRe
           Xz6W/uSTZf+79+IQcF/ROuQarWm4Z/mmJl+wekiQIq/BF6/qCxD2kke9ksCO4RlVuG
           C3FXpk/xWGl+ntkvVZSxicov17i7GRewEHBOjf18EplTryRJuuX8Cg49PRXY7Gn6MD
           pobgTdTjg8B9w==
Received: from abajkowski.lan (83.5.167.37.ipv4.supernova.orange.pl [83.5.167.37])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <skyline@mail.ru>; 22 Nov 2026 22:30:38 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: skyline@mail.ru,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH net-next v3] net: phy: marvell: add support for PHY LEDs polarity modes
Date: Sun, 22 Nov 2026 22:28:55 +0100
Message-ID: <20261122213034.548858-1-olek2@wp.pl>
X-Mailer: git-send-email 2.55.0
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
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 16f2e7e3d97eb830783906fe6809f310
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000B [cUMU]                               

Add the led_polarity_set callback for setting LED polarity. Implement
this callback for the 88E1116R, 88E1318 and 88E1510 PHYs. This should
also work on other Marvell PHYs, but I don't have access to the TRM or
the hardware.

Keep the LED polarization settings and restore them after a hardware
reset. This modification is actually only necessary on devices with a
wired PHY reset line and a driver that resets the PHY during the
link-up/link-down events. I found a single DTS file in OpenWRT
(armada-385-fortinet-fg-5xe.dtsi) that matches this hardware configuration.

Tested on Adapteva Paralella board with Marvell 88E1318 PHY.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
Changes in v3:
 - Restore polarity settings after hardware reset
 - Enable polarity control on 88E1116R
Changes in v2:
 - add suppoer for PHY_LED_INACTIVE_HIGH_IMPEDANCE mode
---
 drivers/net/phy/marvell.c | 65 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 87f66dfa92dd..9a07f88c9ddc 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -146,6 +146,9 @@
 #define MII_88E1318S_PHY_LED_FUNC_ON		(0x9)
 #define MII_88E1318S_PHY_LED_FUNC_HI_Z		(0xa)
 #define MII_88E1318S_PHY_LED_FUNC_BLINK		(0xb)
+#define MII_88E1318S_PHY_LED_POL		0x11
+#define MII_88E1318S_PHY_LED_POL_ACT_HIGH(idx)	BIT(2 * (idx))
+#define MII_88E1318S_PHY_LED_POL_HIGH_IMP(idx)	BIT(2 * (idx) + 1)
 #define MII_88E1318S_PHY_LED_TCR		0x12
 #define MII_88E1318S_PHY_LED_TCR_FORCE_INT	BIT(15)
 #define MII_88E1318S_PHY_LED_TCR_INTn_ENABLE	BIT(7)
@@ -301,6 +304,8 @@
 #define NB_FIBER_STATS	1
 #define NB_STAT_MAX	3
 
+#define M88E1318S_MAX_LEDS	3
+
 MODULE_DESCRIPTION("Marvell PHY driver");
 MODULE_AUTHOR("Andy Fleming");
 MODULE_LICENSE("GPL");
@@ -352,6 +357,8 @@ struct marvell_priv {
 	s8 pair;
 	u8 vct_phase;
 	bool wol_enabled;
+	u16 led_polarity_mask;
+	u16 led_polarity_val;
 };
 
 static int marvell_read_page(struct phy_device *phydev)
@@ -924,9 +931,22 @@ static void marvell_config_led(struct phy_device *phydev)
 
 static int marvell_config_init(struct phy_device *phydev)
 {
+	struct marvell_priv *priv = phydev->priv;
+	int err;
+
 	/* Set default LED */
 	marvell_config_led(phydev);
 
+	/* Restore the LED polarity settings after a reset. */
+	if (priv->led_polarity_mask) {
+		err = phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
+				       MII_88E1318S_PHY_LED_POL,
+				       priv->led_polarity_mask,
+				       priv->led_polarity_val);
+		if (err < 0)
+			return err;
+	}
+
 	/* Set registers from marvell,reg-init DT property */
 	return marvell_of_reg_init(phydev);
 }
@@ -3625,7 +3645,7 @@ static int m88e1318_led_hw_control_get(struct phy_device *phydev, u8 index,
 {
 	int mode, reg;
 
-	if (index > 2)
+	if (index >= M88E1318S_MAX_LEDS)
 		return -EINVAL;
 
 	reg = phy_read_paged(phydev, MII_MARVELL_LED_PAGE,
@@ -3638,6 +3658,46 @@ static int m88e1318_led_hw_control_get(struct phy_device *phydev, u8 index,
 	return marvell_get_led_rules(index, rules, mode);
 }
 
+static int m88e1318_led_polarity_set(struct phy_device *phydev, int index,
+				     unsigned long modes)
+{
+	struct marvell_priv *priv = phydev->priv;
+	u16 val = 0;
+	u32 mode;
+	u16 mask;
+	int err;
+
+	if (index < 0 || index >= M88E1318S_MAX_LEDS)
+		return -EINVAL;
+
+	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
+		switch (mode) {
+		case PHY_LED_ACTIVE_LOW:
+			break;
+		case PHY_LED_ACTIVE_HIGH:
+			val |= MII_88E1318S_PHY_LED_POL_ACT_HIGH(index);
+			break;
+		case PHY_LED_INACTIVE_HIGH_IMPEDANCE:
+			val |= MII_88E1318S_PHY_LED_POL_HIGH_IMP(index);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	mask = MII_88E1318S_PHY_LED_POL_ACT_HIGH(index) |
+	       MII_88E1318S_PHY_LED_POL_HIGH_IMP(index);
+	err = phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
+			       MII_88E1318S_PHY_LED_POL, mask, val);
+	if (err < 0)
+		return err;
+
+	priv->led_polarity_mask |= mask;
+	priv->led_polarity_val |= val;
+
+	return 0;
+}
+
 static int marvell_probe(struct phy_device *phydev)
 {
 	struct marvell_priv *priv;
@@ -3886,6 +3946,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.led_polarity_set = m88e1318_led_polarity_set,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1145,
@@ -3971,6 +4032,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.led_polarity_set = m88e1318_led_polarity_set,
 	},
 	{
 		.phy_id = MARVELL_PHY_ID_88E1510,
@@ -4005,6 +4067,7 @@ static struct phy_driver marvell_drivers[] = {
 		.led_hw_is_supported = m88e1318_led_hw_is_supported,
 		.led_hw_control_set = m88e1318_led_hw_control_set,
 		.led_hw_control_get = m88e1318_led_hw_control_get,
+		.led_polarity_set = m88e1318_led_polarity_set,
 		.attach_mii_port = m88e1510_attach_mii_port,
 	},
 	{
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524595;
	b=ag/s2kK/4f6aNFDROSUlLFI5hWaNwTzzo75UElWIIpYZ1C2Mr19z7s+V6I9KN4mumwag
	 I9Yx0wjuohWYw9fkWs5lFDvIFUy1v4krnfV/a9t+kub9VOuLS4QPpscgL61gIda/xCeTF
	 QjsQZ3boubEenPvwoFtsuYzOqhwoNV9MJF9KbAb6jh+CzERI3MbCMhfpN0KzLWQ3jrDLO
	 vtl8TM+TaAHEYD0Nun58F3vi0lAf6USp1Pb/qSNBDaOeQ794KzMJpeFxlXIGrix+hawpq
	 3QNc+2gxwzq3FdnVVRVRycm0MrcAVJk5g17KpqmXkBT3U8EQ2jMN9Ey79P3eSbunz3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524595;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=CsT77i/wCIqlILWovMFcgEyYEyRw0J0lV7LV7ScyAEE=;
	b=B+Le5BF42B48f1QGhVu666xu1r2jS75tUoETOnb4IwERRrujXCH+oDtuSgBUNUkcquDg
	 DNf0HHjiRrIGXmDvEPwgMozpe2MOQSFZ+888QdKZ957iPYxU0t/4rDTMS4h3l2mQ6Gf2j
	 012lkoSeSGr5zWJ9GfQwfMcdsrSE4LEMzaPbYF7kPYj2mHj0anS2oDvV/Pn1VcPlmipTx
	 DeMyp868fRP7g96sN9slLG88DL+OhNusVgcTnoaDzPhmVxWaCIFPsL//4/Nqq3h+n6YPa
	 ROBvo+O73BmIB5akui7gOsY4hIETGy8QmyU8+cYQ7q/fAT8np7VFKANCCrPv11/3Z/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=jR9U8MjW;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A221A606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A221A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=jR9U8MjW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795524595; x=1827060595;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VyB/Wyj+lodonXz0L5qlLnf5ZZJhfB9sBQUbdppHPzM=;
  b=jR9U8MjWeMVKnv1s+e4aSKt47FhYzb5d80n2xDd9b4gwiJgMlrC7FYuS
   yGlQnkwNQJuFzOTkXt2NKCyMkpEeQJ3pzYbDtQNmlgQuZhfkHQVlKkWRA
   nVhK/aKD38aeKXL8fHa6Ca4NLDd9ET1vB+c4+kfSns7YoaWM8nL98Rj4i
   NaAC3s+eYbbubSzhTWhYqXfX/YS7GHkAGkavgZBFLITdWxf7nA0frxHi5
   s9298oS4ElLVHkF0gEro5I9IKz0VjlctMjMGdPGsJwaGlGmWKKpERvhgX
   f13nSdVJgx31cdDnS6vkK1gGEZ6srm3Wjcqb/TZw96+y5X3x2KLHsl0JL
   w==;
X-CSE-ConnectionGUID: zQNKYKnWT9+mPPAo0T693Q==
X-CSE-MsgGUID: PtgnMu2tQ9CgYo1HLa6wDg==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="298386074"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 05:49:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Nov 2026 05:49:53 -0700
Received: from che-ll-i17164.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 24 Nov 2026 05:49:49 -0700
From: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>
Subject: [PATCH net-next RESEND v4 4/4] net: phy: microchip_t1s: fix collision detection for LAN867X Rev.D0
Date: Tue, 24 Nov 2026 18:19:30 +0530
Message-ID: <20261124124930.485323-5-parthiban.veerasooran@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-1-parthiban.veerasooran@microchip.com>
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
Content-Type: text/plain

LAN867X Rev.D0 adds a Collision Counting and MAC Forwarding Control
field (CCMFC, bits 10:9) in COL_DET_CTRL0 (0x0087). Set to the OA
default (0x1), the hardware autonomously gates collision forwarding
based on live PLCA_Status, removing the delay a software-driven CDEN
toggle had on older revisions. The PSTC interrupt handler for Rev.D0
therefore only needs to update the link status selection on each PLCA
transition.

Configure CCMFC to the OA default in lan867x_revd0_config_init(). Add
lan867x_revd0_handle_interrupt() for two events: Link Status Change
triggers the phylib state machine; PLCA Status Change re-evaluates the
link status selection using the cached PLCA enable state and current
CSMA/CD fallback configuration.

Rev.D0 can also be configured (PRSCTL1, 0x0035, bit 10) to autonomously
fall back to CSMA/CD when no BEACON is seen. When that's active, the
PHY's own hardware transition already handles CSMA/CD correctly, so
driving link status from PLCA_Status reports nothing meaningful. Force
the semaphore (forced-active) source whenever fallback is enabled; only
when fallback is disabled - the PHY stays pinned to PLCA mode - does
tracking PLCA_Status serve its purpose.

Wire up .config_intr/.handle_interrupt for Rev.D0 via a dedicated
lan867x_revd0_config_intr(), reusing the STS1/IMSK1 helpers from the
other LAN86XX PHYs.

Preserve cable-test polling when Rev.D0 uses its PHY interrupt path.
Once interrupt handling is enabled, phydev->irq may be valid and the
normal PHY polling path is no longer used, so PHY_POLL_CABLE_TEST
ensures cable-test state continues to be polled while the test is active.

Fixes: 07f5765f26c3 ("net: phy: microchip_t1s: configure link status control for LAN867x Rev.D0")
Signed-off-by: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
---
 drivers/net/phy/microchip_t1s.c | 127 +++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/microchip_t1s.c b/drivers/net/phy/microchip_t1s.c
index 5ce0304bf095..d667f57aa4a8 100644
--- a/drivers/net/phy/microchip_t1s.c
+++ b/drivers/net/phy/microchip_t1s.c
@@ -29,6 +29,7 @@
 
 /* PHY interrupt status 1 register */
 #define LAN86XX_REG_STS1		0x0018
+#define LAN86XX_STS1_LINK_STS_CHANGED	BIT(13)
 #define LAN86XX_STS1_PLCA_STS_CHANGED	BIT(11)
 
 /* PHY interrupt mask 1 register */
@@ -47,6 +48,9 @@
 #define COL_DET_CTRL0_ENABLE_BIT_MASK	BIT(15)
 #define COL_DET_ENABLE			BIT(15)
 #define COL_DET_DISABLE			0x0000
+#define COL_DET_CTRL0_CCMFC_MASK	GENMASK(10, 9)
+/* OA default: collisions gated by PLCA_Status in hardware */
+#define COL_DET_CTRL0_CCMFC_OA_DEFAULT	BIT(9)
 
 /* LAN8670/1/2 Rev.D0 Link Status Selection Register */
 #define LAN867X_REG_LINK_STATUS_CTRL	0x0012
@@ -520,6 +524,29 @@ static int lan86xx_update_cden(struct phy_device *phydev)
 			      COL_DET_CTRL0_ENABLE_BIT_MASK, cden);
 }
 
+/* When the PHY autonomously falls back to CSMA/CD once BEACONs stop (PRSCTL1
+ * bit 10 set), the hardware fallback already provides correct CSMA/CD
+ * operation; selecting link status from PLCA_STATUS in that case reports
+ * nothing meaningful, since the PHY may already be running CSMA/CD regardless
+ * of the stale PLCA_STATUS value. Force the semaphore (forced-active) source
+ * in that case instead. Only when fallback is disabled - the PHY is pinned
+ * to PLCA mode - does tracking PLCA_STATUS serve its intended purpose.
+ */
+static int lan867x_revd0_update_link_selection(struct phy_device *phydev,
+					       int plca_enabled)
+{
+	int fallback;
+
+	fallback = lan86xx_fallback_to_csmacd(phydev);
+	if (fallback < 0)
+		return fallback;
+
+	if (fallback)
+		return lan867x_revd0_link_active_selection(phydev, false);
+
+	return lan867x_revd0_link_active_selection(phydev, plca_enabled);
+}
+
 /* As per LAN8650/1 Rev.B0/B1 AN1760 (Revision F (DS60001760G - June 2024)) and
  * LAN8670/1/2 Rev.C1/C2 AN1699 (Revision E (DS60001699F - June 2024)), under
  * normal operation, the device should be operated in PLCA mode. Disabling
@@ -528,6 +555,11 @@ static int lan86xx_update_cden(struct phy_device *phydev)
  * distortion cause poor signal quality. Collision detection must be re-enabled
  * if the device is configured to operate in CSMA/CD mode.
  *
+ * LAN867X Rev.D0 has autonomous collision detection gating via CCMFC and
+ * does not toggle CDEN in the interrupt handler. CDEN remains permanently
+ * enabled in config_init(), so no software-driven CDEN toggling is needed
+ * here.
+ *
  * AN1760: https://www.microchip.com/en-us/application-notes/an1760
  * AN1699: https://www.microchip.com/en-us/application-notes/an1699
  */
@@ -542,7 +574,7 @@ static int lan86xx_plca_set_cfg(struct phy_device *phydev,
 	 * (not -1, which means "don't change").
 	 */
 	if (phydev->phy_id == PHY_ID_LAN867X_REVD0 && plca_cfg->enabled != -1) {
-		ret = lan867x_revd0_link_active_selection(phydev,
+		ret = lan867x_revd0_update_link_selection(phydev,
 							  plca_cfg->enabled);
 		if (ret)
 			return ret;
@@ -555,6 +587,12 @@ static int lan86xx_plca_set_cfg(struct phy_device *phydev,
 	if (plca_cfg->enabled != -1)
 		priv->plca_enabled = plca_cfg->enabled;
 
+	/* LAN867X Rev.D0 uses CCMFC for autonomous collision detection
+	 * gating; CDEN remains enabled and does not require software toggling.
+	 */
+	if (phydev->phy_id == PHY_ID_LAN867X_REVD0)
+		return 0;
+
 	if (plca_cfg->enabled != -1) {
 		mutex_lock(&priv->cden_lock);
 		ret = lan86xx_update_cden(phydev);
@@ -582,6 +620,20 @@ static int lan867x_revd0_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
+	/* AN1699: Configure CCMFC (Collision Counting and MAC Forwarding
+	 * Control) to OA default (0x1) so that the hardware autonomously gates
+	 * collision forwarding to the MAC based on the live PLCA_Status:
+	 * collisions are neither counted nor forwarded when PLCA_Status is OK,
+	 * and are counted/forwarded when not OK. This eliminates the need for
+	 * software-driven CDEN toggling. CDEN defaults to enabled on Rev.D0
+	 * and remains enabled.
+	 */
+	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, LAN86XX_REG_COL_DET_CTRL0,
+			     COL_DET_CTRL0_CCMFC_MASK,
+			     COL_DET_CTRL0_CCMFC_OA_DEFAULT);
+	if (ret)
+		return ret;
+
 	/* Initially the PHY will be in CSMA/CD mode by default. So it is
 	 * required to set the link always active as it doesn't support
 	 * autoneg.
@@ -712,6 +764,76 @@ static irqreturn_t lan86xx_handle_interrupt(struct phy_device *phydev)
 	return ret_irq;
 }
 
+static int lan867x_revd0_config_intr(struct phy_device *phydev)
+{
+	u16 mask = LAN86XX_STS1_PLCA_STS_CHANGED |
+		   LAN86XX_STS1_LINK_STS_CHANGED;
+	struct lan86xx_priv *priv = phydev->priv;
+	int sts1, ret;
+
+	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
+		/* Read to clear any pending status before enabling. */
+		sts1 = lan86xx_read_clear_sts1(phydev);
+		if (sts1 < 0)
+			return sts1;
+
+		/* STS1 may have cleared a pending PSTC while masked, and a
+		 * missed PSTC leaves no trace to key off, so unconditionally
+		 * resync the link-status-selection source from the current
+		 * PLCA enable state and fallback configuration.
+		 */
+		ret = lan867x_revd0_update_link_selection(phydev,
+							  priv->plca_enabled);
+		if (ret < 0)
+			return ret;
+
+		return lan86xx_set_intr_mask(phydev, mask, true);
+	}
+
+	ret = lan86xx_set_intr_mask(phydev, mask, false);
+	if (ret)
+		return ret;
+
+	/* Read to clear any pending status after disabling. */
+	ret = lan86xx_read_clear_sts1(phydev);
+	return ret < 0 ? ret : 0;
+}
+
+static irqreturn_t lan867x_revd0_handle_interrupt(struct phy_device *phydev)
+{
+	struct lan86xx_priv *priv = phydev->priv;
+	irqreturn_t ret_irq = IRQ_NONE;
+	int sts1, ret;
+
+	sts1 = lan86xx_read_clear_sts1(phydev);
+	if (sts1 < 0) {
+		phy_error(phydev);
+		return IRQ_NONE;
+	}
+
+	if (sts1 & LAN86XX_STS1_LINK_STS_CHANGED) {
+		phy_trigger_machine(phydev);
+		ret_irq = IRQ_HANDLED;
+	}
+
+	if (sts1 & LAN86XX_STS1_PLCA_STS_CHANGED) {
+		/* Re-evaluate the link-status selection when PLCA status
+		 * changes. A resulting link-status change raises
+		 * LINK_STS_CHANGED, which triggers the PHY state machine.
+		 */
+		ret = lan867x_revd0_update_link_selection(phydev,
+							  priv->plca_enabled);
+		if (ret < 0) {
+			phy_error(phydev);
+			return IRQ_NONE;
+		}
+
+		ret_irq = IRQ_HANDLED;
+	}
+
+	return ret_irq;
+}
+
 static struct phy_driver microchip_t1s_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_LAN867X_REVB1),
@@ -754,7 +876,10 @@ static struct phy_driver microchip_t1s_driver[] = {
 		.name               = "LAN867X Rev.D0",
 		.features           = PHY_BASIC_T1S_P2MP_FEATURES,
 		.probe              = lan86xx_probe,
+		.flags              = PHY_POLL_CABLE_TEST,
 		.config_init        = lan867x_revd0_config_init,
+		.config_intr        = lan867x_revd0_config_intr,
+		.handle_interrupt   = lan867x_revd0_handle_interrupt,
 		.get_plca_cfg	    = genphy_c45_plca_get_cfg,
 		.set_plca_cfg	    = lan86xx_plca_set_cfg,
 		.get_plca_status    = genphy_c45_plca_get_status,
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842883;
	b=bErXtjOXbSUORMJ6uF5dK/tRekQgcYk7mSEXCB9LdYa7WSo3nM0UK+pRWYAtakjOMtvF
	 Jq9ykqj7GCc0t+22t8i97+S0hL7yPIvJI3U4wfb3pPTYOl7HhmvDiSFqFoQFLEOdCeB7Y
	 LvRWErTBshzMecsHuRj3TfOUsyZmZdxubWTEwWvPvanENjgpgC9WxiWwXP8AyXgCY2Yyx
	 me8RpjgH8CEWo8xiY+INZ7Nw2uAPo3/se0TwQYEAHF+YAiqeT4f38Y77Lclo17xEOXWHr
	 FYf4NBrEDohm673XRX5tYa/LB3+xTBROjAZG4uYhBxg80fl+RA3KdTyJPl2UO4DvFDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842883;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=X2zRcaiqeew9WRuT3jLhUXVVNxelSHQY1xHaakVOBh8=;
	b=npzdNwmkRTYLNcUNATIGcH8g5/OK+qkEnKx9qo3/0/ko9EqShEaTLyMQx93gPnLtndIj
	 opjTYZXQw35PaIDCVCQYgSGsEPO2GWw4vAUMH4p3rCmbsGfoLiJzP7OB2IXOgJ5UvNUKF
	 fbtr2EhnaIyYPmL7JWa+hBrkkKGX0u1jZV7BWrOQILB3HW/fVs+G3U8PFKtkcrn3Hdces
	 +htxEMo1g5XjihYlUkdRfsKNaZZJXPHRu6r/XTdrWGm+FhhysOgc2gxp3jXJBjXmvdLuU
	 dmGUYLAFtsfJ23qFSV1/5aWNLpIqb7+pGFf85cRbvdfedtprSVmPoBkuultzfej8eEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eSHEwJtH;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BF8606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51BF8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eSHEwJtH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DF6EFC4EFE4;
	Mon, 16 Nov 2026 15:28:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF2326023F;
	Mon, 16 Nov 2026 15:28:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AEBB11BC0D9C;
	Mon, 16 Nov 2026 16:27:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794842880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X2zRcaiqeew9WRuT3jLhUXVVNxelSHQY1xHaakVOBh8=;
	b=eSHEwJtHq9y2drLiIr/7Tz+QrO8UyBvY3Vdt584cfdXIRdsmRacb7SnYcP0kO9hMQJbZbb
	5j0eEPr/0qgGPtZeX+o0vZd+7oTm7XXK97myxhXjsn96aevufow0b/qcO2eNzAN5WNvsbs
	wwSsC765fy7homu4+CixZdWyV0FAHYWTyc1oirnOiSGdZIqRQyQovXK2fkTvgg1BErHvua
	eZD1ETbJdnv+fCgximG9S4vFcENEZrPxr0+XtpP+EC2AG0Q1TCQaLcm+fgczNHFZpKZxwe
	YjoWXY0TyylPrlM2+BxDa98II35Rz/42WILHkV9lnp01t8ok8BII27Qm1vhUfQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 16 Nov 2026 16:27:02 +0100
Subject: [PATCH net-next v2 2/4] net: phy: marvell: de-duplicate mode
 initialization code
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-marvell-phy-rgmii-v2-2-e04dca67e89a@bootlin.com>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
In-Reply-To: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842859; l=1703;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=XLes6XAdPtm4jxeFzpSWhQV/D1VxajZSf36lMNlOnWc=;
 b=LK7/RWMI9ObTIhq8cQiRlo2Prs0lMQNvqvCmiPqWcri7JcStdpM1P7n9nGc0INXfh4DiD50g7
 PfSS/l0VnKpDwX1ezsXpRZObBDOtjqvxjYmvDV4zPZtKEs4l31ecSJY
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The code that initializes the m88e151x PHYs to use the SGMII-to-Copper
interface is duplicated, and does not restore the old page in case of an
error.

Instead, use m88e1510_config_mode().

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 drivers/net/phy/marvell.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index aef5f8279133..d2c5d3c5ce7d 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1395,30 +1395,11 @@ static int m88e1510_config_init(struct phy_device *phydev)
 		return err;
 
 	/* SGMII-to-Copper mode initialization */
-	if (phydev->interface == PHY_INTERFACE_MODE_SGMII) {
-		/* Select page 18 */
-		err = marvell_set_page(phydev, 18);
-		if (err < 0)
-			return err;
-
-		/* In reg 20, write MODE[2:0] = 0x1 (SGMII to Copper) */
-		err = phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
-				 MII_88E1510_GEN_CTRL_REG_1_MODE_MASK,
-				 MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
-		if (err < 0)
-			return err;
-
-		/* PHY reset is necessary after changing MODE[2:0] */
-		err = phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
-				   MII_88E1510_GEN_CTRL_REG_1_RESET);
-		if (err < 0)
-			return err;
+	if (phydev->interface == PHY_INTERFACE_MODE_SGMII)
+		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
+	if (err < 0)
+		return err;
 
-		/* Reset page selection */
-		err = marvell_set_page(phydev, MII_MARVELL_COPPER_PAGE);
-		if (err < 0)
-			return err;
-	}
 	err = m88e1011_set_downshift(phydev, 3);
 	if (err < 0)
 		return err;

-- 
2.56.1


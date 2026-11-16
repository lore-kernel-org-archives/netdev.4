Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794842893;
	b=Z9yJOXnzMO43cmlR7UB9WRnKKh31qzoF30byhL1lRm+u3yiVHqOr3cbOZxLT+Ku32uxC
	 zST1VcSmYfX5epJuzQaQ9lH6sekU7PsPnd9COnhEliHy//KXavcZzgxtdEV4+UTLnnZce
	 zRcOtnCZ0pEBwBaIv4Q89JoU+GKoIcZfnj5IpE+vGanElKxg5/Sodr5b70+LnSx9LMPFQ
	 SX6huqzQZHpvXgx6aFCfmROCYjVt+ddWVfWaT6J107BDPPYOnlznJunDzy8proMEXwJ/5
	 /7vOLOdCOeMtvSKJKA7NH4BFAhoHFTtVy3jdTpIqyZXY6Tlg5b3PlUmqOo1NySRddig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842893;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=SuEFiNcp59oinyTRJDhBZEloO8wBbsl1tv0A9wdn0hk=;
	b=0TuyzFF3ORrOHWS3Rk6Cgi/ipd4QasMwbNhH4SByYcbTt8K4uPxgDppcGrlwzose2YPG
	 20XL0UHeSY2aHd/3XGTdsOHn/49+tPzm3mEkQSvWnxOHgW3lnw2frSpj5uu5IjiuvWLRF
	 DHcTDMP9DcrrCRp3S3nACB+XbyZJwNFcLCktq3Img+OVkraHTp2H34byRlDTG3aJaBnCS
	 nPedz1MTe+sgv6Pzx1jvsKwA6Po5Ys0m4ROTQrODBzj0/qRzn/rBK/+UG1nvVgFJ+PlwQ
	 j2WtdDWV9CGPMd7uqnyACMFpMXPscIlNQFA8swJVBbADhklGJT6j8Ex1pIpPe7loaeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SxnHZqRE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D13606A88A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D13606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SxnHZqRE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36F0FC4EFE5;
	Mon, 16 Nov 2026 15:28:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 390646023F;
	Mon, 16 Nov 2026 15:28:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B635011BC0D9C;
	Mon, 16 Nov 2026 16:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794842890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SuEFiNcp59oinyTRJDhBZEloO8wBbsl1tv0A9wdn0hk=;
	b=SxnHZqREMCZsroeL2ATb30HVSCsLvFHOounjpAaemoFnmzUsReQoWEFli3tkfiDS5xG2QR
	RpYvl0NygBvF2TfPV/v9drFTyqDHASEHFpagVRLLeS7PSWuwNXqqz9FaedxAZABwdkfnJ1
	NPtriiZLD2xCbvnBVuMCRimm80PrkZiJg7+nLgBiy1G3BHPyPL1ypmKe+0khDL9IWKQGu3
	pM4S+sP4Tum97t5zFHQxWSM9mR5fY+q7CkpgPIQcPmgRdzky1k5xpcRbgAPIXh8X7BGIry
	nc7cBjnXSMUKm0467jlQU9Ot7YhJtoyBp5iFZUbL3irOM4NTVm45JsKAs1HnoQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Mon, 16 Nov 2026 16:27:04 +0100
Subject: [PATCH net-next v2 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
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
Message-Id: <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794842859; l=1938;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=2l5oMzXH+scX08Gvc0D3OEJ8LMAGR2j8N4VB8pOdCEo=;
 b=42GjufwWYJT5s0O7wuP9zKe8TQQN1h7ZI/CLJbxUgSc8PkzdPSTLKmu5Gp8nsKJOCNkeCQ6ql
 iywfNEwj4f4A0cc9vFtHYZor8KX9hlCfvUwoPI3HPYIPFNPMAzyAQ82
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The driver currently programs the mode only for SGMII-to-Copper, based
on the PHY interface mode.

Some MACs connect to the PHY via RGMII. Add code in
m88e1510_config_init() to configure the device.

Do not overwrite the media interface mode configured via
m88e1510_port_configure_serdes().

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 drivers/net/phy/marvell.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index a72d307eaf12..9748fdd843ff 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1341,6 +1341,23 @@ static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
 	if (oldpage < 0)
 		goto error;
 
+	ret = __phy_read(phydev, MII_88E1510_GEN_CTRL_REG_1);
+	if (ret < 0)
+		goto error;
+
+	if (mode == MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII) {
+		switch (FIELD_GET(MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, ret)) {
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII:
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X:
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX:
+		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII:
+			ret = 0;
+			goto error;
+		default:
+			break;
+		}
+	}
+
 	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
 			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
 	if (ret < 0)
@@ -1403,9 +1420,11 @@ static int m88e1510_config_init(struct phy_device *phydev)
 	if (err < 0)
 		return err;
 
-	/* SGMII-to-Copper mode initialization */
+	/* RGMII/SGMII-to-Copper mode initialization */
 	if (phydev->interface == PHY_INTERFACE_MODE_SGMII)
 		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
+	else if (phy_interface_is_rgmii(phydev))
+		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
 	if (err < 0)
 		return err;
 

-- 
2.56.1


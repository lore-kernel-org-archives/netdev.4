Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194377;
	b=j+C+sIy/oMO6XVbpUGuJlbH/0e8sSIcd6UM8NcVRKWqS4VfGiaw4RTUkZxAGwcZZH9CO
	 dyz9pgVtBJautNlkGu8mGsEJyWd1YpIL5q0x+bRSexv4jTiMzowXfebgMOnhwDLACSGDn
	 Nh6UOuTpco9LWmp0aGB81LRYrlQEAAYxRitejEPdx9AFqN/hrSjFzurrpBncpmLe+E2Cj
	 U9ADT4mVSXielFHfOfzMUQPDOQcFbWNpQVinS/9JH7p92JHJAdik0325XfjsRyLgKLWin
	 fiZWQIrk0zBYPU/nv3SPmdGdG6HzpVquBDTaTAUb1Xwf2LomrOVv/UOiPnBUH2rYeKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194377;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=QJIuaIcUlFwgPAeIW7modytfqqgvYicvIdLEq0gxUOI=;
	b=Q04ciX4s7KjRcxvN+UwriuApL9LB2CeZf2CHcZrkkvrjPBf1xs69RYcLAlQOljwFBJYf
	 c8VTvl3Qmf2qCOzl00YLdZCGf6edUo3Ppd5nbrfDKCTRXE4fjzKNO0/PW/htUWmflOZa6
	 x5G9BdTRTtj+o+7IrS30oBWSzEP9Nylr59ZCYBXpbKZbcRAGzqZyTUzl/mNW/pgwt+3pZ
	 ykBriIrl9l4I7AX8o5VH1ZgmNSLOptj6ai1hVp3jGyciaQ0uk194466QmlatCVuLDDj9/
	 d1fbF78G2rfvIXDY4gf7V5/1VeRn5ofgDM0aTU7mQEnV8hxZ14P+jBGoEvMq2UQD9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gyPTsj4h;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B860A2607;
	Fri, 20 Nov 2026 17:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 086B860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gyPTsj4h
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51BE0C62220;
	Fri, 20 Nov 2026 17:06:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C2D7601B9;
	Fri, 20 Nov 2026 17:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9ED611BC0451;
	Fri, 20 Nov 2026 18:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QJIuaIcUlFwgPAeIW7modytfqqgvYicvIdLEq0gxUOI=;
	b=gyPTsj4hvzYCe2KqNMULXqvqRVSK7isQo3efJ4NOXx9BVA/+qWSjmwY/6ilw7N9ApcFh4X
	s4iGFYPBO2CI9r5la42+PSIMHB06wUELNvFmqMXxTSWzG9oX/FuXFZUcjWBz+52LnBlO2Y
	6rBPQv9WsonNpWyIvmw7xy5AEVBzVJvrdL1UCRkGJ7O+XqOwhAF4gK/Z/oypOlwlOkidYr
	9cnAx9E91oLmYI/ZixFm7yO0MlmW0AV01/FLv0Uvp9C2OhiGCkPFEAN8K8/8F569IkmYcP
	zw7Pmp0pwmAcOtMnr5RFFhzn8/LexNYZ4kM0DZxvGGmLVfgcu9WAz4KuOuDl0g==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 20 Nov 2026 18:05:40 +0100
Subject: [PATCH net-next v3 1/4] net: phy: marvell: move mode configuration
 into standalone function
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
Message-Id: <20261120-marvell-phy-rgmii-v3-1-c11c99798931@bootlin.com>
References: <20261120-marvell-phy-rgmii-v3-0-c11c99798931@bootlin.com>
In-Reply-To: <20261120-marvell-phy-rgmii-v3-0-c11c99798931@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795194355; l=2276;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=S/EPP6sZZNaqrtpamex70kriwjBRU6Tl+kovNADKUlo=;
 b=IxCB5Lj2JF6cc7hFtFyzbZsFckVgZGpAvdT0snwVIL3z5XAGf/ecBckr6yA8x4c2wspvmRsFh
 /4h/eFrwrfbC79TPQRQrXA3ROaKVqB4SNseDbm5LyHlmFbLbhSfOyu5
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Move the configuration of the m88e151x out of the
m88e1510_port_configure_serdes() function, so that other parts of the
driver can use it.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/marvell.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 2c688d661297..aef5f8279133 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1332,6 +1332,27 @@ static int m88e1318_config_init(struct phy_device *phydev)
 	return marvell_config_init(phydev);
 }
 
+static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
+{
+	int oldpage;
+	int ret = 0;
+
+	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
+	if (oldpage < 0)
+		goto error;
+
+	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
+			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
+	if (ret < 0)
+		goto error;
+
+	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
+			     MII_88E1510_GEN_CTRL_REG_1_RESET);
+
+error:
+	return phy_restore_page(phydev, oldpage, ret);
+}
+
 static int m88e1510_config_init(struct phy_device *phydev)
 {
 	static const struct {
@@ -3656,8 +3677,6 @@ static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
 {
 	struct phy_device *phydev = port_phydev(port);
 	struct device *dev;
-	int oldpage;
-	int ret = 0;
 	u16 mode;
 
 	dev = &phydev->mdio.dev;
@@ -3685,20 +3704,7 @@ static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
 		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
 	}
 
-	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
-	if (oldpage < 0)
-		goto error;
-
-	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
-	if (ret < 0)
-		goto error;
-
-	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
-			     MII_88E1510_GEN_CTRL_REG_1_RESET);
-
-error:
-	return phy_restore_page(phydev, oldpage, ret);
+	return m88e1510_config_mode(phydev, mode);
 }
 
 static const struct phy_port_ops m88e1510_serdes_port_ops = {

-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194384;
	b=l/wjXdu764Ask5lHknP8qZ2WS3mkmUHnDvDmORsIw9X8tkWlDto1ppi+YpkJoSpRSH06
	 e7X8EBTbQz1NVJeyWWt2pUtaA4oaRTiEzajzYvY6OhEmsjKiKZFm8Qhgaw6mVbfyr8nVe
	 quRIRRb0fwBoQ5I/81/2Z1HGN1yfQdXPGxq3EwV9GRyx0/Let7PuIhK052+1kH4xLEV5L
	 LEqSdBFPsrlFaz7deZ9ImxzXOSPL5+cxJNSh3sOd9nbvKtz4GvjV9pMKIezeJVcGxqr5A
	 Am+G5NRklTPaSokiW5I0JdpBFGmJP+t7wIUyzknqzN2gZOSQQuKANbtJkOE8cECCTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194384;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=88Z0374Lt2alIz3ZcQJkyoQLx+1t3NWm08uvRzUsAtY=;
	b=jJGBnc0nLJ89jdshLjQ8+0SnSqqrEBOLqVn9euL+HNB7g6/3YSmcNt1LmdzRQonxJ2xT
	 AxMeNz9oBW1mJLpZ9V0QTDfiydg0goTCjy2aVmolvnj+4XHQSCCOZzFzR8S1R7xhorySR
	 Ab1L/e0aSLSx8Pw4JZ2zej3FmXDxQG3vAVKcmrU6y179ITrppB+pPBc+JL4ElziqT3DHr
	 DMmuM8XfhGXJ0j2LMgIhvB6g+YlBSME/LLI0B/xRBx7qYxt4guaJUaIOEIUBGaJpyALm3
	 EiZJAMXEGXoICkyzoKYbnEqASxSvw0ZFKuMLWeESB90CvSi01SQ6gMFBCn+YLm8uSTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vwLEOyfp;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719E606A337;
	Fri, 20 Nov 2026 17:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8719E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vwLEOyfp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 11AE94E4168D;
	Fri, 20 Nov 2026 17:06:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC251601B9;
	Fri, 20 Nov 2026 17:06:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A58A11BC0437;
	Fri, 20 Nov 2026 18:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194374; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=88Z0374Lt2alIz3ZcQJkyoQLx+1t3NWm08uvRzUsAtY=;
	b=vwLEOyfpLO9Ca7QxQTqhquYPYvEkCwAVtJdXKMkMHArhMXCz1NKzivHf0C3Ewz8dRV/ca0
	qw05SDZssRwPF18Ko1ClM/JdXQG1voJDaheGbvn0SotvBUzcQ8x3qPn25mt6M11bklSTIb
	VwXu3uV/aRgUG6cYhwrftaSsN3ZN07rTfLQ1zQUartEJgAW6dmHDfUcVEnP1RFDp1D7lXA
	PDRyMM9yTIMEuTAy7W8Jj5YY2tLzPPzsrabN6k7kUKBnQfN7msRwFW/GEnGHSppG6yAVY1
	p2J7z2dp0nUDhbVVI0n/MSynxKsTWrX0XsiOBLDzcWDdFDq5eQlBu6Is2fqiZw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 20 Nov 2026 18:05:41 +0100
Subject: [PATCH net-next v3 2/4] net: phy: marvell: de-duplicate mode
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
Message-Id: <20261120-marvell-phy-rgmii-v3-2-c11c99798931@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795194355; l=1746;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=/TfgdozyrplhMeS6osv5q4kAQfGtNopB3oowLZUM3Ow=;
 b=VcR5CuEUFH057BSyIL7lTbpGN6SHM4CGoZqa6XPHUvhs8wl21XWAzx0+hBv8d/q5M1LmvFY22
 ZfQiIjf2ONuBWBPL1j38ElDn38f0XXzIuLTtAowgRKu4z0YXTsh3hOX
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The code that initializes the m88e151x PHYs to use the SGMII-to-Copper
interface is duplicated, and does not restore the old page in case of an
error.

Instead, use m88e1510_config_mode().

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


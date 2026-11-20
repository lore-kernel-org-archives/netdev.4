Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194386;
	b=ktCn+1qNuOliRSOV6ySQYBqYeWr8qF1cEkuT+3oyN+yKRhiAbYFAKs3ev8kOkR4+w92i
	 C6LstJmnwEpeEEe9SNoRv/3Ft/NFb0lVXDayCNPT39xpeHVOdOxsSdSyI9D8uFivhJ5vN
	 6OGEDDkFwoCpXWrAiHVI0a+iJGceVqexYNRP05aI8Vhy7U4sLxk2ySrYq5mtevovcOEWW
	 c4HYfJUTp3kC8ThCfkLO9Pq6+l6cghn5XXUlEhTHehVoHaTBsvZK78ckzBePtTuxkwE63
	 a9GIkh/a7ogFpIHwDF/SqnkcNOVA2pRFilvQk+6CC9LUWieFYXranUbKrMXhSGjXasg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194386;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=wvJ5wx0ljZWn2Uan8bUWeEgSu9LOhTAyonr4w5yvZmI=;
	b=Pw7c3zCxfWoGNF21lChiCp8UMqDydD4QtsBEbCgghqczrUljxkv2Hk4titsedC+tDTxL
	 mDlp2YpPJWHLlXZ/WyeN91vTH19QNSjnlD4/iiJoeAIBae6PbfFFHpPMcdrQ1yPFutmbC
	 fJ+kVzXRmr/EUWcO9u0rk1fsVRn+wNpfZvqDSH9mp38IFPXZdOof0vv63LhdqKjLEd3gJ
	 0bgEd6a/iiIDn2tmUSW/tQmGdnamHbN3zVGtIg+v1ZKNfe0EnKSlySjhxe39lGI/63sRA
	 JB1dYAFNLCEWLjMIh+LM/GxndVCxQEl72UUBYyHOuuCdETtOArz7LtfSanpG5sYWWEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="N19O9/Mg";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AD560A260F;
	Fri, 20 Nov 2026 17:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51AD560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N19O9/Mg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C7D11A16F7;
	Fri, 20 Nov 2026 17:06:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E00F0601B9;
	Fri, 20 Nov 2026 17:06:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C72A11BC04EB;
	Fri, 20 Nov 2026 18:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wvJ5wx0ljZWn2Uan8bUWeEgSu9LOhTAyonr4w5yvZmI=;
	b=N19O9/Mg6eD7VkyHnxwn07P1vlENAshr6S9bm4pmHLYNa5ltIRyuvKsyU22/fyamkorv2s
	f18OW9I0NSA+u1UZBeQu3ti350mWLybgsMzLgWy69vM4g8xmuVCUz89K6v6rHq5iZFLZMc
	M/DZ/5AkuMekP0xbOsOJVY3/7qYzwfnp+NyYhgWYQE2HAGewiC6Zbx+GmrJXcI6cOXdEsz
	ZljFXsvmvipB30A1UZoFNzEb0NjUQSd2Yx8i9k0NmL1Rf1KJOhSMqm321m6dQ1HR9+7y6x
	oZGzgcQRVn4MCkJP8ArEp3GvrHHVRSDL7th7Y9Bw0Nnt7pOPhska/iHLsFPJbw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 20 Nov 2026 18:05:42 +0100
Subject: [PATCH net-next v3 3/4] net: phy: marvell: factor out EEE errata
 initialization
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
Message-Id: <20261120-marvell-phy-rgmii-v3-3-c11c99798931@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795194355; l=2688;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=R4GzB53g3YjsQvLLpFPjr+Fj/lbjT3L1d9PSUc6EOjA=;
 b=USKReQ4WSfHc6B4FLKJOge29iA+sD3KzX0tsZZzDIDhYYXQBd8XM6Ji9Q54QNYDqRZySG0hl6
 r1aqxVmVEF8BwVLMfBX3LEYDhEjJAL0vrjBri/q+m7Ijh38N09d9+zR
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The 88E151x EEE errata sequence writes four register pairs on page 0xFF.
Using phy_write() for each access takes and releases the MDIO bus lock
every time, and returning early on error leaves the PHY on the errata
page.

Move the sequence into m88e1510_eee_errata() and use phy_select_page()
and phy_restore_page().
This reduces the number of bus lock/unlock cycles and restores the
previous page if one of the errata writes fails.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/marvell.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index d2c5d3c5ce7d..a72d307eaf12 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1353,7 +1353,7 @@ static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
 	return phy_restore_page(phydev, oldpage, ret);
 }
 
-static int m88e1510_config_init(struct phy_device *phydev)
+static int m88e1510_eee_errata(struct phy_device *phydev)
 {
 	static const struct {
 		u16 reg17, reg16;
@@ -1363,31 +1363,40 @@ static int m88e1510_config_init(struct phy_device *phydev)
 		{ 0xb233, 0x214d },
 		{ 0xcc0c, 0x2159 },
 	};
-	int err;
-	int i;
+	int i, oldpage, ret = 0;
 
 	/* As per Marvell Release Notes - Alaska 88E1510/88E1518/88E1512/
 	 * 88E1514 Rev A0, Errata Section 5.1:
 	 * If EEE is intended to be used, the following register writes
 	 * must be done once after every hardware reset.
 	 */
-	err = marvell_set_page(phydev, 0x00FF);
-	if (err < 0)
-		return err;
+	oldpage = phy_select_page(phydev, 0x00FF);
+	if (oldpage < 0)
+		goto restore;
 
 	for (i = 0; i < ARRAY_SIZE(errata_vals); ++i) {
-		err = phy_write(phydev, 17, errata_vals[i].reg17);
-		if (err)
-			return err;
-		err = phy_write(phydev, 16, errata_vals[i].reg16);
-		if (err)
-			return err;
+		ret = __phy_write(phydev, 17, errata_vals[i].reg17);
+		if (ret)
+			goto restore;
+
+		ret = __phy_write(phydev, 16, errata_vals[i].reg16);
+		if (ret)
+			goto restore;
 	}
 
-	err = marvell_set_page(phydev, 0x00FB);
-	if (err < 0)
-		return err;
-	err = phy_write(phydev, 07, 0xC00D);
+restore:
+	ret = phy_restore_page(phydev, oldpage, ret);
+	if (ret < 0)
+		return ret;
+
+	return phy_write_paged(phydev, 0x00FB, 07, 0xC00D);
+}
+
+static int m88e1510_config_init(struct phy_device *phydev)
+{
+	int err;
+
+	err = m88e1510_eee_errata(phydev);
 	if (err < 0)
 		return err;
 	err = marvell_set_page(phydev, MII_MARVELL_COPPER_PAGE);

-- 
2.56.1


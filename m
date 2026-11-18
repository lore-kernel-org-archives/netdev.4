Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014480;
	b=24cSvK9v8DxJvIx3J2eh4aZ59V1Xa18sRc0meDpd8nSJPNaza3UufGs6asIEn1yXLM2i
	 JrG7jPghT9bmsR6Lg+tuQCxJConS9TaTQytQhQZOvN7uGDgB9vYdRn/2p3e58+AHu0d//
	 gZcC0NFpB5VvSvOG0IXCszEIQyXyAXCVwT4hh8epklTze8dpyd+dSD734D3x77TdwXWGQ
	 /ShJoKvHLMGavICcw6cPw+B9mwxdJDs7w60iFT+X3VLrVeyrGhSwH7328btasaQnMxSxR
	 hzto1rSCtcFtMlzD4k9ZHjuFcAVZqFgOZxp/rLP4lqC8E3X91xjBYgunCyaskAPaIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KOAjgx6Zer7vIvv4MB7qnnpefygiP8K8bu1p1D5WY1s=;
	b=qgoX18X1xnY3u8Cy+fE6HswiD1uht9HCYSd+7ccrGcor2wEnZvXY494B4bLo3QfsMKFM
	 2zFpyf5soVGjtgA5IShW713khdjIxKvzbxLgrUrkqEHUA1eWfOld2c8crmG0Bm5fYTcN2
	 IAtmb2siGiu5VVXjKZ37Tmm9U/k2D60V0A4ljc0Ilsd5V1MI9YCh/3rUuFdYgIP5IUQpZ
	 9T400DfW7eunrWeciOv9JGkyjE+479YidhnpHxsRP31hsrA5uib/3KTUR00pUZp4vmKj6
	 SXR/gvFzZJTen39xW079RbzGFePvFhNaJvqisnQ4NRWWeCb+oJ48NMV7NzIdCM4qJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MywSp9/M";
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB3606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MywSp9/M
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adfed9a887so12027531fa.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014478; x=1795619278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KOAjgx6Zer7vIvv4MB7qnnpefygiP8K8bu1p1D5WY1s=;
        b=MywSp9/Mu/NivggbV4jAQ5W8/LXE0Ed8J53gf4pnkttSPOLxuM78HZzLgCGMwkHe3R
         xgZHV1t/NOhWTH4CSOwf3J2m4bznULlYw1uO3XRaE9ksMH0/bZedatN9G4tjwq0xUAx+
         PpeaTgrCx30rOXCTNiZ/cqDOvc9YhFLLdr8QMQnV5cKwt2qFfMx770cSVahuJJXrUKDi
         QXGXkwljhfBEQHErIYgGky1wxqJzmooYhedu2LR46oCkFPtFsLZLlOYclgtzTt2JDtdy
         JIWR88mo9/znTAjmaevBS3cx6nEBpMsGVE4jWDaqMV9Oec71NhNag5Hs0ej1l9YrrQ4M
         HbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014478; x=1795619278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOAjgx6Zer7vIvv4MB7qnnpefygiP8K8bu1p1D5WY1s=;
        b=AkVWpP7BuHX9btAIGShrOSMdsA9mG+BEZ4oDx4HCpMcV6Z3owQhEbVF9pEhFTiygZ+
         koKTlDnDdcVvyoQK+gMpVgi1S6lqKnRMVp6WKACs8OXxJfXwQbn8BbbeqrxYVT+96Fl2
         r6XU5aSv7aoBgiVVHLbZJe7YxnnCE72GiaNSHICQGSG8i2AkhBM1FfXRrZPyUciI52zY
         9G9lVb+q65uBcoj04QCo3qn58CHl1FX6/+8O03JMw4lLAEht7SW0kvTYgiKXPDNuGu6p
         JAn5l1UIyqGAJ9vlXyXcMg80FEMmSXKbQdmfuQuHCH9wkhz48KTSKyHZlrz2qvTQzVzC
         LUHg==
X-Gm-Message-State: APuU4Z9L+q8SDeU4OHrp8JsmplcDLA3Y1phTyJ64OAGZB9Gn77XcwIxD
	y4fLzl99pEYKCUdwPALmI8pUqiBBVxT27ImjECpX232vf+SB6+iyHmwT/T9hwiMu
X-Gm-Gg: AYBFou1mWZN3sVSRyEGAC0j0ULaCe4VVfpiVNEJEfCw5engg2129NJopfqOzP5bbX/N
	u7gc9c9puc66fSRqKVUHpbviLntNk/HFy/piZMiqoNxlFDIZNCHpOBY9TUGJHA8eJYMa/GINaWF
	DOQ0OUIBhni62nwiuMrzA9vxAMQzr8lJXsFq6flpSziCdWwdUmumhlameyTJGpRZVxufkxodbnn
	Pqqb95IqjTzguDFBNVLcdWj7HoxjUH3hfeEwZ1hobkNkjbmRiM5mfuEH1fcBm+25Z+1eIboZcfv
	fQ0pU2Bb/liY//3uboh4LXlAlL3xQ1uid/FluhUpeuHLAntTkdFA9C1QSgUkICcIz/1pinB7KQR
	ewdxTj9mgL+ZX9lFsaCd68uBoumMbvQLAZzVrl42P3SP8DIIr1pTg0wFfUUICac6aPHMITs6WVc
	oxWhcJJqrIBvdnJ+ynDxNhQnH4pMeltOzm9iQYfOOmr0H9VGiMsmPY1PGSPIQLBbaNdBNO9SNGt
	hFLyno6dSoFufSHXGxW0IicorjyeQCgCWY6U5lmEd3bQ056BBJSvgpYOjaKdMZmUrnAnEkCZmNl
	BhKTS8PXOkDbgkWN3QUDJMjucELwijLes5bPd2C15GHFz0oc/Qn7kV1vItZWnTK9HqRwQ90rpOQ
	HuWJVy0Y=
X-Received: by 2002:a05:651c:a18e:b0:3a9:a2fd:5931 with SMTP id 38308e7fff4ca-3ae670b66eamr11800721fa.6.1795014477838;
        Wed, 18 Nov 2026 07:07:57 -0800 (PST)
Received: from DESKTOP-93012OO.tail8ac4f7.ts.net ([83.245.241.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6eb98beasm420771fa.18.2026.11.18.07.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:07:56 -0800 (PST)
From: Elias Pukari <elias.pukari@gmail.com>
To: netdev@vger.kernel.org
Cc: Elias Pukari <elias.pukari@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: phy: et1011c: don't write an error code to the config register
Date: Wed, 18 Nov 2026 17:07:18 +0200
Message-ID: <20261118150718.16924-1-elias.pukari@gmail.com>
X-Mailer: git-send-email 2.56.1
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

et1011c_read_status() can write a read error to the config register.
Return MDIO errors and cache each PHY's speed only after configuration
succeeds.

LLM helped

Found by code inspection. Tested with MDIO error injection in KUnit
under QEMU/KASAN. No hardware or kselftest run.

Signed-off-by: Elias Pukari <elias.pukari@gmail.com>
---
Full builds unverified due to warnings on the unpatched base.
https://lore.kernel.org/netdev/20261115180735.649299-1-elias.pukari@gmail.com/

 drivers/net/phy/et1011c.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/et1011c.c b/drivers/net/phy/et1011c.c
index 6cd8d7758..77a6e8dcf 100644
--- a/drivers/net/phy/et1011c.c
+++ b/drivers/net/phy/et1011c.c
@@ -44,6 +44,12 @@ MODULE_DESCRIPTION("LSI ET1011C PHY driver");
 MODULE_AUTHOR("Chaithrika U S");
 MODULE_LICENSE("GPL");
 
+static int et1011c_probe(struct phy_device *phydev)
+{
+	phydev->priv = devm_kzalloc_obj(&phydev->mdio.dev, int);
+	return phydev->priv ? 0 : -ENOMEM;
+}
+
 static int et1011c_config_aneg(struct phy_device *phydev)
 {
 	int ctl = phy_read(phydev, MII_BMCR);
@@ -60,25 +66,33 @@ static int et1011c_config_aneg(struct phy_device *phydev)
 
 static int et1011c_read_status(struct phy_device *phydev)
 {
-	static int speed;
+	int *configured_speed = phydev->priv;
+	bool was_up = phydev->link;
+	int val;
 	int ret;
-	u32 val;
 
 	ret = genphy_read_status(phydev);
+	if (ret < 0 || !phydev->link) {
+		*configured_speed = SPEED_UNKNOWN;
+		return ret;
+	}
 
-	if (speed != phydev->speed) {
-		speed = phydev->speed;
+	if (!was_up || *configured_speed <= 0 ||
+	    *configured_speed != phydev->speed) {
+		*configured_speed = SPEED_UNKNOWN;
 		val = phy_read(phydev, ET1011C_STATUS_REG);
+		if (val < 0)
+			return val;
+
 		if ((val & ET1011C_SPEED_MASK) ==
 					ET1011C_GIGABIT_SPEED) {
-			val = phy_read(phydev, ET1011C_CONFIG_REG);
-			val &= ~ET1011C_TX_FIFO_MASK;
-			phy_write(phydev, ET1011C_CONFIG_REG, val |
-					  ET1011C_GMII_INTERFACE |
-					  ET1011C_SYS_CLK_EN |
-					  ET1011C_TX_FIFO_DEPTH_16);
-
+			ret = phy_modify(phydev, ET1011C_CONFIG_REG,
+					 ET1011C_TX_FIFO_MASK, ET1011C_GMII_INTERFACE |
+					 ET1011C_SYS_CLK_EN | ET1011C_TX_FIFO_DEPTH_16);
+			if (ret < 0)
+				return ret;
 		}
+		*configured_speed = phydev->speed;
 	}
 	return ret;
 }
@@ -88,6 +102,7 @@ static struct phy_driver et1011c_driver[] = { {
 	.name		= "ET1011C",
 	.phy_id_mask	= 0xfffffff0,
 	/* PHY_GBIT_FEATURES */
+	.probe		= et1011c_probe,
 	.config_aneg	= et1011c_config_aneg,
 	.read_status	= et1011c_read_status,
 } };

base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc

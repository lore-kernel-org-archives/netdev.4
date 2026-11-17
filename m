Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958347;
	b=gI9wXGEoNg3vqaUXIqEWyyidRvE4LjT0oihiUnjfp4vrxhJ7/rlaEbvxKrEAiqTdnSvx
	 3k/JWPl2KisctPRlktdbuKaHNcbKUsfVdO309iR5M0GoGls9B64fkSh61cVZ2dm+rjgV3
	 VxoaBUSdthV2zHzSpM8ZAjeQdQ9GloegQ/4z9ItNxdalMGLuqn+xcZfZvsZGrZb0cF3fN
	 DNPHkCivJFcT/GXY5F947vtQw1ancyARmmOENumkhu2ENqjXt2SnlflCZ9COf73Jk0GBz
	 i4D5/UqGPNAiLJZ2tmrLkSFp05E17CbuIczRh2a7sI8mqGXKa2A9DH6bPLBNnYZyQ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958347;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=irYW2PXjJC3vF0xtw/jmSzMUmlGyGZhEP21uDR4SBTU=;
	b=kY9sIsAbNXXiItz6TKnlxjjwuoQIPGl8VItQLyACre2erVm3IC88PjcO8DZyt7xGnJT8
	 IYFg5/e7JcmSqPuEQKgQTsO7WEVADnoHyU2dcpxxU29et9tdwS6XWz3+1gSZD5qZaxXTZ
	 R6ppnLHHO/xt4D4hqGObZrl2KL+bb5tNFII1lbV4KC0wSEFS7vz5bW9h0lB9QwL0/7cDX
	 IrkemwcS2cKXx9OJRdDHmkPU1rCfNP4WFOkcXdhFmQHte1sDLG58jsm6D5uaJqVY4YHXN
	 yspAV5VCjq1dSG9Tzizb7tlLpZmzoCA/Q3EHZMgA0MnmS++xFb4H4cnYFkPLk6km1CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QmRlkOrh;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D180C606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D180C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QmRlkOrh
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso261456a12.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958346; x=1795563146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irYW2PXjJC3vF0xtw/jmSzMUmlGyGZhEP21uDR4SBTU=;
        b=0AEzJlY0oiPcF+j7FLDMWFyFWLP16uC0dW5FWBVHrfIE0sc4AjSyRwMenH9azl3hBH
         C02yVV/9KTnhkTpBGYLGiCYgzwvkKF+8igfTxgZSLeMFg1GSoJX7W60MNUVFqZ3gK63S
         ONrLBVx8qlnkEa/n1VILpOc3c8L0aOHT016JVeGeBUInI3Pz1AjCmPRBOZimaRAGIanj
         vtrpqRLc4FsRh3o1Y7VCnHqWyjOEAhUGtfKmmz7xqu6eEs71u8I/16mcLCbz3/0rnm2s
         NE76qLsxMixTb9UgB4fNpc/vw0DwOLlwnFC+nZhW6CttPZTnhbMYL2HgxPxdZpXpf2ax
         iZyQ==
X-Gm-Message-State: APuU4Z8DCnOEPOL1p9I/QDowBiHxB7xT6v2jinlvhjP0r9OC+dSLysOg
	m/iSas/1TGFVECoLWbEHpqKOTaze5bCUHC8JnyTj5BR6o2azR2aq/Vz5InDRsFWTsN1L2leuTU4
	bAJ0F9Bsr4tU0aK4K5eRPrxnLc583YALNadqkBkoSiK9/biaLDJsklGXhinUxGWz+JVf/ovQklm
	39dBwXEzCMbBTvgE3LkvPOxLw25GpZSCfC95qenmcSLhOSuqQfEUzw0dHXieRhoNRgneCRZ5EL1
	L8Mdom5+95lQmG2
X-Gm-Gg: AZFdTZduQw2VYHrWJT6eYXt8tTS2HbAH4h4+gaKgNj+uSAjxf1jmNR5wlaGJ9buVtGA
	DUKuLoXO68gHkWcjYDMWqRR8KHRM2UtrvSQQUKSXVf3JTtPhZmswTFmZHDfrSCMf+uvU4yhsZaP
	eeDbfZoY/pOZCk8TjNSKgtG5iwXQZYJ2da0eLPYSQHxeaevSMYwyYdPOgDY0VHBnn6cMRbZvqXH
	dBzESxKLfblgJ0bLtsjabPX5py/bvFlW/+FAVqlNuTCLwBSuaE4JdUh9HUvRQ/WHe831L1Kotf9
	mZ0Np4v31NKmSH/WshwyMJyktL9D5RKwP4aJ029/AsEy0IiL7/5+P8jSxWYEI23aCOeVvPvBEIG
	J3OiSyXGAPU6QeBB30++zmFa4fFp0uoI+d7OIj0IXb3Aq30gJGA3sCQP6L3adcT/He1BoFQ+fWh
	G87lrrHWliXDvZ8M84GQ6sbo/w7ChFscJ3i7HJhCdqTm0=
X-Received: by 2002:a17:90b:3f0b:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b3d0641fd8mr964183a91.3.1794958346335;
        Tue, 17 Nov 2026 15:32:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84fe8sm2888307a91.2.2026.11.17.15.32.25
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:32:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso354790c88.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958344; x=1795563144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irYW2PXjJC3vF0xtw/jmSzMUmlGyGZhEP21uDR4SBTU=;
        b=QmRlkOrhg1ipkH0RXFT1hCv1w1+maaHXhlzUjb0jwivNAQate0PayzNLm+4UUAjVY+
         p+Ca9p1v16LBkZwtZK2lyvxomfp8qvfVo6BD2fshaq3Udpeywi+XvK6/dUv9bCsLHuYY
         eH07dF7/0B8K9O3maNHgG5mCPSAOlxEgOrR64=
X-Received: by 2002:a05:7022:ea4d:b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b543d0270bmr793629c88.29.1794958343893;
        Tue, 17 Nov 2026 15:32:23 -0800 (PST)
X-Received: by 2002:a05:7022:ea4d:b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b543d0270bmr793596c88.29.1794958343048;
        Tue, 17 Nov 2026 15:32:23 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:22 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v3 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Tue, 17 Nov 2026 15:31:49 -0800
Message-Id: <20261117233149.1693881-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add Clause 45 read/write support to the UniMAC MDIO bus controller driver
by implementing the read_c45/write_c45 bus callbacks. Each access performs
the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) under
the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
MDIO_CFG is only written when the mode actually changes.

Also skip the BMSR workaround read in unimac_mdio_reset() for children
compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
expected to respond to C22 accesses.

Note that providing read_c45/write_c45 also makes the MDIO core scan for
C45 PHYs at registration time, on addresses that are not masked and do not
already have a C22 device.

Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 125 +++++++++++++++++++++++++++--
 1 file changed, 117 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index df267bb82696..ec0f2e8070ee 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -24,10 +24,16 @@
 #define  MDIO_OP_SHIFT		26
 #define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
 #define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
+#define  MDIO_ADDR_C45		(0 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C45		(1 << MDIO_OP_SHIFT)
+#define  MDIO_RD_C45		(3 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
 #define  MDIO_REG_MASK		0x1F
+#define  MDIO_DEVAD_SHIFT	16
+#define  MDIO_DEVAD_MASK	GENMASK(20, 16)
+#define  MDIO_C45_REG_MASK	GENMASK(15, 0)
 
 #define MDIO_CFG		0x04
 #define  MDIO_C22		(1 << 0)
@@ -96,7 +102,53 @@ static int unimac_mdio_poll(void *wait_func_data)
 					MDIO_CMD);
 }
 
-static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+static u32 unimac_mdio_c45_devad(int devad)
+{
+	return ((u32)devad << MDIO_DEVAD_SHIFT) & MDIO_DEVAD_MASK;
+}
+
+static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
+				int phy_id, int devad, int reg)
+{
+	u32 cmd;
+	int ret;
+
+	/* Prepare the addr c45 operation */
+	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
+	unimac_mdio_writel(priv, cmd, MDIO_CMD);
+
+	/* Start MDIO transaction */
+	unimac_mdio_start(priv);
+
+	ret = priv->wait_func(priv->wait_func_data);
+	if (ret)
+		return ret;
+
+	/* Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0
+	 * even when they timed out with the controller still busy. The data
+	 * cycle must not be started before the ADDR cycle has completed, so
+	 * make sure the controller is idle.
+	 */
+	return unimac_mdio_poll(priv);
+}
+
+static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool is_c45)
+{
+	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
+	u32 new_cfg = cfg;
+
+	if (is_c45)
+		new_cfg &= ~MDIO_C22;
+	else
+		new_cfg |= MDIO_C22;
+
+	if (new_cfg != cfg)
+		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
+}
+
+static int unimac_mdio_do_read(struct mii_bus *bus, int phy_id, int devad,
+			       int reg, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	int ret;
@@ -107,8 +159,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
-		(reg << MDIO_REG_SHIFT);
+	unimac_mdio_set_clause(priv, is_c45);
+	if (is_c45) {
+		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
+		if (ret)
+			goto out;
+
+		cmd = MDIO_RD_C45 | (phy_id << MDIO_PMD_SHIFT) |
+			unimac_mdio_c45_devad(devad) |
+			(reg & MDIO_C45_REG_MASK);
+	} else {
+		cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+			(reg << MDIO_REG_SHIFT);
+	}
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -136,8 +199,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -148,18 +211,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
-		(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	unimac_mdio_set_clause(priv, is_c45);
+	if (is_c45) {
+		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
+		if (ret)
+			goto out;
+
+		cmd = MDIO_WR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+			unimac_mdio_c45_devad(devad) | (0xffff & val);
+	} else {
+		cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
+			(reg << MDIO_REG_SHIFT) | (0xffff & val);
+	}
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	unimac_mdio_start(priv);
 
 	ret = priv->wait_func(priv->wait_func_data);
+out:
 	clk_disable_unprepare(priv->clk);
 
 	return ret;
 }
 
+static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+{
+	return unimac_mdio_do_read(bus, phy_id, 0, reg, false);
+}
+
+static int unimac_mdio_write(struct mii_bus *bus, int phy_id, int reg, u16 val)
+{
+	return unimac_mdio_do_write(bus, phy_id, 0, reg, val, false);
+}
+
+static int unimac_mdio_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	return unimac_mdio_do_read(bus, addr, dev, reg, true);
+}
+
+static int unimac_mdio_write_c45(struct mii_bus *bus, int addr, int dev,
+				 int reg, u16 val)
+{
+	return unimac_mdio_do_write(bus, addr, dev, reg, val, true);
+}
+
 /* Workaround for integrated BCM7xxx Gigabit PHYs which have a problem with
  * their internal MDIO management controller making them fail to successfully
  * be read from or written to for the first transaction.  We insert a dummy
@@ -190,6 +285,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -301,6 +400,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
@@ -336,8 +437,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
 static int __maybe_unused unimac_mdio_resume(struct device *d)
 {
 	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
+	int ret;
+
+	/* MDIO_CFG is also modified by the MDIO accessors to switch between
+	 * Clause 22 and Clause 45, which run under the bus lock.
+	 */
+	mutex_lock(&priv->mii_bus->mdio_lock);
+	ret = unimac_mdio_clk_set(priv);
+	mutex_unlock(&priv->mii_bus->mdio_lock);
 
-	return unimac_mdio_clk_set(priv);
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,
-- 
2.34.1


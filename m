Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864912;
	b=ZKeVIMUmBtE1AWo3A4i7ssEOHKQFdnzbgmRPgSxm/SbfWCoQjVKkomq2GSk+HXzJ4ENy
	 NjazYzWIDoJIYLQCbXeILhtEQAV4rbnEwhl8XOHe3E3BTPMUmlvVR1ZjYS4UaNTCJ6pmc
	 U3KTQnsRMU5y6XVbzxrl0kyDKXzT1Q0xA2qZiRpGz0Pvj6AUjKIBAUE+kHkSVipFsC+Qg
	 GU65Mk+tYtFiXB3j8+qJ5RDtbQR5R2avCdoKIzYFT13jRdc8HDo6I2xXlOSq3Qf8zkzQj
	 NLNyaL7WTc8whemIDIWEHBdXOOxAZ9lKolkbxjWOZ/PRSTarOaREuNeZ6rjdjXapvSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864912;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Q9toRHBa6MBu8qE2ThH7+Bc5sQBwNumh+43a7Mu4fio=;
	b=SpWGtsKTbgPGy0nLlXeX1Kv6p0wbxWuvYHfgN5w6AO0Ewc05RK055ytfdSTZD6Rmx7A7
	 GpIc37ffWTJcN0LRJ2heKbAmkfBuFQscyjeaJGkfspLBKXqMvEAQU8Mmi8aVx4JP8cw9I
	 BkzI+QApG4Ihp+7Z8yumZjG9QUsOjpjeV5Sd4+/GVxr+1sVWl8lPelWKAPcAGT2JM9sdp
	 3Y+NOAq9pCIS9PFwmtYmLE65vRmRrVNuLinJf9mKae4y9ppRUkxycHQ1miR0PfmYe/Syu
	 EZdjUPJUb3mXMQDyGR031x2rpgML/QwqZNy7hb14xGRarpgnYNhX4O/4Xrwd/6HGgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JlaCjgPa;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30A606A886
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB30A606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JlaCjgPa
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so3352067a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864911; x=1795469711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9toRHBa6MBu8qE2ThH7+Bc5sQBwNumh+43a7Mu4fio=;
        b=oBsaHZV/BlFWZe8YQw3SWe0jTa7gwAuJhR4VokAwMdKFvYVH1jAuTOiwEH/yjzLaTM
         x24fc45acVObBR95xxdLLESnZlz3Gu3bMBn3cefWOfwCePl8wvhXRo9Itp+C0ZGU05TO
         Dwn8oIn/VOBAtugfCroa79Q/PWA+Smfsk/fZgtfRTgFdKSnzDOtoOZSl+E+jD/23a+1l
         XbSrFAiH6yH7d4WoUwkaJU80JAQdm6yGYP7/R3m+UPcNSCrpxpeSGd7xNalyCqI61MVA
         E1IIhNdCXBDyl8R8fj2wMNVJaYqKrcLwv2AKxq5eVfA0D26ZS5ccmrJq4V8RKB9oO+oo
         3ayQ==
X-Gm-Message-State: APuU4Z/sSB7bwDAsln5pXEtl9c8qc4HHrXLvXUNjPlizic/BMlGDflcd
	x3bu/C3syDbxfzSUOhJTa2zxP5Z3i8Wl0HFAp3hyWOxiTnOvZeWJY5XEwWZMN3xeZ5BEOJEe2wF
	xIZ95hRQjbKqKjn3Z3IKUkphauk/mIgqIyx90eBz8utW1iVW/M5ALjLzaFbN4Czcg9IjRrAXagX
	MTyN9JCxWx5GvUMEZxJLVI15iwwYXP468F6hZyQMWkknTGVbL6fldERK+yQUkOuUeJGyM8d3c6Z
	o5VQIp1uk/3G69s
X-Gm-Gg: AZFdTZf/NyYA8qG6KCEkIKhXmeYybkJjI/i5QorDhr0zvSU5UctraSLmO0gPq6YRGfI
	GqNVUxz9QJ9qxRTxVsZQXSYMwi2GqoPESL9GB7G6GBKIH+0+rIPP+3/iKcHTqbv84nNIcZaDO57
	Qt3IJSa8VCbCvczeToOc42qd2E/AZaoTbjNMpRZiLh69nzD6/l6P3kZiExwGjtLekWQ3TrYh6Wi
	Ey5IsPH2hVtxXbr/7e1z4vkk2Glj96OQSMUgyUhMawTNOmR8JRIFED5abYh4RtZkCiwSCnYBS9p
	eVWXQObnv8AVX0jP+UMkAiWjSDBvR7Ud5vJhYur2lroKPHnebwRkd/enVGbworQphGcxboc9tLN
	FXI64d2G6BQIftiM/t5JnhDQrIpsu2ccAO9lRUfTvy2HdG7rrqa1MxFBA91JE8EOjpVxsoN61+S
	D1a1xawmwPTpPD1j3LvJb/KM+c8YiW+35nyDEssZzAVCc=
X-Received: by 2002:a17:90b:1812:b0:3b0:9a2e:b494 with SMTP id 98e67ed59e1d1-3b1b0d2281cmr12217071a91.54.1794864910941;
        Mon, 16 Nov 2026 13:35:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c4bcf708sm3251105a91.3.2026.11.16.13.35.10
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-532f343a55bso29332601cf.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864910; x=1795469710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9toRHBa6MBu8qE2ThH7+Bc5sQBwNumh+43a7Mu4fio=;
        b=JlaCjgPaEHGqzopL+wEd+GnAJCG9rMUtRXEvWf+xZbWU9KSmtHnZjhWyoNSpWB7yZG
         bHHuxbYnhayJA4BzqnGWbctllfebkJWHWFmk4x9guodIgQ3Ou7lvlD/lzlwkFsR1fZIm
         euG6Nyjv2KTkrW81W4f1uicsSGLC7+kjLt+X0=
X-Received: by 2002:a05:622a:17c9:b0:53f:8b6e:5380 with SMTP id d75a77b69052e-55ac867bea8mr173365071cf.62.1794864909408;
        Mon, 16 Nov 2026 13:35:09 -0800 (PST)
X-Received: by 2002:a05:622a:17c9:b0:53f:8b6e:5380 with SMTP id d75a77b69052e-55ac867bea8mr173364461cf.62.1794864908749;
        Mon, 16 Nov 2026 13:35:08 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:35:07 -0800 (PST)
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
Subject: [PATCH net-next v2 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Mon, 16 Nov 2026 13:34:49 -0800
Message-Id: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
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

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 105 +++++++++++++++++++++++++++--
 1 file changed, 98 insertions(+), 7 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index df267bb82696..6059b32580c5 100644
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
@@ -96,7 +102,43 @@ static int unimac_mdio_poll(void *wait_func_data)
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
+
+	/* Prepare the addr c45 operation */
+	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
+	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
+	unimac_mdio_writel(priv, cmd, MDIO_CMD);
+
+	/* Start MDIO transaction */
+	unimac_mdio_start(priv);
+
+	return priv->wait_func(priv->wait_func_data);
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
@@ -107,8 +149,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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
@@ -136,8 +189,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -148,18 +201,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
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
@@ -190,6 +275,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
-- 
2.34.1


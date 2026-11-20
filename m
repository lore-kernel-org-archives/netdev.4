Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151862;
	b=MyfsW1wCDOscYwtcIS86jPYljALLx2lW+FBNJYAngGCuv3Qoj5Cy6yaEvHBH8Fj+STjc
	 botZhJ/viFjtLq63rRN4jYdR5cCqj0HCW1MXLE4a6u0GAK20WT3qCSWG00JCmfL8yonwH
	 ZG9dSe+WrKsY+Gdz+R78h9kD559AtFTxTywXvQoiG37+JdB+Fprs9kf/ZZ4pAm96+WnFo
	 JNJtkpO155w0AFXaqsPC0/nMMtBUcaAj4LPRRhqQikDNI7g5FqK65yzYdankjJLgE5c8m
	 QuqmYcaOUScHQPxueyoe9OkWOPgsEYPbmcCuhKZLiHx3PUHr7RIlMcs3ET92SrYexEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151862;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
	b=LvtO7jc8DChSzEmDOD6NibwDSj1Zq+g/3Q2J/xjQnS9ua+53EDTv/lr7ekY6wNql1ut7
	 7x/N2IC7DBJ+GgsLVWDvcmn03bwmE+CD9EwCVIlrafQuSOFRj48SMq991HzPpAv2bSSRj
	 jWhPP4SFiYxmc71Sf5AaQayOMdOsF3vi44oyW2bIJcPVPoMEhePdolNu1B/mwJ+RzjQOM
	 Dc+Ak8jnM0euxKeWuP35RSpL4mTqfIxE/bqBZnlfBVQCcia72bdZkDbsAn2htzTwd4Apz
	 mXx+BBPqKIfU5REKgnf9Ya6cIrDalaUIibtGiPMz9BXvl3QKrmi+PnTc/GNoT65Ty+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Py5PPwUT;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB004606A330
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB004606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Py5PPwUT
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so347954a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151861; x=1795756661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
        b=wJNZau8nWUOlCIwWr5uuK+RmtcaWg2fbYsQyyBNos9E0T72DZMMi8XOwfnqBG0gT9I
         9C6I6BhXhkPY0CZ5k/Ic70GyqFHy2CDBGFd3fhQgDmSlPNmKxbM+VLtphhyUkvEIzu7h
         Wkl7Tusf0CLgEwXUfJj2YlbuG0YSJGqRN8XntRLIXeDXQ19s+3Ymp4rkmTSwHTUAMsDx
         yzFRGto0NYvuE4kEOa/pUVT6lSk8kTqnBIMQGyWXep2oSUwlKSc/CNzK2kR86STl+TUL
         30HUbte/NGxBAAa1MvuGq3AAGe3NT2VIOEtl09Tnv5Nn/zxqL9PH9UD4P34D1IVtGXVD
         rjrA==
X-Gm-Message-State: APuU4Z9kNBRlFHaQvEuvclitQ6iqoo2PEgPaJ6vWn8xyyGUUSwBsnlNs
	LGwibwhoZzfpFD0SyRCnFVcOTkXdkfvS9SEQfvEap19AVqLDmHVgbyeu66FZIhjEV5rddSf66Dy
	Wc4g/9EMyXoyi77aT10knZ5MVYwDDdMolU5f2Hz87gJQWoVjedhOok0bEw7HyeA7B4bFL9VoRB+
	rggvxJWsA8unlrw0EeSosSJ/4NIQUfZFE6SQVWJEfS9SAc+cT3q4wjNgbUS2E7HnXxxrFrBvnFJ
	ZJEuzNYPIAKJE32
X-Gm-Gg: AZFdTZeYwu8ltjxRvCPUMb4ejicvyYguqcsANGfBR0YK717XKhi1fYtzVH4Q60G6OIF
	Sqwk56cjd/DsFqQjmFGdiqAMSBAjjDuqWnFi/OT9At1WpuZk8FPTvA6ddLwv9NegCos9+bbpY5I
	qpGgXynQXU57S4C6o6oP8cQ73vhpsS6kzvR1h6+iPOq83e8cFHP8vzVPx1IsfMcw4MDugf0JJdg
	OIEzsJmfQP9QaKAvs0VyVrKUFEJgvae77zUQI8n0RSwvo/quXSbiD/9TvdBff3vNoN8pme6uVGm
	fDZV3nNOuoFIHupwJnjiG0pNgT0xzk3K/KsHD4HDntmfoXZ+hJkI1C/mAkXF79eEBUbda0xG/wU
	SXXdt4Tuyr3m4rKW+jPFEC6DnTR+ScqE8PTERNdaXXdUH0h8zoyjy16xXZyn/+wknE8IKNjcEN4
	j4l0X1khVtKkiYi2gY8q/shZV7InQw0RwrhubKhCpZ1HU=
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b373:6a6a with SMTP id 98e67ed59e1d1-3b41c9e45c3mr1654375a91.28.1795151861118;
        Thu, 19 Nov 2026 21:17:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm538781a91.2.2026.11.19.21.17.40
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d62b80650so15965601cf.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151860; x=1795756660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuYseT61ITMpaGhIYRTbXXLxXNObKQrY9rERRFsxjrM=;
        b=Py5PPwUTJuIt01eE0rpaxU++v+P2vnNqR0uQaJQBUlD9WRPg9tozw/8qkek3+AKim+
         u5bK4Mwp7th/4Mv6MsZGbLCWmvlhipF7jznpmu1rB9rxInS2VMrN7R3p2CgAL8NSR+Os
         WFkDEifQrLMnKcyMB4AnpzPvL1+vI0eiSmcVs=
X-Received: by 2002:a05:620a:1725:b0:93e:f931:a886 with SMTP id af79cd13be357-949bab0ee9bmr323844085a.57.1795151859944;
        Thu, 19 Nov 2026 21:17:39 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:93e:f931:a886 with SMTP id af79cd13be357-949bab0ee9bmr323840985a.57.1795151859420;
        Thu, 19 Nov 2026 21:17:39 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:38 -0800 (PST)
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
Subject: [PATCH net-next v4 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Thu, 19 Nov 2026 21:16:53 -0800
Message-Id: <20261120051653.1433677-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-1-florian.fainelli@broadcom.com>
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

This includes the platform device that GENET instantiates when it is probed
without a Device Tree node (e.g.: ACPI), which does not mask any address.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 125 +++++++++++++++++++++++++++--
 1 file changed, 117 insertions(+), 8 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index f8e5c1811d96..a79830566abb 100644
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
@@ -97,7 +103,53 @@ static int unimac_mdio_poll(void *wait_func_data)
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
@@ -108,8 +160,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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
@@ -137,8 +200,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -149,18 +212,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
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
@@ -191,6 +286,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -302,6 +401,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
@@ -337,8 +438,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203820;
	b=G1TVq5uk8oKEeaYXqXWRJbm9bup6dOtxNlZCFTq0bFaeZJY4C9Tb4xfTEeIR+3bwhOEW
	 qsAou09NK7rPLA/CPTyuUWiWqtmm9iH0cfVTj/e1xeEuHHrfnYL1+cFiE4d1jeFGhLoTY
	 9R+ZU9GtKVzPVUoy89nDoPzgluEB3KjFwWd+UpqwAm9CJUCz/LY5ZzCkJxkRv2DeFEm/R
	 B0ibmQX3Vq0GaTj7YttktxQbS5GQYmMVr30lx26QfQzS2QF5Hs4wCYCtAoGNP1JFuSVTK
	 TLmXpzaCHONkeSKRzEyzsJrlG9QkZPWLK85sGmGt80i1BvHafC2crNgMSNLBWvkorWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203820;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=G4rj/NG/Ku0mN8gUKZ/jtUOX+3uJ/iQ6k8m4rnnrkYE=;
	b=0Y4lGUsLwSI2NkcbFEMjQDFApoq0Xd+abfYEuA1hX81i/++6s6ltobo6UK9yNx+o9rDN
	 qgf+21oyYzkSi/C1zRbkpBSzIFPgVn1/rKQRiS4ua99aQt4uEaQtV0nRcek94zjfUqeT7
	 zLUv8aYbxpfaHJpu4FuyNHvWxSfuRv5ZAYUfeGc8LtBgNYeb/RzK6XGVwp9l2b0WJYSHm
	 Azz7BtFATCgd3EeSBVoUneDgHdMUFk1MD7mZQKYDPkaQwO0FruPqHiIx26nD+qgP42h1D
	 kiG6L2pHWQL1SMrQGIpR4uT2C6MREe/9+hF3Y1CmmfkaOPeyJ0Z8/fSGJN0AY22Y+cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LpgS9Yop;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DE60A2605
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9DE60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LpgS9Yop
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so821546a91.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203817; x=1795808617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4rj/NG/Ku0mN8gUKZ/jtUOX+3uJ/iQ6k8m4rnnrkYE=;
        b=xDFg8f9SpuajVcSOz8JNnqQ+ZidPqVjjKgDVkdj5hPnAk//5QJ97aKtBnXa6L0Drub
         wve5xUoEFQn+2PTsvdfXk2g/DCW8L1uJbCsR+9HKzS44FU528n5CqlmfjFDsTvdLSvuU
         BXmrzjFkl3kwgRt2rhC6OZocFmymJ7eckOy3aKcbgdoXWpyMr9p3DEkjYcPE8XiZHS9v
         hMbdfIANMhg3rLQOfXyaAuWNv4mJyGio3mUPkvbi6zqfUUYu/0UGZoj5Fw8BqCKPmfFj
         TvI7LrLuFf3hZpb5ScW/GF15ZV8I3fL2gxWhhZGIrg2flngEZ4xJnvtrw3kPbXU8OzFt
         MBPQ==
X-Gm-Message-State: APuU4Z+yinOhixAU74MoawgWM8rAsPmx7WnI9GYTcUkRfbmJlWo7QBFr
	d0UNfoLQiFsjfGdJuokAz9uAgRhOj47uV8v3PmeiDDpRnglUUvkmGnzRv+dLUzk7yjR04cTyUiv
	xWI2r9jWSXe5n5iwIRTqZxVk4ASv5zZch+bHF/NDQ+vGV0negHQwnZQ+s26cpjlbVC8NLsGRgpi
	Ue/6pIQ7tHGmOO1rAo5UdboCWU5K9bC4sNci0G2B+/BKhxHr4oyjd7g8v9YCAZR86ZfqmWdMDNM
	FILybWMZTt31w+Y
X-Gm-Gg: AZFdTZfYjAc5ZD6/Eb5k2gb+dm+sgMHbKglE6SA6ZXgdrUbGTzpKlFfRj+LawoACaK7
	AKdB+893bA5k90AgtlqW4Sot8ncO9cSNAR6oi7jptsxJ2DIh2EF7zpxbbg7XBGRINI/BkKuk9VR
	+13FEXaqRLLHKzMqDErvaQBOj4CNKXANIf67Li4CDjCGKZzD0kBsWDDtas8RcSN+X5Vodf9oYsZ
	tlD7dybzfW0GL5YvsAiIDGjnlrgDq5tG6PIFwyjoDvRcxwZL28c/wo58sOADoMKNk2Hv7C14PSY
	aguCd0kpF4wyAa7iBzhNfNjlntNYQ7put1JjDntMQwSQ1rNv18waZ5ezE4I61UbIBamOKe8tIY9
	q0cyFapHsL4EOC61RXiBBCmNGAgh2b+pf2B260ccU3+XpKrJVuvOoMlVRywSax6RuL/fWso0Qx/
	W3dOaAU/AjMRnKxQfggRhStjz0YabGyMX8mEtxWt+v3b8=
X-Received: by 2002:a17:90b:17cd:b0:3b4:1926:9e9c with SMTP id 98e67ed59e1d1-3b41c8ff562mr3669777a91.30.1795203817212;
        Fri, 20 Nov 2026 11:43:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm1038980a91.1.2026.11.20.11.43.36
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:37 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55bc8181defso25124781cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203816; x=1795808616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G4rj/NG/Ku0mN8gUKZ/jtUOX+3uJ/iQ6k8m4rnnrkYE=;
        b=LpgS9Yop++52Hqei2wjhc7w5pqyAzVYFFh4M62BF2SrjwmNzz2rU8cHk7aY2mNYdwI
         MSruP8udsIt85dBGgdyqGZH5NmZ5hh2WyAv75Xsfw0syfVnD3A/fO1YKkKRnhNxVFG2Q
         WGgSBp+E+R17m4xNH3lBgysCCPIzcccuLeVeY=
X-Received: by 2002:ac8:654a:0:b0:545:bab0:e666 with SMTP id d75a77b69052e-55d76addad5mr74823101cf.70.1795203815648;
        Fri, 20 Nov 2026 11:43:35 -0800 (PST)
X-Received: by 2002:ac8:654a:0:b0:545:bab0:e666 with SMTP id d75a77b69052e-55d76addad5mr74822691cf.70.1795203815087;
        Fri, 20 Nov 2026 11:43:35 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:34 -0800 (PST)
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
Subject: [PATCH net-next v5 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Fri, 20 Nov 2026 11:43:18 -0800
Message-Id: <20261120194318.3952487-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
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

Since MDIO_CFG also holds the clock divider, unimac_mdio_resume() now takes
the bus lock around unimac_mdio_clk_set() so that it cannot race with the
read-modify-write done by the accessors. Resume may therefore wait for an
MDIO access that is in flight.

Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0 even
when the controller is still busy. For C45 this would let the data cycle
or the next access's MDIO_CFG switch start while a frame is in flight, and
return the command bits instead of the read data. Check that the controller
is idle after every cycle, C22 ones included, and report a timeout instead.

Also skip the BMSR workaround read in unimac_mdio_reset() for children
compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
expected to respond to C22 accesses.

Note that providing read_c45/write_c45 also makes the MDIO core scan for
C45 PHYs at registration time, on addresses that are not masked and do not
already have a C22 device. This is not the case when the bus is registered
from a Device Tree node, which masks all addresses.

The platform device that GENET instantiates when it is probed without a
Device Tree node (e.g.: ACPI) does not mask any address, so it is scanned
too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a timeout
per frame since GENET's interrupt is not registered yet when the bus is
registered. That makes the scan slower at probe time on such systems, the
same way the C22 scan already is.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 136 ++++++++++++++++++++++++++---
 1 file changed, 126 insertions(+), 10 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index f8e5c1811d96..b01e99327b56 100644
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
@@ -97,7 +103,60 @@ static int unimac_mdio_poll(void *wait_func_data)
 					MDIO_CMD);
 }
 
-static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
+/* Wait for a cycle to complete. Some wait_func implementations (e.g.:
+ * bcmgenet_mii_wait()) return 0 even when they timed out with the controller
+ * still busy, in which case MDIO_CMD[15:0] holds the command rather than the
+ * data, and MDIO_CFG or MDIO_CMD must not be touched before the frame is
+ * over. Make sure the controller is idle after every cycle.
+ */
+static int unimac_mdio_wait(struct unimac_mdio_priv *priv)
+{
+	int ret;
+
+	ret = priv->wait_func(priv->wait_func_data);
+	if (ret)
+		return ret;
+
+	return unimac_mdio_poll(priv);
+}
+
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
+	return unimac_mdio_wait(priv);
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
@@ -108,14 +167,25 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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
 	unimac_mdio_start(priv);
 
-	ret = priv->wait_func(priv->wait_func_data);
+	ret = unimac_mdio_wait(priv);
 	if (ret)
 		goto out;
 
@@ -137,8 +207,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 	return ret;
 }
 
-static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
-			     int reg, u16 val)
+static int unimac_mdio_do_write(struct mii_bus *bus, int phy_id, int devad,
+				int reg, u16 val, bool is_c45)
 {
 	struct unimac_mdio_priv *priv = bus->priv;
 	u32 cmd;
@@ -149,18 +219,50 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
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
 
-	ret = priv->wait_func(priv->wait_func_data);
+	ret = unimac_mdio_wait(priv);
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
@@ -191,6 +293,10 @@ static int unimac_mdio_reset(struct mii_bus *bus)
 			if (addr < 0)
 				continue;
 
+			if (of_device_is_compatible(child,
+						    "ethernet-phy-ieee802.3-c45"))
+				continue;
+
 			read_mask |= 1 << addr;
 		}
 	}
@@ -302,6 +408,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;
 	bus->read = unimac_mdio_read;
 	bus->write = unimac_mdio_write;
+	bus->read_c45 = unimac_mdio_read_c45;
+	bus->write_c45 = unimac_mdio_write_c45;
 	bus->reset = unimac_mdio_reset;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-%d", pdev->name, pdev->id);
 
@@ -337,8 +445,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
 static int __maybe_unused unimac_mdio_resume(struct device *d)
 {
 	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
+	int ret;
 
-	return unimac_mdio_clk_set(priv);
+	/* MDIO_CFG is also modified by the MDIO accessors to switch between
+	 * Clause 22 and Clause 45, which run under the bus lock.
+	 */
+	mutex_lock(&priv->mii_bus->mdio_lock);
+	ret = unimac_mdio_clk_set(priv);
+	mutex_unlock(&priv->mii_bus->mdio_lock);
+
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,
-- 
2.34.1


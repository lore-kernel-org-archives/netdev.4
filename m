Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452536;
	b=ouaYE6GXhuG8BNVKqHkVvvGc/VvuDnX3rWKuV+R3efFp54la1gs1DWVcYQSa6aVwoYUu
	 BBllb5ND2D/WpIMdeTO2k67k7ZwF8HcGOg4XgFv4lSOJJ9wq2a3XoYq4Or/UMdZN7KihD
	 0U+1vKkC/nq8wHr3EJTuX0nDe8Z320xUM1DiiiQE0d4238I67RPncrBqsm19iCN/l7dea
	 09vwL8aNLgSNWmHEkgbEJvK2KJt3M+NWGE9jgX8CVvNo35QVXa6VQWUKu03wkXYvmvBtP
	 TCoB+kzL8gZG7HgzXu/n3Hp1qK2fjrb/tVd1XNMLvHlgGokIitimIe6H1tDr7PZ11YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452536;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=aliirPXFY+qx7skKhpH0Dji/xTdYBn4uxxTPQjnsb3M=;
	b=0l5FPvJFyvH4NBOCkIWBr+H+Eg+gMh3V46zzklLB+aniRjt0pWVvDsMUnqhguWScAJLB
	 bqTsU0Y2OypV7/ArnKmPHsg3tKV9Z0S86zIsC03GYT8C7KwcqYUBv6pHd2JWWojL1XIG4
	 u7NM/QAYKv0gSFv26oeALIb4CdrBHZHvyrX6P+mEaZW02E9fZyMjZnydq+92f4Uf6G/Rp
	 4Ue+i88aMDWyB4ykI8/TbPdKLzv5COIYPPkycHqxmlgqdw27AklG5OUf9smdfA0dBXxEd
	 DasmEH5vhty4aju9p9COFcak8BsbBHrDH5sJFGjHqzBdvpnUYaqtF4MBP8K4JIcVb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NlwmdOTY;
	arc=none smtp.remote-ip=74.125.82.225
Received: from mail-dy1-f225.google.com (mail-dy1-f225.google.com [74.125.82.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DB606A6B3
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07DB606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NlwmdOTY
Received: by mail-dy1-f225.google.com with SMTP id 5a478bee46e88-38644aedba1so5276867eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452534; x=1796057334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aliirPXFY+qx7skKhpH0Dji/xTdYBn4uxxTPQjnsb3M=;
        b=R3lpG3U8SEn3EV7Rv3MpyMjNkfXe5W5edIe1SzzhsPKSe8XvVeVaTq2G7I+/zrQhw6
         5PfxMAtBrCpxM3/FsKXjKb5O3Qk59ENORryyMbtNvtjXUES6zYt3t8nYeiQYqiZfxg5+
         iHWPA+LM2m2gW+v3o2nE5cW+Y4hjct2bUMMpWcPq1Bn0AJSZWEmlRth7g8UC5Xh06l9A
         iv60bsnXXoiU5VKQlZoYTC7upHBgvwOz/IJK3vpnwwWGz7joyDrQF9KcaOvLfTT492PV
         JxIsKMDLjkeXl/SqYQbo00gR7hIVYEH0whwOxV9L2eZmOqBb8l8fXLKDvkOtf6IXAZfd
         5GnA==
X-Gm-Message-State: APuU4Z/BNBlNYgf2Or67asS0lDT9Cr705Mzx+iNJUts0ebIPevWKL4hq
	501fPlBLJKXnqOGuZ5rIirkGOwFc0FIs65NX0hryN6Zc4DjSDY4FnW96RJ50LgmmJkpJ+APOKX0
	WkDTOLbPLOZRcIjXwNBZsCBuPrqR8lpvXdK5Yf+gXEOTw9/kLHZFTwMjS5hmXqhEVLotY1twxDo
	5/e21XGZqDkUpkfRBPClVRO5orXQHG5ekLJ7QQtImJPXQY/IS5BcB/4nMw3VSMET6ZsUtxOgRAI
	x0sRIkSIQ5KyDoP
X-Gm-Gg: AZFdTZdQXMim782hm/vmMPb4s/StgnomxtyzXQvjsIzwdY3129rQcg8v4Ye/kV4RWP6
	zujniDFMdRY3NRnGbDY/juodMUW1GsFeOzTS0lmpDicZbEpt3il98RIqaRVKETMuwMBpbHwuQER
	WzP3IuMciyhP/26WctG80Gber8fP9dhaGj6GXDUquhc6iJJn0mbnAiqjNIiQsr2yZAZqBaETXyN
	HMs2WuGYwI8NB3JywH4E2+jRqe6YjzqOgCPjyECxEhS/OWfiNoPIVjkzSp1dh5PG+SkVMvy+Akd
	ACnHZyh4Ft6eDpHhY8PK1b5ZryYGHerej+xjBkyt6ZxXhgoklGbPL/O6HJBf2njlrKHDSf7aTi4
	0LcBAD66gMUI2HbS4LKUw4p5yF+a1LsDMSCocFsKZEh7c7xvLF7CgsU1lmzEbwL4xc219PeQWgg
	VONHpvkmYe5G0uSiCvsRWBYkHrQlcSCBXYGumW0vVoBxg=
X-Received: by 2002:a05:693c:65ca:b0:386:b826:407 with SMTP id 5a478bee46e88-386b826061cmr1867417eec.20.1795452533895;
        Mon, 23 Nov 2026 08:48:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38567fa0a44sm1433035eec.28.2026.11.23.08.48.53
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so859658185a.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452532; x=1796057332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aliirPXFY+qx7skKhpH0Dji/xTdYBn4uxxTPQjnsb3M=;
        b=NlwmdOTYZZyrri1Wf553WFHMjVv/6Zd4yW9UB4v43Zf5bdsQ2JQ/vVcDiorg3Z+dxS
         F2hxV1MrF652IuqHsHq1MiIaUcZ8S++uuVLCD4lhZVkOKaAVMxgqB3BC1uBhDhvxwux+
         CZ+A9iTgSfIJYCoOybAOKtowFpx+xaX8abtBs=
X-Received: by 2002:a05:620a:4387:b0:945:d148:657a with SMTP id af79cd13be357-949ba99cd7cmr1822821785a.24.1795452532357;
        Mon, 23 Nov 2026 08:48:52 -0800 (PST)
X-Received: by 2002:a05:620a:4387:b0:945:d148:657a with SMTP id af79cd13be357-949ba99cd7cmr1822815285a.24.1795452531750;
        Mon, 23 Nov 2026 08:48:51 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:51 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Carlos Soto <carlos.soto@broadcom.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
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
Subject: [PATCH net-next v6 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
Date: Mon, 23 Nov 2026 08:48:35 -0800
Message-Id: <20261123164835.1733304-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-1-florian.fainelli@broadcom.com>
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

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
Co-developed-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203817;
	b=qXolFZZ47e3aIXrkyQZlpzaCbs9hvetiiSpG5byTCzPxFTpTdfLDOwy7BUKzy1qduMu9
	 W4yS+/voyiDT0HGwi12bROxxGLsQnGbrjhMXuWeVS4NUojFyO4h1LlkciE5GIBWhLHj+r
	 uULlJO5cN3CLY3oe63BxDybPiqjXbazisOt71fMwDLNbjgtqZVMf3ZNwmRHbr3v0aTeyQ
	 r9mW/03YDvE7wzP8YyStfjmdM70xuRN4ht3xlHenVUgRkxC9DtxrOsmgd+bl3C8kC3eAm
	 EBfDwqJMLMyFMejHq9G4OhSNNjNE+1wp0jPVbFukfjzRSbNoNp+Cc0DtkKXLaTDg9UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203817;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R7kTWgwU4k448lM/maIC9lm9CmpJidPFetD1LLrscj0=;
	b=M8VO9QTQQU45W8uGedoyWia8gKwHziOYuWmL01Sq9KDdNZGOdzv4o9F4VW3BgRFvGXz+
	 orplVHXpU7TCOKhiFuTmKOkDXc0fAWTBw2LymxU0tnKUlu4+19UwepiDB2mjeepIC99y5
	 2pvoj1D2UMpMcx5ouaCVUqywX5g1beGMEYGAgyFoKb57sAvC6cJqli9CqtD2kCiEQTHUJ
	 NOc6gUySy+uf5lXAgmR6uxZ41S9SmA526A9V7f7nN9I8NPafORBE2LiMrv3Q5gtuFakf4
	 RmfYJNm1/wvgCjGlOm1ybtWlp3b+mmDcKM7EHd0VEnm+croc58ACXB880gszMHhdIaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DZvHOxma;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC73606A6EF
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC73606A6EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DZvHOxma
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7d2da166818so789943137.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203809; x=1795808609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7kTWgwU4k448lM/maIC9lm9CmpJidPFetD1LLrscj0=;
        b=VFExrGBSoTa0QWbGIzsyYQoqxt2L8omIjajr/UlTa4mIrpfyKvqFVxb83vs+/gbMm2
         43OyPjnrGYKrQTLI0PVAaBpk1qtwKQe7IVNIneLMidmkU39HrABmIFyUhsyeMhS8MWv8
         VDsL2DwF/1zp1h1supB2tlXBN0ZkMQ9C5wNsAbDOeN2mvmCJ5AlumG3sl+WxeHv58NBe
         /lXrE7a2LdQBsKOWe81LcMdjoVRG5FLKlCjVJfvboAtFkjY9Bzbv3anNADsM8fOctl4+
         HBWkBYQB8FgoxwG7oWUlzKFD6PyMNjSWP7c+dvygiPbHgOsX/+/VlSAF7wBJOdJkCVra
         VXwQ==
X-Gm-Message-State: APuU4Z9vrIQkiuV0dC1IRn7OoiGjLP88YlRzpWCiIDOV6adK1mnqvmqN
	JYntPzvDC02MY7qZ9v1Qvt3uiAPsTHpOctnIGM4xtBehEekgCawHhAawOHBpwvwQJjw91LUiFOd
	JwLA53TUvGAJ0PYTQHriuPoIIYl5N+L5rcOAGDh4LE5tc+Ddyn4FLg4nbHtq2VaszylQwQCaNlE
	UFxnQ08N4tUrGtOM2Flg8qLQweqVIQqAsCEZ+0tMYNJl4dtRSP4y4rIdzCQopjw2UrB4LhTPbiI
	OAen8RYlSXpX0H3
X-Gm-Gg: AZFdTZfZXTao5I5cNqhfpP1o84tEkAn+cbP2op2qoXjFMXOWVRiRcqjQhhhV7YJnRSj
	e2O4sfXIROKP+yj4OAIzyAfR/EqXlc+b+q7kdw6J0QSHUUaZhoTZmElcFTobWtX6GYQ8MBeLgVo
	BJCwDs0YgCIzEReCpQ7EGhjDhRuyPS5TZep5fiaxgKMXVv+kC8HKO6+G/9FCdT38+Yyxvc6iSMY
	LHuYQudeef8O6nJjLAol60tUU/lgbZEO5QqBjBNebsM8LaZg94dlWVd0bnco5ANhaUyi7b0q+op
	24ghf2TLyHRxImRKv9yKXjJSsWhWjfIoBGeTYM9JO+omldas/uWHUXlu69qrYiic32hqBmjeWFl
	es/eS2mSD87d+Jf/HYSmFT2UKAIJmJ9iyeylqF66A29wjHup6HLuFPjAEkPMPtYvO6f4b4UpB8m
	7xamaH8LuxNatN6NuJhbShPPjSj4nDE8fyf3TRm726QSE=
X-Received: by 2002:a05:6102:b04:b0:7d2:7654:86ac with SMTP id ada2fe7eead31-7d72b35959bmr2209248137.4.1795203809195;
        Fri, 20 Nov 2026 11:43:29 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e1b3904sm419224241.19.2026.11.20.11.43.28
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:43:29 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5383c05fb2fso35631651cf.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795203808; x=1795808608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7kTWgwU4k448lM/maIC9lm9CmpJidPFetD1LLrscj0=;
        b=DZvHOxma6p0p72MxlpFdiu61yzfm/Ql6hxsYRuBeo5ftlmtEOfvyGOONkWHkpu28FV
         CNPpj0MZ9Yz+vfxJJdMwkGUqep/+FWtWjn9Rg03oWUMBJl6oZ6wpfVIQ0VGTqi09nk5g
         myuwuLpb7FCORGW1dVmFgIOOg0XqD0uhY9yfw=
X-Received: by 2002:a05:622a:4d05:b0:537:f05d:6ae9 with SMTP id d75a77b69052e-55d769eab25mr76644661cf.13.1795203808469;
        Fri, 20 Nov 2026 11:43:28 -0800 (PST)
X-Received: by 2002:a05:622a:4d05:b0:537:f05d:6ae9 with SMTP id d75a77b69052e-55d769eab25mr76644281cf.13.1795203807922;
        Fri, 20 Nov 2026 11:43:27 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm33847286d6.20.2026.11.20.11.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:43:27 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
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
Subject: [PATCH net-next v5 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Fri, 20 Nov 2026 11:43:15 -0800
Message-Id: <20261120194318.3952487-2-florian.fainelli@broadcom.com>
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

get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, so
that mdiobus_scan_bus_c22() carries on with the next address when nothing
answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
failed read of the devices in package registers is turned into -EIO, which
mdiobus_scan_bus_c45() treats as fatal and which makes the whole
__mdiobus_register() fail.

MDIO controllers that report a read from an empty address as a bus error
(e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
with unmasked addresses therefore cannot be registered: the C45 scan fails
on the first empty address. mdio-bcm-unimac does not provide read_c45()
yet, this is enabled by "net: mdio: mdio-bcm-unimac: Add Clause 45
support" later in this series.

Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
mapping as get_phy_c22_id() to the two places that look for a device at an
address: the loop over the MMDs and the MMD 0 fallback. In the loop, an MMD
whose read fails that way is handled like one that reads as all Fs, except
that the remaining MMDs are not probed: the scan goes straight to MMD 0,
and -ENODEV is only returned if that does not answer either, so PHYs that
only respond on MMD 0 are still found while an empty address costs a
bounded number of bus reads.
Errors from the vendor MMD presence check done while reading the identifiers
and from the reads of the per-MMD identifiers themselves, which only happen
once a device has answered, are not mapped, so a PHY that fails midway is not
silently skipped. The kernel-doc therefore
documents "a negative error code" rather than -EIO as the only alternative.

This is not limited to mdiobus_scan_bus_c45(): get_phy_c45_ids() is reached
through get_phy_device(bus, addr, true) and phy_get_c45_ids() by every C45
caller. For those, a failed devices in package read is now reported as
-ENODEV instead of -EIO, which is what C22 callers already get:

- fwnode_mdiobus_register_phy() for "ethernet-phy-ieee802.3-c45" nodes:
  __of_mdiobus_parse_phys() logs that the device is missing and registers
  the bus without it, instead of failing the registration.
- sfp_sm_probe_phy(): a module whose PHY does not answer ends up with "no
  PHY detected" after the usual retries, instead of going to SFP_S_FAIL.
- gpy_probe() through phy_get_c45_ids(): the driver core treats -ENODEV as
  a silent match rejection rather than a probe failure.

Fixes: 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV fatal")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 50 ++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..2f17c9d4a2b9 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -780,7 +780,7 @@ static int phy_c45_probe_present(struct mii_bus *bus, int prtad, int devad)
  * Description: reads devices in package registers of a MMD at @dev_addr
  * from PHY at @addr on @bus.
  *
- * Returns: 0 on success, -EIO on failure.
+ * Returns: 0 on success, or the negative error code from the bus read.
  */
 static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 				   u32 *devices_in_package)
@@ -789,17 +789,30 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS2);
 	if (phy_reg < 0)
-		return -EIO;
+		return phy_reg;
 	*devices_in_package = phy_reg << 16;
 
 	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS1);
 	if (phy_reg < 0)
-		return -EIO;
+		return phy_reg;
 	*devices_in_package |= phy_reg;
 
 	return 0;
 }
 
+/* get_phy_c45_probe_err - map a bus error seen while looking for a device.
+ * @err: negative error code returned by a bus read
+ *
+ * Like get_phy_c22_id(), report -ENODEV when the bus read failed with -EIO or
+ * -ENODEV, which is how a controller signals that nothing answered at this
+ * address, so that bus scanning carries on with the next address. Anything
+ * else is reported as -EIO.
+ */
+static int get_phy_c45_probe_err(int err)
+{
+	return (err == -EIO || err == -ENODEV) ? -ENODEV : -EIO;
+}
+
 /**
  * get_phy_c45_ids - reads the specified addr for its 802.3-c45 IDs.
  * @bus: the target MII bus
@@ -810,8 +823,10 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
  * the PHY identifiers for each device. Return the "devices in package"
  * and identifiers in @c45_ids.
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid or no device responds.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
+ * reads that look for a device), or a negative error code from a failed bus
+ * access otherwise (usually %-EIO).
  */
 static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 			   struct phy_c45_device_ids *c45_ids)
@@ -844,8 +859,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 				continue;
 		}
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
-		if (phy_reg < 0)
-			return -EIO;
+		if (phy_reg < 0) {
+			ret = get_phy_c45_probe_err(phy_reg);
+			if (ret != -ENODEV)
+				return ret;
+
+			/* The MMD did not answer: treat it like a read of all
+			 * Fs, which is what controllers that do not check the
+			 * turnaround return, and go straight to the MMD 0
+			 * probe below. Do not probe the remaining MMDs, each
+			 * one costs two bus reads on a slow bus.
+			 */
+			devs_in_pkg = 0xffffffff;
+			break;
+		}
 	}
 
 	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
@@ -855,7 +882,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
@@ -1077,8 +1105,10 @@ EXPORT_SYMBOL(phy_device_remove);
  * phy_get_c45_ids - Read 802.3-c45 IDs for phy device.
  * @phydev: phy_device structure to read 802.3-c45 IDs
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * no MMD responds (this includes a bus read failing with -EIO or -ENODEV while
+ * looking for a device), or a negative error code from a failed bus access
+ * otherwise (usually %-EIO).
  */
 int phy_get_c45_ids(struct phy_device *phydev)
 {
-- 
2.34.1


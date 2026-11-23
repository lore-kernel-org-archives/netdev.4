Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452532;
	b=bFxv8CQpRjqjcUT4vQ9eJZzOGbOPlIDw5pgw4fVsitdZXpV3SxpWaESRuv6rRPOoqfxV
	 UFCUwCiSz+UeEVnUFvv4nk/4x6w3Jaz2YjBsQOt/KifCwv0JAgA7vTJ+LJzXHXpWg3zEj
	 6FnhmZX7p6qvyA9LZk/tQHZamoo7XW19zoVV1YNUaqG1Y3FCOaJ0pbGDaqcOjF1SKpid+
	 jUkZntdfHajLOyobgVv58nkYDt8EKqv1ySBXX8MLQCg1fjy2qzxfmEJ9UA/ObvI7zxLbl
	 rNGXmi00TgxkBcAS1H/4DiJ5ToLSoaPVpgzgA8Rgdydr13EC9yOkBbGfMuQ9HzztGsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452532;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=71Th2TF1+CZbBFg8quMQHhhil1oILjqdxWZFapcLOtU=;
	b=Xg3NXjx3T6NE+7or3l4L4+Jl+LCJXWTrob+EZwMSYLJ/t53fXxQjoRx+sW8Cbpd7vl6D
	 1JRCy66OvTUSC4nuWVH0UrUZP0oX33YXVF1SVosm/HcyadA6Kiz2J7rWFAdWpH3/A4HEq
	 IO4ENmlJjYtkKCQiT6BwFYuFIhiNHIs0KDxH57OIxVQ5Xjit6NYYLF4UeYjBidUEs6Plb
	 mv8Vh2aXOMqYOlYliDPq4jCaqStXSZXkiR+YaLAD2RzthPSp0pzmHaFsu7VBdVVpXz0k+
	 6wX0DoUj35G1C2MrHYeOEJooOY63JZd0q0O1T7h/ohGCfASyC6TNZMh3hR3QsxZ0RYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AUkvvChy;
	arc=none smtp.remote-ip=209.85.160.226
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94104606A691
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94104606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=AUkvvChy
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-55c38cdd5b7so12123401cf.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452527; x=1796057327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71Th2TF1+CZbBFg8quMQHhhil1oILjqdxWZFapcLOtU=;
        b=aoc/Vk+WDGbNN3TLXPxJVlq5QWqay+b/V6TfDjZiuq7WYBiICEpV0SM5laCDbAmZPm
         ie++Dw+i8GC3BsMvLk4WgucfmRO3Xc9iEUmIYygPymkW16oX4Ku9UBpQW56wcuNXQmYr
         buiOttyTMe5VlLExXSRxd/zCzmn0lrYU5KeeTChQCdYpw3JxdwhsE/sZNgTy/iKdsKEo
         417awxe98PpPHkc68ezv9v7WY+Bvhy1T1VNksmqqjeS8hP04hzwY4WVRPDmlkFL+61Z4
         nYyVMovUH9k6nulErfBYabWmmFE+18TFRnfuehFVkzYkgTd9em39XGUW15s9EdFC9mTT
         qXfw==
X-Gm-Message-State: APuU4Z9vlKUtAla1OzBVgboCd23ucJaNmsvpJOaGUWgzRSTTEAie+MPK
	KbPi35Ytwa7mtrt/lvvHCffUZxA/AOzH7SyxoNbSekxKCVQeildrwLTPCICnnDehgLHcBDg/D0n
	Twh/NaV+N6MKP49C3JJsw8ZFg59uAPKUE8mELmy6HO0BRNzwAE1WwruPg5+aWEK9Zhx0F0xvBfK
	JVqc3LrotbxAMxUEA3efdb9NROHbMBIhyw7rSHz2R6kkp1qHVed7RgoAE72K6BHD/QeIyktGsDz
	jO/pXxPZIrg4SE9
X-Gm-Gg: AZFdTZekV9NPjSr0eW6qyUK81fwrnQ2NO5g36VOIYFViz/DjdXqaw42cd/It0MJ9hGQ
	1JZW9TZTEc/6FJhzoQma2uiZ8qygQmCHNErZhL2aEaPxxMkndDNUsWc0Jt3yCPdyre7amnKuInj
	vLmvxlJCTs+WqEeApa1sJX73i0WqMJ2IfQoyJFwvedRCu6ZfRzS25pdhnzEQYz4jnTOGPgqs/m0
	xefUH+7TfBgWtyhcziqw/qR0HC1obEu6wGcmEObuiayMu4yBIuYLBM61RNqzaLQ89wlUH5ER067
	Ne1zkjr2RjQud1N8+bYKSVqc5sbULgKZIpdC65kOdJI+GAwqaEBlP6xj6LLrAtJwnStAQUAULBm
	9cRLr4nXeLKKsS64SP/l0/z0zMMMy0ccMv/Kypx7wz4JMOnUZz4QcGzwICsd24/qLG2f0b7Cfhi
	8ZWcqEpLQGZEELMKwmcNO16jRLKBsERgesiVxN3fts/s4=
X-Received: by 2002:ac8:5d08:0:b0:55d:2caf:ae85 with SMTP id d75a77b69052e-55d76a1e921mr223447331cf.18.1795452527353;
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55d7845200csm876051cf.5.2026.11.23.08.48.46
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:48:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92104826f9bso69914646d6.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795452526; x=1796057326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71Th2TF1+CZbBFg8quMQHhhil1oILjqdxWZFapcLOtU=;
        b=AUkvvChyPELCBdt3yJvqSWozkiDnIVCCmsPqAdHC3agi77DIMFWEPVS22DqjKUZTRh
         KuYXZs4kp7Dv9HkKot8zc/9S8I4uZoXB5xFZK3M8GB4/usWUulMb+kr4hTUyq2H1MD87
         PFn5vGIlzkO2AiFAlAh+fQL3uYw6US4YjL270=
X-Received: by 2002:a05:620a:8387:b0:939:f49c:1b30 with SMTP id af79cd13be357-949ba99cd63mr1846269985a.13.1795452525420;
        Mon, 23 Nov 2026 08:48:45 -0800 (PST)
X-Received: by 2002:a05:620a:8387:b0:939:f49c:1b30 with SMTP id af79cd13be357-949ba99cd63mr1846263485a.13.1795452524624;
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm853020785a.5.2026.11.23.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:48:44 -0800 (PST)
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
Subject: [PATCH net-next v6 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Mon, 23 Nov 2026 08:48:32 -0800
Message-Id: <20261123164835.1733304-2-florian.fainelli@broadcom.com>
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

Errors from the vendor MMD presence check done while reading the
identifiers and from the reads of the per-MMD identifiers themselves,
which only happen once a device has answered, are not mapped, so a PHY
that fails midway is not silently skipped. The kernel-doc therefore
documents "a negative error code" rather than -EIO as the only
alternative.

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


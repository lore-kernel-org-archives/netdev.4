Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795151856;
	b=y53c0xdjbpijV97zrNSg0WQZWTpoiOSIpIekBRCr47KFZ5IvqqgZ0lgbG6NyTfp+hi6O
	 cKruiB1RtUKOyyONToKuiPsDTzmtHinaisJOydU6bkZ0VTq4WTwQWqbgDbi+CdPy6VTxY
	 Smgf8lgZZX+Z+Sty8EqAqFgKMAZKVKU6P4xA3qWlIbuXOY6m54haYTUbkr4qGAEwiRN4k
	 5YEYWNIzq19jHqNFtZdu/a/gl6ndNMCcWvQ5VAqrGQCOs0QMn+grI8vnT9L7/ILOpJPoK
	 0961E2DGxTND7J8Zm3jEBhTLMyQ9/RHIxd1krcyRMyrLpCU1C/m139YXa2K2sfHX9/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795151856;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
	b=J/Mk6CVtd7kJCPQ6C4rxMUPELhHuzDVM/UUhrO40R1C1JsZRwP1J9Sozp0kZXkG5aZf2
	 0wr65Bt+NA7JmN7SYpoialTH24Sfn8L0cO5EYbein0KF6IaACg2Gdpbri4xr/hQ1Fzd7N
	 rV1p18NDLPFv7aiKb/WFTZ2SQI9NJjR6s8WeK7Cu0uRkzUB0Wx+C17x8pb41E1qQ/72wS
	 oH/SXpM9ltIEXKm9cBbSWESBFHCYKoDjFSzUPcjYQ7v15pc0KmrlqVnXVkkU9Y1vDTh+g
	 vf4IykGGp9BnYn+AeTSAHhjYghbBBvSQpNbgzMFji1sP6RxTdYPMII+HyFY0z8b6OPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WnMsA6F5;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CAC606A338
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 05:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CAC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WnMsA6F5
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so242003a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795151856; x=1795756656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=ifmKHSx79ZgwV+DZ5Xrfom+okSOyCQzqu/Ry544RVVImaXuOU+B8bzD4aSWH+UQ6rp
         QtNXYIHWk9jiYA/1f43tG7AB1zUXKqwX7XLDBpxKSO4jm0F3cs3M+ckf+PtDdJuHaB8G
         DO2YvmCiG/6AwzPz1tU9brw+7P3j4SZUjvmGVdUvgWRiblmVS4OpLakY6aYoW1puBLKD
         JfxAOMVDxPEDmLWp9I/CYsm8l6OzCKx4yfNlmxchX7tlb6X2eyU8vmRJcbxHw+JOj6Ey
         TGEamcb8qpoo60+q7oV7dttv6fgnnkHKsglN2NGwvTc4qZa1+eVmR5bLIwx3q/dSaUaA
         Ruyw==
X-Gm-Message-State: APuU4Z/NugsIhM0NsRW3jHq38gk+p69HMatcZkrCEJgYQyKgo3g8J4hD
	hkx2WnXKnLSr6Rh0RCN0De90CvCZfJ3hhByqWrxYSdUdCIPkioZFrmV9CYhdpiauYfUhlPbBrmB
	1XUd2O1GYfYKBh9Vd+/ElByM5BkQ6lYBVCO+Zil56Ulj8Dp7Ss8/K8qX0oHalC75Wrve8Y4gq/n
	Q6mfwssFO4B9RqDoNfL6rWBe7h7a6b9/yzodirZE5kOvtMQksWnmTo/h8858zmLECWD3FV7jIqS
	xQKgwiTsUx4BCsK
X-Gm-Gg: AZFdTZeDUtoCICUt2n6l2Ho8Dz6SYtDiRAR5vj7+PgunfryGSmPLU5USo7e5xIZNE3+
	xejHfiRSbe4yi8yjJhlae4pKR9pGTZloBalAfXj3HWB2025zTSz4wD8AoEzMcTP1dLHogCmwSgB
	tMnvDHs8P//QHH83Ap/kUdCONcxD/vGO6VNz1nYIbgKjUvKRNvrRQWikJSXrAvdqgcySRdbiJ/L
	Ob97Lyyv+Yi2d59cwxuodqxrr/KUNnm3MOvNUYPPpTz8UgxeMqb0hmQom7j4EuIpxYfTsAN4C4F
	F1Stp+douTolHOS48kw+4sbAiINkAziok8UGws50gjlqrXyux3arPm2Sjb9Nq/8qkui7pGCT8aO
	Ki9MTSrl3oQtuqVovmvnfSp2NCaMFb/gBFbFKfGJKwtZkneHzQbwtNqGVy17aiEidMG8Y98929f
	NlyiisIoFslpaxutrOCENGTyGeHoPgO1r4cTZ2Gykb
X-Received: by 2002:a17:90b:2fcd:b0:3ac:9176:e82b with SMTP id 98e67ed59e1d1-3b41c95a18amr1562440a91.54.1795151855515;
        Thu, 19 Nov 2026 21:17:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b420017844sm362414a91.3.2026.11.19.21.17.34
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 21:17:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso98520885a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795151853; x=1795756653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=WnMsA6F5qnLQLWHLIrohQO9Wxh6vZR3FQieeEXR+lH6+LzZjdqdfswRtsO6lEVXnGG
         dHpI3wkWVzyu7A66e8Az5Vhq8rZVqwcF8Afxpw6sorQCj0wq8t+2PW1VaO27JSY4WZTW
         9+O8Z2193bPb5FVF1+aMODCIInwetm31m7yv4=
X-Received: by 2002:a05:620a:6496:b0:93f:3219:835f with SMTP id af79cd13be357-949bab74e1emr297836285a.81.1795151853170;
        Thu, 19 Nov 2026 21:17:33 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:93f:3219:835f with SMTP id af79cd13be357-949bab74e1emr297832785a.81.1795151852570;
        Thu, 19 Nov 2026 21:17:32 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f2de5sm116377385a.29.2026.11.19.21.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:17:31 -0800 (PST)
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
Subject: [PATCH net-next v4 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Thu, 19 Nov 2026 21:16:50 -0800
Message-Id: <20261120051653.1433677-2-florian.fainelli@broadcom.com>
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

get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, so
that mdiobus_scan_bus_c22() carries on with the next address when nothing
answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
failed read of the devices in package registers is turned into -EIO, which
mdiobus_scan_bus_c45() treats as fatal and which makes the whole
__mdiobus_register() fail.

MDIO controllers that report a read from an empty address as a bus error
(e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
with unmasked addresses therefore cannot be registered: the C45 scan fails
on the first empty address.

Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
mapping as get_phy_c22_id() to the two places that look for a device at an
address: the loop over the MMDs and the MMD 0 fallback. In the loop, an MMD
whose read fails that way is handled like one that reads as all Fs, except
that the remaining MMDs are not probed: the scan goes straight to MMD 0, and
-ENODEV is only returned if that does not answer either, so PHYs that only
respond on MMD 0 are still found while an empty address costs a bounded
number of bus reads.
Errors from the reads of the per-MMD identifiers, which only happen once a
device has answered, are still reported as -EIO.

Fixes: 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV fatal")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 48 ++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..79f3fa1e9a03 100644
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
@@ -810,8 +823,9 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
  * the PHY identifiers for each device. Return the "devices in package"
  * and identifiers in @c45_ids.
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid or no device responds.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
+ * reads that look for a device), or %-EIO on any other bus access error.
  */
 static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 			   struct phy_c45_device_ids *c45_ids)
@@ -844,8 +858,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
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
@@ -855,7 +881,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
@@ -1077,8 +1104,9 @@ EXPORT_SYMBOL(phy_device_remove);
  * phy_get_c45_ids - Read 802.3-c45 IDs for phy device.
  * @phydev: phy_device structure to read 802.3-c45 IDs
  *
- * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
- * the "devices in package" is invalid.
+ * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
+ * no MMD responds (this includes a bus read failing with -EIO or -ENODEV while
+ * looking for a device), or %-EIO on any other bus access error.
  */
 int phy_get_c45_ids(struct phy_device *phydev)
 {
-- 
2.34.1


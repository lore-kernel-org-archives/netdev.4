Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050000;
	b=B8As56z4ZCsCbafe/zQkV2Ip7BQGxQETiRQ0djfCr5xCF5hB2Rxm+/OTwq+PUqyleJjc
	 Zzkhy3GbFWMjbUuua/asYV0p05ukrKOAYaYlRBw0Pc1I793ZRr/Qd47YchwYOxwX23q8G
	 2vybeMUZ6UAOR/CbT2C66GlIQklm7W8LbOq/0HM6X3ztVmqZ2R/w/fOLV6eu+ES6v5xHj
	 J9JCGTDTavNTl05rgcDkP8g6MmU0QREgUofmQWF67uldta+6H8Om1AHNUWZnRE6vwpyv+
	 h/hJdTp6Sd/8q6zXM5fcu13jXWnA/+IXtq0nq+gG8fP945HyMv4mEHYEP6zTgVJuPRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050000;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
	b=lWzBYNlLnT7BxbuLkKhCtCpdT+fYYOFVLhm8Uls5bW+x42UMtmrdiDskrJBGQl9Lj8ym
	 VhA3F0+3Gs7rdBGHoX8sHwS3Id/poIFGTP0OYjNaIP/hFcLsDxwMDOznAtsj2jkQwEiGQ
	 gJToD3c1ANPwykLoY/BG3AQYzrBai9TXitmCDUBz2K2N4ctPcUmVsg6K2CfFy1Y6MMeEl
	 xj1nR0K4ElF4V986p3W7dOup17VcNU3ykCV0nqRvDkLpvwyUBL/WvqsqI4mBXjbqmAZjQ
	 PAUa/5Ycs3ObcpRmFPVrLXmItPgj+J0Ppcc2sG3h9Pa+R0GuyUQlQLS8JSqNpcZI9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EOsVzpWg;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9092760A260A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9092760A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EOsVzpWg
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso861927a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049999; x=1795654799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=Ara96f9Uv8JIzwAp1nNW4A/v/oxFYq6GchtnApNjldw9xpiQbGBWpvsKlnYJDTrmVn
         amKy6AKoC/to9acxO/OJZT1KulID1o4+LYWcoaUc4HbrWlnpcetvT7cOFjEBznGAPwe5
         7sgtP4zMoDwP9w530QtU3pCJZkm8OGupmMOXVZNbdK3vtssAXdNcoSjZevW4+ehTStB6
         vfFCx40y75hfgCCQCjssd0Vz6zOhGWym6MUNLMrKRxrecZOqZMNZCoE2atgq4JarFXWH
         EVZq3FKATCczLxcsNb74bczyselvy74tFvgTHogFUcBRLNBhhyZuqHqGy6qpBwNUWHmx
         276A==
X-Gm-Message-State: APuU4Z8w8ogtHXnqDfusNXa7aovR4JgSniZC+d5ojJ1fn7cCHC5RcHbV
	6st/q/o0j8v6WGOrHv0AyRl9aq7k/SGjZ5zkRpbofztQ5yJqW4jwOw/NZjrsAcpMxGnWd23wV0F
	HxmYkrvkK4tGioJZQR9qMDz3Txe1/vfKn07RpHqNYBlH7HAdBrc0etJDaOm94VbBdPYW/GQekA9
	u6aYKXkmDtuCzpf53QdXn/rHobp1heBvvnl72jYI8G2WLTOyp6ywnW4VdW/h7uOHkvlj5TO7iRF
	MCsLFrxLjY10JnY
X-Gm-Gg: AZFdTZfBZaSvVFYVwqijNY2RdCiajfuPC4pqJQXHkeBNCG7HPi4p81g/wYjCRZ8MpGJ
	hJSX/OZchRRZ3nM7iGgmb9fQm9I1kXSAIAZMAPzivASSTqksaQxOwPzIPZYrwJFgq333ZPL3MKG
	Fh/TmKHLcmG9fhPxupndNXX1frx47AKPDkdyjdBrriJ5KcjA0tm/4k93R0wvsqr6CIA0C0vNt2W
	JDWvhr9h+GLUwAPsjAMq7ZdBqXpw4pUXPyo0ZevHKbahZav6L/mq+vJW4d2PK0nVOpp95ODehAh
	uknZLh00UDV1mrAAG0qvpSr8c/5gGqIMIKomhTUrojCa6JOe9D7+357dhOJ775Tr1tSt8eRX/fz
	zRkN7ytwdHMa4gqcM5nvJTs8QP1AydAmLOKf/066eb0eLWtiNp+UvU14B0dsVXZDxJZoS3DESTg
	woabdMJ9UMlVRvdL0TSabXs7bgksDCzncVnaVijdxw
X-Received: by 2002:a17:90b:1809:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3b3d07aab47mr4345509a91.47.1795049998928;
        Wed, 18 Nov 2026 16:59:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3fe1fd05dsm334702a91.7.2026.11.18.16.59.57
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:59:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92101937b03so28083776d6.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795049997; x=1795654797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqR8IPHWCdN0LU2FwConSqcYqy8/D1QDNc5O0QVDFsY=;
        b=EOsVzpWgNVOdLi5C8NZVVP0Afe72NSY6d6SZluF9E4W1BEvtO42pVinsvAZTVVM1eF
         1GfkGrG4mun3ffg+yTddpALZWFKjANRmUrKj1yp91uIiNfnuYstsV3vye7ziiDkto86m
         qj/eOFN/5oinQCoKb0g2r3L8DmHoIFKSaTFcY=
X-Received: by 2002:a05:6214:5545:b0:921:1242:f2a6 with SMTP id 6a1803df08f44-92114e6805cmr70001686d6.15.1795049996492;
        Wed, 18 Nov 2026 16:59:56 -0800 (PST)
X-Received: by 2002:a05:6214:5545:b0:921:1242:f2a6 with SMTP id 6a1803df08f44-92114e6805cmr70001276d6.15.1795049995797;
        Wed, 18 Nov 2026 16:59:55 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d10f89sm35861216d6.13.2026.11.18.16.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:59:55 -0800 (PST)
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
Date: Wed, 18 Nov 2026 16:59:40 -0800
Message-Id: <20261119005943.999981-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119005943.999981-1-florian.fainelli@broadcom.com>
References: <20261119005943.999981-1-florian.fainelli@broadcom.com>
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


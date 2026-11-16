Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864903;
	b=45rSdBNrbXOM3P2scm9tmG3BLxEE5eKuKF7wh28NtmE+h654Im4+8vxDk/3xI+wRKX8d
	 Yo5pGHcT0BF+tS+b/iE88Cbkq/m3EXmBX2uJrNr3TD32asVOuiaBTMTTUtoxZ1zxQIV5z
	 LQcPJe0o4llvyiAy9Wa0IKKtbFAKw4d2MtDKL6sZ+vOaeUd6XTqn7wCaTYVYCV8gfJoHx
	 XosWI4k57P9awzFwicnMDGT4qWiASa/+v7Js/VQJho1zAZPZWvVvb9P1o8n1ZfH8C+V8h
	 cue90nHElXUS2J8sySTrgUjN3Q8j87AlSuhjNN1+XTwTJZeHV7oozUC7ptm5voiE8/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864903;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NAzwMQmbHMTyDl4Ls5F//Ccx/4nrGacZrVYBWG/Tmx4=;
	b=0Igj32es2YKjZBZgBw+p2doAMsqBFjwz/9RK3pagou/tRTHMoC30Jr1lt+wlsE2QdVgZ
	 eA2HfzS/mNjQVlL9+Qfry8Lrbh6bRdof9bI+6Zv2UrWQTBC4S5FUccV9L0Ium48b6u0+V
	 TfFtVnxCItf5lk4x57shF41G4swGImBtFZTkWWgWJd35OmYsxVLBz1HdgeLbRaKAoIy//
	 2WINqCpUCNd20DdUmKwZD0BHByXFGBUUZWcLPJ/Oc+U8TixWlKYcLxz86Ov3RdNLCpVxn
	 0s9WvdSqEWvdZLovfDD0x/y6HMQtQS4+FfEgPlfWQVNkbqKaIf+EQtOntph5jqqnbrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=byyYiqJQ;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F5606A336
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 751F5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=byyYiqJQ
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso2072441a91.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864903; x=1795469703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAzwMQmbHMTyDl4Ls5F//Ccx/4nrGacZrVYBWG/Tmx4=;
        b=2P6r7RHfrpM/dJ3lP4HESwe13EMZJ3wmTvMnx9G7NvqXd/oUQA5cveG49IydoZjmbq
         6EJ+iDsLfltuNAh8pbopGjUG77CDNJ+EqDzHn44Gd23GKRBzKW+JNOUdsoPhiu7jR0gj
         50RRSh5KXgW+IqEovE9Z6KrbsOsFiD8nqTm99P5IPaEWoRac1mYCEl1oU+0qM5UxphA6
         qRB5wrFNA5eX3XJqlq7f74szKJ++Vh5i9fJ/P9wX4wQxnWzmptKH2V5PgIpC6sGg4PmY
         keMZe7uWC5mKhjEfP3B9+tU7en2i9DO+AdqrmwfLlxiMOA0vuK+y27dMb2vRkWK8Mh8e
         8jyA==
X-Gm-Message-State: APuU4Z+QQ8czaSjdL9am/gDSh/XXOhB8iDUbv9M8TutL4evjCxYrE6XS
	D3KroPzCscvAnvkRjk9fAajTRPj38hIO7KRLjX+63/CosN61vcf18FA1RFgayNMUw9OsMBFaxRQ
	1NHErrxVrxZEUC3WtgdyEAutadBNcYJqqzdE1q8wD0pIVwpbbZGT9qYz/HTOaUi3e0xPQHJZ/h9
	9kkL41U6+bD6G7hNQQ1c4GesLUGJCHh3BgeFsf6SC9q08w57Huzvuo0JvmFLyE4qNtxGT5eIKGE
	SrE0QRwpvRG1rup
X-Gm-Gg: AZFdTZdu0hzi79SninbS/XKEAD+lvDmdD13htj3Ol5ntQAa6AOql6KTtq3Fxi0RGRXX
	9TLGUn/q4g8sZz9+p8pB3RyWkXhCuAC7KQrzkuJGWT+qCJWWMT3cSgbpCA/IV0j57ZdUREXLx2c
	Ijt4wVyGxLNdCchxvnNMlIsLwTYy4urMMVP8ojrgJI6COupS5qYswYZBq4T7r10yroIHSiyQUGy
	HgEKF/knEjAWeKcOc6pe/RnW/GYIEdoMd4NroAfuJfhYJ4iZ74Cm5XwA3p4ICTyLHCE2DjnHgro
	oUsTCqMmg6USz4+qUDzoC+3xLKpAVJOCWj+ovJ6oa44rr7y+7BDpBSkqzYK2Ypfs5+oBsiGtZMn
	2vB9fAPyiXUIoY2B+DmMdgYVL9B4Xx0l4509nftzH7RW3Kg0mvP3hHwz5t2aCVSnfs9nmDSBS26
	26ri6JxDkG+eTeqTDLLg0MPlkYzKfQY6DPkXPSGxR1
X-Received: by 2002:a17:90b:4b01:b0:3b0:abb7:3fdc with SMTP id 98e67ed59e1d1-3b1b0b94ecbmr12008080a91.60.1794864902596;
        Mon, 16 Nov 2026 13:35:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm417167a91.6.2026.11.16.13.35.01
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:35:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363763b556so76155971cf.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864900; x=1795469700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAzwMQmbHMTyDl4Ls5F//Ccx/4nrGacZrVYBWG/Tmx4=;
        b=byyYiqJQT9gMR6fHfTTmo6wOIBZb5xU/hT47SMAFSemEX3F+tSmEIZOx5pIG2MvT93
         ZrrHGNnQkF+pwvYTcTknbBwzkOSlrRjiVGYWaZvfkvea7sz0xGl41drmWCQHO1rAIeaB
         RRl06YiM1Ac2TaSEA4bzHwlFtPRNTAqfTpI9E=
X-Received: by 2002:a05:622a:1a8c:b0:55d:2d49:b5bf with SMTP id d75a77b69052e-55d2d49ce92mr111171181cf.68.1794864900221;
        Mon, 16 Nov 2026 13:35:00 -0800 (PST)
X-Received: by 2002:a05:622a:1a8c:b0:55d:2d49:b5bf with SMTP id d75a77b69052e-55d2d49ce92mr111170621cf.68.1794864899536;
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
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
Subject: [PATCH net-next v2 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Mon, 16 Nov 2026 13:34:46 -0800
Message-Id: <20261116213449.1682731-2-florian.fainelli@broadcom.com>
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
address: the loop over the MMDs and the MMD 0 fallback. Errors from the
reads of the per-MMD identifiers, which only happen once a device has
answered, are still reported as -EIO.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/phy/phy_device.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945cebd7..4071041e1051 100644
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
@@ -845,7 +858,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		}
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			/* returning -ENODEV doesn't stop bus scanning */
+			return get_phy_c45_probe_err(phy_reg);
 	}
 
 	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
@@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
 		 */
 		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
 		if (phy_reg < 0)
-			return -EIO;
+			return get_phy_c45_probe_err(phy_reg);
 
 		/* no device there, let's get out of here */
 		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958731;
	b=TI8DiTJVYA16xEHj1PpoqklmakHbRSiY6Y2xA9H9Cm2CAWxsHqK4NugvixDbEfxZcafC
	 z1kfPVSzBH+XMYuRAB5xdAS4iuMkTHpKaHo2pTmtDMpVQ1i6rKTe1zWJTxay9AU3wonBm
	 ZQ75JT5svg4HujxIAgsOTBF3eAktVU/QoHRVMIw8MVadGiKQX0325Mey63dpCuapoZEi5
	 oWIMSOUmqcq2/A9H8p3E0qGDah0VT6EF497v/8VUqbKS6Wfs91zr+ROMBNDh9I0Ypvxkg
	 fApOcYzGAUhHfr4kBYdUqrlyPhb2SsRR5heVAOROiGJjaSReEeOqml2DLfJhB/fAN1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958731;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PL+n1mALsSLmLKb2oPWwk2zFcY0qbXGwLsQIm50Rdk0=;
	b=mLok3alB1/nRhFYswjXM84w1paqeDxlxT9RiWbxgwFxXZCjG7eDvZn0c0+EaVenLgFNS
	 ZsSfEq85+5VFkVeo8Rw9LU/hxz4+58PK0n2hNkeUfZSs7jAkir7f+suikx2OZqbpVs3cc
	 5yxPgruxAoc7JQrKTy5SLokD02gpj7fqC4iCbA3th30VVx7pPbef87eVacGGYynyPm2WQ
	 nwYHCcB9v8ycoyylFweZ7qPMbiycZ2GMlzJ7XsfitDJb3w3QPFuoo3lZr3FybSiFJubhn
	 hksUqeK2c0+KkB0Y01Ia4WYiL45u3sUeeGp9ANe+4np2MZe5hHHL/SSMj/Gk3vqJviw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="cx/qzhGs";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD96606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD96606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cx/qzhGs
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so229784a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958730; x=1795563530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PL+n1mALsSLmLKb2oPWwk2zFcY0qbXGwLsQIm50Rdk0=;
        b=aswDp6lQtiNtPEx9TZmtRPd4Vg03fCQ6dWqUK9THTCauWRqHiTQIbyCW7v0xVNila8
         UjRLhpiG4tr+6/kD3Idhw/c7knclUf/1LY1iJEdc3ZqJTkka7qCLK4625wtJnJYZC3hW
         MeBerMjS+k4j73jKVrAikqGUNeAlslEh8djobBojBQ74bOKQd5BIFGdrWoGNERG3waV8
         hJybar42ja7pPivrty77mLwDr8JZzQxOc7dWIitxqpC1q5oXBhTM8PD5N8Uu6cFF/RU3
         9W1gb7mFN6D0Il/66I76r1GLQc3SF0QwntZCay0WR+/8k8M6xd4L8tO1r8lMPoT7AVO0
         M7mQ==
X-Gm-Message-State: APuU4Z+46iNKQjZ2LKBvtyTUQbyaO4ZHZOlrAHcevmvzoLX0OiDKkoqg
	MclBV5cbHrcRL0ZOF9CXZ80I6OHlmylocebqxiDyGmh5mdjJ0cm9PXZS4cTIVm2GIm7X5GiR9y2
	xOM0kU+XU2v/8fEK5NGw/t2T0hhSlgN74sF21p55gSsJ3o11iOfJCIrKzvr6eZkLlRqzO4SOnGa
	yPMkDWUgZxk/9fHJEbqk1OIX7/+mMywmOzL687cZlqWBxKy6i4oDGvKuBw/ljIbc3N/MfRwYYRN
	BUtoXjdhhNjOFyE
X-Gm-Gg: AZFdTZcvaHehZgwZ1Nq1ooWP7BJYcERFAk6h0tmi0Zz8KzudwY4lgXwCkC9OB8gknHl
	zFgxZu6unWdtygGEvh6bj0HPJMj68hFsIKFi8YodcXxaH6dPWyhUp+JpKbaL0TSd9Jh4i8P0rLq
	wAEgLFO/QiGSAs10OP1C4mgWmNcadAEnQvGLkcryl9AM8tMlfE3Myc/V4pgci4BLf3fYghSSIhe
	cJgQfV3dhSa+FFyIEDwDqJl6oR5sD6EqVOGtINoLAs5itvQRolvH0p4JActgFpq4mZOMCcP8ZQr
	ZcI7Tq4dsT1+pY1lwk+wZhdnp3cKWVRAi1K4PIdUV61a/CBs/Kf0E3VMtcXQn/pY+h0wd7mq8Kt
	Yv4JNjMGouIHRBPp2PNI8Zi5GXfYRZudKlHPHHQRonR7b37/jXI4KYdJx+FFO6X+CrEE5ms6B9R
	3UTkxzza9wqkkVhq3TNDmsquj0yQA06VHwYuJbuCgP
X-Received: by 2002:a17:90b:3e81:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3b3d07648bcmr955971a91.24.1794958730225;
        Tue, 17 Nov 2026 15:38:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d0eaa8eesm617195a91.2.2026.11.17.15.38.48
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:38:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so75113285a.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794958728; x=1795563528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PL+n1mALsSLmLKb2oPWwk2zFcY0qbXGwLsQIm50Rdk0=;
        b=cx/qzhGsmyVq/63/J1+sYvKGP1ITZPSInYnxN8387+Mgzi/Z+fIpJwx8KpwsWZdvm5
         821hzYekY0XpmySX774KCaoiXL89VZvonvjVb6dZLI9fL9TBBHkC1UYAl3cbWFLPkMJB
         bAVXk6k90jqrk/T6SkypUrf8/+waDZ3d11bIU=
X-Received: by 2002:a05:7022:287:10b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b543d4dbb6mr881630c88.41.1794958337077;
        Tue, 17 Nov 2026 15:32:17 -0800 (PST)
X-Received: by 2002:a05:7022:287:10b0:1b5:2988:eba7 with SMTP id a92af1059eb24-1b543d4dbb6mr881593c88.41.1794958336123;
        Tue, 17 Nov 2026 15:32:16 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c1193sm1389095c88.7.2026.11.17.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:32:15 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: phy: Map C45 probe read errors to -ENODEV during bus scan
Date: Tue, 17 Nov 2026 15:31:46 -0800
Message-Id: <20261117233149.1693881-2-florian.fainelli@broadcom.com>
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

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
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


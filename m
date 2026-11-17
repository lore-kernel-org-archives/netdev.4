Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943955;
	b=zUnuhQLZcZ7bD0AHTNXYdKiiMQ79YOZaJFfyIO1YYtFzBaIPPYOp/tFF4Gvn21smGiED
	 vRTSCUb1TcVh2HYMDkUI+qYad16n5J0N7vI5OqWadDRDQ6HVEYEUWnXcC9GwUWoEnfh5f
	 K9CcdDt6sdpiDQIirZgtNvg5IdeyjQLw5W0dbU+EpDmyPTqrkZdY50VOTV8qNfnD1ULg/
	 5Z8D8wMtkUtrCsw6ecLRB3ViJgtv44aOApoTy+MHxptxwc6WOOKCjegDBSZI05RQ76buA
	 DxHKmkvnWIGFNGyu2vGAuC3brUdVFDJiRm8ppJwTXxMi2jQ/nU+ArcakvBkSM/xanfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
	b=CfgVT+6pQsTyRyGcNflPt6Sk/KNGMk0tJkTZicP7rxJG9ys0ycaNY/1yPpREXXtUAdkH
	 NEr+uAc3yz+APyGC8tR6T8mxSilFQx6g2ZSY/Yq4uD0n0Nwpr8fKOezOuUflpxALRza8h
	 hEY7YmyZCmQi0otoFwc3it8hXu0PXZMy9BLpBdPB8nE1bugab/SbNYEcS+CjXXkvvGVny
	 E79iYJgRwH0jnepeiLlAf7bPlPEM2fQS9zW0dJ2KnJIVNqYTes1Xqmrk+Lnwo5dgBiKIm
	 rt+vUZZZS/aWjBRhiTC4wec0/nVfl1yi7q5ff3PFtMWejySQG1UgJgOuHIFdDuwAOeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0k8dyV9;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0165560A2600
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0165560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E0k8dyV9
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so324418c88.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943954; x=1795548754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
        b=E0k8dyV9EW/OAdU3DOJRo8EKjc1kVidZQjzanX0ozQRgWHftHd4k+vjxEvxt7/TMdy
         CcLD3BH3WgOkSJuFjpTOYPBw+C20B6lsIHc6z1yKY3MHhzYH06+RYI8TwW/awHs/5xr+
         iXppTGmsEAxny8An4TWQxV3X9AekLZ4YnPCpEz0nnPAKphadqSUgbCPDqRCtNWM9v4P2
         xdCm0P41xBF8VEyMJJeVa6z6UB0EEv2yW3d+9XTgHN2UROgjIquvRylffsFAavjm5Fms
         EiGe749qMzCdl46DS26XR0ODm79og8HIBtP3qQz6YUBcAmvEU+6Iiw528tW5z+idCCS2
         YH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943954; x=1795548754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
        b=KLVyYFfGrRhKfR4rgTBWelzaigpDXoafDzdfKVj57ik4kS+UCfAP/zELJuxNlydDTt
         IrMIj89B14OAdWvpSjHQzNinhfLktw3RMcvJD8eplVF6GuWKcwtGcltgvuUO+TuGlKiK
         edsqSmZ5nD5Cg4gR2nZbUrP4am38wU7h14Nsbj9zksU1xUPJz8sTU7l2hquLI+GWkzVJ
         GVr8xR6LfP1JTCjsNW9OJxXlEmZD43mk0o4pLjvjJ36VGIoMDgScwXTja+NxvkowL3Yk
         QJub/Eqk5YlDccHlOgB+82MDGbqHSyiEkErQphRagSDdfptVvdKmH6qfCkHIuW29LnIb
         Yg5g==
X-Gm-Message-State: APuU4Z8dIkx+7Cf/tAlLfD2GRVNTevN+di5NC6ki7iMm09tWGWF9LWsK
	y+BzChEJPXgMiGkvEhBG568WLEcuzpZDZVL0wmETKY5jjjs9mS+8PO61S650nQ==
X-Gm-Gg: AYBFou1FfaHCjvi2+SYLhoKQQGNpLqhPK59UfqTMezfpn0SS/EZwT7oloDT/InPqgyx
	tQbRNUha1iaVze+bW0nZ5lI0iN9acVbiHNHPxFy7rIwg4N9rOtjKMaYdgxrNtARdv+/8p1lXDsb
	55WcpEEoGRWapBgXwrwdTQFdXuh9BmdWzXwPFE96C7UkfEOzXL/Ilo1p0zUpS7uqslNBOkApJgg
	BeLiHcVqtvSFv7lZwC6UOv14KqMcLNvmmwwbwlBw+SX7Ww25CCT8AEwkyc6jVQUfbaLF9Tqxtz0
	sahy9MHqa2HDUfQsNjdR7yIZo/reRmxqtMiTa73uWIkjZyTXVjGKeFyhbAkKwZIjL89Jec7AryS
	p2Lq3YCs5CXCdbGJE/rK77oVLbA+jZg1B7vCK9m4Czaws1F+taTvM7+EPzFpnZSv5++9hn3xizv
	t+/f/GPAsNTgiOKhqc3jdL84Jsh3wEoh6cDhuQLI7h8cIL7DycdAzsX90lkYlhQhEKYKMhSBpT2
	Or991/FaQaoWEWY/txHKqbd38d44JWpjG9B05k3HHcGhEsfg8y4uluXylO6wfjMP+e3scaukwZ/
	Z1/2/SWx
X-Received: by 2002:a05:701b:418c:20b0:1b2:6a01:f55e with SMTP id a92af1059eb24-1b543d2cc00mr528114c88.34.1794943954025;
        Tue, 17 Nov 2026 11:32:34 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:33 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v3 04/10] net: au1000: report MDIO transaction timeouts
Date: Tue, 17 Nov 2026 11:32:17 -0800
Message-ID: <20261117193223.2795612-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117193223.2795612-1-f.fainelli@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
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

The MDIO write callback reports success even if the controller stays
busy and no write is issued. Propagate timeout errors and wait for write
completion so failure of the final transaction is reported to phylib as
well. Return ETIMEDOUT for read timeouts too.

Use readl_poll_timeout() for write completion with a 20 microsecond sleep
interval and a 20 millisecond timeout. The MDIO callback runs in sleepable
context, so avoid adding millisecond busy-waits for completion.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 7063f9e5bc7c..1935b1d4b173 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -41,6 +41,7 @@
 #include <linux/platform_device.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 
 #include <asm/mipsregs.h>
 #include <asm/irq.h>
@@ -278,7 +279,7 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "read_MII busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -292,26 +293,27 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_read busy timeout!!\n");
-			return -1;
+			return -ETIMEDOUT;
 		}
 	}
 	return readl(mii_data_reg);
 }
 
-static void au1000_mdio_write(struct net_device *dev, int phy_addr,
-			      int reg, u16 value)
+static int au1000_mdio_write(struct net_device *dev, int phy_addr,
+			     int reg, u16 value)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	u32 *const mii_control_reg = &aup->mac->mii_control;
 	u32 *const mii_data_reg = &aup->mac->mii_data;
 	u32 timedout = 20;
 	u32 mii_control;
+	int ret;
 
 	while (readl(mii_control_reg) & MAC_MII_BUSY) {
 		mdelay(1);
 		if (--timedout == 0) {
 			netdev_err(dev, "mdio_write busy timeout!!\n");
-			return;
+			return -ETIMEDOUT;
 		}
 	}
 
@@ -320,6 +322,13 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
 
 	writel(value, mii_data_reg);
 	writel(mii_control, mii_control_reg);
+
+	ret = readl_poll_timeout(mii_control_reg, mii_control,
+				 !(mii_control & MAC_MII_BUSY), 20, 20000);
+	if (ret)
+		netdev_err(dev, "mdio_write completion timeout\n");
+
+	return ret;
 }
 
 static int au1000_mdiobus_read(struct mii_bus *bus, int phy_addr, int regnum)
@@ -344,8 +353,7 @@ static int au1000_mdiobus_write(struct mii_bus *bus, int phy_addr, int regnum,
 	 */
 	au1000_enable_mac(dev, 0);
 
-	au1000_mdio_write(dev, phy_addr, regnum, value);
-	return 0;
+	return au1000_mdio_write(dev, phy_addr, regnum, value);
 }
 
 static int au1000_mdiobus_reset(struct mii_bus *bus)
-- 
2.53.0


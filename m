Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222106;
	b=KCXIbHf85l03opYXuSR1BtO881WDcy0ru0wKzgdN9nQhyI7wN/fDEgBqHWTRwsVTxy+P
	 JsLrzVCMIf1dXjWZ4/IsGoVsmmD/fUrUQUNKq/NKtnOXuKjn2BOAvyDo32O085zQ6JLrT
	 jqT1QUuZSuWv7UhoSLXt0/9TjUSOU3PTQ54SCpfCx6yiJva5eA9elGhAzhamk7wl4uKAM
	 sylZhEzriXjU2t76nU9OELOSPiC/hJThZdXRjwRdrN2+aj1D04iR5QPiEA2dWMOyo8KmK
	 vxybew8lzeYLL7iTNM8lTqTKcSiQH64/OChw2ZPcaV7gE9oKXV54mu2Ch20hxljqMCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
	b=qqfq4/BfykPKgDaIaWFd0nuUhN2WIYIoDArIWxYvhWdRNYm4m56z6yds+QRoRxjomEVa
	 YkVX+tRvn9LEadN3IX0/mPzHPfj0TjL0pVGzd7tLEhWeDmKo5/LzGY+IN2XVYAEjl112p
	 Wh90H9W9OfXknt5LFYQbyPwuFp03ZSRKpzby7eug/h7BcSgTcQLFH4wcEkJo60TXKnPGR
	 RbUoHTdjKhjUBvq6b7wgu5defywYko9HmJZqdrrpcMAi3gE7MxzQKquD6/AVFAehobKbT
	 qSkYkQ6PGDe9wA7u5IH8c31lXmOJQwNk4TRpa5p3dpkwzq8Az280gc7F6y8m3fYrv5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUPiSNin;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BED60A261E
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02BED60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUPiSNin
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so2364762c88.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222097; x=1795826897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
        b=NUPiSNinNOE/dru5Gp/+IBGhhuo/Y5Cn2DraaP1qfLghU6uYWO6qLjZG74Ga2/oNs1
         BVroTsGhl1ZTdglcJRtOvFxRJ43mVqDQ5xqejay3VmiTf39q31hgICnzZWuOi8ZWaAn6
         Txv0WKbLWtOhroZUQ6VTHQGf3vW2B6T9H449QgmgspcqGysy3Cs1h4E8JuYHvYyWjUaC
         pGJqCNybJ4yuQ6nO7kxPFcrhvlhTSDSFC0OUGuUg/j4CMpfolnrNCw3RuHxpxL8s0ich
         0prI+izaH0AHFS7XKG6BRiyRa44wHHhkKdSJ1p5Z0NuzLmUSIVtwC8tYtoSoKsSCZbUF
         tMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222097; x=1795826897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRb7JywDaOBMPCH2tWj2QCwMr3VPEjBdd/ccyMn80sc=;
        b=g4x6ga6A0M7qVMPgQX8d86CVYG52HqYx8RpSuEYXrvdHzSoY+pP3Kf8HVJ992rh29+
         neqN5K/tPZGY/A8ZFoxPTxgoGR558pObOwNQRv6xSFUd+syamteTG67aqIEvE3t2GuaJ
         ewUI60OLC1vV+DDqF7U1Bgj4v8FVUbDtYcMDgqO6wsO7hKyjKDbdtO6afTrhOOyk1fpl
         ks2EkxDpm9SW4KdOIHde+8qVMmF5lKGEpRT3I966yR86VvSjncDtFHTDnDHXobaQ3ZKS
         tInNH/Zay+Mf44hZHjKbdpGa08+zVBj+aCDJ+04I5fDFX0Oj3b8qiaMVhhrxfI5vjr5Z
         yYZQ==
X-Gm-Message-State: APuU4Z8PgiCyuaxb7/N/duG0dGUur5lmAvGxNRDzOg8wxEnhBzozMe47
	QTm5zyWRyg/h6N4lvkRH+hHbZEjjFC1KbzIl7ImELkpGlgbe+9xCZByBWwUBTA==
X-Gm-Gg: AYBFou32/v91wxGBVfhff0panLJOTmQ0ZVy1OUmC0WpARQVLzd1zVikFhkIJAyit/Om
	08T+2SFJhAAz+c3wYpBCwPdBrsYMaaCKofIO0p/OAgxP60+XgFu9u1Ki3Do+7T4ARG+UNQ054na
	KPCG7ECnPckd/s34euzmmxw3EZ/WZmN4c4MYu26oA0xbxpiTDQXCWMdOSE7HDqkilrv6ZfMlqu6
	cgWA1aNtXlSZn5qGd2EECPTuadUZqa4KOBUUmMyuKr01+ZfJKB+5dxzoXmeEmbC5IR7z9ZhZ2kB
	an/pc8hytiDxWB2suQ3J5rTgfTF3pou32oiWdP6PGGkb/pRCRz/fUmJP2yC1K5TbD5zmTe8aqiv
	pTLOSSo3xBYelbaCRxR4UgmkZCCHY9HwvX/duJAkqGEQX7m6MuVrxKRWTnAvZ/u++chW1hD1tnn
	pTquAHYde2aOs5H+yjqpdALljdZqdHy0uVAWEoKHiC0oLr/5W1QmUUp1GNGgNONroUEBTECxXIR
	x2Af91l7cm4llfV2bkSkNY/JuCuXyKVDtzLVBrFlCiKzgj+YdQ5MJcQIL6iHZ0SvJuGs/qTYm+n
	jqTS69aG
X-Received: by 2002:a05:7022:2207:b0:166:b307:5855 with SMTP id a92af1059eb24-1b556688160mr6355627c88.0.1795222097152;
        Fri, 20 Nov 2026 16:48:17 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:16 -0800 (PST)
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
Subject: [PATCH net v4 04/10] net: au1000: report MDIO transaction timeouts
Date: Fri, 20 Nov 2026 16:48:03 -0800
Message-ID: <20261121004809.1690280-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121004809.1690280-1-f.fainelli@gmail.com>
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
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


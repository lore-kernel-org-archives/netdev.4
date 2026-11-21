Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222115;
	b=b2U1fFuH+vKCVt575SLnCL5VbgbansBknYpAT+jJ5mg6DsdwjuHWLJKR8t5xrnv0OfyE
	 4oCn0kVH7SiXk5nbZDNQVuWOENqaqOgziQwkylO9BWz90KjJEU9e9mjtMkWb0AyjvSSru
	 of6c6hTPNowNR+dfa2oZWwnQPqoQ0jH42J3kSUa/QOGszpQG5IE0cLIw8IwQGO3TYaPxb
	 VgeY5JQgcXRKjQ/d4yXBAHwn7XhltZLVxlxJ4r2uILktheFD+EELhdX0/i40ehR202gml
	 5Klc2xGSUHB+Tj/CfjbCyrV7qVA+GCSoKjanNqF5C1PdWMrczdtA1sqHEEZ8IaIOGXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7qqLqMYKCvaS5jgNa1umq8aTiG6zoEnJeNEvsclCznQ=;
	b=d0qxlmpcqBkKdtr9bBRN00vpYl9kSdBigwHuszJ1a2YLOSYuejoUmar/kKBbQ0slPTTm
	 vxXF9CnCAEnj4OtBrYtgRPx2rig18HXYumkK7E1waUSH72ReQZRPG6QUKZAkHCZ4VlYea
	 8Jm48Lljtc82Wm2/s3OJN4bpQFuBWJJkPcd2I4xV3blAReDlMboIJ/OFdeioo63SAw0vr
	 S34o8WOvsSyzzhgEdAmYxU7ZrlxBE6Na6PKffdcJ4DukMhsdYImEkQ/EIeh86E/jUdkwC
	 mnzGNUsfAcNBLRRkqs8hSoQpE3jyrtlzsNnVrsyPFMOBYjr7UkXsiy1KSEAJYn1bOfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SehmhjNP;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECE60A5BC8
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82ECE60A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SehmhjNP
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so2068612c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222114; x=1795826914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7qqLqMYKCvaS5jgNa1umq8aTiG6zoEnJeNEvsclCznQ=;
        b=SehmhjNPu6RpgMTGHCqmVAisoK5vm7/PacUM3lwfdizvLwfoMo/8ptohIem6Pow4OK
         iJzOAjAVAAVKKsioYQ23fG9yTB7IApq8KoteDRXTt2TEKGG5Cjm9bFt+oSSUWIxeXQXa
         i5srhIVxq6q/DLfvbDXiM+kSd37StLiNmgkVxy5VoNaAL825vZFHND4QQbBUkUKMPfut
         0tI9a72TKH6JWgwTg2bLiXbl8ApcsBD4QddhDWuPj483c/Did3CuDCDU+rSdlHGBFQBp
         DcxQKccuHDI4D3zLHDoO8To0EjfiWAkUchgwC3Jnnlf/XDYWThI4EJEnWJXzq51TG5d7
         sNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222114; x=1795826914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7qqLqMYKCvaS5jgNa1umq8aTiG6zoEnJeNEvsclCznQ=;
        b=sjtF9YVzPjhhLl/g6r/gY6TksZZEuhoEALrBwteintYISsmMZXT4em6wWnEoPijGxR
         kzFK2uMySE5IIMe5KzxM+QjYSCiDDVROKYmpGwmMDwlfapHv7BJ8pQS4aSja/sdsWw2M
         CgoCS6Lo3r48LWAy/Hz4Ig6wyyGZnwbLnJDR5A1aaAXBNUAU6MG52dBx9pWqcY9YOwVp
         SdWh65SRiA/LdDaVfHtWMHlkvsQqBuSlkHffrQoj89eQVRBlFui2zOeBDKyLOfjXbFJa
         +xxqMI/HQJLDgXF8rzi1rzP5UysIJtSrXHLLgq3cEPTACgOacrm6LAaLQcSXOOFsrSnG
         nSgg==
X-Gm-Message-State: APuU4Z9k5NYtiG+1nwEUZAypvbgelpEUD2NXx3ysyr6+2mBbAj5WXc+d
	/isVo1pB19zJTIGpMkNJkEiAVKeVMDrfUGzBrOglg0E/PRF8S9Q4v7ap+Vr2XQ==
X-Gm-Gg: AYBFou3PPufkKvsZKqyopO9GZa7mxelcoWvSFSnmMY5ZuXZ2dBJTul3gqYvCxupRafF
	Os5LM0tn8NeHwRGpepqXrRRo3GVQUYI7cCDx4mp6LIe+4nfA0lCtMiG7OPaapBw2+zRa2W/g6fd
	vHNuipYYaDkTTid04DjngzF02n28o7mmHbYiweAuBgDdZ9O07lnDLeOxbCXHySKVy8oWJwbSOUE
	KtKX4wA+a0okScbiBznzuy1YHP2nRbOsklXSBrJnpZEAen9GX0fFp9JLfuOyUV72AyOOyU9Sdw4
	mOOGE5TzXsev95RmbGaXTsKW1hWyX2gLmMdRBYSBxiKRO1H0u5u1UDMRgqi5mrLbvGI9762wHgH
	s8pCVq8s98t1a5wLGiPpt7QnTQxx21FE08tQOSpM6vZwhXgXlQ9KXqG58nyi29pGUzF0RU2qHRE
	BK7Oe2AA+AA4dZngsIAYNy7uprON8RCFgoe3nkgQtgt8jGyzlFxQnpLSBr/gfCiWngtZgpsIEWg
	4vvk39uEqReK8gk6eWXVIqaG+G0tBN/QZuvEf9f2sBmq7ZU9P+Szs6BocIERpJqtHcrma0BaYf8
	ERgdIIv/
X-Received: by 2002:a05:7022:1502:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b5644a3076mr614332c88.40.1795222113610;
        Fri, 20 Nov 2026 16:48:33 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:24 -0800 (PST)
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
Subject: [PATCH net v4 09/10] net: au1000: keep the MAC stopped until the PHY link is ready
Date: Fri, 20 Nov 2026 16:48:08 -0800
Message-ID: <20261121004809.1690280-10-f.fainelli@gmail.com>
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

phy_stop() powers down the PHY when the interface is closed. The driver
leaves MAC receive/transmit enabled on link-down and enables them during
initialization before the PHY resumes. System sleep can also suspend the
PHY without invoking the link-down callback. MTX-1 can hang when the MAC
runs while its MII clocks are absent or still recovering.

Stop the MAC on link-down before phylib suspends the PHY. On open, clear
the driver's acknowledged link cache and synchronously resume the PHY to
restore its MII clocks and honor its recovery delay before MAC
initialization. Preserve the existing au1000_init() before phy_start()
ordering so the PHY worker cannot access MDIO or enable traffic during
setup. Leave RX/TX stopped until a link-up callback configures duplex
and enables traffic.

Use the acknowledged link and duplex cache under the device lock during
initialization, retaining it for watchdog recovery. Keep the reset-time
hard stop for paths without a preceding link-down callback. If PHY
resume fails during open, reset the MAC and release the IRQ. Remove the
unreachable initialization-error branch, since au1000_init() always
returns zero. Reconcile the initialization and probe comments:
initialization forces a reset itself, and PHY resume may already have
enabled the MAC for MDIO accesses.

Manage system-sleep PHY power transitions from the MAC driver. For a
running interface, detach and drain the TX queue, disable its IRQ, and
explicitly stop MAC RX/TX before stopping the PHY and resetting the MAC.
This also covers PHY states that do not deliver a link-down callback.
Suspend an inactive PHY without starting the interface. On resume,
initialize and resume the PHY before MAC initialization, then restore
its IRQ and state machine and reattach the interface. Keep an inactive
interface stopped and leave a failed resume detached with the MAC reset.
Set mac_managed_pm so MDIO bus PM does not independently power down the
PHY before the MAC has stopped.

Keep the link-down control-register update under the device lock, but
wait for RX/TX quiescence after restoring local interrupts. phylib holds
the PHY lock across the callback, so PHY suspend and a subsequent link
callback cannot overtake that wait. Retain the existing atomic stop
waits for duplex changes and reset paths.

Sashiko AI review identified the system-sleep gap, IRQ-off link-down
wait, unreachable rollback and inaccurate wording.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 141 ++++++++++++++++++++++----
 1 file changed, 124 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index ec28ed33bf69..aa5fa318b23e 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -31,6 +31,7 @@
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/netdevice.h>
+#include <linux/rtnetlink.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
 #include <linux/mii.h>
@@ -39,6 +40,7 @@
 #include <linux/crc32.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/cpu.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -368,7 +370,7 @@ static int au1000_mdiobus_reset(struct mii_bus *bus)
 	return 0;
 }
 
-static void au1000_hard_stop(struct net_device *dev)
+static void au1000_disable_rx_tx(struct net_device *dev)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 	u32 reg;
@@ -379,6 +381,11 @@ static void au1000_hard_stop(struct net_device *dev)
 	reg &= ~(MAC_RX_ENABLE | MAC_TX_ENABLE);
 	writel(reg, &aup->mac->control);
 	wmb(); /* drain writebuffer */
+}
+
+static void au1000_hard_stop(struct net_device *dev)
+{
+	au1000_disable_rx_tx(dev);
 	mdelay(10);
 }
 
@@ -405,6 +412,7 @@ au1000_adjust_link(struct net_device *dev)
 	u32 reg;
 
 	int status_change = 0;
+	bool wait_for_stop = false;
 
 	BUG_ON(!phydev);
 
@@ -456,7 +464,9 @@ au1000_adjust_link(struct net_device *dev)
 		/* link state changed */
 
 		if (!phydev->link) {
-			/* link went down */
+			/* Stop the MAC before the PHY can remove its clocks. */
+			au1000_disable_rx_tx(dev);
+			wait_for_stop = true;
 			aup->old_speed = 0;
 			aup->old_duplex = -1;
 		}
@@ -467,6 +477,10 @@ au1000_adjust_link(struct net_device *dev)
 
 	spin_unlock_irqrestore(&aup->lock, flags);
 
+	/* phylib holds its PHY lock until this callback returns. */
+	if (wait_for_stop)
+		usleep_range(10000, 11000);
+
 	if (status_change) {
 		if (phydev->link)
 			netdev_info(dev, "link up (%d/%s)\n",
@@ -553,6 +567,7 @@ static int au1000_mii_probe(struct net_device *dev)
 	}
 
 	phy_set_max_speed(phydev, SPEED_100);
+	phydev->mac_managed_pm = true;
 
 	aup->old_link = 0;
 	aup->old_speed = 0;
@@ -688,13 +703,11 @@ static const struct ethtool_ops au1000_ethtool_ops = {
 static u32 au1000_rx_mode(struct net_device *dev, u32 reg);
 
 /*
- * Initialize the interface.
+ * Reset and initialize the interface.
  *
- * When the device powers up, the clocks are disabled and the
- * mac is in reset state.  When the interface is closed, we
- * do the same -- reset the device and disable the clocks to
- * conserve power. Thus, whenever au1000_init() is called,
- * the device should already be in reset state.
+ * The PHY must be resumed before initializing the MAC. MDIO accesses
+ * during PHY resume may have already enabled the MAC clocks and released
+ * reset; au1000_enable_mac(dev, 1) forces a reset regardless of that state.
  */
 static int au1000_init(struct net_device *dev)
 {
@@ -729,12 +742,12 @@ static int au1000_init(struct net_device *dev)
 
 	wmb(); /* drain writebuffer */
 
-	control = MAC_RX_ENABLE | MAC_TX_ENABLE;
+	control = 0;
 #ifndef CONFIG_CPU_LITTLE_ENDIAN
 	control |= MAC_BIG_ENDIAN;
 #endif
 	if (dev->phydev) {
-		if (dev->phydev->link && (DUPLEX_FULL == dev->phydev->duplex))
+		if (aup->old_link && aup->old_duplex == DUPLEX_FULL)
 			control |= MAC_FULL_DUPLEX;
 		else
 			control |= MAC_DISABLE_RX_OWN;
@@ -744,6 +757,10 @@ static int au1000_init(struct net_device *dev)
 
 	control = au1000_rx_mode(dev, control);
 
+	/* Only use link state acknowledged by au1000_adjust_link(). */
+	if (!dev->phydev || aup->old_link)
+		control |= MAC_RX_ENABLE | MAC_TX_ENABLE;
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
@@ -918,6 +935,7 @@ static irqreturn_t au1000_interrupt(int irq, void *dev_id)
 
 static int au1000_open(struct net_device *dev)
 {
+	unsigned long flags;
 	int retval;
 	struct au1000_private *aup = netdev_priv(dev);
 
@@ -930,13 +948,21 @@ static int au1000_open(struct net_device *dev)
 		return retval;
 	}
 
-	retval = au1000_init(dev);
-	if (retval) {
-		netdev_err(dev, "error in au1000_init\n");
-		free_irq(dev->irq, dev);
-		return retval;
+	spin_lock_irqsave(&aup->lock, flags);
+	aup->old_link = 0;
+	aup->old_speed = 0;
+	aup->old_duplex = -1;
+	spin_unlock_irqrestore(&aup->lock, flags);
+
+	/* Restore the MII clocks without starting the PHY state machine. */
+	if (dev->phydev) {
+		retval = phy_resume(dev->phydev);
+		if (retval)
+			goto err_reset;
 	}
 
+	au1000_init(dev);
+
 	if (dev->phydev)
 		phy_start(dev->phydev);
 
@@ -945,6 +971,11 @@ static int au1000_open(struct net_device *dev)
 	netif_dbg(aup, drv, dev, "open: Initialization done.\n");
 
 	return 0;
+
+err_reset:
+	au1000_reset_mac(dev);
+	free_irq(dev->irq, dev);
+	return retval;
 }
 
 static int au1000_close(struct net_device *dev)
@@ -972,6 +1003,81 @@ static int au1000_close(struct net_device *dev)
 	return 0;
 }
 
+static int au1000_suspend(struct device *device)
+{
+	struct net_device *dev = dev_get_drvdata(device);
+	struct au1000_private *aup = netdev_priv(dev);
+	unsigned long flags;
+	int ret = 0;
+
+	rtnl_lock();
+	if (netif_running(dev)) {
+		if (!netif_device_present(dev))
+			goto out;
+		netif_device_detach(dev);
+		netif_tx_disable(dev);
+		disable_irq(dev->irq);
+		/* Do not depend on phylib delivering a link-down callback. */
+		spin_lock_irqsave(&aup->lock, flags);
+		if (aup->mac_enabled)
+			au1000_disable_rx_tx(dev);
+		spin_unlock_irqrestore(&aup->lock, flags);
+		usleep_range(10000, 11000);
+		if (dev->phydev)
+			phy_stop(dev->phydev);
+	} else if (dev->phydev) {
+		ret = phy_suspend(dev->phydev);
+	}
+
+	/* The final PHY MDIO access may have enabled the MAC clock. */
+	au1000_reset_mac(dev);
+out:
+	rtnl_unlock();
+	return ret;
+}
+
+static int au1000_resume(struct device *device)
+{
+	struct net_device *dev = dev_get_drvdata(device);
+	struct au1000_private *aup = netdev_priv(dev);
+	unsigned long flags;
+	int ret = 0;
+
+	rtnl_lock();
+	if (!netif_running(dev))
+		goto out;
+
+	spin_lock_irqsave(&aup->lock, flags);
+	aup->old_link = 0;
+	aup->old_speed = 0;
+	aup->old_duplex = -1;
+	spin_unlock_irqrestore(&aup->lock, flags);
+
+	if (dev->phydev) {
+		ret = phy_init_hw(dev->phydev);
+		if (ret)
+			goto err_reset;
+		ret = phy_resume(dev->phydev);
+		if (ret)
+			goto err_reset;
+	}
+
+	au1000_init(dev);
+	enable_irq(dev->irq);
+	if (dev->phydev)
+		phy_start(dev->phydev);
+	netif_device_attach(dev);
+	goto out;
+
+err_reset:
+	au1000_reset_mac(dev);
+out:
+	rtnl_unlock();
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(au1000_pm_ops, au1000_suspend, au1000_resume);
+
 /*
  * Au1000 transmit routine.
  */
@@ -1311,8 +1417,8 @@ static int au1000_probe(struct platform_device *pdev)
 	dev->watchdog_timeo = ETH_TX_TIMEOUT;
 
 	/*
-	 * The boot code uses the ethernet controller, so reset it to start
-	 * fresh.  au1000_init() expects that the device is in reset state.
+	 * The boot code uses the ethernet controller, so stop it and gate
+	 * its clock until the driver needs it.
 	 */
 	au1000_reset_mac(dev);
 
@@ -1417,6 +1523,7 @@ static struct platform_driver au1000_eth_driver = {
 	.remove = au1000_remove,
 	.driver = {
 		.name   = "au1000-eth",
+		.pm = pm_sleep_ptr(&au1000_pm_ops),
 	},
 };
 
-- 
2.53.0


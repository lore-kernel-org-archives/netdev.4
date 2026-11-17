Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943965;
	b=W9iuDcKKahBr+Z+RbJDlLlf5hbt5fofrkv+nUWaJiH+ejQBNjyJemceIsr3XG3qCMhs3
	 F5bexQnuv8BA13SpRQNUhPQS52L9DgomLYMW1nyKy5v9f4VTmGvsE2afTPm5GxOFJw71L
	 Rbhmpj7gYoVu6OYzXZv51PcIRyNSihYTPC9bCOytQVmF0nVnDwh75lxoEqM3hGColfKWu
	 oWnAx98mM2Ja4Fmv2LJCUXvAxrwQqNGhbKZAJwgRQ51QlXBe2cUghEraP9DycNKx4dmXj
	 BquNaXwAf3xEQePYt+Ur48EMihKAz1B0Ufpk5nwWrAgWrodG1LQI76BlBJoL7iKdGjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G0JmgKTq1UAcHJFg5FuOL28yG0XVNqgNLW2rv/cyKjk=;
	b=MKUVhrMS/6Ta2zmUzjZE/kQKhdsw/OOtjMRPzYtbeJsSujBb0lGQsRPsDUYg58vRqb7t
	 +mobhHh6bd677E+HprT0e9T60snC/FDAAty6BCqfEaWe9v+edQNL+Lxrad81oehgoYfM0
	 BNGPAnkijH2WicszUy7b8fpC/JdeVI+LbxZsQw6O1QmOMQ1RLe57yrz3c7YF3W9ynKiT5
	 p3vipR+PcJSnBeFAaObdHxod8Grexqd7RQiNMg5CAWzUc+cX64EO+wo4b5gaX4LoxKXnN
	 iuEON4t4dizaoP8kvPnYiQkW51//V9hGY1QeJNMn83zs6rvkeBOSfCB2uLzpDzh/2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMgohH2I;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5F460A260A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5F460A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMgohH2I
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-372bdb942dbso314257eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943964; x=1795548764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0JmgKTq1UAcHJFg5FuOL28yG0XVNqgNLW2rv/cyKjk=;
        b=bMgohH2IfrpZCOO1qjvqGdCZJAOXH8xw8KniJoIN69kX1cnoLbEICXW8Bn0xxc3qTX
         /c8wDUnF6gJrbGBq8jUBFlnbbEsijV03UPiBCX1M0rp88U6S4KWY08Y4pCPbOJU4XAv2
         BRpriQhUgi8vxPioiuEv/f7/SWa3gizHsfz63FFhQJQ+BvRnrhD4zbP3ZOfFJ2TU1rRu
         LKKzB8agZY60iCTIUfaU/6WyxNTq3xntv4OHENnysp8zMssmfwYnIm6yblZUdl4iE2oK
         OfRIc1RZm2EV84I4tUQE2PIigYwMomyO0AwPmgRdagm2tWdq+YDbKkMFvQWNU5r4M79v
         AR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943964; x=1795548764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G0JmgKTq1UAcHJFg5FuOL28yG0XVNqgNLW2rv/cyKjk=;
        b=kOmGfrZcNqZZO0oBc9iJZgqTO+I9Bs9UeaZCIK4xnWBx583s6fPP8YJqmc6giHnphH
         4/1iF+RENzryQcViNg1L0hwelAxOSPkkcD5ZCk6EDB6XsQ3sPbsqECHVPTYjHnfODISE
         mVv/VXgM6gpA96Qnw9kdP+r1cEizOwGu15JWm+L1z3tjqYwsAsZ1rDoJ5xLclU7k7jn5
         duwNx47PZZfgqUApdZCNXeZ7y4DOE1upR9CX1YPVo3XtrJr8fFPHmZAD04T5bcqr9JHW
         w+lHvjWuoiZ5WUFqF62dSf/DRmzSGuvEEkYHTqe9FhG41EXrCSgjiYmzOrqxstCfIebA
         OGvw==
X-Gm-Message-State: APuU4Z+TAL+q2N6M/4r8pFEfVndFNtMkwKFuRkW18hDvBjbQEW62DizW
	KpkcRf2FMBOdZeIoPV9XpqBbCAQ6RHdfspQbU2nexGV3nw5xv7A4pfLrrWrAvw==
X-Gm-Gg: AZFdTZdk+uTNwfG+79nAIrVbxOPUgvzUMIc9uSd5kpkh8O1sigbsov+t3lK6sX4cmE/
	K0nGAHJEYXSV6tUu9L1Gz39GUH9GcqdfR6W9RAkzgxUEVhuN7ulQ/V04ZZ6T65GDa5owL8Lmiys
	W2Yu+tr2JhHvVaOfP4Y3IsrviXRucy08wXnt+/dEXkWH5j5bbZ3txc1kSI/KOm6XLCerKWkAlhQ
	IF746ROpOOSa0hqvxjvmJ9ntXqJ8g8/O3QNQnidIj6paronsUzSk0ri1tBnckdf7HzFQh1EIbkr
	Ydgv4aGRVmJRrQ8gKavVU+dQpd9He2j363x0Cx+YcRIy2AdW0IgC9maX3i+RYWJje47Rio96Lms
	s6z6drYWKFPEAeQXKA2sK98ZwBfBsMgLWD96IbzpuumV1moBHAVcrsuNlOQ1zKMx/820F2LkgbO
	h9X/tsYSO0TGyuMraMyzbV0fttOwpm11QbRIfZrKLUSHKdwcGYQX+4sEtKCR8Cq7D6mHT6gy77b
	x60/0mJBq+wZW1tO8bAVvv3tb6gYmponBNRVcVaR/IBgNkquAxViYw7w5M+/w+ZApgCdSy+g9Gd
	jJpm90fZOXjqGzyBJa24kqMCNpDtFQ==
X-Received: by 2002:a05:7300:4307:b0:376:c352:2fcb with SMTP id 5a478bee46e88-38281020584mr469973eec.9.1794943963823;
        Tue, 17 Nov 2026 11:32:43 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:42 -0800 (PST)
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
Subject: [PATCH net v3 09/10] net: au1000: keep the MAC stopped until the PHY link is ready
Date: Tue, 17 Nov 2026 11:32:22 -0800
Message-ID: <20261117193223.2795612-10-f.fainelli@gmail.com>
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

phy_stop() powers down the PHY when the interface is closed. The driver
leaves MAC receive/transmit enabled on link-down and enables them during
initialization before the PHY resumes. MTX-1 can hang when the MAC runs
while its MII clocks are absent or still recovering.

Stop the MAC on link-down before phylib suspends the PHY. On open, clear
the driver's acknowledged link cache and synchronously resume the PHY
to restore its MII clocks and honor its recovery delay before MAC
initialization. Preserve the existing au1000_init() before phy_start()
ordering so the PHY worker cannot access MDIO or enable traffic during
setup. Leave RX/TX stopped until a link-up callback configures duplex
and enables traffic.

Use the acknowledged link and duplex cache under the device lock during
initialization, retaining it for watchdog recovery. Keep the reset-time
hard stop for paths without a preceding link-down callback. On resume
failure reset the MAC and release the IRQ. Remove the unreachable
initialization-error branch, since au1000_init() always returns zero.
Reconcile the initialization and probe comments: initialization forces
a reset itself, and PHY resume may already have enabled the MAC for
MDIO accesses.

Fixes: be9dad1f9f26 ("net: phy: suspend phydev when going to HALTED")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 49 ++++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index cb2f3333ba9f..98a75aba92e1 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -456,7 +456,8 @@ au1000_adjust_link(struct net_device *dev)
 		/* link state changed */
 
 		if (!phydev->link) {
-			/* link went down */
+			/* Stop the MAC before the PHY can remove its clocks. */
+			au1000_hard_stop(dev);
 			aup->old_speed = 0;
 			aup->old_duplex = -1;
 		}
@@ -688,13 +689,11 @@ static const struct ethtool_ops au1000_ethtool_ops = {
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
@@ -729,12 +728,12 @@ static int au1000_init(struct net_device *dev)
 
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
@@ -744,6 +743,10 @@ static int au1000_init(struct net_device *dev)
 
 	control = au1000_rx_mode(dev, control);
 
+	/* Only use link state acknowledged by au1000_adjust_link(). */
+	if (!dev->phydev || aup->old_link)
+		control |= MAC_RX_ENABLE | MAC_TX_ENABLE;
+
 	writel(control, &aup->mac->control);
 	writel(0x8100, &aup->mac->vlan1_tag); /* activate vlan support */
 	wmb(); /* drain writebuffer */
@@ -918,6 +921,7 @@ static irqreturn_t au1000_interrupt(int irq, void *dev_id)
 
 static int au1000_open(struct net_device *dev)
 {
+	unsigned long flags;
 	int retval;
 	struct au1000_private *aup = netdev_priv(dev);
 
@@ -930,13 +934,21 @@ static int au1000_open(struct net_device *dev)
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
 
@@ -945,6 +957,11 @@ static int au1000_open(struct net_device *dev)
 	netif_dbg(aup, drv, dev, "open: Initialization done.\n");
 
 	return 0;
+
+err_reset:
+	au1000_reset_mac(dev);
+	free_irq(dev->irq, dev);
+	return retval;
 }
 
 static int au1000_close(struct net_device *dev)
@@ -1306,8 +1323,8 @@ static int au1000_probe(struct platform_device *pdev)
 	dev->watchdog_timeo = ETH_TX_TIMEOUT;
 
 	/*
-	 * The boot code uses the ethernet controller, so reset it to start
-	 * fresh.  au1000_init() expects that the device is in reset state.
+	 * The boot code uses the ethernet controller, so stop it and gate
+	 * its clock until the driver needs it.
 	 */
 	au1000_reset_mac(dev);
 
-- 
2.53.0


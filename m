Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943953;
	b=SWOhJevQWUyt191D8uw4KtIX6POHPQTr9F+Bj3nwtc2GKJVMZtQPj/qOrJxcZVvgFBfb
	 iDg9NkRKOxlXWmQpe+Mm1gkBbESz3+c3PTLcGyUZ5LxpTI2vA+kn1SeooJqYrpVKE292T
	 L5L2oNgKoFuugjrOhHMz3gS+QNzYfdK66ORV5vwkvL4NdAyAMpL9hXYEtqghnj86BrQAC
	 +/+KTJMVUQ4KwS0r8csCgJMU+BALe0crd2fCuSsRfcuyAF2aSOMCq/MXZMVP4yeShltz6
	 Nf9HG7POHATAEQ/j5dT5dOMZ2FpYLOA2LXAE+4Y8GGYKpDs4R+Kk79wfMCjJAM78Cng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YsK4Y+BU4X8VndX/eSmg1WPSyHEdb+T/zxsyGWkS3A4=;
	b=rNlHWMmBpDNhM/Aq+aX+nNFPuCdXIslR3wauwuWX+FvNJyGljF8iimucLsazWPH3BMtt
	 vrOph4ML7dX4gwWovv/Dt281n43q2jjGawjcMpUy1Xg7KbujhGujRq0gJXi0IHC0R5Y4b
	 gNq8OHRrlDS+rUpfpF2xKXPU19hXLPG3Dk2XLV7VrSomy6/KEBB1f4V1iBrSuOixrGABM
	 Sta1F7R73tAhSC/mHhSukl11cH6oSLXNhES4paIN9chhlqdjJWd8voksvvwfj+YZ0nVKQ
	 VMwr2JC+r0XjkszqCFbGMDrBud4MEBfu92V6vxM9QMgjPJM2FiKQpTpDPboO+42uz5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNBSzMwq;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC2606A8B5
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 19:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CC2606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNBSzMwq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso551799eec.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943952; x=1795548752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YsK4Y+BU4X8VndX/eSmg1WPSyHEdb+T/zxsyGWkS3A4=;
        b=aNBSzMwqJvL7RvAsj9+PMFFAHFi8r5eXOc8W2sZ9i+nmUJwzdb+fiMg9wWiFjRt2Pg
         nVEd53x4hO2391X7hU2IJzcw3S25KYPDofkd7DQ1l5zwavmv+bE6MNvsmPR/LT5YRVgl
         XJJet7PNjMaNwH2tkPF0PgHmT3NTGIqoqqsANNdlJFiKM9VobK/MVZZ0SX7vyK4WqhHc
         rfUkp6kn2m+0U8Fl+RbN0Ak41DkqxYfqQH3hmlvlxYBmQ/SkuWYcup66+TeALuQ0tMFR
         fGfM5+RhVrNoRDU/1b8Iy92c2GatmyCGzr25qxivF2lnFSfPupALqgoF+G27y0ZRpfim
         ZH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943952; x=1795548752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsK4Y+BU4X8VndX/eSmg1WPSyHEdb+T/zxsyGWkS3A4=;
        b=ixH3UODRyEVUDXZ8hTvZxsd1e5XZJ4CtrURqviaQgbCkUqXx8ayQYRY9vrq6nTUeue
         wYIbI88zzaR+ivV4OaniP1C0uwb2fxr4ra1h0qtDrzJJRJed8tZDwrDzOmUig7nZOBWP
         9tJov4bWoGclNfsqs6svueji20x3NLM6321xsxDQZplkwpp6D+3R89zOQHGiWJv5JHwG
         lS+heO2LnhH3inVtJxL1cs8Y8gqO0VbhHuGgKSztFz4HhpPLboNbeLY9VC6LMDDDmBoO
         WaHy3YnkJereha5dLB0H7PRQC84/kT/2XAzBrCuTRPuG/d33rloHenh2ncKXO7Ykiiav
         RH3w==
X-Gm-Message-State: APuU4Z9ONpVPitDhV7SX/GaUAVJnTRh42pMMSGzmHddfhMEOf8f61tRz
	uP3Zo6V0lPMAY6gar3stZZWjxjIWhQNHPsQlRJr8yCZ4DUAhrXmvuhOerVC27g==
X-Gm-Gg: AZFdTZfXtoADFmI3mcI4bYMkGKQpXy3rfzrskr6qlNBJ5tgrvPtElWLyC3hKlz/vyg8
	y9YxPRIsHKt7z9K9I2Q4KIA8CGEwaUBnbLQkeY341ZeGwHIIKU8BDbFeXeInT421BOKhYUHG4xS
	xXWMIlOLsuFanVE1p4ReSw12oFqwNbjPQ26vHb5ackCVnMvuGQRCgl4Y0qJWJJ9xzwFnhwPaj3E
	HaZ3XDOE7q1/dv8LClNnvHlTyRhfbjzO2jtD/IJXuzOO/EABOglJ0WkSK7+evFXUVK8cd4uleQq
	eCTK18LNXLR2Q9lxuS+5SZAL87YQir2OxV+vR6YDG8WPEP/88YgH4DopeyphZq1XzWVvqax7ZWM
	7+4GwBEOJTOqXs7FGIGKkidMajDTQtDIKQhnjZjibgGaR/jVmUIF/jiFyhJr5RpRtyJQNs8hZYU
	EPnjD/LpbUhxCXEWbXARUbvEnO1tvB33bYranLY2tFFKmuMu6xbdZqhgpE98sECssBzSBsOFFQT
	6JsN7ByzlR6D8lhqMjuVnqBMIosIRwy8Eb7anv5Qz0QnzpToCLEyBvnAvcu9h04PnpWxoF4Fu60
	jgdgTjw4
X-Received: by 2002:a05:7300:8aa3:b0:378:314:4033 with SMTP id 5a478bee46e88-38281afbf16mr383068eec.32.1794943952170;
        Tue, 17 Nov 2026 11:32:32 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm173376eec.5.2026.11.17.11.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:32:31 -0800 (PST)
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
Subject: [PATCH net v3 03/10] net: au1000: disconnect the PHY before freeing the MDIO bus
Date: Tue, 17 Nov 2026 11:32:16 -0800
Message-ID: <20261117193223.2795612-4-f.fainelli@gmail.com>
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

Balance phy_connect() on probe failure and removal. Otherwise PHY
interrupts, device references and the attachment to the freed netdev
survive teardown. Disconnect before unregistering the bus while its MDIO
callbacks and MAC registers remain usable.

PHY teardown can re-enable the MAC for MDIO even if the interface was
never opened. Reset the MAC after PHY and MDIO bus teardown, before
releasing descriptors and register mappings. Skip MAC control accesses
when mac_enabled is clear, since stopping an already clock-gated MAC
hangs MTX-1. Always clear the DMA descriptor control bits and TX state.

Fixes: 0638dec01e89 ("[PATCH] net: au1000_eth: PHY framework conversion")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 58bc8e1b539d..7063f9e5bc7c 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -584,14 +584,17 @@ static void au1000_reset_mac_unlocked(struct net_device *dev)
 	struct au1000_private *const aup = netdev_priv(dev);
 	int i;
 
-	au1000_hard_stop(dev);
+	if (aup->mac_enabled) {
+		au1000_hard_stop(dev);
 
-	writel(MAC_EN_CLOCK_ENABLE, aup->enable);
-	wmb(); /* drain writebuffer */
-	mdelay(2);
-	writel(0, aup->enable);
-	wmb(); /* drain writebuffer */
-	mdelay(2);
+		writel(MAC_EN_CLOCK_ENABLE, aup->enable);
+		wmb(); /* drain writebuffer */
+		mdelay(2);
+		writel(0, aup->enable);
+		wmb(); /* drain writebuffer */
+		mdelay(2);
+		aup->mac_enabled = 0;
+	}
 
 	aup->tx_full = 0;
 	for (i = 0; i < NUM_RX_DMA; i++) {
@@ -603,8 +606,6 @@ static void au1000_reset_mac_unlocked(struct net_device *dev)
 		aup->tx_dma_ring[i]->buff_stat &= ~0xf;
 	}
 
-	aup->mac_enabled = 0;
-
 }
 
 static void au1000_reset_mac(struct net_device *dev)
@@ -1287,6 +1288,8 @@ static int au1000_probe(struct platform_device *pdev)
 	return 0;
 
 err_out:
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	if (aup->mii_bus)
 		mdiobus_unregister(aup->mii_bus);
 
@@ -1334,9 +1337,14 @@ static void au1000_remove(struct platform_device *pdev)
 	struct resource *base, *macen;
 
 	unregister_netdev(dev);
+	if (dev->phydev)
+		phy_disconnect(dev->phydev);
 	mdiobus_unregister(aup->mii_bus);
 	mdiobus_free(aup->mii_bus);
 
+	/* PHY teardown may have re-enabled the MAC for MDIO accesses. */
+	au1000_reset_mac(dev);
+
 	for (i = 0; i < NUM_RX_DMA; i++)
 		if (aup->rx_db_inuse[i])
 			au1000_ReleaseDB(aup, aup->rx_db_inuse[i]);
-- 
2.53.0


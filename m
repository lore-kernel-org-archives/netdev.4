Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222105;
	b=b0wOXO/kEZ6/C3hhixkd/MTMoxzT2/GEnwAnFL4FpnWI/ugMQJd1OijWzQSgOQAYwBsA
	 IecbcmhJ3VYgP+HrYxNmGS55KyiYXoqQcIIUx2azpxS4N61ee2AMdmsxQvhCV36gK9Or1
	 4Oj+hdCdewiylXpXpQIHzBVqeP1l2EDEQXJUVOs11PyWZNC6fY/vLadtx48MO3EBtVkol
	 clFNp6C72Evv3PucrzuKJDKRxTR4Afq7Flp4vzlPQzK8oi3My1K1RJH4tC4ocSC5W5kua
	 Y2a0YoXn/zjGuo4isB/4UE16c3AHalKKSlLOHsXJuq6/DQFI4oCRB/iRJVqXzqBmPGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b9PJJIu4bQ9HMFN1+jSlbTCxBQdsJOfTqw5Ep5NdiLI=;
	b=tQqhdGOt+kP6Kz8RhnedaPO4779J4B52Cze/dW+6NGnPCNTj/a0yCUuD/vwhIUhx1uQA
	 65xbfMnMEV2tCM7hqjstCX6j+oSq5q5yXAz17buQgPtsYCWtSMZXVqtpIMrJ+hrJTTs+u
	 gWQ6WxyV6MXje+i5WBrij4LoaKqYmRxrPA3RdzFlvTUmAGPHl+XABuaPiA13/PCNYkXED
	 YuN6afcTJDD0Y9oqhaeXaOOAlyYkOECjBkesdu2kbc8Rur8cQrzNlNjijJTM/Ad4uomvR
	 azAbOmKUMbjxhJNhddQCi7iYXlvyy8pH/MT6QqvuzIp4iUZfPl9Xws/5k/jiqrnuA8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk0IXWCF;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792F60A2608
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D792F60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lk0IXWCF
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so2026799c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222096; x=1795826896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9PJJIu4bQ9HMFN1+jSlbTCxBQdsJOfTqw5Ep5NdiLI=;
        b=Lk0IXWCFbmm14RCo3EdmECAtEr9YUVkbpnKYl9EZuVqfVRUi65y5MTw5hC2wEDsJZD
         zhZDsBwKRnrG3x/Pi/9adUQv6qpBh3lYOOjdWgoLnTZ8MHY0QrIrg4aZzGnt8xaH5A4x
         OuGdVkTvpTOOjfnIKTecsBUKuDOE7cHSxH8pl20uGjH6rigRDId5KN0WiONJqUDefzPX
         9gWKRlsVXUfp9wdMgmZBswv6kmiyy0CuwLe/XRoek5o71ivv3gxfo0VP+KODO4TcsEaf
         QdV7MIpfUI2ZGUQG5z0HmyFXDS5Qs1nA30tiivwe46ZQU6x1ri+hVx7GsPYVmKGouNWo
         sEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222096; x=1795826896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9PJJIu4bQ9HMFN1+jSlbTCxBQdsJOfTqw5Ep5NdiLI=;
        b=terZcvoG4Tg31eeCW37yudl6U72ZPE1J+CqNItGbANxug1PEVBT0xgPE6CgUrNvddQ
         g0XL0tdmj1zFS0BL7LjMUD5TEYl53mcSbAoX7HDTPs+PnTdReVZhEnmrT43zuTmYqJDJ
         b3sxTliI4Va3X8XN8hlU7Hob/i5xG+bpf4zvw93DF0VpyIB5Z4Lxtz/08FNd00lbJAfI
         +L9WIR4I6PfuM/+3PzTCxFKnrrowKlrqR7Tm96JcsErOoRtsGpUHaGVdRUKwp8WHprdx
         MkQbMrs7nECwt+x+7/yeTNjttEYkKvdvQ1gwZqTPokZP8Ym54Dy5ZzI99/KISGJr6B2n
         TU5Q==
X-Gm-Message-State: APuU4Z80uWveOWQfYeV2N+DrOtVmpKQOgqCFrA1djkjbhEPFgVCNoxqd
	6ilpNFVQzbE2mK6M7QDJLtFAAu5gbZ8W9IiWBe0Ha/JxLqsdqwTMGFYW5iMxtg==
X-Gm-Gg: AYBFou0uyReRLg0U7COZlwsWw/6paP7Bbcz1JjM6zWyzEBLTwCiUnhVXEYP1kAitGfe
	Wxaha+at/XNKHYsa7vfXFkaz73uA8ipCFqKSSxty5dsWIYsmPiSaWo9CAa18Ux65x4ZhXXtii2O
	fIAu4WiyrQf9/GpecKyRCdIcQ9pd7AKnbaBojSOEhQpELeen1ZDMsGobLCRqt/Z+JtrZUDPa/1V
	GRF38cHuD8ff3P2egdZNk4t/wDMSBs/18M6KkGNYyhZrY3WZhMzcWfUeM0vbbpvjGyNdT69VMRL
	JOWtEjo69BZnPBrWznJRcoz9nDm/xkAvvYpOp5Na4kmT9bbm61YeiPPaE66Y4svgk9Gue2cZtOA
	sj2ebhEyqCrrFP8vrn4Eh41NKOwwpFyUgoA3WODc09Ch8+A1JGRj5zeQy7IkRH4LRhkyqFtdlxp
	0Ok7Z0MVy5PIWKaRusRF7tVkwXD2qYO1vmGmeDx5n0Hv8KsD45UxTMFvilEdx9MgLC9gUXLv37+
	UIBOL25XcVFdM69edaZaaWxLJ2537RuLtHD+rbljzcKEctLEndgQtfcjCaoo6DL4VpFj+i5//3J
	MCPr+KsM/sk98Rlgt8JTQO0mSQ/dZg==
X-Received: by 2002:a05:7022:1e0c:b0:1b2:5884:a020 with SMTP id a92af1059eb24-1b5568700c2mr3779611c88.6.1795222095951;
        Fri, 20 Nov 2026 16:48:15 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm11462472c88.13.2026.11.20.16.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:48:14 -0800 (PST)
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
Subject: [PATCH net v4 03/10] net: au1000: disconnect the PHY before freeing the MDIO bus
Date: Fri, 20 Nov 2026 16:48:02 -0800
Message-ID: <20261121004809.1690280-4-f.fainelli@gmail.com>
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

Balance phy_connect() on probe failure and removal. Otherwise device
and module references taken during PHY attachment leak, and the PHY
retains an attached_dev pointer to the freed netdev. The attachment path
uses PHY polling, so there is no PHY interrupt to release. Disconnect
before unregistering the bus while its MDIO callbacks and MAC registers
remain usable.

PHY teardown can re-enable the MAC for MDIO even if the interface was
never opened. Reset the MAC after PHY and MDIO bus teardown, before
releasing descriptors and register mappings. Skip MAC control accesses
when mac_enabled is clear, since stopping an already clock-gated MAC
hangs MTX-1. This guard also covers the existing probe failure path:
au1000_probe() resets and gates the MAC before register_netdev(), and
registration failure reaches another reset in err_out. If no intervening
MDIO access has re-enabled the MAC, that second reset must not touch its
control register. Always clear the DMA descriptor control bits and TX
state.

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


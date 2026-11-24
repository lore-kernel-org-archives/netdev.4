Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479930;
	b=soz6qKKWn/ITBHuAoMDkZtycsbvw6dgqCsisllE/yDFXEZpnkv39t++wauNcIoFoq5oh
	 LgDM8b1XkCROlqXkUFdvqHF967KwpO+LnF5OhgtWk4YFuEEw/swGqYUTpwGkU4sdcG6yh
	 dUEVIkSKKx3uu6yMbwJNUym9uELc2WUzt6fZ/XX55YJ1Y8KoJa/g4FPpwlIrMV6n42Fyk
	 Ll4gi4TzDvxxQiXxTSy0nAHoaDe7Ls/4wfRmCOnmLTL4hV6Mr+kWnUAGas2wWQoINPask
	 cHYzr1fCHQLZx/SUf9Nv0XgRRRwgxiwIGZng1srYbr5yoXtuo9SEbkvahGgU/WfUYVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lUZ99bv3FccQMUlBSwl8XHxRByJyMiSRsybQv7SO/cE=;
	b=nNrOMcUAMkBNP2Qr0R28wxekb1qh1qt4Qxyh30hUmg+CfEmdn9ryoXL6XRPXWOUd1Vfw
	 iLTO1y4nFmHspSKMGlTyN8a4VFuqM2D+y5RBG7Df7r4+YqBnRE0BGVXixFiefuXHw84e9
	 jOBU+OSvbn/N4vFan5orIANWDH+g5B/QuSjhOI/B0MIdH8ROitfIZqfopdI5PxiO29q4I
	 FoGSuDjZI7UP+Mbyl+0QbUNZ00EE9JWsHlRsTjtMccYj0cRokBnfKf9gxENA1QwyikfVz
	 LetIyGEnlWEiGETvB/uNFnOuINzUzjyYBX6ZpEnHVpflCZQRlx7DBhHjxvrU+B2Bmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLsl6FJh;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F3F606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLsl6FJh
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso2513156a12.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479930; x=1796084730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUZ99bv3FccQMUlBSwl8XHxRByJyMiSRsybQv7SO/cE=;
        b=fLsl6FJhkrbXVe2IgbsFujG07M2gt9KrPNa8sa+lnBcqpVWJKL3wvToKaen72ZYyQZ
         ud89LxL4kc7QB6c9tS102AIggqvTQp90ZmheruKMIVf8xuPdhBCcXRAGBilSPFdMcDpD
         drjgDiDyH5Z4HTRLgIcRzsNO2VH6DAjdu5qJlkoA9KMOHPPWngNVHEOuOzSTigwWASGp
         dO0QGg/YCQcCxz1q+20yhX8RcgvKKaKL7y5ckJNwHKD1NjZv4e040Q09nosVKkxtnXP/
         6JEIUto5GdBIXekSdstJbg1IPNSmAq7qoQgBY5ykOys2PMcLOVykI3HyxK6L1touVzSD
         3B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479930; x=1796084730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUZ99bv3FccQMUlBSwl8XHxRByJyMiSRsybQv7SO/cE=;
        b=U/Ax3eFVjR/66dtjx8AsANc8t0Wpw9P+KDEUIbUzgOKOCUztDDIT2eflbOnA7KKpIg
         hy35lRBYsKEP2FfNk/cJpZinvnE8mgMmFDofuqOE3wbQ5v9ypBVxkHFK+jGlzgWYh68k
         yOpi0+pBrcq8rnXv1TFMqb0cOCsS2lm4iygA9tCYdh/fK6IDXFf7DycK89oYqSAcUW92
         u/VjIcCwG/1DMDy/OmeuSWY3sgbsoMDIdXWC9eHXSdTWhE21XHM9zs+6Zo2pCCuNSuWZ
         7K8c96VZZqlu2H02R4obe8uYMoiOeQZ6N09wx3Syn//+m0+76S2EFL+FfhJ2jypCIb+v
         Ybbw==
X-Gm-Message-State: APuU4Z99mIaukmRuanPUzTqMm8YmDW3UDx//tkXAkxSQCe9l5io0sVvj
	0lPMjtlTUlHQSEXcAu3zHG1pO1vGBOok2ye9QrIBu/TUbcbhvIlqbuXsjGIO1Q==
X-Gm-Gg: AZFdTZfypBMJgx6c58RvjBEJ9waQLRZmwycc4Q2JnkJ/15jLrZtREph14yl/ssLwuV5
	DYIKA8QsuiBICKWd6ExkGob0QbRFgpBmOpCz5KfTd+h0GIDMZiaWRR0JxNQ7OP33MeB0BycFnD8
	RHGjFQ82/CMsMoxIt7BlrD6QRUVQ4SX4QPPNCB66VvNmrwV1362Vd0b7RgIT/N5CK2Z07vKwtTH
	mJe+ijtMizcMaHRtKxhj3IXaKQSQhl8obt/CSdFgNNIBWf8gQ+XM/KqZyXDy+JvC67sLKiddT7d
	jADhHq/9oVLatIE1/kugjEz6My3+TPpnFeDJ+W0cUalkZyXHMvETaTlh7ftFL+DtPsw7+vdFzvX
	/SXEDW/aOKRbA58EDYqVs/xwBS44tnEP5oEdoaJulizM/KlabrSjbAhufWx9Xn2/GJtOpfGv/ih
	v5ltu01HijhH5SrDRnmHVZiro4HRfk9QZpKjaGg8MkKqaQELW3F+o7w1yZ7arlQIb5v1l5fOChU
	W81BcsDXML7eJ3KNftfYQ8JBqayPT3oCvO/4hZJKdD1d66cjeObqyrfob+P+u42zrQPWYeb1RDV
	qfA4VuRQLZOvIjBnavLvX6RuRsyOm4xJQchvx6AjWhbPn1PucUgVw7aMcT8aqkw5CtY=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr12513381a91.52.1795479929903;
        Mon, 23 Nov 2026 16:25:29 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:29 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v3 5/5] net: hix5hd2_gmac: Support fixed-link
Date: Tue, 24 Nov 2026 08:24:39 +0800
Message-ID: <20261124002442.19414-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124002442.19414-1-mmyangfl@gmail.com>
References: <20261124002442.19414-1-mmyangfl@gmail.com>
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

On Hi3716cv200 hix5hd2_gmac is found directly linked to another MAC
without PHY. The driver didn't take fixed-link into account and failed
probe when the node has no phy-handle. Register a fixed PHY from the
node in that case.

With a fixed link declared on the MAC node, of_mdiobus_register() treats
the reg-less fixed-link child as a PHY candidate and walks all 32 bus
addresses, printing "scan phy fixed-link at address X" for each address.
Skip the MDIO bus registration for a fixed link, unless devices are
described under an "mdio" child node, like
commit d0c3601f2c4e ("net: macb: Avoid 20s boot delay by skipping MDIO
bus registration for fixed-link PHY").

of_phy_is_fixed_link() also returns true for managed = "in-band-status";
give phy-handle precedence over it, like fec and gianfar, so nodes with
a phy-handle keep MDIO management.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 63 ++++++++++++-------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index a176870079e9..b787b7777e92 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1176,37 +1176,52 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		hix5hd2_phy_reset(priv);
 	}
 
-	bus = devm_mdiobus_alloc(dev);
-	if (bus == NULL) {
-		ret = -ENOMEM;
+	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
+
+	/* In the case of a fixed PHY, the DT node associated
+	 * to the PHY is the Ethernet MAC DT node.
+	 */
+	if (!priv->phy_node && of_phy_is_fixed_link(node)) {
+		ret = of_phy_register_fixed_link(node);
+		if (ret < 0)
+			goto out_disable_clk;
+		priv->phy_node = of_node_get(node);
+	} else if (!priv->phy_node) {
+		netdev_err(ndev, "not find phy-handle\n");
+		ret = -EINVAL;
 		goto out_disable_clk;
 	}
 
-	bus->priv = priv;
-	bus->name = "hix5hd2_mii_bus";
-	bus->read = hix5hd2_mdio_read;
-	bus->write = hix5hd2_mdio_write;
-	bus->parent = &pdev->dev;
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
-	priv->bus = bus;
-
 	mdio_np = of_get_child_by_name(node, "mdio");
-	ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
+	if (mdio_np || priv->phy_node != node) {
+		bus = devm_mdiobus_alloc(dev);
+		if (!bus) {
+			ret = -ENOMEM;
+			of_node_put(mdio_np);
+			goto out_phy_node;
+		}
+
+		bus->priv = priv;
+		bus->name = "hix5hd2_mii_bus";
+		bus->read = hix5hd2_mdio_read;
+		bus->write = hix5hd2_mdio_write;
+		bus->parent = &pdev->dev;
+		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii",
+			 dev_name(&pdev->dev));
+		priv->bus = bus;
+
+		ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
+		if (ret) {
+			of_node_put(mdio_np);
+			goto out_phy_node;
+		}
+	}
 	of_node_put(mdio_np);
-	if (ret)
-		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
 		netdev_err(ndev, "not find phy-mode\n");
-		goto out_disable_clk;
-	}
-
-	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find phy-handle\n");
-		ret = -EINVAL;
-		goto out_disable_clk;
+		goto out_phy_node;
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1271,6 +1286,8 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (priv->phy_node == node)
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
@@ -1291,6 +1308,8 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (priv->phy_node == pdev->dev.of_node)
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 }
 
-- 
2.53.0


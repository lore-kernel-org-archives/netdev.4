Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784900;
	b=e9UNg+KZ5TMFsT7l31S31jvLtnsz6iXJrivyM4OLm50jVUkI+X2Kwg9fE0DfYhXDrdT1
	 Jas/F7Ga0Kq9W4DqjiVe6tMURL7cQeKy5GSJY0D9BSCB+NAenBrEsLoTrxDQXlQx+pC+h
	 C1T19FN7emXJC0bmO0nvFtVyaKZtbcH5h2BzRiAT1CLTIafDFpi3iP7UzF3JYwwsl5SwC
	 ku4vOeKQ9ZzSKZ3K9TSdt+XvU+4WxpexaUtxaUadq7sJ2ihYlXXduZIUGPMSj6YP1SXH+
	 yK34uLqiIBo6ii1qY5ZLm3nug+UWKaR2quL6N/0rAGZHYnWkyQiTG3n9DURkJyBK6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=27jijJXTaPOAC8WqjWZiCuwobey/QH5o1iDWRvx7HR0=;
	b=PKTmzfLi3YjPA0Ax1PtdS1sCZlO4y6m/WIo9TKOTfJrzcnoW9EIC+murzUgIDcSIJ/0o
	 6q81CEsgHPPjXkaPgHtRs/L2S7j4Cm/Q21g8SMZofHIH1dBCuNcCJIYpn2PKkPBilM6Yp
	 Q3PR7MSSbRVVF6QEvDbr7teni2JlYOB3/GMIQYzg7J5bD2ZYGzB2VJR4kPX5Rp+lWQ3tO
	 4zQOxnroXL8dF92fNrIb/PMxW9rjjDqJ0YfWJzixjmGX8gt+SZr/D3LYJ84cf8Mh/MNe8
	 oyPiUMPmHeZf3N1a/Mbdr7q2Yp9oCrdDVI692iaCa2vjC1HmcADhxLB2bKKRJBWUTGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP+YTFuK;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD428606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD428606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP+YTFuK
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so4309746b3a.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784899; x=1796389699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27jijJXTaPOAC8WqjWZiCuwobey/QH5o1iDWRvx7HR0=;
        b=ZP+YTFuKnDyRWsmmUBxPcO09JC3wH8D+yx+Y2MEKaSJlg9urqKJbXrACSxEyNoaUNZ
         qWqG6vPlTcsKvjGvKihpTgKpsOzRoswTuTzhSaOGesE1z5Ta/m6Rh4gRCNVGRkf5LjGQ
         ocWq3OwrNLbVWAQ1PKb9V1WXsdRHWkAIAX1kk7m7+S7X9i4HC1DZxmwtENqYLzZKrHsq
         whPgD/1oGDEbaW5cyhaJ0g/yTE7ObBAfkKv42eZGclmEWbQ880R5L6+bqv3KFgG1XwKT
         93WGorLLpiXd+4osPHlRkPeHGYWSawqgk0XHEbnSqTrDmQppZKYmrJ8LdfWFQHtoF74p
         Vm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784899; x=1796389699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27jijJXTaPOAC8WqjWZiCuwobey/QH5o1iDWRvx7HR0=;
        b=pAA04oFONNmOAfc+N82tHoc31mnwokxaLbvZexsygpHnzV63+0D7q9JT7/0R6rC1rr
         LKmxFO2/Sze3X3Vs5Dl+X1DtviucHtE1CYnaN6SFgTr8hj3g7LWlMAstunAVOxE++pVU
         XQ0fwPE5ARZzPNnYqXcguBklhen5ML8ABvolwul7D0ewSa9j4qM21WbnX3pQoQJxG3jV
         wSNXuTGSM612S9JWUgQeqoDFmkZsct36LmQIaxYXy3Q1Co5OtO4Eiin26OCSzpDNjyZ5
         xXAaemBd4/irBBRJM/4DLBoegtJ8r8jZTyCBYKlxYf6NW9cjw9YwuGHTv/G7OKOtc79G
         wRzA==
X-Gm-Message-State: APuU4Z8/0b0IyECRcyziyxzcbIjt+mx9X99RzwitE/eyO4v8Q0hS9Lb7
	mwnGChfNYOE/0XZEm/XIGgXhYoIAK+Qf+l8W+3GcpiOlHyQba19mRMfc1zvG7g==
X-Gm-Gg: AZFdTZdyUmYzV1uDA08X69ZcCokKoXFRL00Fdl+cG5r1MNeVghBLkX8/do/qnnYh+RM
	FZd4G0vVkIMWFqaI8SlS3C2A89ElJm+yZnHchVDcj85uSixwM9WHzLqAG8q40y3l7jOH2kzV1hc
	8tgAJfv2qwdpLslSJ7UFD/JyldszjUau/IWeOZcWEqJgl9scGl2jIN0m60vkBLlvVae3k8N+0gU
	v1he1plvfJxJ7wzhtcij64LUX7kq+/F1rRrT1Pab/tkiteFSL+r9koI5xr/08npEF8Lme7qDT5F
	mINGbXYZjygZ09xMqhxEJN+Eh0Qp5xfU1vb482luNK+81m6cFSsuR4oRqeES1PM/iLsdONL2M/c
	hszw1SyRm57+hxnQqzTUo9a1tB3BFcLLkenYJ7EMh6TVB7JvIt9v+mRtV+zvZPBIFoGHhNPVlSi
	FRyOii7bn3lYCxAIGONlHqttZ0RFpg57lTRbz6y+fnXu4R/V9qEktzv8SlpCbfFCrILxShjxec5
	jvvbk6W3YsM+DqFu+Mkw7cPdt9MwxTSsBwXcOWuorbBuGU1nGlPTBSiMplO8b3CxBDGa6J4XR4A
	LdaXQRfAfh8+FVq40gvySsjE7wtyoq9lJavVJk9ZQK7uoWbId4oAOwE=
X-Received: by 2002:a05:6a21:3b8d:b0:3eb:2f53:bdc6 with SMTP id adf61e73a8af0-4014b564525mr29171561637.23.1795784898836;
        Fri, 27 Nov 2026 05:08:18 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:18 -0800 (PST)
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
Subject: [PATCH net-next v5 5/5] net: hix5hd2_gmac: Support fixed-link
Date: Fri, 27 Nov 2026 21:07:28 +0800
Message-ID: <20261127130729.1263920-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127130729.1263920-1-mmyangfl@gmail.com>
References: <20261127130729.1263920-1-mmyangfl@gmail.com>
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
give phy-handle precedence over it, like fec and gianfar.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 72 ++++++++++++-------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index b3b2aa1b7698..42c539d172b7 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1176,37 +1176,54 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
+	bus = NULL;
 	mdio_np = of_get_available_child_by_name(node, "mdio");
-	ret = of_mdiobus_register(bus, mdio_np ?: node);
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
+		ret = of_mdiobus_register(bus, mdio_np ?: node);
+		if (ret) {
+			of_node_put(mdio_np);
+			bus = NULL;
+			goto out_phy_node;
+		}
+	}
 	of_node_put(mdio_np);
-	if (ret)
-		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
 		netdev_err(ndev, "not find phy-mode\n");
-		goto err_mdiobus;
-	}
-
-	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find phy-handle\n");
-		ret = -EINVAL;
-		goto err_mdiobus;
+		goto out_phy_node;
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1271,9 +1288,11 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (priv->phy_node == node)
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
-err_mdiobus:
-	mdiobus_unregister(bus);
+	if (bus)
+		mdiobus_unregister(bus);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
 out_disable_mac_core_clk:
@@ -1289,11 +1308,14 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
-	mdiobus_unregister(priv->bus);
+	if (priv->bus)
+		mdiobus_unregister(priv->bus);
 
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (priv->phy_node == pdev->dev.of_node)
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 }
 
-- 
2.53.0


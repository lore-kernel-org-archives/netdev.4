Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388563;
	b=KBKdZGR47tM5Z4Gkgw9GVmSmwLymLzjVPfrND6NNWYg8wb0k0W6tcYE/JmUsQehcuZBj
	 UngOezK7CagTvKDnl3NK5//Em6OsrH3XQmOpirAsZjG4TVFhuJuXrWbcPn9zzLeoykw8t
	 rOubet48mTuYdq3B8UeiboQRbl/nsnEL6lnxv0O853CVQQzSngGxOIkuBgSJjXpAGIW7s
	 950xODjszkNFOlY5kLfvtd/JjyDHH0xK+AQTKyLqckNE79Eh+Z5kRS/pO+ClPRGz4FCYa
	 Ua69VI04fO94ZgoDS6RHsILJYM5WJXqW11nX/s1fhyaIuZ0PeRviKSDY0bQ6TaQkWfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=35eWM7wVYoUx5OG+LeQqHc77f7TZQ1S5r9Qaw/6zkq8=;
	b=gwFFzUrUOXgucNF4enqST0PPuqx+wlH3rgzYwZWDqMTaKjRe7V78BXG6Z+RGRPzmSmYk
	 OhChZkaG/MUVeePMm6hGcIutTYhVHVL2Brcj60bgbMsqlPYzvwaVqQZc20JD5pygP/nUr
	 trDIRy/qBfOv/qx3elnWxNBaU/2ebNYWQwyGOKTUGMWCrcuESJNCBg793BMlDMDpkxX8z
	 bW9Cb5uba3sa1bgZ5XcOzXmv2BRPy9tSNjaFG7hqnbRenCRXvR9Ut5WPBSMyAcWOzY734
	 WJljEwZbFwk5hGU0xYGkbUw5ifGI47ZmxJqnxbj9smIlyEvqXgHCLVp00PVAqq0wJTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDXUX6mR;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F3606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 23:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDXUX6mR
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1032694a91.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 15:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388561; x=1795993361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35eWM7wVYoUx5OG+LeQqHc77f7TZQ1S5r9Qaw/6zkq8=;
        b=SDXUX6mRwXNbi9Btvjdt8Uj5Yaw6Fac+HXrmyDol5e0uxxJb372QAV78w29XqwH5wA
         UldPFUrRdG37+eMUf5asQkpXrCDNglnNwr6cwclXnsXT84Ks1+H+YwxhU0uR6aAbE4Ca
         2V4ENeEpc3P1NC2bDxParBYsojBY/mL6Y16rI5LXK8zAEVnHKnsQFLtGAnO82tQzZeyt
         ZWus1i7tdEnEMvUdWoMmIe/0muJOVh7REdehUzuGPyFEabzqAM+W0kjzxuN3Xz5K5pAW
         zeR+jAHLURWXi7yYfyEXjTtxzRg1l0RKY2M9JUSX0lXsYzz8/FbvWcXIE6T9/lFR07jM
         WEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388561; x=1795993361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35eWM7wVYoUx5OG+LeQqHc77f7TZQ1S5r9Qaw/6zkq8=;
        b=CAEEWzPzcmT4lnpwawhXHFuDrHTlcZUxYU+dZt3/DNwotKZwse+m8m4dsnj05lS34g
         hZXF7ArYW2oZ2AD3Xmcd8xfgxg0w75WGNyRcsRCL0mbOyFAEmaEPoVdTvqp2Rxuuwr3H
         3qLNJHYPKqLFvJkFNPlk6sZDq0QqUDwNzgtQ4GpAVRhAhAhaiTtq67Ql0449opcqmoHr
         Qv7flzGPY4ZdM+ex5Rl9SM7lgryno3k+6xzmj0lWLzjj4TCNnr1d95a0S1Dw7rGuf9H5
         6FK4Va/vgdgwNSIT2+zdyOLKtgmWExPkVIqVKUBfUPr9bqKqThCs6P0RoUpMX+nEKErC
         +hzg==
X-Gm-Message-State: APuU4Z+osXjE/wv6kOeE+36delNmjVjy2R6aNaXdn66dUiU9Dy2Yg/4b
	QCyUbBSPLHMlm90MJE3a39Q1mEln4ts9i//RHxWQVxxytzIBVpC8IQL5uzPN0+DWjX4=
X-Gm-Gg: AZFdTZdoFeFdSo4FE7wu3RAzalQl9/ArOPNWWe44YYvDDR25taRb3rNiEPrLYClBupf
	C6lItHtAF/Y5+KxZxqXGwVrT/XqeLS5SlU4mknphkIW17JrADFPAl/sv3WiSR1Rg+MWIvw8B1ii
	35dQO3sHuibB9FRcpB5PMleq0iED1+kiMfpZEutvo6fhEGKn8IsvcqC8Ng0PgE8L6LO3YROoWJj
	G46/iowlRUFuTV2YFfI/lVJdWzPZv6Uk9ETRsrstZE8T6R9ex+gAdpe3Njy6eXgOenJA3RlzV+5
	D3tq7ZqJnREmRsiTqXd1dL3Nf8cVzinfUYLkVHQ9W+JPUXFoUwc+ng+Bn1JKP8AHrD4+yahGTtQ
	s+NhIAFt2a1BceqPPNxM8Sxf+KHblTeHHaoa1YVnPzUn4xptsaj5jYnH3uNqQpScRpzlvqEFThV
	BLGa/I4sq74cYAoqpOdY5aKmIA/7I/Nt7T3FB7T/xQ6XUsUc1GCPTW30EiCPgxJJ6S4IrtNlsIe
	JvG9zK+CIfE6VLZEXwwdGz3MzAj8339c2+6md3sSNDlR7znLUO0+/UFHlsX7th4PdFKRGPR/ZsN
	htFGx/jEu7kwj8+0u/BP0kQUAAk3ByfKVCnHkTde2LkUiyt71ap7p4ea9etRI4Qw1sE=
X-Received: by 2002:a17:90b:3890:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b41c981a3cmr8815078a91.59.1795388561315;
        Sun, 22 Nov 2026 15:02:41 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm17663215a91.15.2026.11.22.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:41 -0800 (PST)
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
Subject: [PATCH net-next v2 2/2] net: hix5hd2_gmac: support fixed-link and mdio child
Date: Mon, 23 Nov 2026 07:01:31 +0800
Message-ID: <20261122230134.3366017-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122230134.3366017-1-mmyangfl@gmail.com>
References: <20261122230134.3366017-1-mmyangfl@gmail.com>
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
probe when the node has no phy-handle. Add support for fixed-link.

With a fixed link declared on the MAC node, of_mdiobus_register() treats
the reg-less fixed-link child as a PHY candidate and walks all 32 bus
addresses, printing "scan phy fixed-link at address X" for each address.
Register the bus based on if the PHY attached to a given interface is
described in the device tree or not, like commit ef8a2e27289e ("net:
macb: fix probing of PHY not described in the dt").

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 78 +++++++++++++------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..9a2a3fa1455f 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1101,6 +1101,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct device_node *mdio_np;
 	struct net_device *ndev;
 	struct hix5hd2_priv *priv;
 	struct mii_bus *bus;
@@ -1175,23 +1176,35 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		hix5hd2_phy_reset(priv);
 	}
 
-	bus = mdiobus_alloc();
-	if (bus == NULL) {
-		ret = -ENOMEM;
-		goto out_disable_clk;
-	}
-
-	bus->priv = priv;
-	bus->name = "hix5hd2_mii_bus";
-	bus->read = hix5hd2_mdio_read;
-	bus->write = hix5hd2_mdio_write;
-	bus->parent = &pdev->dev;
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
-	priv->bus = bus;
+	bus = NULL;
+	mdio_np = of_get_child_by_name(node, "mdio");
+	if (mdio_np || !of_phy_is_fixed_link(node)) {
+		bus = mdiobus_alloc();
+		if (!bus) {
+			ret = -ENOMEM;
+			of_node_put(mdio_np);
+			goto out_disable_clk;
+		}
 
-	ret = of_mdiobus_register(bus, node);
-	if (ret)
-		goto err_free_mdio;
+		bus->priv = priv;
+		bus->name = "hix5hd2_mii_bus";
+		bus->read = hix5hd2_mdio_read;
+		bus->write = hix5hd2_mdio_write;
+		bus->parent = &pdev->dev;
+		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii",
+			 dev_name(&pdev->dev));
+		priv->bus = bus;
+
+		if (mdio_np)
+			ret = of_mdiobus_register(bus, mdio_np);
+		else
+			ret = of_mdiobus_register(bus, node);
+		if (ret) {
+			of_node_put(mdio_np);
+			goto err_free_mdio;
+		}
+	}
+	of_node_put(mdio_np);
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
@@ -1199,11 +1212,18 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		goto err_mdiobus;
 	}
 
-	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find phy-handle\n");
-		ret = -EINVAL;
-		goto err_mdiobus;
+	if (of_phy_is_fixed_link(node)) {
+		ret = of_phy_register_fixed_link(node);
+		if (ret < 0)
+			goto err_mdiobus;
+		priv->phy_node = of_node_get(node);
+	} else {
+		priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
+		if (!priv->phy_node) {
+			netdev_err(ndev, "not find phy-handle\n");
+			ret = -EINVAL;
+			goto err_mdiobus;
+		}
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1268,11 +1288,15 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (of_phy_is_fixed_link(node))
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
 err_mdiobus:
-	mdiobus_unregister(bus);
+	if (bus)
+		mdiobus_unregister(bus);
 err_free_mdio:
-	mdiobus_free(bus);
+	if (bus)
+		mdiobus_free(bus);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
 out_disable_mac_core_clk:
@@ -1290,12 +1314,16 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
-	mdiobus_unregister(priv->bus);
-	mdiobus_free(priv->bus);
+	if (priv->bus) {
+		mdiobus_unregister(priv->bus);
+		mdiobus_free(priv->bus);
+	}
 
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (of_phy_is_fixed_link(pdev->dev.of_node))
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 	free_netdev(ndev);
 }
-- 
2.53.0


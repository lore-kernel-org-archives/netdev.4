Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654562;
	b=p4ZSFYp0yG71+qKlReUaJBfFv4W4asoXg6g7e4X17RK53p8j0mHg4kQKAeLwHDNKeurD
	 CIQMxxNjBWA+V8jzhHC4J5fpzFaQMR8+FRbo1+msVglDwQrdSnLMLeAjVsMT/ccvREnSA
	 H8NiIdy8pRd81J8mASnDWUAnWYLm/wjaG3fZaqWNk370ldoyg+kbPjZMKRSq7Gk+nVZto
	 iJHzwWRIAlP9rgbBTGnzGiJjdweupcq/SHvrz+xaaN8i4WGgFL59Hm8zrDTnniBM0soyx
	 +DaZO6cli7YZEwnnDEPOz7hiR4TPv+E7ljVQmcGR8b0LVfJjkqLnpA+HeHiAUiwc66g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t9uV/UiNsvqmbpW3BJYPZA8Jxpgub2khhaxa5D2aBAo=;
	b=MfqAbByzVzh+vX2gR7XA3+h1HbV5NLj2NsykviyxgCuiScrj7HkEcMo7Z/FQvRLtrUau
	 G57AAc/jbKE1Zh/dsBcmcAEhLZ80pPL7PXh9jPxS9jauhUQUNKKOFKMmXh72GyNBM16VE
	 F0C7evH9P+cqQZTeQiR924PPYKzOB70jLZ2IDrj2FRLvCsJpkcXP5POoYHUAXFCIHcZAC
	 KMMd5ML8uOhW2ko1tH+w+jPO287fpZhGR9T8qNA1JciOqrK1NFCTIhJLfn/7IQsy0RZvB
	 sYYnkGIbjUHP0Qz5uFsZs3bT7M+0oVILjW+BgfJmdUSE2XD53gTrarDULBQdwMBCJ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izx3fCQL;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077B606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7077B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izx3fCQL
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1673708a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654562; x=1796259362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9uV/UiNsvqmbpW3BJYPZA8Jxpgub2khhaxa5D2aBAo=;
        b=Izx3fCQLyXhXWsIA15fzrTJl0ajhXvLYMoOAASIiQMtT5ml5g2VLow/ZbQ4Ills2sW
         HjJwyi29DNCXjj8Z4C/Sxsy62Fs7YP0wL8L3GAGFr8klQfLJ+wj1KQdkrukmNGpnz8M5
         qMaCRi/FVrrcaXZE0PthACw9YmW+hTWMZku0sE+MdvdwRjMsa4EMhI2nXNIzeySyMxjd
         ysg7UCCFsZAtF3oO6UxymE7NMRTeNj+GI2f3w8r6052lP1n9I+piqGLuC575+lCMAQUG
         BfD1hMgAuZ0uFmteAm4ncj1fzh9TfGLSAD+6nToZ0Y5zlLyFY0FHAKCuA2WulBaq8s6C
         srCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654562; x=1796259362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9uV/UiNsvqmbpW3BJYPZA8Jxpgub2khhaxa5D2aBAo=;
        b=rw4aRQwXD/vuw1IMqrl1TRn0LDSaoBmaxfHl4YddfFaD78SUmCmUQW984EPk/V+omt
         /DMePMiZrVEcnJVNJGaiDviFZllywYhP3Gd8gLtz4KupvNBVizH4AYwczHhFnj1/tD+g
         wnlSloHvnI5K+NM+ELGMb4zy1t7yf47DhMw2qIA+eVlZ5hMz4WGitF/9osFvP6VoB+NQ
         Q/prJIKbS2J2d6gBLfuiP0f2lW4vargsqVstz0+cIzAm7/vN/P0wXSSVklnfGTXF04Lm
         fYPbV1hVbJJRm0EDaUzgoZ3PPtC25Ke8Tf1QwmuuKnwQmTcjTVPyG79/8DRfSMB3krYf
         jcng==
X-Gm-Message-State: APuU4Z9Up68QbRdoCVdyuYKF4Irsfbk1AOwT2kNQzUXoRrRiWAlLSqPb
	Q/WCD7FaeT+t63Awy5mhEMKoUzOl5g0eCuXKwd+BTAUA9wv0YHva37FkhLTelI6n
X-Gm-Gg: AZFdTZcvEf0/eTaYVS2ivGd+EYK6ZxwCIKPRDh/QAWjYYF+9WL7ygw4a7Mfz/IOivPC
	CxMJJ/KDqEDxhdRh5xAyR+x31FksZVEapOYLyyVgZhHbz6mFW8i62lf1S52EHFS4KqeDHB/6kS/
	+fvF253NEJaV88cB/Vf+/rvM2+nWSPU7WZwMu7TvvYaLM0/4emXblMYxEXMVgaVFMueOY2JwDAS
	H/zaZmdrMLDwI6NpwNJVGLjh81wffCp3LnYqoEGKeVi024g8skL+9Ik0nGdSm8x/QzG7yhht07C
	8s5t8vuS+37s3moRX99qe3CQ8Ut6OMpQ+bjPlf2opAamGpfh5psO4jElEn54GKqhqrjoHlmTfkm
	tcDe8LasfM0RjucQbMNgVV2PhPMeoA1VJHyfQF1HrUmyRWRd9TN0LhKX4jaZpF9gBeoLnAwOmHA
	a0OypAjC1aXnsM0CCT4dBKiCUn+M9oJR6Vh763nrOfDLFUQHSMbnyFF/nXG33e+htODQdT3HFma
	ABX2RlW+nh6m8fNOCLLRc6qCHs0myS97vqlTUZRS2GheNMQS68PZVEQhEkM8DH7sM07TQHLmc9n
	QIFSe0l2Q0bmupC8upnncL9eFgQJ/6V9QBDaxseALcZyChsXucwwmJE=
X-Received: by 2002:a05:6300:8188:b0:3e1:d99a:8e82 with SMTP id adf61e73a8af0-40148fc2d80mr20598496637.3.1795654561732;
        Wed, 25 Nov 2026 16:56:01 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:56:01 -0800 (PST)
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
Subject: [PATCH net-next v4 5/5] net: hix5hd2_gmac: Support fixed-link
Date: Thu, 26 Nov 2026 08:55:17 +0800
Message-ID: <20261126005524.4156940-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126005524.4156940-1-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
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
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 70 ++++++++++++-------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index b3b2aa1b7698..eeb7221c0cde 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1176,37 +1176,55 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
+	if (mdio_np || (priv->phy_node != node &&
+			!of_phy_is_fixed_link(node))) {
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
@@ -1271,9 +1289,11 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
@@ -1294,6 +1314,8 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (priv->phy_node == pdev->dev.of_node)
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 }
 
-- 
2.53.0


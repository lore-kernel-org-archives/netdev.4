Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784879;
	b=1u/eVx9OfmkJ0OuSLxTVH/5UQNld+JZkt+oDafbJXqXEmNI6URMhzfxWnuZsDHNQ8Jep
	 7sXqWNj2Twk5vo2oxlcM2bfG+RYd/Q/BM8sU0kk3g98iG8hP0UFfiKpsNUMAIMveexlCh
	 5NIHRXmewpnuXOI09gmddakc6ZRUP3Wm2+cxScBpVpdty1I6WT+HZnOTA/rv9r6p/RBba
	 uXXc3VHlcqwoQjMz5ZaE0Zbs4lM4aduVCenaIaPyyzGHS0RV9wcy8yxJyCx1Ag/hKfpdR
	 nQaO/aUiUIiDkdcwD9dWIFC6Ln8kR0ZmaUOZ94DUBzoG5zSlMsU5MpW9nXrw2ZVPGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
	b=hDxUFURMRnw6hDJbIpgzNBim0l5zWiaI/CCTqvusAovPVFF+0aHEaeZARcYlIzEXym0r
	 AmTRszEx/qlIkQNiwzzJUXha5hgStreJeAbbhRD2u0dqByF67hn5NhatP/BXGI3hsYdsi
	 kO2bTDCbpA5vy2isi6Cu5tZ4+Flt7rHn9jMDQuG99gmaawRmmiOwrmEsSWwP6T25d5+Li
	 9HS6d/wjOeLhxX1qQduIqqlSICBxZWH33o3BYYID4E9D6ei5YZWfFEMxhHvubbmq+CMmR
	 3EYy94eKMRwtVeW1zL2iurKvhRvozD7Gqkg9H0r480SLOrbHbwHayM6w0uYnQh4N3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUDRj4Dg;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95781606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95781606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zUDRj4Dg
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab938dc83so3171112a12.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784879; x=1796389679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
        b=zUDRj4DgIwIRP1GNaPEYyvmjo96JxLAia3Ehryrfxnk7h1ezrUKjWZHAxsjNjMszTH
         kQKizHif8zI/5oGPgZGhCiulkvVUoxHDptGiHJeRSH3pYJU9e5TJ8GourtD5oizgHiU/
         U6w2XHpjtA6jrtBu2f6UDQzzlTzTlJVYPxhGdIY1ae5CIGplf4tzZJrewAZ1tymz3MUc
         fd4w3fIfyu/dYAYv6JYpc6XzOb/0eSvHq5DZTEA+aI74QV47Scd3EYZSZp8Uc94EBQQu
         iAPvPaS+zcQ5q3vZOWfXQhifH/aiLEF1fgBkUVVOryIpq+NbuUT5lA0ZE4ZJ1TnljW4Y
         978w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784879; x=1796389679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
        b=mfghptLRk5mrF9y+xWg9IOK+cb5SDR2LBDo+OShREBFWj1NU1A3S6zq09lgnRvByfL
         qhSqqGdAZppuhf1WQTQL0Is3codZdgWGU6vyYEuiCOfRClpuyEjXYEJHSFyxSedCGx24
         UCNjRu3cVv47/dWcaYTiblc/tUQZGodrPUy5taBR9qcM/uvWpPNgplf4KbpXkSujKoK8
         my3pg8yVVFoSnFxZgZQptRjQK35q8eWtfhi5aaHrU9ftayATW8b9dgctzVoWw3+PEFx8
         JctoO4sx9RCg+c2a3RktKyVyqTpnjBcy0t8z6XwWKLpt6sWu0Skk3zWKYfIiOZo3Bnek
         nXPw==
X-Gm-Message-State: APuU4Z+ae8aCcTpKJtSZ45kzVGypaW47s+hlBpB7E8JfLLIfZ5RCrVdD
	5RdWLgVVbjQ+TM9IRcx6SRshDScmRvy+G1DZyEoyRKrlU7qzCl/tCDO27JWLgg==
X-Gm-Gg: AZFdTZfsAzO17jWYqBI0k2ETvbvDy63rfQbei0LCIdaUeDrgR44/4queZjuuC60bkvS
	vObwSfovUU3J+lUBy0dwWSp1aYP+gzc1wpfWPimFcv5KId6JLs7yqJapXU/iEb4LVr+gRKUifUP
	+z2hW+/0sB+IkQS8nrCM3t14zu951ST95VWh/PHflHVdzapjB9CxzK56cCKApKuCA/5it3YvVhb
	7tEwx8x00ggUkq+lIQ5QNd7CxmqLCTlOk7FG2lWU/0eocyExLytLTSB63bSWYYtcsDwtQ3m4ObP
	tFptKT4vD17IP57/8Y+DLZRdwlM3zeA0lpu6Scj2UEBAdzMHX3cMcGhaMQWQ7QxebOcB0/f/ljx
	Zkw7lvYJQ7h92JGnCvcorHG82prclyRruZ8RTaBDR2FxZfxNVQgZrBOL6krbzNqssBODuBTh7hY
	zlfbzyS2PsyMEO8T0ZdARm8HBdQIMlaJ/edXLiltJUaY8JmPZbpBvgTyFk6Da2F2u8h3hL+be8I
	0nFQ2IrbCPs4PjEVkniEc33TE/4FhY9R2G2K2yjU/pU3DZ2UWMaBtRtYECX1RKB9fnytY3g6iuF
	F+P4SlJFKcJnHgYG8mm92jn9GGGAxx/N2OYnjG9HmQImyNdPbIZ3AKE=
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b41c8fe261mr23954938a91.15.1795784878648;
        Fri, 27 Nov 2026 05:07:58 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:07:58 -0800 (PST)
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
Subject: [PATCH net-next v5 1/5] net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
Date: Fri, 27 Nov 2026 21:07:24 +0800
Message-ID: <20261127130729.1263920-2-mmyangfl@gmail.com>
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

Let devres manage the netdev and the MDIO bus allocation, so that
neither needs to be freed by hand in the error path and on remove.
The MDIO bus itself is still registered and unregistered by hand, so
that it is torn down before the MAC clocks are disabled on the probe
error path.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..44b05d41cb95 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1106,7 +1106,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	struct mii_bus *bus;
 	int ret;
 
-	ndev = alloc_etherdev(sizeof(struct hix5hd2_priv));
+	ndev = devm_alloc_etherdev(dev, sizeof(struct hix5hd2_priv));
 	if (!ndev)
 		return -ENOMEM;
 
@@ -1121,26 +1121,26 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
 		ret = PTR_ERR(priv->base);
-		goto out_free_netdev;
+		return ret;
 	}
 
 	priv->ctrl_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->ctrl_base)) {
 		ret = PTR_ERR(priv->ctrl_base);
-		goto out_free_netdev;
+		return ret;
 	}
 
 	priv->mac_core_clk = devm_clk_get(&pdev->dev, "mac_core");
 	if (IS_ERR(priv->mac_core_clk)) {
 		netdev_err(ndev, "failed to get mac core clk\n");
 		ret = -ENODEV;
-		goto out_free_netdev;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(priv->mac_core_clk);
 	if (ret < 0) {
 		netdev_err(ndev, "failed to enable mac core clk %d\n", ret);
-		goto out_free_netdev;
+		return ret;
 	}
 
 	priv->mac_ifc_clk = devm_clk_get(&pdev->dev, "mac_ifc");
@@ -1175,7 +1175,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		hix5hd2_phy_reset(priv);
 	}
 
-	bus = mdiobus_alloc();
+	bus = devm_mdiobus_alloc(dev);
 	if (bus == NULL) {
 		ret = -ENOMEM;
 		goto out_disable_clk;
@@ -1191,7 +1191,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 
 	ret = of_mdiobus_register(bus, node);
 	if (ret)
-		goto err_free_mdio;
+		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
@@ -1271,14 +1271,10 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	of_node_put(priv->phy_node);
 err_mdiobus:
 	mdiobus_unregister(bus);
-err_free_mdio:
-	mdiobus_free(bus);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
 out_disable_mac_core_clk:
 	clk_disable_unprepare(priv->mac_core_clk);
-out_free_netdev:
-	free_netdev(ndev);
 
 	return ret;
 }
@@ -1291,13 +1287,11 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
 	mdiobus_unregister(priv->bus);
-	mdiobus_free(priv->bus);
 
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
 	of_node_put(priv->phy_node);
-	free_netdev(ndev);
 }
 
 static const struct of_device_id hix5hd2_of_match[] = {
-- 
2.53.0


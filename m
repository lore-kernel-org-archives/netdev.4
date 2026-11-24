Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479915;
	b=lAyD8Y0J2SM7+B1NgJoGl5UIEG9pq86gH4EofE2HIU195PfbEdvox/qkzE32Ctmnkux0
	 +x9NqJ+ZqmtE+9L9OVjX3+HX3Yo09IPfnita+ANL0Yy1l5Pw03YVIvG5R4RCg1pDs51pk
	 7PzeVZZztSp99OOQJTbVHrbgTQ6UBib3qsV2Z8Vg1NZ1SwO//gNE3zYWiWDjWIgwzAwIw
	 LPKF1b3fDxoyaf+wQA5R9CuGXCl6Gk3ZPp6Dw+1UWaT21KVqhP6gXl+sdRqpAezUEiFzf
	 SNuEs4X5WjwF1R7tNzx0JTbl2d8x1VV6ph6mJtAhxge3Qa/pGmY+CmhrKWiRTw9VFgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FOyRwHhm8VFnbImA8JFYhK90oJhgE++ql8WYIs5C/+E=;
	b=aHPX/XgJQxDYl97b+cQNrH6e+FpzAWsIJZU8eLMRJbrj5fvM9KB76MKnjG1+rtOg+WMN
	 RpaWGDT71Yn6+tiUXy1CQn/GdZWXJhcrr8fTP5eGr6iDENrnr5s1J54VfSkk33yx23/nX
	 ZPm5xYoF2Zo7TBKf7d9OT5lsCPP51ZYeMBFA+emXAXmmlh1YTcpqL/JoxxqWmViqvo3/g
	 7hx3DHtboJkxoSsB1wgru8Ofh1BL4NYoRH4alJNoMIkVaziKis3OI9Jb+DHA+NoPbmZo1
	 0hdSlNXXLi1df5zigUBbu8mkbIMKeQiy81kmGG4AWReArZ7459OawAhufWUM4QtanIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/OMcI3b";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E1606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/OMcI3b
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso2741922a91.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479914; x=1796084714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOyRwHhm8VFnbImA8JFYhK90oJhgE++ql8WYIs5C/+E=;
        b=A/OMcI3blVmeZrYlv6jJTDVY5+SduQmqRX7v9sv10XZ2qTYuVNjpTc17qqmwOvoGr6
         /AZMXlmDF9Giz/1N6SJXJ2OtcG/WRhFCHOagRYZO8nsPjiVv9/f2lj04r1rdX1MJwCoz
         CKRctMlZMVePMiKWr/WvkSAqFWpEHdFIwcq0askxGSeBLmDSSuxyiWoeGir2Q3zF4WMh
         Pz/b0JB2mWvBzwm5rFkASAHZClSjcW6jMVbt2BthQBuMfMUirPf9H8ErFANI1WBoK5s7
         X/u/bR7lPjrrp8X0jfLGcYjVbwD7oUskGFToc+mR/0RGPDc6vWkUDmuwvNh29DODRbNQ
         bV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479914; x=1796084714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOyRwHhm8VFnbImA8JFYhK90oJhgE++ql8WYIs5C/+E=;
        b=LrQV5YnVlG6q+FWM92kgTi4uzrBeS8x9Y/ARy8TWVhAlJnbTe5TuSEHntTRAoyLjB1
         jYp6RfEevJehN1sg3xXNYUEaqOx7/UsUW+a7PrW6UOm624taa2C4Ch+KGM2WChXelRvV
         va1fDCGBDcBvWPt/k3oRVa4WSkPmumYZVC4ghpzfHPE46AruwEsPxU9mgYrzIn0Yy7aI
         SCSnTOSTBHSTgctF0n2ayJFfHU0QlR02IP5wiieTccWfmulQreHZrNEdCghjHyO3Yz1+
         jR4NrmGANebhGCViG03sh3N5bqbI9TELuKasOjLBFOYe4anxWE996uKmkoTpAtBbS59o
         8WMg==
X-Gm-Message-State: APuU4Z+Q3AhwTYYpTF0TFhFbVJuaa/+EUDPfHn27P+blCCyBgFXlbzaS
	JE0buRLYakX1u3dwNa16pYdux4HLO3KE9/OaynH4wY5g7oLA2QTuVNEiDTFT9fbuMac=
X-Gm-Gg: AZFdTZdJnLhYbrviUx9+wCpSHSWmlW4PQYnEsiAHB/nvNng7+TqpNX1RjmITQmozq/1
	6iV6Tmzqk+tfgTRkhDDAnYbYpoQpUFn5GUWho74sXlolBUxkc5anO9xoAKISmmOx13gPK+jxwBI
	hdM1tIgWgzgKKNcjemaqCnCKo8aCKD95gSs8/0riodQeyNUKn0vyMW2ueD6f98ZB4+ql7mfOvTF
	zeLEnlWVXqYGQIFqzpwuhAY4orBnQHZi5rst/HbH5sSPIyB+fK5G3pZK1aQJuLGGghxTNEsF0Z2
	oEANQZCcbLhpLL+vNyi4euUmwm4TdWG1wbpj6YgD8Od0fia8VSHoNzKekGHKshRiDqA+EOUKIeu
	93iHrwKTQnL1fR30O6guExfjtoHMEy4dG/A9LQpYTATzdfBpWr0hHqQScao4pOXeB9L3VcCncCF
	wyv3M6P9KlD+i654fx986pV9pqqZY/Hcw4EScDM5wRi/xb8c2rQ6jHmeBAFSAKyoTF5AJiB0ukA
	Xe8FTsBo8hyQy3yrOY4CmDdhIvL2w5EOTNxHdBQjjzS2EhJ9reNyBGJaNKRIh/d6FP/SbX5Gau1
	F4kO9is78RsElBDCcxpJfeeKL0x2OOGyC27JRbyumjPPgLL+dlTCKou6j9vZ4VxZBGw=
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr12826574a91.66.1795479914061;
        Mon, 23 Nov 2026 16:25:14 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:13 -0800 (PST)
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
Subject: [PATCH net-next v3 1/5] net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
Date: Tue, 24 Nov 2026 08:24:35 +0800
Message-ID: <20261124002442.19414-2-mmyangfl@gmail.com>
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

Let devres manage the netdev and the MDIO bus, so that neither needs
to be released by hand in the error path and on remove.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..d129aeceb641 100644
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
@@ -1189,21 +1189,21 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
 	priv->bus = bus;
 
-	ret = of_mdiobus_register(bus, node);
+	ret = devm_of_mdiobus_register(dev, bus, node);
 	if (ret)
-		goto err_free_mdio;
+		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
 		netdev_err(ndev, "not find phy-mode\n");
-		goto err_mdiobus;
+		goto out_disable_clk;
 	}
 
 	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
 	if (!priv->phy_node) {
 		netdev_err(ndev, "not find phy-handle\n");
 		ret = -EINVAL;
-		goto err_mdiobus;
+		goto out_disable_clk;
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1269,16 +1269,10 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
 	of_node_put(priv->phy_node);
-err_mdiobus:
-	mdiobus_unregister(bus);
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
@@ -1290,14 +1284,11 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
-	mdiobus_unregister(priv->bus);
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


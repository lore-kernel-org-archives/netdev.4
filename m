Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654545;
	b=piUsd96k/a7x/4muVkIdWvw5j9tPvRVKr/yZbI0SLg91mtbDB/g68oBqItMdKALwTM3l
	 m4MkVOoJcjuzReuFtl5MZy4JEmlJivPL0ITxpvuDaCA1tH+45m4LsStBkO7OIDQfzSKJK
	 mLUYqhCU9BXLczDeZIaMM+1HmxZ5nBxh9dh15u++AjIM5hfN9EM2KSBE5Brs4morwdsvH
	 uVwj2fwaH/cCNiH9/bbE91GTBOTla5GiRvjAtKwJtQgRA3X/yTEBRb2O7RV1D22MNCpao
	 H581Dxxems2f8VevArVPHr8H4JWhxB3IfHz5yzaSnK/JbWboDazRdLSLVsXjFRtpg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
	b=bjqQewzNbYFcfqy30skimALNr3qiwfHKYAkAqeDUltJDQfDw+1XCuj9a8o6c7BUWknIY
	 8ZMszDyoCNWZrsAvYBer27gYFT4kBEBrlHPNO4n9p1Sk1rHDYnbpR6r5MBWI+6mpDPf6Z
	 OwxH/sNXpZVB3r4JzxuWVyyaT9dSnpB52Ynvpj9vQS6gMriKkmmDQiSC1NEIn3Ua9rKie
	 h32KV5nZ9tJ5JJQL0Q9ewQTr7S/QsR868qyUQq0+SbORnhJ0vJmeIMyfFyXHIopsb/UrX
	 rXjMdm7KKaK6d9jfFOzP9zP+X/oNQlAf0ieHVE8p/9RAqALFZUWRB+ByJY9P48Ib25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebyd8DkW;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F0C606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F0C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebyd8DkW
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3865997a91.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654544; x=1796259344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
        b=ebyd8DkWqsBUX4vFE2ubtaCAyVC3nqZiezSYpp+6gGLEkuaOFaJJm16bRb/JBoL/2G
         JpPxNrzNHDeJRnlS0xHMLjtbpr/6VDh9X+F6LITOIeIUEXfStkMORc+H5cCt/tguME7q
         J/zx6KYuUgG9s//9ud9HZJ3OVMQpJ+GUMMzkpe2DLWX0OmKBm8Cp8g/PGOq3QGo3ktiJ
         UovGSsKBaOjYQduJk5ubHYKYmMSUnHvDIrAaAp3bNsEqJhOnbkgO1a6YUdPxy5s8/eF/
         VIcjXUy6zGLvxiir8JvFKH6pv3utkj5SngX7WlirsQfTbqRfm3y77qsXt9z1Mra5aQ3x
         wgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654544; x=1796259344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
        b=e4Y4Ddw66tArF6UqUQW27ost6L61rJC3udj0oN3wU2e/z9dA7mFD9O8JyKjQ1LepB3
         NTaOjmJP4/CCyFZHCf2lUytqDr7/Wgsal+D2Knkl+wPcDrHqKiFsOsezb4FTv+6vFgTC
         P0ik3Is8aL3AWQTUD2XS9ckioO+XnwQTFO0Jlc1cBmH6nNSFnEHgUainh7DQBnehBIFD
         k2/yisdA/l+Bv39KbLQ2quq14C+USYX3XP+bIKIaJDAadW6Gfz2gBGdtM8sq2e8E+XDD
         01aDj4N2TWWAzO2XHOPNqCNXjlyEbnevc2U5ytntb7ejAwFFicVNpjCTU4BkNrKFGlw9
         GNGg==
X-Gm-Message-State: APuU4Z9RrMVDgEpuFa264G1+TeY2C4lyI6Wy/5L2zk8Gc2M0XbFUiVol
	0pjCHJ1lJLvNR/7clIGNJ4wdx6Z5r6kK+pc4Gzcb1+8jfXatYpWC4t1Nnm9lxIJS
X-Gm-Gg: AZFdTZcmJsrihQefT1Th7NcH0F631Q/LWyx2cbxchKB4q4MMuh+ulDhZsCkxcL7/4Jf
	oLOsHC/LS1sX9WhxsnEr9ulTgXkAxnaYYXgqUsCIFQtc0o8KpdhHZ/BTZypdiIhL8WRC0HyRGb9
	rzgNxs0MgI0AMjKSIx1u1aJcvVV699pzrmN2yudMrDFPGiq5WMhV5Kf2uTP26TYDD5wAp6SxKYf
	Vs4jBSuMPkadfV2jOCwjypHGhNf2NL8B8uG5luZ1CanX8TupGB6SScdV28aodLxgY/Vc51g+p2y
	2zDlOVnpfrhhGCz7kEdpzmOKC4sd9NLRubSxxvNt6BqMquonems6V0moIcyoMO6DTgUAeOUDK9s
	WHQVDv4M6wOdK39+dmspFhCnA8E5jez5w7SyeT42hUiu7WMpbnXvTVsbZrMCyZfGeePoLYGQK/H
	TcWMd/kzfyR3ylC3YnwdA3zmJiZO7GrDucHPcHyagufehHeVxMLVkDascyGmtcJTu2CoIOB/R7e
	hlLJ1D0vFl199SeDHWPFDdS7BrYl6/be6+rA5VfoTnLKaGqyHqXDEj6dFCLwXsU0X4UifmPjkt8
	P0hcaXVmA9EjB+THtwOjTUV33ARUBkUSYW7fOy5GADE8B5FGo6FdOys=
X-Received: by 2002:a17:90a:d2cf:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b41c7c22b4mr16856224a91.3.1795654544274;
        Wed, 25 Nov 2026 16:55:44 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:43 -0800 (PST)
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
Subject: [PATCH net-next v4 1/5] net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
Date: Thu, 26 Nov 2026 08:55:13 +0800
Message-ID: <20261126005524.4156940-2-mmyangfl@gmail.com>
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


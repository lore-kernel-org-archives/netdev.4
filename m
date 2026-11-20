Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144256;
	b=SOTky+eB0Yg1GCTRq5w6hr9YjaPiKyBup0KqdFOaGMbo+fLV3Sv8s5vOIFeQdAxUYt+X
	 s3mHjc2aCS7uaOdYSSGjRGX224s0N17aMIfqW9kxEoM+yQYlsUfR3PE0pYYq/2j3nP4bh
	 JPv4D60bb0JQskiiB7hXGCwzzG/fyO/FcDBNo9WQ6EASBe/dKBC8q28FyFEi+BR+q4ATe
	 fNfCBB2L3anOzk6FLdT/kUMKWyVLC0bZYUyhUXFrEn/TTrLgQ6suneMiVD7drbeYOmnjr
	 RT7HXmth/XZju+lOhZna/Zq8US2uFLx1+reTiTK3IaGmpr1i0WagB7Yi45GmVUsAc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IuM8pbuNNM6pPPvJsJHBtNU/6ZTql/X7u0SklWvN6TA=;
	b=C6A2fCZrT9pVZG2I3j5uMtVTOduGvxOhWR0Wmav0HMjIKS64AbBR4SzZ65MucIOozzIC
	 doE/vTWQmIkExqPib0zyxvp6NxpVSGcnpEcU8HU3LrsLoBamiMfPeUuxvBKSr6j+v0/BR
	 lzMG1eDrZgAcmZ9jxA4lqc1lddWdi0Ie3qL9+GBVg5Nrv3s0G4+8N6GEqIqjzYubR5283
	 dK8tEWWorxbcdS/+WSy3B7rR2S5m/G+b/5F+lAVIdrivwe/mUXn/58CRF7ySB6P95XSVl
	 iNIHdiW5IpkXzTMDJetkbOvGgUBxNZmoAJQvHGkwMkba+fXlVKVoQc6U/LbAJzMp6cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T+O/6dQL";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DD3606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0DD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+O/6dQL
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so428573a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795144255; x=1795749055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IuM8pbuNNM6pPPvJsJHBtNU/6ZTql/X7u0SklWvN6TA=;
        b=T+O/6dQLzZ+nWAsr7BXUzJI0HWYIzssZhBaNS8Fw5OA+wC7VTFzdRalWvYgd5xeIsa
         CbiQktEsNL4aC9rZWbT6W+Ywluq0yf6BOB5Zivf7A8q0RnHBre6RMdlWocNWlGPulN6H
         dkBDeHR5MCd+VyMy2Fj0bKUmL+rD6svb7rzkz6zz5Q360e5Bv/pCbMtJkOLyzegVd+HC
         XIbMflFBZwusYrG3l81OEVSW9JBOR+N3BOE5yF2oYw5bfQcDzyMhmZjdLw1Vhp46eO/t
         I0uiVUawXKaJk59v27musNLU8YLhVj+VEM1D+Zrw+7bavghja16BNsv8uIWwK1RfCK53
         SugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795144255; x=1795749055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IuM8pbuNNM6pPPvJsJHBtNU/6ZTql/X7u0SklWvN6TA=;
        b=mjNNOe/SA6JXZxdd45+T6bZrjSiZcyG5GrJ8EINaw4bBkXbCLchoMIhRihJpq29S0u
         PCu1aW31mPdtCOt0lounX9e6hsQlgVJq84QdlTU5bjWflN5Mg0/fBL58iPWvL5zLEj5l
         nV82Vm3N9JHiiO/zBiS+PaYI/Uud2IphU3+hE0Mcvul4pYdAWuAS5zntB/sZxrFjZrGm
         GiEpfNttWZ23Dm5fggRwqRSX/zpaBdJC/H05tKlcOOgupnO3KKWzvjU3v5jj3N3EizhI
         27xuUJXWPExVfrr3+2AGXzFlC9gDae1gfE7N3n8oqkv34W/Xy5ZeKaqcPxHggOIwjnCK
         5Vhg==
X-Gm-Message-State: APuU4Z9iBpo9H542IOXzT5H/iFQpEOsyTgKJq5oBk6FG5i+FX37Jy5bF
	0CBNmIONBpvMwj42GVoTL3F+56x3MztZdMnYMpOW2IwFlhVNvQ9uCdla3Wy/f8Vs
X-Gm-Gg: AZFdTZfF9FS6HFNYQbQrAdXA7OYtPIdVk5sv0tyF4R4efxf38HYDYoFf0G6YiCeyn9G
	g+TNCNC9OTa4KUDu/kRpB883YBluglekESo1TEvIiGsjsS240o2O/bnzrfzDBv3DRQHaIvlSMx9
	miCjhK8YShC6+g4GC+oaSi/j4CWzniOtAYgWEJRNpDgEgtQWUBfIo923yOZyEULxR6k1BE8gGgH
	kF3R4LbkiC9dfh5yZkbkqls9J1sP6vJr4inJfVku7qsmv3+WGe1JD33AeY8d/eH4X8wvuWGBGNL
	9odKLaSK/CjsA42K1qo+L7js6frYHM42yXY3KjA6Itqn+DPrSNLDQhR801iugyAEwzC/lUxOTkI
	qp3tBEFrICU+pgSYA+2cw00W2JUluaYY6Qekt57LkkWZwIahvzbOFQ1i2zmZnDX/zT8Vs7ZO2mi
	xB7Cllluuop6ocyQ53NovBlYfr8OAnn9TSZr3iU/O1J54OrUTKvWWTiz9jg938lpa8LGJnci1GK
	tA+M+myqvpHThSXDqOyAkCYkUKRrv8vzg13MCuUK0OQospVGB1zVGSliYIpBdDYFFgnIbxxDlbc
	PcUwM2/tP2IugLAgGcCtlE2v7BwO/nyB4u6owolJ2XEOUOB+GgL5EmelT+94dbjurRkm6f25og=
	=
X-Received: by 2002:a17:90b:3d90:b0:3b3:ff70:4d0d with SMTP id 98e67ed59e1d1-3b41c8d49b7mr1256642a91.14.1795144255060;
        Thu, 19 Nov 2026 19:10:55 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm2173091a91.16.2026.11.19.19.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:10:54 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: hix5hd2_gmac: support fixed-link
Date: Fri, 20 Nov 2026 11:10:23 +0800
Message-ID: <20261120031026.1371052-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
probe when the node has no phy-handle.

Add support for fixed-link. A fixed link has no PHY address, yet
of_mdiobus_register() walks all 32 addresses and prints a warning line
for every address. Suppress the warning by masking out all PHY address.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..dd4ba6d7a157 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1189,7 +1189,12 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
 	priv->bus = bus;
 
-	ret = of_mdiobus_register(bus, node);
+	if (of_phy_is_fixed_link(node)) {
+		bus->phy_mask = ~0;
+		ret = mdiobus_register(bus);
+	} else {
+		ret = of_mdiobus_register(bus, node);
+	}
 	if (ret)
 		goto err_free_mdio;
 
@@ -1199,11 +1204,18 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
@@ -1268,6 +1280,8 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (of_phy_is_fixed_link(node))
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
 err_mdiobus:
 	mdiobus_unregister(bus);
@@ -1296,6 +1310,8 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
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


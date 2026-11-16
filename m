Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820358;
	b=qIwkB41p0U+jMq2b0jIPR7GS2pHAgXzm+qWEju9ubRkD42CCO3/a4IaTgVzWFN4uUdBA
	 TIk61OqOBNs5Q9tQlyI1s8mZD1boPBtqcGffsvKYbYG5BuoZZwEL/XDja+UITp5RiMUlf
	 XqtFkHwT4YBySGMvDGhzb2Z9+YeuWsRjPCEPgjGZ5sxvrS2EhEJ5VXGGYbTKPFahs3I7O
	 B7qrEwBAHXf+x+KSrT/ZhqOok9nmcBU/yw5zs55ZbePBoQ1TwM05LPCHyAd54vTj+gHU8
	 aISG59hyRtKvcoFnsdNxeiat2MeVIDQ2WrDYe/8wv1mK/Q+aWfW82249+GAwsZhwKXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820358;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=evF9Oa7oeR0AOJYFgnmqRxhUtqPNgU8px/XcftIHdiQ=;
	b=bKQbzeZ+pajJ2HHZdmZVz6Ba8QSO2NvPqasxPdnDNd6ptdXI0m0vx8xPt9pRrIaNvk+X
	 byRIC79lcRv0xrCel+SX+tq506IfPDcdf7+yhnoLEjQuBIgFggkqM7lFyRgb9qa96rhx/
	 F274FCQ3SUjxS/8YokMQsCN6WEbHs8ZLsrXsgZaxjqxQh3ItIfR5MyuZgZ7hDXl3Mp3Vx
	 8yl4l7XLD50KAroov8QRJNYk8cYRykK37pShxjn/GZGV/zb5bSKIRAEolj/ml7pWHQN8K
	 LJ8PxHxSaRtaiz5u4K1xRv/m1eyk/sXm8zu84xS++us/6a7LXj7FYOt435EVWTFdL2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj7RnbXq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB8606A33B
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj7RnbXq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92F71F00925;
	Mon, 16 Nov 2026 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794820358;
	bh=evF9Oa7oeR0AOJYFgnmqRxhUtqPNgU8px/XcftIHdiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Oj7RnbXqVyX1XIMsjzYIIhOwEJEjjgW+EsZ4kv/yirt0A2hbXxlhZXdFRuRXxL+wL
	 JPa+oUFvibgCvaCRXaKWPdDUNma+ueltVkGJLGV7+d1wyNjApcFPwcstieRCet8yhM
	 EztoCCXKSntMT3VYiq8nuXFRlDBaBN5czMMrWEZ02Mhp4+/TpH81yjJ6sLfZvVvl1a
	 lzTkTfZhf27XNTo21T6THUe4CTD2nhsJ45b9pLVyzqWFrQb1fdATOnVYiJrgI4QU6R
	 OZh8T+sPdst3C5aXZsRtPrCQPIchyzzg1nWACL0CgShsWNjmLFRzXkrQMQFklaMOfL
	 2NvwwSgceV9yQ==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xSslP-0000000344U-2cRx;
	Mon, 16 Nov 2026 10:12:35 +0100
From: Johan Hovold <johan@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Hans-Frieder Vogt <hfdevel@gmx.net>
Subject: [PATCH net-next v2 2/2] net: tn40xx: switch to primary software node
Date: Mon, 16 Nov 2026 10:11:49 +0100
Message-ID: <20261116091149.730586-3-johan@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116091149.730586-1-johan@kernel.org>
References: <20261116091149.730586-1-johan@kernel.org>
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

Some cards use a secondary software node which is removed from the
device by device_remove_software_node() on probe failure and on driver
unbind.

Removing a secondary software node this way involves clearing the
mdiobus device firmware node pointer, which in turn means that the
driver must drop any reference taken by __mdiobus_register() during
registration instead of letting mdiobus_release() do it as it would for
a primary firmware node.

Fix the asymmetry and layering violation and clean up the software node
handling by making the software node a primary node which is released
when freeing the mdiobus.

Cc: Hans-Frieder Vogt <hfdevel@gmx.net>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/ethernet/tehuti/tn40_mdio.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/tehuti/tn40_mdio.c b/drivers/net/ethernet/tehuti/tn40_mdio.c
index 438f0d86c2a1..4130d75fbcaf 100644
--- a/drivers/net/ethernet/tehuti/tn40_mdio.c
+++ b/drivers/net/ethernet/tehuti/tn40_mdio.c
@@ -156,21 +156,14 @@ static int tn40_swnodes_register(struct tn40_priv *priv)
 void tn40_swnodes_cleanup(struct tn40_priv *priv)
 {
 	/* cleanup of swnodes is only needed for AQR105-based cards */
-	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510) {
-		/*
-		 * drop any reference taken by __mdiobus_register() before
-		 * device_remove_software_node() clears the fwnode pointer
-		 */
-		if (priv->mdio->state != MDIOBUS_ALLOCATED)
-			fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
-		device_remove_software_node(&priv->mdio->dev);
+	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510)
 		software_node_unregister_node_group(priv->nodes.group);
-	}
 }
 
 int tn40_mdiobus_init(struct tn40_priv *priv)
 {
 	struct pci_dev *pdev = priv->pdev;
+	struct fwnode_handle *fwnode;
 	struct mii_bus *bus;
 	int ret;
 
@@ -196,13 +189,8 @@ int tn40_mdiobus_init(struct tn40_priv *priv)
 			return ret;
 		}
 
-		ret = device_add_software_node(&bus->dev,
-					       priv->nodes.group[SWNODE_MDIO]);
-		if (ret) {
-			dev_err(&pdev->dev,
-				"device_add_software_node failed: %d\n", ret);
-			goto err_swnodes_unregister;
-		}
+		fwnode = software_node_fwnode(priv->nodes.group[SWNODE_MDIO]);
+		bus->dev.fwnode = fwnode;
 	}
 
 	tn40_mdio_set_speed(priv, TN40_MDIO_SPEED_6MHZ);
@@ -214,9 +202,6 @@ int tn40_mdiobus_init(struct tn40_priv *priv)
 	}
 	return 0;
 
-err_swnodes_unregister:
-	software_node_unregister_node_group(priv->nodes.group);
-	return ret;
 err_swnodes_cleanup:
 	tn40_swnodes_cleanup(priv);
 	return ret;
-- 
2.56.1


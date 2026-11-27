Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778734;
	b=PGETcB1zFYjaeA5luylnyoKU+Rs3bcqmze+kDADYrSNCVL3+pH4n43lop7yfA66OoyWA
	 6Xjyc6iCxIOVVQb1+Rgkggwz5bhzJ/2zELyhy9J42GOglVHueS+8UjBUNGONevl3DVs1c
	 0hMNXYlcgt4ePwdGzXsy5RYRdsZwuagjkqEgHOSFvMMNe/kE17R9EpeaS/kPndHdAILRe
	 y6PPF/gL25Cj9wSedQSzJxZr5W/ngXG6adA/BPAd08wuB2GBA2+yve3U43h1mgvqdvbvr
	 u6kYevGVbiKIQ8403XGIxLWn9/1Inbo1LMrTGz0dCblamCJl+lHawEnsj5XoYNGfNLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778734;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=R9hsh39zB7uY3pBAEfmH5v5PeEQgnDlBlPnGXp1lH3g=;
	b=dNpGmasu1YlDptC6qUpKjCGpzPxFgOLL5UatKr6+i1/DrloolxVWjLcmkP2NVme32dOo
	 e6jG2KnGZq8xc7JI6JytJnnfiJNiX65Jsh9ad6JqLv4dMOaskErjblCDRqD4yyBvj0N5E
	 dmFBQd1RIHTD010DpzP07+zYS35Qs+BGKdnkRMV/UM3/tlrUnM72OzdpzNQ6zszyj4rYp
	 0gP1N3JeT/SvTr2X7QzovSGWiSOi0BpWdN0h7XMYH8XJXOb4DHhWWgGh7SgDY6nk0KQkJ
	 Whe5VPZjp13dmnjTuctWIui4snQ6sTkgC70k+YxuHkdUn+eVbIF8O/ZnMYugx8vXyhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=yRy6tFFY;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3CA606A31F;
	Fri, 27 Nov 2026 11:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3CA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=yRy6tFFY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0ACBA1C26;
	Fri, 27 Nov 2026 12:25:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795778731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R9hsh39zB7uY3pBAEfmH5v5PeEQgnDlBlPnGXp1lH3g=;
	b=yRy6tFFYX0/oDaJlFVRQDAZD+K3MlDXT162leEk4INgXnLDB3uu8urlZEPK7nrwsG7gGLd
	a7IX/rE7wKbbhg08fjRlEDOluFKUTjfxXyoV0pna0mHXVXFdMMqu2gQGwxyZnjOsTGt8zJ
	B01A/rHe2pqjZrGuTs1nInRrwQtR9htm5LkFjzqUJgK54jclY4lM+5TQTbcacj8YR3SVQf
	eEMEBpZHxGV+vXbk1XI9fTPneu5CZaBm91+orIqm/gPlk5Fr4+pDvFcK7JUtBEsWSSmblb
	KlNTom/xB0G9nLurxKOAn15tYUN9h3a9rcD0nFAIk3KvY/cBak7XIiJbrBx2uw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 27 Nov 2026 12:25:11 +0100
Subject: [PATCH net-next v10 1/8] net: bcmgenet: let the caller decide
 whether to start the PHY
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-nb-genet-mtu-nn-v2-v10-1-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97@tipi-net.de>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97@tipi-net.de>
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

bcmgenet_netif_stop() already takes stop_phy, bcmgenet_netif_start() does
not. The MTU change in a later patch leaves the PHY running while the
datapath goes down and comes back, and phy_start() expects a stopped PHY.

Add the same parameter to the start side.

No functional change.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 1f2d85b37b0f..7e78db243442 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -3392,7 +3392,7 @@ static void bcmgenet_get_hw_addr(struct bcmgenet_priv *priv,
 	put_unaligned_be16(addr_tmp, &addr[4]);
 }
 
-static void bcmgenet_netif_start(struct net_device *dev)
+static void bcmgenet_netif_start(struct net_device *dev, bool start_phy)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 
@@ -3409,7 +3409,8 @@ static void bcmgenet_netif_start(struct net_device *dev)
 	/* Monitor link interrupts now */
 	bcmgenet_link_intr_enable(priv);
 
-	phy_start(dev->phydev);
+	if (start_phy)
+		phy_start(dev->phydev);
 }
 
 static int bcmgenet_open(struct net_device *dev)
@@ -3472,7 +3473,7 @@ static int bcmgenet_open(struct net_device *dev)
 
 	bcmgenet_phy_pause_set(dev, priv->rx_pause, priv->tx_pause);
 
-	bcmgenet_netif_start(dev);
+	bcmgenet_netif_start(dev, true);
 
 	netif_tx_start_all_queues(dev);
 
@@ -4371,7 +4372,7 @@ static int bcmgenet_resume(struct device *d)
 	if (!device_may_wakeup(d))
 		phy_resume(dev->phydev);
 
-	bcmgenet_netif_start(dev);
+	bcmgenet_netif_start(dev, true);
 
 	netif_device_attach(dev);
 

-- 
2.53.0


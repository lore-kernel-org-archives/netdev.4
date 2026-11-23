Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425454;
	b=cYiLj4H5h+Xook3D0GmHaPCboI1lppmXQo9ERZaH/nqW3q26x+ODHZpv89sEgrp4gbpD
	 FEKSAtSLYmJXqYPnMlZMGnxPaMAZjwrwqoPlVZbcAylkV7hGCBziZUbxKaAZjaGBqDn4B
	 KBdLrGzMtrrSduJxjuR6+MwZjC/wfrNoY/mQjpPUxAJiJ04jHmznXSIjMJR9fMK9ipJ+b
	 JoDUUpQZUntq97Zw2WU6mTjo9+Wr2lDzaAon/ZilqKxnYpYWZWrJ6ZDrJod64Z7Am/04y
	 oCgVs2xMDhtApChHSEJ0t2SBpoHWqJ60hK+12qn6C4TsZjI1JmhqXixw8bRkoyfv11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425454;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=bizW6+iW5LLnjnz0mtnjldfKd92aJLeeYiKp4M9Rixo=;
	b=HZn0L2sDtoYU6uquu8SlPV8eXKgKsK0vU2QmwvUJrVcCXR5afyfYLAEtKhrDhfhIo4hM
	 Dloa+47oLgEJnyOvSR0B1RWindzIHF8XcmwbVmYFk+s9gGW+JOLicm+BuESzRqQWZYprX
	 RR0b9REp2OwrGGd0/DeQTshYx4ozBhyy8TwV57wdVCFcVVZ5WSXS4O5uLr227hYRJkgkT
	 OEqLeSBP4/oRDQ9QVDsj+vWOz5FbyXfK7eqfNhQVBqo8Xwc4qm4DG3Cs0oQ3NM/m9yWRk
	 a9f981ZwBYKuiXVTnzXLTaHWPzcJe44ued1AGd8RfhgAWWCVqjtcpw4kNOx6zhhnm0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=oII3YwmO;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D641606A336;
	Mon, 23 Nov 2026 09:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D641606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=oII3YwmO
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B526A0900;
	Mon, 23 Nov 2026 10:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795425451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bizW6+iW5LLnjnz0mtnjldfKd92aJLeeYiKp4M9Rixo=;
	b=oII3YwmOZkVAlfj53HTzceiAPzDUknlgivwxK4QflJfprReznydFx0FelbIA1FgE83RxMs
	lZTWbFpoksZdXpb2HwC+vNAKvP3otca6gYKisTy80nzarw/Dz+ECqyndOMjqefaGOe5+4X
	J1wW9qG2WUZVytD0TeuQBW1CgTb0itfqjBWopU0tqKIN9wo/9fgFBs87QjSTHMQE0PYVTK
	4VOwPQtejvoJRj5G4wn1Fgc/Qo4vQv9kXBIv41zHeA6N7gKxAemUYj8JP5MJjy3LMsjvCz
	SOe6pmZ3WW+SrB8qjIUN/80QaJgUxRb8AMjYBdcgwI1Xmmztean8Nn+CZzHv4g==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Mon, 23 Nov 2026 10:17:09 +0100
Subject: [PATCH net-next v9 1/8] net: bcmgenet: let the caller decide
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
Message-Id: <20261123-nb-genet-mtu-nn-v2-v9-1-4f93ded19bbb@tipi-net.de>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
In-Reply-To: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
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
index 6545caf3232d..77c1b4088a7e 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -3385,7 +3385,7 @@ static void bcmgenet_get_hw_addr(struct bcmgenet_priv *priv,
 	put_unaligned_be16(addr_tmp, &addr[4]);
 }
 
-static void bcmgenet_netif_start(struct net_device *dev)
+static void bcmgenet_netif_start(struct net_device *dev, bool start_phy)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 
@@ -3402,7 +3402,8 @@ static void bcmgenet_netif_start(struct net_device *dev)
 	/* Monitor link interrupts now */
 	bcmgenet_link_intr_enable(priv);
 
-	phy_start(dev->phydev);
+	if (start_phy)
+		phy_start(dev->phydev);
 }
 
 static int bcmgenet_open(struct net_device *dev)
@@ -3465,7 +3466,7 @@ static int bcmgenet_open(struct net_device *dev)
 
 	bcmgenet_phy_pause_set(dev, priv->rx_pause, priv->tx_pause);
 
-	bcmgenet_netif_start(dev);
+	bcmgenet_netif_start(dev, true);
 
 	netif_tx_start_all_queues(dev);
 
@@ -4364,7 +4365,7 @@ static int bcmgenet_resume(struct device *d)
 	if (!device_may_wakeup(d))
 		phy_resume(dev->phydev);
 
-	bcmgenet_netif_start(dev);
+	bcmgenet_netif_start(dev, true);
 
 	netif_device_attach(dev);
 

-- 
2.53.0


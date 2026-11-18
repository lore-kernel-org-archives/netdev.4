Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014256;
	b=cwSPXKkd70VTMmaL091ijTJaf/0kUkQkxDpdDfCQu+H/bDR/qj2nT8tUaCc8Y9lvQ19s
	 OhCkJcrEjlkEIOpfEnKlyYjC6sx/ZYk8rDQPsZEt/yeQe34exEFrCTVgMB4KT9/pTVDdQ
	 TC+bJA7QfivEMuZRE5Vp3yttJjGihKoq3LQqWd35OamEBiKh8F+GauF3SKW7NCCFmSgv1
	 a55F/qd5uYWvq2KHlctpl2k4TFaX2XDQCEY/MRDMkda8cGpX7LUM+rEEFSVSccIRjjlbm
	 RkmnaTInFVSO4EHaXW0c4nBZ2i56YcNyAOAUqiun9fKLxkj14p+TYVPRB/OzWArHJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014256;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=oZgYwMLCb1rnx4KZqfeFvtHgyDQKffOZbXtJHVAzaiw=;
	b=lqupp1Ea6/t0D9U39mDOhubxF6Ulzkig1wX1LLqSXUMpR6xmvSsRK/tDCuHqckasKTwd
	 n6aJeYMcajGscKuz6QQdpcbuVjqXJ8WEV5DbzHTJCxuyjseoh9ZYmi44Dvq6PsWHjO+pe
	 Go0A522Z3EzLyB1UyFH1NZ2BSRUQNZCanSP4cpTKcFwaPtRcicjOKzvGpnHVO7SYxFV72
	 XPr+iGrxfefoNIXuMn6WGEelQAUlwBXtwWbPyJQQG5LuZ/gtbzlBNdewQsO6JmxybdO5l
	 86+yKhypNm2KaHnQevWCZH/q9Hlr6n4gaQnYh1SaDiRYyp5w8KvOFRV0AToqEhdzi7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=GYc1cBdn;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881FB606A33E;
	Wed, 18 Nov 2026 15:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 881FB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=GYc1cBdn
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0FFAA21B9;
	Wed, 18 Nov 2026 16:04:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795014253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oZgYwMLCb1rnx4KZqfeFvtHgyDQKffOZbXtJHVAzaiw=;
	b=GYc1cBdnelevgw9K4tU2JrRH5FhKzjn0FQN2p5GNsU3kMFURubqe+BRAlm4CKzu8txPuZn
	6ZuUaqywVuSApTbdTMLI9PSYXsMc3b4J4hvroTyHt//T/sSZKElD4sBKaHe7k6skiET+zK
	hlrHURQdTci9vlc3xEp11NMSR7eu9P6F1v5rNTVYGlUYMRSkV1twZRYQH2QE7SSdXKkJFz
	f8pcvLd+rw9vGpYsu+d6YNEIjjtaJv0uNffFAYcB0Dk3liUi24OzvS7R0xBPiI+e0a7DhV
	ZFu7zULF6Jw2oag7e9E7wNJ3x2SrcLVfrd/zEW93Rxb+i0U7s+sKRsUqQPNt0w==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 16:03:35 +0100
Subject: [PATCH net-next v8 2/9] net: bcmgenet: let the caller decide
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
Message-Id: <20261118-nb-genet-mtu-nn-v2-v8-2-68f75eadf3e2@tipi-net.de>
References: <20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2@tipi-net.de>
In-Reply-To: <20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2@tipi-net.de>
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
index 1114fe46d2f7..4c2a38eaab10 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -3390,7 +3390,7 @@ static void bcmgenet_get_hw_addr(struct bcmgenet_priv *priv,
 	put_unaligned_be16(addr_tmp, &addr[4]);
 }
 
-static void bcmgenet_netif_start(struct net_device *dev)
+static void bcmgenet_netif_start(struct net_device *dev, bool start_phy)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 
@@ -3407,7 +3407,8 @@ static void bcmgenet_netif_start(struct net_device *dev)
 	/* Monitor link interrupts now */
 	bcmgenet_link_intr_enable(priv);
 
-	phy_start(dev->phydev);
+	if (start_phy)
+		phy_start(dev->phydev);
 }
 
 static int bcmgenet_open(struct net_device *dev)
@@ -3470,7 +3471,7 @@ static int bcmgenet_open(struct net_device *dev)
 
 	bcmgenet_phy_pause_set(dev, priv->rx_pause, priv->tx_pause);
 
-	bcmgenet_netif_start(dev);
+	bcmgenet_netif_start(dev, true);
 
 	netif_tx_start_all_queues(dev);
 
@@ -4369,7 +4370,7 @@ static int bcmgenet_resume(struct device *d)
 	if (!device_may_wakeup(d))
 		phy_resume(dev->phydev);
 
-	bcmgenet_netif_start(dev);
+	bcmgenet_netif_start(dev, true);
 
 	netif_device_attach(dev);
 

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778737;
	b=5DSfqdX0OLAopU6id3afBVl66VFP1UTldd0+7AvcgEa/oq9bk2cWAq2TaCT+xnJx8lRc
	 7/AWKsULTOfQ1P+1lpEaXUiRxSt4s1rLTYDVKozLmu0oiLVNtqT0MMfV3cNcjU+z16q5e
	 1eSVs1Ny09W5V5B8+dpPJGGaG1oWdAfQndBcnWfGxUkC6FeB3kFd1jIrrNAElm7c4qsNk
	 Q+r+0TMXy0M3L5GKdfJI1ifOKONh7oOwxgIkmt9+5K7QYvWfqEMe452h1rtnsi+08uiR4
	 hBDu/9AIVTy+yozHLZMO0xPALqlpkG1rQ4qukLqjF9dw+Kx5eTgedlxAxGMeY/3Hwtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778737;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=JfW/CXWoq4U/O3deWrFYCs4AgUZyFLzMBU9FgwSPu5g=;
	b=XP985klcBDQMbF7Bs9pcVCafavK33ypq/e72j6z42v0IZhesq2bkCGTX/+Lv2K0na/Yf
	 +em45vpvfKFB+rr4aI4g31Z+/8AKhGMGrQWsots/vNkAWNhJcQIVe/gp+YSz32guVWqH3
	 efHCOPCxr/Hmg6TXY5vpz4LR9oZo1p8bIov/XLeXuMlADGb/e6dpgI9lSYw1wBHD72stH
	 m7MhIp8Z8yzVykJr832UWOX3FuE+LDhQt9O1fzASuGmo60/wEhWlrmIxr1MeUXTWwXa9W
	 r9jvXcNBUoCHOovolIl3zSqiBBj2OEw0rLPLnaZUMcQP1P9Vmm8gdKPRUfavHxN7zow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=CPsCDLM+;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4524606A6B5;
	Fri, 27 Nov 2026 11:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4524606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=CPsCDLM+
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBB5AA4B5A;
	Fri, 27 Nov 2026 12:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795778735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JfW/CXWoq4U/O3deWrFYCs4AgUZyFLzMBU9FgwSPu5g=;
	b=CPsCDLM+NcMPBtiga7JwDyDsLzbYzV8mGg/ynFjCh1e5Tpd01ab5+Dgn+tv53S+5+11Mid
	Enli1KyTerFfMrUt+6C7bmJDpPDui5fo+j8ZrmskWxY0wbV2ARvihUHi2EEENpP4Dn4HZj
	34sIy6JfwXfrMuGWKS2bA7+1v7zqUV9XU/sNkiF63d/5/zng1Q6saS80BPftdLDpL+sVe7
	WmgRWz9+dYcTUjsD+u0gy1Y5uew8cP6RrSHulUEhCn+0jDJa69DzQKtY5lVfwDoeo87ov6
	e22dPy8yuJM3I5KCVBqCvdwoqGHNvLz0kwgzUr9h3R6J/y+Id4c3Kc/GemfbvA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Fri, 27 Nov 2026 12:25:17 +0100
Subject: [PATCH net-next v10 7/8] net: bcmgenet: allow the MTU to be
 changed
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
Message-Id: <20261127-nb-genet-mtu-nn-v2-v10-7-749c7cc45d97@tipi-net.de>
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
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The driver never sets dev->max_mtu, so the MTU is stuck at ETH_DATA_LEN.

One descriptor reaches as far as the packet ready threshold, so derive the
maximum from it. The threshold registers are 8 bit in units of 16 bytes and
want a multiple of the 256 byte burst size. A descriptor is one page and
also holds skb_shared_info behind the frame. On 4K pages the page is the
tighter limit and leaves 3564 bytes. That includes room for a VLAN tag so a
VLAN interface can run at the parent MTU. The MAC accepts a little more
than one descriptor holds, so a double tagged frame at that maximum is
dropped as fragmented until a later patch reassembles those.

The PHY keeps running across the change so the link stays up, with its
lock held so that a link event cannot enable the MAC while the registers
change. Two MTUs at or below ETH_DATA_LEN derive the same values, so a
change between them needs no restart at all.

Above that the threshold is quantised, so a band of MTUs shares one buffer
length, on 4K pages every MTU from 3309 up. A change within a band keeps
the running rings rather than building a second set, so it cannot fail on
memory either.

Only v5 is known to size the TBUF for a long frame and to carry the full
length in a transmit descriptor, so the older parts keep the default MTU
until someone confirms them.

Only a DMA that refuses to halt still takes the interface down, because
nothing is left to run on.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Link: https://github.com/raspberrypi/linux/issues/5561
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 149 +++++++++++++++++++++++--
 1 file changed, 138 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index fc8b8400fcbb..1307faf135bd 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -92,6 +92,12 @@
 				      ENET_THLD_MAX * ENET_THLD_UNIT, \
 				      ENET_THLD_PAGE_LEN)
 
+/* Largest MTU that fits one descriptor, with room for a VLAN tag so a VLAN
+ * interface can use the parent MTU.
+ */
+#define ENET_MAX_MTU		(ENET_THLD_MAX_LEN - GENET_RBUF_ALIGN - \
+				 ETH_HLEN - VLAN_HLEN)
+
 /* Tx/Rx DMA register offset, skip 256 descriptors */
 #define WORDS_PER_BD(p)		(p->hw_params->words_per_bd)
 #define DMA_DESC_SIZE		(WORDS_PER_BD(priv) * sizeof(u32))
@@ -3279,8 +3285,14 @@ static int bcmgenet_dma_teardown(struct bcmgenet_priv *priv)
 	return ret;
 }
 
-static void bcmgenet_fini_dma(struct bcmgenet_priv *priv)
+/* A non NULL keep takes the rings instead of freeing them, so a restart that
+ * does not resize the buffers can hand them straight back to
+ * bcmgenet_init_dma().
+ */
+static void bcmgenet_fini_dma(struct bcmgenet_priv *priv,
+			      struct bcmgenet_dma_set *keep)
 {
+	struct bcmgenet_rx_ring *ring;
 	struct netdev_queue *txq;
 	int i;
 
@@ -3292,11 +3304,24 @@ static void bcmgenet_fini_dma(struct bcmgenet_priv *priv)
 		netdev_tx_reset_queue(txq);
 	}
 
-	bcmgenet_free_rx_buffers(priv);
-	bcmgenet_destroy_rx_page_pools(priv);
-	kfree(priv->rx_cbs);
+	if (keep) {
+		memset(keep, 0, sizeof(*keep));
+		keep->rx_cbs = priv->rx_cbs;
+		keep->tx_cbs = priv->tx_cbs;
+
+		for (i = 0; i <= priv->hw_params->rx_queues; i++) {
+			ring = &priv->rx_rings[i];
+			keep->page_pool[i] = ring->page_pool;
+			ring->page_pool = NULL;
+		}
+	} else {
+		bcmgenet_free_rx_buffers(priv);
+		bcmgenet_destroy_rx_page_pools(priv);
+		kfree(priv->rx_cbs);
+		kfree(priv->tx_cbs);
+	}
+
 	priv->rx_cbs = NULL;
-	kfree(priv->tx_cbs);
 	priv->tx_cbs = NULL;
 }
 
@@ -3696,7 +3721,7 @@ static int bcmgenet_open(struct net_device *dev)
 	free_irq(priv->irq0, priv);
 err_fini_dma:
 	bcmgenet_dma_teardown(priv);
-	bcmgenet_fini_dma(priv);
+	bcmgenet_fini_dma(priv, NULL);
 err_clk_disable:
 	if (priv->internal_phy)
 		bcmgenet_power_down(priv, GENET_POWER_PASSIVE);
@@ -3704,7 +3729,8 @@ static int bcmgenet_open(struct net_device *dev)
 	return ret;
 }
 
-static void bcmgenet_netif_stop(struct net_device *dev, bool stop_phy)
+static void bcmgenet_netif_stop(struct net_device *dev, bool stop_phy,
+				struct bcmgenet_dma_set *keep)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 
@@ -3734,7 +3760,7 @@ static void bcmgenet_netif_stop(struct net_device *dev, bool stop_phy)
 
 	/* tx reclaim */
 	bcmgenet_tx_reclaim_all(dev);
-	bcmgenet_fini_dma(priv);
+	bcmgenet_fini_dma(priv, keep);
 }
 
 static int bcmgenet_close(struct net_device *dev)
@@ -3746,7 +3772,7 @@ static int bcmgenet_close(struct net_device *dev)
 
 	/* A failed resume has torn the datapath down already */
 	if (priv->tx_cbs)
-		bcmgenet_netif_stop(dev, false);
+		bcmgenet_netif_stop(dev, false, NULL);
 
 	/* Really kill the PHY state machine and disconnect from it */
 	phy_disconnect(dev->phydev);
@@ -3997,6 +4023,97 @@ static int bcmgenet_change_carrier(struct net_device *dev, bool new_carrier)
 	return 0;
 }
 
+static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
+{
+	unsigned int buf_len = bcmgenet_rx_buf_len(new_mtu);
+	struct bcmgenet_priv *priv = netdev_priv(dev);
+	unsigned int old_mtu = dev->mtu;
+	struct bcmgenet_dma_set set;
+	bool reuse;
+	int ret;
+
+	/* Nothing to reprogram while down, the next open does it */
+	if (!netif_running(dev)) {
+		WRITE_ONCE(dev->mtu, new_mtu);
+		priv->rx_buf_len = buf_len;
+		return 0;
+	}
+
+	/* Below ETH_DATA_LEN everything is floored, so there is nothing to
+	 * reprogram and rx_buf_len stays as the receive path reads it.
+	 */
+	if (max_t(unsigned int, old_mtu, ETH_DATA_LEN) ==
+	    max_t(unsigned int, new_mtu, ETH_DATA_LEN)) {
+		WRITE_ONCE(dev->mtu, new_mtu);
+		return 0;
+	}
+
+	/* The threshold is quantised, so a band of MTUs shares one buffer
+	 * length and the running rings can serve the new MTU as they are.
+	 */
+	reuse = buf_len == priv->rx_buf_len;
+	if (!reuse) {
+		ret = bcmgenet_alloc_dma(priv, buf_len, &set);
+		if (ret)
+			return ret;
+	}
+
+	/* The watchdog trips on an idle queue once the rings are gone */
+	netif_device_detach(dev);
+
+	/* The PHY stays up, hold its lock. A link event would otherwise take
+	 * the MAC out of reset and enable it mid rewrite.
+	 */
+	mutex_lock(&dev->phydev->lock);
+	bcmgenet_netif_stop(dev, false, reuse ? &set : NULL);
+
+	WRITE_ONCE(dev->mtu, new_mtu);
+	priv->rx_buf_len = buf_len;
+	bcmgenet_set_mtu_regs(priv, new_mtu);
+
+	ret = bcmgenet_init_dma(priv, true, &set);
+	if (ret) {
+		/* The datapath is gone, do not leave the interface up */
+		netdev_err(dev, "failed to initialize DMA, closing\n");
+		WRITE_ONCE(dev->mtu, old_mtu);
+		priv->rx_buf_len = bcmgenet_rx_buf_len(old_mtu);
+		mutex_unlock(&dev->phydev->lock);
+		/* bcmgenet_close() attaches the device again */
+		netif_close(dev);
+		return ret;
+	}
+
+	bcmgenet_hfb_restore(priv);
+	bcmgenet_netif_start(dev, false);
+
+	/* bcmgenet_netif_start() only restores the link interrupt */
+	if (bcmgenet_has_mdio_intr(priv))
+		bcmgenet_intrl2_0_writel(priv, UMAC_IRQ_MDIO_EVENT,
+					 INTRL2_CPU_MASK_CLEAR);
+
+	mutex_unlock(&dev->phydev->lock);
+
+	/* Interrupts were off, so a latched link event is lost. Internal PHYs
+	 * on v1-v4 are not polled either.
+	 */
+	phy_mac_interrupt(dev->phydev);
+
+	/* An energy detect event cancelled with the work is still latched */
+	if (READ_ONCE(priv->irq0_stat))
+		schedule_work(&priv->bcmgenet_irq_work);
+
+	netif_device_attach(dev);
+
+	/* Filter updates that came in while the device was detached got
+	 * dropped. An IPv6 join does not hold RTNL.
+	 */
+	netif_addr_lock_bh(dev);
+	bcmgenet_set_rx_mode(dev);
+	netif_addr_unlock_bh(dev);
+
+	return 0;
+}
+
 static const struct net_device_ops bcmgenet_netdev_ops = {
 	.ndo_open		= bcmgenet_open,
 	.ndo_stop		= bcmgenet_close,
@@ -4008,6 +4125,7 @@ static const struct net_device_ops bcmgenet_netdev_ops = {
 	.ndo_set_features	= bcmgenet_set_features,
 	.ndo_get_stats64	= bcmgenet_get_stats64,
 	.ndo_change_carrier	= bcmgenet_change_carrier,
+	.ndo_change_mtu		= bcmgenet_change_mtu,
 };
 
 /* GENET hardware parameters/characteristics */
@@ -4361,9 +4479,18 @@ static int bcmgenet_probe(struct platform_device *pdev)
 	/* Mii wait queue */
 	init_waitqueue_head(&priv->wq);
 	bcmgenet_hfb_init(priv);
+
 	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);
 	priv->tx_thld_len = bcmgenet_tx_pkt_rdy_thld(dev->mtu) * ENET_THLD_UNIT;
 	priv->tx_thld_window = priv->dma_max_burst_length * ENET_BURST_UNIT;
+
+	/* Only v5 is known to size the TBUF for a long frame and to carry the
+	 * full length in a transmit descriptor, the older parts stay at the
+	 * default MTU
+	 */
+	if (GENET_IS_V5(priv))
+		dev->max_mtu = ENET_MAX_MTU;
+
 	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);
 
 	priv->clk_wol = devm_clk_get_optional(&priv->pdev->dev, "enet-wol");
@@ -4553,7 +4680,7 @@ static int bcmgenet_resume(struct device *d)
 		umac_enable_set(priv, CMD_RX_EN | CMD_TX_EN, false);
 		bcmgenet_rdma_disable(priv);
 		bcmgenet_intr_disable(priv);
-		bcmgenet_fini_dma(priv);
+		bcmgenet_fini_dma(priv, NULL);
 		if (phy_is_started(dev->phydev) ||
 		    dev->phydev->state == PHY_ERROR)
 			phy_stop(dev->phydev);
@@ -4665,7 +4792,7 @@ static int bcmgenet_suspend(struct device *d)
 		bcmgenet_fini_tx_napi(priv);
 	} else {
 		/* Teardown the interface */
-		bcmgenet_netif_stop(dev, true);
+		bcmgenet_netif_stop(dev, true, NULL);
 	}
 
 	return 0;

-- 
2.53.0


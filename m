Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014280;
	b=OZ/dmlz1M7SkMP7WckNiB8Z3L4xXeKmSwa0R8Ghm0784Y+C3Aa6R7bmsCjaLiiWiJQUE
	 EOdwra3mLFNzsnnT4sp2kaiyXkLdBtMf5lAiyks8ytqpzSybcYgXxLgVN6mPQa4Lnyh+k
	 f8EpvZcshjcQjyEEfxbvZURFD3mB2XX1ej2jjtY7VE6hB9q+5CtC2slq5j05p6vNEolo/
	 JNwgdqa+wcLlmRugLUZd96i4F9O0PRPSnP851Th3r96wxgErTBYXEVIX3M8JQL1L3c4kY
	 G8DhegFdcHfmu04Kd/Vzi0wgpPvHuSjVtJUksoaxhDX7impEvvOjMY1bMyDdX3y9Npw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014280;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=qCQUyUjDt2IVWXDDgz4swAeY0iAd6jSFadP2bMEQRkY=;
	b=2NtuH1A75BgsuyH2xfsXLoT+PUkHIEsTsbHjOp7GdUbsPYmUpTFnz7V+8L0IWggThFHM
	 I3FCzy/0v/gdp9gW1Wj5ZqSLlpYWAAhPHdnyh/joSCVLbfZD57voaEIgaSA26iNWMGI4G
	 Ebj51GfLPNYdKng6XTQy85hN1KKqds2M02y+swWZHswRynyq6XUXXouGw+SIPiGYFICWg
	 vyCP8yMhUtXJZ4a4EXshzpix5ugyACOo38o0B0d4WpkJUPTy0rCNNMH58C39vsey2QE8S
	 cU86L58gHSo6vn1xjUMFrtBKg/sg9eIB1Wzqc/C0wWFyA5jvs48iPkL8zobxnwYf/XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Kz0aQpMr;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AA60A2600;
	Wed, 18 Nov 2026 15:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4AA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Kz0aQpMr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C03F5A21D8;
	Wed, 18 Nov 2026 16:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795014278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qCQUyUjDt2IVWXDDgz4swAeY0iAd6jSFadP2bMEQRkY=;
	b=Kz0aQpMrrV+Zjr5Ggdyg7NSJncfuECdoPX3c8SwnlU38nEiUux7ug5Rlx8WEXV/vioLHpi
	lUjOEtb055aQxMo0i64w+7KQQbPKiT2/edAhsxb8jovMVpPjFISGIuUZLITWCa/sbOA90m
	9DwH+CPwVjjqYpZ2Cx0v4hx+gsaV7zgsktrIumTcVimQp5pZX6ZrwAT3R93cqWKlOF3LtM
	Vxx9VsRNzM8gV2EN5EWWZO5ZMYDoK3oT+1PHtYDk/m3Yb1PJQsq1mVEWM8iEYCgYQ5iHfm
	2PEhoC6HxvC8WOo+AVsjzdNSQcBQrbEuv3BiK3nU09T9Xwdjt1dY4BSTpTOf8w==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 16:03:41 +0100
Subject: [PATCH net-next v8 8/9] net: bcmgenet: allow the MTU to be changed
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
Message-Id: <20261118-nb-genet-mtu-nn-v2-v8-8-68f75eadf3e2@tipi-net.de>
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

Only v5 is known to size the TBUF for a long frame and to carry the full
length in a transmit descriptor, so the older parts keep the default MTU
until someone confirms them.

Only a DMA that refuses to halt still takes the interface down, because
nothing is left to run on.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Link: https://github.com/raspberrypi/linux/issues/5561
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 93 ++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 73bd6a281eb3..54b65edd6843 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -91,6 +91,12 @@
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
@@ -3993,6 +3999,83 @@ static int bcmgenet_change_carrier(struct net_device *dev, bool new_carrier)
 	return 0;
 }
 
+static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
+{
+	struct bcmgenet_priv *priv = netdev_priv(dev);
+	unsigned int old_mtu = dev->mtu;
+	struct bcmgenet_dma_set set;
+	int ret;
+
+	/* Below ETH_DATA_LEN everything is floored, so there is nothing to
+	 * reprogram. Same when a failed resume left the datapath down.
+	 */
+	if (!netif_running(dev) || !priv->tx_cbs ||
+	    max_t(unsigned int, old_mtu, ETH_DATA_LEN) ==
+	    max_t(unsigned int, new_mtu, ETH_DATA_LEN)) {
+		WRITE_ONCE(dev->mtu, new_mtu);
+		priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
+		return 0;
+	}
+
+	ret = bcmgenet_alloc_dma(priv, bcmgenet_rx_buf_len(new_mtu), &set);
+	if (ret)
+		return ret;
+
+	/* The watchdog trips on an idle queue once the rings are gone */
+	netif_device_detach(dev);
+
+	/* The PHY stays up, hold its lock. A link event would otherwise take
+	 * the MAC out of reset and enable it mid rewrite.
+	 */
+	mutex_lock(&dev->phydev->lock);
+	bcmgenet_netif_stop(dev, false);
+
+	WRITE_ONCE(dev->mtu, new_mtu);
+	priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
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
+	mutex_unlock(&dev->phydev->lock);
+
+	/* bcmgenet_netif_start() only restores the link interrupt */
+	if (bcmgenet_has_mdio_intr(priv))
+		bcmgenet_intrl2_0_writel(priv, UMAC_IRQ_MDIO_EVENT,
+					 INTRL2_CPU_MASK_CLEAR);
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
@@ -4004,6 +4087,7 @@ static const struct net_device_ops bcmgenet_netdev_ops = {
 	.ndo_set_features	= bcmgenet_set_features,
 	.ndo_get_stats64	= bcmgenet_get_stats64,
 	.ndo_change_carrier	= bcmgenet_change_carrier,
+	.ndo_change_mtu		= bcmgenet_change_mtu,
 };
 
 /* GENET hardware parameters/characteristics */
@@ -4357,9 +4441,18 @@ static int bcmgenet_probe(struct platform_device *pdev)
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

-- 
2.53.0


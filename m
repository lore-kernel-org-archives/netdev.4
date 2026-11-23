Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425458;
	b=llSQtN7q1GT/co/YdPZN2h1O50yRE31Em+69KBoHv4WBqWqSupeqEEqzhk0pLZiGXcM3
	 hk0kw0vOa+TpfVWVL2ttHunXIbprLCvzc1YxPiTtC0BmymDycB8RS8e7DqiYs4SyV6B6A
	 8Skj0I3idx+XLXtbluhB88TJkI8MbYYYjEGrmGU88cn6r+pY9E5N5tNIajDLniXuNgZEw
	 88yers/Oyk+XmRoTdBoxgRwFWjaY5i/CPfg0ZuNKEHbgq7db5B1C+qqeAeS5gjod9lpx6
	 RwF2j1e2sbSxr8chNvmcmLtFkwKF4t7rwnmaFJ6kgu3KNaJfh2Xa4BAIMouGlNXWfIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425458;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=QeRYX4VAajglrkor4q6M1mrSZr1O76o0QwHgNLXpR7A=;
	b=Z6eh4jaLQi0T2dsTn9p3vXoEjU6yfSRqCckS0nNGcm9cNUmJ9L0oEW4a9plTmnZ4nPUD
	 tuKfh5oLI2f/sPtzqWyw6FdPsAATJQYY4Ee3i5qNCuiV0jENxvu/18t/iXq3iwll4fb1J
	 xBnkJovj7n/pvzjJUp6jwK0Es3WAKjgYPgusm4nzXklN0JQ/zI51MDSTTAhwU6LH2bfJM
	 IJ85Fy3BAAIFG46cvkyyV7ecYhvKjec+QiAb5ppoo5YN0dqx4vQCnMC19PkhZrrjhgUag
	 aa3j00ScR/quVmWnybRUYn/DBH7VHiHiIrF5b/eYjObEugY+XRpXLcI6P6gLw4cURiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=gTGXXNTg;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8BB60A3802;
	Mon, 23 Nov 2026 09:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E8BB60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=gTGXXNTg
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 273DFA4B38;
	Mon, 23 Nov 2026 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795425455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QeRYX4VAajglrkor4q6M1mrSZr1O76o0QwHgNLXpR7A=;
	b=gTGXXNTguQXWukXG7qRS5u28Yd/Nq9N06aNffZQjwOBICPq4lu8PZ8RwWqaeDKhp/HKLPl
	nmAAIN2eNSRbaV0ycbh0S8pN0Y0FvI5coLVorZVQMubN9Bu+ZAvb5zeeH9GDYGns/Kc8lo
	DdkaoiL37emZl5qhlkzUvdcc4oLQXt05eR+d6Q8lyFQhQQzNQkhRPi9NDFhRgBA8+DbLTW
	RUXB9j7UsX2Jkj0o0dNYeDsn0Zeb2mF18C70IA8QNjVMkSBykwN2/f4ai5pvRGANvz+FXy
	smEn/IbFa9Q//NkZGV4aWWPnUsbDaw4K8BmTH4/NQ3cVAK8c3WVUBjiQXGqLDQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Mon, 23 Nov 2026 10:17:13 +0100
Subject: [PATCH net-next v9 5/8] net: bcmgenet: split frames that end just
 past the transmit threshold
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
Message-Id: <20261123-nb-genet-mtu-nn-v2-v9-5-4f93ded19bbb@tipi-net.de>
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

A frame that ends a few bytes past the transmit packet ready threshold
stops the transmitter as soon as a shorter frame follows. Tx DMA then
refuses to halt, so every later bcmgenet_init_dma() fails and the
interface cannot be opened again. IP fragmentation generates that pattern
on every datagram, full frames and a short tail. At the default MTU no
frame is long enough to reach the threshold, so the stall needs the
larger MTU that comes later in this series.

The window starts one byte past the threshold and never reaches 64 bytes.
On a v5 it ends 28, 32 and 46 bytes past thresholds of 2560, 3584 and
3840, and link speed makes no difference. That is one DMA transfer wide,
which wtschueller measured and proposed to split around. The bcm2711
programs a burst of 0x08 and sends nothing at all at 0x10, so the window
follows the burst length to cover the parts that program the larger value.

Splitting such a frame over two descriptors keeps its end out of that
transfer. Both share the one mapping, so the wire bytes do not change. The
split costs one descriptor, so the queue stops and wakes one earlier, and
a frame is flattened one fragment sooner.

The threshold kept its reset value until now. Raising it only once the MTU
asks for more than ETH_DATA_LEN leaves the common MTUs as they were.

The MAC inserts a checksum only into a frame it holds in full, so a longer
one has to fall back to software.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 173 +++++++++++++++++++------
 drivers/net/ethernet/broadcom/genet/bcmgenet.h |   4 +
 2 files changed, 140 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 893cf61f8828..766203e7c482 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -64,6 +64,13 @@
 #define ENET_THLD_DEFAULT	0x80
 #define ENET_THLD_MAX		0xf0
 
+/* A frame that ends within one DMA transfer past the transmit threshold
+ * stops the transmitter once a shorter frame follows. The burst register
+ * has no documented unit, 8 bytes per count matches the 46 bytes measured
+ * on a bcm2711, which programs 0x08.
+ */
+#define ENET_BURST_UNIT		8
+
 /* Page pool RX buffer layout:
  * RSB(64) + pad(2) | frame data | skb_shared_info
  * The HW writes the 64B RSB before every descriptor of a frame. Only the
@@ -1915,15 +1922,19 @@ static struct sk_buff *bcmgenet_free_tx_cb(struct device *dev,
 
 	if (skb) {
 		cb->skb = NULL;
-		if (cb == GENET_CB(skb)->first_cb)
-			dma_unmap_single(dev, dma_unmap_addr(cb, dma_addr),
-					 dma_unmap_len(cb, dma_len),
-					 DMA_TO_DEVICE);
-		else
-			dma_unmap_page(dev, dma_unmap_addr(cb, dma_addr),
-				       dma_unmap_len(cb, dma_len),
-				       DMA_TO_DEVICE);
-		dma_unmap_addr_set(cb, dma_addr, 0);
+		/* A cut descriptor left its mapping to the one after it */
+		if (cb != GENET_CB(skb)->split_cb) {
+			if (cb == GENET_CB(skb)->head_cb)
+				dma_unmap_single(dev,
+						 dma_unmap_addr(cb, dma_addr),
+						 dma_unmap_len(cb, dma_len),
+						 DMA_TO_DEVICE);
+			else
+				dma_unmap_page(dev, dma_unmap_addr(cb, dma_addr),
+					       dma_unmap_len(cb, dma_len),
+					       DMA_TO_DEVICE);
+			dma_unmap_addr_set(cb, dma_addr, 0);
+		}
 
 		if (cb == GENET_CB(skb)->last_cb)
 			return skb;
@@ -2150,7 +2161,10 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	struct device *kdev = &priv->pdev->dev;
+	unsigned int split_i = 0, split_at = 0;
 	struct bcmgenet_tx_ring *ring = NULL;
+	dma_addr_t split_mapping = 0;
+	unsigned int split_size = 0;
 	struct enet_cb *tx_cb_ptr;
 	struct netdev_queue *txq;
 	int nr_frags, index;
@@ -2158,6 +2172,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	unsigned int size;
 	skb_frag_t *frag;
 	u32 len_stat;
+	bool split;
 	int ret;
 	int i;
 
@@ -2167,8 +2182,14 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	nr_frags = skb_shinfo(skb)->nr_frags;
 
+	/* Cut a frame ending in that window in two at the threshold, its end
+	 * then lands in a separate transfer.
+	 */
+	split = unlikely(skb->len > priv->tx_thld_len &&
+			 skb->len < priv->tx_thld_len + priv->tx_thld_window);
+
 	/* The check below would always refuse this frame */
-	if (unlikely(nr_frags + 1 >= ring->size)) {
+	if (unlikely(nr_frags + 1 + split >= ring->size)) {
 		skb = skb_share_check(skb, GFP_ATOMIC);
 		if (skb && skb_linearize(skb)) {
 			dev_kfree_skb_any(skb);
@@ -2184,7 +2205,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	spin_lock(&ring->lock);
-	if (ring->free_bds <= (nr_frags + 1)) {
+	if (ring->free_bds <= (nr_frags + 1 + split)) {
 		if (!netif_tx_queue_stopped(txq))
 			netif_tx_stop_queue(txq);
 		ret = NETDEV_TX_BUSY;
@@ -2201,6 +2222,20 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto out;
 	}
 
+	/* The MAC inserts a checksum only into a frame it holds in full and
+	 * silently drops a longer one, so fall back to software.
+	 */
+	if (unlikely(skb->len > priv->tx_thld_len) &&
+	    skb->ip_summed == CHECKSUM_PARTIAL) {
+		if (skb_checksum_help(skb)) {
+			BCMGENET_STATS64_INC((&ring->stats64), dropped);
+			dev_kfree_skb_any(skb);
+			ret = NETDEV_TX_OK;
+			goto out;
+		}
+		nr_frags = skb_shinfo(skb)->nr_frags;
+	}
+
 	/* Retain how many bytes will be sent on the wire, without TSB inserted
 	 * by transmit checksum offload
 	 */
@@ -2213,34 +2248,79 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto out;
 	}
 
-	for (i = 0; i <= nr_frags; i++) {
+	/* A threshold that already ends a buffer needs no cut */
+	if (split) {
+		unsigned int buf = skb_headlen(skb);
+		unsigned int covered = buf - sizeof(struct status_64);
+
+		while (covered < priv->tx_thld_len) {
+			frag = &skb_shinfo(skb)->frags[split_i++];
+			buf = skb_frag_size(frag);
+			covered += buf;
+		}
+
+		split_at = buf - (covered - priv->tx_thld_len);
+		split = split_at && split_at < buf;
+	}
+
+	for (i = 0; i <= nr_frags + split; i++) {
+		unsigned int f = i - (split && i > split_i);
+		bool cont = split && i == split_i + 1;
+
 		tx_cb_ptr = bcmgenet_get_txcb(priv, ring);
 
 		BUG_ON(!tx_cb_ptr);
 
-		if (!i) {
-			/* Transmit single SKB or head of fragment list */
-			GENET_CB(skb)->first_cb = tx_cb_ptr;
-			size = skb_headlen(skb);
-			mapping = dma_map_single(kdev, skb->data, size,
-						 DMA_TO_DEVICE);
+		if (cont) {
+			/* Rest of the buffer cut above. It unmaps for both,
+			 * the hardware is done with it only now.
+			 */
+			mapping = split_mapping + split_at;
+			size = split_size - split_at;
+			dma_unmap_addr_set(tx_cb_ptr, dma_addr, split_mapping);
+			dma_unmap_len_set(tx_cb_ptr, dma_len, split_size);
+
+			/* A cut head buffer leaves its mapping here too */
+			if (!split_i)
+				GENET_CB(skb)->head_cb = tx_cb_ptr;
 		} else {
-			/* xmit fragment */
-			frag = &skb_shinfo(skb)->frags[i - 1];
-			size = skb_frag_size(frag);
-			mapping = skb_frag_dma_map(kdev, frag, 0, size,
-						   DMA_TO_DEVICE);
-		}
+			if (!f) {
+				/* Transmit single SKB or head of frag list */
+				GENET_CB(skb)->first_cb = tx_cb_ptr;
+				GENET_CB(skb)->head_cb = tx_cb_ptr;
+				GENET_CB(skb)->split_cb = NULL;
+				size = skb_headlen(skb);
+				mapping = dma_map_single(kdev, skb->data,
+							 size, DMA_TO_DEVICE);
+			} else {
+				/* xmit fragment */
+				frag = &skb_shinfo(skb)->frags[f - 1];
+				size = skb_frag_size(frag);
+				mapping = skb_frag_dma_map(kdev, frag, 0, size,
+							   DMA_TO_DEVICE);
+			}
 
-		ret = dma_mapping_error(kdev, mapping);
-		if (ret) {
-			priv->mib.tx_dma_failed++;
-			netif_err(priv, tx_err, dev, "Tx DMA map failed\n");
-			ret = NETDEV_TX_OK;
-			goto out_unmap_frags;
+			ret = dma_mapping_error(kdev, mapping);
+			if (ret) {
+				priv->mib.tx_dma_failed++;
+				netif_err(priv, tx_err, dev,
+					  "Tx DMA map failed\n");
+				ret = NETDEV_TX_OK;
+				goto out_unmap_frags;
+			}
+			dma_unmap_addr_set(tx_cb_ptr, dma_addr, mapping);
+			dma_unmap_len_set(tx_cb_ptr, dma_len, size);
+
+			/* The cut hands buffer and mapping to the next one */
+			if (split && i == split_i) {
+				GENET_CB(skb)->split_cb = tx_cb_ptr;
+				split_mapping = mapping;
+				split_size = size;
+				size = split_at;
+				dma_unmap_addr_set(tx_cb_ptr, dma_addr, 0);
+				dma_unmap_len_set(tx_cb_ptr, dma_len, 0);
+			}
 		}
-		dma_unmap_addr_set(tx_cb_ptr, dma_addr, mapping);
-		dma_unmap_len_set(tx_cb_ptr, dma_len, size);
 
 		tx_cb_ptr->skb = skb;
 
@@ -2257,7 +2337,7 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 			if (skb->ip_summed == CHECKSUM_PARTIAL)
 				len_stat |= DMA_TX_DO_CSUM;
 		}
-		if (i == nr_frags)
+		if (i == nr_frags + split)
 			len_stat |= DMA_EOP;
 
 		dmadesc_set(priv, tx_cb_ptr->bd_addr, mapping, len_stat);
@@ -2269,8 +2349,8 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	skb_tx_timestamp(skb);
 
 	/* Decrement total BD count and advance our write pointer */
-	ring->free_bds -= nr_frags + 1;
-	ring->prod_index += nr_frags + 1;
+	ring->free_bds -= nr_frags + 1 + split;
+	ring->prod_index += nr_frags + 1 + split;
 	ring->prod_index &= DMA_P_INDEX_MASK;
 
 	netdev_tx_sent_queue(txq, GENET_CB(skb)->bytes_sent);
@@ -2689,6 +2769,17 @@ static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
 		       ENET_THLD_MAX_LEN / ENET_THLD_UNIT);
 }
 
+/* The transmit threshold in register units. Keep the reset value while the
+ * MTU has no use for more, the hardware never reaches it below ETH_DATA_LEN.
+ */
+static unsigned int bcmgenet_tx_pkt_rdy_thld(unsigned int mtu)
+{
+	if (mtu <= ETH_DATA_LEN)
+		return ENET_THLD_DEFAULT;
+
+	return ENET_THLD_MAX;
+}
+
 /* A buffer has to hold everything the threshold lets the hardware deliver */
 static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
 {
@@ -2699,8 +2790,10 @@ static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
 /* Call with the MAC disabled */
 static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
 {
+	u32 tx_thld = bcmgenet_tx_pkt_rdy_thld(mtu);
 	u32 thld = bcmgenet_pkt_rdy_thld(mtu);
 
+	priv->tx_thld_len = tx_thld * ENET_THLD_UNIT;
 	bcmgenet_umac_writel(priv, ENET_MAC_FRAME_LEN(mtu), UMAC_MAX_FRAME_LEN);
 
 	/* GENET v1 maps other registers at these offsets */
@@ -2708,6 +2801,8 @@ static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
 		return;
 
 	bcmgenet_rbuf_writel(priv, thld, RBUF_PKT_RDY_THLD);
+	bcmgenet_writel(tx_thld, priv->base + priv->hw_params->tbuf_offset +
+			TBUF_PKT_RDY_THLD);
 }
 
 static void init_umac(struct bcmgenet_priv *priv)
@@ -2822,8 +2917,10 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
 	ring->index = index;
 	ring->cbs = priv->tx_cbs + start_ptr;
 	ring->size = size;
-	/* An empty ring must be able to wake the queue */
-	ring->stop_thld = min_t(unsigned int, MAX_SKB_FRAGS + 1, size - 1);
+	/* An empty ring must be able to wake the queue, a split frame takes
+	 * one descriptor more.
+	 */
+	ring->stop_thld = min_t(unsigned int, MAX_SKB_FRAGS + 2, size - 1);
 	ring->clean_ptr = start_ptr;
 	ring->c_index = 0;
 	ring->free_bds = size;
@@ -4209,6 +4306,8 @@ static int bcmgenet_probe(struct platform_device *pdev)
 	init_waitqueue_head(&priv->wq);
 	bcmgenet_hfb_init(priv);
 	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);
+	priv->tx_thld_len = bcmgenet_tx_pkt_rdy_thld(dev->mtu) * ENET_THLD_UNIT;
+	priv->tx_thld_window = priv->dma_max_burst_length * ENET_BURST_UNIT;
 	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);
 
 	priv->clk_wol = devm_clk_get_optional(&priv->pdev->dev, "enet-wol");
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
index b40e56872132..906639c1f012 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
@@ -543,7 +543,9 @@ struct bcmgenet_hw_params {
 
 struct bcmgenet_skb_cb {
 	struct enet_cb *first_cb;	/* First control block of SKB */
+	struct enet_cb *head_cb;	/* Owns the head mapping */
 	struct enet_cb *last_cb;	/* Last control block of SKB */
+	struct enet_cb *split_cb;	/* Cut, the next one unmaps for both */
 	unsigned int bytes_sent;	/* bytes on the wire (no TSB) */
 };
 
@@ -618,6 +620,8 @@ struct bcmgenet_priv {
 	void __iomem *tx_bds;
 	struct enet_cb *tx_cbs;
 	unsigned int num_tx_bds;
+	unsigned int tx_thld_len;
+	unsigned int tx_thld_window;
 
 	struct bcmgenet_tx_ring tx_rings[GENET_MAX_MQ_CNT + 1];
 

-- 
2.53.0


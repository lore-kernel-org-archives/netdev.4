Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014277;
	b=dPr9VKypY5WDuxLbOivbHwiSr9XdruOV+xHkTdK7HBhg5AdC3N6TrX43c2BulE9v9WQQ
	 c8dosp3m3LhccBE83fsAhAkQWgyjAEfXnbcPTyjjq3hKQP29oejbpuMPnb2t+4uMvnBeI
	 a4D1yXEKhu/hMZ6BEvnw7fhQtU3qvUHfHBHMf3objIp/MP3YlwJ+hFUxcfbWw7WCF6nhc
	 S+EZQw/1DM/ZU0+aYWAa5Kl3scia/vrsJ2iKUz+qTX3HSnwdpzHkNDGoQghrkV3PL9ecy
	 x5rdpE7Q8hegVmxVrAP6pCZ+jexzzqNJZpK0FiZJWGFJesdPB5bAn52aXozgK7SSqYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014277;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=jJAhljeG+ElppjKxCgKh5LltlVP8GPL/YM7iZ7wOHWU=;
	b=ZA8LYb+LTCropBMfGrwhVCmAYGvR4+LaIyN2BDA+31E8rBXfGmXH/kODA7P80x2S2kWg
	 x66JnqsG+Buu7xV5/8G9NaZ+OLUSFejjs70mZTqpJwEcF9B/gNY/SkNLrNVpTgy2AbNRK
	 BsDGlvQqJH06pbEPbB39W1WKbBIuj6kCqB78JGZRleXjzsvegsLldc8oBKwv7CMFrCBuQ
	 ijCTXA5NHIYStWvouLeg/IV5sLzr1PD18jC4n5UzQRchdFs2lBFpnJ4PfRPXrzJZJmioG
	 0O//Jx1IxeM7PhKSM4JwNejjZ07n1CpL8TC+vS6+/L4hp3FcguBEnbTj2IbVUaWm2NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ezmCQ0US;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D6606A320;
	Wed, 18 Nov 2026 15:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ezmCQ0US
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DF48A2067;
	Wed, 18 Nov 2026 16:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795014275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jJAhljeG+ElppjKxCgKh5LltlVP8GPL/YM7iZ7wOHWU=;
	b=ezmCQ0UScFpohOEio0QPcGVPuz+mHyQkXJalZ8yo9s7sPlgca61TdtHwqb0PGsfmjXQvIQ
	WzZQzFesTb8pweVcgKtqJMyrchMtypuU8p4J0Chg4Zu1WieyvRTKqZgxA9XXJ359Tqseux
	l98KFEeqK6up4DcOQJMkmMFsYNblkHziAKVNaNZwhR1S75XMcTmJWKRc4gV61VdyNahdPE
	6w+O0B1Fqp8AHyIFIe4iKYLGIq1sc29+xmtECvdHcknhAh2oTFdegq+XiBEIn/bLbbo1OF
	HuQ8sDENBbepC+OPXRghwl3IeHKw2M5eyPYOacFykZeN1MJobmyNv/dyEHOdpQ==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Wed, 18 Nov 2026 16:03:38 +0100
Subject: [PATCH net-next v8 5/9] net: bcmgenet: derive the receive buffer
 length from the MTU
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
Message-Id: <20261118-nb-genet-mtu-nn-v2-v8-5-68f75eadf3e2@tipi-net.de>
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

The receive buffer length is a fixed 2048 bytes. The packet ready
thresholds keep whatever value the reset left. Neither follows the MTU.

Compute the receive threshold from the MTU and program it into RBUF. The
buffer length follows from it, with the status block on top. The MTU is
still fixed at ETH_DATA_LEN, so the threshold comes out at the reset
default and the buffer only grows by the status block the hardware already
wrote. Derive UMAC_MAX_FRAME_LEN and the flow period from the MTU too, with
a floor at ETH_DATA_LEN so a lower MTU does not stop the MAC accepting a
standard frame.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 90 +++++++++++++++++++++-----
 drivers/net/ethernet/broadcom/genet/bcmgenet.h | 18 +++++-
 2 files changed, 90 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index b0b0d9b42348..e0edfe3fc94a 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -48,18 +48,41 @@
 #define GENET_Q0_TX_BD_CNT	\
 	(TOTAL_DESC - priv->hw_params->tx_queues * priv->hw_params->tx_bds_per_q)
 
-#define RX_BUF_LENGTH		2048
 #define SKB_ALIGNMENT		32
 
+/* The transmit descriptors carry their own lengths, so this is unused and
+ * keeps the reset value.
+ */
+#define TX_RING_BUF_SIZE	2048
+
+/* RBUF and TBUF hand a frame to the DMA once the threshold is reached. Both
+ * registers are 8 bit in units of 16 bytes and want a multiple of the 256
+ * byte burst size, so 0xf0 is the largest usable value.
+ */
+#define ENET_THLD_UNIT		16
+#define ENET_THLD_BURST		256
+#define ENET_THLD_DEFAULT	0x80
+#define ENET_THLD_MAX		0xf0
+
 /* Page pool RX buffer layout:
  * RSB(64) + pad(2) | frame data | skb_shared_info
  * The HW writes the 64B RSB before every descriptor of a frame. Only the
  * first one also gets the 2B alignment padding.
  */
-#define GENET_RSB_PAD		(sizeof(struct status_64) + 2)
+#define GENET_RBUF_ALIGN	2
+#define GENET_RSB_PAD		(sizeof(struct status_64) + GENET_RBUF_ALIGN)
 
-/* RX buffer plus the skb_shared_info napi_build_skb() places behind it */
-#define GENET_RX_BUF_SIZE	SKB_HEAD_ALIGN(RX_BUF_LENGTH)
+/* A descriptor never spans more than one page, which also holds
+ * skb_shared_info behind the frame, so on 4K pages the page bounds the
+ * threshold before the register does. Larger pages fit several descriptors.
+ */
+#define ENET_SHINFO_LEN		SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
+#define ENET_THLD_PAGE_LEN	round_down(PAGE_SIZE - ENET_SHINFO_LEN - \
+					   sizeof(struct status_64), \
+					   ENET_THLD_BURST)
+#define ENET_THLD_MAX_LEN	min_t(unsigned int, \
+				      ENET_THLD_MAX * ENET_THLD_UNIT, \
+				      ENET_THLD_PAGE_LEN)
 
 /* Tx/Rx DMA register offset, skip 256 descriptors */
 #define WORDS_PER_BD(p)		(p->hw_params->words_per_bd)
@@ -2287,7 +2310,7 @@ static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
 			      struct enet_cb *cb)
 {
 	struct bcmgenet_priv *priv = ring->priv;
-	unsigned int size = GENET_RX_BUF_SIZE;
+	unsigned int size = SKB_HEAD_ALIGN(priv->rx_buf_len);
 	unsigned int offset;
 	dma_addr_t mapping;
 	struct page *page;
@@ -2302,7 +2325,7 @@ static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
 
 	/* page_pool handles DMA mapping via PP_FLAG_DMA_MAP */
 	mapping = page_pool_get_dma_addr(page) + offset;
-	dma_sync_single_for_device(&priv->pdev->dev, mapping, RX_BUF_LENGTH,
+	dma_sync_single_for_device(&priv->pdev->dev, mapping, priv->rx_buf_len,
 				   DMA_FROM_DEVICE);
 
 	cb->rx_page = page;
@@ -2381,10 +2404,10 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 		}
 
 		/* Sync the full buffer; the HW may have written anywhere
-		 * up to RX_BUF_LENGTH.
+		 * up to priv->rx_buf_len.
 		 */
 		page_pool_dma_sync_for_cpu(ring->page_pool, rx_page, rx_offset,
-					   RX_BUF_LENGTH);
+					   priv->rx_buf_len);
 
 		hard_start = page_address(rx_page) + rx_offset;
 		status = (struct status_64 *)hard_start;
@@ -2406,7 +2429,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
 					     : sizeof(struct status_64);
 
 		/* Reject lengths that would underflow the SKB build path. */
-		if (unlikely(len > RX_BUF_LENGTH || len < min_len)) {
+		if (unlikely(len > priv->rx_buf_len || len < min_len)) {
 			netif_err(priv, rx_status, dev,
 				  "invalid packet length %d\n", len);
 			BCMGENET_STATS64_INC(stats, length_errors);
@@ -2657,6 +2680,41 @@ static void bcmgenet_link_intr_enable(struct bcmgenet_priv *priv)
 	bcmgenet_intrl2_0_writel(priv, int0_enable, INTRL2_CPU_MASK_CLEAR);
 }
 
+/* Receive threshold in register units. Covers the alignment bytes and the
+ * frame, but not the status block, which the hardware adds on top.
+ */
+static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
+{
+	unsigned int len = GENET_RBUF_ALIGN + mtu + ETH_HLEN + VLAN_HLEN;
+
+	len = round_up(len, ENET_THLD_BURST) / ENET_THLD_UNIT;
+
+	/* Keep the reset default for the common MTUs */
+	return clamp_t(unsigned int, len, ENET_THLD_DEFAULT,
+		       ENET_THLD_MAX_LEN / ENET_THLD_UNIT);
+}
+
+/* A buffer has to hold everything the threshold lets the hardware deliver */
+static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
+{
+	return sizeof(struct status_64) +
+	       bcmgenet_pkt_rdy_thld(mtu) * ENET_THLD_UNIT;
+}
+
+/* Program the MTU dependent registers. Call with the MAC disabled. */
+static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
+{
+	u32 thld = bcmgenet_pkt_rdy_thld(mtu);
+
+	bcmgenet_umac_writel(priv, ENET_MAC_FRAME_LEN(mtu), UMAC_MAX_FRAME_LEN);
+
+	/* GENET v1 maps other registers at these offsets */
+	if (GENET_IS_V1(priv))
+		return;
+
+	bcmgenet_rbuf_writel(priv, thld, RBUF_PKT_RDY_THLD);
+}
+
 static void init_umac(struct bcmgenet_priv *priv)
 {
 	struct device *kdev = &priv->pdev->dev;
@@ -2673,7 +2731,7 @@ static void init_umac(struct bcmgenet_priv *priv)
 			     UMAC_MIB_CTRL);
 	bcmgenet_umac_writel(priv, 0, UMAC_MIB_CTRL);
 
-	bcmgenet_umac_writel(priv, ENET_MAX_FRAME_LEN, UMAC_MAX_FRAME_LEN);
+	bcmgenet_set_mtu_regs(priv, priv->dev->mtu);
 
 	/* init tx registers, enable TSB */
 	reg = bcmgenet_tbuf_ctrl_get(priv);
@@ -2781,7 +2839,7 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
 
 	/* Set flow period for ring != 0 */
 	if (index)
-		flow_period_val = ENET_MAX_FRAME_LEN << 16;
+		flow_period_val = ENET_MAC_FRAME_LEN(priv->dev->mtu) << 16;
 
 	bcmgenet_tdma_ring_writel(priv, index, 0, TDMA_PROD_INDEX);
 	bcmgenet_tdma_ring_writel(priv, index, 0, TDMA_CONS_INDEX);
@@ -2792,7 +2850,7 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
 				  TDMA_FLOW_PERIOD);
 	bcmgenet_tdma_ring_writel(priv, index,
 				  ((size << DMA_RING_SIZE_SHIFT) |
-				   RX_BUF_LENGTH), DMA_RING_BUF_SIZE);
+				   TX_RING_BUF_SIZE), DMA_RING_BUF_SIZE);
 
 	/* Set start and end address, read and write pointers */
 	bcmgenet_tdma_ring_writel(priv, index, start_ptr * words_per_bd,
@@ -2811,8 +2869,9 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
 static int bcmgenet_rx_ring_create_pool(struct bcmgenet_priv *priv,
 					struct bcmgenet_rx_ring *ring)
 {
-	/* Buffers share a page. bcmgenet_rx_refill() syncs each one for the
-	 * device, PP_FLAG_DMA_SYNC_DEV would sync the whole page.
+	/* Buffers may share a page, depending on PAGE_SIZE and the MTU.
+	 * bcmgenet_rx_refill() syncs each one for the device,
+	 * PP_FLAG_DMA_SYNC_DEV would sync the whole page.
 	 */
 	struct page_pool_params pp_params = {
 		.order = 0,
@@ -2875,7 +2934,7 @@ static int bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
 	bcmgenet_rdma_ring_writel(priv, index, 0, RDMA_CONS_INDEX);
 	bcmgenet_rdma_ring_writel(priv, index,
 				  ((size << DMA_RING_SIZE_SHIFT) |
-				   RX_BUF_LENGTH), DMA_RING_BUF_SIZE);
+				   priv->rx_buf_len), DMA_RING_BUF_SIZE);
 	bcmgenet_rdma_ring_writel(priv, index,
 				  (DMA_FC_THRESH_LO <<
 				   DMA_XOFF_THRESHOLD_SHIFT) |
@@ -4154,6 +4213,7 @@ static int bcmgenet_probe(struct platform_device *pdev)
 	/* Mii wait queue */
 	init_waitqueue_head(&priv->wq);
 	bcmgenet_hfb_init(priv);
+	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);
 	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);
 
 	priv->clk_wol = devm_clk_get_optional(&priv->pdev->dev, "enet-wol");
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
index afaccb769933..b40e56872132 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
@@ -31,9 +31,17 @@
 #define ENET_BRCM_TAG_LEN	6
 #define ENET_PAD		8
 
-/* Longest frame the MAC must accept for the default MTU */
-#define ENET_MAX_FRAME_LEN	(ETH_DATA_LEN + ETH_HLEN + VLAN_HLEN + \
-				 ENET_BRCM_TAG_LEN + ETH_FCS_LEN + ENET_PAD)
+/* Longest frame the MAC must accept for a given MTU. ENET_PAD is slack the
+ * driver has always carried, it rounded the default up to 1536 from 1528.
+ */
+#define ENET_FRAME_OVERHEAD	(ETH_HLEN + VLAN_HLEN + ENET_BRCM_TAG_LEN + \
+				 ETH_FCS_LEN + ENET_PAD)
+#define ENET_MAX_FRAME_LEN(mtu)	((mtu) + ENET_FRAME_OVERHEAD)
+
+/* The MAC keeps accepting a standard frame below the default MTU */
+#define ENET_MAC_FRAME_LEN(mtu)	ENET_MAX_FRAME_LEN(max_t(unsigned int, (mtu), \
+							ETH_DATA_LEN))
+
 #define DMA_MAX_BURST_LENGTH    0x10
 
 /* misc. configuration */
@@ -218,6 +226,8 @@ struct bcmgenet_rx_stats64 {
 #define  RBUF_ALIGN_2B			(1 << 1)
 #define  RBUF_BAD_DIS			(1 << 2)
 
+#define RBUF_PKT_RDY_THLD		0x08
+
 #define RBUF_STATUS			0x0C
 #define  RBUF_STATUS_WOL		(1 << 0)
 #define  RBUF_STATUS_MPD_INTR_ACTIVE	(1 << 1)
@@ -248,6 +258,7 @@ struct bcmgenet_rx_stats64 {
 #define TBUF_CTRL			0x00
 #define  TBUF_64B_EN			(1 << 0)
 #define TBUF_BP_MC			0x0C
+#define TBUF_PKT_RDY_THLD		0x10
 #define TBUF_ENERGY_CTRL		0x14
 #define  TBUF_EEE_EN			(1 << 0)
 #define  TBUF_PM_EN			(1 << 1)
@@ -614,6 +625,7 @@ struct bcmgenet_priv {
 	void __iomem *rx_bds;
 	struct enet_cb *rx_cbs;
 	unsigned int num_rx_bds;
+	unsigned int rx_buf_len;
 	struct bcmgenet_rxnfc_rule rxnfc_rules[MAX_NUM_OF_FS_RULES];
 	struct list_head rxnfc_list;
 

-- 
2.53.0


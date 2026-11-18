Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035221;
	b=twGw2MiECIFddEjbZxC6A0TP9x7AysPuXILUgHU5IREyNNr+bryGFG+AT7hKoouSLUQJ
	 tMo6Arny6KVzIWwrNoW6lT82il7QZksHk7p+QDpoJvekvJTrD3QKBn5LmjkyuYHXKTrw8
	 etE+M3BiFpsFG5SG0xWfCR4y1eogHb0vXPEIaZxP8JWeQrFb+193zaYJSs5rGYfqz2w/i
	 7oacAIdIvYFp0/TY/vyrzTgZUZhlyUMch919pfWfkkqZQaGQxCGIxeIJUlRHs6I+f/HQA
	 6w9CtMf5WhTCpBwwP5F8wRVBnh3Ilf0kF0a+rC5BkOMpgBnv50XieqmNOy/AQrp2wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035221;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7C3hM9IgRLl6Zr/KeYig7YIiI+L64rfE5TfynqoeIZg=;
	b=JnSz1tijdW1lQ5/jBhcCXpFfhCIBetDJzsJzaFoemVUx5PF9lesViYxBA2nE6qLy4QiT
	 NUM+Ngn9e0xRiSPtreQM7mBA0M/PALCcbcZ3mXCf81i5Fi3USk+jBrXvG999tv7/I2oUM
	 5vy7S3gyHgjvqqO2tI36s9abS1hq4mI0fO7k7OUtNA/FrqF34hsekZnTh3ZUihSNl0kw1
	 fAbm6IoeqgTI2RGy1EVDpIZLkI3g/vStk+qQT2n+zPkvFRwDeRdwGRmb0apFttNKCBRkY
	 capXdYOSrgATv4BUGd31qLXD3gk83nMP1wZ6ZGnRzDyxfxH6SqDmF9oe2nUo9WgRQpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kQFq3zrg;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D3360A2606
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D3360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kQFq3zrg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C51A4E4160A;
	Wed, 18 Nov 2026 20:53:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C4B15FE9B;
	Wed, 18 Nov 2026 20:53:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BFD611BC3094;
	Wed, 18 Nov 2026 21:53:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795035213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7C3hM9IgRLl6Zr/KeYig7YIiI+L64rfE5TfynqoeIZg=;
	b=kQFq3zrg7LtLE7vF+swOpHYNHerZwhZPFvwHAoEvLn2t5eDhxUbKxjQB2UHWLhGyHyXSUb
	tRTbRC4qF/mdHER/azaOWq4YCosq/yU7YtwdxZbgO9qh4MeY+xucYnACupk748P0fSxfYd
	FQToEf+Hwa7a0iWfcQVO3DkKlpwQnFJOyuTMWLgb79DmBIxKFHWTWuf7DCW3qcso3lvfYw
	V+h7oYv7wbRQnVwfWHLVNInp+VrDRuvdP4AEpBSHwCE2a5YKD8q/jPt2BlIRRTRE9znAxD
	Axd/g4/2xuOStay/Pnl1m66GZZIvyfvVkt0X8KXg8k88meRATdWmNkVPPQos9A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 18 Nov 2026 21:53:24 +0100
Subject: [PATCH net-next v7 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
In-Reply-To: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, Paolo Valerio <pvalerio@redhat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

bp->num_queues is the total number of queues and is constant from probe.
MACB/GEM does not know about Rx/Tx specific queues; it only has
combined queues. Move bp->num_queues to ctx->num_queues as it now
belongs to the currently active context (bp->ctx).

Also introduce bp->max_num_queues which takes the current role of
bp->num_queues and allow `0 < ctx->num_queues <= bp->max_num_queues`.

Lastly introduce bp->configured_num_queues to remember queue count
across interface down+up cycles.

With all that, implement the .set_channels() operation. It ends up only
being an assignment to bp->configured_num_queues plus a call into
netif_set_real_num_queues(). However if the interface is running, we
use a context swap window to safely realloc on the fly.

Note we refuse the operation if any ENST schedule is in place on a
queue we would disable. If we allow the operation to take place, then
a transmission window would be reserved but unusable.

Nit: fix an alignment issue inside gem_ethtool_ops which does not
deserve its own patch.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      |   5 +-
 drivers/net/ethernet/cadence/macb_main.c | 258 ++++++++++++++++++++++---------
 2 files changed, 191 insertions(+), 72 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 00258866623f..d60b06e41b83 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1292,7 +1292,6 @@ struct macb_info {
 	struct platform_device	*pdev;
 	struct net_device	*netdev;
 	struct macb_or_gem_ops	macbgem_ops;
-	unsigned int		num_queues;
 	u32			caps;
 	int			rx_bd_rd_prefetch;
 	int			tx_bd_rd_prefetch;
@@ -1323,6 +1322,7 @@ struct macb_context {
 	unsigned int		rx_buffer_size;
 	unsigned int		rx_ring_size;
 	unsigned int		tx_ring_size;
+	unsigned int		num_queues;
 	struct macb_rxq		rxq[MACB_MAX_QUEUES];
 	struct macb_txq		txq[MACB_MAX_QUEUES];
 };
@@ -1381,6 +1381,9 @@ struct macb {
 	unsigned int		configured_tx_ring_size;
 	struct macb_context	*ctx;
 
+	unsigned int		configured_num_queues;
+	unsigned int		max_num_queues;
+
 	struct macb_dma_desc	*rx_ring_tieoff;
 	dma_addr_t		rx_ring_tieoff_dma;
 
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 1e0666692116..180da5d62f09 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -504,11 +504,25 @@ static void macb_init_buffers(struct macb *bp)
 		macb_writel(bp, TBQPH, upper_32_bits(txq->ring_dma));
 	}
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
-		rxq = &bp->ctx->rxq[q];
-		txq = &bp->ctx->txq[q];
-		queue_writel(queue, RBQP, lower_32_bits(rxq->ring_dma));
-		queue_writel(queue, TBQP, lower_32_bits(txq->ring_dma));
+	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue) {
+		if (q < bp->ctx->num_queues) {
+			rxq = &bp->ctx->rxq[q];
+			txq = &bp->ctx->txq[q];
+			queue_writel(queue, RBQP, lower_32_bits(rxq->ring_dma));
+			queue_writel(queue, TBQP, lower_32_bits(txq->ring_dma));
+		} else {
+			/* macb_set_channels(), which is the only way of writing
+			 * to bp->configured_num_queues, is only allowed if
+			 * MACB_CAPS_QUEUE_DISABLE.
+			 */
+			queue_writel(queue, RBQP, MACB_BIT(QUEUE_DISABLE));
+			queue_writel(queue, TBQP, MACB_BIT(QUEUE_DISABLE));
+
+			/* Disable all interrupts */
+			queue_writel(queue, IDR, -1);
+			queue_readl(queue, ISR);
+			macb_queue_isr_clear(bp, queue, -1);
+		}
 	}
 }
 
@@ -695,7 +709,7 @@ static bool macb_tx_all_queues_idle(struct macb *bp)
 	struct macb_txq *txq;
 	unsigned int q;
 
-	for (q = 0; q < bp->num_queues; ++q) {
+	for (q = 0; q < bp->ctx->num_queues; ++q) {
 		txq = &bp->ctx->txq[q];
 		if (READ_ONCE(txq->head) != READ_ONCE(txq->tail))
 			return false;
@@ -850,7 +864,8 @@ static void macb_mac_link_down(struct phylink_config *config, unsigned int mode,
 	bp->speed_mbps = 0;
 
 	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC))
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+		for (q = 0, queue = bp->queues; q < bp->ctx->num_queues;
+		     ++q, ++queue)
 			queue_writel(queue, IDR,
 				     bp->rx_intr_mask | MACB_TX_INT_FLAGS | MACB_BIT(HRESP));
 
@@ -952,7 +967,7 @@ static void gem_shuffle_tx_rings(struct macb *bp)
 	struct macb_queue *queue;
 	unsigned int q;
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; q++, queue++)
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; q++, queue++)
 		gem_shuffle_tx_one_ring(queue);
 }
 
@@ -972,11 +987,11 @@ static void macb_apply_enst_config(struct macb *bp)
 	/* Disable ENST for all queues.
 	 * Reconfiguring timings must be done with ENST disabled.
 	 */
-	queue_mask = BIT_U32(bp->num_queues) - 1;
+	queue_mask = BIT_U32(bp->max_num_queues) - 1;
 	gem_writel(bp, ENST_CONTROL,
 		   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue) {
 		/* Configure queue timing registers.
 		 *
 		 * Those fields must be zero if the queue has ENST disabled:
@@ -1034,10 +1049,10 @@ static void macb_mac_link_up(struct phylink_config *config,
 		if (rx_pause)
 			ctrl |= MACB_BIT(PAE);
 
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->ctx->num_queues;
+		     ++q, ++queue)
 			queue_writel(queue, IER,
 				     bp->rx_intr_mask | MACB_TX_INT_FLAGS | MACB_BIT(HRESP));
-		}
 	}
 
 	macb_or_gem_writel(bp, NCFGR, ctrl);
@@ -2198,12 +2213,12 @@ static void macb_quiesce_start(struct macb *bp)
 	bp->irq_quiesced = true;
 	spin_unlock_irqrestore(&bp->lock, flags);
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue)
 		synchronize_irq(queue->irq);
 
 	cancel_work_sync(&bp->hresp_err_bh_work);
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		/* Must be done before NAPI is disabled: the task ends with a
 		 * napi_enable() call.
 		 */
@@ -2231,7 +2246,7 @@ static void macb_quiesce_end(struct macb *bp)
 	unsigned long flags;
 	unsigned int q;
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		napi_enable(&queue->napi_rx);
 		napi_enable(&queue->napi_tx);
 	}
@@ -2250,7 +2265,7 @@ static void macb_hresp_error_task(struct work_struct *work)
 	unsigned int q;
 	u32 ctrl;
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < ctx->num_queues; ++q, ++queue) {
 		queue_writel(queue, IDR, bp->rx_intr_mask |
 					 MACB_TX_INT_FLAGS |
 					 MACB_BIT(HRESP));
@@ -2268,7 +2283,7 @@ static void macb_hresp_error_task(struct work_struct *work)
 	macb_init_buffers(bp);
 
 	/* Enable interrupts */
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < ctx->num_queues; ++q, ++queue)
 		queue_writel(queue, IER,
 			     bp->rx_intr_mask |
 			     MACB_TX_INT_FLAGS |
@@ -2369,7 +2384,9 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
 {
 	struct macb_queue *queue = dev_id;
 	struct macb *bp = queue->bp;
+	unsigned int num_queues = 0;
 	struct net_device *netdev = bp->netdev;
+	unsigned int q = queue - bp->queues;
 	bool hresp_err = false;
 	u32 status;
 
@@ -2380,19 +2397,24 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
 
 	spin_lock(&bp->lock);
 
+	/* Only dereference bp->ctx when not quiesced.
+	 * Quiesced state cannot change as we are in a bp->lock section.
+	 */
+	if (!bp->irq_quiesced && bp->ctx)
+		num_queues = READ_ONCE(bp->ctx->num_queues);
+
 	while (status) {
-		/* self-disarm while the netdev is closed
-		 * or during context swap
+		/* self-disarm while the netdev is closed,
+		 * during context swap, or when the current queue is disabled
 		 */
-		if (unlikely(bp->irq_quiesced)) {
+		if (unlikely(bp->irq_quiesced || q >= num_queues)) {
 			queue_writel(queue, IDR, -1);
 			macb_queue_isr_clear(bp, queue, -1);
 			break;
 		}
 
 		netdev_vdbg(netdev, "queue = %u, isr = 0x%08lx\n",
-			    (unsigned int)(queue - bp->queues),
-			    (unsigned long)status);
+			    q, (unsigned long)status);
 
 		if (status & bp->rx_intr_mask) {
 			/* There's no point taking any more interrupts
@@ -2450,7 +2472,8 @@ static void macb_poll_controller(struct net_device *netdev)
 	unsigned int q;
 
 	local_irq_save(flags);
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < bp->configured_num_queues;
+	     ++q, ++queue)
 		macb_interrupt(netdev->irq, queue);
 	local_irq_restore(flags);
 }
@@ -2893,7 +2916,7 @@ static void gem_free_rx_buffers(struct macb_context *ctx)
 	unsigned int q;
 	int i;
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		rxq = &ctx->rxq[q];
 
 		if (!rxq->skbuff)
@@ -2955,14 +2978,14 @@ static void macb_free(struct macb_context *ctx)
 	ctx->info->macbgem_ops.mog_free_rx_buffers(ctx);
 
 	txq = &ctx->txq[0];
-	size = ctx->info->num_queues * macb_tx_ring_size_per_queue(ctx);
+	size = ctx->num_queues * macb_tx_ring_size_per_queue(ctx);
 	dma_free_coherent(dev, size, txq->ring, txq->ring_dma);
 
 	rxq = &ctx->rxq[0];
-	size = ctx->info->num_queues * macb_rx_ring_size_per_queue(ctx);
+	size = ctx->num_queues * macb_rx_ring_size_per_queue(ctx);
 	dma_free_coherent(dev, size, rxq->ring, rxq->ring_dma);
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		txq = &ctx->txq[q];
 		rxq = &ctx->rxq[q];
 
@@ -2995,7 +3018,7 @@ static int gem_alloc_rx_buffers(struct macb_context *ctx)
 	unsigned int q;
 	int size;
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		rxq = &ctx->rxq[q];
 		size = ctx->rx_ring_size * sizeof(struct sk_buff *);
 		rxq->skbuff = kzalloc(size, GFP_KERNEL);
@@ -3029,8 +3052,8 @@ static int macb_alloc_rx_buffers(struct macb_context *ctx)
 
 static int macb_alloc(struct macb_context *ctx)
 {
-	unsigned int num_queues = ctx->info->num_queues;
 	struct device *dev = &ctx->info->pdev->dev;
+	unsigned int num_queues = ctx->num_queues;
 	dma_addr_t tx_dma, rx_dma;
 	struct macb_txq *txq;
 	struct macb_rxq *rxq;
@@ -3099,6 +3122,7 @@ static int macb_alloc(struct macb_context *ctx)
 }
 
 static struct macb_context *macb_context_alloc(struct macb *bp,
+					       unsigned int num_queues,
 					       unsigned int mtu,
 					       unsigned int rx_ring_size,
 					       unsigned int tx_ring_size)
@@ -3111,6 +3135,7 @@ static struct macb_context *macb_context_alloc(struct macb *bp,
 		return ERR_PTR(-ENOMEM);
 
 	ctx->info = &bp->info;
+	ctx->num_queues = num_queues;
 	ctx->rx_buffer_size = macb_rx_buffer_size(bp, mtu);
 	ctx->rx_ring_size = rx_ring_size;
 	ctx->tx_ring_size = tx_ring_size;
@@ -3158,7 +3183,7 @@ static int gem_init_rings(struct macb_context *ctx)
 	int err;
 	int i;
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		txq = &ctx->txq[q];
 		for (i = 0; i < ctx->tx_ring_size; i++) {
 			desc = macb_tx_desc(ctx, q, i);
@@ -3221,7 +3246,7 @@ static void macb_reset_hw(struct macb *bp)
 	gem_writel(bp, PBUFRXCUT, 0);
 
 	/* Disable all interrupts */
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		queue_writel(queue, IDR, -1);
 		queue_readl(queue, ISR);
 		macb_queue_isr_clear(bp, queue, -1);
@@ -3311,7 +3336,8 @@ static void macb_configure_dma(struct macb *bp)
 	buffer_size = bp->ctx->rx_buffer_size / RX_BUFFER_MULTIPLE;
 	if (macb_is_gem(&bp->info)) {
 		dmacfg = gem_readl(bp, DMACFG) & ~GEM_BF(RXBS, -1L);
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->ctx->num_queues;
+		     ++q, ++queue) {
 			if (q)
 				queue_writel(queue, RBQS, buffer_size);
 			else
@@ -3359,10 +3385,6 @@ static void macb_context_swap_start(struct macb *bp)
 	 */
 	netif_tx_disable(bp->netdev);
 
-	/* Now that everything is stopped, clear DQL. */
-	for (q = 0; q < bp->num_queues; ++q)
-		netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev, q));
-
 	/* Safe to call outside bp->lock because bp->irq_quiesced ensures the IRQ
 	 * handling is a no-op and all BH features are disabled.
 	 *
@@ -3376,7 +3398,7 @@ static void macb_context_swap_start(struct macb *bp)
 	ctrl = macb_readl(bp, NCR);
 	macb_writel(bp, NCR, ctrl & ~(MACB_BIT(RE) | MACB_BIT(TE)));
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		queue_writel(queue, IDR, -1);
 		queue_readl(queue, ISR);
 		macb_queue_isr_clear(bp, queue, -1);
@@ -3399,16 +3421,26 @@ static void macb_context_swap_end(struct macb *bp,
 
 	lockdep_assert_held(&bp->mac_cfg_lock);
 
-	/* Swap contexts & give buffer pointers to HW. */
+	/* Swap contexts & give buffer pointers to HW.
+	 * !new_ctx means that the swap failed and we keep the old context.
+	 */
 
-	old_ctx = bp->ctx;
-	WRITE_ONCE(bp->ctx, new_ctx);
-	wmb(); /* ensure IRQ enabled below read the new context */
-	macb_init_buffers(bp);
+	if (new_ctx) {
+		old_ctx = bp->ctx;
+		WRITE_ONCE(bp->ctx, new_ctx);
+		wmb(); /* ensure IRQ enabled below read the new context */
+
+		macb_init_buffers(bp);
+
+		/* Clear DQL (only on successful context swap). */
+		for (q = 0; q < bp->ctx->num_queues; ++q)
+			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
+								  q));
+	}
 
 	/* Start NAPI, HW Tx/Rx and software Tx. */
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		napi_enable(&queue->napi_rx);
 		napi_enable(&queue->napi_tx);
 	}
@@ -3421,7 +3453,8 @@ static void macb_context_swap_end(struct macb *bp,
 	macb_configure_dma(bp);
 
 	if (bp->link_up) {
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->ctx->num_queues;
+		     ++q, ++queue) {
 			queue_writel(queue, IER,
 				     bp->rx_intr_mask |
 				     MACB_TX_INT_FLAGS |
@@ -3445,8 +3478,10 @@ static void macb_context_swap_end(struct macb *bp,
 
 	/* Free old context. */
 
-	macb_free(old_ctx);
-	kfree(old_ctx);
+	if (new_ctx) {
+		macb_free(old_ctx);
+		kfree(old_ctx);
+	}
 }
 
 static void macb_init_hw(struct macb *bp)
@@ -3620,7 +3655,7 @@ static int macb_open(struct net_device *netdev)
 	if (err < 0)
 		return err;
 
-	ctx = macb_context_alloc(bp, netdev->mtu,
+	ctx = macb_context_alloc(bp, bp->configured_num_queues, netdev->mtu,
 				 bp->configured_rx_ring_size,
 				 bp->configured_tx_ring_size);
 	if (IS_ERR(ctx)) {
@@ -3685,7 +3720,7 @@ static int macb_close(struct net_device *netdev)
 	 * and tx_error_task wake them up.
 	 */
 	netif_tx_stop_all_queues(netdev);
-	for (q = 0; q < bp->num_queues; ++q)
+	for (q = 0; q < bp->ctx->num_queues; ++q)
 		netdev_tx_reset_queue(netdev_get_tx_queue(netdev, q));
 
 	phylink_stop(bp->phylink);
@@ -3721,7 +3756,8 @@ static int macb_change_mtu(struct net_device *netdev, int new_mtu)
 		if (bp->caps & MACB_CAPS_MACB_IS_EMAC)
 			return -EBUSY;
 
-		new_ctx = macb_context_alloc(bp, new_mtu,
+		new_ctx = macb_context_alloc(bp, bp->configured_num_queues,
+					     new_mtu,
 					     bp->configured_rx_ring_size,
 					     bp->configured_tx_ring_size);
 		if (IS_ERR(new_ctx))
@@ -3774,7 +3810,7 @@ static void gem_update_stats(struct macb *bp)
 	}
 
 	idx = GEM_STATS_LEN;
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue)
 		for (i = 0, stat = &queue->stats.first; i < QUEUE_STATS_LEN; ++i, ++stat)
 			bp->ethtool_stats[idx++] = *stat;
 }
@@ -3825,7 +3861,8 @@ static void gem_get_ethtool_stats(struct net_device *netdev,
 	spin_lock_irq(&bp->stats_lock);
 	gem_update_stats(bp);
 	memcpy(data, &bp->ethtool_stats, sizeof(u64)
-			* (GEM_STATS_LEN + QUEUE_STATS_LEN * bp->num_queues));
+			* (GEM_STATS_LEN + QUEUE_STATS_LEN *
+					   bp->max_num_queues));
 	spin_unlock_irq(&bp->stats_lock);
 }
 
@@ -3835,7 +3872,7 @@ static int gem_get_sset_count(struct net_device *netdev, int sset)
 
 	switch (sset) {
 	case ETH_SS_STATS:
-		return GEM_STATS_LEN + bp->num_queues * QUEUE_STATS_LEN;
+		return GEM_STATS_LEN + bp->max_num_queues * QUEUE_STATS_LEN;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -3854,7 +3891,8 @@ static void gem_get_ethtool_strings(struct net_device *netdev, u32 sset, u8 *p)
 			memcpy(p, gem_statistics[i].stat_string,
 			       ETH_GSTRING_LEN);
 
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->max_num_queues;
+		     ++q, ++queue) {
 			for (i = 0; i < QUEUE_STATS_LEN; i++)
 				ethtool_sprintf(&p, "q%u_%s", q, queue_statistics[i].stat_string);
 		}
@@ -4213,8 +4251,9 @@ static int macb_set_ringparam(struct net_device *netdev,
 	}
 
 	if (running) {
-		new_ctx = macb_context_alloc(bp, netdev->mtu,
-					     new_rx_size, new_tx_size);
+		new_ctx = macb_context_alloc(bp, bp->configured_num_queues,
+					     netdev->mtu, new_rx_size,
+					     new_tx_size);
 		if (IS_ERR(new_ctx))
 			return PTR_ERR(new_ctx);
 
@@ -4561,7 +4600,7 @@ static u32 gem_get_rx_ring_count(struct net_device *netdev)
 {
 	struct macb *bp = netdev_priv(netdev);
 
-	return bp->num_queues;
+	return bp->configured_num_queues;
 }
 
 static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
@@ -4592,6 +4631,7 @@ static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
 static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)
 {
 	struct macb *bp = netdev_priv(netdev);
+	unsigned int num_queues = bp->configured_num_queues;
 	int ret;
 
 	if (!(netdev->hw_features & NETIF_F_NTUPLE))
@@ -4599,8 +4639,8 @@ static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)
 
 	switch (cmd->cmd) {
 	case ETHTOOL_SRXCLSRLINS:
-		if ((cmd->fs.location >= bp->max_tuples)
-				|| (cmd->fs.ring_cookie >= bp->num_queues)) {
+		if (cmd->fs.location >= bp->max_tuples ||
+		    cmd->fs.ring_cookie >= num_queues) {
 			ret = -EINVAL;
 			break;
 		}
@@ -4618,6 +4658,75 @@ static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)
 	return ret;
 }
 
+static void macb_get_channels(struct net_device *netdev,
+			      struct ethtool_channels *ch)
+{
+	struct macb *bp = netdev_priv(netdev);
+
+	ch->max_combined = bp->max_num_queues;
+	ch->combined_count = bp->configured_num_queues;
+}
+
+static int macb_set_channels(struct net_device *netdev,
+			     struct ethtool_channels *ch)
+{
+	struct macb *bp = netdev_priv(netdev);
+	unsigned int num_queues = ch->combined_count;
+	bool running = netif_running(bp->netdev);
+	struct macb_context *new_ctx;
+	int ret;
+
+	/* MACB_CAPS_QUEUE_DISABLE means that the field QUEUE_DISABLE/BIT0 in
+	 * the per-queue RBQP/TBQP registers disable Tx/Rx queues. If we don't
+	 * have that capability we can have multiple queues but we must always
+	 * run with all enabled.
+	 */
+	if (!(bp->caps & MACB_CAPS_QUEUE_DISABLE))
+		return -EOPNOTSUPP;
+
+	if (num_queues > bp->max_num_queues)
+		return -EINVAL;
+
+	if (num_queues == bp->configured_num_queues)
+		return 0;
+
+	/* If we allow disabling a queue which has TAPRIO active, we'll keep a
+	 * transmission window which would be unusable.
+	 */
+	if (bp->enst.queue_mask >> num_queues) {
+		netdev_err(bp->netdev, "TAPRIO schedule gates queues >= %u; destroy the qdisc before reducing channels\n",
+			   num_queues);
+		return -EBUSY;
+	}
+
+	if (running) {
+		new_ctx = macb_context_alloc(bp, num_queues, netdev->mtu,
+					     bp->configured_rx_ring_size,
+					     bp->configured_tx_ring_size);
+		if (IS_ERR(new_ctx))
+			return PTR_ERR(new_ctx);
+
+		macb_context_swap_start(bp);
+	}
+
+	ret = netif_set_real_num_queues(bp->netdev, num_queues, num_queues);
+	if (ret) {
+		if (running) {
+			macb_free(new_ctx);
+			kfree(new_ctx);
+			macb_context_swap_end(bp, NULL);
+		}
+		return ret;
+	}
+
+	bp->configured_num_queues = num_queues;
+
+	if (running)
+		macb_context_swap_end(bp, new_ctx);
+
+	return 0;
+}
+
 static const struct ethtool_ops macb_ethtool_ops = {
 	.get_regs_len		= macb_get_regs_len,
 	.get_regs		= macb_get_regs,
@@ -4633,6 +4742,8 @@ static const struct ethtool_ops macb_ethtool_ops = {
 	.set_link_ksettings     = macb_set_link_ksettings,
 	.get_ringparam		= macb_get_ringparam,
 	.set_ringparam		= macb_set_ringparam,
+	.get_channels		= macb_get_channels,
+	.set_channels		= macb_set_channels,
 };
 
 static int macb_get_eee(struct net_device *netdev, struct ethtool_keee *eee)
@@ -4667,12 +4778,14 @@ static const struct ethtool_ops gem_ethtool_ops = {
 	.set_link_ksettings     = macb_set_link_ksettings,
 	.get_ringparam		= macb_get_ringparam,
 	.set_ringparam		= macb_set_ringparam,
-	.get_rxnfc			= gem_get_rxnfc,
-	.set_rxnfc			= gem_set_rxnfc,
-	.get_rx_ring_count		= gem_get_rx_ring_count,
-	.nway_reset			= phy_ethtool_nway_reset,
+	.get_rxnfc		= gem_get_rxnfc,
+	.set_rxnfc		= gem_set_rxnfc,
+	.get_rx_ring_count	= gem_get_rx_ring_count,
+	.nway_reset		= phy_ethtool_nway_reset,
 	.get_eee		= macb_get_eee,
 	.set_eee		= macb_set_eee,
+	.get_channels		= macb_get_channels,
+	.set_channels		= macb_set_channels,
 };
 
 static int macb_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
@@ -4817,9 +4930,9 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 		return -EINVAL;
 	}
 
-	if (conf->num_entries > bp->num_queues) {
+	if (conf->num_entries > bp->configured_num_queues) {
 		netdev_err(netdev, "Too many TAPRIO entries: %zu > %u active queues\n",
-			   conf->num_entries, bp->num_queues);
+			   conf->num_entries, bp->configured_num_queues);
 		return -EINVAL;
 	}
 
@@ -4848,10 +4961,10 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 
 		/* gate_mask must not select queues outside the valid queues */
 		queue_id = order_base_2(entry->gate_mask);
-		if (queue_id >= bp->num_queues) {
+		if (queue_id >= bp->configured_num_queues) {
 			netdev_err(netdev, "Entry %zu: gate_mask 0x%x exceeds active queue range (num_queues=%u)\n",
 				   i, entry->gate_mask,
-				   bp->num_queues);
+				   bp->configured_num_queues);
 			return -EINVAL;
 		}
 
@@ -5193,7 +5306,7 @@ static int macb_init_dflt(struct platform_device *pdev)
 	 * register mapping but we don't want to test the queue index then
 	 * compute the corresponding register offset at run time.
 	 */
-	for (hw_q = 0, q = 0; hw_q < bp->num_queues; ++hw_q) {
+	for (hw_q = 0, q = 0; hw_q < bp->max_num_queues; ++hw_q) {
 		queue = &bp->queues[q];
 		queue->bp = bp;
 		spin_lock_init(&queue->tx_ptr_lock);
@@ -5528,6 +5641,7 @@ static int at91ether_open(struct net_device *netdev)
 		ret = -ENOMEM;
 		goto pm_exit;
 	}
+	bp->ctx->num_queues = 1;
 	bp->ctx->info = &bp->info;
 
 	/* Clear internal statistics */
@@ -6323,7 +6437,8 @@ static int macb_probe(struct platform_device *pdev)
 		bp->macb_reg_readl = hw_readl;
 		bp->macb_reg_writel = hw_writel;
 	}
-	bp->num_queues = num_queues;
+	bp->max_num_queues = num_queues;
+	bp->configured_num_queues = num_queues;
 	bp->dma_burst_length = macb_config->dma_burst_length;
 	bp->pclk = pclk;
 	bp->hclk = hclk;
@@ -6532,6 +6647,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
+	struct macb_context *ctx = bp->ctx;
 	struct in_ifaddr *ifa = NULL;
 	struct macb_queue *queue;
 	struct in_device *idev;
@@ -6573,7 +6689,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 			macb_writel(bp, RBQPH,
 				    upper_32_bits(bp->rx_ring_tieoff_dma));
 #endif
-		for (q = 0, queue = bp->queues; q < bp->num_queues;
+		for (q = 0, queue = bp->queues; q < ctx->num_queues;
 		     ++q, ++queue) {
 			/* Disable RX queues */
 			if (bp->caps & MACB_CAPS_QUEUE_DISABLE) {
@@ -6614,7 +6730,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 	}
 
 	netif_device_detach(netdev);
-	for (q = 0, queue = bp->queues; q < bp->num_queues;
+	for (q = 0, queue = bp->queues; q < ctx->num_queues;
 	     ++q, ++queue) {
 		napi_disable(&queue->napi_rx);
 		napi_disable(&queue->napi_tx);
@@ -6689,7 +6805,7 @@ static int __maybe_unused macb_resume(struct device *dev)
 	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC))
 		macb_init_buffers(bp);
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues;
+	for (q = 0, queue = bp->queues; q < ctx->num_queues;
 	     ++q, ++queue) {
 		if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
 			if (macb_is_gem(&bp->info))

-- 
2.56.1


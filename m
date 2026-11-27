Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815926;
	b=cay7JgYYSkpVDZ2n9GBCcP8ebDQ0s1gWPGWTerWAjWhosX+Zok9gs+DN2EsKFdYJ4UdW
	 TXfNNCHjKI2mmbvBLWCXrVZKrSbzsMRzG5LkNk13Lsb6JFOeTzMrd8xi3/g/ybgAojzwD
	 cwIikFJavl60L2VZUNIs2B+/UvcNd94vJJSWYyr06BMRW1p6BYI25Cp7lVg/yumZ1HCLu
	 /5LdmacZrGWQorIoVgRwsWMp/eGNLtBtcgHSykIzJ5ezXbdPwV5TciJYQ1c2+rOg/sjN2
	 fSkrRv7XgzPMr8uKvA+d/jEcVBt0wtBjgq+AlYpjEBqhgmUs0x4c6bxaqPpzf461UhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815926;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=ijWpLm2RnWvkAbpi6LekDNb183uIniOduGZ2qlm5DWM=;
	b=SMnuxM9V39Y8y+74pbDOzbL7h7Z1MzDcZFBdm1ZqwcfrSAfoiJrCrGFlbmuKTAF14PNm
	 irwwXk5vHXPPsuI2sNaEgZ/o+2vWjv3uqvhlMX+BEwGOikzyhu5EEjjiNTJbi/1pDUMH1
	 7Tsei0YXEK9OJobtIAXn48cONZT//JTK5SqrwhvEP9hxXhgXNFZlH2fX1j+o3vMsCg3wc
	 l274iSBGSQxWoPg+4VplN96ILcSn0Eu495AgUDSshLmbFqJEIxU8bT7xfeQafB3DtznJw
	 gzVOFbYHNox+K0re3Ap+Afx7VZu51sVSa7bNde17ZvmKLZZaE+ZN3RiBaS5SLkwIvfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jwjZGttr;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D846E606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 21:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D846E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jwjZGttr
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 716E74E417CD;
	Fri, 27 Nov 2026 21:45:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45CC26049C;
	Fri, 27 Nov 2026 21:45:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8345F11E90F5A;
	Fri, 27 Nov 2026 22:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795815918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ijWpLm2RnWvkAbpi6LekDNb183uIniOduGZ2qlm5DWM=;
	b=jwjZGttrdlZVudmRy6GzCHUeLCKeKesUCRzMxY0LyME6tWEzL7UQtLm8RGQMYM+bamnC3A
	yzjHO8Baq47GYJM9XWRoHNNuM3KU1aiwnlEeNRJUfm7DLVpxgJ4IvOYShvF5RDtg1AVv+3
	aWZOKC7cbqWF6aMgcHdz25VKjRxzsV9zNXWuCUXDqK2WqjmoPUZCp/W/QVaG8FxO23IUjx
	fdIMDGP+r/VQUsmuoXrOhJHUX4s0+Vr+gGc57rU53LOcQJoN5Hh1XlZCptQ4P6tg0y0nDD
	ypnaSjzrDn3sC4y6vTvbl2o67tthSwmd8GwS/bRjRbEbmIVqDTRh4OMbrqoNmA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Nov 2026 22:44:42 +0100
Subject: [PATCH net-next v9 2/3] net: macb: implement
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
Message-Id: <20261127-macb-set-channels-v9-2-0b3addec7886@bootlin.com>
References: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
In-Reply-To: <20261127-macb-set-channels-v9-0-0b3addec7886@bootlin.com>
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
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>, 
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

This new context swapping window has one strong implication on the swap
implementation: the swap can now fail. Changes made to the swap infra:
 - netdev_tx_reset_queue() is done at swap_end on all queues (even
   disabled, just to be safe) instead of swap_start. It isn't done if
   swap failed.
 - If swap failed, we recover by shuffling TX buffers so they start at
   cursor 0, skip the old context free and restart the TX/RX engines.

Also, macb_set_channels() must grab bp->mac_cfg_lock for longer than
only the context swap; it is needed to read bp->enst and potentially
fail early. Locking the bp->mac_cfg_lock mutex becomes the
responsibility of the caller and not the swap helper functions anymore.

We also self-disarm IRQs on disabled queues.

A small notice: if QUEUE_DISABLE cap is absent, then
configured_num_queues == max_num_queues.

Nit: fix an alignment issue inside gem_ethtool_ops which does not
deserve its own patch.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/net/ethernet/cadence/macb.h      |   5 +-
 drivers/net/ethernet/cadence/macb_main.c | 277 ++++++++++++++++++++++---------
 2 files changed, 205 insertions(+), 77 deletions(-)

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
index 10571232563f..93599cfc43d6 100644
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
 
@@ -972,7 +987,7 @@ static void macb_apply_enst_config(struct macb *bp)
 	/* Disable ENST for all queues.
 	 * Reconfiguring timings must be done with ENST disabled.
 	 */
-	queue_mask = BIT_U32(bp->num_queues) - 1;
+	queue_mask = BIT_U32(bp->max_num_queues) - 1;
 	gem_writel(bp, ENST_CONTROL,
 		   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
 
@@ -989,7 +1004,7 @@ static void macb_apply_enst_config(struct macb *bp)
 		return;
 	}
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue) {
 		/* Configure queue timing registers.
 		 *
 		 * Those fields must be zero if the queue has ENST disabled:
@@ -1047,10 +1062,10 @@ static void macb_mac_link_up(struct phylink_config *config,
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
@@ -2204,12 +2219,12 @@ static void macb_quiesce_start(struct macb *bp)
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
@@ -2237,7 +2252,7 @@ static void macb_quiesce_end(struct macb *bp)
 	unsigned long flags;
 	unsigned int q;
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		napi_enable(&queue->napi_rx);
 		napi_enable(&queue->napi_tx);
 	}
@@ -2256,7 +2271,7 @@ static void macb_hresp_error_task(struct work_struct *work)
 	unsigned int q;
 	u32 ctrl;
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < ctx->num_queues; ++q, ++queue) {
 		queue_writel(queue, IDR, bp->rx_intr_mask |
 					 MACB_TX_INT_FLAGS |
 					 MACB_BIT(HRESP));
@@ -2274,7 +2289,7 @@ static void macb_hresp_error_task(struct work_struct *work)
 	macb_init_buffers(bp);
 
 	/* Enable interrupts */
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < ctx->num_queues; ++q, ++queue)
 		queue_writel(queue, IER,
 			     bp->rx_intr_mask |
 			     MACB_TX_INT_FLAGS |
@@ -2375,7 +2390,9 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
 {
 	struct macb_queue *queue = dev_id;
 	struct macb *bp = queue->bp;
+	unsigned int num_queues = 0;
 	struct net_device *netdev = bp->netdev;
+	unsigned int q = queue - bp->queues;
 	bool hresp_err = false;
 	u32 status;
 
@@ -2386,19 +2403,24 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
 
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
@@ -2456,7 +2478,8 @@ static void macb_poll_controller(struct net_device *netdev)
 	unsigned int q;
 
 	local_irq_save(flags);
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < bp->configured_num_queues;
+	     ++q, ++queue)
 		macb_interrupt(netdev->irq, queue);
 	local_irq_restore(flags);
 }
@@ -2899,7 +2922,7 @@ static void gem_free_rx_buffers(struct macb_context *ctx)
 	unsigned int q;
 	int i;
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		rxq = &ctx->rxq[q];
 
 		if (!rxq->skbuff)
@@ -2961,14 +2984,14 @@ static void macb_free(struct macb_context *ctx)
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
 
@@ -3001,7 +3024,7 @@ static int gem_alloc_rx_buffers(struct macb_context *ctx)
 	unsigned int q;
 	int size;
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		rxq = &ctx->rxq[q];
 		size = ctx->rx_ring_size * sizeof(struct sk_buff *);
 		rxq->skbuff = kzalloc(size, GFP_KERNEL);
@@ -3035,8 +3058,8 @@ static int macb_alloc_rx_buffers(struct macb_context *ctx)
 
 static int macb_alloc(struct macb_context *ctx)
 {
-	unsigned int num_queues = ctx->info->num_queues;
 	struct device *dev = &ctx->info->pdev->dev;
+	unsigned int num_queues = ctx->num_queues;
 	dma_addr_t tx_dma, rx_dma;
 	struct macb_txq *txq;
 	struct macb_rxq *rxq;
@@ -3105,6 +3128,7 @@ static int macb_alloc(struct macb_context *ctx)
 }
 
 static struct macb_context *macb_context_alloc(struct macb *bp,
+					       unsigned int num_queues,
 					       unsigned int mtu,
 					       unsigned int rx_ring_size,
 					       unsigned int tx_ring_size)
@@ -3117,6 +3141,7 @@ static struct macb_context *macb_context_alloc(struct macb *bp,
 		return ERR_PTR(-ENOMEM);
 
 	ctx->info = &bp->info;
+	ctx->num_queues = num_queues;
 	ctx->rx_buffer_size = macb_rx_buffer_size(bp, mtu);
 	ctx->rx_ring_size = rx_ring_size;
 	ctx->tx_ring_size = tx_ring_size;
@@ -3164,7 +3189,7 @@ static int gem_init_rings(struct macb_context *ctx)
 	int err;
 	int i;
 
-	for (q = 0; q < ctx->info->num_queues; ++q) {
+	for (q = 0; q < ctx->num_queues; ++q) {
 		txq = &ctx->txq[q];
 		for (i = 0; i < ctx->tx_ring_size; i++) {
 			desc = macb_tx_desc(ctx, q, i);
@@ -3227,7 +3252,7 @@ static void macb_reset_hw(struct macb *bp)
 	gem_writel(bp, PBUFRXCUT, 0);
 
 	/* Disable all interrupts */
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		queue_writel(queue, IDR, -1);
 		queue_readl(queue, ISR);
 		macb_queue_isr_clear(bp, queue, -1);
@@ -3317,7 +3342,8 @@ static void macb_configure_dma(struct macb *bp)
 	buffer_size = bp->ctx->rx_buffer_size / RX_BUFFER_MULTIPLE;
 	if (macb_is_gem(&bp->info)) {
 		dmacfg = gem_readl(bp, DMACFG) & ~GEM_BF(RXBS, -1L);
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->ctx->num_queues;
+		     ++q, ++queue) {
 			if (q)
 				queue_writel(queue, RBQS, buffer_size);
 			else
@@ -3356,7 +3382,7 @@ static void macb_context_swap_start(struct macb *bp)
 	unsigned int q;
 	u32 ctrl;
 
-	mutex_lock(&bp->mac_cfg_lock);
+	lockdep_assert_held(&bp->mac_cfg_lock);
 
 	macb_quiesce_start(bp);
 
@@ -3365,10 +3391,6 @@ static void macb_context_swap_start(struct macb *bp)
 	 */
 	netif_tx_disable(bp->netdev);
 
-	/* Now that everything is stopped, clear DQL. */
-	for (q = 0; q < bp->num_queues; ++q)
-		netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev, q));
-
 	/* Safe to call outside bp->lock because bp->irq_quiesced ensures the IRQ
 	 * handling is a no-op and all BH features are disabled.
 	 *
@@ -3382,7 +3404,7 @@ static void macb_context_swap_start(struct macb *bp)
 	ctrl = macb_readl(bp, NCR);
 	macb_writel(bp, NCR, ctrl & ~(MACB_BIT(RE) | MACB_BIT(TE)));
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		queue_writel(queue, IDR, -1);
 		queue_readl(queue, ISR);
 		macb_queue_isr_clear(bp, queue, -1);
@@ -3405,16 +3427,28 @@ static void macb_context_swap_end(struct macb *bp,
 
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
+		for (q = 0; q < bp->max_num_queues; ++q)
+			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
+								  q));
+	} else {
+		gem_shuffle_tx_rings(bp);
+	}
 
 	/* Start NAPI, HW Tx/Rx and software Tx. */
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue) {
 		napi_enable(&queue->napi_rx);
 		napi_enable(&queue->napi_tx);
 	}
@@ -3427,7 +3461,8 @@ static void macb_context_swap_end(struct macb *bp,
 	macb_configure_dma(bp);
 
 	if (bp->link_up) {
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->ctx->num_queues;
+		     ++q, ++queue) {
 			queue_writel(queue, IER,
 				     bp->rx_intr_mask |
 				     MACB_TX_INT_FLAGS |
@@ -3447,12 +3482,12 @@ static void macb_context_swap_end(struct macb *bp,
 			macb_txp_lpi_initial_defer(bp);
 	}
 
-	mutex_unlock(&bp->mac_cfg_lock);
-
 	/* Free old context. */
 
-	macb_free(old_ctx);
-	kfree(old_ctx);
+	if (new_ctx) {
+		macb_free(old_ctx);
+		kfree(old_ctx);
+	}
 }
 
 static void macb_init_hw(struct macb *bp)
@@ -3626,7 +3661,7 @@ static int macb_open(struct net_device *netdev)
 	if (err < 0)
 		return err;
 
-	ctx = macb_context_alloc(bp, netdev->mtu,
+	ctx = macb_context_alloc(bp, bp->configured_num_queues, netdev->mtu,
 				 bp->configured_rx_ring_size,
 				 bp->configured_tx_ring_size);
 	if (IS_ERR(ctx)) {
@@ -3691,7 +3726,7 @@ static int macb_close(struct net_device *netdev)
 	 * and tx_error_task wake them up.
 	 */
 	netif_tx_stop_all_queues(netdev);
-	for (q = 0; q < bp->num_queues; ++q)
+	for (q = 0; q < bp->max_num_queues; ++q)
 		netdev_tx_reset_queue(netdev_get_tx_queue(netdev, q));
 
 	phylink_stop(bp->phylink);
@@ -3727,19 +3762,23 @@ static int macb_change_mtu(struct net_device *netdev, int new_mtu)
 		if (bp->caps & MACB_CAPS_MACB_IS_EMAC)
 			return -EBUSY;
 
-		new_ctx = macb_context_alloc(bp, new_mtu,
+		new_ctx = macb_context_alloc(bp, bp->configured_num_queues,
+					     new_mtu,
 					     bp->configured_rx_ring_size,
 					     bp->configured_tx_ring_size);
 		if (IS_ERR(new_ctx))
 			return PTR_ERR(new_ctx);
 
+		mutex_lock(&bp->mac_cfg_lock);
 		macb_context_swap_start(bp);
 	}
 
 	WRITE_ONCE(netdev->mtu, new_mtu);
 
-	if (running)
+	if (running) {
 		macb_context_swap_end(bp, new_ctx);
+		mutex_unlock(&bp->mac_cfg_lock);
+	}
 
 	return 0;
 }
@@ -3780,7 +3819,7 @@ static void gem_update_stats(struct macb *bp)
 	}
 
 	idx = GEM_STATS_LEN;
-	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
+	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue)
 		for (i = 0, stat = &queue->stats.first; i < QUEUE_STATS_LEN; ++i, ++stat)
 			bp->ethtool_stats[idx++] = *stat;
 }
@@ -3831,7 +3870,8 @@ static void gem_get_ethtool_stats(struct net_device *netdev,
 	spin_lock_irq(&bp->stats_lock);
 	gem_update_stats(bp);
 	memcpy(data, &bp->ethtool_stats, sizeof(u64)
-			* (GEM_STATS_LEN + QUEUE_STATS_LEN * bp->num_queues));
+			* (GEM_STATS_LEN + QUEUE_STATS_LEN *
+					   bp->max_num_queues));
 	spin_unlock_irq(&bp->stats_lock);
 }
 
@@ -3841,7 +3881,7 @@ static int gem_get_sset_count(struct net_device *netdev, int sset)
 
 	switch (sset) {
 	case ETH_SS_STATS:
-		return GEM_STATS_LEN + bp->num_queues * QUEUE_STATS_LEN;
+		return GEM_STATS_LEN + bp->max_num_queues * QUEUE_STATS_LEN;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -3860,7 +3900,8 @@ static void gem_get_ethtool_strings(struct net_device *netdev, u32 sset, u8 *p)
 			memcpy(p, gem_statistics[i].stat_string,
 			       ETH_GSTRING_LEN);
 
-		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
+		for (q = 0, queue = bp->queues; q < bp->max_num_queues;
+		     ++q, ++queue) {
 			for (i = 0; i < QUEUE_STATS_LEN; i++)
 				ethtool_sprintf(&p, "q%u_%s", q, queue_statistics[i].stat_string);
 		}
@@ -4219,19 +4260,23 @@ static int macb_set_ringparam(struct net_device *netdev,
 	}
 
 	if (running) {
-		new_ctx = macb_context_alloc(bp, netdev->mtu,
-					     new_rx_size, new_tx_size);
+		new_ctx = macb_context_alloc(bp, bp->configured_num_queues,
+					     netdev->mtu, new_rx_size,
+					     new_tx_size);
 		if (IS_ERR(new_ctx))
 			return PTR_ERR(new_ctx);
 
+		mutex_lock(&bp->mac_cfg_lock);
 		macb_context_swap_start(bp);
 	}
 
 	bp->configured_rx_ring_size = new_rx_size;
 	bp->configured_tx_ring_size = new_tx_size;
 
-	if (running)
+	if (running) {
 		macb_context_swap_end(bp, new_ctx);
+		mutex_unlock(&bp->mac_cfg_lock);
+	}
 
 	return 0;
 }
@@ -4567,7 +4612,7 @@ static u32 gem_get_rx_ring_count(struct net_device *netdev)
 {
 	struct macb *bp = netdev_priv(netdev);
 
-	return bp->num_queues;
+	return bp->configured_num_queues;
 }
 
 static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
@@ -4598,6 +4643,7 @@ static int gem_get_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd,
 static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)
 {
 	struct macb *bp = netdev_priv(netdev);
+	unsigned int num_queues = bp->configured_num_queues;
 	int ret;
 
 	if (!(netdev->hw_features & NETIF_F_NTUPLE))
@@ -4605,8 +4651,8 @@ static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)
 
 	switch (cmd->cmd) {
 	case ETHTOOL_SRXCLSRLINS:
-		if ((cmd->fs.location >= bp->max_tuples)
-				|| (cmd->fs.ring_cookie >= bp->num_queues)) {
+		if (cmd->fs.location >= bp->max_tuples ||
+		    cmd->fs.ring_cookie >= num_queues) {
 			ret = -EINVAL;
 			break;
 		}
@@ -4624,6 +4670,78 @@ static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)
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
+	/* Protects access to bp->enst and the context swap operation. */
+	guard(mutex)(&bp->mac_cfg_lock);
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
@@ -4639,6 +4757,8 @@ static const struct ethtool_ops macb_ethtool_ops = {
 	.set_link_ksettings     = macb_set_link_ksettings,
 	.get_ringparam		= macb_get_ringparam,
 	.set_ringparam		= macb_set_ringparam,
+	.get_channels		= macb_get_channels,
+	.set_channels		= macb_set_channels,
 };
 
 static int macb_get_eee(struct net_device *netdev, struct ethtool_keee *eee)
@@ -4673,12 +4793,14 @@ static const struct ethtool_ops gem_ethtool_ops = {
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
@@ -4823,9 +4945,9 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 		return -EINVAL;
 	}
 
-	if (conf->num_entries > bp->num_queues) {
+	if (conf->num_entries > bp->configured_num_queues) {
 		netdev_err(netdev, "Too many TAPRIO entries: %zu > %u active queues\n",
-			   conf->num_entries, bp->num_queues);
+			   conf->num_entries, bp->configured_num_queues);
 		return -EINVAL;
 	}
 
@@ -4854,10 +4976,10 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 
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
 
@@ -5199,7 +5321,7 @@ static int macb_init_dflt(struct platform_device *pdev)
 	 * register mapping but we don't want to test the queue index then
 	 * compute the corresponding register offset at run time.
 	 */
-	for (hw_q = 0, q = 0; hw_q < bp->num_queues; ++hw_q) {
+	for (hw_q = 0, q = 0; hw_q < bp->max_num_queues; ++hw_q) {
 		queue = &bp->queues[q];
 		queue->bp = bp;
 		spin_lock_init(&queue->tx_ptr_lock);
@@ -5534,6 +5656,7 @@ static int at91ether_open(struct net_device *netdev)
 		ret = -ENOMEM;
 		goto pm_exit;
 	}
+	bp->ctx->num_queues = 1;
 	bp->ctx->info = &bp->info;
 
 	/* Clear internal statistics */
@@ -6329,7 +6452,8 @@ static int macb_probe(struct platform_device *pdev)
 		bp->macb_reg_readl = hw_readl;
 		bp->macb_reg_writel = hw_writel;
 	}
-	bp->num_queues = num_queues;
+	bp->max_num_queues = num_queues;
+	bp->configured_num_queues = num_queues;
 	bp->dma_burst_length = macb_config->dma_burst_length;
 	bp->pclk = pclk;
 	bp->hclk = hclk;
@@ -6538,6 +6662,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 {
 	struct net_device *netdev = dev_get_drvdata(dev);
 	struct macb *bp = netdev_priv(netdev);
+	struct macb_context *ctx = bp->ctx;
 	struct in_ifaddr *ifa = NULL;
 	struct macb_queue *queue;
 	struct in_device *idev;
@@ -6579,7 +6704,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 			macb_writel(bp, RBQPH,
 				    upper_32_bits(bp->rx_ring_tieoff_dma));
 #endif
-		for (q = 0, queue = bp->queues; q < bp->num_queues;
+		for (q = 0, queue = bp->queues; q < ctx->num_queues;
 		     ++q, ++queue) {
 			/* Disable RX queues */
 			if (bp->caps & MACB_CAPS_QUEUE_DISABLE) {
@@ -6620,7 +6745,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
 	}
 
 	netif_device_detach(netdev);
-	for (q = 0, queue = bp->queues; q < bp->num_queues;
+	for (q = 0, queue = bp->queues; q < ctx->num_queues;
 	     ++q, ++queue) {
 		napi_disable(&queue->napi_rx);
 		napi_disable(&queue->napi_tx);
@@ -6695,7 +6820,7 @@ static int __maybe_unused macb_resume(struct device *dev)
 	if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC))
 		macb_init_buffers(bp);
 
-	for (q = 0, queue = bp->queues; q < bp->num_queues;
+	for (q = 0, queue = bp->queues; q < ctx->num_queues;
 	     ++q, ++queue) {
 		if (!(bp->caps & MACB_CAPS_MACB_IS_EMAC)) {
 			if (macb_is_gem(&bp->info))

-- 
2.56.1


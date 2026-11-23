Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425459;
	b=U3UtzMWu8Ppyd7aPwutLqHNf+fkF62qwANhKkak/ZDowxKRKGEpO3PZo7uGKKvy6Etdy
	 Vx20fl9dSbxjRnIK6/JmEphNcjWXH1ogmRTNrEf21SuZYXAFOlNw0apsYsDGt4CI3Q/EC
	 3k0X2pTWoEf7x4EPyT6XQlTh/G+8nkTmI4swDNiL7f6HKyerJ9pTPIxj4diifzIBp+AvA
	 WDjIeAw0GZFF77GCClcc7kJwUgxzqMQW4eqYtrxPhyN7C1PZb50zv9Jk+NGwRl51EAuZW
	 syZPVKYpd4/czplwYMsuF3FWXSna0OwSAvPPGl46S8UWyfzvJuaeJFzL894/bnroTwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425459;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=wrlA3V//0g5+UC43BthGF5ANlIs14j10QBscIr0XFzE=;
	b=nVAcdneyVUcNjt1A99ge6Ib5FuSYQbRb+kG9cYhLgxH+VVBs/uobntm0av/9G+DnfRYz
	 kfW8UwGaeix7DlRIYFqCqkhCdHDrnv5xuUC+APdwxua+ZV5EXJuWnlC/29rsulfPdC+xR
	 +A0zmHH0CX1qZP+TjR5prSXWlnPRiKEp6YctdAodcvSw0zrET+U4phfR1EIRASUGHfyC+
	 S+43vHs18ikz413B/2SeOW7kXkRDtZbnGYwscPIdpfk27nReTK6w4ZPj64TjxjuZCsH0n
	 Xcdsm5Jd5zBYTQyRktNdbibURvF0SW3D7yKGHnII8gZqjXK3ZlTpBunBBVNa4Y+wuOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=DG9UouWT;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C34606A33D;
	Mon, 23 Nov 2026 09:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C34606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=DG9UouWT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECAEBA4B39;
	Mon, 23 Nov 2026 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795425456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wrlA3V//0g5+UC43BthGF5ANlIs14j10QBscIr0XFzE=;
	b=DG9UouWT6xpAeUDe33NyAcTQ9Pr4DYPpNejx4t74pNZvYPOCUwrLgTULydb8HJiu1/RiEh
	0NngXSGgzTg6Zh56zC3/2Wyj2it82N8+TyqWPJ+64T2i43q/no1m5o/M26rMiMKoMkcwho
	rVzVV3KpUVPTTbddNC+sFwHdUpl/7iplGDXiozJPTCoOu7yUUoWA3Jm4sWCb0FiIeHC3UY
	3X1CqJMWWzRSnOLdmO54rq8EMF4sWIrgNdPnUNVm31gimj+9BoQCf/fn6nvDDGZvz2hpMM
	cAQupZfP1rGUtVzQQlx10OkEMwgFPWX8ecC5/lmIVh5p5aGrEfZ2RPRfxr+sbA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Mon, 23 Nov 2026 10:17:14 +0100
Subject: [PATCH net-next v9 6/8] net: bcmgenet: build the DMA rings before
 giving up the running ones
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
Message-Id: <20261123-nb-genet-mtu-nn-v2-v9-6-4f93ded19bbb@tipi-net.de>
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

bcmgenet_init_dma() allocates the new rings only after its callers have
torn the running ones down, so a failure under memory pressure leaves the
interface with no datapath at all. The MTU change in the next patch runs
the same path on a live interface, where that takes a working link down.

Allocate into a set of its own first and install it only once it is
complete, so a failed allocation costs the running datapath nothing.

The receive buffers can only reach the hardware at install time, the
descriptors of a running ring must not be rewritten.

Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 248 +++++++++++++++----------
 drivers/net/ethernet/broadcom/genet/bcmgenet.h |   9 +
 2 files changed, 158 insertions(+), 99 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 766203e7c482..ae20c4b3c570 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -2381,16 +2381,15 @@ static netdev_tx_t bcmgenet_xmit(struct sk_buff *skb, struct net_device *dev)
 	goto out;
 }
 
-static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
-			      struct enet_cb *cb)
+static int bcmgenet_rx_alloc_cb(struct bcmgenet_priv *priv,
+				struct page_pool *pool, unsigned int buf_len,
+				struct enet_cb *cb)
 {
-	struct bcmgenet_priv *priv = ring->priv;
-	unsigned int size = SKB_HEAD_ALIGN(priv->rx_buf_len);
+	unsigned int size = SKB_HEAD_ALIGN(buf_len);
 	unsigned int offset;
-	dma_addr_t mapping;
 	struct page *page;
 
-	page = page_pool_dev_alloc(ring->page_pool, &offset, &size);
+	page = page_pool_dev_alloc(pool, &offset, &size);
 	if (!page) {
 		priv->mib.alloc_rx_buff_failed++;
 		netif_err(priv, rx_err, priv->dev,
@@ -2398,15 +2397,36 @@ static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
 		return -ENOMEM;
 	}
 
+	cb->rx_page = page;
+	cb->rx_offset = offset;
+	cb->rx_size = size;
+
+	return 0;
+}
+
+static void bcmgenet_rx_arm_cb(struct bcmgenet_priv *priv, struct enet_cb *cb)
+{
+	dma_addr_t mapping;
+
 	/* page_pool handles DMA mapping via PP_FLAG_DMA_MAP */
-	mapping = page_pool_get_dma_addr(page) + offset;
+	mapping = page_pool_get_dma_addr(cb->rx_page) + cb->rx_offset;
 	dma_sync_single_for_device(&priv->pdev->dev, mapping, priv->rx_buf_len,
 				   DMA_FROM_DEVICE);
 
-	cb->rx_page = page;
-	cb->rx_offset = offset;
-	cb->rx_size = size;
 	dmadesc_set_addr(priv, cb->bd_addr, mapping);
+}
+
+static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
+			      struct enet_cb *cb)
+{
+	struct bcmgenet_priv *priv = ring->priv;
+	int ret;
+
+	ret = bcmgenet_rx_alloc_cb(priv, ring->page_pool, priv->rx_buf_len, cb);
+	if (ret)
+		return ret;
+
+	bcmgenet_rx_arm_cb(priv, cb);
 
 	return 0;
 }
@@ -2654,22 +2674,15 @@ static void bcmgenet_dim_work(struct work_struct *work)
 }
 
 /* Assign page_pool pages to RX DMA descriptors. */
-static int bcmgenet_alloc_rx_buffers(struct bcmgenet_priv *priv,
-				     struct bcmgenet_rx_ring *ring)
+static void bcmgenet_arm_rx_buffers(struct bcmgenet_priv *priv,
+				    struct bcmgenet_rx_ring *ring)
 {
-	struct enet_cb *cb;
 	int i;
 
 	netif_dbg(priv, hw, priv->dev, "%s\n", __func__);
 
-	/* loop here for each buffer needing assign */
-	for (i = 0; i < ring->size; i++) {
-		cb = ring->cbs + i;
-		if (bcmgenet_rx_refill(ring, cb))
-			return -ENOMEM;
-	}
-
-	return 0;
+	for (i = 0; i < ring->size; i++)
+		bcmgenet_rx_arm_cb(priv, ring->cbs + i);
 }
 
 static void bcmgenet_free_rx_buffers(struct bcmgenet_priv *priv)
@@ -2958,41 +2971,33 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
 	netif_napi_add_tx(priv->dev, &ring->napi, bcmgenet_tx_poll);
 }
 
-static int bcmgenet_rx_ring_create_pool(struct bcmgenet_priv *priv,
-					struct bcmgenet_rx_ring *ring)
+static struct page_pool *bcmgenet_create_rx_pool(struct bcmgenet_priv *priv,
+						 unsigned int size)
 {
 	/* Buffers may share a page, depending on PAGE_SIZE and the MTU.
-	 * bcmgenet_rx_refill() syncs each one for the device,
+	 * bcmgenet_rx_arm_cb() syncs each one for the device,
 	 * PP_FLAG_DMA_SYNC_DEV would sync the whole page.
 	 */
 	struct page_pool_params pp_params = {
 		.order = 0,
 		.flags = PP_FLAG_DMA_MAP,
-		.pool_size = ring->size,
+		.pool_size = size,
 		.nid = NUMA_NO_NODE,
 		.dev = &priv->pdev->dev,
 		.dma_dir = DMA_FROM_DEVICE,
 	};
-	int err;
-
-	ring->page_pool = page_pool_create(&pp_params);
-	if (IS_ERR(ring->page_pool)) {
-		err = PTR_ERR(ring->page_pool);
-		ring->page_pool = NULL;
-		return err;
-	}
 
-	return 0;
+	return page_pool_create(&pp_params);
 }
 
 /* Initialize a RDMA ring */
-static int bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
-				 unsigned int index, unsigned int size,
-				 unsigned int start_ptr, unsigned int end_ptr)
+static void bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
+				  unsigned int index, unsigned int size,
+				  unsigned int start_ptr, unsigned int end_ptr,
+				  struct page_pool *pool)
 {
 	struct bcmgenet_rx_ring *ring = &priv->rx_rings[index];
 	u32 words_per_bd = WORDS_PER_BD(priv);
-	int ret, i;
 
 	ring->priv = priv;
 	ring->index = index;
@@ -3002,19 +3007,9 @@ static int bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
 	ring->read_ptr = start_ptr;
 	ring->cb_ptr = start_ptr;
 	ring->end_ptr = end_ptr - 1;
+	ring->page_pool = pool;
 
-	ret = bcmgenet_rx_ring_create_pool(priv, ring);
-	if (ret)
-		return ret;
-
-	ret = bcmgenet_alloc_rx_buffers(priv, ring);
-	if (ret) {
-		for (i = 0; i < ring->size; i++)
-			bcmgenet_free_rx_cb(ring->cbs + i, ring->page_pool);
-		page_pool_destroy(ring->page_pool);
-		ring->page_pool = NULL;
-		return ret;
-	}
+	bcmgenet_arm_rx_buffers(priv, ring);
 
 	bcmgenet_init_dim(ring, bcmgenet_dim_work);
 	bcmgenet_init_rx_coalesce(ring);
@@ -3041,8 +3036,6 @@ static int bcmgenet_init_rx_ring(struct bcmgenet_priv *priv,
 				  RDMA_WRITE_PTR);
 	bcmgenet_rdma_ring_writel(priv, index, end_ptr * words_per_bd - 1,
 				  DMA_END_ADDR);
-
-	return ret;
 }
 
 static void bcmgenet_enable_tx_napi(struct bcmgenet_priv *priv)
@@ -3230,18 +3223,17 @@ static void bcmgenet_destroy_rx_page_pools(struct bcmgenet_priv *priv)
  *
  * Queue 0 is also the default Rx queue with GENET_Q0_RX_BD_CNT descriptors.
  */
-static int bcmgenet_init_rx_queues(struct net_device *dev)
+static void bcmgenet_init_rx_queues(struct net_device *dev,
+				    struct bcmgenet_dma_set *set)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	unsigned int start = 0, end = GENET_Q0_RX_BD_CNT;
 	u32 i, ring_mask;
-	int ret;
 
 	/* Initialize Rx priority queues */
 	for (i = 0; i <= priv->hw_params->rx_queues; i++) {
-		ret = bcmgenet_init_rx_ring(priv, i, end - start, start, end);
-		if (ret)
-			return ret;
+		bcmgenet_init_rx_ring(priv, i, end - start, start, end,
+				      set->page_pool[i]);
 
 		start = end;
 		end += priv->hw_params->rx_bds_per_q;
@@ -3254,8 +3246,6 @@ static int bcmgenet_init_rx_queues(struct net_device *dev)
 	/* Enable Rx rings */
 	ring_mask <<= DMA_RING_BUF_EN_SHIFT;
 	bcmgenet_rdma_writel(priv, ring_mask, DMA_CTRL);
-
-	return 0;
 }
 
 static int bcmgenet_dma_teardown(struct bcmgenet_priv *priv)
@@ -3301,11 +3291,86 @@ static void bcmgenet_fini_dma(struct bcmgenet_priv *priv)
 	priv->tx_cbs = NULL;
 }
 
-/* init_edma: Initialize DMA control register */
-static int bcmgenet_init_dma(struct bcmgenet_priv *priv, bool flush_rx)
+/* Hand back a set that was never installed */
+static void bcmgenet_free_dma_set(struct bcmgenet_priv *priv,
+				  struct bcmgenet_dma_set *set)
+{
+	unsigned int start = 0, end = GENET_Q0_RX_BD_CNT;
+	unsigned int i, q;
+
+	for (q = 0; q <= priv->hw_params->rx_queues; q++) {
+		if (set->page_pool[q]) {
+			for (i = start; i < end; i++)
+				bcmgenet_free_rx_cb(set->rx_cbs + i,
+						    set->page_pool[q]);
+			page_pool_destroy(set->page_pool[q]);
+		}
+
+		start = end;
+		end += priv->hw_params->rx_bds_per_q;
+	}
+
+	kfree(set->rx_cbs);
+	kfree(set->tx_cbs);
+	memset(set, 0, sizeof(*set));
+}
+
+/* Build everything a datapath of this buffer length needs. The running one
+ * keeps its own until the caller installs this set, so a failure here costs
+ * nothing.
+ */
+static int bcmgenet_alloc_dma(struct bcmgenet_priv *priv, unsigned int buf_len,
+			      struct bcmgenet_dma_set *set)
+{
+	unsigned int start = 0, end = GENET_Q0_RX_BD_CNT;
+	unsigned int i, q;
+
+	memset(set, 0, sizeof(*set));
+
+	set->rx_cbs = kzalloc_objs(struct enet_cb, TOTAL_DESC);
+	set->tx_cbs = kzalloc_objs(struct enet_cb, TOTAL_DESC);
+	if (!set->rx_cbs || !set->tx_cbs)
+		goto err;
+
+	for (i = 0; i < TOTAL_DESC; i++) {
+		set->rx_cbs[i].bd_addr = priv->base +
+					 priv->hw_params->rdma_offset +
+					 i * DMA_DESC_SIZE;
+		set->tx_cbs[i].bd_addr = priv->base +
+					 priv->hw_params->tdma_offset +
+					 i * DMA_DESC_SIZE;
+	}
+
+	for (q = 0; q <= priv->hw_params->rx_queues; q++) {
+		set->page_pool[q] = bcmgenet_create_rx_pool(priv, end - start);
+		if (IS_ERR(set->page_pool[q])) {
+			set->page_pool[q] = NULL;
+			goto err;
+		}
+
+		for (i = start; i < end; i++)
+			if (bcmgenet_rx_alloc_cb(priv, set->page_pool[q],
+						 buf_len, set->rx_cbs + i))
+				goto err;
+
+		start = end;
+		end += priv->hw_params->rx_bds_per_q;
+	}
+
+	return 0;
+
+err:
+	bcmgenet_free_dma_set(priv, set);
+
+	return -ENOMEM;
+}
+
+/* Install a set built by bcmgenet_alloc_dma() and start the engines. The set
+ * is consumed either way, a failure frees it and leaves no datapath behind.
+ */
+static int bcmgenet_init_dma(struct bcmgenet_priv *priv, bool flush_rx,
+			     struct bcmgenet_dma_set *set)
 {
-	struct enet_cb *cb;
-	unsigned int i;
 	int ret;
 	u32 reg;
 
@@ -3315,14 +3380,14 @@ static int bcmgenet_init_dma(struct bcmgenet_priv *priv, bool flush_rx)
 	ret = bcmgenet_tdma_disable(priv);
 	if (ret) {
 		netdev_err(priv->dev, "failed to halt Tx DMA\n");
-		return ret;
+		goto err;
 	}
 
 	/* Disable RX DMA */
 	ret = bcmgenet_rdma_disable(priv);
 	if (ret) {
 		netdev_err(priv->dev, "failed to halt Rx DMA\n");
-		return ret;
+		goto err;
 	}
 
 	/* Flush TX queues */
@@ -3338,49 +3403,21 @@ static int bcmgenet_init_dma(struct bcmgenet_priv *priv, bool flush_rx)
 		udelay(10);
 	}
 
-	/* Initialize common Rx ring structures */
+	/* The set belongs to the datapath from here on */
 	priv->rx_bds = priv->base + priv->hw_params->rdma_offset;
 	priv->num_rx_bds = TOTAL_DESC;
-	priv->rx_cbs = kzalloc_objs(struct enet_cb, priv->num_rx_bds);
-	if (!priv->rx_cbs)
-		return -ENOMEM;
+	priv->rx_cbs = set->rx_cbs;
 
-	for (i = 0; i < priv->num_rx_bds; i++) {
-		cb = priv->rx_cbs + i;
-		cb->bd_addr = priv->rx_bds + i * DMA_DESC_SIZE;
-	}
-
-	/* Initialize common TX ring structures */
 	priv->tx_bds = priv->base + priv->hw_params->tdma_offset;
 	priv->num_tx_bds = TOTAL_DESC;
-	priv->tx_cbs = kzalloc_objs(struct enet_cb, priv->num_tx_bds);
-	if (!priv->tx_cbs) {
-		kfree(priv->rx_cbs);
-		priv->rx_cbs = NULL;
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < priv->num_tx_bds; i++) {
-		cb = priv->tx_cbs + i;
-		cb->bd_addr = priv->tx_bds + i * DMA_DESC_SIZE;
-	}
+	priv->tx_cbs = set->tx_cbs;
 
 	/* Init rDma */
 	bcmgenet_rdma_writel(priv, priv->dma_max_burst_length,
 			     DMA_SCB_BURST_SIZE);
 
 	/* Initialize Rx queues */
-	ret = bcmgenet_init_rx_queues(priv->dev);
-	if (ret) {
-		netdev_err(priv->dev, "failed to initialize Rx queues\n");
-		bcmgenet_free_rx_buffers(priv);
-		bcmgenet_destroy_rx_page_pools(priv);
-		kfree(priv->rx_cbs);
-		priv->rx_cbs = NULL;
-		kfree(priv->tx_cbs);
-		priv->tx_cbs = NULL;
-		return ret;
-	}
+	bcmgenet_init_rx_queues(priv->dev, set);
 
 	/* Init tDma */
 	bcmgenet_tdma_writel(priv, priv->dma_max_burst_length,
@@ -3399,6 +3436,11 @@ static int bcmgenet_init_dma(struct bcmgenet_priv *priv, bool flush_rx)
 	bcmgenet_tdma_writel(priv, reg, DMA_CTRL);
 
 	return 0;
+
+err:
+	bcmgenet_free_dma_set(priv, set);
+
+	return ret;
 }
 
 /* Interrupt bottom half */
@@ -3571,6 +3613,7 @@ static void bcmgenet_netif_start(struct net_device *dev, bool start_phy)
 static int bcmgenet_open(struct net_device *dev)
 {
 	struct bcmgenet_priv *priv = netdev_priv(dev);
+	struct bcmgenet_dma_set set;
 	int ret;
 
 	netif_dbg(priv, ifup, dev, "bcmgenet_open\n");
@@ -3600,7 +3643,11 @@ static int bcmgenet_open(struct net_device *dev)
 	bcmgenet_hfb_restore(priv);
 
 	/* Reinitialize TDMA and RDMA and SW housekeeping */
-	ret = bcmgenet_init_dma(priv, true);
+	ret = bcmgenet_alloc_dma(priv, priv->rx_buf_len, &set);
+	if (ret)
+		goto err_clk_disable;
+
+	ret = bcmgenet_init_dma(priv, true, &set);
 	if (ret) {
 		netdev_err(dev, "failed to initialize DMA\n");
 		goto err_clk_disable;
@@ -4455,6 +4502,7 @@ static int bcmgenet_resume(struct device *d)
 	struct net_device *dev = dev_get_drvdata(d);
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	struct bcmgenet_rxnfc_rule *rule;
+	struct bcmgenet_dma_set set;
 	int ret;
 	u32 reg;
 
@@ -4520,7 +4568,9 @@ static int bcmgenet_resume(struct device *d)
 	bcmgenet_hfb_restore(priv);
 
 	/* Reinitialize TDMA and RDMA and SW housekeeping */
-	ret = bcmgenet_init_dma(priv, false);
+	ret = bcmgenet_alloc_dma(priv, priv->rx_buf_len, &set);
+	if (!ret)
+		ret = bcmgenet_init_dma(priv, false, &set);
 	if (ret) {
 		/* Leave the block clocked, close and suspend tear it down */
 		netdev_err(dev, "failed to initialize DMA\n");
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
index 906639c1f012..1f48a67c5c01 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
@@ -541,6 +541,15 @@ struct bcmgenet_hw_params {
 	u32		words_per_bd;
 };
 
+/* Everything an open datapath needs that can fail to be allocated. Built
+ * before the running one is given up, so a failure changes nothing.
+ */
+struct bcmgenet_dma_set {
+	struct enet_cb *rx_cbs;
+	struct enet_cb *tx_cbs;
+	struct page_pool *page_pool[GENET_MAX_MQ_CNT + 1];
+};
+
 struct bcmgenet_skb_cb {
 	struct enet_cb *first_cb;	/* First control block of SKB */
 	struct enet_cb *head_cb;	/* Owns the head mapping */

-- 
2.53.0


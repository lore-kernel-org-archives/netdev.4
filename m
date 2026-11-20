Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146757;
	b=yTeBYAIL7xvHl9HVAB9Y4F5uHhZO3B+ZqSIX/VX14vUqkZZeE5tbuvStTdS8JOMzmt/K
	 rv/uJsc+HskEPEzh092HIPNwiGUYRo/ZYNsIrlN5bZIFoPeHg6SY3jFYdlseOKaZgy2JS
	 4Zzktzs2UXCkqXyKyrvp4T6pSlveTCbgwU9R1tvRpKtlXhVPEcPpHy7cXhYeTF3yZBmYO
	 WO0BlDDVlyEbMk0fxkMCxEI75yiFDuh/LvrdrgFSVYPWucubbolfW8JGPLXXWb99un/rn
	 fmZMSaxtwNPKFNlrk+wAU2MiuRrgDgEHVfJFGvWNEYEVYTy2jlzwrUu/vkeqSlmNUQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146757;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lfTvYzeXPpR/6R7uzV+CfQVPpJsDwtzsO0q/lYLBBXA=;
	b=vezMSbWG6j/hlz9Da1vWyExVVDrmUn+luuaRLCllU7TxLPYSlAGkCPk0o+8x8NvZLlvr
	 U1flxeRcNVp/v8rW0NO03eqTK/SpTNnPpVi320BGLZwzmUU/MdwlFP1cMl+/DJRxGci02
	 BJjnc0m4Sa33gZT6X5c2VKfr32ldYmt3SfDG3m+EI2EF9QXejxfTlmr+xdnJFHVeUVJY8
	 MnVi5EQJM9lPf2n/rfvwnlhD87t+XJOLLm1LkzF5GpA3VVn0rDP1gaDKfpV4pyz8bA5AS
	 SlCZRMFrzfM6d6kxiUhE3gI3ENqE0CTUdgZdzpDZX1ds6/Ts4fFoIIjxsNm+F8gymiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fXKwcwGC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802CB606A336
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fXKwcwGC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BEF1F000CA;
	Fri, 20 Nov 2026 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146757;
	bh=lfTvYzeXPpR/6R7uzV+CfQVPpJsDwtzsO0q/lYLBBXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fXKwcwGCHDYqe2AGKrfk8wFXe5XRrn0ARIfcJg9f2a2zfhDuDSbGeRu37F3qy901t
	 oPHdNt0kIDJ02NIQzhf7B8vTkAwYHoMSlt66BAh9lEVsxr+GMh20gQr7OjhkKbT3qP
	 E7K7g2dBNiuy0IQ85MSckaekD1eUkopD/a68HRtAZW8/kf14PyihQ4+IYybkzc9MLB
	 isPcgEHf+pS3utZhvQ5QCeWzon466KRCkP3AVt3A1Ok1Sz76n+OKr5wUtqgDWjZfxF
	 38e4b8UZUtEaiVgySre8x2KjnVME9V2PU7m/ydDAtAfsxiKhSf/M8MtoJQ9h9oyA5v
	 P9X9T9ScmlQfA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	bjorn@kernel.org,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 2/7] eth: bnxt_en: follow explicitly set IRQ affinity when placing page pool
Date: Thu, 19 Nov 2026 19:52:09 -0800
Message-ID: <20261120035214.369158-3-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120035214.369158-1-kuba@kernel.org>
References: <20261120035214.369158-1-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver picks the NUMA node for each Rx ring's page pool with
cpumask_local_spread() at open. IRQ affinity configured by the user
is already recorded by the driver and persists across close/open
cycles. Use it instead of cpumask_local_spread().

The affinity notifier runs without any of the locks held by
the allocation paths, and copying a multi-word cpumask is not atomic.
Like for the TPH Steering Tag, have the notifier compute the node
(of the first online CPU in the mask) and publish it with WRITE_ONCE().

Queue restart (bnxt_queue_mem_alloc()) needs to resolve the NUMA
node instead of copying the nid of the old page pool.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - correct the comment on ring_nid, it's not only written by the notifier
 - allocate ring_nid with kmalloc_objs()
v1: https://lore.kernel.org/20261118023905.3050661-3-kuba@kernel.org
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  5 +++
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 46 +++++++++++++++++++----
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307..61b86fa9cadb 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2488,6 +2488,11 @@ struct bnxt {
 	 * rather than being our own default placement.
 	 */
 	unsigned long		*ring_affinity_set;
+	/* NUMA node of the first online CPU in the affinity mask if it was
+	 * configured explicitly by the user, otherwise NUMA_NO_NODE.
+	 * Written by the IRQ affinity notifier, readers must use READ_ONCE().
+	 */
+	int			*ring_nid;
 	int			max_irqs;
 	int			total_irqs;
 	int			ulp_num_msix_want;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 9ddd75a0fd2f..6e503822d7bb 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3823,6 +3823,20 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
 	return 0;
 }
 
+/* Node of the CPU expected to service cp ring @n. If user did not configure
+ * the affinity explicitly, use the default spread (historic behavior).
+ */
+static int bnxt_cp_num_to_node(struct bnxt *bp, int n)
+{
+	int nid = READ_ONCE(bp->ring_nid[n]);
+	unsigned int cpu;
+
+	if (nid != NUMA_NO_NODE)
+		return nid;
+	cpu = cpumask_local_spread(n, dev_to_node(&bp->pdev->dev));
+	return cpu_to_node(cpu);
+}
+
 static void bnxt_free_one_tpa_info(struct bnxt *bp,
 				   struct bnxt_rx_ring_info *rxr)
 {
@@ -4025,8 +4039,7 @@ static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp, struct bnxt_rx_ring_info *rxr
 
 static int bnxt_alloc_rx_rings(struct bnxt *bp)
 {
-	int numa_node = dev_to_node(&bp->pdev->dev);
-	int i, rc = 0, agg_rings = 0, cpu;
+	int i, rc = 0, agg_rings = 0;
 
 	if (!bp->rx_ring)
 		return -ENOMEM;
@@ -4041,8 +4054,7 @@ static int bnxt_alloc_rx_rings(struct bnxt *bp)
 
 		ring = &rxr->rx_ring_struct;
 
-		cpu = cpumask_local_spread(i, numa_node);
-		cpu_node = cpu_to_node(cpu);
+		cpu_node = bnxt_cp_num_to_node(bp, i);
 		netdev_dbg(bp->dev, "Allocating page pool for rx_ring[%d] on numa_node: %d\n",
 			   i, cpu_node);
 		rc = bnxt_alloc_rx_page_pool(bp, rxr, cpu_node);
@@ -11917,6 +11929,8 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 				     const cpumask_t *mask)
 {
 	struct bnxt_irq *irq;
+	unsigned int cpu;
+	int nid;
 	u16 tag;
 
 	irq = container_of(notify, struct bnxt_irq, affinity_notify);
@@ -11924,6 +11938,14 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 	cpumask_copy(irq->bp->ring_cpu_mask[irq->ring_nr], mask);
 	set_bit(irq->ring_nr, irq->bp->ring_affinity_set);
 
+	/* Readers can't access ring_cpu_mask atomically, so pre-compute
+	 * the info they care about (NUMA node, TPH tag) and store it
+	 * with WRITE_ONCE().
+	 */
+	cpu = cpumask_first_and(mask, cpu_online_mask);
+	nid = cpu < nr_cpu_ids ? cpu_to_node(cpu) : NUMA_NO_NODE;
+	WRITE_ONCE(irq->bp->ring_nid[irq->ring_nr], nid);
+
 #ifdef CONFIG_RFS_ACCEL
 	if (irq->bp->dev->rx_cpu_rmap && irq->ring_nr < irq->bp->rx_nr_rings) {
 		int err;
@@ -12001,9 +12023,15 @@ static int bnxt_alloc_ring_cpu_masks(struct bnxt *bp)
 	if (!bp->ring_affinity_set)
 		return -ENOMEM;
 
-	for (i = 0; i < bp->max_irqs; i++)
+	bp->ring_nid = kmalloc_objs(*bp->ring_nid, bp->max_irqs);
+	if (!bp->ring_nid)
+		return -ENOMEM;
+
+	for (i = 0; i < bp->max_irqs; i++) {
 		if (!zalloc_cpumask_var(&bp->ring_cpu_mask[i], GFP_KERNEL))
 			return -ENOMEM;
+		bp->ring_nid[i] = NUMA_NO_NODE;
+	}
 
 	return 0;
 }
@@ -12018,6 +12046,8 @@ static void bnxt_free_ring_cpu_masks(struct bnxt *bp)
 	for (i = 0; i < bp->max_irqs; i++)
 		free_cpumask_var(bp->ring_cpu_mask[i]);
 
+	kfree(bp->ring_nid);
+	bp->ring_nid = NULL;
 	bitmap_free(bp->ring_affinity_set);
 	bp->ring_affinity_set = NULL;
 	kfree(bp->ring_cpu_mask);
@@ -12113,6 +12143,7 @@ static int bnxt_request_irq(struct bnxt *bp)
 		if (!test_bit(i, bp->ring_affinity_set) ||
 		    !cpumask_intersects(cpu_mask, cpu_online_mask)) {
 			clear_bit(i, bp->ring_affinity_set);
+			WRITE_ONCE(bp->ring_nid[i], NUMA_NO_NODE);
 			cpumask_clear(cpu_mask);
 			cpumask_set_cpu(cpumask_local_spread(i, numa_node),
 					cpu_mask);
@@ -16478,7 +16509,7 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	struct bnxt_rx_ring_info *rxr, *clone;
 	struct bnxt *bp = netdev_priv(dev);
 	struct bnxt_ring_struct *ring;
-	int rc;
+	int nid, rc;
 
 	if (!bp->rx_ring)
 		return -ENETDOWN;
@@ -16499,7 +16530,8 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	clone->rx_tpa = NULL;
 	clone->rx_tpa_idx_map = NULL;
 
-	rc = bnxt_alloc_rx_page_pool(bp, clone, rxr->page_pool->p.nid);
+	nid = bnxt_cp_num_to_node(bp, idx);
+	rc = bnxt_alloc_rx_page_pool(bp, clone, nid);
 	if (rc)
 		return rc;
 
-- 
2.56.1


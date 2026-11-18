Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969550;
	b=pDxXzQQ4Pb9gCZvBP8rgvJgA7gtFuisU9ZHcsWzdfYcuXRM15OFN5p5OJSgmmnnCyZg0
	 FmDc0Nm+srv/wI7tYXJ0TiEGxEiMT59VLwFY8wZY+rNXvLjl9+BcitxzZ6f1twAkyLxsn
	 pd58K4dSpnT1TKli8c3mcdrs4L6uTkZ4W1Db0DNTcgUvKVmbyj6xc4wkRuHFVsCvi+7qn
	 pkXWXbZnHJQk/krm3T1O+2l9ofims67DXGlRRcKhLkXBi/dX+dcLrBf7n/gahv7rASptt
	 LxkWk9ERqW/d1vePPZWz4+d9GTUZWhUKLLaLVOB77WMCbVuqVlUWTegYFtn3wwHCVhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969550;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=2+j5rQVeZEKVIp6UipLUZTq7yK+iygfHcnnhiMmH55o=;
	b=26VOWh6YPdualMZLnb0bq1ChwIMyFDS63CGbBCAzK8x4WHQACiMBd9DU4Ri6EAkl7/q7
	 8iVuDyN5eRV0x+KszlBrPYM7whPQyrMCj55wyZAvLlY52DF1CvLkpeayr0nkLBiPG0fHL
	 j8CW/oy25WcTkOaEosWlNwfVVWeGYY0eMGobzhFL96I8dTqUYMARsQGmM1WLoumDMpouX
	 1uyqmNzK3xLYfkSlkt7OQsqjEB1sTQ6kXsixuScWESFwmXhvcVrdq1zdndAm3qNaq7N05
	 YrVg+BfyDsmmOFlXRBFwmIrUqsoyzgn8ODOKz8IBK5N2D4LSXDq6AqBVJr+2M/R0HQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhoSEbo0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A2606A337
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhoSEbo0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379341F000C5;
	Wed, 18 Nov 2026 02:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969550;
	bh=2+j5rQVeZEKVIp6UipLUZTq7yK+iygfHcnnhiMmH55o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EhoSEbo0AIM+wdEJ2Jiu+/eUjGOuwAtsX3DXioHn0tUoydZIZBkF1K+0n2iCD4er8
	 GAL0hY65jz1vg3ZFFXCJUAQPywEeve1VmWXnFWRR1kqMLtzDU3xwavAx0p1WA0AXHt
	 Cj0mAZ4Y2I9bfFibqDZkvo8mleqiWcLlYX6VWMnWaOnJA+oFBvxvzbjE++yT28ASkE
	 7yAo1NO779+Zu7lEZczqftGCx0ZEbm2TawsoCIeeDBRpQn+OBfQN+Lg3+7+iYObPI9
	 vP3KDNNOM4Ve1gZPeajM5moqz9M3PCGNXrev52NvjhwoDw//0Tq26DbFQRmnVjwvsi
	 cKb7fnCkh2E3A==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 2/6] eth: bnxt_en: follow explicitly set IRQ affinity when placing page pool
Date: Tue, 17 Nov 2026 18:39:01 -0800
Message-ID: <20261118023905.3050661-3-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118023905.3050661-1-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
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

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  5 +++
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 48 +++++++++++++++++++----
 2 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 41d05efd6307..86fc2e8a5816 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2488,6 +2488,11 @@ struct bnxt {
 	 * rather than being our own default placement.
 	 */
 	unsigned long		*ring_affinity_set;
+	/* Node of the first online CPU in the mask configured from
+	 * the outside, NUMA_NO_NODE if none. Written by the affinity
+	 * notifier, read locklessly by the allocation paths.
+	 */
+	int			*ring_nid;
 	int			max_irqs;
 	int			total_irqs;
 	int			ulp_num_msix_want;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 5ad2a3033505..8e8ee02ca8d9 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3818,6 +3818,21 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
 	return 0;
 }
 
+/* Node of the CPU expected to service cp ring @n. If the IRQ affinity was
+ * configured from the outside (by the user or irqbalance) the affinity
+ * notifier recorded the node to use, otherwise follow our default spread.
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
@@ -4020,8 +4035,7 @@ static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp, struct bnxt_rx_ring_info *rxr
 
 static int bnxt_alloc_rx_rings(struct bnxt *bp)
 {
-	int numa_node = dev_to_node(&bp->pdev->dev);
-	int i, rc = 0, agg_rings = 0, cpu;
+	int i, rc = 0, agg_rings = 0;
 
 	if (!bp->rx_ring)
 		return -ENOMEM;
@@ -4036,8 +4050,7 @@ static int bnxt_alloc_rx_rings(struct bnxt *bp)
 
 		ring = &rxr->rx_ring_struct;
 
-		cpu = cpumask_local_spread(i, numa_node);
-		cpu_node = cpu_to_node(cpu);
+		cpu_node = bnxt_cp_num_to_node(bp, i);
 		netdev_dbg(bp->dev, "Allocating page pool for rx_ring[%d] on numa_node: %d\n",
 			   i, cpu_node);
 		rc = bnxt_alloc_rx_page_pool(bp, rxr, cpu_node);
@@ -11870,6 +11883,8 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 				     const cpumask_t *mask)
 {
 	struct bnxt_irq *irq;
+	unsigned int cpu;
+	int nid;
 	u16 tag;
 
 	irq = container_of(notify, struct bnxt_irq, affinity_notify);
@@ -11877,6 +11892,14 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
 	cpumask_copy(irq->bp->ring_cpu_mask[irq->ring_nr], mask);
 	set_bit(irq->ring_nr, irq->bp->ring_affinity_set);
 
+	/* Allocation paths don't hold any lock which would exclude us,
+	 * publish the node to allocate on instead of making them parse
+	 * the mask while it may be getting overwritten.
+	 */
+	cpu = cpumask_first_and(mask, cpu_online_mask);
+	nid = cpu < nr_cpu_ids ? cpu_to_node(cpu) : NUMA_NO_NODE;
+	WRITE_ONCE(irq->bp->ring_nid[irq->ring_nr], nid);
+
 #ifdef CONFIG_RFS_ACCEL
 	if (irq->bp->dev->rx_cpu_rmap && irq->ring_nr < irq->bp->rx_nr_rings) {
 		int err;
@@ -11954,9 +11977,16 @@ static int bnxt_alloc_ring_cpu_masks(struct bnxt *bp)
 	if (!bp->ring_affinity_set)
 		return -ENOMEM;
 
-	for (i = 0; i < bp->max_irqs; i++)
+	bp->ring_nid = kmalloc_array(bp->max_irqs, sizeof(*bp->ring_nid),
+				     GFP_KERNEL);
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
@@ -11971,6 +12001,8 @@ static void bnxt_free_ring_cpu_masks(struct bnxt *bp)
 	for (i = 0; i < bp->max_irqs; i++)
 		free_cpumask_var(bp->ring_cpu_mask[i]);
 
+	kfree(bp->ring_nid);
+	bp->ring_nid = NULL;
 	bitmap_free(bp->ring_affinity_set);
 	bp->ring_affinity_set = NULL;
 	kfree(bp->ring_cpu_mask);
@@ -12066,6 +12098,7 @@ static int bnxt_request_irq(struct bnxt *bp)
 		if (!test_bit(i, bp->ring_affinity_set) ||
 		    !cpumask_intersects(cpu_mask, cpu_online_mask)) {
 			clear_bit(i, bp->ring_affinity_set);
+			WRITE_ONCE(bp->ring_nid[i], NUMA_NO_NODE);
 			cpumask_clear(cpu_mask);
 			cpumask_set_cpu(cpumask_local_spread(i, numa_node),
 					cpu_mask);
@@ -16431,7 +16464,7 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	struct bnxt_rx_ring_info *rxr, *clone;
 	struct bnxt *bp = netdev_priv(dev);
 	struct bnxt_ring_struct *ring;
-	int rc;
+	int nid, rc;
 
 	if (!bp->rx_ring)
 		return -ENETDOWN;
@@ -16452,7 +16485,8 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 	clone->rx_tpa = NULL;
 	clone->rx_tpa_idx_map = NULL;
 
-	rc = bnxt_alloc_rx_page_pool(bp, clone, rxr->page_pool->p.nid);
+	nid = bnxt_cp_num_to_node(bp, idx);
+	rc = bnxt_alloc_rx_page_pool(bp, clone, nid);
 	if (rc)
 		return rc;
 
-- 
2.56.1


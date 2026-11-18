Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969551;
	b=Vp4x0xHwz4vHquoyD7kg4R5sO4jhHs76LRZBnBuuWSsC1jp4fz2tjy4Gf5S7U6dOiMrF
	 /7A3qY1F4i683+HrBt6yNOKuvHVjVomF3h/JLHe06w8dXqFlHBf0HBHtYFpZc6iv9p9i7
	 qDvrZKaODA5DmdMctNxBcLciPl8J8kTtF0UTwIMU2dm48HY4iDjIc1aUT24GHf8R2uXk3
	 HTJ/+L5xJLOFYjWFozp4vtHgnrNc3sW8rpKuTkjxOKZVwFIYkIKBxZhO2L41O26fPwPj3
	 hbJnxi8qVpZyhhXN++QezWOyCAu1lHC5fmUX/7gYdtxJqFtX0X1pTzIlJ+NKu+BNOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969551;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=un3XjUwZciO/T0GsC09y4VF8F0W2HX0VRKkgRzwguw0=;
	b=k6eqWk3Ql8mxPOBm/QdL/jgPBX63pIxmpoxwA1LS0UC9bkiEpOhbUwZYke2F7ytNlUuP
	 r314w/8YPQtadcR8bxS1inH2rm4Rpq6UO7F7WQAMt5uOBAag7Wp+jYR7FrZdN+8D/LjsT
	 k22FinLCSOKsuKUD3IBZsXoAB0a3UVHmzoTGyTnz2LSjzw4zF4yfhHwyEeOxVrA0aK0Mi
	 4C1plkeiGn8cdweF0tY/ja3ug9EtEesvmJNhXSX91rR+sx78VFm3naKU91ukDIb/FVuc1
	 Jy39V+RDIWG0ltBgHzUybLa01O+DV0Gu5qloKuGY6gkwEXpgqvSC6dwNLZmFpZ711PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDgkCP7J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D64606A33A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDgkCP7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980971F000C6;
	Wed, 18 Nov 2026 02:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969550;
	bh=un3XjUwZciO/T0GsC09y4VF8F0W2HX0VRKkgRzwguw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fDgkCP7JvYN4sfCrY1gQIJazGdemc8kcTbYuJBxA2kiF9t6yORxUqMxWA3ABPyyhj
	 O3rda4iRcDM+fhX05KkF39Eu7dFTLEyQYouH2D3wesCgtRyx6186J4gh5PhOgQv/4h
	 OCgvPnPFzwXo5iQGZrY9r4/gmAAHmf0S3Ej94Lq6TlHdvPcuinFpnoef/wI8OmP4JB
	 K6KI4DckxurJDIQBkCwsagKRIZmvejD347+RpRwj7AgVNWxFkN3kZp6Sd5xjWIg6FB
	 CYjbTU+tEoOCbm6+Nk+hgKxxL7WWRHVkCAb62qco0LCje6SbJzqL3MdRQY19cOCO04
	 4OGKXStU76iCg==
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
Subject: [PATCH net-next 3/6] eth: bnxt_en: allocate per-queue SW state on the queue's NUMA node
Date: Tue, 17 Nov 2026 18:39:02 -0800
Message-ID: <20261118023905.3050661-4-kuba@kernel.org>
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

Allocate the SW rings, agg bitmap, TPA state, completion ring
page arrays, completion sub-ring structs, SW stats and the SW USO
header buffer on the NUMA node of the CPU which will service the queue.
This lowers the cost of cache misses for NAPI fast path (and xmit, for Tx).

Previous change already allocated the page pools on the right node.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 87 ++++++++++++++---------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 8e8ee02ca8d9..7c694d8e99f5 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3765,7 +3765,8 @@ static void bnxt_free_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
 	}
 }
 
-static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
+static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
+			   int nid)
 {
 	struct pci_dev *pdev = bp->pdev;
 	u64 valid_bit = 0;
@@ -3810,8 +3811,9 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
 		}
 	}
 
+	/* Only the SW ring follows @nid, DMA memory is on the device's node */
 	if (rmem->vmem_size) {
-		*rmem->vmem = vzalloc(rmem->vmem_size);
+		*rmem->vmem = vzalloc_node(rmem->vmem_size, nid);
 		if (!(*rmem->vmem))
 			return -ENOMEM;
 	}
@@ -3862,25 +3864,27 @@ static void bnxt_free_tpa_info(struct bnxt *bp)
 }
 
 static int bnxt_alloc_one_tpa_info(struct bnxt *bp,
-				   struct bnxt_rx_ring_info *rxr)
+				   struct bnxt_rx_ring_info *rxr, int nid)
 {
 	struct rx_agg_cmp *agg;
 	int i;
 
-	rxr->rx_tpa = kzalloc_objs(struct bnxt_tpa_info,
-				   bp->max_tpa_roundup_size);
+	rxr->rx_tpa = kcalloc_node(bp->max_tpa_roundup_size,
+				   sizeof(*rxr->rx_tpa), GFP_KERNEL, nid);
 	if (!rxr->rx_tpa)
 		return -ENOMEM;
 
 	if (!(bp->flags & BNXT_FLAG_CHIP_P5_PLUS))
 		return 0;
 	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
-		agg = kzalloc_objs(*agg, MAX_SKB_FRAGS);
+		agg = kcalloc_node(MAX_SKB_FRAGS, sizeof(*agg),
+				   GFP_KERNEL, nid);
 		if (!agg)
 			return -ENOMEM;
 		rxr->rx_tpa[i].agg_arr = agg;
 	}
-	rxr->rx_tpa_idx_map = kzalloc_obj(*rxr->rx_tpa_idx_map);
+	rxr->rx_tpa_idx_map = kzalloc_node(sizeof(*rxr->rx_tpa_idx_map),
+					   GFP_KERNEL, nid);
 	if (!rxr->rx_tpa_idx_map)
 		return -ENOMEM;
 
@@ -3907,8 +3911,10 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
 
 	for (i = 0; i < bp->rx_nr_rings; i++) {
 		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
+		int nid;
 
-		rc = bnxt_alloc_one_tpa_info(bp, rxr);
+		nid = bnxt_cp_num_to_node(bp, i);
+		rc = bnxt_alloc_one_tpa_info(bp, rxr, nid);
 		if (rc)
 			return rc;
 	}
@@ -4020,13 +4026,14 @@ static void bnxt_enable_rx_page_pool(struct bnxt_rx_ring_info *rxr)
 	page_pool_enable_direct_recycling(rxr->page_pool, &rxr->bnapi->napi);
 }
 
-static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
+static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp,
+				  struct bnxt_rx_ring_info *rxr, int nid)
 {
 	u16 mem_size;
 
 	rxr->rx_agg_bmap_size = bp->rx_agg_ring_mask + 1;
 	mem_size = rxr->rx_agg_bmap_size / 8;
-	rxr->rx_agg_bmap = kzalloc(mem_size, GFP_KERNEL);
+	rxr->rx_agg_bmap = kzalloc_node(mem_size, GFP_KERNEL, nid);
 	if (!rxr->rx_agg_bmap)
 		return -ENOMEM;
 
@@ -4070,19 +4077,19 @@ static int bnxt_alloc_rx_rings(struct bnxt *bp)
 			return rc;
 		}
 
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, cpu_node);
 		if (rc)
 			return rc;
 
 		ring->grp_idx = i;
 		if (agg_rings) {
 			ring = &rxr->rx_agg_ring_struct;
-			rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+			rc = bnxt_alloc_ring(bp, &ring->ring_mem, cpu_node);
 			if (rc)
 				return rc;
 
 			ring->grp_idx = i;
-			rc = bnxt_alloc_rx_agg_bmap(bp, rxr);
+			rc = bnxt_alloc_rx_agg_bmap(bp, rxr, cpu_node);
 			if (rc)
 				return rc;
 		}
@@ -4107,9 +4114,9 @@ static void bnxt_free_tx_inline_buf(struct bnxt_tx_ring_info *txr,
 
 static int bnxt_alloc_tx_inline_buf(struct bnxt_tx_ring_info *txr,
 				    struct pci_dev *pdev,
-				    unsigned int size)
+				    unsigned int size, int nid)
 {
-	txr->tx_inline_buf = kmalloc(size, GFP_KERNEL);
+	txr->tx_inline_buf = kmalloc_node(size, GFP_KERNEL, nid);
 	if (!txr->tx_inline_buf)
 		return -ENOMEM;
 
@@ -4183,11 +4190,13 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
 	for (i = 0, j = 0; i < bp->tx_nr_rings; i++) {
 		struct bnxt_tx_ring_info *txr = &bp->tx_ring[i];
 		struct bnxt_ring_struct *ring;
+		int nid;
 		u8 qidx;
 
 		ring = &txr->tx_ring_struct;
 
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+		nid = bnxt_cp_num_to_node(bp, txr->bnapi->index);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, nid);
 		if (rc)
 			return rc;
 
@@ -4213,7 +4222,7 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
 		if (!(bp->flags & BNXT_FLAG_UDP_GSO_CAP)) {
 			rc = bnxt_alloc_tx_inline_buf(txr, pdev,
 						      BNXT_SW_USO_MAX_SEGS *
-						      TSO_HEADER_SIZE);
+						      TSO_HEADER_SIZE, nid);
 			if (rc)
 				return rc;
 		}
@@ -4240,12 +4249,15 @@ static void bnxt_free_cp_arrays(struct bnxt_cp_ring_info *cpr)
 	ring->ring_mem.dma_arr = NULL;
 }
 
-static int bnxt_alloc_cp_arrays(struct bnxt_cp_ring_info *cpr, int n)
+static int bnxt_alloc_cp_arrays(struct bnxt_cp_ring_info *cpr, int n,
+				int nid)
 {
-	cpr->cp_desc_ring = kzalloc_objs(*cpr->cp_desc_ring, n);
+	cpr->cp_desc_ring = kcalloc_node(n, sizeof(*cpr->cp_desc_ring),
+					 GFP_KERNEL, nid);
 	if (!cpr->cp_desc_ring)
 		return -ENOMEM;
-	cpr->cp_desc_mapping = kzalloc_objs(*cpr->cp_desc_mapping, n);
+	cpr->cp_desc_mapping = kcalloc_node(n, sizeof(*cpr->cp_desc_mapping),
+					    GFP_KERNEL, nid);
 	if (!cpr->cp_desc_mapping)
 		return -ENOMEM;
 	return 0;
@@ -4272,11 +4284,12 @@ static int bnxt_alloc_all_cp_arrays(struct bnxt *bp)
 
 	for (i = 0; i < bp->cp_nr_rings; i++) {
 		struct bnxt_napi *bnapi = bp->bnapi[i];
-		int rc;
+		int nid, rc;
 
 		if (!bnapi)
 			continue;
-		rc = bnxt_alloc_cp_arrays(&bnapi->cp_ring, n);
+		nid = bnxt_cp_num_to_node(bp, i);
+		rc = bnxt_alloc_cp_arrays(&bnapi->cp_ring, n, nid);
 		if (rc)
 			return rc;
 	}
@@ -4321,13 +4334,13 @@ static void bnxt_free_cp_rings(struct bnxt *bp)
 }
 
 static int bnxt_alloc_cp_sub_ring(struct bnxt *bp,
-				  struct bnxt_cp_ring_info *cpr)
+				  struct bnxt_cp_ring_info *cpr, int nid)
 {
 	struct bnxt_ring_mem_info *rmem;
 	struct bnxt_ring_struct *ring;
 	int rc;
 
-	rc = bnxt_alloc_cp_arrays(cpr, bp->cp_nr_pages);
+	rc = bnxt_alloc_cp_arrays(cpr, bp->cp_nr_pages, nid);
 	if (rc) {
 		bnxt_free_cp_arrays(cpr);
 		return -ENOMEM;
@@ -4339,7 +4352,7 @@ static int bnxt_alloc_cp_sub_ring(struct bnxt *bp,
 	rmem->pg_arr = (void **)cpr->cp_desc_ring;
 	rmem->dma_arr = cpr->cp_desc_mapping;
 	rmem->flags = BNXT_RMEM_RING_PTE_FLAG;
-	rc = bnxt_alloc_ring(bp, rmem);
+	rc = bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
 	if (rc) {
 		bnxt_free_ring(bp, rmem);
 		bnxt_free_cp_arrays(cpr);
@@ -4360,7 +4373,7 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 		struct bnxt_napi *bnapi = bp->bnapi[i];
 		struct bnxt_cp_ring_info *cpr, *cpr2;
 		struct bnxt_ring_struct *ring;
-		int cp_count = 0, k;
+		int cp_count = 0, k, nid;
 		int rx = 0, tx = 0;
 
 		if (!bnapi)
@@ -4370,7 +4383,7 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 		cpr->bnapi = bnapi;
 		ring = &cpr->cp_ring_struct;
 
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, NUMA_NO_NODE);
 		if (rc)
 			return rc;
 
@@ -4392,14 +4405,16 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 			tx = 1;
 		}
 
-		cpr->cp_ring_arr = kzalloc_objs(*cpr, cp_count);
+		nid = bnxt_cp_num_to_node(bp, i);
+		cpr->cp_ring_arr = kcalloc_node(cp_count, sizeof(*cpr),
+						GFP_KERNEL, nid);
 		if (!cpr->cp_ring_arr)
 			return -ENOMEM;
 		cpr->cp_ring_count = cp_count;
 
 		for (k = 0; k < cp_count; k++) {
 			cpr2 = &cpr->cp_ring_arr[k];
-			rc = bnxt_alloc_cp_sub_ring(bp, cpr2);
+			rc = bnxt_alloc_cp_sub_ring(bp, cpr2, nid);
 			if (rc)
 				return rc;
 			cpr2->bnapi = bnapi;
@@ -5411,8 +5426,10 @@ static int bnxt_alloc_stats(struct bnxt *bp)
 	for (i = 0; i < bp->cp_nr_rings; i++) {
 		struct bnxt_napi *bnapi = bp->bnapi[i];
 		struct bnxt_cp_ring_info *cpr = &bnapi->cp_ring;
+		int nid = bnxt_cp_num_to_node(bp, i);
 
-		cpr->sw_stats = kzalloc_obj(*cpr->sw_stats);
+		cpr->sw_stats = kzalloc_node(sizeof(*cpr->sw_stats), GFP_KERNEL,
+					     nid);
 		if (!cpr->sw_stats)
 			return -ENOMEM;
 
@@ -9201,7 +9218,7 @@ static int bnxt_alloc_ctx_mem_blk(struct bnxt *bp,
 	rmem->flags = BNXT_RMEM_VALID_PTE_FLAG;
 	if (rmem->depth >= 1)
 		rmem->flags |= BNXT_RMEM_USE_FULL_PAGE_FLAG;
-	return bnxt_alloc_ring(bp, rmem);
+	return bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
 }
 
 static int bnxt_alloc_ctx_pg_tbls(struct bnxt *bp,
@@ -16501,23 +16518,23 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
 		goto err_rxq_info_unreg;
 
 	ring = &clone->rx_ring_struct;
-	rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+	rc = bnxt_alloc_ring(bp, &ring->ring_mem, nid);
 	if (rc)
 		goto err_free_rx_ring;
 
 	if (bp->flags & BNXT_FLAG_AGG_RINGS) {
 		ring = &clone->rx_agg_ring_struct;
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, nid);
 		if (rc)
 			goto err_free_rx_agg_ring;
 
-		rc = bnxt_alloc_rx_agg_bmap(bp, clone);
+		rc = bnxt_alloc_rx_agg_bmap(bp, clone, nid);
 		if (rc)
 			goto err_free_rx_agg_ring;
 	}
 
 	if (bp->flags & BNXT_FLAG_TPA) {
-		rc = bnxt_alloc_one_tpa_info(bp, clone);
+		rc = bnxt_alloc_one_tpa_info(bp, clone, nid);
 		if (rc)
 			goto err_free_tpa_info;
 	}
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146758;
	b=CIg+fl0gxZ2zUXT9VEs5IDzLfcc+vCMHpiuO21tRzXyAtZscRKcSX/t9MaL/UuX1q2Gn
	 kAgPbpmKWPatFQW1K2VWllpPuemGne2dwt9JJUKpY7pW01HfXqJIQ+pSbRGjNrCLKK9X0
	 LoFflHQQHdYLU/QWxTkFPnTjggWYVtNQ/E4W3yOBS5M/AvCVz/coeTGSjsxHEoVouIS7F
	 474t4ZgXwf9d7VxD8gg5RjWUYIagnVvnYin8GkQVr9LylMvkllsz9xNxXoJLK3dkXGJDE
	 +aDLseREEZT2G9ZyhLKPJhyhynheg17182lWUiS05EBaB1JhOJNmNHUZpSrIDKPDVrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146758;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=90pger4JG/f/OOVYh5dNf4x3ogBzoxrcV3MdhZAgi6I=;
	b=1HH+//CmytgfD+nrYdV2gUGq4M/HHXdPy1h+zLfU4NxluTGNO0vzOf602O2ObDQtNWKp
	 C+eQEz7T5rDNNdxvXES9tyjhhwq2YAEZaEpmevF7TrYN6+478GwpRTFMDDTl9CEfchP2a
	 Qrws2WYqA7X59sCh7HwVzsJvbm7K11hHksZLuB4FaJnCl/+PkntLzdcWKaD1IrevWNapD
	 4gddVoy+29gFPy157wGBUGm8jG9OMISdFAgNHbj1FulCfhpTbG1LFoL17RM3UtTFtomEg
	 Vf3/49mi6dFNvfAs1t8cMRJ+tGTRKCHLsU9XimF1RH4LsljRxwheWxuaXTTFtLJ54MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOmtX3xL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED53A60A2600
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOmtX3xL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E511F000C6;
	Fri, 20 Nov 2026 03:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146757;
	bh=90pger4JG/f/OOVYh5dNf4x3ogBzoxrcV3MdhZAgi6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HOmtX3xLDyreZifhfVeYMG8Yk7pwnZ2Rz4mzC9xtDuyIY+lfc39q5En0vh+o2NGMQ
	 t/luZsmwb+clDQLanIJg66KNozichQ4WCnr4gUmsDdk4P7vcI858EK1wFJBgpqrD9m
	 b3duKRTz/vlIYzU9svbME1i12210yUW3loVL9YRYOc+NoNthKdThb35AwK5vjbjdcF
	 dO1LC7vEg3bBXfdONeSy4N5DS1yprkY3oDJ++2TQKIQNOTOkodiie9TCR1Ox7twLcR
	 2AhK6ZtEHlCsi4epJGOnCODedOVS0wkUnl40HhJX5B6Pr5eAz8gWxdmCg+pgXRRwde
	 WIM23nIFUDs8g==
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
Subject: [PATCH net-next v2 3/7] eth: bnxt_en: allocate per-queue SW state on the queue's NUMA node
Date: Thu, 19 Nov 2026 19:52:10 -0800
Message-ID: <20261120035214.369158-4-kuba@kernel.org>
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

Allocate the SW rings, agg bitmap, TPA state, completion ring
page arrays, completion sub-ring structs, SW stats and the SW USO
header buffer on the NUMA node of the CPU which will service the queue.
This lowers the cost of cache misses for NAPI fast path (and xmit, for Tx).

Previous change already allocated the page pools on the right node.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261118023905.3050661-4-kuba@kernel.org
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 87 ++++++++++++++---------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 6e503822d7bb..7acf74822e64 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3770,7 +3770,8 @@ static void bnxt_free_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
 	}
 }
 
-static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
+static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
+			   int nid)
 {
 	struct pci_dev *pdev = bp->pdev;
 	u64 valid_bit = 0;
@@ -3815,8 +3816,9 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
 		}
 	}
 
+	/* Only the SW ring follows @nid, DMA memory is on the device's node */
 	if (rmem->vmem_size) {
-		*rmem->vmem = vzalloc(rmem->vmem_size);
+		*rmem->vmem = vzalloc_node(rmem->vmem_size, nid);
 		if (!(*rmem->vmem))
 			return -ENOMEM;
 	}
@@ -3866,25 +3868,27 @@ static void bnxt_free_tpa_info(struct bnxt *bp)
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
 
@@ -3911,8 +3915,10 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
 
 	for (i = 0; i < bp->rx_nr_rings; i++) {
 		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
+		int nid;
 
-		rc = bnxt_alloc_one_tpa_info(bp, rxr);
+		nid = bnxt_cp_num_to_node(bp, i);
+		rc = bnxt_alloc_one_tpa_info(bp, rxr, nid);
 		if (rc)
 			return rc;
 	}
@@ -4024,13 +4030,14 @@ static void bnxt_enable_rx_page_pool(struct bnxt_rx_ring_info *rxr)
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
 
@@ -4074,19 +4081,19 @@ static int bnxt_alloc_rx_rings(struct bnxt *bp)
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
@@ -4111,9 +4118,9 @@ static void bnxt_free_tx_inline_buf(struct bnxt_tx_ring_info *txr,
 
 static int bnxt_alloc_tx_inline_buf(struct bnxt_tx_ring_info *txr,
 				    struct pci_dev *pdev,
-				    unsigned int size)
+				    unsigned int size, int nid)
 {
-	txr->tx_inline_buf = kmalloc(size, GFP_KERNEL);
+	txr->tx_inline_buf = kmalloc_node(size, GFP_KERNEL, nid);
 	if (!txr->tx_inline_buf)
 		return -ENOMEM;
 
@@ -4187,11 +4194,13 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
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
 
@@ -4217,7 +4226,7 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
 		if (!(bp->flags & BNXT_FLAG_UDP_GSO_CAP)) {
 			rc = bnxt_alloc_tx_inline_buf(txr, pdev,
 						      BNXT_SW_USO_MAX_SEGS *
-						      TSO_HEADER_SIZE);
+						      TSO_HEADER_SIZE, nid);
 			if (rc)
 				return rc;
 		}
@@ -4244,12 +4253,15 @@ static void bnxt_free_cp_arrays(struct bnxt_cp_ring_info *cpr)
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
@@ -4276,11 +4288,12 @@ static int bnxt_alloc_all_cp_arrays(struct bnxt *bp)
 
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
@@ -4325,13 +4338,13 @@ static void bnxt_free_cp_rings(struct bnxt *bp)
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
@@ -4343,7 +4356,7 @@ static int bnxt_alloc_cp_sub_ring(struct bnxt *bp,
 	rmem->pg_arr = (void **)cpr->cp_desc_ring;
 	rmem->dma_arr = cpr->cp_desc_mapping;
 	rmem->flags = BNXT_RMEM_RING_PTE_FLAG;
-	rc = bnxt_alloc_ring(bp, rmem);
+	rc = bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
 	if (rc) {
 		bnxt_free_ring(bp, rmem);
 		bnxt_free_cp_arrays(cpr);
@@ -4364,7 +4377,7 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 		struct bnxt_napi *bnapi = bp->bnapi[i];
 		struct bnxt_cp_ring_info *cpr, *cpr2;
 		struct bnxt_ring_struct *ring;
-		int cp_count = 0, k;
+		int cp_count = 0, k, nid;
 		int rx = 0, tx = 0;
 
 		if (!bnapi)
@@ -4374,7 +4387,7 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 		cpr->bnapi = bnapi;
 		ring = &cpr->cp_ring_struct;
 
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, NUMA_NO_NODE);
 		if (rc)
 			return rc;
 
@@ -4396,14 +4409,16 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
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
@@ -5415,8 +5430,10 @@ static int bnxt_alloc_stats(struct bnxt *bp)
 	for (i = 0; i < bp->cp_nr_rings; i++) {
 		struct bnxt_napi *bnapi = bp->bnapi[i];
 		struct bnxt_cp_ring_info *cpr = &bnapi->cp_ring;
+		int nid = bnxt_cp_num_to_node(bp, i);
 
-		cpr->sw_stats = kzalloc_obj(*cpr->sw_stats);
+		cpr->sw_stats = kzalloc_node(sizeof(*cpr->sw_stats), GFP_KERNEL,
+					     nid);
 		if (!cpr->sw_stats)
 			return -ENOMEM;
 
@@ -9242,7 +9259,7 @@ static int bnxt_alloc_ctx_mem_blk(struct bnxt *bp,
 	rmem->flags = BNXT_RMEM_VALID_PTE_FLAG;
 	if (rmem->depth >= 1)
 		rmem->flags |= BNXT_RMEM_USE_FULL_PAGE_FLAG;
-	return bnxt_alloc_ring(bp, rmem);
+	return bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
 }
 
 static int bnxt_alloc_ctx_pg_tbls(struct bnxt *bp,
@@ -16546,23 +16563,23 @@ static int bnxt_queue_mem_alloc(struct net_device *dev,
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


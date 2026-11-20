Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146758;
	b=DLRQYnEhjRoBp6hU+XHik6sf5fBZtNB5/WL0CUxtFMPxQjmSI1sJX5WuFMSbBi1JkuZE
	 MC6Hl3GPPyDU4tkeTFohgsr7QKBL6FQ5Sv3R4VcXw7xkMSKqpVxu1dGB4IRtc3VYoTRuQ
	 JukU3L5pNm1FcYmfLyl45z8tc7ul63udDoAWLlMHvYXJ6KTHuORAlIG7L0CD96Y4UzEK0
	 AczW2Wbv7dvddYcSuXMeRaGrwQctClIdRQz7xumbsVzidp7sCfQTy1jXB5sjkIE+vbEt3
	 xpwSBqPtVR8cGhjXCvwwJitnbsBOzaZXWXOfSRMpZ0khFpqGIWQo0NVndbg8BxE8Avw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146758;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TckOpSCF4iEZFCBFTSewT6s57Y/7oijnIAPHpSjFe/I=;
	b=s6ME5aeXDQBVIGzisGdPG891ycgn0J58y12T/WT7qMX3xaFiA4Fhq/RtsBcoXqeAlFwb
	 BzHQLWINh/Db6xq1/x/b38V+PqQLcatUeD+F5ujDAWg/vNV2cHXWceIOzH/06AKZOMcHJ
	 c6gjy6ndNlS+ksXUj6Hj9N+t98vb6MnL+/DEzbdbJKCQptNv23UJAGS0oTLxUP4zI9cOz
	 PklW9DpXe7zj8fy7B045MW1/4YTKmoinPRlUrJs21Nk1Gke5K0nxsf2KEAG1H4zN+5E0e
	 4/lEpCD9Pzaf7VSDZymBlIZFLvAQjayKguhLQLSO8T5U/XWkY6s+r9Xo4rmsT2n+RDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9RRlvaI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917060A260A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V9RRlvaI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669381F000D4;
	Fri, 20 Nov 2026 03:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146758;
	bh=TckOpSCF4iEZFCBFTSewT6s57Y/7oijnIAPHpSjFe/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V9RRlvaIG2VmvbUWkBL2aMNfDw+dyhSPdcfLtOjLe6WvBTcidisKL0zbbSTHZ0RTI
	 CRanYgCcVOfWw6LvzLNxWBHRmkS8I7uPxXJqZ4dWekBTQtiWjqQ4sfifjHc4u6ND/w
	 V7RTlDljh3//inm8ywt/NC9QosDeCW5oDdz5Vps9YnaB9PfUGEDXIeoySxGuqYWWj3
	 P9ciOqs7aeTOhDx+qPceiVOfoPjWvAEDACkvP2Q5odTDsbiOGoBEUJ4DHvKaQlSB0k
	 RsM74iLLomCL6oVbeX8HaDYNArNOQWnFGhUCAI623J6iKq0ykMqKUlaFy8n8CLQRq4
	 kHanw/jtdH0Eg==
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
Subject: [PATCH net-next v2 5/7] eth: bnxt_en: allocate fast path DMA rings on the queue's NUMA node
Date: Thu, 19 Nov 2026 19:52:12 -0800
Message-ID: <20261120035214.369158-6-kuba@kernel.org>
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

Descriptor rings, completion rings, NQs and the TX push buffer are
accessed by the host in the fast path, and so is the SW state around
them, which we already allocate on the node of the CPU expected to
service the queue. The DMA memory itself comes from the device's node,
though, as that's what dma_alloc_coherent() always uses.

Use dma_alloc_coherent_node() for the ring pages and the TX push buffer.
Pass the queue's node for completion rings and NQs as well, they used
NUMA_NO_NODE so far since @nid only affected the SW rings.

Ring page tables are only read by the device, keep them on the device's
node.

Note that queue restart only reallocates the Rx descriptor rings.
Completion rings, NQs and Tx rings will follow IRQ affinity changes
only on the next full reconfiguration.

Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261118023905.3050661-6-kuba@kernel.org
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 265ee15b6b35..a74599c1447a 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3795,10 +3795,10 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
 	for (i = 0; i < rmem->nr_pages; i++) {
 		u64 extra_bits = valid_bit;
 
-		rmem->pg_arr[i] = dma_alloc_coherent(&pdev->dev,
-						     rmem->page_size,
-						     &rmem->dma_arr[i],
-						     GFP_KERNEL);
+		rmem->pg_arr[i] = dma_alloc_coherent_node(&pdev->dev,
+							  rmem->page_size,
+							  &rmem->dma_arr[i],
+							  GFP_KERNEL, nid);
 		if (!rmem->pg_arr[i])
 			return -ENOMEM;
 
@@ -3817,7 +3817,6 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
 		}
 	}
 
-	/* Only the SW ring follows @nid, DMA memory is on the device's node */
 	if (rmem->vmem_size) {
 		*rmem->vmem = vzalloc_node(rmem->vmem_size, nid);
 		if (!(*rmem->vmem))
@@ -4212,10 +4211,11 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
 			/* One pre-allocated DMA buffer to backup
 			 * TX push operation
 			 */
-			txr->tx_push = dma_alloc_coherent(&pdev->dev,
-						bp->tx_push_size,
-						&txr->tx_push_mapping,
-						GFP_KERNEL);
+			txr->tx_push =
+				dma_alloc_coherent_node(&pdev->dev,
+							bp->tx_push_size,
+							&txr->tx_push_mapping,
+							GFP_KERNEL, nid);
 
 			if (!txr->tx_push)
 				return -ENOMEM;
@@ -4357,7 +4357,7 @@ static int bnxt_alloc_cp_sub_ring(struct bnxt *bp,
 	rmem->pg_arr = (void **)cpr->cp_desc_ring;
 	rmem->dma_arr = cpr->cp_desc_mapping;
 	rmem->flags = BNXT_RMEM_RING_PTE_FLAG;
-	rc = bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
+	rc = bnxt_alloc_ring(bp, rmem, nid);
 	if (rc) {
 		bnxt_free_ring(bp, rmem);
 		bnxt_free_cp_arrays(cpr);
@@ -4388,7 +4388,8 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 		cpr->bnapi = bnapi;
 		ring = &cpr->cp_ring_struct;
 
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem, NUMA_NO_NODE);
+		nid = bnxt_cp_num_to_node(bp, i);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, nid);
 		if (rc)
 			return rc;
 
@@ -4410,7 +4411,6 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 			tx = 1;
 		}
 
-		nid = bnxt_cp_num_to_node(bp, i);
 		cpr->cp_ring_arr = kcalloc_node(cp_count, sizeof(*cpr),
 						GFP_KERNEL, nid);
 		if (!cpr->cp_ring_arr)
-- 
2.56.1


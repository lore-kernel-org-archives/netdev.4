Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969551;
	b=3IMqQgBiXiAZPxuHQWXVSUpzp+IilMqzuQnLIhF7sLmdQTqjVRbxOEBF/YfyWaG/AVqW
	 ldaBbUba2OvJ7szDhDkh0KrvgrSsj6broXnTipOtEsDwbPqKmUnpiRjMqJUi8iVBrzmc5
	 7naupQI+6mlksSjzp1X18di7ttowgibYnhNCZ9uAsWkFb6uT/4BhG9Dj6yBflCqufZ/eq
	 3kg6C77mb1FuGp58k9WIRSxNudoL9j/uBqAuETDudFQ35+Hlw2+DPfzxbASmLBWYmglib
	 ol3FORDf4Hrq1fyiFQRY1jr9/qlXbt6EuJ6RL5vS7vVgXcby3SP0wOvey9m8WwJPLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969551;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eDrkg5Os0cGkJDOeCc2t0WTT6pOBhYSoSgJRlA18/Q0=;
	b=Fj36H1jxxOCiG3clQE8uOXs0cmZzA+yMJ40qfk+y2ggUq57fqIUfdhWfFfJsu3Bij5Yk
	 Wjqvfg+9DcE75Rb6DuH9QmI/Qv7sZorvfiCurO+jjxNUZ1AF5Nt4GZAA9Y178R0Y9tdnM
	 /2UPDFlLQNcC8MDTtrHPnTaYx8Z2B5eHcS9kLNN0Fn1T/XF6FIP6SheVB69h9sJScVKLa
	 J6duiJCXDxthqlblGZdt0DLLxv+Em92y3QLbOS7Sgv+9VrEw5dpsu2VZxqbojcvYTXbkL
	 4+m6MduaOBVTc/g1A9IWMuPOXQ5HfwjmM+BEPi2M4PlmRULTAh3L0t7tMmM4CW4odrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BaXQMr0/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2A606A890
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaXQMr0/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6541C1F000C6;
	Wed, 18 Nov 2026 02:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969551;
	bh=eDrkg5Os0cGkJDOeCc2t0WTT6pOBhYSoSgJRlA18/Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BaXQMr0/YutLQ/wNZfeE6vn+SlEyIsThfa4Clk5gapZlDyxaILRogRmFpnLaDxUG0
	 dfjyRMxOAJkRU/aaX+EGZStFkIlLCs8NiNgXZDjvscyghFB7ORDg2cFKL4UwdvUrqz
	 38NVjBeFqC1NdbIgi3kMDU1UtjGQda0qUWvUTmpBphYpWMGEdFdZXhgFiQeNzE5xBI
	 SroAZLudepKdW46abfog5vQLxfz2AF6IXmmt4B8NkCrAuh1aJSanKGxdSDgiai6OuV
	 CWgBCvwNkNXFkSXxc+c0mwFZG+P2qivq5OHWy1GPk7126j9q8neSDsJqyxn9gr10FH
	 O+XgjzL1jgxkQ==
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
Subject: [PATCH net-next 5/6] eth: bnxt_en: allocate fast path DMA rings on the queue's NUMA node
Date: Tue, 17 Nov 2026 18:39:04 -0800
Message-ID: <20261118023905.3050661-6-kuba@kernel.org>
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

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index f98507944350..134b24842c4f 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -3790,10 +3790,10 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
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
 
@@ -3812,7 +3812,6 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem,
 		}
 	}
 
-	/* Only the SW ring follows @nid, DMA memory is on the device's node */
 	if (rmem->vmem_size) {
 		*rmem->vmem = vzalloc_node(rmem->vmem_size, nid);
 		if (!(*rmem->vmem))
@@ -4208,10 +4207,11 @@ static int bnxt_alloc_tx_rings(struct bnxt *bp)
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
@@ -4353,7 +4353,7 @@ static int bnxt_alloc_cp_sub_ring(struct bnxt *bp,
 	rmem->pg_arr = (void **)cpr->cp_desc_ring;
 	rmem->dma_arr = cpr->cp_desc_mapping;
 	rmem->flags = BNXT_RMEM_RING_PTE_FLAG;
-	rc = bnxt_alloc_ring(bp, rmem, NUMA_NO_NODE);
+	rc = bnxt_alloc_ring(bp, rmem, nid);
 	if (rc) {
 		bnxt_free_ring(bp, rmem);
 		bnxt_free_cp_arrays(cpr);
@@ -4384,7 +4384,8 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 		cpr->bnapi = bnapi;
 		ring = &cpr->cp_ring_struct;
 
-		rc = bnxt_alloc_ring(bp, &ring->ring_mem, NUMA_NO_NODE);
+		nid = bnxt_cp_num_to_node(bp, i);
+		rc = bnxt_alloc_ring(bp, &ring->ring_mem, nid);
 		if (rc)
 			return rc;
 
@@ -4406,7 +4407,6 @@ static int bnxt_alloc_cp_rings(struct bnxt *bp)
 			tx = 1;
 		}
 
-		nid = bnxt_cp_num_to_node(bp, i);
 		cpr->cp_ring_arr = kcalloc_node(cp_count, sizeof(*cpr),
 						GFP_KERNEL, nid);
 		if (!cpr->cp_ring_arr)
-- 
2.56.1


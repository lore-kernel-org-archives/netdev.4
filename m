Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195791;
	b=Nvi38+U09rs6MbIDQUAt5of9ZXO7v7SGZ1ZPmOccmg3CSxGmGsTru2r+DIkw1D/YKBJ9
	 5CeEJx9w0pje3ZJA2IsNmXPkq3ITzbB1M1xcwmzveLb2hkHKjZ6+iDM77F8g4xONaPoaK
	 Ju6ECwu87KsDRgrxJMkj4DcUcBps/SQVgG7RlAvqJKjSnXLn6MsiNCMLvQFaDBe2DvXNU
	 RnU4edCaTLeeFnTLq2AYivecMKFbYnP5I6VR6yp2cWEIsaTNGBEhAPT3ODkt3KZdL5qve
	 9mihK3qi7Hg3PJx40FIl8PLorWhjndAR23Ht7ozYoIJjqqit9wy0Lf04bbWWfghlT3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195791;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=DUI3UIydFzzzMSMbWUH1H9eoNDbHRtSDMsMwrIgHkds=;
	b=wPPs2TNsxrUVnh8I81W2vLOBxWcWYO0/hojre8ZbvJlAoyeogQ9AdOpmYQHgFRfcgqyB
	 U85WHxu+Ze76ywRvVXYNGreGwWcUdKxUZYX13b1i+onkOGJ217mw4BrhEjdFDBmrkkB38
	 f+bgFoPQRgOS3bkhAJI+HDkFSaw7zhJm9nIqzZshFCbzCvBvtL33HeEzuiy4hPeUmilLU
	 ZN4A1obWmiahVjAuWlYeOGBy8Ug9tAMa7idVRvz/q/O1llEwXaOysTCNbYmsNSm4eahM1
	 21hIWE8MmL9cBgSAcW+DHFBikuEpE2ZP6qNCpJxLjJ/CZv/359ePQ0MGGiKtLC5wPbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTGPAlnl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D3606A33A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTGPAlnl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817081F000C0;
	Fri, 20 Nov 2026 17:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195790;
	bh=DUI3UIydFzzzMSMbWUH1H9eoNDbHRtSDMsMwrIgHkds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OTGPAlnlXdPCZHFGboD+Wu41M1ljQXheOSftplkKKH2zdOZzvWyk/oN0+mZAu9qxy
	 KVgE4wqbB34on5C7tdoRUyXkNIlnlRAlfGReurv8dg1jeGGUNVjlGH5bLGv3RIDefp
	 OfQg6EvmzVMtNOItUUMrUvs1islXlxlObcLOhYVzbpAykCCRYo2PgjNTVlE/WYBopW
	 h5RGXCxV8R43Pa4eZcHkQl/9TuvNVEUtJGmvZ8smnxVxNzwv+QEaf9gIiNv84HwoaS
	 z+gaMYRnM7RWhZnPyqsFyAs9a47ZCPJM8AzgrwdcNMoHE+voEv/Eav06yPyq8DgiSD
	 Y7JBplIl0g2Jg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:25 +0100
Subject: [PATCH net-next v9 06/14] net: ethernet: cortina: Index free queue
 fragments with XArray
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
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-6-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

RX descriptors return the DMA address of the free queue fragment used by
the hardware. The driver currently recovers its page by scanning every
free queue page and comparing address ranges.

This isn't very efficient...

Instead index each fragment in an XArray using its DMA address in
fragment units.

Populate and erase the fragment index under the free queue lock. The
lookup remains serialized with refill and validates the exact fragment
address before returning the page and offset snapshot.

The per-fragment index is a prerequisite for the following
"Preserve in-flight free queue pages" fix, which keeps each mapping until
its RX descriptor is claimed. Include this patch when backporting that
fix and its subsequent recycling changes.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 105 ++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 5fbdd6d2cbd0..fdf8c0e2f29e 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -38,6 +38,7 @@
 #include <linux/ethtool.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
+#include <linux/xarray.h>
 
 #include <linux/in.h>
 #include <linux/ip.h>
@@ -167,6 +168,7 @@ struct gemini_ethernet {
 	struct gmac_rxdesc *freeq_ring;
 	dma_addr_t	freeq_dma_base;
 	struct gmac_queue_page	*freeq_pages;
+	struct xarray	freeq_mappings;
 	unsigned int	num_freeq_pages;
 	spinlock_t	freeq_lock; /* Locks queue from reentrance */
 };
@@ -759,43 +761,47 @@ static int gmac_setup_rxq(struct net_device *netdev)
 	return 0;
 }
 
+static unsigned long
+geth_freeq_mapping_index(const struct gemini_ethernet *geth,
+			 dma_addr_t mapping)
+{
+	return (unsigned long)(mapping >> geth->freeq_frag_order);
+}
+
 static struct page *geth_freeq_lookup(struct gemini_ethernet *geth,
 				      dma_addr_t mapping,
 				      unsigned int *page_offs)
 {
 	unsigned int frag_len = 1 << geth->freeq_frag_order;
 	struct gmac_queue_page *gpage;
+	unsigned long index;
 	unsigned long flags;
 	dma_addr_t page_mapping;
-	struct page *page = NULL;
-	int i;
-
-	spin_lock_irqsave(&geth->freeq_lock, flags);
-	if (!geth->freeq_pages) {
-		dev_err_ratelimited(geth->dev,
-				    "try to get page with no page list\n");
-		goto unlock;
-	}
-
-	/* Look up a ring buffer page from virtual mapping */
-	for (i = 0; i < geth->num_freeq_pages; i++) {
-		gpage = &geth->freeq_pages[i];
-		if (!gpage->page || mapping < gpage->mapping)
-			continue;
-
-		page_mapping = gpage->mapping;
-		if (mapping - page_mapping > PAGE_SIZE - frag_len ||
-		    ((mapping - page_mapping) & (frag_len - 1)))
-			continue;
+	struct page *page;
+	bool valid;
 
-		page = gpage->page;
-		*page_offs = mapping - page_mapping;
-		break;
-	}
+	index = geth_freeq_mapping_index(geth, mapping);
 
-unlock:
+	spin_lock_irqsave(&geth->freeq_lock, flags);
+	gpage = xa_load(&geth->freeq_mappings, index);
+	if (!gpage || !gpage->page)
+		goto err_unlock;
+
+	page = gpage->page;
+	page_mapping = gpage->mapping;
+	valid = mapping >= page_mapping &&
+		mapping - page_mapping <= PAGE_SIZE - frag_len &&
+		!((mapping - page_mapping) & (frag_len - 1));
+	if (!valid)
+		goto err_unlock;
+
+	*page_offs = mapping - page_mapping;
 	spin_unlock_irqrestore(&geth->freeq_lock, flags);
 	return page;
+
+err_unlock:
+	spin_unlock_irqrestore(&geth->freeq_lock, flags);
+	return NULL;
 }
 
 static void gmac_cleanup_rxq(struct net_device *netdev)
@@ -854,12 +860,16 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
 	struct gmac_rxdesc *freeq_entry;
 	struct gmac_queue_page *gpage;
 	unsigned int fpp_order;
+	unsigned int fragments;
 	unsigned int frag_len;
 	dma_addr_t page_mapping;
 	dma_addr_t mapping;
 	struct page *page;
+	int ret;
 	int i;
 
+	lockdep_assert_held(&geth->freeq_lock);
+
 	/* First allocate and DMA map a single page */
 	page = alloc_page(GFP_ATOMIC);
 	if (!page)
@@ -888,9 +898,26 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
 	 */
 	frag_len = 1 << geth->freeq_frag_order; /* Usually 2048 */
 	fpp_order = PAGE_SHIFT - geth->freeq_frag_order;
+	fragments = 1 << fpp_order;
+
 	gpage = &geth->freeq_pages[pn];
-	if (gpage->page)
+	for (i = 0; i < fragments; i++) {
+		mapping = page_mapping + i * frag_len;
+		ret = xa_insert(&geth->freeq_mappings,
+				geth_freeq_mapping_index(geth, mapping),
+				gpage, GFP_ATOMIC);
+		if (ret)
+			goto err_mappings;
+	}
+
+	if (gpage->page) {
+		for (i = 0; i < fragments; i++) {
+			mapping = gpage->mapping + i * frag_len;
+			xa_erase(&geth->freeq_mappings,
+				 geth_freeq_mapping_index(geth, mapping));
+		}
 		put_page(gpage->page);
+	}
 
 	/* Then put our new mapping into the page table */
 	gpage->mapping = page_mapping;
@@ -909,6 +936,17 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
 		pn, &page_mapping, page);
 
 	return page;
+
+err_mappings:
+	while (i--) {
+		mapping = page_mapping + i * frag_len;
+		xa_erase(&geth->freeq_mappings,
+			 geth_freeq_mapping_index(geth, mapping));
+	}
+	dma_unmap_single(geth->dev, page_mapping, PAGE_SIZE,
+			 DMA_FROM_DEVICE);
+	put_page(page);
+	return NULL;
 }
 
 /**
@@ -981,6 +1019,8 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 	unsigned int pages = len >> fpp_order;
 	union queue_threshold qt;
 	union dma_skb_size skbsz;
+	unsigned long flags;
+	struct page *page;
 	unsigned int filled;
 	unsigned int pn;
 	u16 rptr;
@@ -995,16 +1035,20 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 		goto err_freeq;
 	}
 
-	/* Allocate a mapping to page look-up index */
+	/* Allocate page metadata referenced by the mapping index */
 	geth->freeq_pages = kzalloc_objs(*geth->freeq_pages, pages);
 	if (!geth->freeq_pages)
 		goto err_freeq;
 	geth->num_freeq_pages = pages;
 
 	dev_info(geth->dev, "allocate %d pages for queue\n", pages);
-	for (pn = 0; pn < pages; pn++)
-		if (!geth_freeq_alloc_map_page(geth, pn))
+	for (pn = 0; pn < pages; pn++) {
+		spin_lock_irqsave(&geth->freeq_lock, flags);
+		page = geth_freeq_alloc_map_page(geth, pn);
+		spin_unlock_irqrestore(&geth->freeq_lock, flags);
+		if (!page)
 			goto err_freeq_alloc;
+	}
 
 	/* Match the software pointer to the retained hardware pointer. */
 	rptr = GET_RPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG);
@@ -1035,6 +1079,7 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 				 DMA_FROM_DEVICE);
 		put_page(gpage->page);
 	}
+	xa_destroy(&geth->freeq_mappings);
 
 	kfree(geth->freeq_pages);
 	geth->freeq_pages = NULL;
@@ -1074,6 +1119,7 @@ static void geth_cleanup_freeq(struct gemini_ethernet *geth)
 		while (page_ref_count(gpage->page) > 0)
 			put_page(gpage->page);
 	}
+	xa_destroy(&geth->freeq_mappings);
 
 	kfree(geth->freeq_pages);
 	geth->freeq_pages = NULL;
@@ -2818,6 +2864,7 @@ static int gemini_ethernet_probe(struct platform_device *pdev)
 
 	spin_lock_init(&geth->irq_lock);
 	spin_lock_init(&geth->freeq_lock);
+	xa_init(&geth->freeq_mappings);
 
 	/* Quiesce firmware state before child IRQ handlers are registered. */
 	gemini_ethernet_disable_irqs(geth);

-- 
2.56.1


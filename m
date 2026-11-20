Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195788;
	b=VxbhhyZ5zhfXBucImQz3TKBUyPm/dsYz+vLDJW/I24+/tLBGLmoRvmKuOFHdwcJ8N16z
	 3Hq0H/+TiDOK2rQrmScCEthHFcuvY5bKwTxf2sRa2/FB8ENbiZLcMx85LyP0dKiRBJXNW
	 zlLNVNi3VMX6MRfZajpXFfG/dW9GZ+VCpc8/X1XE9EMjNWY/QTwXApkscAS+hTrhaSOYH
	 KY+l0eJO4HxWarF5FJc1efAAXuL9XtEgBmcqXi4SxY8rgfY/rkHsdR3T4F3hapwx8oHqw
	 KoBnfaAVeb0p+zkiioR5XmSY+oEqYOU7Gzr2BT58UnWe0wTDwAAtxWoVhNR1GPmz8CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195788;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=wl9eXLNUTXrCEG9QyGbZ3TNmC9R/s5NgqDCE2ww7Y0c=;
	b=UhTeH5KB8nNhvwTCXYn8jme9fv7hpT1JdJOtIHDkkEkstWkvW2akvwcWgGUKzm/KVCA+
	 ovUgRPcjDMxRKsYTWFv0/xjeCTM3XqW7RELb+pq3cdbK8RQHXdS3sEnoupZb5GiSmoMAo
	 YJ3NIyQH2W6Q6Q29Yy6uwNddlHX1rMmEvwNVB9sR2y4m3EBXDyhw1pLYgIR50v2TvqZVy
	 e2LjB8GBqlTW9w2thLBdZ/8CH6lK/39AUKNgRqy47I7reJeStwQjf/XFgYIQSVE2EXEJO
	 8xXBBfNkEi9sBQya7TMO/61LWawe5w6EiYsoh2qTy0D3S16xp8dxb24nIvnmoDiuvPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oHHRowFB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706C260A261B
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oHHRowFB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B991F000CF;
	Fri, 20 Nov 2026 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195788;
	bh=wl9eXLNUTXrCEG9QyGbZ3TNmC9R/s5NgqDCE2ww7Y0c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oHHRowFBsoMpEpD1s8EHBl2euaZZaI9SUfE5WmLYK6uNvmKyxmvfRuo0u0jxXJI43
	 tMvNm+AoVklhAm/MIAupXKUVU+jtGD3fh6wUCsrW65PSdmQo46nRjpZ8mno3vL3toI
	 X54YHRbFDg/fm9O5MCmvwFywVYkXC1aia/EhxuZn6bpeML7szVPmzesPcLTWH9+dWg
	 steBw/n7ptAI4omGov1PY4cvcFrs5MfezPtF9homj9AvA2QzQae6Ltyk97MOKTXplW
	 jBh4RmFYVoqSlC1PTMa2SYiLp3ertkfgzpCYXAHNeyTpG7p4+bUnaG87NupwQpnSOm
	 jOJPjLOuJdQrQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:24 +0100
Subject: [PATCH net-next v9 05/14] net: ethernet: cortina: Correct free
 queue DMA mappings
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
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-5-298671d799d5@kernel.org>
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

The free queue maps complete pages and splits each mapping between its
fragment descriptors. The mapping variable is advanced while filling the
descriptors and that advanced address is then saved as the page mapping.

Replacement also reads the old address after overwriting the descriptor
with the new mapping, so it unmaps the new buffer while leaving the old
mapping live.

The same reassignment leaves replacement metadata holding the new page
base while gmac_rx() still adds PAGE_SIZE before lookup. Once a page is
replaced under RX load, lookup therefore normally fails with "could not
find mapping" and drops the frame. If the resulting key matches another
page, RX can instead attach that page to the skb and drop the wrong page
reference.

Keep the page DMA base separate from the fragment iterator and remove the
invalid replacement unmap. The replaced mapping cannot be released until
its in-flight fragments have been claimed, which is handled with their
lifetime later in the series. Use the saved DMA base and PAGE_SIZE when
unwinding setup and tearing down the current queue.

Reject mappings that cannot fit in the 32-bit hardware descriptors and
derive fragment offsets from the saved DMA base instead of assuming
page-aligned DMA addresses. Snapshot the page, DMA base and offset under
the free queue lock so refill cannot replace them between lookup and use.

The locked linear scan is temporary: the following "Index free queue
fragments with XArray" patch removes it. Backport this change together
with that patch, "Preserve in-flight free queue pages" and "Recycle
claimed free queue pages", which complete the mapping lifetime and DMA
synchronization fixes.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 112 ++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 54 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 66984c78a7cd..5fbdd6d2cbd0 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -759,32 +759,43 @@ static int gmac_setup_rxq(struct net_device *netdev)
 	return 0;
 }
 
-static struct gmac_queue_page *
-gmac_get_queue_page(struct gemini_ethernet *geth,
-		    struct gemini_ethernet_port *port,
-		    dma_addr_t addr)
+static struct page *geth_freeq_lookup(struct gemini_ethernet *geth,
+				      dma_addr_t mapping,
+				      unsigned int *page_offs)
 {
+	unsigned int frag_len = 1 << geth->freeq_frag_order;
 	struct gmac_queue_page *gpage;
-	dma_addr_t mapping;
+	unsigned long flags;
+	dma_addr_t page_mapping;
+	struct page *page = NULL;
 	int i;
 
-	/* Only look for even pages */
-	mapping = addr & PAGE_MASK;
-
+	spin_lock_irqsave(&geth->freeq_lock, flags);
 	if (!geth->freeq_pages) {
 		dev_err_ratelimited(geth->dev,
 				    "try to get page with no page list\n");
-		return NULL;
+		goto unlock;
 	}
 
 	/* Look up a ring buffer page from virtual mapping */
 	for (i = 0; i < geth->num_freeq_pages; i++) {
 		gpage = &geth->freeq_pages[i];
-		if (gpage->mapping == mapping)
-			return gpage;
+		if (!gpage->page || mapping < gpage->mapping)
+			continue;
+
+		page_mapping = gpage->mapping;
+		if (mapping - page_mapping > PAGE_SIZE - frag_len ||
+		    ((mapping - page_mapping) & (frag_len - 1)))
+			continue;
+
+		page = gpage->page;
+		*page_offs = mapping - page_mapping;
+		break;
 	}
 
-	return NULL;
+unlock:
+	spin_unlock_irqrestore(&geth->freeq_lock, flags);
+	return page;
 }
 
 static void gmac_cleanup_rxq(struct net_device *netdev)
@@ -792,11 +803,12 @@ static void gmac_cleanup_rxq(struct net_device *netdev)
 	struct gemini_ethernet_port *port = netdev_priv(netdev);
 	struct gemini_ethernet *geth = port->geth;
 	struct gmac_rxdesc *rxd = port->rxq_ring;
-	static struct gmac_queue_page *gpage;
 	struct nontoe_qhdr __iomem *qhdr;
 	void __iomem *dma_reg;
 	void __iomem *ptr_reg;
+	unsigned int page_offs;
 	dma_addr_t mapping;
+	struct page *page;
 	union dma_rwptr rw;
 	unsigned int r, w;
 
@@ -823,14 +835,13 @@ static void gmac_cleanup_rxq(struct net_device *netdev)
 		if (!mapping)
 			continue;
 
-		/* Freeq pointers are one page off */
-		gpage = gmac_get_queue_page(geth, port, mapping + PAGE_SIZE);
-		if (!gpage) {
+		page = geth_freeq_lookup(geth, mapping, &page_offs);
+		if (!page) {
 			dev_err(geth->dev, "could not find page\n");
 			continue;
 		}
 		/* Release the RX queue reference to the page */
-		put_page(gpage->page);
+		put_page(page);
 	}
 
 	dma_free_coherent(geth->dev, sizeof(*port->rxq_ring) << port->rxq_order,
@@ -844,6 +855,7 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
 	struct gmac_queue_page *gpage;
 	unsigned int fpp_order;
 	unsigned int frag_len;
+	dma_addr_t page_mapping;
 	dma_addr_t mapping;
 	struct page *page;
 	int i;
@@ -853,9 +865,17 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
 	if (!page)
 		return NULL;
 
-	mapping = dma_map_single(geth->dev, page_address(page),
-				 PAGE_SIZE, DMA_FROM_DEVICE);
-	if (dma_mapping_error(geth->dev, mapping)) {
+	page_mapping = dma_map_single(geth->dev, page_address(page),
+				      PAGE_SIZE, DMA_FROM_DEVICE);
+	if (dma_mapping_error(geth->dev, page_mapping)) {
+		put_page(page);
+		return NULL;
+	}
+	if (page_mapping > U32_MAX - (PAGE_SIZE - 1)) {
+		dev_err_ratelimited(geth->dev,
+				    "freeq DMA mapping exceeds 32 bits\n");
+		dma_unmap_single(geth->dev, page_mapping, PAGE_SIZE,
+				 DMA_FROM_DEVICE);
 		put_page(page);
 		return NULL;
 	}
@@ -868,31 +888,25 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
 	 */
 	frag_len = 1 << geth->freeq_frag_order; /* Usually 2048 */
 	fpp_order = PAGE_SHIFT - geth->freeq_frag_order;
+	gpage = &geth->freeq_pages[pn];
+	if (gpage->page)
+		put_page(gpage->page);
+
+	/* Then put our new mapping into the page table */
+	gpage->mapping = page_mapping;
+	gpage->page = page;
+
 	freeq_entry = geth->freeq_ring + (pn << fpp_order);
 	dev_dbg(geth->dev, "allocate page %d fragment length %d fragments per page %d, freeq entry %p\n",
-		 pn, frag_len, (1 << fpp_order), freeq_entry);
+		pn, frag_len, (1 << fpp_order), freeq_entry);
+	mapping = page_mapping;
 	for (i = (1 << fpp_order); i > 0; i--) {
 		freeq_entry->word2.buf_adr = mapping;
 		freeq_entry++;
 		mapping += frag_len;
 	}
-
-	/* If the freeq entry already has a page mapped, then unmap it. */
-	gpage = &geth->freeq_pages[pn];
-	if (gpage->page) {
-		mapping = geth->freeq_ring[pn << fpp_order].word2.buf_adr;
-		dma_unmap_single(geth->dev, mapping, frag_len, DMA_FROM_DEVICE);
-		/* This should be the last reference to the page so it gets
-		 * released
-		 */
-		put_page(gpage->page);
-	}
-
-	/* Then put our new mapping into the page table */
-	dev_dbg(geth->dev, "page %d, DMA addr: %08x, page %p\n",
-		pn, (unsigned int)mapping, page);
-	gpage->mapping = mapping;
-	gpage->page = page;
+	dev_dbg(geth->dev, "page %d, DMA addr: %pad, page %p\n",
+		pn, &page_mapping, page);
 
 	return page;
 }
@@ -963,7 +977,6 @@ static unsigned int geth_fill_freeq(struct gemini_ethernet *geth, bool refill)
 static int geth_setup_freeq(struct gemini_ethernet *geth)
 {
 	unsigned int fpp_order = PAGE_SHIFT - geth->freeq_frag_order;
-	unsigned int frag_len = 1 << geth->freeq_frag_order;
 	unsigned int len = 1 << geth->freeq_order;
 	unsigned int pages = len >> fpp_order;
 	union queue_threshold qt;
@@ -1015,12 +1028,11 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 err_freeq_alloc:
 	while (pn > 0) {
 		struct gmac_queue_page *gpage;
-		dma_addr_t mapping;
 
 		--pn;
-		mapping = geth->freeq_ring[pn << fpp_order].word2.buf_adr;
-		dma_unmap_single(geth->dev, mapping, frag_len, DMA_FROM_DEVICE);
 		gpage = &geth->freeq_pages[pn];
+		dma_unmap_single(geth->dev, gpage->mapping, PAGE_SIZE,
+				 DMA_FROM_DEVICE);
 		put_page(gpage->page);
 	}
 
@@ -1042,7 +1054,6 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 static void geth_cleanup_freeq(struct gemini_ethernet *geth)
 {
 	unsigned int fpp_order = PAGE_SHIFT - geth->freeq_frag_order;
-	unsigned int frag_len = 1 << geth->freeq_frag_order;
 	unsigned int len = 1 << geth->freeq_order;
 	unsigned int pages = len >> fpp_order;
 	unsigned int pn;
@@ -1056,12 +1067,10 @@ static void geth_cleanup_freeq(struct gemini_ethernet *geth)
 
 	for (pn = 0; pn < pages; pn++) {
 		struct gmac_queue_page *gpage;
-		dma_addr_t mapping;
-
-		mapping = geth->freeq_ring[pn << fpp_order].word2.buf_adr;
-		dma_unmap_single(geth->dev, mapping, frag_len, DMA_FROM_DEVICE);
 
 		gpage = &geth->freeq_pages[pn];
+		dma_unmap_single(geth->dev, gpage->mapping, PAGE_SIZE,
+				 DMA_FROM_DEVICE);
 		while (page_ref_count(gpage->page) > 0)
 			put_page(gpage->page);
 	}
@@ -1519,7 +1528,6 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
 	unsigned int consumed = 0;
 	unsigned int frame_len, frag_len;
 	struct gmac_rxdesc *rx = NULL;
-	struct gmac_queue_page *gpage;
 	unsigned int received = 0;
 	bool dropping = port->rx_dropping;
 	union gmac_rxdesc_0 word0;
@@ -1556,8 +1564,6 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
 
 		frag_len = word0.bits.buffer_size;
 		frame_len = word1.bits.byte_count;
-		page_offs = mapping & ~PAGE_MASK;
-
 		if (word3.bits32 & SOF_BIT) {
 			if (skb) {
 				napi_free_frags(&port->napi);
@@ -1576,14 +1582,12 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
 			goto err_drop;
 		}
 
-		/* Freeq pointers are one page off */
-		gpage = gmac_get_queue_page(geth, port, mapping + PAGE_SIZE);
-		if (!gpage) {
+		page = geth_freeq_lookup(geth, mapping, &page_offs);
+		if (!page) {
 			dev_err_ratelimited(geth->dev,
 					    "could not find mapping\n");
 			goto err_drop;
 		}
-		page = gpage->page;
 
 		if (word3.bits32 & SOF_BIT) {
 			skb = gmac_skb_if_good_frame(port, word0, frame_len);

-- 
2.56.1


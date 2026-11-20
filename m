Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195800;
	b=s25VlvL59izWhYIYd3lc6mkVvY3G9yEJc2Z5l24Q1kfknUmwUhT5m192IVtmxeue73I1
	 DaGvVJbpdUeNQcK8Jh/WPy7Yr688FMq05SeR2Xv6dNHxxoGObYzji4paaKf2M8FepxGFp
	 s0MPIdU/SW4d9R7oTKiyCqzYkd31Ge0xvMZpqjXbw2XcpXOQ2pPfPf6OtqKAq+GxIyaZt
	 zRTtI/OgcJuvreH/USxLaDcd1mGwzxMIv2FjL6UUWldg6NICdjuSAJOZByvXLTrbu2YZu
	 9o23MmUbQ5V7UcWG207nM7iI7HWlbCzB/BcWSB9htYtQS4kjeEFhgn61C6lDWphcBoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195800;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=EXBjRTevrPqNGKq/HTyvo8yMIx2X5hlkH0XpMhR9I1s=;
	b=zP0LrdznBK/rX2uloF7JuIgSl+yhNH2Fbu4nfwtSTx7iiWRxOHT4jMCTHJLfX5drEKzB
	 ZuMN0Un7PVFxdIbG092sIy1wOCGEJLX4/4ocC8UHlKnWlnQ+kKAdDHoxdgtE69ys5pVY1
	 35odMKXQ8FYuJgFSQdXh453p3eJQ2+awvXCH7GEZwTqY1Dly3LRDUcCEjvKfBWgVCagnu
	 wsydzEWjNj3J8Ni7F0qHxIEamWlX1OuJBRUER1e4FnrUnFRYn5GPVq5KNQtWsspZhSyPc
	 fMu+KIh+dxYP5YRGp2pW011PHo8tygZjVDgNGPgAbd8CxzDQJg37vqkvAyOxzRPmjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5G1F7ga;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525D60A261E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5G1F7ga
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E211F000F2;
	Fri, 20 Nov 2026 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195800;
	bh=EXBjRTevrPqNGKq/HTyvo8yMIx2X5hlkH0XpMhR9I1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=L5G1F7gaGrdTILTkcs8yIQCQnCbgtTwAnYKjxbuC9NzT4YvGr+AtsRRSts5C/mwbh
	 golRZXZTYtYe91J2BvUgX4o2bmYQGVS6QZ7drvQ8zwXRY5cLPmi+XYcYb1+yWn25LJ
	 +jjClO0rbolKqI632JFEC5nxNdZUJaduS070or7HfR9iS2Nhpbk0w2Mp/tqSHJe/z+
	 GNC90n9QHfYvwDc6WY9zKZiVpxiYVj6kS657ngSk0VHpBEs0wG8e2RZHI2/FvVC4Q0
	 KZ/QjJWidEo3fZwl0c+dIDwREDFfydR0EoVtA463WHHvmVGn6Y/WrpdvSw7Fade+It
	 6UeiNDcUo645w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 18:29:28 +0100
Subject: [PATCH net-next v9 09/14] net: ethernet: cortina: Recycle claimed
 free queue pages
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
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-9-298671d799d5@kernel.org>
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

The preceding "Preserve in-flight free queue pages" fix releases each
mapping after its last descriptor is claimed. Refilling therefore
allocates and maps a fresh page at line rate even after the network stack
has released all references to an old page.

Keep the free queue base reference and streaming mapping after the
fragments are claimed. Track fully claimed slots in a separate bitmap and
inspect one at a time during refill. Recycle a page once its reference
count returns to one. If the stack still owns fragments, unmap the page
and relinquish the base reference before allocating its replacement.

Reject pfmemalloc pages when recycling so emergency-reserve pages return
to the allocator instead of remaining pinned in the free queue.

This prevents retained pages from exhausting the finite metadata table
and bounds the IRQ-disabled search to a bitmap lookup and one reference
count check. It retains the existing free queue allocator without
introducing a page pool.

Recheck the recycle bitmap on each refill iteration and again after mapping
a candidate page. If another RX path retires a page concurrently, release
the candidate and return to the recycler before consuming another metadata
slot. Retry recycling immediately when a retained page is discarded so
other pending entries are examined before allocating a replacement. This
avoids stopping refill while recyclable slots are pending.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/net/ethernet/cortina/gemini.c | 153 +++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 9323e3d7af6d..2613f09a8f71 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -175,7 +175,9 @@ struct gemini_ethernet {
 	struct xarray	freeq_mappings;
 	unsigned int	num_freeq_pages;
 	unsigned long	*freeq_page_bitmap;
+	unsigned long	*freeq_recycle_bitmap;
 	unsigned int	freeq_page_cursor;
+	unsigned int	freeq_recycle_pending;
 	spinlock_t	freeq_lock; /* Locks queue from reentrance */
 };
 
@@ -798,6 +800,34 @@ static int geth_freeq_alloc_slot(struct gemini_ethernet *geth)
 	return slot;
 }
 
+static int geth_freeq_recycle_slot(struct gemini_ethernet *geth)
+{
+	unsigned int slot = geth->freeq_page_cursor;
+
+	lockdep_assert_held(&geth->freeq_lock);
+
+	if (!geth->freeq_recycle_pending)
+		return -ENOSPC;
+
+	slot = find_next_bit(geth->freeq_recycle_bitmap,
+			     geth->num_freeq_pages,
+			     geth->freeq_page_cursor);
+	if (slot == geth->num_freeq_pages) {
+		slot = find_first_bit(geth->freeq_recycle_bitmap,
+				      geth->freeq_page_cursor);
+		if (slot == geth->freeq_page_cursor)
+			return -ENOSPC;
+	}
+
+	__clear_bit(slot, geth->freeq_recycle_bitmap);
+	geth->freeq_page_cursor = slot + 1;
+	if (geth->freeq_page_cursor == geth->num_freeq_pages)
+		geth->freeq_page_cursor = 0;
+	geth->freeq_recycle_pending--;
+
+	return slot;
+}
+
 static struct page *geth_freeq_claim(struct gemini_ethernet *geth,
 				     dma_addr_t mapping,
 				     unsigned int *page_offs)
@@ -807,8 +837,8 @@ static struct page *geth_freeq_claim(struct gemini_ethernet *geth,
 	unsigned long index;
 	unsigned long flags;
 	dma_addr_t page_mapping;
-	unsigned int slot;
 	struct page *page;
+	unsigned int slot;
 	bool valid;
 
 	index = geth_freeq_mapping_index(geth, mapping);
@@ -832,13 +862,8 @@ static struct page *geth_freeq_claim(struct gemini_ethernet *geth,
 	xa_erase(&geth->freeq_mappings, index);
 	if (!--gpage->fragments) {
 		slot = gpage - geth->freeq_pages;
-		dma_unmap_single_attrs(geth->dev, page_mapping, PAGE_SIZE,
-				       DMA_FROM_DEVICE,
-				       DMA_ATTR_SKIP_CPU_SYNC);
-		gpage->page = NULL;
-		gpage->mapping = 0;
-		__clear_bit(slot, geth->freeq_page_bitmap);
-		put_page(page);
+		__set_bit(slot, geth->freeq_recycle_bitmap);
+		geth->freeq_recycle_pending++;
 	}
 
 	*page_offs = mapping - page_mapping;
@@ -932,26 +957,23 @@ static int geth_freeq_map_page(struct gemini_ethernet *geth,
 	return 0;
 }
 
-static int geth_freeq_add_page(struct gemini_ethernet *geth, unsigned int wptr,
-			       struct page *page, dma_addr_t page_mapping)
+static int geth_freeq_post_page(struct gemini_ethernet *geth,
+				unsigned int wptr,
+				struct gmac_queue_page *gpage, bool recycle)
 {
 	struct gmac_rxdesc *freeq_entry;
-	struct gmac_queue_page *gpage;
 	unsigned int ring_mask;
 	unsigned int fpp_order;
 	unsigned int fragments;
 	unsigned int frag_len;
+	dma_addr_t page_mapping = gpage->mapping;
 	dma_addr_t mapping;
+	struct page *page = gpage->page;
 	int ret;
-	int slot;
 	int i;
 
 	lockdep_assert_held(&geth->freeq_lock);
 
-	slot = geth_freeq_alloc_slot(geth);
-	if (slot < 0)
-		return slot;
-
 	/* The assign the page mapping (physical address) to the buffer address
 	 * in the hardware queue. PAGE_SHIFT on ARM is 12 (1 page is 4096 bytes,
 	 * 4k), and the default RX frag order is 11 (fragments are up 20 2048
@@ -963,9 +985,6 @@ static int geth_freeq_add_page(struct gemini_ethernet *geth, unsigned int wptr,
 	fragments = 1 << fpp_order;
 	ring_mask = (1 << geth->freeq_order) - 1;
 
-	gpage = &geth->freeq_pages[slot];
-	gpage->page = page;
-	gpage->mapping = page_mapping;
 	for (i = 0; i < fragments; i++) {
 		mapping = page_mapping + i * frag_len;
 		ret = xa_insert(&geth->freeq_mappings,
@@ -974,6 +993,9 @@ static int geth_freeq_add_page(struct gemini_ethernet *geth, unsigned int wptr,
 		if (ret)
 			goto err_mappings;
 	}
+	if (recycle)
+		dma_sync_single_for_device(geth->dev, page_mapping, PAGE_SIZE,
+					   DMA_FROM_DEVICE);
 	gpage->fragments = fragments;
 	page_ref_add(page, fragments);
 
@@ -997,9 +1019,70 @@ static int geth_freeq_add_page(struct gemini_ethernet *geth, unsigned int wptr,
 		xa_erase(&geth->freeq_mappings,
 			 geth_freeq_mapping_index(geth, mapping));
 	}
-	gpage->page = NULL;
-	gpage->mapping = 0;
-	__clear_bit(slot, geth->freeq_page_bitmap);
+	return ret;
+}
+
+static int geth_freeq_add_page(struct gemini_ethernet *geth,
+			       unsigned int wptr,
+			       struct page *page, dma_addr_t page_mapping)
+{
+	struct gmac_queue_page *gpage;
+	int ret;
+	int slot;
+
+	lockdep_assert_held(&geth->freeq_lock);
+
+	slot = geth_freeq_alloc_slot(geth);
+	if (slot < 0)
+		return slot;
+
+	gpage = &geth->freeq_pages[slot];
+	gpage->page = page;
+	gpage->mapping = page_mapping;
+	ret = geth_freeq_post_page(geth, wptr, gpage, false);
+	if (ret) {
+		gpage->page = NULL;
+		gpage->mapping = 0;
+		__clear_bit(slot, geth->freeq_page_bitmap);
+	}
+
+	return ret;
+}
+
+static int geth_freeq_recycle_page(struct gemini_ethernet *geth,
+				   unsigned int wptr)
+{
+	struct gmac_queue_page *gpage;
+	struct page *page;
+	int ret;
+	int slot;
+
+	lockdep_assert_held(&geth->freeq_lock);
+
+	slot = geth_freeq_recycle_slot(geth);
+	if (slot < 0)
+		return slot;
+
+	gpage = &geth->freeq_pages[slot];
+	if (page_ref_count(gpage->page) > 1 ||
+	    !dev_page_is_reusable(gpage->page)) {
+		page = gpage->page;
+		dma_unmap_single_attrs(geth->dev, gpage->mapping, PAGE_SIZE,
+				       DMA_FROM_DEVICE,
+				       DMA_ATTR_SKIP_CPU_SYNC);
+		gpage->page = NULL;
+		gpage->mapping = 0;
+		__clear_bit(slot, geth->freeq_page_bitmap);
+		put_page(page);
+		return -EAGAIN;
+	}
+
+	ret = geth_freeq_post_page(geth, wptr, gpage, true);
+	if (ret) {
+		__set_bit(slot, geth->freeq_recycle_bitmap);
+		geth->freeq_recycle_pending++;
+	}
+
 	return ret;
 }
 
@@ -1034,9 +1117,22 @@ static unsigned int geth_fill_freeq(struct gemini_ethernet *geth)
 		rptr = rw.bits.rptr & ring_mask;
 		wptr = rw.bits.wptr & ring_mask;
 		space = CIRC_SPACE(wptr, rptr, len) >= fragments;
+		ret = -ENOSPC;
+		if (space && geth->freeq_recycle_pending) {
+			ret = geth_freeq_recycle_page(geth, wptr);
+			if (!ret) {
+				count += fragments;
+				wptr = (wptr + fragments) & ring_mask;
+				SET_WPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG, wptr);
+			}
+		}
 		spin_unlock_irqrestore(&geth->freeq_lock, flags);
 		if (!space)
 			break;
+		if (!ret || ret == -EAGAIN)
+			continue;
+		if (ret != -ENOSPC)
+			break;
 
 		ret = geth_freeq_map_page(geth, &page, &page_mapping);
 		if (ret)
@@ -1049,6 +1145,8 @@ static unsigned int geth_fill_freeq(struct gemini_ethernet *geth)
 		wptr = rw.bits.wptr & ring_mask;
 		if (CIRC_SPACE(wptr, rptr, len) < fragments) {
 			ret = -ENOSPC;
+		} else if (geth->freeq_recycle_pending) {
+			ret = -EAGAIN;
 		} else {
 			ret = geth_freeq_add_page(geth, wptr, page,
 						  page_mapping);
@@ -1065,6 +1163,8 @@ static unsigned int geth_fill_freeq(struct gemini_ethernet *geth)
 			dma_unmap_single(geth->dev, page_mapping, PAGE_SIZE,
 					 DMA_FROM_DEVICE);
 			put_page(page);
+			if (ret == -EAGAIN)
+				continue;
 			break;
 		}
 	}
@@ -1109,6 +1209,7 @@ static void geth_freeq_release_pages(struct gemini_ethernet *geth)
 		put_page(page);
 	}
 	xa_destroy(&geth->freeq_mappings);
+	geth->freeq_recycle_pending = 0;
 }
 
 static unsigned int
@@ -1155,6 +1256,9 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 	geth->freeq_page_bitmap = bitmap_zalloc(page_slots, GFP_KERNEL);
 	if (!geth->freeq_page_bitmap)
 		goto err_freeq_pages;
+	geth->freeq_recycle_bitmap = bitmap_zalloc(page_slots, GFP_KERNEL);
+	if (!geth->freeq_recycle_bitmap)
+		goto err_freeq_page_bitmap;
 	geth->num_freeq_pages = page_slots;
 	geth->freeq_page_cursor = 0;
 
@@ -1182,6 +1286,9 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
 	writew(readw(geth->base + GLOBAL_SWFQ_RWPTR_REG),
 	       geth->base + GLOBAL_SWFQ_RWPTR_REG + 2);
 	geth_freeq_release_pages(geth);
+	bitmap_free(geth->freeq_recycle_bitmap);
+	geth->freeq_recycle_bitmap = NULL;
+err_freeq_page_bitmap:
 	bitmap_free(geth->freeq_page_bitmap);
 	geth->freeq_page_bitmap = NULL;
 err_freeq_pages:
@@ -1212,6 +1319,8 @@ static void geth_cleanup_freeq(struct gemini_ethernet *geth)
 
 	geth_freeq_release_pages(geth);
 
+	bitmap_free(geth->freeq_recycle_bitmap);
+	geth->freeq_recycle_bitmap = NULL;
 	bitmap_free(geth->freeq_page_bitmap);
 	geth->freeq_page_bitmap = NULL;
 	kfree(geth->freeq_pages);

-- 
2.56.1


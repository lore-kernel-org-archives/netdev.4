Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544995;
	b=GqiMx0BKWIuuP+79qum3DR9ghrkgNdIWw+3slFGPyr2deIY4SOvoolOQnfR3T51fL8Pc
	 NhRko/vKtqMCdj6Nb8Av+1haZICxS4e54hWNGupOmw8azHQNiXHRMjBj+NeBVECu7X9Lv
	 gL7wK0IYx29cIQK/D+/lPGb+3fIhUYzGDooxwRou0mdsmOjcxwpBYRHYIwWjQt3HAm7p7
	 l6DEVV2pi+8EMFyNTogcXrugkIfksyOnBj0srVNk/lkNPUiC0oewx2Wno7L+tyAiotUx9
	 7saa44P8yVAhKCGkiH3Ur4me8rO2G62Dxht4hv2NzGWLShv2VQFf+0tJ7BhA7MYpfmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544995;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Xg2JL0Unr4xXx6UCd26YLCbPv9sIkjm7WiGBoNMPRMc=;
	b=1eEmBHHKylowDQH2fjUDohqmzikUwH+s8a5Q/00aD28xbdJn0fKebzcXxoxh1skPdMvz
	 TwFz3xWB+SY6CK2gB+SrKLRP4zNSgKqhOx6UQaEwoT61AaJTuBApDsu2stXci0TPFWGEd
	 s7RtClgo5nPxjByLYPe/gap+dRBXZWi1jATnEnZF23JnMUnSPqy0RWt2Z0hKDJgwzU0Tb
	 QuPFckFypuGOGMS/yCK1gYMkw/87gZJ/S2q55beWahWH2I1mzHBYJDrUTh5sMa+eUgmuV
	 c1FviHyG8eM5uH4xUbqfsYwq1ZmhOmTZrf/wA0Gsja+y7TF2pnMldgTW9piNP5l1kiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlyOad0n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D8606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hlyOad0n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D4C1F000C6;
	Tue, 24 Nov 2026 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544995;
	bh=Xg2JL0Unr4xXx6UCd26YLCbPv9sIkjm7WiGBoNMPRMc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hlyOad0njSk5x+hGw9S9Z/7To6fqIIlFABXTmh1qhJrGKO/pWzN6B5M2N86CloAum
	 LqpTY2iuQzAQRp5EFS23Tl6tY+bgsDVIsrk75dvaAYpk64WHnC00UReHnWeO0j5n05
	 9X9fx8cdvQ3aPao5MvEXo4j29JNNcuT9rnKh0W5pDvXV6ygf1O9f/QupSxVyHP6RFI
	 2AkpRKRcNRf/hsI2ySp+NPODG+2UStH+mGTcHJTVTLIfKNMV8/irEiUhVxqj+d3j9F
	 AW+XUvWn9aw5Oy41fmQ1ZR/LlnEk8P5oMxqtXlkZDx40DoaY0BOCRiM8Bx1BOZYY5Q
	 RvD7ciBqmgALQ==
Subject: Re: [PATCH net-next v9 07/14] net: ethernet: cortina: Preserve
 in-flight free queue pages
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:54 +0000
Message-ID: <179554499443.3135.14488059743650071074@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-7-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-7-298671d799d5@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] After this patch, a page metadata slot is freed at runtime
  only from geth_freeq_claim(), and only once every fragment of the page…
- [Medium] geth_resize_freeq() used to return early when the free queue
  already existed with the same order (`if (geth->freeq_ring &&…
- [Medium] The patch now rebuilds the shared free queue on every open
  with the peer down, and says the purpose is to reclaim fragments that…
- [Low] This patch fixes an RX mapping-lifetime bug that has been user-
  visible since the driver was first added, and its commit message…

--

net: ethernet: cortina: Preserve in-flight free queue pages

This patch stops indexing free queue page metadata by ring position.
Metadata slots now come from a pool tracked by a bitmap, and each
fragment's DMA address stays in the XArray until an RX descriptor claims
it. Pages are now allocated and mapped outside the free queue lock, and
the shared free queue is rebuilt on every open while the peer port is
down.

> The following "Recycle claimed free queue pages" patch restores recycling
> independently of queue position. Backport both changes together with
> their prerequisites, including "Index free queue fragments with XArray".

[Severity: Low]
The commit message asks for a backport, but neither this patch nor any
other patch in the series has a Fixes: tag or a Cc: stable. Should one be
added?

This patch replaces the refill logic that was indexed by queue position.
In that code, geth_fill_freeq() called geth_freeq_alloc_map_page(geth, pn)
once page_ref_count(page) > 1, which erased the old page's XArray entries.
That logic appears to go back to:

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index fdf8c0e2f29e6..1693a136d7343 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -768,15 +773,32 @@ geth_freeq_mapping_index(const struct gemini_ethernet *geth,
>  	return (unsigned long)(mapping >> geth->freeq_frag_order);
>  }
>  
> -static struct page *geth_freeq_lookup(struct gemini_ethernet *geth,
> -				      dma_addr_t mapping,
> -				      unsigned int *page_offs)
> +static int geth_freeq_alloc_slot(struct gemini_ethernet *geth)
> +{
> +	unsigned int slot;
> +
> +	lockdep_assert_held(&geth->freeq_lock);
> +
> +	slot = find_first_zero_bit(geth->freeq_page_bitmap,
> +				   geth->num_freeq_pages);
> +	if (slot == geth->num_freeq_pages)
> +		return -ENOSPC;
> +
> +	__set_bit(slot, geth->freeq_page_bitmap);
> +
> +	return slot;
> +}

[ ... ]

> @@ -795,6 +817,21 @@ static struct page *geth_freeq_lookup(struct gemini_ethernet *geth,
>  	if (!valid)
>  		goto err_unlock;
>  
> +	dma_sync_single_range_for_cpu(geth->dev, page_mapping,
> +				      mapping - page_mapping, frag_len,
> +				      DMA_FROM_DEVICE);
> +	xa_erase(&geth->freeq_mappings, index);
> +	if (!--gpage->fragments) {
> +		slot = gpage - geth->freeq_pages;
> +		dma_unmap_single_attrs(geth->dev, page_mapping, PAGE_SIZE,
> +				       DMA_FROM_DEVICE,
> +				       DMA_ATTR_SKIP_CPU_SYNC);
> +		gpage->page = NULL;
> +		gpage->mapping = 0;
> +		__clear_bit(slot, geth->freeq_page_bitmap);
> +		put_page(page);
> +	}

[Severity: Medium]
Is geth_freeq_claim() the only place that clears a bit in
freeq_page_bitmap at runtime? It does so only after every fragment of the
page has been claimed through an RX descriptor.

The hardware can take a fragment from the free queue and never return it
with a valid buf_adr. Such a fragment is never claimed, and the commit
message itself refers to "fragments that never returned a usable RX
address". In gmac_rx(), the zero mapping path and the "could not find
mapping" path both go to err_drop without claiming anything:

gmac_rx() {
    ...
		if (!mapping) {
			if (net_ratelimit())
				netdev_err(netdev,
					   "rxq[%u]: HW BUG: zero DMA desc\n",
					   r);
			goto err_drop;
		}
    ...
}

Each lost fragment keeps its slot bit set, along with its DMA mapping, its
page references and its XArray entry.

geth_freeq_page_slots() sizes the pool as the ring's pages plus
1 << rxq_order for each port, so there is no headroom for lost
fragments. The only reclaim is geth_cleanup_freeq() during a rebuild, and
geth_resize_freeq() skips the rebuild whenever the peer port is running.

Once leaked slots fill the bitmap, won't geth_freeq_alloc_slot() return
-ENOSPC every time? geth_fill_freeq() would then map a page, unmap and
free it, and break without posting anything. The shared free queue would
drain, and RX would stop on both ports until both interfaces are taken
down.

gemini_port_irq_thread() also ACKs and re-enables SWFQ_EMPTY whether or
not the refill posted anything:

gemini_port_irq_thread() {
	geth_fill_freeq(geth);
	...
	writel(irqmask, geth->base + GLOBAL_INTERRUPT_STATUS_4_REG);
	irqmask |= readl(geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
	writel(irqmask, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
	...
}

Could that become an interrupt loop that makes no progress?

The old refill could not stall like this, because it always replaced the
page at a given position. The problem also remains at the end of the
series, since "Recycle claimed free queue pages" only recycles slots whose
fragments have all been claimed.

[ ... ]

> @@ -854,32 +891,22 @@ static void gmac_cleanup_rxq(struct net_device *netdev)
>  			  port->rxq_ring, port->rxq_dma_base);
>  }
>  
> -static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
> -					      int pn)
> +static int geth_freeq_map_page(struct gemini_ethernet *geth,
> +			       struct page **pagep,
> +			       dma_addr_t *page_mappingp)
>  {

[ ... ]

> -	lockdep_assert_held(&geth->freeq_lock);
> -
> -	/* First allocate and DMA map a single page */
>  	page = alloc_page(GFP_ATOMIC);
>  	if (!page)
> -		return NULL;
> +		return -ENOMEM;

[Severity: Medium]
geth_freeq_map_page() now runs outside freeq_lock. Does the setup path
still need GFP_ATOMIC here?

geth_resize_freeq() no longer returns early when the queue already exists
with the same order. With the peer down, every open and every rx
ethtool -G now tears down and rebuilds the free queue. On single-port
boards other_running is always false, so this happens on every ifup:

gmac_open()
  geth_resize_freeq()
    geth_cleanup_freeq()
    geth_setup_freeq()
      geth_fill_freeq()
        geth_freeq_map_page()
          alloc_page(GFP_ATOMIC)

geth_setup_freeq() now fails unless every usable entry is filled:

	expected = len - (1 << fpp_order);
	filled = geth_fill_freeq(geth);
	if (filled != expected)
		goto err_freeq_bitmap;

With the default rings, a down/up that used to reuse the existing pages
now allocates about 1023 pages (4 MiB) without direct reclaim, taking them
from atomic reserves. Under memory pressure on a small Gemini system,
could the fill fall short and make gmac_open() fail where it used to
succeed?

This path runs in sleepable process context under RTNL, so could the
setup fill use GFP_KERNEL instead? The final state of the series still
uses GFP_ATOMIC here, and still rebuilds on every open with the peer down.

[ ... ]

> @@ -1200,8 +1282,19 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
>  	new_order = max_t(unsigned int, new_order, fls(rptr));
>  	dev_dbg(geth->dev, "set shared queue to size %d order %d\n",
>  		new_size, new_order);
> -	if (geth->freeq_ring && geth->freeq_order == new_order)
> -		return 0;
> +	if (new_order <= PAGE_SHIFT - geth->freeq_frag_order)
> +		return -EINVAL;
> +
> +	/* Rebuild an idle queue to reclaim fragments which were never claimed. */
> +	if (geth->freeq_ring && other_running) {
> +		page_slots = geth_freeq_page_slots(geth, geth->freeq_order);
> +		if (geth->freeq_order >= new_order &&
> +		    geth->num_freeq_pages >= page_slots)
> +			return 0;
> +	}
> +
> +	if (other_running)
> +		return -EBUSY;

[Severity: Medium]
Is it safe to free the fragments that were never claimed during this
rebuild? The hardware consumed these fragments (rptr moved past them) but
never wrote them into an RX descriptor, so we don't know whether it still
holds their addresses.

geth_cleanup_freeq()->geth_freeq_release_pages() unmaps each such page and
drops all of its outstanding references, so the page goes back to the
page allocator:

geth_freeq_release_pages() {
    ...
		dma_unmap_single_attrs(geth->dev, gpage->mapping, PAGE_SIZE,
				       DMA_FROM_DEVICE,
				       DMA_ATTR_SKIP_CPU_SYNC);
		while (gpage->fragments) {
			put_page(page);
			gpage->fragments--;
		}
		put_page(page);
    ...
}

Nothing in the teardown appears to reset the per-port RX DMA engines:

  - gmac_stop_dma() only clears rd_enable and td_enable.
  - geth_cleanup_freeq() only sets wptr to rptr and writes 0 to
    GLOBAL_SW_FREEQ_BASE_SIZE_REG.
  - The hardware rptr is deliberately kept across the rebuild.

Suppose the GMAC RX DMA keeps a free queue buffer address it has already
fetched, which could explain why those fragments never come back. Would
it then write the next received frame to that address once gmac_open()
calls gmac_start_dma() and gmac_enable_tx_rx()?

That page may already belong to someone else by then, and Gemini has no
IOMMU to catch the write.

Before this patch the queue was only rebuilt when its order changed. A
plain close and reopen kept those pages owned by the driver.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org

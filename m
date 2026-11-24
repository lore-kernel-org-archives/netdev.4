Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544991;
	b=3TXBdVHETfsu2x3im/A2D3pVTszfw88lRMz0R1dU8mPwPTX3v2XV9Ij3iJ1FxwiXupnu
	 0VfGIhWRAW9ZfG+LYEzwfKGIO8jHMINSgRg3pncOFRxmAPwhTtbUEBJqc7P5QSUX7aWEI
	 dZB/p24WZxCFg3sXkBupwBLtMN3nyd9t4zXM5MtH82v+LziD0nYylibyl7XmNWZPSQQgN
	 1Xm+Dlx515diWWozO5v4XBCJZKXBeUYlEXMDFHKQ+MN/DbiORfMQZN2PVEYlWPtRBFnPS
	 Tz8SFQJeDClS50JmamYj5rILNYzrAfSHFqozq1soPf2uxLRVn6Q6HQjNSjZnYWn6dAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544991;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mEybJTeTW7fhanFZgaX2CxNkC7ge/phSzZ/0fxePoD8=;
	b=E0BJZFo7DCC9XsDDxUpXBxxi2JOUE7ZZ2eBkyT/b6xbUwECI3e64Nui05oS3FenYGbKf
	 0CpfkA19tlg61z+Kl5mHNPZ9fYagQDWt8Ny/NIfs2NcPVzPMgkqMQf0kTxhRaRnFMYzqh
	 +ZwGiasQUdmFjAlWABz91jZB71AroRfUB/p/P51vCfNJA8WigfmYRGVlSYBY8MaM2GMyb
	 BgGKb8UMpWqJHWRmkU1A0/LhSYRsfixAfaDnT+GESEf92KUjl3tRHHn8WfP2N2d8W3FVd
	 HZ7Ngv6TBbRh/2C7cuoVFoyJcao3vZDPEbBP+AHUdmKU6zs4Cp9PlutxjQRZuH1yNRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dGVD1V/y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47A606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGVD1V/y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70F91F000D8;
	Tue, 24 Nov 2026 18:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544991;
	bh=mEybJTeTW7fhanFZgaX2CxNkC7ge/phSzZ/0fxePoD8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dGVD1V/yUukJDBLiR3NvH25jn2DW56E1uDhNVFxtuws/wA/G+cd/JzSLp75E/Y2/n
	 hBGPS4kzZ8TUi+Q5E1kZOyvkGTKiFe+DIiOTajwJfFgTdZKqCXlLs6FeJpP8JYFLPY
	 0hToBaF2tZv37BrNEtaqhdqWSeKzgbQyKSwko7nApfWYs8SHMzB4kNd/XD5typvXO9
	 AzciYxobM/NSy8ZIVTShJBCDq06El0RohUUOeB5hoHzJjeonITDCaszGPB5s4TkHEu
	 seOrPFqJwjp80JGaPSI9D2KiUJTkg0QBnC1ommfbOYPARKV1OwhY93ygaW6AbLxwRQ
	 X6P1ETw/KOlJw==
Subject: Re: [PATCH net-next v9 03/14] net: ethernet: cortina: Drain free
 queue IRQ before resize
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:50 +0000
Message-ID: <179554499027.3135.325003720698088138@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-3-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-3-298671d799d5@kernel.org>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch fixes a real memory-safety race but has no Fixes: tag
  and no Cc: stable.
- [Low] This patch makes gemini_port_irq() return IRQ_NONE
  unconditionally when !port->id (line 2417).

Pre-existing issues:
- [High] At the target revision, geth_cleanup_freeq() runs `while
  (page_ref_count(gpage->page) > 0) put_page(gpage->page);` (lines…
- [High] At the target revision, geth_cleanup_freeq() only sets wptr =
  rptr and zeroes GLOBAL_SW_FREEQ_BASE_SIZE_REG (lines 1047-1049).
- [Medium] At the target revision, geth_freeq_alloc_map_page() maps each
  page with dma_map_single(..., PAGE_SIZE, ...) at line 856.
- [Medium] gmac_enable_irq() enables GMAC0_IRQ4_8 << (dev_id * 8) in
  GLOBAL_INTERRUPT_ENABLE_4_REG (line 1430), which includes…

--

net: ethernet: cortina: Drain free queue IRQ before resize

This patch disables the port 1 Linux IRQ for the whole of
geth_resize_freeq(). An already woken free queue IRQ thread is therefore
drained before the ring and page metadata are freed. The free queue source
is re-enabled only after a successful setup, freed queue state is cleared,
and gemini_port_irq() now ignores the interrupt on port 0.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 4f27a48908b1a..5e9dd2aea4077 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -1019,6 +1019,8 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
>  	}
>  
>  	kfree(geth->freeq_pages);
> +	geth->freeq_pages = NULL;
> +	geth->num_freeq_pages = 0;
>  err_freeq:

[Severity: Medium]
This isn't a bug introduced by this patch, but the error path just above
unmaps each page using frag_len as the size:

geth_setup_freeq() {
    ...
	mapping = geth->freeq_ring[pn << fpp_order].word2.buf_adr;
	dma_unmap_single(geth->dev, mapping, frag_len, DMA_FROM_DEVICE);
    ...
}

geth_freeq_alloc_map_page(), however, maps the whole page with PAGE_SIZE.
geth_cleanup_freeq() has the same frag_len size mismatch.

There is a related problem in the replacement branch of
geth_freeq_alloc_map_page(). By the time the old mapping is read back, the
descriptors have already been overwritten with the new mapping:

geth_freeq_alloc_map_page() {
    ...
	gpage = &geth->freeq_pages[pn];
	if (gpage->page) {
		mapping = geth->freeq_ring[pn << fpp_order].word2.buf_adr;
		dma_unmap_single(geth->dev, mapping, frag_len, DMA_FROM_DEVICE);
    ...
}

Doesn't this unmap the new buffer that was just posted to the hardware,
and leak the old page's mapping? geth_fill_freeq() takes this branch
whenever page_ref_count(page) > 1.

This looks to be resolved later in the series by "net: ethernet: cortina:
Correct free queue DMA mappings". After that patch, every unmap site uses
gpage->mapping with PAGE_SIZE.

> @@ -1059,20 +1061,37 @@ static void geth_cleanup_freeq(struct gemini_ethernet *geth)
>  	}
>  
>  	kfree(geth->freeq_pages);
> +	geth->freeq_pages = NULL;
> +	geth->num_freeq_pages = 0;

[Severity: High]
This is a pre-existing issue, but the loop just before this kfree() in
geth_cleanup_freeq() keeps dropping page references until the count
reaches zero:

geth_cleanup_freeq() {
    ...
	gpage = &geth->freeq_pages[pn];
	while (page_ref_count(gpage->page) > 0)
		put_page(gpage->page);
    ...
}

Can this drop references owned by RX skbs that were already delivered to
the stack? After the final put_page(), the loop also reads the refcount of
a page that has already been freed.

The path is gmac_open() or gmac_set_ringparam() -> geth_resize_freeq() ->
geth_cleanup_freeq(). It runs when the peer netdev is down and the order
changes, which can happen while skbs that reference free queue pages are
still queued in sockets.

This looks to be fixed later in the series by "net: ethernet: cortina:
Preserve in-flight free queue pages". After that patch,
geth_freeq_release_pages() drops only the driver-owned references.

>  
>  	dma_free_coherent(geth->dev,
>  			  sizeof(*geth->freeq_ring) << geth->freeq_order,
>  			  geth->freeq_ring, geth->freeq_dma_base);
> +	geth->freeq_ring = NULL;
> +}
> +
> +static void geth_set_freeq_irq(struct gemini_ethernet *geth, bool enable)
> +{
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&geth->irq_lock, flags);
> +	val = readl(geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> +	if (enable)
> +		val |= SWFQ_EMPTY_INT_BIT;

[Severity: Medium]
This isn't a bug introduced by this patch, but when SWFQ_EMPTY fires,
gemini_port_irq() clears the RX overrun enables for both GMACs:

gemini_port_irq() {
    ...
		en &= ~(SWFQ_EMPTY_INT_BIT | GMAC0_RX_OVERRUN_INT_BIT
					   | GMAC1_RX_OVERRUN_INT_BIT);
		writel(en, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
    ...
}

gemini_port_irq_thread() restores only SWFQ_EMPTY_INT_BIT, and so does
geth_set_freeq_irq(geth, true) here. Only gmac_enable_irq() enables the
overrun sources again, and it runs only on open.

Won't RX overrun interrupts for both ports stay masked after the first
free queue refill, so that rx_fifo_errors stops counting? This still seems
to be present at the end of the series.

> +	else
> +		val &= ~SWFQ_EMPTY_INT_BIT;
> +	writel(val, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> +	spin_unlock_irqrestore(&geth->irq_lock, flags);
>  }

[ ... ]

> @@ -1120,13 +1137,8 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
>  	if (geth->freeq_ring && geth->freeq_order == new_order)
>  		return 0;
>  
> -	spin_lock_irqsave(&geth->irq_lock, flags);
> -
> -	/* Disable the software queue IRQs */
> -	en = readl(geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> -	en &= ~SWFQ_EMPTY_INT_BIT;
> -	writel(en, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
> -	spin_unlock_irqrestore(&geth->irq_lock, flags);
> +	disable_irq(geth->port1->irq);
> +	geth_set_freeq_irq(geth, false);

[Severity: Low]
This change closes a use-after-free. Before it, gemini_port_irq_thread()
could run geth_fill_freeq() on freeq_pages and freeq_ring while
geth_cleanup_freeq() was freeing them. It could also set
SWFQ_EMPTY_INT_BIT again after teardown.

Should the patch carry a Fixes: tag and Cc: stable so it can be
backported? The mask-only sequence in geth_resize_freeq() and the
unconditional re-enable in gemini_port_irq_thread() both appear to come
from the original driver:

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

>  
>  	/* Drop the old queue */
>  	if (geth->freeq_ring)
> @@ -1136,14 +1148,10 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
>  	geth->freeq_order = new_order;
>  	ret = geth_setup_freeq(geth);

[Severity: High]
This is a pre-existing issue, but geth_cleanup_freeq() only copies rptr
into wptr and zeroes GLOBAL_SW_FREEQ_BASE_SIZE_REG. The hardware rptr
therefore still holds an index from the old ring geometry.

geth_setup_freeq() then calls geth_fill_freeq(geth, false) with the new
freeq_order, and the rptr it uses is not masked:

geth_fill_freeq() {
    ...
	pn = (refill ? rw.bits.wptr : rw.bits.rptr) >> fpp_order;
	epn = (rw.bits.rptr >> fpp_order) - 1;
	epn &= m_pn;
    ...
}

Suppose ethtool -G shrinks the ring, or an open picks a smaller order,
while the hardware rptr is at or above the new ring length. Can
freeq_pages[pn] and freeq_ring[pn << fpp_order] then be indexed out of
bounds? The hardware rptr would also point past the end of the new
descriptor ring.

This looks to be fixed later in the series by "net: ethernet: cortina:
Normalize free queue pointers on rebuild". That patch masks rptr and wptr
with the ring mask, and resize rejects rings that cannot contain the
retained rptr.

[ ... ]

> @@ -2406,6 +2414,9 @@ static irqreturn_t gemini_port_irq(int irq, void *data)
>  	irqreturn_t ret = IRQ_NONE;
>  	u32 val, en;
>  
> +	if (!port->id)
> +		return IRQ_NONE;
> +

[Severity: Low]
gemini_ethernet_port_probe() still registers the free queue handler and
thread for both ports:

gemini_ethernet_port_probe() {
    ...
	ret = devm_request_threaded_irq(port->dev,
					port->irq,
					gemini_port_irq,
					gemini_port_irq_thread,
					IRQF_SHARED,
					port_names[port->id],
					port);
    ...
}

With this check, the port 0 handler never claims an interrupt and its
thread can never be woken. It is still called on every interrupt on the
shared port 0 line, and it still shows up as an "ethernet0" handler.

gemini_ethernet_init() routes SWFQ_EMPTY to int1 through
GLOBAL_INTERRUPT_SELECT_4_REG, so this isn't a functional bug. Would it
be cleaner to skip registering the free queue handler for port 0 rather
than register one that does nothing?

>  	geth = port->geth;
>  	spin_lock(&geth->irq_lock);
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544992;
	b=Os+b/ho90td/BZtJS8Sl+ylT0ySdGH3jUHUVAjb2KvzR7lo0qpS+P5JtMbINmvtIbTOB
	 AYJ83HaAsFqAIyQhGeV2Afm1hD+wjzFX2wNMbW+TZ5rJnSoSjN+sXKuRD0TR7aLl8/Rwm
	 x8G+hra3iKsysT5m2RsB7q5B/iWeB7gAWmeGiXxAax6H3i79PlYI0jCgudhx+nqM4fqQ9
	 kILzbnW/EnpSzGySDJo+yRd3bmdEykmslh1phUDQR6QF03e5yO24L0iD5Hu0OYiX2Kw/q
	 jj9jybwFnpzH1cs2vRxOKppznM8ppUCsz+MREw4hpwN9nB2OMjCReAQ7w7u4onY679A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544992;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CpDRI2KX2DLDuf63UR7B6P74f5SCQjbk+q32avF+F2A=;
	b=zJ2ls61IfAlkTHrvs/3963EKqy9LTA3BpX9PMqe8tooWpeBdFyI2jd6S2sNypiENqE+A
	 pikQWYBPLICTXUtiYSDXnf+jb1KDB7KQOO68cV5tBAzaTgbnUniPY47B6KxIqp6PS6fHb
	 09XFDiMJHKtICdX0KpQcOFeRnnJdYNTicOzoDiz09OkRGXUjrKD4pmOfnKTa1RbEkKiC0
	 mjSj+h401PzxjbAN51GwOjeFjzCOR53crrgvL/AaHSbd4EmtERKVXjUX+GQxks31QCMM5
	 3l958fy1sweWvb6Uep4TI+VURWl2D2SqxTKwVyxQnQ+NjcyTtDef4/LXv6z7dRi6ntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lr5kZp05;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2437606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lr5kZp05
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DF51F000D8;
	Tue, 24 Nov 2026 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544992;
	bh=CpDRI2KX2DLDuf63UR7B6P74f5SCQjbk+q32avF+F2A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lr5kZp05ZMlhF8f4bQmBJDPNtk4XjJA5iSyawvPu4vLKa1YanIsUJrX2x+KfSesxN
	 WuyKxZuyd6ZiQd0laYUCEH7d0bUSfr+xNh3QnYFMCmnKtrlaYhukSgmKKRbMWMGyhl
	 CUHcDQziqumXEamR9udB5jJDiCRcbby/LMyWo34ZIlxrNf53IpMgmAQ3F7IaBN93z+
	 K0keu4XvQ8X/Z9ztDS38+9JQJbTW2iZ+CVg1YLbRxTx+83w0toV8dqhi15lugoSCI7
	 2Yx+uBEsJpb3pAxSO1oJKjViAEoMIs3NpulD8gMS+M+Oy4Ds3pO52DlOKmo1sbXKcL
	 FqTMsEc0wfaIA==
Subject: Re: [PATCH net-next v9 04/14] net: ethernet: cortina: Normalize free
 queue pointers on rebuild
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:51 +0000
Message-ID: <179554499156.3135.8516338457129003935@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-4-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-4-298671d799d5@kernel.org>
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

- [Low] The commit has no Fixes: tag, but it fixes a memory-safety bug.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch's
  own premise exposes it.

--

net: ethernet: cortina: Normalize free queue pointers on rebuild

The hardware keeps the free queue read pointer when the queue is rebuilt
at a smaller order. This patch masks the page indices in
geth_fill_freeq() to the active order and sets the software write
pointer from the retained read pointer in geth_setup_freeq(). It also
stops geth_resize_freeq() from shrinking the ring below the size needed
to hold the retained pointer.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 5e9dd2aea4077..66984c78a7cd4 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -920,6 +920,7 @@ static unsigned int geth_fill_freeq(struct gemini_ethernet *geth, bool refill)
>  
>  	rw.bits32 = readl(geth->base + GLOBAL_SWFQ_RWPTR_REG);
>  	pn = (refill ? rw.bits.wptr : rw.bits.rptr) >> fpp_order;
> +	pn &= m_pn;

[Severity: Low]
Should this patch have a Fixes: tag?

Before this change, geth_fill_freeq() used the unmasked pn to index
geth->freeq_pages[pn], and then dereferenced gpage->page through
page_ref_count() and page_ref_add(). If the free queue was rebuilt at a
smaller order, for example via ethtool -G (gmac_set_ringparam() ->
geth_resize_freeq()), pn could be >= num_freeq_pages.

The unmasked code seems to date back to:

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

The commit message also says that a following patch, which decouples
the RX buffer budget from descriptor geometry, is needed to avoid an
allocation approaching 64 MiB. Would it help to add a note about that
dependency for stable backporters?

>  	epn = (rw.bits.rptr >> fpp_order) - 1;
>  	epn &= m_pn;
>  

[ ... ]

> @@ -991,6 +993,10 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
>  		if (!geth_freeq_alloc_map_page(geth, pn))
>  			goto err_freeq_alloc;
>  
> +	/* Match the software pointer to the retained hardware pointer. */
> +	rptr = GET_RPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG);
> +	SET_WPTR(geth->base + GLOBAL_SWFQ_RWPTR_REG, rptr & (len - 1));
> +

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but the
premise here seems to apply to the per-port SW TX queue too. gemini.h
describes the SW TX queues as the same TOE DMA queue type as the SW
free queue.

gmac_setup_txqs() copies the retained hardware read pointer into the
write pointer and cptr without masking it to the new txq_order:

drivers/net/ethernet/cortina/gemini.c:gmac_setup_txqs() {
    ...
		r = readw(rwptr_reg);
		rwptr_reg += 2;
		writew(r, rwptr_reg);
		rwptr_reg += 2;
		txq->cptr = r;
    ...
}

gmac_set_ringparam() lets the user shrink txq_order while the interface
is down. After the next gmac_open(), the ring and skb_tab hold only
1 << txq_order entries, but r can still be any value from the old,
larger ring.

On the first transmit, gmac_map_tx_bufs() uses the raw w before its
first mask:

drivers/net/ethernet/cortina/gemini.c:gmac_map_tx_bufs() {
    ...
		if (frag == last_frag) {
			word3 |= EOF_BIT;
			txq->skb[w] = skb;
		}
    ...
		txd = txq->ring + w;
		txd->word0.bits32 = buflen;
    ...
		w++;
		w &= m;
    ...
}

Can this write past the kzalloc'd skb_tab and past the coherent
descriptor ring?

gmac_clean_txq() has the same pattern with the unmasked cptr:

	while (c != r) {
		txd = txq->ring + c;
		...
		if (word3 & EOF_BIT)
			dev_kfree_skb(txq->skb[c]);

		c++;
		c &= m;

One possible trigger is ethtool -G <if> tx 64 while the port is down,
after the TX rptr has moved past 64 at the default order of 8. Bringing
the interface up and sending a packet would then hit this path.

The RX default queue may have a similar problem. gmac_setup_rxq() still
treats writel(0, port->rxq_rwptr) as a pointer reset. The testing
described in this commit shows that a 32-bit zero write does not clear
the hardware-owned half. gmac_rx() also compares the masked software r
with the unmasked hardware w:

	r = rw.bits.rptr;
	w = rw.bits.wptr;

	while (budget && consumed < desc_limit && w != r) {

If the retained w is >= 1 << rxq_order, could r never reach it? Could
the hardware also DMA RX descriptors past the new rxq_ring?

Were the TX and RX default queues considered along with the free queue?

>  	filled = geth_fill_freeq(geth, false);
>  	if (!filled)
>  		goto err_freeq_alloc;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org

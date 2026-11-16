Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840347;
	b=oPOZTytkgkW6Wa4dIEEAjRNefVP5OtQJBKf+CgrZTE/ZdQZH6m1Lr6QDLSkfBqmA7oQc
	 En5VY2OOuoW/zAw+YssyWB8cTahl0drKIL85VKqWU3Sg//WC510nTGOgdnNnJ5PRW9jZw
	 eRxU0wm/DPtSXAEM2685MpQBWBB6n4/DkIn+jQgNvBB/ymasa7yHpSwlQ8rp/z+jBoF2e
	 ySgF+Sw51kHNROC+m+IsrtUt51oYtfZbMWgBguTKtxqkp+8TeSPLuuENBxxfDijXw3kcM
	 RAfay2kHwXkNv96Gjqq6Y0O7r/rI1wpNhIN9JnBFQjUEOtkovmfeuRvteEtYZHrz81Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840347;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wlQrgMDchbW+yo7SUHlvYilxgMFSkK/xZHB6l4m4/sY=;
	b=O/2nX0uRsB1bTeheVw+dRrT7Mwdn6YgsUrarSP0JHtjaxUTbXV21B7Ca8l40PsIgWEqT
	 dmDnqeth+LwkTiU8mFNpFBvhHMCb+rx6u86/33GMPrsLkUIcGVFocTREB9cRZrKcAdMP5
	 8xFlAIUUu3iQFgEr7BFKTFtp+fTpEpCSD5MzGUXZ6ClFB/DoegiSNPyxUGPumF4Dv8wEj
	 ntUiH1Q54EnEbMVAXCgoh4e1PmbbyRAwOj2YwwMQuggCMyKPgwBWL74miOHwfPqCoQYdG
	 ymYfyF/joydJ5zz5OtOOQRbvtcw/EDr7fDsHgjw0TgGEk3KxWXoBC6dLVshYj3cPjkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orUNkdPv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB397606A335
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orUNkdPv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FE81F000C4;
	Mon, 16 Nov 2026 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840346;
	bh=wlQrgMDchbW+yo7SUHlvYilxgMFSkK/xZHB6l4m4/sY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=orUNkdPvBoWZMBx4ha7w1OTGJa4SpwwrNHcqXxOwaTbsgo//G44LaQq2rxpXDL5K9
	 RX7NrMa68TM64RDbQ4AXd1gPfycjRLwPXqPfBgPTJQnwDYSH4AZPknYKwRZz0Mg4Pk
	 4OZw1LTUqOvzMeK43BFY6ewutLTfS+1fad87NjQYc1lYtnJZ1etUgVdeRrBqgCrZOz
	 NOp8Mg6ss3z7DoOJZcYScFo6KlcQGoyHmiHrYnQgDCBjKizOyo0Eydu7nxAg3tVI2h
	 o0fFRg6Qh15McaIjYXUOV93666TWE3CRvVjuFc0rcbBaHPOWE7q9Ulj0wQ3aMxE/S3
	 JQkZAcD7K7uPQ==
Subject: Re: [PATCH net-next v8 06/19] net: ethernet: cortina: Index free
 queue fragments with XArray
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:45 +0000
Message-ID: <179484034552.3136.9115305674551947540@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-6-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-6-f55bd43e02d3@kernel.org>
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

- [Low] In geth_freeq_alloc_map_page()
  (drivers/net/ethernet/cortina/gemini.c), the patch adds one…
- [Low] geth_setup_freeq() (drivers/net/ethernet/cortina/gemini.c) now
  wraps every geth_freeq_alloc_map_page() call in…

--

net: ethernet: cortina: Index free queue fragments with XArray

This commit replaces the linear scan in geth_freeq_lookup() with an XArray
that indexes each free queue fragment by its DMA address in fragment units.
Index entries are inserted and erased in geth_freeq_alloc_map_page() under
freeq_lock, and geth_setup_freeq() now takes freeq_lock around each page
allocation.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index b96325f652bba..4ee630a9f5897 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -888,9 +898,26 @@ static struct page *geth_freeq_alloc_map_page(struct gemini_ethernet *geth,
>  	 */
>  	frag_len = 1 << geth->freeq_frag_order; /* Usually 2048 */
>  	fpp_order = PAGE_SHIFT - geth->freeq_frag_order;
> +	fragments = 1 << fpp_order;
> +
>  	gpage = &geth->freeq_pages[pn];
> -	if (gpage->page)
> +	for (i = 0; i < fragments; i++) {
> +		mapping = page_mapping + i * frag_len;
> +		ret = xa_insert(&geth->freeq_mappings,
> +				geth_freeq_mapping_index(geth, mapping),
> +				gpage, GFP_ATOMIC);
> +		if (ret)
> +			goto err_mappings;
> +	}

[Severity: Low]
Should the commit message mention what this xa_insert() costs?

The commit message describes the change only as removing an inefficient
linear scan. However, geth_freeq_alloc_map_page() now does GFP_ATOMIC
xa_node allocations on both the NAPI refill path and the setup path:

gmac_napi_poll()
  geth_fill_freeq(geth, true)
    geth_freeq_alloc_map_page()
      xa_insert(..., GFP_ATOMIC)

That works out to roughly one leaf node per 128 KiB of physical address
range touched (64 slots of 2 KiB each).

There is also a new way for this function to fail. If only the index
allocation fails, err_mappings unmaps and frees a page that was allocated
and DMA mapped successfully. geth_fill_freeq() then stops refilling, and
geth_setup_freeq() fails open or resize with -ENOMEM.

The unwind looks correct, and the failure is handled the same way as an
alloc_page(GFP_ATOMIC) failure. So the concern is the commit message, not
the runtime behaviour.

Could the commit message describe the extra atomic allocations and the new
failure mode? The same GFP_ATOMIC xa_insert() is still in
geth_freeq_post_page() at the end of the series.

[ ... ]

> @@ -995,16 +1035,20 @@ static int geth_setup_freeq(struct gemini_ethernet *geth)
>  		goto err_freeq;
>  	}
>  
> -	/* Allocate a mapping to page look-up index */
> +	/* Allocate page metadata referenced by the mapping index */
>  	geth->freeq_pages = kzalloc_objs(*geth->freeq_pages, pages);
>  	if (!geth->freeq_pages)
>  		goto err_freeq;
>  	geth->num_freeq_pages = pages;
>  
>  	dev_info(geth->dev, "allocate %d pages for queue\n", pages);
> -	for (pn = 0; pn < pages; pn++)
> -		if (!geth_freeq_alloc_map_page(geth, pn))
> +	for (pn = 0; pn < pages; pn++) {
> +		spin_lock_irqsave(&geth->freeq_lock, flags);
> +		page = geth_freeq_alloc_map_page(geth, pn);
> +		spin_unlock_irqrestore(&geth->freeq_lock, flags);
> +		if (!page)
>  			goto err_freeq_alloc;
> +	}

[Severity: Low]
Does holding freeq_lock here mean the setup path builds the whole index
from atomic reserves?

geth_setup_freeq() is reached from geth_resize_freeq() in sleepable process
context under RTNL (ndo_open or ethtool -G). With freeq_lock held and IRQs
off, every xa_insert() in geth_freeq_alloc_map_page() has to use GFP_ATOMIC
and cannot do direct reclaim:

geth_resize_freeq()
  geth_setup_freeq()
    spin_lock_irqsave(&geth->freeq_lock, flags)
    geth_freeq_alloc_map_page()
      xa_insert(..., GFP_ATOMIC)

A large ring (up to 2^15 entries, about 16K pages) needs a burst of these
node allocations. Under memory pressure, that makes open or ring resize
more likely to fail with -ENOMEM.

The effect is small, because the RX pages were already allocated with
alloc_page(GFP_ATOMIC) before this patch. The same pattern is still there
at the end of the series via
geth_setup_freeq()->geth_fill_freeq()->geth_freeq_post_page().

On the setup path, could the index entries be reserved with GFP_KERNEL
before taking the lock (for example with xa_reserve())? Alternatively,
could a gfp argument be passed down so that setup can use sleeping
allocations?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org

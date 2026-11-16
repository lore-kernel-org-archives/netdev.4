Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840348;
	b=l7nh2KEhVTPtQyWYW7chuUpxAgB3S9AJyXhx9jSreNMSv10duVhHLsHsWcJSo2n3mGJL
	 NNhvG3Rcwhta0BKzxTwIKpaXW7AmmivAO+2VdP1Lespawc8BSP5EXauijo+uoLD27xsBd
	 nCYBEIpyIirgV/T4ETXkMgIk9vEjcF9pAcWQUsEVxsWWPDi1cp37p8CQAwbEpzYLuJA6B
	 JVZeQIbu91bBbEXFH0whKoTkOQfqPN9AzDmFsprWEqgjXd6snbS1dFNCPpAYjFzD5U6pf
	 zWNIsDz3j0+13yLxtiNhR0pOJYnNGm1mkkpmXtyC90OMzOWt79vICeMA2T9CMwzJLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840348;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AnbpXCmtxf3xCpEWG3l0yg+vKtFTZzAHA2DBPYL2KZ8=;
	b=nfgQHB3AoTO7IIxH5LdTOh9dtsl1tvpyHOl1dzo+HkKtCryTIwvEzKgFzG14VX7T9k3H
	 3cOxL1C1IRWV3wDQGnGSpeXBq7U9grsn4KboHWPbba61emT+4ONuay4s9grWFXcJxglUK
	 nMVs4MxFmD/kYoOjxzq3SGkabPPGPztg2E2EhNCtuYYb4ysS7goNZq7pjBh1GoGHUrCAo
	 K0PA3ULY4PsiXjAWzcqCkVEKmIAiqGPSTDlNnEFNsP01EFAbQCtxp71zq4W52C7yU25WX
	 5oGKN4V6gil9CE8hC5SZDlhC5WMY+ostT5dYSFYnCSFQbe1NK3NCvzhQvr4g1yjdoHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbwKfZqU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAAD606A33A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbwKfZqU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8A71F000C5;
	Mon, 16 Nov 2026 14:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840347;
	bh=AnbpXCmtxf3xCpEWG3l0yg+vKtFTZzAHA2DBPYL2KZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bbwKfZqU/23GeXKlFYfFHtjUkr8spfNdYzG84E8o9OzIJPgaYYvL/W4TYJHpk79K4
	 o0OX4EDK1hIAi4Z1vyILj3eVEu/5VcfqwJj/5igr1VFKFAsFRSFhXEyCjMCPPIwQyR
	 zNRcMrg7Ti1cxNMy9QKr5PoBb3OepGmoEK9leoHQWjFKu5NWFMWiVMhFN4DbUCczQz
	 8opMiQTZUMspta1MJYlnrChop3CQxQbNgs8/9WtSogcV6kvPlGTkDsSS6RO+30T4xr
	 +8hpyMIxn55BNg3tLu/vmY9mYH7OxuOMN0tM0058Q07md4x3vSxuc02ITIYQv/mDKl
	 UPbYy7+abQVNg==
Subject: Re: [PATCH net-next v8 07/19] net: ethernet: cortina: Preserve
 in-flight free queue pages
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:46 +0000
Message-ID: <179484034674.3136.17017391064607605132@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-7-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-7-f55bd43e02d3@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch replaces position-indexed free queue metadata with
  a fixed pool of page slots.

--

net: ethernet: cortina: Preserve in-flight free queue pages

Free queue page metadata is no longer indexed by free queue ring position.
Metadata slots now come from a pool tracked by a bitmap, sized for the
free queue plus both RX rings. Each posted fragment keeps its own page
reference and XArray entry until it is claimed. The page is unmapped and
its slot released once all of its fragments have been claimed. The shared
queue is only rebuilt while the peer port is down.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 4ee630a9f5897..4b0c10d732ab5 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

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
With the new slot pool, this block in geth_freeq_claim() is the only
runtime path that releases a slot, its page and its DMA mapping. It only
runs once every fragment of the page has been claimed.

What happens to a fragment that the hardware takes from the free queue
but never returns as a usable RX descriptor?

gmac_rx() has two paths that drop the descriptor without claiming
anything:

	if (!mapping) {
		if (net_ratelimit())
			netdev_err(netdev,
				   "rxq[%u]: HW BUG: zero DMA desc\n",
				   r);
		goto err_drop;
	}

	page = geth_freeq_claim(geth, mapping, &page_offs);
	if (!page) {
		dev_err_ratelimited(geth->dev,
				    "could not find mapping\n");
		goto err_drop;
	}

gmac_cleanup_rxq() also skips zero mappings. In these cases
gpage->fragments never reaches zero. The page, its streaming mapping and
its bit in freeq_page_bitmap then stay held until geth_cleanup_freeq().

The commit message acknowledges such fragments exist: "This does not
reclaim unclaimed fragments while the peer runs." Also,
geth_resize_freeq() only rebuilds when the peer is down:

	if (other_running)
		return -EBUSY;

The pool from geth_freeq_page_slots() has very little headroom. With the
defaults it is 1024 + 512 + 512 = 2048 slots. The legitimate in-flight
worst case is roughly len/2 - 1 free queue pages plus
(1 << rxq_order) - 1 per RX ring, which leaves about 3 spare slots.

As lost fragments build up, geth_freeq_alloc_slot() will start
returning -ENOSPC. geth_fill_freeq() then stops at the first failed
geth_freeq_add_page() call. Could this first limit refill during RX
bursts and eventually starve RX altogether?

On a dual-port setup with both interfaces kept up, it looks like the
only recovery is to take both interfaces down. The old design
overwrote metadata by queue position, so a lost fragment could not
reduce refill capacity.

The later patches in the series don't seem to change this. "Recycle
claimed free queue pages" only recycles slots whose fragments have all
been claimed. "Separate RX buffer capacity from free queue size" keeps
the same sizing scheme. At the end of the series, gmac_rx() still drops
zero and unknown mappings without claiming them.

Would it make sense to reclaim these fragments some other way, or to
size the pool with more headroom?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org

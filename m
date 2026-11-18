Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007295;
	b=mXDCL4siCo7s/zt9Ovgc7fCHBC2oplyOp6BBxkLVKWBfbgkN6IGrvgdzuaaGshnDFBKb
	 VcruhAt7tF/kkFmboYxwqV8C6QrgLziB4x1/q71+qE02JGCeDzdwblAgfKETUzugMzNXi
	 JgkcuxfDlFyO8HzvmDRxoPwpqzen/CStXXKRIiCZG5G43x14NVvuE8CjY51UEJ8xbkrI0
	 8U2n6+6B9r82dVNFYTcJPrz7/5d1V9VPeWM8IUa00uDxmNygM/5MIMz8OS78LYGnJmdkP
	 qa3CUQ8CQtOywsYPMNGW82HOzE4LUOFjgdEiBPp8FJlFS4aHUthEV5ba/cnEPIrIcpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007295;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XMxBAZKoUf1ggN391IrkLkELtekiqNvhy4TKd5GOQWo=;
	b=PRJNtYwzqmBx9kRwkihc9XPV1KDK2sd+BQ2JVvX8lqIWhof4y9nPYepSkA4fjMuS0RuP
	 8LDRJ5Qn0SwRBqR/LR0PrAb0AQ5czJyXB8UNn+KQ9Lan30aQa8338+OIb5B3jOWJt15qw
	 LkG7bBhQM6fgRPN/MmgV6QO4si3S4pZE065ff1Ql/eyjT6lg9A+cWKQijZFgnXFRli6D6
	 x6/cyQMrQf5zxO7aPooZW1Ls80eJZ4ZZHeeFgvEwlmh7WKdV1cNYcpGlCSgS013Gpw0Ta
	 /SbYmyCgrkuStf0XuXI1ZPtdszX6+0iBfS7YgMYbq77DNRtZzmowcVYEXJAcVVX1pbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jb4Arz6B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A85B606A31C;
	Wed, 18 Nov 2026 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jb4Arz6B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9147E1F000C5;
	Wed, 18 Nov 2026 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007295;
	bh=XMxBAZKoUf1ggN391IrkLkELtekiqNvhy4TKd5GOQWo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jb4Arz6B3rLViZPvjRIi1bycg63lG6DfOTljVPW4v0Yr0robamxuxunHi9l5xzoX8
	 d5YPJphrHKTsnjuTIxnooUZ1HdK5QP+8fuemkr8DYsHIIYlstVA+q07c17n5EHOYCv
	 hFOvYsoncXtOXDq0zRFpjwzHuobUP8WrvaC5EnloiK7oWhS5slTNbKZb0SL9GDENVa
	 PQX+/7wG5lkRx5vpYUE5mzPxpwJ52veqmroJ3rGXmZHM2AR/1ZDt7sVUTPYtsLejoM
	 QbGzJQvQCidQhNGQRRS27fnBNTaqnhYHq1mM0bwQfBroQKjOWPUlRi+K6HgHRd3TVb
	 IMBT5U7F9BxRg==
Subject: Re: [PATCH net-next] net: lan966x: free the RX pages when the TX
 allocation fails
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 13:08:14 +0000
Message-ID: <179500729408.3136.14303184286284983260@kernel.org>
In-Reply-To: <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
References: <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (2) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] lan966x_fdma_rx_alloc() ignores the return value of
  fdma_dcbs_init() (line 137).
- [Low] Missing Fixes:/Cc: stable tags.

Pre-existing issues:
- [High] NULL pointer dereference in the open-coded page-return loop of
  lan966x_fdma_reload().
- [High] The new `if (rx->page[i][j])` check in
  lan966x_fdma_rx_free_pages() assumes a slot without a page is NULL.

--

net: lan966x: free the RX pages when the TX allocation fails

When lan966x_fdma_tx_alloc() fails in lan966x_fdma_init(), this patch
returns the RX pages to the page pool before the pool is destroyed, so
the pool can finish shutting down. It also makes
lan966x_fdma_rx_free_pages() skip empty entries, because
lan966x_fdma_rx_alloc() does not check that every DCB got its pages.

> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> index 1fbe910c5ec38..586ee648c7741 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> @@ -54,9 +54,11 @@ static void lan966x_fdma_rx_free_pages(struct lan966x_rx *rx)
>  	int i, j;
>  
>  	for (i = 0; i < fdma->n_dcbs; ++i) {
> -		for (j = 0; j < fdma->n_dbs; ++j)
> -			page_pool_put_full_page(rx->page_pool,
> -						rx->page[i][j], false);
> +		for (j = 0; j < fdma->n_dbs; ++j) {
> +			if (rx->page[i][j])

[Severity: Medium]
The commit message says "lan966x_fdma_rx_alloc() does not check that
every DCB got its pages, so skip the entries that are still empty".

Instead of treating a partly filled ring as normal here, would it be
better to check the return value of fdma_dcbs_init() in
lan966x_fdma_rx_alloc() and unwind?

lan966x_fdma_rx_alloc() {
    ...
	fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
		       FDMA_DCB_STATUS_INTR);

	lan966x_fdma_llp_configure(lan966x, fdma->dma, fdma->channel_id);

	return 0;
}

Say page_pool_dev_alloc_pages() fails in lan966x_fdma_rx_dataptr_cb()
at DCB k. Then __fdma_dcb_add() returns before it links prev->nextptr.
DCB k-1 keeps FDMA_DCB_INVALID_DATA as its next pointer, and DCB k and
the ones after it are never linked into the chain. Even so,
lan966x_fdma_rx_alloc() still returns 0.

lan966x_fdma_init() and lan966x_fdma_reload() then call
lan966x_fdma_rx_start() on the short chain. When NAPI has consumed DCBs
0..k-1, fdma_dcb_advance() moves dcb_index to k. From then on,
fdma_has_frames() in lan966x_fdma_napi_poll() polls a DCB that the
hardware never completes.

Can CPU RX stall permanently this way?

The PCI variant, lan966x_fdma_pci_rx_alloc(), already checks this call:

	err = fdma_dcbs_init(fdma,
			     FDMA_DCB_INFO_DATAL(fdma->db_size - XDP_PACKET_HEADROOM),
			     FDMA_DCB_STATUS_INTR);
	if (err) {
		fdma_free_coherent_and_unmap(lan966x->dma_dev, fdma);
		return err;
	}

lan969x_fdma_rx_alloc() in sparx5 has the same unchecked call, and
lan969x_fdma_free_pages() has no NULL guard.

> +				page_pool_put_full_page(rx->page_pool,
> +							rx->page[i][j], false);

[Severity: High]
This is a pre-existing issue, but does the NULL check catch every slot
that no longer owns a page?

lan966x_fdma_rx_dataptr_cb() is the only writer of rx->page[dcb][db].
It does not clear the slot on -ENOMEM. Nothing else sets a slot back to
NULL after its page has been handed off. That means a slot is only
guaranteed to be NULL on the first init, when struct lan966x has just
been zeroed.

In lan966x_fdma_napi_poll(), lan966x_fdma_rx_get_frame() hands the page
to an skb, or lan966x_fdma_rx_free_page() recycles it, but the slot
keeps the pointer either way. The refill then ignores failure:

	fdma_dcb_add(fdma, old_dcb, FDMA_DCB_INFO_DATAL(fdma->db_size),
		     FDMA_DCB_STATUS_INTR);

In lan966x_fdma_reload(), lan966x_fdma_rx_alloc() refills rx->page
without clearing it first. After a partial fill, the slots that were
not refilled still point at pages from the old pool. Those pages are
then returned to the old pool and freed by page_pool_destroy(page_pool).

Later, lan966x_fdma_deinit()->lan966x_fdma_rx_free_pages() or the next
reload puts these stale pointers into the current rx->page_pool.

Could that put a page twice while an skb still owns it, or put an
already freed page into a different pool?

Would it help to clear the slot whenever its page is given away, and
also check the return value of fdma_dcbs_init()?

> +		}
>  	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but if NULL slots are
expected here, what about the open-coded copy of this loop in
lan966x_fdma_reload()?

lan966x_fdma_reload() {
    ...
	for (i = 0; i < fdma_rx_old.n_dcbs; ++i)
		for (j = 0; j < fdma_rx_old.n_dbs; ++j)
			page_pool_put_full_page(page_pool,
						old_pages[i][j], false);
    ...
}

If the first fdma_dcbs_init() at probe stops partway, the rx->page[]
entries from DCB k onward stay NULL, and lan966x_fdma_rx_alloc() still
returns 0.

A later MTU change through lan966x_fdma_change_mtu(), or an XDP setup
through lan966x_fdma_reload_page_pool(), reaches lan966x_fdma_reload().
That function kmemdup()s those NULL entries into old_pages.

Once the new lan966x_fdma_rx_alloc() succeeds, this loop passes NULL to
page_pool_put_full_page(). That leads to page_pool_unref_netmem(), which
reads the pp_ref_count of a NULL netmem. Can this oops?

> @@ -999,6 +1001,7 @@ int lan966x_fdma_init(struct lan966x *lan966x)
>  
>  	err = lan966x_fdma_tx_alloc(&lan966x->tx);
>  	if (err) {
> +		lan966x_fdma_rx_free_pages(&lan966x->rx);
>  		fdma_free_coherent(lan966x->dma_dev, &lan966x->rx.fdma);
>  		page_pool_destroy(lan966x->rx.page_pool);
>  		return err;

[Severity: Low]
Should this patch have a Fixes: tag and go to net with Cc: stable?

The page_pool_destroy() call on this error path was added by commit
076344a6ad9d ("net: lan966x: fix page pool leak in error paths"), which
is tagged Cc: stable. Since that commit, the pool is destroyed while the
RX pages are still in flight. That causes the page_pool_release_retry()
warning described in this commit message.

Something like:

Fixes: 076344a6ad9d ("net: lan966x: fix page pool leak in error paths")

Without the tag, stable trees that picked up 076344a6ad9d would keep
the warning.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650%40microchip.com

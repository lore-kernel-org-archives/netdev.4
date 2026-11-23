Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445895;
	b=i7nkgaaS8w6z1hG2xAfCZ31uQrKtD6RH38jRcrtO3tmdRph/XlyjskLU3HLjoDJJK9Wy
	 xgCYSzoRXBkOb+gm3FAx7a78w7Vtm3jaacdwMZSglc+XoOf6xxHA7SB6H2Qs/XJ92fbo2
	 9SYTV43CyUV6QymP3IMjV6PSwwBfC783wuS0OHY2khM80nibfMjq9ADG9p+WwDqVR+Rak
	 yrHN6+yu2jSZsyQWwa3iPWt4AGDsfYrITT3FLqQ4tzxq0nZNaUpLQjjTlYIa/2lGli/3F
	 b823F/UfFth7FNysjqbpT7Ogux/RLyy5JF/TaucDRCHoGmOtqqlweXMyKrRHQmhQV/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445895;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HMmjXeMPQ8NoGyi7cC7ZfPNwAmV9uJzoqsVh8SYhAco=;
	b=2ukkP2It1s+PozLyQ/uj+IGBRh2JmXc997Nq90GC4qv1gqvrjoihQKUcK4rCcweuU/Pw
	 mKAbs6CWSKq6RECOC8ali0HtvOd9u2KFkxXEGSKZoe5KRf6JadH9E8/UVd4bOfZ/fQEp3
	 TJBSTJ3lRxUg9c2WPDwycxdI0VWc3tOaJh14xWAfO4wVej6a6dLYrMSHJm8BTLYuAf+NL
	 fyCt2iS5e6GuqfCxYxVUDTJ0oPp93J+5KgTluFucjYVmbzVbkhJ9aJEuILKRTYmih2iN5
	 tQbBLJMub9GWQRQWvuDpqcfmLinSxptUu6xE+mRNRfJaMwbdhLwDAuUf+BH2cZFhibQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NX257dQD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED1606A335;
	Mon, 23 Nov 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NX257dQD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399721F000D3;
	Mon, 23 Nov 2026 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445895;
	bh=HMmjXeMPQ8NoGyi7cC7ZfPNwAmV9uJzoqsVh8SYhAco=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NX257dQDo7S8YlbUvGtPPXkO3nxSyJKNgG27zpETTsTc2RtEFkNZtT5VIV6J/Gr+S
	 rAc1DLYd9R/COPceZJlWtxO0qBgvfqSOiMK3CGhLTvXUE1AsKogSuQlPE5YQ4plYHh
	 s78R6x6tvzdGPsC6gJsYOsf5+KO/jKYwSH8GBy8BXPWUhLfO0tvgIBR6tjuHmICsNe
	 fBxYKporivu9S7zda8RdUWfphsPv2voeEv8v0mDZHf8ozMc7ZegNCZrLb1dJHD/2OI
	 F7UPVyu3jVQRCT4eBnDNKo7lTDDVDJYAdoAnzXAnrpPfi1LwT2a7xNHoqTpwVjTdlW
	 rFVWP8XsI8sQQ==
Subject: Re: [PATCH net-next v3 2/9] net: sparx5/lan969x: free the FDMA
 buffers on init errors and deinit
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:13 +0000
Message-ID: <179544589378.3135.12983025959243801234@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-2-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-2-55c272fe1acc@microchip.com>
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

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] At this commit, lan969x_fdma_rx_get_frame()
  (drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c) reads…
- [Low] This patch fixes several real bugs but has no Fixes: tag: -
  Sparx5 RX skbs leak on every deinit, and the RX DCBs leak when TX…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but both NAPI
  pollers ignore fdma_dcb_add() failures when re-arming consumed RX…

--

net: sparx5/lan969x: free the FDMA buffers on init errors and deinit

This patch adds sparx5_fdma_rx_free(), lan969x_fdma_rx_free() and
lan969x_fdma_tx_free(), and calls them on the init error paths and on
deinit, so the RX skbs/pages, page_pool, DCBs and in-flight TX buffers
are released. It also checks the fdma_dcbs_init() return value for RX.
It stores the mapped TX length in struct sparx5_tx_buf instead of reading
it from the skb.

> diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> index fd532c89f9110..5f96910df5383 100644
> --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> @@ -67,13 +67,13 @@ static void lan969x_fdma_tx_clear_buf(struct sparx5 *sparx5, int weight)
>  		if (!fdma_db_is_done(fdma_db_get(fdma, i, 0)))
>  			continue;
>
> -		db->dev->stats.tx_bytes += db->skb->len;
> +		db->dev->stats.tx_bytes += db->len;
>  		db->dev->stats.tx_packets++;
>  		sparx5->tx.packets++;
>
>  		dma_unmap_single(sparx5->dev,
>  				 db->dma_addr,
> -				 db->skb->len,
> +				 db->len,
>  				 DMA_TO_DEVICE);

[Severity: Low]
Should this patch carry Fixes: tags?

Before this change, lan969x_fdma_tx_clear_buf() read db->skb->len for
two-step PTP skbs in the normal TX completion path. Those skbs stay on
port->tx_skbs, and lan969x_ptp_irq_handler() can free them before NAPI
reaps the TX descriptor:

lan969x_ptp_irq_handler() {
    ...
			__skb_unlink(skb, &port->tx_skbs);
			skb_match = skb;
    ...
		dev_kfree_skb_any(skb_match);
    ...
}

The PTP timeout purge can free them the same way. That makes the old read
a use-after-free, and dma_unmap_single() could be given the wrong size.

The commit message explains the switch to db->len. It doesn't say that
this fixes a use-after-free at runtime, and the subject only mentions init
errors and deinit.

The other fixes here also have no Fixes: reference:

- the Sparx5 RX skb leak on deinit
- the lan969x page_pool, TX DCB, tx->dbs and in-flight skb leaks
- the put of never-allocated pages after a partial RX fill

Without the tags, stable trees that ship lan969x FDMA probably won't pick
up the use-after-free fix. Would it make sense to split the lan969x and
Sparx5 fixes, since they go back to different commits, and tag each one?

> @@ -90,12 +90,26 @@ static void lan969x_fdma_free_pages(struct sparx5_rx *rx)
>  	struct fdma *fdma = &rx->fdma;
>
>  	for (int i = 0; i < fdma->n_dcbs; ++i) {
> -		for (int j = 0; j < fdma->n_dbs; ++j)
> +		for (int j = 0; j < fdma->n_dbs; ++j) {
> +			if (!rx->page[i][j])
> +				continue;
> +
>  			page_pool_put_full_page(rx->page_pool,
>  						rx->page[i][j], false);
> +			rx->page[i][j] = NULL;
> +		}
>  	}
>  }

[Severity: Medium]
Can this still put a page the driver no longer owns?

At this commit, lan969x_fdma_rx_get_frame() reads the slot but never
clears it:

lan969x_fdma_rx_get_frame() {
    ...
	page = rx->page[fdma->dcb_index][fdma->db_index];

	sparx5_ifh_parse(sparx5, page_address(page), &fi);
    ...
}

The page then goes to the stack through build_skb() and
skb_mark_for_recycle(), or back to the pool through
page_pool_recycle_direct().

The slot is only overwritten when lan969x_fdma_rx_dataptr_cb() succeeds:

	page = page_pool_dev_alloc_pages(rx->page_pool);
	if (unlikely(!page))
		return -ENOMEM;

	rx->page[dcb][db] = page;

lan969x_fdma_napi_poll() ignores the fdma_dcb_add() return value during
refill. So if that allocation fails, the slot keeps pointing at the
consumed page.

On teardown, lan969x_fdma_deinit()->lan969x_fdma_rx_free()->
lan969x_fdma_free_pages() sees a non-NULL slot, and the new NULL check
doesn't skip it. Wouldn't page_pool_put_full_page() then put that page a
second time?

The Sparx5 half of this patch clears rx->skb[][] in
sparx5_fdma_rx_get_frame(), but lan969x gets no matching change. The NULL
check therefore can't tell owned slots from stale ones.

This looks to be fixed later in the series by "net: sparx5/lan969x: add
support for resizing the FDMA buffers". That patch adds
rx->page[fdma->dcb_index][fdma->db_index] = NULL in
lan969x_fdma_rx_get_frame(). Could that change move into this patch so
the commit works on its own?

[ ... ]

> @@ -172,14 +186,18 @@ static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5)
>  		return PTR_ERR(rx->page_pool);
>
>  	err = fdma_alloc_coherent(sparx5->dev, fdma);
> -	if (err)
> +	if (err) {
> +		page_pool_destroy(rx->page_pool);
>  		return err;
> +	}
>
> -	fdma_dcbs_init(fdma,
> -		       FDMA_DCB_INFO_DATAL(fdma->db_size),
> -		       FDMA_DCB_STATUS_INTR);
> +	err = fdma_dcbs_init(fdma,
> +			     FDMA_DCB_INFO_DATAL(fdma->db_size),
> +			     FDMA_DCB_STATUS_INTR);
> +	if (err)
> +		lan969x_fdma_rx_free(sparx5);
>
> -	return 0;
> +	return err;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but the same RX buffer
allocation failure is now handled at init and is still ignored at runtime.
Can RX stall for good when the NAPI refill fails?

Both pollers ignore the fdma_dcb_add() return value when they re-arm
consumed RX DCBs:

lan969x_fdma_napi_poll() {
    ...
		fdma_dcb_add(fdma,
			     old_dcb,
			     FDMA_DCB_INFO_DATAL(fdma->db_size),
			     FDMA_DCB_STATUS_INTR);
    ...
}

sparx5_fdma_napi_callback() {
    ...
		fdma_dcb_add(fdma, fdma->dcb_index,
			     FDMA_DCB_INFO_DATAL(fdma->db_size),
			     FDMA_DCB_STATUS_INTR);
    ...
}

In fdma_api.c, __fdma_db_add() writes the status, with DONE cleared,
before it calls the dataptr callback:

	db->status = cpu_to_le64(status);

	err = cb(fdma, dcb_idx, db_idx, &dataptr);
	if (unlikely(err))
		return err;

The callback can fail in two places:

- __netdev_alloc_skb(..., GFP_ATOMIC) in sparx5_fdma_rx_dataptr_cb()
- page_pool_dev_alloc_pages() in lan969x_fdma_rx_dataptr_cb()

When it fails, __fdma_dcb_add() returns early. dcb->nextptr/info are not
written, the previous DCB is not linked to it, and fdma->last_dcb stays
the same. The next successful refill links last_dcb to the following DCB,
so the hardware chain skips the failed one.

The software index fdma->dcb_index still walks the ring in order. Once it
wraps to the failed DCB, db 0 has DONE clear and the hardware never fills
it. After that, fdma_has_frames() (lan969x) and fdma_db_is_done() in
sparx5_fdma_rx_get_frame() return false on every poll.

Wouldn't FDMA extraction to the CPU then stop until the driver is
reloaded? This is still the case at the end of the series.

Generated by Claude Code Patch Reviewer

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

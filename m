Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795377695;
	b=hmNNP6NcZcfkArjizDArrAdXlv9E8MvRI3LpznImnHrRM8u7yzcbWc3Ste8m+UQlitDw
	 qdsVpAl2KssI6Y47UKduiaak0l717RIgUKe6H7sjlTAAlLe5sTDp4zwKem55stlY/fi5U
	 IucShwASzl+D7oRoDSO0DzH5Huv5vzz3nNjyW3tygGIIU05mkkF8zo3upGJ83CwLCKay3
	 OLD3/IyB+vAJSJST27kjFpsNFw/mS2PH7jUQleDuicTQIF3iuAl+WPIrqf6t9Kca4GPTv
	 EtQegu4A2ha01d+ZHKEopTcxd4jTWlVMdpkVWNEVLOZ+MCCBK5vtdn/7nHmpBb+pewQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377695;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gU5RHCu+hcTZQvQ0meagwlFAHELPvEe/fPoQ7O8LQ0g=;
	b=m7GMWo+aJ4qYO/B67hlMqacRq2aDDPYTkHrkqBE2Y3wwjxtohyLL1lrItJlp7VdVa74/
	 qEUWB3bNqhyJ8WXZEI2+P0imWLwQC0pGlfIR63EkcmmKDqgBvI4kmQKJcjP1L7goy0TRq
	 DxE5W/LIz8cMog6PyhjUYTDvQemaWkl8fbdftV88mAxl+8RsHrGQBa2G7a5NjukHMsh2R
	 oH/OTrwPOd99+Nmr9+otgC6OoJSCWo4OrQPk+vAojAq5d75WaxXMhz3V/WUKfsq6LOR6W
	 TGMItb7JWD6lwWlKwLz0yb4Eus3YbmxgQsp4gcQ0G+HsrKsdxmp5KizYE9N/DOYi5sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0hEkWXK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF8606A33F;
	Sun, 22 Nov 2026 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k0hEkWXK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8D61F0093C;
	Sun, 22 Nov 2026 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795377694;
	bh=gU5RHCu+hcTZQvQ0meagwlFAHELPvEe/fPoQ7O8LQ0g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k0hEkWXKIq0D1+75dk4hVtio5bah0vV+VCXAos+Cpk5z4XSVsh6yZhuJAnDHXv/ag
	 wNVp5vMtcXnB4tzzsCZnbGWcioQObQyZFptepTKQPesU6VJ2IhdFgDyxnIZexWJQnb
	 p9f6RbBIwqMSwNqNCn9pB2eJvdIq4Rman3UGWoaiO8uBdQu4JkKjH8o9NKQpLe4LrU
	 1RloE6uY7pm556H1TnlYQLTYsj+n2e3/C1XJeian8lMOOfVjXGeC6ayBsDmb0d1624
	 4XU/RhiLxuo8w/GWmhlvx0S0XXtcAeEO0dOy5s4Rh0RB0qW4i+5g8TlODMK14hsNSW
	 Kje8bR3TfVhmA==
Subject: Re: [PATCH net-next v7 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com
Date: Sun, 22 Nov 2026 20:01:33 +0000
Message-ID: <179537769318.3135.17791912110495668142@kernel.org>
In-Reply-To: <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When TX queues are disabled, their BQL/DQL state is never
  reset, so they can stall after a later regrow.
- [Medium] The new rollback path in macb_set_channels() restarts TX on
  the old rings without realigning the hardware queue pointer.
- [Low] The new comment in macb_init_buffers() (line 514) says that
  "macb_set_channels(), which is the only way of writing to…

--

net: macb: implement ethtool_ops.get|set_channels()

This commit moves num_queues from struct macb into struct macb_context and
adds bp->max_num_queues and bp->configured_num_queues. It then implements
the ethtool get_channels/set_channels operations, using the existing
context swap window to reallocate rings when the interface is running.
Queues beyond the active count are disabled by writing QUEUE_DISABLE to
their RBQP/TBQP registers.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 1e06666921160..180da5d62f09a 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -504,11 +504,25 @@ static void macb_init_buffers(struct macb *bp)
>  		macb_writel(bp, TBQPH, upper_32_bits(txq->ring_dma));
>  	}
>  
> -	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
> -		rxq = &bp->ctx->rxq[q];
> -		txq = &bp->ctx->txq[q];
> -		queue_writel(queue, RBQP, lower_32_bits(rxq->ring_dma));
> -		queue_writel(queue, TBQP, lower_32_bits(txq->ring_dma));
> +	for (q = 0, queue = bp->queues; q < bp->max_num_queues; ++q, ++queue) {
> +		if (q < bp->ctx->num_queues) {
> +			rxq = &bp->ctx->rxq[q];
> +			txq = &bp->ctx->txq[q];
> +			queue_writel(queue, RBQP, lower_32_bits(rxq->ring_dma));
> +			queue_writel(queue, TBQP, lower_32_bits(txq->ring_dma));
> +		} else {
> +			/* macb_set_channels(), which is the only way of writing
> +			 * to bp->configured_num_queues, is only allowed if
> +			 * MACB_CAPS_QUEUE_DISABLE.
> +			 */

[Severity: Low]
This isn't a bug, but is this comment accurate? macb_probe() also writes
bp->configured_num_queues:

	bp->max_num_queues = num_queues;
	bp->configured_num_queues = num_queues;

The else branch is still only reached on QUEUE_DISABLE hardware, because
macb_set_channels() is the only path that can lower the count below
bp->max_num_queues.

Could the comment say that instead?

[ ... ]

> @@ -3359,10 +3385,6 @@ static void macb_context_swap_start(struct macb *bp)
>  	 */
>  	netif_tx_disable(bp->netdev);
>  
> -	/* Now that everything is stopped, clear DQL. */
> -	for (q = 0; q < bp->num_queues; ++q)
> -		netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev, q));
> -
>  	/* Safe to call outside bp->lock because bp->irq_quiesced ensures the IRQ

[ ... ]

> @@ -3399,16 +3421,26 @@ static void macb_context_swap_end(struct macb *bp,
>  
>  	lockdep_assert_held(&bp->mac_cfg_lock);
>  
> -	/* Swap contexts & give buffer pointers to HW. */
> +	/* Swap contexts & give buffer pointers to HW.
> +	 * !new_ctx means that the swap failed and we keep the old context.
> +	 */
>  
> -	old_ctx = bp->ctx;
> -	WRITE_ONCE(bp->ctx, new_ctx);
> -	wmb(); /* ensure IRQ enabled below read the new context */
> -	macb_init_buffers(bp);
> +	if (new_ctx) {
> +		old_ctx = bp->ctx;
> +		WRITE_ONCE(bp->ctx, new_ctx);
> +		wmb(); /* ensure IRQ enabled below read the new context */
> +
> +		macb_init_buffers(bp);
> +
> +		/* Clear DQL (only on successful context swap). */
> +		for (q = 0; q < bp->ctx->num_queues; ++q)
> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
> +								  q));
> +	}

[Severity: Medium]
This reset runs after bp->ctx has been switched to new_ctx, so it only
covers the new, smaller queue count. Take a running shrink such as
"ethtool -L eth0 combined 2" on a 4-queue GEM. What resets the DQL state
of queues 2 and 3?

macb_free(old_ctx) at the end of this function frees the in-flight skbs on
all 4 old queues. netdev_tx_completed_queue() is never called for those
bytes, so num_queued - num_completed stays non-zero on queues 2-3. If BQL
had already stopped those queues, __QUEUE_STATE_STACK_XOFF also stays set.

macb_close() only resets the active context's queues:

	for (q = 0; q < bp->ctx->num_queues; ++q)
		netdev_tx_reset_queue(netdev_get_tx_queue(netdev, q));

macb_open() has no reset. netif_set_real_num_tx_queues() does nothing
with DQL when queues are re-enabled. So consider this sequence:

  ethtool -L eth0 combined 2   (running, TX in flight on queues 2-3)
  ip link set eth0 down        (resets queues 0-1 only)
  ethtool -L eth0 combined 4   (down, no swap, no reset)
  ip link set eth0 up          (no reset)

Can queues 2-3 come back with stale in-flight bytes and STACK_XOFF still
set? The hardware ring would have nothing to complete, and
macb_tx_timeout()->macb_tx_restart() doesn't touch DQL. Flows hashed to
those queues would stall. Even after a completion, the stale bytes keep
dql_completed() from growing the limit.

Before this patch, macb_context_swap_start() and macb_close() both reset
every hardware queue. Should these resets cover the old context's queue
count, or bp->max_num_queues?

[ ... ]

> @@ -4618,6 +4658,75 @@ static int gem_set_rxnfc(struct net_device *netdev, struct ethtool_rxnfc *cmd)

[ ... ]

> +	if (running) {
> +		new_ctx = macb_context_alloc(bp, num_queues, netdev->mtu,
> +					     bp->configured_rx_ring_size,
> +					     bp->configured_tx_ring_size);
> +		if (IS_ERR(new_ctx))
> +			return PTR_ERR(new_ctx);
> +
> +		macb_context_swap_start(bp);
> +	}
> +
> +	ret = netif_set_real_num_queues(bp->netdev, num_queues, num_queues);
> +	if (ret) {
> +		if (running) {
> +			macb_free(new_ctx);
> +			kfree(new_ctx);
> +			macb_context_swap_end(bp, NULL);
> +		}
> +		return ret;
> +	}

[Severity: Medium]
Is it safe to restart TX on the old rings here? By this point
macb_context_swap_start() has already cleared NCR.TE:

	ctrl = macb_readl(bp, NCR);
	macb_writel(bp, NCR, ctrl & ~(MACB_BIT(RE) | MACB_BIT(TE)));

On GEM, clearing TE resets the transmit queue pointer to the TBQP base,
i.e. descriptor 0. Commit 881a0263d502 ("net: macb: Shuffle the tx ring
before enabling tx") relies on this, which is why macb_mac_link_up() calls
gem_shuffle_tx_rings() before it sets TE again.

With new_ctx == NULL, macb_context_swap_end() skips macb_init_buffers()
and doesn't rotate the rings. If bp->link_up is set, it goes straight to:

		ctrl = macb_readl(bp, NCR);
		macb_writel(bp, NCR, ctrl | MACB_BIT(RE) | MACB_BIT(TE));

The link never went down, so macb_mac_link_up() and its shuffle don't run.

Would the hardware then restart at descriptor 0 while txq->tail points
somewhere else?

If descriptor 0 has TX_USED set, TX stops with TXUBR. macb_tx_restart()
then keeps issuing TSTART because TBQP != head, and TX stalls for good.

If descriptor 0 is a middle descriptor of an earlier multi-descriptor
(SG/TSO) frame, TX_USED is clear. The DMA would then fetch a buffer that
macb_tx_unmap() has already unmapped.

This path is reached when channels are grown on a running, link-up
interface and netif_set_real_num_queues() fails with -ENOMEM while
allocating the queue kobjects. Does the !new_ctx path in
macb_context_swap_end() need the same gem_shuffle_tx_rings() handling as
macb_mac_link_up()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-macb-set-channels-v7-0-2dbc00f686af%40bootlin.com

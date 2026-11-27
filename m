Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780274;
	b=SoMgAkmwhxOUwuDx4GWWp6Fsj9TT618pSGOBQEpK1x5XZ+UJRQPbzJemddXj/e6cld3M
	 3XUQ1WSB7dQPSuy2UrHWMCna+3i2x3MwgFUyOWZbCkqI3Te71BJlyz+UNuHh5pZYPtjK/
	 vGcpR/bVvgdZugDA0gV9ykmX7ii3x4hCAfZee9f9KnyHbTfwyfufyfyHALIzTiT15AcCq
	 2d1SsiUdR/RT8Hf1qwMTLFobkYADBET1YV60Sen2GorQSaauMZHNmN40iHUqidpP8sYFT
	 SUGvplGZrLS9kPubFMAIgmhuduDkgP4gYD8PdaKrQoDcMjumSGWs2ykf85uwv63GU9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780274;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Nj5x8f2MidPFHQLaGNfVfn7ivOiV5eX2uxIqRjmXdro=;
	b=0OdTVDSqg8m35hj5zwa7zd45pVFdNGIMW7ViLarHda22GsLAAnxyoxIGKS8shvMR2RvT
	 XWjG35+vfZdQdj1GtKOE6PHaxKPMYlUN9QyxKWm5ROGAjvJX/gJiBPe1/3XetsCGVGxeC
	 +LJd3gZez3nm/yeT99ZusPxDs7kU52riFH8AD0wV4PHCY/RFBfYPgtVCPE4D7O90JR7U4
	 XWwYqJ4KyNQD0IsoLUfa7dAzdbk7huktSUUu76MR0LNmHOuZhx971WwAwgGUG2Kg50ilR
	 YZzq6PSaKW13eN2RnlQgq/13+Pz+pACBEd1UQzOS/dEJ3J2Z2a0sZCp7X5M6zlca9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hc9Ja7ld;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF92606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hc9Ja7ld
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733DC1F00897;
	Fri, 27 Nov 2026 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780274;
	bh=Nj5x8f2MidPFHQLaGNfVfn7ivOiV5eX2uxIqRjmXdro=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hc9Ja7ldN4qcbiClmDiKzY9ydC16vSoDkyz2xiAfwumKjDbnMXMbYDKF2tWDaUUgU
	 xWU2qfBdmXhTfVBdemxl33+2+P5ENxC1YQdEVPnc1PswmcPebynkdGxZDO3JGI6+kk
	 44tPH/KNga2QOxTcZNBo4sYHIx7M0BjcIGK0W4QpBItxO5pY5grSO7FKlpr9jGR52h
	 6nPoTkh+CuK+kqGjtCZ91021Ue/LQZZU1QtOc1/OaSTyUtWmspPwt/PTVvyUX8jUwn
	 Ze+GeD6SQtwmXD7ROT1Fg0pWtze3CU5K7tTbLcIrMkMHqXUvKIvbqGL5UmYNu1Vil9
	 y4z0gcY9mvpYg==
Subject:
 Re: [PATCH net 3/3] net: hix5hd2_gmac: keep TX/RX queues alive across a close
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, shenjian15@huawei.com, shaojijie@huawei.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, zhangfei.gao@linaro.org,
 lidongpo@hisilicon.com
Date: Fri, 27 Nov 2026 11:51:12 +0000
Message-ID: <179578027297.3135.9721280568327994414@kernel.org>
In-Reply-To: <20261126110310.344521-4-mmyangfl@gmail.com>
References: <20261126110310.344521-4-mmyangfl@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 2 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [High] net: hix5hd2_gmac: TX/RX queue stall on reopen in
  hix5hd2_net_open()
- [Medium] hix5hd2_net_close() no longer frees tx_skb[] or rx_skb[].

--

net: hix5hd2_gmac: keep TX/RX queues alive across a close

This patch stops hix5hd2_net_close() from freeing the TX/RX buffers. The
release moves into hix5hd2_destroy_hw_desc_queue(), so buffers are only
freed when the device goes away. It also drops netdev_reset_queue() from
hix5hd2_net_open() and destroys the hardware queues before the SG queue
in the probe error path and in hix5hd2_dev_remove().

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index 0d4701d1e1731..0df31a2ec3ad8 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c

[ ... ]

> @@ -878,7 +877,9 @@ static int hix5hd2_net_close(struct net_device *dev)
>  	hix5hd2_irq_disable(priv);
>  	napi_disable(&priv->napi);
>  	netif_stop_queue(dev);
> -	hix5hd2_free_dma_desc_rings(priv);
> +	/* the buffers stay owned across the close; both rings are released
> +	 * with the queues when the device goes away
> +	 */

[Severity: High]
Now that the rings and BQL state carry across a close, can the
interface come back up with TX and RX stuck?

hix5hd2_net_close() only disables the port, the interrupts and NAPI.
It does not call hix5hd2_xmit_reclaim() and does not drain RX_BQ. Any
descriptors that completed into TX_RQ or RX_BQ after the last poll
therefore stay there, and their skbs stay in tx_skb[] and rx_skb[].

On the next open, hix5hd2_hw_init() does:

	writel_relaxed(~0, priv->base + RAW_PMU_INT);

That discards the pending TX_RQ_IN_INT and RX_BQ_IN_INT bits, and
their timeout variants, for those completions. hix5hd2_net_open()
then neither reclaims nor schedules NAPI; it only enables the
interrupts. hix5hd2_poll() is only reached from hix5hd2_interrupt(),
so nothing looks at TX_RQ or RX_BQ until the hardware raises a fresh
interrupt.

On the TX side, suppose netdev_sent_queue() hit the BQL limit before
the close. Then __QUEUE_STATE_STACK_XOFF is still set.
netif_start_queue() only clears __QUEUE_STATE_DRV_XOFF. With
netdev_reset_queue() gone, the only thing that clears STACK_XOFF is
netdev_completed_queue() in hix5hd2_xmit_reclaim().

The same happens if the ring was full. Every hix5hd2_net_xmit() call
finds priv->tx_skb[pos] occupied and stops the queue again. If all of
those frames had already moved to TX_RQ, nothing is left in TX_BQ to
raise a new completion, so the queue would stay stopped.

On the RX side, suppose RX_FQ had been fully consumed into RX_BQ.
Every rx_skb[] slot is then populated, so hix5hd2_rx_refill() breaks
on the first one. The hardware has no free buffers to receive into
and no reason to raise another RX interrupt.

Recovery is affected too. dev_watchdog() would call
hix5hd2_net_timeout(), but hix5hd2_tx_timeout_task() only does
dev_close() followed by dev_open(). That now repeats the same
sequence without reclaiming anything or resetting BQL. Before this
patch, the cycle at least freed tx_skb[] and reset the BQL state.

Does the hardware re-raise the TX_RQ/RX_BQ timeout interrupts for
entries already sitting in those queues after RAW_PMU_INT is cleared?
If not, should hix5hd2_net_open() process the leftover completions
itself? One option would be a napi_schedule() once after
napi_enable() and hix5hd2_irq_enable(), so that the BQL accounting
and the rings are reconciled on reopen.

[Severity: Medium]
With the free removed from here, what releases TX skbs that were queued
before "ip link set down" and not yet reclaimed, if the interface stays
down?

They now seem to stay in tx_skb[] until one of two things happens. Either
a later open lets the hardware complete them and hix5hd2_xmit_reclaim()
runs, or the device is removed and hix5hd2_destroy_hw_desc_queue() frees
them.

While they are held, each skb keeps its sk_wmem_alloc charge, so a closed
socket cannot finish __sk_destruct(). The socket's netns reference is also
kept, so a netns whose sockets sent through this device just before the
down cannot be torn down. MSG_ZEROCOPY skbs would keep their user pages
pinned, and their completion notifications would never arrive.

Close only clears PORT_EN and DESC_WR_RD_ENA. Would hix5hd2_port_enable()
on the next open then transmit the frames queued before the down? That
could happen long after a MAC address or configuration change made while
the interface was down.

The same applies to RX buffers already completed into RX_BQ before the
close. hix5hd2_rx() would deliver them to the stack after the reopen.

The commit message says the buffers are kept "until the device goes away"
and describes the BQL effect, but it does not mention these side effects.
Could they be described and weighed against the alternatives?

[ ... ]

> @@ -990,6 +991,9 @@ static void hix5hd2_destroy_hw_desc_queue(struct hix5hd2_priv *priv)
>  {
>  	int i;
>  
> +	/* the buffers survive a close: release them with the rings */
> +	hix5hd2_free_dma_desc_rings(priv);
> +
>  	for (i = 0; i < QUEUE_NUMS; i++) {
>  		if (priv->pool[i].desc) {
>  			dma_free_coherent(priv->dev, priv->pool[i].size,

[Severity: High]
Doesn't this still free the RX/TX buffers and rings while the block holds
prefetched descriptors, only now on remove instead of on close?

The remove path looks like this:

hix5hd2_dev_remove()
  unregister_netdev()
    hix5hd2_net_close()             /* port disable, irq off, clocks off */
  hix5hd2_destroy_hw_desc_queue()
    hix5hd2_free_dma_desc_rings()   /* unmap and free rx_skb[]/tx_skb[] */
    dma_free_coherent()             /* all four rings */

hix5hd2_net_close() writes no queue pointer register. The commit message
also says neither available reset can quiesce the block. So the queue
state inside the MAC appears to survive this free.

On a re-probe (sysfs unbind/bind or rmmod/insmod), the only thing that
could clear that state is hix5hd2_mac_core_reset():

static inline void hix5hd2_mac_core_reset(struct hix5hd2_priv *priv)
{
	if (!priv->mac_core_rst)
		return;
	...
}

The gmac0/gmac1 nodes in arch/arm/boot/dts/hisilicon/hisi-x5hd2.dtsi have
no resets property. devm_reset_control_get(dev, "mac_core") therefore
fails and mac_core_rst is NULL on the SoC this patch targets.

The next open then runs three steps:

- hix5hd2_hw_init() rewrites only the depth and start addresses.
- hix5hd2_rx_refill() fills CIRC_SPACE() slots computed from the stale
  RX_FQ_WR_ADDR and RX_FQ_RD_ADDR values.
- hix5hd2_port_enable() restarts descriptor processing.

Under the hardware model in the commit message, would the block then use
the previous binding's prefetched descriptors and DMA into RX buffers that
were freed at remove? The rest of the hardware FQ entries would sit in a
freshly zeroed ring with buff_addr 0.

After that, completions would land on slots where the newly allocated,
zeroed rx_skb[]/tx_skb[] entries are NULL:

hix5hd2_rx() {
	...
		skb = priv->rx_skb[pos];
		if (unlikely(!skb)) {
			netdev_err(dev, "inconsistent rx_skb\n");
			break;
		}
	...
}

hix5hd2_xmit_reclaim() does the same for tx_skb[]. Both loops break
without advancing RX_BQ_RD_ADDR or TX_RQ_RD_ADDR. Can RX and TX stall
permanently at this point? After this patch the TX timeout close/open no
longer touches the rings, so it does not look like it can recover.

Is a quiesce or a reset at probe needed before this free, so the fix also
covers the remove and re-probe path?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126110310.344521-1-mmyangfl%40gmail.com

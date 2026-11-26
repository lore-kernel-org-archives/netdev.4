Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711527;
	b=QdAw74H6jzP9hnwTQ2DkhbN7GLv7YE1TBzKNfJOK84uOaXdO5hKlqXHV6rI+lTFXQqrJ
	 QJI5RQB5apJiVK1DMjVV25pwpnJvQyfgykWgb29oPy+Heo0EP4HrH4MyUJLfFmSEeJ0Ik
	 srcYEhwrqrelQe9dcfdetmkieVUwbQ4nxI9tGTgQV0wUJl8NaZ2ub7nzJwwzl5/8ySOSR
	 L3e6G4dD6gg3JNdmn1ga1WWrUfCxFS36bme11i6hiWewWJYOHACmW2eBkDhQ7V+O/51O8
	 siKVdqToQksLPfB0tvWE53WO4ieguJhpvMNj4hc7a/cTwHtojFKWVq8Z6mCryFouXpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711527;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iJjL9FPvLHqjZoe3mvk6CqjOXnlH9NG7Su+0jSoqiNE=;
	b=eS6D2f5raQOsNfzuUUmNq+SxQQaB2gQ72WJPrvet9vaqsb0fGcSZKO/LX11GZPG2RpHG
	 pVAEWAgkwUBmaLOW1gK2IxIhe4u9Nhj+RsJGd5qhw2sIAs/vuub/co0jSaXejOFrqVdT/
	 4hQoUqqoCul9inwhJrkOrUvr7UaBzdp3d3u8q8GDR9tcoAQUr+4bXn5n4NeyEb0JGKelm
	 UXMGQ0TYoUsPNO4R1NkpZW8HG2/2JwMvnU5zbrNDs41Hq6hRPem1xm0w4z0w+A8VROakj
	 RMon9GeTMSRob7Yc9tXx5Gpz6grxDi8TwaaVVCnhXGn8c/rAwmBcODi5afEjwBQ4mwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pw6gCrGE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE1D606A333;
	Thu, 26 Nov 2026 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pw6gCrGE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A95A1F000D1;
	Thu, 26 Nov 2026 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711527;
	bh=iJjL9FPvLHqjZoe3mvk6CqjOXnlH9NG7Su+0jSoqiNE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Pw6gCrGEzbTKIgDXoJuULPyhjA0r/5Yk2/FwBslWxvzFW/w+FsPLv5Vs2VyWf987l
	 oUy/GO4GxymhE+Ug6ee0ss6RiOY7aMOFvU7H23JT9//SSuM6A/WrkVPFyIWCm4X1UC
	 kqm7rePdnziZcun6k2BrQQjw0pVh+XYu+NVAbNcBUGblbhlQod5xv6kcnmXg83V7dY
	 wclIJfFzs/A/645AajYVsDgA7j+xpPUiG3noxdFl+D7X0lu8awPcPs74nArHFha2Xw
	 6FHYS3T6Az2aUwy67mbMO8Ol1kmSjcH96/wSG91IiVlUNSSrqtwn/m2ln1Zf0SDFMt
	 FDlHM1eA9RvIA==
Subject: Re: [PATCH net-next v8 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com,
 vineeth.karumanchi@amd.com
Date: Thu, 26 Nov 2026 16:45:25 +0000
Message-ID: <179571152544.3135.2345418313808406902@kernel.org>
In-Reply-To: <20261124-macb-set-channels-v8-2-770cf8e50e6d@bootlin.com>
References: <20261124-macb-set-channels-v8-2-770cf8e50e6d@bootlin.com>
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

- [Low] The commit message does not mention changes to shared context-
  swap code that the existing MTU and ringparam paths also use.
- [Low] On multi-queue GEM devices without MACB_CAPS_QUEUE_DISABLE,
  macb_get_channels() advertises a channel range that…
- [Low] macb_set_channels() checks `bp->enst.queue_mask >> num_queues`
  before it takes bp->mac_cfg_lock.

--

net: macb: implement ethtool_ops.get|set_channels()

This commit moves the queue count into the per-context struct and adds
bp->max_num_queues and bp->configured_num_queues. It also implements the
ethtool get/set_channels operations. When the interface is running,
set_channels allocates a new context with the requested queue count and
swaps it in through the existing context swap window.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 1e06666921160..bcf77b2763448 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c

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
>  	 * handling is a no-op and all BH features are disabled.
>  	 *

[ ... ]

> @@ -3399,16 +3421,28 @@ static void macb_context_swap_end(struct macb *bp,
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
> +		for (q = 0; q < bp->max_num_queues; ++q)
> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
> +								  q));
> +	} else {
> +		gem_shuffle_tx_rings(bp);
> +	}

[Severity: Low]
This isn't a bug, but the commit message doesn't mention that this patch
reworks the context swap helpers that macb_change_mtu() and
macb_set_ringparam() share. The message says set_channels:

  "ends up only being an assignment to bp->configured_num_queues plus a
  call into netif_set_real_num_queues()"

The patch also:

  - moves the netdev_tx_reset_queue() loop from macb_context_swap_start()
    into macb_context_swap_end(). The loop now runs only on a successful
    swap and is bounded by bp->max_num_queues instead of the active
    queue count.
  - adds a new_ctx == NULL rollback mode to macb_context_swap_end(). It
    keeps the old context, skips macb_init_buffers(), calls
    gem_shuffle_tx_rings() and skips the free.
  - makes macb_interrupt() self-disarm on queues where
    q >= ctx->num_queues.
  - switches gem_get_rx_ring_count() and macb_poll_controller() to
    bp->configured_num_queues.

The existing MTU and ringparam callers always pass a non-NULL new_ctx, so
their behaviour doesn't appear to change.

Could the commit message describe these helper changes, or could they go
in a preparatory patch?

[ ... ]

> +static int macb_set_channels(struct net_device *netdev,
> +			     struct ethtool_channels *ch)
> +{
> +	struct macb *bp = netdev_priv(netdev);
> +	unsigned int num_queues = ch->combined_count;
> +	bool running = netif_running(bp->netdev);
> +	struct macb_context *new_ctx;
> +	int ret;
> +
> +	/* MACB_CAPS_QUEUE_DISABLE means that the field QUEUE_DISABLE/BIT0 in
> +	 * the per-queue RBQP/TBQP registers disable Tx/Rx queues. If we don't
> +	 * have that capability we can have multiple queues but we must always
> +	 * run with all enabled.
> +	 */
> +	if (!(bp->caps & MACB_CAPS_QUEUE_DISABLE))
> +		return -EOPNOTSUPP;

[Severity: Low]
Does macb_get_channels() advertise a range that this check never accepts?

macb_get_channels() always reports:

	ch->max_combined = bp->max_num_queues;
	ch->combined_count = bp->configured_num_queues;

Some multi-queue GEM configs don't set MACB_CAPS_QUEUE_DISABLE, for
example zynqmp_config, raspberrypi_rp1_config, pic64hpsc_config and
default_gem_config. On those devices ethtool -l shows something like
"Combined: max N, current N", but every request for 1..N-1 fails here
with EOPNOTSUPP.

Should max_combined be reported as bp->configured_num_queues when the
capability is absent?

> +
> +	if (num_queues > bp->max_num_queues)
> +		return -EINVAL;
> +
> +	if (num_queues == bp->configured_num_queues)
> +		return 0;
> +
> +	/* If we allow disabling a queue which has TAPRIO active, we'll keep a
> +	 * transmission window which would be unusable.
> +	 */
> +	if (bp->enst.queue_mask >> num_queues) {
> +		netdev_err(bp->netdev, "TAPRIO schedule gates queues >= %u; destroy the qdisc before reducing channels\n",
> +			   num_queues);
> +		return -EBUSY;
> +	}

[Severity: Low]
Is it safe to read bp->enst.queue_mask here without bp->mac_cfg_lock?

In the running case the lock is only taken later, in
macb_context_swap_start(). In the not-running case it is never taken.

Other writers of bp->enst hold mac_cfg_lock. For example,
macb_taprio_destroy() does:

	guard(mutex)(&bp->mac_cfg_lock);

	netdev_reset_tc(netdev);
	memset(&bp->enst, 0, sizeof(bp->enst));

macb_mac_link_up() also clears it on a link speed change. It holds only
mac_cfg_lock and runs from the phylink_resolve() worker without rtnl:

	memset(&bp->enst, 0, sizeof(bp->enst));

So this unlocked read can race with a locked write, which KCSAN could
report. The worst outcome looks like a spurious -EBUSY.

Could this check be done under mac_cfg_lock?

> +
> +	if (running) {
> +		new_ctx = macb_context_alloc(bp, num_queues, netdev->mtu,
> +					     bp->configured_rx_ring_size,
> +					     bp->configured_tx_ring_size);
> +		if (IS_ERR(new_ctx))
> +			return PTR_ERR(new_ctx);
> +
> +		macb_context_swap_start(bp);
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-macb-set-channels-v8-0-770cf8e50e6d%40bootlin.com

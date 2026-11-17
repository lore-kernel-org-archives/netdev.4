Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944610;
	b=t/AoKNwrPiWm7xA4W9gohq58cr0I8GtXOlzabIeT6HQqj8wUi2ExZgn28dZJYXrkWvNq
	 dYqgZ+/MZqRxZJKqCapuHjzMKMiGKPfjwZXQPIhUGzJjn7fe1UQaeoHMjy90Jl/PNwWvz
	 zirEmCn9a3BOCaUmqXbsG+fLfUGJPjGHBmGjnsAlBFzVqW/9R1tCMN3CD3JWhZDZansvi
	 QDibp1eyFwcr34X97EVGWV6IbBr0nSEmF2FUSke5CzwNFBciFast2aqcOymOvb5sZZpDj
	 G/TDdi9BzRxc/9fbzA95yN47IdaYPLHIo9JEDbn8XiimhyZTfivf2IDQAN98z/wOVxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944610;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TQYGNJ9tYREAnPNC9H8U0nleRFrTvI/CHnxZXNu8aUM=;
	b=hzBT0BfXI/NKq6NIXmiygLyM293B76hEFLbAjC1ogxYJ0hF4uLFCWNF/FdF0XglAtS/u
	 iWh4o6qWceNPab0RgBbHofpt6Wgos5YwCSCTX2288yDV/1Rf2YASFl6tjgU2uG0ukGeXj
	 /8hQl7bFD1FpE+XuT/6eQumPC+tHsuciT23spSS/7N5eRv2OVXIenjgG92hA+Imx3kGR8
	 7ccpNHRUHqCV0NLOEZ9mSo8dSMHRcOSMMnY2oV5a5n3PEVgrYRJPnpwaUtJeZ3sk9rld9
	 AEujW12igx00z6OZzCQQCLtmLGvp6wIJTJ8prFLO8ALtuiJlExuvyGbtkb0O3hR4xlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNG+Mvkg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8660A606A31C;
	Tue, 17 Nov 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BNG+Mvkg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800AC1F000C4;
	Tue, 17 Nov 2026 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944610;
	bh=TQYGNJ9tYREAnPNC9H8U0nleRFrTvI/CHnxZXNu8aUM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BNG+Mvkg0Snp8a3zwinD48BoBrCibtUbV2HR9jIME/zo6elAA5F+9huHJS9W3k6wf
	 jsp6aTDXra10RStlrUmDABrAbONhZtcB29iKHemY79hrCGNdgix87u/50Lz/AVsUU/
	 89pxSbURulNDvfs6r8nFuNYAUnfOwR7L4bqWlyoGO6aQpfVLXdBy1yzvWbhN1tV8Hy
	 e1yiztUCGEo7FEMWVo2vtLS3QtVQuqR9ow8QLmh7ZMHNLPnoN5pLfnZkmzcP1HobtL
	 YQHrBkzC1ac9lePJw8FhyXxJ7aV4YZcNHsdk/taMggPODAmZjAzhtTyGrGLa4xsEtB
	 hStRIMH+THjwQ==
Subject: Re: [PATCH net-next v6 1/2] net: macb: implement
 ethtool_ops.get|set_channels()
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com
Date: Tue, 17 Nov 2026 19:43:29 +0000
Message-ID: <179494460907.3136.14790629378014760518@kernel.org>
In-Reply-To: <20261113-macb-set-channels-v6-1-5de59d9e7f02@bootlin.com>
References: <20261113-macb-set-channels-v6-1-5de59d9e7f02@bootlin.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 7 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] macb_taprio_destroy()
  (drivers/net/ethernet/cadence/macb_main.c) now clears the software…
- [Medium] gem_get_rx_ring_count() now returns bp->max_num_queues.
- [Medium] When the interface is running, macb_set_channels() calls
  macb_context_swap_start(bp) before netif_set_real_num_queues().
- [Medium] macb_interrupt() now runs `if (bp->ctx) num_queues =
  READ_ONCE(bp->ctx->num_queues);` (lines 2352-2353) under bp->lock,…
- [Medium] macb_poll_controller() now evaluates `q < bp->ctx->num_queues`
  on every loop iteration with only local_irq_save(), without bp->lock,…
- [Medium] net: macb: at91ether_open() leaves bp->ctx->num_queues
  uninitialized as 0
- [Medium] net: macb: macb_taprio_setup_replace() skips ENST init on
  disabled queues

--

net: macb: implement ethtool_ops.get|set_channels()

This commit moves the queue count into the active context
(ctx->num_queues) and adds bp->max_num_queues and
bp->configured_num_queues. It implements .get_channels() and
.set_channels(), using the context swap window when the interface is
running. It also records the TAPRIO-gated queue mask so that
.set_channels() can refuse to disable gated queues.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 5bd299fc85a9c..e7325af4b399c 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c

[ ... ]

> @@ -2332,19 +2349,22 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
>  
>  	spin_lock(&bp->lock);
>  
> +	if (bp->ctx)
> +		num_queues = READ_ONCE(bp->ctx->num_queues);
> +
>  	while (status) {
> -		/* self-disarm while the netdev is closed
> -		 * or during context swap
> +		/* self-disarm while the netdev is closed,
> +		 * during context swap, or when the current queue is disabled
>  		 */
> -		if (unlikely(bp->irq_quiesced)) {
> +		if (unlikely(bp->irq_quiesced ||
> +			     q >= num_queues)) {

[Severity: Medium]
Can this read a freed context? bp->ctx is now dereferenced before
bp->irq_quiesced is checked. The previous handler never touched bp->ctx
while quiesced.

macb_close() frees and clears the context outside bp->lock, and the
reset_hw error path in macb_open() does the same:

macb_close() {
    ...
	macb_free(bp->ctx);
	kfree(bp->ctx);
	bp->ctx = NULL;
    ...
}

The queue IRQs are requested with IRQF_SHARED in macb_init_dflt() and
stay registered while the interface is down. The handler can still be
entered after the synchronize_irq() in macb_quiesce_start(), for example
when another device on the shared line fires and ISR reads non-zero.

If that happens between kfree() and the NULL store, ->num_queues is read
from freed memory.

bp->ctx is also loaded twice with plain loads. If the compiler re-reads
it after the closing CPU has stored NULL, would the handler dereference
NULL?

>  			queue_writel(queue, IDR, -1);
>  			macb_queue_isr_clear(bp, queue, -1);
>  			break;
>  		}

[ ... ]

> @@ -2402,7 +2422,7 @@ static void macb_poll_controller(struct net_device *netdev)
>  	unsigned int q;
>  
>  	local_irq_save(flags);
> -	for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue)
> +	for (q = 0, queue = bp->queues; q < bp->ctx->num_queues; ++q, ++queue)
>  		macb_interrupt(netdev->irq, queue);
>  	local_irq_restore(flags);
>  }

[Severity: Medium]
Is it safe to dereference bp->ctx here? The loop bound used to be the
constant bp->num_queues. It is now re-read from bp->ctx on every
iteration, protected only by local_irq_save(): no bp->lock, no
mac_cfg_lock and no RCU.

netpoll is not serialized against .set_channels(), .set_ringparam() or
ndo_change_mtu. Each of these can swap bp->ctx, and
macb_context_swap_end() frees the old context right after publishing
the new one:

macb_context_swap_end() {
    ...
		WRITE_ONCE(bp->ctx, new_ctx);
    ...
	mutex_unlock(&bp->mac_cfg_lock);
    ...
	if (new_ctx) {
		macb_free(old_ctx);
		kfree(old_ctx);
	}
}

A CPU in macb_poll_controller() that has already loaded the old bp->ctx
can then read ->num_queues from freed memory.

If that memory has been reused, could the garbage bound walk bp->queues[]
past MACB_MAX_QUEUES and call macb_interrupt() on an out-of-bounds queue?

The new .set_channels() path adds another runtime trigger for this swap.

[ ... ]

> @@ -4513,7 +4548,7 @@ static u32 gem_get_rx_ring_count(struct net_device *netdev)
>  {
>  	struct macb *bp = netdev_priv(netdev);
>  
> -	return bp->num_queues;
> +	return bp->max_num_queues;
>  }

[Severity: Medium]
Should this return bp->configured_num_queues? In the same gem_ethtool_ops
table, macb_get_channels() reports combined_count as
bp->configured_num_queues. gem_set_rxnfc() also rejects any ring_cookie
>= bp->configured_num_queues.

Take 4-queue hardware after "ethtool -L ethX combined 2".
ETHTOOL_GRXRINGS (ethtool_get_rxrings() in net/ethtool/ioctl.c) still
reports 4 RX rings. Rings 2 and 3 have QUEUE_DISABLE written by
macb_init_buffers(), and the driver's own rxnfc insert path rejects
steering to them with -EINVAL.

include/linux/ethtool.h documents this callback as returning the number
of RX rings.

[ ... ]

> +static int macb_set_channels(struct net_device *netdev,
> +			     struct ethtool_channels *ch)
> +{

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
What state is the old context in if netif_set_real_num_queues() fails
here? When the queue count grows on a registered netdev, it can return
-ENOMEM from netdev_queue_update_kobjects() or
net_rx_queue_update_kobjects().

By that point macb_context_swap_start() has done the following, which
only makes sense if the old context is about to be discarded:

- quiesced NAPI and IRQs
- halted Tx and cleared TE/RE
- called netdev_tx_reset_queue() on every old queue

The old rings can still hold in-flight or completed-but-unreaped Tx
descriptors between txq->tail and txq->head.

macb_context_swap_end(bp, NULL) then re-activates the old context:

macb_context_swap_end(bp, NULL)
    macb_init_buffers(bp)    <- TBQP/RBQP rewound to ring index 0
    napi_enable()
    IER writes, TE/RE re-enabled if link is up

Neither mog_init_rings() nor gem_shuffle_tx_rings() is called. The
software txq->head/tail and rxq->tail stay mid-ring while the hardware
restarts from the ring base.

Later, macb_tx_complete() or macb_tx_error_task() reaps the old frames
and netdev_tx_completed_queue() reports bytes that DQL no longer counts.
Could that trip this check?

lib/dynamic_queue_limits.c:dql_completed() {
    ...
	BUG_ON(count > num_queued - dql->num_completed);
    ...
}

Even without the BUG_ON, wouldn't the mismatched hardware and software
ring indices stall Tx/Rx?

macb_change_mtu() and macb_set_ringparam() do all of their fallible work
before macb_context_swap_start(). This rollback-after-swap path is new
in this patch.

> +
> +	bp->configured_num_queues = num_queues;
> +
> +	if (running)
> +		macb_context_swap_end(bp, new_ctx);
> +
> +	return 0;
> +}

[ ... ]

> @@ -4910,7 +5024,12 @@ static void macb_taprio_destroy(struct net_device *netdev)
>  	unsigned int q;
>  
>  	netdev_reset_tc(netdev);
> -	queue_mask = BIT_U32(bp->num_queues) - 1;
> +	bp->taprio_gated_queues = 0;
> +
> +	if (unlikely(pm_runtime_suspended(&bp->pdev->dev)))
> +		return;

[Severity: Medium]
Can this leave ENST gating enabled in hardware while
bp->taprio_gated_queues says that no queue is gated? When the device is
runtime-suspended, the function returns before writing ENST_CONTROL or
the per-queue ENST_START_TIME, ENST_ON_TIME and ENST_OFF_TIME registers.

macb_setup_taprio() used to reject every command while runtime-suspended.
With this patch only TAPRIO_CMD_REPLACE is rejected:

	case TAPRIO_CMD_REPLACE:
		if (unlikely(pm_runtime_suspended(&bp->pdev->dev))) {

So DESTROY now succeeds silently while suspended. The commit message
does not mention this change.

macb_runtime_suspend() only gates clocks, so the ENST registers keep
their contents. Only macb_taprio_setup_replace() and
macb_taprio_destroy() write ENST_CONTROL. macb_open(), macb_init_hw()
and macb_reset_hw() never clear it.

The new guard in macb_set_channels() checks only the software mask:

	if (bp->taprio_gated_queues >> num_queues) {

That would let this sequence through:

1. Interface up, with a taprio offload gating queue 3.
2. ip link set down: macb_close() calls pm_runtime_put() and the device
   autosuspends.
3. tc qdisc del: the mask is cleared and the hardware is left untouched.
4. ethtool -L ethX combined 2: accepted.
5. ip link set up.

On open, macb_init_buffers() writes QUEUE_DISABLE to RBQP/TBQP for
queue 3 while its ENST window is still enabled. Isn't this the case the
commit message describes as refused: "a transmission window would be
reserved but unusable"?

Separately, this part is a pre-existing issue and not introduced by
this patch: the pm_runtime_suspended() check takes no PM reference. The
device can therefore suspend between the check and the MMIO writes that
follow.

> +
> +	queue_mask = BIT_U32(bp->max_num_queues) - 1;
>  
>  	scoped_guard(spinlock_irqsave, &bp->lock) {

[ ... ]

> @@ -3063,6 +3084,7 @@ static struct macb_context *macb_context_alloc(struct macb *bp,
>  		return ERR_PTR(-ENOMEM);
>  
>  	ctx->info = &bp->info;
> +	ctx->num_queues = num_queues;
>  	ctx->rx_buffer_size = macb_rx_buffer_size(bp, mtu);
>  	ctx->rx_ring_size = rx_ring_size;
>  	ctx->tx_ring_size = tx_ring_size;

[Severity: Medium]
Does this leave ctx->num_queues at zero on EMAC? With this patch,
macb_context_alloc() is the only place that initializes the field.
at91ether_open() does not call macb_context_alloc(); it allocates the
context itself:

at91ether_open() {
    ...
	WRITE_ONCE(bp->ctx, kzalloc_obj(*bp->ctx));
    ...
	bp->ctx->info = &bp->info;
    ...
}

As a result, bp->ctx->num_queues stays 0 for as long as an AT91RM9200
EMAC interface is up. That breaks the invariant
0 < ctx->num_queues <= bp->max_num_queues stated in the commit
message.

Before this patch, the loops below were bounded by bp->num_queues,
which is 1 on EMAC. They now run zero times:

- macb_suspend(): the WoL loop that writes QUEUE_DISABLE or the
  tie-off address to RBQP and masks the queue interrupts, and the
  napi_disable() loop.
- macb_resume(): the matching per-queue loop.
- macb_reset_hw(): the IDR/ISR clear loop, which macb_suspend() calls
  when WoL is disabled.

On system suspend, queue 0 interrupts are therefore no longer masked
by macb_reset_hw(). With WoL enabled, the RX queue is not tied off
before RE is turned back on.

Should at91ether_open() set bp->ctx->num_queues to 1 (or to
bp->configured_num_queues)? Or is there a reason not to use
macb_context_alloc() there?

[ ... ]

> @@ -4876,11 +4986,12 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
>  	/* All validations passed - proceed with hardware configuration */
>  	scoped_guard(spinlock_irqsave, &bp->lock) {
>  		/* Disable ENST queues if running before configuring */
> -		queue_mask = BIT_U32(bp->num_queues) - 1;
> +		queue_mask = BIT_U32(bp->max_num_queues) - 1;
>  		gem_writel(bp, ENST_CONTROL,
>  			   queue_mask << GEM_ENST_DISABLE_QUEUE_OFFSET);
>  
> -		for (q = 0, queue = bp->queues; q < bp->num_queues; ++q, ++queue) {
> +		for (q = 0, queue = bp->queues; q < bp->configured_num_queues;
> +		     ++q, ++queue) {
>  			/* Configure queue timing registers */
>  			queue_writel(queue, ENST_START_TIME,
>  				     enst_queue[q].start_time_mask);

[Severity: Medium]
Should this loop still cover bp->max_num_queues? Other code already
does:

- The ENST_CONTROL write just above disables all bp->max_num_queues
  queues.
- macb_taprio_destroy() clears ENST_START_TIME, ENST_ON_TIME and
  ENST_OFF_TIME for all bp->max_num_queues queues.

Here, however, enst_queue is sized for bp->configured_num_queues, and
only those queues get their timing registers written.

Take 4-queue hardware after "ethtool -L ethX combined 2". A later
taprio replace leaves queues 2 and 3 with whatever their ENST
registers already hold. On a device that never had a schedule, that
is the reset value (0x0001FFFF in ENST_ON_TIME).

commit 04a943067baa ("net: macb: configure ENST registers for all
queues") fixed exactly this: leaving the reset values on unused
queues disrupts ENST scheduling of the configured queues, even when
ENST_CONTROL enables only the configured ones.

Before this patch, every queue below bp->num_queues was written, with
zeroes for the unused ones. Would it work to allocate enst_queue with
bp->max_num_queues and run this loop up to bp->max_num_queues? The
num_entries and queue_id checks would still compare against
bp->configured_num_queues.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-macb-set-channels-v6-0-5de59d9e7f02%40bootlin.com

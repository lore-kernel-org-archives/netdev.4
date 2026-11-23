Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405975;
	b=KJkEy/4fRbXP8q47b+YriwYslZY+aFqS7Yznwr6QiMFQz8TSK9681DJSQV8pnPSWcnQG
	 TPXBt1dWVdJWKgE14oVnN6TB1K9/BVmhaPW6JrehmUGHsix8m0wVmmqLUTg2tkfBF8YLf
	 v74R3vEbKy0zw4S5NQR7sdtRcZeoEfqjjz0nQF/WydZhrmtX29f6VKuDxHFEFDJi47DrP
	 S2852S2WCLb0b+XPlVBZ91XD/idLNKsk3LLTi2k7Mfshooj1ulwd6Gcbq5yAx/FD+Ldr4
	 1YpjR+oaj5RukfXCWMLe4tUOGPIyoOGfHv1hXaA27GE1G2A7N8vmrhuOHmDQSF3Ne9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405975;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wZawyu+yiKJdA76/KWNSvpB6T1UggooO2OitW4P0Azs=;
	b=V2xzZMWUtMhrT94wYuRJ9FPExX3DH4h15dYXXaPDe2eSOljsCMy3RM0O8Fyu9y0Y6DUu
	 S2jtKqewHOaIZCvBfZBMJ5FPCZl2E5AdPi46g1v28Y02uog4EM/th5F+RR/LPj03ytVvg
	 3ooAYoa4NuShxsHObIOfjMcgnetKQL5hgS9kAIwh8lO9vGDa1YNVqDZLwgXcxB4Y9iTpI
	 pFyTJ612+Lz4lcyHUrNGYbVcaDgKJ5+91XDvcCG8XVBX1mhXjBIrAz89FotduKclGFQzt
	 3NB52HtFHLZ3gD76Pygm32UvlhfXek2qqbMI2dQxdaWB9KOyC6OdXuq1gKMsaNKrwsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSLJ4ieK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DF3606A332
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VSLJ4ieK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7321F000C6;
	Mon, 23 Nov 2026 03:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795405975;
	bh=wZawyu+yiKJdA76/KWNSvpB6T1UggooO2OitW4P0Azs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VSLJ4ieKIgMdklEjD72xgEyW/WTs9/gYthKOtZG+c7JiNdB09hrQcT+nelFypIGsw
	 O6wx4dx9YvtMBcjyAOregmGuovgWsWqC9qjhi5zwmnLmCmsz69yY139o3gEuBVsKyK
	 coGKhhVxj//DKHZhFjHC10VKVDSp8Qyj9E1OjRZ8D4Xn6d5YRGg0TqUJAyScJqj4Eo
	 iTnxQ+c0NxVuEPq8u5goYxP5uowIKqPBEttymyEQbJ5Wy+j10SJ0mGPcKnIpNNlDLz
	 vkY3/jiCNVET/10xxFO6+TrOIHNBARoTo4i7uWIHqVV6S7j6e+meI5AQoWBlcHSBQl
	 8TafJI7gDlFrQ==
Subject: Re: [PATCH net-next v2 7/7] eth: bnxt_en: restart Rx queues when
 their IRQ moves to another NUMA node
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, pavan.chebbi@broadcom.com, bjorn@kernel.org, joe@dama.to
Date: Mon, 23 Nov 2026 03:52:53 +0000
Message-ID: <179540597395.3135.10998884715226762162@kernel.org>
In-Reply-To: <20261120035214.369158-8-kuba@kernel.org>
References: <20261120035214.369158-8-kuba@kernel.org>
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

Critical: 0 · High: 3 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new close-on-error handling in bnxt_irq_affinity_update()
  cannot work.
- [High] bnxt_irq_affinity_update() takes only the netdev instance lock
  through bnxt_lock_sp() (bnxt.c:14636-14646: clear_bit(IN_SP_TASK);…
- [High] With this patch, PFs that support the queue API but run without
  TPH restart their Rx queues when the IRQ moves to another NUMA node.

--

eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA node

This patch schedules the IRQ affinity sp work on every device that
supports the queue API, not only in TPH mode. bnxt_irq_affinity_update()
then restarts an Rx queue if the TPH Steering Tag changed or if the page
pool's nid no longer matches the IRQ's node. It also stops the loop when
a failed restart has closed the device.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index c022fcb063482..e2a0fb2b614a2 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c

[ ... ]

> @@ -14677,27 +14679,40 @@ static void bnxt_tph_update(struct bnxt *bp)
>  		goto unlock;
>  
>  	for (i = 0; i < bp->rx_nr_rings; i++) {
> +		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
> +		bool new_tag = false, new_node = false;
> +		int map_idx, err, nid;
>  		struct bnxt_irq *irq;
> -		int map_idx, err;
>  		u16 tag;
>  
>  		map_idx = bnxt_cp_num_to_irq_num(bp, i);
>  		irq = &bp->irq_tbl[map_idx];
> +
>  		tag = READ_ONCE(irq->new_tag);
> -		if (irq->tag == tag)
> -			continue;
> +		if (irq->tag != tag) {
> +			if (!pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
> +				new_tag = true;
> +		}
>  
> -		if (pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
> +		nid = READ_ONCE(bp->ring_nid[i]);
> +		if (nid != NUMA_NO_NODE && rxr->page_pool->p.nid != nid)
> +			new_node = true;

[Severity: High]
When bp->tph_mode is off, this new_node check alone now restarts the
queue. Does the restart quiesce the XDP TX ring that shares this Rx
queue's NAPI?

XDP requires combined rings. The XDP TX ring is attached to the Rx bnapi,
and its tx_int is bnxt_tx_int_xdp(). bnxt_queue_stop() calls
bnxt_tx_queue_stop(), which skips freeing and draining the TX ring when
TPH is off:

bnxt_tx_queue_stop() {
    ...
		if (!bp->tph_mode)
			continue;

		bnxt_hwrm_tx_ring_free(bp, txr, true);
		bnxt_hwrm_cp_ring_free(bp, txr->tx_cpr);
		bnxt_free_one_tx_ring_skbs(bp, txr, txr->txq_index);
    ...
}

That leaves XDP_TX descriptors already posted to hardware in flight while
bnxt_queue_start() installs the clone's pools:

	rxr->page_pool = clone->page_pool;
	rxr->head_pool = clone->head_pool;

Those completions are processed later in bnxt_tx_int_xdp():

	page_pool_recycle_direct(rxr->page_pool, tx_buf->page);

Wouldn't that recycle old-pool pages into the new pool? The same path
also rings the Rx doorbell with a tx_buf->rx_prod from the old ring.

Meanwhile, bnxt_queue_mem_free(old_mem) frees the old rx_buf_ring pages,
including XDP_TX head pages that hardware may still be reading. It then
calls page_pool_destroy() on the old pool, which DMA-unmaps the pages
that pool still tracks. Some of those pages may already have been
reposted to hardware Rx through the new pool.

Before this patch, bnxt only called netdev_rx_queue_restart() in TPH
mode, where the TX rings are freed during stop. Is it safe to reach this
restart on non-TPH devices that have XDP attached?

>  
> +		if (!new_tag && !new_node)
>  			continue;
>  
> -		err = netdev_rx_queue_restart(dev, irq->ring_nr);
> +		err = netdev_rx_queue_restart(dev, i);
>  		if (err) {
>  			netdev_err(dev, "RX queue restart failed: err=%d\n",
>  				   err);
> +			/* Failing to start a new queue may close the device */
> +			if (!test_bit(BNXT_STATE_OPEN, &bp->state))
> +				break;

[Severity: High]
Can netdev_rx_queue_restart() return here safely once the device has
been closed?

If bnxt_queue_start() for new_mem hits an HWRM failure, it jumps to
err_reset and calls netif_close(dev), which leads to:

netif_close()
  __dev_close_many()
    bnxt_close()
      bnxt_close_nic()
        __bnxt_close_nic()
          bnxt_free_mem(bp, true)
            bnxt_free_rx_rings()   <- destroys rxr->page_pool (new pool)
            kfree(bp->rx_ring); bp->rx_ring = NULL;

Next, netdev_rx_queue_reconfig() takes its err_start_queue path. It does
not check whether the device is still running:

	if (qops->ndo_queue_start(dev, qcfg_old, old_mem, rxq_idx)) {
		...
	}

err_free_new_queue_mem:
	qops->ndo_queue_mem_free(dev, new_mem);

bnxt_queue_start(old_mem) then runs:

	rxr = &bp->rx_ring[idx];
	clone = qmem;

	rxr->rx_prod = clone->rx_prod;

with bp->rx_ring set to NULL. Wouldn't this oops? Even if it didn't,
bnxt_queue_mem_free(new_mem) would call page_pool_destroy() a second
time on the new pool, which bnxt_free_rx_rings() has already destroyed.

The reverse order has the same problem. Suppose the new queue fails in
the MRU path without closing, and the rollback start for old_mem then
reaches err_reset. The close destroys the old pool, and
ndo_queue_mem_free(old_mem) destroys it again.

So whenever the device closes inside the restart, the new
BNXT_STATE_OPEN check doesn't seem to be reached safely.

This restart can now be triggered by any cross-node affinity change on a
queue-API PF, for example from irqbalance or a write to
/proc/irq/*/smp_affinity, not only by TPH Steering Tag changes.

[Severity: High]
Related to the above: which locks are held when this close happens?

bnxt_irq_affinity_update() takes only the netdev instance lock, through
bnxt_lock_sp():

bnxt_lock_sp() {
	clear_bit(BNXT_STATE_IN_SP_TASK, &bp->state);
	netdev_lock(bp->dev);
}

Unlike bnxt_rtnl_lock_sp(), it does not take RTNL. The err_reset path in
bnxt_queue_start() calls netif_close(dev), and __dev_close_many() begins
with:

	ASSERT_RTNL();
	might_sleep();

	list_for_each_entry(dev, head, close_list) {
		netpoll_poll_disable(dev);

		call_netdevice_notifiers(NETDEV_GOING_DOWN, dev);

Wouldn't this trigger the RTNL assertion?

The NETDEV_GOING_DOWN and NETDEV_DOWN notifiers and rtmsg_ifinfo() would
also run without RTNL. That lets them race with other RTNL holders that
don't take this device's instance lock.

The new comment "Failing to start a new queue may close the device"
expects this close path. With this patch, it can be reached on every
BNXT_SUPPORTS_QUEUE_API PF, not only in TPH mode.

>  			continue;
>  		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120035214.369158-1-kuba%40kernel.org

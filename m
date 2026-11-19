Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058513;
	b=1yDPu68xZHkDd9MlVFTG0CytXLvJ7JlJiIHv9/a1+MTK4Hi/NlidL7++Q6pW65ui87AI
	 2+ANtPRpByRbL2aUzOp1mQA8cok9pB6t+qv+yVvNfu0gedXO1eHYvbU3kLd5utFk7sTYV
	 IOia9W7+9gs+7vBsxRt2dR4/qSs2ads1UQUfeqK6CD05ozzRDSJhPbdZHpBvPwYEUfYXr
	 yBCLRBMmZGgXfEBziHOqaO3W2NR8RZZaKvyBOgysn7LzpbxvUx9SYTmw30Qa6Xb9imCmA
	 +njQcWWB/RnoiE4cWyDrB9RsyFG5HTP51IlRRb6UumBeL/gW4o1jd6AIN7vSjOhrd4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058513;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UyLUi1+1/tBeEtLf7/QqtxqCmuLdma61KC/Yyvt7xh0=;
	b=WEzpik35AZomjvnq19wbrEWFwm45bF9Y55s35Pw4f++rDqRD7C6vh4OyXiWy6ovU2mWt
	 kD1M1TDgDfWDLI4rp9slpL2VQwTvf2BTPz12v/n2EUmDB/qd3yBZNcUqdd2kR+cqINgD7
	 1hHQK+q4uVBrlsqKpZEZdxzF6DqOjZpt9InlUe2XRD65p+cfNJvsRpHhAoLo1lPIgrK8J
	 oINv9S05In3jO4QfO9YW4Fs6glYBSPilM9kLtH1MxcOA0aMQeyu+Wc9HvWK9l6yMXVIe8
	 c50ibLMqLnK0D+MqAR1zwsoU+RSSt2TCNpdSPfMoO97xKPTaHtoG+r2hcr7lL/4e2Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0cKBxlf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA96E606A332
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0cKBxlf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3334D1F000C5;
	Thu, 19 Nov 2026 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795058513;
	bh=UyLUi1+1/tBeEtLf7/QqtxqCmuLdma61KC/Yyvt7xh0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O0cKBxlfm6llXuek6UrBAPpH65cRdAj+i2KnpnTvzfpuU7YAgu9aikXR0BgPd4ugl
	 jXkLFWzMAExskPfUKIp5gqgki/s4XbNEmMWkA0nThzuvZ3kjDUkPfn4pA76PmEFPOy
	 RLIHn55UfyXw9tAodqSMnOGmMsdEKSHwl9Vqab0n3dycYMXxNYZfjBjHxXr1KVTYuJ
	 LulDdcWuprIFzA2YdLhstmojelRTNJP6f9ODKVMknHFE5EQZaP0ZLABzOgVYbV/eaR
	 NaGHtZSq7zElypEGOXcsFJfSOjEyhJ7ID6rVl0llfJ//skzebiM57CsXSHAtnA3CY0
	 pNOzdRkw3ltRw==
Subject: Re: [PATCH net-next 6/6] eth: bnxt_en: restart Rx queues when their
 IRQ moves to another NUMA node
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, pavan.chebbi@broadcom.com
Date: Thu, 19 Nov 2026 03:21:52 +0000
Message-ID: <179505851274.3136.4469982545223123709@kernel.org>
In-Reply-To: <20261118023905.3050661-7-kuba@kernel.org>
References: <20261118023905.3050661-7-kuba@kernel.org>
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

- [High] The new error handling in bnxt_irq_affinity_update() cannot
  work, and the path it targets oopses.
- [High] bnxt_irq_affinity_update() takes only the netdev instance lock,
  via bnxt_lock_sp() (not bnxt_rtnl_lock_sp()), before calling…
- [Medium] The code restarts more queues than the commit message and the
  new function comment describe ('Restart the Rx queues whose IRQ…

--

eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA node

This patch schedules the IRQ affinity update work on every device that
supports the queue API, instead of only when the TPH Steering Tag changes.
The work restarts an Rx queue when its page pool's nid differs from the
node of the CPU servicing the IRQ. After a failed restart it checks that
the device is still open.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 134b24842c4f2..5f4a8db1f8b58 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c

[ ... ]

> @@ -14663,7 +14662,10 @@ static void bnxt_rtnl_unlock_sp(struct bnxt *bp)
>  	rtnl_unlock();
>  }
>  
> -static void bnxt_tph_update(struct bnxt *bp)
> +/* Restart the Rx queues whose IRQ moved, if the move changed the TPH
> + * Steering Tag or the node the queue memory should be allocated on.
> + */
> +static void bnxt_irq_affinity_update(struct bnxt *bp)
>  {
>  	struct net_device *dev = bp->dev;
>  	int i;

[ ... ]

> @@ -14680,20 +14684,26 @@ static void bnxt_tph_update(struct bnxt *bp)
>  		map_idx = bnxt_cp_num_to_irq_num(bp, i);
>  		irq = &bp->irq_tbl[map_idx];
>  		tag = READ_ONCE(irq->new_tag);
> -		if (irq->tag == tag)
> -			continue;
> -
> -		if (pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
> +		if (irq->tag != tag &&
> +		    !pcie_tph_set_st_entry(bp->pdev, irq->msix_nr, tag))
> +			new_tag = true;
> +		if (rxr->page_pool->p.nid != bnxt_cp_num_to_node(bp, i))
> +			new_node = true;

[Severity: Medium]
The new function comment says only "Rx queues whose IRQ moved" are
restarted. Is that what this loop does?

An affinity notification for any one Rx IRQ queues
BNXT_IRQ_AFFINITY_SP_EVENT. This loop then compares every ring's
page_pool nid against bnxt_cp_num_to_node(bp, i), whether or not that
ring's IRQ moved.

For rings whose affinity was never set, bnxt_request_irq() leaves
ring_nid[i] as NUMA_NO_NODE. bnxt_cp_num_to_node() then falls back to:

	cpu = cpumask_local_spread(n, dev_to_node(&bp->pdev->dev));
	return cpu_to_node(cpu);

That result depends on cpu_online_mask at the time of the call.

After CPU hotplug (for example SMT disable or offlining CPUs), can this
fallback pick a different node from the one used at open? If so, moving
one unrelated IRQ would restart these other queues and move their memory
to the new default-spread node.

The comment in bnxt_request_irq() says this placement is "just a hint",
so the new node may not match where the IRQ actually runs.

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
If the restart fails because the device was closed, can this check ever
be reached? Here is the sequence I'm looking at:

bnxt_irq_affinity_update()
  netdev_rx_queue_restart(dev, i)
    netdev_rx_queue_reconfig()
      ndo_queue_stop(old_mem)        /* succeeds */
      bnxt_queue_start(new_mem)
        /* clone page_pool, rings and rx_tpa moved into bp->rx_ring[idx] */
        bnxt_hwrm_rx_ring_alloc() fails -> err_reset
        netif_close(dev)
          bnxt_close()->bnxt_close_nic()->__bnxt_close_nic()
            bnxt_free_mem(bp, true)
              kfree(bp->rx_ring);
              bp->rx_ring = NULL;
      err_start_queue:
      bnxt_queue_start(old_mem)
        rxr = &bp->rx_ring[idx];
        rxr->rx_prod = clone->rx_prod;   /* bp->rx_ring is NULL */

Wouldn't this hit a NULL pointer dereference in the sp workqueue while
netdev_lock is held, before control returns to this check?

If that step were survived, err_free_new_queue_mem would call
ndo_queue_mem_free(dev, new_mem). That runs page_pool_destroy() and
bnxt_free_ring() a second time on resources bnxt_free_mem() already
released.

The commit message says "check that the device is still up after
errors", which relies on this path returning normally.

Before this patch the path ran only on TPH Steering Tag changes.
bnxt_irq_affinity_notify() now queues the work on every queue-API PF,
and any cross-node Rx IRQ move restarts a queue. irqbalance or a write
to /proc/irq/N/smp_affinity is enough to trigger it. An HWRM failure
during queue start is the only other precondition.

[Severity: High]
bnxt_irq_affinity_update() starts with bnxt_lock_sp(bp). That only takes
netdev_lock(bp->dev), not RTNL.

The new comment expects this restart to close the device. The close
happens via bnxt_queue_start() err_reset -> netif_close(dev) ->
netif_close_many() -> __dev_close_many(), which begins with:

	ASSERT_RTNL();
	might_sleep();

It then calls the NETDEV_GOING_DOWN notifiers, dev_deactivate_many(),
rtmsg_ifinfo() and the NETDEV_DOWN notifiers.

Doesn't all of that run without RTNL here? That would trigger the
assertion and race with other RTNL holders.

Would bnxt_rtnl_lock_sp()/bnxt_rtnl_unlock_sp() be more appropriate,
as bnxt_reset() uses?

The old bnxt_tph_update() used the same helper, but it only ran on TPH
tag changes. With this patch the path runs for any cross-node IRQ move
on a queue-API PF. In the same failure, the core rollback then hits the
NULL bp->rx_ring dereference described above.

>  			continue;
>  		}
>  
> -		irq->tag = tag;
> +		if (new_tag)
> +			irq->tag = tag;
>  	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118023905.3050661-1-kuba%40kernel.org

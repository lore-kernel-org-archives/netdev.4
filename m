Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058512;
	b=3HSkX7Qs4MiELnAHwT9fJyEzw/+ZUE1wixW8ECem4HWxO64ZmMfe9aPN0InskkPWcTfY
	 0cwAr9/X6ZUeiNT0doFEEIIs1n9cTX8rWai1pmmHb9HkyvnQimVRIkawCU5rAm7ITTxt8
	 mGWFEUNj8vA6d7sHp8o2xwlAUjpEO2TUIm7sNy21YpxHecG9tkhriK5p2lhYz/RvIHpep
	 UIJyXKE9j2u4FDCjZHmshLPHCHm2flXb7lLz+ng28uPJ3JiIJasJQRYnYRdLjY0nu0n6g
	 kLrHF85fJ6xWNIW0y5hreeQ9xLHW9HujVVz7QzvnHay6P20FeelVhchLKBFlOZJ/JKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058512;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sygTKaQOi959GwISEgU9k6VTMlYety2yv6Nh8rJcTaU=;
	b=PIy45y/ls4yLF4rbqTPBjyq3skwNT4JDcY+WxskoPGahA3Dy2365IiOmwqHX/FqwPcci
	 mgjaP3DCulEB2AqhnzJ2S3DxA4N1ZV1zq17E/N9lL4W3EuWe/3x0YdKki/pdzEArYJmNy
	 DperwMluo9kr2OkRn0W4+EBYU0Rs7jeAVNgzYhHlEuRUHtcRqsqSkG5gkjKPEnZ0yrRz2
	 T435FsxEJ4qVEt+1ME+VH/aPRfZR+F7aBWvkUYdfzMNjyLyVdcAdUdu0tX67ODqG52oEP
	 7pt2n80fhWRY5VYGoi4+6mL6MnMKdMR+YRpMvP7Tmw/mzfsz1NpnhIa+1GiRDvO3XCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFdgdtZi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD519606A33D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 03:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFdgdtZi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0971A1F000C6;
	Thu, 19 Nov 2026 03:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795058512;
	bh=sygTKaQOi959GwISEgU9k6VTMlYety2yv6Nh8rJcTaU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PFdgdtZiL+P/1P50rHCUeXLl9fXWzmFD8yVoREpjfkArHXTqEee3hCuoNpz7iF5g8
	 YUyT18auEGn+OT5rkMlVrARxfv0Es/TX48UwhZ14lWhcwd8fTcbp29LTvRidETOo4D
	 y4HoHXtT1nXuLxsyHAyxqfm/qfoUisbKxZmbE1Llz0tK8qHTsh857V2a59ZrGaXnTM
	 u5u/XQATzpmRPX1riaJiGBBvA0/wUlwSzV4eNfieIFgeovDUKoIp7OLALqaUN5JObd
	 bTqJ2PTUeZbrvdtAWGS6Dxkuorw1chO/uU5Mw8iZuU6sg9rkd2X9YCj+OO7tcn4ZHH
	 MBj+u2c8IQ6Kg==
Subject: Re: [PATCH net-next 2/6] eth: bnxt_en: follow explicitly set IRQ
 affinity when placing page pool
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, pavan.chebbi@broadcom.com
Date: Thu, 19 Nov 2026 03:21:51 +0000
Message-ID: <179505851154.3136.10312778002934262803@kernel.org>
In-Reply-To: <20261118023905.3050661-3-kuba@kernel.org>
References: <20261118023905.3050661-3-kuba@kernel.org>
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

- [Medium] After a CPU hotplug event, bp->ring_nid[] can hold a stale
  node, and the open path allocates from that stale value before…

--

eth: bnxt_en: follow explicitly set IRQ affinity when placing page pool

Each Rx ring's page pool used to get its NUMA node from
cpumask_local_spread(). This patch uses the node recorded by the IRQ
affinity notifier instead, published through a new bp->ring_nid[]
array. Queue restart now looks up the node again rather than copying
the old page pool's nid.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 5ad2a3033505d..8e8ee02ca8d9b 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -3818,6 +3818,21 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
>  	return 0;
>  }
>  
> +/* Node of the CPU expected to service cp ring @n. If the IRQ affinity was
> + * configured from the outside (by the user or irqbalance) the affinity
> + * notifier recorded the node to use, otherwise follow our default spread.
> + */
> +static int bnxt_cp_num_to_node(struct bnxt *bp, int n)
> +{
> +	int nid = READ_ONCE(bp->ring_nid[n]);
> +	unsigned int cpu;
> +
> +	if (nid != NUMA_NO_NODE)
> +		return nid;
> +	cpu = cpumask_local_spread(n, dev_to_node(&bp->pdev->dev));
> +	return cpu_to_node(cpu);
> +}
> +

[ ... ]

> @@ -4036,8 +4050,7 @@ static int bnxt_alloc_rx_rings(struct bnxt *bp)
>  
>  		ring = &rxr->rx_ring_struct;
>  
> -		cpu = cpumask_local_spread(i, numa_node);
> -		cpu_node = cpu_to_node(cpu);
> +		cpu_node = bnxt_cp_num_to_node(bp, i);
>  		netdev_dbg(bp->dev, "Allocating page pool for rx_ring[%d] on numa_node: %d\n",
>  			   i, cpu_node);
>  		rc = bnxt_alloc_rx_page_pool(bp, rxr, cpu_node);

[ ... ]

> @@ -11877,6 +11892,14 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
>  	cpumask_copy(irq->bp->ring_cpu_mask[irq->ring_nr], mask);
>  	set_bit(irq->ring_nr, irq->bp->ring_affinity_set);
>  
> +	/* Allocation paths don't hold any lock which would exclude us,
> +	 * publish the node to allocate on instead of making them parse
> +	 * the mask while it may be getting overwritten.
> +	 */
> +	cpu = cpumask_first_and(mask, cpu_online_mask);
> +	nid = cpu < nr_cpu_ids ? cpu_to_node(cpu) : NUMA_NO_NODE;
> +	WRITE_ONCE(irq->bp->ring_nid[irq->ring_nr], nid);
> +

[ ... ]

> @@ -12066,6 +12098,7 @@ static int bnxt_request_irq(struct bnxt *bp)
>  		if (!test_bit(i, bp->ring_affinity_set) ||
>  		    !cpumask_intersects(cpu_mask, cpu_online_mask)) {
>  			clear_bit(i, bp->ring_affinity_set);
> +			WRITE_ONCE(bp->ring_nid[i], NUMA_NO_NODE);
>  			cpumask_clear(cpu_mask);
>  			cpumask_set_cpu(cpumask_local_spread(i, numa_node),
>  					cpu_mask);

[Severity: Medium]
Can ring_nid[i] already be stale when bnxt_alloc_rx_rings() reads it?

A real node is only recorded in bnxt_irq_affinity_notify(). It is
computed once, from cpumask_first_and(mask, cpu_online_mask).

When those CPUs go offline later, the IRQ core moves the IRQ through
migrate_one_irq()->irq_do_set_affinity(). That path does not schedule
the affinity notify work, so ring_nid[i] keeps the old node.
bnxt_cp_num_to_node() returns any value that isn't NUMA_NO_NODE as-is.

The reset added here is in bnxt_request_irq(). In __bnxt_open_nic(),
the allocations run before it:

__bnxt_open_nic()
    rc = bnxt_alloc_mem(bp, irq_re_init);
        bnxt_alloc_rx_rings()
            bnxt_cp_num_to_node()    <- returns stale ring_nid[i]
    ...
    rc = bnxt_request_irq(bp);
        WRITE_ONCE(bp->ring_nid[i], NUMA_NO_NODE);

Suppose ring i's IRQ affinity is set to CPUs on node X, all of those
CPUs go offline, and the interface is closed and reopened. Would the
page pool, the Rx/agg descriptor rings and the agg bitmap for ring i
then be placed on node X, while the IRQ hint goes to
cpumask_local_spread(i, numa_node)?

This branch uses irq_update_affinity_hint(), so no notifier runs
afterwards to fix the placement for the rest of the open cycle. Before
this patch, the allocation and the IRQ hint both came from
cpumask_local_spread() and matched.

There is a related case when the mask spans nodes and only its first
online CPU goes offline. ring_nid[i] keeps the old node until
irq_set_affinity_and_hint() in the next bnxt_request_irq() fires the
notifier again. That also happens after bnxt_alloc_mem() has already
used the value.

Later in the series, "eth: bnxt_en: allocate fast path DMA rings on the
queue's NUMA node" and "eth: bnxt_en: allocate per-queue SW state on the
queue's NUMA node" use the same value for more allocations: cp rings,
Tx rings, tx_push, stats and TPA info.

"eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA
node" restarts Rx queues only from the notifier. That covers the
spanning-mask case, but only for Rx page pools. It does not cover the
case where all CPUs in the mask go offline, because no notifier runs
there.

The new comment on ring_nid in bnxt.h says the field is "Written by the
affinity notifier". bnxt_alloc_ring_cpu_masks() and bnxt_request_irq()
also write it. After hotplug, the value is also not guaranteed to be
the node of an online CPU in the mask.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118023905.3050661-1-kuba%40kernel.org

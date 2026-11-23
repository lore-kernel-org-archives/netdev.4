Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405974;
	b=2bka6TkN/xOVlV+VoFyg6Vjj+2NYCI91nujol038p+zpxGqy5wCk+JJmCZYlY6HQzE5O
	 w1oqwM+Bnnx/qgbS9UFOI66B99cZcsnHvYzEyx4LxG87W+1c5Rk+xevSuHRpf6NzBUyj0
	 N3bqa8JRYorDOWDaOE35pB+Hqyd7q+Trq+AtstRfy0fluSm72xwr35iECf2qqU3jW/Bto
	 8/UIMrpcOTLfo6d496Ajui8/IV+y3bgwyknoLUKFbS5qNFtZlt/Yh2sm7vt3oKJNes2xh
	 iRy+2QdTLe8lzkrY1x+QSG1g7VRZXYxbVe59/0ljQob/1ub9J0JVCelGsq2R1VYNcJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405974;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GWeUgN1Q3s4O4ED86ec2MQb2aOQNQReapQTsz0PBSns=;
	b=vYazHSiOwC9djbLWGbxoic5/l8XAUFaytWzYItxvzEvD6uSEd966/GI+oQddT9QBgII2
	 kYKs+qak4LHcXQHmyuTMalWhHnQCO2mIMTKPX7yIg1gV6WqyjTAHf1u05+qOraygOIRhn
	 78OaNNTnrPUFz/xukmeyW61AoaHwqThoGnVTRAXv2eaN8KiTVnjsAioW1tjw1Wx1kDHNa
	 3HzUIezrpchqEMXpiyzWCrfmxjI1TiCIsgOEc3gkSQLqhdoUFGNogJ/VFyz2jZNeHWeOs
	 u2qyEEWzLvfR3uewWBOJQJNy8bi+c2B20X6Fr9NrjqA8793i3MXNO1iboLXAWKJGx3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Twq9Rx0b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBCF606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Twq9Rx0b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBB31F000CA;
	Mon, 23 Nov 2026 03:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795405973;
	bh=GWeUgN1Q3s4O4ED86ec2MQb2aOQNQReapQTsz0PBSns=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Twq9Rx0b3uValQi+eiTTBRZEAwTDH6diDA0w8yfrusoFdaRCq/N+wkKrtM6oL3oYG
	 a0dQc4SX2fuAiQtfHJnkN9r78Gao+NXCLyohukiH8PACLaGR4BAjyimXfHokjBCSe6
	 hXye8S3/5J8QOPxZ8V7x3kmQPcXM3mGuf31xBznh5JPKbBhccBOJpQ29THpDJxk8VX
	 RFnZkKBpxjD3/PLsbkpP1zTCgFbEfKnK4f/p0dVlz93wes0FE58wIlUrut8eybATLL
	 OrCzksscsba0nkUX8oDh7rrc5xSxscMfIhGZ8W2a1x5t7PDLmp5xMzQhCPD3v8G5uW
	 bPZIgfj0jFVYA==
Subject: Re: [PATCH net-next v2 2/7] eth: bnxt_en: follow explicitly set IRQ
 affinity when placing page pool
From: netdev-bot+sashiko@kernel.org
To: kuba@kernel.org
Cc: davem@davemloft.net, michael.chan@broadcom.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, pavan.chebbi@broadcom.com, bjorn@kernel.org, joe@dama.to
Date: Mon, 23 Nov 2026 03:52:52 +0000
Message-ID: <179540597280.3135.6843062872659992639@kernel.org>
In-Reply-To: <20261120035214.369158-3-kuba@kernel.org>
References: <20261120035214.369158-3-kuba@kernel.org>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The page pool's NUMA node is chosen from a cached
  bp->ring_nid[] entry before the driver checks whether that entry has…

Pre-existing issues:
- [Low] Two different CPUs can be taken from the same affinity mask.

--

eth: bnxt_en: follow explicitly set IRQ affinity when placing page pool

This patch makes the NUMA node of the Rx page pool follow IRQ affinity
that the user set explicitly. The affinity notifier computes the node of
the first online CPU in the mask and publishes it in a new bp->ring_nid[]
array. bnxt_alloc_rx_rings() and bnxt_queue_mem_alloc() look the node up
through a new helper, bnxt_cp_num_to_node(), which falls back to
cpumask_local_spread() when no affinity was set.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index fe90689e4079d..96f226165ed94 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -3823,6 +3823,20 @@ static int bnxt_alloc_ring(struct bnxt *bp, struct bnxt_ring_mem_info *rmem)
>  	return 0;
>  }
>  
> +/* Node of the CPU expected to service cp ring @n. If user did not configure
> + * the affinity explicitly, use the default spread (historic behavior).
> + */
> +static int bnxt_cp_num_to_node(struct bnxt *bp, int n)
> +{
> +	int nid = READ_ONCE(bp->ring_nid[n]);
> +	unsigned int cpu;
> +
> +	if (nid != NUMA_NO_NODE)
> +		return nid;

[Severity: Medium]
Can this return a stale node when the recorded mask no longer has any
online CPU?

The only place that resets ring_nid[i] to NUMA_NO_NODE for a stale mask
is bnxt_request_irq(). In __bnxt_open_nic(), memory is allocated before
the IRQs are requested:

__bnxt_open_nic() {
    ...
	rc = bnxt_alloc_mem(bp, irq_re_init);
    ...
	if (irq_re_init) {
		bnxt_init_napi(bp);
		rc = bnxt_request_irq(bp);
    ...
}

This means bnxt_alloc_mem()->bnxt_alloc_rx_rings()->bnxt_cp_num_to_node()
reads ring_nid[i] before this check runs:

	if (!test_bit(i, bp->ring_affinity_set) ||
	    !cpumask_intersects(cpu_mask, cpu_online_mask)) {
		clear_bit(i, bp->ring_affinity_set);
		WRITE_ONCE(bp->ring_nid[i], NUMA_NO_NODE);

Here is one sequence. The user pins ring i through
/proc/irq/N/smp_affinity, the device is closed, and then every CPU in
that mask goes offline. The notifier was released with the IRQs, and
hotplug IRQ migration does not call it.

On the next open, the page pool and ring memory are allocated on the old
node. bnxt_request_irq() then moves the IRQ to
cpumask_local_spread(i, numa_node), which may be on a different node.
Before this patch, both used cpumask_local_spread() and ended up on the
same node.

bnxt_half_open_nic() calls bnxt_alloc_mem() but never calls
bnxt_request_irq(), so on that path the stale value is never corrected.

The later patch in the series ("restart Rx queues when their IRQ moves to
another NUMA node") does not seem to fix this either. Its
bnxt_irq_affinity_update() only acts when nid != NUMA_NO_NODE, and
bnxt_request_irq() has just reset ring_nid to NUMA_NO_NODE. The mismatch
would last until the next affinity change or close/open.

At that point the comment on ring_nid in bnxt.h ("NUMA node of the first
online CPU in the affinity mask") also does not hold.

Would it work to check cpumask_intersects() in bnxt_cp_num_to_node(), or
to invalidate stale entries before bnxt_alloc_mem() runs?

> +	cpu = cpumask_local_spread(n, dev_to_node(&bp->pdev->dev));
> +	return cpu_to_node(cpu);
> +}

[ ... ]

> @@ -11882,6 +11896,14 @@ static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
>  	cpumask_copy(irq->bp->ring_cpu_mask[irq->ring_nr], mask);
>  	set_bit(irq->ring_nr, irq->bp->ring_affinity_set);
>  
> +	/* Readers can't access ring_cpu_mask atomically, so pre-compute
> +	 * the info they care about (NUMA node, TPH tag) and store it
> +	 * with WRITE_ONCE().
> +	 */
> +	cpu = cpumask_first_and(mask, cpu_online_mask);
> +	nid = cpu < nr_cpu_ids ? cpu_to_node(cpu) : NUMA_NO_NODE;
> +	WRITE_ONCE(irq->bp->ring_nid[irq->ring_nr], nid);

[Severity: Low]
This is a pre-existing issue and was not introduced by this patch. The
TPH steering tag later in this same notifier is still computed from
cpumask_first(mask):

	if (pcie_tph_get_cpu_st(irq->bp->pdev, TPH_MEM_TYPE_VM,
				cpumask_first(mask), &tag))
		return;

The ST table init in bnxt_request_irq() also uses
cpumask_first(cpu_mask). A user-written mask only has to overlap the
online mask, so its lowest CPU can be offline.

With such a mask, the steering tag targets one CPU, while
bnxt_queue_mem_alloc()->bnxt_cp_num_to_node() places the page pool on
the node of a different CPU.

Before this patch the page pool node ignored the mask entirely, so this
patch narrows the mismatch rather than causing it. Could the node and the
tag both use the first online CPU in the mask, so that they stay
consistent?

>  #ifdef CONFIG_RFS_ACCEL
>  	if (irq->bp->dev->rx_cpu_rmap && irq->ring_nr < irq->bp->rx_nr_rings) {
>  		int err;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120035214.369158-1-kuba%40kernel.org

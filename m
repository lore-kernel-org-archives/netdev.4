Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515640;
	b=ufTNtWvMFKyG3VG91zhwq1csSjyhmvmzlOesv+dxDDWZNh6+e7BTsrjxxPpnlyQkKxjm
	 T9PNXmpRW6i+pqUY8WtYztCZy/B2QUjelRynySpWNTsz4E6NIAa0salsNW60xMWBpNIe9
	 0ifKkwjysIORBidf0wHF7hnaoeXN3zZexDJXOwxXVSta03c6ULfgCeR3q8Xm+A+DgXGKe
	 T6p19/QCLckY0LTQDiLtJ2+gjonQG/MDDv3zC4tp+TEuS4q5aywklIVsq0ua+g++5A5r+
	 g5S+KXpRyVvK7pN8+qH+LKDfVNOe8p9nSBRS4GyUhXmG2oxOY6TZqXL8M1p+j3XItnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515640;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IzovKTY4qblqWXjlL7zCCsqPtucuy5C4aj0796M/OFw=;
	b=O7YxS/5TRzSXCwG+Jgs6GVagrGR4lrCvbAFL2FtrYhTtGq4elIHYjhgPlQCNox2eBARX
	 2pnuw4goxB65KlM02P4izh7oE1s/OdR0AFh2FVOHBpOBPAHuK1dYR1SPCfGtJX6fyVfHd
	 GkhaZMVDWjziOeDaHcXMOQLHPLQ8NmmHaK2VU4m3ks07rQXoHv4cT923rPxnAkMtTLiLt
	 hRMwl/aHxFYdfQR4RPcUx5KJSrAxGL0offhy4yty6nikzsRKVQX4ER8LzGOsOLQZ6C31o
	 YX8xv88PxqC4oq1FfPq/PrAskS/tV5CjtR3jPc+k1ZPP2hCLhylCuWpue74df91eP0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWIUqj2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91309606A33C;
	Tue, 24 Nov 2026 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWIUqj2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622B31F00ADE;
	Tue, 24 Nov 2026 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515640;
	bh=IzovKTY4qblqWXjlL7zCCsqPtucuy5C4aj0796M/OFw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BWIUqj2lKXwwjVzRgWz10kZDaOlW3UEdJJIg7QSAMtR3UOVoIeh2z5LMEdrzSQlIb
	 uTFW2a+eOVwVqD0ZXqaVRBWJel00ZCP1AhbMm3oUuTNR3K0XM9AZUDDJhWl3CvQLuA
	 ZiSEq20XGzYZJF3ZSTaZoMY+DrTF9d0YvsZUMNjoOn3pj8Iw8s3alLo8eh41tIRxeD
	 O0b950Mt1tZvMOpigvVn9SmjhCque/P01B0/Gkl+8IbER3ULV3FQ+TVHSAQMfUjfxE
	 mqxi3FdkCZXwzdJfQaT4HX72qszJsxGXCBcPt9nzWLBHToyDRjm7YALcZ4Q5z4uGoF
	 GY+tWv+c9OoOg==
Subject:
 Re: [PATCH net-next v9 10/10] bnge: add cpu_rmap support for IRQ affinity
From: netdev-bot+sashiko@kernel.org
To: vikas.gupta@broadcom.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bhargava.marreddy@broadcom.com, rahul-rg.gupta@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, rajashekar.hudumula@broadcom.com,
 dharmender.garg@broadcom.com, ajit.khaparde@broadcom.com
Date: Tue, 24 Nov 2026 10:20:38 +0000
Message-ID: <179551563894.3135.1768774823155933236@kernel.org>
In-Reply-To: <20261123100746.1975030-11-vikas.gupta@broadcom.com>
References: <20261123100746.1975030-11-vikas.gupta@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Off-by-one between aRFS rmap slots and RX queues: RX ring 0's
  vector is never added to dev->rx_cpu_rmap, so every rule the kernel…
- [Medium] bnge_free_cpu_rmap() assumes each reader loads
  dev->rx_cpu_rmap once, but set_rps_cpu() loads it twice.

--

bnge: add cpu_rmap support for IRQ affinity

This patch allocates dev->rx_cpu_rmap when NTUPLE is enabled under
CONFIG_RFS_ACCEL. It adds each RX ring's IRQ vector to the rmap when the
open-time IRQs are requested, and frees the rmap in bnge_free_irq(). This
is the patch that turns on aRFS for bnge.

> diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> index de7320521a3e0..dcd073d8bdfac 100644
> --- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
> +++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c

[ ... ]

> @@ -2569,15 +2583,53 @@ static void bnge_nq_free_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
>  	irq->requested = 0;
>  }
>  
> +#ifdef CONFIG_RFS_ACCEL
> +/* set_rps_cpu() reads rx_cpu_rmap under rcu_read_lock(). Hide the pointer and
> + * wait for readers that already loaded it before the rmap is freed.
> + */
> +static void bnge_free_cpu_rmap(struct bnge_net *bn)
> +{
> +	struct cpu_rmap *rmap = bn->netdev->rx_cpu_rmap;
> +
> +	if (!rmap)
> +		return;
> +
> +	WRITE_ONCE(bn->netdev->rx_cpu_rmap, NULL);
> +	synchronize_net();
> +	free_irq_cpu_rmap(rmap);
> +}

[Severity: Medium]
Does this teardown hold up given how set_rps_cpu() reads the pointer? The
comment assumes each reader loads dev->rx_cpu_rmap once. set_rps_cpu() in
net/core/dev.c loads it twice, both times with plain loads:

net/core/dev.c:set_rps_cpu() {
    ...
	if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
	    !(dev->features & NETIF_F_NTUPLE))
		goto out;
    ...
	rxq_index = cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
    ...
}

cpu_rmap_lookup_index() dereferences rmap->near[cpu] without checking for
NULL.

Suppose a reader passes the NULL check before the WRITE_ONCE() and does
the second load after it. Wouldn't it dereference NULL? synchronize_net()
only delays the free, so it can't close that window.

bnge_close_core() disables NAPI before it calls bnge_free_irq(), so the
device's own RX path is quiet by then. But IFF_UP is still set during
ndo_stop. A netif_rx() caller can still reach
get_rps_cpu()->set_rps_cpu() when RFS is configured, if skb->dev is this
netdev and queue_mapping is recorded. One example is multicast loopback
of a forwarded packet via dev_loopback_xmit(), which keeps the ingress
queue_mapping.

If such a reader exists, this code turns a use-after-free into a window
for a NULL dereference. If no such reader can exist, then the
synchronize_net() and the comment aren't needed for the reason the
comment gives.

Could set_rps_cpu() load the pointer once with READ_ONCE(), or use proper
RCU annotation? Separately, could the comment here avoid claiming
protection it doesn't provide?

[ ... ]

>  static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
>  {
>  	int map_idx = bnapi->nq_ring.ring_struct.map_idx;
> +	struct cpu_rmap *rmap = NULL;
>  	struct bnge_dev *bd = bn->bd;
>  	struct bnge_irq *irq;
>  	int rc;
>  
> +#ifdef CONFIG_RFS_ACCEL
> +	rmap = bn->netdev->rx_cpu_rmap;
> +#endif
> +
>  	irq = &bd->irq_tbl[map_idx];
>  
> +	if (IS_ENABLED(CONFIG_RFS_ACCEL) &&
> +	    rmap && bnapi->rx_ring) {
> +		rc = irq_cpu_rmap_add(rmap, irq->vector);

[Severity: High]
Is RX ring 0's vector ever added to the rmap?

bnge_alloc_core() makes NQ0 bnapi[0] and binds the RX rings starting at
index 0:

	bn->bnapi[0] = bn->nq0;
	...
		bn->bnapi[i]->rx_ring = &bn->rx_ring[i];

So NQ0 (irq_tbl[0]) services RX ring 0.

NQ0's IRQ is only requested at probe, through
bnge_nq0_init()->bnge_nq_request_irq(). At that point dev->rx_cpu_rmap
and nq0->rx_ring are both NULL, so this block is skipped.

At open, bnge_setup_interrupts() allocates an rmap with bd->rx_nr_rings
slots. bnge_request_irq() then walks only bnge_for_each_open_nq(), which
starts at BNGE_FIRST_OPEN_NQ (1). cpu_rmap_add() hands out the first free
slot. RX ring 1's vector gets slot 0, ring 2's gets slot 1, and so on, and
the last slot stays empty.

Now suppose next_cpu in set_rps_cpu() is the affinity CPU of ring k+1's
vector. cpu_rmap_lookup_index() returns k, and bnge_rx_flow_steer()
writes:

	new_fltr->base.rxq = rxq_index;

The flow then lands on ring k, whose IRQ is affined to
cpumask_local_spread(k) rather than next_cpu. On later packets rxq_index
matches skb_get_rx_queue(skb), so set_rps_cpu() leaves the wrong
placement in place.

The commit message says the rmap lets aRFS "correctly map flows to the RX
queues serviced by the nearest CPU". It also guards against a later ring
taking a free slot and mapping "to the wrong RX queue". Doesn't the
missing ring 0 cause that same shift on every open when there is more
than one RX ring?

One possible fix is to add irq_tbl[0]'s vector for RX ring 0 at open
time, before the open NQs. NQ0's IRQ stays requested across close, so its
affinity notifier would also need to be cleared at close.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123100746.1975030-1-vikas.gupta%40broadcom.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395971;
	b=J+TB9BmQuqhYa1OIEWJ1l1d73Stcj9SI4SBsWIIaIlQh9xcaRaeevCW+6mc3ZS99TwiV
	 i9MABR6o3YKb9vK8MwvmwQNGumFhadU9AG8SoP7JVrWmvJWQXHSkg1+JnzR7GfMEogH/H
	 5FfMJpA4+IyW9uIZLaiifPuDeh4v6XBNF5bBYQFNzizq59zuBbHTKDg4PpSqnqL9o1CIO
	 X5rTp5HNB/e56ezE0sY3ayNpyWIUmbCd3mMN1KiDHVJ4x/qMKDQhZdnra0fj++IjMOXUP
	 0vBmxZSNRjw73IjBQNEGc3yAcALtOzzHamsxOw2XYcrDaHwnyWvP5ByiDSED2p5xa2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395971;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cJ7NUMGwLfTWrECF1miPTjZFFRtfLbQ3wKxWhov3nIo=;
	b=wZxaUl+qMU8c0MeCcrP1Wn3+JAM8fUTXonuwOltWX9MotskEJxqHqm2Xj4LjpOQWwUNL
	 rF1sOc2dYKPgpuZVHRGEIz2B/K/91RAdgb48B5G9CVcgDL145MItjHJmB0QmTzMQoQs8Q
	 LNj4iDjcFLTS4B/LcvFjsTUz8QORVxIAhc94zoiSuU8Ws/R5hPASbbbrb7DoAlNvonRYz
	 b49VCgyke+iTw3R4q2HXkpTl2d5ARam5l61bMKpNLMfMQlIeab89L1uWq6rm2VZi+M0St
	 U/ZfxOnKdOZgDXwTY2fMtTH3qD729+CpFO4k/F9F6lnE2fHqQPxqU9ejUjYPwPQWfAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QvcaYkKC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C46606A31D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QvcaYkKC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D0F1F000C0;
	Mon, 23 Nov 2026 01:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395971;
	bh=cJ7NUMGwLfTWrECF1miPTjZFFRtfLbQ3wKxWhov3nIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QvcaYkKC4G2oQzlD44duBsrNEz6biI0Q4oN6LFVMO2j6yeyKNj4w7yjaJjJcGPH1x
	 qaLLQ6IdqspEnG+RYMvGOH0N6LikLfZPOsxZn8g+pGCrwDd2wxN4NLGNb44zBAQ4f5
	 1720udNgQory108y0R7qaR1PVfCxgGi5e8n82/GJGmtjq3uLSKhIZTupRuvwtOAnqj
	 PgJZ0bC6DhwPjEc+EArX0MV703hUkS2/WMFVvpi+78J0oiI9xi4/LQlQ2ANTCNECFq
	 dxHu8azi6/bGiEH9Qv8SAIEAt2S1LSueEM67x1hguJPVWoNpoYiJpMtXEiWwccDFPC
	 MYpmFrCF4sJ+Q==
Subject: Re: [PATCH net-next 5/8] ibmveth: Refactor TX resource allocation in
 open/close paths
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Mon, 23 Nov 2026 01:06:09 +0000
Message-ID: <179539596966.3135.308887197140765933@kernel.org>
In-Reply-To: <20261119000711.18093-6-mmc@linux.ibm.com>
References: <20261119000711.18093-6-mmc@linux.ibm.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In ibmveth_open() (drivers/net/ethernet/ibm/ibmveth.c), this
  patch moves the TX long-term-buffer DMA mapping…
- [Low] The commit is titled and framed as a refactor ("Move TX LTB
  allocation and free ... into ibmveth_alloc_tx_resources() and…

--

ibmveth: Refactor TX resource allocation in open/close paths

This moves TX long-term buffer allocation and free into the new helpers
ibmveth_alloc_tx_resources() and ibmveth_free_tx_resources(). It also
moves the TX LTB allocation in ibmveth_open() to after RX and NAPI are
running. To cover that, it adds netif_tx_disable() at the start of open()
and starts the queues under netif_tx_lock_bh().

> open() now allocates the TX LTBs last, after RX is running. It stops
> TX with netif_tx_disable() first: on a first open the queues are not
> DRV_XOFF, so generic XDP_TX could transmit before the LTBs exist. It
> starts TX under netif_tx_lock_bh() once they do. A TX allocation
> failure unwinds RX the way close() does.

[Severity: Low]
This isn't a bug, but could the commit message say why the reorder is
needed?

The subject and first paragraph present this as a refactor into helpers.
The patch also changes the bring-up order of ibmveth_open(). Before this
patch, the TX LTBs were allocated right after ibmveth_alloc_rx_queues().
That was before h_register_logical_lan() and before NAPI was enabled.

Three of the changes are only needed because of the new order:

  - the new netif_tx_disable() at the top of open()
  - the netif_tx_lock_bh() around netif_tx_start_all_queues()
  - unwinding the whole RX bring-up when the TX allocation fails

The window that the netif_tx_disable() comment describes ("once NAPI is
up and before the LTBs exist") did not exist before this patch.

Would the ordering change fit better in its own patch with a stated
reason, separate from the helper refactor?

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index ab5df17940042..8f32f75f2d7fd 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c

[ ... ]

> @@ -1096,12 +1143,6 @@ static int ibmveth_open(struct net_device *netdev)
>  	if (rc)
>  		goto out_free_filter_list;
>  
> -	rc = -ENOMEM;
> -	for (i = 0; i < netdev->real_num_tx_queues; i++) {
> -		if (ibmveth_allocate_tx_ltb(adapter, i))
> -			goto out_free_tx_ltb;
> -	}
> -
>  	mac_address = ether_addr_to_u64(netdev->dev_addr);
>  
>  	rxq_desc.fields.flags_len = IBMVETH_BUF_VALID |

[ ... ]

> @@ -1136,26 +1177,35 @@ static int ibmveth_open(struct net_device *netdev)
>  	 */
>  	rc = ibmveth_setup_rx_interrupts(adapter);
>  	if (rc)
> -		goto out_free_buffer_pools;
> +		goto out_unregister_lan;
>  
>  	netdev_dbg(netdev, "initial replenish cycle\n");
>  	ibmveth_schedule_rx_queue(adapter, 0);
>  
> +	rc = ibmveth_alloc_tx_resources(adapter);
> +	if (rc)
> +		goto out_cleanup_rx_interrupts;

[Severity: Medium]
With the new order, can open() fail on CMO partitions where the old order
worked?

With FW_FEATURE_CMO, every VIO DMA mapping draws on the device's IO
entitlement through vio_dma_iommu_map_phys()->vio_cmo_alloc(). That call
returns -ENOMEM when the free reserve plus the excess pool is smaller than
the request.

By the time ibmveth_alloc_tx_resources() runs, NAPI is enabled and
ibmveth_schedule_rx_queue(adapter, 0) has scheduled the first replenish.
The replenish runs in NET_RX softirq, either in ksoftirqd or at the next
IRQ exit. It can map and post every RX pool buffer before or while the TX
LTBs are mapped:

ibmveth_open()
  ibmveth_setup_rx_interrupts()
  ibmveth_schedule_rx_queue()
    __napi_schedule()
      ibmveth_poll()
        ibmveth_replenish_task()
          dma_map_single()      <- per RX buffer, uses entitlement
  ibmveth_alloc_tx_resources()
    ibmveth_allocate_tx_ltb()
      dma_map_single()          <- can now return DMA_MAPPING_ERROR

The two failures are handled differently. An RX mapping failure in
ibmveth_replenish_buffer_pool() bumps replenish_add_buff_failure and
breaks out of the loop.

A TX LTB mapping failure makes ibmveth_alloc_tx_resources() return
-ENOMEM. open() then tears down the IRQs, the logical LAN registration and
the RX pools, and the interface does not come up.

The direct close()/open() pairs (change_mtu, pool sysfs, set_csum and
set_tso) are affected too. There, IFF_UP stays set but the adapter is not
open.

Before this patch, the TX LTBs were mapped before any RX buffer went to
PHYP, so TX always got entitlement first.

ibmveth_get_desired_dma() seems to make this more likely:

drivers/net/ethernet/ibm/ibmveth.c:ibmveth_get_desired_dma() {
    ...
	/* add size of mapped tx buffers */
	ret += IOMMU_PAGE_ALIGN(IBMVETH_MAX_TX_BUF_SIZE, tbl);
    ...
}

This counts one 64K TX buffer, but open() maps one LTB per real TX queue.
The default is min(num_online_cpus(), 8) queues, so up to 512K. Once RX
has taken its share, is there any entitlement left for TX?

The order is the same at the end of the series. In "ibmveth: Split RX
poll into per-slot helpers for MQ", ibmveth_alloc_tx_resources() still
comes after ibmveth_schedule_rx_queue().

> +
> +	/* Start under the xmit lock so a sender that tests DRV_XOFF
> +	 * there sees the LTBs this open just published.
> +	 */
> +	netif_tx_lock_bh(netdev);
>  	netif_tx_start_all_queues(netdev);
> +	netif_tx_unlock_bh(netdev);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119000711.18093-1-mmc%40linux.ibm.com

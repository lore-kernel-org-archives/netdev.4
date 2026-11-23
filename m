Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394675;
	b=jkjnWmwvnC2rm46VKqMAYqx9XPLtVLKR3gm6erdFyDqBNc6GOnU6SOyaset8OKwh/4P4
	 p5i33hnBWlAVKdyohfCcACiHEL7MIkWUJabj6kB19FZ1SBYmR8u5oY+G8cyNKxLAD4Z55
	 0XSyOxv+sxwcS8WpA55159xTdZWOnn2Xjcugjd42JW/tu+fjGe3+I/HvTqaZ98HeULjHx
	 GsUjnPmh8r1AE6PloigSs/Xd68BruWzN/ej2mS77OFexrJ16NMQRAFFQhIDmMIZOpvdHT
	 m8yO/+G7Ycy+EM1wZk4ljEM+Q3TkpUevNLLQuYSXFTD4I3YntRkgTF6qdfnzmRj+0SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394675;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=b9scxl8T8Qmpo4ViZYc3RgT+CqJzl0k4iJX8+yFHT7g=;
	b=vmWryPQe7NFKw0IZCoFlXT9vTOKRifw8gYEdjW3U+CR6tp5wZ1lVnf2QynW/Ip06ytqW
	 UC8FHL8p9PiPovPE9XEqCx+RBuMfXVbg7JXnqssnV+EZAyKQ8pVmudc2b47+a1z20NbQf
	 RcfrrnYCUfhz1PGKgVePaA9XKO86TO7CxdXRz8+7t8P+hcCmsbqtoM+ZzeBgoa8EApVqo
	 pR85uREoVw0jvT5owLTpqSaDHeLery6rISl0jHIY9WeqAFQ/cWR5/bT2fD+WG9W+3Bave
	 TEcpbThDdbXI7qEmzIS7IS1dXlrcZEHqV/OqCdhByuhNhUpUj6Slgw0bKGqjMjZ3XGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KvPWF18/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FE606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KvPWF18/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AF01F000C6;
	Mon, 23 Nov 2026 00:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394674;
	bh=b9scxl8T8Qmpo4ViZYc3RgT+CqJzl0k4iJX8+yFHT7g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KvPWF18/FXTCWvJKhWogtxpAnqDjfNDHQzmdXh0Ms+TLQKmwAK4J2d7KKp9jGY/4b
	 G/LPYkNDKb/MHQd7qGcGc/M7noidHTBy4d1if/JcYhDl6DGDMHcCWnDf6is9Q7gEwf
	 il1UVbQEACUFOm1iZ0pGyjPSayiPYW5LK4A2m9HLva5jkeVPvkQ/aU8T0TxlTF059E
	 tBSDsAiZw1cBqEaMHwBlP8KOq+rqbqvBYJ+q02dCf45Vta+bx0rxwjaMiHuA4aAy5H
	 wtRpw4wkfuLeyhklrCNt81qtaY9ZH72S4nJF/JQU4v0aOdW0bcdVr5d9npE3fkYWZF
	 PdKsfwLvga7cQ==
Subject: Re: [PATCH net-next 1/2] ibmveth: drop TX on a queue whose long term
 buffer was freed
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, nnac123@linux.ibm.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Mon, 23 Nov 2026 00:44:32 +0000
Message-ID: <179539467281.3135.6706630717389291385@kernel.org>
In-Reply-To: <20261119000235.15622-2-mmc@linux.ibm.com>
References: <20261119000235.15622-2-mmc@linux.ibm.com>
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

- [Medium] The new NULL check in ibmveth_start_xmit()
  (drivers/net/ethernet/ibm/ibmveth.c:1312) depends on the sender seeing…
- [Low] The patch treats adapter->tx_ltb_ptr[] as lockless-read state.

--

ibmveth: drop TX on a queue whose long term buffer was freed

This patch makes ibmveth_start_xmit() read the TX long term buffer
pointer once with READ_ONCE() and drop the packet if it is NULL. The NULL
store in ibmveth_free_tx_ltb() is annotated with WRITE_ONCE(), and
ibmveth_set_channels() switches from netif_tx_stop_all_queues() to
netif_tx_disable() so in-flight senders leave before LTBs are changed.

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index 05d6b60cd187d..faacff14841b4 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -599,7 +599,7 @@ static void ibmveth_free_tx_ltb(struct ibmveth_adapter *adapter, int idx)
>  	if (!ptr)
>  		return;
>  
> -	adapter->tx_ltb_ptr[idx] = NULL;
> +	WRITE_ONCE(adapter->tx_ltb_ptr[idx], NULL);
>  	dma_unmap_single(&adapter->vdev->dev, adapter->tx_ltb_dma[idx],
>  			 adapter->tx_ltb_size, DMA_TO_DEVICE);
>  	kfree(ptr);

[Severity: Low]
This isn't a bug, but the lockless annotation here covers only one of the
two writers of tx_ltb_ptr[]. The other one, ibmveth_allocate_tx_ltb()
(called from ibmveth_open() and ibmveth_set_channels()), still publishes
the pointer with a plain store before the buffer is DMA mapped:

ibmveth_allocate_tx_ltb() {
	adapter->tx_ltb_ptr[idx] = kzalloc(adapter->tx_ltb_size,
					   GFP_KERNEL);
	...
	adapter->tx_ltb_dma[idx] = dma_map_single(&adapter->vdev->dev,
	...
	if (dma_mapping_error(&adapter->vdev->dev, adapter->tx_ltb_dma[idx])) {
		...
		kfree(adapter->tx_ltb_ptr[idx]);
		adapter->tx_ltb_ptr[idx] = NULL;
		return -ENOMEM;
	}
}

On a mapping error it frees the buffer while the published pointer is
still non-NULL. That is the reverse of the NULL, unmap, free order used in
ibmveth_free_tx_ltb().

Several other accesses are also plain: the first load in
ibmveth_free_tx_ltb() and the tx_ltb_ptr[] checks in
ibmveth_set_channels(). In addition, ibmveth_start_xmit() re-reads
tx_ltb_dma[queue_num] without taking a snapshot of it next to ltb.

The READ_ONCE()/WRITE_ONCE() pair and the new comment suggest a reader
can run concurrently. If so, could the allocate path expose an unmapped
or freed LTB?

If no reader can run concurrently, because the stopped txqs provide the
serialization, could the comment say that instead? Otherwise, the
allocate path could get the same treatment: map into a local, then
WRITE_ONCE() the pointer, and leave the published pointer NULL on error.

> @@ -1195,7 +1195,7 @@ static int ibmveth_set_channels(struct net_device *netdev,
>  	/* We have IBMVETH_MAX_QUEUES netdev_queue's allocated
>  	 * but we may need to alloc/free the ltb's.
>  	 */
> -	netif_tx_stop_all_queues(netdev);
> +	netif_tx_disable(netdev);
>  
>  	/* Allocate any queue that we need */
>  	for (i = old; i < goal; i++) {

[ ... ]

> @@ -1304,6 +1304,16 @@ static netdev_tx_t ibmveth_start_xmit(struct sk_buff *skb,
>  	union ibmveth_buf_desc desc;
>  	int i, queue_num = skb_get_queue_mapping(skb);
>  	unsigned long mss = 0;
> +	void *ltb;
> +
> +	/* A sender that picked its queue before ethtool -L shrank the TX
> +	 * queues can get here after that queue's LTB was freed.
> +	 */
> +	ltb = READ_ONCE(adapter->tx_ltb_ptr[queue_num]);
> +	if (unlikely(!ltb)) {
> +		netdev->stats.tx_dropped++;
> +		goto out;
> +	}

[Severity: Medium]
Is this NULL check ordered against the queue wake in
ibmveth_set_channels()?

netif_tx_disable() takes and releases each txq lock while it sets
DRV_XOFF. The LTB updates and the wake come after that, with no txq lock
held:

ibmveth_set_channels()
  netif_tx_disable(netdev);         <- all txq locks dropped here
  ...
  ibmveth_free_tx_ltb(adapter, i - 1);
    WRITE_ONCE(adapter->tx_ltb_ptr[idx], NULL);
    dma_unmap_single(...);
    kfree(ptr);
  netif_tx_wake_all_queues(netdev); <- test_and_clear_bit on every queue,
                                       including the removed ones

A sender still using a removed queue, such as AF_PACKET with
PACKET_QDISC_BYPASS, goes through:

__dev_direct_xmit()
  HARD_TX_LOCK(dev, txq, smp_processor_id());
  if (!netif_xmit_frozen_or_drv_stopped(txq))   <- plain load of txq->state
    netdev_start_xmit()
      ibmveth_start_xmit()
        ltb = READ_ONCE(adapter->tx_ltb_ptr[queue_num]);

The writer's last txq unlock comes before the NULL store, so the lock
does not order that store against the sender. The only link between the
two sides is the fully ordered test_and_clear_bit(). On the reader side,
its two loads are separated only by a control dependency. That is the
MP+fence+ctrl pattern, and both LKMM and Power allow it.

Could a sender then see the queue as awake, still load the old kfree'd
LTB pointer, and memcpy() packet data into freed memory? The window is
very narrow, but nothing here seems to rule it out.

The grow path has a similar gap. ibmveth_allocate_tx_ltb() stores
tx_ltb_ptr[i] and then tx_ltb_dma[i], and ibmveth_start_xmit() re-reads
the DMA address later with no ordering:

	desc.fields.address = adapter->tx_ltb_dma[queue_num];

ibmveth_free_tx_ltb() never clears tx_ltb_dma[]. Can a sender pair a new
non-NULL ltb with a stale tx_ltb_dma[] value and post a descriptor with an
unmapped or old IOVA? The commit message says this case is handled:

    On a grow, that sender could otherwise see a new LTB before it is DMA
    mapped, or one that the failure path frees again.

Would any of these close the gap?

- Call netif_tx_lock_bh()/netif_tx_unlock_bh() after the LTB updates and
  before waking the queues.
- Update the pointers while holding each txq lock.
- Do not wake queues >= real_num_tx_queues.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119000235.15622-1-mmc%40linux.ibm.com

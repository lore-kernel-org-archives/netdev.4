Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510454;
	b=o9Yz/9zXxGcCtpNrbPyQJDyQQwYI98Fl4Lfju3QOIF32zl74i78mm0X1E6gQVz22A+LX
	 /ODM5V1DVFwtt/vWCYeNJpHgrsEIriXZFtc6rmNb5ewEEAgXbghlySE/xMhQlVqF7gat1
	 4IuV9g1/3pGKvpNcdqhWWqtsRfUSiI9XNps6125lnnHzYQ3+r1WfjuoMVJ2U0xAn6uHY9
	 fRD3+uyIgVbExflAVVCiY4VHT3dFmbNO2QpZwHWpbbDRySYqBjNOOsrZ0XX0q/LPVLLix
	 LMNsUwFy0du74217yL+uXYzOU0M6XK+YviJCg/busckVyVZLrpgEc6D9nNtD1PaK+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510454;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QUDG01uMlxGs3ZoZiYFkDjI4/YMZ+OvwNTGHmN+I410=;
	b=oIHnqTweKuCOHkUBXVzCdaKU/aw0Ggz9hA0Mx98YqsKlB5xEe/BsqklHuKL8ZoqSEGXa
	 SwGIeDwCG/u8XXqwPxSIrocYSIen1seG8nnndRmswE51MfJ6ok27bK4AmiSwdI9ZxzVZa
	 pkpW0jWPdYV5iqVUN11uy1shKWqS9M7OHebj/rXZ/NfBZ5PJ1QXOQne8w1OMRdegZjZSb
	 9nT6jA7Y2jF+lqJM3srYySP60Sqy9w2GfbRoKywuh6J9w+kSXNVSAlHHRj8eF0VHtv7fi
	 mAokV3ariqePtmpfzleGXtXy615EkjjfFtez5rK7ffeVJtt/dnyx20kJKpFgHnTSCoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfRNVklo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D99606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TfRNVklo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D404E1F000C4;
	Tue, 24 Nov 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510454;
	bh=QUDG01uMlxGs3ZoZiYFkDjI4/YMZ+OvwNTGHmN+I410=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TfRNVkloSLo0i8Z+98n7kJzxtT3DU4Mr/yjjHMNjjq+9oqP/HL+pPpfyqsJIQHQ6Z
	 ZMTlpENxKVbaUwWzBm7UdU9KPEOdEOFpCdy64MKOEL63R+PB1v8LKpOl20RTSbsttg
	 LapyGllfn6YDe/HZqcUKOULGz1qvgKEQgWStvxAw3n8LD989m9vgCs8acIfjPD2JGk
	 /DSXpniTbRZgom+1Op7aeACQFjr0Hc4U6bIlHBNZNfoMdY/AZZpGlu4qG12lJxrXsj
	 keD1Q9MOR2NdtcSBd3vEIlPCpH2QnydEsAus1x0RLFoEg47BYt1eCvgQKPqc9okB56
	 DjuyUBxS1j0KQ==
Subject: Re: [PATCH net-next v2 3/8] ibmveth: Refactor buffer pool management
 for per-queue MQ RX
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Tue, 24 Nov 2026 08:54:12 +0000
Message-ID: <179551045236.3135.13521842784287344413@kernel.org>
In-Reply-To: <20261123075136.3278-4-mmc@linux.ibm.com>
References: <20261123075136.3278-4-mmc@linux.ibm.com>
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

- [Medium] ibmveth: persistent pool deactivation in
  ibmveth_alloc_queue_buffer_pools()

--

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -660,6 +660,100 @@ static void ibmveth_rxq_no_skb(struct ibmveth_adapter *adapter,
>  	schedule_work(&adapter->work);
>  }
>  
> +/**
> + * ibmveth_free_queue_buffer_pools - Free buffer pools for a single queue
> + * @adapter: ibmveth adapter structure
> + * @queue: queue index
> + *
> + * Frees every pool on @queue regardless of the active flag;
> + * ibmveth_free_buffer_pool() skips what was never allocated.
> + */
> +static void ibmveth_free_queue_buffer_pools(struct ibmveth_adapter *adapter,
> +					    int queue)
> +{
> +	int i;
> +
> +	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
> +		ibmveth_free_buffer_pool(adapter,
> +					 &adapter->rx_buff_pool[queue][i]);
> +}
> +
> +/**
> + * ibmveth_alloc_queue_buffer_pools - Allocate buffer pools for a single queue
> + * @adapter: ibmveth adapter structure
> + * @queue: queue index
> + *
> + * Allocates backing storage for each active pool on @queue.
> + *
> + * Return: 0 on success, -ENOMEM on failure
> + */
> +static int ibmveth_alloc_queue_buffer_pools(struct ibmveth_adapter *adapter,
> +					    int queue)
> +{
> +	struct net_device *netdev = adapter->netdev;
> +	int i;
> +
> +	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++) {
> +		struct ibmveth_buff_pool *bpool =
> +			&adapter->rx_buff_pool[queue][i];
> +
> +		if (!bpool->active)
> +			continue;
> +
> +		if (ibmveth_alloc_buffer_pool(bpool)) {
> +			netdev_err(netdev,
> +				   "queue %d pool %d alloc failed (size=%u count=%u)\n",
> +				   queue, i,
> +				   bpool->buff_size,
> +				   bpool->size);
> +			bpool->active = 0;
> +			/* Undo the pools this queue already allocated; the
> +			 * failed one freed its own partial allocation.
> +			 */
> +			ibmveth_free_queue_buffer_pools(adapter, queue);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * ibmveth_alloc_buffer_pools - Allocate buffer pools for all queues
> + * @adapter: ibmveth adapter structure
> + *
> + * Return: 0 on success, -ENOMEM on failure
> + */
> +static int
> +ibmveth_alloc_buffer_pools(struct ibmveth_adapter *adapter)
> +{
> +	int q, rc;
> +
> +	for (q = 0; q < adapter->num_rx_queues; q++) {
> +		rc = ibmveth_alloc_queue_buffer_pools(adapter, q);
> +		if (rc) {
> +			while (--q >= 0)
> +				ibmveth_free_queue_buffer_pools(adapter, q);
> +			return rc;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * ibmveth_free_buffer_pools - Free buffer pools for all queues
> + * @adapter: ibmveth adapter structure
> + */
> +static void
> +ibmveth_free_buffer_pools(struct ibmveth_adapter *adapter)
> +{
> +	int q;
> +
> +	for (q = 0; q < adapter->num_rx_queues; q++)
> +		ibmveth_free_queue_buffer_pools(adapter, q);
> +}
> +
>  /**
>   * ibmveth_remove_buffer_from_pool - remove a buffer from a pool
>   * @adapter: adapter instance

[Severity: Medium]
Now that ibmveth_free_queue_buffer_pools() frees every pool on the
queue regardless of the active flag, is there still a reason to clear
bpool->active here?

The active flag is the pool's persistent configuration. It comes from
pool_active[] at probe, is turned on by ibmveth_change_mtu() for large
MTUs and toggled through veth_pool_store(), and ibmveth_close() leaves
it alone so the same pools come back on the next open. Clearing it on
a transient ibmveth_alloc_buffer_pool() failure has two effects. A
later ibmveth_open() quietly skips that pool, and it can succeed
without a pool large enough for mtu + IBMVETH_BUFF_OH.

None of the callers of ibmveth_open() put the flag back.
veth_pool_store() only restores oldactive for the pool it is editing.
The ndo_open path, ibmveth_change_mtu(), ibmveth_set_csum_offload(),
ibmveth_set_tso() and ibmveth_reset() do not touch it at all.

The old single-queue loop did the same thing. With per-queue pools,
though, a failure on one queue also leaves rx_buff_pool[q][i].active
different between queues for the same pool index.

Can this line simply be dropped, since the unwind no longer depends on
it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123075136.3278-1-mmc%40linux.ibm.com

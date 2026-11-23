Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395968;
	b=VX0jsLgudp1sEOkYOJMf65S5sf7JpSGmgFhfPVN1lXqMfXHpJ9dgz1qKV4UxukRleVg+
	 JJzgHmcwv+2D6Pi7JjTfEKI2uVS/LZ27Crl9TUhO9u6J3vByGUDb/BBSQkJtusne+rWmZ
	 dIxy1Hv0ER4AJtzA8EB0Bv4EYikmBS3PNYGytlW/03b1PYk2V5VnxunVhSPVwFj81zFLP
	 SRZQM/vZQJKxuHccDTUrlPb/RgnnyvVRbr41U0cpGbxhTdAxSLn4SFC7GhxLRT6LYQyi8
	 uxayXmFWjSmTKSo0hVB2VNuEqb3wKhk5XyTgx69sFrtOD0AmwVmZecsZX9+AH8T8agw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395968;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Pc0mbPEt0qUdPQBtJKfrlvydOvmXsdAhSeL1Yff4aoM=;
	b=0RtnMrlEPvvmtPvQMx7N8a4mkvjadzchEaZxC5w5oXZKmNpY8LK4JdsWwbob/46f1IZN
	 7Oi2+I2vs7iLN03LkWSrNTDouY5dj4idh2DbRjWX4rJZ6XhlxHoRkVva03QiBq9pJ0bof
	 JeKzuZ5KUowdppX8fD+9QPC8iam22N3Wiy7AlS30/EQjLHODLBnpu8Gj2fWIRaPYFF/uD
	 N7dXcCsmN2Se5ndaoApJkbk7Fg0O41b4ubycasPdqr4vq+iG/5jDCurRatfJlXFlwlL4a
	 49R+VsjDv+pefLMuvz7NjZm5bck/X1NcIiSwsaToBS+b/cVSsciYw7jnBoUJwDiIDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZVPkEAb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E91606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BZVPkEAb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97691F000C0;
	Mon, 23 Nov 2026 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795395967;
	bh=Pc0mbPEt0qUdPQBtJKfrlvydOvmXsdAhSeL1Yff4aoM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BZVPkEAbcTojVg8JMq9AXiu3/+6RVnbR+VC+8EeuzlUt8+/jgMB+eMo2CgQIyd0JH
	 sw0LEDjpOO6jRRgEiAvAscgXh7sPQwhrysjSaqVnLvKaQ4nwZ5VXunKm4dKuD9UAtd
	 W8w3mXbynmYuJy0Cfo9VrG96OIyEwBzaGfeGxS93ySTlPS6H+RDMm7Xa/Ka30FjqsZ
	 C6MPKq1InnhNzmkctgEus+74d7H5wYnMG1NaTBl8GzNQXApzjc4q1rm2qsEAhrMVJa
	 RxIXKdoxjKT3rJg8JuFJdMAys8nPPAamrKiX5NCsJ+I22C6LcLEaVXCqnwK5im11Y3
	 5IKtIvtVHMAog==
Subject: Re: [PATCH net-next 2/8] ibmveth: Refactor RX resource allocation for
 MQ RX bring-up
From: netdev-bot+sashiko@kernel.org
To: mmc@linux.ibm.com
Cc: netdev@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, nnac123@linux.ibm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linuxppc-dev@lists.ozlabs.org, horms@kernel.org, davemarq@linux.ibm.com,
 haren@linux.ibm.com, ricklind@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Date: Mon, 23 Nov 2026 01:06:06 +0000
Message-ID: <179539596618.3135.16248027677119364858@kernel.org>
In-Reply-To: <20261119000711.18093-3-mmc@linux.ibm.com>
References: <20261119000711.18093-3-mmc@linux.ibm.com>
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

- [Low] The kernel-doc for ibmveth_cleanup_rx_resources() in
  drivers/net/ethernet/ibm/ibmveth.c says "Free all RX queue resources",…

--

ibmveth: Refactor RX resource allocation for MQ RX bring-up

This moves the filter list and per-queue RX ring and buffer list
allocation out of ibmveth_open() into helpers that loop over
num_rx_queues and undo their own partial failures. ibmveth_close() and
the open() error path now free through the same helpers.

> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index fc50036d5d265..559c4d2d957bb 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -159,6 +159,177 @@ static unsigned int ibmveth_real_max_tx_queues(void)

[ ... ]

> +/**
> + * ibmveth_cleanup_rx_resources - Free all RX queue resources
> + * @adapter: ibmveth adapter structure
> + */
> +static void
> +ibmveth_cleanup_rx_resources(struct ibmveth_adapter *adapter)
> +{
> +	struct device *dev = &adapter->vdev->dev;
> +	int i;
> +
> +	for (i = 0; i < adapter->num_rx_queues; i++) {
> +		if (adapter->buffer_list_addr[i]) {
> +			dma_unmap_single(dev, adapter->buffer_list_dma[i],
> +					 4096, DMA_BIDIRECTIONAL);
> +			adapter->buffer_list_dma[i] = 0;
> +		}
> +
> +		if (adapter->rx_queue[i].queue_addr) {
> +			dma_free_coherent(dev, adapter->rx_queue[i].queue_len,
> +					  adapter->rx_queue[i].queue_addr,
> +					  adapter->rx_queue[i].queue_dma);
> +			adapter->rx_queue[i].queue_addr = NULL;
> +		}
> +
> +		if (adapter->buffer_list_addr[i]) {
> +			free_page((unsigned long)adapter->buffer_list_addr[i]);
> +			adapter->buffer_list_addr[i] = NULL;
> +		}
> +	}
> +}

[Severity: Low]
This isn't a bug, but is the kernel-doc for ibmveth_cleanup_rx_resources()
accurate? It says "Free all RX queue resources". The body only frees
buffer_list_addr[i] with its buffer_list_dma[i] mapping, plus the coherent
ring at rx_queue[i].queue_addr.

It doesn't free the per-queue buffer pools in adapter->rx_buff_pool[queue][*]
(the free_map, dma_addr and skbuff arrays and the DMA-mapped skbs). That is
why ibmveth_close() still frees them in a separate loop after calling this
helper:

	ibmveth_cleanup_rx_resources(adapter);
	ibmveth_free_filter_list(adapter);

	for (i = 0; i < IBMVETH_NUM_BUFF_POOLS; i++)
		if (adapter->rx_buff_pool[0][i].active)
			ibmveth_free_buffer_pool(adapter,
						 &adapter->rx_buff_pool[0][i]);

The ibmveth_open() error path also keeps its own out_free_buffer_pools
label for the same reason.

At the end of the series this doc line hasn't changed. There, close() and
the open() error path call ibmveth_free_buffer_pools() separately before
this helper. So the helper doesn't seem meant to free the pools.

Could the comment be narrowed to describe the buffer lists and RX rings it
actually frees? The name could also be changed to match its allocator,
ibmveth_alloc_rx_queues().

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119000711.18093-1-mmc%40linux.ibm.com

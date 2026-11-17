Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879620;
	b=Dg8r/W3BDuvrGtSyS+bCdoJ7E4vnzVv3VgiZGtPr7dVly1QU9PuSiDtOjcjXfzLom5R3
	 Gp5Ea98IOpIZCPv3JPerhUVgTatPN4ZOiT+IDwqcYusj7kdmL9pLuPNqtMY16z7vGw9lw
	 ZcXYZG/b+fo4bGQiLVHuCtiy8vcIl5Hp5qohhZ1Aszs9pV6d8TGk+UyD7Do3+Vz6cszBZ
	 dYpGvrS3k/TWqmTi6WDy8XLv6OIBpzT1bMu4uCsO1ocEM2VlMkhMneJD+goHUZss2pcWA
	 F1Z9uZ7BJHHK3hcj/GFMlxJzkcThd4A1jlODnnepw3HIYQP0F40qbyLjnHFvwHRTPTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879620;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qws+Fz4Ekk6Ecm3aw/aRo4AQeOV511tnJt/HAz178OY=;
	b=zGzifFhSCqSlarbFcKP5ZY3087ByGgoTbYN7IXrv4kUvvo8Ll80AS+6nz3QNK6zNW8qv
	 HX7GMfoGBgz8DBi1UoFg3G3WUfiaqP+cbUhtqJT23DCQRoS7Szf9Nznx5OGcMJOB9rcgV
	 Miyt2O1RmpAa/T6PfdyFuzHFsXdrP9YjorLfj2lZgR9gaUUA5ulPTDRZBuHgxn42wdLWZ
	 FxNzlCymT6pMxGpmjMWrIxVxvsaJMFTYZIi0W5CY0+RU388EOwk5nn3+GUdzHkJtf+ia2
	 mtAuSWdmTeP8UdMdrxFTBPUnFRdP9+Sa1m2g3bOohCal0BHP9MFDSXqt/z8m7iM7l/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmuJxYRP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5AD606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmuJxYRP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7C31F000C5;
	Tue, 17 Nov 2026 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879619;
	bh=qws+Fz4Ekk6Ecm3aw/aRo4AQeOV511tnJt/HAz178OY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DmuJxYRPhYSHm3ULmL9zTKQL3tx32zAmXRE0eO/0wmGJd+DiD99B0Fv+FA3fpmZVA
	 WeRD+mnEd3lmnHKF/TQrJEBIygl065mKAf/ECAB3sM/c/IBfzMzSgoiDQaDMG1B+e8
	 CUqVcHlUYCnn6cIhymrdh+j2eVAnBMtRr78JpFRRB4QcV2VKjb36vecLKkDyWLLoCl
	 Pru1LvDJim4y6QTRALjf8vguET4iQk2W4rgFHkXqZkIz08w7RVtFYNwa/7alonPIzL
	 H+LxpoG08mxWWf8SQfx2gssd2mU+DlvGIac8AhF9g96ULKqjF4+5VoroM/to0Elsup
	 DzQPzgNyE8dQQ==
Date: Mon, 16 Nov 2026 17:40:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mingming Cao <mmc@linux.ibm.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, chleroy@kernel.org,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, haren@linux.ibm.com,
 ricklind@linux.ibm.com, davemarq@linux.ibm.com, bjking1@linux.ibm.com,
 shaik.abdulla1@ibm.com
Subject: Re: [PATCH net-next v8 09/15] ibmveth: Split RX poll into per-slot
 helpers for MQ
Message-ID: <20261116174018.6cd71ba5@kernel.org>
In-Reply-To: <20261109235556.60604-10-mmc@linux.ibm.com>
References: <20261109235556.60604-1-mmc@linux.ibm.com>
	<20261109235556.60604-10-mmc@linux.ibm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 15:55:50 -0800 Mingming Cao wrote:
> +	if (WARN_ON(queue_index < 0 ||
> +		    queue_index >= adapter->num_rx_queues)) {

You add such checks all over the place, why?
The kernel coding style explicitly recommends against defensive
programming.

> +		if (budget)
> +			napi_complete_done(napi, 0);
> +		return 0;
> +	}
> +
> +	if (ibmveth_poll_stopping(netdev, napi)) {

Why are you checking if the NAPI is stopping?
Maybe I missed it in the avalanche of words in the commit message,
you mention live resize, which I assume is patch 14. I don't get why
you need to explicitly check this, core already does.

> +		if (budget)
> +			napi_complete_done(napi, 0);
> +		return 0;
> +	}
> +
>  	while (frames_processed < budget) {
> +		if (ibmveth_poll_stopping(netdev, napi))
> +			break;
> +
>  		if (!ibmveth_rxq_pending_buffer(adapter, queue_index))
>  			break;
>  
>  		smp_rmb();
> -		correlator = ibmveth_rxq_read_correlator(adapter, queue_index);
>  		if (!ibmveth_rxq_buffer_valid(adapter, queue_index)) {
>  			wmb(); /* suggested by larson1 */
> -			adapter->rx_invalid_buffer++;
> -			netdev_dbg(netdev, "recycling invalid buffer\n");
> -			rc = ibmveth_rxq_harvest_buffer(adapter, queue_index,
> -							correlator, true);
> -			if (unlikely(rc)) {
> -				netdev->stats.rx_dropped++;
> +			if (ibmveth_poll_recycle_invalid(netdev, adapter,
> +							 queue_index))
>  				frames_processed++;
> -				continue;
> -			}
>  		} else {
> -			struct sk_buff *skb, *new_skb;
> -			int length = ibmveth_rxq_frame_length(adapter,
> -							      queue_index);
> -			int offset = ibmveth_rxq_frame_offset(adapter,
> -							      queue_index);
> -			int csum_good = ibmveth_rxq_csum_good(adapter,
> -							      queue_index);
> -			int lrg_pkt = ibmveth_rxq_large_packet(adapter,

You should really factor out the pure code movement to a separate patch.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694889;
	b=bGRhFAyqdv26PzeMf9OwoJBOXvIJNbwQsFGrGPawR4jbfjjtjBiNid4MEnxEssxHKdFF
	 SfWzzpkZ5Gchkupu7Nf49NdYmX0L59dZ322tENY4DCrF7LXTLHXV9kLMZhTgI1EU3q2lh
	 nm4wkfg5fM4IGPbfO5RAE2VskAj/sKrBhX1FxqC7+MZ3jE0jlW2t4bZayW1RtJRce8Yq2
	 XTc5IareskpsXsRrywNOZSVxqLfDVFXgQttJ5/lI1DkiqnRYLr4FTjGJff2CEqJVzbqhZ
	 QBMt2TzCcgWira5Ud4gma0ZVyrdZtru1AainBsCOUrr9UJDaftzmcuKK6sNNyGcyIYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694889;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=S5E4mLLB2hoLU3on6VeJs+Ql1VbKIrqqDcwHOl9/pLU=;
	b=xR5Rq+VV2Bk+wBtBYsHx4Yg5B7/6waqgR8SVSBLxEESDHH7t6knLitd2vKlA4Nb+eMK3
	 GF/5F2JSDrKhs+ZA63leo1Cgw8w26YttSOtpmXYhDgu1ydOU4x5EiPX7LGATPS2QZEBso
	 hDNq8HCbX7y5RNOaCbXtjiR8SizRmw2Pex64Z06u0sf0zlZquqYRfvm9hMBqpimRHLWx1
	 pK/qFg1OEy57JfxUxR1hDpIGncBkOaDZKNZ7u8BSAuWaoFaW94Wxb1kq+TGR/WY20aHse
	 PESYhYglGxGk33IAq9WAuUYvRm+q2W8maFQdYWmj1WIhu/mNLz0edjEZFC3jwRYlbfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=DVlopNwD;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A4606A326;
	Thu, 26 Nov 2026 12:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E4A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=DVlopNwD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795694889; x=1827230889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ylT4/DhnXpu2AJlVmttP8iASyJYyWAKCw40z9Q9j1M8=;
  b=DVlopNwDR2iubEcZ4xCTkd2rFDWep0Pj1f62I89zi9KQEgPjm8up28YU
   kvGp4DpxHyLt3xqmbm8ztlYD13VVPozvoAZZMIEig5cI9L9PEI0Da9pF9
   HaPeGsiDMS2On80/huWQeTd8zC2OL5XIb/0+ILl1HA0/oYzcLx6NVZUhk
   2p+weE34o5Map4gBFDKIbs8hCgAZ0osY+FHyh8uklqZDiTj8yD6PH8LWO
   a5tMH8d9Bg7RogL+tfkE56sy+vZsiWQ56m5ThEzJUDKbRn3m8T/9SX7zo
   NmGw9Uezm7mJHwm6TvB62bsoHgc7g6HRBcPxf949zRK2OZNPsm5RnQ7cS
   w==;
X-CSE-ConnectionGUID: eUXkntEXRaS+UDmv6/RbPg==
X-CSE-MsgGUID: luj+myZ0Sy6PhbmjqtuN6w==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="67314905"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2026 05:08:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 26 Nov 2026 05:08:02 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 26 Nov 2026 05:07:58 -0700
Date: Thu, 26 Nov 2026 13:07:57 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
CC: Doug Berger <opendmb@gmail.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Florian
 Fainelli <f.fainelli@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v9 8/8] net: bcmgenet: reassemble jumbo frames
 from status block fragments
Message-ID: <20261126120757.gdz5lo4tw7bhgzax@DEN-DL-M70577>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
 <20261123-nb-genet-mtu-nn-v2-v9-8-4f93ded19bbb@tipi-net.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261123-nb-genet-mtu-nn-v2-v9-8-4f93ded19bbb@tipi-net.de>

Hi Nicolai,

> The hardware does not truncate a frame longer than the packet ready
> threshold. It splits the frame across descriptors and writes a status block
> at the start of each one. The first fragment then arrives with SOP and no
> EOP and is dropped as fragmented. This caps the MTU.
> 
> Strip the status blocks and reassemble the fragments. Only the last block
> holds the checksum of the whole frame. Broadcom confirmed from the RTL that
> every GENET revision splits long frames this way, not just the v5 this was
> tested on.
> 
> On transmit the MAC only checksums a frame it holds in full, so anything
> longer than the threshold falls back to software. At jumbo sizes the larger
> frame saves more per packet overhead than the checksum costs.
> 
> UMAC_MAX_FRAME_LEN is 14 bit and counts the FCS. That puts the maximum MTU
> at 16347.
> 
> The TX descriptor length field is wider than DMA_BUFLENGTH_MASK suggests,
> that mask only extracts the length from the RX status word. A frame of
> 16361 bytes, the largest untagged frame that MTU allows, came back byte
> exact 200 times over UMAC loopback.
> 
> Suggested-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---
>  drivers/net/ethernet/broadcom/genet/bcmgenet.c | 133 +++++++++++++++++++++----
>  drivers/net/ethernet/broadcom/genet/bcmgenet.h |   4 +-
>  2 files changed, 114 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 8dcee6951be3..b4e3fe21a5d6 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -91,11 +91,8 @@
>  				      ENET_THLD_MAX * ENET_THLD_UNIT, \
>  				      ENET_THLD_PAGE_LEN)
>  
> -/* Largest MTU that fits one descriptor, with room for a VLAN tag so a VLAN
> - * interface can use the parent MTU.
> - */
> -#define ENET_MAX_MTU		(ENET_THLD_MAX_LEN - GENET_RBUF_ALIGN - \
> -				 ETH_HLEN - VLAN_HLEN)
> +/* UMAC_MAX_FRAME_LEN is 14 bits wide and counts the FCS */
> +#define ENET_MAX_MTU		(GENMASK(13, 0) - ENET_FRAME_OVERHEAD)

Now that the driver supports larger MTUs, should the flow control thresholds be
scaled for larger frames?

>  
>  /* Tx/Rx DMA register offset, skip 256 descriptors */
>  #define WORDS_PER_BD(p)		(p->hw_params->words_per_bd)
> @@ -2437,6 +2434,52 @@ static int bcmgenet_rx_refill(struct bcmgenet_rx_ring *ring,
>  	return 0;
>  }
>  
> +/* The rest of the frame carries no SOP. Drop it and do not count it again
> + * until the next SOP, unless this descriptor already ended the frame.
> + */
> +static void bcmgenet_discard_frags(struct bcmgenet_rx_ring *ring, bool eop)
> +{
> +	ring->frag_drop = !eop;
> +
> +	if (!ring->frag_head)
> +		return;
> +
> +	dev_kfree_skb_any(ring->frag_head);
> +	ring->frag_head = NULL;
> +}
> +
> +/* A frame longer than the threshold arrives in several descriptors, each with
> + * its own status block. Returns the frame once EOP is in. NULL means either
> + * more descriptors are coming or the frame is gone.
> + */
> +static struct sk_buff *bcmgenet_add_frag(struct bcmgenet_rx_ring *ring,
> +					 struct page *page,
> +					 unsigned int offset,
> +					 unsigned int size,
> +					 unsigned int dma_flag,
> +					 unsigned int len)
> +{
> +	struct sk_buff *head = ring->frag_head;
> +
> +	if (unlikely(skb_shinfo(head)->nr_frags >= MAX_SKB_FRAGS)) {
> +		BCMGENET_STATS64_INC((&ring->stats64), fragmented_errors);
> +		bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
> +		page_pool_put_full_page(ring->page_pool, page, true);
> +		return NULL;
> +	}
> +
> +	skb_add_rx_frag(head, skb_shinfo(head)->nr_frags, page,
> +			offset + sizeof(struct status_64),
> +			len - sizeof(struct status_64), size);
> +
> +	if (!(dma_flag & DMA_EOP))
> +		return NULL;
> +
> +	ring->frag_head = NULL;
> +
> +	return head;
> +}
> +
>  /* bcmgenet_desc_rx - descriptor based rx process.
>   * this could be called from bottom half, or from NAPI polling method.
>   */
> @@ -2454,6 +2497,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  	unsigned int rxpktprocessed = 0, rxpkttoprocess;
>  	unsigned int bytes_processed = 0;
>  	unsigned int p_index, mask;
> +	unsigned int rxframes = 0;
>  	unsigned int discards;
>  
>  	/* Clear status before servicing to reduce spurious interrupts */
> @@ -2501,6 +2545,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  
>  		if (bcmgenet_rx_refill(ring, cb)) {
>  			BCMGENET_STATS64_INC(stats, dropped);
> +			bcmgenet_discard_frags(ring, false);
>  			goto next;
>  		}
>  
> @@ -2525,24 +2570,43 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  			  __func__, p_index, ring->c_index,
>  			  ring->read_ptr, dma_length_status);
>  
> -		/* Only the first descriptor carries the alignment pad */
> -		min_len = dma_flag & DMA_SOP ? GENET_RSB_PAD
> -					     : sizeof(struct status_64);
> +		/* Only the first descriptor carries the alignment pad. A head
> +		 * with more to come needs the Ethernet header in it, a
> +		 * continuation needs at least one payload byte.
> +		 */
> +		if (dma_flag & DMA_SOP) {
> +			min_len = GENET_RSB_PAD;
> +			if (!(dma_flag & DMA_EOP))
> +				min_len += ETH_HLEN;
> +		} else {
> +			min_len = sizeof(struct status_64) + 1;
> +		}
>  
>  		/* Reject lengths that would underflow the SKB build path. */
>  		if (unlikely(len > priv->rx_buf_len || len < min_len)) {
>  			netif_err(priv, rx_status, dev,
>  				  "invalid packet length %d\n", len);
>  			BCMGENET_STATS64_INC(stats, length_errors);
> +			if ((dma_flag & DMA_SOP) && ring->frag_head)
> +				BCMGENET_STATS64_INC(stats, fragmented_errors);
> +			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
>  		}
>  
> -		if (unlikely(!(dma_flag & DMA_EOP) || !(dma_flag & DMA_SOP))) {
> -			netif_err(priv, rx_status, dev,
> -				  "dropping fragmented packet!\n");
> -			BCMGENET_STATS64_INC(stats, fragmented_errors);
> +		/* A new SOP picks up again after an incomplete frame */
> +		if (dma_flag & DMA_SOP) {
> +			if (ring->frag_head) {
> +				BCMGENET_STATS64_INC(stats, fragmented_errors);
> +				bcmgenet_discard_frags(ring, false);
> +			}
> +			ring->frag_drop = false;
> +		} else if (unlikely(!ring->frag_head)) {
> +			/* Rest of a dropped frame, or no SOP seen yet */
> +			if (!ring->frag_drop)
> +				BCMGENET_STATS64_INC(stats, fragmented_errors);
> +			ring->frag_drop = !(dma_flag & DMA_EOP);
>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
> @@ -2572,17 +2636,27 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  						DMA_RX_RXER)) == DMA_RX_RXER)
>  				u64_stats_inc(&stats->errors);
>  			u64_stats_update_end(&stats->syncp);
> +			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
>  		} /* error packet */
>  
> +		if (!(dma_flag & DMA_SOP)) {
> +			skb = bcmgenet_add_frag(ring, rx_page, rx_offset,
> +						rx_size, dma_flag, len);
> +			if (!skb)
> +				goto next;
> +			goto deliver;
> +		}
> +
>  		/* Build SKB from the page - data starts at hard_start,
>  		 * frame begins after RSB(64) + pad(2) = 66 bytes.
>  		 */
>  		skb = napi_build_skb(hard_start, rx_size);
>  		if (unlikely(!skb)) {
>  			BCMGENET_STATS64_INC(stats, dropped);
> +			bcmgenet_discard_frags(ring, dma_flag & DMA_EOP);
>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
> @@ -2594,17 +2668,26 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  		skb_reserve(skb, GENET_RSB_PAD);
>  		__skb_put(skb, len - GENET_RSB_PAD);
>  
> -		if (priv->crc_fwd_en) {
> -			skb_trim(skb, skb->len - ETH_FCS_LEN);
> +		if (unlikely(!(dma_flag & DMA_EOP))) {
> +			ring->frag_head = skb;
> +			goto next;
> +		}
> +
> +deliver:
> +		/* The FCS trim may release the page with the last status block */
> +		rx_csum = (__force __be16)(status->rx_csum & 0xffff);
> +
> +		if (priv->crc_fwd_en &&
> +		    unlikely(pskb_trim(skb, skb->len - ETH_FCS_LEN))) {
> +			BCMGENET_STATS64_INC(stats, dropped);
> +			dev_kfree_skb_any(skb);
> +			goto next;
>  		}
>  
>  		/* Set up checksum offload */
> -		if (dev->features & NETIF_F_RXCSUM) {
> -			rx_csum = (__force __be16)(status->rx_csum & 0xffff);
> -			if (rx_csum) {
> -				skb->csum = (__force __wsum)ntohs(rx_csum);
> -				skb->ip_summed = CHECKSUM_COMPLETE;
> -			}
> +		if ((dev->features & NETIF_F_RXCSUM) && rx_csum) {
> +			skb->csum = (__force __wsum)ntohs(rx_csum);
> +			skb->ip_summed = CHECKSUM_COMPLETE;
>  		}
>  
>  		len = skb->len;
> @@ -2612,6 +2695,7 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  
>  		/*Finish setting up the received SKB and send it to the kernel*/
>  		skb->protocol = eth_type_trans(skb, priv->dev);
> +		rxframes++;
>  
>  		u64_stats_update_begin(&stats->syncp);
>  		u64_stats_inc(&stats->packets);
> @@ -2638,7 +2722,8 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
>  	}
>  
>  	ring->dim.bytes = bytes_processed;
> -	ring->dim.packets = rxpktprocessed;
> +	/* A long frame spans several descriptors but is one packet */
> +	ring->dim.packets = rxframes;
>  
>  	return rxpktprocessed;
>  }
> @@ -2705,6 +2790,8 @@ static void bcmgenet_free_rx_buffers(struct bcmgenet_priv *priv)
>  			cb = ring->cbs + i;
>  			bcmgenet_free_rx_cb(cb, ring->page_pool);
>  		}
> +		/* A partial frame still holds pages of this pool */
> +		bcmgenet_discard_frags(ring, true);
>  	}
>  }
>  
> @@ -2775,7 +2862,9 @@ static void bcmgenet_link_intr_enable(struct bcmgenet_priv *priv)
>  }
>  
>  /* Receive threshold in register units. Covers the alignment bytes and the
> - * frame, but not the status block, which the hardware adds on top.
> + * frame, but not the status block, which the hardware adds on top. The
> + * usable maximum is whichever of register and page is smaller. A longer
> + * frame arrives in several descriptors.
>   */
>  static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
>  {
> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> index 1f48a67c5c01..8f432a830a5a 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> @@ -446,7 +446,7 @@ struct bcmgenet_rx_stats64 {
>  #define DMA_RATE_ADJ_MASK		0xFF
>  
>  /* Tx/Rx Dma Descriptor common bits*/
> -#define DMA_BUFLENGTH_MASK		0x0fff
> +#define DMA_BUFLENGTH_MASK		0x0fff	/* RX status word only */
>  #define DMA_BUFLENGTH_SHIFT		16
>  #define DMA_OWN				0x8000
>  #define DMA_EOP				0x4000
> @@ -598,6 +598,8 @@ struct bcmgenet_rx_ring {
>  	unsigned int	cb_ptr;		/* Rx ring initial CB ptr */
>  	unsigned int	end_ptr;	/* Rx ring end CB ptr */
>  	unsigned int	old_discards;
> +	struct sk_buff	*frag_head;	/* frame being reassembled */
> +	bool		frag_drop;	/* discarding until the next SOP */
>  	struct bcmgenet_net_dim dim;
>  	u32		rx_max_coalesced_frames;
>  	u32		rx_coalesce_usecs;
> 
> -- 
> 2.53.0
> 

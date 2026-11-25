Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570308;
	b=GM3HACFl9Gffirai7JLW05bp18UJOPAeCmqZiu8BfWAAlOfOLqboG13iDOa+qthnhbC1
	 UZsyoyeifP3EB4KwbZt9YARjzbjBJL3XYpxDb2wvXamXh3ZBpIDDNPxW1MMXu96uuuxKN
	 NC8JX7HeHjARbNEtkodKIWZ84ZqrrQLbBPHdcIJPlXg4LYoXutbBSe4hMh4m3Jo03Um0e
	 PFB/VTeOMtcqbMc/EbCKtw062HKp44EqYchni3a6hivNp7+wpNq9jeoagVpkhha8J2+fg
	 y07rAc8CeHhY1u9NVPXDgwFoMP4hTiE5P5Zuyhtm+Ny4jVakBZwwyqyC/KDKZOg03+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570308;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4cplUSvV4RzevwKXbQHAWViX7j4Dnhd0DaCgBfc6NyI=;
	b=RZ2XbDX7Tcang2a9S1BM0+/7TdIYWn9H0z5RGgFt3RslN1zC8xdeCorit+vg90r+Q30T
	 8nBcCTNHStWjLRzPYrBewVDqgSKBosDDUBzmSgQ3oMjVbd/sOwKEQvrAnZjLI5xR8TUV7
	 0zHL0rDvs5+ckobgyScb7Lz2rzntU2GIwnpsw4yC8EVhJh3FJmLXMqy/oIgt9zon71D/V
	 fa6Y0ZzwgVVS3qadsrZlB0KyvGcHEq+Jw/N/FfM60/W/lim7eT4x25aNb6DchQWwgsxnC
	 fFEOtPYnOw1Gf/P6PvaMmtYHnQFK0bNRd7MRjsGRcFD4ggPyR/k2xi52IDUWBUURNeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OxTNfU0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC7606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OxTNfU0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B171F000C6;
	Wed, 25 Nov 2026 01:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570307;
	bh=4cplUSvV4RzevwKXbQHAWViX7j4Dnhd0DaCgBfc6NyI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OxTNfU0PB4VOXw6VmkjAKZ+jX0pk9TCOSH8iHgcRNxBGAzWEicIaN0di0EZqpFBOD
	 pfaeBPVWW/bqjZT7u+fJWg/7POq7w1sAwG5yH+4obDhzhlseXShiKnt4Cbb4npRCT3
	 8s8Yc5rT7cw2WRAJCrzRkg4Sy04ymPIJ55UP9i/CWlnFwY77xfAtky/K7uUQN8y6Pv
	 aTzWNGnxysMxTp/RGqhty+0sd1DUlicuRdU00ZQETTMsjLb/5s/vgPDEfRLjG3vzwz
	 KviZGy5kBopPxc/U4MgtSDsMDLMa1rXJjBdFm11IRMq0mMvZKar0xslU6VVvErSY0M
	 6utvEiZ4pc+tg==
Subject: Re: [PATCH net v4] net: bgmac: fix RX frame length check
From: netdev-bot+sashiko@kernel.org
To: rosenp@gmail.com
Cc: rafal@milecki.pl, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, nbd@openwrt.org,
 horms@kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, zajec5@gmail.com,
 netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 01:31:46 +0000
Message-ID: <179557030640.3135.10674609230944180812@kernel.org>
In-Reply-To: <20261121005009.59491-1-rosenp@gmail.com>
References: <20261121005009.59491-1-rosenp@gmail.com>
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

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The multi-descriptor skip logic in bgmac_dma_rx_read()
  (drivers/net/ethernet/broadcom/bgmac.c) never runs when the…
- [Medium] The patch lowers the receive limit in a way the commit message
  does not mention, and frames that used to be delivered are now dropped.
- [Medium] In bgmac_dma_rx_read(), the skip count for continuation
  buffers comes only from the 4-bit DC field in the RX header flags…

--

net: bgmac: fix RX frame length check

This patch limits the RX length check in bgmac_dma_rx_read() to the real
buffer size and adds a lower bound. It also checks the RX header error
and descriptor count flags, and skips the continuation buffers of
multi-descriptor frames. UMAC_MAX_FRAME_LEN is now programmed from the
MTU plus a VLAN header and FCS, and max_mtu is lowered to match.

> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
> index 9ef7307edd41e..d72e9c8577c41 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c

[ ... ]

> @@ -435,6 +436,13 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
>  		dma_addr_t dma_addr = slot->dma_addr;
>  		u16 len, flags;
>  
> +		/* The rest of a multi descriptor frame that was dropped */
> +		if (ring->rx_skip) {
> +			ring->rx_skip--;
> +			bgmac_dma_rx_poison_buf(dma_dev, slot);
> +			goto next;
> +		}
> +
>  		do {
>  			/* Prepare new skb as replacement */
>  			if (bgmac_dma_rx_skb_for_slot(bgmac, slot)) {

[Severity: High]
What happens to the continuation buffers if this replacement allocation
fails while a multi-descriptor frame is at the head of the ring?

The failure path recycles the slot without reading the RX header:

	if (bgmac_dma_rx_skb_for_slot(bgmac, slot)) {
		bgmac_dma_rx_poison_buf(dma_dev, slot);
		break;
	}

As a result, the BGMAC_RXF_DC_MASK check further down is never reached,
and that check is the only place ring->rx_skip gets set.

netdev_alloc_frag() in bgmac_dma_rx_skb_for_slot() is an atomic
allocation in NAPI context and can fail under memory pressure.
dma_map_single() can fail too. bgmac_dma_rx_enable() sets
BGMAC_DMA_RX_OVERFLOW_CONT and errored frames are not discarded, so an
oversized frame still spills into the next 1..15 descriptors.

With rx_skip left at 0, would each of those continuation slots go
through the normal path, with len and flags read from payload bytes the
sender controls?

A sender could make those bytes look like a clean header: no DC or
error bits, and a length between ETH_HLEN + ETH_FCS_LEN and 1536. The
fake frame would then go to napi_gro_receive(), along with stale
page-frag contents from the rest of the buffer.

That looks like the problem the commit message says it fixes:

  bgmac_dma_rx_read() consumes only the first descriptor and parses the
  continuation buffer as a new frame

Could the header flags also be read on the allocation failure path? The
dma_sync_single_for_cpu() in bgmac_dma_rx_poison_buf() would make the
DC bits readable before the buffer is re-poisoned. Another option is to
do the DC check before the replacement allocation.

> @@ -460,10 +468,34 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
>  				break;
>  			}
>  
> -			if (len > BGMAC_RX_ALLOC_SIZE) {
> +			/* The frame did not fit in one buffer. The following
> +			 * buffers hold the rest of its data, not RX headers.
> +			 */
> +			if (flags & BGMAC_RXF_DC_MASK) {
> +				ring->rx_skip = FIELD_GET(BGMAC_RXF_DC_MASK, flags);
> +				put_page(virt_to_head_page(buf));
> +				bgmac->net_dev->stats.rx_length_errors++;
> +				bgmac->net_dev->stats.rx_errors++;
> +				break;
> +			}
> +

[ ... ]

> +			if (len < ETH_HLEN + ETH_FCS_LEN ||
> +			    len > BGMAC_RX_MAX_FRAME_SIZE) {
>  				if (net_ratelimit())
> -					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
> -						   ring->start);
> +					netdev_err(bgmac->net_dev, "Found packet with invalid length %u at slot %d, DMA issue!\n",
> +						   len, ring->start);
>  				put_page(virt_to_head_page(buf));
>  				bgmac->net_dev->stats.rx_length_errors++;
>  				bgmac->net_dev->stats.rx_errors++;

[Severity: Medium]
Should this branch also set ring->rx_skip when len is above
BGMAC_RX_MAX_FRAME_SIZE?

A length above 1536 means the frame could not fit in one RX buffer. But
the skip count comes only from the 4-bit DC field. The hardware could
report such a length with DC == 0, either because the field is
unreliable or because the frame spans more than 16 descriptors, which 4
bits cannot represent. The next slot would then be parsed as an RX
header taken from sender-controlled payload, the same as in the
allocation failure case above.

b43 and brcmsmac use the same dma64 engine. Their dma_rx() functions
work out the number of continuation buffers from the reported length,
not from a flags field. Commit 6a6c708469c9 ("bgmac: add check for
oversized packets") also shows that the MAC does report over-length
headers in practice.

Would something like this be safer here, capped at the ring size?

	max(DC, DIV_ROUND_UP(len + BGMAC_RX_FRAME_OFFSET,
			     BGMAC_RX_BUF_SIZE) - 1)

[ ... ]

> @@ -1110,6 +1144,13 @@ static void bgmac_enable(struct bgmac *bgmac)
>  	}
>  }
>  
> +/* The MAC counts the FCS in the maximum frame length. */
> +static void bgmac_set_max_frame_len(struct bgmac *bgmac, int mtu)
> +{
> +	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN,
> +			 mtu + VLAN_ETH_HLEN + ETH_FCS_LEN);
> +}

[Severity: Medium]
Does this cause frames that were delivered before this patch to be
dropped?

Before this patch, bgmac_chip_init() set UMAC_MAX_FRAME_LEN to 32 +
ETHER_MAX_LEN, which is 1550. Now it is 1522 at MTU 1500. Also,
bgmac_dma_rx_read() now drops any frame with BGMAC_RXF_OVERSIZE set:

	if (flags & BGMAC_RXF_ERR) {
		put_page(virt_to_head_page(buf));
		...
		if (flags & BGMAC_RXF_OVERSIZE)
			bgmac->net_dev->stats.rx_length_errors++;

Frames of 1523 to 1536 bytes still fit in one RX buffer, and they used
to reach the stack. Some examples:

- QinQ frames with a 1500 byte payload (1526 bytes)
- double-tagged frames on a DSA conduit at MTU 1504 (1530 bytes, above
  the 1526 limit)
- any frame larger than MTU + 22 when the MTU is set below 1500

bcm4908_enet.c programs the same UniMAC register with mtu +
ENET_MAX_ETH_OVERHEAD. That is a 32 byte overhead, including room for a
Broadcom tag and some padding, which suggests the old 32 bytes of slack
was deliberate. ENET_MAX_MTU_SIZE in bcmgenet also leaves room for a
tag.

Would setting the limit to BGMAC_RX_MAX_FRAME_SIZE still keep every
accepted frame in one RX buffer, without rejecting sizes that worked
before?

If the tighter limit is intended, could the commit message say so? The
Fixes: tags mean this will be backported to stable.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121005009.59491-1-rosenp%40gmail.com

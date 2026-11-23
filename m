Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421086;
	b=e6GMEthBbqNPLuP3bxDRGoyA4e79jdVvfmJ/YcTQJ4Q2u6tb+z/zJ85osPdZbDYnSA4Z
	 OZNQ1irEPVvBtQZS0FHCqZSAHTd0WEv5XJ4Rugv7n9xWnqUz3bwzWVD8U60FJ56PNA55A
	 ij2PdUOzCsGOWTGpDqmgpTPM2eCGZK3vtcIRUmhqdPEnFTtRmDf/UpmeJtR0YjcHuuw8q
	 4cdhJ9flPOp0354QuXOa/jEi8NZt6huIK9N0DccQ/ZEQ017UA8AfGBBXNsvhicpyvlcn2
	 ZZIOhP/lZkd1C1cP/hlX2uNu+ll6gbb//nnZ69YZJJYBVoBFRPOdj2OB66K1bU7Z3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421086;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=aTWyk5QPhq09bR7k0l1fBhIKsx6KYx4DDt7ym+alpQ8=;
	b=3JgX4tObXYS80T/ryvAjo6sRE6hGK2oKXQvPGUYcNeUagkNkQUDJLkJBdhcLRa4U+pPE
	 XfZhLXX9COOeWwqNQ5yfmYkw64xNtn+eSTYGuzbLLJj3UYRrEO4pRqoNi0XSEVPYA84iR
	 KhcjOUPtEHQFbxhgeHtA/f1atup/mrn8xa7cleghkm7u2Vah+htmTl7FAMpLbrRWJVgf9
	 Wx/B6IbNF3NwSWz0ufhxAqlOoNPHbl+/+NOG1BtJPILju9MuD7w3vh6/FOQarvTlWpvIP
	 vhY9srOzFpufS/obK2WYD3GdE/xOA0HbXOJETBODeHoB/ryEE8LZ6SzPAknIfhGMT3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGd8bth6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C4D606A6B7
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGd8bth6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3C41F000C4;
	Mon, 23 Nov 2026 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421086;
	bh=aTWyk5QPhq09bR7k0l1fBhIKsx6KYx4DDt7ym+alpQ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YGd8bth61G7c3eJmldmDZCJRU/D3H7ZEETQK4i/qDfyWesZjuThfi4wj/uEdnHa04
	 HtjoAYHe/ZbWLNCL44LfzU6BcUN4bDjJqCG+9KN3zyUVbuM1pUp5aJqTCtFVEeSQqN
	 0cEAvdGz5db1tC2hMar2ORHynCV+DhP3Or+ggEQRvQuQRMXk7ttXFe8U+QkHviAaFY
	 e+6/zLMVn6Z2GXzbKqhHwuewZ9VtIAnYRHSV6nQe2HFCOlJNsD2nlUIF9cvTID0MST
	 2jByXLi6dVkdpMqmZM68GqVNXJhUfYcXEizFSZu5AcEZan/D9z+8/8fjzOG9CWGONg
	 WC27RkhXk9Njg==
Subject: Re: [PATCH net v5] net: bgmac: fix RX frame length check
From: netdev-bot+sashiko@kernel.org
To: rosenp@gmail.com
Cc: rafal@milecki.pl, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, nbd@openwrt.org,
 horms@kernel.org, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, zajec5@gmail.com,
 netdev@vger.kernel.org
Date: Mon, 23 Nov 2026 08:04:45 +0000
Message-ID: <179542108545.3135.9636208285885065533@kernel.org>
In-Reply-To: <20261122080257.119640-1-rosenp@gmail.com>
References: <20261122080257.119640-1-rosenp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The continuation-buffer skip added by this patch still lets
  continuation buffers be parsed as new frames, which is the bug class…
- [Medium] Tying UMAC_MAX_FRAME_LEN to the MTU and also dropping every
  frame flagged BGMAC_RXF_OVERSIZE makes the driver drop frames that fit…
- [Low] Some of the new RX error accounting in bgmac_dma_rx_read() does
  not follow the rtnl_link_stats64 guidance in…

--

net: bgmac: fix RX frame length check

This patch limits the RX length check in bgmac_dma_rx_read() to the RX
buffer size and adds a lower bound. It also parses the RX header flags so
that errored frames are dropped and the continuation buffers of
multi-descriptor frames are skipped. UMAC_MAX_FRAME_LEN is now programmed
from the MTU plus a VLAN header and FCS, and max_mtu is lowered to match.

> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
> index 9ef7307edd41e..5264c778e0f55 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c

[ ... ]

> @@ -460,10 +481,34 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
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

[Severity: Medium]
Can continuation buffers still be parsed as new frames here? The only
source for ring->rx_skip is the 4-bit descriptor count of a first-buffer
header that is not poisoned. The len in that same header is never used to
derive the count or cross-check it.

bgmac_dma_rx_enable() sets BGMAC_DMA_RX_OVERFLOW_CONT. With that set, there
seem to be a few ways for rx_skip to stay 0, or to be too small, while
continuation buffers are still in the ring.

First, the first slot's header may still read as poison when the driver
reaches it. The poison branch just before this hunk then drops the slot
without setting rx_skip:

	if (len == 0xdead && flags == 0xbeef) {
		...
		put_page(virt_to_head_page(buf));
		bgmac->net_dev->stats.rx_errors++;
		break;
	}

The alloc-failure path in bgmac_dma_rx_poison_buf() has the same gap:

	if (len != 0xdead || flags != 0xbeef)
		*rx_skip = FIELD_GET(BGMAC_RXF_DC_MASK, flags);

b43's dma_rx() runs on the same dma64 engine. It retries with udelay(2)
while frame_len is still 0, which suggests a slot can become visible
before its RX header is written. For a multi-descriptor frame, the header
can only be written at end of frame.

Second, len may be above BGMAC_RX_MAX_FRAME_SIZE while the DC field reads
as 0. The length check below then drops the frame without setting
rx_skip, even though a frame that long must have spilled into the next
buffer.

Third, a frame may use more than 16 descriptors. The 0x0f00 mask caps the
skip count at 15.

In each case the next slot is handled as a frame start, and its len/flags
are the first 4 bytes of payload the sender controls. A value like
len=1536, flags=0 passes the poison, DC, error and length checks. Up to
1532 bytes are then built into an skb. If the DMA engine wrote only a
short tail into that buffer, the rest is stale memory from
netdev_alloc_frag().

It has not been confirmed that bgmac hardware produces each of these
conditions. b43 dma_rx() and brcmsmac dma_rx() work out the continuation
count from the length instead (resid = len - (rxbufsize - rxoffset)).

Should rx_skip be derived from len here as well?

> +
> +			if (flags & BGMAC_RXF_ERR) {
> +				put_page(virt_to_head_page(buf));
> +				if (flags & BGMAC_RXF_OVF)
> +					bgmac->net_dev->stats.rx_fifo_errors++;

[Severity: Low]
Should this be rx_over_errors instead? The rtnl_link_stats64 kernel-doc in
include/uapi/linux/if_link.h describes rx_over_errors as the "Receiver
FIFO overflow event counter". It also says rx_fifo_errors is "Not
recommended for use in drivers for high speed interfaces".

The BGMAC_RXF_DC_MASK branch above has a similar issue. It counts frames
that spanned more than one buffer in rx_length_errors. The recommended
interpretation of rx_over_errors is the "number of packets dropped because
they did not fit into buffers provided by the host".

> +				if (flags & BGMAC_RXF_OVERSIZE)
> +					bgmac->net_dev->stats.rx_length_errors++;
> +				if (flags & BGMAC_RXF_CRC)
> +					bgmac->net_dev->stats.rx_crc_errors++;
> +				bgmac->net_dev->stats.rx_errors++;
> +				break;
> +			}
> +
> +			if (len < ETH_HLEN + ETH_FCS_LEN ||
> +			    len > BGMAC_RX_MAX_FRAME_SIZE) {

[ ... ]

> @@ -1110,6 +1157,13 @@ static void bgmac_enable(struct bgmac *bgmac)
>  	}
>  }
>  
> +/* The MAC counts the FCS in the maximum frame length. */
> +static void bgmac_set_max_frame_len(struct bgmac *bgmac, int mtu)
> +{
> +	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN,
> +			 mtu + VLAN_ETH_HLEN + ETH_FCS_LEN);
> +}
> +
>  /* http://bcm-v4.sipsolutions.net/mac-gbit/gmac/chipinit */
>  static void bgmac_chip_init(struct bgmac *bgmac)
>  {
> @@ -1131,7 +1185,7 @@ static void bgmac_chip_init(struct bgmac *bgmac)
>  	else
>  		bgmac_umac_cmd_maskset(bgmac, ~CMD_LCL_LOOP_EN, 0, false);
>  
> -	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
> +	bgmac_set_max_frame_len(bgmac, bgmac->net_dev->mtu);

[Severity: Medium]
Will frames that fit in one RX buffer now be dropped? This ties
UMAC_MAX_FRAME_LEN to the MTU, and bgmac_dma_rx_read() now drops every
frame that has BGMAC_RXF_OVERSIZE set.

Before this patch, bgmac_chip_init() programmed a fixed
32 + ETHER_MAX_LEN = 1550, and the RX flags were never checked. Any frame
up to BGMAC_RX_MAX_FRAME_SIZE (1536 including FCS) was delivered.

At MTU 1500 the limit is now 1522. bgmac_chip_reset() clears
CMD_RX_ERR_DISC, so longer frames still reach the host with OVERSIZE set.
The new BGMAC_RXF_ERR branch in bgmac_dma_rx_read() then drops them as
rx_length_errors.

For example, an 802.1ad double-tagged frame with a 1500 byte payload is
14 + 8 + 1500 + 4 = 1526 bytes. It fits in the 1536 byte buffer and was
received before this patch, but now it looks like it gets dropped.

Lowering the MTU in bgmac_change_mtu() (for example to 1400) also makes the
MAC reject every inbound frame longer than MTU + 22 bytes. Before this
patch, the MTU had no effect on RX.

The commit message states the goal as every frame the MAC accepts fitting
in one RX buffer. A fixed limit of BGMAC_RX_MAX_FRAME_SIZE plus
max_mtu = BGMAC_RX_MAX_MTU would meet that goal without adding an
MTU-based RX filter. Would that work here?

If the MTU-based RX filter is intended, could the commit message say so?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122080257.119640-1-rosenp%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511008;
	b=j3shiEdVB5/kTOHZM68cgIErQUL2O8DdCAs+KVEw1X6H28ziDudIxXLB01oCtNP+eSdf
	 pZLmHj/5oikW2Qs5LmSpV0rnQPoG3aKO1k8ae5YwbJEsCa8If492iNY9AzENk2S4JMJPI
	 v7FoUPvN5H+tl4cWrm4vrJypcw80+tZLBLI44oxO11qQRrOMrtmurofGm1R3ka4zgdufj
	 /jPgJpwACmSLVgzBEa0xyXA9y5qmvwTcgBvCWsb5CwEEaP2arLMXy63QKTyy9pk7HI8+b
	 m5asdZIxOlAls+9bv3PDBpXvtxmQ7Ks9kxxi7sjoR9/VdhGfMyinD2PbZW4k5YEPumA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511008;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DDA8mRGP3/TXgssryDT904izo8VfBQF7i4spN/Nk6TU=;
	b=H0rKJljr1AHeZ/O+WJpe/jEh95jgXNdXJ1pKgEStF5zhZZLrCCS72CypfMBY9VfxZMRo
	 s4eQhEyjni2PITbi5oFpq7F54jKdJF9UJ+BuwyfXC1yPbHl8r+D4fLBBJwcetFznZ+qaT
	 bMgObkOBP3S6VVRi5TrnFEV7hf6iasL2kAHb1DA0EGulSS3lDFhJ2DAfEBtXSa2wh2r6A
	 ohpGp4kZ79lCDm+s6amf8SawEUC+0Q8VICcC5iwOnXVAXqGuVLG6We8VAmsrzHPMHsn8J
	 p8KHVMK4n8MV2xscEtnuJCFaF0iWdaP/1rK7yrxa1rfGWgFX+L/0+iT4BsqnotTtq1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny+B4C63;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B73606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny+B4C63
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9690C1F000D1;
	Tue, 24 Nov 2026 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511007;
	bh=DDA8mRGP3/TXgssryDT904izo8VfBQF7i4spN/Nk6TU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ny+B4C63wGbmYXa1tC+Yq8IFEaMoMWZ0ZnciShuNin3c949Aa+HmkggzlWNhkfya0
	 dHdyR+2UtGQ+UmToU5+Ktwhy5SzdMuNGD55Xw3BiANWWnBeg0z1GxQTz7042nOJqqh
	 Agd1K7EMCh4fmtwM0EmMbBGwgK8o8Y0LW8mLmz6jhoOs0p6kVE2cDSU9jm753+aiJ+
	 wtPXMNYA/uIU3xCO53lVULgWC6fek94Ea1FSsPmNmEN5luSX5/ShsPGQGNNY4XiBIR
	 QciKuicsL4tuyLQkGIZsshUFHuVgO3hULv8+nAggrmWVjQxEl5yV3JMbRvYT0yLv0m
	 MGjxIWhslTf4A==
Subject: Re: [PATCH net v6] net: bgmac: fix RX frame length check
From: netdev-bot+sashiko@kernel.org
To: rosenp@gmail.com
Cc: netdev@vger.kernel.org, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 nbd@openwrt.org, florian.fainelli@broadcom.com, horms@kernel.org
Date: Tue, 24 Nov 2026 09:03:26 +0000
Message-ID: <179551100616.3135.862420537872362729@kernel.org>
In-Reply-To: <20261123081312.39427-1-rosenp@gmail.com>
References: <20261123081312.39427-1-rosenp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 8 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 4 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On BCM47xx (MIPS, non-coherent), the poison that the new RX
  logic depends on never reaches memory.
- [Medium] bgmac_rx_cont_descs() uses the length-derived continuation
  count even when the header's DC field is 0.
- [Medium] When the slot at ring->start still holds the 0xdead/0xbeef
  poison and done <= BGMAC_RX_MAX_DESCS (42), bgmac_dma_rx_read() breaks…
- [Medium] The early header read in bgmac_dma_rx_read() runs while the
  DMA engine may still be writing the header (the patch's own premise).
- [Medium] The fix assumes no frame can use more than BGMAC_RX_MAX_DESCS
  (42) descriptors, because the header length is 16 bits.
- [Low] The commit message presents the skb_over_panic() cases as the
  result of a 'corrupted length' (a DMA problem).
- [Low] The new comment in bgmac_chip_init() says 'Every frame the MAC
  accepts fits in one RX buffer.' The rest of the driver contradicts it.
- [Low] Every slot now gets dma_sync_single_for_cpu(dma_dev, dma_addr,
  BGMAC_RX_BUF_SIZE, DMA_FROM_DEVICE) over the full 1566-byte buffer…

--

net: bgmac: fix RX frame length check

This patch tightens the bgmac RX length check, programs UMAC_MAX_FRAME_LEN
to the RX buffer size and lowers max_mtu. It also parses the RX header
flags, drops frames that span several descriptors and recycles their
continuation buffers. It reads the RX header before touching the slot, so
a poisoned header makes the driver wait for the next poll.

> A corrupted length well beyond that limit passes the check, and the
> following skb_put() runs past the skb tailroom and calls skb_over_panic()
> instead of dropping the frame.

[Severity: Low]

Is "corrupted length" the whole story here? Before this patch, two things
hold:

  UMAC_MAX_FRAME_LEN is 32 + ETHER_MAX_LEN = 1550.
  CMD_RX_ERR_DISC is cleared.

So a received frame of 1537 to 1550 bytes continues into the next buffer
through BGMAC_DMA_RX_OVERFLOW_CONT. Frame bytes 1536-1539 then become the
next slot's len/flags.

If the sender picks len = 0 there, it passes the old check:

	if (len > BGMAC_RX_ALLOC_SIZE) {

Then len -= ETH_FCS_LEN wraps to 65532 and skb_put() calls
skb_over_panic().

A later paragraph mentions that the continuation header comes from frame
data the sender controls, but it doesn't tie that to the panic. It looks
like any sender on the same L2 segment can trigger the panic on the current
code. Could the commit message say that directly?

> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
> index 9ef7307edd41e..ec5bc1be41ddc 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c

[ ... ]

> @@ -414,6 +415,21 @@ static void bgmac_dma_rx_poison_buf(struct device *dma_dev,
>  				   DMA_FROM_DEVICE);
>  }
>  
> +/* Number of continuation descriptors of the frame that starts with this RX
> + * header. The hardware reports it in the flags, but a frame longer than one
> + * buffer has continued into the next ones whatever the flags say.
> + */
> +static u8 bgmac_rx_cont_descs(u16 len, u16 flags)
> +{
> +	unsigned int descs = FIELD_GET(BGMAC_RXF_DC_MASK, flags);
> +
> +	if (len > BGMAC_RX_MAX_FRAME_SIZE)
> +		descs = max_t(unsigned int, descs,
> +			      DIV_ROUND_UP(len - BGMAC_RX_MAX_FRAME_SIZE,
> +					   BGMAC_RX_BUF_SIZE));
> +	return descs;
> +}

[Severity: Medium]

Can this drop valid frames when the hardware reports DC = 0 with a bogus
length? Any header with len > BGMAC_RX_MAX_FRAME_SIZE now sets
ring->rx_skip to a value from 1 to 41.

The rx_skip block at the top of bgmac_dma_rx_read() then recycles that
many later completed slots. It doesn't read their headers or update any
counter:

	if (ring->rx_skip) {
		ring->rx_skip--;
		bgmac_dma_rx_poison_buf(dma_dev, slot);
		goto next;
	}

Commit 77dac783f113 ("net: bgmac: rate limit RX error messages") documents
a BCM4716 case. On RX FIFO overflow the engine writes a single frame with
a bogus length of 0x45c2 (17858), and under overload this happens on every
NAPI poll.

For that length, bgmac_rx_cont_descs(0x45c2, flags) returns at least
DIV_ROUND_UP(17858 - 1536, 1566) = 11. Each event would then silently drop
11 or more of the following frames. Before, only the one slot was dropped,
and it was counted in rx_length_errors.

Also, DIV_ROUND_UP(1, 1566) = 1, so every len > 1536 is now dropped first
in the "did not fit in one buffer" branch. Can the upper bound in the
later check still be reached?

	if (len < ETH_HLEN + ETH_FCS_LEN ||
	    len > BGMAC_RX_MAX_FRAME_SIZE) {

If not, the new "invalid length %u" message is never printed for oversized
lengths. Those frames also end up in rx_over_errors instead of
rx_length_errors.

>  static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
>  			     int weight)
>  {
> @@ -435,6 +451,46 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
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
> +		/* Get info from the header */
> +		dma_sync_single_for_cpu(dma_dev, dma_addr, BGMAC_RX_BUF_SIZE,
> +					DMA_FROM_DEVICE);

[Severity: Low]

Does this early peek need to sync the whole 1566 byte buffer just to read
the 4 byte len/flags?

On the delivery path, the following dma_unmap_single(...,
BGMAC_RX_BUF_SIZE, DMA_FROM_DEVICE) repeats the same for-cpu cache
maintenance over the same range. On non-coherent ARM SoCs with an outer
L2C-310, that invalidates the whole buffer twice for every received
packet.

Syncing only the header here, or the first BGMAC_RX_FRAME_OFFSET bytes,
would avoid the second invalidate.

> +		len = le16_to_cpu(rx->len);
> +		flags = le16_to_cpu(rx->flags);
> +

[Severity: Medium]

Can these two 16 bit loads see a half-written header? The commit message
says the engine may still be writing the header when this code runs. On
dma-coherent platforms (amac0 in bcm-nsp.dtsi is marked dma-coherent),
dma_sync_single_for_cpu() does nothing. The device write can then land
between the rx->len load and the rx->flags load.

If len still reads 0xdead and flags holds the real value, the poison test
fails. bgmac_rx_cont_descs(0xdead, flags) then returns
DIV_ROUND_UP(57005 - 1536, 1566) = 36, so this frame and the next 36
completed slots are dropped.

If len holds the real value and flags still reads 0xbeef,
FIELD_GET(0x0f00, 0xbeef) gives an rx_skip of 14.

Skipping too far can also stop in the middle of a later multi-descriptor
frame. The next continuation buffer of that frame would then be parsed as
a frame. Before this patch, a mixed read cost only one frame.

Would reading both fields as one 32 bit snapshot avoid this?

> +		if (len == 0xdead && flags == 0xbeef) {

[Severity: High]

Does this poison test work on BCM47xx, which is non-coherent MIPS? Two
paths write the poison through the write-back D-cache:

  bgmac_dma_rx_skb_for_slot() writes rx->len = 0xdead and
  rx->flags = 0xbeef, then calls dma_map_single(..., DMA_FROM_DEVICE).

  bgmac_dma_rx_poison_buf() writes the poison, then calls
  dma_sync_single_for_device(..., DMA_FROM_DEVICE).

On MIPS both paths end up here:

arch/mips/mm/dma-noncoherent.c:dma_sync_virt_for_device() {
    ...
	case DMA_FROM_DEVICE:
		dma_cache_inv((unsigned long)addr, size);
    ...
}

That goes on to r4k_dma_cache_inv()->blast_inv_dcache_range(), which uses
Hit_Invalidate_D. The line holding the header is in the invalidated range,
so the dirty line with the poison is discarded without being written back.

If so, the poison never reaches memory, and this check reads whatever was
there before. That is either stale data from an earlier use of the page
fragment or, for a slot recycled through the new rx_skip path, frame bytes
the sender wrote.

If those bytes look like a valid header, the driver sets rx_skip from
them. It then unmaps the buffer and frees it or passes it up the stack,
while the engine may still have its header write pending into that memory.
After that, the continuation slot may be parsed as a frame.

These are the cases the commit message says this fixes:

  "The driver dropped such a slot and freed its buffer, which the engine
  could still write the header into, and then parsed the continuation as
  a frame."

The old code used the same poison, but the new logic now relies on it to
decide whether the engine is done with the buffer. Would this need a
DMA_BIDIRECTIONAL mapping, or an uncached poison write, to work on
BCM47xx?

> +			u32 done = (end_slot + BGMAC_RX_RING_SLOTS - ring->start) %
> +				   BGMAC_RX_RING_SLOTS;
> +
> +			dma_sync_single_for_device(dma_dev, dma_addr,
> +						   BGMAC_RX_BUF_SIZE,
> +						   DMA_FROM_DEVICE);
> +
> +			/* The header is written when the frame ends, after
> +			 * the slot of a frame spanning several descriptors is
> +			 * completed. Wait for it, unless more slots have been
> +			 * completed than one frame can use. Keep the buffer
> +			 * mapped either way, the header may still be written.
> +			 */
> +			if (done <= BGMAC_RX_MAX_DESCS)
> +				break;

[Severity: Medium]

What polls this slot again if no further RX interrupt arrives? bgmac_poll()
acks BGMAC_INT_STATUS before it reads the ring, so its re-poll check only
sees events raised after that:

	bgmac_write(bgmac, BGMAC_INT_STATUS, ~0);
	...
	if (bgmac_read(bgmac, BGMAC_INT_STATUS) & (BGMAC_IS_TX0 | BGMAC_IS_RX))
		return weight;

	if (handled < weight) {
		napi_complete_done(napi, handled);
		bgmac_chip_intrs_on(bgmac);
	}

After this break, NAPI completes and interrupts are re-enabled with
ring->start unchanged.

The header might never be written (the "DMA issue" case). It might also be
written late for a single-descriptor frame with no new RX interrupt, which
is the bcm47xx DMA bug that brcmsmac's dma_spin_for_len() works around. In
both cases every completed frame behind this slot stays in the ring until
unrelated traffic raises an interrupt. If the header is never written,
they stay until more than 42 further slots complete.

On a quiet link, frames such as ARP, DHCP or the last TCP ACK of a burst
could be held indefinitely. The old code dropped the slot and moved on,
and brcmsmac and b43 use a short bounded spin for late lengths.

Should there be a bounded wait or a NAPI reschedule here? At least, could
the commit message mention this trade-off?

> +
> +			if (net_ratelimit())
> +				netdev_err(bgmac->net_dev, "Found poisoned packet at slot %d, DMA issue!\n",
> +					   ring->start);
> +			bgmac->net_dev->stats.rx_errors++;
> +			goto next;
> +		}

[Severity: Medium]

What happens here if a frame really does use more than BGMAC_RX_MAX_DESCS
descriptors? The bound assumes the 16 bit length caps a frame at 42
descriptors, but the driver doesn't enforce that. CMD_RX_ERR_DISC is
cleared in bgmac_chip_reset() and BGMAC_DMA_RX_OVERFLOW_CONT is set.

Suppose the MAC/DMA does not truncate a frame longer than 65535 bytes.
While that frame is still arriving, its first slot keeps the poison and
done goes above 42. This path drops only that slot and jumps to next with
rx_skip still 0. The following continuation buffers, whose first 4 bytes
the sender chose, are then parsed as RX headers.

Once such a frame ends, the 16 bit len and the 4 bit BGMAC_RXF_DC_MASK
field have both wrapped. bgmac_rx_cont_descs() would then also return a
count that is too small.

In either case, a crafted header with flags = 0 and 18 <= len <= 1536
passes all the new checks and is delivered as a frame. If len runs past
the bytes actually written into that buffer, stale page fragment memory
goes up the stack.

Is it known whether the UniMAC/dma64 engine passes frames longer than
64 KiB to DMA?

[ ... ]

> @@ -1131,7 +1196,10 @@ static void bgmac_chip_init(struct bgmac *bgmac)
>  	else
>  		bgmac_umac_cmd_maskset(bgmac, ~CMD_LCL_LOOP_EN, 0, false);
>  
> -	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, 32 + ETHER_MAX_LEN);
> +	/* Every frame the MAC accepts fits in one RX buffer. The limit
> +	 * includes the FCS.
> +	 */
> +	bgmac_umac_write(bgmac, UMAC_MAX_FRAME_LEN, BGMAC_RX_MAX_FRAME_SIZE);

[Severity: Low]

Is this comment accurate? bgmac_chip_reset() clears CMD_RX_ERR_DISC, so
the MAC does not discard oversized or errored frames. The commit message
itself says "frames above the programmed maximum still reach the host".

The BGMAC_RXF_OVERSIZE handling, bgmac_rx_cont_descs() and ring->rx_skip
all exist because multi-descriptor frames can still arrive.

Could the comment say that the programmed limit matches the buffer size,
instead of saying that every accepted frame fits?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123081312.39427-1-rosenp%40gmail.com

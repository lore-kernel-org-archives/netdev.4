Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544998;
	b=rUktyo6fqNnjtVibVljy1fVeGVI80lHDukG8TE1odvDlPj1nYlvDWeKIyVLnDObzivGW
	 jrsVvxfm2XkCqoUy64/Z/KDrcHCGgrIflJgVWOzwrDbLIG/69h1OBWbfVxtQkeIYYM6J6
	 U3AEIZcSSP+xFu041LjsH3qYRBIcrrFjNt0moVNlAECn2bX06Aa+VBhb2SYNY6oLGip2d
	 Sngy0zQF5rRZzTs6PWzYHM4ZEfETobk+GKXFohmXySTdHmKGHlA5IWZ8yXRVTtTzMGXNJ
	 bHVvixzNNv377+SHoXMQYIjBiYfBot+H5m9j2sonCXN4VdG9fE2HFZQTL3+nYWST27g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544998;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=w654MEZNHX4phJkvMOndPvh3BoZbH198y9l2bP1SyTI=;
	b=apLkMtJ/4C6AQZdJRcKdAy7jcR3rTuI6AVbTYcKYUwnM1hSri97HGwWqdR6JXYrPoZwy
	 Yuf1XRdrOHwX5ZNJum2RzL+9ka67eR+6igieX41kV7CKRc6ZVstuvwAMwmDfS2ARMvi7r
	 7NvRU0VseE6ZmW167zGmfvcwvMC0KRi3ULMhFQil2Ulxu2YE1bNEpfPSs9j1x/jYtBxBV
	 OHYa0y1MZBRJ6Q/5/cTMUr5fC51/EW4BCvXGFTWhkkTw+lYFzVgZN53/Mbd4VZXUWhbmS
	 Jn+AEnws9FVYMbcQ0KlkfTDFyX4FGES+IYaun2IUnXoJYUIaCu4BrCYaqnKuPMyifGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPFlMbZ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B6606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPFlMbZ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7461F000C4;
	Tue, 24 Nov 2026 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544997;
	bh=w654MEZNHX4phJkvMOndPvh3BoZbH198y9l2bP1SyTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hPFlMbZ3FAn093p2N3dBBvlvdFtDe6MtEB/HQSRlpxbUwXaGb5TdcIG5v9WPaI2xT
	 O67OqF0i2qOYE0Y8mKUNiC4VQbjsYr/63iBzlLpm9pB0yQz/uqPpPexHJ5Jo/Z6/Ls
	 gJl5RJWEDaL8FYCUXWLJqinXhSN1k4yf7zDIRJJnezbMBeyGMtzJ2X3v267eNskTOE
	 19PLiEZf1Pbhada1hToc5N/ie6E97xIMggcCdBtzog9KAHKZoNE5LUnYnz0JKUgpL0
	 8ax8M56dbihcBsFMM5LqiEY67BDKxKaoxv+a3qQ0DkNDgU6i0KisF9cDU1bwVMzOt6
	 mmuhj1O6Jkpkg==
Subject: Re: [PATCH net-next v9 11/14] net: ethernet: cortina: Validate RX
 fragment lengths
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:56 +0000
Message-ID: <179554499621.3135.11543355488056577743@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-11-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-11-298671d799d5@kernel.org>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch treats two descriptor layouts inconsistently.
- [Low] The patch fixes descriptor-length bugs that date back to the
  driver's initial commit, but it has no Fixes: tag and no Cc: stable.
- [Low] net: ethernet: cortina: double-counted RX stats on err_drop in
  gmac_rx()

--

net: ethernet: cortina: Validate RX fragment lengths

This patch adds bounds checks on RX descriptor lengths in gmac_rx(), so a
fragment can no longer underflow or run past the posted free queue
fragment or the page. Zero-length non-final descriptors are now dropped.
An EOF descriptor that carries no new data now completes the frame that
has already been assembled.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 8431f0a2e34a4..fe23ef8be9e51 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -1864,6 +1865,9 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
>  			if (!skb)
>  				goto err_drop;
>  
> +			if (frag_len < NET_IP_ALIGN)
> +				goto err_drop;
> +
>  			page_offs += NET_IP_ALIGN;
>  			frag_len -= NET_IP_ALIGN;
>  			frag_nr = 0;

[Severity: Low]
Should this patch have a Fixes: tag, and possibly Cc: stable?

According to git blame, all of the following come from the initial driver
commit:

- the unchecked frag_len -= NET_IP_ALIGN above
- the frag_len = frame_len - skb->len underflow at EOF
- the skb_fill_page_desc() append of zero-length or oversized fragments

So the tag would be:

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

Without the tag, stable tooling cannot tell which trees need this fix.

> @@ -1872,15 +1876,33 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
>  			goto err_drop;
>  		}
>  
> -		if (word3.bits32 & EOF_BIT)
> +		if (word3.bits32 & EOF_BIT) {
> +			if (frame_len < ETH_ZLEN ||
> +			    frame_len < skb->len)
> +				goto err_drop;
>  			frag_len = frame_len - skb->len;
> +		}
> +
> +		if (!frag_len) {
> +			if (word3.bits32 & EOF_BIT) {
> +				put_page(page);
> +				page = NULL;
> +				goto complete_frame;
> +			}

[Severity: Low]
Does this count rejected frames twice in the interface statistics?

gmac_skb_if_good_frame() is called on the SOF descriptor. On success it
falls through to update_exit, which does:

	port->stats.rx_bytes += frame_len;
	port->stats.rx_packets++;

That happens before gmac_rx() runs any of the new checks. The chain can
still be rejected afterwards by one of them:

- frag_len < NET_IP_ALIGN on the SOF descriptor
- frame_len < ETH_ZLEN or frame_len < skb->len at EOF
- a zero-length non-EOF descriptor
- frag_len running past the free queue fragment or the page

In each case the code goes to err_drop. That frees the skb with
napi_free_frags() and increments port->stats.rx_dropped. The earlier
rx_packets and rx_bytes increments are left in place.

So the same frame shows up as both received and dropped. rx_bytes also
includes a byte_count that gmac_rx() has just judged inconsistent.

The commit message says descriptor inconsistencies are now accounted as
drops, but they are still counted as received as well.

Should the rx_packets and rx_bytes accounting move to the complete_frame
path? Then it would only happen once the frame is actually handed to
napi_gro_frags().

The existing MAX_SKB_FRAGS drop and the restarted-SOF drop already have
the same problem. This patch adds several more ways to reach it.

[Severity: Medium]
Are these two EOF cases handled consistently?

The empty EOF path delivers the frame when frame_len == skb->len at EOF.
For a valid frame, this seems possible only if two things are true:

- the GMAC writes trailing bytes that byte_count does not count (probably
  the 4-byte FCS) into the free queue buffers
- buffer_size in the earlier descriptors includes those bytes

If the hardware works that way, the trailing bytes could also straddle a
buffer boundary. gmac_start_dma() sets:

	dma_ctrl.bits.rd_insert_bytes = NET_IP_ALIGN;

Take 2048-byte fragments and a jumbo frame with byte_count 2044. The first
buffer would be full: buffer_size is 2048, and frag_len is 2046 after the
NET_IP_ALIGN adjustment, which includes 2 FCS bytes. The other 2 FCS bytes
land in the EOF buffer.

At EOF, frame_len (2044) < skb->len (2046). Wouldn't this valid, CRC-good
frame then go to err_drop and be counted in rx_dropped?

Could the last appended fragment be trimmed by skb->len - frame_len, and
the frame completed, instead?

Frames only span several descriptors with jumbo MTUs. The driver supports
them: max_mtu is MTU_SIZE_BIT_MASK - VLAN_ETH_HLEN, and
gmac_pick_rx_max_len() allows 9212 and 10236. Testing at the default MTU
would not hit this case.

If the hardware does behave this way, a 3-byte window of frame sizes just
below each 2048-byte boundary would always be dropped. Whether buffer_size
counts bytes that byte_count leaves out is defined only by the Gemini
datasheet.

> +
> +			if (net_ratelimit())
> +				netdev_err(netdev,
> +					   "Received fragment with len = 0\n");
> +			goto err_drop;
> +		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org

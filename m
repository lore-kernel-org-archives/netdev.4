Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111560;
	b=VsY1h8QD1X9f2kzMCWpOEK3BzyrQqaJsVUzY6jOZz1R1n46VvkeV7K1I20TFB9ioT58S
	 Y1HEF4+EbE+Wm+KVHmnkFoTdowQxVwSg2Tx4C9rSRHyEyRo1CXp1MFkTFDR+RPkOKf+Fa
	 bXm7eNcLSMsbwBGqi2XcnfT5vBHbK9Z5MsMiB+1t5ljKwHsSdygH+0DV+m9TBEJPQ1tjJ
	 CAieo0rNsZVFzz34a5BwEOaINmJhLwkazs1VRv++Z7DlGTW55MPCdbus9dQxlCsuIjoE9
	 i1j9cssAb7g9i+Ph/cEkfLfkuLB02pDL6PttYca85hSnJAjo7ybNXi0sgqg+jEH/9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111560;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5RIPsh6KWnZFuhCOH8kI9SZLTT1tVF/htSjtExaR9bs=;
	b=jn0hauWn/Ep8B/W7DVBClcTIgT5WqnbIiFhPSufPPFowtOaCXfKVUbYLhCZwJMaTMOfy
	 u0tVilfLFqiONgtLsm6hxxKjbAkeCdIfnn2nX2UfS+w+wy9VCjIObAisFuGzQEDwHY9Vt
	 lAHAbffM2gdYCzOa2MrC4fP8l7EJ8lFZfrrmqtMV0bNTgEqhhr3zH9HP6fBniJGprRfba
	 niRJRF5eIqeawiwftIrfe6EjIWnY9dAAqBarqEU4fx4KtOomu0A0woVUjZJfA1NR56/Po
	 tX3PUQRropOCAThimTvvZBLqMBZ5weadWc64i9culpOvOnIASA6oYA1jdBfw5s7QClA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4huWhg+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FD0606A33A;
	Thu, 19 Nov 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4huWhg+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23391F000C5;
	Thu, 19 Nov 2026 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111560;
	bh=5RIPsh6KWnZFuhCOH8kI9SZLTT1tVF/htSjtExaR9bs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K4huWhg+orYGjCM+QskU54Wx3tgfUOS6QJ8ZF0IVhv/b7dyu9L0sXYOMm7OGX48cM
	 aSYz/5MWb2aICcEdThoNq6KH1iZCGUaWYp/10Tfh2iELR3pc9HLPFAA+fUr1ulZ7sP
	 7y4jmeC1nyn2brmt7jUhlNLwEEGYIEvOcQ06MByvUHTL1CnKgXU3BoSVb99tjrcdfD
	 M4TJYanxcsLN4ucxGiW8pYFncWNnhpWH6e9F+zAqdMUKwn6oTNGxmb+gbnP705mnmI
	 ufTRu+ABiadEFR6n+fRWOCrmszK+i/9IrRNdXqREz7lwyebmMg4nFnk0hUnR604fz0
	 peyjFp5mDVhjg==
Subject: Re: [PATCH net-next v8 9/9] net: bcmgenet: reassemble jumbo frames
 from status block fragments
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 justin.chen@broadcom.com
Date: Thu, 19 Nov 2026 18:05:59 +0000
Message-ID: <179511155924.3136.1351414693099706913@kernel.org>
In-Reply-To: <20261118-nb-genet-mtu-nn-v2-v8-9-68f75eadf3e2@tipi-net.de>
References: <20261118-nb-genet-mtu-nn-v2-v8-9-68f75eadf3e2@tipi-net.de>
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

- [Medium] bcmgenet_desc_rx() requires every continuation (non-SOP)
  descriptor to carry at least one payload byte after its 64-byte status…
- [Low] In bcmgenet.h the patch marks DMA_BUFLENGTH_MASK (0x0fff) as "RX
  status word only", and the commit message says "that mask only…

--

net: bcmgenet: reassemble jumbo frames from status block fragments

This commit reassembles RX frames that the hardware splits across several
descriptors, each starting with its own status block, instead of dropping
them as fragmented. It raises ENET_MAX_MTU to the 14-bit
UMAC_MAX_FRAME_LEN limit. It also annotates DMA_BUFLENGTH_MASK as
applying to the RX status word only.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 54b65edd6843e..e935beee3989a 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -2530,24 +2575,43 @@ static unsigned int bcmgenet_desc_rx(struct bcmgenet_rx_ring *ring,
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

[Severity: Medium]
Can a continuation descriptor that holds only its status block ever end
a frame?

In bcmgenet_desc_rx(), a non-SOP descriptor now needs len of at least
sizeof(struct status_64) + 1. Suppose the RBUF writes an EOP descriptor
with len == 64, i.e. only the status block carrying the final flags and
the whole-frame checksum. That descriptor fails the len < min_len check,
length_errors is incremented, and bcmgenet_discard_frags() frees the
partly reassembled ring->frag_head. The whole frame is lost.

The case at risk is a frame whose data ends exactly on a descriptor
boundary. With 4K pages, ENET_THLD_PAGE_LEN works out to 3584 on a
typical 64-bit build. The SOP descriptor then holds 3582 frame bytes
after the pad, and each continuation holds 3584. Frames of
3582 + k * 3584 bytes (7166, 10750, 14334, FCS included when crc_fwd_en
is set) fill their last data descriptor exactly.

If the hardware hands that descriptor off without EOP, the EOP can only
come in a status-only descriptor. At MTU 7152 or 10736 (untagged, FCS
stripped), every full-size frame would land on such a boundary.

The 16361 byte loopback test in the commit message works out to
3582 + 3 * 3584 + 2027, so it does not reach this boundary. The TX side
of this IP already needs a threshold-boundary workaround
(priv->tx_thld_window).

Is it known that the RBUF never produces a status-only EOP descriptor?
If it can, bcmgenet_add_frag() would need a way to take dma_flag and
rx_csum from that status block without calling skb_add_rx_frag() with a
zero length.

>  			page_pool_put_full_page(ring->page_pool, rx_page,
>  						true);
>  			goto next;
>  		}

[ ... ]

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> index 1f48a67c5c01f..8f432a830a5a5 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> @@ -446,7 +446,7 @@ struct bcmgenet_rx_stats64 {
>  #define DMA_RATE_ADJ_MASK		0xFF
>  
>  /* Tx/Rx Dma Descriptor common bits*/
> -#define DMA_BUFLENGTH_MASK		0x0fff
> +#define DMA_BUFLENGTH_MASK		0x0fff	/* RX status word only */

[Severity: Low]
This isn't a bug, but is this annotation accurate? Nothing in
drivers/net/ethernet/broadcom/genet/ uses DMA_BUFLENGTH_MASK.
bcmgenet_desc_rx() gets the RX length with a bare shift:

    len = dma_length_status >> DMA_BUFLENGTH_SHIFT;

The TX path builds the length with a bare shift too:

    len_stat = (size << DMA_BUFLENGTH_SHIFT) |

The commit message says:

    The TX descriptor length field is wider than DMA_BUFLENGTH_MASK suggests,
    that mask only extracts the length from the RX status word.

Under the "Tx/Rx Dma Descriptor common bits" heading, this reads as if
the TX length field is wider on every GENET revision. The comment in
bcmgenet_probe() says otherwise:

    /* Only v5 is known to size the TBUF for a long frame and to carry the
     * full length in a transmit descriptor, the older parts stay at the
     * default MTU
     */

Could the header comment and the commit message be reworded to match
the probe comment and how the mask is actually used?

>  #define DMA_BUFLENGTH_SHIFT		16
>  #define DMA_OWN				0x8000
>  #define DMA_EOP				0x4000

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2%40tipi-net.de

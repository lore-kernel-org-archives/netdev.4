Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617424;
	b=BjqzcRgHhd4dsEXdHts50AGIJ6URnGzb7fnmvkb3cmXzj+QlrRReAXZHMWZrxjB5DnmI
	 d2NxsqkA43VDEyLN+zY1bHwjCtpurqPv5T5lP2HMj6IxnSndGyLTyy+S+ejPCZkH0ci7P
	 9jLMr4pz2p9gC3zkct/vPa/6lqmcZFHYmSWNjN444JSAWCuSJNnrjnd7fUe0R0lLCQf9b
	 xbtM2+teKvvDg860buY2kaERBQLrOVH141Uk9B2gaENbD6YzOUIQMdfvnojEtbmWmYxg0
	 MOzBG3mr5PSpGRWnbE/pnb0R9QeoEUfGBv7GqC76hXG2bi29bkVoI+4OLxSBQXrJB+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617424;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ntm+4YZ5zXeTUCr55OFzUjV2Ud773hYRmG/JzK3KOAM=;
	b=ZikHkZ8s6Y3+NN+/9r31aNCuaUOTyMeDeVFUPAbHkaWEH5rTVPzk0p86o2H0cF4tELje
	 vSxzS2Ad07RF1cJHcqmvc9fSDX7OUtfsodyCkr93fa3a0/N0Vzh5FChth1sQFwib33ThH
	 fAW0viNAvAte+X5d/psnBrESmwchV3wcOLVdUcCVNvEvU7cotPWmYjGghNTVPBIsmQDjH
	 DfEzEE8FfZze83JV3/pk7oCOgZ7Pce76ln3u2hz1P7jV377ExrgVA0+mYsV1qZ0wU+GUU
	 4zy4i33CuJrpV5raT3/LyOwLDcPDyZTvrpuvT6WEkc2u1rIVx+NW+mBJKIQkL27DP4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCVvNIOc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB802606A321;
	Wed, 25 Nov 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCVvNIOc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251B61F000CF;
	Wed, 25 Nov 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617423;
	bh=Ntm+4YZ5zXeTUCr55OFzUjV2Ud773hYRmG/JzK3KOAM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KCVvNIOcJY8bDOI+cfTQF/97tClJmObBRjvrZI1GfohB3Zz4g6xhFZr9LN2R+IHtm
	 JyMiKnd1uNzMlTigRLaZNc9vsvBn7A9+UZd8fOsMXA70HxOnLqKGpx5BXnB/8DYuXz
	 lb+pA3f8jqgrIjRYGqxB1s6mdExCJfIqP0PKeRX4TrpBM420qqK+fBpHfdc6ofwNdQ
	 CIQdSne8LD9Y/S7q36r5SygNv/rpH/fugQ3McS+xn2jCKataw8wLweoCesBSuPd3gq
	 qKEb53zrUFJvWom/HNmQTCdp2IgB2Z5+VtuKs2UP93QPjpkl3YdxQY90gKJhFIVP2i
	 9Jpjx7TVwnSFw==
Subject: Re: [PATCH net-next v2 1/7] net: lan743x: check DMA channel stop and
 reset results
From: netdev-bot+sashiko@kernel.org
To: cbabroski@nvidia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, Raju.Lakkaraju@microchip.com,
 maxime.chevallier@bootlin.com, yuiko.oshino@microchip.com, nb@tipi-net.de,
 woojung.huh@microchip.com
Date: Wed, 25 Nov 2026 14:37:01 +0000
Message-ID: <179561742163.3135.1760016027745827288@kernel.org>
In-Reply-To: <b1dc6a8037ab596053cc60c065a9b447982118df.1795027003.git.cbabroski@nvidia.com>
References: <b1dc6a8037ab596053cc60c065a9b447982118df.1795027003.git.cbabroski@nvidia.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix does not finish its own error path.
- [Low] In lan743x_tx_close(), the return value of the new
  lan743x_tx_fifo_disable() is discarded, and `if (stop_failed)…

--

net: lan743x: check DMA channel stop and reset results

This patch checks the DMA channel stop result in lan743x_tx_close() and
lan743x_rx_close(). If the channel is still stop-pending or started, it
issues a channel soft reset before the rings are freed. It also moves the
channel and TX FIFO reset sequences into helpers, and lan743x_tx_open()
and lan743x_rx_open() now fail when those resets time out.

> diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
> index 82d3ec20ba259..92cdc13495fe9 100644
> --- a/drivers/net/ethernet/microchip/lan743x_main.c
> +++ b/drivers/net/ethernet/microchip/lan743x_main.c

[ ... ]

> @@ -2218,14 +2248,63 @@ static int lan743x_tx_ring_init(struct lan743x_tx *tx)

[ ... ]

>  static void lan743x_tx_close(struct lan743x_tx *tx)
>  {
>  	struct lan743x_adapter *adapter = tx->adapter;
> +	bool stop_failed = false;
> +	int ret;
>  
>  	lan743x_csr_write(adapter,
>  			  DMAC_CMD,
>  			  DMAC_CMD_STOP_T_(tx->channel_number));
> -	lan743x_dmac_tx_wait_till_stopped(adapter, tx->channel_number);
> +	ret = lan743x_dmac_tx_wait_till_stopped(adapter, tx->channel_number);
> +	if (ret < 0 || ret == DMAC_CHANNEL_STATE_STARTED) {
> +		stop_failed = true;
> +		netdev_warn(adapter->netdev,
> +			    "TX channel %d failed to stop, resetting it\n",
> +			    tx->channel_number);
> +	}
>  
>  	lan743x_csr_write(adapter,
>  			  DMAC_INT_EN_CLR,
> @@ -2235,11 +2314,9 @@ static void lan743x_tx_close(struct lan743x_tx *tx)
>  	napi_disable(&tx->napi);
>  	netif_napi_del(&tx->napi);
>  
> -	lan743x_csr_write(adapter, FCT_TX_CTL,
> -			  FCT_TX_CTL_DIS_(tx->channel_number));
> -	lan743x_csr_wait_for_bit(adapter, FCT_TX_CTL,
> -				 FCT_TX_CTL_EN_(tx->channel_number),
> -				 0, 1000, 20000, 100);
> +	lan743x_tx_fifo_disable(tx);
> +	if (stop_failed)
> +		lan743x_dmac_tx_reset(adapter, tx->channel_number);

[Severity: Low]
The return value of lan743x_tx_fifo_disable() is dropped here. The channel
SWR is issued based on stop_failed alone, even if FCT_TX_CTL_EN_ never
cleared.

The commit message says:

    the TX channel should only be reset once its FIFO is stopped.

This patch targets a wedged channel. On that path, the FIFO is probably
the part most likely to also miss the 100 ms disable poll. Should the FIFO
disable result be checked before DMAC_CMD_TX_SWR_ is written? Another
option is a FIFO reset with FCT_TX_CTL_RESET_ at that point.

>  
>  	lan743x_tx_release_all_descriptors(tx);
>  

[Severity: High]
What happens here if lan743x_dmac_tx_reset() also times out?

The helper returns -ETIMEDOUT and logs "TX channel %d reset timed out".
That return value is dropped, and lan743x_tx_close() continues into two
calls:

- lan743x_tx_release_all_descriptors(), which unmaps and frees the TX
  skbs.
- lan743x_tx_ring_cleanup(), which calls dma_free_coherent() on the
  descriptor ring and the head write-back buffer.

The commit message says the reset is issued "before anything is freed",
so that memory the channel "may still be fetching from or writing to" is
not released. If a wedged channel can ignore STOP_T, can it also ignore
SWR? The open path in this patch already treats an SWR timeout as a real
failure.

lan743x_rx_close() follows the same pattern:

	ret = lan743x_dmac_rx_wait_till_stopped(adapter, rx->channel_number);
	if (ret < 0 || ret == DMAC_CHANNEL_STATE_STARTED) {
		...
		lan743x_dmac_rx_reset(adapter, rx->channel_number);
	}
	...
	lan743x_rx_ring_cleanup(rx);

On the RX side, an engine that is still running could write incoming
frame data, descriptor status and the head index into memory that has
already gone back to the allocator.

Older code makes this worse on the next open. The call chain
lan743x_rx_ring_init()->lan743x_rx_init_ring_element()->
lan743x_rx_update_tail() writes RX_TAIL before lan743x_rx_open() resets
the channel. At that point RX_BASE_ADDR still points at the ring that was
freed.

This also looks unchanged after the later patch in the series, "net:
lan743x: reset the device on TX timeout". That patch runs
lan743x_dmac_init() only after lan743x_netdev_close() has already freed
the rings.

Could the close paths check the reset result and, if it failed, leak the
DMA memory instead of freeing it? Escalating to a full DMAC or PCI reset
would be another option.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795027003.git.cbabroski%40nvidia.com

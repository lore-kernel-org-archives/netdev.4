Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445894;
	b=3AdMfcMUNbUO77pHhkCyBUHIYeDH+P7OjcP9OpiIbW+imUTk5KJRglMnkwWaXFGCs6LP
	 8uVFx70RmLvz8gg5wkBJpem6OX/inxDp6nJeUYdX2TydsFK7Iz3sr7Bn36CUPGYj7IqKh
	 +NLg+gSEKY71OPGzVJCxCrnVq9bggYeYr/jUOZeEO7ku63zFaXSXXF/19j+9wiqZkiKO4
	 hHggIOack1ZiM6+rES+HRRi03MImQfF5Y1t8MZO0Hk8ltY1PxPhz98q10llBLriWk5i/1
	 MCSNwcdUpluv32ufaMZjQuCPmKTJ7BWIgvLXcTshBFUXZW1tFpICj/xUyFbVqzUxT2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445894;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Lv7m7ONQl3ke0wjy2fX9hrSMmimqdwjd9vW/Uuoq++c=;
	b=d0Wo7ieGqjt2SZ4zyhS860nbSTz/t5FSpdOCajx1wYWTN7COKGYMmnMC3E11Ny3Vf9ff
	 bWW6I37TjoosneaOvlGFlDzgJgVaeJFhimvL2gXgnz4So84sgpu+HjS9gqXhA0o7OnxB5
	 cen5w+BJCbb8eW52WvSSlvdJ33Uo0QIRYwNP5BGlnhXo6JV1VK2qC3UBzg0A9KExisZKj
	 LVA3KITfLTKOrGXmuzie4LZJrX6ZYS3XiTFBGDlp6+iIXRSRiPIyzX7cqIKHWLC8L9oTB
	 VEC9nsD54ybHgEr1lAPXUO3KvUsPOc71dTcAfs5LM2e4a1nAiUxNg3FjqS/wasiRIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jInkaQxG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BC606A31A;
	Mon, 23 Nov 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jInkaQxG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2B31F000C6;
	Mon, 23 Nov 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445893;
	bh=Lv7m7ONQl3ke0wjy2fX9hrSMmimqdwjd9vW/Uuoq++c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jInkaQxG2+XYC5FL+Ce8kPf9N2+M4Pd7TK9oZ2O39StHVgu7TKPud73O5ZMxjqL8K
	 XiEIqhG4wHoRje/ia/r6es/4eKWi3tc4IuT09npm6kHnY+F0GpJt03U7PxgfWmCbuB
	 ujAId5BO1QP6YXJ1U6Jdhl6Q8DQVa91NNcV3ebeyHEl0t588KvIum5nMITI7njKQny
	 wVcpwQNiT+8ITxq9Q538eeZff/yPjC4ODOsfwXh+kVdkE8HpGHKyPLcGFrc6S6YBAW
	 r8yTY+qsz35GtYD4TugOfENdExCYuJo+YWUcec+MHUa+3TmlV6gv+xE7+YNKqwufxZ
	 BW1AQt2eUsinA==
Subject: Re: [PATCH net-next v3 1/9] net: sparx5/lan969x: stop the FDMA
 channels properly
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:11 +0000
Message-ID: <179544589189.3135.16381181122597988250@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-1-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-1-55c272fe1acc@microchip.com>
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

- [Medium] The new sparx5_fdma_stop() disables both channels
  (FDMA_CH_DISABLE) and waits for FDMA_CH_ACTIVE to clear.
- [Medium] sparx5_fdma_stop() now detects when the RX/TX channels fail to
  go inactive within 10 ms (SPX5_FDMA_STOP_TIMEOUT_US).
- [Low] This commit fixes bugs that already exist in sparx5_fdma_stop(),
  but it is framed as preparation for a feature and carries no Fixes:…

--

net: sparx5/lan969x: stop the FDMA channels properly

This commit changes sparx5_fdma_stop() so that it disables the RX and TX
channels through FDMA_CH_DISABLE and waits for FDMA_CH_ACTIVE to clear.
The old code cleared bits in FDMA_CH_ACTIVATE, which has no effect. The
commit also stops the injection port with INJ_STOP, fixes the inverted
XTR_BUF_IS_EMPTY poll, and adds the FDMA_CH_ACTIVE register definition.

> The stop sequence is used by the FDMA deinit, and by the FDMA buffer
> resize added later in this series.

[Severity: Low]
The patch is presented as groundwork for the resize later in the series.
But the commit message also says the current stop sequence never stops the
channels, and that the XTR_BUF_IS_EMPTY wait always runs until it times
out.

Both of those problems seem to date back to:

Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")

The existing deinit paths free DMA memory right after the stop.
sparx5_fdma_deinit() calls fdma_free_phys() on the DCBs, and
lan969x_fdma_deinit() frees the coherent rings and the page_pool. So on
current kernels, unbind or probe-failure teardown frees DCB memory while
the channels are still active, and every stop stalls for 10 ms.

Should this carry a Fixes: tag and go to net on its own, rather than as
part of the net-next MTU series? Without the tag, stable kernels will not
pick it up.

Could the commit message also mention the risk of the device doing DMA
into freed memory?

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> index 8675702bf1504..8a847ec067de6 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c

[ ... ]

> @@ -474,20 +477,39 @@ int sparx5_fdma_start(struct sparx5 *sparx5)
>  
>  int sparx5_fdma_stop(struct sparx5 *sparx5)
>  {
> +	u32 channels = BIT(sparx5->rx.fdma.channel_id) |
> +		       BIT(sparx5->tx.fdma.channel_id);
>  	struct sparx5_rx *rx = &sparx5->rx;
>  	struct sparx5_tx *tx = &sparx5->tx;
>  	u32 val;
>  
>  	napi_disable(&rx->napi);
>  
> -	/* Stop the fdma and channel interrupts */
> +	/* Disable the channels, and wait for them to finish the current DCB */
> +	spx5_wr(FDMA_CH_DISABLE_CH_DISABLE_SET(channels), sparx5,
> +		FDMA_CH_DISABLE);
> +
> +	if (read_poll_timeout(sparx5_fdma_ch_active,
> +			      val,
> +			      !(FDMA_CH_ACTIVE_CH_ACTIVE_GET(val) & channels),
> +			      SPX5_FDMA_STOP_SLEEP_US,
> +			      SPX5_FDMA_STOP_TIMEOUT_US,
> +			      false,
> +			      sparx5))
> +		dev_warn(sparx5->dev, "Failed to stop FDMA channels\n");

[Severity: Medium]
What happens to the DMA memory if this times out? The timeout only causes a
dev_warn(), and sparx5_fdma_stop() still returns 0. The deinit callers then
free everything without checking the result:

sparx5_fdma_deinit() {
	sparx5_fdma_stop(sparx5);
	fdma_free_phys(&sparx5->rx.fdma);
	fdma_free_phys(&sparx5->tx.fdma);
	...
}

lan969x_fdma_deinit() {
	...
	sparx5_fdma_stop(sparx5);
	fdma_free_coherent(sparx5->dev, &tx->fdma);
	fdma_free_coherent(sparx5->dev, &rx->fdma);
	lan969x_fdma_free_pages(rx);
	page_pool_destroy(rx->page_pool);
	...
}

After the next patch in the series, sparx5_fdma_deinit() also calls
consume_skb() on the RX skbs.

If a channel is still active after the 10 ms SPX5_FDMA_STOP_TIMEOUT_US,
can the extraction engine write received frame data and DCB status words
into freed and reused memory? Can the injection engine also keep reading
freed memory?

For comparison, lan966x uses the same CH_DISABLE/CH_ACTIVE sequence with
a READL_TIMEOUT_US of 100 s rather than 10 ms.

Later in the series, sparx5_fdma_pause() follows this stop with an
FDMA_CTRL_NRESET reset, which covers the resize path. At the end of the
series, both deinit paths still have no reset and no error handling.

Would it work to reset the FDMA (FDMA_CTRL_NRESET 0 then 1) after the stop
in the deinit paths? Another option is to return the timeout from
sparx5_fdma_stop() and not free the DMA memory when it fails.

> +
> +	/* Stop the fdma and the RX channel interrupt */
>  	sparx5_fdma_rx_deactivate(sparx5, rx);
>  	sparx5_fdma_tx_deactivate(sparx5, tx);
>  
> -	/* Wait for the RX channel to stop */
> -	read_poll_timeout(sparx5_fdma_port_ctrl, val,
> -			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val) == 0,
> -			  500, 10000, 0, sparx5);
> +	/* Wait for the extraction buffer to be empty */
> +	read_poll_timeout(sparx5_fdma_port_ctrl,
> +			  val,
> +			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val),
> +			  SPX5_FDMA_STOP_SLEEP_US,
> +			  SPX5_FDMA_STOP_TIMEOUT_US,
> +			  false,
> +			  sparx5);

[Severity: Medium]
Can this wait succeed if the extraction buffer is not already empty?

Both channels, including the extraction channel, are disabled and polled
until inactive first. Only after that does sparx5_fdma_rx_deactivate() set
XTR_STOP:

sparx5_fdma_rx_deactivate() {
	...
	/* Stop RX fdma */
	spx5_rmw(FDMA_PORT_CTRL_XTR_STOP_SET(1), FDMA_PORT_CTRL_XTR_STOP,
		 sparx5, FDMA_PORT_CTRL(0));
}

During the disable window XTR_STOP is still 0, so the extraction port can
keep moving frames into the FDMA extraction buffer. Once the extraction
channel is inactive, nothing writes that buffer out to memory.

In that case the wait runs for the full 10 ms. Its return value is then
dropped without a warning. FDMA_PORT_CTRL_XTR_BUF_RST is also never used.

Would the expected order be to set XTR_STOP, wait for XTR_BUF_IS_EMPTY
while the channel is still active, and then do CH_DISABLE and wait for
CH_ACTIVE? Resetting the buffer with XTR_BUF_RST could be another option.

Later in the series, sparx5_fdma_pause() drains the CPU queues before
calling this stop, and runs FDMA_CTRL_NRESET plus sparx5_xtr_flush() after
it. That lowers the risk on the resize path. sparx5_fdma_stop() itself
is unchanged at the end of the series, though, so this wait still does
not do what the comment and the commit message describe.

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

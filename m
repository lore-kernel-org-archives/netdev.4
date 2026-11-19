Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117426;
	b=ptk/JoxMy37B6MbPSu04a+OFNj2H36VtFJclM3Zcytinl6ofSPVPov6j4+hSDMla8qFi
	 3w7SPGuxUhXoXYHaCVBBh9FCQMHeihaTK4es9M7YV+3MBSWE4VBA9SCz/1kgSJlvV7y6G
	 934VaAihfDlYmTv1r37HqpBEo//ikTVX4TxfjBsKS3UBohLtYMrqJuRTiMBSyDNJnlyMp
	 9qqw2FtyL9G7yV1WsuWabzmDcZgrQjFZ7T4uEswd5wJSLXCGQ0FvFKvCm1upOBK32xL0u
	 Mlc3REBt4hG/3MyKPGwAqKX41AJbHscM/EYEejJ0705t3ZFnMSz4UQrjNsJ7E6+mlNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117426;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qBLuacBYKz/tdxSHVBEHjNWt6ZoFU95vFan68bdG1qo=;
	b=ahB4ThimEY5YFA6tDk/+Gx48J57Awkuit8i5aIVN0ZtL7dF9GYSVWI/TQ42jlTs4oAM3
	 F9h7ObDMvYWCzQQhL20gEuVZF4y/+VFYi15+iYqPgOQntbkeuANI/M5Vt9yQWof4dqwqH
	 sOdhyJBUs6leouFYnoENbekPAhnGiQYjCOt+k3NbF1XIjn/EqBMAVSVAx0YSTyQiPeH89
	 j8b8zcNqWXacTADMiqazNBc0fqm0kAfmCNsSp6ib5FHCBBUWhBl6D+grdpECmDmNbf6+0
	 EJ4ebv1X4Kg58A1YeeeGVyOuKp1bTpPGUj+DOn6+K7HhNajxNp3LNHy+ZPS2IBVnS9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O22ep1Bv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7FB606A32A;
	Thu, 19 Nov 2026 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O22ep1Bv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D5D1F000C4;
	Thu, 19 Nov 2026 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117426;
	bh=qBLuacBYKz/tdxSHVBEHjNWt6ZoFU95vFan68bdG1qo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O22ep1Bv/KO5P5jOgb9+RHffFJYPcPV9AMHPtyaGQlq7sZ00vHjxREhSOc0IlNNzI
	 X3uk6S3voZkPVf23zU6ntg1XNMeJ117Tqpeic9uHtuVD1PyAMiy7vNs4KCyfn/oVF0
	 oRR+9rd6SzQh1TAHaKelW3TaZ5T3y4rV5M/FZJcUxPheB22WjCaNSTvgoCKSprSMHo
	 suTY6QqljlyrVO/3lTAKGCVoI1uKudN+kuqpUSILKKjWX0569LZtW9F7X/8+4EYNPX
	 hpgQX5bVD8HBke3q9rMRwhNkStyFjszdPLoaIO1pvsMfhVRBuCUxtfkgeYzA+T8X0+
	 KfMMhsj59R2ug==
Subject: Re: [PATCH net-next] net: stmmac: dwmac4: schedule RX NAPI on Receive
 Buffer Unavailable
From: netdev-bot+sashiko@kernel.org
To: david.wu@rock-chips.com
Cc: rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 lorenzo.bianconi@oss.qualcomm.com, luis.la@mail.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 kuba@kernel.org
Date: Thu, 19 Nov 2026 19:43:45 +0000
Message-ID: <179511742535.3136.6978268600110523155@kernel.org>
In-Reply-To: <20261117034332.88443-1-david.wu@rock-chips.com>
References: <20261117034332.88443-1-david.wu@rock-chips.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In dwmac4_dma_interrupt()
  (drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c), the new `ret |=…
- [Medium] The fix depends on a single RBU edge to restart a suspended RX
  DMA, but the non-ZC RX poll does not handle a refill failure.
- [Medium] The new RBU → handle_rx scheduling in dwmac4_dma_interrupt()
  runs only when the handler sees DMA_CHAN_STATUS_AIS (line 155).
- [Low] The patch fixes a permanent, user-visible RX hang but has no
  Fixes: tag and no stable Cc.

--

net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable

This patch makes dwmac4_dma_interrupt() return handle_rx when it sees the
Receive Buffer Unavailable (RBU) abnormal interrupt. The RX NAPI then gets
scheduled, so stmmac_rx_refill() can restart a suspended RX DMA. This
matches what the XGMAC handler already does for RBU.

> Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> enabled the RBU interrupt for dwmac4, but the interrupt handler only
> updates the statistics counter without scheduling the RX NAPI. The RX
> NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
> the RX path hangs forever once the ring has been exhausted.

[Severity: Low]
Should this have a Fixes: tag for 1b9707e6f1a9, and maybe a stable Cc?
Without one, kernels that already have 1b9707e6f1a9 won't get this hang
fix automatically.

The wording also suggests that 1b9707e6f1a9 caused the hang. As far as I
can tell, 1b9707e6f1a9 only added DMA_CHAN_INTR_ENA_RPS/RBU to
DMA_CHAN_INTR_ABNORMAL(_4_10) so the counters would update. A drained ring
stalled before that commit too. 1b9707e6f1a9 is what makes this approach
possible.

Would a sentence saying this change has no effect without 1b9707e6f1a9
help backporters?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafaf..929aa77ce247d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -153,8 +153,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
>  
>  	/* ABNORMAL interrupts */
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {

[Severity: Medium]
Is gating on AIS safe in multi-MSI mode? stmmac_msi_intr_tx() and
stmmac_msi_intr_rx() both call dwmac4_dma_interrupt() on the same
DMA_CHAN_STATUS register, and no lock serializes them. AIS is in
DMA_CHAN_STATUS_MSK_COMMON, which is part of both MSK_RX and MSK_TX. AIE is
in intr_en, so the TX vector handler also acks AIS.

Consider this sequence on one channel:

TX vector (CPU1)
  dwmac4_dma_interrupt(..., DMA_DIR_TX)
    reads AIS | TI | RBU, masks to MSK_TX
    writel(AIS | TI)   /* clears AIS */

RX vector (CPU2)
  dwmac4_dma_interrupt(..., DMA_DIR_RX)
    reads RBU without AIS
    skips the RBU branch
    writel(RBU)        /* clears RBU */

Could RBU get acked here without rx_napi being scheduled? Two things
decide this, and I couldn't confirm either from the code:

  - whether RBU can reach the RX vector without RI in the same read
  - whether AIS re-asserts while RBU stays set

The dir mask already limits RBU to the RX side. Would testing RBU outside
the AIS block close this window?

This doesn't apply in shared IRQ (DMA_DIR_RXTX) mode.

> -		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
> +		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU)) {
>  			x->rx_buf_unav_irq++;
> +			ret |= handle_rx;

[Severity: Medium]
Can handle_rx be lost when RBU shows up in the same status read as TPS or
FBE? Later in the same AIS block, ret is assigned, not ORed:

drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c:dwmac4_dma_interrupt() {
    ...
		if (unlikely(intr_status & DMA_CHAN_STATUS_TPS)) {
			x->tx_process_stopped_irq++;
			ret = tx_hard_error;
		}
		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
			x->fatal_bus_error_irq++;
			ret = tx_hard_error;
		}
    ...
	writel(intr_status & intr_en,
	       ioaddr + DMA_CHAN_STATUS(dwmac4_addrs, chan));
}

DMA_CHAN_INTR_ENA_RBU is in DMA_CHAN_INTR_ABNORMAL, so the final writel()
still clears RBU. stmmac_napi_check() then doesn't schedule rx_napi. When
status == tx_hard_error, stmmac_dma_interrupt() only calls stmmac_tx_err().
Would the RX DMA stay suspended in that case?

TPS may make this easier to hit. Its enable bit isn't in
DMA_CHAN_INTR_ABNORMAL(_4_10), so the W1C write never clears it. TX DMA
can be stopped without a DMA soft reset, for example:

  - stmmac_tx_err()->stmmac_stop_tx_dma()
  - stmmac_disable_tx_queue() during XSK pool setup

TPS could then stay latched. In shared IRQ (DMA_DIR_RXTX) mode, every
later RBU on that channel would take the ret = tx_hard_error path, and
stmmac_tx_err() would stop TX DMA again.

dwxgmac2_dma_interrupt(), which the commit message cites, uses
ret |= tx_hard_error and so keeps handle_rx. Switching to |= alone isn't
enough here, because stmmac_dma_interrupt() and stmmac_msi_intr_tx() test
for equality:

		} else if (unlikely(status[chan] == tx_hard_error)) {
			stmmac_tx_err(priv, chan);

Would it work to OR handle_rx back in after the TPS/FBE checks, or to
switch both sides to bit tests?

[Severity: Medium]
Is a single RBU edge enough to recover if the refill fails? This RBU is
W1C cleared before anyone knows whether stmmac_rx_refill() worked.

stmmac_rx_refill() allocates with GFP_ATOMIC | __GFP_NOWARN:

		if (!buf->page) {
			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
			if (!buf->page)
				break;
		}

		if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
			if (!buf->sec_page)
				break;

If the allocation fails on the first dirty descriptor, dirty_rx and the
tail pointer are written back unchanged. dwmac4 has no
enable_dma_reception callback to kick the DMA.

stmmac_rx_refill() returns void, and stmmac_rx() returns only the packet
count. So stmmac_napi_poll_rx() calls napi_complete_done() and re-enables
only RIE. A suspended DMA can't raise RI. RBU is set only when the DMA
moves from a DMA-owned descriptor to a host-owned one, so it shouldn't
re-assert.

Would RX on that queue then hang, which is the same state this patch is
meant to fix?

stmmac_rx_zc() handles the same case by returning limit on failure, so
NAPI keeps polling:

	return failure ? limit : (int)count;

The SPH setup in the commit message needs two page allocations per
descriptor, so it is the setup most likely to hit this.

> +		}
>  		if (unlikely(intr_status & DMA_CHAN_STATUS_RPS))
>  			x->rx_process_stopped_irq++;
>  		if (unlikely(intr_status & DMA_CHAN_STATUS_ETI))

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117034332.88443-1-david.wu%40rock-chips.com

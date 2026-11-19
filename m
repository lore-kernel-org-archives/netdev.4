Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116477;
	b=yb5TTlC6Bh52ma0TIlTbaM8uG0zhX+tMsX4Dm86Pn4cJY9Kgw/49sLQ+2fIT43XDaPfx
	 h7F3Ln8rkqP/OLnxkAkP25uSGPF+vPR53yBZv3oJw2TcGsI0kk+Owmev4rPUnk/fcG6to
	 1eDLT7U1YIoqHuux4PXFGrWg55o/ROAsHloBNXvGGUCHNLZICNt49HSx5k3alX4HeIEKX
	 w6Pkmib513zzlXtHJn17oG4iyMGGevgSxXMeE8xe9GuWvgRL9NZ5/plbNjxGwBOmcTceq
	 4Hgs1x0UpgYc+f0LNm6s1ECu5b1c06lueqggBaHDZWlqSRx4rZrH32tU3cng7WQZBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116477;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iF93+Knw0iDiLIf0EzbpftEEDpGmvMRkmUABj2bhs5c=;
	b=wZAt9SuLrnftkzN/M0U/+lKDl0ZVkREsbIlsSr6FJE3Wz0SYt2PbRjVJlTQiJUqc7vbY
	 YsP2y2DzVOutNh+jv1HSmMeTKZI1E6oUJqRxQGROhg+STQBPQy1ymEbEtTdidQeO7cAN7
	 nKkVOzcjGNBb0ke3v8QdMkZh0nR4b6qVfJNyUW4cwS4pLbjE3XGDhJhT+9n/CoteZ/5Sx
	 CiBdEZEJ7TvE8QtpTR5VowS5fIOd54//71rGZSMHjVeJVDUlsugAHnV5dpTGwcXAy/1qc
	 KTcE38+N7BC6WI6IIWx71C+Mapl6E21TkO94Cyun9NjIBilsN8Nyc9TiaBdQd606GgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPIlV8de;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2590606A326;
	Thu, 19 Nov 2026 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPIlV8de
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC03E1F000C4;
	Thu, 19 Nov 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116476;
	bh=iF93+Knw0iDiLIf0EzbpftEEDpGmvMRkmUABj2bhs5c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iPIlV8deF1A29Z3v4K3xbtKge3vqOvyOMtVTBptHal7QlfqGJ0vgJ9J33JcxjAKO4
	 F2IxQM1dase6pCGTUwhLqAkzLJ2C90Yj2PDKJf2hOMhxStlBFrQm16Y7i9ps1SmwZb
	 cjohH29F3RK3VuIMDGwyGdgUMxsO6Vkqzrp7lIeqOhmbsZv8mAnS5zZ1T75nXz4M0y
	 6hQxRA/pO7HUFFBeEPscYgjhzYLMUu8SjE+gsb/okTJgz9paj4GM8+4JA8sEdh0Na3
	 ZBCi09nGImE0+maXu4tzhnKTV9mY8OsXZvIoz7jCUuuesVbna6S8mjUItpDdaecUoN
	 afX3RH/8kRBHA==
Subject: Re: [PATCH net-next] net: stmmac: dwmac4: schedule RX NAPI on Receive
 Buffer Unavailable
From: netdev-bot+sashiko@kernel.org
To: david.wu@rock-chips.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, Jose.Abreu@synopsys.com,
 davem@davemloft.net, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, lorenzo.bianconi@oss.qualcomm.com,
 luis.la@mail.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Thu, 19 Nov 2026 19:27:55 +0000
Message-ID: <179511647551.3136.1129245324119091209@kernel.org>
In-Reply-To: <20261117042754.96177-1-david.wu@rock-chips.com>
References: <20261117042754.96177-1-david.wu@rock-chips.com>
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

- [Medium] The commit message says that because the RBU handler only
  counted the event, "the RX NAPI is therefore never invoked,…
- [Medium] In dwmac4_dma_interrupt()
  (drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c), the new `ret |=…
- [Medium] In dwmac4_dma_interrupt(), the new RBU handling only runs
  inside `if (intr_status & DMA_CHAN_STATUS_AIS)`.
- [Low] The commit fixes a user-visible problem: it says RX "hangs
  forever" once the ring is exhausted, and it blames the gap on commit…

--

net: stmmac: dwmac4: schedule RX NAPI on Receive Buffer Unavailable

The patch makes dwmac4_dma_interrupt() return handle_rx when the RBU
(Receive Buffer Unavailable) status bit is set, so the RX NAPI is
scheduled and the ring gets refilled. Before this, RBU only bumped a
counter. The goal is to match the XGMAC handler and recover from RX
hangs once the RX ring is exhausted.

> Commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")
> enabled the RBU interrupt for dwmac4, but the interrupt handler only
> updates the statistics counter without scheduling the RX NAPI. The RX
> NAPI is therefore never invoked, stmmac_rx_refill() never runs, and
> the RX path hangs forever once the ring has been exhausted.

[Severity: Medium]
Is this description accurate? stmmac_rx() calls stmmac_rx_refill() at
the end of every NAPI poll, and stmmac_rx_refill() always ends with:

	rx_q->dirty_rx = entry;
	stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->dirty_rx);
	/* Wake up Rx DMA from the suspend state if required */
	stmmac_enable_dma_reception(priv, priv->ioaddr, queue);

If the ring ran dry only because refill was slow, the next poll
triggered by an RI would restart it.

A permanent hang seems to need a poll that completes while descriptors
are still unrefilled. In the non-ZC path, that happens when
page_pool_alloc_pages() fails for buf->page, or for buf->sec_page with
SPH:

		if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
			if (!buf->sec_page)
				break;

stmmac_rx_refill() returns void, so stmmac_rx() returns count < budget
and stmmac_napi_poll_rx() calls napi_complete_done(). No RI follows
after that, because the DMA is suspended on CPU-owned descriptors.

The XSK path already handles this case. stmmac_rx_zc() ends with:

	return failure ? limit : (int)count;

so NAPI keeps polling.

If refill failure is the real trigger, the hang would predate
1b9707e6f1a9. Before that commit RBU was not enabled at all, and the
same exhaustion plus refill failure would hang the same way. Could the
commit message describe the refill failure case instead?

There is a related concern. Suppose the poll triggered by RBU also
fails to allocate, and the hardware raises RBU only once per
suspension. NAPI would complete again and RX would stay hung. Would it
be more robust to keep polling on refill failure, the way
stmmac_rx_zc() does? Whether RBU is raised again while the DMA stays
suspended can't be determined from the driver code alone.

[ ... ]

> Signed-off-by: David Wu <david.wu@rock-chips.com>

[Severity: Low]
Should this have a Fixes: tag? The commit message names 1b9707e6f1a9
as the commit that left the gap, and this change depends on it.
1b9707e6f1a9 is what added DMA_CHAN_INTR_ENA_RBU to both
DMA_CHAN_INTR_ABNORMAL and DMA_CHAN_INTR_ABNORMAL_4_10.

On a tree without that commit, RBU raises no interrupt. A backport of
the new ret |= handle_rx would build but do nothing. For example:

Fixes: 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU interrupts")

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafaf..929aa77ce247d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -153,8 +153,10 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
>
>  	/* ABNORMAL interrupts */
>  	if (unlikely(intr_status & DMA_CHAN_STATUS_AIS)) {
> -		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU))
> +		if (unlikely(intr_status & DMA_CHAN_STATUS_RBU)) {
>  			x->rx_buf_unav_irq++;
> +			ret |= handle_rx;
> +		}

[Severity: Medium]
Can handle_rx get lost here? Later in the same AIS block of
dwmac4_dma_interrupt(), the TPS and FBE branches use plain assignment:

		if (unlikely(intr_status & DMA_CHAN_STATUS_TPS)) {
			x->tx_process_stopped_irq++;
			ret = tx_hard_error;
		}
		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
			x->fatal_bus_error_irq++;
			ret = tx_hard_error;
		}

Say RBU and TPS (or FBE) are set in the same status read and RI is
not. The handle_rx bit set above is then overwritten. The final
writel(intr_status & intr_en, ...) still acknowledges RBU because RBUE
is enabled. The RX NAPI is not scheduled and the RX DMA stays
suspended.

The callers then see status == tx_hard_error in stmmac_dma_interrupt()
and stmmac_msi_intr_tx(), so only stmmac_tx_err() runs.

The XGMAC handler that the commit message refers to uses
ret |= tx_hard_error in dwxgmac2_dma_interrupt(), so handle_rx is kept
there.

TPS can occur together with RBU in the shared IRQ path, because
stmmac_dma_interrupt() passes DMA_DIR_RXTX. TPS is also never
acknowledged. DMA_CHAN_INTR_DEFAULT_MASK and
DMA_CHAN_INTR_DEFAULT_MASK_4_10 have no TPS enable bit, and the
writeback is masked with intr_en.

TX DMA can be stopped at runtime without a full DMA reset, for example
in stmmac_tx_err() and in stmmac_disable_tx_queue() during XSK pool
setup. If the hardware latches TPS regardless of its enable bit, every
later RBU on that channel would lose handle_rx.

FBE is in DMA_CHAN_STATUS_MSK_COMMON, so it can clobber handle_rx on
the per-channel RX MSI path too, although FBE is fatal anyway.

Switching TPS and FBE to |= would also mean the status ==
tx_hard_error checks in stmmac_dma_interrupt() and stmmac_msi_intr_tx()
have to become bit tests.

[Severity: Medium]
Does checking RBU only under AIS leave a gap in multi-MSI mode (INTM
mode 1, set in dwmac4_dma_init() when multi_msi_en is set)? AIS is
part of DMA_CHAN_STATUS_MSK_COMMON, so DMA_CHAN_STATUS_MSK_TX also
includes it. The per-channel TX vector reads and writes back the same
channel status register:

stmmac_msi_intr_tx()
  stmmac_napi_check(priv, chan, DMA_DIR_TX)
    dwmac4_dma_interrupt()
      writel(intr_status & intr_en, ...)

RBU is masked out on that path, but AIS is not. On 4.10+ cores,
DMA_CHAN_INTR_ENA_AIE_4_10 is BIT(14), the same bit as
DMA_CHAN_STATUS_AIS. The TX side can therefore write-1-clear AIS while
RBU stays set.

When stmmac_msi_intr_rx() runs next with DMA_DIR_RX, it would see RBU
with AIS clear and skip the new ret |= handle_rx. Its writeback still
clears RBU, because RBU is in DMA_CHAN_STATUS_MSK_RX and RBUE is
enabled. The RBU event is used up without scheduling the RX NAPI, so
RX stays suspended until something else schedules it.

TBU, RWT and ERI are already checked outside the AIS block. Would it
make sense to check RBU outside it as well? This depends on whether
AIS re-asserts while RBU stays set, which the driver code doesn't
show.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117042754.96177-1-david.wu%40rock-chips.com

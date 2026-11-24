Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553061;
	b=md67cB7EhgSrjBlQJGUtogqtv43FxDq5mf6aCygciYBRCMk55MGqDujCQ7sFx2gvBZTE
	 o6T1jxzAl9EgiFEOtVBst8BQKtKTC0x6W5TVCIwVPObx9wlwt4eEWOVBiewQmrU25gQ77
	 4qZR5rgLToaAehNdDqU8gI/gFfCZGc1FdiQZAfkP5+ZXTTxOSGBnenYQBDWTW5kAF+ys/
	 pHvgw93Nlvk2tka6jjV5O5ZM/t2jTKxSe+gkWXsFV2Njq4q419d/GE72InWD90tkJ26xZ
	 d+JYngAJlolQRtbqsMWJfqpUspQzSolRjOpDiChYyDJ5jJ1+FKVbtvxGoZ8UkZv5Rrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553061;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NOMDX+SrFCix11i50UBTLaofa2/mZWPlY7sj1KfLMfQ=;
	b=KlH/0gv/Q3tDSzlpd3GrTcE/0MotigVybGXcwVftAYkk/7ByqHMqOKRX5mVgqWIlOIzd
	 0yq1wHWgh4mwiFuXltalCXlt7i5Xhz4GRrV8IoYPIAjUl+7XR5euaAT+9ScsaGTjY3I7C
	 t7fSAHeAcb14v7LTYX0ndrPHX2Wh73AXgLI74RfaPGL0RIamPv7wgweDUeF+ZzuJ1RV92
	 risO3uWYxprYwmb/vWnue1jGdGMkZbnhNDjm2kbmNScHhkRzAfq4uZQgj9Cf7n/18M/fO
	 RcmJLCyyQtRevmLSEm1KiBoVjAZ6iXhuPZweo40dMjRkSHxaRVPfLlX3og7qcNtz+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HuAcZvjd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC08606A31E;
	Tue, 24 Nov 2026 20:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HuAcZvjd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008ED1F000C0;
	Tue, 24 Nov 2026 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553061;
	bh=NOMDX+SrFCix11i50UBTLaofa2/mZWPlY7sj1KfLMfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HuAcZvjdM0g0SAE/O6GBrkEaBODYvFrfmi5zQqTw54y7BXsYD5Y/wVrhLOaBRB97v
	 rihISntxI0Agecil4uLA4blcjQ7q57lK4ei7wRcNjv+gY3cLCuZk85U/r3P2HQVMgU
	 kHBHUfVP4qTIEubMq6RrLcDCzqR8nssGCgSPPuQ07iRayM2s09LEajjOxHLzaufxoh
	 ZXgvUoMR9aMOAQIziI741d5EtBZX42vXTusqHVMXxHKHe53AaNSczLot8s2K/WICKg
	 XZMqBNUYPmkmPQaw4Nstkwk3Vog/64/0U//R8p1ZYBitXshwYX12Ik8aZrKJ8iSBY4
	 t+Or9de3ipKVA==
Subject:
 Re: [PATCH net-next v1 1/2] mlxbf_gige: protect against MAC disable during TX
From: netdev-bot+sashiko@kernel.org
To: cbabroski@nvidia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davthompson@nvidia.com
Date: Tue, 24 Nov 2026 20:44:20 +0000
Message-ID: <179555306048.3135.18299984453276873378@kernel.org>
In-Reply-To: <7742d597c5321d5cb587180c1d29eccffa9d51bc.1795206150.git.cbabroski@nvidia.com>
References: <7742d597c5321d5cb587180c1d29eccffa9d51bc.1795206150.git.cbabroski@nvidia.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch resyncs only the consumer side (`priv->prev_tx_ci =
  tx_ci`, mlxbf_gige_tx.c:174) and leaves `priv->tx_pi` unchanged.
- [Medium] When the HW consumer index goes backwards (e.g.
  prev_tx_ci=500, tx_pi=510, CI reads 0), `(u16)(tx_ci - prev_tx_ci)`…
- [Medium] In the desync case the new loop bound lets the NAPI completion
  walk all `tx_q_entries` slots starting at prev_tx_ci.
- [Low] This commit fixes a NULL pointer dereference (oops in
  NAPI/softirq context) in mlxbf_gige_handle_tx_complete() that a…
- [Low] The comment above the TX completion loop in
  mlxbf_gige_handle_tx_complete() (lines 140-146) still says the logic…

--

mlxbf_gige: protect against MAC disable during TX

This patch limits the TX completion loop in mlxbf_gige_handle_tx_complete()
to tx_q_entries iterations and skips NULL tx_skb[] slots. After the loop it
sets prev_tx_ci to the HW consumer index. The goal is to fix a NULL pointer
dereference seen when firmware disables and resets the OOB MAC while TX is
in flight.

> Previously, mlxbf_gige_handle_tx_complete() would continue to loop
> around the TX queue, counting packets and freeing their memory, until
> the two indices were equal. If entries were already freed the first time
> through the queue, then a second attempt could cause a NULL pointer
> dereference.

[Severity: Low]
This fixes a NULL pointer dereference in NAPI context, so should it carry
a Fixes: tag? The unbounded loop and the unconditional
priv->tx_skb[tx_wqe_index]->len dereference both come from:

Fixes: f92e1869d74e ("Add Mellanox BlueField Gigabit Ethernet driver")

> diff --git a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c
> index 04982e888c635..73c3033591d59 100644
> --- a/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c
> +++ b/drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_tx.c

[ ... ]

> @@ -143,7 +144,8 @@ bool mlxbf_gige_handle_tx_complete(struct mlxbf_gige *priv)
>  	 * to be supported, that is TX consumer index wrapped from 0xFFFF
>  	 * to 0 while TX completion index is still < 0xFFFF.
>  	 */
> -	for (; priv->prev_tx_ci != tx_ci; priv->prev_tx_ci++) {
> +	for (entry = 0; priv->prev_tx_ci != tx_ci && entry < priv->tx_q_entries;
> +	     priv->prev_tx_ci++, entry++) {

[Severity: Medium]
When the indices are out of sync, can this loop run past tx_pi into slots
that mlxbf_gige_start_xmit() owns?

mlxbf_gige_handle_tx_complete() runs from mlxbf_gige_poll(), which
mlxbf_gige_rx_intr() can schedule. It holds neither priv->lock nor the
netdev TX lock.

Take prev_tx_ci = 1000, tx_pi = 1005 and a CI reset to 0. The loop visits
ring positions 1000 through 1127, and positions 1005 onward are free slots
that another CPU may be filling at the same time:

CPU1 mlxbf_gige_start_xmit()
    *tx_wqe_addr = tx_buf_dma;    /* outside priv->lock */
    ...
    spin_lock_irqsave(&priv->lock, flags);
    priv->tx_skb[priv->tx_pi % priv->tx_q_entries] = tx_skb;
    priv->tx_pi++;

CPU2 mlxbf_gige_handle_tx_complete()
    if (priv->tx_skb[tx_wqe_index]) {
        ...
        dma_unmap_single(priv->dev, *tx_wqe_addr, ...);
        dev_consume_skb_any(priv->tx_skb[tx_wqe_index]);

Could CPU2 free an skb that CPU1 has just queued?

The plain NULL check also doesn't order the *tx_wqe_addr load after the
tx_skb[] load. On the producer side, nothing orders the WQE store before
the tx_skb[] store. On arm64, could CPU2 see the new skb together with the
old, already unmapped DMA address? That would unmap a stale address a
second time and leak the new mapping.

Would bounding the walk by tx_pi - prev_tx_ci, sampled under priv->lock,
keep it out of producer-owned slots?

[Severity: Low]
This isn't a bug, but the comment above this loop still says the
completion logic "needs to loop until the completion index (in SW) equals
TX consumer index (from HW)". With the new tx_q_entries bound, the loop can
exit with prev_tx_ci != tx_ci. Should the comment be updated?

>  		tx_wqe_index = priv->prev_tx_ci % priv->tx_q_entries;
>  		/* Each TX WQE is 16 bytes. The 8 MSB store the 2KB TX
>  		 * buffer address and the 8 LSB contain information
> @@ -152,18 +154,25 @@ bool mlxbf_gige_handle_tx_complete(struct mlxbf_gige *priv)
>  		tx_wqe_addr = priv->tx_wqe_base +
>  			       (tx_wqe_index * MLXBF_GIGE_TX_WQE_SZ_QWORDS);
>  
> -		stats->tx_packets++;
> -		stats->tx_bytes += MLXBF_GIGE_TX_WQE_PKT_LEN(tx_wqe_addr);
> -
> -		dma_unmap_single(priv->dev, *tx_wqe_addr,
> -				 priv->tx_skb[tx_wqe_index]->len, DMA_TO_DEVICE);
> -		dev_consume_skb_any(priv->tx_skb[tx_wqe_index]);
> -		priv->tx_skb[tx_wqe_index] = NULL;
> +		if (priv->tx_skb[tx_wqe_index]) {
> +			stats->tx_packets++;
> +			stats->tx_bytes += MLXBF_GIGE_TX_WQE_PKT_LEN(tx_wqe_addr);
> +			dma_unmap_single(priv->dev, *tx_wqe_addr,
> +					 priv->tx_skb[tx_wqe_index]->len, DMA_TO_DEVICE);
> +			dev_consume_skb_any(priv->tx_skb[tx_wqe_index]);

[Severity: Medium]
Suppose the HW consumer index goes backwards, for example prev_tx_ci = 500,
tx_pi = 510 and CI reads 0. Then (u16)(tx_ci - prev_tx_ci) looks like
almost a full wrap, and this loop runs all tx_q_entries iterations.

Every non-NULL slot is unmapped, freed and counted in tx_packets/tx_bytes.
That includes the in-flight descriptors between prev_tx_ci and tx_pi,
which the hardware never completed.

The coherent WQE ring still holds the bus addresses of those freed
buffers. mlxbf_gige_start_xmit() also keeps writing a tx_pi that is far
ahead of the HW CI:

	writeq(priv->tx_pi, priv->base + MLXBF_GIGE_TX_PRODUCER_INDEX);

The only thing stopping the device from DMAing out of these buffers is the
commit message's statement that firmware has disabled the MAC. Nothing here
checks MAC or DMA enable state.

If TX DMA is still active when CI is seen going backwards, or if firmware
re-enables the MAC later, can the device read freed and possibly
reallocated pages?

Before this patch the kernel oopsed in this path, so those pages were not
reused while the system kept running.

> +			priv->tx_skb[tx_wqe_index] = NULL;
>  
> -		/* Ensure completion of updates across all cores */
> -		mb();
> +			/* Ensure completion of updates across all cores */
> +			mb();
> +		}
>  	}
>  
> +	/* At this point the completion index should be equal to the
> +	 * consumer index. If they aren't then the driver is out of sync
> +	 * from the HW's state and needs to be adjusted.
> +	 */
> +	priv->prev_tx_ci = tx_ci;

[Severity: Medium]
Only the consumer side is resynced here, and priv->tx_pi stays where it
was. mlxbf_gige_tx_buffs_avail() assumes prev_tx_ci trails tx_pi by less
than tx_q_entries. Does this break that assumption?

mlxbf_gige_tx_buffs_avail() computes:

	avail = ((priv->tx_q_entries + priv->prev_tx_ci - priv->tx_pi)
		  % priv->tx_q_entries) - 1;

The u16 operands are promoted to int. With tx_q_entries = 128, tx_pi = 1000
and the HW CI reset to 0, the numerator is negative. avail comes out as
-105 and is returned as the u16 value 65431. Once tx_pi - prev_tx_ci is
larger than tx_q_entries, avail can never be 0.

If the queue was stopped because the ring was full, the code right after
this resync wakes it:

	if (netif_queue_stopped(priv->netdev) &&
	    mlxbf_gige_tx_buffs_avail(priv))
		netif_wake_queue(priv->netdev);

After that, this check in mlxbf_gige_start_xmit() never fires again:

	if (!mlxbf_gige_tx_buffs_avail(priv)) {
		/* TX ring is full, inform stack */
		netif_stop_queue(netdev);

With the MAC disabled nothing completes, because every poll sees
prev_tx_ci == tx_ci. After tx_q_entries more packets,
mlxbf_gige_start_xmit() starts overwriting slots that still hold
DMA-mapped skbs:

	priv->tx_skb[priv->tx_pi % priv->tx_q_entries] = tx_skb;

Does each overwrite leak the old skb, its DMA mapping and its socket wmem
charge? In the example above that continues until tx_pi wraps the 16 bits,
roughly 64K packets. The driver has no ndo_tx_timeout and doesn't log the
desync, so nothing else stops it.

A related case: the walk is bounded by tx_q_entries, not by the posted
window tx_pi - prev_tx_ci. A CI reset that lands within tx_q_entries of
prev_tx_ci, for example prev_tx_ci = 65500, tx_pi = 65505 and CI = 0, is
handled as a normal completion and ends up in the same state.

Packets the disabled MAC never sent are also counted in tx_packets/tx_bytes
and released with dev_consume_skb_any(), rather than counted as drops.

The commit message says:

    TX is not recovered after a sudden MAC disable.

Should it also say that the driver keeps accepting packets and leaking them
in this state? Alternatively, should the queue be stopped once the desync
is detected?

>  	/* Since the TX ring was likely just drained, check if TX queue
>  	 * had previously been stopped and now that there are TX buffers
>  	 * available the TX queue can be awakened.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795206150.git.cbabroski%40nvidia.com

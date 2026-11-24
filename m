Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486252;
	b=ldWc7jNizfXps289XNNKNHquQvJPKaYnWmxaAvY6ADXMbTukwaR/N9RvbdX8Lq8O74y8
	 5udSlbN/kY/FtHS+82P1LkYWag/cWwGPF6HEHQeVcek83oE2XzNMPPVddk7Sero0K7Xhe
	 bzzTMoymBp7lEu/Ggh/PoE9FhRcUJcd75RxDNRt2p30d0EjtxCTqt8u7qKMB4GxIbYoWu
	 PM+P/+qCyWO+LFKUg15MvNLSoslYdaW8QaeWj2uVSSlAmMze+JlBMHwKse74u8KFkXDB2
	 F02+lEKwMgbR00OxPy2BVAV2uPhZIwFh4UXePNWdoHsGXttlCGAUiHtK/aQ6yhUHatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486252;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=q0h9ni7A5RKmJm8FNJQlgZpObVDobPInKxVYVgkJ24I=;
	b=y1kPMCuVSSXmsIdTqd14GL/cYtUQvaHtyhgoy4npOV/Pho9eDx1Wu6Rt1Ks0zNUN0KI+
	 a4j13Gx9NWSNVSEJ2NQJVfhHPcUnm2tSXUAY5kXJnY074bA48hKI15V14DfsWyCoaNSR3
	 Iu1mNwD+MsL/gIpFzRmgyp3+M/4iQzkEJhNuXYJjU2wHNKYw1kvk3VgWJff4gNLOPvs7F
	 trPRmCwIhm+LiCGM7p2SuJkLKr56EGfUsMb0BjOlS8/n4phWSaHAEs961L8LMXAA0410s
	 jXPWe54t+3jAlSian3trfe7+pGstD1tD1P5JUgv170PmzvE1G/7MG1eZgA/XRlLagdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niGXzJXs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866F606A32D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niGXzJXs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A541F000C4;
	Tue, 24 Nov 2026 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486252;
	bh=q0h9ni7A5RKmJm8FNJQlgZpObVDobPInKxVYVgkJ24I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=niGXzJXsbSy1xrnPrH+NS2XeLv6As75PcoXQytafE/nDsnOYB633yFiQxZD534FPD
	 p+ybT2RXuys9FCukyRB5iE+iWzT+ChFVWh413YERSeMgmHq/YCGr9cCjIRylcFV2+J
	 CB807z7E1aE4kPpHumCgnUKTRH8z0Fftdz+13ioAS5UAnX7PtYF2GBr55DwIVBQ/M7
	 rtdYQxZTAn3wirkd6i0pU7O879E6qcIwKULTBiNu7+E+rKNuvjfr/LbNTCR2/gDFxW
	 cDMnqIx6ZHDljo7cXR1xzX2pKpu0HIxcUj0s2Qkb7lGX3tIP0RsULw5IqKUeKsjmnw
	 YFq0UvZPs9dzA==
Subject: Re: [PATCH net-next v5 8/9] bnxt_en: Fix ring accounting/validation
 when rings are constrained by FW
From: netdev-bot+sashiko@kernel.org
To: michael.chan@broadcom.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 pavan.chebbi@broadcom.com, andrew.gospodarek@broadcom.com
Date: Tue, 24 Nov 2026 02:10:51 +0000
Message-ID: <179548625149.3135.12297193407408194867@kernel.org>
In-Reply-To: <20261120012921.2537903-9-michael.chan@broadcom.com>
References: <20261120012921.2537903-9-michael.chan@broadcom.com>
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

- [High] This patch adds a new way for bp->rx_nr_rings to shrink, but
  only the default RSS table is reconciled afterwards.
- [Low] __bnxt_reserve_rings() calls bnxt_adj_rings() after the firmware
  reservation has already been committed and copied into bp->hw_resc by…

--

bnxt_en: Fix ring accounting/validation when rings are constrained by FW

This patch renames bnxt_adj_tx_rings() to bnxt_adj_rings() and reworks it
to scale TX, RX and CP rings evenly across TCs and XDP. In shared/combined
mode it now also clamps RX to match TX. It tightens bnxt_rings_ok() and
the tx/cp conversion helpers, and changes __bnxt_reserve_rings() to
validate before committing ring counts and to bail out through a common
exit label.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index d76227d292824..565099088969e 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c

[ ... ]

> @@ -8178,49 +8205,67 @@ static int __bnxt_reserve_rings(struct bnxt *bp)
>  		hwr.stat -= bnxt_get_ulp_stat_ctxs(bp);
>  	hwr.cp = min_t(int, hwr.cp, hwr.stat);
>  	rc = bnxt_trim_rings(bp, &rx_rings, &hwr.tx, hwr.cp, sh);
> +	if (rc)
> +		goto reserve_rings_exit;
> +

[ ... ]

> +	if (!bnxt_rings_ok(bp, &hwr)) {
> +		rc = -ENOMEM;
> +		goto reserve_rings_exit;
>  	}
>  	bp->tx_nr_rings = hwr.tx;
> +	bp->rx_nr_rings = rx_rings;
> +	bp->cp_nr_rings = hwr.cp;
>
> +	if (!bp->bnapi)
> +		bnxt_adj_rings(bp);

[Severity: Low]
By this point, bnxt_hwrm_reserve_rings() has already committed the
reservation in FW, and bnxt_copy_reserved_rings() has recorded it in
bp->hw_resc. bnxt_adj_rings() can then lower the counts below what FW
granted:

    bp->tx_nr_rings = bp->tx_nr_rings_per_tc * tcs;

This drops the remainder of the division. In shared mode, rx_nr_rings is
also clamped to tx_nr_rings_per_tc, and cp_nr_rings is then recomputed
lower.

On the open path, __bnxt_open_nic()->bnxt_reserve_rings()->
__bnxt_reserve_rings(), does anything issue another FUNC_CFG to give the
surplus back? bnxt_set_dflt_rings() has a second pass for this:

    /* Rings may have been trimmed, re-reserve the trimmed rings. */
    if (bnxt_need_reserve_rings(bp)) {

The open path doesn't seem to have an equivalent step.

Would the extra TX/RX rings, ring groups, completion rings, stat contexts
and IRQs stay reserved in FW until something re-reserves later? In that
window, hw_resc->resv_* would not match bp->*_nr_rings either. Also,
bnxt_sriov.c works out VF resources from the driver counts, for example:

    vf_tx_rings = hw_resc->max_tx_rings - bp->tx_nr_rings;

The commit message says leftover rings are "intentionally left unused".
Here they also appear to stay reserved in FW, where VFs or other NPAR
functions cannot use them.

Before this patch, a TX grant not divisible by the TC count hit this
check in bnxt_reserve_rings() instead:

    if (tcs && (bp->tx_nr_rings_per_tc * tcs !=
                bp->tx_nr_rings - bp->tx_nr_rings_xdp)) {
            netdev_err(bp->dev, "tx ring reservation failure\n");

The last patch in the series doesn't add a re-reservation either.

[ ... ]

> @@ -13156,13 +13214,29 @@ static void bnxt_set_xdp_tx_rings(struct bnxt *bp)
>  	bp->tx_nr_rings += bp->tx_nr_rings_xdp;
>  }
>
> -static void bnxt_adj_tx_rings(struct bnxt *bp)
> +static void bnxt_adj_rings(struct bnxt *bp)
>  {
> -	/* Make adjustments if reserved TX rings are less than requested */
> -	bp->tx_nr_rings -= bp->tx_nr_rings_xdp;
> -	bp->tx_nr_rings_per_tc = bnxt_tx_nr_rings_per_tc(bp);
> -	if (bp->tx_nr_rings_xdp)
> -		bnxt_set_xdp_tx_rings(bp);
> +	int tcs = bp->num_tc ? bp->num_tc : 1;
> +	int rx = bp->rx_nr_rings;
> +
> +	/* Make adjustments to rings based on TC/XDP/shared rings policies */
> +	if (bp->tx_nr_rings_xdp) {
> +		tcs++;
> +		bp->tx_nr_rings_per_tc = bp->tx_nr_rings / tcs;
> +		bp->tx_nr_rings_xdp = bp->tx_nr_rings_per_tc;
> +	} else {
> +		bp->tx_nr_rings_per_tc = bnxt_tx_nr_rings_per_tc(bp);
> +	}
> +
> +	if (bp->flags & BNXT_FLAG_SHARED_RINGS) {
> +		bp->tx_nr_rings_per_tc = min(bp->tx_nr_rings_per_tc, rx);
> +		bp->rx_nr_rings = bp->tx_nr_rings_per_tc;
> +		if (bp->tx_nr_rings_xdp)
> +			bp->tx_nr_rings_xdp = bp->tx_nr_rings_per_tc;
> +	}

[Severity: High]
In shared rings mode, this clamp now lowers rx_nr_rings whenever FW
grants fewer TX rings, with or without XDP. bnxt_adj_tx_rings() never
changed rx_nr_rings.

After the shrink, __bnxt_reserve_rings() only reconciles the default
context, through bnxt_check_rss_tbl_lost() and
bnxt_set_dflt_rss_indir_tbl(bp, NULL). Can a user-created RSS context
still point at a ring index at or above the new rx_nr_rings?

Later in __bnxt_open_nic():

    if (BNXT_SUPPORTS_MULTI_RSS_CTX(bp))
        bnxt_hwrm_realloc_rss_ctx_vnic(bp);
    bnxt_cfg_usr_fltrs(bp);

bnxt_hwrm_realloc_rss_ctx_vnic()->bnxt_hwrm_vnic_set_rss_p5()->
bnxt_fill_hw_rss_tbl_p5() does:

    else if (vnic->flags & BNXT_VNIC_RSSCTX_FLAG)
        j = ethtool_rxfh_context_indir(vnic->rss_ctx)[i];
    ...
    rxr = &bp->rx_ring[j];

bp->rx_ring is allocated from the new, smaller rx_nr_rings. Would a stale
j read past the end of bp->rx_ring[]? bnxt_cp_ring_for_rx() would then
dereference rxr->rx_cpr from adjacent memory.

Something similar seems possible in bnxt_cfg_usr_fltrs(). On firmware
without BNXT_FW_CAP_CFA_RFS_RING_TBL_IDX_V2,
bnxt_hwrm_cfa_ntuple_filter_alloc() uses a possibly stale queue index:

    vnic = &bp->vnic_info[fltr->base.rxq + 1];

The commit message says the non-default RSS context and n-tuple problem
already exists and is deferred. The RX clamp driven by a TX shortage is
new in this patch, though. It makes the problem reachable in setups where
RX used to stay the same, for example an irq_re_init open after a
firmware reset or an XDP attach, where FW grants fewer TX rings than
requested.

The last patch in the series ("bnxt_en: Fix ring accounting/validation
when IRQs are constrained") also leaves this deferred.

> +
> +	bp->tx_nr_rings = bp->tx_nr_rings_per_tc * tcs;
> +	bnxt_set_cp_rings(bp, bp->flags & BNXT_FLAG_SHARED_RINGS);
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120012921.2537903-1-michael.chan%40broadcom.com

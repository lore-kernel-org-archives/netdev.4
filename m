Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486254;
	b=xEfLKjD5O6jIGQrAMVUjLjSwKGCrXnOxHLF11vx1e4Q3xKJeg5dmOhckzgwJw7kQVxT4
	 svnK+fCilw2tjTA8MVYMxmK6vGCNfYcS+rUevvb1fEmt3GGMs15b/UFg6jY6i5NsKdj/j
	 KAusmumgUdWFbjIZbhhzaScUwBIpO+p41/wLAOfNH+Fd69x+gTQzT4oGJEBS4rZiXSZof
	 Y6Tj5GsAcb1obigXiwmYaOsQCrhJL64SMGk8tkuEwSlN1AIT2IdtGNQcMGTmzbK4yof9e
	 PPbLddz2nJMuhnqhAhSor/3gYhpjANq0f2UMySO9u8laaMiMb9TwlnwQCq2ldOwsVnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486254;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zzkFsXAMLg2ZXH5I9vgGmKNg3ai2t3JC+OXzo6Kze5A=;
	b=c8/CAxSPcU+A8z7YreNRRIPqXRQ3U/lGgoVttepXABEhZ5KgykFuPgphxYAC4zV20X97
	 9OZL4YxLm7yEtezFzIzJ8YPR8hMunHm04K9DZLvsAskdAXL3AsPP8r6c0bBLHqVw7YG9r
	 S6X0rTt6hjbJTQqMicOSauPVh2jWZaeGYzCwjeHydlxzfqhTCwLG0k5fHTcAxAq1wYb4e
	 62S+2EDEcUfl/yFJqqpArNzMSZuS++Qd4qvBapi6xd/EmuBfBMR5np2KzIYjymckBaJqQ
	 gqXxhxWx+zQ5CiDZg44ixW/9ELno1ulf9cpnMWFFzV8IvRmPAqH2hI4nI7c1Yp7Hx7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="clLxe2/0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378A606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clLxe2/0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE6C1F000CF;
	Tue, 24 Nov 2026 02:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486254;
	bh=zzkFsXAMLg2ZXH5I9vgGmKNg3ai2t3JC+OXzo6Kze5A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=clLxe2/0iuV/H2B7S0nAdb620smqHPhlXg3rmjzyB8sFOlmAVxTBjafOtZJR6yJGb
	 UqTWQUANoiP+KnGJZdezyfAbiuabiN4dki5jBwx58in6REjBbpwX8KysYkEL+4QddF
	 vt2RYdNTgIfEdY2TIHDi4n9jEwSBWUvf7C6wxCHjVnG6phI9vSQ86Cb+vKXaAcKoQS
	 D1ungQj5LN25C1RveN+HBhhB7uneP3xBHnJ3LoDdC44NG+AsgMSPMxk4zyusNa3733
	 OJLM9GDInezKBqgPL0rXkhU846IX/Ks1UTMslYB1Bq7Y1dYkyqmIBHxvAGeFcOPqNa
	 o6S/CRBV6PuKg==
Subject: Re: [PATCH net-next v5 9/9] bnxt_en: Fix ring accounting/validation
 when IRQs are constrained
From: netdev-bot+sashiko@kernel.org
To: michael.chan@broadcom.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 pavan.chebbi@broadcom.com, andrew.gospodarek@broadcom.com
Date: Tue, 24 Nov 2026 02:10:53 +0000
Message-ID: <179548625307.3135.15544073389067818376@kernel.org>
In-Reply-To: <20261120012921.2537903-10-michael.chan@broadcom.com>
References: <20261120012921.2537903-10-michael.chan@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On dynamic MSI-X systems, this patch turns an MSI-X shortage
  into a silent RX ring shrink.
- [High] bnxt_en: missing ring trim in bnxt_reserve_rings() on static
  MSI-X causes OOB
- [High] bnxt_en: unreconciled FW reservation in bnxt_adj_rings_to_irqs()
  causes OOB

--

bnxt_en: Fix ring accounting/validation when IRQs are constrained

This patch adds bnxt_adj_rings_to_irqs() to trim the rings to the
available MSI-X vectors. The helper is used in bnxt_init_int_mode() and in
both dynamic MSI-X paths of bnxt_reserve_rings(). The scattered
bnxt_adj_rings() calls and the TC mismatch error path at the end of
bnxt_reserve_rings() are removed.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 565099088969e..8ec9576371cbf 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -11569,9 +11569,74 @@ static int bnxt_get_num_msix(struct bnxt *bp)
>  	return bnxt_nq_rings_in_use(bp);
>  }
>  
> +/* Adjust rings to fit bp->total_irqs */
> +static int bnxt_adj_rings_to_irqs(struct bnxt *bp)
> +{

[ ... ]

> +	if (req_rx_rings != bp->rx_nr_rings) {
> +		netdev_warn(bp->dev, "RX rings reduced from %d to %d\n",
> +			    req_rx_rings, bp->rx_nr_rings);
> +		bnxt_check_rss_tbl_lost(bp, req_rx_rings, bp->rx_nr_rings);
> +		if (!netif_is_rxfh_configured(bp->dev))
> +			bnxt_set_dflt_rss_indir_tbl(bp, NULL);
> +	}
> +	return 0;

[ ... ]

> @@ -11672,9 +11728,11 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
>  			irqs_required = bnxt_get_num_msix(bp);
>  			if (irqs_required > bp->total_irqs &&
>  			    bnxt_change_msix(bp, irqs_required) != irqs_required) {
> -				netdev_err(bp->dev, "Unable to allocate %d MSIX vectors, maximum available %d\n",
> -					   irqs_required, bp->total_irqs);
> -				return -ENOSPC;
> +				netdev_warn(bp->dev, "Able to allocate only %d MSIX vectors out of %d requested\n",
> +					    bp->total_irqs, irqs_required);
> +				rc = bnxt_adj_rings_to_irqs(bp);
> +				if (rc)
> +					return rc;
>  			}
>  		}
>  		return 0;

[Severity: High]
The early !bnxt_need_reserve_rings() branch only re-checks the vector
count when pci_msix_can_alloc_dyn() is true. What protects the static
MSI-X case, or a device without BNXT_NEW_RM?

Say FW reserved N rings at probe, but pci_alloc_irq_vectors() in
bnxt_init_int_mode() returned only M vectors. bnxt_adj_rings_to_irqs()
then trims rx_nr_rings, tx_nr_rings and cp_nr_rings to fit
M - ulp_msix. bp->irq_tbl is sized to M entries, while
bp->hw_resc.resv_* still records N.

If the admin then asks for N channels with ethtool -L,
bnxt_check_rings() passes because its MSI-X check is gated on
pci_msix_can_alloc_dyn(). bnxt_set_channels() puts the ring counts
back to N and reopens with irq_re_init == true. In
bnxt_reserve_rings(), bnxt_need_reserve_rings() compares N against
resv_* (also N) and returns false. The dynamic-only block is skipped,
so we return 0 with cp_nr_rings == N. The IRQs are not re-initialized
and bnxt_adj_rings_to_irqs() is not called:

__bnxt_open_nic()
  bnxt_reserve_rings()      <- returns 0, cp_nr_rings == N
  bnxt_alloc_mem()          <- N bnapi entries
  bnxt_request_irq()
    bnxt_setup_int_mode()
      bnxt_setup_msix()     <- loops i < bp->cp_nr_rings

bnxt_setup_msix() then writes bp->irq_tbl[map_idx].name and .handler
for map_idx values at and beyond M. That is a heap overflow past the
end of the irq_tbl allocation.

This patch makes bnxt_adj_rings_to_irqs() the central place where
rings are fitted to the vectors. Should the
!bnxt_need_reserve_rings() path also compare bnxt_get_num_msix()
against bp->total_irqs in the static case? It could then either
clear and redo bnxt_init_int_mode(), or reject the request with
-ENOSPC.

[ ... ]

> @@ -11700,23 +11758,12 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq_re_init)
>  		 */
>  		irqs_required = bnxt_get_num_msix(bp);
>  		if (bnxt_change_msix(bp, irqs_required) != irqs_required)
> -			rc = -ENOSPC;
> +			rc = bnxt_adj_rings_to_irqs(bp);
>  	}

[Severity: High]
bnxt_adj_rings_to_irqs() shrinks rx_nr_rings, tx_nr_rings and
cp_nr_rings after __bnxt_reserve_rings() has already committed the
larger counts to FW and to bp->hw_resc.resv_*. Nothing re-reserves
the smaller counts, so bnxt_need_reserve_rings() keeps returning
true afterwards. Is that intended?

This bites on the next reopen. Take a BNXT_NEW_RM device where the
RDMA aux driver is not registered yet. A soft reopen from
bnxt_change_mac_addr(), bnxt_set_ringparam(), bnxt_set_coalesce() or
the FW reset task goes through bnxt_reserve_rings(bp, false), which
calls __bnxt_reserve_rings() without touching the IRQs:

__bnxt_open_nic(bp, false, ...)
  bnxt_reserve_rings(bp, false)
    __bnxt_reserve_rings()
      bnxt_get_avail_msix()     <- max irqs - shrunk cp_nr_rings
      reserve_rings_exit:
        bnxt_set_ulp_msix_num() <- resv_irqs - shrunk cp_nr_rings
  bnxt_alloc_mem(bp, false)
    bnxt_alloc_all_cp_arrays()  <- ring->map_idx = ulp_msix + i

Both ulp_msix computations are made against the hardware limits and
the already shrunk cp_nr_rings, not against bp->total_irqs. If
ulp_msix had been capped by max irqs or resv_irqs before, it now
grows, while bp->total_irqs and bp->irq_tbl stay as they were. The
new ring->map_idx values then run past bp->total_irqs, and on static
MSI-X past bp->irq_tbl_size. bnxt_hwrm_ring_alloc(),
bnxt_disable_int_sync() and bnxt_free_irq() then index
bp->irq_tbl[] out of bounds.

With irq_re_init == true, for example the first ndo_open after a
probe time trim, the same inflated ulp_msix is subtracted from
bp->total_irqs in bnxt_adj_rings_to_irqs(). The Ethernet rings then
get trimmed a second time, or the open fails with -ENODEV from
bnxt_init_int_mode() or -ENOMEM from the minimum TX check.

Should bnxt_adj_rings_to_irqs() be followed by another
__bnxt_reserve_rings() so FW matches the trimmed counts? Or should
the ULP MSI-X count be clamped to bp->total_irqs - bp->cp_nr_rings
once the vectors have been allocated?

[Severity: High]
On systems with dynamic MSI-X, both of these bnxt_reserve_rings() branches
used to fail the open with -ENOSPC when bnxt_change_msix() could not grow
the vectors. Now they call bnxt_adj_rings_to_irqs(). That helper shrinks
bp->rx_nr_rings and returns 0, because bp->bnapi is still NULL at this
point in __bnxt_open_nic().

The helper only fixes up the default RSS table. Can the same open then
index past bp->rx_ring[] through a non-default RSS context?

__bnxt_open_nic()
  bnxt_reserve_rings()          <- rx_nr_rings shrinks here
  bnxt_alloc_mem()              <- bp->rx_ring sized from new rx_nr_rings
  ...
  bnxt_hwrm_realloc_rss_ctx_vnic()
    __bnxt_setup_vnic_p5()
      bnxt_fill_hw_rss_tbl_p5()

The RSS contexts survive close, because bnxt_clear_rss_ctxs() calls
bnxt_del_one_rss_ctx(bp, rss_ctx, false), which keeps the sw context.

Then bnxt_fill_hw_rss_tbl_p5() does:

	else if (vnic->flags & BNXT_VNIC_RSSCTX_FLAG)
		j = ethtool_rxfh_context_indir(vnic->rss_ctx)[i];
	...
	rxr = &bp->rx_ring[j];

	ring_id = rxr->rx_ring_struct.fw_ring_id;
	...
	ring_id = bnxt_cp_ring_for_rx(bp, rxr);

Nothing checks j against the new rx_nr_rings. bnxt_cp_ring_for_rx() then
dereferences rxr->rx_cpr, a pointer loaded from memory past the end of the
allocation. Garbage FW ring IDs can also be programmed into the RSS table.

User n-tuple filters seem to have the same problem in the same open. The
path is bnxt_cfg_usr_fltrs()->bnxt_cfg_one_usr_fltr()->
bnxt_hwrm_cfa_ntuple_filter_alloc(). Without
BNXT_FW_CAP_CFA_RFS_RING_TBL_IDX_V2, that function does:

	vnic = &bp->vnic_info[fltr->base.rxq + 1];

Here rxq can be stale, while bnxt_alloc_vnics() sized vnic_info from the
new rx_nr_rings.

Here is one example sequence:

- Shared rings with rx=8, and an RSS context that uses queue 7.
- An XDP program is attached. bnxt_xdp_set() runs bnxt_check_rings(),
  which only checks FW resources, and then does close/open.
- The XDP config needs about 16 vectors, but pci_msix_alloc_irq_at()
  stops at about 10.
- bnxt_trim_rings() and bnxt_adj_rings() then give
  tx_nr_rings_per_tc = 5 and rx_nr_rings = 5.

At that point every RSS entry that points at rings 5-7 is out of bounds.

The commit message says:

  Just like the previous patch, we have similar existing issues regarding
  RSS tables for non-default RSS contexts and user defined n-tuple filters
  when RX rings shrink due to MSI-X constraints.  The fixes for these are
  deferred to a separate patchset.

That holds for the static MSI-X trim in bnxt_init_int_mode(). With dynamic
MSI-X, though, these two paths returned -ENOSPC before this patch. This
change seems to make the out-of-bounds access newly reachable there.

Would it be safer to keep returning -ENOSPC from these two branches when
non-default RSS contexts or user filters exist, until the follow-up series
lands?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120012921.2537903-1-michael.chan%40broadcom.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458662;
	b=bXCFi6tO+rlJTewwCWep5QjJnNucDBzleEGCTdgC9UqnP5f3NhnePUoNmiheHpujFEGt
	 LmTYdWj9+Q3uuGFkSuVjlpb/bwqmJoUES6ehs1lP+jl1+OWoEJJ9ggPq8P/x5RYxlb+gs
	 Z3iEc6wWguBbBI5Lrbge852vKnBrDKCxxF2k5XhfETUkgXJ/P3KLTEqPOGEBM4OIQd6KL
	 zS/PNmoI8ThDZKZZh5AkGyYVaM9FNdMOZW7vluCDEKq7f+avWqS+ctlUmtCGyVa7Stl8u
	 qFEIAVUCtR519YSRK0gGHaEPr24Le2b3GjdqpWp4VCj41Yu99sedsdDDp2+mRU26VQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458662;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ETEGfFihnEn2lhPwIb93b0kcEjldUq3phERlT1DkHp8=;
	b=pGB2R0oTiG1fdVtdBzvgz7GQ2esaSVo7fiROkzyJlkGHq5ZMCkNVto/vitBY1oPqMgSR
	 KOeurlqSGZdZcq3W3muSglFOnrTZViMEyJjC2/tGLOsZGYQ9RJ5yUIZhw9Y2F+7qGMfNo
	 gOti4qWwI8GZkkCKX1rCv+d8AM0pyx41CQ+2Ax+JP7SYsQV8J4YHO2mv9cSQkXdaRLMB1
	 zc8petBmlSJpaps0fgtSwpWHsOwAgVW+D/18vNbXwIW+x73569vN+ySM5+iR2/oFueIjV
	 OWc43+xgoFFkPlKZVyFPeO+29Cds6o6CNkxE2wSAKlL+NQL3811mYsP+5nlql+1H/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFz3UQi2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90869606A335;
	Mon, 23 Nov 2026 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UFz3UQi2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FBF1F000D3;
	Mon, 23 Nov 2026 18:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458662;
	bh=ETEGfFihnEn2lhPwIb93b0kcEjldUq3phERlT1DkHp8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UFz3UQi2GhwdR73L7Ks8Lk0wQPQEqWHLNgMqvK+1VBgjyZ+QmhU3c2eCbchuSqYWn
	 RVFYw1vQN+a7iIJjQrkbSJ5ajO5D16wze05Qfo+piwhUXvWZ7MF16Z8Z0M2TotdkbX
	 zyDg0mevu/x6BSENz+mgczwYu4U6pQYKN7BrSN6EOVmMdF4XdhCzrHvCZHcR/D7OYF
	 TXQNH59vhCFvAVAsUPw+xTq4i/ONa2O6GtsW1dM1u5GnnMTm5tCNDS0y+0QPMxx2cM
	 Nk6wWjPvuiTFxxi6kT41G6bBjC7u6MP+FOzUBdBSE9jXLg1QYIoKq7OIb0pRYYfdJN
	 AIoxZDxrELBJA==
Subject: Re: [PATCH net v6 3/5] bnxt_en: stop DMA before releasing rings the
 firmware did not free
From: netdev-bot+sashiko@kernel.org
To: joe@dama.to
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 prashant@broadcom.com, edumazet@google.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 18:31:00 +0000
Message-ID: <179545866090.3135.4815761130655709444@kernel.org>
In-Reply-To: <20261120152830.699712-4-joe@dama.to>
References: <20261120152830.699712-4-joe@dama.to>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 5 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix leaves the per-queue restart paths uncovered.
- [High] bnxt_stop_dma() skips pci_clear_master() whenever
  BNXT_STATE_IN_FW_RESET or BNXT_STATE_FW_FATAL_COND is set.
- [Medium] bnxt_hwrm_ring_free() counts only TX, RX and AGG RING_FREE
  failures in 'stuck'.
- [Medium] bnxt_stop_dma() clears Bus Master Enable for the whole PCI
  function from ordinary L2 close paths, but the users that share the…
- [Medium] bnxt_hwrm_ring_free() marks a ring as stuck only when the
  helper returns exactly -EBUSY.
- [Medium] The patch presents driver rebind as the recovery ("The device
  stays unusable until the driver is rebound"), but rebind is not safe…
- [Medium] -EBUSY from hwrm_ring_free_send_msg() does not always mean the
  firmware never answered and may still own the ring.

--

bnxt_en: stop DMA before releasing rings the firmware did not free

This patch makes bnxt_hwrm_ring_free() count the TX, RX and AGG rings whose
HWRM_RING_FREE returned -EBUSY, and report an error to its callers. In that
case __bnxt_close_nic(), bnxt_half_close_nic() and the bnxt_init_chip()
error path call the new bnxt_stop_dma(). It clears bus mastering unless a
firmware reset or a fatal firmware error is in progress.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index c3413354e7582..600a8c866f3c3 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -7774,21 +7774,31 @@ static void bnxt_clear_one_cp_ring(struct bnxt *bp, struct bnxt_cp_ring_info *cp
>  			memset(cpr->cp_desc_ring[i], 0, size);
>  }
>  
> -static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
> +static int bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
>  {
> +	int stuck = 0;
>  	u32 type;
>  	int i;
>  
>  	if (!bp->bnapi)
> -		return;
> +		return 0;
>  
> +	/* -EBUSY means the firmware never answered, so it may still own
> +	 * the ring.
> +	 */

[Severity: Medium]
Does -EBUSY always mean the firmware never answered?

__hwrm_send() starts with rc = -EBUSY. It returns that value when
hwrm_wait_must_abort() finds the firmware health register in a not-healthy
state, for example while the firmware is resetting:

drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c:hwrm_wait_must_abort() {
    ...
	*fw_status = bnxt_fw_health_readl(bp, BNXT_FW_HEALTH_REG);
	return *fw_status && !BNXT_FW_IS_HEALTHY(*fw_status);
}

bnxt_stop_dma() only checks the driver bits BNXT_STATE_IN_FW_RESET and
BNXT_STATE_FW_FATAL_COND. During __bnxt_close_nic() those bits can lag
behind the hardware:

- BNXT_STATE_OPEN is already cleared, so bnxt_sp_task() and
  bnxt_fw_reset() return early and never set IN_FW_RESET.
- A non-fatal RESET_NOTIFY only sets FW_NON_FATAL_COND.

Say a firmware reset overlaps an ifdown, started either by another
function or by devlink fw_activate. The aborted RING_FREEs are counted as
stuck and bus mastering is cleared. Later in the series this also sets
BNXT_STATE_DMA_STOPPED, which is never cleared.

The chip reset would have discarded the ring state anyway. Normally the
next open recovers through the hot reset handling in
bnxt_hwrm_if_change(), but bnxt_check_dma_stopped() now refuses that open,
and HWRMs fail fast.

Can this turn a recoverable firmware reset into an outage that needs a
rebind?

>  	for (i = 0; i < bp->tx_nr_rings; i++)
> -		bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i], close_path);
> +		if (bnxt_hwrm_tx_ring_free(bp, &bp->tx_ring[i],
> +					   close_path) == -EBUSY)
> +			stuck++;

[Severity: Medium]
Should this check be limited to -EBUSY? Other errors from
hwrm_ring_free_send_msg() can also leave the ring live in the firmware.

hwrm_ring_free_send_msg() passes rc from hwrm_req_init() and
hwrm_req_send() through unchanged. __hwrm_req_init() returns -ENOMEM when
dma_pool_alloc() fails. __hwrm_send() returns -ENOMEM when
__hwrm_acquire_token() fails:

drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c:__hwrm_send() {
    ...
	token = __hwrm_acquire_token(bp, dst);
	if (!token) {
		rc = -ENOMEM;
		goto exit;
	}
    ...
}

Both of these fail before the request reaches the firmware, so the ring is
certainly still active. A firmware error reply is either mapped through
__hwrm_to_stderr() or returned as -EIO when error_code is non-zero. That
can also mean the ring was not freed.

In each of these cases the helper still clears fw_ring_id and stuck stays
at zero. bnxt_stop_dma() is skipped, and __bnxt_close_nic(),
bnxt_half_close_nic() or bnxt_init_chip() go on to bnxt_free_skbs() and
bnxt_free_mem() with bus mastering still enabled.

Would it be safer to count any non-zero return here, and in the RX and AGG
checks below?

>  
>  	bnxt_cancel_dim(bp);
>  	for (i = 0; i < bp->rx_nr_rings; i++) {
> -		bnxt_hwrm_rx_ring_free(bp, &bp->rx_ring[i], close_path);
> -		bnxt_hwrm_rx_agg_ring_free(bp, &bp->rx_ring[i], close_path);
> +		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
> +
> +		if (bnxt_hwrm_rx_ring_free(bp, rxr, close_path) == -EBUSY)
> +			stuck++;
> +		if (bnxt_hwrm_rx_agg_ring_free(bp, rxr, close_path) == -EBUSY)
> +			stuck++;
>  	}

[Severity: High]
The per-queue restart paths call the same helpers but still ignore what
they return. Can they free memory the firmware is still using?

bnxt_queue_stop() is reached through netdev_rx_queue_restart(), for
example when devmem or io_uring zero-copy RX is bound, or when a queue is
reconfigured:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_queue_stop() {
    ...
	cancel_work_sync(&cpr->dim.work);
	bnxt_hwrm_rx_ring_free(bp, rxr, false);
	bnxt_hwrm_rx_agg_ring_free(bp, rxr, false);
    ...
	memcpy(qmem, rxr, sizeof(*rxr));
	bnxt_init_rx_ring_struct(bp, qmem);

	return 0;
}

The core then calls bnxt_queue_mem_free() on that qmem. It runs
bnxt_free_one_rx_ring_skbs(), page_pool_destroy() and bnxt_free_ring() on
the RX and AGG descriptor rings without stopping DMA first.

In TPH mode, bnxt_tx_queue_stop() does the same for TX:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_tx_queue_stop() {
    ...
		bnxt_hwrm_tx_ring_free(bp, txr, true);
		bnxt_hwrm_cp_ring_free(bp, txr->tx_cpr);
		bnxt_free_one_tx_ring_skbs(bp, txr, txr->txq_index);
		bnxt_clear_one_cp_ring(bp, txr->tx_cpr);
    ...
}

The previous commit in this series ("bnxt_en: return the RING_FREE status
to callers") made these helpers return -EBUSY so callers can detect a
missing response. Only bnxt_hwrm_ring_free() checks it. Through the end of
the series ("bnxt_en: stop the ULP around the reset task"), both of these
call sites still ignore the result.

Would a RING_FREE timeout during a queue restart still produce the
IO_PAGE_FAULTs from the commit message under an IOMMU, or silent memory
corruption without one?

[ ... ]

> @@ -7818,6 +7828,26 @@ static void bnxt_hwrm_ring_free(struct bnxt *bp, bool close_path)
>  			bp->grp_info[i].cp_fw_ring_id = INVALID_HW_RING_ID;
>  		}
>  	}
> +
> +	if (!stuck)
> +		return 0;

[Severity: Medium]
Only TX, RX and AGG failures are counted in stuck. What happens if one of
the other teardown commands times out?

Three other teardown commands ignore their results and invalidate the
firmware IDs anyway:

- the completion ring frees through bnxt_hwrm_cp_ring_free(), which
  returns void
- the NQ/L2_CMPL free in the bnapi loop above
- bnxt_hwrm_stat_ctx_free():

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_hwrm_stat_ctx_free() {
    ...
			hwrm_req_send(bp, req);

			cpr->hw_stats_ctx_id = INVALID_STATS_CTX_ID;
    ...
}

On the close path, the TX/RX/AGG responses come back on the completion
ring. The CP/NQ/STAT_CTX frees use the default response channel, so they
can fail independently.

If only those later commands time out, stuck is zero and
bnxt_hwrm_resource_free() returns 0. __bnxt_close_nic()->bnxt_free_mem()
then frees:

- the completion and NQ descriptor pages, through bnxt_free_cp_rings()
  and bnxt_free_all_cp_arrays()
- with irq_re_init, the hw_stats buffers, through bnxt_free_ring_stats()

The firmware keeps DMAing stats into those buffers until STAT_CTX_FREE
succeeds.

The commit message limits the scope to TX, RX and AGG rings. Should these
failures also lead to bnxt_stop_dma()?

> +
> +	netdev_err(bp->dev, "Firmware did not free %d ring(s)\n", stuck);
> +	return -EIO;
> +}
> +
> +static void bnxt_stop_dma(struct bnxt *bp)
> +{
> +	/* A firmware reset resets the device, and the fatal error path
> +	 * already disables it.
> +	 */
> +	if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state) ||
> +	    test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
> +		return;

[Severity: High]
Does either of these bits guarantee that DMA has stopped before
__bnxt_close_nic() frees memory?

For a non-fatal firmware reset, bnxt_fw_reset() and bnxt_force_fw_reset()
set IN_FW_RESET and call bnxt_fw_reset_close():

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_fw_reset_close() {
    ...
	__bnxt_close_nic(bp, true, false);
	bnxt_vf_reps_free(bp);
	bnxt_clear_int_mode(bp);
	bnxt_hwrm_func_drv_unrgtr(bp);
	if (pci_is_enabled(bp->pdev))
		pci_disable_device(bp->pdev);
    ...
}

In the non-fatal case, __bnxt_close_nic() runs while the firmware is still
reachable (BNXT_NO_FW_ACCESS does not include IN_FW_RESET) and bus
mastering is still on. pci_disable_device() only comes after
bnxt_hwrm_func_drv_unrgtr(), which can itself wait out the HWRM timeout.
The chip reset comes later still, from the reset task.

A RING_FREE that returns -EBUSY in this window is counted as stuck. This
early return then lets bnxt_free_skbs() and bnxt_free_mem() release the
rings and RX buffers while the device can still DMA.

For FW_FATAL_COND: NAPI is still enabled while the TX/RX/AGG RING_FREEs
are sent. bnxt_async_event_process() can set the bit at any time on a
fatal RESET_NOTIFY. __hwrm_send() then aborts the in-flight RING_FREE:

drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c:__hwrm_send() {
    ...
			if (test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
				goto exit;
    ...
}

rc is still -EBUSY at that point, so stuck is incremented and this
function returns early.

bnxt_fw_fatal_close(), which disables bus mastering, never runs.
bnxt_sp_task(), bnxt_fw_reset() and bnxt_force_fw_reset() all return early
once BNXT_STATE_OPEN is cleared, and __bnxt_close_nic() clears it first.

The comment in bnxt_fw_reset_close() says the fatal case needs bus master
disabled "to prevent any potential bad DMAs before freeing kernel memory".
Does this early return leave that window open in both cases?

> +
> +	netdev_err(bp->dev,
> +		   "Disabling DMA before releasing ring memory, the driver must be rebound to recover\n");

[Severity: Medium]
Is a rebind safe with the state this leaves behind?

bnxt_stop_dma() only clears bus mastering. The function is not reset, and
the firmware is not told to drop the rings it never freed.
bnxt_free_mem() then frees the descriptor rings and buffers that those
ring contexts still point at.

Unbind does not reset the function either. Once BNXT_STATE_DMA_STOPPED is
added later in the series, BNXT_NO_FW_ACCESS makes
bnxt_hwrm_func_drv_unrgtr() fail fast in bnxt_remove_one().
bnxt_free_ctx_mem() also frees the P5+ context backing store.

On rebind, bnxt_init_board() calls pci_set_master() before
bnxt_fw_init_one_p1() sends HWRM_VER_GET and then HWRM_FUNC_RESET:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_fw_init_one_p1() {
    ...
	rc = bnxt_hwrm_func_reset(bp);
	if (rc)
		return -ENODEV;
    ...
}

If the stale rings are still active, can the device resume DMA in that
window, using descriptor and context addresses that now point at freed or
reused memory?

> +	pci_clear_master(bp->pdev);

[Severity: Medium]
This clears bus mastering for the whole PCI function, which is shared with
the bnxt_re RDMA auxiliary device. Should the ULP be stopped first?

At this commit no state bit is recorded either, so later open and HWRM
paths keep waiting for DMA'd responses that can never arrive.

Later patches in the series fix part of this:

- "bnxt_en: refuse to open a device with stopped DMA" adds
  BNXT_STATE_DMA_STOPPED, gates bnxt_open(), bnxt_open_nic() and
  bnxt_half_open_nic() on it, and adds the bit to BNXT_NO_FW_ACCESS so
  HWRMs fail fast.
- "bnxt_en: stop the ULP around the reset task" stops the ULP, but only
  in bnxt_reset().

At the end of the series, these paths can still reach bnxt_stop_dma()
without bnxt_ulp_stop():

  bnxt_close()->bnxt_close_nic()->__bnxt_close_nic()
  bnxt_self_test()->bnxt_half_close_nic(), followed directly by
    bnxt_open_nic()
  bnxt_close_nic() from the channels/rings/MTU/XDP reconfiguration paths
  the bnxt_init_chip() err_out unwind

In those cases bnxt_re stays bound with live QPs/CQs and RCFW CMDQ/CREQ
rings in host memory, and its DMA stops without any notification. The
other paths that disable the device (bnxt_fw_reset(),
bnxt_fw_exception(), AER, suspend) notify the ULP first.

Separately, the log message says the driver must be rebound to recover.
However, bnxt_resume() and the ENABLE_DEV state of bnxt_fw_reset_task()
both call pci_set_master() again, without a rebind and without resetting
the stale ring state:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_fw_reset_task() {
    ...
		pci_set_master(bp->pdev);
		bp->fw_reset_state = BNXT_FW_RESET_STATE_POLL_FW;
    ...
}

Is re-enabling bus mastering on those paths intended?

>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120152830.699712-1-joe%40dama.to

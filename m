Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458666;
	b=R+AfWTYwx0+szuLLdyK8gkXAZIGY3vUy50uvIEfnkOrKkmvgjfL8Yaa5S+xdlvyEHDfw
	 WHmqt3m8vUerK+1XJXKPn6zu7xCyCNcvrWwMQfHIpJsU436rfqzPy9iPlkTrr1R3Sigwi
	 ASlRd6An+A9WfJni0TykHahmtQJELS6fQQpl1dFMHWCqqdyQXYM0UQgxaTCCJvd9LStro
	 DAFkMIOg0LrMWo0v7m9Cp4vqlBsfcCTtPzGSiE4z7Ybq6tYsqGcruVAfpEbIANpCXaz6p
	 3np4HHEgW4NjJpJ9u7yXsaUWHpW+G/UsmB/6GgvSKqXSqLIf+FtmEkJjbEwlrPyqDJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458666;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZJJY/4x7LdcGLWlVYazHFM0XimiPBxvWvbQ7TZQCydE=;
	b=mCdRZ58803hwUWlkMbwGsqI0MWCXeja171hrZAsWzcxRrH4plhw4h6whIEkq8aHL3Huy
	 yTu/AIFiz0ABxfv636bsRQSPbONmZuzOA/170ZZznBiNRAmyKfNX5GwTvHmVQWDq+iyJ8
	 sXHf6t6Pd8xTtaTIV5xmiNPvCk2ijvYO9GQlxomCYrf9Wdhm+qt2V28veHxHKeYVRtnXZ
	 hECHCHo3n3YpJKR935iEJfvXtYMCjSWwZszVDUS2kHkaWQR248jwuN8Lhu5lj/k5tgq5k
	 xsZNL8xlc4NUatS5TSOC6Rd9FNtIRqpfBcweYliuo1d+4ozY9hdxX3PETo4AIQAJYUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N1aUlaaR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F7606A693;
	Mon, 23 Nov 2026 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N1aUlaaR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997681F000D8;
	Mon, 23 Nov 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458665;
	bh=ZJJY/4x7LdcGLWlVYazHFM0XimiPBxvWvbQ7TZQCydE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N1aUlaaRkkBkVIjwTFoTEfc/t1ItFLE1VRhANjaQ3kZTxwmcpk7a/tqStohqqe6kV
	 rbzxrfsk4zG31N+8m0wPGyAS4d1L9AhSPzr6j49POI7JVHGui3K1ZetTms2/DK5RmS
	 1o4yg5w9YupMVRKCS3SKKjGzmnB/7sNGIAKS35gjGAtRp33cmwO9gr2w7X3NZQKwUH
	 Y/ocZWyutpaRhdkYxbA4WVlbw5sHM8vLi02ADwIq64V/J3y+dK2cDvEZrIB6qv45pE
	 FaVhJ7vgHPY3R9LrirHoEl/s/NP0Uy7yzBEgfFSgJT5qi7iUSs9SB0Mt9aOCvo60ys
	 qI0fKl/JrWyUQ==
Subject: Re: [PATCH net v6 5/5] bnxt_en: stop the ULP around the reset task
From: netdev-bot+sashiko@kernel.org
To: joe@dama.to
Cc: netdev@vger.kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 prashant@broadcom.com, edumazet@google.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 18:31:04 +0000
Message-ID: <179545866419.3135.14423996277439097165@kernel.org>
In-Reply-To: <20261120152830.699712-6-joe@dama.to>
References: <20261120152830.699712-6-joe@dama.to>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 3 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Possible deadlock.
- [High] bnxt_reset() decides to call bnxt_ulp_start() only from !silent
  && !BNXT_STATE_DMA_STOPPED, after dropping its locks.
- [High] Incomplete fix.
- [Medium] bnxt_reset_task() discards the return value of
  bnxt_open_nic(), and bnxt_reset() calls bnxt_ulp_start() whenever…
- [Medium] The new DMA_STOPPED check exists only at the bnxt_reset() call
  site.
- [Medium] Every non-silent reset now unregisters and re-registers the
  RoCE IB device, including the common case where DMA is never stopped,…

--

bnxt_en: stop the ULP around the reset task

For non-silent resets, bnxt_reset() now calls bnxt_ulp_stop() before it
takes rtnl and the netdev lock. Afterwards it calls bnxt_ulp_start() unless
BNXT_STATE_DMA_STOPPED was set. The goal is to keep the RDMA driver off the
device once the reset task has stopped DMA.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index 9daf053293a42..2abb721d87de8 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -14710,10 +14710,14 @@ static void bnxt_tph_update(struct bnxt *bp)
>  /* Only called from bnxt_sp_task() */
>  static void bnxt_reset(struct bnxt *bp, bool silent)
>  {
> +	if (!silent)
> +		bnxt_ulp_stop(bp);
>  	bnxt_rtnl_lock_sp(bp);

[Severity: High]
Can this deadlock against bnxt_close()?

bnxt_sp_task() sets BNXT_STATE_IN_SP_TASK before it calls bnxt_reset().
bnxt_rtnl_lock_sp() clears that bit only after bnxt_ulp_stop() has
returned, and bnxt_rtnl_unlock_sp() sets it again before bnxt_ulp_start()
runs. So both new ULP calls run with IN_SP_TASK set.

Both ULP callbacks take rtnl_lock():

bnxt_ulp_stop()
  bnxt_re_suspend()
    bnxt_re_update_en_info_rdev()
      rtnl_lock()

bnxt_ulp_start()
  bnxt_re_resume()
    bnxt_re_add_device()
      bnxt_re_update_en_info_rdev()
        rtnl_lock()
      bnxt_re_ib_init()->ib_register_device()->...->enum_all_gids_of_dev_cb()
        rtnl_lock()

ndo_stop, meanwhile, holds rtnl and the netdev instance lock and waits for
IN_SP_TASK to clear, with no timeout:

__bnxt_close_nic() {
	clear_bit(BNXT_STATE_OPEN, &bp->state);
	smp_mb__after_atomic();
	while (bnxt_drv_busy(bp))
		msleep(20);
	...
}

Suppose "ip link set dev X down" runs just after a TX timeout has scheduled
BNXT_RESET_TASK_SP_EVENT. sp_task can block on rtnl inside bnxt_ulp_stop()
(or bnxt_ulp_start()), while bnxt_close() spins on bnxt_drv_busy() holding
rtnl. The comment above bnxt_lock_sp() warns about this exact case.

Before this patch, only the rare RESTART_ULP and firmware reset events
called into the ULP with IN_SP_TASK set. The frequent reset path did not.

Should the ULP calls happen only while IN_SP_TASK is clear?

[Severity: Medium]
Does this tear down every RDMA resource on each TX timeout or ring error?

bnxt_reset(bp, false) handles every BNXT_RESET_TASK_SP_EVENT. That event
comes from bnxt_tx_timeout(), from bnxt_sched_reset_txr(), and from
bnxt_sched_reset_rxr() for RX ring errors on P5+ chips. bnxt_ulp_stop() now
runs unconditionally, even when BNXT_STATE_OPEN or netif_running() is false
and bnxt_reset_task() does nothing.

For bnxt_re this is not a lightweight pause:

bnxt_ulp_stop()
  bnxt_re_suspend()
    bnxt_re_remove_device(rdev, BNXT_RE_PRE_RECOVERY_REMOVE, adev)
      ib_unregister_device()

That destroys all QPs, CQs, MRs and PDs owned by RDMA applications.
bnxt_ulp_start() then registers a new IB device.

Before this patch, an L2 close/open in the reset task left RoCE alone.
bnxt_hwrm_resource_free() only frees L2 rings, VNICs and stat contexts, and
the RoCE MSI-X vectors are handed over through bnxt_ulp_irq_stop() and
bnxt_ulp_irq_restart().

The commit message compares this to bnxt_fw_reset(), but a firmware reset
resets the whole device.

Would it be enough to stop the ULP after bnxt_rtnl_unlock_sp(), and only
when DMA_STOPPED was actually set? If the current behaviour stays, could the
commit message mention this cost?

[Severity: High]
The commit message says:

  The reset task can now stop DMA when the firmware does not free the
  rings, but the RDMA driver is not told and keeps using the device.

Does this patch cover all the places where that can happen?

bnxt_stop_dma() sets BNXT_STATE_DMA_STOPPED and calls pci_clear_master()
for the whole function. __bnxt_close_nic() calls it whenever
bnxt_shutdown_nic() fails, whatever the value of irq_re_init:

	if (bnxt_shutdown_nic(bp, irq_re_init))
		bnxt_stop_dma(bp);

bnxt_half_close_nic() and the bnxt_init_chip() error unwind call it too.

Two reset-task paths are still not covered:

- The silent VF_CFG_CHANGE reset, bnxt_reset(bp, true). It runs on VFs,
  where bnxt_re also runs.
- The bnxt_rx_ring_reset() fallback on pre-P5 chips. It calls
  bnxt_reset_task(bp, true) directly, and the commit message does not
  mention it:

bnxt_rx_ring_reset()
  bnxt_reset_task(bp, true)
    bnxt_close_nic(bp, false, false)
      __bnxt_close_nic()
        bnxt_shutdown_nic() fails
          bnxt_stop_dma()

Several other paths share the same close code: ndo_stop, ethtool channel
and ring changes, the offline self-test via bnxt_half_close_nic(),
MTU/feature reinit, XDP attach and DCB. In all of them, RoCE stays
registered with live QPs, CQs and NQs after bus mastering is cleared.

Would it make more sense to notify the ULP wherever DMA_STOPPED is set
(outside rtnl), instead of at this one caller?

>  	if (test_bit(BNXT_STATE_OPEN, &bp->state))
>  		bnxt_reset_task(bp, silent);
>  	bnxt_rtnl_unlock_sp(bp);
> +	if (!silent && !test_bit(BNXT_STATE_DMA_STOPPED, &bp->state))
> +		bnxt_ulp_start(bp);

[Severity: High]
Is it safe to restart the ULP based only on DMA_STOPPED?

bnxt_rtnl_lock_sp() clears IN_SP_TASK before taking rtnl, so other recovery
paths can run while bnxt_reset() waits. The new condition does not check:

- whether bnxt_reset_task() actually ran
- whether IN_FW_RESET or FW_FATAL_COND is set
- whether the PCI channel is offline, meaning another path now owns the
  stopped ULP

BNXT_EN_FLAG_ULP_STOPPED is a single flag. A second bnxt_ulp_stop() does
nothing, and the first bnxt_ulp_start() wins.

Case 1: devlink health recover runs while bnxt_reset() waits on rtnl.

__bnxt_fw_recover()
  bnxt_fw_reset()
    set_bit(BNXT_STATE_IN_FW_RESET)
    bnxt_fw_reset_close()
      __bnxt_close_nic()      <- clears OPEN
      bnxt_clear_int_mode()   <- bp->irq_tbl = NULL
      pci_disable_device()

bnxt_reset() then gets the lock and skips the reset because OPEN is clear.
It sees DMA_STOPPED clear and calls bnxt_ulp_start(). The RoCE edev is
still registered, with ULP_STOPPED set and msix_requested non-zero, so:

bnxt_ulp_start()
  bnxt_fill_msix_vecs()
    ent[i].vector = bp->irq_tbl[i].vector;

Can that dereference a NULL bp->irq_tbl?

Case 2: PCI AER.

bnxt_io_error_detected() calls bnxt_ulp_stop(), which does nothing if
bnxt_reset() already stopped the ULP. It then sets IN_FW_RESET, closes the
NIC and disables the device. bnxt_stop_dma() returns early in that state:

	if (test_bit(BNXT_STATE_IN_FW_RESET, &bp->state) ||
	    test_bit(BNXT_STATE_FW_FATAL_COND, &bp->state))
		return;

So DMA_STOPPED stays clear, and bnxt_reset() resumes RDMA in the middle of
PCI error recovery.

With no firmware access, bnxt_re_dev_init() fails. bnxt_re_add_device()
then frees rdev while en_info->rdev still points to it, and
bnxt_re_resume() reads it in ibdev_info().

Later, bnxt_io_resume()->bnxt_ulp_start() finds ULP_STOPPED clear and does
nothing, so RDMA never comes back.

Case 3: bnxt_fw_reset() has entered POLL_VF, so OPEN is still set and
IN_FW_RESET is set.

A TX timeout now makes bnxt_reset() run bnxt_reset_task() and then
bnxt_ulp_start(). RDMA keeps running through the following
bnxt_fw_reset_close() and the firmware reset. bnxt_fw_reset_task()'s own
bnxt_ulp_start() later does nothing.

[Severity: Medium]
Should the restart also depend on bnxt_open_nic() succeeding?
bnxt_reset_task() discards its return value:

	bnxt_close_nic(bp, !silent, false);
	bnxt_open_nic(bp, !silent, false);

Other stop/start pairs restart only on success. For example,
bnxt_fw_reset_task() does:

ulp_start:
	if (!rc)
		bnxt_ulp_start(bp);

bnxt_resume(), bnxt_io_resume() and devlink reload_up follow the same
pattern.

One failure path can leave bp->irq_tbl NULL. bnxt_reserve_rings(bp, true),
reached from bnxt_open_nic()->__bnxt_open_nic(), calls
bnxt_clear_int_mode() when all of these hold:

- BNXT_NEW_RM
- irqs_required != bp->total_irqs
- !pci_msix_can_alloc_dyn()

If __bnxt_reserve_rings() or bnxt_init_int_mode() then fails, irq_tbl stays
NULL, and bnxt_ulp_start()->bnxt_fill_msix_vecs() dereferences it.

It isn't clear that this combination happens in a routine reset, because
bnxt_need_reserve_rings() is normally false when the configuration has not
changed. Other open failures would still resume RDMA on a device whose L2
bring-up failed.

[Severity: Medium]
The DMA_STOPPED check exists only at this call site. bnxt_ulp_start() in
bnxt_ulp.c resumes any registered edev that has BNXT_EN_FLAG_ULP_STOPPED
set:

	if (i == BNXT_AUXDEV_FWCTL || !bnxt_ulp_registered(edev) ||
	    !(edev->flags & BNXT_EN_FLAG_ULP_STOPPED)) {
		goto clear_flag_continue;
	}

Once bnxt_reset() has left the ULP parked after DMA was stopped, can
another caller resume it?

bnxt_dl_reload_down() for DRIVER_REINIT is one example. Its
bnxt_ulp_stop() does nothing here, and its early error returns call
bnxt_ulp_start() unconditionally:

	if (bnxt_sriov_cfg(bp)) {
		...
		netdev_unlock(bp->dev);
		rtnl_unlock();
		bnxt_ulp_start(bp);
		return -EOPNOTSUPP;

bnxt_ulp_restart() also does a bare stop and start.

Either way, bnxt_re_resume() runs on a function with bus mastering cleared
and no firmware access. bnxt_re_dev_init() then fails, which can leave
en_info->rdev pointing at a freed rdev.

Would moving the DMA_STOPPED check into bnxt_ulp_start() keep every caller
consistent?

>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120152830.699712-1-joe%40dama.to

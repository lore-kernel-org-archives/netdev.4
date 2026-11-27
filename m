Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809012;
	b=LtJOiCVT09P0yiTIdKQaz3mz4X7Gv04lCfwZ5WXBbSoJElhP46EVQJeCNMOwXtLvoL5b
	 ag+MAVTktjt5uqZf23utwKiObqEjpVCTOLdrK6BsZEBIrxQqLFLgBbsyX4ppY5l1WaiYr
	 HGDvUFHhW3xV7F9yuG5T1vMuBcx31s6yojuxJ7iLRIZUNcKboBjC9dLSpjtB86zlPV1NA
	 zqEEvWxbfbW1TAdqTnxuj/zk0dZ/BNLHGByECwrXtc4axNF2xM4xKP2OOMoQSsMj2zNo6
	 gIG6PXjMrqjF9wVXNknebaaiSaLm7mwreSdlPzIUvubIO/SRvfIjFDIEitzeXWM7h/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809012;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ynGsjLupb9ezEYSfFRC4jvrQAD8ixCMYdXAFP0DySR0=;
	b=ZUG5Zh9lX2LEoSxMJ8wrBCsoEalt5L/APpze2f3ECy49X3WRC4HH0NhGpTFn3kMiRBxL
	 NvEbw7FaBF3c8xGpfb6f0P66aAyFiU0KvEnLx1EKWYHv3SzjcmNoXLTb+lzm00KhFP8T6
	 zr3kJJvze2vfYP90F+1Sxd6i2RvXomBDJOcCu3WTspzhR072LRcpm7j4hx3yL7iZ5WqjE
	 q5cPPhiw2wP6EH5QSgB94nXzP4suGqm85p6PnN+DcYhprSrXZEpnDvCxAP1XlzUza3u5e
	 VC5SyWOUStt0dN81l68/FgE/8JpWSaisDDC2TE8m68rTehII4cgnNmaPIVSYZ9K/rGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iuIK5XBd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD87606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iuIK5XBd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0721F00897;
	Fri, 27 Nov 2026 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795809012;
	bh=ynGsjLupb9ezEYSfFRC4jvrQAD8ixCMYdXAFP0DySR0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iuIK5XBdf1arqw2c/AKhNwMazBIcyIRoRvlZeWsKKuF7Og2JzchF7K1JbAr3wji3S
	 CH7o1/KUo8B6jLKjtA37VMRYay3rizHoIqIcpQ1x0hoKcg+c/gBnluVQH8sfcpefKO
	 5i36ppmW54wGuy+zuG3Kl5tq9U0dahRgJkd0jjWFrcF50YeM3V4ZFj+p8YvR4w9fY2
	 ViaMos2FqxpKYMJ2WmKUNuvPuUqnbkTAmzp+rs4zyZGddHK7+Yu8wsCT1ogDb4Ta0f
	 htc8c6YbBgf64JgAsCWMbLu7GbRHI15+3IpyNZzYwZk1jAsgmmBGR1VlovZmIyVdtu
	 Xt4yuy9s86jfQ==
Subject: Re: [PATCH net v3 1/2] net: wwan: iosm: free the MUX after the
 netdevs that use it
From: netdev-bot+sashiko@kernel.org
To: davidlwesten@gmail.com
Cc: netdev@vger.kernel.org, loic.poulain@oss.qualcomm.com,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 m.chetan.kumar@intel.com, mail@maciej.szmigiero.name
Date: Fri, 27 Nov 2026 19:50:10 +0000
Message-ID: <179580901077.3135.14183564471297822250@kernel.org>
In-Reply-To: <20261126194143.32283-2-davidlwesten@gmail.com>
References: <20261126194143.32283-2-davidlwesten@gmail.com>
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

Critical: 0 · High: 0 (1) · Medium: 4 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] During ipc_imem_cleanup(), each netdev that is up now runs a
  blocking MUX CLOSE_SESSION command.
- [Medium] The commit message says closing the netdev tells the modem to
  close the session "so that it stops writing into the MUX buffers…
- [Medium] The CLOSE_SESSION command issued by the netdev close runs
  asynchronously in tasklet context, and nothing in ipc_imem_cleanup()…
- [Medium] The new IPC_P_OFF_REQ branch in
  ipc_imem_td_update_timer_start() assumes…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  ipc_mux_deinit() frees the MUX and nothing clears ipc_imem->mux.
- [Medium] Concern: ipc_imem_cleanup() cancels td_alloc_timer,
  tdupdate_timer, fast_update_timer and startup_timer but never…

--

net: wwan: iosm: free the MUX after the netdevs that use it

This patch reorders ipc_imem_cleanup() so the MUX is freed after debugfs,
the ports and the wwan netdevs. It fixes a KASAN use-after-free that hits
when a netdev that is up gets closed during unbind. It also makes
ipc_imem_td_update_timer_start() ring the doorbell directly during the
IPC_P_OFF_REQ phase.

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
> index 4405c85318880..3ab409166c506 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c
> @@ -178,7 +178,8 @@ void ipc_imem_msg_send_feature_set(struct iosm_imem *ipc_imem,
>  void ipc_imem_td_update_timer_start(struct iosm_imem *ipc_imem)
>  {
>  	/* Use the TD update timer only in the runtime phase */
> -	if (!ipc_imem->enter_runtime || ipc_imem->td_update_timer_suspended) {
> +	if (!ipc_imem->enter_runtime || ipc_imem->td_update_timer_suspended ||
> +	    ipc_imem->phase == IPC_P_OFF_REQ) {
>  		/* trigger the doorbell irq on CP directly. */
>  		ipc_protocol_doorbell_trigger(ipc_imem->ipc_protocol,
>  					      IPC_HP_TD_UPD_TMR_START);

[Severity: Medium]
Does this doorbell reach the modem when the CP is in device sleep?

ipc_protocol_doorbell_trigger() goes through ipc_pm_signal_hpda_doorbell()
with host_slp_check=true. If the link is asleep, ipc_pm_trigger() calls
ipc_pm_link_activate(). That function only sends the wakeup sleep-control
IRQ and returns false:

drivers/net/wwan/iosm/iosm_ipc_pm.c:ipc_pm_link_activate() {
    ...
			ipc_cp_irq_sleep_control(ipc_pm->pcie, IPC_MEM_DEV_PM_WAKEUP);
			ipc_pm->ap_state = IPC_MEM_DEV_PM_ACTIVE_WAIT;

			goto not_active;
    ...
}

ipc_pm_signal_hpda_doorbell() then only latches the update:

	if (!ipc_pm_trigger(ipc_pm, IPC_PM_UNIT_IRQ, true)) {
		ipc_pm->pending_hpda_update = true;
		...
		return;
	}

Only ipc_pm_on_link_wake() flushes pending_hpda_update. It is reached via
ipc_imem_slp_control_exec() from ipc_imem_handle_irq(), which returns early
for the whole cleanup:

	if (old_phase == IPC_P_OFF_REQ) {

Take an idle wwan0 with the modem in device sleep, which is enabled by
default via ipc_imem_msg_send_device_sleep(). In that state, would
CLOSE_SESSION be written to the UL TD ring without the HP doorbell ever
firing, and the PM handshake be left in IPC_MEM_DEV_PM_ACTIVE_WAIT?

Whether the CP still processes the TD ring after the wakeup IRQ, without an
HP doorbell, depends on the firmware.

> @@ -1244,10 +1245,10 @@ void ipc_imem_cleanup(struct iosm_imem *ipc_imem)
>  	cancel_work_sync(&ipc_imem->run_state_worker);
>  
>  	if (test_and_clear_bit(FULLY_FUNCTIONAL, &ipc_imem->flag)) {
> -		ipc_mux_deinit(ipc_imem->mux);
>  		ipc_debugfs_deinit(ipc_imem);
> -		ipc_wwan_deinit(ipc_imem->wwan);
>  		ipc_port_deinit(ipc_imem->ipc_port);
> +		ipc_wwan_deinit(ipc_imem->wwan);

[Severity: Medium]
Can this stall unbind for a full second per active session while RTNL is
held?

ipc_imem_cleanup() sets ipc_imem->phase = IPC_P_OFF_REQ before it gets
here, and the MUX is now still MUX_S_ACTIVE when the netdevs are closed:

wwan_unregister_ops()   <- rtnl_lock()
  unregister_netdevice_many()
    ipc_wwan_link_stop()
      ipc_imem_sys_wwan_close()
        ipc_mux_close_session()
          ipc_mux_schedule(MUX_E_MUX_SESSION_CLOSE)
            ipc_mux_session_close()
              ipc_mux_dl_acb_send_cmds(..., blocking=true)
                ipc_mux_acb_send()

ipc_mux_acb_send() waits on channel->ul_sem for up to
IPC_MUX_CMD_RUN_DEFAULT_TIMEOUT (1000 ms). For a MUX command, only
ipc_mux_dl_cmdresps_decode_process() completes ul_sem. It is reached only
via ipc_imem_dl_pipe_process() from ipc_imem_handle_irq(), which drops
every MSI in IPC_P_OFF_REQ:

	if (old_phase == IPC_P_OFF_REQ) {
		dev_dbg(... "Ignoring MSI. Deinit sequence in progress!" ...);
		return;

So the wait always runs out. After the timeout, ipc_mux_acb_send() logs
"ch[%d] timeout" and sends UEVENT_MDM_TIMEOUT right after MDM_NOT_READY.
ipc_mux_session_close() then logs "CLOSE_SESSION send failed".

This repeats for each session that is up, up to
IPC_MEM_MUX_IP_SESSION_ENTRIES, all under RTNL. Nothing gates it on the link
being active, so surprise removal hits it too.

The port closes behave much the same, since ipc_protocol_msg_send() waits
500 ms per pipe. So "The reply is ignored, as for the port closes" is
accurate, but those waits do not happen under RTNL.

The later patch in the series ("re-bind the driver when the modem rebooted
during S3") short-circuits ipc_mux_dl_acb_send_cmds() only when
IOSM_MODEM_GONE is set, so a normal unbind still stalls.

Should the session close be skipped or made non-blocking during cleanup?
If not, should the commit message at least mention the stall?

> +		ipc_mux_deinit(ipc_imem->mux);

[Severity: Medium]
The commit message says closing the netdev "tells the modem to close the
session, so that it stops writing into the MUX buffers before they are
freed". Is that ordering actually enforced?

In IPC_P_OFF_REQ the CLOSE_SESSION reply is never decoded, so the host
never learns whether the modem acted on it.

The wait in ipc_mux_acb_send() is interruptible, and only a 0 return counts
as failure. A pending signal makes it return -ERESTARTSYS at once:

	if (wait_for_completion_interruptible_timeout
		   (completion, msecs_to_jiffies(wait_time_milliseconds)) ==
		   0) {

When the last session closes, ipc_mux_channel_close() calls
ipc_imem_channel_close(). That skips the PIPE_CLOSE messages but still
frees the TD buffers:

	if (ipc_imem->phase == IPC_P_RUN) {
		ipc_imem_pipe_close(ipc_imem, &channel->ul_pipe);
		ipc_imem_pipe_close(ipc_imem, &channel->dl_pipe);
	}

	ipc_imem_pipe_cleanup(ipc_imem, &channel->ul_pipe);
	ipc_imem_pipe_cleanup(ipc_imem, &channel->dl_pipe);

ipc_imem_pipe_cleanup() -> ipc_protocol_pipe_cleanup() unmaps and frees
the UL and DL skbs. That includes the CLOSE_SESSION ACB that was just
doorbelled and the DL buffers the reply would be written into. The modem
is told IPC_UNINIT only later, in ipc_imem_device_ipc_uninit().

Freeing the MUX pipe buffers without a device handshake predates this
patch, but the patch adds a new TD that the device is told to process.

If the modem reads the ACB or writes the response after these buffers are
freed, can that cause an IOMMU fault? Without an IOMMU, can it cause a DMA
write into freed memory?

[Severity: Medium]
Can the queued CLOSE_SESSION command still touch the MUX after
ipc_mux_deinit() frees it?

ipc_mux_acb_send() queues the command asynchronously:

	int ret = ipc_task_queue_send_task(ipc_mux->imem, ipc_mux_tq_cmd_send,
					   0, &ipc_mux->acb,
					   sizeof(ipc_mux->acb), false);

ipc_mux_tq_cmd_send() later does:

	struct iosm_mux *ipc_mux = ipc_imem->mux;
	...
	skb_queue_tail(&ipc_mux->channel->ul_list, acb->skb);

Only the interruptible wait above orders this before the free. If a signal
is pending, that wait returns at once and the netdev teardown continues.
ipc_mux_deinit() then calls kfree(ipc_mux) without clearing
ipc_imem->mux.

The tasklet is killed only later, in ipc_task_deinit(), which runs after
the sleeping ipc_imem_device_ipc_uninit().

If the ipc_task tasklet has not run by the time of the kfree,
ipc_mux_tq_cmd_send() would dereference the freed MUX. That is the same
class of bug this patch is fixing.

Does the MUX free need to happen after the task queue is drained, rather
than just later in the sequence?

[Severity: Medium]
This isn't a bug introduced by this patch, but ipc_imem_cleanup() cancels
four of the hrtimers and never cancels adb_timer:

	hrtimer_cancel(&ipc_imem->td_alloc_timer);
	hrtimer_cancel(&ipc_imem->tdupdate_timer);
	hrtimer_cancel(&ipc_imem->fast_update_timer);
	hrtimer_cancel(&ipc_imem->startup_timer);

ipc_imem_adb_timer_start() has no IPC_P_OFF_REQ guard like the one added to
ipc_imem_td_update_timer_start(). ipc_imem_tq_adb_timer_cb() calls
ipc_mux_ul_adb_finish(ipc_imem->mux) on a pointer that is never cleared.

ipc_mux_tq_ul_trigger_encode() can still arm adb_timer if it was queued
before the phase store, and the phase check is a plain, unordered load.

This patch makes the window much smaller, because ipc_mux_deinit() now runs
after the port and netdev teardown. A use-after-free would now need the
tasklet to be starved for that whole period. Only the MUX_AGGREGATION
(7560) path uses adb_timer.

The later patch in the series only adds an IOSM_MODEM_GONE check to
ipc_imem_adb_timer_start().

Should adb_timer be cancelled along with the other timers?

[Severity: High]
This is a pre-existing issue, but ipc_mux_deinit() frees the MUX without
clearing ipc_imem->mux. Does that leave a reachable use-after-free on the
error path of ipc_imem_run_state_worker()?

	err_ipc_mux_deinit:
		ipc_mux_deinit(ipc_imem->mux);
	err_out:
		ipc_uevent_send(ipc_imem->dev, UEVENT_CD_READY_LINK_DOWN);

ipc_imem_wwan_channel_init() can fail in three ways: the CP version reads
back as -1, ipc_wwan_init() fails to allocate, or wwan_register_ops()
fails. In each case the MUX is freed, FULLY_FUNCTIONAL is not set, and
ipc_imem->mux is left dangling.

The modem stays in the run phase, so later MSIs reach ipc_imem_handle_irq()
in IPC_P_RUN:

	if (ipc_mux_ul_data_encode(ipc_imem->mux)) {
		ipc_imem_td_update_timer_start(ipc_imem);
		if (ipc_imem->mux->protocol == MUX_AGGREGATION)

ipc_mux_ul_data_encode() handles a NULL pointer but not a dangling one. The
ipc_imem->mux check in ipc_imem_sys_wwan_close() also assumes the pointer is
cleared after the free.

Would setting ipc_imem->mux to NULL after ipc_mux_deinit() fix this? It
would also harden the cleanup path that this patch reorders.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126194143.32283-1-davidlwesten%40gmail.com

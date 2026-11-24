Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487385;
	b=Y0+XkUYw4pxqg4BpgtGHMG9tV0NCQ1Tj3By4EEHGuW6E4UdVFRdFOcUKo589UR8Xpl4S
	 Yzl144x0AGHbDrDFHAGvfHGEaYmXxBa0yuAiHf+j0DcR2eRTnqPqY038KyzJFvkFr+cKS
	 NPGc2PFzxOUWjv2BGOgfCfYO6Imic9JoxhFsYFASlGzI/cmQIUbAJcmd0PqyXHn0ABCNu
	 nLHA9aP3XFNb5JxrY3IYwzSDpo9R9k0UkOPtsnH4+k0HYW4w5ktEjr6V5P/f1le7128ng
	 +LtADJTpMqPUnET1H0FU3YMkcWK9UtmhWHe3xX81aOVbMalHqTu8zEf8YT3MIAbV3uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487385;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9BRSt4bKZB1ROV8/Bbhngt5JUMh1+HmRfp5gTo92foM=;
	b=zRV9jPVJNIP+jUQV3fxXWddnvMiUFgQOTGRiLBYTNsVGjt9SbZMvuJG1yeaAzc4HyzYW
	 38ZahXiBPvxV9/MA6V7PWy2qUjQqBZEuQTi1UL8XsMtpytycFKTMYGSy6P9UvED9LqJLw
	 xlLwM48NA0U8KfFzWZw9MTeeLxnSYTlQ61fmlk3OhZosUCn2o2OwtPlGamg92QfJNKB9V
	 72LeYscajHvIa2K3a1pRzc5ahUp/Oa13pihp8QsCw5nNqYTVGevRWPyN0r/WeGk17gonA
	 rVkXZUS2qCnHgx+lHSjWy7rJoub2MaIoJPx0wpY2b3/emwNIxCHNvwbf+jssll5RbVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5ZsxBFt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5629606A335;
	Tue, 24 Nov 2026 02:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M5ZsxBFt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1891F000F2;
	Tue, 24 Nov 2026 02:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795487385;
	bh=9BRSt4bKZB1ROV8/Bbhngt5JUMh1+HmRfp5gTo92foM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M5ZsxBFtoIoZtxt1oI81Hl9Ijz7mfU/eSy2hSn9sUwxYlIhznpB4vyBDLs8ONPuE0
	 c6PIQr/J6veMVCQ9wwZ9/sxOQ/qj71ibxZyFuIC+xc6lrQixRt0hPaQRbNkJNqV1Ph
	 JyC2bKn3RqrLzVSx6g/aTI90hOW4AXPQMOaJEegUKhRU8G6QKr12lwKJpKwt+V/KAQ
	 EoiPMVcan1mQvBYMdTEu3MlHyjaG8QsRqT7ITHQ5ulHR/eNStkQG3KHYa98aIndbb6
	 omezzDIUMIjXRAzJtlddJutevj/OUYSl0Gw5TtuWQKxtqoTvsqac8oxPRNyYH0I9qS
	 ay1QU3qDuo0Qg==
Subject: Re: [PATCH net v7 6/6] net: wwan: t7xx: fix memory ordering in
 t7xx_dpmaif_rx_stop()
From: netdev-bot+sashiko@kernel.org
To: tim770802@gmail.com
Cc: netdev@vger.kernel.org, chandrashekar.devegowda@intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 ilpo.jarvinen@linux.intel.com, sreehari.kancharla@linux.intel.com,
 m.chetan.kumar@linux.intel.com, horms@kernel.org,
 linux-kernel@vger.kernel.org, tim.jh.chen@wnc.com.tw,
 Chih.Hung.Huang@wnc.com.tw
Date: Tue, 24 Nov 2026 02:29:43 +0000
Message-ID: <179548738379.3135.10590455313123691119@kernel.org>
In-Reply-To: <20261120015556.131547-7-tim770802@gmail.com>
References: <20261120015556.131547-7-tim770802@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch still relies on the ad-hoc rx_processing flag (set
  when the poll starts, cleared when it ends) to tell…
- [High] net: wwan: t7xx: sleep_disable_count leak on multi-pass poll
  stop
- [Low] The patch adds a comment in t7xx_dpmaif_pit_release_and_add()
  saying "t7xx_dpmaif_rx_stop() waits for this poll before the hardware…
- [Low] The commit message explains why only some que_started accesses
  get READ_ONCE()/WRITE_ONCE(): "the other accesses of que_started are…

--

net: wwan: t7xx: fix memory ordering in t7xx_dpmaif_rx_stop()

This patch changes t7xx_dpmaif_rx_stop() to clear que_started and issue
smp_mb() before it waits for rx_processing. That matches the
store/smp_mb()/load order in t7xx_dpmaif_napi_rx_poll(). It also moves
the que_started check from t7xx_dpmaifq_release_pit_entry() into
t7xx_dpmaif_pit_release_and_add(), so the pending PIT release count is
kept while the queue is stopped.

> diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
> index a7d6289415b1c..d70ef315f5f5d 100644
> --- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
> +++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c

[ ... ]

> @@ -565,6 +562,14 @@ static int t7xx_dpmaif_pit_release_and_add(struct dpmaif_rx_queue *rxq)
>  	if (rxq->pit_remain_release_cnt < DPMAIF_PIT_CNT_THRESHOLD)
>  		return 0;
>  
> +	/* The queue is stopped: keep the count, the entries are released by
> +	 * the first poll after the queue has been restarted.
> +	 * t7xx_dpmaif_rx_stop() waits for this poll before the hardware is
> +	 * stopped.
> +	 */
> +	if (!READ_ONCE(rxq->que_started))
> +		return 0;
> +

[Severity: Low]
Is the last sentence of this comment accurate? The commit message makes the
same claim:

  "The hardware is still up during that pass because
  t7xx_dpmaif_rx_stop() waits for it before the hardware is stopped."

Both callers of t7xx_dpmaif_rx_stop() seem to stop the DL queues first.
Here is t7xx_dpmaif_suspend():

drivers/net/wwan/t7xx/t7xx_hif_dpmaif.c:t7xx_dpmaif_suspend() {
	t7xx_dpmaif_tx_stop(dpmaif_ctrl);
	t7xx_dpmaif_hw_stop_all_txq(&dpmaif_ctrl->hw_info);
	t7xx_dpmaif_hw_stop_all_rxq(&dpmaif_ctrl->hw_info);
	t7xx_dpmaif_disable_irq(dpmaif_ctrl);
	t7xx_dpmaif_rx_stop(dpmaif_ctrl);
	...
}

t7xx_dpmaif_hw_stop_all_rxq() calls t7xx_dpmaif_dl_all_q_en(hw_info, false).

On the modem stop path, t7xx_dpmaif_md_state_callback() calls
t7xx_dpmaif_stop_hw() on MD_STATE_WAITING_TO_STOP. That happens before
MD_STATE_STOPPED or MD_STATE_EXCEPTION reaches:

t7xx_dpmaif_stop()->t7xx_dpmaif_stop_sw()->t7xx_dpmaif_rx_stop()

So a poll pass that finishes with que_started == false appears to always
run after the DL queues have been disabled.

The early return looks harmless today, but for other reasons. The device
is still in D0 during the PM entity suspend, and on modem stop
t7xx_dpmaif_rx_clear() throws the count away.

Could the comment and the changelog describe the actual ordering?

>  	ret = t7xx_dpmaifq_release_pit_entry(rxq, rxq->pit_remain_release_cnt);
>  	if (ret)
>  		return ret;

[ ... ]

> @@ -1127,14 +1132,16 @@ void t7xx_dpmaif_rx_stop(struct dpmaif_ctrl *dpmaif_ctrl)
>  		struct dpmaif_rx_queue *rxq = &dpmaif_ctrl->rxq[i];
>  		int timeout, value;
>  
> +		WRITE_ONCE(rxq->que_started, false);

[Severity: High]
Does this early exit now leak the sleep lock taken by an earlier pass
of the same poll session?

A pass of t7xx_dpmaif_napi_rx_poll() only drops what it takes on entry
in the completing branch. A pass that returns budget, sets once_more, or
takes the sleep_lock_pending reschedule path returns with rx_processing
still 1 and keeps its t7xx_pci_disable_sleep() reference:

t7xx_dpmaif_napi_rx_poll() {
	...
	if (!rxq->sleep_lock_pending)
		t7xx_pci_disable_sleep(t7xx_dev);

	ret = try_wait_for_completion(&t7xx_dev->sleep_lock_acquire);
	if (!ret) {
		napi_complete_done(napi, work_done);
		rxq->sleep_lock_pending = true;
		napi_schedule(napi);
		return work_done;
	}
	...
}

Before this patch, t7xx_dpmaif_rx_stop() waited for rx_processing to
drop before clearing que_started. The continuation passes still saw
que_started == true and the session ended in the branch that calls
t7xx_pci_enable_sleep(). Only a stop that had already timed out could
land in this early exit in the middle of a session.

With the store moved in front of the wait, the next pass after
t7xx_dpmaif_rx_stop() clears que_started takes this early exit
instead. That's the normal outcome whenever the stop arrives between
passes, and on the suspend path the NAPI is still scheduled after
t7xx_dpmaif_hw_stop_all_rxq() and t7xx_dpmaif_disable_irq(). The branch
calls pm_runtime_put_autosuspend() and napi_complete_done(), but it
never calls t7xx_pci_enable_sleep() and doesn't reset
sleep_lock_pending.

In the budget and once_more cases sleep_lock_pending is false, so the
first poll after the restart takes a fresh reference and the one from
the aborted session is never dropped. Doesn't that leave
sleep_disable_count permanently above zero, so t7xx_pci_enable_sleep()
never lets the modem enter deep sleep again? In the deferred case the
stale sleep_lock_pending cancels the extra count on the first poll
after a restart, but only by accident, and the reference stays held
until then.

The aborted session also leaves behind any PIT entries it hadn't
consumed yet. On the modem stop path t7xx_dpmaif_stop_rxq() then sees
pit_rd_idx != pit_wr_idx, busy-loops for DPMAIF_MAX_CHECK_COUNT
iterations and logs an error. The dev_err() in this branch now also
fires on an ordinary stop.

This branch also clears rx_processing before calling
pm_runtime_put_autosuspend() and napi_complete_done(), so
t7xx_dpmaif_rx_stop() can return while the poll is still inside them.

Should this early exit only apply when no session is in progress, and
otherwise release what the earlier passes took (t7xx_pci_enable_sleep(),
sleep_lock_pending)? Or would it be simpler to let the session drain
before que_started is cleared?

[Severity: Low]
The commit message says:

  "the other accesses of que_started are on the same side of the barrier
  or on paths that t7xx_dpmaif_rx_stop() serialises through
  rx_processing."

Does that hold for every reader?

t7xx_dpmaifq_rx_notify_hw() queues bat_release_work on every pass.
t7xx_dpmaif_bat_release_work() never sets rx_processing, and
t7xx_dpmaif_rx_stop() does not flush or cancel that work. The work reads
que_started with plain loads:

t7xx_dpmaif_release_bat_entry() {
	...
	if (!rxq->que_started || !rel_entry_num)
		return -EINVAL;
	...
}

It does the same in t7xx_dpmaif_update_bat_wr_idx(), reached through
t7xx_dpmaif_rx_buf_alloc().

With the new ordering, the plain read in t7xx_dpmaifq_poll_pit() also runs
at the same time as this WRITE_ONCE() whenever the queue is stopped during
a pass. Plain stores also remain in t7xx_dpmaif_start_txrx_qs() and
t7xx_dpmaif_stop_rxq().

Won't KCSAN report these as data races?

If the final pass queues bat_release_work after que_started has been
cleared, the work could also fail with -EINVAL. When bid_cnt reaches
DPMAIF_BAT_CNT_THRESHOLD, it would log "Release PKT BAT failed: -22" or
"Release BAT entry failed: -22".

The bat_release_work race existed before this patch, but the changelog now
says it doesn't.

The kernel-doc of t7xx_dpmaif_rx_stop() still says "Wait for all the RX
work to finish executing and mark the RX queue as paused". The function
only waits for the NAPI poll, and it now marks the queue paused before
waiting. Should the kernel-doc be updated too?

> +		/* Order the que_started store before the rx_processing load.
> +		 * Pairs with the smp_mb() in t7xx_dpmaif_napi_rx_poll().
> +		 */
> +		smp_mb();
> +
>  		timeout = readx_poll_timeout_atomic(atomic_read, &rxq->rx_processing, value,
>  						    !value, 0, DPMAIF_CHECK_INIT_TIMEOUT_US);
>  		if (timeout)
>  			dev_err(dpmaif_ctrl->dev, "Stop RX SW failed\n");
> -
> -		/* Ensure RX processing has stopped before we set rxq->que_started to false */
> -		smp_mb();
> -		rxq->que_started = false;

[Severity: High]
Can t7xx_dpmaif_rx_stop() still return while a poll is running?

It treats one read of rx_processing == 0 as proof that no poll is
active. But in the completing branch of t7xx_dpmaif_napi_rx_poll(),
rx_processing is cleared only after NAPI completion and the IRQ unmask:

t7xx_dpmaif_napi_rx_poll() {
	...
	} else if (work_done < budget) {
		napi_complete_done(napi, work_done);
		t7xx_dpmaif_clr_ip_busy_sts(&rxq->dpmaif_ctrl->hw_info);
		t7xx_dpmaif_dlq_unmask_rx_done(&rxq->dpmaif_ctrl->hw_info, rxq->index);
		t7xx_pci_enable_sleep(rxq->dpmaif_ctrl->t7xx_dev);
		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
		atomic_set(&rxq->rx_processing, 0);
	}
	...
}

Once napi_complete_done() has run and the IRQ is unmasked, a new RX-done
IRQ can schedule the same NAPI on another CPU. One path is
t7xx_dpmaif_isr_thread()->t7xx_dpmaif_irq_cb()->t7xx_dpmaif_irq_rx_done()
->napi_schedule(), for example after an IRQ affinity change. Busy polling
is another. The interleaving would be:

CPU1 (new poll)
  atomic_set(&rxq->rx_processing, 1);
  smp_mb();
  READ_ONCE(rxq->que_started) == true
  starts collecting

CPU0 (old poll tail)
  atomic_set(&rxq->rx_processing, 0);   overwrites CPU1's 1

CPU2 (t7xx_dpmaif_rx_stop)
  WRITE_ONCE(rxq->que_started, false);
  smp_mb();
  reads rx_processing == 0 and returns

At this point CPU1 is still in t7xx_dpmaif_rx_start().

On the t7xx_dpmaif_stop() path, t7xx_dpmaif_rx_clear() calls
t7xx_dpmaif_stop_rxq(). That clears pit_base and bat_base with memset,
zeroes the BAT bitmap, and resets pit_rd_idx, pit_release_rd_idx and
pit_remain_release_cnt while CPU1 is still updating them.

Because of the deferral added in this patch, a stale
pit_remain_release_cnt written by CPU1 after that reset is kept. It is
then handed to the hardware once t7xx_dpmaif_start() sets que_started
again.

On the suspend path, CPU1 would keep accessing DPMAIF MMIO after the
entity suspend has returned.

Setting rx_processing on entry and clearing it on exit is effectively an
ad-hoc lock. The driver already uses napi_synchronize() and napi_disable()
in t7xx_ccmni_disable_napi(). Would it be better to synchronize with NAPI
directly, or at least to clear rx_processing before napi_complete_done()?

Separately, rx_processing stays at 1 when the poll returns budget or takes
the sleep_lock_pending reschedule path. If NAPI is disabled before the next
poll runs, won't t7xx_dpmaif_rx_stop() busy-wait for the full
DPMAIF_CHECK_INIT_TIMEOUT_US and log "Stop RX SW failed"?

>  	}
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120015556.131547-1-tim770802%40gmail.com

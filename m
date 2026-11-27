Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809013;
	b=GOD6c46LOBD/htXF9nFttMVOPEDW6PnwhorCOGDYqDaGmQnsp7ZC4/imIowu9ql+44tT
	 /+4jbmjXGedI5SDWnEWJw9IN7A1ocpGNab4RvIkLW2FHILyOZgfuj+slZ6P8900GUDvcM
	 MAxONJFujvXNnFZcGsSYrc12jaDbFwgTw5AIHJlPngepcgxZomP3D3sd5LDP8qsRgIO36
	 UbPauCgzszfMyDSUaYjwnXAgINDjDc9BTlVf4Ku3y1erOXwj41GDUtaLBB9HbBFDr3Pwg
	 TBxSmTCuiJO+fyPqA4lvF1ZWxruHU2dokvf/+ubIUoEjsEg2jeXs5JJYy7d1SfoBLkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809013;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tAoNRwCUUs+SKndxh9duNpJNWIxpt019qbZxASsdh2w=;
	b=WXZeLy8hD1P7BuFDFjdnLG3j+JW9dxBMyXcALqHiEhvXYaEUJlbUU6hWYEe0BSjEJsn0
	 IIzh9lnHO/3D0xpgtRbUtIKolvlzWUE1DEs3m+qxrmFXWDgOmwt8c40vIHUq0GCYi89HP
	 iwsowOAjURDuYGx/+xbpQznu6RbwsjCo55d6cZOdIpc1woslWUahtJaQlz6TSVCRt6MeK
	 cyezDqgkqTn7AO5OFoz9ATRRzmaTdMdb+dgkvCVbEovdHApb64FBa4luZC0spwQTqiqH9
	 XrOoCeFJlUBhNXr3rJ9H5g1a+0lr89ZmIv9CwL0wifLdBZsp3SEB8L97D4DyCGehLLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbgoOBLF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A10606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbgoOBLF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3211F00898;
	Fri, 27 Nov 2026 19:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795809013;
	bh=tAoNRwCUUs+SKndxh9duNpJNWIxpt019qbZxASsdh2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bbgoOBLFBv5dFWMzK5aNvGYInb3eHBtv/lBbrHbzfyY7uPWSpR/waVZ5CDkkwyxLF
	 48VDPYUqbiP9mYiig3qU/QoeFDFtGoIHzrSEF/+AXoKewWoEJeAGFlCEAl/5wRr3EP
	 ba8yGHflaJmqhXx+ngDdhMAo3qnOl6xARuY1oUmNzBuZFwLNu+Hk/jCO/w1MwrkuMW
	 E7LCewdHzAIAUislW1EftCeqFLgX1QhoXg0hqC3VhlOfmjcPhro0S6LEDieIo5vifL
	 LvHo3WntH5mOcG4ezIuFZ0YFijIsBCZOowUQNz1CjKz4A07JrAIBJh4xiYvcWTivFb
	 oj12k2picrsww==
Subject: Re: [PATCH net v3 2/2] net: wwan: iosm: re-bind the driver when the
 modem rebooted during S3
From: netdev-bot+sashiko@kernel.org
To: davidlwesten@gmail.com
Cc: netdev@vger.kernel.org, loic.poulain@oss.qualcomm.com,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 m.chetan.kumar@intel.com, mail@maciej.szmigiero.name
Date: Fri, 27 Nov 2026 19:50:12 +0000
Message-ID: <179580901222.3135.1177117602258269899@kernel.org>
In-Reply-To: <20261126194143.32283-3-davidlwesten@gmail.com>
References: <20261126194143.32283-3-davidlwesten@gmail.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] When IOSM_MODEM_GONE is set, the new early `return -EIO` in
  ipc_protocol_msg_send() (iosm_ipc_protocol.c:72-73) removes the only…
- [Medium] The re-bind runs synchronously inside the PM_POST_SUSPEND
  notifier.
- [Low] ipc_imem_wait_for_run() stops early only on RUN, CRASH or
  CD_READY.
- [Low] ipc_imem_wait_for_run() reuses IPC_MODEM_BOOT_TIMEOUT as its loop
  bound.
- [Low] ipc_pcie_resume_cb() sets IOSM_MODEM_GONE with a plain set_bit().
- [Low] ipc_pcie_rebind_if_rebooted() holds device_lock(&pdev->dev) for
  the whole ipc_imem_wait_for_run() poll, up to 500 x msleep(20), about…

--

net: wwan: iosm: re-bind the driver when the modem rebooted during S3

On resume, this patch reads the exec stage from MMIO. If the modem
booted again during S3, it sets a new IOSM_MODEM_GONE flag that stops
doorbells, IRQ processing, messages and the pending-data waits. From the
PM_POST_SUSPEND notifier it then waits for the modem to reach the run
stage and re-binds the driver with device_reprobe().

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_imem.c b/drivers/net/wwan/iosm/iosm_ipc_imem.c
> index 3ab409166c506..673c5ad403e79 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_imem.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_imem.c

[ ... ]

> @@ -1042,6 +1045,44 @@ void ipc_imem_pm_s2idle_sleep(struct iosm_imem *ipc_imem, bool sleep)
>  	ipc_protocol_s2idle_sleep(ipc_imem->ipc_protocol, sleep);
>  }
>  
> +bool ipc_imem_modem_rebooted(struct iosm_imem *ipc_imem)
> +{
> +	if (!test_bit(FULLY_FUNCTIONAL, &ipc_imem->flag))
> +		return false;
> +
> +	switch (ipc_mmio_get_exec_stage(ipc_imem->mmio)) {
> +	case IPC_MEM_EXEC_STAGE_RUN:
> +		return ipc_mmio_get_ipc_state(ipc_imem->mmio) ==
> +		       IPC_MEM_DEVICE_IPC_UNINIT;
> +	case IPC_MEM_EXEC_STAGE_CRASH:
> +	case IPC_MEM_EXEC_STAGE_CD_READY:
> +	case IPC_MEM_EXEC_STAGE_INVALID:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +bool ipc_imem_wait_for_run(struct iosm_imem *ipc_imem)
> +{
> +	int timeout = IPC_MODEM_BOOT_TIMEOUT;

[Severity: Low]
This isn't a bug, but iosm_ipc_imem.h documents IPC_MODEM_BOOT_TIMEOUT as
the wait for the IPC_INIT handshake:

/* Timeout in 20 msec to wait for the modem to boot up to
 * IPC_MEM_DEVICE_IPC_INIT state.
 * unit : milliseconds (500 * ipc_util_msleep(20))
 */
#define IPC_MODEM_BOOT_TIMEOUT 500

Here the constant bounds a poll of the exec stage for RUN after a full
reboot. The new kernel-doc, "Wait up to about 10 s for the run stage",
only stays correct while the constant is 500.

Would a separate constant for this wait be clearer?

> +
> +	for (;;) {
> +		switch (ipc_mmio_get_exec_stage(ipc_imem->mmio)) {
> +		case IPC_MEM_EXEC_STAGE_RUN:
> +			return true;
> +		case IPC_MEM_EXEC_STAGE_CRASH:
> +		case IPC_MEM_EXEC_STAGE_CD_READY:
> +			return false;
> +		default:
> +			break;
> +		}

[Severity: Low]
Should IPC_MEM_EXEC_STAGE_INVALID also end this loop early?

ipc_imem_modem_rebooted() above treats INVALID as a stage to leave
alone. Here, INVALID (0xFFFFFFFF from a device that stopped responding),
BOOT, PSI and EBL all fall into the default case. They are polled for the
full 500 x msleep(20).

ipc_pcie_rebind_if_rebooted() only warns when this returns false, and
then reprobes anyway:

	if (rebooted && !ipc_imem_wait_for_run(ipc_pcie->imem))
		dev_warn(&pdev->dev, "modem not running after resume");
	...
	if (rebooted && device_reprobe(&pdev->dev))

In these cases the wait adds about 10 s under device_lock, inside the PM
notifier, and the outcome is the same.

The loop also assumes every supported modem gets back to RUN on its own
after losing power. That was tested on the XMM7360, but
ipc_pcie_rebind_rebooted() also covers INTEL_CP_DEVICE_7560_ID.

Would a device that stays in ROM waiting for the host hit the full
timeout on every resume?

While the flag is set, doorbells are suppressed and IRQs are dropped, so
nothing on the driver side can move the stage forward. Probe already
handles a device found in the BOOT stage in ipc_imem_init().

> +		if (!--timeout)
> +			return false;
> +		msleep(20);
> +	}
> +}

[ ... ]

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> index 49052eb511baa..767a609462b4f 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> @@ -427,6 +427,10 @@ static int __maybe_unused ipc_pcie_resume_cb(struct device *dev)
>  
>  	ipc_pcie = pci_get_drvdata(pdev);
>  
> +	/* pm_notify() re-binds the driver for a modem that booted again */
> +	if (ipc_imem_modem_rebooted(ipc_pcie->imem))
> +		set_bit(IOSM_MODEM_GONE, &ipc_pcie->imem->flag);

[Severity: Low]
Is a plain set_bit() here enough to stop the driver from talking to the
rebooted modem?

Device interrupts are enabled again after the resume_noirq phase, before
this callback runs. An MSI in that window makes ipc_imem_irq_process()
queue ipc_imem_tq_irq_cb while the flag is still clear. That task, or one
already queued or running on another CPU, then runs ipc_imem_handle_irq()
against the stale shared memory.

Every new reader does a lockless test_bit() and then acts. For example,
in ipc_doorbell_fire():

	if (ipc_pcie->imem && test_bit(IOSM_MODEM_GONE, &ipc_pcie->imem->flag))
		return;

	ipc_write_dbell_reg(ipc_pcie, irq_n, data);

There is no synchronize_irq() and no drain of the IPC task queue after the
bit is set. Does the commit message's "the driver then neither talks to
it nor waits for it" actually hold?

[ ... ]

> @@ -532,6 +536,37 @@ void ipc_pcie_kfree_skb(struct iosm_pcie *ipc_pcie, struct sk_buff *skb)
>  	dev_kfree_skb(skb);
>  }
>  
> +static void ipc_pcie_rebind_if_rebooted(struct pci_dev *pdev)
> +{
> +	struct iosm_pcie *ipc_pcie;
> +	bool rebooted = false;
> +
> +	device_lock(&pdev->dev);
> +	if (pdev->dev.driver == &iosm_ipc_driver.driver) {
> +		ipc_pcie = pci_get_drvdata(pdev);
> +		rebooted = test_bit(IOSM_MODEM_GONE, &ipc_pcie->imem->flag);
> +		/* Let probe find it in the run stage, as after a cold boot */
> +		if (rebooted && !ipc_imem_wait_for_run(ipc_pcie->imem))
> +			dev_warn(&pdev->dev, "modem not running after resume");
> +	}
> +	device_unlock(&pdev->dev);
> +
> +	if (rebooted && device_reprobe(&pdev->dev))
> +		dev_err(&pdev->dev, "re-binding the driver failed");
> +}

[Severity: Low]
Does the ipc_imem_wait_for_run() poll need to run with device_lock()
held?

The poll only reads MMIO, but it can sleep for up to 500 x msleep(20)
while holding the lock. Anything else that takes this device's lock
blocks for that long. That includes sysfs bind/unbind and
device_release_driver() from pciehp or AER removal.

The lock is then dropped before device_reprobe(). device_reprobe()
re-reads dev->driver and detaches whatever is bound at that moment.

Userspace is already thawed at this point. Could a sysfs unbind/bind or
a driver_override change between device_unlock() and device_reprobe()
make the dev->driver check above stale?

[ ... ]

> @@ -551,6 +586,8 @@ static int pm_notify(struct notifier_block *nb, unsigned long mode, void *_unuse
>  				pci_registered = true;
>  			}
>  		}
> +	} else if (mode == PM_POST_SUSPEND) {
> +		ipc_pcie_rebind_rebooted();
>  	}

[Severity: Medium]
Is it ok to do this work synchronously in the PM_POST_SUSPEND notifier?

The notifier runs after tasks are thawed and before the console is
restored:

kernel/power/suspend.c:suspend_finish() {
	suspend_thaw_processes();
	filesystems_thaw();
	pm_notifier_call_chain(PM_POST_SUSPEND);
	pm_restore_console();
}

enter_state() releases system_transition_mutex only after this returns.

Here, pm_notify()->ipc_pcie_rebind_rebooted()->
ipc_pcie_rebind_if_rebooted() polls ipc_imem_wait_for_run() for up to
about 10 s. Then device_reprobe() runs a full remove and probe, and probe
can poll again for up to 500 x msleep(20) in ipc_imem_ipc_init_check().

Several things can then wait up to about 20 s on the modem: the write to
/sys/power/state, the console restore, and any new suspend attempt, which
gets -EBUSY from mutex_trylock().

During that window userspace is running against the old driver
instance. ipc_imem_sys_port_open() still refuses opens because the stage
it sees is stale or not RUN. That is the "PORT open refused" symptom from
the commit message. Messages fail with -EIO. After that, all ports and
wwan0 are torn down and created again.

Could the re-bind be deferred to a work item instead? The commit message
also doesn't mention the delay or that wwan0 and the ports are recreated.

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_protocol.c b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
> index 527355a671b64..a49a45ed0b0de 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_protocol.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_protocol.c
> @@ -69,6 +69,9 @@ int ipc_protocol_msg_send(struct iosm_protocol *ipc_protocol,
>  	/* Trap if called from non-preemptible context */
>  	might_sleep();
>  
> +	if (test_bit(IOSM_MODEM_GONE, &ipc_protocol->imem->flag))
> +		return -EIO;

[Severity: High]
Can this early return let ipc_imem_pipe_close() free the pipe rings while
the IPC tasklet is still writing into them?

Before this patch, ipc_imem_pipe_close() waited for the tasklet to run
the IPC_MSG_PREP_PIPE_CLOSE task, because msg_send queues it with
ipc_task_queue_send_task(..., wait=true). The task queue is FIFO and a
tasklet never runs on two CPUs at once. So any earlier UL work on the
channel had finished before the cleanup ran:

drivers/net/wwan/iosm/iosm_ipc_imem.c:ipc_imem_pipe_close() {
	...
	pipe->is_open = false;
	ipc_protocol_msg_send(ipc_imem->ipc_protocol, IPC_MSG_PREP_PIPE_CLOSE,
			      &prep_args);

	ipc_imem_pipe_cleanup(ipc_imem, pipe);
}

With IOSM_MODEM_GONE set, msg_send now returns -EIO right away. Then
ipc_imem_pipe_cleanup()->ipc_protocol_pipe_cleanup() frees
pipe->skbr_start with kfree() and pipe->tdr_start with
dma_free_coherent(), and sets both to NULL.

On the tasklet side, ipc_imem_ul_write_td() only does a lockless state
check before using the rings:

	if (channel->state != IMEM_CHANNEL_ACTIVE)
		continue;
	...
	ipc_protocol_ul_td_send(ipc_imem->ipc_protocol, pipe, ul_list);

and ipc_protocol_ul_td_send() writes into them:

	td = &pipe->tdr_start[head];
	...
	pipe->skbr_start[head] = skb;

The new goto close in ipc_imem_sys_port_close() does only a plain store,
channel->state = IMEM_CHANNEL_CLOSING, just before the free. A tasklet
that has already seen ACTIVE keeps going.

UL tasklet work can still be queued while the flag is set.
ipc_imem_sys_cdev_write() has no IOSM_MODEM_GONE check and queues
ipc_imem_tq_cdev_write with wait=false. That task walks all active
channels, not just the writer's:

CPU1 (IPC tasklet)                     CPU2
ipc_imem_tq_cdev_write()
  (queued by a write to port A)
  ipc_imem_ul_send()
    ipc_imem_ul_write_td()
      sees port B channel ACTIVE
                                       port B closed (wwan_port_op_stop,
                                       or ipc_port_deinit() in reprobe)
                                       ipc_imem_sys_port_close()
                                         goto close
                                         ipc_imem_pipe_close()
                                           ipc_protocol_msg_send() -> -EIO
                                           ipc_protocol_pipe_cleanup()
                                             frees tdr_start, skbr_start
      ipc_protocol_ul_td_send()
        writes pipe->tdr_start[head]
        writes pipe->skbr_start[head]

Wouldn't CPU1 then write into freed slab or DMA memory, or dereference
NULL plus head, and also leak the stored skb?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126194143.32283-1-davidlwesten%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757326;
	b=eDsuonyXBSVH93zyPCAdaNxdsXQ4FuK9tQoLuEp9PXvV23DdzBihq61Dn2OX+jngqh4m
	 wdDbHIMt+ZbJ7U+KkkA03h2sF4F7TJFEdtu+uWDEoqxvyQCYWSn5bgJ2mD5ZKNdMM0PM+
	 pzrddvJfSrW4tY10NEzkkP7C6mzMZ5vVNV6tiPcYVA5gd9ATi5k5tFOdEaB3cfPhz3FNO
	 m62nAt40R8PZVVsUw5lciM9sBHUUFAgPZkIA7Hj0ipGyCVYYNthddyxCKpLc2bI0of9Ci
	 STHIwJT6/CJhMd7qerxVXow/6ACR75uCWmlX6NL5fIQ9rilP2eB/QSLFigd5Cis7+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757326;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wcf6xBMmeVcbyC259fRmUYypma8MIn5s2XIjAdgi280=;
	b=I3NTrh5YvJW5hR0RRIsdQwaqAdj1IMYogqzHXlyPb9HXLWfDh8dgRItMMm8aQmAKKPDb
	 Mjfznd5L0HgS5Y3yfQhsKWeBXmb2mK3fj2CnTGfb4I1ganbO4/1KC0LnYYL7nKvgrJtXg
	 0Ut7vQ4V6RmB4/yNzBsRH4RSwcr40F66FB7Beta5aRVdYZ/gF/KIrFoG+aL5N6H2C52Iz
	 tDM7rX0tl+PqIdR6qL6s/CeWx6KexRlUrVZaEpi5wlUt8fOR9Njk1YTeVYKuw0fN8z5Ox
	 D9/9md/yV6Jyvo19/K03cDmmJwzvGj8itj39APyBOmzc4SEWtzU3eXIcv77R/t0WaEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTMT5Or5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80005606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HTMT5Or5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E364F1F00893;
	Fri, 27 Nov 2026 05:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795757325;
	bh=wcf6xBMmeVcbyC259fRmUYypma8MIn5s2XIjAdgi280=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HTMT5Or5utVSNvULzMiFPIpfQ6TdSLsIMMW05n0YipftgQMxcYtgsUTA21lcSCQge
	 9djmeyQYtCcqjrShQRiYrziWkjZ4O1Mw2fDceqOdHBcCnWuXL3pBW0FvVtAqAa9ZA2
	 18UI0M7DNz0xaLi/3ZS8ZaFeMBSerX8FqOgCWcrmzcoiNOxcR6/oAvfA/2P6i3tvxA
	 UuuQPpUqnl9+fzDQeVaxuQLONaNbTOgwUaPvIYdMa3hmWhNrAu2kcNDWtezoqhPQqf
	 z1thuvnPsxNt15vdhZzwHdTTfhyzSS1yBAIgOn+r/1JXgKnqCgmIdyCQCa3q05BNi6
	 Fkel8j7EhZgxg==
Subject: Re: [PATCH net v2 3/3] net: wwan: iosm: always send the host sleep
 message on suspend
From: netdev-bot+sashiko@kernel.org
To: davidlwesten@gmail.com
Cc: netdev@vger.kernel.org, mail@maciej.szmigiero.name,
 loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 nihaal@cse.iitm.ac.in, m.chetan.kumar@intel.com
Date: Fri, 27 Nov 2026 05:28:44 +0000
Message-ID: <179575732446.3135.7320223889201656739@kernel.org>
In-Reply-To: <20261124172627.41847-4-davidlwesten@gmail.com>
References: <20261124172627.41847-4-davidlwesten@gmail.com>
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

- [Medium] The patch fixes one reported case and changes behaviour for
  every platform.
- [Medium] With the FORCE_SLEEP doorbell fallback removed, the host sleep
  handshake is now the only way the modem learns about system suspend.
- [Medium] Every system suspend and resume now sends ENTER_SLEEP /
  EXIT_SLEEP over the IPC message ring whatever phase the modem is in.
- [Low] The commit says it removes the doorbell path.
- [Low] The patch removes the suspend-bit check from ipc_msi_interrupt()
  (drivers/net/wwan/iosm/iosm_ipc_irq.c), so every MSI now calls…

--

net: wwan: iosm: always send the host sleep message on suspend

This commit removes the BIOS WWAN _DSM RTD3 query and the FORCE_SLEEP /
FORCE_ACTIVE doorbell suspend path. With it gone, the PM callbacks always
use the ENTER_SLEEP / EXIT_SLEEP host sleep messages. It also drops the
suspend flag that gated MSI processing in ipc_msi_interrupt().

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_irq.c b/drivers/net/wwan/iosm/iosm_ipc_irq.c
> index 702f50a48151b..3b0576a54d5ca 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_irq.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_irq.c
> @@ -40,8 +40,7 @@ static irqreturn_t ipc_msi_interrupt(int irq, void *dev_id)
>  	if (instance >= ipc_pcie->nvec)
>  		return IRQ_NONE;
>  
> -	if (!test_bit(0, &ipc_pcie->suspend))
> -		ipc_imem_irq_process(ipc_pcie->imem, instance);
> +	ipc_imem_irq_process(ipc_pcie->imem, instance);
>  
>  	return IRQ_HANDLED;
>  }

[Severity: Low]

With the suspend bit check gone, every MSI now queues ipc_imem_tq_irq_cb.
That includes MSIs that arrive between the suspend and resume callbacks.

Nothing replaces the check in ipc_pcie_suspend_cb(). It doesn't call
disable_irq() or synchronize_irq() on the vectors, and it doesn't quiesce
the ipc_task tasklet or the imem hrtimers (td_update, td_alloc, adb,
fast_update).

suspend_device_irqs() in the noirq phase only syncs the hardirq handlers.
It doesn't wait for a tasklet that is already scheduled.

Suppose an MSI arrives after ENTER_SLEEP completes and queues the tasklet.
Can that tasklet then run ipc_imem_handle_irq() on another CPU while
pci_pm_suspend_noirq() moves the device into D3hot? If so:

ipc_imem_handle_irq()
  ipc_imem_phase_update()
    exec stage read from the scratchpad BAR returns all-ones
  ipc_imem_phase_update_check()
    default case -> UEVENT_CD_READY_LINK_DOWN

The tasklet can also issue doorbell writes to a device that is changing
power state, and it can re-arm the hrtimers.

The removed flag wasn't real synchronization either. The commit message
also notes that D3L2 already behaved this way. For platforms that used
the D0L1.2 path, though, IRQ processing during suspend is new.

Would it make sense to quiesce the vectors and the tasklet in the suspend
callback?

> diff --git a/drivers/net/wwan/iosm/iosm_ipc_pcie.c b/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> index 49052eb511baa..15563d4986d61 100644
> --- a/drivers/net/wwan/iosm/iosm_ipc_pcie.c
> +++ b/drivers/net/wwan/iosm/iosm_ipc_pcie.c

[ ... ]

> @@ -229,34 +225,6 @@ static void ipc_pcie_config_init(struct iosm_pcie *ipc_pcie)
>  	ipc_pcie->doorbell_capture = IPC_CAPTURE_PTR_REG_0;
>  }
>  
> -/* This will read the BIOS WWAN RTD3 settings:
> - * D0L1.2/D3L2/Disabled
> - */
> -static enum ipc_pcie_sleep_state ipc_pcie_read_bios_cfg(struct device *dev)
> -{
> -	enum ipc_pcie_sleep_state sleep_state = IPC_PCIE_D0L12;
> -	union acpi_object *object;
> -	acpi_handle handle_acpi;
> -
> -	handle_acpi = ACPI_HANDLE(dev);
> -	if (!handle_acpi) {
> -		pr_debug("pci device is NOT ACPI supporting device\n");
> -		goto default_ret;
> -	}
> -
> -	object = acpi_evaluate_dsm(handle_acpi, &wwan_acpi_guid, 0, 3, NULL);
> -	if (!object)
> -		goto default_ret;
> -
> -	if (object->integer.value == 3)
> -		sleep_state = IPC_PCIE_D3L2;
> -
> -	ACPI_FREE(object);
> -
> -default_ret:
> -	return sleep_state;
> -}

[Severity: Medium]

The reported case is a BIOS with no WWAN _DSM, where acpi_evaluate_dsm()
returns NULL. ipc_pcie_read_bios_cfg() also returned IPC_PCIE_D0L12 in two
other cases:

- there is no ACPI handle;
- the _DSM returns a value other than 3, i.e. firmware explicitly selects
  D0L1.2 or Disabled.

The patch removes the query entirely. It doesn't, for example, default to
D3L2 only when the _DSM is missing. So every platform whose firmware
explicitly asks for D0L1.2, and all XMM7560 systems (untested per the
commit message), now use the host sleep messages.

Is there evidence that these platforms work with ENTER_SLEEP /
EXIT_SLEEP?

The commit message argues:

  "The doorbells don't wait for the modem"

The replacement path doesn't reliably wait either. ipc_protocol_msg_send()
returns 0 when the completion times out:

	case 0:
		/* Timeout, there was no response from the device.
		...
		dev_err(ipc_protocol->dev, "msg timeout");
		ipc_uevent_send(ipc_protocol->pcie->dev, UEVENT_MDM_TIMEOUT);
		break;
	...
	return 0;

So ipc_protocol_suspend() records host_pm_state = IPC_MEM_HOST_PM_SLEEP
for an ENTER_SLEEP that the modem never acknowledged.

Platforms whose suspend callback used to return immediately can now block
for up to IPC_PM_ACTIVE_TIMEOUT_MS (500 ms) plus the
IPC_MSG_COMPLETE_*_TIMEOUT (500 ms). They can also emit
UEVENT_MDM_TIMEOUT. The commit message doesn't mention this.

The Fixes: tag points at the driver entry point. That means stable would
pick up this platform-wide change based on testing on one machine.

Could the change be limited to the case where the _DSM is missing?

[ ... ]

> @@ -340,43 +302,6 @@ static const struct pci_device_id iosm_ipc_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, iosm_ipc_ids);
>  
> -/* Enter sleep in s2idle case
> - */
> -static int __maybe_unused ipc_pcie_suspend_s2idle(struct iosm_pcie *ipc_pcie)
> -{
> -	ipc_cp_irq_sleep_control(ipc_pcie, IPC_MEM_DEV_PM_FORCE_SLEEP);

[Severity: Low]

This isn't a bug, but ipc_pcie_suspend_s2idle() and
ipc_pcie_resume_s2idle() were the only users of
IPC_MEM_DEV_PM_FORCE_SLEEP and IPC_MEM_DEV_PM_FORCE_ACTIVE. The constants
and their kerneldoc are still in enum ipc_mem_dev_pm_state in
iosm_ipc_pm.h:

 * @IPC_MEM_DEV_PM_FORCE_SLEEP:		DOORBELL-IRQ-FORCE_SLEEP.
 * @IPC_MEM_DEV_PM_FORCE_ACTIVE:	DOORBELL-IRQ-FORCE_ACTIVE.
 ...
	IPC_MEM_DEV_PM_FORCE_SLEEP = 7,
	IPC_MEM_DEV_PM_FORCE_ACTIVE,

The commit message says the doorbell path is removed. Should these be
removed too?

[ ... ]

> @@ -406,14 +331,10 @@ static int __maybe_unused ipc_pcie_suspend_cb(struct device *dev)
>  
>  	ipc_pcie = pci_get_drvdata(pdev);
>  
> -	switch (ipc_pcie->d3l2_support) {
> -	case IPC_PCIE_D0L12:
> -		ipc_pcie_suspend_s2idle(ipc_pcie);
> -		break;
> -	case IPC_PCIE_D3L2:
> -		ipc_pcie_suspend(ipc_pcie);
> -		break;
> -	}
> +	/* The PCI core may put the device into D3, so the modem has to be
> +	 * told with the host sleep message first.
> +	 */
> +	ipc_pcie_suspend(ipc_pcie);
>  
>  	return 0;
>  }

[Severity: Medium]

Without the FORCE_SLEEP doorbell, the host sleep handshake is now the only
way the modem learns about system suspend. Is its result checked anywhere?

ipc_pcie_suspend_cb()
  ipc_pcie_suspend()           <- always returns 0
    ipc_imem_pm_suspend()      <- void
      ipc_protocol_suspend()   <- bool, "false if suspend must be aborted"

The kerneldoc for ipc_pcie_suspend() says it returns a failure value on
error, but it always returns 0.

ipc_protocol_suspend() resets host_pm_state to IPC_MEM_HOST_PM_ACTIVE and
returns false in two cases:

- ipc_pm_wait_for_device_active() times out;
- ipc_protocol_msg_send_host_sleep() fails. That can be -EIO on a bad
  completion status, a full message ring in ipc_protocol_free_msg_get(),
  or a task-queue error.

In both cases suspend continues, and the PCI core can put the device into
D3hot without the modem being told. The new comment above says that must
not happen. The commit message says the same situation leaves the XMM7360
in CD_READY.

On the next resume, ipc_protocol_resume()->ipc_pm_prepare_host_active()
finds host_pm_state == IPC_MEM_HOST_PM_ACTIVE instead of
IPC_MEM_HOST_PM_SLEEP. It logs a dev_err and returns false. EXIT_SLEEP is
then not sent, and ipc_imem_phase_update_check() is skipped.

Separately, ipc_protocol_msg_send() returns 0 on a completion timeout. An
unacknowledged ENTER_SLEEP is therefore recorded as IPC_MEM_HOST_PM_SLEEP
and treated as success.

Before this patch, D0L1.2 platforms, including every platform without the
_DSM, always got the doorbell. This failure mode was limited to D3L2
platforms.

Should the callback fall back to the doorbell, or return an error to abort
suspend, when the handshake fails?

> @@ -427,14 +348,7 @@ static int __maybe_unused ipc_pcie_resume_cb(struct device *dev)
>  
>  	ipc_pcie = pci_get_drvdata(pdev);
>  
> -	switch (ipc_pcie->d3l2_support) {
> -	case IPC_PCIE_D0L12:
> -		ipc_pcie_resume_s2idle(ipc_pcie);
> -		break;
> -	case IPC_PCIE_D3L2:
> -		ipc_pcie_resume(ipc_pcie);
> -		break;
> -	}
> +	ipc_pcie_resume(ipc_pcie);
>  
>  	return 0;
>  }

[Severity: Medium]

Both callbacks now always send ENTER_SLEEP / EXIT_SLEEP over the IPC
message ring. None of ipc_imem_pm_suspend(), ipc_imem_pm_resume(),
ipc_protocol_suspend(), ipc_protocol_resume() or ipc_protocol_msg_send()
checks ipc_imem->phase or the exec stage.

Elsewhere, messages are only generated in IPC_P_RUN. For example,
ipc_imem_msg_send_device_sleep() is only called from the IPC_P_RUN branch
of ipc_imem_handle_irq().

What happens if the modem is in ROM/PSI/EBL, CRASH or CD_READY when the
system suspends?

- ipc_pm_init() starts with ap_state and host_pm_state both active, so
  ipc_pm_prepare_host_sleep() and ipc_pm_wait_for_device_active() pass.
- ipc_protocol_msg_hp_update() advances msg_head and rings the doorbell.
- In IPC_P_ROM, ipc_imem_handle_irq() returns after
  ipc_imem_rom_irq_exec() and never calls ipc_protocol_msg_process().
  The other non-RUN firmware stages don't service the ring either, so no
  response ever completes.
- ipc_protocol_msg_send() waits IPC_MSG_COMPLETE_BOOT_DEFAULT_TIMEOUT
  (500 ms), emits UEVENT_MDM_TIMEOUT and returns 0.

That adds about 1 s of blocking and two spurious MDM_TIMEOUT uevents to
each suspend/resume cycle.

Each cycle also leaves two ring entries that only the device can retire.
ipc_protocol_tq_msg_remove() only clears rsp_ring[], and only the device
advances msg_tail.

After about 63 such cycles (IPC_MEM_MSG_ENTRIES is 128), could
ipc_protocol_free_msg_get() start failing with "message ring is full"?
That would break the handshake and every other message.

Before this patch, D0L1.2 platforms only wrote the FORCE_SLEEP /
FORCE_ACTIVE doorbell in these phases, without waiting. The commit message
names CD_READY as a state the XMM7360 can be in, and a modem crash or
coredump also leads to CRASH / CD_READY.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124172627.41847-1-davidlwesten%40gmail.com

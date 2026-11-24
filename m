Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553434;
	b=VIWZWYRw5ONyhDrNdnz1nziZXI3b0R4ZYVFAK2xDna2BxZOZaxLXNmmKoMAwAdnxc2Pa
	 tECBucPLkWWU2oxISDgaKVsc45x/vaGIlDYXOYDwLkhLPa2lA261z4KsFLbJ8W8QXImBf
	 aL6+0m/cISYQrgGGb2CRkDaOMMigZkGAdxUmsItaYG+XSWiLY7Vw9VWYzP9ERiRn/d8mw
	 V+Fz+dRkGuvGQFXYUYBS5PRmMhxSC8yy7bziUC8VZTm9OjkVZT4Du8ZLehedq4eN+AIv4
	 WdbIZQwGt3ME1byNzUJJjvOjiqDhR6V6gAb1+h/5FaESgsFe4KwcQOrNOUGN9VRqSFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553434;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=swiMC0sCYIEe57PCuS9qwTHRSDt1xLva9+N0DcFokks=;
	b=Iv25X4tC279N17ZYpMAqwgfcqJeKVlXB1feBqqCWqwAl6NVfewOjWlS+9EAysDXCkQ/L
	 O31hoJfD7qxryFiA5ZOGKmp+x41dx9PFVVSvZd/WBSG7DMIErCqIbJE42wRVpx0LhvCQ1
	 kWS1zVjK7gUQ0yCu0KIr6/r49E108pHLlNDHKR1JTtUqU8FnC0WnxPM4HiwelprK+N/Hn
	 tW5wG/pDEZLQxl2UiYpo2ecbLTxG+zVfsjYSAvUIbW/BlUoHCaT7vryydntOc4GyZv+ie
	 X8su/ql8gLS93GovBTCzK4NQNhEm9qVMQMm420XSN7JnZOpAS3uZXwvBq3GncXb6hSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVNJYV5P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46961606A335
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVNJYV5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178701F000D1;
	Tue, 24 Nov 2026 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553433;
	bh=swiMC0sCYIEe57PCuS9qwTHRSDt1xLva9+N0DcFokks=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SVNJYV5Pn0RwGZaJc3ycvZl20BqP6sYPAskutDHQuLvrLEQYJFC7x1Qo59d99gqWT
	 I1hDRSI1WbZ/2VkThzmpH56EOYwJCDi9Kgeo2woZNYAiNRVB8EK+Mp2DA4J1Gra2oR
	 HTJ0wh/6p541t/evH+x1oqdRct87dkPwJd6AUYrddd0FWoaz4lymI0ZMtrhjfqU2K4
	 6eTsdUw0hRKIljNbj4BDua3agEa9aFkiYnvXwdPIgHklyWmih7Pw+TkAf5bwBVLwdD
	 iQ5BVGIimEwrV+ISEMcDKEkMHwcEzBkwFZCumVoiJDd0QBk/EaljB5hhxqLyliO4Rg
	 jWNoFxodTKJqA==
Subject:
 Re: [PATCH net-next] net: ipa: report TX_SUSPEND wakeups to the PM core
From: netdev-bot+sashiko@kernel.org
To: mick@yoxcu.de
Cc: elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 20:50:32 +0000
Message-ID: <179555343259.3135.14377815060069063563@kernel.org>
In-Reply-To: <20261120202930.345970-1-mick@yoxcu.de>
References: <20261120202930.345970-1-mick@yoxcu.de>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new pm_wakeup_event(ipa->dev, 0) call is placed in
  ipa_interrupt_process() (drivers/net/ipa/ipa_interrupt.c:98).
- [Low] The permanent commit message presents the change as restoring the
  wakeup reporting lost in 4b2274d3811a ("net: ipa: don't bother…
- [Low] The commit message names commit 4b2274d3811a ("net: ipa: don't
  bother aborting system resume") as the cause of the missing IPA wakeup…

--

net: ipa: report TX_SUSPEND wakeups to the PM core

This patch adds a pm_wakeup_event() call for the IPA device when
ipa_interrupt_process() handles the TX_SUSPEND interrupt. The goal is to
let user space attribute mobile data wakeups to the IPA wakeup source again.
That stopped working after commit 4b2274d3811a.

> Since commit 4b2274d3811a ("net: ipa: don't bother aborting system
> resume") the IPA driver reports no wakeup event. The IPA interrupt
> still wakes the system, but the wakeup source of the IPA device does
> not count it, so only /sys/power/pm_wakeup_irq shows the cause.

[Severity: Low]
Should this carry a Fixes: tag?

The commit message names 4b2274d3811a as the cause of the lost wakeup
accounting and describes a user-visible effect. However, there is no tag
like:

Fixes: 4b2274d3811a ("net: ipa: don't bother aborting system resume")

Without it, stable and backport tooling can't link this change to the
commit it says caused the regression. Whether net-next wants a Fixes tag
here is up to the maintainers.

If one is added, backporting the patch as written would also bring the
simulated TX_SUSPEND issue described below into stable kernels.

> Report a wakeup event when handling the TX_SUSPEND interrupt. This is
> pm_wakeup_event(), not a hard wakeup, so it does not abort a suspend
> in progress unless user space uses /sys/power/wakeup_count.

[Severity: Low]
Should the commit message say that the new call is not gated the way the
old one was?

The message of 4b2274d3811a says "a SYSTEM IPA power flag is used to avoid
calling pm_wakeup_dev_event() when runtime suspended". The call it removed
was inside a test_bit(IPA_POWER_FLAG_SYSTEM, ...) check.

The new pm_wakeup_event() in ipa_interrupt_process() runs on every
TX_SUSPEND. That includes TX_SUSPEND interrupts that arrive while the
system is fully awake and IPA is only runtime suspended after its
autosuspend delay. These now count as wakeup events for the IPA wakeup
source and for the global event counter.

The notes below the --- line discuss this, but that text won't end up in
git history. Readers of git log and backporters won't see the change in
what the IPA wakeup counters mean.

> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 766b094eb0694..547ed67930d61 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -92,6 +92,11 @@ static void ipa_interrupt_process(struct ipa_interrupt *interrupt, u32 irq_id)
>  		break;
>  
>  	case IPA_IRQ_TX_SUSPEND:
> +		/* Data arrived for a suspended endpoint. Report it as a
> +		 * wakeup event, so user space can see what woke the system.
> +		 */
> +		pm_wakeup_event(ipa->dev, 0);

[Severity: Medium]
Can this report a wakeup event when no interrupt fired at all?

The software workaround for the IPA v3.5.1 aggregation erratum also calls
ipa_interrupt_process() directly:

drivers/net/ipa/ipa_interrupt.c:
/* Simulate arrival of an IPA TX_SUSPEND interrupt */
void ipa_interrupt_simulate_suspend(struct ipa_interrupt *interrupt)
{
	ipa_interrupt_process(interrupt, IPA_IRQ_TX_SUSPEND);
}

That workaround runs from the driver's own suspend path. It triggers when
an RX endpoint has an aggregation frame open at the moment it is suspended:

ipa_suspend()
  pm_runtime_force_suspend()
    ipa_runtime_suspend()
      ipa_endpoint_suspend()
        ipa_endpoint_suspend_one()
          ipa_endpoint_program_suspend(endpoint, true)
            ipa_endpoint_suspend_aggr()
              ipa_interrupt_simulate_suspend()
                ipa_interrupt_process(interrupt, IPA_IRQ_TX_SUSPEND)
                  pm_wakeup_event(ipa->dev, 0)

ipa_endpoint_modem_pause_all(enable=true) reaches the same path for the
modem RX endpoints. In ipa_data-v3.5.1.c, AP_LAN_RX and AP_MODEM_RX have
aggregation enabled. That is the SoC this patch was tested on.

On these paths, the IPA wakeup source counters and the global
registered-wakeup-event counter go up while the device is going to sleep.
Suppose the power button or the RTC then wakes the system. Wouldn't user
space that compares wakeup source counters across the suspend cycle blame
IPA for that wakeup?

Also, if user space uses /sys/power/wakeup_count, events_check_enabled is
set. This event is registered during dpm_suspend(). Could it make later
pm_wakeup_pending() checks return true, so the system suspend aborts with
-EBUSY even though no wakeup arrived?

The new comment "Data arrived for a suspended endpoint" is also not true
for this caller.

Would it work better to report the event only on the real hardware IRQ
path? For example, it could go in ipa_isr_thread() when IPA_IRQ_STTS shows
TX_SUSPEND. Another option is a flag that ipa_interrupt_simulate_suspend()
doesn't set.

> +
>  		/* Clearing the SUSPEND_TX interrupt also clears the
>  		 * register that tells us which suspended endpoint(s)
>  		 * caused the interrupt, so defer clearing until after

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120202930.345970-1-mick%40yoxcu.de

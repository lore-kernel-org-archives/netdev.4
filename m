Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611928;
	b=enZYUB2VOYp3BDLQGWTPfRcGjkdosOWz5jv54h6CHYjXuf8WqaWYRlV3q1w8CsWXbSdg
	 IalV+OkYmYPs3OC8Pv3wI3to8rxQWIjjiZCQ9cDj20kq+1D2HDA0q09jvxQ4B29hHLXSb
	 K2f/qpUQ7avvYrqBzTzIQPmDuVTy8RAlAoK1vx3Bzd3W8quoVSMMGPEmpOaDPcpQH8WMF
	 eTgael+zgzSvmZMShDodnKVNies64Xtr0j2+6QOMLt1rKVCvyxmb/4itmZXBUByRBqETX
	 pj1VqO8+psIjWz2GRJgfGHCFW5euz+J0hcSVan7S140H0iWTdrSvQZj0zmTSohNC7PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611928;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cb239ZmeLmSEsCuh6/EjiC9521xJb4gEqgtsFrkLl3A=;
	b=ul4jufCxBMonXTDFzO+Pcq/FQB88P7huI1pbWSZ8j4u5cWmo5CF9pIsUe/2KvgJzkdGo
	 sBNq3zQ4zR56HJ/WQ3EerZTltWpOHUeQwMx2R2R1tJoglgnJ5WuLKxQBMMtIR/PEGiysY
	 4SBKxZogIWswLmsijawNwHs9QgSC/e/xU0BQmkly2fK71LbUNeN1qfOmvPU5W1CgKqazH
	 KvlvQHvoYmHGZ3lAlIwIeXbyQtrEswG+6saKpiDWTkEf3uIOIOb5lXHZDLNuNomYh6Bnn
	 5MGOaA3VTTk7HkTsqfiSU5o5eg7KZRk3LX6YUUhVkoBk2mweGfL70HchezbwW+3Hwqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsP5w1zR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D58606A333
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsP5w1zR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B541F000C4;
	Wed, 25 Nov 2026 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611928;
	bh=cb239ZmeLmSEsCuh6/EjiC9521xJb4gEqgtsFrkLl3A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WsP5w1zRc9MPqVn6NcSi2z47rzg/SRSwvg6uZcDdE/6HN5NldsA5QD66PbxwwKk9g
	 nNVssRs8Y3ZIQ3byFZ5Qsv9HOEcvR5062mYeY4LXgYE5vK1nYb1DbTAKv18//jrcis
	 g+Ib3bfHCkVSkvFKmhfib3TiUeQpYwCskGJXPIHFoSsgt7pr7e1N4rNHImZaD+8M6N
	 v7NrxKKKcBoH68aEZvQSizBnXQLEYcucI+XrB0FWqv4q99u+BeMJSx+yYpKwcS9+YK
	 302jryz9rFe+f/1jV5x5D9QE6VjBsu0KTVQQmKSgw2RMF7g3ERX9M1W8pOunN0cVEQ
	 Yx5OuWetDQt4A==
Subject: Re: [PATCH net-next RESEND v4 2/4] net: ethernet: oa_tc6: deliver the
 PHY interrupt to phylib
From: netdev-bot+sashiko@kernel.org
To: parthiban.veerasooran@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Date: Wed, 25 Nov 2026 13:05:27 +0000
Message-ID: <179561192720.3135.12144826803876923892@kernel.org>
In-Reply-To: <20261124124930.485323-3-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-3-parthiban.veerasooran@microchip.com>
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

Critical: 0 · High: 0 · Medium: 4 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] oa_tc6_phy_exit() (drivers/net/ethernet/oa_tc6.c:824) now
  calls cancel_work_sync(&tc6->phy_irq_work) for every user that does…
- [Medium] Each PHYINT event makes oa_tc6_process_extended_status() set
  OA_TC6_INT_MASK0_PHY_INT_MASK in hardware (oa_tc6_phy_irq_mask_hw(),…
- [Medium] After handle_nested_irq() lets the PHY driver read and ack
  STS1, oa_tc6_phy_irq_work() clears PHYINTM via…
- [Medium] net: ethernet: oa_tc6: repeated PHY_INT handling when already
  masked

--

net: ethernet: oa_tc6: deliver the PHY interrupt to phylib

This commit exposes the in-band OA TC6 PHY interrupt (STATUS0.PHYINT) to
phylib as a nested virtual IRQ, gated by a new OA_TC6_PHY_INT quirk flag.
A custom irq_chip writes the PHYINTM mask bit over SPI from
irq_bus_sync_unlock. PHY interrupt dispatch is deferred to a work item:
the hardware source is masked when PHYINT is seen, and unmasked after
handle_nested_irq() runs.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 8e86cfde6d1c8..da4df6feafa9e 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c

[ ... ]

> @@ -531,6 +538,178 @@ int oa_tc6_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,

[ ... ]

> +static void oa_tc6_phy_irq_work(struct work_struct *work)
> +{
> +	struct oa_tc6 *tc6 = container_of(work, struct oa_tc6, phy_irq_work);
> +	int ret;
> +
> +	/* Dispatched off the SPI chunk-processing thread so that
> +	 * phy_interrupt() taking phydev->lock and issuing synchronous SPI
> +	 * control transfers from PHY handle_interrupt() cannot stall the single
> +	 * thread pumping TX/RX data chunks.
> +	 */
> +	handle_nested_irq(tc6->phy_virq);
> +
> +	ret = oa_tc6_phy_irq_unmask_hw(tc6);
> +	if (ret)
> +		dev_err(&tc6->spi->dev, "Failed to unmask PHY interrupt: %d\n",
> +			ret);

[Severity: Medium]
Does this path act on PHYINT again for every remaining chunk of the
same transfer?

oa_tc6_process_spi_data_rx_buf() walks all no_of_rx_chunks footers of
a transfer that has already been clocked in. If PHYINT was pending,
every one of those footers has EXST set.

Chunk 0 gets here, sets PHYINTM through oa_tc6_phy_irq_mask_hw() and
schedules phy_irq_work. Writing value back to STATUS0 does not clear
PHYINT, though. It reflects the PHY's own status and stays set until
the PHY driver acks it from the worker.

So for chunks 1 .. no_of_rx_chunks - 1 the STATUS0 read returns
non-zero again and the !value early return is skipped. Each chunk then
does a STATUS0 write plus a read and a write of INT_MASK0. That is four
synchronous control transfers per chunk on the realtime thread that
pumps TX/RX data, which is the cost the masking was meant to avoid.

The repeated schedule_work() is also not always a no-op. The workqueue
clears the pending bit before calling oa_tc6_phy_irq_work(). If the
worker is already running on another CPU and has not yet acked the
PHY, this queues it a second time. The second run calls
handle_nested_irq() with nothing pending, the PHY driver returns
IRQ_NONE, and note_interrupt() counts it as unhandled.

The commit message says a reschedule on an already-pending work item
can't duplicate an event. That only holds while the work is still
pending, not while it is executing.

The same thing happens outside the multi-chunk case. Say genirq has
masked the IRQ, so phy_irq_masked is true (for example after
disable_irq() from phylib), while the PHY line is still asserted. Any
other STATUS0 event, such as an RX buffer overflow, will then see
PHYINT here, mask it again over SPI and schedule the worker anyway.

Would it make sense to skip this block when PHYINTM is already set?
One way would be to keep a shadow of the hardware mask bit under
phy_irq_lock, and also to ignore PHYINT while phy_irq_masked is true.

[Severity: Medium]
If oa_tc6_phy_irq_unmask_hw() fails here, does the PHY interrupt stay
masked in hardware for good?

On every PHYINT event, oa_tc6_process_extended_status() sets
OA_TC6_INT_MASK0_PHY_INT_MASK through oa_tc6_phy_irq_mask_hw() before it
schedules this work:

	if (tc6->phy_virq && FIELD_GET(OA_TC6_STATUS0_PHY_INT, value)) {
		ret = oa_tc6_phy_irq_mask_hw(tc6);
		...
		else
			schedule_work(&tc6->phy_irq_work);
	}

This worker is the only place that clears the bit again. Either SPI
control transfer inside oa_tc6_phy_irq_unmask_hw() can fail, with a
spi_sync() error or with -EPROTO from the control reply echo check. In
that case the worker logs and returns. It does not retry or reschedule.

phy_irq_masked stays false, so genirq and phylib treat the IRQ as
enabled. oa_tc6_phy_irq_bus_sync_unlock() only runs on enable_irq(),
disable_irq(), request_irq() or free_irq(), none of which happen in
steady state. phydev->irq is valid, so phylib does not poll either.

Would later link and PLCA status changes then be lost until the
interface is rebound or goes through suspend/resume?

[Severity: Medium]
Can a PHY event that latches while PHYINTM is set be missed here?

handle_nested_irq() lets the PHY driver read and ack its status. After
that, this worker clears PHYINTM. It does not re-read STATUS0, and it
does not wake the SPI thread (int_flag plus wakeup) to look for a
PHYINT that became pending while the mask was set.

Take an event that arrives between the PHY driver's ack and the
INT_MASK0 write. It is only seen if the MAC-PHY re-asserts IRQn when an
already-set status bit is unmasked. PHYINT is only noticed from a footer
with EXST set. Otherwise the SPI thread runs only on IRQn or pending TX,
so on an idle link the event could stay unprocessed.

The commit message says:

    PHYINT is level triggered and stays asserted until acked, so a no-op
    reschedule on an already-pending work item can't lose or duplicate an
    event.

Does this cover the MAC-PHY IRQn side, or only the PHY-side source?

phylib's resume path has the same dependency. mdio_bus_phy_resume()
does:

	enable_irq(phydev->irq);
	irq_wake_thread(phydev->irq, phydev);

irq_wake_thread() only does something when action->thread is set. That
is not the case for the nested-thread IRQ created with
irq_set_nested_thread() in oa_tc6_phy_irq_map(). So a PHY interrupt
postponed during suspend would only be delivered again if the hardware
re-signals after the unmask in oa_tc6_phy_irq_bus_sync_unlock().

Would it make sense to re-check STATUS0, or kick the SPI thread, after
unmasking?

> +}

[ ... ]

> @@ -624,6 +821,7 @@ static void oa_tc6_phy_exit(struct oa_tc6 *tc6)
>  	if (tc6->quirk_flags & OA_TC6_BROKEN_PHY)
>  		return;
>  
> +	cancel_work_sync(&tc6->phy_irq_work);

[Severity: Medium]
Can this hit the WARN_ON(!work->func) in __flush_work() when
OA_TC6_PHY_INT is not set?

The only INIT_WORK() for phy_irq_work is in oa_tc6_phy_irq_setup(). That
function is only reached from oa_tc6_mdiobus_register() when the quirk
is set:

	if (tc6->quirk_flags & OA_TC6_PHY_INT) {
		ret = oa_tc6_phy_irq_setup(tc6);

In this commit lan865x_probe() still does:

	priv->tc6 = oa_tc6_init(spi, netdev, NULL);

so quirk_flags is 0 and phy_irq_work is still zeroed from
devm_kzalloc. Teardown then goes:

lan865x_remove()
  oa_tc6_exit()
    oa_tc6_phy_exit()
      cancel_work_sync(&tc6->phy_irq_work)
        __cancel_work_sync()
          __flush_work()
            WARN_ON(!work->func)

The same applies to the lan865x_probe() error paths after
oa_tc6_init(). It also applies to the phy_exit label inside
oa_tc6_init() itself, which is taken when oa_tc6_enable_data_transfer(),
oa_tc6_update_buffer_status_from_register() or
devm_request_threaded_irq() fails.

The next patch, "microchip: lan865x: enable PHY interrupt via virtual
IRQ", makes lan865x pass OA_TC6_PHY_INT, which removes the in-tree
trigger at the end of the series. But oa_tc6_init() still accepts
quirks == NULL, and this patch on its own breaks bisection.

Could INIT_WORK() be done unconditionally in oa_tc6_init(), next to
mutex_init(&tc6->phy_irq_lock)? Alternatively, cancel_work_sync() here
could be gated on OA_TC6_PHY_INT or tc6->phy_virq.

>  	phy_disconnect(tc6->phydev);
>  	oa_tc6_mdiobus_unregister(tc6);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124124930.485323-1-parthiban.veerasooran%40microchip.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798090;
	b=iMFGUdjWvlt1sMaebrn4xNcbCxtmb2jiivcdqT64vdcqbg5rgaw8zoUFS2w9Ennr4SHX
	 1m5dIDnl2qeXXLfH+DkiKmEJ8m3XoHLeY1OOVGbsZFId20eJt48l7C6nCnj3q+OmO/lA3
	 joLwfwOmtuRXDOwqQwFBO8ay9gj5e+7YITrHc320EERrY/jj2J1bwrQ0jfGWE05B+H1ir
	 vLsdp1Qi0yZk3wvc5U1cMUcG2R6mJ4/B1U6uqUD4QbWO3EIjlOHCkBWxs7C+DgRIOCSSb
	 emT5pRv80WBKIWu8IJZJ9vCCknCDzPnRgrhmeO9x0GLHoGnKqqqWDCX7Na6AEobrPqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798090;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8Ke+lb+1/p0hY589hNN4tsTtbrPsUQfS/DCt9JyRMhk=;
	b=5HaapmoEv2qUijOjf3s1kLSyyp20GaDbPh861AvPXEfsuJY6u/RTptxy21FK3MbcXASz
	 Qj0Kc9lTo1nwSlJIcrRJUXdWIYfSAdSPkYTR5tRL1f5u9U9FhHGUyXuDpGsis+WgZO7G2
	 dp4FF8OBHVPycSIQdU/XNl/QNoh2Noh6hGZrHBz1SrJqEd9gOfv99Y2v3tS5hrr9eB8mv
	 CtLZYqAD+SEasvew9r90VSfxo41Wp5XI1RyNF26oQKpQVM8hbjxXf3c/Eyk4hBSrm2qJ5
	 YKJNQrFwCH7N4uS3D9H4kz1IHsawTQeeq+//rKKi/ne5mzakqAdcRJm1xyGWfh3la/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2hNAAq2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CF060A2609;
	Fri, 27 Nov 2026 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2hNAAq2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996CC1F00939;
	Fri, 27 Nov 2026 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798089;
	bh=8Ke+lb+1/p0hY589hNN4tsTtbrPsUQfS/DCt9JyRMhk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=o2hNAAq2196yAnzTH4O21oHqlz/sFA/C4h66bdw9rV1WygWFvv3hTMokfm9Yzj0Qf
	 mrMoKSEcuxrAJJZnQn6F6g8WsTAbd3AsFLhssBMLO3/X+fHrdbvbka2zajFB134oGr
	 srqX11J7zFmdnnpyMrk783cGA89sCmvLQ10pmsCdqE9jWjdRjXu9gVETaA9FVkZFoG
	 t/GHla8toozFAKGMJlYS2X23fHKmtWS7LlCgL854DFfdcZmp6QXVEJ9lgXz1LjwLd9
	 FcvAcDAwzz27CcNFFBikI8oCSqEYRCjS+ctiPC4o3p/E4zFM+CFNxOHdjRrOhh2Sci
	 vGeGSl4M6xj6A==
Subject:
 Re: [PATCH net v6 8/8] ptp: ocp: defer timestamp shutdown to clock unregister
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:48:08 +0000
Message-ID: <179579808820.3135.11076556680747243483@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-8-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-8-ahmadexp@gmail.com>
X-sashiko-severity: Critical
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

Critical: 1 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] In ptp_ocp_detach() (drivers/ptp/ptp_ocp.c), the patch
  removes the explicit ptp_ocp_ts_enable(bp->ts0..ts4, 0, false) and…
- [High] Removing ptp_ocp_ts_enable(bp->pps, ~0, false) from
  ptp_ocp_detach() leaves the core's PTP_CLK_REQ_PPS request as the only…
- [Medium] The commit is not self-contained but has a Fixes: tag for
  627366c51145 ("ptp: ocp: fix resource freeing order").

--

ptp: ocp: defer timestamp shutdown to clock unregister

This patch removes the explicit ptp_ocp_ts_enable() calls for ts0..ts4 and
pps from ptp_ocp_detach(). It relies on the PTP core unregister path to
disable the timestamp channels once the user interfaces are gone. The
commit message says it depends on a separate PTP core teardown series.

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org

> This driver patch depends on the separate PTP core teardown series.

[ ... ]

> Fixes: 627366c51145 ("ptp: ocp: fix resource freeing order")

[Severity: Medium]
Which series does this refer to? The only Link: tag points to a single
lore message, not a patch series. There is also no commit ID or stable
dependency note for the prerequisite.

In this tree, ptp_disable_all_events() and ptp_clock_unregister() do not
seem to contain the core change this patch relies on.

The Fixes: target 627366c51145 is the commit that added the early-disable
block being removed here. Because of the Fixes: tag, could stable tooling
pick up this patch without the core series? That would bring the
timestamp IRQ regression described below into stable kernels.

Could the prerequisite be named explicitly, or this patch be sent as part
of the core series?

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 0405188951768..27cf3ab3327c4 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5768,19 +5768,6 @@ ptp_ocp_detach(struct ptp_ocp *bp)
>  	ptp_ocp_detach_sysfs(bp);
>  	ptp_ocp_attr_group_del(bp);
>  	timer_delete_sync(&bp->watchdog);
> -	/* Disable interrupts on all timestampers */
> -	if (bp->ts0)
> -		ptp_ocp_ts_enable(bp->ts0, 0, false);
> -	if (bp->ts1)
> -		ptp_ocp_ts_enable(bp->ts1, 0, false);
> -	if (bp->ts2)
> -		ptp_ocp_ts_enable(bp->ts2, 0, false);
> -	if (bp->ts3)
> -		ptp_ocp_ts_enable(bp->ts3, 0, false);
> -	if (bp->ts4)
> -		ptp_ocp_ts_enable(bp->ts4, 0, false);

[Severity: Critical]
Does ptp_disable_all_events() in this tree actually disable these
channels? It only handles pins whose function is PTP_PF_EXTTS, plus one
PPS request:

drivers/ptp/ptp_chardev.c:ptp_disable_all_events() {
    ...
	for (i = 0; i < info->n_pins; i++)
		if (info->pin_config[i].func == PTP_PF_EXTTS)
			ptp_disable_pinfunc(info, info->pin_config[i].func,
					    info->pin_config[i].chan);

	/* Disable the PPS event if the driver has PPS support */
	if (info->pps) {
		struct ptp_clock_request req = { .type = PTP_CLK_REQ_PPS };
		info->enable(info, &req, 0);
	}
    ...
}

ptp_ocp has n_ext_ts = 6 but only 4 pins. ptp_ocp_set_pins() allocates
the pins zeroed, so by default they are all PTP_PF_NONE.

EXTTS channels can be enabled by index with no pin assigned. Both
ptp_extts_request() (PTP_EXTTS_REQUEST) and extts_enable_store() do this,
and nothing disables the channel when the fd is closed.

For bp->pps, the core request becomes
ptp_ocp_ts_enable(bp->pps, OCP_REQ_PPS, false). If OCP_REQ_TIMESTAMP
(EXTTS index 5) is also set, pps_req_map stays non-zero. The "no state
change" shortcut then returns early and the PPS/TS5 timestamper stays
armed.

In all of these cases the interrupt is still unmasked and requested when
ptp_clock_unregister() does its final put_device(). That put runs
ptp_clock_release():

drivers/ptp/ptp_clock.c:ptp_clock_release() {
    ...
	bitmap_free(tsevq->mask);
	kfree(tsevq);
	debugfs_remove(ptp->debugfs_root);
	xa_erase(&ptp_clocks_map, ptp->index);
	kfree(ptp);
}

bp->ptp is not cleared. The IRQ is only disabled and freed later, one
source at a time, in ptp_ocp_unregister_ext():

	ext->info->enable(ext, ~0, false);
	pci_free_irq(ext->bp->pdev, ext->irq_vec, ext);

Can a timestamp interrupt in that window write to freed memory?

ptp_ocp_ts_irq()
    ptp_clock_event(ext->bp->ptp, &ev)     /* PTP_CLOCK_EXTTS */
        spin_lock_irqsave(&ptp->tsevqs_lock, flags);
        list_for_each_entry(tsevq, &ptp->tsevqs, qlist)
            enqueue_external_timestamp(tsevq, event);

One way to hit this: enable a channel with "echo '0 1' > extts_enable",
feed a 1PPS signal on the input, then unbind or remove the device.

This seems to reopen the use-after-free that 627366c51145 ("ptp: ocp: fix
resource freeing order") closed.

> -	if (bp->pps)
> -		ptp_ocp_ts_enable(bp->pps, ~0, false);
>  	if (bp->ptp)
>  		ptp_clock_unregister(bp->ptp);

[Severity: High]
With this call gone, is an in-flight PPS interrupt still drained before
pps_unregister_source()?

The only teardown disable left for the PPS event is the core's
PTP_CLK_REQ_PPS request. It goes through
ptp_ocp_enable()->ptp_ocp_ts_enable(bp->pps, OCP_REQ_PPS, false).

If OCP_REQ_TIMESTAMP is also set in pps_req_map, the map stays non-zero.
The function then returns before the intr_mask write and before
synchronize_irq():

drivers/ptp/ptp_ocp.c:ptp_ocp_ts_enable() {
    ...
		/* if no state change, just return */
		if ((!!old_map ^ !!bp->pps_req_map) == 0)
			return 0;
    ...
}

A ptp_ocp_ts_irq() already running on another CPU may have seen
OCP_REQ_PPS set. pps_req_map is a plain field, written under pincfg_mux
and read without a lock in hardirq context:

drivers/ptp/ptp_ocp.c:ptp_ocp_ts_irq() {
    ...
		if (ext->bp->pps_req_map & OCP_REQ_PPS) {
			ev.type = PTP_CLOCK_PPS;
			ptp_clock_event(ext->bp->ptp, &ev);
		}
    ...
}

Meanwhile ptp_clock_unregister() continues:

	ptp_disable_all_events(ptp);
	...
	if (ptp->pps_source)
		pps_unregister_source(ptp->pps_source);

Could pps_event(ptp->pps_source, ...) still be running in that handler
when pps_unregister_source() tears down and frees the pps_device?

Before this patch, the req = ~0 call always set pps_req_map to 0. The
source was masked and synchronize_irq() ran before ptp_clock_unregister().

>  	kfree(bp->ptp_info.pin_config);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com

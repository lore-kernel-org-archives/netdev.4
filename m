Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558228;
	b=XIMKEe+1PsJiqhyKwp8mGt9vZ4h4k5nDsMfD+cM8YnocurBmYmjW/9D6K5bnzxItiWxn
	 GXH8y0ZU9nqdtkeOxcGxnoWVdmCDPRo9CIs5oqtdWmPx3UGMtvRIxqzsWC3UX9Lc7fHgN
	 auXi4TewfXdMvYnX/gumdTIe37gnvYPji8y8B4fsPEnwZ3cmFlTuZSbzi54ZL9IQf/HxQ
	 l8VJdm2fcFsaKt2fJVcfwHh9nB8irO7BVpZUUMkdi2rk09Rlq+h+hyLWZWnJogJdON7Nc
	 zTwcAxyJUo2LE09yrFVC856VJOw2xE7y/KgZcrvHa43Ji5AA2PiSDrJMj+XRKCE8arA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558228;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xleNooB4+khmhvkX52menMQ5KHxben7USrPvrFmefK8=;
	b=djL7ObzfAy+7hlsAPEefh++c4DbpQFQ8Xu8s/QfFhj8QY1e4fazUlmtwPMI+4KyYt9xl
	 +CaCj69GamRRstY9gSAQSxXRe91Cbig+LFIxQJGYFHCl06OXSPIYwwqbpezPbtWulAVTT
	 73LwLpyGFMSLZNFK27LePkp/s/bu2A/b4S3UK/M9fxYoM2wrx/iE0EiGWFGiRzfVDkuIE
	 LOWl4MMrSgAtaKrGLAONMstQdWQInqNEbCGE4u3ixuCNp8vqa+ZovaEYxrhHn3CaiMRqp
	 o9GkTyLfogSV/mMSTZlDpKV027PMConviOyhuB+oFPxk5BW30n6TwnL6PVjVvpErj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JXpizG0z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FEF60A6F5E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JXpizG0z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26B31F02834;
	Tue, 24 Nov 2026 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558228;
	bh=xleNooB4+khmhvkX52menMQ5KHxben7USrPvrFmefK8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JXpizG0zQS+B23laoF8O+h5czPjMVk9xMdjcmvJab/QckI3uA1pUqVcp3TCCc5q7g
	 Xvdb3myqCp8MC0jUtkOPztmcNL5YKkuJ58v3Id2SJ/qnwftZj/pMEpX0wnnH9vjHl8
	 fbdT0uPfx63bk04+SFGoMSLQXZyj/lvj9VuDhCUNrw6+hsRmDXheU6F6YhT5YjedTi
	 EIYQZ6FmsfNuQcs+ygslW3rDSDeKhlPU5HVSvJCNniipkTt9sEk44QqxnvhDKG+H4m
	 S1evIZga273qAOpGQvfnt3wYW33O+Jbc0dFgUJa7iuQNHjKi1RHGb6wWtxBkPziUPj
	 HnNbeFn1Urwfw==
Subject: Re: [PATCH net v3 3/4] ptp: ocp: report disabled SMA inputs
 consistently over DPLL
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com
Date: Tue, 24 Nov 2026 22:10:27 +0000
Message-ID: <179555822748.3135.10487682659847621386@kernel.org>
In-Reply-To: <20261120-timecard-common-v3-33316bf475-3-ahmadexp@gmail.com>
References: <20261120-timecard-common-v3-33316bf475-3-ahmadexp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix keys only on the software flag `sma->disabled`, and
  nothing rebuilds that flag from hardware at probe.
- [Low] The testing and provenance paragraphs of the changelog are the
  same text used in the other patches of the series.

--

ptp: ocp: report disabled SMA inputs consistently over DPLL

This commit changes ptp_ocp_dpll_frequency_get() so that a disabled SMA
input uses SMA_DISABLE before the selector table lookup, which is what
the sysfs show path already does. Before this, a disabled input read
back as 10 MHz, and the DPLL core skipped a later 10 MHz set as
unchanged.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> Reported by the netdev Sashiko AI review and confirmed by code
> inspection. Source-derived C regression tests pass with ASan/UBSan;
> restoring the faulty selector, mask, disabled-state or DCF value makes
> the corresponding regression fail. Tests use stubbed MMIO, not hardware.

[ ... ]

> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.

[Severity: Low]
Do these paragraphs describe this commit? They look like the same
testing and provenance text used in the other patches of the series.

This patch only adds the disabled-state substitution in
ptp_ocp_dpll_frequency_get().

It doesn't change the selector handling or SMA_SELECT_MASK. That work
is in the earlier patch "ptp: ocp: use hardware selectors in DPLL
frequency operations".

It also has nothing to do with removal ordering. That is in "ptp:
disable all timestamp channels after removing the user interfaces".

At this commit the DCF output entry still has the old value:

drivers/ptp/ptp_ocp.c:ptp_ocp_sma_out[] {
    ...
	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
    ...
}

The following patch, "ptp: ocp: correct the DCF output frequency",
fixes that value. So a DCF regression test would fail on this tree by
itself.

Could the changelog describe only the testing that applies to this
change?

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 95a4df468e793..653c3b1ca0668 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5889,6 +5889,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
>  	val &= SMA_SELECT_MASK;
> +	if (sma->mode == SMA_MODE_IN && sma->disabled)
> +		val = SMA_DISABLE;

[Severity: Medium]
Can a disabled input still be reported as 10 MHz after the driver is
unbound and rebound?

The new check looks only at the software flag sma->disabled. Disabling
an input in ptp_ocp_sma_store_val() writes 0 to the whole input field,
and that also clears SMA_ENABLE:

drivers/ptp/ptp_ocp.c:ptp_ocp_sma_store_val() {
    ...
	if (!sma->fixed_dir)
		val |= SMA_ENABLE;		/* add enable bit */

	if (sma->disabled)
		val = 0;
    ...
}

On rebind, bp is allocated zeroed, so disabled starts out false.
ptp_ocp_sma_fb_init() uses bit 15 of the gpio registers only to pick
the direction:

drivers/ptp/ptp_ocp.c:ptp_ocp_sma_fb_init() {
    ...
		reg = ioread32(&bp->sma_map1->gpio2);
		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
    ...
}

Take SMA3 or SMA4 on a board where the direction can be changed.
Switch it to input, disable it, then rebind the driver. The pin comes
back as SMA_MODE_IN with disabled == false.

In ptp_ocp_dpll_frequency_get(), the line "val &= SMA_SELECT_MASK"
drops bit 15. In hardware, that bit is the only thing that tells
disabled (0x0000) apart from enabled 10 MHz (0x8000).

The new check doesn't fire, and the lookup matches the "10Mhz" entry.
A DPLL request for 10 MHz then returns early here:

drivers/dpll/dpll_netlink.c:dpll_pin_freq_set() {
    ...
	if (freq == old_freq)
		return 0;
    ...
}

The input stays disabled, which is the failure the changelog says this
patch fixes.

This assumes the FPGA mux registers keep their value across
unbind/rebind. Probe doesn't seem to reset them, but this hasn't been
confirmed on hardware.

Would it work to check the raw SMA_ENABLE bit for !sma->fixed_dir pins
before masking? Another option is to set sma->disabled from that bit in
ptp_ocp_sma_fb_init().

>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-timecard-common-v3-33316bf475-0-ahmadexp%40gmail.com

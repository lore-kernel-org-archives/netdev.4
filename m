Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470591;
	b=HuI3hN0Zm37o2k7CnHowdJRpg4VxhU5XuOAsJobYYZ/FrlbqYvxz82GaSnfTYqVgq8XN
	 zSRTS7/CKKyZxeTRdNZNslVExPi43lbr3MZhvA3hIdLD3QdbA+U612Cqy13OoeTl/U7kX
	 /vB+0LmzZ8OQ5zrfuF10kHIl2MqqqoppXbyf91qGEteVvZQoyQKxZlATU7AM4cJdhwY1N
	 uXq9/0Ic0nn6USj6EtQYrZQx7NPhxeFgsv0LsK+LnqAYKII3wSdO/urJvMoN1zC8He5mv
	 3MEznnIGj65kdmQnl6PoW5gN1faaHjAZo+ybtd7dB9c5LjdHuesmPn94y/Jzk5jKcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470591;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QrFUMSrKSleS/Wwb2hljMLvHevzUYp64FuEocfjRNn8=;
	b=kZLUSrUQlRzUzkaMTaWyODJHRPwD7/GtEMjg4rf5m+3JSiD9thyflifEhA8HueOG0Jad
	 /62ctNeQFBlEJCWPvJr8YrFGxiIjz1kcWSM7UOx4LRhwZudr71lmQVUi3g5hmFwUTKl8O
	 9Cv38JrvW70BnMaSbPqPTlh8fWAtAI3PV+PgqH+JiRfueJnKd1GH6fCTE7GKTPI5YLXgE
	 i+cN9bNdEugYuxWt0ynxLYf13xzLiipWFH7gddsUdzLUNxOBMMm07hQBVGwpHgriYEskv
	 9LcHIi3gJulCENoEUkadHBJDLvU8QhxIeRUR1QRzOANi9pBSH35KQK6Abh6o6Dg1M9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZC5JV7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FF606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZC5JV7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1A41F000D0;
	Mon, 23 Nov 2026 21:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470591;
	bh=QrFUMSrKSleS/Wwb2hljMLvHevzUYp64FuEocfjRNn8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WZC5JV7vM959MkMREW8Bsa1niUZYNVeaR5AJON4R2g9H+tivP+6Hk6F6gBmOetHAf
	 5CzKt1Dczniig5xavZmYHNtsh0b/kLJWd+MpAWpMi8nAu6utH0YRLQbbKoHzC7mp9O
	 XLjo8YXrbEKp4VA8+fZCpMC67bVeo3FkBb7Jfpwa3084x637hmhBKLOhyJz7GkA3i1
	 qzLiQGu8BHSRco1tQ6MkvGnZv//OX7nryvoTdlnQLG9HbYiAM3idCXJc5pCCli1VtG
	 UNN2N1WBOPGjI5ESraIPY2cWNcBXnOO87PD78l0ZLumIe8PPsbuShroBvYHetNLBz8
	 h75f/tTz5h7vQ==
Subject: Re: [PATCH net v2 2/4] ptp: ocp: use hardware selectors in DPLL
 frequency operations
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 richardcochran@gmail.com, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com
Date: Mon, 23 Nov 2026 21:49:50 +0000
Message-ID: <179547059011.3135.15780033567922335113@kernel.org>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-2-ahmadexp@gmail.com>
References: <20261119-timecard-common-v2-078fe69f33-2-ahmadexp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On ADVA TimeCard X1 boards (PCI_DEVICE_DATA(ADVA, TIMECARD_X1)
  -> ocp_adva_x1_sma_op), DPLL get and dump can still fail for an…

--

ptp: ocp: use hardware selectors in DPLL frequency operations

The DPLL frequency_set op now passes the selector table value to
ptp_ocp_sma_store_val() instead of the table index. The frequency_get op
now masks the readback with SMA_SELECT_MASK before the table lookup, so
the direction enable bit does not prevent a match.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 4c98558e96b9c..f1f97c1fa0978 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c

[ ... ]

> @@ -5921,6 +5922,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  	int i;
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
> +	val &= SMA_SELECT_MASK;
>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {

[Severity: High]
Does this fully fix the get/dump failure on ADVA TimeCard X1 boards? The
commit message says:

    Mask the direction enable bit before the frequency lookup. Otherwise an
    enabled, direction-configurable pin has no matching table entry and its
    DPLL get or dump fails. Apply both corrections to all board variants.

ptp_ocp_dpll_direction_set() switches a pin to input with selector 0:

    return ptp_ocp_sma_store_val(bp, 0, mode, sma_nr + 1);

When the direction is not fixed, ptp_ocp_sma_store_val() adds the enable
bit:

    if (!sma->fixed_dir)
        val |= SMA_ENABLE;

The hardware therefore holds 0x8000. With the new mask, the readback in
ptp_ocp_dpll_frequency_get() becomes 0. However, ptp_ocp_adva_x1_sma_in[]
has no 0x0000 entry:

    static const struct ocp_selector ptp_ocp_adva_x1_sma_in[] = {
        { .name = "PPS1",  .value = 0x0001,      .frequency = 1 },
        ...
        { .name = "None",  .value = SMA_DISABLE, .frequency = 0 },

The "None" entry is BIT(16), and SMA_SELECT_MASK clears that bit. The
lookup finds no entry and returns -EINVAL.

On X1 the direction is configurable (sma_map2->gpio2 != 0xffffffff in
ptp_ocp_sma_fb_init()). In that case, does a direction change to input
through DPLL leave the pin in a state that frequency_get cannot decode?

If so, the error has three effects:

dpll_msg_add_pin_freq() passes the error up, so DPLL_CMD_PIN_GET fails
for that pin.

dpll_nl_pin_get_dumpit() only skips -ENODEV, so a system-wide pin dump
also stops with -EINVAL.

dpll_pin_freq_set() calls frequency_get() before frequency_set(). It
fails with "unable to get old frequency value", so the pin cannot be
moved to a valid frequency through DPLL either. The only way to recover
is through sysfs.

A later commit in the series, "ptp: ocp: report disabled SMA inputs
consistently over DPLL", maps disabled inputs to SMA_DISABLE ("None").
That handles the disabled-input case. The override only applies when
sma->disabled is set, though, and direction_set leaves disabled false.
So the direction_set case still appears to fail at the end of the series
(d6d7d7a64ee6).

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-timecard-common-v2-078fe69f33-0-ahmadexp%40gmail.com

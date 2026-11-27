Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799379;
	b=fKUjT6wi24dfPpHZo1fFsmq/Oo99kOCFUoWOcVZ0N6XXUMf+L/mOXkOSzXp8pe7AFEE6
	 eNkSsuYQY8ek/hOMFb+2hF/aTXc+ulMrvJGqDXs3YZ1NJo0PKbISI/mCDmw/gGxv+TtP5
	 88mVPR3pUUvjE0mZtEjGiT6H+NLkP9I0lqCxSJqqIkZw+ZsnyjLXbd2HXg60jvM5+/Bwh
	 z2s7he5AiWN7KbE/p09OKkeKYU/RRyH7eV9KGK+bvE6cYmrvZ9OujFlqzs/Wa94CFMcz9
	 GfhpfYJeXzvIfMZifr35KkT6UMUbJhOAsFP+irGT7mSnqkx/sPkU5KEcB8CDAecR0ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799379;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mPrvCeTG1UkibyQxzQG6FzyncQlcTDruhe1450GNYSE=;
	b=q3pxG/ESg27kdRmzsIBRTmljidg+iENK7iiDFiy5lFCtEgOrRJV024gg1Gs5o3MthJw8
	 fDB7F1tu2v4vua7Xn8xaBop1ccWWWqlr/D3Ph3oZteXc+RnhI1WzlvF71WolxdP6jmC65
	 mnIYEwfLXqDxUtWrRtEumkq6g1GGnRcNIAXTWqls12Dq7GxYVFQwzxFaHGXVwApssgCOX
	 MBfCY9Li3C2MRTb+Ya2nKgOg0hybdmciea+FRxCu38Euo060fVZe8Ckkqn/Rohk+ZqdYz
	 FIKVAYgQgHbI3p2oKakWAKT2rKnYXo9XiluFnYxZfefPSIS+vKYSnh8c4lN90aAoPZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqtHR+Q8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2195606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqtHR+Q8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1511F00898;
	Fri, 27 Nov 2026 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795799379;
	bh=mPrvCeTG1UkibyQxzQG6FzyncQlcTDruhe1450GNYSE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EqtHR+Q8CeGuYGES899CoZLCH/Q3nx4TPGwuOvTOdHH+uoSR9BqCbuP2210N59GCy
	 h7DvV3WWMEyLtubLEdN4rhdDa7zUyDIh+3M2m7iD7F8aqpRGvwy3lnNTIQ/O8DTKHH
	 +tZTqI80mqDWS6XQk5ZnwzE5aZbSSsLzi36ADGMs+gHYgPuEq0+37141qmVaT5t05k
	 zCtBrdAoKt+jyolNeSq6vXJDRfjBxrh9LaoWGd6xB7/XgCAiSweW2DWnNIkh34lq6z
	 /i09QY1dGfKrRAyUO3IV1bQxa6pwFguPzMCncUWG4Vm3+DKhCM7KvoNSjScKtY7vX6
	 yYRjBQeCZHOmw==
Subject: Re: [PATCH net v6 2/2] ptp: disable unassigned timestamp channels on
 unregister
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew+netdev@lunn.ch,
 arnd@arndb.de, john.stultz@linaro.org, rmk+kernel@armlinux.org.uk
Date: Fri, 27 Nov 2026 17:09:38 +0000
Message-ID: <179579937848.3135.14198689317939903929@kernel.org>
In-Reply-To: <20261126-timecard-core-v6-2-ahmadexp@gmail.com>
References: <20261126-timecard-core-v6-2-ahmadexp@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ptp_disable_all_events() in drivers/ptp/ptp_chardev.c now
  sends PTP_CLK_REQ_EXTTS with on=0 to every channel below n_ext_ts,…
- [Low] The changelog says a coding assistant helped 'develop the core
  fix and regression tests' and that 'The regression harness exercises…
- [Low] The commit author is 'ahmadexp <ahmadexp@gmail.com>' but the
  Signed-off-by is 'Ahmad Byagowi <ahmadexp@gmail.com>'.
- [Low] ptp: ptp_disable_all_events() triggers spurious dev_err() on
  idt82p33 removal

--

ptp: disable unassigned timestamp channels on unregister

This commit changes ptp_disable_all_events() so it sends a
PTP_CLK_REQ_EXTTS disable request to every channel below n_ext_ts. Before,
the request went only to pins whose function was PTP_PF_EXTTS. The goal is
to shut down EXTTS channels that were enabled through PTP_EXTTS_REQUEST
without a pin assignment once the clock is unregistered.

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org

> A coding assistant helped identify the unassigned-channel teardown gap, develop the core fix and regression tests, and prepare this changelog. The regression harness exercises the actual cleanup path with controlled clock callbacks; no physical card was tested.

[Severity: Low]
The changelog mentions regression tests and a regression harness. The patch
only touches drivers/ptp/ptp_chardev.c and contains no selftest, KUnit test
or harness code.

No physical card was tested either, so the only validation described here
can't be inspected or run.

Could the harness be submitted too, for example as a ptp_mock or netdevsim
based selftest? If not, could the wording be changed so it doesn't suggest
the tests are part of this change?

> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]
This isn't a bug, but the Author line is "ahmadexp <ahmadexp@gmail.com>"
and the Signed-off-by uses "Ahmad Byagowi <ahmadexp@gmail.com>". checkpatch
reports this as a From:/Signed-off-by: name mismatch.

Could the author identity be updated to match the name used in the
sign-off?

> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index f63b45f5ee6ae..5835c01cddb49 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -53,11 +53,15 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
>  	unsigned int i;
>  
>  	mutex_lock(&ptp->pincfg_mux);
> -	/* Disable any pins that may raise EXTTS events */
> -	for (i = 0; i < info->n_pins; i++)
> -		if (info->pin_config[i].func == PTP_PF_EXTTS)
> -			ptp_disable_pinfunc(info, info->pin_config[i].func,
> -					    info->pin_config[i].chan);
> +	/* EXTTS requests do not require a pin assignment. */
> +	for (i = 0; i < info->n_ext_ts; i++) {
> +		struct ptp_clock_request req = {
> +			.type = PTP_CLK_REQ_EXTTS,
> +			.extts.index = i,
> +		};
> +
> +		info->enable(info, &req, 0);
> +	}

[Severity: Low]
Does this make every idt82p33 removal print error messages, even when
EXTTS was never used?

idt82p33_caps_init() sets caps->n_ext_ts to MAX_PHC_PLL (2) and leaves
all pins at PTP_PF_NONE. Before this patch, ptp_disable_all_events()
never called idt82p33_enable() for such a clock, because no pin had
func == PTP_PF_EXTTS.

On teardown the driver does:

idt82p33_ptp_clock_unregister_all()
  idt82p33->stopping = true
  idt82p33->extts_mask = 0
  cancel_delayed_work_sync(&idt82p33->extts_work)
  ptp_clock_unregister(channel->ptp_clock)   (for each channel)
    ptp_disable_all_events()
      info->enable(EXTTS index i, on=0)
        idt82p33_enable()

idt82p33_enable() sees idt82p33->stopping, sets err = -ENODEV and jumps
to out, where it logs:

  Failed in idt82p33_enable with err -19!

With two PHC channels and two EXTTS indexes each, that is up to four
dev_err() lines on every unbind, module removal or probe error unwind.

Nothing is actually leaked here, since the driver already clears
extts_mask and cancels extts_work before unregistering, and the core
ignores the return value of info->enable(). But it's a new user-visible
regression that makes a clean removal look like a failure.

The commit message says no clock driver is modified, but this is
another case where calling the EXTTS callback for channels that were
never enabled changes driver behaviour. Would tracking the channels
enabled through PTP_EXTTS_REQUEST in the core, and only disabling those,
avoid this too? Otherwise idt82p33 would need to treat a disable
request while stopping as a no-op.

[Severity: Medium]
Can this reprogram hardware on drivers whose EXTTS callback does work even
when on == 0?

Before this patch, the off request was only sent when pin_config[i].func
was PTP_PF_EXTTS. Now every channel below n_ext_ts gets it, whatever
function its pin has at the time.

The sja1105 driver re-muxes its only PTP_CLK pin before it checks on:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_extts_enable() {
    ...
	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
	if (rc)
		return rc;

	priv->ptp_data.extts_enabled = on;
    ...
}

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_change_ptp_clk_pin_func() {
    ...
	avb->cas_master = (func == PTP_PF_PEROUT);

	return sja1105_dynamic_config_write(priv, BLK_IDX_AVB_PARAMS, 0, avb,
					    true);
}

Suppose pin 0 (ptp_clk) is set to PTP_PF_PEROUT and PTP_PEROUT_REQUEST is
issued. Then sja1105_per_out_enable() sets avb->cas_master = true. On
unbind, the path is:

sja1105_teardown()
  sja1105_ptp_clock_unregister()
    ptp_clock_unregister()
      ptp_disable_all_events()
        info->enable(EXTTS index 0, on=0)
          sja1105_ptp_enable()
            sja1105_extts_enable()
              sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS)

This clears cas_master and writes AVB_PARAMS over SPI. That switches the
PTP_CLK pin from output to input while the periodic output is still
programmed: startptpcp was set and stopptpcp was never issued.

pin_config[0].func still reads PTP_PF_PEROUT, so the driver's bookkeeping
no longer matches the hardware. In a cascaded setup, the switch silently
stops driving PTP_CLK.

On SJA1105E/T, the dynamic write fails with -ERANGE because the sja1105et
dyn_ops has no AVB_PARAMS entry. Only the in-memory static config is
changed.

This also conflicts with the changelog. It says pin assignments are kept
unchanged and suggests no clock driver is affected.

The new loop assumes that disabling EXTTS on a channel that was never
enabled leaves the hardware alone. The driver API doesn't promise that.

Would it be safer for the core to track which channels were enabled
through PTP_EXTTS_REQUEST, and send the off request only to those?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-core-v6-0-ahmadexp%40gmail.com

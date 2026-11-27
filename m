Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798079;
	b=ZbwqfT+GZHTH7mgoLPtwsmjedLNgNqxHbOmihXOSH0Ktq8pTwTF5Ovbx1kgVr8HnLJW4
	 3Tw0wZ2csCIWmiDWwtL0KudF1+GroQFh+1dJr74k6pakMoELAbYHxfRx3G8Vtu+4kOeco
	 tcS/vZS+4IYm4AATyY5oWWCCmKOqyRAel1YyyHRg0NuIOtArTUwiHYRYPu1D44FfjJuLB
	 xaCrWyJW6uYvLtMUbpPJWvH2W5Q0594/JoicqBlARvmbJ8w55wYJAphwmJoNm+52YEGZz
	 lOpYH63MfUFnm0nQD5Rb57mFycahh8UfSjTFAmYMxEo8FgVBMscGaKPxXvu1f2dVuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798079;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=C1FYswoD8Xj3aNMqiCEkryNHFekWPkkmcUpWTXfsBxg=;
	b=yUKjqRGZUbfG1u7n8wnF39si0t9Yah71BPiSZrko6F6RuCQQJi0NZDH7ImUVYcHlqSBT
	 Mh99lnIImEGEncU2Q/D+7DE6v+3naabrGAhV5EGmDvJJKp+FZqRkBrj2qbZ58ppNOhd4r
	 3reoeC1W179f8N74mGZ3f8XlhrB7CtcYCFZcwlE1Qp/EqcXilU3LxUsLszx7xb0btsikW
	 V4UxEoiAOlcs6OAJa+6UcXGjDVTWURHQWm74Q+HQs+mHa1eOepZUGRM+OpGX6exX7fz9y
	 ZzoVO97aPiHcZGgYlq5vFwzBjVyrtNRAC3/JtOf4RejC7qau8KoDt44Ggz2Wae7XP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nl9n2Me6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AA606A31C;
	Fri, 27 Nov 2026 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nl9n2Me6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8F51F0089A;
	Fri, 27 Nov 2026 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798079;
	bh=C1FYswoD8Xj3aNMqiCEkryNHFekWPkkmcUpWTXfsBxg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nl9n2Me6N1JedPIRE0LeWN2KXA8ye/NHwzrKMPDJykgy/Efc4j5hXU5YQFlDvFqh2
	 80ynbzuHZyfTLQNJdI0VKkcNfAQO+hKmVhwtlKApauPeuWoDjbrqL1HxMSYZHRoXXC
	 5JIbPNpFStgJ1sVhw7HX9QZls+HfOqcwsPNDbOux5u3heqYZDq9cMSrlCpUS8MJgyF
	 sI0LCXSO6W6oe9ngRnewCOg/iJI8XAUqHhOkhI5/E3Xa4KNWe3Hyovq+s+8KodqvlO
	 pjLG+KBjr/pZE5Kz/eezoFzqrt8pdsYYnGMEcl2f+LEmpX4uMVy+tzUfssgvUT8ma+
	 4y5ehQNkh52xg==
Subject:
 Re: [PATCH net v6 1/8] net: dsa: sja1105: keep pin function on EXTTS disable
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:47:58 +0000
Message-ID: <179579807811.3135.3342251402434914609@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-1-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-1-ahmadexp@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The changelog says the coding assistant helped 'develop the
  correction and source-derived regression test' and that 'The test…
- [Low] The commit author is 'ahmadexp <ahmadexp@gmail.com>' but the
  trailer is 'Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>'.

Pre-existing issues:
- [High] Pre-existing teardown race, not introduced by this patch: the
  EXTTS poll timer can be re-armed after it is cancelled in…
- [High] Pre-existing init-order race, not introduced by this patch:
  sja1105_ptp_clock_register() makes the PHC (and its .enable callback)…

--

net: dsa: sja1105: keep pin function on EXTTS disable

This patch changes sja1105_extts_enable() so that the PTP_CLK pin is only
switched to PTP_PF_EXTTS when capture is being enabled. Disabling EXTTS
now only clears the enabled state and stops the poll timer. The pin is no
longer moved away from periodic output.

> A coding assistant helped analyze the teardown side effect, develop the correction and source-derived regression test, and prepare this changelog. The test exercises the actual function with configuration writes stubbed.

[Severity: Low]
The changelog mentions a regression test. The patch only touches
drivers/net/dsa/sja1105/sja1105_ptp.c, and the test is neither included
nor linked. Could the test be included, or the reference dropped?

With sja1105_dynamic_config_write() stubbed, can the test see whether
PTP_CLK keeps driving the periodic output after an EXTTS disable?

Was this change run on SJA1105 hardware? If not, could the changelog say
so, as Documentation/process/coding-assistants.rst asks? Another patch in
the series, "ptp: ocp: match ART DPLL frequencies to selectors", states
that no physical card was used.

> Author: ahmadexp <ahmadexp@gmail.com>
> [ ... ]
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]
The email addresses match, but the author name differs from the
Signed-off-by name. checkpatch reports this as FROM_SIGN_OFF_MISMATCH.
Could the git author be set to the name used in the sign-off before
resending? The same mismatch appears on every patch in the series.

> diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
> index 350f958dcb2af..da35805152e05 100644
> --- a/drivers/net/dsa/sja1105/sja1105_ptp.c
> +++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
> @@ -816,9 +816,11 @@ static int sja1105_extts_enable(struct sja1105_private *priv,
>  	    (extts->flags & PTP_EXTTS_EDGES) != PTP_EXTTS_EDGES)
>  		return -EOPNOTSUPP;
>  
> -	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
> -	if (rc)
> -		return rc;
> +	if (on) {
> +		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
> +		if (rc)
> +			return rc;
> +	}
>  
>  	priv->ptp_data.extts_enabled = on;
>  

[Severity: High]
This isn't a bug introduced by this patch, but the enable path just below
this hunk can re-arm the EXTTS poll timer after teardown has cancelled it:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_extts_enable() {
    ...
	if (on)
		sja1105_ptp_extts_setup_timer(&priv->ptp_data);
    ...
}

sja1105_ptp_clock_unregister() stops the timer before the PHC is
unregistered:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_ptp_clock_unregister() {
    ...
	timer_delete_sync(&ptp_data->extts_timer);
	ptp_cancel_worker_sync(ptp_data->clock);
	...
	ptp_clock_unregister(ptp_data->clock);
	ptp_data->clock = NULL;
}

Userspace can still reach sja1105_extts_enable() with on=1 until
posix_clock_unregister() marks the clock as a zombie inside
ptp_clock_unregister(). Two ways in are a PTP_EXTTS_REQUEST ioctl on an
already open /dev/ptpN and a write to the extts_enable sysfs file:

ptp_extts_request()
  ops->enable(ops, &req, 1)
    sja1105_ptp_enable()
      sja1105_extts_enable()
        sja1105_ptp_extts_setup_timer()
          mod_timer()

ptp_disable_all_events() doesn't undo this. It only disables EXTTS
channels whose pin is set to PTP_PF_EXTTS:

drivers/ptp/ptp_chardev.c:ptp_disable_all_events() {
    ...
		if (info->pin_config[i].func == PTP_PF_EXTTS)
			ptp_disable_pinfunc(info, info->pin_config[i].func,
					    info->pin_config[i].chan);
    ...
}

sja1105_ptp_pin defaults to .func = PTP_PF_NONE, and ptp_extts_request()
doesn't require a pin assignment. The re-armed timer would therefore stay
pending.

sja1105_ptp_extts_timer() re-arms itself and calls
ptp_schedule_worker(ptp_data->clock, 0). Can this touch a freed ptp_clock
after kthread_destroy_worker() or put_device()? Or a NULL clock once
ptp_data->clock is cleared?

And once the devm allocated priv is freed, wouldn't a pending timer_list
be left behind in freed memory?

[Severity: High]
This is also a pre-existing issue, not introduced by this patch.
sja1105_ptp_clock_register() makes the PHC, and its .enable callback,
visible to userspace before the EXTTS timer is set up:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_ptp_clock_register() {
    ...
	ptp_data->clock = ptp_clock_register(&ptp_data->caps, ds->dev);
	...
	timer_setup(&ptp_data->extts_timer, sja1105_ptp_extts_timer, 0);
    ...
}

On the first setup, priv comes from devm_kzalloc_obj(), so timer->function
is NULL and __mod_timer() returns early. An EXTTS enable that lands in this
window is silently dropped. EXTTS then reports as enabled but never polls.

The later setup of a live priv looks more serious. In a multi-switch tree,
removing and re-probing another switch goes through
dsa_switch_remove()->dsa_tree_teardown(). That runs sja1105_teardown() and
then sja1105_setup() on the surviving sja1105.

sja1105_ptp_clock_unregister() uses timer_delete_sync() rather than
timer_shutdown_sync(), so timer->function still points at
sja1105_ptp_extts_timer. An EXTTS enable on the newly registered /dev/ptpN
could then enqueue the timer before timer_setup() runs:

sja1105_setup()
  sja1105_ptp_clock_register()
    ptp_clock_register()        /dev/ptpN is now live
                                  PTP_EXTTS_REQUEST
                                    sja1105_extts_enable(on=1)
                                      mod_timer()
    timer_setup()

Can timer_setup() then reset entry.pprev and timer->flags while the timer
is still linked in the timer wheel?

If so, expiry would seem to reach __hlist_del() with a NULL pprev. Another
outcome is a later timer_delete_sync() that sees the timer as not pending
and leaves it in the wheel.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543303;
	b=KcFv/E3k985HApvvdg21clntPzGLMzwzZT4/Mw46ZXDyEms+Mf1K1tUAUhBNP7ixX6kn
	 ZNP9D3mwsV1KS6hymcoMq6/FgBtLHCKagkBjh9Ie50FHfepQOgYKMq9auupJgnxGiiahr
	 E0NyvbdbftPFdWpgGSUVdsuM6bdc1kQYziEjROFf0e5yk23qRIT7MQddTchx/B9Y0PYIm
	 rfGuzLULJplwctxgRQSUzPVvv8h4lUesKlSaHNOkDmEGHqqywReB0PHnhydFgeEDiFVJV
	 Y+tf6QDx3TLlaNy2/3aRlSLBZ7ySxz2gC4w+tCIdXDceLA/3NwG5oXCmqO2ERgQ3RJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543303;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V04vAdVpogXa23Aj5LpdDeMbHYFx7Zl+YAyoPUYjQH0=;
	b=1k4GuH/5V7+ckvF40bMWXadANxy94gUzqO0fj/XsSB/uGrYlLvrYYn7B5nTWKVR/KRyO
	 +I8esnkeFG1x40JavmGkInP5yK8lx3KLzKiniZucBWDUU2RiVjiBimryMK2YOby1qj/OP
	 34IWnPwzLaGYB0BdC7HizHRVEEFC5Z7cGvwA5YVEK6Sx4crVWC2A3foaFKj3C5JK3sfob
	 aJEiVCKIufS8N0yqW0A3yQcEn86hTII1EGXghiJTlR3r7HjRbCQ7v4f4KWijqaGWSasZR
	 V0Rs2SzvEVjYrLa+hpw8c/viRgjJKIpsH2AukCjbGR6ed04ivuWpIEi+ojzYZjc6o8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUfRB2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E41606A330;
	Tue, 24 Nov 2026 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QHUfRB2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330381F000E6;
	Tue, 24 Nov 2026 18:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543303;
	bh=V04vAdVpogXa23Aj5LpdDeMbHYFx7Zl+YAyoPUYjQH0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QHUfRB2ljJKV9OqLOWISXXxka6hmlIAsHZqSFhMFlHdwtuI9KnDCDRiDSMhjHYVru
	 SKMRL63Epkpab1uu74IVZoPzgojpqBXYbhXlbLXuY/gUAgIQTrf4fb3ecNqJEUDMGh
	 n43HJba6o//WPx49XmOXFCTOKXBGAArUCqrZMVzog/G3LEvRK3nonGG5EO3a8TzbXS
	 AdUUhfpdYx91Ll/ole8OTENsb6hT1o30DeM+fdiCtZONnTY8juOonpMIvFS8XrBS23
	 O7JL8IoC1znyW8o9vtzoS9D9Q+q5hRvKFh7AxW/rOtbxw93iw/nNBVshZL4xKI94HH
	 MrjaRbghnekyg==
Subject:
 Re: [PATCH net] dpll: zl3073x: do not block DPLL callbacks while PTP ops wait
From: netdev-bot+sashiko@kernel.org
To: ivecera@redhat.com
Cc: netdev@vger.kernel.org, min.li@microchip.com, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, jiri@resnulli.us, richardcochran@gmail.com,
 poros@redhat.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 18:01:41 +0000
Message-ID: <179554330175.3135.16771863750850493127@kernel.org>
In-Reply-To: <20261120171800.327855-1-ivecera@redhat.com>
References: <20261120171800.327855-1-ivecera@redhat.com>
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

- [Medium] Concurrent mode change can leave a phase step half-applied
  across synth groups.
- [Low] zl3073x_dpll_ptp_adjphase() in drivers/dpll/zl3073x/dpll.c no
  longer checks the TIE-capable mode before touching hardware.
- [Low] The kernel-doc for struct zl3073x_dpll in
  drivers/dpll/zl3073x/dpll.h says PTP clock operations take @ptp_lock…

--

dpll: zl3073x: do not block DPLL callbacks while PTP ops wait

This patch adds a per-channel ptp_lock to serialize the zl3073x PTP clock
operations. The channel lock is now taken only to read the channel mode and
the output pins, and to issue a TIE write or a phase step. The waits for a
previous TIE write or phase step now run outside the channel lock, and the
mode is checked again under that lock before the hardware operation is
issued.

> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 1cdadb8e46fb2..0b605945ee618 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c

[ ... ]

> +static int zl3073x_dpll_ptp_phase_step(struct zl3073x_dpll *zldpll,
> +				       u16 out_mask, s32 step_cycles,
> +				       bool tod_step)
> +{
> +	struct zl3073x_dev *zldev = zldpll->dev;
> +	const struct zl3073x_chan *chan;
> +	int rc;
> +
> +	rc = zl3073x_chan_phase_step_ready_wait(zldev);
> +	if (rc)
> +		return rc;
> +
> +	mutex_lock(&zldpll->lock);
> +	chan = zl3073x_chan_state_get(zldev, zldpll->id);
> +	if (zl3073x_chan_mode_is_nco(chan))
> +		rc = zl3073x_chan_phase_step(zldev, zldpll->id, out_mask,
> +					     step_cycles, tod_step);
> +	else
> +		rc = -EOPNOTSUPP;
> +	mutex_unlock(&zldpll->lock);
> +
> +	return rc;
> +}

[ ... ]

> @@ -2560,33 +2607,74 @@ static int zl3073x_dpll_ptp_adjtime_phase_step(struct zl3073x_dpll *zldpll,
>  		/* Safe for s32: max synth freq is 750 MHz */
>  		step_cycles = div_s64(delta * synth_freq, NSEC_PER_SEC);
>  
> -		rc = zl3073x_chan_phase_step(zldev, zldpll->id,
> -					     synth_mask[i], step_cycles,
> -					     !tod_stepped);
> +		rc = zl3073x_dpll_ptp_phase_step(zldpll, synth_mask[i],
> +						 step_cycles, !tod_stepped);
>  		if (rc) {
>  			if (tod_stepped) {
>  				dev_warn(zldev->dev,
>  					 "Partial phase step failure\n");
> -				return 0;
> +				rc = 0;
>  			}
> -			return rc;
> +			goto unlock;
>  		}
>  		tod_stepped = true;
>  	}

[Severity: Medium]
Can a concurrent mode change leave the phase step applied to only some of
the synth groups?

Take a channel in NCO mode with stepped outputs on two or more enabled
synths. The first group is issued with tod_step set, so the ToD and that
group's outputs are stepped by delta.

For the second group, zl3073x_dpll_ptp_phase_step() calls
zl3073x_chan_phase_step_ready_wait() without zldpll->lock held. That call
can wait up to ZL_POLL_PHASE_STEP_TIMEOUT_US (3 s) for the first step to
finish.

During that window a DPLL callback can take zldpll->lock and move the
channel out of NCO mode. Examples are zl3073x_dpll_mode_set(),
zl3073x_dpll_input_pin_state_on_dpll_set() (NCO to REFLOCK) and the NCO pin
state set (NCO to FREERUN).

The second group's NCO check then returns -EOPNOTSUPP. Because tod_stepped
is already true, this path logs "Partial phase step failure" and sets
rc = 0. zl3073x_dpll_ptp_adjtime() then returns success and skips the ToD
adjust fallback.

Wouldn't the outputs on the first synth then be offset by delta from the
outputs on the other synths fed by the same DPLL? The PTP servo would also
be told that the full adjustment was applied.

Before this patch, zldpll->lock was held for the whole adjtime, so the mode
could not change partway through. This partial path could only be reached
on a register I/O error.

[ ... ]

> @@ -2747,20 +2845,13 @@ static int zl3073x_dpll_ptp_adjphase(struct ptp_clock_info *info, s32 delta)
>  {
>  	struct zl3073x_dpll *zldpll = container_of(info, struct zl3073x_dpll,
>  						   ptp_info);
> -	struct zl3073x_dev *zldev = zldpll->dev;
> -	const struct zl3073x_chan *chan;
>  
>  	if (!delta)
>  		return 0;
>  
> -	guard(mutex)(&zldpll->lock);
> -
> -	chan = zl3073x_chan_state_get(zldev, zldpll->id);
> -
> -	if (!zl3073x_chan_mode_supports_tie(chan))
> -		return -EOPNOTSUPP;
> +	guard(mutex)(&zldpll->ptp_lock);
>  
> -	return zl3073x_chan_tie_write(zldev, zldpll->id, delta);
> +	return zl3073x_dpll_ptp_tie_write(zldpll, delta);
>  }

[Severity: Low]
Is it intended that adjphase now accesses the hardware before it reports
-EOPNOTSUPP for a mode that does not support TIE?

The old code checked zl3073x_chan_mode_supports_tie() first and returned
right away. zl3073x_dpll_ptp_tie_write() now takes the device-wide tie_lock
and polls ZL_REG_DPLL_TIE_CTRL before it checks the mode:

zl3073x_dpll_ptp_tie_write() {
	mutex_lock(&zldev->tie_lock);
	rc = zl3073x_chan_tie_ready_wait(zldev);
	if (rc)
		goto unlock_tie;
	...
}

tie_lock and TIE_CTRL are shared by all channels. So adjphase on a channel
in NCO, freerun or holdover mode can block behind another channel's pending
TIE write, for up to about one second per wait.

If the poll times out or the regmap read fails, the caller gets -ETIMEDOUT
or a bus error. The adjphase kernel-doc still says:

 * * %-EOPNOTSUPP	- mode does not support TIE and @delta is non-zero

zl3073x_dpll_ptp_adjtime() avoids this with its is_tie pre-check. Could
adjphase keep a similar mode check before it calls
zl3073x_dpll_ptp_tie_write()?

[ ... ]

> diff --git a/drivers/dpll/zl3073x/dpll.h b/drivers/dpll/zl3073x/dpll.h
> index 993221dc63249..eda37239ef1e3 100644
> --- a/drivers/dpll/zl3073x/dpll.h
> +++ b/drivers/dpll/zl3073x/dpll.h
> @@ -19,10 +19,12 @@
>   * @ops: DPLL device operations for this instance
>   * @dpll_dev: pointer to registered DPLL device
>   * @tracker: tracking object for the acquired reference
> - * @lock: per-DPLL mutex serializing all operations
> + * @lock: per-DPLL mutex serializing DPLL operations and channel state access
>   * @type: DPLL type (PPS or EEC)
>   * @lock_status: last saved DPLL lock status
>   * @pins: list of pins
> + * @ptp_lock: serializes PTP clock operations, taken before @lock, which they
> + *	      hold only while they use the channel state

[Severity: Low]
This isn't a bug, but the comment looks incomplete. The PTP ops also hold
@lock for more than the channel state.
zl3073x_dpll_ptp_adjtime_phase_step() holds it while it walks zldpll->pins
and reads the output state through zl3073x_dev_out_is_stepped() and
zl3073x_dev_out_synth_get():

	mutex_lock(&zldpll->lock);
	list_for_each_entry(pin, &zldpll->pins, list) {

The commit message says the PTP ops need the channel lock "only for the
channel mode and the list of output pins". Should the @ptp_lock comment
mention the pins list too?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120171800.327855-1-ivecera%40redhat.com

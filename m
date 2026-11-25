Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581888;
	b=qDAUy1G2rdTAQs+0f2Pl1FZHAWnKeYhyxU4FQMYPS5aDVJdAEqq3zR0HJzVsG35kpz4g
	 oYRyXjRF6E8mesjYB6DE8yRnN7jII7zpJUAKXV+nvxDxb1z1oJwQoeYXiFuSO5aeZles7
	 ejULdBwidWKXnyX8R4Ck4+OAAj8ZQudnSQc8fMAYl6w6gUyFH+l3q9HbhbZK4Wvv1hdMA
	 /FRfO9FcqtUsnescBxx6m8POKHUhQnA1rS2kfVwicFbpuJOKO4Xv2MfGWGgzHs/ZRDxqv
	 03BuChRK2Vl8R7gT3ve651sEwBGSDHQeqCywZ9xHfHapQrQJjmz32xT6KAQolIF/DsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581888;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=6IdGK5WInaBvMsUprt+v9M83CkD3NbHR9SVF1D0/8Tc=;
	b=SiFs/lof67HDcw9k9a+AqzRbpzdCdt8DtDFgMNJH//VSVxfFYb5kh6tZKPDFXPNHXJ3w
	 IyKj34Enlf8wALygCYT4DX0P9CSw5G8ODoG+eYsrO/CGKyPes/HIzRzG3wfWgDx7wqNkj
	 MxDwBi02ERETD9041Vg/jMU0LPBy1SjxFG1ILs8R9wkRp892ZG8FHtIVUnpcv1Rob8zru
	 xQUjjhKTfWEpjPfz8D2vx6lawjiAPMFYF+dpc3lsjGiOLwjuAni6VF321qVzrRn9roxxG
	 HkQm/BMleWhGk596P779S34Lxnq5tN+f4aFOWqcz9m2vcB5N6DpufWOQt207zFvhl/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RH6YgMHi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8F606A335;
	Wed, 25 Nov 2026 04:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RH6YgMHi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1364F1F000C6;
	Wed, 25 Nov 2026 04:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795581887;
	bh=6IdGK5WInaBvMsUprt+v9M83CkD3NbHR9SVF1D0/8Tc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RH6YgMHiIhY4wiIG/po72R0idyuh+Xjosr0Ly02FnUcH4mdzrn0R6YU2vLzM6UlCb
	 LXaK9wBw0GeflhsjIsB9/vbdiI4N5AZfbvco29TAubA/q3dsPV9OGkCYtCy74ijmD5
	 3a/fy8cshHHtGS7jd5Mt7wIC1CgU33iTBSNkBeBjlZXo92Xchg5+PP/j2qR3lKgmmF
	 imsaVyOK52aTZuMLTWm8CjcWAdgn7sjm9myYC+npMKl8lXy8FUPR1jvbGUZC+BOsg0
	 QD5tw4jMbZ0YsvoeLbZGQepJWJYM3Nx01e8A1PpSw6ArAkWkQRYh0flgVBR21qEfDU
	 TsygpXEUDvtCQ==
Subject: Re: [PATCH net v5 4/8] ptp: ocp: handle hardware selectors and
 combined DPLL input routes
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, arkadiusz.kubalewski@intel.com,
 arnd@arndb.de, davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us,
 john.stultz@linaro.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev
Date: Wed, 25 Nov 2026 04:44:46 +0000
Message-ID: <179558188666.3135.18134824042622584333@kernel.org>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-4-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-4-ahmadexp@gmail.com>
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

- [Medium] Because of this patch, ptp_ocp_dpll_frequency_get() now
  succeeds for input selectors that feed several destinations.
- [Low] The commit message understates the impact of the SMA_SELECT_MASK
  change in ptp_ocp_dpll_frequency_get() (drivers/ptp/ptp_ocp.c).

--

ptp: ocp: handle hardware selectors and combined DPLL input routes

This commit changes ptp_ocp_dpll_frequency_set() to pass the selector
table value to ptp_ocp_sma_store_val() instead of the table index. It
also masks the direction enable bit in ptp_ocp_dpll_frequency_get().
For input selectors that feed several destinations, frequency_get now
returns a frequency, or zero, instead of -EINVAL.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index b16d36c3305f9..df1a428eb2fed 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c

[ ... ]

> @@ -5887,6 +5888,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  	int i;
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
> +	val &= SMA_SELECT_MASK;

[Severity: Low]

The commit message mentions this mask only briefly:

  "and mask the direction enable bit before looking up the frequency."

It then gives the combined-input case (selector 0x000c) as the reason
the get-before-set step and the pin dump fail. Is that the whole impact?

ptp_ocp_sma_fb_get() returns the full 16-bit half-register:

	return (ioread32(gpio) >> shift) & 0xffff;

ptp_ocp_sma_store_val() always adds the enable bit when the direction
is not fixed:

	if (!sma->fixed_dir)
		val |= SMA_ENABLE;		/* add enable bit */

ptp_ocp_sma_fb_init() also uses BIT(15) to work out each pin's
direction, so that bit is normally set for the active direction.

Every table value is below BIT(15). Before this patch, wouldn't a
readback such as 0x8001 for PPS1 never match a table entry? That would
make frequency_get return -EINVAL for every SMA pin on FB, ADVA and
ADVA-X1 boards whose direction can change, not only for combined
routes.

If so, DPLL pin-get/dump failed for those pins. dpll_pin_freq_set()
also stopped at "unable to get old frequency value", so frequency
changes never ran either.

Could the commit message state this more directly, since it affects
stable backport priority?

>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {
> @@ -5894,7 +5896,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  			return 0;
>  		}
>  
> -	return -EINVAL;
> +	if (sma->mode == SMA_MODE_OUT)
> +		return -EINVAL;
> +
> +	/* Inputs can feed several destinations, including timestampers. */
> +	*frequency = 0;
> +	for (i = 0; tbl[i].name; i++) {
> +		if (!(val & tbl[i].value))
> +			continue;
> +		val &= ~tbl[i].value;
> +		if (!tbl[i].frequency)
> +			continue;
> +		if (*frequency && *frequency != tbl[i].frequency) {
> +			*frequency = 0;
> +			return 0;
> +		}
> +		*frequency = tbl[i].frequency;
> +	}
> +	/* Unknown destinations do not establish a frequency either. */
> +	if (val)
> +		*frequency = 0;
> +
> +	return 0;

[Severity: Medium]

With this change, ptp_ocp_dpll_frequency_get() succeeds for input
selectors that feed several destinations. For example, PPS1|TS1
(0x0005) reports 1 Hz and TS1|TS2 (0x000c) reports 0 Hz.

These selectors used to return -EINVAL, so dpll_pin_freq_set() stopped
before reaching frequency_set:

drivers/dpll/dpll_netlink.c:dpll_pin_freq_set() {
    ...
	ret = ops->frequency_get(pin, ..., &old_freq, extack);
	if (ret) {
		NL_SET_ERR_MSG(extack, "unable to get old frequency value");
		return ret;
	}
	if (freq == old_freq)
		return 0;

	ret = ops->frequency_set(...);
    ...
}

Now the set runs. ptp_ocp_dpll_frequency_set() takes the first table
entry with the requested frequency and stores only that value:

			return ptp_ocp_sma_store_val(bp, tbl[i].value,
						     sma->mode, sma_nr + 1);

ptp_ocp_sma_fb_set_inputs() and ptp_ocp_sma_adva_set_inputs() then
replace the pin's whole 16-bit selector half:

	reg = (reg & mask) | (val << shift);

Does this silently drop TS1..TS4 or FREQ1..FREQ4 routes that were set
up through sysfs?

For example, after "IN: PPS1 TS1" is written to the smaN attribute, a
DPLL pin-set to 10 MHz would store 0x0000. That removes the TS1 route,
so EXTTS timestamping on that input stops and no error is reported.

The get path treats timestamp and counter destinations as not
constraining the frequency, but the set path throws them away. Should
ptp_ocp_dpll_frequency_set() keep the destination bits that carry no
frequency, or reject the change when the input has a combined route?

>  }
>  
>  static const struct dpll_device_ops dpll_ops = {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-timecard-common-v5-d669cfa034-0-ahmadexp%40gmail.com

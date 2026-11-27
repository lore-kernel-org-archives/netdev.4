Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798081;
	b=g8akm6ih/HzD1/BIRJ9vqu+oC5u2b/0vcHwVJ+i0VlD9CNJNncl5TV4MCNEhpH8/pkPD
	 b9J7u2QWDsidBpeoZ/P3Nh9wZbMgQbxLPSs4PRfzzL9eZ33FDquBvK2rczlxvtmN+hJxJ
	 bBG6ZRoy6Z4rDJbAGagUEdSEptDddQtyf2JpUYxlKLlpx+ErcuiMFfIMf4V3SqyZSojkG
	 jwCwOKQJuVRov69KLjY4x/9bgRVAgx09eKH8FH97R5BRiP5iNO+r0DjZsTVtqiLtSe1mA
	 nxJUmhOoqjaVoVP3fXwWbZZZvTj93kUWV0OrhBYPhDmtLZh27ClhEq8D3fdzs/Bl0+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798081;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=C/Qd5lMs5hCPwque2VUzBd9ODA1TFoImJKWtFoQYGIY=;
	b=O4ApLjpVc4xRRH5aUdBZouDklUVgXDzZI1LI9RS5l9OuNXaqmqdCAHIXLPXE/3x7O8ok
	 tG7INwJp79+qRcHTf2NFkoyPsxFxTR6UbV73vgHtWr1iUVS8ExobbAvs3eydoqaRua5oz
	 6bwKrUbuHa9nnK3D10snp8OzCMzCdJ7bV9s0LUOj4qL0Ate/zlkiPq6bVMezmZzSRcpVM
	 aq62IHeQrvjf1JZQrpn+1znedqnVYqz76PgAr9raLtXuMhP7NLUz56R5jZucGrFPtsPLC
	 GsMttmPr+bCBuDbza9JaE1XgzkvGfMhWQ+Nw79jN8xH5IiLBP+OUYKZUn7xP8/QueNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUkbNebU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EBC606A324;
	Fri, 27 Nov 2026 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dUkbNebU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CC41F00899;
	Fri, 27 Nov 2026 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798080;
	bh=C/Qd5lMs5hCPwque2VUzBd9ODA1TFoImJKWtFoQYGIY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dUkbNebUkk4R6TDEAi+wB8Yv0uNTD95/J3Fz5UqRrNpBeseL2JLThxcWNlTEhyPst
	 MMQs2otBYgon18jSIQn4zQU086YFvl4fVf9YAWfybanXU8yWHYLvhRThPVr7kp7vR0
	 kiJRAjexX6jqSgHivRXotEmVqnm2eWdIkn02NtfbQc2OwPu+UfKyHgsyBjAKbTd7xs
	 mi+12un40TZIubATxdw5z6vKf7g8QGWC3L09PQfCgBLOK4WiWCMz7EkEtg83KCLB51
	 6y3Wgu+b5l1EAYjkc/awSS61vdai7d+w6r5TChmTX9FWBfCQQRUqIl8KuMqLzhHGYm
	 YPvtkPugPzYgw==
Subject:
 Re: [PATCH net v6 2/8] net: dsa: sja1105: keep pin function on PEROUT disable
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:47:59 +0000
Message-ID: <179579807942.3135.16880746922338290793@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-2-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-2-ahmadexp@gmail.com>
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

- [Low] The changelog does not match what was submitted, and it leaves
  out the trigger and the impact.
- [Low] The author identity 'ahmadexp <ahmadexp@gmail.com>' does not
  match the Signed-off-by 'Ahmad Byagowi <ahmadexp@gmail.com>'.
- [Low] In sja1105_per_out_enable()
  (drivers/net/dsa/sja1105/sja1105_ptp.c), the patch wraps the…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  sja1105_per_out_enable() still switches the shared PTP_CLK pin to…
- [Medium] This problem wasn't introduced by this patch, but the PTP_CLK
  pin-function state avb->cas_master, kept in the shared in-memory…
- [Medium] This problem wasn't introduced by this patch, but
  sja1105_per_out_enable() copies ptp_data->cmd into a local cmd at line…
- [Medium] This problem wasn't introduced by this patch, but on P/Q/R/S
  parts sja1105_per_out_enable(on=true) switches the PTP_CLK pin to…

--

net: dsa: sja1105: keep pin function on PEROUT disable

This patch changes sja1105_per_out_enable() so that it moves the shared
PTP_CLK pin to the PEROUT function only when the periodic output is being
enabled. Disabling now stops the generator without reprogramming the pin.
Before this, the pin could be switched away from EXTTS by a disable request.

> Disabling periodic output currently selects PTP_PF_PEROUT even when the shared PTP_CLK pin is configured for external timestamping. Only select the PEROUT function when enabling the output; disable should stop the generator without reprogramming the pin.
>
> A coding assistant helped identify this related pin-direction side effect, develop the correction and regression test, and prepare this changelog. The source-derived test checks the actual callback behavior with configuration writes stubbed.

[Severity: Low]
Is the regression test mentioned here included in the submission? The patch
only touches drivers/net/dsa/sja1105/sja1105_ptp.c. Reviewers have nothing
to read or run for "the source-derived test".

The phrase "this related pin-direction side effect" seems to point at the
sibling patch "net: dsa: sja1105: keep pin function on EXTTS disable". If
this commit is read on its own, for example by a stable backporter, what is
it related to?

Could the changelog also say how the bug is triggered and what users see?
On P/Q/R/S parts, userspace can send PTP_PEROUT_REQUEST(2) with a zero
period, or write a zero period to the sysfs period file, while EXTTS is
armed. Before this fix that path was:

ptp_perout_request()
  ops->enable(ops, &req, perout->period.sec || perout->period.nsec)
    sja1105_per_out_enable(on = false)
      sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT)
        avb->cas_master = 1

The pin then became an output. extts_enabled stayed true and the poll timer
kept running, but external edges were no longer captured. The switch could
also drive the pin against an external PPS source.

Both body paragraphs are single lines well over 75 columns, which checkpatch
flags as COMMIT_LOG_LONG_LINE. Documentation/process/coding-assistants.rst
asks for checkpatch-clean submissions and for a statement of what could not
be tested. Was this fix tried on real hardware?

> Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]
The commit author is "ahmadexp <ahmadexp@gmail.com>", but the sign-off is
"Ahmad Byagowi <ahmadexp@gmail.com>". For this case checkpatch warns:

  From:/Signed-off-by: email name mismatch

Could the From: name be changed to match the sign-off? Netdev usually asks
for a resend so the DCO identity is clear. The sibling patches in the series
seem to have the same mismatch.

> diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
> index da35805152e05..7c07f76caccf4 100644
> --- a/drivers/net/dsa/sja1105/sja1105_ptp.c
> +++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
> @@ -733,9 +733,11 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
>  
>  	mutex_lock(&ptp_data->lock);

[Severity: Medium]
This isn't a bug introduced by this patch, but the local cmd is copied from
ptp_data->cmd before this mutex_lock():

sja1105_per_out_enable() {
	...
	struct sja1105_ptp_cmd cmd = ptp_data->cmd;
	...
	mutex_lock(&ptp_data->lock);
	...
}

sja1105_ptp_commit() later writes the whole copy, ptpclkadd included. If
adjtime or settime runs while this caller is waiting on the mutex, can a
stale ptpclkadd be written back to the hardware?

For example, with the cached mode at SET:

perout                          adjtime
cmd = ptp_data->cmd (SET)
mutex_lock() blocks
                                mutex_lock()
                                sja1105_ptp_mode_set(ADD)
                                write delta
                                mutex_unlock()
sja1105_ptp_commit(&cmd)
  hardware back in SET mode

The cache now says ADD, so the next adjtime skips the mode switch in
sja1105_ptp_mode_set():

	if (ptp_data->cmd.ptpclkadd == mode)
		return 0;

Its delta is then written in SET mode, and the PHC is set to roughly the
delta value. In the mirrored case, the next settime is applied as an add.

sja1105_ptp_reset() makes the same unlocked copy. Should both copies be
taken after mutex_lock()?

>  
> -	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
> -	if (rc)
> -		goto out;
> +	if (on) {
> +		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
> +		if (rc)
> +			goto out;
> +	}

[Severity: Medium]
This is a pre-existing issue, but the enable path still switches the shared
PTP_CLK pin to output without checking the function the PTP core records in
sja1105_ptp_pin.func. ptp_perout_request() and ptp_extts_request() only
check the index and flags before they call ops->enable(). That leaves the
driver as the only place this could be enforced.

If EXTTS is armed and a PEROUT request with a non-zero period arrives on
index 0, avb->cas_master becomes 1. PTP_PIN_GETFUNC still reports EXTTS and
extts_enabled stays true. Does EXTTS then stop capturing without any error
while its poll keeps running?

The reverse case looks possible too. sja1105_extts_enable(on) sets
cas_master to 0 while the PEROUT generator started by startptpcp may still
be running.

This is how 747e5eb31d59 was designed, with the request choosing the pin
direction, and the changelog keeps that on purpose ("Only select the PEROUT
function when enabling the output"). Should these requests be checked
against the pin assignment?

[Severity: Medium]
This isn't a bug introduced by this patch either. On P/Q/R/S parts the pin
is switched to output here before the request has been checked. Later
failures jump to out, and out only drops the mutex:

		if (pin_duration > U32_MAX) {
			rc = -ERANGE;
			goto out;
		}

Failures from __sja1105_ptp_gettimex() and from the PTPPINST and PTPPINDUR
SPI writes take the same exit.

With a period above about 68.7 seconds, the caller gets -ERANGE. Does the
pin stay driven as an output even though startptpcp was never issued? That
would break an armed EXTTS. It would also undo the safe input default that
sja1105_init_avb_params() sets:

	avb->cas_master = false;

Could the period check, and ideally the register programming, move before
the pin direction change? Restoring the old direction on error would also
work.

[Severity: Medium]
This is a pre-existing issue, but sja1105_change_ptp_clk_pin_func() is
called here with ptp_data->lock held, while sja1105_extts_enable() calls it
with no driver lock at all:

sja1105_extts_enable() {
	...
	if (on) {
		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
		if (rc)
			return rc;
	}

	priv->ptp_data.extts_enabled = on;
	...
}

The PTP core's pincfg_mux does not help here. The sysfs handlers
extts_enable_store() and period_store() call ops->enable() directly.

Can the read-modify-write of avb->cas_master in
sja1105_change_ptp_clk_pin_func() then overlap with a PEROUT enable running
at the same time?

It also looks like this can run during sja1105_static_config_reload(),
which relies on ptp_data.lock:

	/* No PTP operations can run right now */
	mutex_lock(&priv->ptp_data.lock);

If so, a dynamic AVB_PARAMS write could land in the middle of the switch
reset. The uploaded static config could also pick up a half-updated pin
direction.

extts_enabled is written here without ptp_data->lock as well, while
sja1105_rxtstamp_work() reads it under that lock.

>  
>  	if (on) {

[Severity: Low]
This isn't a bug, but the new if (on) block is followed right away by this
existing if (on) block. Could the sja1105_change_ptp_clk_pin_func() call go
inside the existing block, after its local declarations?

>  		struct timespec64 pin_duration_ts = {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com

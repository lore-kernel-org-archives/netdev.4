Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798083;
	b=4KZcn2gYf6apjOpCQpREGk9R+eUh+roAdNS9vzFT0QVCyVYjEkvEezjcOdLvF513M/Wl
	 5Uci1zzO4KWyYEbatymwyRVDSxvL3ZKc2aiuxzWL9yppOfa/RYQT+KLXY+MZxQDDazVsh
	 TECoOzaVSYwOX84Dv4x4qlEGn31Qm2dNfIbV+gxDuOR0bkS4hJvdhNxwvhoeFUfFcrfBe
	 kJOy41U56bNnlrbdoHTHTNQHU17lzo3M1NvpEXV9VLKYh5ffl7qJhGxmu0FQaFBAq6d6B
	 8h0RgEmicRTg0e1TCkvJvOmDlzKPmfiIifmY684Cgrnc5M1injr1JoEPnMprkDvvzlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798083;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=mLudbu1Y/4LQ3CoYckg+50YXPqoYFD6//3daPKxQOis=;
	b=Xjq9MYEJB4GA307+ukXOcgabbVK4+rxC1pm9NIRUnKdkGTfnu1UAkY9+sEkspYw3uFTL
	 EglVf5qngfzHlvM77KFIp6A7g6Nxjj96+bgsdMqcp7kPzllYf20wUGq4Fqf9pOfCoVyiJ
	 T02vwDmgwykk2/jekNpxrFTy7bTRlOLzEE8KEBdKu5GzU22qaTx41s1MFtzQ7/zNBoOa6
	 WVONSnV397DRkPuxQeXMPy5UgLgmyMuDu9KuS9AAXGQ2iVA64VR8cbUKGMMfWGO/l5OFU
	 XLMG8i6N3E5kte2fTmTjl7gM6+m5cyHEVg5KZiJY9iPS1Npwtp4krFiBJsI3b9qM6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTfiuXrt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556E606A337;
	Fri, 27 Nov 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTfiuXrt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8CA1F0089C;
	Fri, 27 Nov 2026 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798082;
	bh=mLudbu1Y/4LQ3CoYckg+50YXPqoYFD6//3daPKxQOis=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dTfiuXrt1G1zZDd0elcsWXvqDw60Oh3xSNRIqTwtgjb6Xg6aCVL2VIawQ1JO+Qigz
	 wY0kwZ+PbIs+13OyhTROAhq5CnahErEYiD13sqKuDmRxkDlosnHB2W8kD6cOuM1e2R
	 j7Jj/C7N1Py6mvvTnF1ESXWWuGaIHRZkMWl+EFvG1Ci9DXemVKU6HnLwNYJUFR7iyy
	 iajyzVd36ZZVfY26g3joRjLhhhwj6I2jyA+MzAufxkLAGwNlrRxbzYBkbgaW8ZRbtx
	 /PhYxIAFa8Ve0hX04z2KtEijxKBzlDiZdyUN7mA8gaA3ddcH+/8mcMw/6PRx0yixYQ
	 4vgZbAaOXvCsA==
Subject: Re: [PATCH net v6 3/8] ptp: ocp: preserve timestamp routes on DPLL
 frequency changes
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, arkadiusz.kubalewski@intel.com,
 jiri@resnulli.us, jonathan.lemon@gmail.com
Date: Fri, 27 Nov 2026 16:48:01 +0000
Message-ID: <179579808134.3135.14342336954222031404@kernel.org>
In-Reply-To: <20261126-timecard-driver-v6-3-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-3-ahmadexp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In ptp_ocp_dpll_frequency_set() (drivers/ptp/ptp_ocp.c), the
  value passed to ptp_ocp_sma_store_val() changes from the table index…
- [Medium] The patch makes two user-visible changes to
  ptp_ocp_dpll_frequency_get() that the commit message never mentions.
- [Medium] On SMA inputs, ptp_ocp_dpll_frequency_set() can report success
  for a 10 MHz request without selecting 10 MHz.
- [Medium] ptp_ocp_dpll_frequency_set() now does an unlocked read-modify-
  write of the SMA input selector.
- [Low] The From:/author identity on the commit ("ahmadexp
  <ahmadexp@gmail.com>") does not match the Signed-off-by: name ("Ahmad…

--

ptp: ocp: preserve timestamp routes on DPLL frequency changes

This patch changes ptp_ocp_dpll_frequency_set() so that a DPLL frequency
change on an SMA input keeps the timestamp and counter selector bits, and
so that it programs the selector value instead of the table index. It also
masks the value read in ptp_ocp_dpll_frequency_get() with SMA_SELECT_MASK.
Input pins with combined routes now report a frequency of 0 instead of
failing.

> A coding assistant helped identify the route-loss issue, develop the fix and regression test, and prepare this changelog. The test uses the actual selector and DPLL functions with instrumented register access.
>
> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

[Severity: Low]
This isn't a bug, but the commit author ("ahmadexp <ahmadexp@gmail.com>")
does not match the Signed-off-by name ("Ahmad Byagowi
<ahmadexp@gmail.com>"). checkpatch reports this as FROM_SIGN_OFF_MISMATCH.
Could the author be set to the real name?

The changelog also mentions a regression test that uses instrumented
register access. The patch only touches drivers/ptp/ptp_ocp.c, though.

Will the test be posted? If it is an out-of-tree harness, should that
description go below the --- line?

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 625a85b2dc7e5..284908c6abc22 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5873,16 +5873,31 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,

[ ... ]

>  	tbl = bp->sma_op->tbl[sma->mode];
> -	for (i = 0; tbl[i].name; i++)
> -		if (tbl[i].frequency == frequency)
> -			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
> +	for (i = 0; tbl[i].name; i++) {
> +		if (tbl[i].frequency != frequency)
> +			continue;
> +
> +		if (sma->mode == SMA_MODE_IN) {
> +			val = bp->sma_op->get(bp, sma_nr + 1) & SMA_SELECT_MASK;
> +			if (sma->disabled)
> +				val = 0;

[Severity: Medium]
Is this read-modify-write of the selector serialized against the other
writers? The DPLL path holds only dpll_lock here. bp->lock is taken only
inside ptp_ocp_sma_fb_set_inputs() and ptp_ocp_sma_adva_set_inputs(),
around the final register merge.

The other writers of the same selector do not take dpll_lock:

- The sysfs path sma1..4_store()->ptp_ocp_sma_store()->
  ptp_ocp_sma_store_val() holds no driver lock.
- The PTP_PIN_SETFUNC path ptp_ocp_verify()->ptp_ocp_sma_store() holds
  only the PTP core pincfg_mux.

Consider this sequence:

CPU0 (DPLL frequency set)
ptp_ocp_dpll_frequency_set()
   val = bp->sma_op->get(...);    /* no TS bits, aux = 0 */

CPU1 (sysfs "IN: PPS1 TS1", or PTP verify "IN: None")
ptp_ocp_sma_store()
   ptp_ocp_sma_store_val()        /* writes the new selector */

CPU0
   ptp_ocp_sma_store_val(bp, tbl[i].value | 0, ...)
      sma->disabled = false;      /* overwrites the selector */

Wouldn't CPU1's TS1 route, or its disable, be lost while both callers
report success? That is the same route loss the commit message describes.

Would one driver mutex held across the read, the aux computation and the
store close this? It would need to cover sysfs, PTP verify and the DPLL
ops. Merging the preserved bits inside the bp->lock section is another
option.

> +
> +			for (j = 0; tbl[j].name; j++) {
> +				if (!tbl[j].frequency && (val & tbl[j].value))
> +					aux |= tbl[j].value;
> +			}
> +		}
> +		return ptp_ocp_sma_store_val(bp, tbl[i].value | aux,
> +					     sma->mode, sma_nr + 1);

[Severity: Medium]
What happens here when 10 MHz is requested on an input that already has a
timestamp route? In ptp_ocp_sma_in and ptp_ocp_adva_sma_in, the 10 MHz
selector is encoded as zero:

    { .name = "10Mhz",  .value = 0x0000,      .frequency = 10000000 },

So tbl[i].value | aux is just aux.

Take an input configured through sysfs as "IN: PPS1 TS1" (0x5):

- frequency_get reports 1 Hz, so dpll_pin_freq_set() calls frequency_set.
- aux becomes 0x4, and ptp_ocp_sma_store_val() writes 0x4. That clears
  PPS1 and leaves only TS1.
- The op returns 0, and dpll_pin_freq_set() sends
  __dpll_pin_change_ntf().

In this driver's encoding, 10 MHz means no selector bits are set. The
readback is therefore TS1 (frequency 0), or 0 Hz through the new combining
loop when several aux bits are set.

Repeating the request is another no-op that succeeds and sends a
notification, because old_freq stays 0.

Doesn't this contradict "This keeps the timestamp route while changing
the frequency-bearing source"? Should this combination be rejected, for
example with -EINVAL or -EBUSY and an extack message? Or is there a defined
way for the zero-valued 10 MHz selector to coexist with the aux
destinations?

[Severity: Medium]
This also changes what gets programmed for both inputs and outputs. The
old code passed the table index i to ptp_ocp_sma_store_val(), and the new
code passes tbl[i].value. The two only agree for the first two entries of
the fb tables (10Mhz = 0, PPS1 = 1).

Inputs (ptp_ocp_sma_in): IRIG is index 5 / value 0x10, and DCF is index 6
/ value 0x20. Before this patch, an IRIG-B (10000 Hz) request programmed
0x5 (PPS1|TS1), and a DCF77 request programmed 0x6 (PPS2|TS1).

Outputs (ptp_ocp_sma_out): an IRIG request used to program 0x5 (PHC|GNSS1)
and now programs 0x10.

The ART tables also differ between index and value: ART PPS1 is index 0
but value 0x1.

The changelog says "Preserve the existing output path", but output
programming changes here. Could the commit message describe this
index-to-value fix? It might also be worth splitting into its own patch,
so maintainers and stable backporters know the IRIG/DCF behavior changes.

[ ... ]

> @@ -5900,6 +5915,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  	int i;
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
> +	val &= SMA_SELECT_MASK;
>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {
> @@ -5907,7 +5923,28 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  			return 0;
>  		}
>  
> -	return -EINVAL;
> +	if (sma->mode == SMA_MODE_OUT)
> +		return -EINVAL;
> +
> +	/* Inputs can feed several destinations, including timestampers. */
> +	*frequency = 0;

[Severity: Medium]
Both of these changes affect what DPLL netlink reports, and the commit
message does not mention either one.

The first is the new mask. ptp_ocp_sma_fb_get() returns the 16-bit field,
which includes SMA_ENABLE (bit 15):

    return (ioread32(gpio) >> shift) & 0xffff;

ptp_ocp_sma_store_val() also ORs SMA_ENABLE into every value on !fixed_dir
boards. On configurable fb and ADVA boards, the old exact match
val == tbl[i].value could therefore never succeed, and frequency_get
returned -EINVAL.

dpll_msg_add_pin_freq() passes that error on, so pin GET and dump failed
for those pins. dpll_pin_freq_set() also failed before it could reach
frequency_set.

With the mask, pin GET succeeds on those boards, and DPLL frequency set
can be reached there for the first time.

The second is the new fallback. Inputs with no exact match now report
DPLL_A_PIN_FREQUENCY = 0. That covers timestamp-only routes,
mixed-frequency routes and unknown bits.

0 Hz is not in the pin's advertised ptp_ocp_sma_freq list (1PPS, 10MHz,
IRIG-B, DCF77). Userspace has never received it from this driver before.

Could the commit message describe these user-visible changes?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-timecard-driver-v6-0-ahmadexp%40gmail.com

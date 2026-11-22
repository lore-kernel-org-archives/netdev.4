Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380070;
	b=S79Q6Qr0+RgpG2QQY7N7YVBDqw9UMf7KIfhEnQZqZXCLv1BGKsYeW1jCfelt7twD7inC
	 FHj1nH28LpO0M+48qSew7o/XzkmlWklrk+4WEUorpaIQbfQgpaPAHWD2nK1uD79TyRMdW
	 5uOqxnK/GfutAzHDuWH1JKxMSkMIayJOZB6rV91lAoKeG8+60nim7yw7YIG2xlf6sUvOK
	 GYQP865HFxHq3OgoYMPaYc4XIdKdEVpZ9eNUiKl6LgzvXSOiqZcxVTKDIXIyQ0au/jllM
	 DE+RmrVTgFoxTt68wenwN0WY9zzbsCp71axRKgGnfdpDi4qQPbltwtUhz6rxVTPI7Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380070;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=R8LwHFk/EYoKJPpPeV8B12mFwSu3Wc9W6pgecicIHhc=;
	b=09wb2Dm1KNkVB/CyWJ3Caz64sPZCb3pLbQCUstHqUoqJzDlPQZVq/ZzHWSItF/q3N600
	 ATFHje3cdh4lfrQhg0WAWMMcU1rKmKXSik0gd1tdLJukIc9CrzDEBshuEQ329/cGn5kyh
	 JPMeeeW+F4Zf2ylMHfaCIJHWrHOaj2guqxsy4zbLmq8KTkxqSvKFl0IE0QxEsjhIVjq+H
	 JjDjh3U2u6Uu3qPjbESU45Uoj4S7szusn2XgUzSiohK1IwKw6mQWyt5Z/D0SDQpcZ7nvc
	 l3KURVmSPjH7xMCIITFvlJ/OWOwJGQg3t4QXpEGBAbAyrLhWUsXWWySY9bh1WUbSTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otqNSz1m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6553D606A334;
	Sun, 22 Nov 2026 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otqNSz1m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8613C1F000CA;
	Sun, 22 Nov 2026 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795380070;
	bh=R8LwHFk/EYoKJPpPeV8B12mFwSu3Wc9W6pgecicIHhc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=otqNSz1m1tGLxeL4v3MSNtb/rziqsVQkgT7J9A7b0SuX2HZn70+E+NftHf+Joou5C
	 v5ZVHgb8CIZnYItrDle4ftvawAaY1YAYtLAfwDxmVZibpSmgVmVFVvhrvvWWtp/tSN
	 MB5KR0Z/fKcdArzLbbOsKjhbML3iZObrjRtS8+m2VRenVDJqakIitnHq4pZu0MTXCu
	 FGVjWR//dUnPBns/Dbou7YDQgfDFyejkanx+A1et+sX3YzaRhp84M5o+y5W1gRt/xf
	 9IS8ti/ehtARPiZ2FuaKY4g6/5Ax9XQ7vgCjFwQzVkspXU0vNogvOMPx4REbZM3Ndp
	 fLCfXByXzDOIw==
Subject: Re: [PATCH net 3/4] ptp: ocp: report disabled SMA inputs consistently
 over DPLL
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 richardcochran@gmail.com, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org,
 pabeni@redhat.com
Date: Sun, 22 Nov 2026 20:41:09 +0000
Message-ID: <179538006912.3135.16971430532149423594@kernel.org>
In-Reply-To: <20261118-timecard-common-301f823ddd-3-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-3-ahmadexp@gmail.com>
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

- [Medium] The fix decides whether an input is disabled only from the
  software flag sma->disabled.
- [Low] The commit message has a testing/provenance paragraph that does
  not describe this patch.
- [Low] The commit message only describes the 10 MHz case: a disabled
  input reads back as 10 MHz and the DPLL core skips the setter.

--

ptp: ocp: report disabled SMA inputs consistently over DPLL

This patch makes ptp_ocp_dpll_frequency_get() use SMA_DISABLE for SMA
inputs flagged as disabled before it looks up the selector table. Before
this, a disabled input read back as the 10 MHz selector. The DPLL core
then skipped a later 10 MHz request as unchanged.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> Disabling an SMA input clears its mux field. Zero is also the selector
> for 10 MHz, so a DPLL read reports 10 MHz while sysfs reports None. The
> DPLL core then treats a request to enable 10 MHz as unchanged and skips
> the setter, leaving the input disabled.

[Severity: Low]
This covers the 10 MHz case. Was the old behaviour worse on adva_x1
boards? ptp_ocp_adva_x1_sma_in[] has no entry with value 0x0000:

static const struct ocp_selector ptp_ocp_adva_x1_sma_in[] = {
	{ .name = "PPS1",	.value = 0x0001,      .frequency = 1 },
	...
	{ .name = "None",	.value = SMA_DISABLE, .frequency = 0 },
	{ }
};

So after ptp_ocp_sma_store_val() wrote 0 for a disabled input,
ptp_ocp_dpll_frequency_get() found no match and returned -EINVAL.

dpll_msg_add_pin_freq() passed that error up, so DPLL_CMD_PIN_GET failed
for the pin. dpll_nl_pin_get_dumpit() skips only -ENODEV, so the pin dump
also stopped at that pin. dpll_pin_freq_set() failed with "unable to get
old frequency value", so the input could not be re-enabled over DPLL.

This patch fixes that as well, because SMA_DISABLE matches the x1 "None"
entry. Should the changelog mention this case for stable backporters?

> Reported by the netdev Sashiko AI review and confirmed by code
> inspection. Source-derived C regression tests pass with ASan/UBSan;
> restoring the faulty selector, mask, disabled-state or DCF value makes
> the corresponding regression fail. Tests use stubbed MMIO, not hardware.

[ ... ]

> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.

[Severity: Low]
Does this paragraph describe this patch? The same text appears word for
word in all four patches of the series. This patch only adds the
sma->disabled check in ptp_ocp_dpll_frequency_get().

The selector and SMA_SELECT_MASK changes are in "ptp: ocp: use hardware
selectors in DPLL frequency operations". The DCF value is in "ptp: ocp:
correct the DCF output frequency". The removal ordering work is in "ptp:
ocp: prevent timestamp rearming during detach".

Could the paragraph be cut down to the testing that applies to this
patch? Someone backporting only this commit could otherwise think it
covers those other defects too.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index d449ed8ca2d8a..650047581fd41 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5920,6 +5920,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
>  	val &= SMA_SELECT_MASK;
> +	if (sma->mode == SMA_MODE_IN && sma->disabled)
> +		val = SMA_DISABLE;

[Severity: Medium]
Can this check give the wrong answer after the driver is unbound and
rebound, or after a module reload? sma->disabled exists only in software,
and ptp_ocp_sma_store_val() is the only code that sets it. The FPGA keeps
the mux values that the previous driver instance wrote.

ptp_ocp_sma_fb_init() reads the mux registers only to work out the
direction. It never sets sma->disabled:

	reg = ioread32(&bp->sma_map1->gpio1);
	bp->sma[0].mode = reg & BIT(15) ? SMA_MODE_IN : SMA_MODE_OUT;
	bp->sma[1].mode = reg & BIT(31) ? SMA_MODE_IN : SMA_MODE_OUT;

	reg = ioread32(&bp->sma_map1->gpio2);
	bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
	bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;

Disabling a direction-changeable input writes 0 to its input field, which
also clears SMA_ENABLE. In this function, val &= SMA_SELECT_MASK drops the
enable bit before sma->disabled is checked.

Take SMA3/SMA4 after a rebind: mode comes back as SMA_MODE_IN and
disabled is false. The input field reads 0, which matches "10Mhz". A
10 MHz request then hits this check in dpll_pin_freq_set():

	if (freq == old_freq)
		return 0;

So it never reaches ptp_ocp_dpll_frequency_set(). Isn't that the case
this patch sets out to fix?

For SMA1/SMA2, BIT(15) or BIT(31) in gpio1 is clear for a disabled input.
The pin therefore comes back as SMA_MODE_OUT, and DPLL reports its output
field instead.

Would it help to set sma->disabled in ptp_ocp_sma_fb_init() from the
enable bits, or to test SMA_ENABLE before masking?

All of this assumes the FPGA treats mux 0 without SMA_ENABLE as disabled
rather than as the 10 MHz selection, which I could not confirm.

>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-timecard-common-301f823ddd-0-ahmadexp%40gmail.com

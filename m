Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470592;
	b=XedA/hqms/LPEQ+0a1xqUgSGMVrSC76j88qS2VOXaRlrQH2eX/Hj8ZpnsZaNzQCc//Pr
	 IpgmYgwUXuk8eTQzcIfkbpG06IyHAlE/9Lc/qF659boaSWJ8nNUhSYvj+kQzD3mP2ZDif
	 nEtwChaBkX9RzvP/EaxSKwqAv6bjr5tIpksJa7pbYRn3GGVuIf+kkPLzQcaTDHEQuD7Pj
	 lLH3oDpm/JOj68ErNiZBKFHKghlqYOK31KInfQBP0mgAaIdgwHVC+IJOD6Z2gMmV/nu81
	 WMOt+NT3c7FL/e+ljP6zUV1Q82dA/sTjkPNIPO1bJp2lpjE6yp+iDh8rWttDM/ploSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470592;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sYRYIL1mQmbaPAJGWZh55nDTxWggSeU7XYU4jCKtyxU=;
	b=tlyyMsrBHmGX5mVd3woHG/JnXixDU+l6ClX9zZQUJA8xNBoB6LyTDEIl9NQqFfs2VX9n
	 Mkt5NNryChApIp7G++eGGfP9O7OwOuYFimEiKsu7I4SyWzioUbillUifULgxS9n4nXGC8
	 quS7642j+0yPqOJiZSEk2NMTz4Z6KFZEm9RHafw2TrUVfB0h2voCuX+HBcRPYykTA9+te
	 WGPOAxfYbrifFJqT7sy2VBnr4rekONeYoSqVN6r2xA82LvLKdLrBiy5E7n15fW7kfgMdQ
	 umvtG9e4VBKSGHn6Zz8Jh+2Qi8hUJFdeHWeSd19mfRlgs4ATNt/Pm8TDG3tBhPMoLog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J13A9DoA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC4606A338
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J13A9DoA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12991F000EB;
	Mon, 23 Nov 2026 21:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470592;
	bh=sYRYIL1mQmbaPAJGWZh55nDTxWggSeU7XYU4jCKtyxU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J13A9DoAvDa1hnzRG0y0kjPpJa5ZX1g5WP/oKD/RZ3ypyQEHueDvrGy+HSDTjAPVg
	 jms3KNTbUU7OdveYnfI8pyHyikdnJ7cKqyOVbY3444+yHfGcV/IGt8M9sQwrOjTWlQ
	 6/GpUac/BR8eVCTW7AdoBOQ3HRhUJJkbIT2aEV1/iEph939/XLHfRW+el8oQkjI+eT
	 g2ZtrOQTjW/cxlgSgJ/0F4hyN26srecccNuR7OUwQD9OTOnNZBjX/YiESxFAk9HJt3
	 OuZterE2Zxt6nlK6mJIoSO7QgmlikQAbk+rOJJUAxj5p11k3dJEQ7tTWbVtlaFH+jc
	 pQyi2LMUxhdeQ==
Subject: Re: [PATCH net v2 4/4] ptp: ocp: correct the DCF output frequency
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 richardcochran@gmail.com, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com
Date: Mon, 23 Nov 2026 21:49:51 +0000
Message-ID: <179547059147.3135.16821426799248727782@kernel.org>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-4-ahmadexp@gmail.com>
References: <20261119-timecard-common-v2-078fe69f33-4-ahmadexp@gmail.com>
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

- [Medium] This patch fixes one bad frequency in a selector table, but an
  identical bug from the same Fixes commit (09eeb3aecc6c) is left in…
- [Low] The commit message describes testing and process for changes this
  patch does not contain.

--

ptp: ocp: correct the DCF output frequency

This commit changes the DCF entry in the ptp_ocp_sma_out selector table
from 77000 Hz to 77500 Hz. That makes it match the input table and the
advertised DPLL_PIN_FREQUENCY_DCF77 value.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> Reported by the netdev Sashiko AI review and confirmed by code
> inspection. Source-derived C regression tests pass with ASan/UBSan;
> restoring the faulty selector, mask, disabled-state or DCF value makes
> the corresponding regression fail. Tests use stubbed MMIO, not hardware.
> The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
> physical card was tested.
>
> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.

[Severity: Low]
This isn't a bug, but do these paragraphs describe this commit?

The diff only changes the DCF .frequency value in ptp_ocp_sma_out. The
selector, mask, disabled-state and removal ordering work mentioned here
is not part of this patch. Someone reading this commit by itself, such
as a stable backporter, will see validation claims for code it does not
touch.

Could the series-level testing notes and the description of tool
assistance go in the cover letter or below the '---' separator instead?

The "Reported by the netdev Sashiko AI review" sentence could also become
a proper tag, or be dropped since the Link: tag is already there.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 06d05fac6e1c2..0d3d9ffd1f9b9 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -1375,7 +1375,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
>  	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
>  	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
>  	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
> -	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
> +	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },

[Severity: Medium]
Should the "10Mhz" entry in ptp_ocp_art_sma_in be fixed the same way?
It comes from the same commit, 09eeb3aecc6c, and looks like the same
kind of typo:

drivers/ptp/ptp_ocp.c:
static const struct ocp_selector ptp_ocp_art_sma_in[] = {
	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
	{ }
};

That value is 1 MHz. The matching "10Mhz" entry in ptp_ocp_art_sma_out
uses 10000000, and ptp_ocp_art_sma_init() labels 0x08 as the 10 MHz
input:

	bp->sma[0].default_fcn = 0x08;	/* IN: 10Mhz */

The ART pins advertise ptp_ocp_sma_freq. That list has
DPLL_PIN_FREQUENCY_10MHZ and no 1 MHz entry.

This produces the same two symptoms the commit message describes for
DCF.

On read, ptp_ocp_dpll_frequency_get()->ptp_ocp_art_sma_get() returns
0x08 for sma[0] in its default mode. The driver then reports 1000000 Hz,
which is outside the advertised set.

On write, take a non-fixed ART pin. A request for the advertised
10000000 Hz passes dpll_pin_is_freq_supported() in the DPLL core. The
exact match in ptp_ocp_dpll_frequency_set() then finds no entry:

	if (tbl[i].frequency == frequency)

so the request fails with -EINVAL. The core rejects a 1 MHz request, so
the ART 10 MHz input cannot be selected through the DPLL frequency
interface at all.

Could this be fixed in this patch, or in a companion patch with the
same Fixes: tag?

>  	{ .name = "GEN1",	.value = 0x0040 },
>  	{ .name = "GEN2",	.value = 0x0080 },
>  	{ .name = "GEN3",	.value = 0x0100 },

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-timecard-common-v2-078fe69f33-0-ahmadexp%40gmail.com

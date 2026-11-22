Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380072;
	b=JbGa1hPVNdAoW4I2i/oBhVW3V77ck7RGEeoDkQTipDqDmMT8TXE3N1jE+beQS6jezPyY
	 PdYxbSmI5HwAEx3H3YZYl5iSGHx2MUGtryAEhXRcY8QLyPhRfvc9Vl5B1JXFx7lP1jKOL
	 jONUvMEaAdlUYrefjQrIX/kDH88/c1Z1BCiFlLQOokPkvacFJsVKATzUo1tzScTlTjvfD
	 Q1mJcksm0f27wHxxuGjkqODS/iSoisfOV/EoJnck01icxxrZ5D2zFuTbamYya0Gkhh/LA
	 Qw3Z+93YQC3gqpdTn/TkEmeL4Xcgr0GYS+AJyjfnpPLuq395SKAzVol9pWZeHn7iMcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380072;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=636q6jaM7rA0Po/eBymCLEAcqrcFwRC63tZr1LwICak=;
	b=fDqEr1Tk/UGzqWqg+RfHOHsj+9uD+wjVJbCqJse2dV2zl/ZcNQHKIJa7xguQcjEZT2ng
	 hy+ocbFm3fJrGFsU4w3zed0Shl55hE1Zfr96QQpn43udQlnlM/X9GJUEnbrRoGXzhZMO1
	 9f4qZkNNKueZhzbVuQEJb+pJBsvA175nKPwsyXHh0H6ZOZ/G6lOZ23W6jsk0TdQhHaZZP
	 Oax0Q4EqHyjlT6TGcp2MbcrOBxE4itDT/MBF7abJ7LEpO1C1lhWPAeJM/6V9EXmZvdULk
	 UEF56BiSn4lC9VUJo9tt3h+tuXCKysYi6S1e+5qiblnfpdkub2R33XRjS8UC1awSvwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYHMYAq1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1B0606A683;
	Sun, 22 Nov 2026 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYHMYAq1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2081B1F000D1;
	Sun, 22 Nov 2026 20:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795380071;
	bh=636q6jaM7rA0Po/eBymCLEAcqrcFwRC63tZr1LwICak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OYHMYAq1FzhUzEKyGNNA0mjs+OH548HJdp8oOXqfDG6VNXjo0s/GhLuMt6XMBstYU
	 ePoL6/SJdW+bsbjRbSIPN4ugeK8kYJoPKdeISQLM2w3r4LMK6rRywsrqs74D0dbszx
	 cNEQR/GwZdOfg7jSBKmTKbRyWULweLgA+4isqCgTxPgjuovqmn45KnItLe4e9BiSk2
	 RuEATIezj3rDGHttqE+xxLK3dX5FBvgVKlLPecPSBZoIqj8ErQs78fIBBpmmmfCXF7
	 i8NsTRriRx8u0ZPfMtK//E+ddBvbqJpzZWeUXbrKCr/UCrJ3CNIjqyElnRJYfxuqeE
	 Idfsx9M4/RBLA==
Subject: Re: [PATCH net 4/4] ptp: ocp: correct the DCF output frequency
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 richardcochran@gmail.com, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org,
 pabeni@redhat.com
Date: Sun, 22 Nov 2026 20:41:10 +0000
Message-ID: <179538007070.3135.8275620503580456948@kernel.org>
In-Reply-To: <20261118-timecard-common-301f823ddd-4-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-4-ahmadexp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes one bad entry in a selector table from commit
  09eeb3aecc6c, the one named in its Fixes: tag.

--

ptp: ocp: correct the DCF output frequency

The patch changes the DCF entry in the ptp_ocp_sma_out[] selector table
from 77000 Hz to 77500 Hz. That brings it in line with the input table
and the DPLL supported frequency list, so the advertised DCF77 frequency
can be set and read back on an output pin.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 650047581fd41..aa950cae68f46 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -1376,7 +1376,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
>  	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
>  	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
>  	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
> -	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
> +	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },

[Severity: Medium]
Should the ART input table get the same kind of fix? Commit 09eeb3aecc6c,
the one in the Fixes: tag, also added this entry to ptp_ocp_art_sma_in[]:

drivers/ptp/ptp_ocp.c:
static const struct ocp_selector ptp_ocp_art_sma_in[] = {
	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
	{ }
};

The entry is named "10Mhz" but has a frequency of 1 MHz. The "10Mhz"
entry in ptp_ocp_art_sma_out[] uses 10000000.

ptp_ocp_art_sma_init() registers the ART pins with ptp_ocp_sma_freq
as their supported list:

	.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
	.freq_supported = ptp_ocp_sma_freq,

That list contains DPLL_PIN_FREQUENCY_10MHZ but not 1 MHz.

This seems to give the same two symptoms the commit message describes
for DCF, but on ART input pins.

On set, a DPLL netlink request for 10000000 passes
dpll_pin_is_freq_supported() in the core. It then reaches the
exact-match loop in ptp_ocp_dpll_frequency_set():

	for (i = 0; tbl[i].name; i++)
		if (tbl[i].frequency == frequency)
			return ptp_ocp_sma_store_val(bp, tbl[i].value,
						     sma->mode, sma_nr + 1);
	return -EINVAL;

Nothing in the table matches, so the call returns -EINVAL.

On get, ptp_ocp_dpll_frequency_get() reports 1000000 for an ART input
that selects 0x08. That value is not in the pin's advertised set. Fixed
pins hit this too, because sma[0].default_fcn is 0x08 ("IN: 10Mhz").

Would it make sense to change that entry to 10000000 in this patch, or
in a follow-up?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-timecard-common-301f823ddd-0-ahmadexp%40gmail.com

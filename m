Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380069;
	b=yQv+c2wt4/Z8PD/WTAv44EBJR7Ud60g6me28IxZrsdYnXZZYW3Wxsm5GYItktjVH84uD
	 T3D0738Fzr/9vbsx0zvyDdwi7YsTi9ZLOgXchU+4UN6ah76J8ptS1RPuIHoRa8wPc7ari
	 affMEBqirieCmpi9HT3TuZbIguR2QmRTgS701zDB6qPJmR+cTycSDrusZ1H/8T7kXW93z
	 GP5ghBeLXRqP/vrIx3qR7nLxmh5pZkT/pfKloS02/z3/KyYAKUYzYkuSA33QKy/uztLoW
	 MVDot6aFUpwVGqh7kLTuTcq4o9JqsG7y1xG7EqNdyTjOxlGDhxfs++73wPqDKNgmIKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380069;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jY1YA6TtVOdv5RNG1Xq9oOiUJTyNDkuqwgtxjcAS01Q=;
	b=deXi4qSzWo3MMPyRaEEG3JechcRzEqaryca5ylehK+6vTphI3fO1cHWnVZPKpO47SBaW
	 1VTrXLIAO9OUSLNEUjqivuvJu9Tl5DlPL0kr6hRlXzQOk5kc+4dvx2Q3mtvQZNG7lJk7C
	 B6MRQRkOLRgsVvoMQzXIZ+iHM7T1jjGYmEBTPVT5v8FnUJxo7YAbgBO6ytmhIVdk2fCp0
	 cRAmSz511Xqn+slQj/crk/nuRqZJQXw2vg3go+wLwxC3lPJIGgX914+G9d9aA3n3vGtn7
	 7Q4zH1PaALAJT1MWAUzKeM4JtcUCB9E3U9ZkXzhM2EVrZFmloZryozLIq9zcCxmgI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nz+Ub0iR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D3606A338;
	Sun, 22 Nov 2026 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nz+Ub0iR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2545E1F000CF;
	Sun, 22 Nov 2026 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795380068;
	bh=jY1YA6TtVOdv5RNG1Xq9oOiUJTyNDkuqwgtxjcAS01Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Nz+Ub0iRILd7o2nsmH6f5OVO0Zk+GpSx7+DjXGzhcLbHSkUh25D83ZqCRtoEht+B7
	 Mds0EhJnh876LezUiI0a1XTxOWTUrpDDx04C3yfNd+vnc5e2pWlS+i1WW4FHggNpbN
	 upZPbys7m2sk/RJ6BIxcN1+/88YUPx/He5gP3FRdld6IJIb2LdM7aU7Tt62ce37lm4
	 MT41VTDzp/XH8DN8ScmrGH1EjnebBQPsgPgkEgE6vMemyTNVocWeV39+flAPYrojhG
	 OiFfhHNnSWZtd6GbTbN2cLCs5H3owrlRgaS3d1HEnFbu4AkELaXRghBwK9umDSJiD6
	 rkFDGvOs74idQ==
Subject: Re: [PATCH net 2/4] ptp: ocp: use hardware selectors in DPLL
 frequency operations
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
 richardcochran@gmail.com, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, linux-kernel@vger.kernel.org,
 pabeni@redhat.com
Date: Sun, 22 Nov 2026 20:41:07 +0000
Message-ID: <179538006772.3135.15875996486888374193@kernel.org>
In-Reply-To: <20261118-timecard-common-301f823ddd-2-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-2-ahmadexp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ptp_ocp_dpll_frequency_get() (drivers/ptp/ptp_ocp.c) still fails
  with -EINVAL for an enabled, direction-configurable SMA input that has…
- [Medium] The patch says index passing makes DPLL frequency_set "fail on
  ART" and fixes that by choosing the table entry by frequency and…

--

ptp: ocp: use hardware selectors in DPLL frequency operations

This commit changes ptp_ocp_dpll_frequency_set() to pass the selector
table value instead of the table index to ptp_ocp_sma_store_val(). It
also masks the direction enable bit in ptp_ocp_dpll_frequency_get()
before the table lookup, so enabled pins whose direction can be changed
find a matching entry.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 478f7012b23e2..d449ed8ca2d8a 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -5900,7 +5900,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (tbl[i].frequency == frequency)
> -			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
> +			return ptp_ocp_sma_store_val(bp, tbl[i].value,
> +						     sma->mode, sma_nr + 1);

[Severity: Medium]
The commit message says passing the index can "fail on ART". Can a
10 MHz request on an ART input reach this line?

The ART input table lists the 10Mhz entry at 1 MHz:

static const struct ocp_selector ptp_ocp_art_sma_in[] = {
	...
	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },

ART pins advertise ptp_ocp_sma_freq (1PPS, 10MHz, IRIG-B, DCF77). So
dpll_pin_freq_set() accepts 10000000 and rejects 1000000.

A PIN_SET of 10000000 on an ART input passes the core check. It then
matches no entry in this loop and returns -EINVAL, so the corrected
tbl[i].value is never passed on. With this patch, it looks like PPS1 is
the only input function that can be programmed on ART through DPLL.

The same entry also affects ptp_ocp_dpll_frequency_get(). By default
ART SMA1 selects 0x08:

ptp_ocp_art_sma_init() {
	...
	bp->sma[0].default_fcn = 0x08;	/* IN: 10Mhz */

For that pin, the getter reports 1000000 Hz, which is not in the
advertised frequency list.

The table entry predates this patch, but the ART fix depends on
tbl[i].frequency being correct. The later patch "ptp: ocp: correct the
DCF output frequency" fixes a similar table mismatch for DCF but leaves
this entry unchanged.

Should ptp_ocp_art_sma_in[] list the 10Mhz input as 10000000 as part of
this fix?

>  	return -EINVAL;
>  }
>  
> @@ -5918,6 +5919,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  	int i;
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
> +	val &= SMA_SELECT_MASK;
>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {

[Severity: High]
Does this still return -EINVAL for an enabled input that has more than
one destination?

The commit message says that without the mask "an enabled,
direction-configurable pin has no matching table entry and its DPLL get
or dump fails". The sysfs ABI allows several input destinations, and
sma_parse_inputs() ORs them into one selector:

sma_parse_inputs() {
	...
	ret |= ptp_ocp_select_val_from_name(tbl[dir], argv[idx]);

For example, writing "IN: TS1 TS2" to smaN gives 0x000C. After
ptp_ocp_sma_store_val() adds SMA_ENABLE, 0x800C is written to the GPIO
map.

On readback, sma_op->get() returns 0x800C, and the new mask turns it
into 0x000C. Each entry in ptp_ocp_sma_in[], ptp_ocp_adva_sma_in[] and
ptp_ocp_adva_x1_sma_in[] has a single bit set. Nothing matches
val == tbl[i].value, so the function returns -EINVAL.

The sysfs reader for the same register treats it as a bitmask:

ptp_ocp_show_inputs() {
	...
		if (val & tbl[i].value) {

The -EINVAL reaches the DPLL netlink code:

dpll_nl_pin_get_dumpit()
  dpll_cmd_pin_get_one()
    dpll_msg_add_pin_freq()
      ptp_ocp_dpll_frequency_get()  -> -EINVAL

dpll_nl_pin_get_dumpit() only skips -ENODEV and -EMSGSIZE, so this
error stops the global pin dump. Pins after this one, including pins
from other DPLL drivers, are not reported.

dpll_pin_freq_set() also calls frequency_get first and returns early
with "unable to get old frequency value". As a result, the pin cannot be
recovered through DPLL frequency_set.

The later patch "ptp: ocp: report disabled SMA inputs consistently over
DPLL" only adds the disabled-input override, so this remains at the end
of the series.

Should this lookup match selector bits the way ptp_ocp_show_inputs()
does, instead of requiring an exact match?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-timecard-common-301f823ddd-0-ahmadexp%40gmail.com

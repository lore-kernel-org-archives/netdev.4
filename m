Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558226;
	b=TrTxtqWcmtUvE7HPUaueCU+3mtQjXoYGvlY6sNgxZJo+woL+IKWzyW3f/6XYMtvFIHkD
	 8AlNT6UUL/i8pZ2jRLJMpERrmVgaiac0aICqjXVznrIyaiYni8eNFTUw2J+XCmfOON4Op
	 RwyXd6ZV4XKfp2ZWA60O+58mXApbppOgmVbRHKlzGoJ2CarzWCOgKTWL7BBF4urpKLNWg
	 zi4OFTqH6rIqjCp2UdLSEdxtC/MeoslBviJ3VmLHDCcXrD5WmCYT8rB97BAmLVf2r41kU
	 sYY7QMQhfdJDPutcd8tFZdOHPrX4bS5JW5dFlX802PFXNQD+1J8Y18NdHrBTq6+p6Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558226;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=grPJl3Iqgza9gPZ4RSpU3JxYcBIXfN08pQ2Wkt/2m8g=;
	b=ke43k6ozRfsrLOM7+b7AEYteOLd8YPzLp+uJ9epBkXFYXQwxHOHV/14iB6qyIRgVWx4+
	 w4cIzFOW8SYCIf2Ued5I3cyQI0iGCpsESYHWl7qSMPoDY3wXovVTDbVUaOMbv6t9kVDf5
	 uWNQDvDjJ6+k82ZC6DG60oh+lb3beH2JkXIVlTEmITsbpCmZpclM/DJTOE36cTJGzOeSi
	 VgkwcsV0N4cg3AZFbwFVErSUuZT56puUhyoMuKcnfkDRsClTiYvRLKlXvNJ1O8x0FFEX5
	 Mqc6dyrIwIczl8FYdHg58ljpV9YN2Zl+9uwqxyMf9fMN5RsjPWSJoOV9O0z16Ub0eTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU4vXOIH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EA60A2612
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU4vXOIH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC29E1F02ED1;
	Tue, 24 Nov 2026 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558226;
	bh=grPJl3Iqgza9gPZ4RSpU3JxYcBIXfN08pQ2Wkt/2m8g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MU4vXOIHD/nGMpl9zYbMFH/8dS3QoV8VDaJi6RiAFzaP+S1bewREYuBFPnT1uzD2d
	 MC23znUr/UH8D749rwTy0pKjBQZIUu50xuqcVAIPTPwAmojG2WU+5BM+BV0G9KKYHG
	 mwK6WN+qg4lmCVlJlVCcs1he1q5Fh6obGrrBb9m9t08F/jaVFPq30WayJ3RPwO4wcB
	 YvKGC4sIpvjuruJQbHHGwJdNL1dA4rtB//5GywVNGQaKrpidxDcBv5aBlWwD3gNg4c
	 9NaVLIEAEX5KqvCoVB00PJ0P5cszTBjUZKnTCZ//ohciBbP7IE/FbkoKRiUoSdA7LT
	 /ahjQp7C/13Ig==
Subject: Re: [PATCH net v3 2/4] ptp: ocp: use hardware selectors in DPLL
 frequency operations
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com
Date: Tue, 24 Nov 2026 22:10:25 +0000
Message-ID: <179555822538.3135.15182959488825985221@kernel.org>
In-Reply-To: <20261120-timecard-common-v3-33316bf475-2-ahmadexp@gmail.com>
References: <20261120-timecard-common-v3-33316bf475-2-ahmadexp@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The mask fix does not cover adva_x1 after a DPLL direction
  change to input.

--

ptp: ocp: use hardware selectors in DPLL frequency operations

This commit makes ptp_ocp_dpll_frequency_set() pass the selector table
value to ptp_ocp_sma_store_val(). Before, it passed the table index. It
also masks the direction enable bit in ptp_ocp_dpll_frequency_get()
before the table lookup, so that enabled, direction-configurable pins
resolve to a table entry.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index b16d36c3305f9..95a4df468e793 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c

[ ... ]

> @@ -5887,6 +5888,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
>  	int i;
>  
>  	val = bp->sma_op->get(bp, sma_nr + 1);
> +	val &= SMA_SELECT_MASK;
>  	tbl = bp->sma_op->tbl[sma->mode];
>  	for (i = 0; tbl[i].name; i++)
>  		if (val == tbl[i].value) {

[Severity: High]
Does this mask fix the get/dump failure on adva_x1 after a DPLL direction
change to input?

ptp_ocp_dpll_direction_set() always writes selector 0, whatever the
board:

drivers/ptp/ptp_ocp.c:ptp_ocp_dpll_direction_set() {
    ...
	return ptp_ocp_sma_store_val(bp, 0, mode, sma_nr + 1);
}

On a direction-configurable pin (fixed_dir is false), the call path is
ptp_ocp_sma_store_val() -> ptp_ocp_sma_adva_set_inputs(). Along the way
SMA_ENABLE is ORed in, so 0x8000 is written to the input mux. Once the
new mask is applied in ptp_ocp_dpll_frequency_get(), that leaves 0.

On fb and adva, 0 matches the "10Mhz" entry. The adva_x1 input table has
no 0x0000 entry:

static const struct ocp_selector ptp_ocp_adva_x1_sma_in[] = {
	{ .name = "PPS1",	.value = 0x0001,      .frequency = 1 },
	{ .name = "TS1",	.value = 0x0004,      .frequency = 0 },
	...

So the lookup loop finds nothing and returns -EINVAL.

ocp_adva_x1_sma_op uses ptp_ocp_sma_fb_init(). When sma_map2->gpio2 is not
0xffffffff, the adva_x1 pins keep fixed_dir false and
DIRECTION_CAN_CHANGE, so a DPLL pin-set with direction=input reaches this
path.

After that:

- dpll_cmd_pin_get_one() fails, so PIN_GET and the change notification
  fail for that pin.
- dpll_nl_pin_get_dumpit() breaks out on any error other than -ENODEV,
  so the whole pin dump fails, not just this pin's entry.
- dpll_pin_freq_set() calls frequency_get first and stops with "unable
  to get old frequency value", so the pin cannot be recovered through
  DPLL.

The commit message says the corrections apply "to all board variants".
Would adva_x1 need a board-specific default selector in
ptp_ocp_dpll_direction_set(), or a matching entry in
ptp_ocp_adva_x1_sma_in[]?

Later patches in this series do not change this path either. Those are
"ptp: ocp: report disabled SMA inputs consistently over DPLL" and "ptp:
ocp: correct the DCF output frequency".

ptp_ocp_dpll_direction_set() clears sma->disabled, so the disabled-state
substitution added later does not trigger here. The adva_x1 input table
is unchanged at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-timecard-common-v3-33316bf475-0-ahmadexp%40gmail.com

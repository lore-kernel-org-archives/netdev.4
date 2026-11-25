Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581886;
	b=IzP3ru0OBGq/Rp5sK0GtPwXLAnH6s9yDMWdssq7JMIbm9RiGBOCGS3MYivY/S1Nk/dwH
	 sckRqiHpK8QI0sBOsyX8NUznpx8eI0avZB+ibx5FZNcs6KOjxWp6sDoRmG1+F4jQ37o2H
	 YmVuLrEbfzf4qDcdGDPeUVPZYktcMOe9B84mh3uEVGuYXvNh4TRZMBmzFp0CEvkmaqz2J
	 JXDVGF7fXR+EXd6bL3o7udgDnI/mhvuBs6iIVJ4Q09ukAEXRtZD2zOhAuwyBBfdGtnPUQ
	 YpjsxxyRjJDEklYGQ8GHNqjyjSjZW59XiEGg3E0RS/NxfvR9Y+nI6h/9Vy1zlJws4Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581886;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zPdoHSJZrfNjUsSTg3j0Mv6qk8YgKRtS0WU3iD70Png=;
	b=afXDP1CTfDxbrPQQU3Szn762Bmw6SmGgwPcLc3QgKho9Ym8YY1OMAyOyyZcg441K1k1k
	 ELhvB3rvJyxL/n4xxml3OnjoY9k9wNX8xumbpv4+zzmsaH/K49edo7KfoVg1YMukcbtJm
	 g371EFtovLBNvbJbyw8iXaK0qRlB4RGsMYy4C8E4JBJ0kf3PiyMqK+KL6ByI6/sg3rttX
	 6o/VIxhaB3xQOQLwbFsglr9L8Bpb3yDqhYOEPq5qn/iGTFDZYHmIRaIAxfQ/M3d6tAsyc
	 R/1MJ2+ulkjIMiPjAJlu4Dbc0nRn8l0f51fUXYsfLnWZN6wBJmS/9URivr3JBZddHIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQbYPGw1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82F606A31E;
	Wed, 25 Nov 2026 04:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQbYPGw1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFA61F000C6;
	Wed, 25 Nov 2026 04:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795581886;
	bh=zPdoHSJZrfNjUsSTg3j0Mv6qk8YgKRtS0WU3iD70Png=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PQbYPGw1oJvZxsTd9Oc3UIo0REDCbPuA7ihBSRsMnUdRc4sWEAh3IxdoeMfJQi3Mv
	 Y0hQWbdaTsjHuwy/gS1u6pSEa1UrPPVHx7ndk9iKVuse4Jvkq8VWOYWHaZ/P6HVa/S
	 YOR4R7em3UoF1gTQK2XURYJB+FKQNgW7DTml8OpkRsupfo72Ne1/HTwO0BvMpFOfrm
	 Z8o1fqIcWQGYN25J/D0QUfg9ZSqb8cWPIFo1dozEy1hAxN7jn7Liuu7SdZNSf5sSgv
	 cCSUxVJrQ2wZccb551pN9F3gMxQsRSo+O0dSYQZfekeNRHm8XQQCPaY2piDMEMZKp5
	 U5aqkhcv6CQUQ==
Subject: Re: [PATCH net v5 2/8] net: dsa: sja1105: leave the pin function
 unchanged on EXTTS disable
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, arkadiusz.kubalewski@intel.com,
 arnd@arndb.de, davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us,
 john.stultz@linaro.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev
Date: Wed, 25 Nov 2026 04:44:44 +0000
Message-ID: <179558188491.3135.14757848220793182596@kernel.org>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-2-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-2-ahmadexp@gmail.com>
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

- [High] This patch fixes only one direction of the shared PTP_CLK pin
  problem.

--

net: dsa: sja1105: leave the pin function unchanged on EXTTS disable

This patch makes sja1105_extts_enable() switch the shared PTP_CLK pin to
the EXTTS function only when timestamp capture is being enabled. Disabling
EXTTS previously turned an output pin back into an input and stopped the
periodic output.

Link: https://lore.kernel.org/r/179548551283.3135.17206659598806657887@kernel.org

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

[Severity: High]
Should sja1105_per_out_enable() in the same file get the same guard? It
still switches the pin before it looks at on:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_per_out_enable() {
    ...
	mutex_lock(&ptp_data->lock);

	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
	if (rc)
		goto out;

	if (on) {
    ...
}

On SJA1105P/Q/R/S and SJA1110, avb->cas_master is 0 when PTP_CLK is an
input. This is the boot default, and it is also the state after an EXTTS
enable:

drivers/net/dsa/sja1105/sja1105_main.c:sja1105_init_avb_params() {
    ...
	/* On P/Q/R/S, configure the direction of the PTP_CLK pin as input by
	 * default. This is because there might be boards with a hardware
	 * layout where enabling the pin as output might cause an electrical
	 * clash. ...
	 */
	avb->cas_master = false;
    ...
}

In that state, sja1105_change_ptp_clk_pin_func() computes
old_func = PTP_PF_EXTTS. It then sets avb->cas_master = 1 and writes
BLK_IDX_AVB_PARAMS. As a result, a PEROUT disable turns the pin into an
output, and the disable branch only issues stopptpcp after that.

Userspace can trigger this through two paths:

  ptp_ioctl(PTP_PEROUT_REQUEST) with a zero period
    -> ptp_perout_request()
      -> ops->enable(ops, &req, 0)
        -> sja1105_per_out_enable(on = false)
          -> sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT)

  ptp_ioctl(PTP_PIN_SETFUNC) moving pin 0 away from PTP_PF_PEROUT
    -> ptp_set_pinfunc()
      -> ptp_disable_pinfunc(info, PTP_PF_PEROUT, chan)
        -> enable(PEROUT, 0)

Neither path checks whether PEROUT was ever started. That means this can
happen even on a freshly booted switch.

Could the switch then drive a line that an external source, such as a PPS
input, is also driving? Avoiding that is the reason for the boot default
above.

If EXTTS was active, capture also stops in hardware. However,
priv->ptp_data.extts_enabled stays true and extts_timer keeps polling. A
retained PTP_PF_EXTTS pin assignment would no longer match the hardware.

The commit message says "EXTTS and PEROUT share PTP_CLK". The same
mechanism is still reachable through this mirror call site. No later patch
in the series changes sja1105_per_out_enable().

Would it make sense to call
sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT) there only when on is
true, as part of this patch?

>
>  	priv->ptp_data.extts_enabled = on;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-timecard-common-v5-d669cfa034-0-ahmadexp%40gmail.com

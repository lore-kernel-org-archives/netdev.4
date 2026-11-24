Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485514;
	b=dOlas9CJ+Aws10LpAyTJshqs83PLYVnru2NDdh+B6dc2o9vTJfXwgrQUcROWndcegpvo
	 hR7Qs6KGOlo2RX/FFAg2nAOx80B7dC/HIqu0ewXeEYQOJ2qaJJkTuYedRUg1oxvs1+Jaf
	 W8vxbtQQMq3wQzWhJKoneL51VY+NGNDxmvacn6F3GrlgtwLeZET10bGBBATauq+TgiTp9
	 zGZ4U3fqjWly/O2i12d4bESpMUa6K8fa7zZo/Od7BgbO3Wsyil2ico4yQ36o3mhTsoH6e
	 Ri6Qyjq8bXcwmn/ox0f/5La17nC8bvlnFomqDfyHLkgNYoc4hihND1wVO/fxFBluANg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485514;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pMhLceTKfDfL00FtyrhGIVm1q+rX/8em5PQAc5PqPm0=;
	b=unzMS3UXZGqIMTxtxf3mV2RLHHiDXp0ncC58DHgl4/7AAU4j03/usULK3qTEMvoLEGgo
	 J/qJ8/+tyGcl7WSmjMqRIpZBo+YumG8Wk2kK3IqlDZJorGjZL563CPKqNTbvG0QzvZFQV
	 /780FY/4AXTixa+jk2pIMLYV6F/fn2JqBopLfHi0lld2zDzHfLzT6cXLCXhV+y/Iz5ThQ
	 6VwzudGIG0YLP2pMEunUH5rr0aShD1giqcqrZ7cPzNAzgmy/o38doSrAgNzb0lAkYk3G3
	 +tLFhUiejPRKjqR4A35H0d25A4zvez2P2mLzKqhztqwYJcYl2l6GTODSfbmF8Pqsj2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPA8VEOe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC5606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPA8VEOe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506D41F000C6;
	Tue, 24 Nov 2026 01:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795485514;
	bh=pMhLceTKfDfL00FtyrhGIVm1q+rX/8em5PQAc5PqPm0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZPA8VEOeBJ7t5MKuD+f9MUjd0DlMXwKPNZP2KzlRoCOoGtp2OshAf3xZvyjTYUb/i
	 agS6aupbnxAqXxAKbmKuI8bwTEO6N+qdh29r/2eE0d0qTUX2NAU5Ow4YEjkp+qxpqA
	 li2vtZMtuLCopED30mVvkMNMfmuoQxGbdCXyxbXzvpJtldYWucQXSrDxL9IWObBk2r
	 5MH/kv51WDXSCKDS25lNGGt0jNZJWF974V644PQ00xjG3QHVAIJGdnfLXPH2CqzSMq
	 6jCdo5pTXhrSh9tiExee5gLKhCQsUWTyxQXUIfCbw94+uqwGKql/PcKLfLw7gmN1BA
	 9a9nqeWQmMWQg==
Subject: Re: [PATCH net v4 1/5] ptp: disable all timestamp channels after
 removing the user interfaces
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com
Date: Tue, 24 Nov 2026 01:58:32 +0000
Message-ID: <179548551283.3135.17206659598806657887@kernel.org>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-1-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-1-ahmadexp@gmail.com>
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

- [Medium] Nothing serializes the two callers of ptp_ocp_ts_enable()
  (drivers/ptp/ptp_ocp.c).
- [Low] ptp_disable_all_events() (drivers/ptp/ptp_chardev.c) now sends
  PTP_CLK_REQ_EXTTS with on=0 to every channel below info->n_ext_ts,…

--

I found two possible regressions in commit 9b634abf9770 (ptp: disable all timestamp channels after removing the user interfaces). One is a runtime race on the shared PPS source in ptp_ocp_ts_enable() that the narrowed shortcut opens up. The other is a teardown side effect on sja1105, where the new blanket EXTTS disable changes the pin direction.

ptp: disable all timestamp channels after removing the user interfaces

This patch changes ptp_disable_all_events() to send an EXTTS disable to
every channel below n_ext_ts, not only to pins assigned to PTP_PF_EXTTS.
It removes the early timestamper disable loop from ptp_ocp_detach(). It
also narrows the pps_req_map shortcut in ptp_ocp_ts_enable() so that a
disable with an empty map still reaches the registers.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev
Link: https://lore.kernel.org/r/08537eb6-3f85-4a46-b3be-46796998eda4@linux.dev

> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index f63b45f5ee6ae..5835c01cddb49 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -53,11 +53,15 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
>  	unsigned int i;
>  
>  	mutex_lock(&ptp->pincfg_mux);
> -	/* Disable any pins that may raise EXTTS events */
> -	for (i = 0; i < info->n_pins; i++)
> -		if (info->pin_config[i].func == PTP_PF_EXTTS)
> -			ptp_disable_pinfunc(info, info->pin_config[i].func,
> -					    info->pin_config[i].chan);
> +	/* EXTTS requests do not require a pin assignment. */
> +	for (i = 0; i < info->n_ext_ts; i++) {
> +		struct ptp_clock_request req = {
> +			.type = PTP_CLK_REQ_EXTTS,
> +			.extts.index = i,
> +		};
> +
> +		info->enable(info, &req, 0);
> +	}

[Severity: Low]
Can this loop change the hardware pin direction on sja1105 during
teardown?

The commit message says "Keep the pin configuration unchanged". However,
sja1105 registers n_pins=1, n_ext_ts=1 and n_per_out=1, and EXTTS and
PEROUT share the single PTP_CLK pin. Its EXTTS handler switches the pin
function whatever the value of on:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_extts_enable() {
    ...
	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
	if (rc)
		return rc;

	priv->ptp_data.extts_enabled = on;
    ...
}

When the old function differs, sja1105_change_ptp_clk_pin_func() does:

	avb->cas_master = (func == PTP_PF_PEROUT);

	return sja1105_dynamic_config_write(priv, BLK_IDX_AVB_PARAMS, 0, avb,
					    true);

On SJA1105P/Q/R/S and SJA1110, suppose PEROUT was the last function used
on the pin (through PTP_PEROUT_REQUEST or PTP_PIN_SETFUNC). Teardown then
takes this path:

sja1105_teardown()
  sja1105_ptp_clock_unregister()
    ptp_clock_unregister()
      ptp_disable_all_events()
        sja1105_extts_enable(on=0)

That path now clears cas_master and writes AVB_PARAMS over SPI. PTP_CLK
becomes an input and the periodic output stops, while
pin_config[0].func still reads PTP_PF_PEROUT.

Before this patch the pin's func was not PTP_PF_EXTTS, so no EXTTS
disable was sent and the output kept running.

On SJA1105E/T the helper always sees old_func as PEROUT. Every unregister
now calls sja1105_dynamic_config_write(BLK_IDX_AVB_PARAMS), which returns
-ERANGE before any SPI transfer, so it has no effect there.

Is this teardown side effect intended? If so, should the commit message
mention it?

[ ... ]

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 625a85b2dc7e5..b16d36c3305f9 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -2559,8 +2559,8 @@ ptp_ocp_ts_enable(void *priv, u32 req, bool enable)
>  		else
>  			bp->pps_req_map &= ~req;
>  
> -		/* if no state change, just return */
> -		if ((!!old_map ^ !!bp->pps_req_map) == 0)
> +		/* Skip the register update while a subscription remains. */
> +		if (old_map && bp->pps_req_map)
>  			return 0;
>  	}

[Severity: Medium]
Can a disable that finds the map already empty now undo a concurrent
enable at runtime?

Nothing serializes the callers of ptp_ocp_ts_enable():

  - extts_enable_store() in drivers/ptp/ptp_sysfs.c calls ops->enable()
    without taking ptp->pincfg_mux.
  - ptp_extts_request() and ptp_enable_pps() in ptp_chardev.c call it
    under pincfg_mux.
  - ptp_ocp_enable() sends both PTP_CLK_REQ_PPS and PTP_CLK_REQ_EXTTS
    index 5 to bp->pps, and takes no driver lock.

Before this patch, a disable with old_map == 0 and a new map of 0
returned early. Now it goes on to the register disable. Suppose the map
is 0 and the source is disabled:

CPU A (sysfs: echo "5 0" > extts_enable)
ptp_ocp_ts_enable(bp->pps, OCP_REQ_TIMESTAMP, false)
  old_map = 0, pps_req_map = 0
  shortcut not taken, enters the disable branch

CPU B (PTP_ENABLE_PPS ioctl, enable=1)
ptp_ocp_ts_enable(bp->pps, OCP_REQ_PPS, true)
  old_map = 0, pps_req_map = OCP_REQ_PPS
  iowrite32(1, &reg->enable);
  iowrite32(1, &reg->intr_mask);
  returns success

CPU A
  iowrite32(0, &reg->intr_mask);
  iowrite32(0, &reg->enable);
  synchronize_irq(irq_vec);

The result is pps_req_map == OCP_REQ_PPS with the source hardware
disabled. No PPS events reach the pps device, even though the ioctl
returned success. The state stays inconsistent until userspace disables
and re-enables PPS.

Older interleavings of the same kind also remain. Examples are an ioctl
disable racing a sysfs enable, or a lost |= or &= update on pps_req_map.

The commit message acknowledges that "An overlapping extts_enable sysfs
request and ioctl can leave an empty map with the source enabled", but
this patch only handles that at teardown.

Could the pps_req_map update and the register writes be serialized
instead? Two options:

  - Use a driver mutex. A spinlock won't work, because synchronize_irq()
    can sleep.
  - Make extts_enable_store() take pincfg_mux, as the ioctl paths do.

With either one in place, the original shortcut would still be correct
and this change would not be needed.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp%40gmail.com

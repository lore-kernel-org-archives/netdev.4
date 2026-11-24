Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558225;
	b=1St2dpnMmMvOP/KcgmYk+ySdgByDcnVlBDGr9YqCeSmEgGL2ObhhmOwKeuOhIudBB7YV
	 j1g7T5WAXqrLMxK3wYRQjlCdJVZqRowdmxqC+WSGWEmBXoIXiRM85yT4J/KtIrNzkc5XL
	 uylBPYg7k4u2C6HsgwbQridT8b8yBWX2tKpSMXB5Qa9Mra6MqsN+ogtfJC0T+QHBDa5Tg
	 k0QiSkxbHeLoNdrocr0io+frpy6sqO6J6Gu2IO4QMpOcIVDvdOFEz5CggWdGS6tUsfIPv
	 w8stfQeP+ZeG9Ufrl1LRVSnJC4c4taLZLFWmXSz0UyCKJKyZXQg/HwBr3DMZhCc7i7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558225;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3XsF0pdTj2E6P4E49Yy+ra62HdqMcgKB+fDzSWipd20=;
	b=mZM6JxrZuBkBkaeiuNVyVqFBh30HbrKNBJZMkUTNENiOppTGalZRT7UFli9GUMVth2oP
	 xZ62U8yCXSaqV/mWGNZ0eDbkfgBrZ9Y6qHhKUdbY2sIKx2OO1HIGu3Fee0Exzs3GKB+Rd
	 +v1naiIEl+oM4OURhFKoxLroiVzo7eX0s6CP6z2zABIINwpppz9am1lJc8+g3aatRjkMj
	 l1HVdm7esD/wTRpSPo2ccQHSQ1O1MbjiH+GTHBlDU5S5XlEEqiKFmR/6pkgdUFbzE/2x9
	 5zkUA/toaRPEtOBnX9b/u4PUPjg2OFBEnceb/IpTygvvzJoAdv9AaPE60PJnHHQoZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0Hwg87M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD260A3823
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0Hwg87M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AAA1F02ED6;
	Tue, 24 Nov 2026 22:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558224;
	bh=3XsF0pdTj2E6P4E49Yy+ra62HdqMcgKB+fDzSWipd20=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y0Hwg87M6vyKRDXIZcEXNMN9FUMw1g2qV/VWnoJtZJ8qF0Cp31UxdwfiFYAOpBHoY
	 zGvEaYMTRcCy57JE7qG5bYmzTMru+tVQZvmChyulKfEkfjQNua7OwC/AfNvLcmSFe7
	 nYNitJ/7t0BYZUtH3Lok4BFcwz7ZjNr70sYllVITUiep0AvKIuCNzMn6QYmgUgDz2i
	 AOnuTCeXN4vEzBrz2tu6g7NyTmlkjUKXALeeGXGAPNhkazH9lmhvPpCYGg8xNXvhFn
	 1JTMKt+s3wW1UYXUEjOxiq1UMvY8AAxdPF/Xg9xou0VgXyweIGcDaqVfUndz0FeMgc
	 L0m2vE/wesYWw==
Subject: Re: [PATCH net v3 1/4] ptp: disable all timestamp channels after
 removing the user interfaces
From: netdev-bot+sashiko@kernel.org
To: ahmadexp@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 arkadiusz.kubalewski@intel.com, davem@davemloft.net, edumazet@kernel.org,
 jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk,
 vadim.fedorenko@linux.dev, vladimir.oltean@nxp.com
Date: Tue, 24 Nov 2026 22:10:23 +0000
Message-ID: <179555822342.3135.3643426123083976487@kernel.org>
In-Reply-To: <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com>
References: <20261120-timecard-common-v3-33316bf475-1-ahmadexp@gmail.com>
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

- [Medium] The new skip condition in ptp_ocp_ts_enable(), `if (old_map &&
  bp->pps_req_map) return 0;`, lets a redundant disable on the shared…
- [Low] The commit message's testing statement describes private, out-of-
  tree test harnesses and leaves out the information netdev requires.
- [Low] After this patch, ptp_disable_all_events() calls the driver's
  EXTTS disable for every channel below n_ext_ts, whatever the pin…

--

ptp: disable all timestamp channels after removing the user interfaces

This patch changes ptp_disable_all_events() to disable every EXTTS channel
below n_ext_ts, not just the channels that have a PTP_PF_EXTTS pin
assigned. It removes the timestamp-disable loop that ptp_ocp_detach() ran
before unregistering and leaves the final shutdown to the core. It also
changes ptp_ocp_ts_enable() so that a disable on an empty PPS
subscription map still reaches the register-disable path.

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Link: https://lore.kernel.org/r/4e42134b-b017-4836-9772-9c1915b16e77@linux.dev

> The source-derived ASan/UBSan tests exercise late and in-flight enables,
> the early-disable/map race, concurrent sysfs/ioctl requests, active IRQ
> draining and shared PPS users.
> KUnit tests exercise real PTP registration and unregistration in QEMU
> with KASAN and lockdep, using a test callback without physical hardware.

[Severity: Low]
Where can these tests be found? They are not part of this patch or the
series, and drivers/ptp/ has no KUnit infrastructure.

The patch also changes how ptp_ocp programs its registers: the shared PPS
shortcut in ptp_ocp_ts_enable() and the removed disable loop in
ptp_ocp_detach(). Was this tested on TimeCard hardware?

Documentation/process/maintainer-netdev.rst says:

  If the bug is in a hardware driver, the testing statement must include
  information about the HW on which the fix was tested.

The changelog says Codex revised the code and tests.
Documentation/process/coding-assistants.rst asks that the changelog say
so explicitly when a fix could not be tested.

Could the changelog name the hardware that was used, or state that
ptp_ocp was not tested on hardware?

> diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
> index f63b45f5ee6ae..193e6baf2b475 100644
> --- a/drivers/ptp/ptp_chardev.c
> +++ b/drivers/ptp/ptp_chardev.c
> @@ -53,11 +53,9 @@ void ptp_disable_all_events(struct ptp_clock *ptp)
>  	unsigned int i;
>  
>  	mutex_lock(&ptp->pincfg_mux);
> -	/* Disable any pins that may raise EXTTS events */
> -	for (i = 0; i < info->n_pins; i++)
> -		if (info->pin_config[i].func == PTP_PF_EXTTS)
> -			ptp_disable_pinfunc(info, info->pin_config[i].func,
> -					    info->pin_config[i].chan);
> +	/* EXTTS requests do not require a pin assignment. */
> +	for (i = 0; i < info->n_ext_ts; i++)
> +		ptp_disable_pinfunc(info, PTP_PF_EXTTS, i);

[Severity: Low]
Can this reconfigure hardware on drivers whose EXTTS disable callback has
side effects? ptp_disable_all_events() now calls the EXTTS disable for
every channel. It does this whether or not a pin is assigned to EXTTS,
and whether or not the channel was ever enabled.

sja1105 sets n_pins = 1 and n_ext_ts = 1. Its single PTP_CLK pin is
shared between EXTTS and PEROUT. sja1105_extts_enable() switches the pin
function before it checks on:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_extts_enable() {
    ...
	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS);
	if (rc)
		return rc;

	priv->ptp_data.extts_enabled = on;
    ...
}

sja1105_change_ptp_clk_pin_func() treats the pin as PEROUT when
cas_master is set, and always does so on E/T parts:

drivers/net/dsa/sja1105/sja1105_ptp.c:sja1105_change_ptp_clk_pin_func() {
    ...
	if (priv->info->device_id == SJA1105E_DEVICE_ID ||
	    priv->info->device_id == SJA1105T_DEVICE_ID ||
	    avb->cas_master)
		old_func = PTP_PF_PEROUT;
    ...
	avb->cas_master = (func == PTP_PF_PEROUT);

	return sja1105_dynamic_config_write(priv, BLK_IDX_AVB_PARAMS, 0, avb,
					    true);
}

On teardown the call chain is now:

sja1105_teardown()
  sja1105_ptp_clock_unregister()
    ptp_clock_unregister()
      ptp_disable_all_events()
        ptp_disable_pinfunc(info, PTP_PF_EXTTS, 0)
          sja1105_extts_enable(on=false)
            sja1105_change_ptp_clk_pin_func(priv, PTP_PF_EXTTS)
              sja1105_dynamic_config_write(BLK_IDX_AVB_PARAMS)

This switches a pin that is running PEROUT into EXTTS input mode, and
rewrites the AVB params table over SPI.

On SJA1105E/T this happens on every teardown, even though
sja1105_ptp_verify_pin() rejects PTP_PF_EXTTS on those parts. Before this
patch, the path ran only when pin_config[0].func was PTP_PF_EXTTS.

The core also ignores the return value, so an SPI failure here goes
unreported.

Is this reconfiguration intended?

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
Does this widen the race on pps_req_map at runtime? Before this patch, a
disable on an already empty map returned early. Now it falls through to
the register disable:

	iowrite32(0, &reg->intr_mask);
	iowrite32(0, &reg->enable);
	...
		synchronize_irq(irq_vec);

The pps_req_map read-modify-write is not serialized against the register
writes:

  - extts_enable_store() and pps_enable_store() in ptp_sysfs.c call
    ops->enable() without any lock.
  - ptp_extts_request() and ptp_enable_pps() hold only ptp->pincfg_mux,
    which the sysfs paths never take.
  - ptp_ocp_enable() takes no driver lock.

One possible interleaving, with TS5 never enabled:

CPU A (echo '5 0' > extts_enable)     CPU B (PTP_ENABLE_PPS, 1)
ptp_ocp_ts_enable(enable=false)
  old_map = 0, map = 0
  0 && 0 is false, continue
                                      ptp_ocp_ts_enable(enable=true)
                                        old_map = 0, map = OCP_REQ_PPS
                                        iowrite32(1, &reg->enable)
                                        iowrite32(1, &reg->intr_mask)
  iowrite32(0, &reg->intr_mask)
  iowrite32(0, &reg->enable)
  synchronize_irq()

The result is pps_req_map == OCP_REQ_PPS with the source masked and
disabled. PPS and EXTTS index 5 events would stop with no error. The
debugfs summary would show the source as off while the map still shows a
subscription.

The commit message acknowledges this race:

  An overlapping extts_enable sysfs request and ioctl can leave an empty
  map with the source enabled.

However, only teardown is made to tolerate it. Would a driver mutex held
across the pps_req_map update and the register programming be more
robust? It would need to be a mutex rather than a spinlock because of
synchronize_irq(). With that lock in place, the original transition-based
shortcut would also be correct again.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-timecard-common-v3-33316bf475-0-ahmadexp%40gmail.com

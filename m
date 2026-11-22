Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313181;
	b=W6XFIGsRITHrcDnCrv6KZVM+7MJrVYQf8nf9AFRces3I1sVCCQqSzQE7/AB0Uu3Ctw1n
	 oJgHLTQ+aJdIRNlA4z5szAKh8wrLPKfgUoLlf0bOAXISxO3sTIfyJVU7oi/gXjgDfk6tj
	 bh9FGmzPeDaNJUbqqPKw3LMjdKocUtsJjEi6ZaYtPKasvlJCkBQhiophcHv7YLWmniCIU
	 JykflEarfN8Lz4Vir/0lwUhs9BY878WDriSzT3mPDmeJxjEqk0zAG+ssaNITxEQABv6LO
	 aZhRZibFvGpySXDOg6Ey3wHALbPXst6gMi1clgvGYkoDuPRBOxjkIsZeCPUDD/yJqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313181;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dEnkapeRnfFV6E+zu66FrpGD/YUjf1f+f1RLCOGBPoI=;
	b=p2up024baxH4F2s9llTVx1Vy0yxQ2DQjCOKM6JJkIChCkmBvxNZMQd7WhP+Q3mT8DC1z
	 Af3myXVLCo70kzHhHlHQ/+XrM9dzNYZNXzftGyEjMeRS78weQiQDHWozMP+1qGBf83qfH
	 JqiBJ93tPn1S0U1lZs1EaWEf6cSgoOS4Gl1ht+xbvNmqikBY/5p9pbFLmXQ1TlF9/2P87
	 MuHLSRvcHLSoZQOd4zVBGomnQpzy8JsbPZw4yJI+TcSLVppwkW47k2vJpHg+SH1zp0E+3
	 bWFhV9s0RTndyZhVq55gVRiiON05FVKTh1uFIf89n+Jg9aWRuELTE31S//S1MXgmClg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YalRjlxg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BADE606A320;
	Sun, 22 Nov 2026 02:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YalRjlxg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81B01F000C0;
	Sun, 22 Nov 2026 02:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795313181;
	bh=dEnkapeRnfFV6E+zu66FrpGD/YUjf1f+f1RLCOGBPoI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YalRjlxg68ljOxtTlXXmOhV7A1JdPSwzk9wrbMR8QTpe8ZaOHGWUTzwTYHfuJvIiA
	 3z3KPYEPKX3Vb1Py0Po6ypLvmwv+DeTD4BskXbZZywwjegjgfcsMw3rpFGaqnxemTW
	 83hSLPMiJA6q9LuSUuDj0XXvg37GBjuvpWyzJYTTzMPz6E1coIyzMmf0rICthhogB2
	 5i9mpj6w65W+Gw6DIAUIxXOBSFc0ApOReUZdEoE09U0u7YO5pbxVYRU/WmUwQOf0TB
	 ah7Flze1QxI7FqGwhZOnITb2bbBzGPQM+T2inpA6TFq1hXVxuUyvBVDmTKlzsucrV+
	 oRWrXKQAyigOw==
Subject: Re: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
From: netdev-bot+sashiko@kernel.org
To: laixiangwu@cmss.chinamobile.com
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, sean.wang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Sun, 22 Nov 2026 02:06:20 +0000
Message-ID: <179531318026.3135.909782780821579093@kernel.org>
In-Reply-To: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>
References: <20261118014114.1855-1-laixiangwu@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Medium] The new err_powers/err_disable_core_pwr paths in
  mt7530_setup() disable core_pwr/io_pwr, but mt7530_remove() was not…
- [Low] This is speculative and depends on the hardware.

--

net: dsa: mt7530: fix regulator leak in mt7530_setup()

This commit adds two error labels to mt7530_setup(). Error paths taken
after the core and io regulators are enabled now disable them again. The
common cleanup is guarded by a priv->id == ID_MT7530 check because MT7621
shares the sw_setup callback but never enables the regulators.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d5a199293f78a..46f827838a519 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -2579,16 +2581,27 @@ mt7530_setup(struct dsa_switch *ds)
>  	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
>  		ret = mt7530_setup_gpio(priv);
>  		if (ret)
> -			return ret;
> +			goto err_powers;
>  	}
>  #endif /* CONFIG_GPIOLIB */
>  
>  	/* Flush the FDB table */
>  	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
>  	if (ret < 0)
> -		return ret;
> +		goto err_powers;
>  
>  	return 0;

[Severity: High]
Is this fix complete? mt7530_setup() is only the sw_setup callback. On
success it returns 0 with both core_pwr and io_pwr enabled.

The real ds->ops->setup is mt753x_setup(), and it can still fail after
that without disabling either supply:

drivers/net/dsa/mt7530.c:mt753x_setup() {
	int ret = priv->info->sw_setup(ds);
	...
	ret = mt7530_setup_irq(priv);
	if (ret)
		return ret;

	ret = mt7530_setup_mdio(priv);
	if (ret)
		return ret;
	...
}

mt7530_setup_irq() can return -EPROBE_DEFER from of_irq_get(), or fail in
devm_regmap_add_irq_chip_fwnode(). mt7530_setup_mdio() can fail in
devm_mdiobus_alloc() or devm_of_mdiobus_register(), and the latter can
also defer.

Later failures in the DSA core are not covered either. These include
dsa_switch_setup_tag_protocol(), user MII bus registration, and
dsa_tree_setup_ports/conduit/lags in dsa_tree_setup(). Those paths call
ds->ops->teardown, but mt753x_teardown() only cancels stats_work.

In all of these cases dsa_register_switch() fails and mt7530_probe()
returns the error. That means mt7530_remove() never runs, and it holds
the only matching regulator_disable() calls.

The devm regulator handles are then released with a non-zero
enable_count, which hits this warning:

drivers/regulator/core.c:_regulator_put() {
	/* Docs say you must disable before calling regulator_put() */
	WARN_ON(regulator->enable_count);
	...
}

The provider's use_count is also never dropped. Each -EPROBE_DEFER retry
enables the supplies again with a new handle, so the count keeps growing
and the switch stays powered and out of reset with no driver bound.

Would it work better to move ownership of the regulators? For example,
probe could enable them and register a devm action to disable them.
Another option is to unwind in mt753x_setup() and mt753x_teardown() and
change mt7530_remove() to match.

> +
> +err_disable_core_pwr:
> +	regulator_disable(priv->core_pwr);
> +	return ret;
> +
> +err_powers:
> +	if (priv->id == ID_MT7530) {
> +		regulator_disable(priv->io_pwr);
> +		regulator_disable(priv->core_pwr);
> +	}

[Severity: Medium]
Can this leave mt7530_remove() disabling the regulators a second time?
mt7530_remove() was not changed, and it still disables both supplies
unconditionally:

drivers/net/dsa/mt7530-mdio.c:mt7530_remove() {
	...
	if (priv->id == ID_MT7530) {
		ret = regulator_disable(priv->core_pwr);
		...
		ret = regulator_disable(priv->io_pwr);
		...
	}
	...
}

Consider a multi-switch DSA tree where the MT7530 probes first.
dsa_tree_setup() returns 0 while the tree is incomplete:

net/dsa/dsa.c:dsa_tree_setup() {
	...
	complete = dsa_tree_setup_routing_table(dst);
	if (!complete)
		return 0;
	...
}

So the MT7530 driver binds before ops->setup has run. When the last
switch of the tree probes, mt753x_setup()->mt7530_setup() runs for the
MT7530 that is already bound.

If mt7530_setup() then fails, err_powers drops the consumer enable_count
to zero. The error goes back to the other switch's probe, and the MT7530
stays bound.

On a later unbind, mt7530_remove() calls regulator_disable() again. That
triggers the "unbalanced disables for %s" WARN in _regulator_disable(),
which returns -EIO. The driver also logs "Failed to disable core power"
and "Failed to disable io pwr".

Before this patch, a failed setup left the regulators enabled, so the
remove path was balanced.

[Severity: Low]
This one is speculative and depends on the hardware, but should the chip
be put back into reset before the supplies are cut here? Every goto
err_powers happens after mt7530_setup() has already released reset:

	if (priv->mcm) {
		reset_control_assert(priv->rstc);
		usleep_range(5000, 5100);
		reset_control_deassert(priv->rstc);
	} else {
		gpiod_set_value_cansleep(priv->reset, 0);
		usleep_range(5000, 5100);
		gpiod_set_value_cansleep(priv->reset, 1);
	}

err_powers only disables io_pwr and core_pwr. Suppose the reset GPIO is
present and the supplies really turn off. The SoC would then keep driving
the reset input at its run level into an unpowered chip, which could
back-power it through the input protection diodes.

mt7530_remove() already disables the regulators in the same order. This
error path is new code, though, and could assert reset first.

> +	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118014114.1855-1-laixiangwu%40cmss.chinamobile.com

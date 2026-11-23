Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414700;
	b=Pq6cATgPykWEVKYiS/6qz8H6mRS7VSZ9VKNaTrwuu3WWUORies0C5GzAaMeUCSblJGTU
	 bgrizJvtvLviGJRh5nnMYJs0q4V5q23Jtt9D3HxfzWtpJz7XjHMtVPlmjPiAwVuGbthiu
	 z4RaJhPRWR7NTQ1dHq+UHDmorK76Y/lvE6Ldp8Xu3zspHmbsBklsRJu8Qn1+2KgJp7E7S
	 /P1dRd96Vkq7COlLrHsVc1j2gdxT+PlulkpSjIo3rHR6KYt0t3EkkQIx5ETM9Qvi0BGl4
	 0EJ+9lK0ntGEN8SL3Q2zW39I6Iij89P4OpQ9c5bLv/5AvjXZ/Ww7RunjIkYN+Nx0rMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414700;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qegEcjJZDluSirF3Yp5SHdiF1Bt5r3HGLhrlQkTtEGE=;
	b=Hpbbb+LZ1kK7eBz8y/u0AmF3dik8X2H7EP/T54lFD7y3r2UQvDrZFZERBNmqKmJjNs4Q
	 NuavW484JBSNRgI41VhH+wSWtGDVikmUCgw7xCXJWcqirJ1v5dJ+HNhjy61Y2ofTpJBgn
	 DHsNvxNJXYRCENs+GSHSghDHfrMqgsQGlCTimZAFHinsqjkeh8SR5MoLNgCwlTaw56r3o
	 5JX1O+K9r+nsZWsCoq0nE+P+aVeJoP5LqWr/JIkDIijOuAQ5ZY65dwGnSQQZm5SeAUsN6
	 mGqEIjn996U6TiAoP+8k4LZMaC6d8Sxoi8rxvMH28IlHjnD+fZpThN3JBXS9weAdMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqJKoCyF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5F606A31A;
	Mon, 23 Nov 2026 06:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqJKoCyF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5564C1F000CF;
	Mon, 23 Nov 2026 06:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795414699;
	bh=qegEcjJZDluSirF3Yp5SHdiF1Bt5r3HGLhrlQkTtEGE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EqJKoCyF71lESyBjFsnn/TepqM1E5BCjOIFmhmZNQzcRwXXakFoxnpW7UoqwlSgy3
	 Op3A24qIIshi5ZLT3nk5NthkR5/5KiJOnsbXzYQ1vkfZWtDzm4DRuDRDc3c+CJfEDo
	 lk0SxJ/PoWR6M7eJztxdhoPQoPNswlQwlIKj57H76yFBh0PFt9wi+ruJeqm5eduCrw
	 AEHFZuy1M3++vyqrokNHomeJ6QGwXc5NGI6//6gYLEv6XLVYWSRcCiIYV3dZonOghn
	 DaHCdT5OOFZ0pwd0d/RLqgtjCahaUUk7QpNSry2vrQFHs2qYfo76XgiYidxuJGl+zQ
	 tPgvp5ahwUQFA==
Subject: Re: [PATCH v2] net: dsa: mt7530: fix regulator leak in mt7530_setup()
From: netdev-bot+sashiko@kernel.org
To: laixiangwu@cmss.chinamobile.com
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, sean.wang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org
Date: Mon, 23 Nov 2026 06:18:18 +0000
Message-ID: <179541469889.3135.11276449301186567298@kernel.org>
In-Reply-To: <20261119060424.1476-1-laixiangwu@cmss.chinamobile.com>
References: <20261119060424.1476-1-laixiangwu@cmss.chinamobile.com>
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

- [High] The fix is incomplete: the regulator leak the commit message
  describes can still happen.
- [Medium] Possible double disable: the new error labels in
  mt7530_setup() disable core_pwr/io_pwr, but mt7530_remove() still…
- [Low] Possible power-down ordering problem (speculative): the new
  err_powers / err_disable_core_pwr rollback in mt7530_setup() disables…

--

net: dsa: mt7530: fix regulator leak in mt7530_setup()

This patch adds chained error labels to mt7530_setup(). When a later step
in the function fails, the MT7530 core and io regulators are now disabled
again. Both labels check priv->id, so MT7621 is left alone because it
skips the regulator section.

Link: https://lore.kernel.org/all/20261118014114.1855-1-laixiangwu@cmss.chinamobile.com/

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d5a199293f78a..988f236548dfc 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -2579,16 +2581,24 @@ mt7530_setup(struct dsa_switch *ds)
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
Does this fully close the leak described in the commit message?

mt7530_setup() is only the sw_setup step of mt753x_setup(). It returns 0
here with both regulators still enabled. After that, mt753x_setup() can
fail without disabling them:

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

mt7530_setup_irq() fails in two cases:

- of_irq_get() returns <= 0. This includes -EPROBE_DEFER when the parent
  irqchip has not probed yet.
- devm_regmap_add_irq_chip_fwnode() fails.

mt7530_setup_mdio() fails if devm_mdiobus_alloc() returns NULL or if
devm_of_mdiobus_register() returns an error.

If ops->setup fails, dsa_switch_setup() jumps to unregister_notifier and
does not call ->teardown.

If ops->setup succeeds but a later step fails (tag protocol setup, user
MII bus registration, port or conduit setup), the teardown that does run
only does this:

drivers/net/dsa/mt7530.c:mt753x_teardown() {
	if (priv->bus)
		cancel_delayed_work_sync(&priv->stats_work);
}

Either way, dsa_register_switch() fails and mt7530_probe() fails. That
means mt7530_remove() never runs, and it is the only other place that
disables these supplies.

devm then releases the regulator handles while their enable count is
still nonzero. This hits WARN_ON(regulator->enable_count) in
_regulator_put(). The supplies also stay on, because rdev->use_count is
never decremented.

With -EPROBE_DEFER, each deferred probe retry runs mt7530_setup() again
and leaks one more enable.

These look like the symptoms the commit message describes: "both
regulators staying powered after a failed probe and a WARN_ON(enable_count)
splat".

Would it be better to also unwind in mt753x_setup() and the teardown
path? Another option is to move the enable/disable into a properly paired
place, such as probe with a devm action, or setup/teardown.

> +
> +err_powers:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->io_pwr);
> +err_disable_core_pwr:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->core_pwr);
> +	return ret;
>  }

[Severity: Medium]
Can these labels combine with mt7530_remove() to disable the supplies
twice?

mt7530_remove() still disables both supplies unconditionally:

drivers/net/dsa/mt7530-mdio.c:mt7530_remove() {
	if (priv->id == ID_MT7530) {
		ret = regulator_disable(priv->core_pwr);
		...
		ret = regulator_disable(priv->io_pwr);
		...
	}
}

Take a multi-switch DSA tree where the MT7530 has DSA link ports and is
not the last member to probe. Its probe succeeds, because
dsa_tree_setup() returns early without running ops->setup:

net/dsa/dsa.c:dsa_tree_setup() {
	complete = dsa_tree_setup_routing_table(dst);
	if (!complete)
		return 0;
	...
}

When a later switch completes the tree, this runs:

dsa_tree_setup_switches()
  dsa_switch_setup()
    mt753x_setup()
      mt7530_setup()

Suppose mt7530_setup() then fails after the regulators were enabled, for
example on a reset timeout, a chip ID mismatch, a 20MHz XTAL, or a VLAN0
or FDB command failure. These new labels bring the enable count back to
zero.

The other switch's probe fails, but the MT7530 stays bound. When it is
unbound later, mt7530_remove() disables both supplies again. That
triggers the "unbalanced disables" WARN in _regulator_disable(), and the
driver logs "Failed to disable core power" and "Failed to disable io
pwr".

Before this patch the sequence happened to balance: the failed setup
left the regulators enabled, and remove disabled them.

[Severity: Low]
This is speculative, but should the chip go back into reset before its
supplies are cut here?

Earlier in mt7530_setup(), reset is released:

drivers/net/dsa/mt7530.c:mt7530_setup() {
	...
	} else {
		gpiod_set_value_cansleep(priv->reset, 0);
		usleep_range(5000, 5100);
		gpiod_set_value_cansleep(priv->reset, 1);
	}
	...
}

mt7530_probe() requests the line as GPIOD_OUT_LOW, which holds the chip
in reset. The new err_powers path, however, disables io_pwr and core_pwr
while reset is still released.

On boards with switchable supplies, the host would then drive RESET_N
into an unpowered IO domain. That could back-power the chip through its
input protection diodes.

Before this patch, these error paths left the chip fully powered.
mt7530_remove() also disables the supplies without asserting reset, so
this ordering already exists elsewhere in the driver.

Would it be safer to mirror the setup order? That would mean asserting
reset first, with gpiod_set_value_cansleep(priv->reset, 0) or
reset_control_assert() for MCM, and only then disabling the regulators.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119060424.1476-1-laixiangwu%40cmss.chinamobile.com

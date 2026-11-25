Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570501;
	b=KGVWkNZGuxhc0w/aNaxEaWjkr6NZQ6Nwq3nb8bgwvsnfJOBiVCrGtH4kBTn9+g12t2Hd
	 tB3PoWH3lvE3SqI+lHfVmEsjSY1k/ZtO8urzfd+yN9g6QICZgryPkPmieIVRlZAT6OQUA
	 sQ40NoEIwLYRL0RjqBbL0RxrRtd9F0HcpNBZvwxuDl00AvQhjke9CwoyHiXhODE9XyEcq
	 hns6XzkohdEXsbdJPDoe75gc04wWuaUUDK4ODxEuQKSmQdw9rzyLPRef2GyP4/fp9Cibs
	 ysY29o3CFhHdGu08oGQ/ZlOjNTmoC3RbyXPm2Vf/nG05ldPE+1AXeHg795tgjlMZ7Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570501;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ey/DdBZK0AxrIh+FVZDhFw46AU3tmy5ylGTvhSh6jPs=;
	b=Ip7HCDWeC91bn3HyQe1gJieymAYTfAtWycX7B4RFP390FpzfUEWuua69rbLePpyin3eA
	 tzexrUAuhG8LkEbTJ9DDVoPXN3S0vjmxyNPTLakvTl9gnK2d+ey4blidoVBI3MT36poLn
	 tVFJaHScABxOC4aDDXvUD1/QfgqmbGHNPk/0/AftpkIc0JApwb2cKNyTpHYBvMSzCao6P
	 oXW7r9gkfDQTOk7CHPl9t9OKRx3KZNh3Rdv5mWSX3FtBCwsFIQS8JY6f/bHb5oPi5SNyh
	 mkydB1qHMTf/BF1+OZCHMaMoL2YKrYE17yBvmNsz6UgypMJ5TjiNSjK2+Ca+RIhXoJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U19h06pE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016D0606A6B1;
	Wed, 25 Nov 2026 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U19h06pE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A01B1F000C0;
	Wed, 25 Nov 2026 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570500;
	bh=ey/DdBZK0AxrIh+FVZDhFw46AU3tmy5ylGTvhSh6jPs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U19h06pEB0hVaqkSAAb8SaMRxbmgkb0uLm2pXBkMG1g7dr6gUjwg4QQGteXPOWAkh
	 Iad/LhuFWhGIWi06fYRUGbblbaQIZykKW9I8AKMRa/1mtsduJQ8sKnMEW3dqn047Yq
	 Drm1jAUDXvstPQw+P7tjU3y2zS35gtTsZGQhHxsdjy97np7GFquTelMsuiM27RwrJD
	 t1A5W6JRsaC7VV5U4jCoxn8LNo5C3Bk085dVGod1bT1xOt5uRF4Ye2LO9aTBvlwleu
	 iHQ4YvvM0gF52vaBZ2OmV+a0hvJ5XazEtZ28JrFDzbDGeOgHpJYVLdmVs8fq9A9wHC
	 9rVV5vxekqXLw==
Subject: Re: [PATCH v4] net: dsa: mt7530: enable the regulators in probe() and
 unwind on error
From: netdev-bot+sashiko@kernel.org
To: laixiangwu@cmss.chinamobile.com
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, sean.wang@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev-bot+sashiko@kernel.org, kuba@kernel.org
Date: Wed, 25 Nov 2026 01:34:59 +0000
Message-ID: <179557049962.3135.7449288288799250763@kernel.org>
In-Reply-To: <20261124013422.1408-1-laixiangwu@cmss.chinamobile.com>
References: <20261124013422.1408-1-laixiangwu@cmss.chinamobile.com>
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

- [Medium] The commit message's safety argument for enabling the supplies
  early in mt7530_probe() does not hold on the in-tree boards that run…
- [Low] The new error labels in mt7530_probe()
  (err_disable_powers/err_disable_core_pwr, lines 247-253) cut the core…

--

net: dsa: mt7530: enable the regulators in probe() and unwind on error

This moves the MT7530 core and io regulator enables from mt7530_setup()
into mt7530_probe(). It also adds error labels that disable the supplies
again if regmap init or dsa_register_switch() fails. The aim is to stop a
failed or deferred probe from leaving the regulators enabled.

Link: https://lore.kernel.org/r/20261123022415.433-1-laixiangwu@cmss.chinamobile.com

> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> index e85ef2aceee56..2de5e26edad61 100644
> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -209,18 +209,50 @@ mt7530_probe(struct mdio_device *mdiodev)
>  		priv->io_pwr = devm_regulator_get(&mdiodev->dev, "io");
>  		if (IS_ERR(priv->io_pwr))
>  			return PTR_ERR(priv->io_pwr);
> +
> +		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
> +		ret = regulator_enable(priv->core_pwr);
> +		if (ret < 0) {
> +			dev_err(&mdiodev->dev,
> +				"Failed to enable core power: %d\n", ret);
> +			return ret;
> +		}
> +
> +		regulator_set_voltage(priv->io_pwr, 3300000, 3300000);
> +		ret = regulator_enable(priv->io_pwr);
> +		if (ret < 0) {
> +			dev_err(&mdiodev->dev,
> +				"Failed to enable io pwr: %d\n", ret);
> +			goto err_disable_core_pwr;
> +		}
>  	}

[Severity: Medium]
Does the safety argument in the commit message hold when the switch is a
multi-chip module? The commit message says:

    the reset line has been asserted since it was acquired in
    mt7530_probe() with GPIOD_OUT_LOW, so the rails come up while the
    chip is held in reset

When mediatek,mcm is set there is no reset GPIO. mt7530_probe() only gets
a handle to the reset control, and getting the handle does not assert it:

    if (priv->mcm) {
        ...
        priv->rstc = devm_reset_control_get(&mdiodev->dev, "mcm");

The first assert happens in mt7530_setup(). That function only runs from
dsa_register_switch() during tree setup:

    if (priv->mcm) {
        reset_control_assert(priv->rstc);
        usleep_range(5000, 5100);
        reset_control_deassert(priv->rstc);

With this patch the switch is powered, out of reset and running on its
power-on defaults from probe until mt7530_setup() runs. Before the patch,
the reset pulse came right after the enables.

The window now covers all of dsa_register_switch() up to setup. It
repeats on every -EPROBE_DEFER retry. It can also last indefinitely when
dsa_register_switch() returns 0 for a multi-switch tree that is not yet
complete.

Non-MCM boards without reset-gpios are affected the same way, because
devm_gpiod_get_optional() returns NULL there.

The list of affected boards also looks wrong:

    The in-tree boards that wire these supplies (the MT7623 boards
    mt7623n-bananapi-bpi-r2 and mt7623n-rfb-emmc via mt7623a.dtsi)

mt7623n-bananapi-bpi-r2.dts and mt7623n-rfb-emmc.dts include mt7623n.dtsi,
not mt7623a.dtsi. They set reset-gpios and the supplies inline.

The boards that get mediatek,mcm plus core-supply and io-supply from
mt7623a.dtsi are mt7623a-rfb-emmc.dts and mt7623a-rfb-nand.dts. Those are
the boards where the chip is not held in reset while the rails come up.

Could the commit message be corrected? Is the longer powered but
unconfigured window on these boards intended?

>  
>  	rc.lock_arg = &priv->bus->mdio_lock;

[ ... ]

> -	return dsa_register_switch(priv->ds);
> +	ret = dsa_register_switch(priv->ds);
> +	if (ret)
> +		goto err_disable_powers;
> +
> +	return 0;
> +
> +err_disable_powers:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->io_pwr);
> +
> +err_disable_core_pwr:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->core_pwr);
> +
> +	return ret;
>  }

[Severity: Low]
Is this teardown order safe when dsa_register_switch() fails after
mt753x_setup() has already run? Some ways this can happen:

    - mt7530_setup_mdio() returns -EPROBE_DEFER after the IRQ chip was
      added
    - create_sgmii fails
    - a later step in the DSA core fails

In that case, devm resources created during setup are still registered
on mdiodev->dev:

    mt7530_setup_irq()
        devm_regmap_add_irq_chip_fwnode(...)

    mt7530_setup_mdio()
        devm_of_mdiobus_register(dev, bus, mnp)

mt753x_teardown() only cancels stats_work. The IRQ chip and the internal
MDIO bus are therefore released by devres_release_all() after
mt7530_probe() returns, which is after these labels have already cut the
supplies.

If the threaded regmap-irq handler runs in that window, it reads
MT7530_SYS_INT_STS from an unpowered chip.

mt7530_setup() has also already deasserted the reset with
gpiod_set_value_cansleep(priv->reset, 1). Nothing reasserts it before
power is removed here.

Would it help to register the disables with devm right after the
enables? The other option is to reassert reset and release the setup
resources before disabling the supplies.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124013422.1408-1-laixiangwu%40cmss.chinamobile.com

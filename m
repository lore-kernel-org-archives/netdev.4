Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598836;
	b=JJSuh2A97chGxykjlF52sgUcxiYNO8YojRDOmh0i2NZXhWPy6IE6qoqC9GHCdmDvohWt
	 XQR8nXJiozCWmF8VXJaZkfT2yltuTQhWAuRxR4CVx5QjfRa3UgS39zR5Jg40SkU91370F
	 G/VBv3N8Mr2Bd9joGden3DtBk6dSEk4RPn2Mm0m6oNzsJpHu990jzaWi4GKvQWyqVmASr
	 AkuLJW0PoZUCtFr2uyS5Nn84xkAFo8kDOOO5KMYA/aDDvvJfkidn+XDEzh00pV1RlfNl8
	 daZFR9kxA311QK46FDDsUxmwiznQSuFRrNle2KpICOGtQyA0hoMD4zFB5ju/umtVLyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598836;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=x4sbsn2ixDTBDtUwxa1hBX1Qz+G2nxms7ydHl051tRo=;
	b=OnUoNQydc6JIoVtDphKv407p4i0nssMOMX1rJVGA7VBe3Mai/+gAXOoKPKJxw7jYrxd1
	 gC96c9CzvY8I1vUJJL6Sq60UMjUoSLKqRJQxvQl0GBcCNbyGeVY4lqCO1Ytip1URC0wF8
	 xUMz0aAwoHBVfGre0D4zlYlBEi1OI+GgIYTuq85uudHTYDahVDpsIp6OEhnbzGP8vvBXm
	 2RBhgbhq7cs7GyY2gNf5oaevc+VuVGkK7KOkyBINKtXe/0lkVErxlbAwafzqxmLZdiuLr
	 M1ScPyEmnDN2raiudDDAR3l1gbysWF3XNulmQbchVLJiO0ePHSaOBrD1GeesdCQMpYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8Yz4UDn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C415606A32E;
	Wed, 25 Nov 2026 09:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U8Yz4UDn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87451F000C0;
	Wed, 25 Nov 2026 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598835;
	bh=x4sbsn2ixDTBDtUwxa1hBX1Qz+G2nxms7ydHl051tRo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U8Yz4UDnsTUxU2NTt180uQ56FBgsICpzdchsQS4dHXdghrMSe7JPYmFYljDHsabvS
	 scI4PVOyTx4hrtfoIXcUXgkf4zgGD2gXwFY+9IsWbkkgqUguZPTpMy8h/F/7N+vFEQ
	 k7zYVs+7kLtlqbcNczk8mTu3dcbp6zPNvc2sJZAVO14/i4IlZfRNJSv+R8isKAqX50
	 zpk2mRTT4LPKhi5ThoECw/0XhbHe/lsNhQHfFPfUTJxRDOmiazBFM/lYAlOgr1bzY+
	 yi8AniGqv3ZcKcq23F1DIJy0FvELf3zL0naomyFczybZdHYt64Dj0JNhXGuQUOcs17
	 5ECUZzRehtFWw==
Subject:
 Re: [PATCH net 1/5] net: dsa: mt7530: disable regulators on switch teardown
From: netdev-bot+sashiko@kernel.org
To: wanghr2026@mail.zgclab.edu.cn
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 09:27:14 +0000
Message-ID: <179559883437.3135.6979042989700533423@kernel.org>
In-Reply-To: <179550875789.4156.10993765506582806373@mail.zgclab.edu.cn>
References: <179550875789.4156.10993765506582806373@mail.zgclab.edu.cn>
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

- [Medium] mt753x_teardown() now switches off the MT7530 core and IO
  supplies, but setup registered several interfaces with devm on…
- [Low] The commit message understates and partly mischaracterizes what
  the patch changes.

--

net: dsa: mt7530: disable regulators on switch teardown

This patch moves the MT7530 core and io regulator disable from
mt7530_remove() into mt753x_teardown(), after the stats polling work is
cancelled. The aim is to balance the enable in mt7530_setup() for switches
that are torn down without the driver reaching remove().

> Move the regulator disable from mt7530_remove() to mt753x_teardown(),
> after the stats polling work is cancelled so that no poll can run against
> an unpowered switch. This is a plain code movement, with the error
> reporting kept for now and cleaned up in a later patch.
>
> A switch in a multi-switch tree whose sibling fails to set up is torn
> down without its driver reaching remove(), so its regulators were left
> enabled until now.

[Severity: Low]
Is "a plain code movement" accurate? The patch seems to change more than
the message says.

On the remove path, the old mt7530_remove() disabled the supplies before
mt7530_remove_common()->dsa_unregister_switch(). The whole DSA teardown
therefore ran against an unpowered switch. With this patch, power is cut
last, from mt753x_teardown().

The leak can also happen with a single switch, not only in multi-switch
trees. dsa_switch_setup() calls ops->teardown on its error path when tag
protocol setup or user MII bus setup fails:

net/dsa/dsa.c:dsa_switch_setup() {
    ...
teardown:
	if (ds->ops->teardown)
		ds->ops->teardown(ds);
    ...
}

dsa_tree_setup() also tears down the switches when dsa_tree_setup_ports(),
dsa_tree_setup_conduit() or dsa_tree_setup_lags() fails.

In each of these cases probe fails and remove() never runs. The leaked
enable then triggers WARN_ON(regulator->enable_count) in _regulator_put()
when devres releases the regulator.

There is one more case. In a multi-switch tree that never finished setting
up, the old mt7530_remove() disabled regulators that had never been
enabled. That hit the regulator core's "unbalanced disables" warning, and
this patch fixes it as a side effect.

Could the commit message mention these cases and the change in ordering on
the remove path?

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d5a199293f78a..c2f12ae2c6d7b 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3237,9 +3237,22 @@ static void
>  mt753x_teardown(struct dsa_switch *ds)
>  {
>  	struct mt7530_priv *priv = ds->priv;
> +	int ret;
>  
>  	if (priv->bus)
>  		cancel_delayed_work_sync(&priv->stats_work);
> +
> +	if (priv->id == ID_MT7530) {
> +		ret = regulator_disable(priv->core_pwr);
> +		if (ret < 0)
> +			dev_err(priv->dev,
> +				"Failed to disable core power: %d\n", ret);
> +
> +		ret = regulator_disable(priv->io_pwr);
> +		if (ret < 0)
> +			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
> +				ret);
> +	}
>  }

[Severity: Medium]
After this, the switch has no power but is still bound. What happens to the
interfaces that setup registered with devm on priv->dev?

mt7530_setup_irq():
	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
					      priv->regmap, irq,
					      IRQF_ONESHOT,
					      0, &mt7530_regmap_irq_chip,
					      &irq_data);

mt7530_setup_mdio():
	ret = devm_of_mdiobus_register(dev, bus, mnp);

mt7530_setup_gpio():
	return devm_gpiochip_add_data(dev, gc, priv);

Neither mt753x_teardown() nor the DSA core undoes these, so they stay live
until the driver unbinds.

Take the case this commit targets: an MT7530 in a multi-switch tree whose
sibling fails setup. It goes through

dsa_tree_setup_switches()->dsa_tree_teardown_switches()->mt753x_teardown()

and stays bound with power off.

GPIO consumers such as gpio-leds on the switch LED pins would keep calling
mt7530_gpio_set() and mt7530_gpio_get(). regmap reports success, but the
writes are lost and the reads return garbage.

The parent IRQ also stays requested. If the line asserts while the switch
has no power, regmap_irq_thread() would run against dead hardware. Every
nested source is masked, so it returns IRQ_NONE. That repeats until
spurious interrupt detection disables the line.

Before this patch the rails stayed on in this case. On the normal remove()
path the patch actually makes the unpowered window shorter.

The root cause is older: devm registrations in ->setup outlive ->teardown.
The later patch "disable regulators on mt753x_setup() failure" has the same
pattern. It powers off after a mt7530_setup_mdio() or create_sgmii()
failure, while the devm IRQ chip and MDIO bus are still registered.

Should teardown also unregister these interfaces? Or should the regulators
stay enabled until remove()?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179550875789.4156.361477684651496992%40mail.zgclab.edu.cn

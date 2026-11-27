Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752875;
	b=wP/ci/wPBZj4JpcaMqpKmmca+lfIgamUoHaaJKamAWatwrMJ2pl3557xl77VyfhixuYI
	 47SFBbQJY4r/UsEXL6TKciYn09EEDC4nvwC9hYE39Vi1HWjBo2tYe5cmP5A/DcH9/AcNC
	 IqLrlivbXnMcdpAocOfbaEqvg83AHhGAup5uIW1JJipCCbnPHCiCJcZm2W6Exa5YoCxWX
	 ojqaGaZmcHMaE0w/kdvtEEGuEl0ZdOc8r4vTmTtB3V0lGSZCxP1BCwPGyAkS20q3TOtgB
	 nCFBjCb92CWJjOPq6raleuNPXR4tIzFX6AAmsOvpqGg1lnzg1ZIrSb2IW7mpoRH9j8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752875;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SUrhKrfheYupw2Xo6QeTne49mSo55IfCxWZiIwl5hmQ=;
	b=cYLaxiLyga84jVYGudKu2Sbs+jAcJ53dtjDiDNzPlPEB+f/xwlicXwaMHGXEO03egw/8
	 AzZc/+gRoNByaB5RA6UqMtrpu859oGLSVip8BbYa7dWWiBbZg1TmsSaKY5ben/2ak/kR6
	 n8+Qjv4/3T8VwclU1cNmqifeL3K9Qvs432WeTOKVL79IwXQaf9Rm34MqIr6GW3j7VPiN1
	 E7qnWfkRsm0MlFAZJejZS6rr3U4gyZEIDVRngVyPPsR20Go/bvIKM0Ukr61Kr8D5h2tRN
	 qOTzeWje/L/PsY40FGhiSbW/wPlHRRruA2gkjUmdORNob4KkDm1LTnLkWf8QzUjbckA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0efXyaX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B5606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 04:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0efXyaX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE55C1F00898;
	Fri, 27 Nov 2026 04:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795752874;
	bh=SUrhKrfheYupw2Xo6QeTne49mSo55IfCxWZiIwl5hmQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P0efXyaXNaTcKqlqJ5STALJ3x6D7caBJhutawlgfq2FPZkkh0bssyVbNxj5H27QOj
	 DVeXrVlfIHRkdYk2amKsDJRW4OMbw9RkhKHkKJcS3LOdb6Ndn8O4joM/mZPriCjORs
	 Fdc9F1QJH1rs4Gz2/l9ebhWk0qvoWEzYwiUpRp4qclkcTFKR/Vn6LYpT/q2ycL8g7U
	 T6ruNd9YYgeokMiNKrUjjm9ib2JZI3RxuKNm+Ytz7LGbv0TjlY1tFyEUwTW4m99WnQ
	 X4iGyeJ7c8ma1dL3YwFWmiJu5qxkWMTkNK9Wlo9f9aKqZo7jI4fCm3Drtw14OubekU
	 gjjE+qw48F87g==
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Unregister the MDIO buses
 on teardown
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk
Date: Fri, 27 Nov 2026 04:14:33 +0000
Message-ID: <179575287341.3135.2545531095986940323@kernel.org>
In-Reply-To: <20261126034725.64709-1-mmyangfl@gmail.com>
References: <20261126034725.64709-1-mmyangfl@gmail.com>
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

- [High] The patch switches the yt921x internal and external MDIO buses
  from devm-managed allocation and registration to manual…

--

net: dsa: motorcomm: Unregister the MDIO buses on teardown

The yt921x internal and external MDIO buses used devm-managed allocation
and registration. This patch replaces that with mdiobus_alloc() plus
of_mdiobus_register(), and frees the buses in .teardown() and on the
yt921x_dsa_setup() error paths. A second .setup() within one registration
should then no longer collide with a bus that is still registered.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index a21d4bb5e1412..789a08dbe3b93 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -2586,7 +2590,7 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
>  	mutex_unlock(&priv->reg_lock);
>  
>  	if (res)
> -		return res;
> +		goto err;
>  
>  	res = yt921x_devlink_setup(priv);
>  	if (res)

[Severity: High]
Should the yt921x_devlink_setup() failure also go to err? After this
patch it still reads:

	res = yt921x_devlink_setup(priv);
	if (res)
		return res;

If that fails, priv->mbus_int and priv->mbus_ext stay registered and
allocated.

The DSA core does not call ops->teardown() when ops->setup() fails.
dsa_switch_setup() in net/dsa/dsa.c does:

	err = ds->ops->setup(ds);
	if (err < 0)
		goto unregister_notifier;

That jump skips the teardown label. ds->setup also stays false, so
dsa_switch_teardown() returns early. On this path yt921x_dsa_teardown()
never runs.

Before this patch, devm_of_mdiobus_register() cleaned up in this case. Now
nothing unregisters or frees the buses, and mbus->priv still points at the
devm-allocated priv from yt921x_mdio_probe(). priv is freed when the probe
fails, or in a multi-chip tree when the switch is later unbound.

After that, any access through the leaked bus reaches yt921x_mbus_int_read()
or yt921x_mbus_int_write(), which call mutex_lock(&priv->reg_lock) on freed
memory. If the module has been unloaded, the callbacks point into freed
module text instead.

The leaked bus also keeps its id (dev_name(dev)) under the same parent.
Could a later setup or re-probe then hit the same __mdiobus_register()
collision that this patch is meant to fix?

Replacing the return res above with goto err would close this path.

> @@ -2599,6 +2603,12 @@ static int yt921x_dsa_setup(struct dsa_switch *ds)
>  #endif
>  
>  	return 0;
> +
> +err:
> +	yt921x_mbus_ext_remove(priv);
> +err_mbus_int:
> +	yt921x_mbus_int_remove(priv);
> +	return res;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126034725.64709-1-mmyangfl%40gmail.com

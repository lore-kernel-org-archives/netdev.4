Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470087;
	b=r1Wfz6MRpnzJm9M7gg2VY4aEYDO2HxfT2k0RydRtQgi8pURwT7p4S/NXBWTXr77rQZ7y
	 tW/7j/cz2vchVs50rDcjaL/1hrHHOjCRVMAvS5cjWK14cJ8n9RKEfNgCcOzx/+yqdkg7T
	 HSyckoiYRUz2qWm7czLCP4N2zaqVgHh3ET8+Yu8wlqTYw9vh2VrNVbaeBpMOB7JA11I55
	 mO9YuHyCXKX7SE3GgDavp1HSgye50gNH06yooLIm7ItUulgbuFXRbry95GAUVGws6J8mx
	 2WhVjaofexBi7zlWSNc2cN1Z5LhtwsGc0STfmoG6xNy2NM4R/dtBpsKh3u+YEXXeBxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470087;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GK26KF0rEouW6Pt03m3PN+6BNa6sEHxbDqdUEV8QxJ0=;
	b=gP3en73c8kAb61RfYwHvsQskreiVsVOQpg3fawZ8pMi/K3C4dhxlH7ofiHHy6L03hxZt
	 jdnDJ20X2WOAlAp+V+pYp0K/tl0iR+5aEQUz1aCKIK5l2d+0cw/UgTCxY9ThHUX3YoVDF
	 DONAWbsO9vFIm9wRiRW2WX5QQ4a+fi2SzE2pU3IsVoRI20d5CNculGEHAMn+8GwCQenbt
	 Fa0ZXms5Oxe7x/Zy3AHH8+Cl2A/yuxbDACf0y8ndotvItcMYXsXB9V4OGU1ACeAnLUpom
	 6KucpAAbbjeCT2jHCeAXSLupklOKJeAnCOQnMUrZaI/WjZOyrNuuWE+DcGM0n33sjug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tFn3vYTn;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA52E606A31E;
	Mon, 23 Nov 2026 21:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA52E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tFn3vYTn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GK26KF0rEouW6Pt03m3PN+6BNa6sEHxbDqdUEV8QxJ0=; b=tFn3vYTn+c1LCQlwETyuMJkJcF
	MZQjnZodQD4WfIFd0yqVj8/N/qmuABjfFQwg3DDOtNbMMIiypgKTo+4aHQfC9q8mivFou3pLxj/qa
	SpaTbQxa7z2H31vqQPvXTob93C/FuKwJD1eESkqbGZQfIAMyKlYuhd1fqHJ4ULSo48jI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVbmV-000u8B-8U; Mon, 23 Nov 2026 22:40:59 +0100
Date: Mon, 23 Nov 2026 22:40:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: mt7530: disable the power rails on setup
 failure
Message-ID: <66d0cc53-b1e9-4c5d-adcd-ac752c21e3fe@lunn.ch>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>

On Mon, Nov 23, 2026 at 07:09:13PM +0800, Haoran Wang wrote:
> mt7530_setup() enables the core and io regulators, but only
> mt7530_remove() disables them. A failed probe never reaches .remove(),
> so the rails stay enabled on every setup failure path, and the regulator
> core warns when devres later puts an enabled regulator. The common case
> is mt7530_setup_irq() returning -EPROBE_DEFER, where each re-probe
> enables the rails again.
> 
> Tie the regulator lifetime to the switch setup/teardown pair. Disable the
> rails in mt753x_teardown() and on the mt753x_setup() error paths after
> sw_setup() succeeds, and drop the now-redundant disables from
> mt7530_remove(). This also avoids an unbalanced disable when a switch in
> a multi-switch tree fails setup while already bound. Move
> mt7530_setup_gpio() after the FDB flush so the gpiochip is not left
> registered when the rails are dropped.
> 
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Please break this patch up into lots of small patches, with good
commit messages, which are obviously correct.

taerdown is the opposite of setup. So do that code movement as one
patch.

Then add patches to fix the missing error handling.

> -	if (priv->id == ID_MT7530) {
> -		ret = regulator_disable(priv->core_pwr);
> -		if (ret < 0)
> -			dev_err(priv->dev,
> -				"Failed to disable core power: %d\n", ret);
> -
> -		ret = regulator_disable(priv->io_pwr);
> -		if (ret < 0)
> -			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
> -				ret);
> -	}

This prints error messages when things go wrong.

> +static void
> +mt7530_disable_pwrs(struct mt7530_priv *priv)
> +{
> +	if (priv->id != ID_MT7530)
> +		return;
> +
> +	regulator_disable(priv->core_pwr);
> +	regulator_disable(priv->io_pwr);

This does not. Why? If you add this helper as a little patch, you can
explain in the commit message why you decided to throw away the error
messages.

> +	/* Flush the FDB table */
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> +	if (ret < 0)
> +		goto err_disable_pwrs;
> +
>  #ifdef CONFIG_GPIOLIB
>  	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
>  		ret = mt7530_setup_gpio(priv);
>  		if (ret)
> -			return ret;
> +			goto err_disable_pwrs;
>  	}
>  #endif /* CONFIG_GPIOLIB */
>  
> -	/* Flush the FDB table */
> -	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> -	if (ret < 0)
> -		return ret;

This move should be one patch, and the commit message explaining why.

> +
> +err_disable_pwrs:
> +	mt7530_disable_pwrs(priv);
> +
> +	return ret;
> +
> +err_disable_core_pwr:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->core_pwr);
> +
> +	return ret;

Having two error cleanup blocks of code with a return is very
unusual. Look at other cleanup blocks. How often do you see this?
Please make it have just one return statement.

> -	if (ret && priv->irq_domain)
> -		mt7530_free_mdio_irq(priv);
> +	if (ret) {
> +		if (priv->irq_domain)
> +			mt7530_free_mdio_irq(priv);
> +		goto err_disable_pwrs;
> +	}

Since you are adding error cleanup at the end of the function, move
this to the end as well.

    Andrew

---
pw-bot: cr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489970;
	b=dAhZd/qMG4f4/rmmWAaOewFAhpFx+FsC3c9OeU7qg2jlZ7NWAljW3IYX7PTaoF9xuDvQ
	 xQyJ3qNekiXPernwbsIcKmIlZW72T8VrR1xOW6ZwizBVl8hc9EKL5gvAfAo8WTilWptqa
	 hqX/zT73YNYxZJkNMe6HIbT3SVvl0kWDRTjtGv9oL1oqNBUMGEBzg4Z3t1tijwS9J1QzT
	 98o9B+7Pb3nUHxZIOuum2ZBx/TuPmCMcbeDQcho9Oj4hKLtOA1dzj9DXxg2bvJCIijhCO
	 aOANcGj8lnYK1kVL+W1b/pk3B4XEktOZrzkhsjCX4W56X/ypKzId2d98bA30FLjduLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489970;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=h+8Na1BEpkJkdeI2fn00t3Mx0IWg8ehRSC634a0KQgQ=;
	b=z2YO1E8ZW4fu4D3AewfsQ8DWDy6HuCoLI/37dJ0O+GygNm1XeVYnEe4Jcn8FzqavtDll
	 hILs/gihmf+gZXmfL3x2IopjVbNtszSpHbWpdRs8+eZRqJ8QltHnyIc6nZ8u3LMG1Us6o
	 rZ8tQF75ird8nV0wjA8GVWwf97cTaCm2iBdnNhJb7Qa8Fqi+U3GxHrVKvR1sVknjiXM8V
	 r05Vmh09UnUT6dneqy2ApTXOXDxxZLvZuUF7YYmAflTULzPl2XaxC87OvXpkx8fxGJZ0a
	 NXTgrGe1PL+5C4Ojlb9Mp5V4YT7wvN7oKUV9WXEu9pBMoYQk7yoTslK47W0zJWhjgKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7xmli+N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C4606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7xmli+N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA77F1F000CF;
	Tue, 24 Nov 2026 03:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795489969;
	bh=h+8Na1BEpkJkdeI2fn00t3Mx0IWg8ehRSC634a0KQgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k7xmli+N8FCTrRLzx6CIWF4KnyL1K8lk+aAfdCxNh/2Gvv4MOco7ut04C0WiGAGb1
	 iPKUiAZCpnENWGTh9StMfAfNTaaGSR6O+oY07Q7jR/qKhO7i0CuCI72Bm7uXopamnQ
	 BQdy7xpL53eLFdUOBAxDcKUivgPjEu3QDeiFQJ5/GpXK4sD/bUGtqr4Dph2cAOo2r9
	 u6JvzLlkuEbaPT9G8wMyyByj9PkTxUDSJTTDzfZd6ulGNIFhAy1eTdSTBnIlP1HgRk
	 W1iSB37x3ZCFFd33dlM+vvBJttlN9KjZSjrwHOgfWf8uXK0Fl/9mleveoWS6t5YsXt
	 3A41DvLNiWLeA==
Subject: Re: [PATCH net-next] net: hix5hd2_gmac: support fixed-link
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, shenjian15@huawei.com, shaojijie@huawei.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 03:12:48 +0000
Message-ID: <179548996825.3135.16418644691427963139@kernel.org>
In-Reply-To: <20261120031026.1371052-1-mmyangfl@gmail.com>
References: <20261120031026.1371052-1-mmyangfl@gmail.com>
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

- [Medium] In hix5hd2_dev_probe()
  (drivers/net/ethernet/hisilicon/hix5hd2_gmac.c:1192-1197), the fixed-…
- [Low] After this patch, hix5hd2_dev_probe() accepts a node that has
  'fixed-link' and no 'phy-handle'…

--

net: hix5hd2_gmac: support fixed-link

This commit adds fixed-link support to hix5hd2_gmac for Hi3716cv200, where
the MAC is wired directly to another MAC with no PHY. When fixed-link is
present, the MDIO bus is registered with mdiobus_register() and all
addresses masked, and the fixed-link PHY is registered in place of the
phy-handle lookup.

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index 12a5657653f85..dd4ba6d7a1574 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> @@ -1189,7 +1189,12 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
>  	priv->bus = bus;
>  
> -	ret = of_mdiobus_register(bus, node);
> +	if (of_phy_is_fixed_link(node)) {
> +		bus->phy_mask = ~0;
> +		ret = mdiobus_register(bus);
> +	} else {
> +		ret = of_mdiobus_register(bus, node);
> +	}

[Severity: Medium]
Does the commit message match what this hunk does? The message says:

    Suppress the warning by masking out all PHY address.

__of_mdiobus_register() in drivers/net/mdio/of_mdio.c already masks every
address before it registers the bus:

    /* Mask out all PHYs from auto probing.  Instead the PHYs listed in
     * the device tree are populated after the bus has been registered */
    mdio->phy_mask = ~0;

So setting bus->phy_mask = ~0 is not what stops the 32 lines of output.

The output seems to come from the fixed-link child node. It has no reg
property, so __of_mdiobus_parse_phys() sets scanphys. It also has no
compatible property, so of_mdiobus_child_is_phy() treats it as a PHY:

    if (!of_property_present(child, "compatible"))
        return true;

The auto-scan loop in __of_mdiobus_register() then prints this for every
address:

    dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
             child, addr);

What actually removes the output is skipping OF registration altogether.

That has a side effect when fixed-link is present. The bus gets no fwnode,
so DT children of the MAC node are never populated and of_mdio_find_bus()
cannot find this bus.

The hisilicon,hisi-gmac-v1.yaml binding includes mdio.yaml, which
describes the MAC node as an MDIO bus with optional children. Take a
switch whose CPU port is on a fixed link and which is managed over this
GMAC's MDIO lines. Can that setup still be described, or is the
registered mii_bus left with nothing able to use it?

Fixed-link nodes failed probe before this patch, so this is not a
regression of existing behaviour. Could the commit message at least state
this limitation and describe the mechanism accurately?

>  	if (ret)
>  		goto err_free_mdio;
>  
> @@ -1199,11 +1204,18 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  		goto err_mdiobus;
>  	}
>  
> -	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
> -	if (!priv->phy_node) {
> -		netdev_err(ndev, "not find phy-handle\n");
> -		ret = -EINVAL;
> -		goto err_mdiobus;
> +	if (of_phy_is_fixed_link(node)) {
> +		ret = of_phy_register_fixed_link(node);
> +		if (ret < 0)
> +			goto err_mdiobus;
> +		priv->phy_node = of_node_get(node);
> +	} else {
> +		priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
> +		if (!priv->phy_node) {
> +			netdev_err(ndev, "not find phy-handle\n");
> +			ret = -EINVAL;
> +			goto err_mdiobus;
> +		}
>  	}

[Severity: Low]
Does the DT binding need updating along with this? hix5hd2_dev_probe() now
accepts a node with fixed-link and no phy-handle. However,
Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml still
requires phy-handle unconditionally:

    required:
      - compatible
      - reg
      - interrupts
      - clocks
      - clock-names
      - phy-mode
      - phy-handle

The fixed-link property itself passes through the ethernet-controller.yaml
$ref. The required phy-handle rule does not, so a Hi3716cv200 DTS that
uses fixed-link alone would fail dtbs_check.

Would a oneOf or if/then that accepts fixed-link instead of phy-handle
fit here?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120031026.1371052-1-mmyangfl%40gmail.com

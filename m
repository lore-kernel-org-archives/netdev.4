Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618375;
	b=LYYnOjcWMmZrBFDTjZH2m8wJv6utCUUJHds6WjM5Wsotodq8wSl1m8gHn02N2JCjT+q4
	 EuYCn8mfhg4uvmEZLBVNz+R90lAv9i//ZL9YNptL5hy+ZPuFvBxD2hkAmJNnZ0M7fHJeG
	 62cUHJ/dx9ADjzZ0VhhCxhWDF+jkKi0ihxQFL+WX1A+mKzRHqNzJPDieDpvRFMVa4oVp+
	 aR6jvV0h78I2h7zvbcHRcTiFOvQpqCPtMSqXHwQQ/jkKvcHI4Co9HmM0o0zRnu77lhUMM
	 ouu+NXakHE/+ocUf0XsqvTPRMKbb+YDWH2M1+JW+Cag9WSaQUk+p8KFGW1oYlB30iTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618375;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CcswUBkdOVJ3jfZCtD7+HEJ8VJztw/DF4w3AKz5CVc8=;
	b=sK17IhnZFScH05yHIW4fSFmCawditSHA73RuzMPlXt96gdEBgLMwJWLxGuso/Xh/Jv5t
	 hJw8ePM2yN9/oaIU1Og+RDnu7zF2DIPNx+XnIvif+5T1cj34JWi8Qt9kjZ5ZpCubXpDfj
	 veZ7k99gH+HkC7Q3q4vw+fNeZfg3m5x1Yhv2kNgPeIjqMVtpKoOL8xNe6j1EKAhu6hgzQ
	 rcl0fzfp3frXRiYENHFAU08c+pVDLn9KWPKH+1k3qXfOzm3Oi5dczEQVIpwB048ipL28n
	 7jx6ABEMkGxl9gC+L0wLxAj1DSZ5Xopuu08ZsbQXxO1wkz6AR2jrr3O0PAWztYHw9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvF86e0l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D4606A321;
	Wed, 25 Nov 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvF86e0l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605B31F000D8;
	Wed, 25 Nov 2026 14:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618374;
	bh=CcswUBkdOVJ3jfZCtD7+HEJ8VJztw/DF4w3AKz5CVc8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WvF86e0loGSlgSCyt5HjzgqYgA6jEFMt27nx6NHaVomCm8lw7FEM8SxDBiVddEvkH
	 lb84Zv/fNTw4s1l1CPV/ExkpUmy8hWWavhOPmlIFWO5qPODypdNPUZJ4ZtWwXi5Kty
	 K0vN9R4ZfCsDW9oaNlxJ32+MZ/0IRS2oGfQaxwa4xZqQwq6qRmoxPPmWOidUipM1Vn
	 0YyVq/HFEElsfl/QsPei2Ls0QDvk++/ifg02Pv6V4+ZicrlQvy45FywFp5XtVgLx7L
	 3KSV6olFS0sFE9OEhNoVK1DUk88YeqwseVf5vsex6Ujgt2OODWA2hHorvuPZIKfhHJ
	 YXdcas1u20V8g==
Subject: Re: [PATCH net-next v3] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
From: netdev-bot+sashiko@kernel.org
To: bage@debian.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, olteanv@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 14:52:53 +0000
Message-ID: <179561837388.3135.1742234801401474384@kernel.org>
In-Reply-To: <20261121193655.225520-1-bage@debian.org>
References: <20261121193655.225520-1-bage@debian.org>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Regression on the auto-scan path for PHY nodes that have no
  `reg` property.
- [Medium] Regression for PHYs registered through the exported helper
  of_mdiobus_phy_device_register() /…
- [Medium] The fix only sets BIT(addr) for the child's `reg` address
  (of_mdio.c:169).
- [Low] The patch changes when the mask bit is set for PHYs, and the
  commit message only describes the non-PHY fix.
- [Low] The commit author metadata is malformed.
- [Low] The patch fixes a mismatch between binding and implementation.

--

net: mdio: handle broken-turn-around for non-PHY MDIO devices

This patch moves parsing of the "broken-turn-around" DT property out of
fwnode_mdiobus_phy_device_register() and into __of_mdiobus_parse_phys().
The goal is to apply the property to non-PHY MDIO devices such as DSA
switches as well as to PHYs.

[Severity: Low]
This isn't a bug, but the author field of this commit reads:

  Author: Signed-off-by: Bastian Germann <bage@debian.org>

Is the "Signed-off-by:" prefix meant to be part of the author name? It
looks like a malformed From: line, and git am would record it as the
author identity.

> The "broken-turn-around" property is documented in mdio.yaml for any
> MDIO device, but the MDIO core currently parses it only for PHY devices
> in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
> switches, are registered through of_mdiobus_register_device(), where the
> property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
> still treat the turn-around/read failure as an error.

[Severity: Low]
This paragraph describes a mismatch between the mdio.yaml binding and
of_mdiobus_register_device(). Should the commit carry a Fixes: tag, or
say whether it targets net or net-next? Without that, backporters can't
tell where it applies.

> diff --git a/drivers/net/mdio/fwnode_mdio.c b/drivers/net/mdio/fwnode_mdio.c
> index ba70915182654..129481e8a910a 100644
> --- a/drivers/net/mdio/fwnode_mdio.c
> +++ b/drivers/net/mdio/fwnode_mdio.c
> @@ -89,9 +89,6 @@ int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
>  		phy->irq = mdio->irq[addr];
>  	}
>  
> -	if (fwnode_property_read_bool(child, "broken-turn-around"))
> -		mdio->phy_ignore_ta_mask |= 1 << addr;
> -

[Severity: Medium]
Does this break broken-turn-around for PHY nodes that have no reg
property?

In __of_mdiobus_parse_phys(), of_mdio_parse_addr() returns a negative
value for such a child. The loop then hits this continue before it
reaches the new check:

    addr = of_mdio_parse_addr(&mdio->dev, child);
    if (addr < 0) {
        /* Skip scanning for invalid ethernet-phy-package node */
        if (scanphys)
            *scanphys = true;
        continue;
    }

__of_mdiobus_register() later registers those children from its
auto-scan loop:

    if (of_mdiobus_child_is_phy(child)) {
        ...
        rc = of_mdiobus_register_phy(mdio, child, addr);

That call goes through:

    of_mdiobus_register_phy()
      -> fwnode_mdiobus_register_phy()
        -> fwnode_mdiobus_phy_device_register()

The lines removed here were the only place this path set
phy_ignore_ta_mask.

Take a reg-less node with compatible = "ethernet-phy-idXXXX.XXXX" and
broken-turn-around. phy_device_create() registers it without any
register reads, so it worked before this patch.

After this patch, would every later read of that PHY return 0xffff on
mdio-bitbang, or fail on mdio-bcm-unimac and mdio-pic64hpsc?

The commit message says the property is parsed "once in
__of_mdiobus_parse_phys(), before the PHY and non-PHY registration paths
diverge". The auto-scan path never reaches that check, though.

[Severity: Medium]
Can this also drop the property for callers that use the exported
of_mdiobus_phy_device_register() and fwnode_mdiobus_phy_device_register()
helpers without going through __of_mdiobus_parse_phys()?

tja1102_p1_register() in drivers/net/phy/nxp-tja11xx.c walks the children
of the TJA1102 port 0 PHY node and registers port 1 directly:

    phy = phy_device_create(bus, addr, PHY_ID_TJA1102, false, NULL);
    ...
    ret = of_mdiobus_phy_device_register(bus, phy, child, addr);

__of_mdiobus_parse_phys() only visits direct children of the bus node
and of ethernet-phy-package nodes, so it never sees this nested node.

ethernet-phy.yaml documents broken-turn-around for every ethernet-phy
node, but after this change it is silently ignored for TJA1102 port 1.
Could the parse stay in fwnode_mdiobus_phy_device_register() as well?
Setting the bit twice is harmless.

> diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
> index b8d298c04d3ff..fe321fa161888 100644
> --- a/drivers/net/mdio/of_mdio.c
> +++ b/drivers/net/mdio/of_mdio.c
> @@ -164,6 +164,10 @@ static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
>  			continue;
>  		}
>  
> +		/* Common to PHYs and other MDIO devices */
> +		if (of_property_read_bool(child, "broken-turn-around"))
> +			mdio->phy_ignore_ta_mask |= BIT(addr);

[Severity: Medium]
Is masking only the reg address enough for the DSA switches that the
commit message mentions?

Bus drivers check the mask against the address of each transfer. For
example, mdiobb_read_common() does:

    !(bus->phy_ignore_ta_mask & (1 << phy))) {

b53_mdio_probe() accepts mdiodev->addr == 0, but b53_mdio_op() sends all
traffic to BRCM_PSEUDO_PHY_ADDR (0x1e):

    v = mdiobus_read_nested(bus, BRCM_PSEUDO_PHY_ADDR,
                            REG_MII_ADDR);

With reg = <0> and broken-turn-around, bit 0 gets set but every access
uses address 30. Wouldn't the busy-poll in b53_mdio_op() still see
0xffff and hit the WARN_ON(i == 5)?

mv88e6xxx in single-chip mode has the same gap. It uses
mv88e6xxx_smi_direct_read(), which calls
mdiobus_read_nested(chip->bus, dev, reg) with port and global block
addresses that differ from reg.

For these switches, would the problem described in the commit message
still be there?

> +
>  		if (of_mdiobus_child_is_phy(child))
>  			rc = of_mdiobus_register_phy(mdio, child, addr);

[Severity: Low]
This also changes when the bit gets set for PHYs.

Before, it was set in fwnode_mdiobus_phy_device_register(), after
fwnode_mdiobus_register_phy() had already read the PHY ID:

    if (is_c45 || fwnode_get_phy_id(child, &phy_id))
        phy = get_phy_device(bus, addr, is_c45);

Now get_phy_device() runs with TA failures ignored. A broken-TA PHY
without an ID compatible may now be detected, where get_phy_device()
used to return -ENODEV.

The bit also stays set for an address whose registration fails in
get_phy_device() or fwnode_find_mii_timestamper().

Is this intended? If so, could the commit message mention the effect on
PHY ID probing?

>  		else

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121193655.225520-1-bage%40debian.org

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599586;
	b=gWNdSgld9WwTcSmIRy6+hlsShyC1B9QW53fLlZoVZH1863b/vIhwBR6zEygOCm8ahBf0
	 eNHCrpD94Zw34YGRKNKRsRr0hPkFH1490V+wp1lCxhyTeg5zt6ZlOQuXkY2BB87OCUjiY
	 Xcpw7+MQtEC2WsHXl+hwQix33r2V+4bRCwUCfhP14QULKzZdnP40exP3Uhn1XP+hHB4Th
	 QImQmD4p0wMCd8jhVZftZgb/cPJmby+C/TnG5cmLkO7522gy0IMsry3dIYH8atwI+d2B4
	 mtW8CJlMyUs9wxesfQSFS70eQCo3K/do3QBMNTeT5JxadWFqIn1UQDHVsgB+U2+k/Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599586;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LCE8uK0iceaz5poqdJmms/QNQG9qvIM5XrNWtKcuCDA=;
	b=sAgc2uYVyozzpDXUfvVrhFvxhuJfG2/Xcf39ARyOAheFczt0Pey0rUXRTv7wAhXUgyzR
	 YyHlN1+He3OWOA+DNhD1xUpCxGE7dQkJu+G3swknlu5sYTxu9G5ArfFgOjUgdqHE2TBqr
	 XQ3Nbluvb5A0MUEBYV5b6sCa7RHHLVF6hlJTBBxqMygRquECQN1gkz+qz+EhQZ299kq6N
	 NhNXQzDwjops7i1+U+C1+5ijng8pvBe9aZk34W6DBVzOoUUzuYzEH3PqvGFe3Hi/31GQ3
	 4ikY6HdoXKNUWQNvulD8dSyWherPjXzockHI11tzTjJIYoiCYCLvGpamRPlhq/RE1qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JuXjMaQA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C4606A31E;
	Wed, 25 Nov 2026 09:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JuXjMaQA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0ED1F00A00;
	Wed, 25 Nov 2026 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795599586;
	bh=LCE8uK0iceaz5poqdJmms/QNQG9qvIM5XrNWtKcuCDA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JuXjMaQAgtW+23ndec+YBpf9mustSxcIDFqa8NqigCYVVbmoc++Lq4fUc3AdT+2kO
	 4BOAUb2pFVRIQOayDWscCE6qPe8jcEyUVDG161ZU1xvJ2fXSoUpQvrRxa3XDp3zspe
	 e6W2bEnCPPdXUK3f77Fzl6ncH4k4h7yc/cTlz+z9ycs47by3NAYIXEr3Kf1Znjd93Q
	 7Wdk0d8TGSFVLnyOfUyeNtIPktugER+LnmDcQPpgA0vz3TJgwex/InyAaZLAwNPMt/
	 /y/2wyBtHI35x6GrXoNt+mxeLo6RqpYThI/OQ4htJjSsvq1RuAGoStpL+fUgQLkY7f
	 q1kY6hWSN06OQ==
Subject: Re: [PATCH net-next v2] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
From: netdev-bot+sashiko@kernel.org
To: bage@debian.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, olteanv@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 09:39:45 +0000
Message-ID: <179559958516.3135.11607042178143215952@kernel.org>
In-Reply-To: <20261121092933.186731-1-bage@debian.org>
References: <20261121092933.186731-1-bage@debian.org>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Regression in an exported API: PHYs registered through
  of_mdiobus_phy_device_register() no longer honour "broken-turn-around".
- [Medium] of_mdiobus_register_phy() now sets BIT(addr) in
  mdio->phy_ignore_ta_mask unconditionally, before…
- [Medium] The fix only partly covers DSA switches, which the commit
  message names as the motivating case.
- [Low] The commit message frames the change as a bug fix: mdio.yaml
  documents broken-turn-around for any '@[0-9a-f]+$' MDIO child, but…
- [Low] net: mdio: duplicated broken-turn-around parsing in of_mdio.c

--

net: mdio: handle broken-turn-around for non-PHY MDIO devices

The commit moves parsing of the "broken-turn-around" DT property out of
fwnode_mdiobus_phy_device_register() and into the static helpers
of_mdiobus_register_phy() and of_mdiobus_register_device(). The aim is to
also honour the property for non-PHY MDIO devices such as DSA switches.

> Non-PHY devices, such as DSA
> switches, are registered through of_mdiobus_register_device(), where the
> property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
> still treat the turn-around/read failure as an error.

[Severity: Low]
This describes broken behaviour that users can see, but there is no Fixes:
tag and nothing says whether this is meant for net or net-next.

Should a Fixes: tag be added for the commit that introduced non-PHY
registration through of_mdiobus_register_device() (or the binding change)?
If not, should the commit message say this is new functionality for
net-next?

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
With the parse removed here, what happens to PHYs registered through the
exported of_mdiobus_phy_device_register()?

drivers/net/mdio/of_mdio.c:of_mdiobus_phy_device_register() {
	return fwnode_mdiobus_phy_device_register(mdio, phy,
						  of_fwnode_handle(child),
						  addr);
}

This wrapper never goes through of_mdiobus_register_phy(), so it never
reaches the new parse.

Its in-tree caller, tja1102_p1_register() in drivers/net/phy/nxp-tja11xx.c,
registers the port 1 PHY from a DT child node:

		ret = of_mdiobus_phy_device_register(bus, phy, child, addr);

and does not set phy_ignore_ta_mask itself.

ethernet-phy.yaml documents broken-turn-around for every PHY node. Would
the property on a port 1 node now be ignored without any warning? On a bus
that checks the mask (mdio-bcm-unimac, mdio-pic64hpsc, mdio-bitbang), reads
from that PHY would then return -EIO or 0xffff.

This also means the two exported OF PHY registration paths now disagree on
whether the property is honoured.

>  	/* Associate the fwnode with the device structure so it
>  	 * can be looked up later
>  	 */
> diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
> index b8d298c04d3ff..c03fcf34b3a62 100644
> --- a/drivers/net/mdio/of_mdio.c
> +++ b/drivers/net/mdio/of_mdio.c
> @@ -46,6 +46,9 @@ EXPORT_SYMBOL(of_mdiobus_phy_device_register);
>  static int of_mdiobus_register_phy(struct mii_bus *mdio,
>  				    struct device_node *child, u32 addr)
>  {
> +	if (of_property_read_bool(child, "broken-turn-around"))
> +		mdio->phy_ignore_ta_mask |= BIT(addr);
> +
>  	return fwnode_mdiobus_register_phy(mdio, of_fwnode_handle(child), addr);
>  }

[Severity: Medium]
The bit is now set before fwnode_mdiobus_register_phy()->get_phy_device()
checks whether anything answers at addr. Is it intended that nothing clears
it when registration fails?

For PHY nodes without a reg property, the auto-scan loop in
__of_mdiobus_register() calls this helper for every unregistered address
and expects -ENODEV for most of them:

			if (of_mdiobus_child_is_phy(child)) {
				...
				rc = of_mdiobus_register_phy(mdio, child, addr);
				if (!rc)
					break;
				if (rc != -ENODEV)
					goto put_unregister;
			}

If such a node has broken-turn-around, every empty address scanned before
the real PHY keeps the ignore-TA bit for good. If no PHY is found, every
unregistered address keeps it.

Before this patch, the bit was set in fwnode_mdiobus_phy_device_register().
That only runs after get_phy_device() or phy_device_create() has succeeded.

With those stale bits, unimac_mdio_read() returns the latched data instead
of -EIO:

	if (!(bus->phy_ignore_ta_mask & 1 << phy_id) && (cmd & MDIO_READ_FAIL)) {
		ret = -EIO;

pic64hpsc_mdio_c22_read() behaves the same way. get_phy_c22_id() used to
map -EIO to -ENODEV and skip the address. Now any latched value that does
not match the (*phy_id & 0x1fffffff) == 0x1fffffff check counts as a valid
ID.

Could this register a phantom PHY at the lowest empty address? The loop
breaks on the first success, so the real PHY would never be found.

It would also hide real read errors at those addresses from later users of
the bus. That conflicts with the phy.h description of phy_ignore_ta_mask:
"PHY addresses to ignore the TA/read failure".

The same applies, more narrowly, to the reg-based paths. When
of_mdiobus_register_phy() fails, the bit stays set. The same is true when
of_mdiobus_register_device() fails, either on the IS_ERR() return after
mdio_device_create() or on the mdio_device_free() error path. In both cases
no device was registered.

>  
> @@ -56,6 +59,9 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
>  	struct mdio_device *mdiodev;
>  	int rc;
>  
> +	if (fwnode_property_read_bool(fwnode, "broken-turn-around"))
> +		mdio->phy_ignore_ta_mask |= BIT(addr);
> +

[Severity: Low]
The commit message says the property is now parsed "in one place for
both PHYs and other MDIO devices". The patch actually adds two copies
of the same check in of_mdio.c. One is in of_mdiobus_register_phy() and
the other is in of_mdiobus_register_device().

The two copies also read the same DT node with different accessors.
The PHY helper uses of_property_read_bool(child, ...). The device helper
uses fwnode_property_read_bool(fwnode, ...). For an OF node they should
give the same answer today. A reader cannot tell why the two paths
differ, though, and the copies can drift apart later.

Could this be handled once in a shared place instead? One option is a
small static helper in of_mdio.c that both functions call. Another is
to handle it where the MDIO core already deals with per-device firmware
properties, for example in mdiobus_register_device() once the fwnode is
attached to mdiodev->dev. If the ordering works out, that would also
cover callers of the exported of_mdiobus_phy_device_register(). It
would also set the bit only after a device really exists at the
address. Would that work for the cases you have in mind?

If you prefer to keep the two call sites, please reword the commit
message so it no longer says the property is handled in one place.

[Severity: Medium]
The commit message gives DSA switches as the motivating case. Is the DT reg
address alone enough to cover the bus addresses such a switch actually
uses?

Broadcom b53 switches include the BCM53125, which mdio-bcm-unimac names as
not releasing the line during turn-around. For these, b53_mdio_probe()
accepts either address 0 or 30:

	if (mdiodev->addr != BRCM_PSEUDO_PHY_ADDR && mdiodev->addr != 0) {

However, all switch register traffic in b53_mdio_op() and the
b53_mdio_read*/write* helpers goes to BRCM_PSEUDO_PHY_ADDR (30), whatever
mdiodev->addr is. b53_mdio_probe() also reads the ID from address 0:

	phy_id = mdiobus_read(mdiodev->bus, 0, 2) << 16;

bcm47094-linksys-panamera.dts describes a BCM53125 as switch@0. If that
node had broken-turn-around, only BIT(0) would be set. Reads at address 30
would still fail the TA check (-EIO on unimac/pic64hpsc, 0xffff on
bitbang), and b53 would store those values as register contents.

The reverse is also true. With reg = <30>, the ID read at address 0 during
probe is not covered.

Does this leave the b53 case that the commit message describes still
broken?

>  	mdiodev = mdio_device_create(mdio, addr);
>  	if (IS_ERR(mdiodev))
>  		return PTR_ERR(mdiodev);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121092933.186731-1-bage%40debian.org

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543300;
	b=j54EXamUS+ldRVTSx82pBrXMK3TtmYEcPo+hQ6W/0KL4ZlxhCTU9WgHeX3WEYRSBtpug
	 7WxOMDlqjgBYhCDPzQm6rs5YXkNN/OLr25KnIhKFxtNpP6jzF836d/N4VMXVF/GYQV24C
	 JLSfPZsxE0w6AXmSyzi/7etCj2uvQv9bB2VU0+V7dyI3H/YsHqG1D/c6XDS+yH5Byc4XO
	 dydMBas/dkLn3qpdN2CdIOYopztE0NHqV1fOs3P8N5y9pz08DcGs3g4JotXSJl9LM6mki
	 +UPoQc/1DgXWKrZmTOvpUAed679a7woSbOOFfMm4852a042LG460S79Vnusd5VTX79A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543300;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=KEHc2oGpKEFZORroHwtglxLFlWEAC9v0Y/pi8wqFJbU=;
	b=FMK8eZQiwpbWvAL4uKkvqA/4d2D3PLpuovsI+VZbFcayUVAvb9QcBmW30ENTd/9sJYSO
	 Bx8Lt8VKwibnHuOekBL0/cCFUF7+ZPPhfc4KY3PW9mM9QVG1ke9W3fxkM9O/cUuhtNmnh
	 SO4s7RAb8Zr7qb8UPS8aVgDfBiiUfiorpQalYaNlWCZBVtXlttwxYAWyG2NcF8JrbT+Bt
	 y+ZFaRVS4lKrlR/gVYTaaexmTv0DSMC/CSEsDRMXkAKrMWc26r6i25UH7SPGgDd9s90hA
	 0WNSKT1K1uFF6wzXZv3zATWlJsdtFuFFLMvczXfgd8tFyTPwuaHRxa8RZMDcTkj0nCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORd0iDbe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAEB606A31E;
	Tue, 24 Nov 2026 18:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORd0iDbe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20AD1F000C4;
	Tue, 24 Nov 2026 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543300;
	bh=KEHc2oGpKEFZORroHwtglxLFlWEAC9v0Y/pi8wqFJbU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ORd0iDbesFX2uN3Nk7tLH7KuNWEjC/n+UOftvPXVlfGg3a/nT2fc1/v9wTUhmA42J
	 ATo5YwDkSYtwWMrrSr0655Uhjb32/bLH7MyjxEgG6Nub/i+4am6xcy9IU4VsevcnjV
	 /aCKxUobadLrPXUWcDWLqjRRpLY0540s0dUjFoSChoqDF4q5BduJF4gK+UEppDjmTy
	 WnP0OyMnM9m4FcbJP5v8uDiDaoGXNn1AK+onlwJVYTrhrRVPOfwSlGsMgMpyjNCGz2
	 Eszy1/WbKnvHRZDFnZxTvrWJhsws2LGaY5tS5pWmAuec8ARWZbHZdEHAu60OW2qW5x
	 RHcgMv9m6GORw==
Subject: Re: [PATCH net-next v3 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
From: netdev-bot+sashiko@kernel.org
To: paul.louvel@bootlin.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 miquel.raynal@bootlin.com, herve.codina@bootlin.com
Date: Tue, 24 Nov 2026 18:01:39 +0000
Message-ID: <179554329951.3135.10331717486625709759@kernel.org>
In-Reply-To: <20261120-marvell-phy-rgmii-v3-4-c11c99798931@bootlin.com>
References: <20261120-marvell-phy-rgmii-v3-4-c11c99798931@bootlin.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On RGMII-attached 88E151x PHYs with an SFP cage,
  m88e1510_config_init() (drivers/net/phy/marvell.c:1409-1410) now…
- [Medium] Before this patch, m88e1510_config_init() did not touch
  GEN_CTRL_REG_1[2:0] for RGMII-attached 88E1510/1512/1514/1518 PHYs.

--

net: phy: marvell: add RGMII-to-Copper mode configuration

This commit extends m88e1510_config_init() so it programs the
GEN_CTRL_REG_1 mode field when the interface is any rgmii variant. The mode
written is RGMII-to-Copper. Before, only the SGMII-to-Copper case was
handled.

> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index a72d307eaf12c..423d146426ff5 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c
> @@ -1403,9 +1403,11 @@ static int m88e1510_config_init(struct phy_device *phydev)
>  	if (err < 0)
>  		return err;
>  
> -	/* SGMII-to-Copper mode initialization */
> +	/* RGMII/SGMII-to-Copper mode initialization */
>  	if (phydev->interface == PHY_INTERFACE_MODE_SGMII)
>  		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
> +	else if (phy_interface_is_rgmii(phydev))
> +		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);

[Severity: High]
Can this overwrite the serdes mode that was set for an SFP module on
88E1512 boards with an RGMII host and an SFP cage?

When a module is inserted, m88e1510_port_configure_serdes() writes the same
MODE field:

drivers/net/phy/marvell.c:m88e1510_port_configure_serdes() {
    ...
		case PHY_INTERFACE_MODE_1000BASEX:
			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
    ...
	return m88e1510_config_mode(phydev, mode);
}

That write happens only through phy_sfp_module_insert()->configure_mii(),
once per insertion event. The SFP upstream is registered at phy_probe()
time, and sfp_sm_module() reports the insertion from SFP_MOD_WAITDEV. So
the module is normally configured before the MAC attaches the PHY.

After that, each of these paths runs config_init again:

phy_attach_direct()->phy_init_hw()->m88e1510_config_init()
mdio_bus_phy_resume()->phy_init_hw()->m88e1510_config_init()
phy_abort_cable_test()->phy_init_hw()->m88e1510_config_init()
SIOCSMIIREG with BMCR_RESET -> phy_init_hw()->m88e1510_config_init()

With this change, phy_interface_is_rgmii() is true on these boards. MODE is
forced back to RGMII-to-Copper and the PHY gets a soft reset. Nothing calls
configure_mii again after phy_init_hw(). Would the SFP link then stay down
until the module is physically re-plugged?

Before this patch, config_init did not touch the mode for RGMII, and the
88E1510 driver entry has no .soft_reset. That meant the SFP mode survived
phy_init_hw(). This RGMII-host SFP setup is the one supported by commit
b697d9d38a5a ("net: phy: marvell: add SFP support for 88E1510") and commit
1384e1383829 ("net: phy: marvell: Support SFP through phy_port interface").
The commit message does not mention how the change interacts with them.

[Severity: Medium]
Does this also override a fibre or auto-media mode that was set outside the
kernel, for example by straps or the bootloader, on RGMII-attached
88E151x PHYs?

The 88E1510 entry advertises PHY_GBIT_FIBRE_FEATURES. Since commit
6cfb3bcc0641 ("Marvell phy: check link status in case of fiber link."),
marvell_read_status() checks the fibre page for non-SGMII hosts:

drivers/net/phy/marvell.c:marvell_read_status() {
    ...
	if (linkmode_test_bit(ETHTOOL_LINK_MODE_FIBRE_BIT,
			      phydev->supported) &&
	    phydev->interface != PHY_INTERFACE_MODE_SGMII) {
		err = marvell_set_page(phydev, MII_MARVELL_FIBER_PAGE);
    ...
}

If MODE is forced to 000 (RGMII-to-Copper) on every config_init, the fibre
side looks disabled on such boards. marvell_read_status() would then never
see a fibre link.

Also, m88e1510_config_mode() always sets MII_88E1510_GEN_CTRL_REG_1_RESET,
even when the mode does not change. Every RGMII user now gets a mode soft
reset on each config_init, where before only SGMII did. Should the commit
message describe this change in behaviour, and the failure that motivated
the patch?

>  	if (err < 0)
>  		return err;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-marvell-phy-rgmii-v3-0-c11c99798931%40bootlin.com

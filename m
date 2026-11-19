Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048647;
	b=ZbDYQfV/0zaR2zJuqD1NffKAovdUrhy4himpUBVfrQS6bx17FKojDARcYBlB+gNsDVp4
	 Z3qGodnp8gci5VMjRKYRs4CZafi8zzR1I9K/iZoG2EqlDO++GDTdpji2pX4aDwu2kI4bP
	 miILFRMFQmX8E80r2z3b1cxKLO49HUn2+rfuGgJZ7ecslOsOxXV15U//TKhqCydbI6E7f
	 NElpJ/G8QoSGwhAd//xyn/BS8BgCGzLBBGOkkCPcc8/BEoehLVcbo2B6UFctal2eh0mks
	 mSay7su+2FSJRpIhc3oUXa/8jWNoIWwlLXWAqbIswf2IBNGlnNQndykHq9NqGNIMgig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048647;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CI6x+CfYhxIi6aj6Fo8YFq6AXBAaaIBIbIOfTFY9uVg=;
	b=Yr3ebIRMgOant0rUGhEAdVQnMtm+08nGMpbfgvnbKNh9CJQwdsKzRBKDT8301YBSNFM1
	 +iFp0x527d8ecOFV0a/Y5TsrZia4Jbkrui4Xlopw+zVHtTrepLxcbLY6L77z5nLo7xpId
	 9sng4uP5YeinGWm3ww3W4LKIPeaf0hhqtcg8Q/dR25Im1hO8OXNOeioWSeHDxGpeEE7xO
	 j7KJLlm9LwB5QkwfvhcddKeZeM2eBwLpsQtNcVFNIJvwWSf0Nr63za2T2sGtdxQAwxmXQ
	 gnRS+Q9gOdjhoLqglQKDAJ11Px0udeFambVJoGQdy/PVYsri9p4S1hT0suAc9FhI7Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTwTdSmF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4B606A32A;
	Thu, 19 Nov 2026 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTwTdSmF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE301F000C4;
	Thu, 19 Nov 2026 00:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048647;
	bh=CI6x+CfYhxIi6aj6Fo8YFq6AXBAaaIBIbIOfTFY9uVg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oTwTdSmFuB5TXTLeLrj5Vnpgtfe7b1dEYWDh5ShO/y+vNB7IkeWoQLFHoAfVI0RN5
	 pSGp/Z+fMIgQCSHQ2BonChTDADS+kMvXlVQvtBa2XBkI0d5H/k6CWejJ7iSiNpm8xC
	 0YaSN9iQwUnP/XX1Kdhln9Y20NgG2AvWRoForB2wOUPJbLbygeqbWW76sjkqv/khCM
	 oFRInKLQ5iYAlSuxSNiQQTIPMI/rkSGCmcM0anWSeo1wvPuMA9jTnoTEOleHWuHy0S
	 a/68H6iwXbMvZntDQhUBTC4Utp1QwRB/fWdwrMTJd0vZj4h9ZnO4gJW2NYt2qXPpu0
	 hm+xeZ9xHZ4RA==
Subject: Re: [PATCH net-next v2 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com, justin.chen@broadcom.com,
 opendmb@gmail.com, nb@tipi-net.de, bcm-kernel-feedback-list@broadcom.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kudzo51@gmail.com
Date: Thu, 19 Nov 2026 00:37:26 +0000
Message-ID: <179504864618.3136.11725933579190133133@kernel.org>
In-Reply-To: <20261116213449.1682731-2-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-2-florian.fainelli@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In get_phy_c45_ids() (drivers/net/phy/phy_device.c), the first
  MMD loop (lines 859-862) now returns get_phy_c45_probe_err(phy_reg),…
- [Low] The patch fixes a real, user-visible failure but has no Fixes:
  tag.
- [Low] The kernel-doc of the exported phy_get_c45_ids()
  (drivers/net/phy/phy_device.c:1091-1096) still says it returns '%-EIO…

--

net: phy: Map C45 probe read errors to -ENODEV during bus scan

This commit makes get_phy_c45_devs_in_pkg() return the raw bus error. In
get_phy_c45_ids(), an -EIO or -ENODEV from the devices in package reads is
now mapped to -ENODEV. A C45 bus scan can then skip empty addresses on
controllers that report a read from an empty address as a bus error.

> Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
> mapping as get_phy_c22_id() to the two places that look for a device at an
> address: the loop over the MMDs and the MMD 0 fallback. Errors from the
> reads of the per-MMD identifiers, which only happen once a device has
> answered, are still reported as -EIO.
>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

[Severity: Low]
Should this carry a Fixes: tag?

Commit 17b447539408 ("net: phy: c45 scanning: Don't consider -ENODEV
fatal") was meant to make the C45 scan treat -ENODEV as non-fatal. It only
changed the phy_c45_probe_present() call, on the assumption that this was
the first place a read occurs.

In get_phy_c45_ids(), the first read for an address is actually the MMD 1
devices in package read. phy_c45_probe_present() only runs for MMD 30/31.
Commit 6f533abe7bbad2 already fixed a related problem in the same mapping
and carries Fixes: 17b447539408.

This can be hit in mainline today, without the rest of the series.
orion_mdio_xsmi_read_c45() in drivers/net/ethernet/marvell/mvmdio.c
returns -ENODEV for an invalid read:

	dev_err(bus->parent, "XSMI bus read not valid\n");
	return -ENODEV;

Take a DT child with "ethernet-phy-ieee802.3-c45" at an address where no
PHY is present. Before this patch the path was:

fwnode_mdiobus_register_phy()
  get_phy_device(is_c45=true)
    get_phy_c45_ids()
      get_phy_c45_devs_in_pkg() -> -ENODEV, returned as -EIO

__of_mdiobus_parse_phys() treats anything other than -ENODEV as fatal and
unregisters the whole MDIO bus.

Without the tag, stable kernels that carry 17b447539408 and 6f533abe7bbad2
keep the half-applied behaviour.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..4071041e1051d 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -789,17 +789,30 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,

[ ... ]

> +/* get_phy_c45_probe_err - map a bus error seen while looking for a device.
> + * @err: negative error code returned by a bus read
> + *
> + * Like get_phy_c22_id(), report -ENODEV when the bus read failed with -EIO or
> + * -ENODEV, which is how a controller signals that nothing answered at this
> + * address, so that bus scanning carries on with the next address. Anything
> + * else is reported as -EIO.
> + */
> +static int get_phy_c45_probe_err(int err)
> +{
> +	return (err == -EIO || err == -ENODEV) ? -ENODEV : -EIO;
> +}
> +

[ ... ]

> @@ -845,7 +858,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  		}
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
>  		if (phy_reg < 0)
> -			return -EIO;
> +			/* returning -ENODEV doesn't stop bus scanning */
> +			return get_phy_c45_probe_err(phy_reg);
>  	}

[Severity: Medium]
Can this early return skip a device that is present but does not drive
the bus on the first MMD probed?

On a controller that samples the pull-up, an MMD that does not respond
reads as 0xffff. The loop then moves on to the next MMD, and after that to
the MMD 0 fallback.

On a controller that checks turnaround, the same MMD now ends the probe of
the whole address with -ENODEV. Examples are UniMAC, which returns -EIO on
MDIO_READ_FAIL and gets read_c45 later in this series ("net: mdio:
mdio-bcm-unimac: Add Clause 45 support"), and mvmdio XSMI, which returns
-ENODEV when READ_VALID is clear.

A Cortina CS4315/CS4340 style PHY only uses MMD 0:

drivers/net/phy/cortina.c:cortina_read_reg() {
	return mdiobus_c45_read(phydev->mdio.bus, phydev->mdio.addr, 0, regnum);
}

On these controllers, can the MMD 0 fallback below ever be reached for such
a PHY, given that the MMD 1 read fails first?

A device can also answer MMD 1 with devs_in_pkg == 0x0000, which means it
drove MDIO low, and then fail turnaround on MMD 2. That failure is also
mapped to -ENODEV here. This seems to go against the commit message:

    Errors from the reads of the per-MMD identifiers, which only happen
    once a device has answered, are still reported as -EIO.

mdiobus_scan_bus_c45() then swallows the error:

	phydev = mdiobus_scan_c45(bus, i);
	if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
		return PTR_ERR(phydev);

So the device is dropped with no message. Before this patch, bus
registration failed and the problem was visible.

Would it work to treat the bus error the same way as a 0xffff reply? That
would mean continuing the loop, trying MMD 0, and returning -ENODEV only if
nothing answered, instead of returning early.

> @@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  		 */
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
>  		if (phy_reg < 0)
> -			return -EIO;
> +			return get_phy_c45_probe_err(phy_reg);

[Severity: Low]
Does the kernel-doc of the exported phy_get_c45_ids() still match after
this change? The doc for get_phy_c45_devs_in_pkg() was updated, but this
one still says:

 * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
 * the "devices in package" is invalid.
 */
int phy_get_c45_ids(struct phy_device *phydev)

Both call sites in get_phy_c45_ids() now go through
get_phy_c45_probe_err(). A real bus -EIO on a PHY that already exists
therefore comes back as -ENODEV.

phy_get_c45_ids() is not a bus scan. gpy_probe() in mxl-gpy.c calls it on a
bound PHY and returns the result as its probe status:

	if (!phydev->is_c45) {
		ret = phy_get_c45_ids(phydev);
		if (ret < 0)
			return ret;
	}

call_driver_probe() logs -ENODEV only with dev_dbg(), as "rejects match".
-EIO gets a dev_err().

Would a real MDIO bus fault during gpy_probe() now turn into a silent
failure to bind?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116213449.1682731-1-florian.fainelli%40broadcom.com

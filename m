Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795142082;
	b=s2It/uQKs82WrbO/4oSE8BB9ik6bbgL4i1Oj4r9uUrIiNbTrBLHGjQLp1il1HAp1OPxE
	 l4/WrWoRanlmgt2Oqm/riLecd/A1MrK4ZlBEddaBmevBfrWTD9MRvbUUx+zhCsQ+9CwLx
	 EhsYoK9kRfaA/lYf2HUapezeHP22E8E3y+9eINbLDFBmtT0vXSpKXadxAh2axniCIzsB1
	 ynOuVu4qnRhIVoDJnUWl76AcjHtx+BXaEOQicybJdGTaMe2QzzOireQEFyg50o5jPqLHg
	 Jm16FiCbRE1gTOPuSRj2bWzLBQyUIgHqguMMtjKkdM6BG5vSNYqiSPYMpmRotWzRVrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142082;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/wHtDW+OZkBmVCLcmjJdA6BA5sRlKcIhw+iWrdmJGD0=;
	b=sDfvv2JhXL52LnmohEWb0yrU28irAXyTwvKYmVJzlQ75dnSBDHseuCwvcMK2c6bwvPQr
	 ufT9Y7rWEb0m7H0GcsfEfD/Zt1otBiIA3LSFO7VjKV469D6p13yG8Hl08TGHd9RlBZxwA
	 H5ZU78Pdd/aMZqVrjD6ixlQsIMYRVn0v4101+XXiiOiKumE0un5gE9jnzpEfF+zGC/YSV
	 HUQ8qoOsI1nhbn7wLcPXZcw/JXSdImSvnUjxIKJLyoGgAdvXDS1P5Q6mtMdCdvs1LD0HE
	 i5Q/g6Tw2GyIttkXWq9HFaLyhX4Xi78IgIXjlTeA4fXfmv9hIfi7Y/Pb61HzpXSfUwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxohPPXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938FF606A339;
	Fri, 20 Nov 2026 02:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxohPPXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870061F000D0;
	Fri, 20 Nov 2026 02:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142082;
	bh=/wHtDW+OZkBmVCLcmjJdA6BA5sRlKcIhw+iWrdmJGD0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RxohPPXO/eeqMd2L1OcOjFpgsEmK2BmcE+CvcDgmNC5bPgohz7H4TtauzWbT74Qcr
	 yDE+NDWhkk/85eoO5bTTIw0iPjmuW+Kpn21aGl//aRkELUw5ziTpgU0S4fWSUmoqeM
	 964uXpCdzpDI14Qf2f2XrVrTCgAjwh3JtPv2jMA+vK5MGq2ABGn3uX2Ovpp+FHiKG4
	 lGnUJ0NWlFh2R4Q/UeVrpELsYacrFdbk0jY1/M10KHgQHcwQejcZefhyM3BShXUDLs
	 pE8Kn4eKqMceXnp1Fa9MtHNvh+7KDv6fGR9SA24U/bvzwSwfcCtYwM3hTMtkRlRKpR
	 7OJw8HzwF9oig==
Subject: Re: [PATCH net-next v3 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, nb@tipi-net.de, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Fri, 20 Nov 2026 02:34:41 +0000
Message-ID: <179514208109.3136.8422011628328621271@kernel.org>
In-Reply-To: <20261117233149.1693881-2-florian.fainelli@broadcom.com>
References: <20261117233149.1693881-2-florian.fainelli@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On MDIO controllers that flag a missing turnaround as a bus
  error, get_phy_c45_ids() now treats one failed Devices-In-Package read…
- [Low] The subject says "during bus scan", but get_phy_c45_ids() is
  reached through get_phy_device(bus, addr, true) for every C45 caller,…
- [Low] The patch updates the kernel-doc of get_phy_c45_devs_in_pkg() but
  leaves the return-value docs of get_phy_c45_ids()…
- [Low] (Baseline: judged a false positive, kept only because
  requires_validation=true.) The concern says the commit message's…

Pre-existing issues:
- [Low] (Baseline: dismissed as a pre-existing low-severity issue, kept
  only because requires_validation=true.) In the second loop of…

--

net: phy: Map C45 probe read errors to -ENODEV during bus scan

This commit makes get_phy_c45_devs_in_pkg() return the raw bus error. It
maps -EIO/-ENODEV from the devices-in-package reads in get_phy_c45_ids()
to -ENODEV, the same way get_phy_c22_id() does. The intent is to let
mdiobus_scan_bus_c45() move past empty addresses on controllers that
report an unanswered read as a bus error, instead of failing
__mdiobus_register().

> net: phy: Map C45 probe read errors to -ENODEV during bus scan

[Severity: Low]
The subject says "during bus scan". However, every C45 caller reaches
get_phy_c45_ids() through get_phy_device(bus, addr, true). Does the new
mapping also change behaviour outside the scan?

For DT/ACPI nodes compatible with "ethernet-phy-ieee802.3-c45",
fwnode_mdiobus_register_phy() calls get_phy_device() directly:

drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy() {
    ...
	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy = get_phy_device(bus, addr, is_c45);
    ...
}

and __of_mdiobus_parse_phys() handles -ENODEV and -EIO differently:

drivers/net/mdio/of_mdio.c:__of_mdiobus_parse_phys() {
    ...
		if (rc == -ENODEV)
			dev_err(&mdio->dev,
				"MDIO device at address %d is missing.\n",
				addr);
		else if (rc)
			goto exit;
    ...
}

Before this patch, a failed MDIO_DEVS1/MDIO_DEVS2 read made bus
registration fail. Now it logs the "missing" message and the bus
registers without that PHY.

SFP behaves the same way. sfp_sm_probe_phy() passes -ENODEV through.
sfp_sm_main() then retries, eventually reports "no PHY detected" and
starts the module. Before, an -EIO from mdio-i2c sent the module to
SFP_S_FAIL.

Real controller faults reported as -EIO, such as a timed out C45 address
phase, will also look like "no device" now.

This matches what get_phy_c22_id() already does. Could the commit message
mention these callers as well?

> MDIO controllers that report a read from an empty address as a bus error
> (e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
> with unmasked addresses therefore cannot be registered: the C45 scan fails
> on the first empty address.

[Severity: Low]
This isn't a bug, but at this point in the series mdio-bcm-unimac.c does
not set bus->read_c45, so the UniMAC example cannot reach
mdiobus_scan_bus_c45() yet.

The later patch "net: mdio: mdio-bcm-unimac: Add Clause 45 support" adds:

	bus->read_c45 = unimac_mdio_read_c45;
	bus->write_c45 = unimac_mdio_write_c45;

and its C45 read path returns -EIO on MDIO_READ_FAIL. So the premise
holds by the end of the series, and the sentence above is already
conditional on read_c45() being provided.

Could the commit message say that the UniMAC case is enabled by that
follow-up patch?

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..4071041e1051d 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -780,7 +780,7 @@ static int phy_c45_probe_present(struct mii_bus *bus, int prtad, int devad)
>   * Description: reads devices in package registers of a MMD at @dev_addr
>   * from PHY at @addr on @bus.
>   *
> - * Returns: 0 on success, -EIO on failure.
> + * Returns: 0 on success, or the negative error code from the bus read.
>   */

[Severity: Low]
This kernel-doc is updated. Should the return value docs of
get_phy_c45_ids() and of the exported phy_get_c45_ids() be updated too?
The phy_get_c45_ids() doc still says:

 * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
 * the "devices in package" is invalid.

and get_phy_c45_ids() still documents "%-EIO on bus access error". With
this patch, a bus -EIO on the devices-in-package reads is returned as
-ENODEV.

The only user outside this file, gpy_probe() in mxl-gpy.c, returns that
value directly from probe():

	if (!phydev->is_c45) {
		ret = phy_get_c45_ids(phydev);
		if (ret < 0)
			return ret;
	}

A real bus -EIO there now becomes -ENODEV. The driver core treats that as
a quiet match rejection at dev_dbg level, not a logged probe failure.

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
On controllers that report a missing turnaround as a bus error, could
this skip a real PHY whose first probed MMD doesn't answer?

The loop depends on its condition to step past unimplemented MMDs:

	for (i = 1; i < MDIO_MMD_NUM && (devs_in_pkg == 0 ||
	     (devs_in_pkg & 0x1fffffff) == 0x1fffffff); i++) {

The MMD 0 fallback below exists for PHYs such as the Cortina
CS4315/CS4340. Both of these assume that an absent MMD reads back as
0xffff.

With the later C45 patch, UniMAC checks TA, and unimac_mdio_do_read()
returns -EIO for any (addr, devad) pair that doesn't answer:

	if (!(bus->phy_ignore_ta_mask & 1 << phy_id) && (cmd & MDIO_READ_FAIL)) {
		ret = -EIO;
		goto out;
	}

So if the MMD 1 read fails, get_phy_c45_ids() now returns -ENODEV here.
No later MMD and no MMD 0 fallback is tried. mdiobus_scan_bus_c45() then
treats the address as empty:

			if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
				return PTR_ERR(phydev);

The DT path through fwnode_mdiobus_register_phy() reaches the same code.

These cases look affected:
- a PHY with no MMD 1 (PMA/PMD)
- a PHY whose MMD 1 reads 0 and whose next MMD doesn't answer
- a PHY that only answers on MMD 0

I haven't confirmed an in-tree controller and PHY pair that does this.

Before this patch the same setup made bus registration fail with -EIO, so
no configuration that worked before breaks. With the patch, the PHY is
left off the bus without any message.

Would it be more robust to treat an -EIO/-ENODEV devices-in-package read
as "this MMD is absent" (devs_in_pkg set to all ones) and keep walking?
-ENODEV would then be returned only after the MMD 0 read has also failed.

> @@ -855,7 +869,7 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  		 */
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
>  		if (phy_reg < 0)
> -			return -EIO;
> +			return get_phy_c45_probe_err(phy_reg);
>  
>  		/* no device there, let's get out of here */
>  		if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff)

[Severity: Low]
This is a pre-existing issue, not one introduced by this patch. Further
down in get_phy_c45_ids(), the second loop returns the
phy_c45_probe_present() error unchanged:

		if (i == MDIO_MMD_VEND1 || i == MDIO_MMD_VEND2) {
			...
			ret = phy_c45_probe_present(bus, addr, i);
			if (ret < 0)
				return ret;

The MII_PHYSID1/MII_PHYSID2 reads right after it return -EIO instead.
This path can also return an errno outside the documented 0/-EIO/-ENODEV
set.

The commit message says reads made after a device has answered are still
reported as -EIO. Should this path be normalized the same way?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117233149.1693881-1-florian.fainelli%40broadcom.com

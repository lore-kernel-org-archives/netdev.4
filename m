Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153111;
	b=Dv21FYxGQwJUws5QSJCY+NQn0Nrin5z246asXjeF5ac17eiLHlyRoQu0sE0V3/Bd8nYE
	 pb2jUrklwCogfxDQnlHqbpb6mMG0shSM+HMGvj80ZaqXjDAI9I2zUygcye//GV0Bj7kgb
	 fa5Lbr6ZN7+32of25WVTG2fynEw/ScgjlhkEBqXJ0Szbdiqt6K8wyVX4vry8f4WDY7CVX
	 99+dEewrBmvYK0AEVtjF8Ujx32IGX703xC022fxTlX702nT3AOYI4q5MOVYaSmFj4u3iz
	 0yn0uEAbos222QleBJnehEpROpYqswPmyRvepb+nYcj84VA7g4PpErKw0DyJfCoaRjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153111;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XOjSlJvgQP4Iaas7h11mJ3/93ER6A7G5BBfYIFJUboE=;
	b=I40BVI3aekuBYBu0qOGB6aG/HISEkYZhKgq2j4tuw0M9h3Hbs23KpLK/RSM1vTGS1lt2
	 zLIiPA7HCorcg8mXNjJ/ve/HdLpURXonwVy+2HRbAXno4TICdX7rkCW6enI7lkK0A8nEt
	 7PoymdL6InVDJczeao7JKR2CYPkZINJ3vvZooAsE2T7goLO/CXEGI1iT1sN14t6ffOHqF
	 NEBE/sbURp5zXO/j3wDTHPUU8hYxU4lZqYiuzi0IndNCabw5sJkAa6ZARJCAJRYv4rg/V
	 I3bJSu/sh81rz8F9YFrtqgrng8STk9oqNS9ZeDAjItfkZv8kgrr81u+Ho1JME3Yi7dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GdCyH9kV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E79606A320;
	Fri, 20 Nov 2026 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GdCyH9kV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A3E1F000C6;
	Fri, 20 Nov 2026 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795153111;
	bh=XOjSlJvgQP4Iaas7h11mJ3/93ER6A7G5BBfYIFJUboE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GdCyH9kVDo50BeQqxTan6qurJr8c8eoUCjmIdh9CL7hoAeBKzdvJzcDyH1Fz3g+qa
	 v2YJHqvY03WqpGhspapq3VoZIaUdf1ALBUflZpZ+Op4atVN35MC68xiHeigqFZbeW6
	 ZxRDAPy5OWKWSfV6LzuV9wdoM7TMJ7Fo8O5m0SbmFzcxFwap4bLTB/JxOOpeB7CoGb
	 B9MoNQfxV7e/chTSD1q1WZL0oeM8Til5eUJSZncGsNYuw0vvSS/Xa9GS2Jyecniasb
	 v0UUyPB9fuj+EhPjaZm2jlk33/5RgZDayVmG2JXtfVO89bugn9Ez8+QbuAzoAmM9c7
	 Qw9QcUA3Sl2JQ==
Subject: Re: [PATCH net-next v4 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Fri, 20 Nov 2026 05:38:30 +0000
Message-ID: <179515311013.3136.13885466048757926038@kernel.org>
In-Reply-To: <20261119005943.999981-2-florian.fainelli@broadcom.com>
References: <20261119005943.999981-2-florian.fainelli@broadcom.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The -EIO/-ENODEV -> -ENODEV mapping in get_phy_c45_ids()
  (drivers/net/phy/phy_device.c) applies to every caller, not only…
- [Low] The commit message gives the UniMAC MDIO block (MDIO_READ_FAIL)
  as its example of a controller whose read_c45() reports an empty…
- [Low] The patch rewrites the kernel-doc of get_phy_c45_ids() (lines
  826-828) and of the exported phy_get_c45_ids() (lines 1107-1109).

--

net: phy: Map C45 probe read errors to -ENODEV during bus scan

This commit makes get_phy_c45_devs_in_pkg() return the raw bus error.
get_phy_c45_ids() now maps -EIO/-ENODEV to -ENODEV for the devices in
package reads, both in the MMD loop and in the MMD 0 fallback, which
matches what get_phy_c22_id() does. With this, mdiobus_scan_bus_c45() can
skip empty addresses on controllers that report an empty address as a bus
error.

> MDIO controllers that report a read from an empty address as a bus error
> (e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide read_c45()
> with unmasked addresses therefore cannot be registered: the C45 scan fails
> on the first empty address.

[Severity: Low]

At this commit, drivers/net/mdio/mdio-bcm-unimac.c does not set
bus->read_c45 yet. The UniMAC example therefore can't reach
mdiobus_scan_bus_c45() here.

The read_c45 support comes later in the series, in "net: mdio:
mdio-bcm-unimac: Add Clause 45 support". In that patch
unimac_mdio_do_read() returns -EIO when MDIO_READ_FAIL is set.

Could the commit message say that the UniMAC case depends on that later
patch? That would help anyone who backports this fix on its own through
the Fixes: tag.

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..79f3fa1e9a036 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -810,8 +823,9 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
>   * the PHY identifiers for each device. Return the "devices in package"
>   * and identifiers in @c45_ids.
>   *
> - * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
> - * the "devices in package" is invalid or no device responds.
> + * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
> + * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
> + * reads that look for a device), or %-EIO on any other bus access error.
>   */

[Severity: Low]

Is this list of return values complete? Further down in
get_phy_c45_ids(), the Device Identifier loop still returns the error
from phy_c45_probe_present() unchanged:

drivers/net/phy/phy_device.c:get_phy_c45_ids() {
    ...
		if (i == MDIO_MMD_VEND1 || i == MDIO_MMD_VEND2) {
			...
			ret = phy_c45_probe_present(bus, addr, i);
			if (ret < 0)
				return ret;
    ...
}

So whatever errno the controller's read_c45() returns for MDIO_STAT2 can
reach the caller. That could be -ETIMEDOUT, or an unmapped -EIO/-ENODEV.
The same call in the first loop is mapped.

The raw return predates this patch. However, the new kernel-doc here, and
the same new wording on the exported phy_get_c45_ids(), now reads as a
complete list of zero, -ENODEV or -EIO.

Should this call site be mapped too? The alternative would be to word the
kernel-doc less strictly.

[ ... ]

> @@ -844,8 +858,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  				continue;
>  		}
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
> -		if (phy_reg < 0)
> -			return -EIO;
> +		if (phy_reg < 0) {
> +			ret = get_phy_c45_probe_err(phy_reg);
> +			if (ret != -ENODEV)
> +				return ret;
> +

[ ... ]

> +			devs_in_pkg = 0xffffffff;
> +			break;
> +		}
>  	}
>
>  	if ((devs_in_pkg & 0x1fffffff) == 0x1fffffff) {
> @@ -855,7 +881,8 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  		 */
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
>  		if (phy_reg < 0)
> -			return -EIO;
> +			/* returning -ENODEV doesn't stop bus scanning */
> +			return get_phy_c45_probe_err(phy_reg);

[Severity: Low]

The subject limits this change to the bus scan. However,
get_phy_c45_ids() is shared by every get_phy_device(bus, addr, true)
caller and by the exported phy_get_c45_ids(). Is the new return value
intended for those callers as well?

Some of them now get -ENODEV instead of -EIO when the devices in package
reads fail:

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

Previously this aborted the bus registration. Now it logs the message and
continues.

drivers/net/phy/sfp.c:sfp_sm_probe_phy() {
    ...
	phy = get_phy_device(sfp->i2c_mii, addr, is_c45);
	if (phy == ERR_PTR(-ENODEV))
		return PTR_ERR(phy);
    ...
}

The SFP state machine now retries and then reports "no PHY detected".
Previously it went to SFP_S_FAIL.

gpy_probe() in drivers/net/phy/mxl-gpy.c now passes on -ENODEV from
phy_get_c45_ids() instead of -EIO.

This does look consistent with existing phylib behaviour.
get_phy_c22_id() already applies the same mapping for every
get_phy_device(..., false) caller. The phy_c45_probe_present() branch has
also done it for C45 since commit 17b447539408.

Could the commit message mention these non-scan callers? As written, the
subject suggests the change only affects mdiobus_scan_bus_c45().

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119005943.999981-1-florian.fainelli%40broadcom.com

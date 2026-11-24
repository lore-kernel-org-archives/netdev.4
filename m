Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498738;
	b=SvgmPHRKKJ8MU9XKMF7ZlBLFOUixH2XOCUec0IeVsmUrlO/tkm6y22C4JixwX1eC+CGJ
	 IoNUAbPIgdGbPtGtiJIzzz4Sf4/PeM0l68PBXZpgRSY4MWavQa8OgAuOJiAC6QPHzusP5
	 OKAnpEFFEfG4CHla+XI8Z3vGHX9PAPkkJo82vadRf4qq8zcRh660f4TNCKqlQW6TejcBs
	 GPxfx7uPtbUx1h0Tqu66VquMzjbAxIr4rFpAaAVycAoCYhkH0hbvrm/upbrg7qk1vbUkp
	 IYjri4iHTlCCaivyQbe1AuEylErryMT/7xPsn0ggKK2v+0V7chlOa5EPBGoUqo7hA/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498738;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lUhyx8LQWnjIInAaRIg9z9hjcTi/e66UaFQJ4bM0G+o=;
	b=plDGwa6TtUHLJ9EhAMmvr9Meadb62at6F7Vyi0/lhJwM8ohHHPwk1huhkVXkJUE+Asru
	 EMeRwbEWR7ty3rCuZgKhQIbjIQhl29Lgf5DfSHG/J+hYEs25WDY0cthFu7Bsyl+wLYTZw
	 iFXzn8m5W7Hq5teLYY1uOqhUbFCtuWoDI47is0i3XH1/EFhaLpEPMjSEjTgyLqLnlFetl
	 6J5dPC21jKln+Vsb+ohRdLUPFZ0ho9Y/CadQL8U8Xjt3uGkfuUsMctMGUb3Ok7UlxCYWH
	 0lCasTNbIkhVygpI0Z4i0DxDMyqwQYz17DdH+UMCvQlpF2HjqjLn/HvWPryB42isKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzRAwNko;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D958C606A31E;
	Tue, 24 Nov 2026 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzRAwNko
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68B81F000C4;
	Tue, 24 Nov 2026 05:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795498738;
	bh=lUhyx8LQWnjIInAaRIg9z9hjcTi/e66UaFQJ4bM0G+o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jzRAwNko4mj0T6asS7q+9Ckw7Psi1CrpRaX/blwRL9JhtR+YBRaiSemGE1qqIo1G1
	 Ys0iHWI6e3ux6LUA8+GdJ0SvVy7Q6dNSW3Xrh6M2kBksF2ZojqNPjtrk4q4CkB/Sel
	 V7/0Iocjh/r2colmuTYIX1EC/57iNaPuIYpEgzeovAd65NndegVgNqXqWtG2oL+W70
	 TRLeoM+znDuoGGqJ3hczR6ypxF/+JozyNtr2JFaoQTEuASy2Ur6EqDrQ5tLvW3w2hj
	 BPds43ZDbgv56S9HA6tZID+gnSWac6yel6rOccZadxnrOo3mE/b3E3wrUhV3kCuTnN
	 jAz4E8ymhIWWA==
Subject: Re: [PATCH net-next v4 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com, justin.chen@broadcom.com,
 opendmb@gmail.com, nb@tipi-net.de, bcm-kernel-feedback-list@broadcom.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kudzo51@gmail.com
Date: Tue, 24 Nov 2026 05:38:57 +0000
Message-ID: <179549873735.3135.6221350265873603736@kernel.org>
In-Reply-To: <20261120051653.1433677-2-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-2-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When a C45 package does not answer on the first MMD it probes,
  get_phy_c45_ids() stops probing (drivers/net/phy/phy_device.c:860-873).
- [Medium] phy_get_c45_ids() is exported.
- [Low] The subject ("... during bus scan") and the body describe only
  the mdiobus_scan_bus_c45()/__mdiobus_register() path.
- [Low] The kernel-doc rewritten for get_phy_c45_ids()
  (phy_device.c:826-828) and phy_get_c45_ids() (around 1104-1110) says…
- [Low] get_phy_c45_devs_in_pkg() (phy_device.c:785-801) issues
  MDIO_DEVS2 and then MDIO_DEVS1 to the same MMD, and now returns the…

--

net: phy: Map C45 probe read errors to -ENODEV during bus scan

This patch makes get_phy_c45_devs_in_pkg() return the raw bus error. In
get_phy_c45_ids() it maps -EIO and -ENODEV to -ENODEV, both in the MMD loop
and in the MMD 0 fallback, so that mdiobus_scan_bus_c45() keeps scanning
past empty addresses. A failed devices-in-package read in the MMD loop now
skips the remaining MMDs and goes straight to the MMD 0 probe.

> net: phy: Map C45 probe read errors to -ENODEV during bus scan

[Severity: Low]
The subject and the body only describe the mdiobus_scan_bus_c45() and
__mdiobus_register() path. get_phy_c45_ids() is also reached outside the bus
scan.

fwnode_mdiobus_register_phy() calls get_phy_device(bus, addr, true) for
"ethernet-phy-ieee802.3-c45" nodes, and of_mdiobus_register_phy() goes
through it. Before this patch, an -EIO from a devices-in-package read made
__of_mdiobus_parse_phys() take the goto exit path, and the bus was
unregistered. Now it gets -ENODEV, which is only logged:

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

As a result the bus registers without the PHY. The exported
phy_get_c45_ids() changes too, so gpy_probe() now fails with -ENODEV
instead of -EIO.

The patch carries a Fixes: tag. Could the commit message mention these
non-scan behaviour changes?

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..79f3fa1e9a036 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -789,17 +789,30 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
>  
>  	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS2);
>  	if (phy_reg < 0)
> -		return -EIO;
> +		return phy_reg;
>  	*devices_in_package = phy_reg << 16;
>  
>  	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS1);
>  	if (phy_reg < 0)
> -		return -EIO;
> +		return phy_reg;

[Severity: Low]
Suppose the MDIO_DEVS2 read above succeeds and this MDIO_DEVS1 read then
fails with -EIO. get_phy_c45_ids() passes the error through
get_phy_c45_probe_err() in the same way as a failure on the first contact.
Should that count as "nothing answered at this address"?

The successful DEVS2 read already shows that a device at this port address
and MMD drove the bus. With the new code, the loop breaks with devs_in_pkg
forced to all Fs. The MMD 0 read will usually fail the turnaround as well,
and get_phy_c45_ids() returns -ENODEV. mdiobus_scan_bus_c45() then skips
the address without logging anything:

			phydev = mdiobus_scan_c45(bus, i);
			if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
				return PTR_ERR(phydev);

In gpy_probe(), the same path turns a real bus error into a rejected match.

Before this patch, the same case made the whole bus registration fail.
get_phy_c22_id() also handles a PHYSID2 failure after a successful PHYSID1
read this way. So the main cost here is lost diagnostics.

>  	*devices_in_package |= phy_reg;

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

[Severity: Low]
Is the "%-EIO on any other bus access error" part accurate? Further down in
get_phy_c45_ids(), the identifier loop still returns the raw error from
phy_c45_probe_present() for the vendor MMDs:

		if (i == MDIO_MMD_VEND1 || i == MDIO_MMD_VEND2) {
			...
			ret = phy_c45_probe_present(bus, addr, i);
			if (ret < 0)
				return ret;

phy_c45_probe_present() returns whatever mdiobus_c45_read() returned. That
means -ETIMEDOUT, -EBUSY or a raw -ENODEV can reach callers of
get_phy_device() and phy_get_c45_ids().

If a raw -ENODEV arrives here, a device has already answered, yet
mdiobus_scan_bus_c45() ignores it silently.

The commit message says something similar: errors from the per-MMD
identifier reads "are still reported as -EIO". The phy_get_c45_ids()
kernel-doc repeats the same wording.

>   */
>  static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  			   struct phy_c45_device_ids *c45_ids)
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
> +			/* The MMD did not answer: treat it like a read of all
> +			 * Fs, which is what controllers that do not check the
> +			 * turnaround return, and go straight to the MMD 0
> +			 * probe below. Do not probe the remaining MMDs, each
> +			 * one costs two bus reads on a slow bus.
> +			 */
> +			devs_in_pkg = 0xffffffff;
> +			break;

[Severity: Medium]
The comment says a failed read is treated "like a read of all Fs". Do the
two cases behave the same?

After an all-Fs read, the loop condition still holds, so the loop moves on
to MMD 2..29 and to the vendor MMDs after their presence check. This break
ends the search at the first MMD that fails. The only probe left is the
MMD 0 fallback, and most C45 PHYs do not implement MMD 0.

Take a controller whose read_c45 returns -EIO on a turnaround failure, such
as cavium_mdiobus_read_c45() today, or UniMAC once read_c45 is added later
in the series. Would these packages now come back as -ENODEV and be skipped
silently by mdiobus_scan_bus_c45()?

  - packages without MMD 1, whose lowest MMD is PCS, PHY XS, DTE XS, AN
    and so on

  - packages where MMD 1 answers with Devices-In-Package = 0 (the loop
    already allows for this with devs_in_pkg == 0) and the next MMD, for
    example WIS (MMD 2), is not implemented

In the second case, the device has already answered at this address.

A controller that does not check the turnaround would find both kinds of
package. So whether the PHY is found now depends on the controller.

Before this patch, these cases made the bus registration fail. This is a
gap in the fix, not a regression from the old behaviour.

> +		}
>  	}

[ ... ]

> @@ -1077,8 +1104,9 @@ EXPORT_SYMBOL(phy_device_remove);
>   * phy_get_c45_ids - Read 802.3-c45 IDs for phy device.
>   * @phydev: phy_device structure to read 802.3-c45 IDs
>   *
> - * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
> - * the "devices in package" is invalid.
> + * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
> + * no MMD responds (this includes a bus read failing with -EIO or -ENODEV while
> + * looking for a device), or %-EIO on any other bus access error.
>   */
>  int phy_get_c45_ids(struct phy_device *phydev)

[Severity: Medium]
phy_get_c45_ids() is exported and is used outside bus scanning. Is -ENODEV
the right result for a bus read error here?

Its only in-tree caller, gpy_probe() in drivers/net/phy/mxl-gpy.c, returns
the value directly from its probe callback:

	if (!phydev->is_c45) {
		ret = phy_get_c45_ids(phydev);
		if (ret < 0)
			return ret;
	}

This phydev was already found over C22, so a C45 read failure is a real
fault, not an empty address. Take a read_c45 that returns -EIO on a
turnaround failure. The MMD 1 read fails and the loop breaks. The MMD 0
read then fails too, and get_phy_c45_probe_err() returns -ENODEV.

call_driver_probe() in drivers/base/dd.c treats that as a rejected match
and logs it only at debug level:

	case -ENODEV:
	case -ENXIO:
		dev_dbg(dev, "probe with driver %s rejects match %d\n",
			drv->name, ret);
		break;
	default:
		/* driver matched but the probe failed */
		dev_err(dev, "probe with driver %s failed with error %d\n",
			drv->name, ret);

Before this patch, the -EIO produced the dev_err() line. The PHY still ends
up on genphy at attach time, but nothing visible says why.

Could the -ENODEV mapping be limited to the scan path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120051653.1433677-1-florian.fainelli%40broadcom.com

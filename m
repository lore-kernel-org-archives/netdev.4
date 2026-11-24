Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538967;
	b=B2+Aq2fpFft/9bcLyXWJnPbv1CosPOFYDHTmp1udKreA71cVOxthpFgux6BNVtAhjd0s
	 B3d9hRvyx/YEqthIi/N+CHtN/+7qqA+G93tXsY7oibFJSDGLJTgxc7PV4dZbu6UNvr/2u
	 +rY148354voaREh19u3Uj8LyMHTFW1baIgg/VLpph7sle0AlEBWIUm9yBnBst4xxRQvDS
	 BnAIbydFZ+kwZXMu1Vo6TqvBGBSYp9eMkq63lOrTzoD8dfDihX7hcgjyxeVAvlQx3M/+a
	 E0uj5Tw8xFh+QOZoVCRrpoZacVMQPdM1Z3OuKTvCWefUqqp2AApgPjqGgWoVEHHMnyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538967;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uTYBfpgEmNFEt26cRrwfLchBRDCus8OpqSq+AdE/ibE=;
	b=0soOv+rsv5FN69tqOtJabatrw8r2ASopjZAw//lDbLCmJ6rIgfIHRqhN9hleyTdw6jWM
	 a30so1fGs4/wmQ7ObWIitDvh0EffWykdeYGvkav0H/qXKp/nynTG4/Lpzoya1PFuHEr3X
	 mRDURRrt2LWk1RD6uqCSGloxBxwWXSxCOv1KIal9SaHHXb8RUsXGdIydvq2++O2AxRhy4
	 PFsRJZ5gWiGZp6r1tvQu7BBSaUPrIUMtQS+FkbI3fCJWeVUkumjQvjlooXVdSdDGe1swJ
	 srHBFGUHml1ZT9l7knPArIdHwPcj5rrD2ocaA0J8WhNF1vXcifzVkPZ+O/tLSM2vbYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrZk390s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87439606A33E;
	Tue, 24 Nov 2026 16:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrZk390s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620001F000CA;
	Tue, 24 Nov 2026 16:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538967;
	bh=uTYBfpgEmNFEt26cRrwfLchBRDCus8OpqSq+AdE/ibE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QrZk390sbgErIgN1mEeSQylLsXjdkG/49h0rsamx2y+4p4ftNrKePfnB4L4QEaQWf
	 cGQplUX53q+AayvD5v5merO1zsw1TIUGENnfijxrLZ51h6S/2+PUJg42hJkTPH5MVS
	 62eQE25B9E4m6VRxYMaa1ZvaijK8DX4alkSiitUNow1XULae6N8BvXbzmfJTYSZSH1
	 4LZuOeoOyBqlT3WCHh+yezQH4/UZ9E2FRkGr6tvhE6uR92XJawO/rRQ4V4JhF6Lk5i
	 YHRds4s7VhXecsvXEp/8Y4BR86vUi0V5ij6GTK9N7gC2FOY0jElY9ZsAxB9JSUrZZS
	 NyS5CKwl3FRpQ==
Subject: Re: [PATCH net-next v6 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, nb@tipi-net.de, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Tue, 24 Nov 2026 16:49:25 +0000
Message-ID: <179553896595.3135.12489762291979495707@kernel.org>
In-Reply-To: <20261123164835.1733304-2-florian.fainelli@broadcom.com>
References: <20261123164835.1733304-2-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message describes the SFP impact wrongly.
- [Medium] get_phy_c45_devs_in_pkg() reads MDIO_DEVS2 and then
  MDIO_DEVS1, and returns the raw bus error from whichever read fails.
- [Low] The commit message says errors from the vendor MMD presence check
  in the identifier loop "are not mapped, so a PHY that fails midway is…
- [Low] When a devices-in-package read in the MMD search loop of
  get_phy_c45_ids() fails with -EIO/-ENODEV, the new code breaks out of…

--

net: phy: Map C45 probe read errors to -ENODEV during bus scan

This commit makes get_phy_c45_devs_in_pkg() return the raw bus error. It
then maps -EIO and -ENODEV to -ENODEV in the MMD search loop and in the
MMD 0 fallback of get_phy_c45_ids(), so C45 bus scans carry on past empty
addresses. When such an error happens in the MMD loop, the remaining MMDs
are skipped and only MMD 0 is probed.

> - sfp_sm_probe_phy(): a module whose PHY does not answer ends up with "no
>   PHY detected" after the usual retries, instead of going to SFP_S_FAIL.

[Severity: Medium]

Is this description of the SFP change accurate? On the mdio-i2c buses that
SFP uses, a PHY that does not answer does not seem to show up as a bus error
at all:

drivers/net/mdio/mdio-i2c.c:i2c_mii_read_default_c45() {
    ...
	ret = i2c_transfer(i2c, msgs, ARRAY_SIZE(msgs));
	if (ret != ARRAY_SIZE(msgs))
		return 0xffff;
    ...
}

drivers/net/mdio/mdio-i2c.c:i2c_mii_read_rollball() {
    ...
	ret = i2c_rollball_mii_poll(bus, bus_addr, res, sizeof(res));
	if (ret == -ETIMEDOUT)
		return 0xffff;
	else if (ret < 0)
		return ret;
    ...
}

So a module with an absent PHY already ended up with "no PHY detected"
before this patch.

>From an SFP bus, the only -EIO that seems able to reach
get_phy_c45_devs_in_pkg() is an I2C transport error on a RollBall module.
That error comes from i2c_rollball_mii_cmd() or i2c_rollball_mii_poll(),
for example a short transfer that __i2c_transfer_err() turns into -EIO.

With this patch, that transport fault becomes -ENODEV, and
sfp_sm_probe_phy() returns it without logging anything:

drivers/net/phy/sfp.c:sfp_sm_probe_phy() {
    ...
	phy = get_phy_device(sfp->i2c_mii, addr, is_c45);
	if (phy == ERR_PTR(-ENODEV))
		return PTR_ERR(phy);
	if (IS_ERR(phy)) {
		dev_err(sfp->dev, "mdiobus scan returned %pe\n", phy);
		return PTR_ERR(phy);
	}
    ...
}

The state machine then retries R_PHY_RETRY times and starts the module
without a PHY through sfp_module_start(). Before the patch it logged
"mdiobus scan returned -EIO" and went to SFP_S_FAIL.

This patch has a Fixes: tag and will likely be backported. Could the
sfp_sm_probe_phy() bullet describe this change instead?

> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index b39e945cebd73..2f17c9d4a2b9f 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c

[ ... ]

> @@ -810,8 +823,10 @@ static int get_phy_c45_devs_in_pkg(struct mii_bus *bus, int addr, int dev_addr,
>   * the PHY identifiers for each device. Return the "devices in package"
>   * and identifiers in @c45_ids.
>   *
> - * Returns zero on success, %-EIO on bus access error, or %-ENODEV if
> - * the "devices in package" is invalid or no device responds.
> + * Returns zero on success, %-ENODEV if the "devices in package" is invalid or
> + * if no MMD responds (including when the bus reports -EIO or -ENODEV for the
> + * reads that look for a device), or a negative error code from a failed bus
> + * access otherwise (usually %-EIO).
>   */
>  static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  			   struct phy_c45_device_ids *c45_ids)

[Severity: Low]

The commit message says:

    Errors from the vendor MMD presence check done while reading the
    identifiers and from the reads of the per-MMD identifiers themselves,
    which only happen once a device has answered, are not mapped, so a PHY
    that fails midway is not silently skipped.

Does the identifier loop in get_phy_c45_ids() keep that guarantee? The
VEND1/VEND2 branch returns the raw bus error from phy_c45_probe_present():

	/* Now probe Device Identifiers for each device present. */
	for (i = 1; i < num_ids; i++) {
		...
		if (i == MDIO_MMD_VEND1 || i == MDIO_MMD_VEND2) {
			...
			ret = phy_c45_probe_present(bus, addr, i);
			if (ret < 0)
				return ret;

Some read_c45 implementations return -ENODEV. One example is
orion_mdio_xsmi_read_c45() in drivers/net/ethernet/marvell/mvmdio.c:

	if (!(readl(dev->regs + MVMDIO_XSMI_MGNT_REG) &
	      MVMDIO_XSMI_READ_VALID)) {
		dev_err(bus->parent, "XSMI bus read not valid\n");
		return -ENODEV;
	}

Suppose a PHY has already answered the devices in package reads, and then
its STAT2 read on a vendor MMD fails this way. get_phy_c45_ids() returns
-ENODEV. mdiobus_scan_bus_c45(), __of_mdiobus_parse_phys() and
sfp_sm_probe_phy() all treat that as an empty address, so the PHY is
skipped without a message.

This code path is older than the patch. However, the new kernel-doc here
and for phy_get_c45_ids() links -ENODEV only to "no MMD responds". Should
this error be mapped to -EIO? Otherwise, should the commit message and
kernel-doc make a weaker claim?

> @@ -844,8 +859,20 @@ static int get_phy_c45_ids(struct mii_bus *bus, int addr,
>  				continue;
>  		}
>  		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
> -		if (phy_reg < 0)
> -			return -EIO;
> +		if (phy_reg < 0) {
> +			ret = get_phy_c45_probe_err(phy_reg);
> +			if (ret != -ENODEV)
> +				return ret;

[Severity: Medium]

Can this treat a PHY that has already answered as absent?
get_phy_c45_devs_in_pkg() reads MDIO_DEVS2 and then MDIO_DEVS1. It returns
the raw error from whichever read fails, so the caller cannot tell the two
cases apart:

	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS2);
	if (phy_reg < 0)
		return phy_reg;
	...
	phy_reg = mdiobus_c45_read(bus, addr, dev_addr, MDIO_DEVS1);
	if (phy_reg < 0)
		return phy_reg;

Suppose DEVS2 succeeds at MMD i, which on a controller that checks
turnaround means the device drove the bus. If only DEVS1 then fails with
-EIO or -ENODEV, this path sets devs_in_pkg to all Fs, breaks out of the
loop and leaves the decision to MMD 0 alone:

		phy_reg = get_phy_c45_devs_in_pkg(bus, addr, 0, &devs_in_pkg);
		if (phy_reg < 0)
			/* returning -ENODEV doesn't stop bus scanning */
			return get_phy_c45_probe_err(phy_reg);

Two outcomes seem possible:

- MMD 0 also fails with -EIO or -ENODEV. get_phy_c45_ids() returns -ENODEV,
  and mdiobus_scan_bus_c45(), __of_mdiobus_parse_phys() and
  sfp_sm_probe_phy() skip the PHY without a message.

- MMD 0 answers with a value that is not mostly Fs (some PHYs return 0
  there). The identifier loop finds no set bits, and the function returns 0
  with devices_in_package and mmds_present both 0. get_phy_device() would
  then create a phy_device with no MMDs. gpy_probe() would overwrite the
  live phydev->c45_ids with empty ids through phy_get_c45_ids() and keep
  probing.

Before this patch, the same condition returned -EIO and the failure was
visible.

Would it be better to map only a failure of the first (DEVS2) read, and to
return the error when DEVS1 fails after DEVS2 succeeded?

> +
> +			/* The MMD did not answer: treat it like a read of all
> +			 * Fs, which is what controllers that do not check the
> +			 * turnaround return, and go straight to the MMD 0
> +			 * probe below. Do not probe the remaining MMDs, each
> +			 * one costs two bus reads on a slow bus.
> +			 */
> +			devs_in_pkg = 0xffffffff;
> +			break;
> +		}
>  	}

[Severity: Low]

The comment says a failed MMD is treated like a read of all Fs. With the
break, can discovery give different results on the two kinds of
controller?

When the read returns all Fs, the loop condition moves on to the next MMD,
including the VEND1/VEND2 presence checks:

	for (i = 1; i < MDIO_MMD_NUM && (devs_in_pkg == 0 ||
	     (devs_in_pkg & 0x1fffffff) == 0x1fffffff); i++) {

After a mapped error, only MMD 0 is probed.

Take a package that does not implement MMD 1 but does implement later
MMDs, and that does not drive turnaround for an unimplemented DEVAD.

On a controller that does not check turnaround, it is found.

On a controller that does check turnaround, it gets -ENODEV unless it
answers on MMD 0, and it is skipped without a message. Examples are UniMAC
with the read_c45 from "net: mdio: mdio-bcm-unimac: Add Clause 45 support"
later in this series, or mvmdio XSMI. For an "ethernet-phy-ieee802.3-c45"
DT node it would be logged as missing, and the bus would register without
it.

The same applies when an earlier MMD already answered with devs_in_pkg ==
0 and a later MMD then fails turnaround.

These PHYs were not found on such controllers before the patch either,
because the scan failed with -EIO. The difference is that a visible failure
becomes a silent skip.

Would continuing the loop after a mapped error, as for 0xffff, give the
same results on both kinds of controller? The cost would be a bounded
number of extra reads.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123164835.1733304-1-florian.fainelli%40broadcom.com

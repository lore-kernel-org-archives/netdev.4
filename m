Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153113;
	b=iy7SnhfCdEJbE+Fcvm5z+kZWkbjGzZklOeR0EUhwTrvuaaEtO6rU/FGqeH641hSiW9Px
	 9yot5R9h6OuOjYNYSVb/1oVOKsmzV1E5aJNVW+z0z/Vnoc/ZbKake+8/NyBuu3APVC8Lw
	 RUXjjSatRy1AsNTYV1v6IdtVrc/6stnPJ16vSdaSZILcioBozaY8ZsW+/rvXMG21NFX0s
	 QX360V1d6lDsT8QCd+2vCOMUEpML+/mI4YVLKU8p86UftkN2plCWCyfkNwWJGXr31lwOE
	 JN0uvAow3j98YP1fzVQY4b8uWVj4Eyq1PDVqYmdYhXzLYq9E1yQkIjm18mpem0q1hSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153113;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=z9MsZ5nDP02yY+mmqpSAWXCIWO2n34RgSYNzEUczHcs=;
	b=UEKh58hxgsI5InsS/WpnYgAfPr4lhGmkq+P8XT0GJ/D+JzgddGrRd7IMYerP8tUye5Of
	 Ox8S/znc3OFaqjTXOqAsVNe15VT+LJmq+sZo11CWJteZKnIMKKCAKyCr+nsvh9T4Gfi8s
	 0CcN9DNLWRSiz7Xajxa16a2o0EbZI56BlUIVLbn2rGA+hxVBmVexDmTssTHI3OoBb6N2f
	 ToY/91Oo4zDMjzjo5JAliSvDlRof5ie0G/dEohvh+CNHcWzvdGnT4L8ZGlQVaz7x+RoRH
	 UCG3jrbAQfSe05J+J6EQfLdcrOrOEkJtD5q9NAUWvwDhwfn3SpEzQ5cM9oYc95gJaxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCFudF5M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7473606A339;
	Fri, 20 Nov 2026 05:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hCFudF5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B8B1F000C6;
	Fri, 20 Nov 2026 05:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795153112;
	bh=z9MsZ5nDP02yY+mmqpSAWXCIWO2n34RgSYNzEUczHcs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hCFudF5MdI8naOC9gQNYl/HfcgR/WNHxlFAM4dZ/SyAOmPwS3w4hnaN3ex+hC4ad/
	 okIRstQpMW7MrA2I/OKCTQKpvsv5G4BAznTBKPxlA+mxMYvyUcMltsQpiIkaEhx8IQ
	 za0JF/MS0yD7yXcBLTitkQfHRenzSei2TqzKD1/Ek+3NOutT7tExsRpPrXNY9i7LQ9
	 uuXtgzuMWX8ds0Qu3bAxECpq6KfSyhR4zwKKzerA3Na6pPfGf2fQcDHOCoJLBZN20A
	 V1X6eiPxazKiyFO1FQxmmFEcRUtYWp45LDDOQMcR9AWGr9HjjzRdBjc9baOcnmWpJU
	 XWhoQDOnpqUOg==
Subject:
 Re: [PATCH net-next v4 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Fri, 20 Nov 2026 05:38:31 +0000
Message-ID: <179515311151.3136.11984816802162340674@kernel.org>
In-Reply-To: <20261119005943.999981-5-florian.fainelli@broadcom.com>
References: <20261119005943.999981-5-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] unimac_mdio_probe() now sets bus->read_c45/bus->write_c45 for
  every instance, including the one GENET creates from platform data.
- [Medium] The patch's own comment in unimac_mdio_addr_c45() says
  bcmgenet_mii_wait() can return 0 after timing out with MDIO_START_BUSY…
- [Low] unimac_mdio_resume() now takes priv->mii_bus->mdio_lock around
  unimac_mdio_clk_set(), so system resume now serializes against, and…

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This commit adds Clause 45 read/write callbacks to the UniMAC MDIO
driver. Each access does an ADDR cycle followed by a data cycle, and
MDIO_CFG is switched between C22 and C45 mode when needed. It also skips
the BMSR workaround for "ethernet-phy-ieee802.3-c45" children and takes
mdio_lock around unimac_mdio_clk_set() in resume.

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index f8e5c1811d96b..a79830566abb0 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -108,8 +160,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
>  		return ret;
>  
>  	/* Prepare the read operation */
> -	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
> -		(reg << MDIO_REG_SHIFT);
> +	unimac_mdio_set_clause(priv, is_c45);
> +	if (is_c45) {
> +		ret = unimac_mdio_addr_c45(priv, phy_id, devad, reg);
> +		if (ret)
> +			goto out;
> +
> +		cmd = MDIO_RD_C45 | (phy_id << MDIO_PMD_SHIFT) |
> +			unimac_mdio_c45_devad(devad) |
> +			(reg & MDIO_C45_REG_MASK);
> +	} else {
> +		cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
> +			(reg << MDIO_REG_SHIFT);
> +	}
>  	unimac_mdio_writel(priv, cmd, MDIO_CMD);
>  
>  	/* Start MDIO transaction */

[Severity: Medium]

The comment in unimac_mdio_addr_c45() says bcmgenet_mii_wait() can
return 0 after timing out with MDIO_START_BUSY still set. To handle that,
an unimac_mdio_poll() is added after the ADDR frame. Does the RD_C45 data
frame need the same check?

After the data cycle, unimac_mdio_do_read() does:

	ret = priv->wait_func(priv->wait_func_data);
	if (ret)
		goto out;

	cmd = unimac_mdio_readl(priv, MDIO_CMD);
	...
	ret = cmd & 0xffff;

If wait_func returned early, MDIO_READ_FAIL is not latched yet. Bits 15:0
of MDIO_CMD still hold the reg & MDIO_C45_REG_MASK value written for the
command. Could the caller then get the MMD register number back instead
of the PHY's data?

bcmgenet_mii_wait() always returns 0:

	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);
	return 0;

With HZ=100 this is a one jiffy timeout, which can expire well before a
25-33us frame completes. On GENET v1/v2, and during probe before any ISR
is registered, the timer decides every wait.

unimac_mdio_do_write() has the same gap. The WR_C45 frame is reported as
complete and the bus lock is dropped while the frame may still be on the
wire.

The next access then calls unimac_mdio_set_clause(), which can rewrite
MDIO_C22 in MDIO_CFG without checking MDIO_START_BUSY:

	if (new_cfg != cfg)
		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);

Can this change the frame format in the middle of a frame when C22 and
C45 accesses are interleaved? That happens with the C22 scan followed by
the C45 scan, or on a bus with mixed PHYs.

The C22 path already has the same early-read weakness. The C45 data cycle
and the MDIO_CFG switching are new code, though. Would calling
unimac_mdio_poll() after the data cycle wait_func(), or at least before
touching MDIO_CFG, close the gap?

[ ... ]

> @@ -302,6 +401,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

[Severity: Medium]

These callbacks are set for every instance, including the one GENET
creates from platform data. How long does the new C45 scan take on the
GENET non-DT (ACPI) path?

In the non-DT case, bcmgenet_mii_register() does:

	else
		ppd.phy_mask = ~0;

so bus->phy_mask ends up as 0 and no address is masked. With np == NULL,
of_mdiobus_register() goes straight to __mdiobus_register(). That runs the
C22 scan and then mdiobus_scan_bus_c45().

For each empty address, get_phy_c45_ids() does two C45 reads (MMD1 DEVS2,
then MMD0 DEVS2), and both fail. Each C45 read calls wait_func twice:
once for the ADDR frame in unimac_mdio_addr_c45() and once for the data
frame.

bcmgenet_mii_wait() is a wait_event_timeout(..., HZ / 100). Its only
waker is bcmgenet_isr0(), and irq0 is only requested in bcmgenet_open().
The bus is registered earlier, in
bcmgenet_probe()->bcmgenet_mii_init(), so each wait sleeps for the full
timeout.

That comes to about 31 x 2 x 2 = 124 extra sleeps of 4-10ms each, or
roughly 1s of extra probe time on systems like a Raspberry Pi 4 booting
with UEFI/ACPI. This is on top of the ~64 sleeps the BMSR workaround and
C22 scan already cost, and nothing is gained when there is no C45 PHY.

The commit message notes that the scan now runs on this device:

  This includes the platform device that GENET instantiates when it is probed
  without a Device Tree node (e.g.: ACPI), which does not mask any address.

It doesn't mention the cost, though. Could the scan be masked, the C45
callbacks be left unset for pdata users with an IRQ-driven wait_func, or
the driver poll during probe?

[ ... ]

> @@ -337,8 +438,16 @@ static void unimac_mdio_remove(struct platform_device *pdev)
>  static int __maybe_unused unimac_mdio_resume(struct device *d)
>  {
>  	struct unimac_mdio_priv *priv = dev_get_drvdata(d);
> +	int ret;
> +
> +	/* MDIO_CFG is also modified by the MDIO accessors to switch between
> +	 * Clause 22 and Clause 45, which run under the bus lock.
> +	 */
> +	mutex_lock(&priv->mii_bus->mdio_lock);
> +	ret = unimac_mdio_clk_set(priv);
> +	mutex_unlock(&priv->mii_bus->mdio_lock);

[Severity: Low]

This isn't a bug, but the commit message doesn't mention that
unimac_mdio_resume() now takes mdio_lock. As a result, system resume now
serializes against, and can block on, any in-flight MDIO access. The
locking itself looks fine. Could the commit message mention this change
to the resume path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119005943.999981-1-florian.fainelli%40broadcom.com

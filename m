Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498740;
	b=y76TCis40DXfaRO9Y94jjPNSLfq1/4YMTvUVG5bgdRxp1z/bKksknSy6Ao8PBaekuTcd
	 aYf0m6OylXKTb+MFRvYHavCqyuEq8+ar+YRBUg55VuexLfywX57lML5zquwVOsCw0QdhL
	 AoBfNd8Vmeo2pDeTsHMtJW88qPmt0+dKQO2T+riKdNYzkSvYsJHs8ytVh8JMldvaBiYwi
	 JAIlmmU1UzBM5B2RoOUE1itYwTiIGPIDn/Wnd0FQd30gBsiIkux10GtlZ58PQq3XKic9V
	 8JIa8blg7v1bvN/a6oL/Y9SxqDOq4Su7ua+eCdurd5ZoCduIrvU0Ane8GxLKQuXJj0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498740;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sPjdcsWRMWGm7Iu02ZOoApvGOq1Znmpsgsg1uc8FTOo=;
	b=mlrMG70aKPYPJAoEo8Iv2zEULPRwRor9AOrqNKYJ5LXldwkuQkq+/wmFOjFlTN5J6HhT
	 feR90QVH2k4KbyDaOHTWo0GJV8FpaEaI8Oes+nPLIhtOHOyd5k/VY4GLHRKa192j67ccQ
	 y+18D9GQCinNbbsu/Wr2XGMXhTDttsqTiQpgyCH8pPl9LR6uxaYCl0/E8Gc6giED2LJXV
	 6iHDLaw2/9x0fE0vfs0PpoWdHx0KPsrBDlYcuL4QHMEoI9VcjCbK6Id12PFlvXaa+XSFB
	 6KHJW5SRgSyAvCy89rVwfaGUIt6oYrWegRI+imtB/aL15hYlLPPfNyKFuWKaXwPjt5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWuzF0au;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3F9606A33C;
	Tue, 24 Nov 2026 05:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RWuzF0au
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D1E1F000CA;
	Tue, 24 Nov 2026 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795498740;
	bh=sPjdcsWRMWGm7Iu02ZOoApvGOq1Znmpsgsg1uc8FTOo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RWuzF0auVxnG2ILJ4zLWZx14JF7ApAogZbq/4cJv/oi2K8nGBGOBNUR9cEjhJIKMF
	 Q+zWyL+GoHbgj2LufnrU2iR/KaboPYqeaENyENsgV5hlteSi1lcAjDCsdYWoT+mU9p
	 9a4s3Cr7hQQMwGZSaCLWmlXZ6OHpwRy/jT4ZO4z21NKaPTTR8LcGHFM7X8QBd8FwUh
	 YEB5YEu2LY+Mgk9FhvtTWPLTlG5hw3vGi/vxJLucfcdcvjMk2hJBoyRYJRUW7wBGyr
	 O8udgI6BBc22Xh1TdJfyXS0r2DWJaRhqCbaj2pFotNRDWfq7fD+kjDiN8ITzas0sn2
	 S+8oJtHgDgstA==
Subject:
 Re: [PATCH net-next v4 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com, justin.chen@broadcom.com,
 opendmb@gmail.com, nb@tipi-net.de, bcm-kernel-feedback-list@broadcom.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kudzo51@gmail.com
Date: Tue, 24 Nov 2026 05:38:58 +0000
Message-ID: <179549873890.3135.336400569504120899@kernel.org>
In-Reply-To: <20261120051653.1433677-5-florian.fainelli@broadcom.com>
References: <20261120051653.1433677-5-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch sets bus->read_c45/bus->write_c45 unconditionally
  in unimac_mdio_probe() (drivers/net/mdio/mdio-bcm-unimac.c:404-405).
- [Medium] The patch itself says (comment in unimac_mdio_addr_c45(),
  lines 129-133) that bcmgenet_mii_wait() returns 0 even when it times…

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This adds read_c45/write_c45 callbacks to the UniMAC MDIO driver. Each
access does an ADDR cycle followed by a READ/WRITE cycle and switches
MDIO_CFG between C22 and C45 mode as needed. It also skips the BMSR
workaround for "ethernet-phy-ieee802.3-c45" children and takes the bus
lock around unimac_mdio_clk_set() in resume.

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index f8e5c1811d96b..a79830566abb0 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -97,7 +103,53 @@ static int unimac_mdio_poll(void *wait_func_data)

[ ... ]

> +static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
> +				int phy_id, int devad, int reg)
> +{
> +	u32 cmd;
> +	int ret;
> +
> +	/* Prepare the addr c45 operation */
> +	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
> +	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
> +	unimac_mdio_writel(priv, cmd, MDIO_CMD);
> +
> +	/* Start MDIO transaction */
> +	unimac_mdio_start(priv);
> +
> +	ret = priv->wait_func(priv->wait_func_data);
> +	if (ret)
> +		return ret;
> +
> +	/* Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0
> +	 * even when they timed out with the controller still busy. The data
> +	 * cycle must not be started before the ADDR cycle has completed, so
> +	 * make sure the controller is idle.
> +	 */
> +	return unimac_mdio_poll(priv);
> +}

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
return 0 while START_BUSY is still set, so the ADDR cycle is followed by
unimac_mdio_poll(). Should the C45 data cycle get the same check?

bcmgenet_mii_wait() always returns 0:

drivers/net/ethernet/broadcom/genet/bcmmii.c:bcmgenet_mii_wait() {
	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);
	return 0;
}

With HZ=100 that timeout is a single jiffy, so it can expire before the
frame completes. At probe time there is also no MDIO IRQ to wake it.

After the data cycle, unimac_mdio_do_read() reads the result right away:

	ret = priv->wait_func(priv->wait_func_data);
	if (ret)
		goto out;

	cmd = unimac_mdio_readl(priv, MDIO_CMD);
	...
	ret = cmd & 0xffff;

For a C45 read, bits 15:0 of MDIO_CMD were just set to
(reg & MDIO_C45_REG_MASK). If the frame is still in flight, MDIO_READ_FAIL
is not valid yet.

Could the caller then get the MMD register number back as PHY data?

The C45 write path in unimac_mdio_do_write() has the same gap, because it
returns the wait_func() result directly. Could the next access then call
unimac_mdio_set_clause(), flip MDIO_CFG and write a new MDIO_CMD while the
previous C45 frame is still on the wire?

[ ... ]

> @@ -302,6 +401,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

[Severity: Medium]
Can this add more than a second of probe delay for GENET when it has no
DT node, for example on ACPI?

Now that read_c45 is always set, __mdiobus_register() runs
mdiobus_scan_bus_c45() on every unmasked address that has no C22 device.
Without DT, bcmgenet_mii_register() sets ppd.phy_mask = ~0. The unimac
bus then gets bus->phy_mask = 0, so every address is scanned.

In that case wait_func is bcmgenet_mii_wait(). Its only waker is
bcmgenet_isr0() handling UMAC_IRQ_MDIO_EVENT, and that IRQ is not
requested until bcmgenet_open(). The bus is registered and scanned
earlier:

bcmgenet_probe()
  bcmgenet_mii_init()
    bcmgenet_mii_register()
      platform_device_add()
        unimac_mdio_probe()
          of_mdiobus_register(bus, NULL)
            __mdiobus_register()
              mdiobus_scan_bus_c45()
                get_phy_c45_ids()
                  unimac_mdio_read_c45()

So each MDIO frame sleeps for the full HZ/100. A C45 access is two frames
(ADDR plus data), and get_phy_c45_ids() does at least two C45 reads at an
empty address (MDIO_DEVS2 on MMD1, then on MMD0). That works out to about
31 x 4 x 10ms, roughly 1.2s per GENET instance. This comes on top of the
existing BMSR workaround and C22 scan.

If the controller does not flag READ_FAIL for C45 reads at empty
addresses, the devices-in-package loop walks MMDs 1..29 and the delay
grows a lot more.

The commit message only says:

    This includes the platform device that GENET instantiates when it is
    probed without a Device Tree node (e.g.: ACPI), which does not mask
    any address.

Would it make sense to skip C45, or mask addresses, in the pdata/no-DT
case? If not, could the commit message at least mention the probe time
cost?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120051653.1433677-1-florian.fainelli%40broadcom.com

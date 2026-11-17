Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951587;
	b=49JKZtlESIvF6EM7tI4vZ1zFldDAxo8dLDLMTVkhtZoPtZi1zr7ye/sNkai2399EUOrG
	 p5uehfkeRQjM/Y6aIjZKAToQY3WbQK9i4X324CAm7N3hoHQfNJ4Ef/tO3SvnaNkRkequQ
	 9xejwCwa8NdkIP0lO9IB1wFRyxub5bE0S6bZ3wePVnCLjVEFq0I5tt+49VJiL/03voKMl
	 ReYaCQoVujEL/Hj1LWv3ian5hgyLBYsBpPO5TRvSXa8gUiY6r9KTyq8VlKw+TSjLNF4Qt
	 XcE/iVPZAF+MgsgbHXIKbg0HiwP2p5IqnFYA/vrusAf8CYReOE3QnpbvBOTXbQQaRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951587;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nYYC2xC8vF6voVEKyIhR0QplX4ecu6RMdRgEFOEfxB8=;
	b=h1DJ7mEFLFsiqvoArGgjKmsxS7VVhGsrGLkWXQGO0lp17EmXw+HNPkUXp3KeMALLOc8B
	 acrXqvYiNH01PzmDMR0yGd3HbcmbfvHAdeRzKcCApJQ9UNUQWmESaexqg9Cornfr3CQEK
	 0TVf8F/pqdSWO0ZwB4xHlDu8bmWNp+M/oF8FagLDRgV3pkZwzss1ghCEqIFkWvCoaQH7t
	 FktpYbaX+isAC1FbJqyg4AwftCEBH8vWhGfpMEM4NlfxgWH1Na6FrCsM26gcyS6FC4+zn
	 GUCEC35Nn/A6Ml8EU0+ezfewUaYK3v+sH/zaIFCp7TsTSBByW0JacpYSA/SnCHr4SsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNfibGzj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC6606A31C;
	Tue, 17 Nov 2026 21:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eNfibGzj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF0E1F000C4;
	Tue, 17 Nov 2026 21:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794951587;
	bh=nYYC2xC8vF6voVEKyIhR0QplX4ecu6RMdRgEFOEfxB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eNfibGzjDdrNQm474gUXgsB/rV1VrvwV805LTYqiMBbBcMO23M9bdn608QvWBUNxo
	 KPSc3xqtQ1oJhw0cSHFAwACLi2QAtFdDB5PDGt9isWeHncIi3U+H5vIQ6TnmUpFNaO
	 9t+YyUYqra/h65BafwYt8Dr4x+ZRQPI+H6Q+9AxdSKRjlAu+PrRw8476kFtowltKfO
	 L3wtNR60pkvPtDnS8l/P6+EyjakotcTPdRnoDoTtnwka1jcJozduHb889nsYQfzyRX
	 8hZfK5XySnV3WRDYn+oBRILZSoZmlDn7w8qQxYbTivrYwW8DRDecj8TRLlbO2dyuP9
	 KE76K+vg1qj9Q==
Subject:
 Re: [PATCH net-next 3/3] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com, justin.chen@broadcom.com,
 opendmb@gmail.com, nb@tipi-net.de, bcm-kernel-feedback-list@broadcom.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kudzo51@gmail.com
Date: Tue, 17 Nov 2026 21:39:45 +0000
Message-ID: <179495158559.3136.13854046342906426133@kernel.org>
In-Reply-To: <20261113211554.2058181-4-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-4-florian.fainelli@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch sets bus->read_c45 unconditionally.
- [Medium] In the new two-cycle C45 sequence, the only completion check
  for the ADDR cycle is the return value of priv->wait_func().
- [Medium] MDIO_CFG now has two read-modify-write paths that share no
  lock.
- [Low] C45 callbacks and the MDIO_CFG clause switch are turned on for
  every compatible in unimac_mdio_ids: brcm,asp-v3.0/v2.2/v2.1-mdio,…

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This commit adds Clause 45 read/write callbacks to the UniMAC MDIO driver.
Each C45 access issues an ADDR cycle followed by a READ/WRITE cycle, and
MDIO_CFG is switched between C22 and C45 mode as needed. The BMSR
workaround read in unimac_mdio_reset() is also skipped for children
compatible with "ethernet-phy-ieee802.3-c45".

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index df267bb826966..6059b32580c54 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -96,7 +102,43 @@ static int unimac_mdio_poll(void *wait_func_data)

[ ... ]

> +static void unimac_mdio_set_clause(struct unimac_mdio_priv *priv, bool is_c45)
> +{
> +	u32 cfg = unimac_mdio_readl(priv, MDIO_CFG);
> +	u32 new_cfg = cfg;
> +
> +	if (is_c45)
> +		new_cfg &= ~MDIO_C22;
> +	else
> +		new_cfg |= MDIO_C22;
> +

[Severity: Low]
Do all of the IP revisions in unimac_mdio_ids support the MDIO_CFG clause
bit and the C45 opcodes (ADDR=0b00, READ=0b11)?

The C45 callbacks and this MDIO_CFG read-modify-write are now enabled for
every compatible: brcm,asp-v3.0/v2.2/v2.1-mdio, brcm,bcm6846-mdio,
brcm,genet-mdio-v1..v5 and brcm,unimac-mdio. They are also enabled for the
non-DT GENET pdata instantiation. Nothing gates this per compatible through
match data, and unimac_mdio_set_clause() also runs on every C22 access.

If a revision lacks C45 support, C45 accesses would put undefined frames
on the bus. Those accesses can come from the core C45 scan on an unmasked
bus or from SIOCGMIIREG with a C45 phy_id.

Could the commit message say whether all of these revisions implement C45?

> +	if (new_cfg != cfg)
> +		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);
> +}

[Severity: Medium]
Can this read-modify-write of MDIO_CFG race with unimac_mdio_clk_set()?

unimac_mdio_set_clause() runs under bus->mdio_lock. unimac_mdio_clk_set()
writes the same register with no lock held:

unimac_mdio_clk_set() {
    ...
	reg = unimac_mdio_readl(priv, MDIO_CFG);
	reg &= ~(MDIO_CLK_DIV_MASK << MDIO_CLK_DIV_SHIFT);
	reg |= div << MDIO_CLK_DIV_SHIFT;
	unimac_mdio_writel(priv, reg, MDIO_CFG);
    ...
}

It is reached from unimac_mdio_resume() after the bus is registered.
Before this patch, bus accesses never wrote MDIO_CFG.

The GENET parent resumes first. bcmgenet_resume() calls
phy_start_machine() (or phy_start() through bcmgenet_netif_start()). With
mac_managed_pm set, the PHY state machine work can then issue MDIO
accesses while the child unimac resume is running clk_set.

Two interleavings look possible:

(a) clk_set reads cfg, set_clause flips MDIO_C22, then clk_set writes
back the stale clause bit. The next ADDR and data cycles go out in the
wrong framing. For example, a WR_C45 becomes a C22 write of val to
register devad.

(b) set_clause reads cfg, clk_set writes the new MDC divider, then
set_clause writes back the old divider. The restored MDIO clock frequency
is lost until the next resume.

This needs a "clock-frequency" property, otherwise clk_set returns early,
plus mixed C22/C45 traffic so that the clause bit actually changes.

[ ... ]

> @@ -107,8 +149,19 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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

[Severity: Medium]
Is the ADDR cycle guaranteed to have finished before MDIO_CMD is
overwritten here?

The only completion check is the return value of priv->wait_func() in
unimac_mdio_addr_c45(). For GENET-instantiated buses, that is
bcmgenet_mii_wait():

bcmgenet_mii_wait() {
    ...
	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);
	return 0;
}

It returns 0 even when the wait timed out with START_BUSY still set. With
HZ=100, HZ / 100 is a single jiffy. That can expire well before a ~25 us
MDIO frame completes, and the same happens if the MDIO_DONE interrupt is
delayed.

In that case unimac_mdio_addr_c45() reports success while the ADDR frame
is still in flight. unimac_mdio_do_read() and unimac_mdio_do_write() then
write the RD_C45/WR_C45 command and set START_BUSY again without checking
that the controller is idle. Could this corrupt the frame, return data
from an incomplete read, or send a C45 write to the wrong register?

bcmgenet_mii_wait() behaves this way independently of this patch. What
this patch adds is the dependency of the data cycle on the ADDR cycle.
The "if (ret) goto out" after the ADDR cycle can never trigger on GENET
buses.

[ ... ]

> @@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

[Severity: High]
Can setting read_c45 unconditionally make bus registration fail on the
non-DT GENET path?

With read_c45 set, __mdiobus_register() runs mdiobus_scan_bus_c45() on
every address that is not masked and has no C22 device. On an empty
address, a C45 read sets MDIO_READ_FAIL, and unimac_mdio_do_read()
returns -EIO:

	if (!(bus->phy_ignore_ta_mask & 1 << phy_id) && (cmd & MDIO_READ_FAIL)) {
		ret = -EIO;
		goto out;
	}

get_phy_c22_id() converts -EIO to -ENODEV. get_phy_c45_ids() does not:

	phy_reg = get_phy_c45_devs_in_pkg(bus, addr, i, &devs_in_pkg);
	if (phy_reg < 0)
		return -EIO;

mdiobus_scan_bus_c45() then aborts on any error other than -ENODEV:

	if (IS_ERR(phydev) && (PTR_ERR(phydev) != -ENODEV))
		return PTR_ERR(phydev);

On the non-DT GENET path, bcmgenet_mii_register() does:

	if (dn)
		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
	else
		ppd.phy_mask = ~0;

That leaves bus->phy_mask = ~pdata->phy_mask = 0. With np == NULL,
of_mdiobus_register() calls __mdiobus_register() directly, so all 32
addresses are scanned.

The C45 scan starts at address 0. With a PHY at address 1, as on ACPI
systems such as RPi4 BCM6E4E, the first empty address returns -EIO.
__mdiobus_register() then removes the C22 PHYs it already found, and
unimac_mdio_probe() fails with "MDIO bus registration failed". The MAC
is left without a PHY.

DT-described buses are not affected, because __of_mdiobus_register()
forces phy_mask = ~0.

Should C45 read failures on empty addresses be reported as -ENODEV (or
0xffff) instead of -EIO, or should the C45 callbacks be limited to buses
where the scan is masked?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113211554.2058181-1-florian.fainelli%40broadcom.com

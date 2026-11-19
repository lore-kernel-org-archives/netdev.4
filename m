Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048649;
	b=DcVyxoRz7szTDRYMmRjc74RVJAkr1Hcta6akmY/+vjObr5MlKJFdRSyFJZGzY+7tesKv
	 aOLpjzgHPd4ifRkLuTg7aecackGkpRBpdI8HkB4WEwLcr0FKtvrg5ajmiEtPJyFZdHmTJ
	 zqaClPlyC/ivL4iUtt4649HSIHHTredoR5JJvhIb2s9uBle5ROzIOgK+MT7wewfOSN9Pq
	 UinJnMHX+ZmWedTzy/OdGSoPtM+/v7grxMefPSZ+barBpT0sFDzE8JXftfN7cEa85Poi4
	 Rpvvs+QPCsr97kKiKnmkF7SKbj6kX1Q0lgAW3IsbrWz+gT6SMw3372nvxnW+LvqBcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048649;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=20gr1dyr9xoebQxfxyWXPnDdRZvlLYRq3reOFPfDJcc=;
	b=pS0pW2ZzFq3H//CAg/mpALxULjHYI21+NfIHHRIQVgyLWELdutg2qQ+MWgCV7cwW4vCO
	 xxwYG/5yqEMJJ602LcHYU42DhmSZG5etn/n5+8sHlMw5qlzjhulsBtCA9VCIgAFPi87IM
	 iPo0d/zDZF/PTm6DFYrqzEmCOliIMovMKsdU2fzvSrKeDo5fYNh4pNr7OOFaC5jokALI9
	 ddw4wOMAVW/YXG23ZoxEIhEPHpqv81fi6dToBs7iXBcfdIbqI5WLQAHLJzB12uTnifngA
	 c4YBB5qokGC6TW7K9aln+5Y8tW5tYTwuk9ECMe933RcxtyL/0ipUet+VSDHWvhRAtMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GRgn8O/W";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4B60A2602;
	Thu, 19 Nov 2026 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRgn8O/W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0658D1F000C6;
	Thu, 19 Nov 2026 00:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048648;
	bh=20gr1dyr9xoebQxfxyWXPnDdRZvlLYRq3reOFPfDJcc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GRgn8O/WZ95n0It1JWRK2U56EkstDkToMSiv6VCBd23l0D1xTZiWzMb8gCm9pVUKP
	 S0HPp8/tCjk87P/36F6RXxbxzTn15Zv/SRtPwV3ZEyB8Lv6AT1LYauM3HBjVIIU3rq
	 KCLIvleR7Jr13XeWBfcR+kmloe9jrbwGbMJj3mRU9OZXQArbuVLOycHbJQSw8f/ilF
	 3dx0PKGlWKVMsZBcPClGHO74M0WULo6smksa3nnUrinERcJSqFWsOYsWMXdG0W5vbR
	 CmpH7abGJ9LZ2DYwZiA8SMNAT7nYLf8r3LsHRce3AgHDnwJwilY9X/PPGZfb8GR4y0
	 KOTmisb63njzg==
Subject:
 Re: [PATCH net-next v2 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, carlos.soto@broadcom.com, justin.chen@broadcom.com,
 opendmb@gmail.com, nb@tipi-net.de, bcm-kernel-feedback-list@broadcom.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kudzo51@gmail.com
Date: Thu, 19 Nov 2026 00:37:27 +0000
Message-ID: <179504864758.3136.4762946821848645256@kernel.org>
In-Reply-To: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-5-florian.fainelli@broadcom.com>
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

- [Medium] The new C45 sequence issues an ADDR frame followed by a
  READ/WRITE frame through MDIO_CMD.
- [Medium] unimac_mdio_set_clause() (mdio-bcm-unimac.c:126-138) adds a
  read-modify-write of MDIO_CFG to the MDIO access path, and that RMW is…
- [Low] This patch changes behaviour for existing users of the non-DT
  (ACPI) GENET path more than the commit message says.
- [Low] The comment above MDIO_POLL_DELAY_US/MDIO_POLL_TIMEOUT_US (mdio-
  bcm-unimac.c:45-48: 'A C45 access is two frames, so a 1ms timeout…
- [Low] The driver now enables C45 on every controller it binds.

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This commit adds Clause 45 read/write callbacks to the UniMAC MDIO driver.
Each C45 access issues an ADDR cycle followed by a READ/WRITE cycle, and
MDIO_CFG is switched between C22 and C45 mode as needed. The BMSR
workaround read is also skipped for children compatible with
"ethernet-phy-ieee802.3-c45".

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index df267bb826966..6059b32580c54 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -96,7 +102,43 @@ static int unimac_mdio_poll(void *wait_func_data)
>  					MDIO_CMD);
>  }
>  
> -static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
> +static u32 unimac_mdio_c45_devad(int devad)
> +{
> +	return ((u32)devad << MDIO_DEVAD_SHIFT) & MDIO_DEVAD_MASK;
> +}
> +
> +static int unimac_mdio_addr_c45(struct unimac_mdio_priv *priv,
> +				int phy_id, int devad, int reg)
> +{
> +	u32 cmd;
> +
> +	/* Prepare the addr c45 operation */
> +	cmd = MDIO_ADDR_C45 | (phy_id << MDIO_PMD_SHIFT) |
> +	      unimac_mdio_c45_devad(devad) | (reg & MDIO_C45_REG_MASK);
> +	unimac_mdio_writel(priv, cmd, MDIO_CMD);
> +
> +	/* Start MDIO transaction */
> +	unimac_mdio_start(priv);
> +
> +	return priv->wait_func(priv->wait_func_data);

[Severity: Low]
This isn't a bug, but the timing comments added by the earlier patch in
this series ("Poll for completion at 1us granularity") describe one poll
that covers the whole two-frame C45 access:

/* A 64 bit MDIO frame takes ~25us at 2.5MHz and ~33us at the lowest MDIO
 * clock the driver can program from a 250MHz reference clock. A C45 access is
 * two frames, so a 1ms timeout leaves a wide margin.
 */

The same idea appears in unimac_mdio_poll():

	/* C22 transactions should take ~25 usec, C45 transactions take about
	 * twice as long since they need an address and a data cycle.
	 */

In this patch, wait_func is called once here for the ADDR frame. It is
called again for the READ/WRITE frame in unimac_mdio_do_read() and
unimac_mdio_do_write(). So each frame gets its own MDIO_POLL_TIMEOUT_US
budget.

Could those comments be updated to describe the per-frame wait?

> +}
> +
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
> +	if (new_cfg != cfg)
> +		unimac_mdio_writel(priv, new_cfg, MDIO_CFG);

[Severity: Medium]
This adds a read-modify-write of MDIO_CFG to the access path, and only
bus->mdio_lock serializes it. Can it race with the other writer of
MDIO_CFG?

unimac_mdio_clk_set() also does a read-modify-write of MDIO_CFG for the
clock divider. It is called from unimac_mdio_resume() without
bus->mdio_lock:

drivers/net/mdio/mdio-bcm-unimac.c:unimac_mdio_clk_set() {
    ...
	reg = unimac_mdio_readl(priv, MDIO_CFG);
	reg &= ~(MDIO_CLK_DIV_MASK << MDIO_CLK_DIV_SHIFT);
	reg |= div << MDIO_CLK_DIV_SHIFT;
	unimac_mdio_writel(priv, reg, MDIO_CFG);
    ...
}

The unimac-mdio device is a child of the MAC device, so the MAC resumes
first. GENET resume calls phy_start(). bcmasp_interface_resume() calls
phy_start() or phy_trigger_machine(). Either way the phylib state machine
is queued, and it can issue MDIO accesses while the PM core moves on to
unimac_mdio_resume().

This needs clock-frequency set in DT, and unimac_mdio_set_clause() has to
change the mode inside that window. Examples are the first C45 access
after the block was reset during suspend, or a bus with mixed C22/C45
traffic. In that case one of two updates can be lost:

  - set_clause() writes back a stale CFG, which drops the divider that
    clk_set() just restored. set_clause() only rewrites CFG on a mode
    change, so the divider then stays at the hardware default until the
    next resume.

  - clk_set() writes back MDIO_C22 after set_clause() cleared it. The
    following RD_C45/WR_C45 command is then issued in C22 mode.

Before this patch the access path never wrote MDIO_CFG. Does
unimac_mdio_clk_set() on the resume path now need to be serialized
against MDIO accesses?

> +}

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

[Severity: Medium]
When GENET instantiates this bus, is the ADDR frame guaranteed to be
finished at this point?

The only completion check is the return value of wait_func. For GENET,
wait_func is bcmgenet_mii_wait(), and it always returns 0:

drivers/net/ethernet/broadcom/genet/bcmmii.c:bcmgenet_mii_wait() {
	...
	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);
	return 0;
}

The only wake_up(&priv->wq) is in bcmgenet_isr0(). It only fires when
bcmgenet_has_mdio_intr() is true, which excludes GENET v1/v2. It also
needs the IRQ, which is only requested in bcmgenet_open(). So during
probe, while the interface is down, or on v1/v2, the wait ends only on
the HZ / 100 timeout.

With HZ=100, the 32-bit ARM default, that timeout is one jiffy. It can
expire at the next tick, well inside the ~25-33us frame. With HZ below
100 the timeout is 0.

In that case RD_C45 (or WR_C45 in unimac_mdio_do_write()) is written
into MDIO_CMD and START_BUSY is set again while the ADDR frame is still
on the wire. Can this corrupt the address frame, or send the data/write
cycle to whatever register the PHY last latched?

For reads, a premature read-back of MDIO_CMD[15:0] would return the
register number from the command as if it were data.

bcmgenet_mii_wait() already returned early before this patch, which can
affect back-to-back C22 accesses. Here, though, the new "if (ret) goto
out" check can never fire for GENET.

[ ... ]

> @@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

[Severity: Low]
The commit message says read_c45 enables a C45 scan of unmasked
addresses. Could it also describe what this means for the non-DT (ACPI)
GENET path?

On that path bcmgenet_mii_register() does:

	else
		ppd.phy_mask = ~0;

unimac_mdio_probe() turns this into bus->phy_mask = ~pdata->phy_mask,
which is 0. With np == NULL, of_mdiobus_register() calls
__mdiobus_register() directly, so the DT phy_mask = ~0 override never
runs. __mdiobus_register() then does:

	if (!prevent_c45_scan && bus->read_c45) {
		err = mdiobus_scan_bus_c45(bus);

This covers every address that has no C22 device.

bcmgenet_mii_probe() then attaches to phy_find_first(unimacbus), which is
the lowest-address phy_device. Suppose the C45 scan picks up something
at a lower address than the real PHY: a C22 PHY that answers ST=00
frames, or a bogus value read back early through bcmgenet_mii_wait().
Would that device be attached instead of the real PHY?

The scan also adds probe time. During probe nothing wakes priv->wq, so
each C45 frame waits out the full HZ / 100 timeout in
bcmgenet_mii_wait(). An empty address takes at least two frames, which
is 60 or more frames in total, or roughly 0.25-0.6s depending on HZ.

[Severity: Low]
read_c45/write_c45 are set unconditionally for every compatible in
unimac_mdio_ids[]:

  - brcm,asp-v3.0-mdio, brcm,asp-v2.2-mdio, brcm,asp-v2.1-mdio
  - brcm,bcm6846-mdio
  - brcm,genet-mdio-v1 through v5
  - brcm,unimac-mdio

They are also set for the GENET platform data instance.
unimac_mdio_set_clause() then clears MDIO_C22 in MDIO_CFG for C45
accesses.

Do all of these controller revisions implement the C45 ADDR/WR/RD opcodes
(0/1/3 in bits 27:26)? The match table has no per-compatible data, and
nothing checks the revision.

The MDIO_C22/MDIO_C45 CFG bit definitions go back to the original driver,
which suggests the block has a C45 mode. Nothing in the tree confirms
that for each listed revision, though.

On a revision without C45 support, these would now send unsupported
opcodes:

  - the ACPI GENET C45 scan
  - a DT child compatible with "ethernet-phy-ieee802.3-c45"
  - a SIOCGMIIREG/SIOCSMIIREG ioctl with a C45 phy_id

Before this patch, those requests failed with -EOPNOTSUPP because
read_c45 was NULL.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116213449.1682731-1-florian.fainelli%40broadcom.com

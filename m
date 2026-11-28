Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833559;
	b=wL//NgeemSYqYCEb/NZtMTHJ4FGWls5REyBsc06j/UbCjwnGgCeDF+DOLLRQpyhgFvFO
	 UqAKnGJgrM4316BR5lVovwAWc7FtzXTpupkVO0MIjsZEQZBKU1fbHr0qnU8z4aKwVb6qv
	 2XFySl8p/ELt5Wdoe0Igw4a3BQmobK4/NnHP4F+3WbAPzJIBrkaHz0DlQtgwFiNme/kxA
	 L4yFgRlOwyolr3GGrk6nl8UGrhgDtjwxOvNmHLRAgUYMaUBNsKBc4ZygjZ0pAHxGp2WHR
	 eY8LlTKnpby6he2tcn556LWKGScBnJs4B3mxcyPUtcJB9mBGY+8CE/i8jtsdK2ksRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833559;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LaV2SiinPK0tdVxX/NYL6LnBm8kBz/qgvPFNEtMsKmc=;
	b=1bBaf56V88hzb6fBXFbzwsKhb+C8adiGU2e0MLq8T0OaabxlZVJN/9HroJZeDGthsg6i
	 2phqIfffkvhh+bCFhmomxbWMbIEaGVP6ouaAJzP8/hdSjOBqdQmN32Sjt9qXD3T2dU4en
	 8l6yJXdx2Jv7bSfDJDkhtcO2deAZnP05FVQkzAEVDTAyYuxSMrT3dfiEoj3F8cVt54z8n
	 zD4JSIqAFD87RHU3UdbxR+IDYOcR67BpMQKN6DRLXL84J9sLd2cwg9Ol6WlYsFIggySHq
	 Lk6MbwZRX82JHUdNXscJsmBGyPM7FCGjIHzS/A9A+7HinSMhDZ9lyYc4yJsMBYsY1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bggHE349;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942B606A31C;
	Sat, 28 Nov 2026 02:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bggHE349
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EA01F000C1;
	Sat, 28 Nov 2026 02:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795833559;
	bh=LaV2SiinPK0tdVxX/NYL6LnBm8kBz/qgvPFNEtMsKmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bggHE349700cg4TW7e0fU8l2mhRtRj5mUN6EwxqOw/HX0K0m8VEeWxzaOdF4rTFKk
	 N+tnHmYnL0czet0HyLN79iUeeZR8BTzZiZKzlx9bgY5tUC7PC/6ySnoCvLwJbCIfvC
	 sIc3ByQiap5iOb4DuE1RjwYdMUhTc3QhWsiUwCPkt6fyAn8yloO8tRvTl4HkakmLyf
	 LXZF4tG+ndtjTfdAMAIPseMj0ZH4mJuqtq0hS5JTrW8xfdFFtBcNXF8iwoA465x2xP
	 gh3V0QPlsrqIA7MUParkinwwcptraFSKIYk1SlFJAqRF9d6vYBDEV29ducGbZm3teE
	 PZdIMnLHsD9/w==
Subject:
 Re: [PATCH net v4] net: ibm: emac: attach and start the fixed-link PHY
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: andrew+netdev@lunn.ch, netdev@vger.kernel.org, andrew@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 rosenp@gmail.com, chunkeey@gmail.com, jacob.e.keller@intel.com,
 kees+treewide@kernel.org, daniel.machon@microchip.com, hkallweit1@gmail.com,
 linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
Date: Sat, 28 Nov 2026 02:39:17 +0000
Message-ID: <179583355780.3135.1650054860252955858@kernel.org>
In-Reply-To: <20261127014748.2908781-1-xiaolinkui@126.com>
References: <20261127014748.2908781-1-xiaolinkui@126.com>
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

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Use-after-free on the probe error path.
- [Medium] On the fixed-link path, the MAC link parameters are now filled
  in asynchronously and without a lock shared with the readers.
- [Low] Since the fixed-link PHY is now attached and started at probe,
  two writers manage the carrier on the fixed-link path and nothing…
- [Low] emac_remove() now calls phy_stop() before unregister_netdev().

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the PHY-
  less/fixed-link branch of emac_init_phy() returns before it sets…

--

net: ibm: emac: attach and start the fixed-link PHY

This patch attaches the fixed-link PHY in emac_init_phy() with
of_phy_connect() and starts it through emac_mdio_init_phy(), so phylib
fills in dev->phy via emac_adjust_link(). It also restores phy_disconnect()
and of_phy_deregister_fixed_link() in emac_remove() and on the probe error
path, and stops the PHY before unregister_netdev().

> diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
> index 1b95b4d5deff5..27b79f897e36f 100644
> --- a/drivers/net/ethernet/ibm/emac/core.c
> +++ b/drivers/net/ethernet/ibm/emac/core.c
> @@ -2673,11 +2673,17 @@ static int emac_init_phy(struct emac_instance *dev)
>  				return res;
>  
>  			res = of_phy_register_fixed_link(np);
> -			ndev->phydev = of_phy_find_device(np);
> -			if (res || !ndev->phydev)
> -				return res ? res : -EINVAL;
> -			emac_adjust_link(dev->ndev);
> -			put_device(&ndev->phydev->mdio.dev);
> +			if (res)
> +				return res;
> +
> +			if (!of_phy_connect(ndev, np, &emac_adjust_link, 0,
> +					    dev->phy_mode))
> +				return -ENODEV;
> +
> +			/* Start it the same way as a real PHY. */
> +			res = emac_mdio_init_phy(&dev->phy);

[Severity: Medium]
Before this patch, emac_adjust_link() was called synchronously here, so
dev->phy was filled in by the time probe returned. Now phy_start() only
queues phy_state_machine(). The first emac_adjust_link() runs later from
the workqueue, holding only phydev->lock:

emac_adjust_link() {
	dev->phy.autoneg = phy->autoneg;
	dev->phy.speed = phy->speed;
	dev->phy.duplex = phy->duplex;
	dev->phy.pause = phy->pause;
	dev->phy.asym_pause = phy->asym_pause;
	...
}

On the fixed-link path, emac_open() holds RTNL and dev->link_lock but never
refreshes these fields before it builds MR1:

emac_open() {
	...
	if (dev->phy.address >= 0) {
		...
	} else
		netif_carrier_on(dev->ndev);
	...
	emac_configure(dev);
	...
}

emac_configure() reads dev->phy.speed, duplex, pause and asym_pause, and
the two lock sets do not overlap. If emac_open() runs before the first
state machine pass, MR1 gets the probe defaults (SPEED_100, DUPLEX_FULL).
If it runs during that pass, it can see a mix of old and new fields.

emac_adjust_link() never reprograms MR1, and a fixed link without
link-gpios never changes state again. Can the wrong MR1 then stay in place
until the next ifdown/ifup?

The commit message says:

  That window is the one the phy-handle path has always had,
  this driver starts its PHY at probe time rather than in ndo_open, and the
  next ifdown/ifup closes it.

Is that accurate? On the phy-handle path (dev->phy.address >= 0),
emac_open() reads the link synchronously through poll_link()/read_link(),
which ends up in phy_read_status(). emac_link_timer() also reprograms the
MAC on link changes. A fixed link has neither, so a fixed link can still
be programmed with the wrong speed, duplex or pause, which is the bug this
patch is meant to fix.

[Severity: Low]
Now that the fixed-link PHY is started here, two writers set the carrier
on this path. phylib's phy_link_change() calls netif_carrier_on()/off()
from the state machine work. The driver still calls netif_carrier_off() in
emac_probe() before register_netdev(), netif_carrier_on() in emac_open()
for dev->phy.address < 0, and netif_carrier_off() in emac_close().

Nothing orders these writers. phy_start() here runs before the
netif_carrier_off() in emac_probe(). If the work runs after that call but
while reg_state is still NETREG_UNINITIALIZED, netif_carrier_on() clears
__LINK_STATE_NOCARRIER without a linkwatch event. The netdev then
registers with the carrier on while it is administratively down. The later
netif_carrier_on() in emac_open() is a no-op, so no linkwatch event fires
on open.

Could operstate then stay at UNKNOWN instead of moving to UP?

If the work runs first instead, the netif_carrier_off() in emac_probe()
overrides phylib, and phylib then thinks the link is up while the carrier
is off. With link-gpios, phylib could also turn the carrier back on for a
closed interface.

Should the driver leave the carrier to phylib in the fixed-link case?

> +			if (res)
> +				return res;
>  		}
>  		return 0;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but the PHY-less/fixed-link
branch of emac_init_phy() returns before these assignments further down:

	dev->phy.mdio_read = emac_mdio_read;
	dev->phy.mdio_write = emac_mdio_write;
	...
		dev->phy.gpcs_address = dev->gpcs_address;

The private area is zeroed, so for a fixed link dev->phy.mdio_read is NULL
and dev->phy.gpcs_address is 0. With phy-mode sgmii, tbi or rtbi,
emac_open()->emac_configure() reaches:

	if (emac_phy_gpcs(dev->phy.mode)) {
		if (dev->phy.gpcs_address != 0xffffffff)
			emac_mii_reset_gpcs(&dev->phy);

Then emac_mii_reset_gpcs()->gpcs_phy_read() does:

	return phy->mdio_read(phy->dev, phy->gpcs_address, reg);

Does this call a NULL function pointer with RTNL and dev->link_lock held?
emac_reset_work() and the reinit path in emac_link_timer() reach
emac_configure() the same way.

There is a second effect now that the real fixed-link speed reaches
dev->phy. For a 1000 Mbit/s GPCS fixed link, MR1 is programmed with
EMAC_MR1_MF_IPPA(0) instead of the gpcs-address from DT. The oops above
would happen first, though.

> @@ -3190,6 +3196,10 @@ static int emac_probe(struct platform_device *ofdev)
>  	/* I have a bad feeling about this ... */
>  
>   err_detach_tah:
> +	if (ndev->phydev)
> +		phy_disconnect(ndev->phydev);
> +	if (of_phy_is_fixed_link(np))
> +		of_phy_deregister_fixed_link(np);

[Severity: High]
Can this unwind leave a linkwatch event queued on a netdev that devres
then frees?

The fixed-link PHY is started in emac_init_phy() before register_netdev(),
so the state machine can run during registration:

emac_init_phy()
  emac_mdio_init_phy()
    phy_start()
phy_state_machine()
  phy_link_up()->phy_link_change(true)
    netif_carrier_on()       <- clears NOCARRIER, no event yet
register_netdev()
  register_netdevice()
    netdev_register_kobject() fails  <- reg_state = NETREG_UNREGISTERED
goto err_detach_tah
  phy_disconnect()
    phy_stop()
      phy_link_down()->phy_link_change(false)
        netif_carrier_off()
          linkwatch_fire_event()  <- netdev_hold(), added to lweventlist
emac_probe() returns the error
  devm action: free_netdev()
    put_device()             <- net_device freed

netif_carrier_off() only suppresses the event for NETREG_UNINITIALIZED:

	if (!test_and_set_bit(__LINK_STATE_NOCARRIER, &dev->state)) {
		if (dev->reg_state == NETREG_UNINITIALIZED)
			return;
		atomic_inc(&dev->carrier_down_count);
		linkwatch_fire_event(dev);

free_netdev() does not wait for the linkwatch reference, so
linkwatch_event() would later walk lweventlist and dereference the freed
net_device. A NETDEV_REGISTER notifier veto ends in the same state. If the
state machine first runs after the failure, its own netif_carrier_on()
queues the event in the same way.

The commit message describes this hazard for emac_remove(), but the probe
unwind does not seem to be covered. Would starting the PHY only after
register_netdev() succeeds, or from ndo_open/ndo_stop, avoid this?

> @@ -3214,6 +3224,14 @@ static void emac_remove(struct platform_device *ofdev)
>  
>  	DBG(dev, "remove" NL);
>  
> +	/* Stop the PHY first: phy_stop() turns the carrier off and queues a
> +	 * linkwatch event, which unregister_netdev() then drains.
> +	 * phy_disconnect() has to stay below, detaching a PHY from a
> +	 * registered netdev wants RTNL and we do not hold it here.
> +	 */
> +	if (dev->ndev->phydev)
> +		phy_stop(dev->ndev->phydev);

[Severity: Low]
For a phy-handle PHY, phy_stop() also powers the PHY down. PHY_HALTED
returns PHY_STATE_WORK_SUSPEND, _phy_state_machine_post_work() calls
phy_suspend(), and genphy_suspend() sets BMCR_PDOWN. Here that happens
while the MAC is still running, since emac_close() only runs later inside
unregister_netdev().

emac_close() then calls emac_rx_disable()/emac_tx_disable(), which busy
wait for the idle bits:

		while (!(in_be32(&p->mr0) & EMAC_MR0_RXI) && n) {
			udelay(1);
			--n;
		}
		if (unlikely(!n))
			emac_report_timeout_error(dev, "RX disable timeout");

If the powered-down PHY stops supplying RX_CLK/TX_CLK, could these waits
run to the full timeout and log "RX/TX disable timeout" on unbind?

The link-loss handling in emac_link_timer() (emac_rx_clk_tx() and
emac_reinitialize()) is also skipped here, because phylib has already
cleared the carrier.

Before commit baab9de385a8, the PHY was disconnected only after
unregister_netdev(), so the MAC was stopped while the PHY still had power.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127014748.2908781-1-xiaolinkui%40126.com

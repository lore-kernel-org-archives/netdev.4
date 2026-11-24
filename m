Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550655;
	b=KgSSSDR4Q3i4UZI2GZndGQx9qZ/sFVpqLk5yWHyj97hIxwn7AvNMQvgciNd/kESWEskO
	 18ujIlT3LHssJfHc/Z1NnznvOIbL4pWdTyMY22fTS27GD8KrIb3qao8zIynmRxAfGXHAO
	 oRIYKWkkJwHQTNjqDviyLNXTf1esYnsS+lq9T5JTI9j1GWMLgFA9YMC0+tqZY49NGs4su
	 rkpkN4HGmijJQNqb63L1T7SYyqclN00lncdV9HibpAwu1Nt3slsLcOyB4d4GT2zviywkw
	 TSXGhZsSYVoH9P+mCgq8FgY6hDNbguj9nvQFL/MOYAVZGlto+pB+1aNgdNIX85dqxCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550655;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9+ZW/MZME9L5My37YXHr448AXO9rloCeNb9EZlt5kuw=;
	b=gPGvIprs3yj3LuC206QPLXmCajnanUAC5Rnm7s/WnItpRbDSVi4UM4V+2c6nvR9hKomD
	 B5UOPEEwvnlHqZM40rd4LLFbKXoEar08l+UmJrgeDZySupwuvmBwrv/FVfPhdNVwHzTqO
	 hdFUtACsVVBWJ+OGl0Q7VwdxA0OFbh5VaIV9MBS2CemAtiB/PmeG5g71p1XQpefL75NSz
	 JYN9JQo4trCZbKSc3CvifhZx72tqjHJu5D3I1bcb/ueN8AF3wftmTIHA8Xziy8i8zy/yt
	 p48IV5kaCiCQxKR2Mp0HWX18sP7aT+ydmPB2N6pXc/w7pO1qGnJ18attOmLwvgisdDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/6SbiF/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07082606A333;
	Tue, 24 Nov 2026 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/6SbiF/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57401F000D4;
	Tue, 24 Nov 2026 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795550654;
	bh=9+ZW/MZME9L5My37YXHr448AXO9rloCeNb9EZlt5kuw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A/6SbiF/PfFuKM79YnNNLaH78FwAw4HMM2KEjsu8upVWgGRAOg+LKi1G7utDE7gD2
	 xLD2R8Dl35+7K609+S7JuqYGJp/47AUAP1khOQwA6RItwotEa/RHY+pingTKgVhV8U
	 mNFvPvlOwmrWCCTAQgzJVGd3dJTzjHvU6DKTv9XWXmD1emkMh98YYqq5A3XESkxUPv
	 cLXTIkAw65i7kiSyShngU0Qu+J4PsdFEaQ7iq8wfLf9iERUaHtMdQQ7dzojYZz/l1m
	 LzIwLoL0VHUgGsilDUR9uxWfRyw0fVSsAOeZLf6HegbroA3BI/a84g02ZkcXs2WNIG
	 lMqKdTwZyP9yw==
Subject:
 Re: [PATCH net-next v5 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45 support
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, nb@tipi-net.de,
 carlos.soto@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
Date: Tue, 24 Nov 2026 20:04:13 +0000
Message-ID: <179555065335.3135.17418995951247615548@kernel.org>
In-Reply-To: <20261120194318.3952487-5-florian.fainelli@broadcom.com>
References: <20261120194318.3952487-5-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch sets bus->read_c45/write_c45 for every UniMAC bus,
  so the non-DT (ACPI) GENET bus, which has no addresses masked, now…
- [Low] The patch fixes a real Clause 22 bug but folds it into a C45
  feature commit, with no Fixes: tag and no separate patch.
- [Low] The commit message says the new C45 scan of the unmasked, non-DT
  (ACPI) GENET bus makes probe slower 'the same way the C22 scan already…
- [Low] unimac_mdio_wait() only guarantees the controller is idle when it
  succeeds.

--

net: mdio: mdio-bcm-unimac: Add Clause 45 support

This commit adds Clause 45 read/write callbacks to the UniMAC MDIO driver.
They switch MDIO_CFG between C22 and C45 mode as needed, and resume now
takes the bus lock around the clock divider update. It also polls for the
controller to go idle after every MDIO cycle, and skips the BMSR
workaround read for children compatible with ethernet-phy-ieee802.3-c45.

> The platform device that GENET instantiates when it is probed without a
> Device Tree node (e.g.: ACPI) does not mask any address, so it is scanned
> too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a timeout
> per frame since GENET's interrupt is not registered yet when the bus is
> registered. That makes the scan slower at probe time on such systems, the
> same way the C22 scan already is.

[Severity: Low]
Does "the same way the C22 scan already is" understate the added cost?

For each empty address, the C22 scan costs about 2 frames: the BMSR
workaround read in unimac_mdio_reset() (read_mask = ~bus->phy_mask) and
the PHYSID1 read.

The C45 scan goes through get_phy_c45_ids(), as changed by "net: phy: Map
C45 probe read errors to -ENODEV during bus scan". It costs 4 frames per
empty address: the MMD1 DEVS2 read (ADDR + READ, which fails with -EIO
mapped to -ENODEV), then the MMD0 DEVS2 fallback (ADDR + READ).

Each frame waits for the full HZ / 100 timeout in bcmgenet_mii_wait(),
because the IRQ is not requested until bcmgenet_open(). With one C22 PHY,
the 31 empty addresses add about 31 x 4 x 10ms, roughly 1.2s. That comes
on top of the ~0.6s the C22 scan already costs.

On the known ACPI GENET platform (Raspberry Pi 4 with a C22 BCM54213PE),
the C45 scan cannot find anything.

Could the commit message give a more accurate size for this delay?

> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
> index f8e5c1811d96b..b01e99327b561 100644
> --- a/drivers/net/mdio/mdio-bcm-unimac.c
> +++ b/drivers/net/mdio/mdio-bcm-unimac.c

[ ... ]

> @@ -97,7 +103,60 @@ static int unimac_mdio_poll(void *wait_func_data)
>  					MDIO_CMD);
>  }
>  
> -static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
> +/* Wait for a cycle to complete. Some wait_func implementations (e.g.:
> + * bcmgenet_mii_wait()) return 0 even when they timed out with the controller
> + * still busy, in which case MDIO_CMD[15:0] holds the command rather than the
> + * data, and MDIO_CFG or MDIO_CMD must not be touched before the frame is
> + * over. Make sure the controller is idle after every cycle.
> + */
> +static int unimac_mdio_wait(struct unimac_mdio_priv *priv)
> +{
> +	int ret;
> +
> +	ret = priv->wait_func(priv->wait_func_data);
> +	if (ret)
> +		return ret;
> +
> +	return unimac_mdio_poll(priv);
> +}

[Severity: Low]
This also fixes an existing C22 problem. Would it be better as a separate
patch with a Fixes: tag, so stable trees pick it up?

bcmgenet_mii_wait() always returns 0:

	wait_event_timeout(priv->wq,
			   !(bcmgenet_umac_readl(priv, UMAC_MDIO_CMD)
			   & MDIO_START_BUSY),
			   HZ / 100);
	return 0;

GENET registers the UniMAC bus at probe via bcmgenet_mii_init(), but only
requests its IRQs in bcmgenet_open(). Probe-time C22 frames therefore rely
on the timeout expiring. These are the PHYSID1/PHYSID2 scan reads and the
BMSR workaround read in unimac_mdio_reset().

With CONFIG_HZ=100, HZ / 100 is a single jiffy. That can expire at the
next tick, before the ~25us frame has finished.

Before this patch, unimac_mdio_read() would then read MDIO_CMD with
MDIO_START_BUSY still set. It returned cmd & 0xffff (the command bits) as
PHY data, and the next command could start while the frame was still in
flight.

The commit message does say "C22 ones included", but presents the change
only as groundwork for C45.

[ ... ]

> @@ -108,14 +167,25 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
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

[Severity: Low]
The comment above unimac_mdio_wait() says "MDIO_CFG or MDIO_CMD must not
be touched before the frame is over". Is that only enforced on the success
path?

If wait_func or the following unimac_mdio_poll() times out,
unimac_mdio_do_read() and unimac_mdio_do_write() jump to out with
MDIO_START_BUSY possibly still set. For C45 this can happen on the address
frame inside unimac_mdio_addr_c45(). clk_disable_unprepare() then gates
the clock while the frame may still be in flight.

The next access starts with unimac_mdio_set_clause(), a read-modify-write
of MDIO_CFG that can flip MDIO_C22. It then rewrites MDIO_CMD and sets
MDIO_START_BUSY. Nothing checks that the previous frame has finished.

unimac_mdio_resume()->unimac_mdio_clk_set() also rewrites the MDIO_CFG
divider without checking for idle.

After a real hardware timeout, could this corrupt the in-flight frame or
the next MDIO frame? It needs a frame to stay busy past the wait_func
timeout plus the 1ms MDIO_POLL_TIMEOUT_US, so it takes a stalled
controller.

[ ... ]

> @@ -302,6 +408,8 @@ static int unimac_mdio_probe(struct platform_device *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

[Severity: Medium]
Can this change which PHY GENET attaches to on the non-DT (ACPI) path?

These callbacks are now set unconditionally. bcmgenet_mii_register()
leaves bus->phy_mask at 0 when there is no DT node:

	else
		ppd.phy_mask = ~0;

So __mdiobus_register() also runs the C45 scan over the whole bus. That
scan can add phy_devices at addresses that have no C22 device.

GENET's ACPI path then picks its PHY in bcmgenet_mii_probe():

	phydev = phy_find_first(unimacbus);
	...
	ret = phy_connect_direct(dev, phydev, bcmgenet_mii_setup,
				 phy_iface);

Something may answer C45 frames at an address below the intended C22 PHY.
It could be a C45-only PHY, or a C22 PHY that mishandles C45 frames (the
comment in mdio_bus_provider.c mentions this case). Would phy_find_first()
then return that device, so GENET attaches to the wrong PHY?

mdiobus_prevent_c45_scan() only filters out the Micrel OUI. The commit
message only mentions probe time for this bus, not the change in which PHY
gets selected.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120194318.3952487-1-florian.fainelli%40broadcom.com

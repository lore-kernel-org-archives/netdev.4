Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570117;
	b=mNKVL/4L9nocLMrDak2ewk5Pv78t6qVsf8ldI0UXwc1iXjgxX8JdK5cyJ45drcD5PJ2k
	 wS6r7XgFxkbWS4alh3CqZ0xloUoQvic+1g+kW1tfaht2ZOgGqrZ2TdWUEny9aj1928Lca
	 OGq44l2iUga7B82ybHJIfMaTWIIb9pSzH36mj4LNo+xNgWiU2F3eGZ3AdGsSWF2g+uula
	 hA1kd+0XBH3IOol4xcAqCLUDUPCFCFO6+V11oxckqxIyUtS4+aBogijvXLTpog/8Grqyl
	 p6m3AMjNPswQrbVzjVZ3eLgr53R0geJPTfWoy4MIqClpO/zo2MHVsqlcyF4XBMJ6n2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570117;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=E8359OUvmn7QJKn1lJO3S5uy8iyHhl5y1lBMxhcGp/4=;
	b=lK14d6iamIKXwAMIXwZWbAb6bZk4IdPBVfJ5ajx+eyL1Jpu0XLArIrYk6nKGZS+23wp5
	 ssoy6aDHe2Rzw5XLyOBnqE9MBDGtk0KCni/6EVwRQN88Bqu1g5JOMtwVQIcz2VzQx5C4h
	 Ol1CF84nstT7Wznfwh2q1vWdLrnLSgZ/aSHOTb2i2ZOTPNrIAO9IFUQDY6eeqiTOOpYxm
	 488xiBdJVvaAuGzmcpj6pNCpn/ET83Fkrr1n86qXVTu09j9yaaaa5MCx7HbBXhAIGRg6z
	 iUmtu6kcAI/8JvozImWBwS663o44q4pCKWlSGqpf5cB8KCzqvCsi/qZDSk9VBUZkHog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tu1YX3Ns;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B0606A32D;
	Wed, 25 Nov 2026 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tu1YX3Ns
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEF81F000EF;
	Wed, 25 Nov 2026 01:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570116;
	bh=E8359OUvmn7QJKn1lJO3S5uy8iyHhl5y1lBMxhcGp/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Tu1YX3NsWqx7GZVhU/x/EWi9ykddxSU0vLi4YUtN2CR/Few1OGJMm8eJeRsUrzZ9b
	 F0KK80u38ALLMkT2UX5H5Kc8LZMtZdOlIWwJILa8pcEuWLt1mOyYgb7N6AGUAA/N5q
	 zBcpNdJjZEOgfGoBoxHZNSL8yuNEfmZcpknSPQg5lzaE6FNv7oGz/o0VcsTzr+B6OZ
	 pZXOBg0SNntd0QhtwdJkUOuwo+grnAmY1G08VupkPpuzREl0pIe9as+/D82A6wqsZr
	 HTI/ccGQEqLYl01bJoPu5vy7HPZiTzls7hhn1o5JFXMYW22wokTvdjNj9+YDA3e5uc
	 HvKI+01x6piJQ==
Subject: Re: [PATCH net v4 09/10] net: au1000: keep the MAC stopped until the
 PHY link is ready
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Wed, 25 Nov 2026 01:28:34 +0000
Message-ID: <179557011468.3135.5568658065903608607@kernel.org>
In-Reply-To: <20261121004809.1690280-10-f.fainelli@gmail.com>
References: <20261121004809.1690280-10-f.fainelli@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: au1000: unattached PHYs on aup->mii_bus lack mac_managed_pm
- [Medium] Setting `phydev->mac_managed_pm = true` in au1000_mii_probe()
  turns off phylib's MDIO-bus system-sleep handling.
- [Medium] When au1000_resume() fails, the interface is left in a state
  it cannot leave once it is closed.

--

net: au1000: keep the MAC stopped until the PHY link is ready

The patch keeps MAC RX/TX disabled until au1000_adjust_link() acknowledges
link up. It also stops the MAC on link-down and resumes the PHY
synchronously in au1000_open() before au1000_init(). Finally, it adds
system sleep callbacks that manage PHY and MAC power transitions, and sets
mac_managed_pm so phylib's MDIO bus PM is skipped.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index ec28ed33bf698..aa5fa318b23e2 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c

[ ... ]

> @@ -553,6 +567,7 @@ static int au1000_mii_probe(struct net_device *dev)
>  	}
>  
>  	phy_set_max_speed(phydev, SPEED_100);
> +	phydev->mac_managed_pm = true;
>  
>  	aup->old_link = 0;
>  	aup->old_speed = 0;

[Severity: High]
Does this cover every phy_device on aup->mii_bus, or only the one that
gets connected?

mdiobus_register() in au1000_probe() creates a phy_device for every
address that answers. However, au1000_mii_probe() only sets
mac_managed_pm on the one it passes to phy_connect().

On MTX-1, mtx1_au1000_eth0_pdata sets phy_search_highest_addr because
the LAN83C183 answers at address 0 as well as at address 31. Both
instances bind to the PHY driver, and the loop in au1000_mii_probe()
picks address 31. That leaves the address 0 alias unattached with
mac_managed_pm clear.

For an unattached PHY with a bound driver, mdio_bus_phy_may_suspend()
falls through to returning !phydev->suspended. The MDIO bus PM
callbacks therefore still act on the alias.

The phy_device instances are added to the PM list after the platform
device, so mdio_bus_phy_suspend() on address 0 runs before
au1000_suspend(). Its phy_suspend() powers down the same physical PHY
through the alias. That removes the MII clocks while MAC RX/TX are
still enabled. Isn't that the MTX-1 hang this patch is trying to
prevent?

On the way back up, mdio_bus_phy_resume() on the alias runs after
au1000_resume(). Its phy_init_hw() and phy_resume() go through
au1000_mdiobus_read() and au1000_mdiobus_write(), which call
au1000_enable_mac(dev, 0).

For a down interface, that leaves the MAC clocked and out of reset
again. This undoes the au1000_reset_mac() done in au1000_suspend().
For a running interface, it reinitializes the PHY behind the back of
the state machine that au1000_resume() has just restarted with
phy_start().

Would it be better to set mac_managed_pm on every phy_device found on
aup->mii_bus? Alternatively, could the alias be kept from being
registered at all through mii_bus->phy_mask on boards that set
phy_search_highest_addr?

[ ... ]

> @@ -972,6 +1003,81 @@ static int au1000_close(struct net_device *dev)
>  	return 0;
>  }
>  
> +static int au1000_suspend(struct device *device)
> +{

[ ... ]

> +	rtnl_lock();
> +	if (netif_running(dev)) {
> +		if (!netif_device_present(dev))
> +			goto out;
> +		netif_device_detach(dev);
> +		netif_tx_disable(dev);
> +		disable_irq(dev->irq);
> +		/* Do not depend on phylib delivering a link-down callback. */
> +		spin_lock_irqsave(&aup->lock, flags);
> +		if (aup->mac_enabled)
> +			au1000_disable_rx_tx(dev);
> +		spin_unlock_irqrestore(&aup->lock, flags);
> +		usleep_range(10000, 11000);
> +		if (dev->phydev)
> +			phy_stop(dev->phydev);
> +	} else if (dev->phydev) {
> +		ret = phy_suspend(dev->phydev);
> +	}

[ ... ]

> +static int au1000_resume(struct device *device)
> +{
> +	struct net_device *dev = dev_get_drvdata(device);
> +	struct au1000_private *aup = netdev_priv(dev);
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	rtnl_lock();
> +	if (!netif_running(dev))
> +		goto out;

[Severity: Medium]
Can the PHY miss its re-initialization when the interface is down across
system sleep?

Setting mac_managed_pm in au1000_mii_probe() makes mdio_bus_phy_resume()
return early:

drivers/net/phy/phy_device.c:mdio_bus_phy_resume() {
	if (phydev->mac_managed_pm)
		return 0;
	...
	ret = phy_init_hw(phydev);
	...
	ret = phy_resume(phydev);
	...
}

Before this patch, a PHY that phy_connect() had attached but that was never
opened stayed resumed after phy_attach_direct(). The MDIO bus PM path then
suspended it and ran phy_init_hw() followed by phy_resume() on wakeup.

Now, if the interface is down, au1000_suspend() calls phy_suspend() and
au1000_resume() returns here without touching the PHY. The next
au1000_open() only calls phy_resume() and phy_start(), never phy_init_hw().

If the PHY loses register state over suspend-to-RAM, does it come up after
the next ifup without its soft_reset, fixups, config_init (for example
smsc_phy_config_init() on LAN87xx parts) and config_intr re-applied? The
LAN83C183 on MTX-1 has no config_init or soft_reset, but other Au1x00
boards use PHYs that do.

The running-interface path below does call phy_init_hw(). Should the
inactive path do the same, either here or in au1000_open()?

> +
> +	spin_lock_irqsave(&aup->lock, flags);

[ ... ]

> +	if (dev->phydev) {
> +		ret = phy_init_hw(dev->phydev);
> +		if (ret)
> +			goto err_reset;
> +		ret = phy_resume(dev->phydev);
> +		if (ret)
> +			goto err_reset;
> +	}
> +
> +	au1000_init(dev);
> +	enable_irq(dev->irq);
> +	if (dev->phydev)
> +		phy_start(dev->phydev);
> +	netif_device_attach(dev);
> +	goto out;
> +
> +err_reset:
> +	au1000_reset_mac(dev);
> +out:
> +	rtnl_unlock();
> +	return ret;
> +}

[Severity: Medium]
What state is the interface left in if phy_init_hw() or phy_resume() fails
here, for example with -ETIMEDOUT from au1000_mdio_read() or
au1000_mdio_write()?

The err_reset path only resets the MAC. The PHY stays in PHY_HALTED from
the phy_stop() in au1000_suspend(), the IRQ stays disabled and the netdev
stays detached, while netif_running() is still true.

If the interface is then brought down, au1000_close() calls phy_stop()
unconditionally. PHY_HALTED fails the check at the top of phy_stop():

drivers/net/phy/phy.c:phy_stop() {
	if (!phy_is_started(phydev) && phydev->state != PHY_DOWN &&
	    phydev->state != PHY_ERROR) {
		WARN(1, "called from state %s\n",
		     phy_state_to_str(phydev->state));
		return;
	}
	...
}

A later ifup then fails because the device is still detached:

net/core/dev.c:__dev_open() {
	if (!netif_device_present(dev)) {
		...
		if (!netif_device_present(dev))
			return -ENODEV;
	}
	...
}

Another suspend/resume cycle does not recover it either. With
netif_running() false, au1000_resume() takes the early goto out above and
never calls netif_device_attach().

Does this turn a possibly transient MDIO error during resume into an
interface that cannot be used again until the driver is rebound?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121004809.1690280-1-f.fainelli%40gmail.com

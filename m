Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597304;
	b=0GpUIgNhOw3xb5TfBBozUQut/t+U3oDbHm1X8ENJ5S/Pc5fKMxwikAtOoe2M9opLkF7w
	 iey74EbhEIEfpf5PQn2TpdjfMzkjmVVRleLKWdP8YAMhJgglo5AbzH/42T0x1aO4kkuDb
	 B0q2E/UbR/XjiMZynnIHeM+94ZtJQtmTzRYp3v7MR/+3WdTa7Ho4BB2x3G7y4YLmYrqlY
	 Bqpe+bThS2XtdBb+3frLFwuBhFihocOZjoZ+eIlvxKl4twv+64fgJR4QuOVC6jWmsVGXI
	 PPZ5nFeYorpmVcVN05a2ljtEVHGJJ133/R8R40LbXiNtFBDCeWkZV7JEq/wZd7JQTsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597304;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vEv5PK1YgztGxhv9CM6ODI0CCL2xh4mHLk5IohQ0LIA=;
	b=GW6hR43H06pjSQTBHlE8v6nSozTPOQttE4CH3h89HwuxDah0Q/ZH7F5GDc57JEMBNxl4
	 p24xrcBdHzR38YnjHK7oLA4QO9I4STswDdHQ2ZoUkhy2Pd3j6g1wolHRU+rcVVeXM8fRo
	 j70tercyfjavHFNgzjXR2Qcn9DdgBFzvzBkFt1hkDtzMJaTRgc2CmEaBCzbB8sOM4nr+F
	 QBBTQz3L9QaasEuufoo0YpLcUJfOEKbL1z7V2IXmzUiksdUF4g47TxcpaG4XXWrm7VGen
	 o2zmQ+xKZ74Xk383IiavRTFYqjnaa2tlazsVzr5/dxq2PA6Obo4SmrK/IuA8b0RcfYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AD+H7ysN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209B606A32A;
	Wed, 25 Nov 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AD+H7ysN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8961F000C0;
	Wed, 25 Nov 2026 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597304;
	bh=vEv5PK1YgztGxhv9CM6ODI0CCL2xh4mHLk5IohQ0LIA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AD+H7ysNiD4jMXv2MA2R8NTCoPAMNE6NY51I+PxOGsbcdYRpOy0GxIeY58QpRKsdo
	 9c3TFx/8Uan5wiXyFslu5vlPiobv5QWxbJeO/hHPBuMvIANlCbnv4yNVnBfjxEbx1j
	 yqeazJgZjz3vMt8P0sL89QdBr2m5QXsLxgQ3srvla6NzHmDnzOwNkNhkj5f2jDI6UG
	 cUfVX8vtVkA0Jj10k4DdGA6ppktCxEQTNubCjPik5h9UOMKCJ1V6K+TBA6dgcbua84
	 gTdHNBhAZqcuTSrpr8GcluWhWs8UK7+pIpRIPIhd7m8Ru4fiyGVMEN+qAgeP3LdFT9
	 mm975lr7XbdWg==
Subject:
 Re: [PATCH net v3] net: ibm: emac: attach and start the fixed-link PHY
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: andrew+netdev@lunn.ch, netdev@vger.kernel.org, andrew@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 rosenp@gmail.com, chunkeey@gmail.com, jacob.e.keller@intel.com,
 kees+treewide@kernel.org, daniel.machon@microchip.com, hkallweit1@gmail.com,
 linux-kernel@vger.kernel.org, xiaolinkui@kylinos.cn
Date: Wed, 25 Nov 2026 09:01:42 +0000
Message-ID: <179559730279.3135.7318334257799287238@kernel.org>
In-Reply-To: <20261124083941.2480237-1-xiaolinkui@126.com>
References: <20261124083941.2480237-1-xiaolinkui@126.com>
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

Critical: 0 · High: 1 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Unbind can leave a freed net_device queued on the global
  linkwatch list.
- [Medium] After the patch, the fixed-link speed, duplex and pause reach
  dev->phy only through phylib's asynchronous state machine.
- [Low] The commit message presents the new phy_disconnect() in
  emac_remove() as fixing the fixed-link attach, and notes in passing…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it affects
  every PHY-less configuration this patch touches, fixed-link included,…

--

net: ibm: emac: attach and start the fixed-link PHY

This patch attaches the fixed-link PHY in emac_init_phy() with
of_phy_connect() and starts it with phy_start(). phylib then fills in
dev->phy through emac_adjust_link(). It also adds phy_disconnect() and
of_phy_deregister_fixed_link() to the emac_probe() error path and to
emac_remove().

> Attaching also means detaching. Without phy_disconnect(), unbind leaves
> phydev->attached_dev pointing at a freed netdev, and the next probe fails
> with -EBUSY from phy_attach_direct(). The disconnect also stops the
> phy-handle path, which calls phy_start() but never phy_stop(). The fixed
> PHY is deregistered on the same paths.

[Severity: Low]
This isn't a bug, but could the commit message say that baab9de385a8
("net: ibm: emac: use netdev's phydev directly") is the commit that
removed this from emac_remove():

	if (dev->phy_dev)
		phy_disconnect(dev->phy_dev);

Since then, the phy-handle path has connected with of_phy_connect() and
started the PHY in emac_mdio_init_phy(), but it never detaches. So the
stale phydev->attached_dev problem described here has existed on that
path since baab9de385a8.

Saying that the emac_remove() hunk restores teardown removed by that
commit would make the backport scope clearer.

> diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
> index 1b95b4d5deff5..ddf33c0293348 100644
> --- a/drivers/net/ethernet/ibm/emac/core.c
> +++ b/drivers/net/ethernet/ibm/emac/core.c
> @@ -2673,11 +2673,14 @@ static int emac_init_phy(struct emac_instance *dev)
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
> +				return -EINVAL;
> +
> +			phy_start(ndev->phydev);

[Severity: Medium]
The old code called emac_adjust_link() synchronously in probe.
phy_start() only queues phydev->state_queue, so dev->phy gets filled in
later from a kworker.

emac_adjust_link() only copies the values into dev->phy:

	dev->phy.autoneg = phy->autoneg;
	dev->phy.speed = phy->speed;
	dev->phy.duplex = phy->duplex;
	dev->phy.pause = phy->pause;
	dev->phy.asym_pause = phy->asym_pause;

It never calls emac_configure() and never schedules a reset. When
dev->phy.address == -1, emac_open() forces carrier on, does not schedule
link_work, and calls emac_configure() only once.

Suppose emac_open() runs before the first state machine pass. Would MR1
then be programmed from the probe defaults (SPEED_100, DUPLEX_FULL,
pause = 1) and stay that way after emac_adjust_link() reports the
fixed-link values? A fixed link does not change state again, so
adjust_link would not be called again either.

The writer and the readers also share no lock. emac_adjust_link() runs
under phydev->lock. emac_configure() runs under dev->link_lock from
emac_open() and reset_work. A concurrent run could program a mix of old
and new speed and duplex.

Taking link_lock inside the callback is not simple, because the ethtool
paths take link_lock before they call into phylib.

Could the PHY state be read synchronously under link_lock before
emac_configure()? Alternatively, emac_adjust_link() could trigger a
reconfiguration (for example via reset_work) when the device is open.

>  		}
>  		return 0;

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. It
dates back to commit 9e3cb29497561c, but it affects every PHY-less
configuration this branch handles, fixed-link included.

The PHY-less branch returns before emac_init_phy() sets these:

	dev->phy.mdio_read = emac_mdio_read;
	dev->phy.mdio_write = emac_mdio_write;
	...
	dev->phy.gpcs_address = dev->gpcs_address;

emac_instance lives in zeroed netdev_priv, so mdio_read is NULL and
gpcs_address is 0. With phy-mode sgmii, tbi or rtbi, emac_configure()
does this on every open and reset:

	if (emac_phy_gpcs(dev->phy.mode)) {
		if (dev->phy.gpcs_address != 0xffffffff)
			emac_mii_reset_gpcs(&dev->phy);
		else
			emac_mii_reset_phy(&dev->phy);
	}

Can emac_mii_reset_gpcs()->gpcs_phy_read() then call through the NULL
phy->mdio_read? The else branch would also reach the NULL mdio_read,
through phy_read().

EMAC0 in arch/powerpc/boot/dts/arches.dts looks like it matches this
case (phy-mode = "sgmii", phy-map = <0xffffffff>, no phy-address). So
would any fixed-link node with an SGMII, TBI or RTBI phy-mode.

The 1000 Mbit/s path is now reached for fixed links. On that path MR1
would also get IPPA(0) instead of the DT gpcs-address.

>  	}

[ ... ]

> @@ -3223,6 +3230,11 @@ static void emac_remove(struct platform_device *ofdev)
>  
>  	cancel_work_sync(&dev->reset_work);
>  
> +	if (dev->ndev->phydev)
> +		phy_disconnect(dev->ndev->phydev);

[Severity: High]
Can this leave a freed net_device queued on the global linkwatch list?

emac_init_phy() now calls phy_start() at probe time. The fixed link
comes up on the first state machine pass, and phy_link_change() calls
netif_carrier_on(). Probe called netif_carrier_off() earlier, but that
does not stop it.

The phy-handle path already does the same through emac_mdio_init_phy().
If the interface is never opened, carrier is still on at unbind. The
call chain at unbind is then:

emac_remove()
  unregister_netdev()          /* reg_state = NETREG_UNREGISTERED */
  phy_disconnect()
    phy_stop()
      _phy_state_machine()     /* PHY_HALTED, phydev->link == 1 */
        phy_link_down()
          phy_link_change(false)
            netif_carrier_off()
              linkwatch_fire_event()
                linkwatch_add_event()   /* netdev_hold(), list_add */
devres -> free_netdev()

netif_carrier_off() only returns early for NETREG_UNINITIALIZED:

net/sched/sch_generic.c:netif_carrier_off() {
	if (!test_and_set_bit(__LINK_STATE_NOCARRIER, &dev->state)) {
		if (dev->reg_state == NETREG_UNINITIALIZED)
			return;
		atomic_inc(&dev->carrier_down_count);
		linkwatch_fire_event(dev);
	}
}

linkwatch_add_event() does not check reg_state either.

ndev comes from devm_alloc_etherdev(), so free_netdev() runs right after
emac_remove() returns. free_netdev() does not take dev->link_watch_list
off lweventlist.

The device is not running, so the linkwatch work is not urgent and runs
up to HZ later. __linkwatch_run_queue() would then walk the freed device
and call __dev_put() on the freed pcpu_refcnt.

The err_detach_tah path in emac_probe() has the same ordering. It is hit
if register_netdev() fails after reg_state has become
NETREG_UNREGISTERED, for example when netdev_register_kobject() fails.

Would it work to move phy_start() and phy_stop() into emac_open() and
emac_close()? The PHY would then already be halted when
unregister_netdev() runs. Another option is to stop the PHY before
unregister_netdev().

> +	if (of_phy_is_fixed_link(ofdev->dev.of_node))
> +		of_phy_deregister_fixed_link(ofdev->dev.of_node);
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124083941.2480237-1-xiaolinkui%40126.com

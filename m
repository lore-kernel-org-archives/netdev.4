Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508073;
	b=KLaX+buCwsiiu+6AXoerCc60LsZBIIMi1qyPf/2ydzapwqC7+/lkbgABFG/qe6uVMQkf
	 oPIzoE+AbbC6kDzKvmWjOajB3efViz3OlziGvUafiWtR3EHdnGSEjYVjMcvNCj1GooWnp
	 Ml14buDxjJtiqptKGYLS4/bUhUGPSTuJ7GkC/uncjdpdoYnLVpCfBk2QXqnHtvdgOR+rC
	 F80OSzOx6lx2XV1Gi8JXv7lWHRJaypt5ko4a7CH7Dor3x9N3Pb6GPN1IkIB8ZxHz4Bbgj
	 rZGPsJguitd3cujKG67Y8wuPczzfQrOomftr4fCNIbIHXWY/gx0oKnJFGeeBFxMjP0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508073;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UvvNPQfuuHbIJYAlRuTkRUXi3kPH3oXBXSb9/orbn2U=;
	b=F2G5m+XEsBB+k/Cve706Qq20dKkBrIA28lLVIs6nl7B8vEe6r9qJoiZ1jZdALy1raA1p
	 TNJffTlX5Jnp/vWPvN+n0GTwiREl2n367etsDwIwoTXHWQQxA4eEBc2B3lfwmweDy6Ln2
	 QfWC1unMAYsrJt0eOuJpQparcDdbYjmLw7bL5UtpMprTn0tSQGk0v6cu3Pw45bT/G2esC
	 ZbIk4W8ZAkhBxOS49DxmtRJNQbgIFA7UJAS7BvIbO/00XaWI2wG+7CVbEtvtlD4FncVJz
	 xqUQuZUFvLmK9ZJj+BBiMiss7MgFOTpr2daBM0r5o7KPcHKiJ59Zy/797VTPiAAxo/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPhQVSbm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C13606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPhQVSbm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DD51F000EC;
	Tue, 24 Nov 2026 08:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508073;
	bh=UvvNPQfuuHbIJYAlRuTkRUXi3kPH3oXBXSb9/orbn2U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iPhQVSbm/RmrfaZ0cpASLsdTs/320o7xHnj3oV+bvnchVExZ4/RB6ufNU/Iewjn44
	 sTYZfrAPoZlHLRA8RTMwieTolFdfC5o1Bpb4pkcegjSzGf46YqolilIW1mu2Kw5K25
	 HVmqp3SsywLuMMVMTbC/TlJsCmfVFUuJM9y/ds7PpCGIAEjwOHqenLaQNDvtjt+QhZ
	 f4Z6zjL8bDiGA4dfTDxFo9CJcny4K1HyIBLnKxlTq8L3Zu56sgpGlnk5YsaTwEWodI
	 4p2oAHij+VVR7cYelfgORN0eEKWb/dAUjl/UVyRKjWX/w3SiwnwzyNBypHgxFyzMmt
	 SK7v//IQmhvsw==
Subject: Re: [PATCH net] net: ethernet: aeroflex: fix memory leak in greth
 probe and remove
From: netdev-bot+sashiko@kernel.org
To: b.lane130@outlook.com
Cc: andreas@gaisler.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 kristoffer@gaisler.com, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 08:14:32 +0000
Message-ID: <179550807240.3135.12134236408454938101@kernel.org>
In-Reply-To: <BN8PR06MB6177818FBD04A32DAEDFC589A4452@BN8PR06MB6177.namprd06.prod.outlook.com>
References: <BN8PR06MB6177818FBD04A32DAEDFC589A4452@BN8PR06MB6177.namprd06.prod.outlook.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch changes greth_of_remove() to call
  phy_disconnect(ndev->phydev), then mdiobus_unregister() and…

Pre-existing issues:
- [High] greth_of_remove() (drivers/net/ethernet/aeroflex/greth.c) frees
  both coherent descriptor rings with dma_free_coherent(rx_bd_base) and…

--

net: ethernet: aeroflex: fix memory leak in greth probe and remove

This commit adds phy_disconnect() and mdiobus_free() to the error3 path
of greth_of_probe(). In greth_of_remove() it replaces phy_stop() with
phy_disconnect() and adds mdiobus_free(), so that the mii_bus and the
attached phy_device are no longer leaked.

> diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
> index fccb67beebee1..f649f76361acb 100644
> --- a/drivers/net/ethernet/aeroflex/greth.c
> +++ b/drivers/net/ethernet/aeroflex/greth.c

[ ... ]

> @@ -1538,8 +1540,9 @@ static void greth_of_remove(struct platform_device *of_dev)
>  	dma_free_coherent(&of_dev->dev, 1024, greth->tx_bd_base, greth->tx_bd_base_phys);

[Severity: High]
This is a pre-existing issue and was not introduced by this patch.
Since the patch edits this teardown block, could the order be fixed here
too?

greth_of_remove() frees both coherent descriptor rings before it calls
unregister_netdev(). If the interface is up at remove time, the device
is only quiesced later, from unregister_netdev()->dev_close()->
greth_close():

greth_close() {
	napi_disable(&greth->napi);

	greth_disable_irqs(greth);
	greth_disable_tx(greth);
	greth_disable_rx(greth);

	netif_stop_queue(dev);

	free_irq(greth->irq, (void *) dev);

	greth_clean_rings(greth);
}

Between the dma_free_coherent() calls and greth_close(), the MAC RX/TX
DMA engines are still enabled. regs->rx_desc_p and regs->tx_desc_p still
point at the freed memory. NAPI poll, ndo_start_xmit and
greth_interrupt() can also still touch the rings.

Can the RX engine then DMA received data to an address taken from
reused memory, if it reads a descriptor whose enable bit happens to be
set?

After that, greth_clean_rings() reads every descriptor's addr from the
freed rings:

		dma_unmap_single(greth->dev,
				 greth_read_bd(&rx_bdp->addr),
				 MAX_FRAME_SIZE+NET_IP_ALIGN,
				 DMA_FROM_DEVICE);

Isn't this a use-after-free read of rx_bd_base and tx_bd_base? The
unmaps would use garbage handles, and the real streaming mappings would
leak.

You can reach this with a sysfs unbind or a module unload while the
interface is up. Would calling unregister_netdev() first, before the PHY
and MDIO teardown and the dma_free_coherent() calls, avoid this?

>
>  	if (ndev->phydev)
> -		phy_stop(ndev->phydev);
> +		phy_disconnect(ndev->phydev);
>  	mdiobus_unregister(greth->mdio);
> +	mdiobus_free(greth->mdio);
>
>  	unregister_netdev(ndev);

[Severity: High]
Is it safe to call phy_disconnect() before unregister_netdev()? At this
point ndev->reg_state is still NETREG_REGISTERED and RTNL is not held.

phy_disconnect()->phy_detach()->phy_detach_internal() does:

		hwprov = rcu_dereference_protected(dev->hwprov,
						   lockdep_rtnl_is_held() ||
						   dev->reg_state != NETREG_REGISTERED);

Neither condition holds here. Won't every remove on a CONFIG_PROVE_RCU
kernel produce a suspicious rcu_dereference_protected() usage splat?

The same unlocked section clears dev->hwprov and frees it with
kfree_rcu(). It also sets dev->phydev to NULL and calls
phy_link_topo_del_phy(). All of this can race with RTNL holders.

phy_detach_internal() also drops the attach reference with
put_device(&phydev->mdio.dev). After that, mdiobus_unregister() calls
device_remove() and device_free() on the mdio_map entries, which drops
the last reference and frees the phy_device while the netdev is still
registered.

An ethtool ETHTOOL_GLINKSETTINGS or ETHTOOL_SLINKSETTINGS request goes
through greth_ethtool_ops to phy_ethtool_get_link_ksettings() or
phy_ethtool_set_link_ksettings(). If that request loaded ndev->phydev
under RTNL before it was cleared, could it then use the freed
phy_device?

Before this patch, remove only called phy_stop(). The attach reference
stayed held, so the phy_device was leaked but never freed under a live
user.

Would this order work instead: unregister_netdev() first, then
phy_disconnect(), then mdiobus_unregister() and mdiobus_free(), and
finally the dma_free_coherent() calls?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/BN8PR06MB6177818FBD04A32DAEDFC589A4452%40BN8PR06MB6177.namprd06.prod.outlook.com

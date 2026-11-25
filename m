Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611929;
	b=IfOZrX7TYZsSZSwZ4HaeiExvkPqXOLuW2d7WeZ2vhZJFV6q0ZKPcmsER5dWv4OBliSM1
	 RmadI36IY9WWElj/w5xe86tJjrjuE0P3Pf9vmkK+D/zolMaqg42DYWziTusWwZfMxUimw
	 mZuwvlZ2WcSip5OP/O7XNhbKlLiYk+aIfOmCc/HYcSNTBvrpOt1LWPe8IwuZ0+QUehI0r
	 1AoNTY+kR+6EFWOB1haGCb8h7OqQeU8rxZ09vKi02KayBhRCFLh1dL/eDaUXfbGSkO5P4
	 hmCmMNt4HOx/f5JCz06QhxLABlZgc3NF8E91MKJlGis7xIj4o9mbEHy+NwaqMf+6C9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611929;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8+bHJOXJl3+c5blsq+R9XDMbPhumxE5ufEoErrnoD1g=;
	b=dRGwlfCKzCcTUkvyMdsk25vuPAt7t02EgQgaF25CFhB9TzZETct4Mll7sOC/3HDHimZO
	 21m0k+9M43A2FoCiObCO1LzYaFdYDqBr1v3sXoRE6fK3DaYjStRbUdHPu30i7//eb/PSO
	 Ylg1fVEefutt0Cbk6cXekDj5CMDcMmrgjrkeL8J4F7Ryhl5UEjpu32H/B4GrfqM4fi+8O
	 DFom2ZKzgb7IJTfy9QnDTBkAmEpqSyo0A4N7qgIZZ9KzOpYwwl3x4eI9jzqHYRnMcjMTs
	 NA9YKBy6t9peiQiapGZ6NtwP5ZRDJyWIhtimD2DfUhiBDTEsGOIl/zXH8y6xjg/yPtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZTFFOvt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C4606A32D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZTFFOvt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B630A1F000D1;
	Wed, 25 Nov 2026 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611929;
	bh=8+bHJOXJl3+c5blsq+R9XDMbPhumxE5ufEoErrnoD1g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NZTFFOvtqkxBldu6ewMp4QviLHe/lG47UbDj6Vkg0uADARknRcMH/hQsM3aRlYQRO
	 aJxvsgntxhCruGlAwTYSTWFNAATzKsss9be7f7boXOO4LZ3BlARnS//GDG0tf8G++H
	 SAzt9mg+t/VlYjYSXJ3qYYG+RLoPogVuMzCNLMdjyRSogDf+d7q6YpTEY0Cxz86QHh
	 0Xva2TBTJrOzPApM+SkKUviPkuB6JTrZLSKBswbVg68lVWsj3h1npUa6E+hEEN755W
	 mGxNt2nSou+24zLTmrEPBzCHjcBOsLk/Q5DGs+scaBCp37Kd+W76mfk9MmNJ/PHZyK
	 UNmgrO6QQ5Qdg==
Subject: Re: [PATCH net-next RESEND v4 3/4] microchip: lan865x: enable PHY
 interrupt via virtual IRQ
From: netdev-bot+sashiko@kernel.org
To: parthiban.veerasooran@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Date: Wed, 25 Nov 2026 13:05:28 +0000
Message-ID: <179561192833.3135.495365531706227788@kernel.org>
In-Reply-To: <20261124124930.485323-4-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-4-parthiban.veerasooran@microchip.com>
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

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Setting OA_TC6_PHY_INT moves the LAN865X PHY from polling to
  interrupt mode.
- [Low] Tagging and backport problem.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  lan865x_remove() calls cancel_work_sync(&priv->multicast_work) before…

--

microchip: lan865x: enable PHY interrupt via virtual IRQ

This patch makes lan865x_probe() pass the OA_TC6_PHY_INT quirk flag to
oa_tc6_init(), which turns on the oa_tc6 virtual IRQ for the internal
PHY. phylib then runs in interrupt mode. As a result, CDEN follows PLCA
transitions through lan86xx_config_intr() and lan86xx_handle_interrupt()
instead of the polling-based resync.

> CDEN is synchronized to the live PLCA status when lan86xx_config_intr()
> runs during phy_enable_interrupts(), then tracked on each subsequent
> PLCA transition via lan86xx_handle_interrupt(). This PHY interrupt path
> is critical for keeping CDEN correct across PLCA transitions.
>
> Fixes: 78341049fbcd ("net: phy: microchip_t1s: configure collision detection based on PLCA mode")

[Severity: Low]

Can this patch be backported on its own? It uses OA_TC6_PHY_INT, but at
the baseline include/linux/oa_tc6.h only defines OA_TC6_BROKEN_PHY. The
new flag comes from the prerequisite "net: ethernet: oa_tc6: deliver the
PHY interrupt to phylib", together with the irq_chip, irq_domain and
phy_irq_work code.

That prerequisite has no Fixes: tag and no "Cc: stable # dependency"
annotation. It only says "Prerequisite for ..." in prose.

78341049fbcd is from October 2024 and is in current stable branches.
Stable tooling that picks Fixes: tagged commits could take this patch
without its dependency. lan865x_probe() would then fail to build with
OA_TC6_PHY_INT undeclared.

Would it make sense to either tag the prerequisite as a stable dependency
or drop the Fixes: tag here?

Is the "critical" wording accurate? The earlier commit "net: phy:
microchip_t1s: fix collision detection on PLCA status change" already
added a polling resync for the LAN865X Rev.B entry:

drivers/net/phy/microchip_t1s.c:lan86xx_read_status() {
    ...
	/* When no PHY interrupt is available, phylib polls read_status().
	 * Use the PLCA status from that poll to resync CDEN.
	 */
	mutex_lock(&priv->cden_lock);
	ret = lan86xx_update_cden(phydev);
    ...
}

So this patch seems to cut the resync delay from about one phylib poll
interval down to interrupt latency. It does not appear to close a
correctness hole by itself. Could the wording be toned down?

> diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/net/ethernet/microchip/lan865x/lan865x.c
> index d7e5dfc22396f..bd670c1c5d472 100644
> --- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
> +++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c

[ ... ]

> @@ -348,7 +349,8 @@ static int lan865x_probe(struct spi_device *spi)
>  
>  	netdev->netdev_ops = &lan865x_netdev_ops;
>  
> -	priv->tc6 = oa_tc6_init(spi, netdev, NULL);
> +	tc6_quirks.quirk_flags = OA_TC6_PHY_INT;
> +	priv->tc6 = oa_tc6_init(spi, netdev, &tc6_quirks);

[Severity: Medium]

With OA_TC6_PHY_INT set, phydev->irq becomes valid and phy_polling_mode()
returns false. The periodic CDEN resync in lan86xx_read_status() then
stops. From that point, does CDEN depend on every PHY interrupt getting
through the oa_tc6 virtual IRQ path?

Two error branches in that path are not recovered. The first is in
oa_tc6_phy_irq_work():

drivers/net/ethernet/oa_tc6.c:oa_tc6_phy_irq_work() {
    ...
	handle_nested_irq(tc6->phy_virq);

	ret = oa_tc6_phy_irq_unmask_hw(tc6);
	if (ret)
		dev_err(&tc6->spi->dev, "Failed to unmask PHY interrupt: %d\n",
			ret);
}

The INT_MASK0 read or write here can fail, for example with an SPI
transfer error or -EPROTO from oa_tc6_check_ctrl_read_reply() or
oa_tc6_check_ctrl_write_reply(). PHYINTM then stays set in hardware while
the phy_irq_masked shadow says unmasked.

The second is in oa_tc6_process_extended_status():

drivers/net/ethernet/oa_tc6.c:oa_tc6_process_extended_status() {
    ...
	if (tc6->phy_virq && FIELD_GET(OA_TC6_STATUS0_PHY_INT, value)) {
		ret = oa_tc6_phy_irq_mask_hw(tc6);
		if (ret)
			dev_err(&tc6->spi->dev,
				"Failed to mask PHY interrupt: %d\n", ret);
		else
			schedule_work(&tc6->phy_irq_work);
	}
    ...
}

oa_tc6_phy_irq_mask_hw() can report an error even though its write
reached the device. In that case the worker that would unmask is never
scheduled.

In both cases, unmask_hw only runs again after a PHYINT is delivered.
bus_sync_unlock only runs on genirq enable, disable or request.

Would PSTC interrupts then stop for good, with phylib no longer polling?
lan86xx_update_cden() would not run again until the driver is rebound.

Before this patch, a transient SPI control error only delayed the resync
until the next poll.

>  	if (IS_ERR(priv->tc6)) {
>  		ret = PTR_ERR(priv->tc6);
>  		goto free_netdev;

[Severity: High]

This isn't a bug introduced by this patch, but there is a problem in the
same driver. lan865x_remove() cancels the multicast work before it
unregisters the netdev:

drivers/net/ethernet/microchip/lan865x/lan865x.c:lan865x_remove() {
	...
	cancel_work_sync(&priv->multicast_work);
	unregister_netdev(priv->netdev);
	oa_tc6_exit(priv->tc6);
	free_netdev(priv->netdev);
}

At that point the netdev is still registered and may still be IFF_UP.
lan865x uses the legacy rx-mode path, so __dev_set_rx_mode() calls
ndo_set_rx_mode() synchronously:

__dev_set_rx_mode()
    lan865x_set_multicast_list()
        schedule_work(&priv->multicast_work);

Can a concurrent multicast join or promisc change re-queue the work in
the window between cancel_work_sync() and unregister_netdev() clearing
IFF_UP?

Nothing cancels the work a second time. oa_tc6_exit() frees tc6 and
free_netdev() frees priv. lan865x_multicast_work_handler() would then
dereference priv->netdev and priv->tc6 in freed memory.

remove() runs under device_lock rather than rtnl, so nothing serialises
the two paths. Would moving cancel_work_sync() after unregister_netdev()
close this window?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124124930.485323-1-parthiban.veerasooran%40microchip.com

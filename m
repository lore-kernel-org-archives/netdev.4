Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840345;
	b=q3EivdKPyhhWkQ/vyyvzPxKs+txFAF12VVvkcfE5wh8eI6ocXR9jwPpjFCJZpWu7cwuA
	 aH9FEcvuxYHHzrPHqJJvSsXrs8b7dh1+qTBpkH+MCnEhSEwzfdeYsEyTjHpNRc1xW/BFq
	 lVI3nXhYHD33Zp+segGvvhUyHgSmkySHK6ywP/WvTZCUslhl/hvZfhvieUdFbI3mUpFB/
	 vkefkDwOR0RG21snG17dI6Xbv9B7RT86dP+q4gi1EhQspxYnwz9P5mZrGxp7WHrw/yAzT
	 xI023vjMlstayIZt3EZWLtjQDCAwvduHXOvizCZGLWIkZ0y5PJ1MCLy/rvU2NYdDQfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840345;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NA7m5p2BS5MtFPnOu6/7Z8tb02d7k3X28CUzaYvRLPA=;
	b=sVSGC/gkWmqSHe4DHmtr/7q66cXpH1KTlyShpVtk0xLGQdiI2IyMloH2hRW7En1NEnp/
	 Gpzocdo33RxRaG1QT0gm0BQJ9PQe7Zlo4s4gkWPTYJLlhiG1GWG0Q5onj3Tf317x/SiTr
	 q/fdIpVR0F6Nn4YvS8zCQksu0yadSFs5+hyIkLGw+TQsKF/V50FcSctNPROEeNF6dF5gB
	 1gdjapPJmcoDMa1B45E7UjmNox0Ijn6uJXbPSNrTEuq0i0m40bL/9QIteP+dPoTDYNEw+
	 ACf+uhlUQaC0skOOKR3SJWV5BxQRCGJCbxBpPir5h4hddtBOYrCNTKaxKTpisDj31nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQoNhv2Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC2606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VQoNhv2Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31A61F000C4;
	Mon, 16 Nov 2026 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840345;
	bh=NA7m5p2BS5MtFPnOu6/7Z8tb02d7k3X28CUzaYvRLPA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VQoNhv2YReWBiyIV3ljdT7i/0QBsvkJwtE8FupP6WoF3OoEJ/gQWE/gKh/AAuPng3
	 Yqkp5NDrso7l/cYVkhm1jLRGtcdixthOjhHkZT27//Ja4zT3QwXrADeoYxdLH/AJYf
	 DGFQ6BgQ0zF88RG8ZFPh8BvyE/gCjCAFaJwrA7Z0G2Ac3ZfmCMypBnEbXYeOHDet2e
	 C7xXGEk+TswgNv868seOglzf1gbeo+DjGDp2zwfgTlftpSNk7bp0Qz+atm7gjd3u6v
	 tFczkZ383ENZMPuNBq8GSoedGoQ0c2TGTritqDeidFSPZSab/FOjgwyMTP6K7pET1J
	 poDu/FCE4tILQ==
Subject: Re: [PATCH net-next v8 02/19] net: ethernet: cortina: Keep ports
 bound for shared IRQ
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:44 +0000
Message-ID: <179484034429.3136.3425183655553071974@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-2-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-2-f55bd43e02d3@kernel.org>
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

Critical: 0 · High: 1 (2) · Medium: 0 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In gmac_setup_phy() (drivers/net/ethernet/cortina/gemini.c),
  every NULL return from of_phy_find_device() becomes -EPROBE_DEFER.

Pre-existing issues:
- [High] At this commit, geth_resize_freeq() re-enables
  SWFQ_EMPTY_INT_BIT even when geth_setup_freeq() fails.
- [High] At this commit, geth_resize_freeq() frees and rebuilds the
  shared free queue under RTNL only.
- [Low] The geth_resize_freeq() kernel-doc says it 'gets called at least
  once during probe()', but its only callers are gmac_open() and…

--

net: ethernet: cortina: Keep ports bound for shared IRQ

The patch keeps gemini child ports bound in an IRQ-only mode when no PHY
is described, or when PHY setup or netdev registration fails, so the
shared free queue IRQ on port 1 stays available. It looks up referenced
PHYs explicitly and defers probe until they register. It publishes a
port to the parent only once the port is ready, and the port pointers
are protected by RTNL.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 0b05a15529832..1b959ca853c64 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -359,18 +361,51 @@ static void gmac_adjust_link(struct net_device *netdev)

[ ... ]

>  static int gmac_setup_phy(struct net_device *netdev)
>  {

[ ... ]

> +	} else {
> +		phy_np = of_parse_phandle(dev->of_node, "phy-handle", 0);
> +		if (!phy_np)
> +			return -ENODEV;
> +	}
> +
> +	phy = of_phy_find_device(phy_np);
> +	of_node_put(phy_np);
>  	if (!phy)
> -		return -ENODEV;
> +		return -EPROBE_DEFER;

[Severity: High]
Can a NULL return from of_phy_find_device() here be permanent instead
of transient?

Say the MDIO bus has registered, but the PHY at that address never
answered. __of_mdiobus_parse_phys() logs the error, skips the PHY and
still registers the bus:

drivers/net/mdio/of_mdio.c:__of_mdiobus_parse_phys() {
    ...
		if (rc == -ENODEV)
			dev_err(&mdio->dev,
				"MDIO device at address %d is missing.\n",
				addr);
    ...
}

The same thing happens if the phy-handle target is not a PHY, or if its
bus driver is not built. In all of these cases no phy_device will ever
show up, but gemini_ethernet_port_probe() treats the result as a
deferral:

	ret = gmac_setup_phy(netdev);
	if (ret) {
		dev_err_probe(dev, ret, "PHY init failed\n");
		if (ret == -EPROBE_DEFER)
			goto unprepare;
		goto irq_only;
	}

The port then never reaches gemini_port_publish(). That leaves
geth->port0 or geth->port1 NULL and geth->initialized false, and the
sibling's gmac_open()->geth_resize_freeq() returns -ENODEV on every
open:

	if (!geth->initialized || !geth->port0 || !geth->port1)
		return -ENODEV;

Doesn't this mean a PHY that is described but absent on one port still
disables the working sibling? The commit message says this should no
longer happen ("so an unusable interface does not disable its
sibling").

gemini-ssi1328.dts and gemini-wbd222.dts both use phy-handle on
ethernet-port@1. On those boards, an unpopulated or unresponsive PHY1
would leave no working Ethernet, and the port would stay on the deferred
probe list for good. fw_devlink does not parse phy-handle, so nothing
puts a limit on the deferral.

Could the code tell a not-yet-probed MDIO bus apart from a missing PHY,
for example by checking whether the PHY node's parent bus has
registered?

[ ... ]

> @@ -1051,10 +1086,17 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
>  	u32 en;
>  	int ret;
>  
> +	ASSERT_RTNL();
> +
> +	/* The software free queue interrupt is routed through port 1. */
> +	if (!geth->initialized || !geth->port0 || !geth->port1)
> +		return -ENODEV;
> +

[Severity: Low]
This isn't a bug introduced by this patch, but the kernel-doc above
geth_resize_freeq() still says:

 * This gets called at least once during probe() so the device queue gets
 * "resized" from the hardware defaults.

The only callers are gmac_open() and gmac_set_ringparam(). The doc also
doesn't mention the new ASSERT_RTNL() requirement or the -ENODEV return.

A later patch in the series rewrites it to "This is called when a port
is opened or its RX ring size changes."

[ ... ]

> @@ -1076,7 +1117,7 @@ static int geth_resize_freeq(struct gemini_ethernet_port *port)
>  	new_order = min(15, ilog2(new_size - 1) + 1);
>  	dev_dbg(geth->dev, "set shared queue to size %d order %d\n",
>  		new_size, new_order);
> -	if (geth->freeq_order == new_order)
> +	if (geth->freeq_ring && geth->freeq_order == new_order)
>  		return 0;
>  
>  	spin_lock_irqsave(&geth->irq_lock, flags);

[Severity: High]
This is a pre-existing issue and was not introduced by this patch.
Further down in geth_resize_freeq(), SWFQ_EMPTY_INT_BIT is turned back
on even when geth_setup_freeq() fails:

	geth->freeq_order = new_order;
	ret = geth_setup_freeq(geth);
	...
	spin_lock_irqsave(&geth->irq_lock, flags);
	en |= SWFQ_EMPTY_INT_BIT;
	writel(en, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
	spin_unlock_irqrestore(&geth->irq_lock, flags);

	return ret;

If setup fails, freeq_ring is left NULL while freeq_pages still points
at freed memory. Can gemini_port_irq_thread()->geth_fill_freeq() then
dereference the freed array and call page_ref_add() on stale pages?

This looks like it is addressed later in the series by "net: ethernet:
cortina: Drain free queue IRQ before resize". That commit enables the
source only when setup succeeds, and geth_setup_freeq() and
geth_cleanup_freeq() set freeq_pages and freeq_ring to NULL.

[Severity: High]
This is also a pre-existing issue and not something added by this patch.
In geth_resize_freeq(), only RTNL serializes the queue teardown:

	/* Drop the old queue */
	if (geth->freeq_ring)
		geth_cleanup_freeq(geth);

There is no synchronize_irq() here, and freeq_lock is not held. If
gemini_port_irq_thread() was already woken, could it run
geth_fill_freeq() on the freed freeq_pages and freeq_ring? Could it
then re-arm the source while the queue is being torn down?

	irqmask |= readl(geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);
	writel(irqmask, geth->base + GLOBAL_INTERRUPT_ENABLE_4_REG);

The same later commit, "net: ethernet: cortina: Drain free queue IRQ
before resize", wraps the rebuild in disable_irq(geth->port1->irq) and
enable_irq(). That drains both the hard and the threaded handler.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org

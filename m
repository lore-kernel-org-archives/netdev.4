Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480860;
	b=clkUP98GJfUkg2et0KL76//YFEzYSgDnzcG5uyZyIsCMrTw8IH3tLNhChvTzxXWl7sRT
	 aoVXHEJB4AwuCZA6GjyoNn2fKBKvEF8w/zRTa6JA/Ck01eXQ8Ybd8pPmlI7Oh+rg0pDV1
	 nL9+xdKfkB46cnc7Ah3JENHt+Qq8mpZzTsi6WaUQBFdmc7sYh0+xx5gkLcDbam5XMkD1u
	 D8TyMUz53OyUP48fngtIfD/cCyhT44g2fq55Tw31jbAya91uiHhZDB0LruyGh08CYNBYe
	 gfsLdqR5rkloIfh9zPKcTh6mRtmPFeiJ/ifD6qPVWJBHmPrnUSHehtMJbpwYnI6ar4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480860;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GQ2l0lAcStEFkwyCF6a+mLahg3rjU7KyaIT0/szFxi0=;
	b=fiPEwZBJL0OetLp5Yt8wu9m8ogB2TEOLqyFpqXHQrQWT3STm18S7YOzyrTsUv+B3Dfs3
	 H5dRS5rrRIXIa6n1geGKN5kN7F7e/t3388hUFDPsS/Raq+DC3T9UlcY4tnzpyvA5jLbwg
	 5WTCks0Q1gx0Engu8bNg9s1T8cQaxg+VSl5kDPDLh/DWBsl3iICt8vV9qYM+O89OOPR3E
	 8XF23NCOpsiX0iLMvAeidfnJi1kV3edQ7qyQNoKghQRMswlVyMlVylRZn5FFsu4Ao3xI8
	 RfWLfQO6YsCXy6pS26wIA1AcSoqcgXbW9ydx2YsQjr+82Wofw99KyufjBhYC+jYJcDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXi0AxoE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1850606A6BC;
	Tue, 24 Nov 2026 00:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZXi0AxoE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A801F01574;
	Tue, 24 Nov 2026 00:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480859;
	bh=GQ2l0lAcStEFkwyCF6a+mLahg3rjU7KyaIT0/szFxi0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZXi0AxoEBJEMvlvpV4hETWSX5Vess1KdAnxGknUeOjimlPqoM7zVfhxEIzkKO/U+4
	 4JvoN0lXvsth24i/VMQ8jjVhazjSK7c7gAaISm2DMTiGqakw5OW490bCwrhl9FgiyY
	 3fojlsUu/F9bu+lirmWL4ioBr06rmc6DCJgYaXnHngGLdqXjZT7V1DLhbuNQ6Kpjc9
	 pDqGdoG0NNolQWy2hwvlCdBV981iTGQJveywLiEMIElxtSJPQqOVtPWhTXYLKsOcmd
	 grkZHDpVtUDA9jQ879yZLucgFuTTtBf+QSFm0kubS8swZjQurD4GsxUeG6pYCNA0Pr
	 hdXH71h+59j1g==
Subject: Re: [PATCH net] net: bgmac: unregister the fixed PHY on probe failure
 and removal
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, rosenp@gmail.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:58 +0000
Message-ID: <179548085846.3135.4498796165187686052@kernel.org>
In-Reply-To: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
References: <20261120003044.2366432-1-florian.fainelli@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new bgmac_phy_disconnect() reads phydev after
  phy_disconnect() may have freed it, which is a use-after-free on the…
- [Medium] bgmac_phy_disconnect() picks the release method from the
  device tree, not from how the connected PHY was registered.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but
  of_phy_get_and_connect() in drivers/net/mdio/of_mdio.c can leak a…

--

net: bgmac: unregister the fixed PHY on probe failure and removal

This patch adds bgmac_phy_disconnect(). It disconnects the PHY and then
releases any fixed PHY, using of_phy_deregister_fixed_link() for DT
fixed-link nodes and fixed_phy_unregister() otherwise. The helper is used
on the bgmac_enet_probe() error path and in bgmac_enet_remove(). Also,
bgmac_phy_connect_direct() now unregisters its fixed PHY when
phy_connect_direct() fails.

> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
> index 9ef7307edd41e..54092bfacd189 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c

[ ... ]

> @@ -1482,6 +1484,22 @@ int bgmac_phy_connect_direct(struct bgmac *bgmac)
>  }
>  EXPORT_SYMBOL_GPL(bgmac_phy_connect_direct);
>  
> +/* Disconnect the PHY and release a fixed PHY registered for the connection. */
> +static void bgmac_phy_disconnect(struct bgmac *bgmac)
> +{
> +	struct device_node *np = bgmac->dev->of_node;
> +	struct phy_device *phydev = bgmac->net_dev->phydev;
> +
> +	if (!phydev)
> +		return;
> +
> +	phy_disconnect(phydev);
> +	if (np && of_phy_is_fixed_link(np))
> +		of_phy_deregister_fixed_link(np);

[Severity: Medium]
Does this leak the fixed PHY created by bgmac_phy_connect_direct() when
the DT node also satisfies of_phy_is_fixed_link()?

The branch is picked from the DT node, not from how the connected PHY was
registered. bgmac_phy_connect_direct() registers its PHY with no of_node:

	phy_dev = fixed_phy_register(&fphy_status, NULL);

So of_phy_deregister_fixed_link(np) can't find it through
of_phy_find_device(np) and returns without a warning. Because the fallback
is an else-if, fixed_phy_unregister() never runs.

There seem to be two ways to end up here. In bgmac-platform.c,
bgmac_probe() picks bgmac_phy_connect_direct() whenever phy-handle is
missing:

	phy_node = of_parse_phandle(np, "phy-handle", 0);
	if (phy_node) {
		of_node_put(phy_node);
		bgmac->phy_connect = platform_phy_connect;
	} else {
		bgmac->phy_connect = bgmac_phy_connect_direct;

brcm,amac.yaml references ethernet-controller.yaml, so a node with a
fixed-link child or a managed property and no phy-handle passes the
schema.

In bgmac-bcma.c, bcma_phy_connect() falls back to
bgmac_phy_connect_direct() when of_phy_get_and_connect() returns NULL. One
case is a fixed-link node without phy-mode. Another is of_phy_connect()
failing after of_phy_register_fixed_link() has already succeeded. In that
second case, teardown would remove the stale, unconnected DT fixed PHY and
leak the connected direct one.

None of the in-tree DTs seem to hit this today. The gmac nodes in
bcm-ns.dtsi and bcm53573.dtsi have both phy-mode and fixed-link. Still,
this is the same leak the commit message describes.

Could the release method be based on the phydev itself? For example,
call of_phy_deregister_fixed_link() only when the phydev's fwnode matches
np, and otherwise call fixed_phy_unregister() for any pseudo fixed link.

> +	else if (phy_is_pseudo_fixed_link(phydev))
> +		fixed_phy_unregister(phydev);

[Severity: High]
Can phy_is_pseudo_fixed_link(phydev) read freed memory here?

On the bcma remove path, bgmac_remove() unregisters the MDIO bus before
it calls bgmac_enet_remove():

drivers/net/ethernet/broadcom/bgmac-bcma.c:bgmac_remove() {
	...
	bcma_mdio_mii_unregister(bgmac->mii_bus);
	bgmac_enet_remove(bgmac);
	...
}

mdiobus_unregister() calls device_remove() and then device_free() on the
PHY at bgmac->phyaddr, which drops the registration reference. After that,
the only reference left is the get_device() taken in phy_attach_direct().

The call chain is then:

bgmac_enet_remove()
  bgmac_phy_disconnect()
    phy_disconnect()
      phy_detach()
        phy_detach_internal()
          put_device(&phydev->mdio.dev)   <- can free phydev

phy_detach_internal() itself has a comment warning that "The phydev might
go away on the put_device() below".

The first condition is false when np is NULL (BCM47xx without DT). It is
also false on DT boards whose gmac uses phy-handle and has no fixed-link.
In both cases the else-if reads phydev->is_pseudo_fixed_link from the
freed object. If that stale bit reads as set, fixed_phy_unregister() runs
on freed memory.

Before this patch, bgmac_enet_remove() did not touch phydev after
phy_disconnect().

Would it work to evaluate phy_is_pseudo_fixed_link(phydev) and the DT
check before calling phy_disconnect()? Separately, could bgmac_remove() be
reordered so that bgmac_enet_remove() runs before
bcma_mdio_mii_unregister()?

> +}
> +
>  struct bgmac *bgmac_alloc(struct device *dev)
>  {
>  	struct net_device *net_dev;
> @@ -1575,7 +1593,7 @@ int bgmac_enet_probe(struct bgmac *bgmac)
>  	return 0;
>  
>  err_phy_disconnect:
> -	phy_disconnect(net_dev->phydev);
> +	bgmac_phy_disconnect(bgmac);
>  err_dma_free:
>  	bgmac_dma_free(bgmac);

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. Is the DT
fixed PHY leaked when bgmac_phy_connect() fails and probe jumps to
err_dma_free?

If of_phy_connect() fails, of_phy_get_and_connect() returns NULL without
deregistering the fixed link it just registered:

drivers/net/mdio/of_mdio.c:of_phy_get_and_connect() {
	...
	if (of_phy_is_fixed_link(np)) {
		ret = of_phy_register_fixed_link(np);
	...
	phy = of_phy_connect(dev, phy_np, hndlr, 0, iface);

	of_node_put(phy_np);

	return phy;
}

In bgmac-platform.c, platform_phy_connect() turns that into -ENODEV.
bgmac_enet_probe() then takes the err_dma_free path and skips
bgmac_phy_disconnect(). Calling it wouldn't help anyway, because
net_dev->phydev is NULL at that point.

In bgmac-bcma.c, bcma_phy_connect() then falls back to phy_connect() or
bgmac_phy_connect_direct(). That can leave two fixed PHYs registered.

This should be rare: of_phy_connect() on a freshly registered fixed PHY
mostly fails only on allocation errors. Other users of this helper, such
as ftgmac100 and gemini, don't clean up on this failure either.

> err_out:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120003044.2366432-1-florian.fainelli%40broadcom.com

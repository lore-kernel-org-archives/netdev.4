Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544990;
	b=hgLAa94PkgRirKeoGlw3WKel50xiPdau1CLTBc2KNXLKcsQ0u2e1LyNRQ3NnNWoWM+mD
	 S0WfWQOUm6I4Va3n2QTaNr6sfAvy2ruLiCOjrRQTNPBXDfW80b/pV+vcqUlYc0nz/OkUB
	 4d9WGwW+PB1Ix6xDtcvMJglFAp8l6KAJ/qG1OO4YKlrhdT0zZpQScd3UVlZcWmsve0z+n
	 C0sZ2EdBs7joRgFgStnfjbsZhl6e53r4wbMcLkR3kVeL3KJDdzJ8CmCBvSFPKmq/LBQq6
	 wktj1SxvYHFn7E1hIBYljTWYXMcUHoUxJxx5ekr0oREK8RZF5QFph9QjncV3O+5mHuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544990;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uvYXo1NJZ7jtDItBpveJ0v8RtdeC1Qmy4w+lOr2nbiQ=;
	b=TjxRHlwXhYhR8IzNVW57L7GyonednfE2jiJP96vC0+9Va7XXc1JEwQ34NhYToKqeMynf
	 itetg8e5pgHpjx0GZPmhN55K0BJg+OIcEMbieX1u/vxT8FS1mtGcfgNLqWDE31uSCEkqZ
	 25C0MVnZmNHjHX4Njy7IoMAhy9YA/gCCxe7URe3Eal0i5TbE0e51Z51aROvltSEm6XJe1
	 YkWzPubm2ORlWUtBxelMidUfFV2eUm3+vVshNlWaD5xrwuLg7tfYDEdKRS2SHcxb2pkTi
	 cjTk+0fs+pTBAliCIrSWBvdadQPqjNUGZOZ+BYhdxz4PHIkTvpIwNYM7cqStZ9vaMBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDyIWWNT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727DD606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDyIWWNT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CEA1F000C0;
	Tue, 24 Nov 2026 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544990;
	bh=uvYXo1NJZ7jtDItBpveJ0v8RtdeC1Qmy4w+lOr2nbiQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oDyIWWNTrE7mNaVlu+wkp6GTdeQ8PVuK4I5gySSSQo9bETMwFDut815mfoJ4cf1Qr
	 dWydAYNErdR8/GF+5kspzxpvsTpxHugYSuIGbnzGPKEVCn90Ox+BQnhyJJY+kk60s2
	 LsM+Pm9PrTnPgIH93aTKIWJdljFlRep6kR50k+cVdsm3QuFHK1YxJQUXdM4wLOml/c
	 OMLVvYAf7QHp0JIfEI9fQJhiUa8BJ5J/reZJzU3PjnpDmBcQODnccWAGP61P4wHCxS
	 SIZQeHU6a0xoXN1Zmr53ZoRsxK1jSih1OClbfxKKjtwExgn8hB2vViMyRLmsE7cF1A
	 qexjXdg4WdhVQ==
Subject: Re: [PATCH net-next v9 02/14] net: ethernet: cortina: Keep ports
 bound for shared IRQ
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:48 +0000
Message-ID: <179554498899.3135.2703515763788273993@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-2-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-2-298671d799d5@kernel.org>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In the commit "net: ethernet: cortina: Keep ports bound for
  shared IRQ", gmac_setup_phy()…
- [Low] The commit "net: ethernet: cortina: Keep ports bound for shared
  IRQ" fixes user-visible bugs on in-tree boards but has no Fixes: tag…

--

net: ethernet: cortina: Keep ports bound for shared IRQ

This patch keeps Gemini ethernet child ports bound as IRQ-only ports when
no PHY is described or PHY setup fails. That keeps the shared free queue
interrupt routed through port 1 available. Probe is deferred until
referenced PHYs register, and ports are published to the parent under
RTNL only once their setup is complete.

> The software free queue interrupt is routed through port 1 even on
> boards which only connect a PHY to port 0. Since PHY setup was moved
> into probe, the PHY-less port fails to bind and releases the threaded
> handler needed by the shared queue.
>
> Publishing the port before PHY setup also leaves a dangling parent pointer
> when probe fails and devres frees the netdev private data. Opening the
> sibling can then dereference freed memory.

[Severity: Low]
This describes a use-after-free and a lost SWFQ interrupt handler. Both
can happen on in-tree boards such as gemini-verbatim-s08v1901-d1.dts,
where ethernet-port@1 has no phy-mode and no phy-handle.

Before this patch, gemini_ethernet_port_probe() set geth->port1 before
gmac_setup_phy() failed with -ENODEV. Devres then freed the port, and
opening eth0 dereferenced the stale pointer in geth_resize_freeq():

    other_netdev = geth->port1->netdev;

Should this have a Fixes: tag and Cc: stable so stable backporters pick
it up?

The change behind "Since PHY setup was moved into probe" looks like
3e813d61401a ("net: gemini: Clean up phy registration"). The ordering
that leaves the dangling pointer goes back to 4d5ae32f5e1e ("net:
ethernet: Add a driver for Gemini gigabit ethernet").

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index f198e535f1a00..4f27a48908b1a 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -359,18 +361,51 @@ static void gmac_adjust_link(struct net_device *netdev)

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

[Severity: Medium]
Can this defer forever when the phy-handle target never gets a
phy_device? of_phy_find_device() returns NULL both for a PHY that is
slow to appear and for one that never will. Some examples of the second
case:

  - the PHY node referenced by phy-handle has status = "disabled", and
    of_mdiobus_register() only walks available children
  - the PHY does not answer at its address, so of_mdiobus_register()
    logs "MDIO device at address %d is missing." and skips it
  - the MDIO bus driver (such as mdio-gpio) is not built

In gemini_ethernet_port_probe(), a deferral skips the IRQ-only fallback:

	ret = gmac_setup_phy(netdev);
	if (ret) {
		dev_err_probe(dev, ret, "PHY init failed\n");
		if (ret == -EPROBE_DEFER)
			goto unprepare;
		goto irq_only;
	}

so gemini_port_publish() never runs for this port. fw_devlink does not
parse phy-handle, and the deferred probe timeout does not override a
driver's own -EPROBE_DEFER. The port is therefore retried indefinitely.

Opening the sibling then fails every time:

gmac_open()
  geth_resize_freeq()
    if (!geth->initialized || !geth->port0 || !geth->port1)
        return -ENODEV;

gmac_open() treats this as fatal ("could not resize freeq", goto
err_stop_phy), so the sibling interface never comes up.

The commit message says ports stay bound when PHY setup "fails
permanently, so an unusable interface does not disable its sibling".
Isn't a PHY that never registers that kind of permanent failure? In
this case the unusable port still disables its sibling.

Could something like driver_deferred_probe_check_state(), or a fallback
to irq_only after the deferred probe timeout, handle the permanent case
here? The behaviour looks the same at the end of the series:
gmac_setup_phy() still returns -EPROBE_DEFER and the probe still takes
goto unprepare.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602213;
	b=C5M+Juf0ntaaL/6Mw1yvBZo6Dmwn4b1+SCIkBH51I0NWNWnEnhxV5lhDNE7ppuwgW3Vh
	 HIauc0z0l4n1slEE8QYFKnbOzPx6Vt27phHSaeFX2I/pWHLuFuAZdca3d57F1/ROkDrGd
	 q1rUDsTKfVqsZCeA1R5Mcl0nK49VtNS2PrxX1g0NI6AeR9iF7tT1WuNTLkflVybtD09mH
	 mmcWXV8w1B7ZyLuo0NAiJ+2dahLKbYbvbX5vxKqhhk04l3tOhD1D1fyjEOVfeBagf0oB6
	 pTjBTp2A0i1eY38PKjN5TIv1zrpgp6ZA+7gxhCTYiQXOgGbKwGXFULd4fHVPEJY3hSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602213;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vSO2kSZ5BAnSfO8SsZ8Q0Er3xi8mKADORooud8DCyG0=;
	b=tOYBqDpy+CwDsJj3k/t303QF3G9zCgJK+MWmnvb1mz5V2sSG1zBwu5/2XCYnDdg/1ere
	 371dFwXPIOMFihWAdA7WXXMYqyrDnHW7BNbmJ77g5XQ7BQYzbKmZW7gmOt9SGiC0pN/aq
	 nZfHfB/bT6qy2wrdA127bkmsPFQDR8bg0jEtWiJzWEA+0Zu81AmVitrAPbKW54Pf3T3oq
	 yAwbfcRswjxq9NLX3UFGk0nm/ZVvjl40/rX/tmARBG4GT2pfkFfVKYd9qgNZSt1jGPVPK
	 hhxV9jVu9y25RLLnK3ODYamEky9BtKhkj70waiJ0jHP46OuNz3KC4ISFHDmMThYaLxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X5/YCjea";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A200F606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X5/YCjea
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1401F000CA;
	Wed, 25 Nov 2026 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602212;
	bh=vSO2kSZ5BAnSfO8SsZ8Q0Er3xi8mKADORooud8DCyG0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X5/YCjeanin839K0nmvd1qm5OB7arlXb5UBuwicRI7BgvxSWFzlfu5lDad3TyTDig
	 yj+y0Wyyj17VHE5tePYBXG4dI0Wyr5g8pLArZ3r8hamBxr6bbI2B0sY7w0OBJ4hAJY
	 5wy7tOKFfgx3YsCfqbc0SAa/ZvL1IyaxD3PI/soyPx1f4qmDoQENgA1Gpb+9Eyd5hW
	 wxN6x9btPFqa+825BY2z+2QosiVmK+UJcC+XOdFFLChREjdVFnI5QuhwF1u5cWADXI
	 UFsUdvAUgnu8zlsn1JO67TI2NhQcZqlkKqXazCmFqr/2RKiFrH18vvDF+VlIauEhtO
	 Hy1rJrG6xIuNA==
Subject: Re: [PATCH net-next 2/2] net: dsa: realtek: rtl8365mb: offload ETS
 strict priority scheduling
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linusw@kernel.org, luizluca@gmail.com,
 alvin.sipraga@analog.com, andrew@lunn.ch, olteanv@gmail.com,
 netdev@vger.kernel.org, kernel@pengutronix.de
Date: Wed, 25 Nov 2026 10:23:31 +0000
Message-ID: <179560221157.3135.10940899213423821559@kernel.org>
In-Reply-To: <20261124-rtl8365mb-ets-strict-v1-2-6ab01ad545c8@pengutronix.de>
References: <20261124-rtl8365mb-ets-strict-v1-2-6ab01ad545c8@pengutronix.de>
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

- [Medium] rtl83xx_port_setup_tc() / rtl83xx_setup_tc_ets_replace()
  (drivers/net/dsa/realtek/rtl83xx-qos.c) never reads p->priomap and…
- [Low] In rtl83xx_port_setup_tc() (drivers/net/dsa/realtek/rtl83xx-
  qos.c), the TC_ETS_STATS reply decides whether a qdisc is offloaded…
- [Low] The driver writes to the kernel log with no rate limit when a
  user's tc configuration is refused: - rtl83xx_setup_tc_ets_replace()…
- [Low] rtl83xx_setup_tc_ets_restore_wfq()
  (drivers/net/dsa/realtek/rtl83xx-qos.c) sets priv->ets_handle[port] =…

--

net: dsa: realtek: rtl8365mb: offload ETS strict priority scheduling

This commit adds ETS qdisc offload to rtl8365mb user ports. A root ets
qdisc with one strict band per queue moves the port from the default
equal-weight WFQ to strict priority, and deleting the qdisc restores WFQ.
Weighted bands are refused, and any priomap is accepted but not applied.

> diff --git a/drivers/net/dsa/realtek/rtl83xx-qos.c b/drivers/net/dsa/realtek/rtl83xx-qos.c
> index f294222987eff..388013291d502 100644
> --- a/drivers/net/dsa/realtek/rtl83xx-qos.c
> +++ b/drivers/net/dsa/realtek/rtl83xx-qos.c

[ ... ]

> @@ -208,3 +209,115 @@ int rtl83xx_port_set_apptrust(struct dsa_switch *ds, int port, const u8 *sel,
>  					   ARRAY_SIZE(trust));
>  }
>  EXPORT_SYMBOL_NS_GPL(rtl83xx_port_set_apptrust, "REALTEK_DSA");
> +
> +static int
> +rtl83xx_setup_tc_ets_replace(struct dsa_switch *ds, int port,
> +			     struct tc_ets_qopt_offload_replace_params *p)
> +{
> +	struct realtek_priv *priv = ds->priv;
> +	unsigned int nq = ds->num_tx_queues;
> +	int i;
> +
> +	/* The qdisc must have one band per queue. */
> +	if (p->bands != nq) {
> +		dev_err(priv->dev, "port %d: ETS must configure all %u bands\n",
> +			port, nq);
> +		return -EOPNOTSUPP;
> +	}

[Severity: Low]
Should these prints be ratelimited?

This dev_err() fires on every refused root ets REPLACE. So does the
"ETS weighted bands are not supported" one below. While hw-tc-offload is
on, sch_ets sends REPLACE from every ets_init() and ets_change(). A loop
like this can therefore fill dmesg without bound:

    tc qdisc change dev swpN root ets bands 4 ...

Every refused REPLACE also goes through
rtl83xx_setup_tc_ets_restore_wfq(). That function adds another dev_err()
if the register write fails.

DSA user netdevs are not netns-local. Anyone with CAP_NET_ADMIN in a
netns that owns the port can trigger this. ksz_tc_ets_validate() uses
the same unratelimited pattern, so this is minor.

Since tc_ets_qopt_offload has no extack, would dev_err_ratelimited() or a
once-only print be a better fit here?

> +
> +	/* Only strict bands can be offloaded. */
> +	for (i = 0; i < p->bands; i++) {
> +		if (p->quanta[i]) {
> +			dev_err(priv->dev, "port %d: ETS weighted bands are not supported\n",
> +				port);
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	/* The switch does not use the priomap. */
> +	return priv->ops->qos_set_port_sched(priv, port, nq, true);
> +}

[Severity: Medium]
Can this report offload for configurations the hardware does not
implement?

Only p->bands and p->quanta[] are checked here. p->priomap is never read,
and the band order is never compared with the order the hardware uses.
Later, TC_ETS_STATS in rtl83xx_port_setup_tc() returns 0 for the stored
handle, so qdisc_offload_dump_helper() sets TCQ_F_OFFLOADED.

In sch_ets, band 0 is the highest priority strict band. The default
priomap sends every priority to the last band:

net/sched/sch_ets.c:ets_qdisc_change() {
    ...
	memset(priomap, nbands - 1, sizeof(priomap));
    ...
}

The hardware maps internal priority to tc, and tc to qid through
rtl8365mb_qos_tc_to_qid(). In strict mode it serves the higher qid first.
The only priomap it actually implements is prio i -> band nq - 1 - tc(i).

For example, with this command the software qdisc gives no
prioritisation, because every priority goes to band 7:

    tc qdisc add dev swpN root ets bands 8 strict 8

The hardware still applies strict priority by internal priority. With
"priomap 0 1 2 3 4 5 6 7", the software order is the reverse of the
hardware order. In both cases tc shows the qdisc as offloaded.

Other TC_SETUP_QDISC_ETS implementers handle the priomap:

- ksz_tc_ets_add() programs priomap[] into KSZ9477_PORT_MRI_TC_MAP. It
  also returns -EOPNOTSUPP for TC_ETS_STATS.
- lan966x_ets_add() and the sparx5 offload reject any priomap except
  priomap[i] == 7 - i.
- airoha checks the priomap against its fixed layout.
- mlxsw programs the priomap.

Is the comment "The switch does not use the priomap." accurate? The
backend has a programmable internal-priority to qid table.
rtl8365mb_qos_qmap_init() fills it through rtl8365mb_qos_set_qmap_qid().
That is the same kind of map ksz drives from the priomap.

Would it be better to program that table from priomap[]? The other option
is to reject priomaps and band orders that do not match the fixed
hardware mapping.

The commit message also says:

    The patch uses ets, not prio. The hardware picks strict priority or
    WFQ per queue, and ets sets the type per band.

Every band with a quantum is refused, so the only accepted configuration
is all-strict, which is what prio expresses. Does this justification only
hold for future work?

> +
> +/* Forget the offloaded ETS qdisc of @port and put the port back on WFQ */
> +static int rtl83xx_setup_tc_ets_restore_wfq(struct dsa_switch *ds, int port)
> +{
> +	struct realtek_priv *priv = ds->priv;
> +	int ret;
> +
> +	priv->ets_handle[port] = 0;
> +
> +	ret = priv->ops->qos_set_port_sched(priv, port, ds->num_tx_queues,
> +					    false);
> +	if (ret)
> +		dev_err(priv->dev, "port %d: failed to restore WFQ: %pe\n",
> +			port, ERR_PTR(ret));
> +
> +	return ret;
> +}

[Severity: Low]
What state is the port left in if qos_set_port_sched() fails here?

ets_handle[port] is cleared before the call, and it stays cleared even if
the call fails. rtl8365mb_qos_write_port_sched() programs one queue at a
time and returns at the first error:

drivers/net/dsa/realtek/rtl8365mb_qos.c:rtl8365mb_qos_write_port_sched() {
    ...
	for (tc = 0; tc < num_queues; tc++) {
		...
		if (!strict) {
			ret = regmap_write(priv->map, wreg, weight);
			if (ret)
				return ret;
		}

		ret = rtl8365mb_qos_regmap_update_field(priv, reg, mask, qtype);
		if (ret)
			return ret;
	}
    ...
}

If an SMI/MDIO access fails partway through, some queues end up WFQ and
the rest stay strict. Consider this sequence:

1. qdisc A is offloaded, and the port is strict.
2. A tc qdisc change on A fails validation. restore_wfq() runs, and a
   register access fails midway. ets_handle[port] is now 0.
3. tc qdisc del sends TC_ETS_DESTROY with handle A.
   rtl83xx_port_setup_tc() then returns early:

	if (ets->handle != priv->ets_handle[port])
		return 0;

The port keeps a mixed strict/WFQ scheduler with no ETS qdisc present.
It only gets back to WFQ after another strict offload and its DESTROY, or
after a re-probe through rtl8365mb_qos_sched_init().

Would it make sense to keep the record until the restore succeeds, so
that the later DESTROY retries it?

> +
> +int rtl83xx_port_setup_tc(struct dsa_switch *ds, int port,
> +			  enum tc_setup_type type, void *type_data)
> +{

[ ... ]

> +	switch (ets->command) {
> +	case TC_ETS_REPLACE:

[ ... ]

> +		priv->ets_handle[port] = ets->handle;
> +
> +		return 0;
> +
> +	case TC_ETS_DESTROY:

[ ... ]

> +		 * With hw-tc-offload off, sch_ets sends no DESTROY, so the
> +		 * port stays strict.
> +		 */
> +		if (ets->handle != priv->ets_handle[port])
> +			return 0;
> +
> +		return rtl83xx_setup_tc_ets_restore_wfq(ds, port);
> +
> +	case TC_ETS_STATS:
> +		/* Report the qdisc as offloaded. tc_ets_qopt_offload carries
> +		 * no extack, so this mark is the only sign in tc that the
> +		 * offload was accepted. The stats stay the software ones. They
> +		 * count only what the host sends on this port, not traffic
> +		 * the switch forwards.
> +		 */
> +		return ets->handle == priv->ets_handle[port] ? 0 : -EOPNOTSUPP;

[Severity: Low]
Can a stale ets_handle[port] mark a qdisc as offloaded that the driver
never validated?

ets_handle[port] is only cleared by a matching DESTROY or by a failed
REPLACE. ets_offload_change() and ets_offload_destroy() both return early
when !tc_can_offload(dev). DSA user ports also have no ndo_set_features
hook to resync this state when NETIF_F_HW_TC is turned back on. Consider
this sequence:

1. With offload on:
       tc qdisc add dev swpN root handle 1: ets bands 8 strict 8
   ets_handle[port] becomes 1:0, and the port is strict.
2. ethtool -K swpN hw-tc-offload off
3. tc qdisc del dev swpN root
   No DESTROY is sent, so ets_handle[port] stays 1:0.
4. tc qdisc add dev swpN root handle 1: ets bands 8 quanta 1500 ...
   No REPLACE is sent, so the driver never sees this configuration.
5. ethtool -K swpN hw-tc-offload on, then tc qdisc show:
   ets_offload_dump()->qdisc_offload_dump_helper() sends TC_ETS_STATS
   with handle 1:0. It returns 0, so TCQ_F_OFFLOADED is set.

tc then marks a weighted qdisc as offloaded, although REPLACE would have
refused it with -EOPNOTSUPP. The hardware still runs the old strict
setup. The same happens after a tc qdisc change on 1: while offload is
off.

The commit message and the DESTROY comment do note that the port may not
follow tc while hw-tc-offload is off. This false offloaded mark, though,
contradicts the STATS comment that it is "the only sign in tc that the
offload was accepted". Is that intended?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-rtl8365mb-ets-strict-v1-0-6ab01ad545c8%40pengutronix.de

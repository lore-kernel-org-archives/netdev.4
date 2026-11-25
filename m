Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597111;
	b=nmItuHcuPappx3TzFuOwCW0vLevBgRyAk4MlcuNWQ9bbRpptzNlkdYkM1aXniw+zg8Iw
	 lKdxUMlEpK4Utf3HnTsLCmO6gU1e+tBxplWgmrWDBDnNA/eEwp6/F+8Jb44LHxa7YGMRB
	 k0VaUEO4wDYlRrdmB1xcCF0/PYLfw+Dfs9CNnfuRRph0tGeWhMhjef9Um9PSy0LN6W0tF
	 YnewVa40m7W3xZbDGJKi0QHM/LHgtwe4e3X7FlWmrNHe9kHDvqcrIDK+XxO5qlpIxQlAx
	 WlElOMJP6g41GmMgNA82OR4AZBaSaNIVc2sAhXu4zyKPnompo3Er6XASL2UszgbzVfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597111;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vEqFFBWX6b+wkozEcpfZ8vGlVzN4LPqH2KN4v/pkMPg=;
	b=lM4QBjo5nEvwsDlHLW8I+6J4oRO4UROaZ5AycSYiz7Arfz37iDbmWJVfc4mae8n8YQZ+
	 +9upfC9uQ5E/LcOineys0Mxys2sArGbqxHGoPoACpBMPXhV0LBO7eCCBuNWtXT1aHC0XY
	 mBJs7J7NGUqRiBvZksazxJ4GPaQjH2SqfZ7p3s94GtqOZ03d5cKZd/ObnJorCMsYN4uBJ
	 r9EcfQxRr1DYG0Cr425UhO8iEBR9F35+nrm/tV5PQuI+xROH7lvnLKuRkT02sXEpMkWPI
	 gJwVjXhsCLlUPKUsJ25EUlBmSzHs8zPJC50WBvSqzWalaG8RSOsk3kPEBSHTH/cQsOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLdnfown;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E0A606A687;
	Wed, 25 Nov 2026 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NLdnfown
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DF01F000E1;
	Wed, 25 Nov 2026 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597111;
	bh=vEqFFBWX6b+wkozEcpfZ8vGlVzN4LPqH2KN4v/pkMPg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NLdnfownvMvuk6COfSyhktBlitM+8N7bmMquMGyOb5G4X/pIgNoyGJ3k7OYncSjKL
	 E8HWJQ0jnbr7FO9TSn8T3vDbjvNkNC36y69Unaiw49z4OUk/WWp9dVBoVh1lRVbQkg
	 KJbIBT78Tufv8Sz3BU17r9qQEW56z7cMOk38jvXFLu4NyD3DxcbLOdPJ6p6KKSjiSo
	 sRLrKs+ISoYAne7RBrLU3gbp8/P27TPcyyFD/IJb8V0CfZ8CrD13TDfXlnP8Scl08Y
	 IlyoZVoEW+zTvmEkYVIHb6BBtwCuIy8X85IftED1Vdnlkbg5+k8Ad3/3KUoznJf4qI
	 xQKDV9VHomUGw==
Subject: Re: [PATCH net-next 5/5] net: dsa: lan9645x: add bridge support
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 08:58:30 +0000
Message-ID: <179559711039.3135.10067666642818194046@kernel.org>
In-Reply-To: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-5-b930a1dae700@microchip.com>
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-5-b930a1dae700@microchip.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] lan9645x_port_bridge_join()
  (drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:544) stores…
- [Medium] lan9645x_fdb_vid()
  (drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:692) only switches…

--

net: dsa: lan9645x: add bridge support

This adds hardware bridge offload to the lan9645x DSA driver. Each
VLAN-unaware bridge gets its own reserved VID, and at most one bridge can
be VLAN-aware. The CPU port is no longer in the default unicast and
multicast flood masks; .port_set_host_flood adds it instead. The patch
also adds ageing time configuration with min/max limits.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> index de432772f6399..a78410efb9730 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c

[ ... ]

> @@ -306,6 +302,20 @@ static int lan9645x_setup(struct dsa_switch *ds)
>  	ds->mtu_enforcement_ingress = true;
>  	ds->assisted_learning_on_cpu_port = true;
>  	ds->fdb_isolation = true;
> +	ds->max_num_bridges = ds->num_ports;

[ ... ]

> +static int lan9645x_port_bridge_join(struct dsa_switch *ds, int port,
> +				     struct dsa_bridge bridge,
> +				     bool *tx_fwd_offload,
> +				     struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	p = lan9645x_to_port(lan9645x, port);
> +
> +	mutex_lock(&lan9645x->fwd_domain_lock);
> +
> +	p->bridge_num = bridge.num;
> +	lan9645x_vlan_port_set_bridge_vid(p, !p->vlan_aware);

[Severity: Medium]
Can bridge.num be larger than num_phys_ports here?

lan9645x_vlan_init() only adds the CPU port module to the reserved VIDs
for bridge numbers 1..num_phys_ports:

    for (bridge_num = 1; bridge_num <= lan9645x->num_phys_ports;
         bridge_num++) {
        vid = lan9645x_vlan_unaware_pvid(bridge_num);
        lan9645x->vlans[vid].portmask = BIT(lan9645x->num_phys_ports);
        ...
    }

Setting ds->max_num_bridges = ds->num_ports does not appear to limit the
number the DSA core passes in. In net/dsa/dsa.c, dsa_bridge_num_get()
first calls dsa_bridge_num_find(). That function searches every tree in
dsa_tree_list and returns an existing number without comparing it to max.
The "bridge_num > max" check only runs when a new number is allocated.

Take a bridge that first gets a number N >= 10 from a switch in another
DSA tree with a larger max_num_bridges (mv88e6xxx, sja1105 or vsc73xx).
If a lan9645x port then joins the same bridge:

lan9645x_port_bridge_join()
  p->bridge_num = N
  lan9645x_vlan_port_set_bridge_vid(p, true)
    vlans[VLAN_N_VID - N].portmask |= BIT(port)
    lan9645x_vlan_hw_wr()
      cpu_dis = !(v->portmask & BIT(lan9645x->num_phys_ports));  -> 1

ANA_PGID_CFG_OBEY_VLAN is set for the destination PGIDs. Would that mean
no frame classified to this VID is ever copied to the CPU? That would
cover broadcast, host FDB/MDB entries pointing at PGID_CPU, and host
flooding. The host stack and software forwarding to the other tree's
ports would then stop working for that bridge.

Should the join reject bridge.num > num_phys_ports, or should the
reserved VID be set up when it is first used?

[Severity: Medium]
Several bridges can now be offloaded at once. Does lan9645x_fdb_vid()
still keep the FDB of a VLAN-unaware bridge separate from the FDB of the
VLAN-aware bridge?

It only maps vid == 0 to the bridge's reserved VID:

drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:lan9645x_fdb_vid() {
	if (vid)
		return vid;

	return lan9645x_vlan_unaware_pvid(db->type == DSA_DB_BRIDGE ?
					  db->bridge.num : 0);
}

Take "bridge fdb add M dev swpB master static" on a port of
VLAN-unaware bridge B. br_fdb_add() adds M@0, and also M@vid for every
VLAN in the port's VLAN group. That includes the default pvid 1, which
exists even with vlan_filtering=0:

    list_for_each_entry(v, &vg->vlan_list, vlist) {
        if (!br_vlan_should_use(v))
            continue;
        err = __br_fdb_add(ndm, br, p, addr, nlh_flags, v,
                           nfea_tb, notified, extack);

DSA passes vid 1 through unchanged, so lan9645x_fdb_add() calls
lan9645x_mact_learn(lan9645x, port, M, 1, ENTRYTYPE_LOCKED).

B never uses that entry, because its ports classify to the reserved VID.
Now suppose VLAN-aware bridge A uses VID 1. Would frames to M in A hit
this locked entry pointing at swpB and be dropped by A's PGID_SRC mask?
The locked entry would also stop M from being learned on A's real port.

A later fdb_del from B would remove the same hardware entry. That could
also delete A's own static M@VID1 entry. lan9645x_host_addr_shared()
only handles collisions between CPU host addresses, not entries for front
ports.

Before this patch there was no .port_bridge_join, so bridge-DB FDB
entries never reached this helper. The commit message says the reserved
VIDs keep the FDB domains apart, but these entries would still overlap.

Should non-zero VIDs from a VLAN-unaware bridge's DB also be mapped to
its reserved VID, or skipped?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700%40microchip.com

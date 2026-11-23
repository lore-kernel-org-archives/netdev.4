Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471874;
	b=3yotBsmAF42KHV2Vy8nDe28sWxkcmPs+Nct63ZOUM6lWBNz3bnhbb1TTnKOY8lDptyUe
	 RvYMZ0eDWkapBLlsu4BgN1ZQ+GyfKcQ7H3jSxaYnStnC8pJ6nXofZww29uTGxIBNMpXCl
	 zbigkLeUXViqxJa2acLienlFI9cKKUC6fjUhBui+B7+6dbkRW/NVjM2fiFxsgafpfoWsZ
	 yvCcYIA+P4lsvqrk/pSgJvoWq0x0qpOyDS4tJDZcjgtuKKESxj+5Yz/pgi+9W+cO3z5VS
	 KFKVn862EsD6T3Exu0OPJjIP5koQYPoLuZkLKmw7dIGJVMdIHWOgyn4P33frJkYpNDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471874;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kXEn77mF22JDhRcO0FzMK1lBV54W4jVNonldkIWKxeE=;
	b=SBLWLyS2d0VLxTn+lrvbw0prs/tzRHEOEf7VaMUN1p8W9hfA7moWVToXROXhpfkv14P7
	 Vc6pkfWkyYNG2dbhyfoferdQCNyjnkWyGunHPJ15FW4RCY2QCSlUD+yyFakt/s+0vBFZU
	 rCdAoILTMd53Mn+R9QaQwdoRYRw/tI+PTQDuHhMS/V6fbk2z3QHnkpnflhER8vUsf3OW3
	 0doOrin+VT5GRRoUj7qdEbcCeDzLwmI1uF4unvfvOeMdec5O0S+P+aE0FEIO5JVcVNNaD
	 fq3t98WtGOmhgFQhpuUCR/0FjAnxAFdEry5nR9g0GT13GcmpwVHu4fZOVCcTvdkOp5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMbBJsZy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0D8606A337
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMbBJsZy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620A41F000C4;
	Mon, 23 Nov 2026 22:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795471873;
	bh=kXEn77mF22JDhRcO0FzMK1lBV54W4jVNonldkIWKxeE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AMbBJsZyzoYmAerHgBWhMvPkRa5S3GahW5oMGWT9q2UzgyTOD1nMUsQqJ4+HlQxJi
	 SdA/nvMIfoNaXoA5G572DE68mpABd8iXh//Zeycj6CiqzvsHP1MpvUPRJOVuvT+bzE
	 ZbTvnK0m/c0nomM7EuM3GLLm/CyDUygtsSZ3xU0QHiuMp+Dq13DuifBtUvKMKWQxFT
	 6JBDyX5c5A8XBQ05ye2y978OT+OHg4Ce2ufirV4vmQ84L4AAp2fWbs+fj1XJDDlq3e
	 BwOFzcyIxM1CTUPgJlUsgrPQJFFuRhqkGugR7QSSk2wIL3sr4vu9aKKklg2on+eUnl
	 glHs56nLWG8tA==
Subject: Re: [PATCH net v3 3/3] net: dsa: motorcomm: Rewrite FDB entry on port
 migration
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Mon, 23 Nov 2026 22:11:12 +0000
Message-ID: <179547187297.3135.17256967241487478010@kernel.org>
In-Reply-To: <20261119221110.1123578-4-mmyangfl@gmail.com>
References: <20261119221110.1123578-4-mmyangfl@gmail.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The migration fix is incomplete when an address moves between
  the host (CPU port) and a user port, even in the single-bridge setup…
- [Medium] The new dsa_bridge_ports(ds, db.bridge.dev) call in
  yt921x_dsa_port_fdb_add() (chip.c:888) walks every user port of the…

--

net: dsa: motorcomm: Rewrite FDB entry on port migration

This commit merges yt921x_fdb_join() and yt921x_fdb_leave() into a new
yt921x_fdb_update() helper. On .port_fdb_add() it uses the bridge port
mask as the leave mask, so that ports left behind by a migration are
dropped from the hardware entry.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index ea305159cd5e7..79e4326d5a703 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -888,8 +884,12 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
>  	if (is_multicast_ether_addr(addr))
>  		return 0;
>  
> +	if (db.type == DSA_DB_BRIDGE)
> +		leave_ports_mask = dsa_bridge_ports(ds, db.bridge.dev);
> +

[Severity: High]
Does this leave mask handle an address that moves between the host (CPU
port) and a user port?

dsa_bridge_ports() walks dsa_switch_for_each_bridge_member(), which is
built on dsa_switch_for_each_user_port(). That means the CPU port bit is
never in leave_ports_mask.

The driver sets assisted_learning_on_cpu_port, so a host address A (on
br0, or on a foreign bridged interface) is installed through
dsa_port_do_fdb_add(cpu_dp). The hardware entry becomes static with only
the CPU port in its egress mask.

If the address is then moved with:

  bridge fdb replace A dev swp2 master static

fdb_add_entry() in net/bridge/br_fdb.c only sends RTM_NEWNEIGH, so the
driver gets yt921x_dsa_port_fdb_add(swp2) with no delete first. In
yt921x_fdb_update():

	ctrl2 = val2 & ~YT921X_FDB_IO2_EGR_PORTS(leave_ports_mask);
	...
	ctrl1 = val1;
	if (join_ports_mask) {
		ctrl1 &= ~YT921X_FDB_IO1_STATUS_M;
		ctrl1 |= YT921X_FDB_IO1_STATUS_STATIC;
		if (ctrl1 != val1)
			ctrl2 &= ~YT921X_FDB_IO2_EGR_PORTS_M;
	}
	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(join_ports_mask);

The entry is already static, so ctrl1 == val1 and the clear-all branch is
skipped. Wouldn't the entry be written back as {CPU, swp2}, leaving the
CPU port behind?

The reverse direction looks broken too, and the driver can't see it.
Moving A back to the host goes through dsa_port_do_fdb_add(cpu_dp). There
the old record, whose refcount was never released, is found again:

net/dsa/switch.c:dsa_port_do_fdb_add() {
	...
	a = dsa_mac_addr_find(&dp->fdbs, addr, vid, db);
	if (a) {
		refcount_inc(&a->refcount);
	...
}

So .port_fdb_add() is not called for the CPU port and swp2 stays in the
entry. A later fdb del on the host side only drops the refcount.
yt921x_dsa_port_fdb_del() also only clears BIT(port).

Can this leave a static hardware entry that never ages out and keeps
forwarding unicast for A to the CPU port and/or swp2 after the software
bridge has moved it?

The commit message says single-bridge usage is covered, and this is a
single-bridge setup. The CPU port side depends on DSA's refcounting.
Can a driver-side leave mask fix that part at all?

[Severity: Medium]
Is it safe to walk every port's dp->bridge from .port_fdb_add()?

This handler can run from the deferred switchdev worker without rtnl:

dsa_user_switchdev_event_work()
  dsa_port_bridge_host_fdb_add()
    dsa_port_do_fdb_add(cpu_dp)
      ds->ops->port_fdb_add()
        yt921x_dsa_port_fdb_add()
          dsa_bridge_ports()

The comment in dsa_port_bridge_host_fdb_add() says rtnl can't be
guaranteed there. Only cpu_dp->addr_lists_lock is held.

dsa_bridge_ports() reads each user port's bridge through
dsa_port_bridge_dev_get():

	return dp->bridge ? dp->bridge->dev : NULL;

At the same time, another port Q can leave its bridge under rtnl. When Q
is the last member, dsa_port_bridge_destroy() does this with no RCU grace
period:

	dp->bridge = NULL;

	if (!refcount_dec_and_test(&bridge->refcount))
		return;
	...
	kfree(bridge);

The dsa_flush_workqueue() in dsa_port_pre_bridge_leave() only drains work
queued before that point. Host FDB work for a port that stays bridged can
still be queued from softirq learning.

With multiple bridges on the switch, can the worker load dp->bridge for Q
and then read ->dev after that dsa_bridge has been freed?

Even without a use-after-free, the membership snapshot is not taken under
any lock that serializes bridge join/leave. Could leave_ports_mask be
stale by the time the entry is written?

Before this patch, this path only used the db that DSA passed in for the
calling port. The other dsa_bridge_ports() callers in this driver
(port_bridge_flags and bridge join) run under rtnl. DSA core already reads
dp->bridge in this worker without rtnl (for example in
dsa_foreign_dev_check()), but this patch adds a new cross-port walk.

>  	mutex_lock(&priv->reg_lock);
> -	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
> +	res = yt921x_fdb_update(priv, addr, vid, leave_ports_mask,
> +				BIT(port));
>  	mutex_unlock(&priv->reg_lock);
>  
>  	return res;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119221110.1123578-1-mmyangfl%40gmail.com

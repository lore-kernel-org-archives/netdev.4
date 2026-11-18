Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017769;
	b=Vx4A/csmiHgLMZKV44y8cqIK6bn4mSWsP3r0VKmmzA/cdfxaZcxv0gqNFXpBC//8gDJc
	 gnekKgqzKMbZ5dwYucLPEWSb8KbDzf0hDV5YNw7rtl6pnhIZHf3UkeNJge7Z5U+l04kLd
	 /25engvtds+UZzSapNOk0SoF2gss1EHArqNGeHn23+H4rztp2MiKd3qAA86HP1mScN65S
	 La8cEcsOtO0lFQtImPemWv4NnzsQI9O9gRlnFnhxT/uRGfW7mQyoyXpjkyANfmjpvwxBN
	 gwLzv/kJiZanCIiQTDgPnTVPh2iGt7ZKGpnPPnvwdaJRyrNRl1Dh7xa1lfnvO1Agt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017769;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=D9Zj24r8ZrVqJNV9jjidgMn6lctXZbm0T7lkZdY2Ws8=;
	b=xKNRmvp3Zz6GI1O+pBaqv2sv1gZX13/DPBNoRxnW3D1omDGtQd1RhFI7UlcjCUXJtjW0
	 uCf+6/xw/SilrNieCZdzU6u0q4QFhsL/sDzpbOPnPcbJpUmPZrNLYXaqZkZcnwc4en4Q7
	 dFvMxRW1dL3r2myySCcb0jOQydlUTDxqOfLGsVuC3739aLdNszYRP4PUlIYzm8fkRrWmI
	 8Fkx/0q/ESGLTYM40J2/mHuTkEqBDdPlrG1Z191aHLO8hgEcoF7OHS1gh6lX4555NS01Q
	 vTQAjhW0n4fJOJzKDLX/naB5x7aviB+WL/jRIJEavvEuN5aZJboWTxByiQAmo5fr1DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKW20Q5H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AA606A332;
	Wed, 18 Nov 2026 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKW20Q5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38D41F000C5;
	Wed, 18 Nov 2026 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017769;
	bh=D9Zj24r8ZrVqJNV9jjidgMn6lctXZbm0T7lkZdY2Ws8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kKW20Q5H+2hNCYXEg83Jeau2cLPdXg9yU95rNLt+1Kh/GkNZm5+WsqfLypuRQYPE+
	 FO/3EzJPvkJLadDKM0vSZxC2TPOub1H3OmV82WALaiDliE1qVDsxPSViTXY0ACchBC
	 B2MIoXx9O66JAaomUK199Gx4yaQdK1x1cfrFesJTg9UeCCEoOCQK+gDZ/FpoVH02xB
	 r3SBEXdRnWIGa09ZBvWdE2C8rF/LE0uwJlzjscyBYNV6Pm3XvJ03krRJ+dkgP8Dl28
	 4djBS4tLi9PN7HQdVKW/J6V9drbKrCl7ab4U6E9JsfJgVATEKO66ePb6UqM94psDnx
	 cy4Ik3c6UDIlA==
Subject: Re: [PATCH net v2 2/4] net: dsa: motorcomm: Rewrite FDB entry on port
 migration
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 16:02:48 +0000
Message-ID: <179501776848.3136.5089854302333242012@kernel.org>
In-Reply-To: <20261116160107.1351198-3-mmyangfl@gmail.com>
References: <20261116160107.1351198-3-mmyangfl@gmail.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] yt921x_dsa_port_fdb_add()
  (drivers/net/dsa/motorcomm/chip.c:878-884) now builds the leave mask…
- [Medium] The YT921x hardware FDB holds both unicast FDB entries and MDB
  groups in the same table, keyed by (addr, FID).
- [Low] The commit message does not fully describe the behaviour change.
- [Low] yt921x_dsa_port_fdb_add() (chip.c:879) now calls
  dsa_bridge_ports(ds, db.bridge.dev) from the DSA ordered workqueue…

--

net: dsa: motorcomm: Rewrite FDB entry on port migration

This commit merges yt921x_fdb_join() and yt921x_fdb_leave() into one
yt921x_fdb_update() helper. For .port_fdb_add with a bridge database, the
hardware entry is rewritten with the bridge ports plus the CPU ports as the
leave mask, so ports left behind by a migration are dropped from the entry.

> Fuse FDB join/leave into one change function, and rewrite the whole
> entry on add with the bridge port mask as the leave mask, so that ports
> left behind by the migration are dropped from the entry.

[Severity: Low]
Should this say that the leave mask also includes priv->cpu_ports_mask?

yt921x_dsa_port_fdb_add() ORs the CPU ports into the leave mask. Any
bridge-scoped user port add now removes the host from the shared
(addr, vid) entry. The host delivery issue raised further down comes from
this.

> Note the commit only correctly covers single bridge usage. Multiple
> bridge scenario was broken before, but now breaks in a different way;
> that should be addressed in a following commit.

Could this describe how the multiple bridge case now breaks?

Without fdb_isolation, every bridge shares one hardware (addr, FID) entry.
They also share one CPU port refcount key, because bridge.num is forced
to 0. An add from one bridge can then remove CPU delivery that belongs to
another bridge.

None of the later patches in the series ("Read the port PVID instead of
bridge's", "Use VID 0 as the unaware PVID") seem to touch this. The final
state of the series has the same code. Since the patch carries a Fixes:
tag, it would help backporters to know about the new failure mode.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index c6d0f000a1630..863ebb6c31984 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -877,10 +872,16 @@ yt921x_dsa_port_fdb_add(struct dsa_switch *ds, int port,
>  			const unsigned char *addr, u16 vid, struct dsa_db db)
>  {
>  	struct yt921x_priv *priv = dsa_to_yt921x_priv(ds);
> +	u32 bridge_ports_mask = 0;
>  	int res;
>  
> +	if (db.type == DSA_DB_BRIDGE) {
> +		bridge_ports_mask = dsa_bridge_ports(ds, db.bridge.dev);

[Severity: Low]
Is it safe to call dsa_bridge_ports() from this context?

.port_fdb_add is called from dsa_user_switchdev_event_work() on the DSA
ordered workqueue, which runs without rtnl_lock. This call also happens
before reg_lock is taken.

dsa_bridge_ports() walks every port through
dsa_switch_for_each_bridge_member() and ends up in
dsa_port_bridge_dev_get():

include/net/dsa.h:dsa_port_bridge_dev_get() {
	return dp->bridge ? dp->bridge->dev : NULL;
}

At the same time, under rtnl, the last port leaving a different bridge goes
through dsa_port_bridge_leave()->dsa_port_bridge_destroy():

net/dsa/port.c:dsa_port_bridge_destroy() {
    ...
	dp->bridge = NULL;

	if (!refcount_dec_and_test(&bridge->refcount))
		return;
    ...
	kfree(bridge);
}

There is no RCU grace period before the kfree(). The dsa_flush_workqueue()
in pre_bridge_leave only drains work that is already queued. FDB work for
ports in other bridges can still run in parallel, for example host adds
with assisted_learning_on_cpu_port.

If the worker loads the old dp->bridge just before the kfree(), is the
read of ->dev a use-after-free? If dp->bridge is reloaded after the NULL
check, could it also be a NULL dereference?

The value is only compared against db.bridge.dev, so the likely result is
a KASAN report or a stale leave mask.

The other dsa_bridge_ports() callers in this driver run under rtnl. The
DSA core has a similar lockless pattern in dsa_foreign_dev_check(), but
this call site is new.

> +		bridge_ports_mask |= priv->cpu_ports_mask;

[Severity: Medium]
Does putting the CPU ports into the leave mask break host delivery in the
single bridge case?

The DSA core refcounts host FDB entries on the CPU port.
dsa_port_do_fdb_add() only calls the driver for the first reference:

net/dsa/switch.c:dsa_port_do_fdb_add() {
    ...
	a = dsa_mac_addr_find(&dp->fdbs, addr, vid, db);
	if (a) {
		refcount_inc(&a->refcount);
    ...
}

Since fdb_isolation is not set, db.bridge.num is always 0. Host adds and
user port adds therefore share the same hardware (addr, vid) entry.

Consider this sequence:

  bridge fdb add X dev br0 self local
    -> host add on the CPU port, hardware entry becomes {CPU}

  bridge fdb replace X dev swp1 master static
    -> fdb_add_entry()->fdb_update_dst() sends only RTM_NEWNEIGH, with no
       DEL for the old host destination
    -> yt921x_dsa_port_fdb_add(swp1) runs with leave = bridge | CPU
    -> hardware entry becomes {swp1}, while DSA still lists X on the CPU
       port

  bridge fdb replace X dev br0 self local
    -> dsa_port_do_fdb_add() finds the stale entry and only bumps the
       refcount; the driver is not called
    -> hardware entry stays {swp1}

The bridge now treats X as local, but the switch forwards frames for X out
of swp1, so the host never receives them.

Later host deletes only decrement the inflated refcount. The static {swp1}
entry then can't be removed through DSA.

Before this patch, the same sequence left {CPU, swp1}. That entry had a
stale port, but the host still got its traffic.

Normal roaming through __fdb_update() sends RTM_DELNEIGH first and is not
affected. The bridge core's missing DEL on a host-to-port replace is part
of the cause, but evicting the CPU bit is new in this driver.

Should the CPU ports be left out of the leave mask?

> +	}
> +
>  	mutex_lock(&priv->reg_lock);
> -	res = yt921x_fdb_join(priv, addr, vid, BIT(port));
> +	res = yt921x_fdb_update(priv, addr, vid, bridge_ports_mask, BIT(port));

[Severity: Medium]
Can this rewrite overwrite MDB groups?

The hardware FDB holds both unicast FDB entries and MDB groups, keyed by
(addr, FID). yt921x_dsa_port_mdb_add() builds group membership with
yt921x_fdb_join() on those same entries.

Nothing checks is_unicast_ether_addr() before the leave mask is applied.
br_fdb_add() only rejects all-zero addresses.

Suppose the MDB already has 01:00:5e:01:01:01 with {swp0, swp1, CPU}, and
this runs:

  bridge fdb add 01:00:5e:01:01:01 dev swp2 master static vlan 1

It arrives as .port_fdb_add with DSA_DB_BRIDGE. The entry is already
static, so ctrl1 == val1, and yt921x_fdb_update() computes:

	ctrl2 = val2 & ~YT921X_FDB_IO2_EGR_PORTS(leave_ports_mask);
	...
	ctrl2 |= YT921X_FDB_IO2_EGR_PORTS(join_ports_mask);

The hardware entry becomes {swp2}. Group traffic stops reaching swp0,
swp1 and the CPU, while the bridge and DSA MDB state stays the same.

A later bridge fdb del goes through yt921x_fdb_leave(BIT(swp2)). That
finds no ports left and issues YT921X_FDB_OP_OP_DEL, which removes the MDB
group from hardware completely.

Before this patch, the add only ORed BIT(port) into the entry, so the MDB
members were kept.

Should the rewrite apply only to unicast addresses, as the commit message
describes?

>  	mutex_unlock(&priv->reg_lock);
>  
>  	return res;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116160107.1351198-1-mmyangfl%40gmail.com

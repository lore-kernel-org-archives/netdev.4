Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597110;
	b=M87HQlHaEWEsKxAftIDOWJhBspkjL14muDe301IEG3ZWEeMgytKyXA+uU8sEPQAnZIS9
	 hQ5UJ+I6nyHptRIE/KXyKy35e/6F/QQs2j91mVrSmRZLfeltp85IxV+090k6D99xwObhy
	 NBJtHxsqxbZbBQCSXOO2zWvsNcJXUSlZkv1CWz09+xrFi4JIdBgKUKMScfAT+c69zDA6v
	 KoDilHOLx+JqOXXQLZM0NhzX+x27eSoJPIgJIsozkXCon3kstFMc0x437fb8XMSCKW0WP
	 bxjb+YBbrFl9x3X8mKxG3dOEeAiLKfK4ZAvPG5lTbhybXrJZsDuil0J/OGXsZ8ob9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597110;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yYin3lmJ4aqtvKWXKDj8SPspMEI2bSTV5+DRvRPGsJ0=;
	b=xfFSnwZRps4vZ5OZvCxiyhlrR/tuMRfmrxia23OiJJ6jJ2mza3gjNe/UKSXrPZTCW9dh
	 2UaryJpjhpY9toZnBeeSeOPjmmA0FukhURXqX71ZdDVa9vUweuV5Hxp/MZvnkFriLLsXu
	 s5zmD/pmiaNlYCtenyDhF0j22reGAQjLIkl28wQImVOCjAH94TB2kAJd8zNO8p5OJTXoZ
	 DqvsmOLiILv7wo1hJsy9D+3lCakaOppYe2Tf2ffKx8m3uNJMmgDtMyu7UL3TNbuP7jfkr
	 9LlAUZNL6xGGoQiCnsqJ+y7/NRGXbV6uw3/3k5V/cULVlcjhRnLyv31bil5ZdplNBlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lDVQ/E27";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322AA606A321;
	Wed, 25 Nov 2026 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDVQ/E27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DEA1F000D0;
	Wed, 25 Nov 2026 08:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597109;
	bh=yYin3lmJ4aqtvKWXKDj8SPspMEI2bSTV5+DRvRPGsJ0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lDVQ/E27097Q09szJFYinQtCFzTgLzRQRW08yjuTG41z1oRLo85epPEjA6K1V56Av
	 CSCqMmXbHdAZy6P/2Ue4SYArdf/+Cl2+BrQO+zfzYjdfyrWv53vWnFlMeSP7983cRH
	 dRNELhjx5Rkq6vP7kKp0pdr+pe1/g0RB2nKyGjEYFi8bsG814zOdqedr7meBnDgt3e
	 YaaFPr2JRD5xa+GA53t47TfBLzIF7DV5m/knYNxhuag+4JYkWjLP0Q0LnVbUrdpOrQ
	 TlUU2L8S3GyT/Ts0+MJUEaQO+IjPG9/KRLcS4DdeOpVIgi/XJJmYCwgOKqfVNLvCuC
	 D0ZyaWq05/e9Q==
Subject: Re: [PATCH net-next 4/5] net: dsa: lan9645x: add mdb management
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 08:58:28 +0000
Message-ID: <179559710890.3135.18435400637829345341@kernel.org>
In-Reply-To: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-4-b930a1dae700@microchip.com>
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-4-b930a1dae700@microchip.com>
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

Critical: 0 · High: 1 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] A user port's membership in a hardware MDB entry is a single bit
  (lan9645x_mdb_entry->ports), keyed only by (MAC, hw_vid), with no per-…
- [Medium] In drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c, the
  hardware and software MDB state can disagree after a failed MAC-table…
- [Medium] lan9645x_port_mdb_add() and lan9645x_port_mdb_del()
  (drivers/net/dsa/microchip/lan9645x/lan9645x_main.c) pass mdb->vid…

--

net: dsa: lan9645x: add mdb management

This commit adds DSA .port_mdb_add/.port_mdb_del support to the lan9645x
switch. IP multicast groups store the port mask inline in the MAC table
entry. Each L2 multicast group takes one of the general purpose PGIDs.
IGMP/MLD frames are redirected to the CPU so the bridge can snoop them.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> index 904b51a55d937..de432772f6399 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c

[ ... ]

> @@ -470,6 +483,50 @@ static int lan9645x_fdb_del(struct dsa_switch *ds, int port,
>  				    ENTRYTYPE_LOCKED);
>  }
>  
> +static int lan9645x_port_mdb_add(struct dsa_switch *ds, int port,
> +				 const struct switchdev_obj_port_mdb *mdb,
> +				 struct dsa_db db)
> +{

[ ... ]

> +	if (port == lan9645x->npi)
> +		port = lan9645x->num_phys_ports;
> +
> +	return lan9645x_mdb_add(lan9645x, port, mdb->addr,
> +				lan9645x_fdb_vid(mdb->vid, &db));

[Severity: Medium]
Should mdb->vid be checked against the reserved VID range before it is
used here?

lan9645x_fdb_vid() returns any non-zero VID unchanged, so the value goes
straight into the MAC table. The driver's VLAN path rejects this range in
lan9645x_vlan_port_add_vlan() ("VLAN range 4032-4095 reserved"). That
range holds the internal VIDs of VLAN-unaware bridges:

lan9645x_vlan_unaware_pvid() {
    ...
    return bridge_num ? VLAN_N_VID - bridge_num : HOST_PVID;
}

so bridge_num 2..9 use VIDs 4094..4087.

The bridge MDB netlink path only rejects vid >= 4095. When per-VLAN
multicast snooping is off, br_mdb_config_init() does not require the VLAN
to exist. Take this command:

    bridge mdb add dev brA port swpA grp 239.1.1.1 permanent vid 4094

It would install (01:00:5e:01:01:01, 4094) with portmask {swpA} inside
the internal VLAN of VLAN-unaware bridge #2. Bridge #2 frames for that
group would then match this entry instead of being flooded. Bridge #2's
PGID_SRC mask excludes swpA, so those frames are dropped. A host MDB entry
gives a CPU-only entry with the same effect on bridge #2's front ports.

DSA user ports can be placed in different network namespaces. Could one
bridge disrupt multicast in another bridge's isolated forwarding domain
this way?

The same applies to lan9645x_port_mdb_del(). The existing FDB path also
lacks this check, but this patch adds a new user-controlled path into the
reserved VIDs. The user-port path is reachable once the later "add bridge
support" patch in the series lands, and this code is unchanged there.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
> new file mode 100644
> index 0000000000000..6864b89d5a2d4
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
> @@ -0,0 +1,256 @@

[ ... ]

> +static void lan9645x_mdb_entry_destroy(struct lan9645x *lan9645x,
> +				       struct lan9645x_mdb_entry *mdb_entry)
> +{

[ ... ]

> +	err = lan9645x_mact_forget(lan9645x, mdb_entry->mac, mdb_entry->vid,
> +				   mdb_entry->type);
> +	if (err)
> +		dev_err(lan9645x->dev, "Forgetting %pM vid %u returned %pe\n",
> +			mdb_entry->mac, mdb_entry->vid, ERR_PTR(err));
> +	else if (mdb_entry->type == ENTRYTYPE_LOCKED)
> +		clear_bit(mdb_entry->pgid, lan9645x->mdb_pgids);
> +
> +	list_del(&mdb_entry->list);
> +	kfree(mdb_entry);
> +}

[Severity: Medium]
What happens to the hardware entry when lan9645x_mact_forget() fails
here?

lan9645x_mdb_del() has already cleared the port from mdb_entry->ports.
When the mask reaches zero, it calls lan9645x_mdb_entry_destroy() without
first writing the narrowed mask to hardware:

lan9645x_mdb_del() {
    ...
    mdb_entry->ports &= ~BIT(chip_port);

    if (!mdb_entry->ports) {
        lan9645x_mdb_entry_destroy(lan9645x, mdb_entry);
        goto out;
    }
    ...
}

If the forget then times out, or the regmap read in
lan9645x_rd_poll_timeout() fails, the software entry is still freed but
the MAC table entry stays valid:

- For an L2 group, its ANA_PGID mask still contains the departing port.
- For an IPv4/IPv6 group, the encoded portmask and MAC_CPU_COPY still
  include it.

Wouldn't traffic keep being forwarded to a port the bridge has already
removed?

The PGID bit also stays set in mdb_pgids, but the only object that knew
about it has been freed. Can that PGID ever be reclaimed? A re-add of the
same (mac, vid) misses the lookup and allocates a new PGID. Each such
failure then seems to lose one of the general purpose PGIDs until the next
setup.

For L2 groups, would it help to write a zero ANA_PGID mask before the
forget? That is a plain register write and does not depend on the MAC
table command, so any leftover entry would forward nowhere.

Two related cases.

In lan9645x_mdb_del(), when other ports remain, ports is updated before
the CMD_LEARN rewrite for IP groups. If lan9645x_mdb_write_ports() fails,
software no longer lists the port but hardware still does.

In lan9645x_mdb_entry_create(), ANA_PGID(pgid) is programmed before
CMD_LEARN:

    err = lan9645x_mdb_write_ports(lan9645x, mdb_entry, mdb_entry->ports);
    if (!err && mdb_entry->type == ENTRYTYPE_LOCKED)
        err = lan9645x_mact_learn(lan9645x, mdb_entry->pgid, addr, vid,
                                  mdb_entry->type, false);

An -ETIMEDOUT from the learn only means the command did not reach IDLE in
time. It does not mean the learn was dropped. The PGID is left unreserved
while its mask is live. Could a later reuse of that PGID redirect an
orphaned entry?

The commit message says:

    A failed MAC table command is logged instead.

Does that fully describe the stale forwarding and the lost PGID above?
This code is unchanged through the end of the series.

> +int lan9645x_mdb_add(struct lan9645x *lan9645x, int chip_port,
> +		     const unsigned char addr[ETH_ALEN], u16 vid)
> +{

[ ... ]

> +	mdb_entry = lan9645x_mdb_entry_lookup(lan9645x, addr, vid);
> +	if (!mdb_entry) {
> +		err = lan9645x_mdb_entry_create(lan9645x, chip_port, addr, vid);
> +		goto out;
> +	}
> +
> +	if (mdb_entry->ports & BIT(chip_port))
> +		goto out;

[Severity: High]
Can two IP groups that map to the same multicast MAC on one port break
each other here?

br_switchdev_mdb_populate() converts IP groups to MAC addresses with
ip_eth_mc_map() and ipv6_eth_mc_map(). For example, 224.1.1.1, 225.1.1.1
and 239.129.1.1 all become 01:00:5e:01:01:01. For IPv6, groups with the
same low 32 bits share a 33:33 MAC.

DSA does not refcount MDB entries on user ports:

net/dsa/switch.c:dsa_port_do_mdb_del() {
    ...
    /* No need to bother with refcounting for user ports */
    if (!(dsa_port_is_cpu(dp) || dsa_port_is_dsa(dp))) {
        err = ds->ops->port_mdb_del(ds, port, mdb, db);
    ...
}

Suppose port P joins group A and then group B with the same MAC. The
second lan9645x_mdb_add() returns 0 here without recording anything. When
A is deleted, lan9645x_mdb_del() clears P from the shared entry and
rewrites or destroys it, even though B is still joined on P in the bridge.

Forwarded frames carry offload_fwd_mark, so the software bridge does not
make up for this, and P stops receiving B in hardware.

With IGMP/MLD snooping, joins and leaves come from remote hosts. A host on
P's segment could join and then leave 224.1.1.1 and stop delivery of
239.1.1.1 to a listener on P. The listener's later reports only refresh
the existing bridge port group. They do not send a new switchdev add.

Does the (mac, vid) entry need a per-port reference count to handle this?

The user-port path becomes reachable once the later "net: dsa: lan9645x:
add bridge support" patch adds .port_bridge_join, and this code is
unchanged there.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-0-b930a1dae700%40microchip.com

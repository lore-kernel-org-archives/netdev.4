Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858217;
	b=Xu2vwPwGYom+7wdE91Yc2730RJ2q1cTyppqLLzvUVZaQKHCPj+gKn9e2mL23AWGYs57U
	 HVR2SpCtG6g1PRNsFUZSdpMbHomCncOgSA5nRkk1EWpKbRfiQvS3Uenw/nq6XJ1VJvvoJ
	 uOwbQq1WaWXNXZ/rB9y+5Mu8ZVghuD7exMNy/hQTpnYVloct6qSX/Ft/nM/aAYDHejGvq
	 rAAGrq2lFZqBd4HVRitSMRQryE5Ln528ZtVegxODo8SQvg3T/PqNMa/HliwT7LmFNS/Ta
	 8ZBoQWYqKHsniDFZm5eHG9AIgC/e5gdEaVnZ8+ZYulMhVQ0L8ZLhxXpjvMYsOlqNjrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858217;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ve+5CH97uTTdCLlTiN5TMu7Nlx9WYgQwzC3gLJiJwfc=;
	b=LnYNXLqbq1xS5irWrP/PHA35OjZH/w1AKdzRuvzdyHGTQhfO/YZ4IzkmTz9puT2/u4/X
	 ageyGJHjncZYPKAiYAViJwkUNFgyrNn/4/kG2XonUT39R6WQrRRGD5J1JoRXivWwVOy04
	 lE7e+tbIYOTgPtu5V6oX9DsVA/go+PXI8Ntw/afwDW5tkcIY9XOIT1LHbgDiip5GWSq9V
	 6DWWvAfFLQXb61orQX/wiW9J0gLj7kTQ3+S95BSsshOfSMckb4kWgrUPEK1GsHie8TPPt
	 yWMax8Qyym4XQarEZuiJG99KVHnlK0nLn3QPHkfGOI3HOr9lr3Rw2KNoV23AvSwjyBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTlGCzTx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB56606A327;
	Sat, 28 Nov 2026 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LTlGCzTx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB411F00893;
	Sat, 28 Nov 2026 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795858217;
	bh=ve+5CH97uTTdCLlTiN5TMu7Nlx9WYgQwzC3gLJiJwfc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LTlGCzTxQolpNlW+R4Uuw1DbzUDjtSSF5x6kx7rKYHGdF54YgUcUOY5RzHb/Fyh6a
	 J44axoSDMG16FPG1WcxNwtNStIUHcYm5yQRs580IJTyZSdXWOQZ/h6GXfSXZFQWcdo
	 UZKEKF8eiefQp+XwgNHTTf37x/o0ySAUzE3uHhlOQPILN6huhi19VAk05o6wTJmViw
	 Yl/EasCKj8oWKkIJJ/1aZ64mzztADDXo1jA55h/ScScC8xvHiukAf6yiA+OX47+mOo
	 Qe6PmTmenqn/2Y+WLFGXR8hqI3KA9XO7oJL/RFe46XNonJDxR6x6mGtSVckqNVuxrB
	 Xk06KRliSDEIg==
Subject: Re: [PATCH net-next v2 4/5] net: dsa: lan9645x: add mdb management
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Sat, 28 Nov 2026 09:30:16 +0000
Message-ID: <179585821603.3135.8897851570267495148@kernel.org>
In-Reply-To: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-4-84adcd919dac@microchip.com>
References: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-4-84adcd919dac@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Per-port MDB membership is a single bit per (MAC, hw VID),
  with no refcount for IP groups that map to the same multicast MAC.
- [Medium] When the general-purpose PGIDs (48 PGIDs, 9..56, shared by all
  bridges and the standalone host MDB entries) are used up,…
- [Low] When the last member leaves, lan9645x_mdb_del() calls
  lan9645x_mdb_entry_destroy().
- [Low] L2 (non-IP) MDB groups are written to the MAC table as
  ENTRYTYPE_LOCKED at key (addr, hw_vid) with DEST_IDX=pgid.
- [Low] For IPv4/IPv6 MDB entries, lan9645x_mdb_write_ports() passes the
  full `ports` mask, including BIT(num_phys_ports) (the CPU port module,…

--

net: dsa: lan9645x: add mdb management

This adds the DSA port_mdb_add/port_mdb_del callbacks for lan9645x. IP
multicast groups store the port mask inline in the MAC table entry. Each
L2 multicast group allocates one general purpose PGID. IGMP/MLD frames
are redirected to the CPU, and IPv4 multicast control frames are copied
to it.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
> new file mode 100644
> index 0000000000000..6864b89d5a2d4
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c

[ ... ]

> +static int lan9645x_mdb_write_ports(struct lan9645x *lan9645x,
> +				    struct lan9645x_mdb_entry *mdb_entry,
> +				    u16 ports)
> +{
> +	unsigned char mac[ETH_ALEN] __aligned(2);
> +	bool cpu_copy;
> +
> +	lockdep_assert_held(&lan9645x->mdb_lock);
> +
> +	if (mdb_entry->type == ENTRYTYPE_LOCKED) {
> +		lan_rmw(ANA_PGID_PGID_SET(ports), ANA_PGID_PGID, lan9645x,
> +			ANA_PGID(mdb_entry->pgid));
> +		return 0;
> +	}
> +
> +	lan9645x_mdb_encode_mac(mac, mdb_entry->mac, ports, mdb_entry->type);
> +	cpu_copy = !!(ports & BIT(lan9645x->num_phys_ports));

[Severity: Low]
Should the CPU bit be masked out of ports before it is encoded inline
here?

As written, lan9645x_mdb_encode_mac() writes BIT(num_phys_ports) into the
inline destination bytes, and MAC_CPU_COPY is also set from the same bit.
The commit message says IP host membership is carried in MAC_CPU_COPY.

L2 groups reach the CPU through the PGID CPU bit, and that path is gated
per VLAN. ANA_PGID_CFG.OBEY_VLAN is set, and lan9645x_vlan_hw_wr() sets
VLAN_PGID_CPU_DIS when the CPU is not in the VLAN portmask. IP entries
use the dummy DEST_IDX 0, so they don't get that gating.

The lan966x driver keeps the CPU out of the inline mask. It only sets
cpu_copy when the CPU is a member of the VLAN. DSA doesn't add user-port
VLANs to the CPU port, so a host MDB entry can exist in a VID the CPU
isn't a member of. One example is a static "bridge mdb add dev br0 port
br0 ... vid V" where br0 isn't in V.

In that VID, would IP host groups still be copied to the CPU while L2
host groups are not? This is inferred from lan966x. I couldn't confirm
from the LAN9645x documentation what inline bit 9 means, or whether
MAC_CPU_COPY follows VLAN membership.

> +
> +	/* For IP multicast, the hardware lookup uses the DMAC
> +	 * (01:00:5E:.. / 33:33:..) as the (mac, vid) key, not the encoded mac.
> +	 * Therefore, this CMD_LEARN will atomically rewrite the existing
> +	 * hardware entry. We intentionally do not do a forget before learn
> +	 * sequence, as that would not be atomic, and leave a forwarding gap.
> +	 */
> +	return lan9645x_mact_learn(lan9645x, IP_ENTRY_PGID, mac, mdb_entry->vid,
> +				   mdb_entry->type, cpu_copy);
> +}
> +
> +static int lan9645x_mdb_entry_create(struct lan9645x *lan9645x, int chip_port,
> +				     const unsigned char addr[ETH_ALEN],
> +				     u16 vid)
> +{

[ ... ]

> +	if (mdb_entry->type == ENTRYTYPE_LOCKED) {
> +		mdb_entry->pgid = find_next_zero_bit(lan9645x->mdb_pgids,
> +						     PGID_GP_END,
> +						     PGID_GP_START);
> +		if (mdb_entry->pgid >= PGID_GP_END) {
> +			kfree(mdb_entry);
> +			return -ENOSPC;
> +		}
> +	}

[Severity: Medium]
Does returning -ENOSPC here make a bridge join fail, instead of just
leaving the group unoffloaded?

The commit message says:

  When they are exhausted, adding a new group fails with -ENOSPC and the
  group is not offloaded.

lan9645x_port_mdb_add() returns this code unchanged, but
br_switchdev_mdb_replay() only tolerates -EOPNOTSUPP:

net/bridge/br_switchdev.c:br_switchdev_mdb_replay() {
    ...
		if (err == -EOPNOTSUPP)
			err = 0;
		if (err)
			goto out_free_mdb;
    ...
}

The error then goes through nbp_switchdev_sync_objs() to
br_switchdev_port_offload(). That function fails the offload without
unsyncing the entries that were already replayed.

The 48 general purpose PGIDs are shared by all bridges and by the
standalone host entries. Once they are all in use, would "ip link set
swpN master br0" fail entirely? Would the PGIDs and port bits of the
entries replayed before the failure stay programmed in the driver?

lan9645x_port_mdb_add() already returns -EOPNOTSUPP for the reserved VID
case. Could PGID exhaustion, and the -ENOSPC that lan9645x_mact_learn()
returns on CPU_LEARN_FAILED, be handled the same way?

This becomes reachable once "net: dsa: lan9645x: add bridge support"
adds .port_bridge_join later in the series. That commit doesn't change
this error handling.

> +
> +	err = lan9645x_mdb_write_ports(lan9645x, mdb_entry, mdb_entry->ports);
> +	if (!err && mdb_entry->type == ENTRYTYPE_LOCKED)
> +		err = lan9645x_mact_learn(lan9645x, mdb_entry->pgid, addr, vid,
> +					  mdb_entry->type, false);

[Severity: Low]
Can this collide with a static FDB entry for the same multicast MAC and
VID?

lan9645x_fdb_add() also learns ENTRYTYPE_LOCKED at (addr, hw_vid), with
DEST_IDX set to a port:

drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:lan9645x_fdb_add() {
    ...
	return lan9645x_mact_learn(lan9645x, dest, addr,
				   lan9645x_fdb_vid(vid, &db),
				   ENTRYTYPE_LOCKED, false);
}

br_fdb_add() only rejects all-zero MACs, so a command like "bridge fdb
add 01:xx:... dev swpN master static vid V" reaches it.

Whichever of the FDB entry and the L2 MDB entry is learned last
overwrites the other's destination. Deleting either one sends CMD_FORGET
for the shared key, which also removes the other's hardware entry.

For ENTRYTYPE_LOCKED, lan9645x_mdb_write_ports() only rewrites ANA_PGID
and never re-learns the MAC entry. Doesn't that leave the MDB state out
of sync with the hardware until the group is deleted and recreated?

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

[Severity: Low]
What happens to the hardware entry if lan9645x_mact_forget() fails here?

lan9645x_mdb_del() clears the port from mdb_entry->ports and calls this
function. It does not first write an empty ANA_PGID(pgid) or an empty
inline mask.

The forget can fail with a bus error, or with -ETIMEDOUT from
lan9645x_rd_poll_timeout() in __lan9645x_mact_forget(). In that case the
MAC table entry stays valid and keeps forwarding to the departed port
through the old mask. The tracking entry is freed anyway.

For L2 groups the PGID bit is intentionally left set, so that PGID is
lost permanently. A later re-add allocates a new PGID and CMD_LEARN
repoints the same MAC slot at it. The old PGID is then orphaned, and the
pool has only 48.

Would clearing ANA_PGID(pgid) with a register write before CMD_FORGET
stop the stale forwarding? That would also make it safe to release the
PGID whatever the forget returns.

The partial removal path in lan9645x_mdb_del() has a similar ordering
problem. mdb_entry->ports is updated before lan9645x_mdb_write_ports().
For IP entries that call is a CMD_LEARN, and if it fails the old inline
port set stays in hardware.

> +
> +int lan9645x_mdb_add(struct lan9645x *lan9645x, int chip_port,
> +		     const unsigned char addr[ETH_ALEN], u16 vid)
> +{
> +	struct lan9645x_mdb_entry *mdb_entry;
> +	u16 new_ports;
> +	int err = 0;
> +
> +	mutex_lock(&lan9645x->mdb_lock);
> +
> +	mdb_entry = lan9645x_mdb_entry_lookup(lan9645x, addr, vid);
> +	if (!mdb_entry) {
> +		err = lan9645x_mdb_entry_create(lan9645x, chip_port, addr, vid);
> +		goto out;
> +	}
> +
> +	if (mdb_entry->ports & BIT(chip_port))
> +		goto out;

[Severity: Medium]
Does this need a per-port refcount for IP groups that map to the same
multicast MAC?

The bridge sends one SWITCHDEV_OBJ_ID_PORT_MDB object per IP group.
br_switchdev_mdb_populate() turns each group into a MAC address with
ip_eth_mc_map()/ipv6_eth_mc_map(). For example, 224.1.1.1 and 225.1.1.1
both become 01:00:5e:01:01:01.

DSA doesn't refcount these for user ports:

net/dsa/switch.c:dsa_port_do_mdb_del() {
    ...
	/* No need to bother with refcounting for user ports */
	if (!(dsa_port_is_cpu(dp) || dsa_port_is_dsa(dp))) {
		err = ds->ops->port_mdb_del(ds, port, mdb, db);
    ...
}

Take two receivers behind one port that join 224.1.1.1 and 225.1.1.1.
The second join is a no-op here.

When one of them leaves or times out, lan9645x_mdb_del() does:

	mdb_entry->ports &= ~BIT(chip_port);

It then either rewrites the mask without the port or destroys the entry.

Would the port then stop receiving the group it is still a member of?
Bridge refreshes of the remaining group don't re-notify switchdev, so
the loss would last until the bridge recreates that port group.

This becomes reachable with .port_bridge_join from "net: dsa: lan9645x:
add bridge support", which doesn't change lan9645x_mdb.c.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-0-84adcd919dac%40microchip.com

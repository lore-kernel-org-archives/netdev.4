Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612409;
	b=wqX+TSjQjWeOcRK16LYMAQ3ovRoB6/abhTbSoA+7HBnIHdTCskwT/sgI6B08NkwLtqTi
	 1U9rEamLmGeqlP79s2rVn8lavmQbGUmk1B58PF5rebJ8YN/sxJHeso5HaOZrb0E1yZh/T
	 7mWuO70Mnv7SDs2Cpha7OwouuKkAxp/h3wfnTHXZc/c87HCPKJ9L4hUAeGgGjlti0HiO8
	 hSAdOs07qAVDUgi8OR/cUij0JlgUdPY79twAvhU317OwxKMGvR1U35lV1Yg/g4Cpb7ivg
	 lHCL3G4jrvxTTb4vHs5j2XjKWlQZd6cSneJSOOFEmcb3X9uXkr8QYp1J5Os0Y7nJoww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612409;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-ID:CC:From:To:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=uXMlaSX9sv9zYcc2koQsMST1gEhW22PBRrKx7592PZo=;
	b=2+jkjJicslquUhLm0OzeBFXDBAF64VzX4WlKmPLQU5Gn8X5DwsnEbdZYt+5nN1f0WJji
	 p5AQLUzWBzO/OTvHEhT/LqgMWvC3AE5gkB0QHmb5vnWEpEZl2vErhrbhACPW8ccQYHqsR
	 EMesTw30qQS8H/968HAjSWnL2z+ydcRQTIS8ea4m42BYSjKBa71y1sQyRIt61zg8ybefI
	 oCGVNB/WThb1K/R2JmSwOS3q92A5oC4W7Kl0qHTCCwNetr79fNiuCkpoAjIqUcn23+Wl1
	 l43l2xLQIgLjhOqyR2PJ++I0yg+GUdnHmAV9rANZ9QZtxuarRchoHobBPQx/iv+XzKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=EFziiKyT;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C22606A31E;
	Wed, 25 Nov 2026 13:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=EFziiKyT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795612408; x=1827148408;
  h=mime-version:content-transfer-encoding:date:message-id:
   cc:from:to:subject:references:in-reply-to;
  bh=Sf0+dEYkTlAxuaU2ovnVo8XSxM0+BVOLHdlU3i8c1p4=;
  b=EFziiKyT0ClKGMmAQ5gmchN2Aolbxk/nxm6g8BO1cz1gmuYaAt9oaUtX
   RGULmz6gi8fL2C68EYx/jD+KlcwDfgycIS5KXkYpdrxqrUNDxJmfHAXOL
   /RJbs8fLIPjGfWdGW85lfN7qMfTrTE856E3wBkS1dcqoaxefGyF3BsF+z
   ThgmHTGDhMEFgfO8qkY4taDTURKmSo7AsTM38WzEQgI6Lyv71lZ2tH+wv
   Qyp0ioMVQQKOnf0OtoNcn9utSPvVsanH3TgX1pISnO9ROK685KnbEWTUl
   hi5x04SLdIck8vDfX/7uz7SRIa4w7DIl3bJLYvVFHeUEK+xJ6bxf/sC0N
   w==;
X-CSE-ConnectionGUID: ff4K6qnqRYGm6WjXw6NpmA==
X-CSE-MsgGUID: PTCnt3RaT8O4dV388kCWug==
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="67267610"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Nov 2026 06:13:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 25 Nov 2026 06:13:21 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Wed, 25 Nov 2026 06:13:21 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Nov 2026 14:13:20 +0100
Message-ID: <DN4BH0TO8KZ0.1PCZKO375ZQNV@microchip.com>
CC: <UNGLinuxDriver@microchip.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linux@armlinux.org.uk>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
To: <netdev-bot+sashiko@kernel.org>, <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next 4/5] net: dsa: lan9645x: add mdb management
X-Mailer: aerc 0.21.0
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-4-b930a1dae700@microchip.com> <179559710890.3135.18435400637829345341@kernel.org>
In-Reply-To: <179559710890.3135.18435400637829345341@kernel.org>

On Wed Nov 25, 2026 at 9:58 AM CET, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] A user port's membership in a hardware MDB entry is a single bit
>   (lan9645x_mdb_entry->ports), keyed only by (MAC, hw_vid), with no per-=
=E2=80=A6
> - [Medium] In drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c, the
>   hardware and software MDB state can disagree after a failed MAC-table=
=E2=80=A6
> - [Medium] lan9645x_port_mdb_add() and lan9645x_port_mdb_del()
>   (drivers/net/dsa/microchip/lan9645x/lan9645x_main.c) pass mdb->vid=E2=
=80=A6
>
> --
>
> net: dsa: lan9645x: add mdb management
>
> This commit adds DSA .port_mdb_add/.port_mdb_del support to the lan9645x
> switch. IP multicast groups store the port mask inline in the MAC table
> entry. Each L2 multicast group takes one of the general purpose PGIDs.
> IGMP/MLD frames are redirected to the CPU so the bridge can snoop them.
>
>> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/driver=
s/net/dsa/microchip/lan9645x/lan9645x_main.c
>> index 904b51a55d937..de432772f6399 100644
>> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
>> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
>
> [ ... ]
>
>> @@ -470,6 +483,50 @@ static int lan9645x_fdb_del(struct dsa_switch *ds, =
int port,
>>  				    ENTRYTYPE_LOCKED);
>>  }
>> =20
>> +static int lan9645x_port_mdb_add(struct dsa_switch *ds, int port,
>> +				 const struct switchdev_obj_port_mdb *mdb,
>> +				 struct dsa_db db)
>> +{
>
> [ ... ]
>
>> +	if (port =3D=3D lan9645x->npi)
>> +		port =3D lan9645x->num_phys_ports;
>> +
>> +	return lan9645x_mdb_add(lan9645x, port, mdb->addr,
>> +				lan9645x_fdb_vid(mdb->vid, &db));
>
> [Severity: Medium]
> Should mdb->vid be checked against the reserved VID range before it is
> used here?
>

Yes, correct. Without per-VLAN snooping the bridge does not require the
VLAN for an MDB entry, so a VID in 4032-4095 reaches the driver. v2
refuses it in .port_mdb_add. FDB entries are not affected: br_fdb_add()
requires the VLAN on the port, and .port_vlan_add refuses the reserved
range on user ports and on the CPU port.

>> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_mdb.c
>> new file mode 100644
>> index 0000000000000..6864b89d5a2d4
>> --- /dev/null
>> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_mdb.c
>> @@ -0,0 +1,256 @@
>
> [ ... ]
>
>> +static void lan9645x_mdb_entry_destroy(struct lan9645x *lan9645x,
>> +				       struct lan9645x_mdb_entry *mdb_entry)
>> +{
>
> [ ... ]
>
>> +	err =3D lan9645x_mact_forget(lan9645x, mdb_entry->mac, mdb_entry->vid,
>> +				   mdb_entry->type);
>> +	if (err)
>> +		dev_err(lan9645x->dev, "Forgetting %pM vid %u returned %pe\n",
>> +			mdb_entry->mac, mdb_entry->vid, ERR_PTR(err));
>> +	else if (mdb_entry->type =3D=3D ENTRYTYPE_LOCKED)
>> +		clear_bit(mdb_entry->pgid, lan9645x->mdb_pgids);
>> +
>> +	list_del(&mdb_entry->list);
>> +	kfree(mdb_entry);
>> +}
>
> [Severity: Medium]
> What happens to the hardware entry when lan9645x_mact_forget() fails
> here?
>
> lan9645x_mdb_del() has already cleared the port from mdb_entry->ports.
> When the mask reaches zero, it calls lan9645x_mdb_entry_destroy() without
> first writing the narrowed mask to hardware:
>
> lan9645x_mdb_del() {
>     ...
>     mdb_entry->ports &=3D ~BIT(chip_port);
>
>     if (!mdb_entry->ports) {
>         lan9645x_mdb_entry_destroy(lan9645x, mdb_entry);
>         goto out;
>     }
>     ...
> }
>
> If the forget then times out, or the regmap read in
> lan9645x_rd_poll_timeout() fails, the software entry is still freed but
> the MAC table entry stays valid:
>
> - For an L2 group, its ANA_PGID mask still contains the departing port.
> - For an IPv4/IPv6 group, the encoded portmask and MAC_CPU_COPY still
>   include it.
>
> Wouldn't traffic keep being forwarded to a port the bridge has already
> removed?
>
> The PGID bit also stays set in mdb_pgids, but the only object that knew
> about it has been freed. Can that PGID ever be reclaimed? A re-add of the
> same (mac, vid) misses the lookup and allocates a new PGID. Each such
> failure then seems to lose one of the general purpose PGIDs until the nex=
t
> setup.
>
> For L2 groups, would it help to write a zero ANA_PGID mask before the
> forget? That is a plain register write and does not depend on the MAC
> table command, so any leftover entry would forward nowhere.
>
> Two related cases.
>
> In lan9645x_mdb_del(), when other ports remain, ports is updated before
> the CMD_LEARN rewrite for IP groups. If lan9645x_mdb_write_ports() fails,
> software no longer lists the port but hardware still does.
>
> In lan9645x_mdb_entry_create(), ANA_PGID(pgid) is programmed before
> CMD_LEARN:
>
>     err =3D lan9645x_mdb_write_ports(lan9645x, mdb_entry, mdb_entry->port=
s);
>     if (!err && mdb_entry->type =3D=3D ENTRYTYPE_LOCKED)
>         err =3D lan9645x_mact_learn(lan9645x, mdb_entry->pgid, addr, vid,
>                                   mdb_entry->type, false);
>
> An -ETIMEDOUT from the learn only means the command did not reach IDLE in
> time. It does not mean the learn was dropped. The PGID is left unreserved
> while its mask is live. Could a later reuse of that PGID redirect an
> orphaned entry?
>
> The commit message says:
>
>     A failed MAC table command is logged instead.
>
> Does that fully describe the stale forwarding and the lost PGID above?
> This code is unchanged through the end of the series.
>

This is intended. The MAC table finishes a command in a bounded number of
cycles, far below the poll timeout, so the MAC table command only fails whe=
n the
register bus is broken.

We do not try to stay defensive against a broken bus. Doing so would requir=
e us
to keep track of failed hw ops and retry them either periodically or on
subsequent add/del callbacks. I do not see other drivers doing something li=
ke
this.

The delete path has no useful way to report an error here:
switchdev_port_obj_del_deferred() only logs the error, br_switchdev_mdb_rep=
lay()
stops at the first failed entry, and nothing retries a failed delete. There=
fore,
we just log the error.

The PGID stays reserved on purpose, because the stale mac entry may still p=
oint
at it, and reusing it would redirect that entry to another group. A later a=
dd of
the same group relearns the mac entry. Writing an empty mask before the for=
get
would blackhole the group, which has never been requested, so it is better =
to
continue forwarding as previously requested, until the group gets another a=
dd.

The two related cases are the same. When the narrowed mask of an IP group
cannot be written, the port is still dropped from the software state, since=
 the
bridge does not retry the delete and the group could otherwise never reach =
zero
ports.

The next add or delete of the group writes the full mask again. In
lan9645x_mdb_entry_create() the only learn failure with a working bus is -E=
NOSPC
from ANA_ANEVENTS.CPU_LEARN_FAILED, which means the hardware dropped the le=
arn,
so no entry points at the PGID and it can be reused.

>> +int lan9645x_mdb_add(struct lan9645x *lan9645x, int chip_port,
>> +		     const unsigned char addr[ETH_ALEN], u16 vid)
>> +{
>
> [ ... ]
>
>> +	mdb_entry =3D lan9645x_mdb_entry_lookup(lan9645x, addr, vid);
>> +	if (!mdb_entry) {
>> +		err =3D lan9645x_mdb_entry_create(lan9645x, chip_port, addr, vid);
>> +		goto out;
>> +	}
>> +
>> +	if (mdb_entry->ports & BIT(chip_port))
>> +		goto out;
>
> [Severity: High]
> Can two IP groups that map to the same multicast MAC on one port break
> each other here?
>
> br_switchdev_mdb_populate() converts IP groups to MAC addresses with
> ip_eth_mc_map() and ipv6_eth_mc_map(). For example, 224.1.1.1, 225.1.1.1
> and 239.129.1.1 all become 01:00:5e:01:01:01. For IPv6, groups with the
> same low 32 bits share a 33:33 MAC.
>
> DSA does not refcount MDB entries on user ports:
>
> net/dsa/switch.c:dsa_port_do_mdb_del() {
>     ...
>     /* No need to bother with refcounting for user ports */
>     if (!(dsa_port_is_cpu(dp) || dsa_port_is_dsa(dp))) {
>         err =3D ds->ops->port_mdb_del(ds, port, mdb, db);
>     ...
> }
>
> Suppose port P joins group A and then group B with the same MAC. The
> second lan9645x_mdb_add() returns 0 here without recording anything. When
> A is deleted, lan9645x_mdb_del() clears P from the shared entry and
> rewrites or destroys it, even though B is still joined on P in the bridge=
.
>
> Forwarded frames carry offload_fwd_mark, so the software bridge does not
> make up for this, and P stops receiving B in hardware.
>
> With IGMP/MLD snooping, joins and leaves come from remote hosts. A host o=
n
> P's segment could join and then leave 224.1.1.1 and stop delivery of
> 239.1.1.1 to a listener on P. The listener's later reports only refresh
> the existing bridge port group. They do not send a new switchdev add.
>
> Does the (mac, vid) entry need a per-port reference count to handle this?
>
> The user-port path becomes reachable once the later "net: dsa: lan9645x:
> add bridge support" patch adds .port_bridge_join, and this code is
> unchanged there.
>
> [ ... ]

This aliasing problem is right, but I believe this is preexisting, and that=
 the
fix needs to be in the bridge core.

A reference count in the driver cannot be balanced. The switchdev MDB
object only carries the group MAC and VID, and the bridge also sends an
add for a port group that already exists: on bridge mdb replace
(br_mdb_replace_group_sg() and br_mdb_replace_group_star_g()), when an
IGMPv3/MLDv2 report changes the source list or filter mode, and when the
group timer moves a group to INCLUDE mode. The delete is sent once per
port group. These two sequences

  bridge mdb add dev br0 port swp0 grp 239.1.1.1 permanent
  bridge mdb add dev br0 port swp0 grp 224.129.1.1 permanent
  bridge mdb del dev br0 port swp0 grp 224.129.1.1 permanent

  bridge mdb add dev br0 port swp0 grp 239.1.1.1 permanent
  bridge mdb replace dev br0 port swp0 grp 239.1.1.1 permanent
  bridge mdb del dev br0 port swp0 grp 239.1.1.1 permanent

both reach the driver as add, add, del of 01:00:5e:01:01:01. After the firs=
t,
swp0 must stay in the entry for 239.1.1.1. After the second, the bridge no
longer has the group and swp0 must leave it. The driver cannot tell them ap=
art,
since the IP group is not in the object. DSA does not count user port MDB
entries either, and ocelot, lan966x and mv88e6xxx behave the same way.

Fixing the aliasing needs a bridge change: either notify switchdev only whe=
n a
port group is created, so that adds and deletes balance and a per-port coun=
t
works, or pass the group address in the object, so that drivers can track p=
ort
groups themselves.

pw-bot: cr

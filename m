Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127796;
	b=xQNIbsZlOPNMnhf5iQyF84gDrPKXQGWkmulb+nvV8S5LG0zvAiXTgRSNdgeF2SsiJ7kL
	 LDOHYMxUvpT9LzvNRhYfSwsFAhZ9bDIN7qUK+SimT/ZKaJZypMiCoM9c835fm8sXbZhTQ
	 3+9a8LsmBjy6Y67zvqEzUbK+cQ7hE3/sn9141Og0QY8GX514+w9vRfGSivG+ewgyjjBre
	 wIYvoev9N+6xu8kCczFo/MjKm4x2ys1M6si1Kjw0u76/jblYfdUgH9NATkTiuWpXyOddl
	 azju3eRsF76Z9Cd7JJy/4zCyEXR5oxd3CZbZhxgKdR4m6qjZXrmRVYlrw2QC18kCB3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127796;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7i4fh5aiRnFSzaY9m1yacRACym/fGsy7DpeSNw3ZBCQ=;
	b=2YYh31PZnJAgWDnINPlKdQJEBGAynNCVTKjWtnjYMecoYrhhPoXsM8vKh/673QCJwLfp
	 uq03UC24hjAm1BDociJ+f7mZOAyXs6jK+uQmOh731oOoFxeL9PVvhftQCb5Z6Sickhqzf
	 6PmJ7OJwJw4tbvCaZkwsw4BvOece9dI67oC3NEOM5TQ1kW5ahAiEct+mGCvmek2P0qYhD
	 kjc/Ad30HfOOYUxXJmpV2bxucgr+HEZf2LP5mJXVG+xjAt0qopvQZUcSdk9+A3PLVCd/f
	 Y+vyHmcn2YPdaGH/Y1nf9uc4lN+x8ZSv/V2pKm01dZe8jgwGmNet5vUwNTgZhLaapxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9XSN3rl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D460A260A;
	Thu, 19 Nov 2026 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9XSN3rl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3677E1F000CA;
	Thu, 19 Nov 2026 22:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127796;
	bh=7i4fh5aiRnFSzaY9m1yacRACym/fGsy7DpeSNw3ZBCQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n9XSN3rlC4F6V45SeNpKA6AhVtsyjF4k179F/QHkbvi8aRhNjCyYMc4R75rrZtV93
	 pHJqzgi4p9eZGInJ43PieMlJRHXJjA46K/zb8OUIFlileX1zb8JopvT3oAYyhaylqy
	 anW8UsjVDKCdrkC4RdDZzud7OD6aIrwfaFkZ91OQBRwqP5ObQ0qSHLMkUuydsfiMjb
	 XNmqIQ69SpCRAf42X+kavrxo/HJ8+l+p9oihZ7poVxgVexHLpmOy2XyXNuBi1NJnNu
	 Oo4Ci8kXScz0HtalpkQdGeyVWrTru1y6bmjAH6PO5Tk3DQRyWQQmGfflce0ZXKgOuS
	 d+vslUYEX1NPA==
Subject: Re: [PATCH net-next v11 12/13] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Thu, 19 Nov 2026 22:36:34 +0000
Message-ID: <179512779480.3136.6628132114649129693@kernel.org>
In-Reply-To: <f98ff821-bb91-4bb7-8d8a-0f018312291e@yahoo.com>
References: <f98ff821-bb91-4bb7-8d8a-0f018312291e@yahoo.com>
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

- [High] On family D, standalone ports, ports of bridges left to
  software, and the offloaded VLAN-unaware bridge all share one LUT…
- [Medium] On family D, static MDB entries (and static FDB entries)
  installed for a VLAN-unaware bridge with VID 0 are deliberately…
- [Medium] rtl8365mb_setup() sets `ds->max_num_bridges = 1` on family D.

--

net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

This commit teaches the rtl8365mb table and L2 code about the family D
(RTL8367S-VB) LUT. It adds 5-word unicast and multicast entry
(de)serializers that use the SVL key for VID 0, a lookup-before-delete in
l2_del_uc, and a LUT init step. On family D, port_set_efid() becomes a
no-op, fdb_isolation is not advertised and max_num_bridges is set to 1.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
> index cd5b333932bee..e98ba5c5f9193 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c

[ ... ]

> @@ -240,6 +255,78 @@ void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,

[ ... ]

> +void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
> +			       u16 *data)
> +{
> +	/* Same as for unicast: VID 0 means a VLAN-unaware bridge, use SVL. */
> +	bool ivl = mc->key.ivl && mc->key.vid;

[Severity: Medium]
With a VLAN-unaware bridge, MDB entries arrive here with VID 0. They are
written with the SVL key (IVL=0, FID 0), which standalone and
software-bridged ports also look up.

rtl8365mb_d_lut_init() also clears IPMC_HASH, so IP multicast is looked up
by DMAC too:

	ret = regmap_update_bits(priv->map, RTL8365MB_D_LUT_CFG_REG,
				 RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK |
				 RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK, 0);

Take a multicast frame that arrives on a standalone port such as WAN, with
a DMAC that matches a bridge MDB group. It would hit this static MC entry.
The member mask holds only bridge ports, plus the CPU port only if the
host itself joined.

After masking with the standalone port's isolation mask (CPU port only),
is the egress set empty, so the frame is dropped instead of reaching the
CPU?

A LAN host can reach this path with IGMP/MLD reports, since snooping is on
by default:

  rtl83xx_port_mdb_add()
    rtl8365mb_l2_add_mc()
      rtl8365mb_d_l2_mc_to_data()    /* vid 0 -> IVL=0, FID 0 */

Two examples:

- A LAN host joins the solicited-node group of the router's WAN IPv6
  address, so NS frames arriving on WAN are blackholed.
- In an igmpproxy/IPTV setup, the LAN client's join on br-lan blackholes
  the stream arriving on the standalone WAN port.

MC entries have no age field, and the bridge refreshes MDB entries on
every report. So the drop would last as long as the bridge MDB entry
exists.

The commit message describes the shared FID 0 problem only for learned
unicast:

  "... until the entry ages out or is replaced."

  "This needs a host on the local L2 segment and is bounded by the aging
  time."

The existing comment in rtl8365mb_l2_add_mc() says:

  However, traffic isolation is still maintained
  because the hardware applies the port isolation masks
  (pmasks) configured in bridge_join after the L2 lookup.

Do these cover frames from non-member standalone or software-bridged ports
being dropped? The same question applies to VID 0 static FDB entries built
by rtl8365mb_d_l2_uc_to_data(), which do not age either.

I could not confirm from the code alone that multicast lookups from a
standalone port hit the same SVL entry. This is inferred from the unicast
behaviour and the MDB flood test described in the commit message.

> +
> +	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);

[ ... ]

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 0cec3b601998f..c7f209b41cac9 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -2673,6 +2685,10 @@ static int rtl8365mb_port_pre_bridge_flags(struct dsa_switch *ds, int port,
>  static int rtl8365mb_port_set_efid(struct realtek_priv *priv, int port,
>  				   u32 efid)
>  {
> +	/* Family D has no EFID; see RTL8365MB_D_LUT_CFG2_REG. */
> +	if (rtl8365mb_is_d(priv))
> +		return 0;
> +

[Severity: High]
With this no-op, and with ds->fdb_isolation not set on family D, three
groups of ports share one LUT keyspace (SVL, FID 0): standalone ports,
software-bridged ports and the offloaded VLAN-unaware bridge. Learning
stays enabled on the offloaded bridge ports.

dsa_switch_supports_uc_filtering() requires fdb_isolation:

net/dsa/user.c:dsa_switch_supports_uc_filtering() {
	return ds->ops->port_fdb_add && ds->ops->port_fdb_del &&
	       ds->fdb_isolation && !ds->vlan_filtering_is_global &&
	       !ds->needs_standalone_vlan_filtering;
}

So DSA never installs static CPU-port entries for the standalone ports'
own MACs.

Can a host on an offloaded bridge port send frames with its SA set to a
standalone port's MAC? A common case is the WAN MAC in the usual
standalone WAN plus VLAN-unaware br-lan layout. The switch would learn
that MAC in FID 0 on the attacker's port.

Unicast arriving on WAN for that MAC would then hit the entry, be masked
by WAN's isolation mask (CPU only), and be dropped. If the host keeps
sending the spoofed SA, the entry stays alive past the aging time. The
tester also saw this happen without an attacker, when the same MAC was
learned on the bridge side.

This seems to conflict with Documentation/networking/dsa/dsa.rst.
Standalone ports are expected to use a port private database. Ports under
a software bridge "must remain configured in the same way as for
standalone operation ... and send all received packets to the CPU port
only".

The commit message says:

  "Avoiding it needs a per-bridge FID, which this chip does not have
  without EFID, so it is a known limitation."

Is that accurate? Family D VLAN 4K entries have a FID field, written by
rtl8365mb_d_vlan_4k_write():

	data[1] |= FIELD_PREP(RTL8365MB_D_CVLAN_ENTRY_D1_FID_MASK,
			      vlan4k->fid);

Could the standalone and bridge domains be split by VLAN/FID instead?
Other options might be:

- installing static CPU-port entries for the standalone ports' MACs
- not offloading a VLAN-unaware bridge, or not enabling learning on it,
  while other user ports are standalone

[ ... ]

> @@ -3623,9 +3665,19 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
>  		goto out_teardown_irq;
>  
>  	ds->assisted_learning_on_cpu_port = true;
> -	ds->fdb_isolation = true;
> -	/* The EFID is 3 bits, but EFID 0 is reserved for standalone ports */
> -	ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	if (!rtl8365mb_is_d(priv)) {
> +		ds->fdb_isolation = true;
> +		/* The EFID is 3 bits, but EFID 0 is reserved for standalone */
> +		ds->max_num_bridges = FIELD_MAX(RTL8365MB_EFID_MASK);
> +	} else {
> +		/* No EFID, so bridges cannot be told apart in the LUT: allow
> +		 * at most one offloaded bridge. Bridge numbers are allocated
> +		 * system-wide by DSA, so if another switch already holds
> +		 * bridge 1, the bridge here will fall back to software
> +		 * forwarding.
> +		 */
> +		ds->max_num_bridges = 1;

[Severity: Medium]
Does max_num_bridges = 1 limit this switch to one offloaded bridge?

dsa_bridge_num_get() returns a number found in any tree without comparing
it to max:

net/dsa/dsa.c:dsa_bridge_num_get() {
	unsigned int bridge_num = dsa_bridge_num_find(bridge_dev);
	...
	if (!bridge_num) {
		...
		bridge_num = find_next_zero_bit(&dsa_fwd_offloading_bridges,
						DSA_MAX_NUM_OFFLOADING_BRIDGES,
						1);
		if (bridge_num > max)
			return 0;
		...
	}

	return bridge_num;
}

dsa_port_bridge_create() then rejects only a zero number:

	bridge->num = dsa_bridge_num_get(br, ds->max_num_bridges);
	if (ds->max_num_bridges && !bridge->num) {

Consider a system with a second DSA tree, for example a family C switch
with max_num_bridges = 7. Suppose br0 and br1 were first created there and
got numbers 1 and 2. Could ports of the family D switch then join both
bridges, with both offloaded here?

The driver does not count offloaded bridges either.
rtl83xx_port_bridge_join() only passes bridge.num to port_set_efid(),
which is now a no-op on family D.

The two bridges would share the LUT keyspace, separated only by the
isolation masks. On family D, rtl8365mb_l2_del_uc() matches only MAC, VID
and port. Could an fdb_del for one bridge remove the other bridge's entry,
for example a host entry on the shared CPU port?

The comment above says the bridge falls back to software forwarding if
another switch already holds bridge 1. That only holds when a new number
has to be allocated, not when the same bridge already has a number from
another tree.

> +	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cf3fd237-2290-4002-8de0-ea4100ef0f85%40yahoo.com

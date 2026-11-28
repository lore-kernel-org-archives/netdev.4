Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858219;
	b=gv/hyFZroD3T31U5mU8P1K1hwTOat5WJfMKxRIxt4mpQTzITtjItIOnCN6MFEfs+lf9T
	 n+KF6FoAUkgC0ADL1jCIFLESAmbLI1m2xLCKB/oMVe6CPn4eqpyY5xgqs1+HC+DSXq1CM
	 s52Zm3T6KfFYuiGEgc6VbKQFb21o0xC6Ff9tYjW+MKwFVtQsb4OtJwWH6M7/JD9iUOy4B
	 QeDaqUb6NrgJtchMA+V0tg7UCN7Ay3zKRV96zDql0ZltkIyAR4WoOslOVsURdhFYf4t0N
	 4/Kcxbcu3izyypNHw7dypXGDigZowgN+WyPsDkIyqmaqwKExkml4Q+X6dECvMsZ6JvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858219;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1NdFSc4Q5nm/FDad+O4eAYEhWlUETJkfgU3eFUfziiE=;
	b=fAIaHkPMB6t6PMI8X4VMLGRSngQlaG6UzPNtRlPvhb0j3hECadXShiDO+RQLjlNJMCQw
	 dc8NEvJ/ZPRH3pwwpGACuo0OwvrTL7IX8SO/h0Een03rtyRgLWlb2du/foHMRvGp+yclT
	 t5AJYvgOnaiG7ZRshQqttYx8OfFwfLx1Y9bT1kvG+cIVVeLYMemxT59n29j81msIPyZrn
	 mijRSrh0qxiQp0NnAwyTuGHXYXzBi3WzYbuYG6WuB3IhnyOuFSsAMA7zDZtIhVEsSx86o
	 KhwtQTKvphcrE0qkjUG4tcnb6FiwJADpsx6N8OOF37oikXC0uydQqSuhAFE1AjqexLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzDkb99T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316E4606A68D;
	Sat, 28 Nov 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzDkb99T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2360D1F00897;
	Sat, 28 Nov 2026 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795858218;
	bh=1NdFSc4Q5nm/FDad+O4eAYEhWlUETJkfgU3eFUfziiE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MzDkb99TYZP55O+y5EEc2+XLVzozaw5R+MsqdFl6y58L/dHjIhssXH0wFvW1g8wRC
	 +8Z5NgTAIleI9C2nU6kaRGpwUyZtt/MT3uvxCCwRuv0Ttu/J4nUDAxsW1eU1Xq/J7j
	 XRj4ZFBsCDTy8czuzHWsNbTVtxMkhaXiIeY2wWxmTXBKlYow46Hc1tGQuRlOyo6xAw
	 guWI3RgdcRQJMbgD3bLjHX8grfeaSgw2p65LRiNBAeuLuSOmBYg2qlUeL/oRDq7dt7
	 3mPw4UcrnKV/gC7n90JMRFRpzN0Tq9g90mAGo2ij9WD5YFnSVhCHCUR3a/5XopBgVY
	 ZwL9QqlLEOrzg==
Subject: Re: [PATCH net-next v2 5/5] net: dsa: lan9645x: add bridge support
From: netdev-bot+sashiko@kernel.org
To: jensemil.schulzostergaard@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Sat, 28 Nov 2026 09:30:17 +0000
Message-ID: <179585821765.3135.11957570145287110531@kernel.org>
In-Reply-To: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-5-84adcd919dac@microchip.com>
References: <20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-5-84adcd919dac@microchip.com>
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

- [Medium] The 802.1Q-only restriction for VLAN-aware bridges is checked
  only when a port joins, in lan9645x_port_bridge_join() through…
- [Low] In lan9645x_port_mdb_add(), the existing `mdb->vid > VLAN_MAX`
  check (returns -EOPNOTSUPP) runs before the new…

--

net: dsa: lan9645x: add bridge support

This adds hardware bridge offload to the lan9645x DSA driver. Up to 8
bridges are supported, each VLAN-unaware bridge gets its own reserved VID,
and at most one bridge can be VLAN-aware. The patch adds STP, learning,
flooding, host flood and ageing support, and refuses vlan_filtering
changes while ports are bridged. It also does not install FDB or MDB
entries that carry a VID on a VLAN-unaware bridge.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> index e840de1c918ba..94b46082cf5c4 100644
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c

[ ... ]

> +static bool lan9645x_bridge_vlan_proto_ok(const struct net_device *br)
> +{
> +	u16 proto;
> +
> +	return !br_vlan_enabled(br) || br_vlan_get_proto(br, &proto) ||
> +	       proto == ETH_P_8021Q;
> +}

[ ... ]

> +static int lan9645x_port_bridge_join(struct dsa_switch *ds, int port,
> +				     struct dsa_bridge bridge,
> +				     bool *tx_fwd_offload,
> +				     struct netlink_ext_ack *extack)
> +{

[ ... ]

> +	if (!lan9645x_bridge_vlan_proto_ok(bridge.dev)) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Only 802.1Q VLAN-aware bridges are supported");
> +		return -EINVAL;
> +	}

[Severity: Medium]
Is checking the protocol only in lan9645x_port_bridge_join() enough to
keep the hardware and the software bridge in agreement?

Once a port has joined, a protocol change goes through
__br_vlan_set_proto() in net/bridge/br_vlan.c:

	err = switchdev_port_attr_set(br->dev, &attr, extack);
	if (err && err != -EOPNOTSUPP)
		return err;

The attribute is sent with SWITCHDEV_F_SKIP_EOPNOTSUPP. net/dsa/ has no
handler for SWITCHDEV_ATTR_ID_BRIDGE_VLAN_PROTOCOL, so a command like
"ip link set br0 type bridge vlan_protocol 802.1ad" succeeds on a
VLAN-aware bridge that already has lan9645x ports.

After that, the hardware still treats 0x8100 tags as VLAN tags, but the
software bridge uses 802.1ad. Take a 0x8100-tagged VID 20 frame that
arrives on a port with pvid 10, where the port is also a member of VLAN
20. The hardware forwards it in VLAN 20, but the bridge policy would
classify it to VLAN 10.

The commit message mentions this limitation:

  DSA does not pass SWITCHDEV_ATTR_ID_BRIDGE_VLAN_PROTOCOL to drivers,
  so a protocol change on a bridge that is already VLAN-aware is not
  seen.

It also says "Only bridge vlan_protocol 802.1Q is offloaded", but that
restriction can be bypassed after the join. Should the DSA core either
pass this attribute to drivers or refuse the change while ports are
offloaded?

[ ... ]

> @@ -503,6 +844,9 @@ static int lan9645x_port_mdb_add(struct dsa_switch *ds, int port,
>  	if (mdb->vid > VLAN_MAX)
>  		return -EOPNOTSUPP;
>  
> +	if (lan9645x_db_vid_unused(lan9645x, mdb->vid, &db))
> +		return 0;
> +

[Severity: Low]
Should lan9645x_db_vid_unused() be checked before the VLAN_MAX check
here?

On a VLAN-unaware bridge, an MDB entry with a VID in 4032..4094 gets
-EOPNOTSUPP on add. lan9645x_port_mdb_del() has no range check and
returns 0 through lan9645x_db_vid_unused().

That does not match the commit message, which says "3) An MDB entry can
be added with any VID" and "they are accepted without being installed".
It also does not match the comment above lan9645x_db_vid_unused():

  so a delete skips exactly the entries that the add skipped.

br_mdb_add() does not check the VID against the VLAN group when
vlan_filtering is off, so a command like this reaches the driver:

  bridge mdb add dev br0 port br0 grp 01:00:5e:01:01:01 permanent vid 4040

For a host MDB the add fails, so dsa_port_do_mdb_add() never adds a
dsa_mac_addr to cpu_dp->mdbs. The later delete then fails in
dsa_port_do_mdb_del() with -ENOENT, and switchdev_port_obj_del_deferred()
logs it as an error.

The hardware ends up the same either way, since the entry is never
installed.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-dsa-lan9645x-add-vlan-and-bridge-offload-v2-0-84adcd919dac%40microchip.com

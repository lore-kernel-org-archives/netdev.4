Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613271;
	b=c55aJ0op7qdwsk5oYVSp87hFjuYEq7ueK5APfLPqvOfifZo36k4N/EtAm0AOHk15cZ1e
	 Cgz41p4zvdomXd8mtHD117zI6f3qSleoTnylmPYGUCE+9QHEaSWy2TT3zh+E1Erq6bXSt
	 366T3CMuX/PO/Kx/r6hrpb7NdEbeO4oXPW+hXnGi1a4q0+Rdg2otaOOxrcqP5lZZWiNRW
	 DUsPzByd2/Wj5xtMUL4ZUvEPeBv20QX/WjzpdqXZsQz9w/L2YrrWS2TyPkhVBbsU+KKqN
	 ZqHgtDXIRalySfAWrrH3d5KTNmncLBjH32DB9BLeVeFyKQMJPsUkEwTWPc1Wrn6k/xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613271;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-ID:To:Subject:CC:
	 From:X-Mailer:References:In-Reply-To;
	bh=Jn/VIUd4AaWMYZGQhKELRcKfGOwury85Du+TA9QR8rA=;
	b=xewrArdQIL8AecvmplKEn0mGAMKLLjcOmlkTrhisvoVW1Ksi7i0qHn5/PmLN5GVdpeyq
	 d07/OMWiqfcaHvWwC3iSnfNmTYzRXy1sKMKIwK+iKh2Ab/D4+omV2lJJAJq6KY97S7tlr
	 Qmj5Ui+ijJ0XQx+DWtRQGzE/1GmoVtZnam/UORlSTnOiuhWoVeOZkY1gwHEH3cAQ/67pm
	 MHTtDMQe1Sd5VjPWZ575MUQdNTGOWpKu8TH+2WAYVcz7YqqdBDfzvcenmJeSsNQH6iyLz
	 vTq/vHU9Jmu2S/e2B6ZqamMzm4g7KjiAFffpm1F+wMU/ugK0LPB7p7K6tcwCSxS+kww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Plc5oICs;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E595F606A31E;
	Wed, 25 Nov 2026 13:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E595F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Plc5oICs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795613271; x=1827149271;
  h=mime-version:content-transfer-encoding:date:message-id:
   to:subject:cc:from:references:in-reply-to;
  bh=KmRzLrvRiOd8FFDhQI5mUOmMtQ7hHtwjDRmCIElWbos=;
  b=Plc5oICsmObFXIJHXKq45qpAxhZSRQgunkYVnFcgj6FzGQIxe12AyYNZ
   RpEX2SqB3vYuQHiOHdVuKvhYtJzze5HUVamDAOM7Hcdh1RVpClk6nuezo
   q6wyo5j27nLKhSrsou/xMUj+MxAypumWJoguTqXChaEve4lzooC1MXFxZ
   zp8SPKia6kMPdAXFDmrGppeMqGU5SqysGJQ7+InvLaNgdTrF745y1FpfP
   MrX+6wXdMB5oHSwhT0wgkf4EZBIN4LAQ0tlyAhgzBAGrL1HXzjjRn6GbK
   VizbPjTJxMSLRbZqdgeh6utVINkSiJNATkn5UQC6gzgDsiFucG4/XQysu
   Q==;
X-CSE-ConnectionGUID: 4qofo+olT9iWVvaqOzshEA==
X-CSE-MsgGUID: 2d4OcOZ1QSaQOQdDZSgmGQ==
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="67268000"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:27:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Wed, 25 Nov 2026 06:27:49 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Wed, 25 Nov 2026 06:27:49 -0700
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
Date: Wed, 25 Nov 2026 14:27:47 +0100
Message-ID: <DN4BS3G13BGT.1VM1EI873BRWR@microchip.com>
To: <netdev-bot+sashiko@kernel.org>, <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next 5/5] net: dsa: lan9645x: add bridge support
CC: <UNGLinuxDriver@microchip.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linux@armlinux.org.uk>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: aerc 0.21.0
References: <20261124-dsa-lan9645x-add-vlan-and-bridge-offload-v1-5-b930a1dae700@microchip.com> <179559711039.3135.10067666642818194046@kernel.org>
In-Reply-To: <179559711039.3135.10067666642818194046@kernel.org>

On Wed Nov 25, 2026 at 9:58 AM CET, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] lan9645x_port_bridge_join()
>   (drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:544) stores=E2=80=
=A6
> - [Medium] lan9645x_fdb_vid()
>   (drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:692) only switches=
=E2=80=A6
>
> --
>
> net: dsa: lan9645x: add bridge support
>
> This adds hardware bridge offload to the lan9645x DSA driver. Each
> VLAN-unaware bridge gets its own reserved VID, and at most one bridge can
> be VLAN-aware. The CPU port is no longer in the default unicast and
> multicast flood masks; .port_set_host_flood adds it instead. The patch
> also adds ageing time configuration with min/max limits.
>
>> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/driver=
s/net/dsa/microchip/lan9645x/lan9645x_main.c
>> index de432772f6399..a78410efb9730 100644
>> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
>> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
>
> [ ... ]
>
>> @@ -306,6 +302,20 @@ static int lan9645x_setup(struct dsa_switch *ds)
>>  	ds->mtu_enforcement_ingress =3D true;
>>  	ds->assisted_learning_on_cpu_port =3D true;
>>  	ds->fdb_isolation =3D true;
>> +	ds->max_num_bridges =3D ds->num_ports;
>
> [ ... ]
>
>> +static int lan9645x_port_bridge_join(struct dsa_switch *ds, int port,
>> +				     struct dsa_bridge bridge,
>> +				     bool *tx_fwd_offload,
>> +				     struct netlink_ext_ack *extack)
>> +{
>
> [ ... ]
>
>> +	p =3D lan9645x_to_port(lan9645x, port);
>> +
>> +	mutex_lock(&lan9645x->fwd_domain_lock);
>> +
>> +	p->bridge_num =3D bridge.num;
>> +	lan9645x_vlan_port_set_bridge_vid(p, !p->vlan_aware);
>
> [Severity: Medium]
> Can bridge.num be larger than num_phys_ports here?
>
> lan9645x_vlan_init() only adds the CPU port module to the reserved VIDs
> for bridge numbers 1..num_phys_ports:
>
>     for (bridge_num =3D 1; bridge_num <=3D lan9645x->num_phys_ports;
>          bridge_num++) {
>         vid =3D lan9645x_vlan_unaware_pvid(bridge_num);
>         lan9645x->vlans[vid].portmask =3D BIT(lan9645x->num_phys_ports);
>         ...
>     }
>
> Setting ds->max_num_bridges =3D ds->num_ports does not appear to limit th=
e
> number the DSA core passes in. In net/dsa/dsa.c, dsa_bridge_num_get()
> first calls dsa_bridge_num_find(). That function searches every tree in
> dsa_tree_list and returns an existing number without comparing it to max.
> The "bridge_num > max" check only runs when a new number is allocated.
>
> Take a bridge that first gets a number N >=3D 10 from a switch in another
> DSA tree with a larger max_num_bridges (mv88e6xxx, sja1105 or vsc73xx).
> If a lan9645x port then joins the same bridge:
>
> lan9645x_port_bridge_join()
>   p->bridge_num =3D N
>   lan9645x_vlan_port_set_bridge_vid(p, true)
>     vlans[VLAN_N_VID - N].portmask |=3D BIT(port)
>     lan9645x_vlan_hw_wr()
>       cpu_dis =3D !(v->portmask & BIT(lan9645x->num_phys_ports));  -> 1
>
> ANA_PGID_CFG_OBEY_VLAN is set for the destination PGIDs. Would that mean
> no frame classified to this VID is ever copied to the CPU? That would
> cover broadcast, host FDB/MDB entries pointing at PGID_CPU, and host
> flooding. The host stack and software forwarding to the other tree's
> ports would then stop working for that bridge.
>
> Should the join reject bridge.num > num_phys_ports, or should the
> reserved VID be set up when it is first used?
>

Yes this looks correct. v2 rejects a bridge number above max_num_bridges in
.port_bridge_join with -EOPNOTSUPP, so the port falls back to software brid=
ging,
as when DSA runs out of bridge numbers.

> [Severity: Medium]
> Several bridges can now be offloaded at once. Does lan9645x_fdb_vid()
> still keep the FDB of a VLAN-unaware bridge separate from the FDB of the
> VLAN-aware bridge?
>
> It only maps vid =3D=3D 0 to the bridge's reserved VID:
>
> drivers/net/dsa/microchip/lan9645x/lan9645x_main.c:lan9645x_fdb_vid() {
> 	if (vid)
> 		return vid;
>
> 	return lan9645x_vlan_unaware_pvid(db->type =3D=3D DSA_DB_BRIDGE ?
> 					  db->bridge.num : 0);
> }
>
> Take "bridge fdb add M dev swpB master static" on a port of
> VLAN-unaware bridge B. br_fdb_add() adds M@0, and also M@vid for every
> VLAN in the port's VLAN group. That includes the default pvid 1, which
> exists even with vlan_filtering=3D0:
>
>     list_for_each_entry(v, &vg->vlan_list, vlist) {
>         if (!br_vlan_should_use(v))
>             continue;
>         err =3D __br_fdb_add(ndm, br, p, addr, nlh_flags, v,
>                            nfea_tb, notified, extack);
>
> DSA passes vid 1 through unchanged, so lan9645x_fdb_add() calls
> lan9645x_mact_learn(lan9645x, port, M, 1, ENTRYTYPE_LOCKED).
>
> B never uses that entry, because its ports classify to the reserved VID.
> Now suppose VLAN-aware bridge A uses VID 1. Would frames to M in A hit
> this locked entry pointing at swpB and be dropped by A's PGID_SRC mask?
> The locked entry would also stop M from being learned on A's real port.
>
> A later fdb_del from B would remove the same hardware entry. That could
> also delete A's own static M@VID1 entry. lan9645x_host_addr_shared()
> only handles collisions between CPU host addresses, not entries for front
> ports.
>
> Before this patch there was no .port_bridge_join, so bridge-DB FDB
> entries never reached this helper. The commit message says the reserved
> VIDs keep the FDB domains apart, but these entries would still overlap.
>
> Should non-zero VIDs from a VLAN-unaware bridge's DB also be mapped to
> its reserved VID, or skipped?

The overlap exists, but it requires both a VLAN-aware and a VLAN-unaware br=
idge
and the same MAC to be a station in both bridges. As far as I can tell this
matches ocelot, which also offloads one VLAN-aware bridge next to VLAN-unaw=
are
bridges and maps only VID 0 in the same way.

Changing the mapping at add time as suggested does not fix it. MAC table en=
tries
are keyed by the VID the port classifies to, and that depends on vlan_filte=
ring,
while the bridge does not notify the FDB entries again when vlan_filtering
changes. An entry added at VID V while a bridge is VLAN-aware stays at V af=
ter
the bridge turns VLAN-unaware, whatever the add path did.

Mapping or skipping non-zero VIDs of a VLAN-unaware bridge would instead le=
ave
the entry missing after the bridge turns VLAN-aware.

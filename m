Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017771;
	b=2aJFkNvpuz1H0SneBJ1MEN9RWGk7Y52GkNroFxziF7MV923TjjmiiXT2Vx8hjwxdb8qF
	 H7X1ZtggF/suYLC3GodQUZf5Lsy0ggXQUsqNbBnW8zL4v8zLl6AwXC9sSVa6J8nXKbe9p
	 H8DRhq2A2m5EJoxDoaEAAlYVxIMAzxhptv54yWnqyPjLWos2tTwxtXpmh0vhbL0XPiFpg
	 EBWFquiUpwAz2IMRC7LJi2R+QF+n618v04oGtuNLj6L1dv33xWXEQRNNMGqGdq2wIk+pr
	 PooCcWzI52/c8wPO3ec4/3wN0ALmBa/Ng2LBa4z8oSomTmDR8kJb2VHYnBKmI4SXfZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017771;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0QYXm/usn5AX/LuaeYvPA5b88k5wfFMxlzRSlq7qFBs=;
	b=TJWw6QpUsm+CGcE4XFqGyk0vlQw0JIiXDetOrIViObkw4e65avEUIHX/DXO0w1lr1CrO
	 r3EVihcMGwpXO5QNsx3Wns7az0MyA9IVczg1/x5N+J8rbD6JG+jrsb2UEtCk5LAs2ADiK
	 moHnBugGX5oEmOtUOoOE9Nxh4ZwQDk/aIP7R7YB1QBScFmSCqjsU3imxDOGQQUwVnyqLT
	 +khg8UHsWmaDXakxQGjo1pu/W0k5/938p2JFHhx5MwyPJUlAYRIWiJ+Ihjl6RL+Q4FXiS
	 oqyVleMUgVrptqNmaxAe2eWwB2C+rj3YlCGapCFulDz8jgbkz+RVg66uCkiSYMkbRuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnLo+mF+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8BC606A320;
	Wed, 18 Nov 2026 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnLo+mF+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA591F000C7;
	Wed, 18 Nov 2026 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017771;
	bh=0QYXm/usn5AX/LuaeYvPA5b88k5wfFMxlzRSlq7qFBs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PnLo+mF+rhc6Z+c6rkZFYpfUeoTB1BYvgaHP/JT+5vZqcuGRIpZ59mN16EKGKBIqX
	 h34KeMZPEK9FRmwiO41XWjADuYFp7OjVdfnBBQlPcskkoVBd2iQgsJmqErj9GMucu3
	 htg6uSB1kVefubwGXfQV2N1uY6hjK9JkduNWD/gjOaj3208A9/pRljOgU1syeA2cCu
	 FFpNiZWSP+CdHyVCA0LPkqP2nFhYwsfPTwKkeDRdOLy0WMVsYNbznnhO5IPloV9gJu
	 yq1j/n5VQ89Ny+jBHUpAHXexWm4UjTQDtLlzH6Odj9FG+oU/QsArN/JilvTVwVIu/h
	 bKaYb/JAqFeYg==
Subject:
 Re: [PATCH net v2 4/4] net: dsa: motorcomm: Use VID 0 as the unaware PVID
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 16:02:50 +0000
Message-ID: <179501777066.3136.14665752486224743787@kernel.org>
In-Reply-To: <20261116160107.1351198-5-mmyangfl@gmail.com>
References: <20261116160107.1351198-5-mmyangfl@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch turns VID 0 into the shared FDB domain of VLAN-
  unaware bridges and removes the YT921X_VLAN_CTRLa_LEARN_DIS that used…
- [Low] After this patch, nothing in the driver ever programs VLAN table
  entry 0.
- [Low] The concern: VID 0 is now the forwarding domain of VLAN-unaware
  bridges, but its VLAN entry is never programmed.

Pre-existing issues:
- [Low] yt921x_bridge_join() first clears YT921X_PORT_LEARN_DIS through
  yt921x_userport_bridge() (line 1301), then writes the isolation…

--

net: dsa: motorcomm: Use VID 0 as the unaware PVID

This patch changes the PVID of ports in VLAN-unaware bridges from 4095 to
0, so the hardware lookups can hit bridge FDB entries that switchdev
reports with VID 0. It also skips VID 0 in the VLAN add/del paths and
programs PVID 0 when a port joins a VLAN-unaware bridge. Finally, it
removes the setup-time write of VLAN table entry 0.

> diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
> index d84d863080ce0..aa4d6a0c930ce 100644
> --- a/drivers/net/dsa/motorcomm/chip.c
> +++ b/drivers/net/dsa/motorcomm/chip.c

[ ... ]

> @@ -1029,8 +1031,7 @@ yt921x_pvid_clear(struct yt921x_priv *priv, int port)
>  
>  	vlan_filtering = dsa_port_is_vlan_filtering(dp);
>  
> -	res = yt921x_port_set_pvid(priv, port,
> -				   vlan_filtering ? 0 : YT921X_VID_UNWARE);
> +	res = yt921x_port_set_pvid(priv, port, 0);
>  	if (res)
>  		return res;

[Severity: Medium]
Ports in a VLAN-aware bridge that have no bridge PVID get hardware PVID 0.
That happens here, and also in yt921x_vlan_filtering() when
br_vlan_get_pvid() returns 0. On those ports, the only extra protection is
YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED.

This patch also makes VID 0 the shared FDB domain of the VLAN-unaware
bridges. It removes YT921X_VLAN_CTRLa_LEARN_DIS from VLAN entry 0 in
yt921x_chip_setup_dsa().

Suppose a VLAN-aware bridge and a VLAN-unaware bridge are on the same
switch. A priority-tagged frame arrives on a VLAN-aware port that has no
PVID. The commit message says such frames are classified to the port
PVID, so this one would be classified to VID 0.

If CVLAN_DROP_UNTAGGED does not drop priority-tagged frames, and the reset
member mask of VLAN 0 lets the frame through VLAN_IGR_FILTER, could its
source MAC be learnt into the FDB that the VLAN-unaware bridges use?

The comment in yt921x_chip_setup_dsa() says port isolation is applied
after the FDB lookup. A unicast frame from the VLAN-unaware bridge to that
MAC would hit an entry pointing at a port in the other bridge. It would be
dropped instead of trapped to the CPU until the entry ages out. The
software bridge would have dropped the original priority-tagged frame,
because the port has no PVID.

Before this patch, LEARN_DIS on VLAN 0 prevented this learning. Could
VLAN-filtering ports without a PVID use a VID other than 0, for example an
unused VID with learning disabled, so their traffic stays out of the
unaware domain?

[ ... ]

> @@ -1135,6 +1138,11 @@ yt921x_dsa_port_vlan_add(struct dsa_switch *ds, int port,
>  	 */
>  	if (dsa_is_cpu_port(ds, port))
>  		return 0;
> +	/* VID 0 is the VLAN-unaware bridges' FDB domain; nothing to program,
> +	 * keep the entry at reset defaults
> +	 */
> +	if (!vid)
> +		return 0;

[Severity: Low]
The comment just above says the CPU port is supposed to be a member of
every VLAN. With this early return, VID 0 never reaches yt921x_vlan_add(),
which is the only place that sets the CPU port bits:

yt921x_vlan_add() {
    ...
	masks[0] = YT921X_VLAN_CTRLa_PORTn(port) |
		   YT921X_VLAN_CTRLa_PORTS(priv->cpu_ports_mask);
    ...
}

VID 0 is now the forwarding domain of the VLAN-unaware bridges, yet entry
0 keeps its reset values for member ports, UNTAG_PORTS, FID and STP_ID.

This is probably fine in practice. The old unaware PVID 4095 was never
programmed either. VLAN_IGR_FILTER is only enabled on VLAN-filtering user
ports, and YT921X_VLAN_EGR_FILTER is never written.

Should the CPU port comment mention the VID 0 exception, though?

[ ... ]

> @@ -1297,6 +1306,14 @@ yt921x_bridge_join(struct yt921x_priv *priv, int port, u16 ports_mask)
>  	if (res)
>  		return res;
>  
> +	if (!vlan_filtering) {
> +		/* DSA may shortcut .port_vlan_filtering(), leaving stale PVID
> +		 */
> +		res = yt921x_port_set_pvid(priv, port, 0);
> +		if (res)
> +			return res;
> +	}
> +
>  	return 0;
>  }

[Severity: Low]
This isn't a bug introduced by this patch, but there is a short window
where frames are learnt under the standalone VID 4095.
yt921x_bridge_join() clears YT921X_PORT_LEARN_DIS in
yt921x_userport_bridge(), then writes the isolation registers in
yt921x_bridge(). Only after that is the PVID moved off 4095 here.

For VLAN-aware bridges, the PVID stays at 4095 even longer. It changes
only when dsa_port_switchdev_sync_attrs() calls dsa_port_vlan_filtering(),
which happens after DSA_NOTIFIER_BRIDGE_JOIN has been handled.

Port isolation is applied after the FDB lookup. Could a standalone port
sending to a MAC learnt in this window have its frame dropped instead of
trapped, until the entry ages out?

This patch makes the unaware window much shorter than before. Would
writing the PVID before clearing LEARN_DIS close what remains?

[ ... ]

> @@ -2335,15 +2352,6 @@ static int yt921x_chip_setup_dsa(struct yt921x_priv *priv)
>  	if (res)
>  		return res;
>  
> -	/* Tagged VID 0 should be treated as untagged, which confuses the
> -	 * hardware a lot
> -	 */
> -	ctrls[0] = YT921X_VLAN_CTRLa_LEARN_DIS | YT921X_VLAN_CTRLa_PORTS_M;
> -	ctrls[1] = 0;
> -	res = yt921x_reg64_write(priv, YT921X_VLANn_CTRL(0), ctrls);
> -	if (res)
> -		return res;
> -
>  	return 0;
>  }

[Severity: Low]
After this removal, does anything in the driver still program VLAN table
entry 0?

yt921x_dsa_port_vlan_add() and yt921x_dsa_port_vlan_del() now return early
for vid 0, and yt921x_dsa_vlan_msti_set() rejects vid 0 with -EINVAL.
Learning and membership in the VID 0 domain therefore depend entirely on
the chip's reset value for entry 0.

The commit message says:

    Lift the restriction on VLAN 0.

The new comment in yt921x_dsa_port_vlan_add() says "keep the entry at
reset defaults". Neither one gives the reset values. Neither says that
the all-ports membership (YT921X_VLAN_CTRLa_PORTS_M) is also dropped.
Neither explains why the workaround in the removed comment is no longer
needed.

The commit message mentions a measurement on YT9215S only. Could it
document which reset value of entry 0 is relied on, and whether that value
is the same on the other supported variants?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116160107.1351198-1-mmyangfl%40gmail.com

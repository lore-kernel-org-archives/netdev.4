Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483484;
	b=rKKkFugHsKYSyaS/vBOJMf1a0nfnuvcT2wEdB3xFvdJA+OJihbQtwB4POtO5YAGJbbCW
	 0HGMq0llBgWLXCvTOW4k5uQvrf2Xp248HjEjwoXesMLN1jgSAeyiBzk/VvOrbYqYGhQIW
	 rf3Dvh/5Vlkb+tachkF54UaZuEWXnVf1TFt8QeV3xAsM/JoZfig/0yQ1aQ6eDLqJBUL2D
	 leORptog5Vch/X4jI6bzo48B+bi3y6fJb9ocVjSIpDQTkMsQrUCXzr+vjtlku64fpbg1h
	 KJAHlZh5BgBOf408svTkHtPwIjIluoEoe36/jFuFIe64Sk8EdkAGLDw3q7F7yBu28gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483484;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NG28A2C4OikQ3XaWsnprxxxGQWHk4dDUl1NFOV2wSx0=;
	b=pQQJcxhvVdNhi7ox9E2zqpq+e+kW6A+8bfVf0FeKu1mgwH7th+fReOLaETpkQUHqFO3J
	 MlOixISoVfWZvheofFBoz9Dh+WXhXTb0yArW4gUPc3EezQiavMAoOYnUS4lAQa1JQgeov
	 KVqi5I1UfNEmt7/Xeh0n7RrfE1t/jfD29qNoW+hczTF8tf1RI+7IK+XlhNE7ZHJkR1pJd
	 uKdbVvknT3xxIgqASttQSQczj16ETdf5fVztK2TECK9sl2WN4hKfXzWLPJeEJaSC0b0pN
	 KaEdak/Z1xAXJUUM6WwxopwCXCTucqHCmMI8eK5u4gaZMRewlOQ1ah4+SzLenYgEx3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U36lc+am;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A5606A333;
	Tue, 24 Nov 2026 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U36lc+am
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B29C1F000E6;
	Tue, 24 Nov 2026 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483484;
	bh=NG28A2C4OikQ3XaWsnprxxxGQWHk4dDUl1NFOV2wSx0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=U36lc+amrLasxatwP83d745Ay+7nGyNAyOC8U9TPeeVUiHay7+ZHzftohvnw0V0F9
	 uHWO2pENXmMoAPHTBb3MgC9x3agSn+S26O6MHbK66d3uCALp6PVDl/XMBTupHRnWo1
	 mBnDJF99zdikQDgMVvyYfQW9pYm17VtpBT5nZwnySmB+AMc/hWOHpYTMwkyUVO9/fB
	 6J5k1XmUWU0y5REwcmMZZkuyqT9ZIQjP0ch8pdq0eq1hDim3R9qZDW/C2bMaWa+HPQ
	 8978TJQK/FHhQ6rdqO+7IorQlbCN1I0TSLZ7ThNfkAZ69Pt9fFZwINGXre8Oz9Yu0p
	 esr5+2vyF9i9A==
Subject: Re: [PATCH net-next v12 12/13] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Tue, 24 Nov 2026 01:24:42 +0000
Message-ID: <179548348297.3135.11750610960946672439@kernel.org>
In-Reply-To: <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com>
References: <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com>
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

Critical: 0 · High: 0 · Medium: 4 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Family D sets `ds->max_num_bridges = 1` in rtl8365mb_setup()
  (drivers/net/dsa/realtek/rtl8365mb_main.c:3728), but DSA hands out…
- [Medium] The comment in rtl8365mb_d_l2_uc_to_data()
  (drivers/net/dsa/realtek/rtl8365mb_l2.c:278-284) says that IVL_EN…
- [Medium] rtl8365mb_d_l2_mc_to_data() (rtl8365mb_l2.c:318) writes VID-0
  MDB entries of a VLAN-unaware bridge with IVL=0, FID 0.
- [Medium] The family D serializers pick IVL from the VID alone (`ivl =
  key.ivl && key.vid`, rtl8365mb_d_l2_uc_to_data() at…

--

net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

This patch adds L2 entry (de)serializers for family D (RTL8367S-VB). It
also adjusts table access for the narrower SPA and address fields, and
adds a LUT init step. EFID handling becomes a no-op on family D,
fdb_isolation is not advertised, and max_num_bridges is set to 1.

Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-6708118180

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_l2.c b/drivers/net/dsa/realtek/rtl8365mb_l2.c
> index cd5b333932bee..e98ba5c5f9193 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_l2.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_l2.c

[ ... ]

> @@ -240,6 +255,78 @@ void rtl8365mb_c_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
>  	data[5] |= FIELD_PREP(RTL8365MB_L2_MC_D5_MBR_HI2_MSK, val);
>  }
>  

[ ... ]

> +void rtl8365mb_d_l2_uc_to_data(const struct rtl8365mb_l2_uc *uc,
> +			       u16 *data)
> +{
> +	/* A VLAN-unaware bridge reaches us with VID 0. The chip learns such
> +	 * traffic in SVL (IVL=0, FID=0), so use the same key here, otherwise
> +	 * the static entry never matches the learned one. Only a real VID
> +	 * selects IVL. IVL_EN of the VLANs follows the VLAN filtering state
> +	 * (see rtl8365mb_d_vlan_4k_refresh_ivl()), so this matches the key
> +	 * the chip learns with.
> +	 */
> +	bool ivl = uc->key.ivl && uc->key.vid;

[Severity: Medium]
Does this comment still hold when one family D switch offloads two
bridges with different vlan_filtering settings?

IVL_EN is decided once for the whole switch, not per bridge. In
rtl8365mb_d_want_ivl(), a single filtering user port is enough:

    dsa_switch_for_each_user_port(dp, ds) {
        if (dp->index == port ? filtering :
                    dsa_port_is_vlan_filtering(dp))
            return true;
    }

rtl8365mb_d_vlan_4k_refresh_ivl() then writes that value to every used
VID, including the default PVID VLAN:

    vlan4k.ivl_en = want_ivl;

The comment in rtl8365mb_setup() says a bridge that already has a number
from another switch can still be offloaded here. So a VLAN-aware bridge
and a VLAN-unaware bridge can both be offloaded on this switch.

With configure_vlan_while_not_filtering set, the VLAN-unaware bridge's
ports keep PVID 1. Would the chip then learn them in IVL with VID 1,
while DSA still passes their FDB/MDB entries with VID 0 and this code
writes IVL=0/FID=0?

If so, it looks like the duplicate key problem from the commit message
comes back for static FDB entries, and MDB entries would stop limiting
the flood. How the chip learns on non-filtering ports is a hardware
assumption here.

> +	u16 id = ivl ? uc->key.vid : uc->key.fid;

[Severity: Medium]
IVL is chosen here from the VID alone, not from whether the bridge is
VLAN-aware. Can a VLAN-aware bridge put a static entry into the shared
FID 0 domain this way?

A VLAN-aware bridge still produces VID-0 FDB entries. For example,
"bridge fdb add MAC dev swpX master static" without a vlan argument
makes br_fdb_add() add a VID-0 entry next to the per-VLAN ones. DSA
passes the VID through unchanged, so the path is:

    rtl83xx_port_fdb_add(vid 0)
      -> rtl8365mb_l2_add_uc()
        -> rtl8365mb_d_l2_uc_to_data()

and it writes a static (age 6) entry with IVL=0/FID 0.

The commit message says standalone and software-bridged ports look up
in that same FID 0. Would unicast to MAC arriving on a standalone port
then hit the swpX entry and be dropped by the isolation mask? The entry
is static, so it would never age out.

In VLAN-aware mode the bridge treats VID-0 entries as matching nothing,
so the software FDB and the hardware LUT would disagree. On family C
the same entry was written with IVL=1, VID 0 and EFID separation, so it
did not affect other ports.

The commit message notes that with a VLAN-aware bridge the drop "did not
happen". Does that observation cover only learned entries, not static
VID-0 ones like this?

> +
> +	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);
> +	rtl8365mb_l2_mac_to_data(uc->key.mac_addr, data);
> +	data[3] = FIELD_PREP(RTL8365MB_D_L2_UC_D3_VID_MSK, id) |
> +		  FIELD_PREP(RTL8365MB_D_L2_UC_D3_IVL_MSK, ivl) |
> +		  FIELD_PREP(RTL8365MB_D_L2_UC_D3_PORT_LO_MSK, uc->port & 0x3);

[ ... ]

> +void rtl8365mb_d_l2_mc_to_data(const struct rtl8365mb_l2_mc *mc,
> +			       u16 *data)
> +{
> +	/* Same as for unicast: VID 0 means a VLAN-unaware bridge, use SVL. */
> +	bool ivl = mc->key.ivl && mc->key.vid;

[Severity: Medium]
VID-0 MDB entries end up in the shared FID 0 SVL key, and
rtl8365mb_l2_add_mc() makes them static:

    mc.member |= BIT(port);
    mc.is_static = 1;

Family D has no EFID, since rtl8365mb_port_set_efid() returns 0. It also
does not set fdb_isolation, so standalone ports get no host MDB entries
and share FID 0 with the VLAN-unaware bridge. Normal IGMP/MLD snooping on
the bridge would then install non-aging entries {G -> bridge ports}.

Would multicast for G arriving on a standalone port (for example a WAN
stream used by igmpproxy) hit that entry and go to the bridge ports?
The standalone port's CPU-only isolation mask would then drop it
instead of delivering it to the CPU.

Any LAN host could trigger this just by sending membership reports, and
it would last as long as the membership is refreshed.

The commit message calls the unicast case "bounded by the aging time"
and "a known limitation of the chip", and only says the same "may apply"
to static multicast entries. These entries do not age, and they come
from the choice to offload VID-0 MDB entries into the shared key.

Could family D avoid offloading VID-0 MDB entries instead, for example
by returning -EOPNOTSUPP for them?

> +
> +	memset(data, 0, RTL8365MB_D_L2_ENTRY_SIZE * 2);

[ ... ]

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index b83e39314708f..bfd7e303ca254 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -3672,9 +3714,19 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
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
> +		 * system-wide by DSA, so this does not stop a bridge that
> +		 * already has a number from another switch from being
> +		 * offloaded here as well.
> +		 */
> +		ds->max_num_bridges = 1;

[Severity: Medium]
Can this block bridge offload on this switch completely if another DSA
switch in the system already holds bridge number 1?

For a new bridge, dsa_bridge_num_get() in net/dsa/dsa.c picks the next
free number from one global bitmap:

    bridge_num = find_next_zero_bit(&dsa_fwd_offloading_bridges,
                                    DSA_MAX_NUM_OFFLOADING_BRIDGES,
                                    1);
    if (bridge_num > max)
        return 0;

If bit 1 is taken, for example by a family C rtl8365mb, mv88e6xxx,
felix, sja1105 or a second RTL8367S-VB, this returns 2 or more and is
rejected with max = 1. dsa_port_bridge_create() then fails:

    bridge->num = dsa_bridge_num_get(br, ds->max_num_bridges);
    if (ds->max_num_bridges && !bridge->num) {
        NL_SET_ERR_MSG_MOD(extack,
                           "Range of offloadable bridges exceeded");
        kfree(bridge);
        return -EOPNOTSUPP;
    }

The bridge then falls back to software, even if it would be the only
bridge on this switch.

The comment and commit message cover only the other direction, where
this limit is not an upper bound. Whether offload works here then
depends on the order in which bridges were created on other switches.

Would a driver-side check in port_bridge_join that tracks the single
bridge offloaded on this switch be a better fit? Family D ignores the
EFID, so max_num_bridges could then stay 0.

> +	}
>  
>  	ds->configure_vlan_while_not_filtering = true;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com

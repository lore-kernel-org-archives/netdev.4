Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483479;
	b=JtyFa/rF/ayqQE921iL7Gs2wh3wcgJmZ/Q8aLEYsP8JjkScB5ynC1AnOa55EDGjY40ng
	 Klmtwp+0jfGh2NdpjfYqB8wTkBcUIqYzwdxmRDXBBOiLosPdaDNWT8PwE+3pyfU1JwNa4
	 dumbM5pBizzKOBcxZTPFqClcOE8Ol3ms2uwWePbGDmdgNazQHa6UjPln9ivJyZSuRzb8r
	 oemoidIVK66wXyZuPgCWUWSn4cciLhxuZL+pmY7FnC81mUAX92ZRqGaXz7/NoZcfK0qE/
	 DvFWswV+Xe9BolqS5apLRPS3i2TTUUD+rVMyQmhtIc2xZYACnVt4PHR1ZXBHLPj9WZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483479;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uJFY0RA5jNs+ZBcE+G+eI8Iqteu1G4u0DeLhYuNF3Ws=;
	b=LsNhrARioW6H0pxKHV0plVV+h5fQv0YjhzUR4+DIdWhziNYmSbzDzBo4hON3luxiwvkb
	 L1EM7pJcFxrcbn2Eof+dG4071ZP0NxZMsytml0a/+vx32ZifKD/KT1rE+sR2llyq5ICeR
	 YGrGYcI0V6H4Gj48paSiLwHs2hpbOu9LrR/uquD2On+zAv+gclidB6obO2zTEM+1HdIiw
	 Np4lthBy+WqVl0ZuQ1nhAIV1h3e5rlxrQpmzR/WcwHUcP2Z1IMBt+47JnH6Tn3ekGfEba
	 haW1pcPLZw6drP8eTtZU0BXOovX4TYrWzABeC0boC/kIK8HYXSiL4I4ErQQdttpFd/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJa9iHpD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F5606A31E;
	Tue, 24 Nov 2026 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJa9iHpD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D2D1F000C0;
	Tue, 24 Nov 2026 01:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483479;
	bh=uJFY0RA5jNs+ZBcE+G+eI8Iqteu1G4u0DeLhYuNF3Ws=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aJa9iHpDfRMF2Hr13OzlTCxPeXEnKDfBD+6BWSoaGrXx9Hi/V/UOvoOs14hx6F8w/
	 J/nJgc/Z4bccCuHrsyh9xo8XqUvh42oUDEs8kJZKQ0cxewmkon6m/P7qQ7LqygJz7F
	 LAdb9i7z9GtFxXIu2/N16tR9p+noHpJ+yiM+gNt3CMJpT3zbkjAjI7QC/bzKSxnHL2
	 o1JeVywzk4eS1GC71tBQNJ5G56aFsHQXHqnM68QsZ7AQtNUUqcvPJs8gvmg+mss1WC
	 yTcj0f/UA1S813I9P1Ye5w6zBYRVx9O4jOfYRZ+0xiILEt2NRDw5fqjoaVPY5JSP3j
	 t5uGOtTfMc+HQ==
Subject: Re: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Tue, 24 Nov 2026 01:24:37 +0000
Message-ID: <179548347774.3135.13746122531946897961@kernel.org>
In-Reply-To: <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
References: <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com>
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

- [Medium] rtl8365mb_d_want_ivl()
  (drivers/net/dsa/realtek/rtl8365mb_vlan.c:364-376) makes one switch-…
- [Medium] net: dsa: realtek: stale ivl_en in
  rtl8365mb_vlan_4k_port_set() on family D
- [Low] The comment on the new realtek_priv::vlan_4k_used field in
  drivers/net/dsa/realtek/realtek.h (lines 70-74) says it holds "VIDs…
- [Low] The rollback in rtl8365mb_d_vlan_4k_refresh_ivl()
  (drivers/net/dsa/realtek/rtl8365mb_vlan.c:416-427) sets `failed = vid`…

--

net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D

This adds read and write helpers for the two-word CVLAN (4K VLAN) table
entry used by family D. On family D, IVL_EN now follows one switch-wide
setting: it is on while any user port is VLAN-filtering. When that
setting flips, rtl8365mb_d_vlan_4k_refresh_ivl() rewrites the in-use
entries, which are tracked in a new vlan_4k_used bitmap.

> diff --git a/drivers/net/dsa/realtek/realtek.h b/drivers/net/dsa/realtek/realtek.h
> index cfe56d30f5cb1..a3ecc13ec561e 100644
> --- a/drivers/net/dsa/realtek/realtek.h
> +++ b/drivers/net/dsa/realtek/realtek.h

[ ... ]

> @@ -65,6 +67,11 @@ struct realtek_priv {
>  	 * deleting port VLAN memberships and PVID configurations.
>  	 */
>  	struct mutex		vlan_lock;
> +	/* VIDs with a non-empty 4K VLAN entry, protected by vlan_lock. Lets
> +	 * a switch-wide update visit only the entries in use instead of
> +	 * reading all 4094 over the slow management bus.
> +	 */
> +	DECLARE_BITMAP(vlan_4k_used, VLAN_N_VID);

[Severity: Low]
This isn't a bug, but is this comment accurate for every user of struct
realtek_priv?

The only writer is rtl8365mb_vlan_4k_port_set(), and it only updates the
bitmap on family D:

	if (rtl8365mb_is_d(priv)) {
		if (vlan4k.member)
			set_bit(vlan->vid, priv->vlan_4k_used);
		else
			clear_bit(vlan->vid, priv->vlan_4k_used);
	}

On family C, and in rtl8366rb, which also uses struct realtek_priv, the
bitmap stays empty even when 4K entries exist. If later code relies on
this comment and does a switch-wide update on family C, it would visit
no entries.

Could the comment say that the bitmap is only maintained on family D?
Alternatively, the bitmap could be maintained for all families.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> index 566c6bc1449af..6317ea8fb6cde 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c

[ ... ]

> @@ -277,6 +323,110 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,
>  				     data, ARRAY_SIZE(data));
>  }
>  

[ ... ]

> +/* Family D has no EFID, so a VLAN-unaware bridge must learn in SVL (IVL=0,
> + * FID=0) to match static FDB/MDB entries programmed with VID 0. Use IVL only
> + * while at least one user port is VLAN-filtering. @port/@filtering override
> + * the state of the port currently being changed, as DSA updates
> + * dp->vlan_filtering only after the driver callback returns.
> + */
> +static bool rtl8365mb_d_want_ivl(struct dsa_switch *ds, int port,
> +				 bool filtering)
> +{
> +	struct dsa_port *dp;
> +
> +	dsa_switch_for_each_user_port(dp, ds) {
> +		if (dp->index == port ? filtering :
> +					dsa_port_is_vlan_filtering(dp))
> +			return true;
> +	}
> +
> +	return false;
> +}

[Severity: Medium]
What happens when a VLAN-aware bridge and a VLAN-unaware bridge are both
offloaded on the same family D switch?

VLAN awareness is set per bridge, but this function makes one choice for
the whole switch. Both rtl8365mb_d_vlan_4k_refresh_ivl() and
rtl8365mb_vlan_4k_port_set() write that value into IVL_EN of every 4K
entry.

The driver sets ds->configure_vlan_while_not_filtering, so the
VLAN-unaware bridge also has 4K entries, for example its default_pvid
VLAN. Those entries get IVL=1 as well, so lookups and learning on that
bridge use the key {IVL=1, VID=PVID}.

Its static FDB/MDB entries come from DSA with vid 0. The family D L2
packer added later in the series programs them with the SVL key
{IVL=0, FID=0}:

rtl8365mb_d_l2_uc_to_data()
	bool ivl = uc->key.ivl && uc->key.vid;

Would those static entries ever be hit? If not, unicast to host or
static addresses is flooded. Static multicast is either flooded or
dropped, depending on mcast_flood.

That is the mismatch the commit message says this change avoids ("so
that static and learned FDB/MDB entries use the same key"). The commit
message does not mention this limitation.

The last patch in the series, "net: dsa: realtek: rtl8365mb: add support
for RTL8367S-VB", sets ds->max_num_bridges = 1 for family D. That narrows
the problem but does not close it.

dsa_bridge_num_get() returns a bridge number that is already allocated
without checking max. The comment added in that patch also says that a
bridge that already has a number from another switch can still be
offloaded. In multi-switch setups, it still seems possible to have two
bridges with different VLAN awareness on one family D switch.

Nothing sets ds->vlan_filtering_is_global, and
rtl8365mb_port_vlan_filtering() does not reject this case through extack.
Should one of these be done? If not, should the commit message document
the restriction?

> +
> +/* Must be called with &priv->vlan_lock held. */
> +int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
> +				    bool filtering)
> +{

[ ... ]

> +	for_each_set_bit(vid, priv->vlan_4k_used, VLAN_N_VID) {
> +		ret = fi->vlan_4k_read(priv, vid, &vlan4k);
> +		if (ret)
> +			goto rollback;
> +		if (!vlan4k.member || vlan4k.ivl_en == want_ivl)
> +			continue;
> +
> +		vlan4k.ivl_en = want_ivl;
> +		ret = fi->vlan_4k_write(priv, &vlan4k);
> +		if (ret)
> +			goto rollback;
> +	}
> +
> +	return 0;
> +
> +rollback:
> +	/* Best effort: restore the entries rewritten so far */
> +	failed = vid;
> +	for_each_set_bit(vid, priv->vlan_4k_used, failed) {
> +		if (fi->vlan_4k_read(priv, vid, &vlan4k))
> +			continue;
> +		if (!vlan4k.member || vlan4k.ivl_en != want_ivl)
> +			continue;
> +		vlan4k.ivl_en = !want_ivl;
> +		fi->vlan_4k_write(priv, &vlan4k);
> +	}
> +	return ret;
> +}

[Severity: Medium]
When the last port leaves a VLAN on family D while some user port is
still VLAN-filtering, does this leave IVL_EN set in a hardware entry
that the refresh can no longer reach?

In that case rtl8365mb_vlan_4k_port_set() computes vlan4k.member == 0.
It still sets vlan4k.ivl_en from rtl8365mb_d_want_ivl(ds, -1, false),
which returns true, and writes the entry with IVL_EN=1. It then clears
the VID from priv->vlan_4k_used.

When VLAN filtering is later turned off,
rtl8365mb_d_vlan_4k_refresh_ivl() only walks the bits set in
vlan_4k_used, and it also skips entries with no members. So that entry
keeps IVL_EN=1.

This is not limited to an explicit bridge vlan del. When the ports of
a VLAN-aware bridge leave it, dsa_port_pre_bridge_leave() unoffloads
all of the bridge VLANs while dp->vlan_filtering is still true. Only
after that does dsa_port_bridge_leave() call
dsa_port_reset_vlan_filtering(). So every VLAN of that bridge is
emptied with IVL_EN=1 and dropped from the bitmap before the refresh
runs.

Suppose the ports then join a VLAN-unaware bridge. Ingress membership
filtering is off and egress is transparent, so frames tagged with one
of those old VIDs are still looked up in the 4K table. If the chip
honours IVL_EN of an entry with no members, those frames would be
learned and looked up under {IVL=1, VID}. The static FDB/MDB entries
that DSA programs with vid 0 use the SVL key {IVL=0, FID=0}, so they
would not match.

Would it be enough to write ivl_en = 0, or an all-zero entry, when
vlan4k.member becomes empty? Or does the hardware ignore IVL_EN for an
entry with no members?

[Severity: Low]
The size bound passed to for_each_set_bit() is exclusive, so the rollback
never revisits the VID whose vlan_4k_write() failed. Could that entry
still end up written in hardware?

rtl8365mb_table_query() writes the data, address and command registers.
It then waits in rtl8365mb_table_poll_busy(), which has a 10 ms timeout:

	return regmap_read_poll_timeout(priv->map_nolock,
			RTL8365MB_TABLE_STATUS_REG, val,
			!FIELD_GET(RTL8365MB_TABLE_STATUS_BUSY_FLAG_MASK, val),
			10, 10000);

Suppose the poll times out after the command was issued, and the
hardware still commits the write. That VID keeps ivl_en == want_ivl
while the other entries are restored, and DSA keeps the old
dp->vlan_filtering. That one VLAN would then stay in the opposite
learning mode until something rewrites it.

The rollback loop already re-reads each entry and skips it when
ivl_en != want_ivl. Would it be safe to use failed + 1 as the bound
here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com

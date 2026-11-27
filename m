Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748422;
	b=0bLrXnv0tzq+awNwzNlyzELY9CdhPHjtDfgBHMchSXZl46mB6p9ya6o9fM8DHEGzCx4F
	 SyNvSC4p2KVhNwNnQGON5M5d773Pdksc8o21yIWo+HYnT5kdSg4vShH5VADJEA9x9HVRf
	 jD0fnmfAuUhPjqhRi/4u+EkcHPFb3E+GRXX80FiPkvSC/oiNM86z+gQZoP6rC4LJcPbzz
	 7rZppuarU6d3Zeovw2jtuODmzUpFZpXtmwq5Pk9pabOI3i0qri3/GrswAyZ3NjA5ufkoo
	 EHu3zcy3A6a/wEDYu7x8HA9+mNVxBDtTmRsSWBrnB2IlCnsiOdXwd3/iPBkfa2pWBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748422;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=O4J1e8BH3uprGHA8a4gGPrP2HQxw6+U5E4JF7ytbtIw=;
	b=Avb7XuwRqJ5+YXr8WsOBXlojNykzPjjtdS2N60tAED0SDd+ReA9YzAn3s8dPtZsG83pL
	 ZloWmTTY4/zFrjfsYK+1vr5dHLKo7n3/e5Mf7q7jtMJTRaxbiRB7xf9LCdnPy0kzYd1GR
	 mdJ79sRYQ+34LveIL9e3b7eaCN/cG1qRadzffwmuDQu4O68y4tIfOQVi6PQveJ50ChwEo
	 CXTFGMZSslRtiD81rGt6dX452drT0+DlJxGFs90m5hnviUEZhTtRAB0MslNTRsESKhZCu
	 DBV5eeEFddCEEkZ6lJctRxRL73YTh9THRQX+dr/CYOzvP7+wJbple6K2JgsXS12guSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAXP5jai;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313A606A31C;
	Fri, 27 Nov 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAXP5jai
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994621F00936;
	Fri, 27 Nov 2026 03:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748422;
	bh=O4J1e8BH3uprGHA8a4gGPrP2HQxw6+U5E4JF7ytbtIw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KAXP5jai6EEoOxcA8Fua+NCyq2wMRGRcskVMTMMhQhTWYaQ9ip0750c5Z3nYoFxRv
	 hYt1YeUOUrLFofODlIv8W9BfDETWV5Ky3qKFfGqvSHjSipLkLdtLtsSppi1Yawpo+0
	 wDMfIkSAkGVHQN1sxFLWxry6EnI0/PhHjowigfpiixc9RwuvWHtcBSfviODKg6xkcs
	 j+1xIhq3fc15CD3cJXH73KE/V6DkeOgt7ZBW31noxbb4/7+C4kB8ZKpdi9oKb+IBhc
	 g7qwjbdx+bH4z32qXrnjG07LF0j7eNstFNCrKMei0SbaIc7xYAN+0pqrBGWxKpxiGB
	 fBMYS7ExUNLEQ==
Subject: Re: [PATCH net-next v14 07/15] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:21 +0000
Message-ID: <179574842117.3135.17941638650099220254@kernel.org>
In-Reply-To: <fe49b828-ee40-4cef-b969-536cc251f811@yahoo.com>
References: <fe49b828-ee40-4cef-b969-536cc251f811@yahoo.com>
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

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Family D decides IVL once for the whole switch, and that
  decision is applied to every 4K VLAN entry.
- [Medium] When a vlan_filtering change flips the switch-wide IVL state,
  rtl8365mb_port_vlan_filtering() -> rtl8365mb_d_vlan_4k_refresh_ivl()…
- [Medium] rtl8365mb_vlan_4k_port_set() updates the vlan_4k_used bitmap
  only after fi->vlan_4k_write() succeeds.
- [Low] The comment on rtl8365mb_d_want_ivl() says SVL is needed to match
  static FDB/MDB entries programmed with VID 0.

--

net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D

This adds two-word pack/unpack helpers for the family D 4K VLAN table.
On family D, IVL_EN now follows whether any user port is VLAN filtering.
A vlan_4k_used bitmap tracks the VIDs in use, so a vlan_filtering change
that flips the switch-wide state rewrites only the active entries.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 687939d6d9d8c..24635feafc67f 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -2303,8 +2303,21 @@ static int rtl8365mb_port_vlan_filtering(struct dsa_switch *ds, int port,
>  	if (ret)
>  		goto undo_set_framefilter;
>  
> +	if (rtl8365mb_is_d(priv)) {
> +		mutex_lock(&priv->vlan_lock);
> +		ret = rtl8365mb_d_vlan_4k_refresh_ivl(ds, port, vlan_filtering);

[Severity: Medium]
When this call flips the switch-wide IVL state, what happens to the dynamic
L2 entries the chip learned under the old mode?

rtl8365mb_port_vlan_filtering()->rtl8365mb_d_vlan_4k_refresh_ivl()->
rtl8365mb_d_vlan_4k_set_ivl() rewrites IVL_EN in the 4K entries. Nothing
flushes the LUT afterwards.

A family D L2 entry stores its own IVL bit and a shared VID/FID field. You
can see this in the unpacker added later in the series:

rtl8365mb_d_l2_data_to_uc() {
    ...
	uc->key.ivl = FIELD_GET(RTL8365MB_D_L2_UC_D3_IVL_MSK, data[3]);
	uc->key.vid = uc->key.ivl ? id : 0;
	uc->key.fid = uc->key.ivl ? 0 : id;
    ...
}

So IVL (VID key) lookups would never hit entries learned in SVL (FID key),
and the reverse is also true. Until those entries age out after 300 s:

  - they take up hash and CAM slots
  - known destinations flood until they are learned again
  - toggling filtering back within the ageing time could make the old
    entries valid again, possibly pointing at outdated ports

The DSA core calls dsa_port_fast_age() only on STP state and learning flag
changes, not on vlan_filtering changes.

Should this path call the driver's existing rtl83xx_port_fast_age() or
l2_flush once the IVL state flips? The final series state behaves the same
way, and the PBFID toggle added later also changes the learning key.

> +		mutex_unlock(&priv->vlan_lock);
> +		if (ret)
> +			goto undo_egress_mode;
> +	}

[ ... ]

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> index 566c6bc1449af..ff6f2baca631c 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c

[ ... ]

> +/* Family D has no EFID, so a VLAN-unaware bridge must learn in SVL (IVL=0)
> + * to match static FDB/MDB entries programmed with VID 0. Use IVL only while
> + * at least one user port is VLAN-filtering. @port/@filtering override
> + * the state of the port currently being changed, as DSA updates
> + * dp->vlan_filtering only after the driver callback returns.
> + */

[Severity: Low]
This isn't a bug, but at this commit the comment doesn't match the L2 code.
These functions still always program key.ivl = true with the VID and use
the family C L2 layout:

  rtl8365mb_l2_add_uc()
  rtl8365mb_l2_del_uc()
  rtl8365mb_l2_add_mc()
  rtl8365mb_l2_del_mc()

So static entries would not use the SVL key yet.

This is fixed later in the series by "net: dsa: realtek: rtl8365mb: make
L2/LUT access work on family D". There, rtl8365mb_d_l2_uc_to_data() and
rtl8365mb_d_l2_mc_to_data() map VID 0 to the SVL key:

	bool ivl = uc->key.ivl && uc->key.vid;
	u16 id = ivl ? uc->key.vid :
		       (uc->key.fid ? uc->key.fid :
				      RTL8365MB_D_UNAWARE_BRIDGE_FID);

Family D can't be reached until the last patch, so this has no runtime
effect in between. Could the comment be reworded here, or moved to the L2
patch?

> +bool rtl8365mb_d_want_ivl(struct dsa_switch *ds, int port, bool filtering)
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
The comment above says a VLAN-unaware bridge must learn in SVL. This
function returns true as soon as any user port is VLAN filtering, whichever
bridge that port belongs to. Can a VLAN-unaware bridge end up in IVL here?

The result is applied to every entry. rtl8365mb_vlan_4k_port_set() writes:

	vlan4k.ivl_en = vlan4k.member &&
			rtl8365mb_d_want_ivl(ds, -1, false);

and rtl8365mb_d_vlan_4k_set_ivl() rewrites every VID in vlan_4k_used to the
same value.

Suppose one VLAN-aware bridge and one VLAN-unaware bridge are offloaded on
the same switch. The unaware bridge's VLANs (its PVID 1, for example) would
move to IVL. Its learned entries would then be keyed on {MAC, VID}, while
its static and host FDB/MDB entries use the SVL/FID key. Unicast could then
flood, and static MDB filtering might stop applying.

The driver does not set ds->vlan_filtering_is_global, so DSA doesn't reject
mixed VLAN awareness.

Later in the series, "net: dsa: realtek: rtl8365mb: make L2/LUT access work
on family D" sets ds->max_num_bridges = 1 for family D, which narrows this.
That commit also notes that DSA allocates bridge numbers system-wide. A
bridge that already got a number from another switch can still be offloaded
here ("such bridges share FID 1, a known limitation"). In that case two
bridges with different VLAN awareness can still share a family D switch.

The rollback comment in rtl8365mb_d_vlan_4k_set_ivl() also says:

	/* Best effort: restore the entries rewritten so far. IVL_EN is
	 * switch-wide, so before the scan every entry in use had the old

IVL_EN is a per-entry field (RTL8365MB_D_CVLAN_ENTRY_D1_IVL_EN_MASK). Only
the driver's policy for it is switch-wide.

Should family D set ds->vlan_filtering_is_global? If not, could this
limitation be documented in the commit message and in the code?

[ ... ]

> @@ -314,7 +480,15 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
>  		vlan4k.untag |= BIT(port);
>  	else
>  		vlan4k.untag &= ~BIT(port);
> -	vlan4k.ivl_en = true; /* always use Independent VLAN Learning */
> +
> +	if (!rtl8365mb_is_d(priv))
> +		vlan4k.ivl_en = true;
> +	else
> +		/* An emptied entry goes back to its reset state, so that
> +		 * it is not left in IVL after it leaves vlan_4k_used.
> +		 */
> +		vlan4k.ivl_en = vlan4k.member &&
> +				rtl8365mb_d_want_ivl(ds, -1, false);
>  
>  	ret = fi->vlan_4k_write(priv, &vlan4k);
>  	if (ret) {
> @@ -322,6 +496,13 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
>  		return ret;
>  	}
>  
> +	if (rtl8365mb_is_d(priv)) {
> +		if (vlan4k.member)
> +			set_bit(vlan->vid, priv->vlan_4k_used);
> +		else
> +			clear_bit(vlan->vid, priv->vlan_4k_used);
> +	}
> +

[Severity: Medium]
Can vlan_4k_used miss a live entry if fi->vlan_4k_write() returns an error
after the write has actually reached the chip?

rtl8365mb_table_query() writes the data and CTRL registers, then calls
rtl8365mb_table_poll_busy():

	return regmap_read_poll_timeout(priv->map_nolock,
			RTL8365MB_TABLE_STATUS_REG, val,
			!FIELD_GET(RTL8365MB_TABLE_STATUS_BUSY_FLAG_MASK, val),
			10, 10000);

If that final poll times out, or a regmap error happens after the execute
write, the call returns an error even though the chip may have committed
the entry. For a VID getting its first member, rtl8365mb_vlan_4k_port_set()
then returns early and skips set_bit(vid, vlan_4k_used).

The rollback comment in rtl8365mb_d_vlan_4k_set_ivl() already assumes this
can happen ("its write may have reached the chip before the error was
reported").

The bridge treats the failed port_vlan_add as not applied and never sends a
matching delete, so the non-empty 4K entry stays untracked. Later IVL flips
in rtl8365mb_d_vlan_4k_set_ivl() would skip it. That VLAN would stay in the
old learning mode until the same VID is added again on some port.

Would it be safer to set the bit before the write for a newly populated
entry? rtl8365mb_d_vlan_4k_set_ivl() already skips entries with no members.

>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com

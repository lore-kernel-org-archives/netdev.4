Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427498;
	b=GEj4aPQE8fZJpGzTFq3kkKG/NVvlP79GHD6E+6HcpRvAyv8uIoXcarhA1UYjP4Hirxzh
	 p/hlPbYe1+xsV1Hg2MzmdbusHEeG2hSTU4JdPDCz8Dxq6aSEz6czYLrMUiSf0ktGU+ZEj
	 50GWymsM8ibiDzDTKskrn+kRgTkGAvRFE6Tq+My94oFeFQsvn/y618SDxlonSErEEM6op
	 z567jfx6A+Lsce0C2PBi5td0sz3aM8oBzNSLTFW+4Lm3JhXVX0rDMownBtvKUJkNNJe/L
	 RIVp19oFZDkw0Vj8GDHIPG4eAhtamgcs9IUvqL2AZ/AFQUIK71tm+MEWkd3zfSSgqJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427498;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cKIHxdrVgTvPN1YdjFiUNGAh+m3glGXVecaHibF7T1I=;
	b=4k0GDNwUMSdxB1f6NElX4AbbdBE1Be9HljyKHnR3lxYvLAHh9kbVVxprpfM1yrQUrosa
	 0wA5NTkwJMBL7mIwaDxM985N/36VJSfXBEEDMC1FvlEpLodUslmfxXbkJMnxuShkZptPZ
	 UwBBzVKzxe78fVFtNLRwum+zGvHXB9vywB69yYipZ/73Jt5NJf1CJw6dRRnDtZOYSbFjp
	 jBNrh+i99HMLVmUQqTn4T8WfQAOz/ywsoYbO9l336pKiCmmzPWp7gNPZWYjwZk/QaFrOe
	 HXkq8379mV6gvMkTiPAAsA/ru06w4VY9ZGaaFs7olxrwIT7Lt6w13Mbor1KMuy8vd/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mf7IqGwo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E95F606A32C;
	Mon, 23 Nov 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mf7IqGwo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D801F000CA;
	Mon, 23 Nov 2026 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427497;
	bh=cKIHxdrVgTvPN1YdjFiUNGAh+m3glGXVecaHibF7T1I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Mf7IqGwoZFH4KTeo+3mXxA4tUI0oIDT84h1oOQnE/QBBzSyn8+UfyEYacnZWY4g2i
	 n6rD/ilpa12Ou6s/RmXlRzDl0kfXl3iVLvug/h7bKYlR06taHR5h6N1IpCRh+utbHm
	 BNVzTs5OLqpeDXtk/0v2DyRCqmyEPingC244XUMGmqugh9iXF2YJqKbjgpBm7RcVE3
	 x9WVNHRZxaP8RI5WDF+6AWUKIvrE2m4fDQ4tUUEVxt/wdUwCxDHxQe5Pm5Noyk+3Rf
	 3hf2SJ89maoBBZ/F5UI8kfF1fCYfpWUECTqCJ6kDclqEXNNhH9Qg3y1KklaqGfffWc
	 Bcl+WeBPIYjJA==
Subject: Re: [PATCH net-next v13 07/14] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 23 Nov 2026 09:51:36 +0000
Message-ID: <179542749608.3135.8744349482532821261@kernel.org>
In-Reply-To: <0552fff4-ac3d-4e2b-8d66-610d0e661e11@yahoo.com>
References: <0552fff4-ac3d-4e2b-8d66-610d0e661e11@yahoo.com>
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

- [Medium] In rtl8365mb_d_vlan_4k_set_ivl()
  (drivers/net/dsa/realtek/rtl8365mb_vlan.c), the rollback loop skips…
- [Low] The new field vlan_4k_used is added to struct realtek_priv in
  drivers/net/dsa/realtek/realtek.h.

--

net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D

This adds two-word CVLAN pack/unpack helpers for family D. On family D,
IVL_EN now follows the switch-wide VLAN filtering state. A vlan_4k_used
bitmap in struct realtek_priv lets a filtering flip rewrite only the 4K
entries in use.

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
Does this comment describe more than the code maintains?

struct realtek_priv is shared by the rtl8365mb and rtl8366rb/rtl8366-core
drivers. The only place that updates the bitmap is
rtl8365mb_vlan_4k_port_set(), and only on family D:

	if (rtl8365mb_is_d(priv)) {
		if (vlan4k.member)
			set_bit(vlan->vid, priv->vlan_4k_used);
		else
			clear_bit(vlan->vid, priv->vlan_4k_used);
	}

On rtl8365mb family C, and in rtl8366rb/rtl8366-core (which write 4K
entries through priv->ops->set_vlan_4k), the bitmap stays empty even when
4K entries are populated. As the commit message notes, it also never holds
entries that were in the table before the driver loaded.

Should the comment say that this is rtl8365mb family D only and covers only
entries written by this driver? Or would the field fit better in struct
rtl8365mb (chip_data), since it adds 512 bytes to every realtek_priv?

This is unchanged at the end of the series.

[ ... ]

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> index 566c6bc1449af..b80783502884b 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c

[ ... ]

> @@ -277,6 +324,124 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,

[ ... ]

> +int rtl8365mb_d_vlan_4k_set_ivl(struct dsa_switch *ds, bool want_ivl)
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
> +	/* Best effort: restore the entries rewritten so far. IVL_EN is
> +	 * switch-wide, so before the scan every entry in use had the old
> +	 * value (!want_ivl) and every entry below @failed that now has
> +	 * want_ivl was rewritten above.
> +	 */
> +	failed = vid;
> +	for_each_set_bit(vid, priv->vlan_4k_used, failed) {

[Severity: Medium]
Can this rollback skip the one VID most likely to be half-changed?

Say fi->vlan_4k_write() fails for some VID X in the forward loop. The code
then jumps here with vid == X. The bound given to for_each_set_bit() is
exclusive, so X itself is never re-read or restored.

The write can fail after the chip has already taken the new value.
rtl8365mb_d_vlan_4k_write()->rtl8365mb_table_query() issues the command
before it polls for completion:

rtl8365mb_table_query() {
    ...
	/* Execute */
	ret = regmap_write(priv->map_nolock, RTL8365MB_TABLE_CTRL_REG, cmd);
	if (ret)
		goto out;

	/* Poll for completion */
	ret = rtl8365mb_table_poll_busy(priv);
	if (ret)
		goto out;
    ...
}

The entry may already hold want_ivl in two cases: the busy poll times out,
or the bus reports an error after the command write has reached the chip.

rtl8365mb_port_vlan_filtering() then returns the error, and DSA keeps the
old dp->vlan_filtering. So rtl8365mb_d_want_ivl(ds, -1, false) still
reports the old mode while VLAN X may be in the other learning mode (IVL vs
SVL). X stays like that until a later flip to that target succeeds or
rtl8365mb_vlan_4k_port_set() rewrites that VID.

The commit message says the rewrite is a separate function "so that an
error path can restore the previous state", but the entry that failed is
not restored.

Would failed = vid + 1 be safe here? The rollback re-reads each entry and
only changes entries that hold want_ivl, so an unmodified X would be left
alone.

This code is unchanged at the end of the series.

> +		if (fi->vlan_4k_read(priv, vid, &vlan4k))
> +			continue;
> +		if (!vlan4k.member || vlan4k.ivl_en != want_ivl)
> +			continue;
> +		vlan4k.ivl_en = !want_ivl;
> +		fi->vlan_4k_write(priv, &vlan4k);
> +	}
> +	return ret;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3f1826f8-3096-40dd-a278-c70fce4852c8%40yahoo.com

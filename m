Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127792;
	b=nIUNdYqGt/dR9Y4P8x0C4IX0gx5UAeUFjjIqPinhB1gZKnxwr9dq7SSpgxziaR+/2hBZ
	 Rc1LjEEoVDlntXre/sxqfYg+yAtrFe/mh2s86woxEWwyWNCfsBH7uk52t0KH/o/WANBmc
	 QPDrcgwE5+olUrN0TuAX0g1PJIhfgRVs6mZ2iIkPG8R2WSh9DsvBTTJFBGSdQeuHMFldl
	 Nu/Np6LKpruGviDmTIVwP+RLuFS+XfXvaLNH9yp/AU9islsE1q0izKiBJgrxi2s6Zl7uZ
	 Hri255OY1IMRMZMe0mRdIh4jX+1Khblb9iOBvRrlQrIrBtMlc4J08MYXC2m5WciokCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127792;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Tgu+WP2m0uodmDr9Nd0f7m6qiFgWHDogdH3e+s7AJJI=;
	b=QqleRpotmEJGYarEzah3or5xQCotWWImO6laAooWKbde5pk6bXPVXN0vA7zmXHrBx7H1
	 ZNpqbYm2d7fDJDg5eJawDoWoqK8MouX1eFbJDc80A38pGwBgcF7E6OcOQDWCok9NCIWYu
	 03LrzPVLw2cbp9NlYPZzGRRVHjSwtaYYfdbRuiGgAJl+ZVLnI4Hhhh7U/0SzU0hZ8Ixh4
	 yk2jETVwOSnEznydkhbqh7Yf+wP3dd1U9Kl3inMM15jmip/SKCHhbQGdwx/J3e7LHmc2U
	 02LG3HteL2oMKPO2HWUmoqeuTpf6JIJlnd3Zfq+J4LiWGEBvzpDaAE+Y3v41ZZIQ+QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNExrvjz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705D606A326;
	Thu, 19 Nov 2026 22:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNExrvjz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF121F000C0;
	Thu, 19 Nov 2026 22:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127791;
	bh=Tgu+WP2m0uodmDr9Nd0f7m6qiFgWHDogdH3e+s7AJJI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YNExrvjzBol1ezFy1HpYWmoqW4KSC95f21PTKTi5J+ErrVBa3DZseGOOxnDb4oZup
	 W3kEn4Ocx4luYGM1faP+cv/56M4WNd0fmsH0rYikksRh9T9g7JWSwVPB4+Zvr+K7Hm
	 ibaSw4E20vssNQ24g8Omci2kIqITji2n6who65RFGHAh9MFkPR0YppMyte7CysbiQy
	 nkavc2z82KoAV/8zk7Fu9WT4QqhC+yQ8jeQ6ztgFhXEDK9Wg3BmbT4ItQV7AB+hUim
	 Wnhn6G+ViaXSON0lVvycrdh2eIYQLhvpx6snwfhaJ1RbhwhJnoE0tFtDQwcDOQpRR6
	 ChrUcxG3rCklQ==
Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Thu, 19 Nov 2026 22:36:30 +0000
Message-ID: <179512779012.3136.12590210308172981547@kernel.org>
In-Reply-To: <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com>
References: <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com>
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

- [Medium] rtl8365mb_d_vlan_4k_refresh_ivl()
  (drivers/net/dsa/realtek/rtl8365mb_vlan.c) does not roll back when it…
- [Low] When the switch-wide IVL state flips,
  rtl8365mb_d_vlan_4k_refresh_ivl()…

--

net: dsa: realtek: rtl8365mb: set and get vlan 4k for family D

This patch adds two-word CVLAN pack/unpack helpers for family D in the
rtl8365mb driver. On family D, IVL_EN is set only while at least one user
port is VLAN filtering. When a vlan_filtering change flips the
switch-wide state, rtl8365mb_d_vlan_4k_refresh_ivl() rewrites IVL_EN in
the active 4K entries.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> index 566c6bc1449af..f3ac2940a0ed4 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c

[ ... ]

> @@ -277,6 +323,96 @@ int rtl8365mb_c_vlan_4k_write(struct realtek_priv *priv,

[ ... ]

> +/* Must be called with &priv->vlan_lock held. */
> +int rtl8365mb_d_vlan_4k_refresh_ivl(struct dsa_switch *ds, int port,
> +				    bool filtering)
> +{

[ ... ]

> +	fi = rtl8365mb_get_family_info(priv);
> +
> +	for (vid = 1; vid < VLAN_N_VID; vid++) {
> +		ret = fi->vlan_4k_read(priv, vid, &vlan4k);

[Severity: Low]
How long does this scan take on real hardware? Each of the 4095 iterations
is a full rtl8365mb_table_query(). That is two busy polls through
regmap_read_poll_timeout(), an address write, a command write and a bulk
read, all under priv->map_lock.

Over realtek-mdio, each register access is several MDIO frames
(realtek_mdio_read() does 3 writes and 1 read). That works out to roughly
0.5-1 ms per entry.

This runs from the port_vlan_filtering callback with rtnl_lock and
priv->vlan_lock held:

rtl8365mb_port_vlan_filtering()
    mutex_lock(&priv->vlan_lock);
    ret = rtl8365mb_d_vlan_4k_refresh_ivl(ds, port, vlan_filtering);
    mutex_unlock(&priv->vlan_lock);

Could a single flip hold RTNL for several seconds over MDIO, and longer
over bit-banged SMI? The commit message and the comment above do note that
the scan reads every entry, but they don't mention how long RTNL is held.

port_vlan_add/del already see which VIDs are in use. Could the driver
track the active VIDs and rewrite only those, rather than reading every
entry?

> +		if (ret)
> +			return ret;
> +		if (!vlan4k.member || vlan4k.ivl_en == want_ivl)
> +			continue;
> +
> +		vlan4k.ivl_en = want_ivl;
> +		ret = fi->vlan_4k_write(priv, &vlan4k);
> +		if (ret)
> +			return ret;
> +	}

[Severity: Medium]
What happens to the entries already rewritten if fi->vlan_4k_read() or
fi->vlan_4k_write() fails partway through this loop? Possible causes are
a regmap/MDIO error or -ETIMEDOUT from rtl8365mb_table_poll_busy().

VIDs before the failing one keep the new IVL_EN, the remaining ones keep
the old value, and nothing records or restores which were changed. The
caller then unwinds like this:

rtl8365mb_port_vlan_filtering()
    ret = rtl8365mb_d_vlan_4k_refresh_ivl(ds, port, vlan_filtering);
    ...
    if (ret)
        goto undo_egress_mode;

The undo_egress_mode -> undo_set_framefilter chain restores the egress
mode, frame filter and transparent VLAN settings, but not the CVLAN
IVL_EN bits.

On error, dsa_port_vlan_filtering() does not commit dp->vlan_filtering. So
rtl8365mb_d_want_ivl(ds, -1, false) and later rtl8365mb_vlan_4k_port_set()
calls follow the old mode, while some existing VLANs learn in the other
mode.

For a VLAN-unaware bridge, would a VLAN left with IVL_EN set stop matching
the static FDB/MDB entries keyed as SVL/FID 0? That is the mismatch this
patch is meant to prevent. It would only clear on the next real
switch-wide flip.

Should the loop undo the entries it already rewrote when it fails, or
otherwise restore the table to the previous mode before returning?

> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cf3fd237-2290-4002-8de0-ea4100ef0f85%40yahoo.com

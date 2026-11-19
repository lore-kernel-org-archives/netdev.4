Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127798;
	b=X1+aMr0IBLWdQn8AG/kQ8KghvXNx01wM7VSow/CQoR5PwnfxD1mN2fyTjgJ5B0zeqLwL
	 jVilWzQAh6BrCS/rWNPzScQoKrLga6jiLCV9nK+hktw6OgxUjUyganwLh4eQNzQoOrz0F
	 hThelvU7PKv4AooWmJLYrh6oS3+w9sELJQowFR+iZqlqr3bVRjTsx5VvOFyl/rlYptVQQ
	 rscmwr8w2/Eo1Kgn6Vm1HKwRiWIm6qnNW85ZqVxLByffVO9lY37pczyCWpevIhqLIYh29
	 Oo+42usKg8b3Me2dloVTylqGheFhhHQe4COcyjGjQz/kqkJpabn8H+tdrQJMK4GNY9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127798;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=B1TGX3OWoLnvJvYJkvEHmDpW2sLEXwucLDmHRzI5q/U=;
	b=XkAQfZJKTCBj4G7cEAgjPLkRUjRilyV9IqhAETQvH0kOMYAoBZIFP9g/Pi562iItDcxQ
	 XgHLvvtOS+7FlHJ0yxabC8473ZWzfNucowquuEQEnGGMmTO1rUDBNAWuILHKiziBBr65l
	 Kibx2jKc4iisbG8f4eSA4od37XGsjAXYcKqSa3G+paDK3Yj5xeeYLGkEc3u+nQoTK225g
	 ubtM596fdrriNTAGlJHW6KnB/pPHwkIcuACi16woHt2oDR0CTiAOR6VPwms0tZBfbiPV0
	 lq/5ruyNUt6NFPTRTWzSCrmEpLyaO7pxUkXCgMyaO/7rb3BTlPxZwIBd3f/fT0EeRMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYomTfCz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6760A261E;
	Thu, 19 Nov 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FYomTfCz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27FB1F000D3;
	Thu, 19 Nov 2026 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127797;
	bh=B1TGX3OWoLnvJvYJkvEHmDpW2sLEXwucLDmHRzI5q/U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FYomTfCzbaiV4JEVefpNddXpRgAMLmT+QAm9bOz0gM1h7GeO4VBo6ajQ5PJFe6ROP
	 U+77Obv/JiFz9NS6wcPaZzNiDbWG88zx5ogF+xSfjP4qVitOe+a7CYY4caw3jMwHRf
	 hnRRLhSJw1aq2Tn3+RuMszq03wsUUXI2ls4Zt4CFHJZWoDxBt8rWvO5xfLgn00FgAe
	 7EApnGkMwkyWI9GzUZYDiXEaq1DdJ0H2xSE8tW8Pnr78OALwWDAPCcjfMTgW9jODX9
	 RYrN1IVs7Ed2anz3hmNuyO2TPPXbTxF5i3Qp9vGw9HkclmD/SGb2L7WjyzyPwVhirJ
	 DPmvHZBMtKrZw==
Subject: Re: [PATCH net-next v11 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Thu, 19 Nov 2026 22:36:36 +0000
Message-ID: <179512779630.3136.16071397271955524893@kernel.org>
In-Reply-To: <836bf744-b589-4d9e-80cb-ad20fb6725aa@yahoo.com>
References: <836bf744-b589-4d9e-80cb-ad20fb6725aa@yahoo.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In drivers/net/dsa/realtek/rtl8365mb_main.c, the new
  rtl8365mb_family_d descriptor sets `.jam_table =…

--

net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

This adds the RTL8367S-VB (chip ID 0x6642) to the chip table as the first
family D chip. It also adds an rtl8365mb_family_d descriptor that selects
the family D force-mode, VLAN, PVID and L2 helpers from the earlier
patches. The chip has 8 ports and reuses the existing initialization jam
table.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index c7f209b41cac9..9b821b3230a0e 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -816,6 +829,25 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
>  	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
>  };
>  
> +static const struct rtl8365mb_family_info rtl8365mb_family_d = {
> +	.family = RTL8365MB_FAMILY_D,
> +	.num_ports = RTL8365MB_D_MAX_NUM_PORTS,
> +	.jam_table = rtl8365mb_init_jam_8365mb_vc,
> +	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),

[Severity: Low]
Is there an RTL8367D vendor reference showing that this init table is
valid for the RTL8367S-VB?

rtl8365mb_switch_init() writes each entry of fi->jam_table[] as a whole
register with regmap_write(). That means every family D probe now gets the
RTL8367C vendor init values. The commit message says only "The chip reuses
the existing initialization jam table" and does not give a source.

The new header comment says this chip's registers differ in the VLAN table,
the external interface/RGMII configuration, the SerDes, the LUT and the
table access control register. Other family D code in the series cites the
RTL8367D vendor API, for example dal_rtl8367d_l2_init() and
dal_rtl8367d_port_macForceLink_set(). Nothing like that backs this table.

Some entries, such as 0x18E0=0x4004, 0x122B=0x241C and 0x1305=0xC000, are
full-register values. They were built from RTL8367C read-modify-write
sequences on top of RTL8367C reset defaults.

Nothing in the tree says what 0x1303, 0x1304, 0x18E0, 0x122B, 0x13F0,
0x13EB, 0x13E2, 0x121E, 0x1233, 0x1237, 0x1239, 0x123A, 0x0301 or 0x1349
mean on family D.

At least one entry means something different on family D:

rtl8365mb_init_jam_8365mb_vc[]:
	{ 0x13E2, 0x003F }, { 0x13F9, 0x0090 }, { 0x121E, 0x03CA },

#define RTL8365MB_D_REG_EXT_TXC_DLY				0x13f9
#define   RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK			GENMASK(5, 3)

The value 0x0090 sets the EXT1 RGMII TX delay field to 2. The RGMII path in
rtl8365mb_ext_config_rgmii() then has to clear it again:

	if (rtl8365mb_is_d(priv) && extint->id == 1) {
		ret = regmap_update_bits(priv->map,
					 RTL8365MB_D_REG_EXT_TXC_DLY,
					 RTL8365MB_D_EXT1_RGMII_TX_DLY_MASK, 0);

That particular case looks harmless. If the RTL8367D vendor switch init
uses different registers or values, though, could the other entries leave
analog, PHY or interface registers set wrongly on this chip?

The SGMII/HSGMII tests suggest nothing is badly wrong. RGMII mode is listed
as untested, though.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cf3fd237-2290-4002-8de0-ea4100ef0f85%40yahoo.com

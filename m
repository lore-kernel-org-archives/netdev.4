Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483487;
	b=CQrn5XjZUWblZ+DdrBossrF1m11delGjEfUW8QqdHhrPjH1/aYDu2KnSULLeY/ZWQQHN
	 +1BPkWUps3J/vqaHYTQr0s9pQ4oIJ7EycqIjLlY2Ak0yjRaQIIW5MN0OdeZWchVnIS+VW
	 l7V6/D2NeE9XejTPc7Y0sl+NkxEdi5utIePeoq3+dH1B7GPEYwAz0mR2DG3LbxqU0Hm0v
	 AJxcYPQmCmC3flzQrLNU29khArjkMCECqwpw0rTGU+oOH0Uru+pU6mxQzFKUcX6dP8Zyr
	 a3sWweustYGvgIKGO/e+rdlouIIzr9ZSv5+ZADE6ZCJ8Fl+5nXq7o2dIYD2BMHGVkDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483487;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wIx8qiSa2oky9m2r1/Aot+1OUGt+oGNVC85uDiuGS20=;
	b=1heQOYJNMUH7+h/gg8JnD7xL3A/jPKERdLZDdHcyqfjMX6FweiLJ/YzdMSpw+Ca+aCCy
	 byayv32BVM/zNy8HtyGR3J64k16E4KEyCfcAzYszEI5Q+NS2nnc1nfM+58LobfSsJcx7P
	 KX8umJAPp5c4IsoDUmI3k9iaOphLuyzFYRFcVS3BtucM6HhGYJH/ph+5zRCmzA+u9xB90
	 6e3wUELo+0LNDFMj4+615R6yKkOF5JmeJhqPxYmkYaAVku8RIZVwfnMsnfiH0mMUzc18Z
	 jSIIqj0RWvBR3ZSUUYEte+y05WassFU3e12rmNNZolKEkBRt1QKRbQ15nc7EafYKzAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iY/+VrQq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F58606A692;
	Tue, 24 Nov 2026 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iY/+VrQq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2171F000CA;
	Tue, 24 Nov 2026 01:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483486;
	bh=wIx8qiSa2oky9m2r1/Aot+1OUGt+oGNVC85uDiuGS20=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iY/+VrQqqoDTs/QixjqquJSPitY0Nc8kQVT1+VjZsFQmKLWROyTsO06YWzmYb+r+d
	 3JtLqR6R18RLMmILGB7CY2lHGET1OldQZDssaNjEKdYDBQtkll0s6FMc7FjG+3Z2NZ
	 V2NMkY88Th1Kz3ECE4gxq3O+CbGRL1dbLVkumMsBKk/z8hfwvIFxYHt3E9uTV//oDZ
	 dTth3gMQlN8FUiKfn4qZg60oONZpWke7dUU9oa0rnAZn36zEVXO/th/ZT2XmY/NuYj
	 YXmnnOIxB83U+7xiumjLkVCruBdWv2gsYl8nUds9315qc7OzzmsZz+AvERPjWdOemF
	 YWO5E+j6OKW7g==
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Tue, 24 Nov 2026 01:24:45 +0000
Message-ID: <179548348509.3135.4599625371501941340@kernel.org>
In-Reply-To: <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
References: <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
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

- [Low] The commit message says "The chip has 8 ports (0-4, 6 and 7)",
  but that list names 7 ports: five UTP ports (0-4) and the two…
- [Low] The new rtl8365mb_family_d descriptor sets `.jam_table =
  rtl8365mb_init_jam_8365mb_vc`.

--

net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

This patch adds the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the
rtl8365mb chip table. It also adds a new rtl8365mb_family_d descriptor
that selects the family D implementations added earlier in the series.
It also makes rtl8365mb_d_ext_config_forcemode() static and updates the
Kconfig help text and the RTL8365MB_LEARN_LIMIT_MAX comment.

> The chip has 8 ports (0-4, 6 and 7), which is described by port_mask in
> its chip info, as for the other chips.

[Severity: Low]
Is the count here correct? The list (0-4, 6 and 7) names 7 ports. The new
entry in rtl8365mb_chip_infos[] matches the list, not the count:

    .port_mask = PORT_MASK(GENMASK(4, 0) | BIT(6) | BIT(7)),

The 8 seems to come from rtl8365mb_detect(), where
priv->num_ports = fls(mb->chip_info->port_mask). That counts up to the
highest port index, not the number of ports present.

Could this say 7 ports, or say that the port indices run 0-7 with port 5
absent?

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index bfd7e303ca254..d4a886435876b 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -817,6 +829,24 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
>  	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
>  };
>  
> +static const struct rtl8365mb_family_info rtl8365mb_family_d = {
> +	.family = RTL8365MB_FAMILY_D,
> +	.jam_table = rtl8365mb_init_jam_8365mb_vc,
> +	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),

[Severity: Low]
Can the RTL8367C jam table be written to family D silicon without first
checking it against the vendor RTL8367D init?

On every RTL8367S-VB probe, rtl8365mb_switch_init() writes all of these
register/value pairs right after reset. It then writes
rtl8365mb_init_jam_common. Neither table is filtered for family D:

rtl8365mb_switch_init() {
    ...
	if (fi->jam_table) {
		for (i = 0; i < fi->jam_size; i++) {
			ret = regmap_write(priv->map, fi->jam_table[i].reg,
					   fi->jam_table[i].val);
    ...
}

The series already shows that register meanings change between families
in this address space. For example, 0x0A32 is the per-port EFID register
on family C but the LUT aging timer on family D.

rtl8365mb_init_jam_common also writes 0x020E to 0x0A30:

    { 0x03Fa, 0x0007 }, { 0x08C8, 0x00C0 }, { 0x0A30, 0x020E },

The driver defines 0x0A30 as the family D LUT_CFG register, with only
BIT(4) and BIT(6) documented. This value sets bits 1, 2, 3 and 9, which
have no documented meaning on family D. rtl8365mb_d_lut_init() only
clears bits 4 and 6.

0x13F9 (EXT_TXC_DLY) does look handled: rtl8365mb_ext_config_rgmii()
clears the EXT1 RGMII TX delay field when port 7 is set up for RGMII.

None of the other family-specific entries is corrected that way:

  the 0x13EB and 0x1303/0x1304 pad controls
  0x13E2
  the 0x121E/0x1233/0x1237/0x1239/0x123A flow-control thresholds
  0x0301, 0x1349, 0x18E0, 0x122B, 0x1305 and 0x13F0

Testing covered only the SGMII/HSGMII CPU port, and RGMII was not
tested.

Would it be better to take the init sequence from the vendor RTL8367D
sources, or to leave .jam_table NULL for family D?
rtl8365mb_switch_init() already handles a NULL table.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com

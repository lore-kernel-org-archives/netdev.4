Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748433;
	b=Bhm5QRytyAK1tP2Civ9UZWxt4DhwwqMHFmfsBlAwBzlGASTKGvm512TDQP6NSeMLWKzg
	 3295vx9KLX87QcCqc+WA2TX/CAYIh/KBQllFgroVPuSsvXVbUzJPK7mgCjBFULx0QJuZe
	 ITB67a8r9dfcgSTVNGYKGq5r9z7wGmPiyOw1F4+w5/v42t1WbZk1vGANN98FKFNiC7Z19
	 ltBs4h4FBhj4+1C2YoIHYG6RmDjtMyPULFKPW4iCbdZTSb0GFej6AoGskUB4q7SaS2tt1
	 CPworkYmWEkIfY23V8JpKTgOXfqoJJhxPYJbymieohnsmd978OqaWVPJLq94W33AWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748433;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jXFQ0K89s9Gh1OqiFSLVns5VpXQ4VzKQdNsk9uLikbE=;
	b=Kp8pY+F55U3abacwsTR+8AN370nKINVoVPRguPSpAH/XSBnJBlZMxASZy7jkhwlK4GYI
	 yuf8nhAMCjaVRSSS/TS37Kh5ohnc4+iwtYq0Kk18C4A8LClJM4OlsUt6fZy055BxsMfU1
	 tcFDjoL42HXhaLUcBFfuhQaG2sLgIfa4BLK1wJLtY8cVCKGTnCZJgAuOxkqxMl+6oQzmL
	 CNZ0XeZtpSOQzdsst+YIiWEMISLcyl+1CmPEp1gM+8eltak3A/b+rrIqQddv4ETcPiy9s
	 /a0BebQtWdVZBB+OoyxUGcDP+VevzL11BTmpxZedkB06M9ZouQDclhLYOaS5IgfZj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oByRuSRc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED01606A326;
	Fri, 27 Nov 2026 03:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oByRuSRc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4857D1F0093A;
	Fri, 27 Nov 2026 03:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748433;
	bh=jXFQ0K89s9Gh1OqiFSLVns5VpXQ4VzKQdNsk9uLikbE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oByRuSRc/lgE9bYBaYZ6M4fLAF5suAe+IcHO+QjBfOtFQb3CGrsx+4d4t73ocjzdw
	 wzOUGov8O3DCZiREJ0Mh2vTkv+4AHCNe1kgMDAPYM6ae+hjzSzbX6IcD/hxIabiPna
	 rQV1oBacgSzHO7ipy6ULQ7xSLPrEKDqmhi2LBFBR0ws7QBXm2b8Q1TZMY7nyDU++v3
	 NoXvDj0XZo6zQs+pCXPoZ9x0i4o5U8jXR1ZPC4OV4LHX56wM5gtLhwq+Nq4c7tE2DP
	 HDHBfg/op/p3cV78lK/NiP1r26nVQQB48/2CwrNh4e2tPvzCyBUm3+pB0k3jtlF5Mq
	 tqUfl/he7LEWw==
Subject: Re: [PATCH net-next v14 15/15] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:31 +0000
Message-ID: <179574843188.3135.8470436383588006481@kernel.org>
In-Reply-To: <abe7ed42-694c-435b-b573-b0341aa10971@yahoo.com>
References: <abe7ed42-694c-435b-b573-b0341aa10971@yahoo.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/net/dsa/realtek/rtl8365mb_main.c, the new
  rtl8365mb_family_d sets .jam_table = rtl8365mb_init_jam_8365mb_vc.

--

net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

This adds the RTL8367S-VB (chip ID 0x6642, version 0x0010) to the chip
table as the first family D chip. It also adds a rtl8365mb_family_d
family_info that selects the family D code added earlier in the series.
The chip reuses the RTL8365MB-VC init jam table, followed by the common
jam table.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 639e6b62a2fc3..eef591eed0c91 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -835,6 +847,27 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
>  	.qos_set_untag_pcp = rtl8365mb_c_qos_set_untag_pcp,
>  };
>  
> +static const struct rtl8365mb_family_info rtl8365mb_family_d = {
> +	.family = RTL8365MB_FAMILY_D,
> +	.jam_table = rtl8365mb_init_jam_8365mb_vc,
> +	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),

[Severity: Medium]
Is it safe to write the RTL8365MB-VC jam table to family D silicon?

With this change, rtl8365mb_setup()->rtl8365mb_switch_init() writes
rtl8365mb_init_jam_8365mb_vc and then rtl8365mb_init_jam_common to the
RTL8367S-VB. It does this with plain regmap_write() right after the reset,
and nothing filters the writes for family D.

The new header comment says family D registers differ in the VLAN table,
the ext interface and RGMII setup, the SerDes and the LUT. The
RTL8365MB_D_LUT_CFG2_REG comment also says 0x0A32 is the EFID register on
family C but the aging timer on family D.

Some jam writes hit registers that family D only partly reprograms later.
The common table writes the LUT config:

rtl8365mb_init_jam_common[] = {
    ...
	{ 0x03Fa, 0x0007 }, { 0x08C8, 0x00C0 }, { 0x0A30, 0x020E },
    ...
	{ 0x1D32, 0x0002 },
};

rtl8365mb_d_lut_init() then clears only two bits of it:

	ret = regmap_update_bits(priv->map, RTL8365MB_D_LUT_CFG_REG,
				 RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK |
				 RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK, 0);

That means bits 1, 2, 3 and 9 of 0x0A30 keep their family C values on a
family D LUT.

The VC table also writes the interface select register:

	{ 0x18E0, 0x4004 }, { 0x122B, 0x241C }, { 0x1305, 0xC000 },

On family D, rtl8365mb_pcs_config() skips that register:

	if (!is_d) {
		val = sds_mode << RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_OFFSET(id);
		...

So the EXT0 mode field and bits 15:14 stay as the jam left them.

Other entries, such as 0x1303, 0x1304, 0x13EB, 0x121E..0x123A, 0x18E0,
0x1349, 0x0301 and 0x1D32, have no family D definition in the driver.

The commit message says neither table was compared with the vendor RTL8367D
init, and testing covered only SGMII/HSGMII on port 6.

Could a wrong pad, MAC or LUT control value here break untested setups such
as RGMII/MII on port 7? Could it leave the LUT configured differently from
what the driver assumes?

The 0x13F9 entry mentioned in the commit message looks less worrying. The
family D RGMII path clears the EXT1 RGMII TX delay field (bits 5:3), and
the other value lands in the EXT2 field (bits 8:6), which family D does not
have.

Would it make sense to give family D its own jam table, or none, until it
can be checked against the vendor RTL8367D init sequence?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com

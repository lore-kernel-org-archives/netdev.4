Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427506;
	b=3qlvpEfASMkTVB5rd/Mxqc/fQe9MGgT7OO3J4JFJ7hz3cxb+xyFVoajASm/AXel7KQk3
	 3Go+Vei/3B9j2N8oRXaTX77wd/1uXA8Y09a9d5PvzVwCQ97fqJTjbSJXnjopAauPKWg2+
	 h/hEQzfIes/LPliNbxmAEtrG5Do8O5KT7olSYiHsXkkRFh6qO1yKyfpXx6xFJZgardb29
	 4+SnYBVmoj8MR8ZaKqqZWL919YxpDxpP1nqJuweGMVh3ebRfqWpPL8/njt/Gsnj0QzUo6
	 Si2x5TQYlNeUvh5KTwtW1EqCUmIiXbpwAQw3zyMfDlJNAPcwvT7Oshh70S4WpIjJDRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427506;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=C5VkB9RixcqiwadJ3yFLZvIZqE7r38z2cyWmWStYsOk=;
	b=UvUjUDSPJn6JE0xUArX8h6JSEsVxMNC0aAubK+OTMCPNVByKvX7yfHoR2WG1NofUxHAL
	 8oPU+TWN10qQQlv+TvBK+PU/sRX1uMp1RQr/Io7fljlFrRYXXDJ5UIjZYlKUUuNPllnyU
	 BVSiupLi9JZU1N+6WIN+xq7Kt0FyS+/k1BtKnZY6XpXcmknFB00V9g75Dor6oILoN9Vy/
	 rjl7ToC77UQkhKCNkYyWaCnrZ+Uljsc/EBauYfbVz3WRiVwREpUMj8diAIJFYKX31JmQp
	 K0tJgaIVPZ219/LEegL3j7juwd/rvOOadhAZjVNgALlWD0yLTnDK/YtgyrFM3FmvEzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V25RPT/p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514E2606A337;
	Mon, 23 Nov 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V25RPT/p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB99E1F000D3;
	Mon, 23 Nov 2026 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427505;
	bh=C5VkB9RixcqiwadJ3yFLZvIZqE7r38z2cyWmWStYsOk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V25RPT/pAhyj5VlyCONGDttnAEMeD9w3V7z8/gOFzPreLIpoZgR50BmwZmNxybp6A
	 lUOcEn/5Gn9tT8j/Xr0XhLzIuktP3GjS/u+zz1S0ICQilP0ixHy90qsFS+GNAQTWS/
	 I7LA7/hALIoARz+IW+WWt2KryXZ6lb0mtd5Cz6sPyQZiSngE0HHg5V6OmJ1+8F5dSM
	 KfmREMOeZlOvmCoOuyOdVCI/tMuGn4PZDFSiXyniZfJqZLeNRoGHlQTL6Hsa0cntln
	 Fyzp8xDY+opp3bKchtJ0Sq+fpaIC6YEOvV/obxHXGiEIVUkshikx8UQIwXCdCF1j9L
	 kmetFdJZxUJWA==
Subject: Re: [PATCH net-next v13 14/14] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 23 Nov 2026 09:51:44 +0000
Message-ID: <179542750447.3135.8686604271395828150@kernel.org>
In-Reply-To: <2ec7a146-d353-4eb0-b0ac-a53d6a0a2838@yahoo.com>
References: <2ec7a146-d353-4eb0-b0ac-a53d6a0a2838@yahoo.com>
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

- [Medium] The new rtl8365mb_family_d descriptor sets `.jam_table =
  rtl8365mb_init_jam_8365mb_vc`.

--

net: dsa: realtek: rtl8365mb: add support for RTL8367S-VB

This patch adds the RTL8367S-VB (chip ID 0x6642) to the chip table. It is
the first chip to use the family D implementations added earlier in the
series. It also makes rtl8365mb_d_ext_config_forcemode() static and
updates the comments and the Kconfig help.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 75d9c6120e7ff..73563244f3be5 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -832,6 +844,24 @@ static const struct rtl8365mb_family_info rtl8365mb_family_c = {
>  	.l2_mc_to_data = rtl8365mb_c_l2_mc_to_data,
>  };
>  
> +static const struct rtl8365mb_family_info rtl8365mb_family_d = {
> +	.family = RTL8365MB_FAMILY_D,
> +	.jam_table = rtl8365mb_init_jam_8365mb_vc,
> +	.jam_size = ARRAY_SIZE(rtl8365mb_init_jam_8365mb_vc),

[Severity: Medium]
Are the RTL8367C init values safe to write as they are on the family D
register map?

With this entry, rtl8365mb_setup()->rtl8365mb_switch_init() writes
rtl8365mb_init_jam_8365mb_vc to RTL8367S-VB. It then writes
rtl8365mb_init_jam_common, with no family check:

drivers/net/dsa/realtek/rtl8365mb_main.c:rtl8365mb_switch_init() {
    ...
	/* Common init jam */
	for (i = 0; i < ARRAY_SIZE(rtl8365mb_init_jam_common); i++) {
		ret = regmap_write(priv->map, rtl8365mb_init_jam_common[i].reg,
				   rtl8365mb_init_jam_common[i].val);
    ...
}

The commit message says the chip-specific table "has not been compared
with the vendor RTL8367D initialization". It does not mention that the
common table (0x1200, 0x0884, 0x06EB, 0x03FA, 0x08C8, 0x0A30, 0x0800,
0x0802, 0x09DA, 0x1D32) is applied to family D as well.

Several of these addresses are already treated as family D registers
elsewhere in the driver.

0x13F9 is RTL8365MB_D_REG_EXT_TXC_DLY and gets 0x0090:

	{ 0x13E2, 0x003F }, { 0x13F9, 0x0090 }, { 0x121E, 0x03CA },

That sets the EXT1 RGMII TX delay field [5:3] to 2. In
rtl8365mb_ext_config_rgmii(), that field is cleared only when EXT1 is
configured as RGMII. Everything else in the register keeps the jam value.

0x0A30 is RTL8365MB_D_LUT_CFG_REG and gets 0x020E (bits 1, 2, 3 and 9):

	{ 0x03Fa, 0x0007 }, { 0x08C8, 0x00C0 }, { 0x0A30, 0x020E },

rtl8365mb_d_lut_init() only clears bits 4 and 6, which the jam value does
not set anyway:

	ret = regmap_update_bits(priv->map, RTL8365MB_D_LUT_CFG_REG,
				 RTL8365MB_D_LUT_CFG_IPMC_HASH_MASK |
				 RTL8365MB_D_LUT_CFG_BCAM_DISABLE_MASK, 0);

So bits 1, 2, 3 and 9 keep the family C values. Their meaning on family D
is not documented.

0x1305 is RTL8365MB_DIGITAL_INTERFACE_SELECT_REG0 and gets 0xC000:

	{ 0x18E0, 0x4004 }, { 0x122B, 0x241C }, { 0x1305, 0xC000 },

The per-extint mode nibbles are rewritten later. Bits 15:14 stay set, and
their meaning on family D is unknown.

The remaining entries (0x13EB, 0x1303, 0x1304, 0x13E2, 0x121E, 0x1233,
0x1237, 0x1239, 0x123A, 0x0301, 0x1349, 0x18E0, 0x122B, 0x13F0, 0x1D32
and others) are undocumented RTL8367C values. The series has already
found that family D moved or repurposed nearby registers, for example
0x0A32 and 0x13E8.

The two tested boards use SGMII/HSGMII on port 6. Could these writes cause
problems in configurations that have not been tested, such as RGMII or MII
on port 7, or in multicast LUT handling?

Would it be better to give family D its own jam table based on the vendor
RTL8367D init sequence? Another option is to skip the entries in
rtl8365mb_init_jam_common that overlap family D registers. Failing that,
could the commit message at least say that the common table is also
applied unverified?

> +	.ext_config_forcemode = rtl8365mb_d_ext_config_forcemode,
> +	.vlan_4k_read = rtl8365mb_d_vlan_4k_read,
> +	.vlan_4k_write = rtl8365mb_d_vlan_4k_write,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3f1826f8-3096-40dd-a278-c70fce4852c8%40yahoo.com

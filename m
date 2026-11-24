Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483483;
	b=Y1NcnY0EOun7OO6Nq7OhAuevN0MoJVDWq9DBwnkIHb3fmQItgQrWn/FkrLjZ0gAxYN4Y
	 IPaSqRwUNAxGzwz4F07ojMzB2lLYA5y/bK6ysGFpGy7PUaAkEBlbdluBO/hSc7L7mppss
	 LtEflCWq5aeM7Oxe4lr1iIT/sB9PEJuA4PKcn6u08VPb8UiqZ5PuUuYMPyI9JcE1ketgG
	 W7uBBo3jvxuQJroebndGElcXKPmp6FQyQCXMkGH+tEAQXGA77Gkzp86L3u+2BrLHwOEP4
	 3NK7OvfRUjA3vIzjj2ewslMp/L5yocMmKJPpGkLZ/JnFWQ4kG3X/TbXLUp67OQl/GkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483483;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YpbR6Q0yO7II70afwzTmmnjztlsfobvcSMwi9UnVyv0=;
	b=KuOfGQBXivlG+XbU9qobLWb3pH9kugEATbcvocAqALcXgnRLqiyqUCQ+Wn8TANr2B5Ng
	 uUBPectibIvjbywo2AgZo2Z/WIMW8rp1989tF1c+KxqwQenbte9QuTQKUkfKhtahZ6DRh
	 VZ7TgMjHuz8xVljLG0kICmGYQD3MZNVfGyO9bCd90FAd7LT5OqtSSu6BwQPARErBGiGqt
	 1bPKBN2vzMXkxHR64b3o6H4lcMLpozur/fgDZuE1inFEAv4spwOxCnP2PBPPudMfp2HmN
	 iO6fTEAbK+EhVZnrc1q1HaA+E/mYlr2qdlFbIxPIc2cgFQbGC5mHvatQLh9ALi3YVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XL8QxwRx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A053606A326;
	Tue, 24 Nov 2026 01:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XL8QxwRx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642441F000C6;
	Tue, 24 Nov 2026 01:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483482;
	bh=YpbR6Q0yO7II70afwzTmmnjztlsfobvcSMwi9UnVyv0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XL8QxwRxPew84irklwZHHrrvfLUHxv9ICKhSb4JNgiZH/lsDzLfvhNcrlr+0ui/ZR
	 wgqlcS2g9YQtg7AgQDDyKkBT+BPdhjJJRUdIqG6PG0Eh3WJ9rGhFU6uYlhJzuh8KGK
	 quGwq1y9HZjLlPc8v+pj1yvf33Uj78uchVZktZzVH9iiJdkURoUcrn7bz2xIYLRhT3
	 v53UssqmaO6JgwPpjJfbqGtEq23q2gHeddQW3zRkAlFVzCC6kVuj5KjDxVZQXGvb4K
	 T1J555JuN+8/8vMHZqkCXqi1l+bAG3Sxnh6Vave3hubwDHWi4WR6JvqAK9Z/DkkeEG
	 +2z0wzOGkbSrw==
Subject: Re: [PATCH net-next v12 10/13] net: dsa: realtek: rtl8365mb: add
 family D SDS13 PCS support
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Tue, 24 Nov 2026 01:24:40 +0000
Message-ID: <179548348098.3135.991309116032726075@kernel.org>
In-Reply-To: <87c2a0f9-bf6f-408f-b711-c566769b40d3@yahoo.com>
References: <87c2a0f9-bf6f-408f-b711-c566769b40d3@yahoo.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rtl8365mb_phylink_mac_link_up() now skips the SerDes-side
  pause programming (RTL8365MB_SDS_MISC_REG 0x1D11, SGMII_TXFC BIT(13) /…
- [Low] On family D, rtl8365mb_pcs_config() in
  drivers/net/dsa/realtek/rtl8365mb_main.c now wraps the external…
- [Low] On family D, rtl8365mb_sds_probe_option() returns early with
  mb->sds_supported = true (line 1468).

--

net: dsa: realtek: rtl8365mb: add family D SDS13 PCS support

This extends the existing RTL8367S SGMII/HSGMII PCS code to family D
switches. On family D the CPU SerDes is reached through the indexed SDS13
window, and the family D SDS_MISC layout and tuning tables come from the
vendor RTL8367D API. On family D the patch also skips the pcs_link_up()
forcing and the SerDes pause programming, and stops advertising 10/100 on
the SerDes port.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 7ad9ef1cbab7d..50ba2fa465808 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c

[ ... ]

> @@ -1418,6 +1461,14 @@ static int rtl8365mb_sds_probe_option(struct realtek_priv *priv)
>  	int ret;
>  	int i;
>  
> +	/* Family D has a fixed SDS13 programming model and does not use the
> +	 * family C option register to select its tuning table.
> +	 */
> +	if (rtl8365mb_is_d(priv)) {
> +		mb->sds_supported = true;
> +		return 0;
> +	}
> +

[Severity: Low]
Since sds_supported is now always true on family D, rtl8365mb_setup()
will always call rtl8365mb_sds_raise_rate_limits() on these chips:

drivers/net/dsa/realtek/rtl8365mb_main.c:rtl8365mb_setup() {
    ...
	if (mb->sds_supported) {
		ret = rtl8365mb_sds_raise_rate_limits(priv);
    ...
}

That function writes 0xFFFF to 0x00CF and 0x0398, and sets GENMASK(2, 0)
in 0x00D0 and 0x0399. These are the family C port 6 ingress/egress limiter
addresses, with the family C 3-bit MSB field layout.

The commit message checks the BYPASS_LINE_RATE (0x03f7) layout against the
RTL8367D vendor definitions. It doesn't do the same for these four
registers. The comment above rtl8365mb_sds_raise_rate_limits() says the
vendor driver raises them "for the whole chip family", and that appears to
mean family C.

In this series family D already differs from family C in several other
register blocks: the per-port force registers, the 3-bit speed field, the
VLAN 4k format, PVID and the LUT.

Do the port 6 rate limiter registers have the same addresses and field
widths on the RTL8367D? If they don't, could these writes set bits in
registers the driver doesn't mean to touch?

>  	/* Nothing to probe if no external interface is wired to the SerDes */
>  	for (i = 0; i < RTL8365MB_MAX_NUM_EXTINTS; i++) {
>  		extint = &mb->chip_info->extints[i];

[ ... ]

> @@ -1546,34 +1620,58 @@ static int rtl8365mb_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,

[ ... ]

> -	val = mode << RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_OFFSET(id);
> -	ret = regmap_update_bits(priv->map,
> -				 RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(id),
> -				 RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(id),
> -				 val);
> -	if (ret)
> -		return ret;
> +	if (!is_d) {
> +		val = sds_mode << RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_OFFSET(id);
> +		ret = regmap_update_bits(priv->map,
> +					 RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(id),
> +					 RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(id),
> +					 val);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	/* Take the SerDes out of reset. The vendor driver does this only
>  	 * after the SerDes mux and the interface mode are configured.
>  	 */

[Severity: Low]
This isn't a functional bug as far as the testing shows. On family D the
DIGITAL_INTERFACE_SELECT mode write in rtl8365mb_pcs_config() is now
skipped, and nothing equivalent is written for ext0 (MAC6). Does the
RTL8367D vendor sequence leave out this step on purpose? For example, does
SDS_MISC[4:0] (0x02/0x12) alone select SGMII/HSGMII?

The commit message only says that the SDS13 window and the SDS_MISC fields
differ. The comment just below still says the interface mode is configured
before the reset is deasserted.

Could a short comment or a sentence in the commit message explain why
family D doesn't need an interface mode select write here?

[ ... ]

> @@ -2087,18 +2231,21 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
>  			return;
>  		}
>  
> -		/* The SerDes has its own pause enables; program them from
> -		 * the resolved pause modes, as the vendor driver does when
> -		 * forcing the link on a SerDes external interface. These
> -		 * bits, not the MAC force pause bits, gate pause on the
> -		 * SerDes external interface: flow control testing shows
> -		 * that pause frames are only emitted with the SerDes TXFC
> -		 * bit set, while the MAC force pause bits alone have no
> -		 * effect on this port. This is done here rather than in
> -		 * rtl8365mb_pcs_link_up() because pcs_link_up() carries no
> -		 * pause information.
> +		/* Family C: the SerDes has its own pause enables; program
> +		 * them from the resolved pause modes, as the vendor driver
> +		 * does when forcing the link on a SerDes external
> +		 * interface. These bits, not the MAC force pause bits, gate
> +		 * pause on the SerDes external interface: flow control
> +		 * testing shows that pause frames are only emitted with the
> +		 * SerDes TXFC bit set, while the MAC force pause bits alone
> +		 * have no effect on this port. This is done here rather
> +		 * than in rtl8365mb_pcs_link_up() because pcs_link_up()
> +		 * carries no pause information. Family D does not use this
> +		 * path: its pause bits are set in the forced-mode register
> +		 * by rtl8365mb_d_ext_config_forcemode().
>  		 */
> -		if (rtl8365mb_interface_is_serdes(interface)) {
> +		if (rtl8365mb_interface_is_serdes(interface) &&
> +		    !rtl8365mb_is_d(priv)) {

[Severity: Medium]
Does flow control still work on the family D SerDes port after this
change?

The comment records a measured family C result. On the SerDes external
interface, the MAC force pause bits alone have no effect, and pause frames
are only sent when the SerDes TXFC bit is set.

On family D, mac_link_up() now skips the SDS_MISC TXFC/RXFC programming.
It relies only on the TXPAUSE/RXPAUSE bits that
rtl8365mb_d_ext_config_forcemode() writes to the MAC force register.

The family D SDS_MISC update in rtl8365mb_pcs_config() only touches
RTL8365MB_D_SDS_MISC_CFG_MASK (bits 11, 10, 9 and 4:0). Any SerDes-side
flow control gate on family D would therefore keep its reset value.

Is there an RTL8367D vendor API reference, or a flow control test, showing
that family D has no similar SerDes pause gate? The commit message only
mentions link testing at 1G SGMII and 2500base-x.

If such a gate does exist, phylink and ethtool would report tx/rx pause as
active on port 6 while the hardware never sends or honours pause frames.

>  			u32 val = 0;
>  
>  			if (tx_pause)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com

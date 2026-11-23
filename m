Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427500;
	b=uOXo/ByDs0e3LYmi1J9yYcZOzFD91/tZC1ec6sfrh6dXI3ObwsYtEm+cxeetsEgDccet
	 yT7lF0oANZdMBazl9Q40xlNaRZTto7SLWdLye8OQapYdmKurmgB49frIYK37fPy0damKz
	 fjPAaAvZf+FoWhy4CJtLIPi9k0OBUv6hgZKTcHlDgB7qXdFp0dGBKMmTQs7jHNSF/uRxH
	 iz13n4xzIFD3XpvqwMwK0S9Vn6fQHhKCQ/AhHklKTpi4Ux29w+mdwymQQBRFxEjxk9jSe
	 +d/LespWQIuqwM8JmmLMLmIbxJp75wgsjSzS4PDQXylLtRwA5wWv5bwI0xxbPzMnbwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427500;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hRxieL1O5Yz+uBDOAl8S3FzDGEyOjAtfX9xXEMK4ZzM=;
	b=ns1YkfaLfsk5P0EicpaqLNN27ZL1P2VOcxYdTIwTcyONOjbbHXcR6WHZaTwUBJJF0oEa
	 oOpKVIZIH0FePAlstO2H1EWJMULAB3RXj7T+N8ynvgAqTX9ZGVoQgoInuZ6KdVOvF7hhF
	 zM3CzVt+e8Qe5krBVAxkp8U6FgLk1fZWJgkL263fRtc8QAxT4Luv0mdv3+j6lTodGlhD2
	 ffAlnKGOG+4YMBS0dTEXqe80zmpkIUEzRfGdXphpBAShV+FpPKkokAb/VkYuI9kMnCPpr
	 5IWM3ZqKbKTRjFpsYvBwqxKLWy5SxOM7lZjK/eDZjaeQr/YN1Fz06ODP+j0Sh3EyGZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRTIO+Ct;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA2606A686;
	Mon, 23 Nov 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRTIO+Ct
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FC41F000D3;
	Mon, 23 Nov 2026 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427499;
	bh=hRxieL1O5Yz+uBDOAl8S3FzDGEyOjAtfX9xXEMK4ZzM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lRTIO+CtmJDUDz7saE2hQYaFQMpx+NhFnK60Y7nFgQK76Jhw+dpQ1KPihcg7ayfFQ
	 SXBx7+JSR3J2as1Hwd5xQzaD6x8/+DiydSrUoOvSSB4RqeQhNfR9X63K/JsPndTYuh
	 c3MFRdIZcWGHoTW9i1E1npIcoqwn7C1/c0sz1zvp1tSwoHzbdERsMPZOSv7SS+EHGu
	 Lu9tNNRgCsSeYqMvjMP9kmxNfVvD2V3sKj0f3J3+CW2ZibeVx9Y1eutBwaPJgSnoE2
	 oPl6Tm7tZnSoxHhZA/Q1vWKSpFlpn+vurJGtVPCngZluMEP/zAnmOu+0qBRY+TR58/
	 t26TmRRp9FinA==
Subject: Re: [PATCH net-next v13 10/14] net: dsa: realtek: rtl8365mb: add
 family D SDS13 PCS support
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 23 Nov 2026 09:51:38 +0000
Message-ID: <179542749823.3135.12232435194258605468@kernel.org>
In-Reply-To: <04f43ce3-74af-4688-9235-458d21545cc8@yahoo.com>
References: <04f43ce3-74af-4688-9235-458d21545cc8@yahoo.com>
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

- [Medium] Flow control on the family D SerDes CPU port (port 6) is never
  enabled on the SerDes side.
- [Low] rtl8365mb_sds_probe_option() now sets mb->sds_supported = true
  unconditionally on family D (lines 1467-1469).

--

net: dsa: realtek: rtl8365mb: add family D SDS13 PCS support

This commit extends the RTL8367S SGMII/HSGMII PCS code in rtl8365mb to
cover family D switches. On those chips the CPU SerDes is reached through
the indexed SDS13 window, and the SDS_MISC layout differs from family C.
The family D path uses its own tuning tables, skips pcs_link_up(), and
relies on the MAC forced-mode register that mac_link_up() programs.

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
sds_supported is now always true on family D, so rtl8365mb_setup() calls
rtl8365mb_sds_raise_rate_limits() on every family D chip:

rtl8365mb_setup()
    if (mb->sds_supported) {
        ret = rtl8365mb_sds_raise_rate_limits(priv);

That function writes these family C port 6 limiter registers:

  RTL8365MB_INGRESSBW_PORT6_RATE_CTRL0_REG and CTRL1_REG (0x00CF, 0x00D0)
  RTL8365MB_PORT6_EGRESSBW_CTRL0_REG and CTRL1_REG (0x0398, 0x0399)

The commit message checks the RTL8367D vendor API for the bypass line rate
register 0x03F7. Has the same layout been confirmed on family D for these
four registers?

The comment above rtl8365mb_sds_raise_rate_limits() is also unchanged. It
still gives only the family C rationale:

/* The vendor driver raises the port 6 ingress and egress rate limiters to
 * their maximum in its switch init, unconditionally for the whole chip
 * family. The chip reset in rtl8365mb_setup() puts them back to their reset
 * default of 0x1FFFF, ...

Could the comment or the commit message say whether the RTL8367D vendor
API does the same on family D?

[ ... ]

> @@ -2087,18 +2231,21 @@ static void rtl8365mb_phylink_mac_link_up(struct phylink_config *config,
>  			return;
>  		}
>  

[ ... ]

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
>  			u32 val = 0;
>  
>  			if (tx_pause)

[Severity: Medium]
With this check, does flow control still work on the family D SerDes
port?

The comment above says that on family C the MAC force pause bits alone
have no effect on the SerDes interface. Pause frames are only sent when
the SerDes TXFC bit is set.

On family D, the only pause programming left is the TXPAUSE/RXPAUSE bits.
rtl8365mb_d_ext_config_forcemode() writes them into the MAC force
register.

Nothing else on family D seems to write a SerDes-side pause enable:

- rtl8365mb_pcs_config() sets only PA33PC_EN, PA12PC_EN, MAC6_SEL_SDS0 and
  the mode field in SDS_MISC.
- rtl8365mb_pcs_link_up() returns early.

rtl8365mb_phylink_get_caps() still advertises pause on that port:

	config->mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
				   MAC_10 | MAC_100 | MAC_1000FD;

Suppose the family D SerDes behaves like family C here. Then phylink would
report pause as enabled, but no PAUSE frames would be sent or honoured on
the CPU link. A 2500base-x CPU port feeding a slower conduit would then
drop frames under congestion instead of applying backpressure.

The commit message mentions only 1G SGMII and 2500base-x link testing.
Was flow control tested on family D? Or does the RTL8367D vendor API show
that the forced-mode pause bits are enough there?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3f1826f8-3096-40dd-a278-c70fce4852c8%40yahoo.com

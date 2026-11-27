Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748425;
	b=JcRJ10uVaRzoNhBCwiX/cm310xt6VKZ2VbTL0JP3VVWlFAROmLteqJ5jUwog8GAfIiRj
	 NH9W+8ZPs2j4gVyKpUMp+rG6WauMdoSG2K0V4dZv1vnpyhHHj7RQXSRqm7ozzOxstRsOi
	 iMp0oJcCs5Wm+65w2/ghCdYQLcmU3DMT1qh9mxr16Izr08CPeIJMz2IuigbxZnzeR7aV5
	 PIv6umymfp9e5RNmvwxrhQzDMqGWXE/OneUjqluzJl4FfFwBc3Z9qeY28GLDzkP4/SEeD
	 sEhKgXqL3ilhImiBmcUufmIZA5cGag11ZLM/VifojTOqzTfwKWuFHsgpnJjR57bUznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748425;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=USZ4pXGtSrus6rr3wZ/V5Nx7cc8/08wBYDNTSgspgLs=;
	b=i05EhnnV0wOifANVbHAz0bZLEWYcLnRBuj7QonKhnZNlrHmMF0Ou6KylC2K/SIWGT4Zv
	 zlylbPvfEP4A33VR8gkRIg/7m9IYtCgeikBTlfjCIBi9riokB8E9oWZeBL4tXHENZGwNM
	 G/3HBAccQPOfi4/9YfNoDxeKcRsyPMrpdURKIhNqNES01GObh8atc15cle0revsJzTX/L
	 PYuWqn6mO+FEXpntYyAFqFuoCAGqKgbXLOV3iqIWb6AqCAy8VDs6Xdtgo51ncj656Vn4Y
	 DhSqorkzwIbx/0dNBlqcQyM8WFn5K0n1ZjbTJv8Saj+FcNTSBJ6ObiCda/a+qq9GD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+A8L6z6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829F606A337;
	Fri, 27 Nov 2026 03:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m+A8L6z6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61491F0093B;
	Fri, 27 Nov 2026 03:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748425;
	bh=USZ4pXGtSrus6rr3wZ/V5Nx7cc8/08wBYDNTSgspgLs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m+A8L6z6SMmJDTeW5ik12AkU7p5PrDujYC7bxHMhscO1t3SvrUewPCERQGlQ5nmEb
	 DAuCK+J/QLzdKbvNpoJDS9MXBaA7J1Vz0iqBJcOgBveNZQP/l9VK4cwxSILK9+LJSF
	 OqoFer7/c84B2THDkFr5vIK7fv/8tYN74KHrOoKn646Zex3zLFM7tVlPuUJDyC+RA4
	 CHiWkEjT+bfCYLxK13cArfKEXK4ynRq7DkNNDRwOh4qXsoNJ+xFwFPAOvMj41eLEYg
	 YywZOUCJbHO0X2J6sMqjMc8ACQVGL9mVWt7axV/RSSUhS9yw2qBTdbwZrREtZMyenz
	 aGE8/HiApO3Eg==
Subject: Re: [PATCH net-next v14 10/15] net: dsa: realtek: rtl8365mb: add
 family D SDS13 PCS support
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:23 +0000
Message-ID: <179574842350.3135.16231120628373898056@kernel.org>
In-Reply-To: <19c82953-5c62-461f-b5a6-3445a485d136@yahoo.com>
References: <19c82953-5c62-461f-b5a6-3445a485d136@yahoo.com>
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

- [Low] In drivers/net/dsa/realtek/rtl8365mb_main.c, the family D early
  return in rtl8365mb_sds_probe_option() sets mb->sds_supported = true…

--

net: dsa: realtek: rtl8365mb: add family D SDS13 PCS support

This commit extends the RTL8367S SGMII/HSGMII PCS code in rtl8365mb to
family D switches. On those switches the CPU SerDes is reached through
the indexed SDS13 window and the SDS_MISC fields use a different layout.
Family D gets its own tuning tables and SDS_MISC programming, and it
skips the family C option register probe, the SerDes pause programming
and pcs_link_up().

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 3f45ff43cb4c8..cfb8d4bb1126c 100644
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
This early return comes before the "Nothing to probe if no external
interface is wired to the SerDes" loop over mb->chip_info->extints. As a
result, every family D chip ends up with sds_supported set, whether or
not it has an SGMII/HSGMII extint.

In rtl8365mb_setup(), sds_supported is the only check before the rate
limiters are raised:

	if (mb->sds_supported) {
		ret = rtl8365mb_sds_raise_rate_limits(priv);

So every family D chip now gets 0xFFFF written to 0x00CF and 0x0398, and
GENMASK(2, 0) written to 0x00D0 and 0x0399. Before this patch, family D
never wrote those registers.

The 19-bit LSB/MSB layout and the reason for raising these registers
(the 0x1FFFF reset default) are documented only for family C. The commit
message also says:

  "The port 6 rate limiter registers it writes are the family C ones;
   they have not been compared with the vendor RTL8367D API."

If these addresses mean something else on the RTL8367D, the regmap
writes would still succeed. The switch would be misconfigured and no
error would be reported.

For the RTL8367S-VB this probably makes no difference, since it does
have a SerDes on port 6. The commit message does say the code is meant
to be reused by other family D boards, though. A later family D chip
without a port 6 SerDes would still get these writes.

Could the family D branch skip only the option register read and keep
the extint check? And could the limiter addresses be checked against
the RTL8367D API, or the writes skipped on family D until they have
been?

>  	/* Nothing to probe if no external interface is wired to the SerDes */
>  	for (i = 0; i < RTL8365MB_MAX_NUM_EXTINTS; i++) {
>  		extint = &mb->chip_info->extints[i];

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com

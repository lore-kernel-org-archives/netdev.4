Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427504;
	b=h+CTvk/i+xpTVelgON3nW5+wxNJQ1GTpjF8X55VUdrlphGYbjKN77kty8Vt++i3WZk61
	 EU77bugpE2Az5Uoed8ScIlPC9ZkjTAkpPWEra97Yo8si8mJ+YH7LzoTYSSckBnrloGWP0
	 uysyaTmLAr1bYJHRxSyP/VaTVLSgYagH/nO/OefJnUgevD1v4kkbJjBYDj+W0T3VN485l
	 dcS3fB3k15uW4Wq9W/Czwu1OrJfH2brTVJnQhX8Zj1r8s80+fAHXI2ZTh1q7pAN9Fw4wP
	 laqDlOiKXPY1tzdnUn53OUoubUuMM7qiSjmv9Wzlqvmv8hnofbliCm1CAGHasnOdprQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427504;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qoOqqQyfe2VE0IHHms+1mItF/LiME/jGAh/E3IK/h1g=;
	b=mYg9g+HN98P4UcEb0LS7Z8O0aS9rw+qmsG/9YZ+hgBgf4AW8OezkA2ymsNm8Eso3RcZX
	 q8PslE5vj63dzVoKL3jsZr/b6eaezmR9XOVdVMQ7RTcyKztH3lK/D4Q8ILbkjclFZ3zru
	 6uh7Kl19jfHdidumUSE8Abw7uaJCivs0ez3Sl2jBglcb6B+9BILWExVW8s2Ll4yvinL+Z
	 7eODUr7qURpBzLWFpxqrG0b6IaRywUl7cTRRghYpCbWeSQczT+b48R8M945c5pd9kOQv0
	 L1dJUPC9mB872jK2rJ/EBD2cvP2HaWSGWmBj1meUm0TjwXtXpbPCr/O3jOuWoPbH3hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGk08+lf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C3606A334;
	Mon, 23 Nov 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iGk08+lf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48381F008B2;
	Mon, 23 Nov 2026 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795427503;
	bh=qoOqqQyfe2VE0IHHms+1mItF/LiME/jGAh/E3IK/h1g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iGk08+lfig9c0ZiEvUxD7Pm2/gQWupmhNEZ91w/bFTHl6Jln5/AGfw1vkovGWHQP4
	 M81SmfGsytsDDMkMS6gV2B2JQ8/56qg7KWk3+FfK8EJUxZ6BNLPgxZjxWFOpDhSrfY
	 LSOsLVo/E3PIXKTg5i9nDLEXv324aIYYtxlFbbel/bUbUpH7155a85h0/1Xbee8IkL
	 yk7qIbUnyaGCpyqRHNKG0XG07nQb2CafvosuLc3WUio+Y2qvG4euMSuopmt/Yoktos
	 O5yWknnh+Vba+SGvwrhBTyzwFt+2adao/+vMYlYU7nwrvLpHFuK87foZRE10V/O2Yi
	 ct/UDqTvZ82QQ==
Subject: Re: [PATCH net-next v13 13/14] net: dsa: realtek: rtl8365mb: use PCP
 numbering on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 23 Nov 2026 09:51:42 +0000
Message-ID: <179542750228.3135.1234426620734047109@kernel.org>
In-Reply-To: <f5adc725-64fd-4aa5-b76f-b817528ba1be@yahoo.com>
References: <f5adc725-64fd-4aa5-b76f-b817528ba1be@yahoo.com>
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

- [Medium] On family D, rtl8365mb_qos_set_port_prio()
  (drivers/net/dsa/realtek/rtl8365mb_qos.c:261) accepts any default…
- [Low] The realtek_ops::qos_set_port_prio contract in
  drivers/net/dsa/realtek/realtek.h:186-191 says the callback sets the…
- [Low] Within rtl8365mb_qos.c, this patch uses `iprio` to mean the
  802.1Q traffic type (rtl8365mb_qos_iprio_to_hw(priv, u8 iprio),…

--

net: dsa: realtek: rtl8365mb: use PCP numbering on family D

On family D, this patch converts between 802.1Q traffic types and the
chip's PCP-style priority numbering at the register boundary. That covers
the port priority, the PCP and DSCP priority tables, and the
priority-to-queue table. Family D has no untagged-PCP register, so
rtl8365mb_qos_set_port_prio() now returns -EOPNOTSUPP there when untag_pcp
does not match the PCP the port priority implies.

Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-7067296792

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
> index 5b9e1abe75c8b..c06d684825c0b 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c

[ ... ]

> @@ -231,41 +264,69 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio,
>  	u32 untag_reg = RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port);
>  	u32 reg = RTL8365MB_QOS_PORT_PRI_REG(port);
>  	u32 mask = rtl8365mb_qos_sel_mask(port);
> -	int ret;
> +	int hw, ret;
>  
>  	ret = rtl8365mb_qos_check_port(priv, port);
>  	if (ret)
>  		return ret;
>  
> -	ret = rtl8365mb_qos_regmap_update_field(priv, untag_reg, mask,
> -						untag_pcp);
> -	if (ret)
> -		return ret;
> +	hw = rtl8365mb_qos_iprio_to_hw(priv, iprio);
> +	if (hw < 0)
> +		return hw;
> +
> +	if (rtl8365mb_is_d(priv)) {
> +		/* No separate PCP for untagged frames: it is the one the
> +		 * port priority implies, so a different one cannot be set.
> +		 */

[Severity: Medium]
Is this also true when untagged frames are classified at ingress, or only
for the PCP of a tag inserted on egress?

This file's comment above rtl8365mb_qos_apptrust_src[] says:

/* The 1Q source also classifies untagged frames, by the PCP given to untagged
 * frames. Ranked above DSCP, it would hide DSCP from untagged IP frames.
 */

Commit 78dc82293945 ("program the PCP of untagged frames") added the
0x0851/0x0852 write for that reason: "With PCP trust, the switch classifies
an untagged frame by this value. The value is 0 after reset, so untagged
frames would be Best Effort whatever the port default priority is."

On family D that write is now skipped. The commit message also says
dal_rtl8367d_vlan_portPvid_set() rejects any priority other than 0, which
suggests the untagged PCP is fixed at 0 there. On family D,
rtl8365mb_qos_set_apptrust() still ranks the 1Q source above
RTL8365MB_QOS_WEIGHT_PORT.

Suppose the family D 1Q source classifies untagged frames the same way
family C does. What happens with this sequence?

  dcb app replace dev lanX default-prio X     (X != 0)
  dcb apptrust set dev lanX order pcp

rtl83xx_port_set_default_prio() calls rtl8365mb_qos_set_port_prio() with
(pcp_to_tt(X), X). The untag_pcp != hw check passes, and the port priority
is written as X.

Once PCP is trusted, would untagged frames be classified from PCP 0? They
would then go to the Best Effort queue and get PCP 0 in any tag inserted
on egress, instead of X as on family C.

If so, the driver reports success for a default priority the hardware
does not apply. Also, the new "family C only" comment on
RTL8365MB_QOS_PORT_UNTAG_PCP_REG seems to conflict with the apptrust
comment for family D.

The commit message says testing was done without CONFIG_DCB, so this path
may not have been exercised.

> +		if (untag_pcp != hw)
> +			return -EOPNOTSUPP;

[Severity: Low]
This isn't a bug today, but should the qos_set_port_prio contract in
realtek.h be updated too? It still says:

	/* Set the priority of @port to @iprio, and make @untag_pcp the PCP
	 * given to untagged frames on @port. @untag_pcp is an 802.1p
	 * priority, not an iprio.
	 */

That reads as if untag_pcp is applied on its own. On family D it is never
programmed, and any value other than ieee8021q_tt_to_pcp(iprio) gets
-EOPNOTSUPP.

The two current callers, rtl83xx_qos_init_port() and
rtl83xx_port_set_default_prio(), both pass matching values, so this branch
can't be reached now. The documented contract allows a later shared-layer
change to set the untagged PCP on its own. Such a change would fail only
on family D.

> +	} else {
> +		ret = rtl8365mb_qos_regmap_update_field(priv, untag_reg, mask,
> +							untag_pcp);
> +		if (ret)
> +			return ret;
> +	}
>  
> -	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, iprio);
> +	return rtl8365mb_qos_regmap_update_field(priv, reg, mask, hw);
>  }

[ ... ]

> @@ -306,19 +367,27 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
>  {
>  	unsigned int nq = priv->ds.num_tx_queues;
>  	struct dsa_port *dp;
> -	int iprio, ret;
> +	int prio, ret;
>  
> -	for (iprio = 0; iprio < RTL8365MB_NUM_INTERNAL_PRIOS; iprio++) {
> -		int tc = ieee8021q_tt_to_tc(iprio, nq);
> +	/* The table is indexed by the chip's priority, which is the traffic
> +	 * type on family C and the PCP on family D.
> +	 */
> +	for (prio = 0; prio < RTL8365MB_NUM_INTERNAL_PRIOS; prio++) {

[ ... ]

>  		qid = rtl8365mb_qos_tc_to_qid(nq, tc);
>  		ret = rtl8365mb_qos_set_qmap_qid(priv,
>  						 RTL8365MB_QOS_QMAP_DEFAULT,
> -						 iprio, qid);
> +						 prio, qid);

[Severity: Low]
This isn't a bug, but rtl8365mb_qos_set_qmap_qid() still calls its index
parameter iprio, and so does RTL8365MB_QOS_QMAP_TBL_REG(_m, _iprio):

static int rtl8365mb_qos_set_qmap_qid(struct realtek_priv *priv, int qmap,
				      u8 iprio, u8 qid)

In the rest of this file, and in realtek.h, an iprio is a traffic type.
This helper now receives the chip's priority instead. On family D that is
in PCP numbering, where BE (1) and BK (0) are swapped.

The only caller passes the right value. Could the parameter be renamed,
for example to prio or hw? Otherwise a future caller that passes a real
traffic type would put BE and BK in each other's queues on family D.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/3f1826f8-3096-40dd-a278-c70fce4852c8%40yahoo.com

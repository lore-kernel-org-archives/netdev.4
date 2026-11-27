Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748429;
	b=LrXjfvfUzScs+ENaMvBsqPZxvxE5cqfCFmSrNLRMjiHgVxfJf6L4xUetTTIOZsgDGyZg
	 RUECRGFfAAN6wA8kaZOKZ3rSOo3/NNIndrUWSIpRhBnvnTn9HGWsOfWhbJOUzdDyN7ifl
	 cVBKslseNpsy2szr2YLP+sPs41hfYW5jRvNP4g/9nqpSD0KNk71wkRIi6bGgFit9PSl6j
	 zMVsf1H9pA+lkY7iqeEOFWkB1nR46Plo0GnmeVyImbfRiW1xTRKDhetlqlvhaUe4G2MyW
	 4UM6zg4YUFIdeA/zeKyXl5dL5fSAoNyxzXUuDlRbJ4JJA/ycQVGgMCpGSNbE5EAqitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748429;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=R0Vs5cMh1I8sELTgtzEauSmU6SnbuXs/YWY69nxtdIo=;
	b=2d+fXl6h1ZU0Znbx8JjWmlyLPpVukyMdT/49W2T2EasAeB4y6KHJ4Zi9CS7a6G0d6xD1
	 qIvA5gtqURdA+y3Zps03RzCYrMGOeOxyWBTqfytWYt+bZAUdWpdjTF4iHYxF2A9u0PpwA
	 +bMZ+ktjkcSRwxk/Hohoyqz1WDKGKcvO13L0PjHOoOLVaptsAoAiFgLBRlXvGTJ5NXBpn
	 HJQ825fwi6gmR6F7cwL5pMRvTc7fxHfPDK+JqKXDaDrifLBuO/9jLSE7Mm8+XhSo6Z4zs
	 auaAF4xoDXrKV3LfsTdJlQqQlEsic6aQcowx2fIuu4wxUbXyLUy/rCwKKBz9pW9e5wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CIshqDiN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA1606A697;
	Fri, 27 Nov 2026 03:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CIshqDiN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152481F00A22;
	Fri, 27 Nov 2026 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748429;
	bh=R0Vs5cMh1I8sELTgtzEauSmU6SnbuXs/YWY69nxtdIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CIshqDiNIElgldUMIWCCu6vOprXOUWlxNMRuFgeUDR1NZ5/BVpyIk0ERfSTu0uSiR
	 4V+lt/T9RpPvzRuQkydqPr5K1+g4yfNySyHUIf7qfpxl/5hbGgd9v3kP/d8BsTmMrV
	 GePB6Alm/0YXguMm0lIaUPvvpEmMo/+WgzbdPI4mR7RC1GMgRZYHD1Ng/5UKGr+8NR
	 rQPeh02/kt3wtp4JTFyHodYzdtrDR/Qf9WKvaDZGymT8aBYXndo9dAUdyA5HObeK8a
	 4FM+YMF5TKspMkDaRugjWO/dA6ElRenOajKTpeW+qKjswIzchzeFApsG5TgMkOF6Zf
	 Ht/Mb3g8MOr7A==
Subject: Re: [PATCH net-next v14 13/15] net: dsa: realtek: rtl8365mb: refactor
 QoS priority handling
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:27 +0000
Message-ID: <179574842763.3135.17585827427222955504@kernel.org>
In-Reply-To: <5540b093-3ecf-4ba8-99ee-84197a037f11@yahoo.com>
References: <5540b093-3ecf-4ba8-99ee-84197a037f11@yahoo.com>
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

- [Low] This patch splits the QoS code into two value spaces.

--

net: dsa: realtek: rtl8365mb: refactor QoS priority handling

This patch moves two pieces of QoS handling behind three new
rtl8365mb_family_info hooks: the conversion between an 802.1Q traffic
type and the chip's priority, and the programming of the untagged-frame
PCP. The hooks are qos_iprio_to_hw, qos_hw_to_iprio and
qos_set_untag_pcp. Family C keeps its existing behaviour through an
identity mapping, and rtl8365mb_qos_qmap_init() now iterates over chip
priorities and converts each one back to a traffic type.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
> index 5b9e1abe75c8b..b61ffdb4073ac 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c

[ ... ]

> +/* Convert an internal priority (an 802.1Q traffic type) to the value the
> + * chip uses. Return the value or a negative errno.
> + */
> +static int rtl8365mb_qos_iprio_to_hw(struct realtek_priv *priv, u8 iprio)
> +{
> +	return rtl8365mb_get_family_info(priv)->qos_iprio_to_hw(iprio);
> +}

[ ... ]

> @@ -306,19 +366,27 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
>  {
>  	unsigned int nq = priv->ds.num_tx_queues;
>  	struct dsa_port *dp;
> -	int iprio, ret;
> +	int prio, ret;
>  
> -	for (iprio = 0; iprio < RTL8365MB_NUM_INTERNAL_PRIOS; iprio++) {
> -		int tc = ieee8021q_tt_to_tc(iprio, nq);
> +	/* The table is indexed by the chip's priority, not by the traffic
> +	 * type.
> +	 */
> +	for (prio = 0; prio < RTL8365MB_NUM_INTERNAL_PRIOS; prio++) {
> +		int tt = rtl8365mb_qos_hw_to_iprio(priv, prio);
> +		int tc;
>  		u8 qid;
>  
> +		if (tt < 0)
> +			return tt;
> +
> +		tc = ieee8021q_tt_to_tc(tt, nq);
>  		if (tc < 0)
>  			return tc;
>  
>  		qid = rtl8365mb_qos_tc_to_qid(nq, tc);
>  		ret = rtl8365mb_qos_set_qmap_qid(priv,
>  						 RTL8365MB_QOS_QMAP_DEFAULT,
> -						 iprio, qid);
> +						 prio, qid);

[Severity: Low]
This isn't a bug, but should the remaining names and comments be updated
to match the new split between iprio (traffic type) and hw (chip
priority)?

The loop now passes the chip priority to rtl8365mb_qos_set_qmap_qid().
The callee still calls that argument iprio, and so does the register
macro it uses:

static int rtl8365mb_qos_set_qmap_qid(struct realtek_priv *priv, int qmap,
				      u8 iprio, u8 qid)
{
	u32 reg = RTL8365MB_QOS_QMAP_TBL_REG(qmap, iprio);

#define RTL8365MB_QOS_QMAP_TBL_REG(_m, _iprio) \

In the same file, rtl8365mb_qos_set_pcp_prio() and
rtl8365mb_qos_set_dscp_prio() use iprio for the traffic type before
converting it, so the same parameter name now means two different
things.

A few register comments also still describe their contents as an
internal priority, although after this patch they hold the converted hw
value:

/* qmaps: the queue id of each internal priority, one table per qmap */
/* 802.1p (PCP) -> internal priority remap */
/* DSCP -> internal priority, one table for the whole chip */

rtl8365mb_qos.h has the same wording:

/* Internal priority -> queue id tables (qmaps) */

At this commit, the comment at the top of rtl8365mb_qos.c ("The chip's
eight internal priorities carry 802.1Q traffic types") also conflicts
with the new "not by the traffic type" comment above.

The later patch "net: dsa: realtek: rtl8365mb: use PCP numbering on
family D" rewrites the top-of-file comment. It leaves the
rtl8365mb_qos_set_qmap_qid() parameter, the RTL8365MB_QOS_QMAP_TBL_REG()
argument and the register and header comments unchanged.

On family D the two value spaces really are different, so would renaming
these (for example to hw_prio, matching qos_set_untag_pcp) make it
harder to pass the wrong one later?

>  		if (ret)
>  			return ret;
>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com

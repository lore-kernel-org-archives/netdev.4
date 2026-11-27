Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748431;
	b=lFjJrh/i3g5v2Q4sSQkVZyP6dHI2sbmsXubY8bvrw3QVEqmaUEozQ04WhgZ+yMIyiVTp
	 KYerwM1JYPPmAjhXXAmAuAoGLz5DvenKo6eXuX/qX9k6x2QUMq+fS2bgEM+sqNwV9rD6I
	 rm++0/cOPuHlO4Z/4xQc9sbC5I4MOEyTjb4QHaKfEOIUXYMxHUvrTDvo4acXxwb35nyls
	 MJJZqGw+blF2dpnxL+Ty4mYm+7bPpTzJBMR1BDLWKXm9r9ZJve+F8t03nCeEaohaSCvz6
	 niAPzEfErtv5i3rltakxO+VdI/hukvbSlPP7lW56LmY5gF4sfsnaPjL6uLHj2ZFKBQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748431;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lFUIyud/tgcOJfEAUvn7F3pidLFMaTUXABN0o7xVBo0=;
	b=rbIOr5FhmRyhWTzp0ZrNEll3qg448pe4rkQ/CiSZilE/moQsDPAU4GYLfPLNYREXcwmT
	 L8LN882gjmyhWT0J+dOe+nZbaCezrjsn4VmlnoNLoU1Krl4rZnUDY8P0rHpdFHGw5IXMK
	 c/OZkRIBbJoCM1lTuC57sSksMmsp1Tl7BiAytdq8i/zjPXjUlnZLwHsK1IB3IomVAMfHV
	 7f1wnc/bU43D78MJZTjBU/2OzZp+MBTsdV/pqK+jqUJoEu6p8HClwEvskCJWeBCZEVPsH
	 6OXeH4CUQIjJTPFFN5O0IP91IDSyX7fKcRgPagoROpd3UYe7qgaV3zNXiK8n0YaTlIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2A8TrBq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C6606A31E;
	Fri, 27 Nov 2026 03:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P2A8TrBq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230801F00923;
	Fri, 27 Nov 2026 03:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748431;
	bh=lFUIyud/tgcOJfEAUvn7F3pidLFMaTUXABN0o7xVBo0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P2A8TrBqTqeVuSpF68QxU9E5j6WyQnj1CN1S6eIE1QgEzRFrXTqR1y12K7dmyccdx
	 HOsecKGxRpz6W4kPsPZKAoBilop8ro2sVi07tjg4V7+fNkMSTLDsnrgt0B/iBtGaq8
	 hb0p4x93Dp6WzhBzyguNH7oxMLbyblVi4hZ0GqbW8AKbS+pxm0CU4vmqmEeBkjphMw
	 kMVvazTotZCMjQkEnNkuFV+SmLL5G7Pi8bQBA12BTWvYrnQmZ9+e+xKK2MCkpjWHP4
	 KtkoL+1/ca79fjgsDoBeDdymzJCbU2aIMGSSzDfc1eDHd9HEES4bG0oZdbqNsK7tW7
	 iAwOJEw+SZy8w==
Subject: Re: [PATCH net-next v14 14/15] net: dsa: realtek: rtl8365mb: use PCP
 numbering on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev,
 o.rempel@pengutronix.de
Date: Fri, 27 Nov 2026 03:00:29 +0000
Message-ID: <179574842969.3135.9032643822803801824@kernel.org>
In-Reply-To: <fd7d2df4-3994-4091-a63f-7ba57310cedc@yahoo.com>
References: <fd7d2df4-3994-4091-a63f-7ba57310cedc@yahoo.com>
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

- [Medium] rtl8365mb_d_qos_set_untag_pcp() returns success and programs
  nothing whenever untag_pcp == hw_prio.
- [Low] The qmap helpers still call their index an `iprio`, but after
  this patch the index is the chip's priority, and on family D that is…
- [Low] The kernel-doc for realtek_ops.qos_set_port_prio in realtek.h
  says the backend will "Set the priority of @port to @iprio, and make…

--

net: dsa: realtek: rtl8365mb: use PCP numbering on family D

This patch adds family D implementations of the qos_iprio_to_hw,
qos_hw_to_iprio and qos_set_untag_pcp hooks. With them, family D numbers
its internal priorities like PCP values and converts traffic types at the
register boundary. Family D has no untagged PCP register, so its
qos_set_untag_pcp hook returns -EOPNOTSUPP when the untagged PCP differs
from the one the port priority implies.

Closes: https://github.com/openwrt/openwrt/pull/19644#issuecomment-7067296792

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
> index b61ffdb4073ac..23e1ebbe0a591 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c

[ ... ]

> @@ -239,6 +245,26 @@ int rtl8365mb_c_qos_set_untag_pcp(struct realtek_priv *priv, int port,
>  						 untag_pcp);
>  }
>  
> +/* Family D numbers its internal priorities like PCP values */
> +int rtl8365mb_d_qos_iprio_to_hw(u8 iprio)
> +{
> +	return ieee8021q_tt_to_pcp(iprio);
> +}
> +
> +int rtl8365mb_d_qos_hw_to_iprio(u8 hw)
> +{
> +	return ieee8021q_pcp_to_tt(hw);
> +}
> +
> +/* There is no separate PCP for untagged frames: it is the one the port
> + * priority implies, so a different one cannot be set.
> + */
> +int rtl8365mb_d_qos_set_untag_pcp(struct realtek_priv *priv, int port,
> +				  u8 hw_prio, u8 untag_pcp)
> +{
> +	return untag_pcp == hw_prio ? 0 : -EOPNOTSUPP;
> +}

[Severity: Medium]

This comment says the untagged-frame PCP "is the one the port priority
implies". The commit message only shows that for the PCP of a newly
inserted egress tag. It also says:

  "it is not known whether the chip then classifies untagged frames by
  that priority or by PCP 0."

On family C, the 1Q priority source classifies untagged frames using
RTL8365MB_QOS_PORT_UNTAG_PCP_REG. rtl8365mb_c_qos_set_untag_pcp() sets
that register to the dcb default prio.

Family D has no such register. The vendor dal_rtl8367d_vlan_portPvid_set()
also rejects any priority != 0. That suggests the port-based VLAN priority
that feeds the 1Q classifier is fixed at 0.

The last patch of the series wires up the family D hooks. After that,
could this sequence leave untagged frames with the wrong priority?

  dcb app add dev swpN default-prio X    (X != 0)
    rtl83xx_port_set_default_prio()
      qos_set_port_prio(priv, port, pcp_to_tt(X), X)
        rtl8365mb_qos_set_port_prio()
          rtl8365mb_d_qos_set_untag_pcp()   /* hw == X, returns 0 */

  dcb apptrust set dev swpN order pcp
    rtl83xx_port_set_apptrust()->rtl8365mb_qos_set_apptrust()
      /* RTL8365MB_QOS_PRIDEC_1Q weighted above the port source */

Suppose the 1Q classifier then uses PCP 0 for untagged frames. They would
map through remap[0] to hw 0 (Best Effort) and leave with PCP 0 instead
of X. Meanwhile rtl83xx_port_get_default_prio() would still read X back
from the port priority register, so dcbnl reports a default priority
that is not in effect.

Could the hook refuse this case instead? For example, it could reject a
non-zero untag_pcp on family D, or PCP trust could be rejected while a
non-zero default prio is set. Or could the comment describe this as an
unverified limitation rather than state it as fact?

[Severity: Low]

The qos_set_port_prio documentation in realtek.h still reads:

	/* Set the priority of @port to @iprio, and make @untag_pcp the PCP
	 * given to untagged frames on @port. @untag_pcp is an 802.1p
	 * priority, not an iprio.
	 */

That wording treats untag_pcp as independent of iprio. This hook returns
-EOPNOTSUPP whenever untag_pcp differs from ieee8021q_tt_to_pcp(iprio).

Both current callers in rtl83xx-qos.c, rtl83xx_qos_init_port() and
rtl83xx_port_set_default_prio(), pass matching values. So the error path
cannot be reached today. However, the restriction is only described in
the commit message.

Should the ops documentation say that a backend may reject an untag_pcp
that does not match iprio? Otherwise a future shared-layer caller that
sets the untagged PCP separately would work on family C and fail only on
family D.

Similarly, the comment above the apptrust table in rtl8365mb_qos.c still
describes the family C register model:

/* The 1Q source also classifies untagged frames, by the PCP given to untagged
 * frames. Ranked above DSCP, it would hide DSCP from untagged IP frames.
 */

> @@ -368,8 +394,8 @@ int rtl8365mb_qos_qmap_init(struct realtek_priv *priv)
>  	struct dsa_port *dp;
>  	int prio, ret;
>  
> -	/* The table is indexed by the chip's priority, not by the traffic
> -	 * type.
> +	/* The table is indexed by the chip's priority, which is the traffic
> +	 * type on family C and the PCP on family D.
>  	 */
>  	for (prio = 0; prio < RTL8365MB_NUM_INTERNAL_PRIOS; prio++) {
>  		int tt = rtl8365mb_qos_hw_to_iprio(priv, prio);

[Severity: Low]

This isn't a bug, but the qmap helpers still call this index an iprio:

/* qmaps: the queue id of each internal priority, one table per qmap */
...
#define RTL8365MB_QOS_QMAP_TBL_REG(_m, _iprio) \

static int rtl8365mb_qos_set_qmap_qid(struct realtek_priv *priv, int qmap,
				      u8 iprio, u8 qid)

realtek.h defines an iprio as an internal priority that holds an enum
ieee8021q_traffic_type value. rtl8365mb_qos_set_port_prio(),
rtl8365mb_qos_set_pcp_prio() and rtl8365mb_qos_set_dscp_prio() all use
iprio in that sense and convert it through qos_iprio_to_hw().

rtl8365mb_qos_qmap_init() passes the hardware prio as that iprio
argument, not tt. That did no harm on family C, where the two are equal.
With the family D hooks they differ: Best Effort is tt 1 / hw 0, and
Background is tt 0 / hw 1.

Could the parameter, the macro argument and the qmaps comment be renamed
to say they take the chip's priority? Otherwise a later caller that
passes a traffic type would swap the BE and BK queue slots on family D.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/874b29a3-f47f-4bf2-a0f6-2f9fea712f4c%40yahoo.com

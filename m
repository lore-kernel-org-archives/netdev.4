Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079417;
	b=QvyqxJ5cVTjyNBpRc2xU6bkQOLDwhAvFQfImXEaEd2238JWSFWGff08qLXTSOS7rhj8F
	 tXqFB+CAI+364NAB13gDOEji73oEH+A8g58LuqWemKOLXqt20kEVVa3IuUBLggIj1yGqk
	 bHeJWCXlcYRrqxyAP2Rysf/Q1U+YgAs624USQy4TKGz7R7S+mXlaUEbtcOPHv6ijBn/Lt
	 M8TmX/aSgoqGCWM1/+UTyyzFWZb3pYNOA1BXfFU9Km8zSnykMzJpIug6gbBw0c+T9ujjH
	 wLhlU/ZlP6yoGvlKqlqp95u+P1iJJUvuDLtK7/hPcbveq/az3Rv9qajOwF25BMrSOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079417;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QZaIpmJbdbbLJ0/+K2lgnwIVoF87UxKHw3bi+8cUMeI=;
	b=4zP48ysYcsEyNiBQRbiAXwaPeoxz6cKuXp507kwzTymuSWwviHb2cTBHl/Pua9VczvuI
	 Vt9O1Ok+XYaiZDIL03TuBH6trZQxx6O/G3TTYyP4PMt4HdXI0LN+IDLeI+k3cpjiIvBv5
	 yqY8PjuIK7H26UTUbnuBFELQ4RgLUWNwTQX0JQDRKWzcvVQo4tlpc9pHLumm0NO5fZ/E8
	 YHSMDYy/70fAlf23/sL9Xpud9f+88tnPso5ekgYjXx6Cl+8dCmbMxTM/EhCRW6yhmlNdh
	 eukE1Xzz7xZp3+q9FvwwktzhJbe8WxfTaALZBw4VeuHUbsWkA/uXmWMhWU8FB0tHPBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0ZG4SCx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E80606A326;
	Thu, 19 Nov 2026 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0ZG4SCx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB1F1F000C4;
	Thu, 19 Nov 2026 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079417;
	bh=QZaIpmJbdbbLJ0/+K2lgnwIVoF87UxKHw3bi+8cUMeI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n0ZG4SCxH3CFGBQKpAGOjOTbSmbkbU/jbqQbT9GAJbMCquQ/Vq8wkbVUMdzVSwAkD
	 q3HE+7GhBaWnU5dR7NALmPmOlm+jMyXM10X0sHNojf2WY5ruj//ZoAV/UUrsOTYuuc
	 oP28MkPMPnJi0sr4usfP73DXRsjd5NhfpWIoW27xYvrWJgrpBeOQhZz6AygAaVQ11f
	 md1roGbx61yL7zNmOzW+Jsiq0KmWLgpBzeCfniYyGcOqR3FgmmJEKK+1G4xOORKIg/
	 PnxVyNZGqgvyumB51dcO8noOyZ4VoY1gzoCixr59JoJXRCmvtKsTs8cfK1ZuNkGwOQ
	 MTEq1qaBzsRgQ==
Subject:
 Re: [PATCH net v6 7/8] net: dsa: b53: harden mirror register programming
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 09:10:16 +0000
Message-ID: <179507941634.3136.10463696917464189508@kernel.org>
In-Reply-To: <20261116210943.1352656-8-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-8-florian.fainelli@broadcom.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch fixes a regression that an earlier patch in the
  same series introduced.
- [Low] The series is split badly around b53_mirror_init().

Pre-existing issues:
- [Low] At this commit, on BCM5325/BCM5365, the mirror source masks and
  capture-port field use the newer-chip encoding.

--

net: dsa: b53: harden mirror register programming

This commit clears and rebuilds the mirror registers during b53 and
bcm_sf2 setup. It also checks every mirror register access in
b53_mirror_add() and b53_mirror_del(), and only increments the source
reference count once programming has succeeded. Whether a destination is
occupied is now decided from the source masks instead of MIRROR_EN.

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index 98696bce368fe..deb331b3629a7 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -1360,6 +1360,10 @@ static int b53_setup(struct dsa_switch *ds)
>  		return ret;
>  	}
>  
> +	ret = b53_mirror_init(ds);
> +	if (ret)
> +		return ret;
> +

[Severity: Low]
The commit message says this patch will "Clear capture control and both
source-control registers during b53 and bcm_sf2 setup, then rebuild the
source masks and capture destination from the mirror reference counts".
The diff, however, only adds the calls in b53_setup() and
bcm_sf2_sw_setup().

The previous patch, "net: dsa: b53: reference count shared mirror source
bits", added the body of b53_mirror_init(), its EXPORT_SYMBOL and the
prototype in b53_priv.h. That patch's message only talks about reference
counting, and the function has no callers there.

Could b53_mirror_init() move into this patch, or could the earlier commit
message describe it?

As it stands, cherry-picking this commit through its Fixes: tag without
the previous one would fail to build because b53_mirror_init() is
undefined. The "must be applied after them" note doesn't say that the
dependency is a missing function body.

[ ... ]

> @@ -2654,14 +2658,25 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
>  {
>  	struct b53_device *dev = ds->priv;
>  	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
> -	u16 reg, loc, cap_ctl;
> +	u16 reg, other_reg, loc, other_loc, cap_ctl;
>  	int ret;
>  
> +	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
> +	other_loc = ingress ? B53_EG_MIR_CTL : B53_IG_MIR_CTL;
> +
> +	ret = b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
> +	if (ret)
> +		return ret;
> +
> +	ret = b53_read16(dev, B53_MGMT_PAGE, other_loc, &other_reg);
> +	if (ret)
> +		return ret;
> +
>  	ret = b53_read16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, &cap_ctl);
>  	if (ret)
>  		return ret;
>  
> -	if ((cap_ctl & MIRROR_EN) &&
> +	if (((reg | other_reg) & MIRROR_MASK) &&
>  	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {

[Severity: Medium]
This replaces the (cap_ctl & MIRROR_EN) check that "net: dsa: b53: reject
conflicting mirror destinations" added earlier in this series. Is that
earlier patch a regression on its own?

At that point in the series, nothing in setup clears the mirror
registers. The baseline add path always overwrote B53_MIR_CAP_CTL.
b53_switch_reset() only soft-resets some chips:

	if (is539x(dev)) {
		b53_write8(dev, B53_CTRL_PAGE, B53_SOFTRESET, 0x83);
		b53_write8(dev, B53_CTRL_PAGE, B53_SOFTRESET, 0x00);
	}
	...
	if (dev->chip_id == BCM58XX_DEVICE_ID ||
	    dev->chip_id == BCM583XX_DEVICE_ID) {

Take one of the other chips with no reset GPIO, where a bootloader or a
kexec'd kernel left MIRROR_EN set with a different capture port. The
first valid tc matchall mirror rule then fails with -EOPNOTSUPP.

If stale source bits were also left set, b53_mirror_del() never clears
MIRROR_EN. Another destination then can't be selected until a power
cycle.

The earlier patch carries Fixes: ed3af5fd08eb and a Reviewed-by, so
stable tooling can pick it up without this one. The "must be applied
after them" note only guards the other direction.

"net: dsa: b53: reference count shared mirror source bits" has a similar
problem. It increments mirror_count after unchecked writes, so a failed
first programming attempt is recorded as success. Later adds for the same
port and direction then return early instead of reprogramming. This
patch fixes that ordering too.

Would it be better to squash the b53_mirror_init() wiring and the
source-mask occupancy check into "reject conflicting mirror
destinations", and the mirror_count reordering into "reference count
shared mirror source bits"? Reordering the series so that no single
commit regresses would also work.

>  		NL_SET_ERR_MSG_MOD(extack,
>  				   "Only one mirroring destination is supported");
> @@ -2673,19 +2688,17 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
>  		return 0;
>  	}
>  
> -	if (ingress)
> -		loc = B53_IG_MIR_CTL;
> -	else
> -		loc = B53_EG_MIR_CTL;
> -
> -	b53_read16(dev, B53_MGMT_PAGE, loc, &reg);
> -	reg |= BIT(port);
> -	b53_write16(dev, B53_MGMT_PAGE, loc, reg);
> -
> +	/* Select the destination before enabling the new source. */
>  	cap_ctl &= ~CAP_PORT_MASK;
>  	cap_ctl |= mirror->to_local_port;
>  	cap_ctl |= MIRROR_EN;
> -	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
> +	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
> +	if (ret)
> +		return ret;
> +
> +	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
> +	if (ret)
> +		return ret;
>  
>  	(*mirror_count)++;

[Severity: Low]
This is a pre-existing issue, but is the source and capture-port encoding
right here for BCM5325/BCM5365?

The source bit is written as BIT(port), so the CPU port uses bit 5 rather
than hardware bit 8. The destination is compared and written as a raw
port number under CAP_PORT_MASK, but these chips expect a port bitmap.

b53_mirror_init() uses the same encoding (cap_ctl = MIRROR_EN |
dev->mirror_port), and so does b53_mirror_del() (reg &= ~BIT(port)). The
hardware can then mirror the wrong source or destination while
mirror_count and mirror_port report the rule as installed.

The encoding goes back to ed3af5fd08eb. A later patch in this series,
"net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365", fixes
it. That patch adds b53_mirror_port_mask(), b53_mirror_capture_port(),
b53_mirror_capture_port_mask() and CAP_PORT_MASK_25, and uses them in the
init, add and del paths.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116210943.1352656-1-florian.fainelli%40broadcom.com

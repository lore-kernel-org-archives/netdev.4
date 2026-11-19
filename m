Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123847;
	b=RDvago+Hif6ce4YHBvEjJGKA2d03EeKnvbgug548Kay3ZNY5JQGYNmf84zbMGn7dWes/
	 wxzeo5g/cj0Og4up2+mG3i7HXmDIFb5Kcj7pzTTjP+Zxl5HPLhOGPEHAljjJT0y7hEL0J
	 voMX3z6rlPbyDtWOB0HAiA60AVawVFwZU/of/KBQtSE4/RnBBFfhsxGeiasLD/INcJYEv
	 LtsbO2e2H/XKJWsud5irgNqc9LtnEYCW49dOjXJWGGaT4O3KKifivWM7Cb0Yo/dOkd7qo
	 1nFbun/95LcVCH/fojcQs6OGpU1fh5OGkveADx1P5zrZEtU8VkH058xwVTLPEfncYMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123847;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Xk1kv/Ctd3PlqbSpT6yLqdl6pmb3Zw8L64Vom2TNBMs=;
	b=PQmwuXeEQ5GMKQ30Z/SpcbDUiCI+QoB0SuBH3mHBU9AmNOucqZBcCbk/x7qOOtcoC2cL
	 rZ5bNt9pmA7OPFv0zVYtziIIaoIy5i93V2cb7idDi/dl8fHsgTDQgOASM2QYhr8axPiCl
	 mc7y6wI1Sm5PsGVqp0P/2OU+5J/GIDQ0sqg2Z/6drFJPBcAseM5e/NtX1GEZ0MtGXSTCQ
	 18Kz4x6LnfPQQ19u6bxkrwmsn/S90hGO9clJx9b/Pi6m5KL1vjofT3y8RuXKGd0aBxuza
	 7hLOL87IFJmxqWClRe9LV1j/3b2VjwLLAgOBl5sCA6a0qtTVz4S9K6c/jJUEDu+AX6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WB5Z/aFs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E6606A32A;
	Thu, 19 Nov 2026 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WB5Z/aFs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23441F000C0;
	Thu, 19 Nov 2026 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795123847;
	bh=Xk1kv/Ctd3PlqbSpT6yLqdl6pmb3Zw8L64Vom2TNBMs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WB5Z/aFsbCXGNYoBHDEh2EZeYlGp6ulxUbVFT9FBbtxXmYoHR9V9QYZS+rDP5ahpc
	 aEZH07F6xP3S1+P79btN2PCmnOQDMTZwVc2+9tpddrVYQUbi9qzZcGP/U8j3sZ3hKn
	 EfjZIx3M9g2NKr8AdZOn7St+alyET+cgjJFMXZo0qpnSNvuJDvrgFSyp/u2qu4kT/u
	 +27fiU1THOlEkOWrCWmGPBjWT0f7GHK/9+F6w+kcvoMnFQP2GmBgx5I8395WTVa4WL
	 m7ocoSl8y6rtsv78Y5OR3bWgUVUEucMIONDNbepYffhHy7t2sLATVAyDyCy7Dqx6Nj
	 f/8tmkondbYvQ==
Subject: Re: [PATCH net-next v2] net: dsa: b53: mirror CPU-bound frames to
 port 5 when port 8 is unused
From: netdev-bot+sashiko@kernel.org
To: joseph@telaak.dev
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 21:30:46 +0000
Message-ID: <179512384634.3136.13428964502385964682@kernel.org>
In-Reply-To: <20261116-b53-bpdu-mirror-v2-1-c39ab745730f@telaak.dev>
References: <20261116-b53-bpdu-mirror-v2-1-c39ab745730f@telaak.dev>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the problem and the fix apply to
  "boards that leave port 8 unconnected".
- [Low] The Fixes: attribution is incomplete.
- [Low] `b53_setup_cpu_mirror()` programs global switch state that
  nothing ever restores: `B53_PORT_CTRL(8)` = `PORT_CTRL_DIS_STATE`, the…
- [Low] `b53_setup_cpu_mirror()` hard-codes the IMP state override for
  port 8 to `PORT_OVERRIDE_EN | PORT_OVERRIDE_SPEED_1000M |…

--

net: dsa: b53: mirror CPU-bound frames to port 5 when port 8 is unused

This patch applies when port 5 is the CPU port and port 8 is unused in
DT. In that case b53 uses the switch's single mirror to copy frames to
the bridge group address from user ports to port 5. It also copies all
port 8 egress to port 5, with port 8 enabled and its link forced up, and
refuses tc mirroring while this is active.

> to port 8: BPDUs, the IGMP/MLD copies b53_enable_mcast_snooping()
> enables, and most traffic of standalone ports. On boards that leave
> port 8 unconnected these are lost, so STP never sees its peers and a

[ ... ]

> Fixes: 8fab459e69ab ("net: dsa: b53: Enable Broadcom tags for 531x5/539x families")

[Severity: Low]
Is this Fixes: tag complete? The loss of "most traffic of standalone
ports" seems to come from commit 4227ea91e265 ("net: dsa: b53: prevent
standalone from trying to forward to other ports"). That commit added this
to b53_setup_port():

	if (dsa_is_user_port(ds, port))
		b53_set_eap_mode(dev, port, EAP_MODE_SIMPLIFIED);

Its commit message notes that "effectively this redirects all incoming
traffic to the CPU port". In dual-IMP mode (GC_FRM_MGMT_PORT_M, set by
b53_brcm_hdr_setup() for CPU port 5), that redirect target is port 8.

Before 4227ea91e265, standalone traffic followed the PVLAN/ARL path, which
b53_imp_vlan_setup() points at port 5.

8fab459e69ab is older, so this doesn't lose stable coverage. Would it
still help to also name 4227ea91e265, so that the standalone breakage on
these boards can be traced?

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index b7aff5e238e85..f82139b0c501c 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c

[ ... ]

> @@ -1326,6 +1330,42 @@ int b53_setup_devlink_resources(struct dsa_switch *ds)

[ ... ]

> +static void b53_setup_cpu_mirror(struct dsa_switch *ds)
> +{
> +	struct b53_device *dev = ds->priv;
> +	int cpu_port = 5;
> +
> +	dev->cpu_mirror = false;
> +	if (dev->tag_protocol == DSA_TAG_PROTO_NONE ||
> +	    dev->imp_port != B53_CPU_PORT || B53_CPU_PORT >= ds->num_ports ||
> +	    !dsa_is_cpu_port(ds, cpu_port) ||
> +	    !dsa_is_unused_port(ds, B53_CPU_PORT))
> +		return;

[Severity: Medium]
The commit message says this is for "boards that leave port 8
unconnected". Can dsa_is_unused_port() tell such a board apart from one
where port 8 is wired inside the SoC and only disabled in DT?

On Northstar (BCM5301x) and NSP (BCM58xx), port 8 is wired inside the SoC
to a GMAC. arch/arm/boot/dts/broadcom/bcm-ns.dtsi has:

	port@8 {
		reg = <8>;
		ethernet = <&gmac2>;

and gmac2 stays enabled. Boards such as bcm4708-netgear-r6250.dts and
bcm47094-luxul-xwr-3100.dts use port 5 as the CPU port and set port@8 to
status = "disabled", so they pass all of these checks.

On those boards, the code below clears RX/TX_DISABLE on port 8 and forces
its link up at 1000/full. Before this patch, b53_disable_port() left port
8 with RX/TX disabled.

Port 8 then transmits the frames the switch traps or redirects to the CPU
(BPDUs, IGMP/MLD copies and, with EAP simplified mode, all standalone
ingress). They go to an internal MAC that DSA does not own and that
bgmac may have probed as an ordinary netdev.

The early return added to b53_disable_port() keeps port 8 enabled for the
life of the switch, with no way to opt out. b53_mirror_add() now also
returns -EOPNOTSUPP on all of these boards.

Should this be limited to chips where port 8 can't be wired internally?
If not, should the commit message say that 5301x/58xx boards with port 8
disabled in DT are affected too? Because of the Fixes: tag, this may also
be picked up for stable.

> +
> +	/* Rx/Tx on, STP disabled: only trapped frames leave port 8 */
> +	b53_write8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(B53_CPU_PORT),
> +		   PORT_CTRL_DIS_STATE);
> +	b53_write8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
> +		   PORT_OVERRIDE_EN | PORT_OVERRIDE_SPEED_1000M |
> +		   PORT_OVERRIDE_FULL_DUPLEX | PORT_OVERRIDE_LINK);

[Severity: Low]
Is a fixed 1000/full override valid for every chip and IMP strapping that
reaches this point? Everywhere else, the driver derives
B53_PORT_OVERRIDE_CTRL from phylink data in b53_force_link() and
b53_force_port_config().

Mirroring port 8 egress only works if port 8 actually transmits what is
queued for it. Suppose the IMP is strapped to a mode whose TX clock comes
from the missing link partner (MAC-mode MII), or the forced speed doesn't
match the strapped interface. Could port 8 then fail to drain, leaving
CPU-bound frames in its egress queue instead of being mirrored?

That depends on whether the mirror copy is taken at enqueue or at transmit
time, which I couldn't confirm from the driver. The patch covers all
dual-IMP chips, but it was only tested on one BCM53125 board.

> +
> +	b53_write48(dev, B53_MGMT_PAGE, B53_IG_MIR_MAC,
> +		    ether_addr_to_u64(eth_stp_addr));
> +	b53_write16(dev, B53_MGMT_PAGE, B53_IG_MIR_CTL,
> +		    (MIRROR_DA << MIRROR_FILTER_SHIFT) |
> +		    (dsa_user_ports(ds) & MIRROR_MASK));
> +	b53_write16(dev, B53_MGMT_PAGE, B53_EG_MIR_CTL, BIT(B53_CPU_PORT));
> +	b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, MIRROR_EN | cpu_port);
> +	dev->cpu_mirror = true;
> +}

[Severity: Low]
Is anything meant to undo this configuration? b53_teardown() only does
this:

static void b53_teardown(struct dsa_switch *ds)
{
	dsa_devlink_resources_unregister(ds);
}

b53_setup() doesn't roll it back if b53_enable_mcast_snooping() or
b53_setup_devlink_resources() fails afterwards. The early return above
also clears only dev->cpu_mirror and leaves the registers as they were.

On BCM531x5 parts without a reset GPIO, b53_switch_reset() issues no soft
reset; only is539x() and BCM58XX/BCM583XX get one. So this mirror and
port 8 override state can survive an unbind/rebind with a different DT,
or a kexec into another kernel.

Later, with cpu_mirror false, b53_mirror_add() only read-modify-writes
BIT(port) in the mirror control register and the capture port in
B53_MIR_CAP_CTL. Would a tc ingress mirror then inherit the MIRROR_DA
filter and the STP MAC, and copy only STP frames?

The stale BIT(8) in B53_EG_MIR_CTL would also copy all port 8 egress to
the user's capture port. And since B53_EG_MIR_CTL never becomes empty,
can b53_mirror_del() ever clear MIRROR_EN?

Separately, dev->cpu_mirror is set to true without checking any of the
b53_write*() return values. A failed bus write would leave the mirror
partly programmed, while tc mirroring is refused and port 8 stays enabled.
The rest of the driver also ignores b53_write*() errors, though.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-b53-bpdu-mirror-v2-1-c39ab745730f%40telaak.dev

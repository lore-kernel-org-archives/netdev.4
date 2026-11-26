Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697336;
	b=rrBOXQIYHSWy0RZIeSJjk+tlQymdo9/5kiCzHHhnxxmhAxSNwWRW4X6B5cltxmd8FQ6k
	 EBjfVVQc7niD1her4tlj3f5QBda4SuAWr/mx65y55FjxoLQ34yHmp6NHZr8C8Egmkkqxo
	 dCvNCYp/UnM9vJf74NQTUe0DTlhujYypWDz5G/IaKYmY5o2SsZzXOtuVd+UuAtJnTfx/g
	 gm0pVcEydz+j6YOgCjvRFG25FgmfD4ffk5OWIkK6Zt8nBHr/Qdm+kJwJGeqCJAifBSiqq
	 0o0XHlWqZSSS7ljEs5Eb7dVMzrC/5VU7kUHe5uqQZmZTxVAmFSXOaau5dmpm9GC6Khw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697336;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
	b=L4bgsD5YKYN09jVC2i4KkljQ4Q+Kk10AzrcViywoDo41D6vMoYvTiVaPcCJeDCMHoy9K
	 EAzdAqhRhGECE1R4V0a9xlSEUxCg+H2jK7tJyl8nSlj7UpLph2Omjpk/hTeqDoYPId+nH
	 T4bmMsPrB0HQZTj3G5Y0V1HHYU28mzP3lt4/y7OJIXrf3vzNkL8+mY0C1c+C8wzpyEZiW
	 Pg5eOhzZlnqo2ZjsbSt2MJvcoVAxDC9Yhyj+AK+HeVSYxbIBhj7bcmOVGyczTZl+f4KKS
	 zNikB4XGHDdgrG911Ti0tKCyZeS71S1etNlYPXgqTPu7vjAdMHhOGDjKoqn25eGCrnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E5A606A33A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E5A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4e246acc2so49813077b3.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697335; x=1796302135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
        b=iYurn0CxfC5opQiw5bMXuyzLMC3xzlzRiKFsUW0tlvWCllgr9jMmJ+Miv/0ajFQmLs
         qBZDgCgFLWf4lTEF7c10tAH5QYtR7cyzz2YpRnH8cACsCregLVb/qgFQExiCDmjgHI8r
         QbqH+kQmLytc+N2ZTzsa8r+Bi4sDEID4nzuNFblpC2v0ubf6/Rug6paDg/uFfxSBem4J
         D0yujQwGO89jN2AesC9OEwlMiv53ivTJIVuBGqWoJQhCOMc8aRUKwjC5jV060zuH4RW+
         j0tpW+x3uYm1yWL8FlDK0svox72tX93jx3qz8vXSv3AeepxhcPoh5LE+BrNzmSw9pIF1
         XCIw==
X-Forwarded-Encrypted: i=1; AL+hErG8fgsEPI+6zJvY98NRS4GhbQyueRmP0hCxh6pG16V6b8faaMr4zrffM+xADErWFEX0SOJHv20=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OwF9ht8AVDLPjjQqpkf1IP86fVpV/iRNy1znQUTj1cpai75sA
	H+nuyMCig9UvZs8MXAxTabBZmq8HkY6nIhCQqfFa0eL3en40YJiuhCCLo2tei7G9H8I=
X-Gm-Gg: AZFdTZdAtbdI01HQGIwW3/qTjWcfvsfGo1uWM/JXed3OvezdUtRhwJPXeq9tUxVpTv4
	fnMmh+Y6s4MKZaSrTI/KWzY5SRnMXtymfplPl3rFozYEwuGD7JfjOlYPXn7ews6iZc1gbtj/DZB
	CQrPx6TeqXlEz8lLKw8TsWqpnagAlnWu/fXDJ+t9sPqG2n2EUC1WeRulus9Ms9N2I7cpSsecjE9
	NrKtV+I28uUdMmhTK5CiHEFuIAyefj7TcQGe09DNxd6GTEOy2Xt5yuiWCmeVdH8QNIRsWi3dd/g
	+7XvO4mEvgSiuRlGHO2QuXIaszynEhgdJBUbggYQLGTujoQjYzkM6qMw8Ei5w+9v4d1cjIgm8HG
	NDk46YsOTpGdISdbNM5dNpBhvz6Odya/ILYe2+AgvDvj6pJmAFk4lnR4S8CiWHHd6Fud2YP6Dhk
	OuOv0cJ+p2Eo1SYUr5xmP/9H8nAH/7kPGNEcsQrjLT/PMGA4fr44cFQCJks6VehXoro2d8N4j5j
	h4oAdLgsCOeSSF3c9K8I+32jGytkJ+BsKXxRWVidd3q37XWrUIpza/GnROTFLhDJ1+DCe65I7qB
	VHhk/NlkcS93s+xQjtKW0L345bn0vp4ML4A2UXWbwKQyWrFJR2f3IStLjgmdDc2LSpU2xHmLQDQ
	+J4dsbgRRd4/+/TxJEVRQx9nSX/nAdCx/X75EegthhbgQFm3ogoDKCqQvBw==
X-Received: by 2002:a05:690c:4a05:b0:8b4:f721:fd62 with SMTP id 00721157ae682-8b5204e1c88mr81083927b3.48.1795697335000;
        Thu, 26 Nov 2026 04:48:55 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5203325adsm84677937b3.37.2026.11.26.04.48.52
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:48:52 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0d126f631so61006827b3.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFT3w8F7lSjSa4RC8Z2VCjE1LYmiABfeE1awK4C9Nch2LrFovMe6Hgicu1JpqJavEsMwN/G6l4=@vger.kernel.org
X-Received: by 2002:a05:690c:c15:b0:8b3:27b8:2bd2 with SMTP id
 00721157ae682-8b52042f569mr88911427b3.10.1795697331984; Thu, 26 Nov 2026
 04:48:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-4-tanure@linux.com> <179561837659.3135.6655031502321722558@kernel.org>
In-Reply-To: <179561837659.3135.6655031502321722558@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:48:41 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
X-Gm-Features: Aa3M54pUuxKwHlhmSM8ws03XH7rNC1f2K4BBc-Hnx_WBDraHYgmAijaXPXLQFsA
Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:53=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] No driver or binding in the tree accepts the new ethmac node's
>   compatible pair, "amlogic,t7-dwmac" + "snps,dwmac-5.10a".

They are in net-next since 2026-11-20, from v7 of this series:
18029931478b ("dt-bindings: net: add amlogic,t7-dwmac") documents the
compatible pair and the five clocks, and c4c851a3325e ("net: stmmac:
dwmac-meson8b: add support for the Amlogic T7") matches
amlogic,t7-dwmac. The cover letter lists all four commits. This
device tree patch goes through the Amlogic tree.

> - [High] The commit message names two problems and claims this patch
>   handles them: 1.

Same commits: the driver claims the pipeline clock with
devm_clk_get_enabled(), and the stmmac core takes "pclk" in
stmmac_probe_config_dt() and enables it in stmmac_bus_clks_config().
Once the MAC probes, the node holds both clocks; the multiplexer's own
reference to pclk is no longer the only one.

> - [Medium] The T7 MAC is declared as "snps,dwmac-5.10a".

It is a 5.10a core. The A311D2 datasheet (section 14.3) says so, the
version register at 0x110 reads 0x1251 on the VIM4 (User ID 0x12,
Synopsys ID 0x51, printed by stmmac at probe), and the GMAC4/5 DMA
and descriptor layout moves 941/944 Mbit/s with no error. The S4 node
describes another SoC.

pw-bot: cr

>
> --
>
> arm64: dts: amlogic: t7: add the ethernet controller
>
> This patch adds the T7 Synopsys MAC node, its PRG_ETH glue registers, and
> a g12a-compatible MDIO multiplexer to amlogic-t7.dtsi. The multiplexer
> also gets an internal PHY bus. The MAC, the multiplexer and the internal
> PHY bus are all disabled by default.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/b=
oot/dts/amlogic/amlogic-t7.dtsi
> > index 7bd53ec166071..eb7f46c98b0b4 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
> >                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
> >               };
> >
> > +             ethmac: ethernet@fdc00000 {
> > +                     compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> [Severity: High]
> Which driver is expected to bind this node? I can't find anything in the
> tree that accepts either compatible string.
>
> meson8b_dwmac_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-meson8=
b.c
> lists only the meson8b, meson8m2, meson-gxbb, meson-axg and meson-g12a
> compatibles. This node has no G12A or AXG fallback.
>
> dwmac_generic_match[] in dwmac-generic.c stops at snps,dwmac-4.10a. The
> only use of "snps,dwmac-5.10a" is the stmmac_gmac4_compats[]
> feature-detection list in stmmac_platform.c. That list is only consulted
> after some driver has already bound.
>
> The later patch "arm64: dts: amlogic: t7: khadas-vim4: enable the
> ethernet port" sets ethmac and eth_phy to okay. Wouldn't the board then
> end up without ethernet?
>
> meson8b_init_rgmii_delays(), set_phy_mode() and meson8b_init_prg_eth()
> only run from meson8b_dwmac_probe(). So the PRG_ETH registers at
> 0xfe024000 keep the bootloader's interface mode and delays.
>
> The stmmac MDIO bus for mdio0 is never registered either. That makes
> g12a_mdio_mux_probe()->mdio_mux_init() on mdio-parent-bus =3D <&mdio0>
> return -EPROBE_DEFER forever.
>
> The node also looks like it fails dtbs_check against
> amlogic,meson-dwmac.yaml:
>
> - select has no T7 string.
> - The fallback contains list only allows snps,dwmac-3.70a or snps,dwmac.
> - clock-names is fixed to stmmaceth/clkin0/clkin1/timing-adjustment.
>
> The commit message says the multiplexer "probes after the controller has
> programmed them" and that "unless the controller holds that clock, the
> writes are lost". No driver in the tree does that for this node, and this
> series only adds a T7 binding for the MDIO mux.
>
> Is there a dt-bindings patch and a driver match patch that this depends
> on and should mention?
>
> [Severity: Medium]
> Is snps,dwmac-5.10a the right IP version for this MAC? The string is in
> stmmac_gmac4_compats[], so stmmac would drive the core with the GMAC4/5
> register map and descriptor format.
>
> The S4 node in meson-s4.dtsi seems to describe the same block. It has:
>
> - the MAC at 0xfdc00000 and the glue at 0xfe024000
> - macirq on GIC_SPI 74
> - the same rx and tx fifo depths
> - an ETH power domain
> - a g12a-compatible mux at apb+0x28000
>
> But it declares the core as 3.70a:
>
>         compatible =3D "amlogic,meson-axg-dwmac",
>                      "snps,dwmac-3.70a",
>                      "snps,dwmac";
>
> If the T7 core is also 3.70a, then once a driver binds, stmmac would read
> the version register at the wrong offset. It would also use the wrong DMA
> and descriptor layout.
>
> Could the version be checked against the hardware version register (0x20
> on 3.x, 0x110 on 4.x and later) and stated in the commit message?
>
> > +                     reg =3D <0x0 0xfdc00000 0x0 0x10000>,
> > +                           <0x0 0xfe024000 0x0 0x8>;
> > +                     interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "macirq";
> > +                     clocks =3D <&clkc_periphs CLKID_SYS_ETH>,
> > +                              <&scmi_clk CLKID_FCLK_DIV2>,
> > +                              <&mpll CLKID_MPLL2>,
> > +                              <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
> > +                              <&clkc_periphs CLKID_SYS_ETHPHY>;
> > +                     clock-names =3D "stmmaceth", "clkin0", "clkin1", =
"pipeline",
> > +                                   "pclk";
>
> [Severity: High]
> The commit message says the pipeline gate "is switched off as unused",
> and that the controller has to hold the clock it shares with the glue
> registers. Does listing these two clocks here keep either of them
> enabled?
>
> Nothing under drivers/net requests a "pipeline" clock:
>
> - stmmac_probe_config_dt() only gets stmmaceth, pclk and ptp_ref.
> - meson8b_dwmac_probe() only gets "timing-adjustment", plus clkin0 and
>   clkin1 as mux parents.
>
> The only "pipeline" consumer in the tree is meson-gx-mmc.c, and it claims
> the clock explicitly with devm_clk_get_enabled().
>
> Also, t7_sys_ampipe_eth is declared without CLK_IGNORE_UNUSED:
>
> drivers/clk/meson/t7-peripherals.c:
> static T7_SYS_PCLK(sys_ampipe_eth,      SYS_CLK_EN0_REG0, 20,   0);
>
> Even after a T7 entry is added to dwmac-meson8b, wouldn't
> clk_disable_unused still gate CLKID_SYS_AMPIPE_ETH? That would cut the
> MAC's DMA path to memory.
>
> For CLKID_SYS_ETHPHY, the mux is the only holder until a MAC driver binds
> this node:
>
> drivers/net/mdio/mdio-mux-meson-g12a.c:g12a_mdio_mux_probe() {
>     ...
>         pclk =3D devm_clk_get_enabled(dev, "pclk");
>     ...
> }
>
> That reference is dropped whenever the mux probe defers or fails. This
> looks like the same ordering hazard the commit message says it closes.
>
> The five-entry clock-names list also doesn't match
> amlogic,meson-dwmac.yaml. That schema allows at most four entries, with
> index 3 being timing-adjustment.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209460;
	b=wCHDRUEWEiB3uI4CG5P9OP78WLqYUH8gmzwn4lmyhFHWLV319qWhRXVwNxPKWH/c1OpE
	 gY1QzdGnJI6br3F+l+sUR2iPN5afQnTQ8u1CwdLdhe0kjc4nFKreELLupFQAtHnjBRd/f
	 7EAjDefIoO24RCMVkrqRbb/RcP8T+9jl1xrC0TQwdWeCIjal4+b9q1UXg9t/DoY+YK+wL
	 wRxUOOr/OkWopUrNrtb4p1JjDMWdEMwSfeU9S8F78wjrqOWuTNFcPtM1O6c/hE328Up2D
	 I0pZ3Mk50z5YHhUCrPAiGFmR09c/R+/WH3tVMl/R3xK4gWJ5IY3bkqa0jMkFofHBK9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209460;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qi0w9VhkXQZVVPDCLtmjIgVXJN9NQ3z5wsW3lIvY60U=;
	b=UrSj1PkaSElIASn0CadKcXnDG2sQiV5TSNZ65H5rEpJmtQPrtprzKXOowhFd3vw7Akhd
	 pxpBkmpDdcAUreoxqDw+lEMeX4HdOKejmg/MFeu8pkqhQtmsi5HsvMlTKWPcxzWK2DksZ
	 ZPtlhq9ukT5kjGXFxjZFhh5zBV9ZQbTBrVWgx9PA8a3v+3S9VMnYGUzU0C8s9yOhZTGhd
	 6YneZI8kXAdAEhZd+XMWOS7lfbSheZmO7mvJyFTcF+poYv3YYP3rj/oxs2313TjkhHMyt
	 zGwLzy1fYKufEMuEAE7U4g4QWUcPbVLpwEWKnpvuQXXbLtKCGTSkc8xd2+wMoC9CFXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtZ3zevh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D85606A692;
	Fri, 20 Nov 2026 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtZ3zevh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1BB1F000D8;
	Fri, 20 Nov 2026 21:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209460;
	bh=qi0w9VhkXQZVVPDCLtmjIgVXJN9NQ3z5wsW3lIvY60U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dtZ3zevhvMtOgFHZpTa1ovPdFsHRLac9E57n5kg4KZi483tSR7RRuRLqDw+/gXf7C
	 zwA6Yhn/6+xTByOUSOwY7VbcjGIO/NSsOGta7P9GqH2r60Jty7/qkNuoe4WNe3Q/9J
	 4Hih7GcJDu2wKdAqzBvZYhXGwXl/Q1JDp8/u1QFKSDE1bCcH8TlAHyayqpNm9KM5gf
	 kKe/0rsdxQIgcnHjvbyaiHfi9K1r5MmAcmA0OgVhgUNA+hzgZi8Q7QXoMzMRkkEtBU
	 LkWXjpGTPusYsW5zn/oQydBOjlXLikT6oC4/f9zhgav2m++zXnwCGN6kZRioCzBA1W
	 1REa/tq1Ygh9Q==
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
From: netdev-bot+sashiko@kernel.org
To: zxyan0222@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
Date: Fri, 20 Nov 2026 21:17:39 +0000
Message-ID: <179520945915.3135.14304625182301747705@kernel.org>
In-Reply-To: <20261118025528.2703790-1-zxyan0222@gmail.com>
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On every in-tree XGMAC platform, the XGMAC half of the fix never
  runs.
- [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
  non-NULL.
- [Medium] The patch turns on an FSM timeout check that resets the
  interface, with a hardcoded NTMRMD = 0x6 (about 1 s) for every…
- [Low] The commit is written as a bug fix: the protection is
  'ineffective' and a stuck FSM 'was not reported through the safety…
- [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1US
  .. 64SEC) to include/linux/stmmac.h, the platform-data header shared…
- [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
  1us tic' register value in two places that use different conventions.

--

net: stmmac: program the FSM timeout timer

This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores after
TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMRMD
is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
safety_feat_config callback, and NTMRMD encoding macros are added to
include/linux/stmmac.h.

> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
> not reported through the safety interrupt despite TMOUTEN being set.
>
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[Severity: Low]
This describes a user-visible functional failure, but there is no Fixes:
tag. Should this carry Fixes: tags for the commits that added TMOUTEN to
dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config() without
programming the timer, so stable has a reference for backporting?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index f1bb981cab7cd..5cf5139f442ad 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c

[ ... ]

> @@ -245,6 +247,19 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  		value |= TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Use a 1s timeout.
> +	 */
> +	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
> +		value = readl(ioaddr + MAC_FSM_ACT_TIMER);
> +		value &= ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER_TMR);
> +		value |= FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD,
> +				    STMMAC_NTMRMD_1SEC) |

[Severity: Medium]
Is a fixed 1s timeout long enough at every link speed? A link partner can
send PAUSE frames with a quanta of 0xffff. At 10Mb/s that holds off the
transmitter for:

    65535 * 512 / 10e6 ~= 3.36s

That is longer than the ~1.048s selected here. At 100Mb/s it is around
335ms.

If the TX FSM timeout is measured against NTMRMD during a flow-control
stall, could a legitimate PAUSE stall at 10Mb/s raise a timeout error?

FSM timeout errors arrive through MCSIS, and
dwmac5_safety_feat_irq_status() always treats them as uncorrectable:

    err = (mtl & MCSIS) || (dma & MCSIS);
    corr = false;

That would go through stmmac_safety_feat_interrupt()->stmmac_global_err()
and reset the interface. Before this patch the timer was disabled, so this
path could not trigger. dwxgmac3_safety_feat_config() uses the same fixed
value.

Only NTMRMD and TMR are written here. The other fields of
MAC_FSM_ACT_Timer stay at their read-back values. Can the databook confirm
whether pause-stalled TX FSMs are covered by NTMRMD rather than by a
separate large-mode timeout?

> +			 FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);

[Severity: Low]
The comment says TMR is csr_clk in MHz. However, dwmac4_core_init()
programs the existing 1us tic counter from the same clock with a minus
one:

    writel((clk_rate / 1000000) - 1,
           ioaddr + GMAC4_MAC_ONEUS_TIC_COUNTER);

Does TMR use the same minus-one encoding? If it does, each tic would be
one CSR clock too long. If it doesn't, could the comment say why it
differs from GMAC4_MAC_ONEUS_TIC_COUNTER? The same question applies to
the XGMAC_MAC_FSM_ACT_TIMER_TMR write in dwxgmac3_safety_feat_config().

> +		writel(value, ioaddr + MAC_FSM_ACT_TIMER);
> +	}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 7ad08651675e8..3caab23527a19 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

[ ... ]

> @@ -873,6 +875,20 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Use a 1s timeout.
> +	 */
> +	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {

[Severity: High]
XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
platform set plat->safety_feat_cfg?

The generic snps,dwxgmac path in stmmac_probe_config_dt(),
dwmac-socfpga.c and dwmac-tegra.c all appear to leave it NULL. Only
dwmac-intel.c, dwmac-mediatek.c and stmmac_pci.c allocate it, and all
three are GMAC4 cores.

In that case stmmac_safety_feat_configuration() passes NULL and this
check short-circuits. NTMRMD stays at 0 with TMOUTEN set, which is the
dwxgmac state the commit message says it fixes.

dwmac5_safety_feat_config() handles a NULL cfg by substituting
all_safety_feats:

    if (!safety_feat_cfg)
        safety_feat_cfg = &all_safety_feats;

Should the XGMAC check match how TMOUTEN is enabled? For example,
(!safety_cfg || safety_cfg->tmouten) && csr_clk_mhz, or just csr_clk_mhz,
since TMOUTEN is set unconditionally.

> +		value = readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> +		value &= ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
> +			   XGMAC_MAC_FSM_ACT_TIMER_TMR);
> +		value |= FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD,
> +				    STMMAC_NTMRMD_1SEC) |
> +			 FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> +		writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> +	}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4da7289626387..5e5c54b58bee0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3691,10 +3691,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
>  
>  static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>  {
> +	unsigned int csr_clk_mhz = 0;
> +
>  	if (priv->dma_cap.asp) {
>  		netdev_info(priv->dev, "Enabling Safety Features\n");
> +		if (priv->plat->stmmac_clk)
> +			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
> +				      1000000;

[Severity: Medium]
When priv->plat->stmmac_clk is NULL, csr_clk_mhz stays 0.
dwmac5_safety_feat_config() then still sets TMOUTEN but silently skips
the MAC_FSM_ACT_Timer write. Doesn't that leave the timer disabled on the
in-tree platforms that explicitly request tmouten?

stmmac_pci_probe() sets plat->safety_feat_cfg->tmouten = 1 for the snps
gmac5 device but never sets plat->stmmac_clk. snps_gmac5_default_data
only sets clk_csr = STMMAC_CSR_250_300M.

mediatek_dwmac_common_data() also sets tmouten = 1, but
stmmac_probe_config_dt() only looks up the "stmmaceth" clock:

    plat->stmmac_clk = devm_clk_get(&pdev->dev,
                                    STMMAC_RESOURCE_NAME);
    if (IS_ERR(plat->stmmac_clk)) {
        dev_warn(&pdev->dev, "Cannot get CSR clock\n");
        plat->stmmac_clk = NULL;

The mt2712e/mt8188/mt8195 DTs don't provide a clock with that name.

On both platforms TMOUTEN ends up set with NTMRMD == 0, and nothing is
logged. Could this fall back to plat->clk_csr, or at least report that
the timer could not be programmed?

>  		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
> -					  priv->plat->safety_feat_cfg);
> +					  priv->plat->safety_feat_cfg,
> +					  csr_clk_mhz);

[ ... ]

> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d220..659f5db528d3a 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
>  	u32 tmouten;
>  };
>  
> +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> +#define STMMAC_NTMRMD_1US		0x1
> +#define STMMAC_NTMRMD_1MS		0x2
> +#define STMMAC_NTMRMD_16MS		0x3
> +#define STMMAC_NTMRMD_64MS		0x4
> +#define STMMAC_NTMRMD_256MS		0x5
> +#define STMMAC_NTMRMD_1SEC		0x6
> +#define STMMAC_NTMRMD_4SEC		0x7
> +#define STMMAC_NTMRMD_16SEC		0x8
> +#define STMMAC_NTMRMD_32SEC		0x9
> +#define STMMAC_NTMRMD_64SEC		0xa

[Severity: Low]
This isn't a bug, but only STMMAC_NTMRMD_1SEC is used, and only from
dwmac5.c and dwxgmac2_core.c. Since v4 dropped the ntmrmd field,
platforms can't select any of the other values.

Would it be better to define just the one value next to the
MAC_FSM_ACT_TIMER field definitions in dwmac5.h and dwxgmac2.h, rather
than adding the full table to the shared platform header?

> +
>  /* Addresses that may be customized by a platform */
>  struct dwmac4_addrs {
>  	u32 dma_chan;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118025528.2703790-1-zxyan0222%40gmail.com

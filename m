Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611927;
	b=OU4WqiKRZT6yI1mD9z9d+kwxSh4iDza7NzMUmpmJKkFT1kUYfc/+zGv00NFDCQ4Q80p4
	 n7J9ih8zqwhHyFzG5vvjRG4XBgUWKQOQuQUClX5gNYb+twHrG3mZzN6/qZ59veVeS7Sy3
	 AC3XwCMzff//r59j7hQWN2k3r8RBrzhY7C/k9sslSOay6THb2cgNN4Yhqc/0IZc0/khR1
	 x29n79ggN+AEpYKz99al6hLP9YuJFzzwT7ct0I6bRitHDr/BQaWfU91tpiPLQLGUPgWj6
	 DP600l1LCdYrjlstYxegBb2mvXCAZZVolzg5fS2n/UBo2naa5sioTABrCpjIuatSGyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611927;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rh7XvE7JeObnSSKRdyHTvlts1tr9f8hO8zi9pra9mvQ=;
	b=2I67btr8mFD+lY78WfWeRrFM+RQZAPZwB/h2IJLnG/bONE+ytLr6tlT37mw1PH+5mzLT
	 Jsf+MXUEu/U4h+jfqB4NeHNe1lwl8MkOzYglk8CFUMv0BxZhNF5p6s0k8WjNnPOYXM29l
	 kXVK672XuD/WWyUi4mKCxOH22nA83WLVYaX/n0jp1t6C0nd76duqKmDLJUdIGyYQD0QGG
	 UvXfly9FHW3dAfjoyFClT4uiu3M+wcQVkABq6AiRlHLKHH8EOsNg5V2B76B3mXvjNOAO2
	 0aZeJyx7py8MCfeRHYZZW5HiJ8m9hb3Uj6fkoRgKwvBuZVqzeU8JplfGEsNkeUi93Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=INWCZ1eA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A4606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=INWCZ1eA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0BD1F000CA;
	Wed, 25 Nov 2026 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611927;
	bh=rh7XvE7JeObnSSKRdyHTvlts1tr9f8hO8zi9pra9mvQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=INWCZ1eA1uJbdxa/2BvyWJZDQy4RTETpLdA/dwsOl+Zupn6G3b75FqFyGbiLTHJsH
	 MjfSDNblAGqfOdQibRKvBoHcxKgERqz4xGBaq1+247gaG1Lfpi4vpdltWFvCipxix3
	 Qpi6UFujd1aKAaa56IXnZRE/MctJEydtveQhZ39rmK556+pnqY/BuPOmFwRxFX2amz
	 cJk9d7vJ4tsckvmG7VcAk69otRnGvZkh1NC96b7A+F5OYYstO8CaoFQ329iA4+TunE
	 e5MqaoSRv5FxwxXYoYJmUQ7FKiFizWMWiLfAyiroO1W+cV6IX6DVcp+VN17bPyOuTw
	 yvOo4+tlpVT8g==
Subject: Re: [PATCH net-next RESEND v4 1/4] net: phy: microchip_t1s: fix
 collision detection on PLCA status change
From: netdev-bot+sashiko@kernel.org
To: parthiban.veerasooran@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Date: Wed, 25 Nov 2026 13:05:25 +0000
Message-ID: <179561192599.3135.16135249584970983112@kernel.org>
In-Reply-To: <20261124124930.485323-2-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-2-parthiban.veerasooran@microchip.com>
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

- [Medium] lan86xx_update_cden() in drivers/net/phy/microchip_t1s.c
  decides CDEN from the software copy priv->plca_enabled, not from the…
- [Low] lan86xx_config_intr() changes only the PLCA_STS_CHANGED (PSTC)
  bit of IMSK1, via phy_clear_bits_mmd()/phy_set_bits_mmd() in…

--

net: phy: microchip_t1s: fix collision detection on PLCA status change

This patch adds PSTC interrupt handling and a resync in read_status() so
that CDEN in COL_DET_CTRL0 follows the actual PLCA or CSMA/CD operating
mode. The PRSCTL1 fallback bit is taken into account. The patch also stops
treating plca_cfg->enabled as a boolean, so that -1 ("don't change") no
longer touches CDEN.

> diff --git a/drivers/net/phy/microchip_t1s.c b/drivers/net/phy/microchip_t1s.c
> index 73c23d311d72a..5ce0304bf0952 100644
> --- a/drivers/net/phy/microchip_t1s.c
> +++ b/drivers/net/phy/microchip_t1s.c

[ ... ]

> +static int lan86xx_update_cden(struct phy_device *phydev)
> +{
> +	struct lan86xx_priv *priv = phydev->priv;
> +	struct phy_plca_status plca_st;
> +	int fallback, ret;
> +	u16 cden;
> +
> +	fallback = lan86xx_fallback_to_csmacd(phydev);
> +	if (fallback < 0)
> +		return fallback;
> +
> +	ret = genphy_c45_plca_get_status(phydev, &plca_st);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* PLCA disabled                          -> CDEN enabled
> +	 * PLCA enabled + BEACON                  -> CDEN disabled
> +	 * PLCA enabled + no BEACON + fallback    -> CDEN enabled
> +	 * PLCA enabled + no BEACON + no fallback -> CDEN disabled
> +	 */
> +	if (!priv->plca_enabled)
> +		cden = COL_DET_ENABLE;
> +	else if (plca_st.pst)
> +		cden = COL_DET_DISABLE;
> +	else if (fallback)
> +		cden = COL_DET_ENABLE;
> +	else
> +		cden = COL_DET_DISABLE;

[Severity: Medium]
Can priv->plca_enabled get out of sync with the hardware PLCA enable bit
(MDIO_OATC14_PLCA_CTRL0.EN) here? lan86xx_read_status() now calls this on
every phylib poll. A stale cached value would therefore keep re-applying
the wrong CDEN setting for as long as the mismatch lasts.

The cached value seems able to diverge in a few ways.

First, lan86xx_plca_set_cfg() only stores priv->plca_enabled after
genphy_c45_plca_set_cfg() returns 0. With enabled == 0, that helper clears
PLCA_EN first and then does more MDIO accesses that can fail:

drivers/net/phy/phy-c45.c:genphy_c45_plca_set_cfg() {
    ...
	// first of all, disable PLCA if required
	if (plca_cfg->enabled == 0) {
		ret = phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2,
					 MDIO_OATC14_PLCA_CTRL0,
					 MDIO_OATC14_PLCA_EN);
    ...
	if (plca_cfg->to_tmr >= 0) {
		ret = phy_write_mmd(phydev, MDIO_MMD_VEND2,
				    MDIO_OATC14_PLCA_TOTMR,
				    plca_cfg->to_tmr);

		if (ret < 0)
			return ret;
	}
    ...
}

If one of the later writes fails, PLCA is off in hardware but
priv->plca_enabled is still 1.

Second, phy_detach() asserts the PHY reset line through
phy_device_reset(phydev, 1), and phy_attach()->phy_init_hw() releases it
on the next attach. That clears PLCA_CTRL0.EN. However, priv belongs to the
driver binding, so plca_enabled stays 1. Nothing in config_init reads the
hardware value back.

Third, the opposite case: an unbind and rebind without a reset GPIO leaves
PLCA enabled in hardware. lan86xx_probe() then allocates a zeroed priv
with plca_enabled == 0.

In the first two cases, assume the PRSCTL1 fallback bit is clear. This
function then sees plca_enabled == 1 and pst == 0, and writes
COL_DET_DISABLE while the PHY is actually running plain CSMA/CD. Isn't that
the "CDEN stayed disabled, leaving CSMA/CD running unprotected" situation
the commit message describes?

In the rebind case, every poll forces COL_DET_ENABLE while the PHY runs
PLCA with BEACONs. Meanwhile genphy_c45_plca_get_cfg() reports PLCA as
enabled to userspace.

The Rev.D0 follow-on patch also passes priv->plca_enabled into its
link-selection logic. Would reading PLCA_CTRL0.EN directly inside
lan86xx_update_cden() remove the need for the cached copy?

> +
> +	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, LAN86XX_REG_COL_DET_CTRL0,
> +			      COL_DET_CTRL0_ENABLE_BIT_MASK, cden);
> +}

[ ... ]

> +/* Mask (mask bit = 1) or unmask (mask bit = 0) the given STS1 bits in
> + * IMSK1.
> + */
> +static int lan86xx_set_intr_mask(struct phy_device *phydev, u16 mask,
> +				 bool enable)
> +{
> +	if (enable)
> +		/* A mask bit of 0 enables the corresponding interrupt. */
> +		return phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2,
> +					  LAN86XX_REG_IMSK1, mask);
> +
> +	return phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, LAN86XX_REG_IMSK1,
> +				mask);
> +}

[ ... ]

> +static irqreturn_t lan86xx_handle_interrupt(struct phy_device *phydev)
> +{
> +	struct lan86xx_priv *priv = phydev->priv;
> +	irqreturn_t ret_irq = IRQ_NONE;
> +	int sts1, ret;
> +
> +	/* Reading the status register clears the latched event bits. */
> +	sts1 = lan86xx_read_clear_sts1(phydev);
> +	if (sts1 < 0) {
> +		phy_error(phydev);
> +		return IRQ_NONE;
> +	}
> +
> +	if (sts1 & LAN86XX_STS1_PLCA_STS_CHANGED) {

[ ... ]

> +		ret_irq = IRQ_HANDLED;
> +	}
> +
> +	return ret_irq;
> +}

[Severity: Low]
lan86xx_config_intr() only changes the PSTC bit in IMSK1 through
lan86xx_set_intr_mask(). The other IMSK1 bits keep whatever state the
reset default or a bootloader left them in. What happens if another STS1
source is unmasked?

lan86xx_handle_interrupt() reads STS1, which acks every latched bit. It
returns IRQ_NONE unless PSTC is set, so each such event would be reported
as an unhandled PHY interrupt.

phylib doesn't poll read_status() in interrupt mode. If the spurious IRQ
detector ends up disabling the line, PSTC-based CDEN tracking would stop
entirely.

On the disable path, those other sources would also stay armed while
phylib considers interrupts off.

I couldn't confirm the IMSK1 reset default. If it masks every source, this
has no visible effect. Would it be more robust to program the whole IMSK1
register, with everything masked except PSTC when enabling and everything
masked when disabling?

The Rev.D0 config_intr added later in the series uses the same
read-modify-write helper.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124124930.485323-1-parthiban.veerasooran%40microchip.com

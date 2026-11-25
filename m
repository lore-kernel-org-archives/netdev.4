Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611931;
	b=yvgzQ31218prYA+2k6P1ooXKC6Kpz0uDTY8rM3eSdUxcHKpMXLTgsql7/p/gOuAnHn04
	 m3VEtiE8Nvek/ZfXyzHnEHD+XglJCvQc8Nv/vr9106VpXxugrpJ7ThG5M6D2oB/fhSJhZ
	 K44UhUhj1xmGUESgxlQADieyWBW4UzZCAf9D/REGpPE/Fc3syVzVMXXQdg06TNmcWuCUh
	 aSnn/GFi2IWSgD68vvxcp1S/XaK2c0x1/kqY4ExAdyhsbXbPWY2/C2ulpaptAYYzUz0wl
	 Rih1ShB8GVJDm1XwuTreusnExe1/sYVe336s2MbyRDZTsy7u8oaWopUbJcXR2aSWZiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611931;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QVkBSAZj7JsG5hhPL2v3TXvGukeDFHSNdJyYLiFOCE4=;
	b=Rn6CfYIBYskyWRKvl5Gtb5yqiQXm/10vQU5LFQ9uYFeXi0qxdqWhkm6P+t3G4wZKF48q
	 sr1CgOYsdeMTY0jgRwtIEGI6Wx7qYjo0I/UXQWYlorQK3WAvW3mN8t42929uyYuxWSO6e
	 Lo2qlRo6rUeLDAO47hFdk7M+k8pZASMIFASLrvTEuUSLA81M0RNxBjNFifL9WfHZTiwyz
	 PUZOJ7DngqkmC/owSoNopD5MqyPCiIM6B/yOeA5pRusuNuyP9u1dQO8OAsXDEyeGSvfRK
	 jQ/YiwTpJrIT1MJHgrHEJf8bwqCP+th0rfOJiIbcNAHXa69FA2UlqcHfAfhVT9l5SwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWAOrWwk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E0606A338
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWAOrWwk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520EE1F000C6;
	Wed, 25 Nov 2026 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611930;
	bh=QVkBSAZj7JsG5hhPL2v3TXvGukeDFHSNdJyYLiFOCE4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eWAOrWwkMl1R98vtWzXRSFX2VIaaZFDu/74e7d9anING32RfStabz+J9xWmb+TxYX
	 59NIjVpKNlKAbOnytG6tIcWGs0Fw5puIriEnub++opNjyUl3saQ3TwLrc6BZ6H7XIw
	 AoHdgUciG8B3yMp6OuRe5HaL9Uwt97tDeKQ75yLMRDP/q3SLcMZ4nf/03/Mt8aLevQ
	 3FewqkVZxbEIpn9J8OSG8Qgv+SJ3syGiVp3Qmcfb7A55XKDqM8jBymFNuTGqW32Kwd
	 SIMcXGG52fKFVcLVdf8pn72Hwf5Mzvfjug2WElDn8HiAhBnUrDryfWx2ACp1hhGJ41
	 0TEZ53iuc698A==
Subject: Re: [PATCH net-next RESEND v4 4/4] net: phy: microchip_t1s: fix
 collision detection for LAN867X Rev.D0
From: netdev-bot+sashiko@kernel.org
To: parthiban.veerasooran@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, UNGLinuxDriver@microchip.com
Date: Wed, 25 Nov 2026 13:05:29 +0000
Message-ID: <179561192987.3135.7922944334571014404@kernel.org>
In-Reply-To: <20261124124930.485323-5-parthiban.veerasooran@microchip.com>
References: <20261124124930.485323-5-parthiban.veerasooran@microchip.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The Rev.D0 design now relies on CDEN (COL_DET_CTRL0 bit 15)
  being 1, but no code ever sets it.
- [Medium] The new Rev.D0 resync paths program
  LAN867X_REG_LINK_STATUS_CTRL from the software cache…
- [Low] The new Rev.D0 PSTC (PLCA Status Change) handling does nothing
  useful.

--

net: phy: microchip_t1s: fix collision detection for LAN867X Rev.D0

On LAN867X Rev.D0, this commit sets the CCMFC field in COL_DET_CTRL0 so
the hardware gates collision forwarding based on PLCA status. It also
drops software CDEN toggling for Rev.D0. Finally, it adds Rev.D0 specific
config_intr/handle_interrupt callbacks that resync the link status
selection on PLCA status changes, taking the PRSCTL1 CSMA/CD fallback
into account, and sets PHY_POLL_CABLE_TEST.

> diff --git a/drivers/net/phy/microchip_t1s.c b/drivers/net/phy/microchip_t1s.c
> index 5ce0304bf0952..d667f57aa4a8f 100644
> --- a/drivers/net/phy/microchip_t1s.c
> +++ b/drivers/net/phy/microchip_t1s.c

[ ... ]

> @@ -582,6 +620,20 @@ static int lan867x_revd0_config_init(struct phy_device *phydev)
>  			return ret;
>  	}
>  
> +	/* AN1699: Configure CCMFC (Collision Counting and MAC Forwarding
> +	 * Control) to OA default (0x1) so that the hardware autonomously gates
> +	 * collision forwarding to the MAC based on the live PLCA_Status:
> +	 * collisions are neither counted nor forwarded when PLCA_Status is OK,
> +	 * and are counted/forwarded when not OK. This eliminates the need for
> +	 * software-driven CDEN toggling. CDEN defaults to enabled on Rev.D0
> +	 * and remains enabled.
> +	 */
> +	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, LAN86XX_REG_COL_DET_CTRL0,
> +			     COL_DET_CTRL0_CCMFC_MASK,
> +			     COL_DET_CTRL0_CCMFC_OA_DEFAULT);

[Severity: Medium]
Is CDEN (COL_DET_CTRL0 bit 15) guaranteed to be set at this point? The
mask covers only bits 10:9, so bit 15 keeps whatever value the register
already held.

The new comments say "CDEN defaults to enabled on Rev.D0 and remains
enabled" and "CDEN remains permanently enabled in config_init()".
However, no Rev.D0 path writes bit 15.

Older kernels do clear it on Rev.D0. There, lan86xx_plca_set_cfg() did
this:

	if (plca_cfg->enabled)
		return phy_modify_mmd(phydev, MDIO_MMD_VEND2,
				      LAN86XX_REG_COL_DET_CTRL0,
				      COL_DET_CTRL0_ENABLE_BIT_MASK,
				      COL_DET_DISABLE);

In that check, -1 counts as non-zero.

Rev.D0 has no .soft_reset, and lan867x_check_reset_complete() only reads
STS2. Without a reset GPIO or a power cycle, a CDEN=0 left by an earlier
kernel (for example across kexec) or by a bootloader carries over into
this driver.

After this patch, nothing on Rev.D0 corrects it.
lan86xx_plca_set_cfg() now returns early:

	if (phydev->phy_id == PHY_ID_LAN867X_REVD0)
		return 0;

The new interrupt handler does not touch COL_DET_CTRL0 either.

CCMFC only gates counting and forwarding of collisions the detector
reports. With CDEN=0, would the MAC see any collisions in CSMA/CD
operation (PLCA disabled, or fallback without BEACON)?

Would adding COL_DET_CTRL0_ENABLE_BIT_MASK / COL_DET_ENABLE to this
phy_modify_mmd() call make the comment true?

[ ... ]

> @@ -712,6 +764,76 @@ static irqreturn_t lan86xx_handle_interrupt(struct phy_device *phydev)
>  	return ret_irq;
>  }
>  
> +static int lan867x_revd0_config_intr(struct phy_device *phydev)
> +{
> +	u16 mask = LAN86XX_STS1_PLCA_STS_CHANGED |
> +		   LAN86XX_STS1_LINK_STS_CHANGED;
> +	struct lan86xx_priv *priv = phydev->priv;
> +	int sts1, ret;
> +
> +	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
> +		/* Read to clear any pending status before enabling. */
> +		sts1 = lan86xx_read_clear_sts1(phydev);
> +		if (sts1 < 0)
> +			return sts1;
> +
> +		/* STS1 may have cleared a pending PSTC while masked, and a
> +		 * missed PSTC leaves no trace to key off, so unconditionally
> +		 * resync the link-status-selection source from the current
> +		 * PLCA enable state and fallback configuration.
> +		 */
> +		ret = lan867x_revd0_update_link_selection(phydev,
> +							  priv->plca_enabled);

[Severity: Medium]
Can this resync run with a stale priv->plca_enabled? The value is a
software cache that only lan86xx_plca_set_cfg() writes. priv is allocated
once in lan86xx_probe(), so the cache survives PHY resets.

One way this happens: phy_detach_internal() asserts the reset GPIO with
phy_device_reset(phydev, 1), and phy_init_hw() deasserts it on re-attach.
The same happens on resume if the PHY lost power. The PLCA registers are
then back at their defaults (PLCA disabled), but priv->plca_enabled is
still 1.

The sequence is then:

phy_init_hw()
  lan867x_revd0_config_init()
    lan867x_revd0_link_active_selection(phydev, false)  /* semaphore */
lan867x_revd0_config_intr()   /* PHY_INTERRUPT_ENABLED */
  lan867x_revd0_update_link_selection(phydev, priv->plca_enabled == 1)
    lan867x_revd0_link_active_selection(phydev, true)   /* PLCA_STATUS */

If PRSCTL1 bit 10 is clear after reset, LINK_STATUS_CTRL now selects
PLCA_STATUS while PLCA is disabled in hardware. PLCA_Status never becomes
OK. Would the link then stay down until ethtool --set-plca-cfg is run
again? Each later PSTC in lan867x_revd0_handle_interrupt() re-applies the
same stale value.

There is a second path through the error handling in
lan86xx_plca_set_cfg(). With enabled = 0, the code first calls
lan867x_revd0_update_link_selection(phydev, 0), which writes the
semaphore selection. genphy_c45_plca_set_cfg() then clears PLCA_EN and
fails on a later CTRL1/TOTMR/BURST write:

	ret = genphy_c45_plca_set_cfg(phydev, plca_cfg);
	if (ret)
		return ret;

	if (plca_cfg->enabled != -1)
		priv->plca_enabled = plca_cfg->enabled;

priv->plca_enabled stays 1. Disabling PLCA changes the PLCA status, which
raises PSTC, and the new handler writes the PLCA_STATUS selection back.

Before this patch, Rev.D0 had no config_intr/handle_interrupt, so the
semaphore selection from config_init stayed in place.

Would reading the enable state from PLCA_CTRL0 EN (for example via
genphy_c45_plca_get_cfg()) avoid this?

[ ... ]

> +	if (sts1 & LAN86XX_STS1_PLCA_STS_CHANGED) {
> +		/* Re-evaluate the link-status selection when PLCA status
> +		 * changes. A resulting link-status change raises
> +		 * LINK_STS_CHANGED, which triggers the PHY state machine.
> +		 */
> +		ret = lan867x_revd0_update_link_selection(phydev,
> +							  priv->plca_enabled);

[Severity: Low]
Can this PSTC branch ever change the register?
lan867x_revd0_update_link_selection() depends on only two inputs:
PRSCTL1 bit 10, read via lan86xx_fallback_to_csmacd(), and the cached
priv->plca_enabled. A PLCA status transition changes neither of them.

The driver never writes PRSCTL1, and none of the lan867x_revd0_fixup_regs
entries is 0x0035. priv->plca_enabled only changes in
lan86xx_plca_set_cfg(), which already reprograms LINK_STATUS_CTRL.

So each PSTC rewrites the value LAN867X_REG_LINK_STATUS_CTRL already
holds. That costs an interrupt, a PRSCTL1 read and a LINK_STATUS_CTRL
write on every BEACON transition. It also gives the stale cache above a
second place to re-apply a wrong value.

The comment says "A resulting link-status change raises
LINK_STS_CHANGED", and the commit message says:

    The PSTC interrupt handler for Rev.D0
    therefore only needs to update the link status selection on each PLCA
    transition.

Writing the same selection value cannot cause a link-status change. When
PLCA_STATUS is selected, the hardware drives the link bit and raises
LINK_STS_CHANGED by itself.

Should the selection be based on the live PLCA status instead? Or should
the PSTC handling be dropped and the explanation updated?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124124930.485323-1-parthiban.veerasooran%40microchip.com

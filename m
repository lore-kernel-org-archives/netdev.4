Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570114;
	b=rHoScWc9qNEkcyJwEDsbQBFRtZoAdU+SeLDDrab/Fsaqz+IqCuN+hmNoAstBq5amMbkD
	 q0HCMEKy5Y+J3xpWg2FvUWZafkGvFx2i8zn+nMPEC4T5FeMCRTFstSqGJwHHZVs3Zm/YF
	 pCjfG1l57sgmW5yw9CdGqVLQTlOGSv+F3mL8pVZEBfHZW6dTB/vCxQfeuVpUrg0BU4Egi
	 WmWsTocJbAI2eNTjl3AaoBSW9pGDO2tK+F6UYTj23pRTNfYgygmG/CwyDGirrCUfX4HAe
	 Gyp+nQNKSwGujFEeI5LZvmZ4ldsZp0A2+kWxlGKfEsKPuqlFWSRFN0HfJUxUB7chLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570114;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Q9fSuG1S52McgfXadZdI6jjI9SfrkV5oRwTtR0qzuvc=;
	b=ValhDzWD7AiiSgI9cebyFbZ/nLzXFKLvqxjfTr314X/D5MEyqzkReTm0LmKZpEvUjenK
	 Qkztlr0yyBYSzuSiOHHw+yJ4brOfMfJlYpsA5Gy2g2dqSmjY46PK34ba60t/R/n5ykFxS
	 s+/0tmJRsaWoX7FI8nj9N14k4jqg6j+z/ERpkKTJygDbuSmTbgvH+KsFmPd7wlaOV7M1e
	 IBD/2vBTNEuwxc1rvCqtHTtm8D14riLmfNqQkUSA6rnYA9w9TQfosSn9SwJLMC4g/c+Cu
	 rPkxXLC2jTn4JihFppSEI8HChMxbP4XEdan6YMIPulWS6RiSkR/VFXZOiHaWFxC5OzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Alk9x4sB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CA606A33A;
	Wed, 25 Nov 2026 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Alk9x4sB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52D01F000C0;
	Wed, 25 Nov 2026 01:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570114;
	bh=Q9fSuG1S52McgfXadZdI6jjI9SfrkV5oRwTtR0qzuvc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Alk9x4sBYWQjB00VPdu2BCq2geuBIepJoHW66rnycz/dzDH6rpCuc/ZYPysOF2Yy9
	 /VSd0eG+LNsq9VwUIKEgTBSKlmRvCdGm6bbDFziD/CWjnyHUitSCY5q9WPzdxWVhzI
	 KLtzSEJCzVTaO9YOwUzkjGY9a4fK5CQh6A/9/j8NnGJiNpynPmr9UjR2/LKzKIL22X
	 SfNHtp1lsguEcHUEqjJCoauRJqKyVNT3R3j6TLqxvFD7IRcwTsmdSoJQL5wMCh8d3M
	 8Jf1lL7MevU6w/ArXbLFUhlCO6YzdB2AoEuQmySxlvCSGezojZYFiItFN3r+xzHXp7
	 Sm+mXmrPY/0Ow==
Subject: Re: [PATCH net v4 08/10] net: phy: smsc: wait for LAN83C183
 power-down recovery
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Wed, 25 Nov 2026 01:28:32 +0000
Message-ID: <179557011237.3135.15846967917791186180@kernel.org>
In-Reply-To: <20261121004809.1690280-9-f.fainelli@gmail.com>
References: <20261121004809.1690280-9-f.fainelli@gmail.com>
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

- [Medium] The new 500 ms recovery delay in lan83c183_resume()
  (drivers/net/phy/smsc.c) only runs if the smsc PHY driver is already…
- [Low] This patch rewrites the SMSC_PHY Kconfig help line to 'Currently
  supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs'…

--

net: phy: smsc: wait for LAN83C183 power-down recovery

This adds a LAN83C183 entry to the smsc PHY driver. Its resume callback
sleeps 500 ms after clearing BMCR_PDOWN, so the PHY has time to recover
before the Au1000 MAC is started on MTX-1. The ID match also covers the
LSI L80227, which has the same OUI and model number.

Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44
Link: https://datasheet.octopart.com/L80223-LSI-datasheet-11757091.pdf#page=73

> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 30e9d22c8d1a3..10466b2574eb4 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -421,7 +421,7 @@ config SMSC_PHY
>  	tristate "SMSC PHYs"
>  	select CRC16
>  	help
> -	  Currently supports the LAN83C185, LAN8187 and LAN8700 PHYs
> +	  Currently supports the LAN83C183, LAN83C185, LAN8187 and LAN8700 PHYs

[Severity: Low]
This isn't a bug, but should the help text also mention the LSI L80227?

The new 0x0016f840/0xfffffff0 entry in smsc_phy_driver[] and smsc_tbl[]
also binds L80227 PHYs. The code comment says "shared with L80227". Those
PHYs now also get the 500 ms delay when they leave power-down. The
rewritten help line does not say this.

Separately, the help text also leaves out the LAN911x internal,
LAN8710/8720, LAN8740 and LAN8741/8742 PHYs that are already in
smsc_tbl[]. That gap is pre-existing and was not introduced by this patch.

> diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
> index 48487149c2252..c0713017e54b0 100644
> --- a/drivers/net/phy/smsc.c
> +++ b/drivers/net/phy/smsc.c

[ ... ]

> @@ -684,8 +685,33 @@ int smsc_phy_probe(struct phy_device *phydev)
>  }
>  EXPORT_SYMBOL_GPL(smsc_phy_probe);
>  
> +static int lan83c183_resume(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = phy_modify_changed(phydev, MII_BMCR, BMCR_PDOWN, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The PHY needs up to 500 ms to restore operation after power-down. */
> +	if (ret)
> +		msleep(500);
> +
> +	return 0;
> +}
> +
>  static struct phy_driver smsc_phy_driver[] = {
>  {
> +	/* LSI/SEEQ OUI 00:a0:7d, model 4; shared with L80227. */
> +	.phy_id		= 0x0016f840,
> +	.phy_id_mask	= 0xfffffff0,
> +	.name		= "SMSC LAN83C183",
> +
> +	.get_features	= genphy_read_abilities,
> +	.suspend	= genphy_suspend,
> +	.resume		= lan83c183_resume,
> +	.set_loopback	= genphy_loopback,
> +}, {

[Severity: Medium]
Will lan83c183_resume() actually run with the in-tree MTX-1 config?

The commit message says SMSC_PHY must be built in when the au1000 MAC is
built in. Nothing in Kconfig or the defconfig enforces that.
arch/mips/configs/mtx1_defconfig has:

CONFIG_MIPS_MTX1=y
CONFIG_SMSC_PHY=m

It does not set CONFIG_MIPS_AU1X00_ENET at all.

With CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=m, the PHY is attached
during the MAC probe:

au1000_probe()
  mdiobus_register()
  au1000_mii_probe()
    phy_connect()
      phy_attach_direct()

No driver is bound yet at that point, so phy_attach_direct() falls back
to genphy:

	if (!d->driver) {
		if (phydev->is_c45)
			d->driver = &genphy_c45_driver.mdiodrv.driver;
		else
			d->driver = &genphy_driver.mdiodrv.driver;

>From then on, genphy_resume() runs on reopen with no delay. Loading
smsc.ko later does not rebind the PHY. So the reopen hang can still
happen even with both patches in the series applied.

Neither this patch nor the companion au1000 patch touches arch/mips/ or
drivers/net/ethernet/amd/Kconfig.

Could "imply SMSC_PHY" be added under MIPS_AU1X00_ENET or MIPS_MTX1, as
drivers/net/dsa/Kconfig already does? Another option is to update
mtx1_defconfig to CONFIG_MIPS_AU1X00_ENET=y and CONFIG_SMSC_PHY=y.

When both drivers are modules, request_module() in phy_device_create()
normally loads smsc.ko before attach, so that case looks fine.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121004809.1690280-1-f.fainelli%40gmail.com

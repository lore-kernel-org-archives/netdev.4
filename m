Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170761;
	b=URo1cprSFXBIB9LVB8yNuR/x8ohKtBRxSrKdLn2hFK2pz74aIQZZCnJGMY782BBViSlG
	 mfaKZc71ZGc5kwGvZcEPdztUc3ZwFff98kmJGLOkqFnbNzALs3oMKifdJfNKaQj9G3MKe
	 F5J9qFN4oRWSxwUOpxaEZdKF124tBznh4IBQAKLH6i8w+4F+Dar/nFukoG816dQ1GDUl5
	 2AFO3zSzwZXhLxVvKYcrYQ7CGBypMxp0+U9Zf6hwAcS+mjdhTx8kRpNhanexAXJLFxad6
	 M0bo4CA+Gsttay38Ca4goWr//T1JUz6wZ8dzLArXvHP8q6EYR0KjSM/e6iZPZA2cBuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170761;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Siel73uZFgqS9kqrc/IaxbqIC2cQn3cec8aBaxYnehA=;
	b=ck8iqWD0gpW4kGRI/RAjrfKxkXg/+HgtKBVBpgP9DGNrO/eTK4oF3MUx8LKR5JhGq/NP
	 2NZDWx6zVrLnMeGiGkM0mA0ty7dX0k1EXybKpLXPBojw3XrHWyvQX5vrt+N2gBVTnSUAK
	 iRpD/FH8PREHWaH1P//ck/n4hld43kgZbpzQVwXg2GU+R1/QcQQ5mDylveRp8vMkLGlJM
	 qLOyl2EWZgmmZRnrfnnICccC2NQ/Fnz15hXekCFsw6G5BjgPf8axNJYeVlzEDeatTgkwZ
	 2c5y6/EAEzXmrluS+bvaAO+lRYGwMAWxgN+XvGA1d2si8ognikdXS+4w6sY8Q8nnBHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jfsiwl7M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776F60A2619;
	Fri, 20 Nov 2026 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jfsiwl7M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6002F1F000EC;
	Fri, 20 Nov 2026 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170761;
	bh=Siel73uZFgqS9kqrc/IaxbqIC2cQn3cec8aBaxYnehA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jfsiwl7M0UtYKf8PByPDyg6qLi/674QNg9ZlqMfye30B8atRFdQMwDqfJFbli02Iq
	 tQRMIfV3zXR3BaveVt51GKhnzrfvwxIn0LNgQlZNpQKTMupVDAKAjyuHpECzWu9wZt
	 0GnVfAhezCarjKsqqlStLRWMCOkXcQSCnJuR1MbqVlA30hyc36cKs6wsbqaSBgnklu
	 Gfp7VP2d/NRT1XfYyRWJ361yzHYDyRMUuD5y0ccNbcvqxMZW/m518HJLDBlCKAWh0I
	 Fga27q+CGFoPYG5qZ/21lFtKNn7mt3s6FvBc6z7n+upW1ZmiialgtyrpMfTAv1Pkw6
	 iEomiVoNE7abA==
Subject: Re: [PATCH net v3 08/10] net: phy: smsc: wait for LAN83C183
 power-down recovery
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Fri, 20 Nov 2026 10:32:39 +0000
Message-ID: <179517075993.3136.6152160672961651320@kernel.org>
In-Reply-To: <20261117193223.2795612-9-f.fainelli@gmail.com>
References: <20261117193223.2795612-9-f.fainelli@gmail.com>
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

- [Medium] The 500 ms recovery delay in lan83c183_resume() only runs if
  drivers/net/phy/smsc.c is the driver bound to the PHY when au1000_eth…
- [Low] The new smsc_phy_driver[] entry and smsc_tbl alias match phy_id
  0x0016f840 with mask 0xfffffff0.

--

net: phy: smsc: wait for LAN83C183 power-down recovery

This adds a LAN83C183 entry to the smsc PHY driver. Its resume callback
sleeps 500 ms after clearing BMCR_PDOWN, which is the power-down recovery
time given in the datasheet. Together with a companion au1000 patch, it is
meant to fix an interface reopen hang on the MTX-1 board.

Link: https://pdf.dzsc.com/LAN/LAN83C183.pdf#page=44

> diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
> index 48487149c2252..c3b51afd4b1e5 100644
> --- a/drivers/net/phy/smsc.c
> +++ b/drivers/net/phy/smsc.c

[ ... ]

> @@ -684,8 +685,32 @@ int smsc_phy_probe(struct phy_device *phydev)
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

[Severity: Medium]
Does this delay actually run on the MTX-1 board that the series targets?

lan83c183_resume() only runs if smsc.c is the driver bound to the PHY when
au1000_eth attaches it. The attach happens at MAC probe time. That is
still true after the companion patch, which only adds phy_resume() in
au1000_open():

au1000_probe()
  au1000_mii_probe()
    phy_connect()
      phy_attach_direct()

If no specific driver is bound yet, phy_attach_direct() falls back to
genphy:

	if (!d->driver) {
		if (phydev->is_c45)
			d->driver = &genphy_c45_driver.mdiodrv.driver;
		else
			d->driver = &genphy_driver.mdiodrv.driver;

arch/mips/configs/mtx1_defconfig sets CONFIG_SMSC_PHY=m and does not
enable CONFIG_MIPS_AU1X00_ENET at all. Other Alchemy defconfigs, such as
gpr_defconfig, set the MAC to =y alongside SMSC_PHY=m.

Take a built-in MAC with no initramfs. At probe time, the request_module()
in phy_request_driver_module() can't load smsc.ko. genphy then stays
bound until detach, and loading smsc.ko later does not rebind the PHY.

In that case resume goes through genphy_resume() with no wait, and the
reopen hang would still be there.

Should the commit message or the series say that SMSC_PHY has to be built
in (or included in the initramfs)? Or should mtx1_defconfig be updated to
match?

> +
> +	return 0;
> +}
> +
>  static struct phy_driver smsc_phy_driver[] = {
>  {
> +	.phy_id		= 0x0016f840,
> +	.phy_id_mask	= 0xfffffff0,
> +	.name		= "SMSC LAN83C183",

[Severity: Low]
Is 0x0016f840 specific enough to SMSC parts?

This ID does not carry SMSC's OUI, unlike the neighbouring entries.
phy_id >> 10 gives 0x5be, which corresponds to SEEQ Technology's OUI
00:a0:7d. The existing SMSC entries give 0x1f0 (00:80:0f). The model
number is 4.

The ID is correct for the LAN83C183. drivers/net/ethernet/smsc/smc91x.h
defines:

#define PHY_LAN83C183	0x0016f840

That looks like a licensed SEEQ/LSI core inside the LAN91C111.

Any other SEEQ/LSI PHY that reports the same OUI and model 4 would now
autoload smsc.ko through the new smsc_tbl entry. It would bind as
"SMSC LAN83C183" instead of genphy. It would also get the 500 ms
msleep() in lan83c183_resume() every time BMCR_PDOWN is cleared. The
LSI 80227 may be one such part, though this tree does not confirm it.

Also, this isn't a bug, but the new entry has no OUI/Model# comment,
while the other entries do.

> +
> +	.get_features	= genphy_read_abilities,
> +	.suspend	= genphy_suspend,
> +	.resume		= lan83c183_resume,
> +	.set_loopback	= genphy_loopback,
> +}, {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193223.2795612-1-f.fainelli%40gmail.com

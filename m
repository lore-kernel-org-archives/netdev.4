Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069751;
	b=W7lxoV1P0agP09PlE3Tn5xVZL6PI0z+GtLPVZ2aiofe5+cZ3s32hYrCcRaoyqzEVc2fG
	 /AB3Pz5AWEla7r9Oxwt7shfAxl5tIsE3iBcTsh5KRU23I2MwCJ0FB/f9xUiOol0QkUOjb
	 Wtrn11hI7PpO9bAwJSE7gO5QLnyZ0YOdIFSKynW/04KKs2/3zOnLO0ytjcDY2Z2PJNft8
	 LevEXzc+h5KW/sAMsC1XncCLtuMieTEy57br+NbpS8P4PiMuFx11zVLMNyV6RSFLJnBTI
	 smz3MyaAlJ8kgMBHtxsumTMDGVMhGMlthsXPKly38gjEdaZv4LvJRaTfQcir0z/2U6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069751;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=28FG7k0iJOM4+sdnVNU0mwLOWdhzJIET0mwF65CvUco=;
	b=sTm+FgyZkI9HCNC3gmosjubEWpag5YEjURvUmCvq9Wi9rCFYN3nFhROzi0i5DyiQuK7t
	 9l3lJXv5bhIH9Q6nN8sy7/YJWj1FtQYn7ATsVaGWQ+IEnp+VxvAcPUbBNSEes8iro10ea
	 klUmSJiiGxbAropGQ85NYeB0TKCmPCYJuOWXFGIYD1QvaJXWeX+3TavjnXRkkOo9BftE9
	 JjJSifCo2WDPKrT1b970G7NOCgA1dxlTb86VgYcpF9YDu3yx+69YDA+1fF8akBePDxGTB
	 pcQo8/Lw3pAqWD7ksqm4tdlKafgrdkhOXW8lJsaQJPBAr6BodeXE5a3NkyGNA8kMY3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0SsY299;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B5606A320;
	Thu, 19 Nov 2026 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O0SsY299
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AF91F000C4;
	Thu, 19 Nov 2026 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795069751;
	bh=28FG7k0iJOM4+sdnVNU0mwLOWdhzJIET0mwF65CvUco=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O0SsY2990U0GpZzhS1iFrIG63HGPG1Z84wv/YCY62ta14CNhPQQlHKcKY57wZ/2Vn
	 ZAnnMNOo1n5u9pu90owDdua8h+uLguImRd2MMCDtO2hQlQEgmy3nrIO4GK1C1+SrPH
	 CEHOjX5sV9DH/OLc0h5xe2/NFs7ThS1e0cav13CM2m0JkKC4+N+0oU9SlkU14Vhhpm
	 4XH8BIj+2UWHgL3ns9a1k8ZP4omh8+NUNTNUv0WBJUCxYcpDIsZBM/erxonHQJ/tBr
	 ceGaJcvw8+g7GZAJb6EXB0XELvWqHCquBQSODQtVPU6+najOhQo3BsIlLSBlArDgno
	 5bp3waQ0yM1IA==
Subject: Re: [PATCH net-next v2 3/4] net: phy: marvell: factor out EEE errata
 initialization
From: netdev-bot+sashiko@kernel.org
To: paul.louvel@bootlin.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 miquel.raynal@bootlin.com, herve.codina@bootlin.com
Date: Thu, 19 Nov 2026 06:29:09 +0000
Message-ID: <179506974989.3136.8384234607101047972@kernel.org>
In-Reply-To: <20261116-marvell-phy-rgmii-v2-3-e04dca67e89a@bootlin.com>
References: <20261116-marvell-phy-rgmii-v2-3-e04dca67e89a@bootlin.com>
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

- [Low] In m88e1510_eee_errata() (drivers/net/phy/marvell.c), the patch
  changes the sequence of register writes the PHY receives even when…

--

net: phy: marvell: factor out EEE errata initialization

This patch moves the 88E151x EEE errata register sequence out of
m88e1510_config_init() and into a new helper, m88e1510_eee_errata(). The
page 0xFF writes now go through phy_select_page(), __phy_write() and
phy_restore_page(). The final page 0xFB write now uses phy_write_paged().

> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index d2c5d3c5ce7d1..a72d307eaf12c 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c

[ ... ]

> @@ -1363,31 +1363,40 @@ static int m88e1510_config_init(struct phy_device *phydev)
>  		{ 0xb233, 0x214d },
>  		{ 0xcc0c, 0x2159 },
>  	};
> -	int err;
> -	int i;
> +	int i, oldpage, ret = 0;
>  
>  	/* As per Marvell Release Notes - Alaska 88E1510/88E1518/88E1512/
>  	 * 88E1514 Rev A0, Errata Section 5.1:
>  	 * If EEE is intended to be used, the following register writes
>  	 * must be done once after every hardware reset.
>  	 */
> -	err = marvell_set_page(phydev, 0x00FF);
> -	if (err < 0)
> -		return err;
> +	oldpage = phy_select_page(phydev, 0x00FF);
> +	if (oldpage < 0)
> +		goto restore;
>  
>  	for (i = 0; i < ARRAY_SIZE(errata_vals); ++i) {

[ ... ]

>  	}
>  
> -	err = marvell_set_page(phydev, 0x00FB);
> -	if (err < 0)
> -		return err;
> -	err = phy_write(phydev, 07, 0xC00D);
> +restore:
> +	ret = phy_restore_page(phydev, oldpage, ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	return phy_write_paged(phydev, 0x00FB, 07, 0xC00D);

[Severity: Low]
Is it intended that the PHY now gets a different sequence of MDIO accesses
when nothing fails, and not only on the error path?

Before this patch, m88e1510_config_init() did:

    write page 0xFF
    write reg17/reg16 x4
    write page 0xFB
    write reg 7 = 0xC00D

After this patch, m88e1510_eee_errata() does:

    phy_select_page()    read page, write page 0xFF
    __phy_write()        write reg17/reg16 x4
    phy_restore_page()   write original page
    phy_write_paged()    read page, write page 0xFB,
                         write reg 7 = 0xC00D,
                         write original page

The PHY now switches back to the original page (normally the copper page
after reset) between the page 0xFF part and the page 0xFB part of the
vendor errata sequence. The number of MDIO transactions also goes from 11
to about 15.

These are undocumented vendor registers, so it isn't clear whether the
extra page switch matters to the hardware.

The commit message only says:

  "This reduces the number of bus lock/unlock cycles and restores the
  previous page if one of the errata writes fails."

Could the commit message also mention the changed write sequence on the
success path? Could it also say whether this was tested on 88E1510/1518/
1512/1514 Rev A0 parts?

The last patch of the series, "net: phy: marvell: add RGMII-to-Copper mode
configuration", leaves this code as it is.

> +}
> +
> +static int m88e1510_config_init(struct phy_device *phydev)
> +{
> +	int err;
> +
> +	err = m88e1510_eee_errata(phydev);
>  	if (err < 0)
>  		return err;
>  	err = marvell_set_page(phydev, MII_MARVELL_COPPER_PAGE);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-marvell-phy-rgmii-v2-0-e04dca67e89a%40bootlin.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069752;
	b=krKpLTLIpHifcrMAkcPZXdzhIjHXbMdx5bAuhb1Tpm6LfiYErcVDV1O2gl9Xwd1KxpaE
	 wi3hQRTfKMVGrJRZ2rFqOmznt0FEAxhFTOVkNZveVCxYeErMjjqkRcQNh3msmaIC/uglp
	 mzweflIPdWp+YIsm2VqtqujbB7jjO8YE7SQ3J6akZGPQPZPy+h8uTCubB7i/BVfundBHI
	 sS/gkxz7NOQwlfEY/uItkoufCIxbX6BbrHMsT2yojJgdqGKaUidCEjYWJ0oc/X0sBowwY
	 DRiK6IEiixZ0CfFf3A/+uCFMBRP+rBg8MTwS0Mr4VPcLDFW7MQ7kLONt1eZ0ae9PY6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069752;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QY8YBCkbFj43eQYRUaz/dBwtAvVVLsptLL1osA32VT8=;
	b=Sc0xnmkpsIdYsizCF7eUie67dT6/KMihWsKvN0LAmnFLdBg23qs1IG1RXKziYibD4Z8i
	 t9JjYjRvD5QZiENCMFUSWY1cZLVx42+eWAm68z/7dKZH6DYz2pYLV0AXpFrftdA/YZ518
	 IdtAdBD3LM/sL/RTH6zpK0c9GZMhUlpeDpGzjir8eFndBmt0DZY+/uImn1h9W1eqIj909
	 dPNJgdIadXUzgXI/w8RIkuYwqjSZM/SBs7oTsww5+7nzOCXy7bgh3QDcm4S4oNWAv/zVB
	 aybFYgWE41MZYxsidyFCeZyqWWKzc0JMLsl8Ft9BoBdt0J5AFAOgyAmian58ny7Rz3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYzaN46D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1C606A336;
	Thu, 19 Nov 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYzaN46D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DA91F000C5;
	Thu, 19 Nov 2026 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795069752;
	bh=QY8YBCkbFj43eQYRUaz/dBwtAvVVLsptLL1osA32VT8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WYzaN46D3R7cTLzvNyQ4e0jgFuGo8uMnPfP8Y+5NEyCTvmQHT1iHWAr9hoyHvjTov
	 CSYCjepY/B6hdEFnmu/LRgQmzgXvmuDoZ72edenQLROS4nU7ZIHCO3oCYnJsyqGAES
	 quVScmF8/Dm4Wh9439scoshS4NFdB11SCSYskjfVYc4J0XuMLIBo3CF+BMP6/i74KT
	 wOV80Ko8b4rHLZnK8UcSRnRy/uJ9uQ5o5h6g4IaqJ12dGxZnG9kt6DHdDt4HN4KHoU
	 5DJ89bz+K0nmq7SrTA3s6dmnGu1Wb8TjYtWVHvnexYGz/L7ny1BF9IR+SdbHT23q1C
	 UuUvVkaf8PWPw==
Subject: Re: [PATCH net-next v2 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
From: netdev-bot+sashiko@kernel.org
To: paul.louvel@bootlin.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 miquel.raynal@bootlin.com, herve.codina@bootlin.com
Date: Thu, 19 Nov 2026 06:29:11 +0000
Message-ID: <179506975119.3136.5908839389379097437@kernel.org>
In-Reply-To: <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
References: <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch breaks the SFP-removal (serdes disable) path.
- [Medium] The new RGMII config_init path does not achieve its stated
  purpose ('Add code in m88e1510_config_init() to configure the device')…

--

net: phy: marvell: add RGMII-to-Copper mode configuration

With this commit, m88e1510_config_init() programs the RGMII-to-Copper mode
in GEN_CTRL_REG_1 when the PHY interface is RGMII. It also adds a check to
m88e1510_config_mode() so that an RGMII request does not overwrite an RGMII
media mode already present in the register.

> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index a72d307eaf12c..9748fdd843ffd 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c
> @@ -1341,6 +1341,23 @@ static int m88e1510_config_mode(struct phy_device *phydev, u16 mode)
>  	if (oldpage < 0)
>  		goto error;
>  
> +	ret = __phy_read(phydev, MII_88E1510_GEN_CTRL_REG_1);
> +	if (ret < 0)
> +		goto error;
> +
> +	if (mode == MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII) {
> +		switch (FIELD_GET(MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, ret)) {
> +		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII:
> +		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X:
> +		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX:
> +		case MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII:
> +			ret = 0;
> +			goto error;
> +		default:
> +			break;
> +		}
> +	}

[Severity: High]
This check sits in the shared helper. Does it also change the SFP removal
path in m88e1510_port_configure_serdes()?

When an SFP module is inserted, phy_sfp_module_insert() calls
configure_mii(port, true, iface). That writes RGMII_1000X, RGMII_100FX or
RGMII_SGMII into the mode field. On removal the call chain is:

phy_sfp_module_remove()
  m88e1510_port_configure_serdes(port, false, PHY_INTERFACE_MODE_NA)
    mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
    m88e1510_config_mode(phydev, mode)

The register still holds one of the serdes modes at that point. The new
switch matches it, sets ret = 0 and jumps to error. That skips both the
__phy_modify() of the mode field and the MII_88E1510_GEN_CTRL_REG_1_RESET
soft reset.

Does that leave the PHY in RGMII-to-fiber/SGMII mode after the module is
removed, even though the caller sees success?

On resume or re-attach, m88e1510_config_init() also requests MODE_RGMII for
RGMII interfaces, so it would hit the same early return. Is a hardware
reset the only way to get back to copper mode?

Before this patch, the disable path always wrote MODE_RGMII and then did
the soft reset.

Could this be decided explicitly, through a caller argument or driver
state, instead of from the current register value?

>  	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
>  			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK, mode);
>  	if (ret < 0)
> @@ -1403,9 +1420,11 @@ static int m88e1510_config_init(struct phy_device *phydev)
>  	if (err < 0)
>  		return err;
>  
> -	/* SGMII-to-Copper mode initialization */
> +	/* RGMII/SGMII-to-Copper mode initialization */
>  	if (phydev->interface == PHY_INTERFACE_MODE_SGMII)
>  		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_SGMII);
> +	else if (phy_interface_is_rgmii(phydev))
> +		err = m88e1510_config_mode(phydev, MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);

[Severity: Medium]
The commit message says:

    Do not overwrite the media interface mode configured via
    m88e1510_port_configure_serdes().

However, the check in m88e1510_config_mode() only looks at the hardware
mode field. It keeps any RGMII_1000X, RGMII_100FX or RGMII_SGMII value,
whoever wrote it.

Suppose an RGMII board comes up with GEN_CTRL_REG_1[2:0] already set to one
of those values. The source could be the bootloader, strapping, or state
left over across kexec or a driver rebind. Would this call then skip both
the mode write and the soft reset, and leave the PHY out of copper mode?

As written, the new RGMII call seems to take effect only when the field
reads 0x1 or 0x5-0x7. Is that intended?

The driver does not record whether the serdes mode came from
m88e1510_port_configure_serdes(). Could that be tracked in driver state so
the code does what the commit message describes? The same change would
also fix the SFP removal issue above.

>  	if (err < 0)
>  		return err;
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-marvell-phy-rgmii-v2-0-e04dca67e89a%40bootlin.com

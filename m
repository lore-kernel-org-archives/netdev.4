Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476438;
	b=dMV3njYV2wYf9QflnjCz+PxkIalKyT+dneMXSBbEtBY3wCv1ou6zV8mI5b0hESRWTLm7
	 x4o3L4VAW+wEPwWz3vguip4kZ0qBgYr+H6LoGkhrnAlfvi5cnDr++CdT190lj9zCczdCP
	 aTSUmaiiJPM8lZ8CyqGdriLskYSKiAlQNs7rc1g+PxFwTgORCOZQckCtoXR6CO3qyBBod
	 QvmbIGRj3lANE6nQgjz/4e49jIKMpkv4vUqyZXE47emwg0D+R/TzSQSpfGQ/JvS0HGFoT
	 x2zERuozmRcTmfdWyDN4Wf1uZQf7F3vzcUG7yqywWbLnBjvdNJuWl9b4g3CEyHeZG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476438;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=UOCsuUblKp6MHryyZUEo50kZApMDVw34hVNlsTMvdFE=;
	b=GtlrvhqZl8W2p2u9pj1TbksVy8lm7vibzfuUUq3R/zDGX0uDFP9Vw1XexZMzALYtFjId
	 GP72fSyZCQ7Rgbv8o4OQk+rn54cjzDBkLSejmtuZ+2FMNDhzeTSjHUWnuAA7wezIoZCLv
	 JUAbAgNQSTmiUqf0Ns2mWceEqc4hRogv1WDXt4KsVS+UF+8MhHUfZnJ0jGYuuUcTp+F8A
	 vr/1xkdVh9eZwRfWqPRjLMM+5Blfq1R0wKX3a4vVi8GPRCUADpigDFgZLEZfDHPtG7zuL
	 LCjkylNSKvcQhSUbhkcCyONaRad1Y41tXf2bXmsnpSQLyH49OQ9yHyvPg6+g/jdlgTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDWicosc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E6606A331;
	Mon, 23 Nov 2026 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDWicosc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A670D1F000C4;
	Mon, 23 Nov 2026 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795476437;
	bh=UOCsuUblKp6MHryyZUEo50kZApMDVw34hVNlsTMvdFE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UDWicoscz+gwBCeeIbs6ZafS0cpggEBbyyvTfSdljeZO6T/Ki0UVBlV7Mv2mRtNcb
	 NRvoKu7JYtVH53OGzub6cwH7n9tDwTbsUHMpDiQxByHO159Kxt2H5Da+edGXW7AzeG
	 z6MEoHNqKsSpE1UF8/Eu87vKtueFo4GMmb7KWC/RaxcyqOShE+7mm0jFT+l5Ve7jAd
	 BdHzfjT8FizFbVlER3x32eYPnxjIiI7JZymI+aj1pdRpiqPvPf+JSydrv/UwrbS20b
	 QCsOoVNDeiwrGAf8KrOC5QLZVk+FvBQjndCZzI0yUnFpZskigLGUHlNA+NtMIgPetC
	 7qhK8/+NkH2hQ==
Subject: Re: [PATCH net-next] net: mdio: handle broken-turn-around for non-PHY
 MDIO devices
From: netdev-bot+sashiko@kernel.org
To: bage@debian.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 olteanv@gmail.com
Date: Mon, 23 Nov 2026 23:27:16 +0000
Message-ID: <179547643618.3135.12985709493556442247@kernel.org>
In-Reply-To: <20261119231319.1256419-1-bage@debian.org>
References: <20261119231319.1256419-1-bage@debian.org>
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix marks only BIT(addr), where addr is the device-tree
  `reg` of the non-PHY MDIO device.
- [Low] The kernel-doc for struct mii_bus::phy_ignore_ta_mask
  (include/linux/phy.h:427) reads 'PHY addresses to ignore the TA/read…

Pre-existing issues:
- [Medium] This patch does not introduce the problem, but the PHY path
  that the commit message cites as the place where the property already…

--

net: mdio: handle broken-turn-around for non-PHY MDIO devices

This commit parses the "broken-turn-around" property in
of_mdiobus_register_device(), so that non-PHY MDIO devices such as DSA
switches have their address set in phy_ignore_ta_mask. Before this, only
PHY devices registered through fwnode_mdiobus_phy_device_register()
honoured the property.

> diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
> index b8d298c04d3ff..0695ae83b83be 100644
> --- a/drivers/net/mdio/of_mdio.c
> +++ b/drivers/net/mdio/of_mdio.c
> @@ -56,6 +56,9 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
>  	struct mdio_device *mdiodev;
>  	int rc;
>  
> +	if (fwnode_property_read_bool(fwnode, "broken-turn-around"))
> +		mdio->phy_ignore_ta_mask |= BIT(addr);

[Severity: Medium]
Does setting only BIT(addr) cover the addresses these switches actually
use on the bus?

Bus drivers check phy_ignore_ta_mask against the address of each transfer,
not against the registered device. For example, in unimac_mdio_read():

	if (!(bus->phy_ignore_ta_mask & 1 << phy_id) && (cmd & MDIO_READ_FAIL)) {
		ret = -EIO;
		goto out;
	}

The comment above that check names the Broadcom BCM53125 as the broken
device. b53_mdio_probe() accepts a reg of either 0 or 30:

	if (mdiodev->addr != BRCM_PSEUDO_PHY_ADDR && mdiodev->addr != 0) {

But b53_mdio_op() sends all switch register traffic to
BRCM_PSEUDO_PHY_ADDR (30), whatever reg is:

	for (i = 0; i < 5; ++i) {
		v = mdiobus_read_nested(bus, BRCM_PSEUDO_PHY_ADDR,
					REG_MII_ADDR);
		if (!(v & (REG_MII_ADDR_WRITE | REG_MII_ADDR_READ)))
			break;
		usleep_range(10, 100);
	}

	if (WARN_ON(i == 5))
		return -EIO;

There is an in-tree BCM53125 node with reg = <0> in
bcm47094-linksys-panamera.dts. If broken-turn-around were added to a node
like that, only bit 0 would be set.

Wouldn't every read at address 30 still return -EIO from
unimac_mdio_read()? Once that is truncated into the u16 v, the busy bits
look set. b53_mdio_op() would then hit WARN_ON(i == 5), and the switch
could not be programmed.

b53_mdio_phy_read16() also reads the internal PHYs at their own addresses
on the same bus. The mask does not cover those addresses either.

mv88e6xxx in single-chip mode (reg = <0>, sw_addr == 0) looks similar.
There, mv88e6xxx_smi_direct_read() calls:

	ret = mdiobus_read_nested(chip->bus, dev, reg);

for many different dev addresses, so no single reg value would cover the
chip.

How much of this matters depends on which of the chip's addresses really
have the broken turn-around. Should the commit message say that this
change only helps when reg is the only address the device uses? Or should
devices like these get a wider set of addresses?

[Severity: Medium]
This is a pre-existing issue, not one introduced by this patch. The commit
message cites the PHY path as already handling the property, but that path
seems to apply it too late.

In fwnode_mdiobus_register_phy(), a PHY without an explicit
ethernet-phy-idXXXX.XXXX compatible goes through:

	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy = get_phy_device(bus, addr, is_c45);

get_phy_device() reads the PHY ID registers over MDIO. The mask is only
set later, in fwnode_mdiobus_phy_device_register():

	if (fwnode_property_read_bool(child, "broken-turn-around"))
		mdio->phy_ignore_ta_mask |= 1 << addr;

During that ID read, mdiobb_read_common() would return 0xffff and
unimac_mdio_read() would return -EIO. Wouldn't get_phy_device() then fail
with -ENODEV before the property takes effect?

The new non-PHY path sets the bit before mdio_device_create(). So after
this patch, the PHY and non-PHY paths set the bit in a different order.

[Severity: Low]
This isn't a bug, but the kernel-doc for struct mii_bus in
include/linux/phy.h still says:

	/** @phy_ignore_ta_mask: PHY addresses to ignore the TA/read failure */

The comment in mdiobb_read_common() also mentions "this PHY is listed in
phy_ignore_ta_mask". After this patch the mask is set for non-PHY MDIO
devices too.

"PHY address" is the usual name for the Clause 22 PHYAD field, and
phy_mask uses the same wording, so the text is not wrong. Would it still
be worth rewording it to say MDIO device addresses?

>  
>  	mdiodev = mdio_device_create(mdio, addr);
>  	if (IS_ERR(mdiodev))

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119231319.1256419-1-bage%40debian.org

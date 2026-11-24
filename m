Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532968;
	b=ZIFfC6sNavtAl7hKCzDzwrpSJdO8+Tuj/RTVNOmIDQTzmdmVoP+hkBIbLBukxX4dtTuf
	 E9wf+kAJ7AmlvDc8Hs8jARCNi1v4hqaTFvkIyvqtGM17mzPo3G6d2VjSkKZI6+s3tKZfK
	 6CQoY8JVefl6jUq19kigmwj5SDppyuuvRKTWu1lYdaZ9DqVORpyaWqHP1Z69ciEIQzzh+
	 wqSjREk18rzWtgweI+tcx/n8/UEESZTX2Lo7oC03u5uXW2TkeePb1Bvh+eKqyE3RBFQ6K
	 nznkA0q+06+039VykJwWdDApLTyb4WpleoDK7Vipm1cfmK42e/e8TzGlCBB3RflIzUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532968;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RG5q/lZ2bPWbNsBSbeLTxdCMRhvCRzDt7dRCNSAx1AE=;
	b=WOZUKqVUrb/o0tj/0wqMm0Xbw40zxFAbVeoSnzsogCEFd2+vOhfZUjfQv8httdpA7g+e
	 0jjfSw4gUIW94hcI9uxkvsLmIca1k/dIdhxsMszWnTktZcpEfRZGuOmPx+tDZTXaFg5qZ
	 heqxNzNW5uhwN+WLe255jsP6sUm/kuS48oIPFiTOKdg7EfyyRpEZgKPtgYY1IPvgyWWIv
	 FzgcYa90grCoQY3FsWunfVkSfXoHXu+rz79C+4+vjNrk1xi4QX1pYc7Mdyt49ysUsDIgy
	 ORjxjBa/8xqU8QvgmGDTgWbQt1Mq1s4uIKcbDvhopCW3FPFYlRFIIOPVLsE3sj8nUqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC+2MW0O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5E606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC+2MW0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FD41F000ED;
	Tue, 24 Nov 2026 15:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532967;
	bh=RG5q/lZ2bPWbNsBSbeLTxdCMRhvCRzDt7dRCNSAx1AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EC+2MW0OwuMaC/jcQsVzoOF6KOk+FO4LZLIumQpX5aCYblKA2u3GmD8x05Psn4ZQP
	 rX5a+P7Ea2+p7eULwgfLyKz7AkuON3T2PrW6tu4l2V/LSiC1JIJHX7AiPevql2xbLq
	 awAwYHDLzkcUrgqBTAnLNP6tYrM27Nsbsz17c5XH0IVXuo3VZLP7dvk5CnsEw5as+C
	 +FhKEWbaggCngcLxLG/ZJlR3sYiBoiLj1JfUa9XtyvJ3ZGE5pLrF2JOknCa902YS40
	 kNAZgQNNeyHSKCM4VOQOouIAuyCa4Idy1UPmf7AI0gffYeSexDc+JLvyebCw9D9FJy
	 /x5RCwFlqJbZw==
Date: Tue, 24 Nov 2026 16:09:21 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, petr.wozniak@gmail.com, 
	maxime.chevallier@bootlin.com, olek2@wp.pl
Subject: Re: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
Message-ID: <awWkbH3O8IrMYiSF@solitude>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
 <20261121091235.1447291-3-pawlik.dan@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121091235.1447291-3-pawlik.dan@gmail.com>

It would be much better to somehow check for RollBall protocol.

For example by trying one mdio read before probing PHY in
sfp_sm_probe_for_phy():

	case MDIO_I2C_ROLLBALL:
		err = sfp_sm_probe_phy(sfp, SFP_PHY_ADDR_ROLLBALL, true);
		break;

change to:

	case MDIO_I2C_ROLLBALL:
		err = mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLBALL, 1, 0);
		if (err == -ETIMEDOUT) {
			dev_info(sfp->dev, "RollBall bus not present\n");
			return 0;
		}

		err = sfp_sm_probe_phy(sfp, SFP_PHY_ADDR_ROLLBALL, true);
		break;

Marek

On Sat, Nov 21, 2026 at 10:12:35AM +0100, Daniel Pawlik wrote:
> "OEM SFP-10G-T" modules with vendor revision "A" have no RollBall
> I2C-to-MDIO bridge: page 3 of the 0x51 EEPROM passively echoes written
> bytes, so every RollBall command times out. With instrumented mdio-i2c,
> the CMD register reads back exactly the written command byte (0x02)
> forever, with no DONE and no I2C errors. 0x56 reads back all 0xff, so the
> PHY is not reachable at all. A genuine RollBall module with the same
> vendor and part number (revision "02", AQR113C PHY) on the same board
> answers DONE on the first poll and its PHY attaches within ~2 seconds.
> A rev B module with an RTL8261BE PHY, reported on the OpenWrt tracker,
> hits the same RollBall timeouts. The bridge probe added by
> commit 8fe125892f40 ("net: phy: sfp: probe for RollBall I2C-to-MDIO
> bridge in mdio-i2c"), since reverted, found no bridge on it, after
> which the module worked.
> 
> That module reaches this quirk entry only because its part number is
> "SFP-10G-T" at that point: it is a rate-adapting module which reports
> "SFP-10G-T" with a 2.5G or faster peer and "SFP-10G-T-I" with a 1G
> peer, and only the former matches this entry, which is the sole entry
> forcing RollBall on it. The "SFP-10G-T-I" variant matches no quirk and
> keeps the default behaviour either way.
> 
> Because the SFP-10G-T quirk forces RollBall, the kernel retries the PHY
> probe 25 times at ~21 seconds per attempt, i.e. for over nine minutes,
> before giving up and falling back to inband mode. Each attempt runs from
> sfp_timeout() with rtnl_lock held, so for the whole window every rtnl
> user on the system stalls in ~21 second chunks, including the state
> machines of other SFP cages: insertion and removal of a module in another
> cage is only processed after the current attempt ends. In one test, a
> module pulled from the other cage kept being polled by phylib until the
> attempt ended, triggering a WARN from phy_error_precise().
> 
> Give the SFP-10G-T entry its own fixup that skips the PHY probe for
> revisions "A" and "B", while keeping the forced extended compliance code
> so that the module still links up in 10GBASE-R inband mode as before.
> Other revisions keep the RollBall fixup unchanged.
> 
> Tested on a Banana Pi BPI-R4 with rev A and rev 02 modules: the rev A
> module links up at 10G ~16 s after insertion instead of over nine
> minutes, and the rev 02 module is unaffected. No rev B module was
> available for testing; its match is based on the report above.[1]
> 
> [1] https://github.com/openwrt/openwrt/pull/22910
> 
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/
> ---
>  drivers/net/phy/sfp.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 8406ad8ee786..d2c1bbe6686a 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -496,6 +496,30 @@ static size_t sfp_strlen(const char *str, size_t maxlen)
>  	return size;
>  }
>  
> +static void sfp_fixup_oem_10gt(struct sfp *sfp)
> +{
> +	char rev = sfp->id.base.vendor_rev[0];
> +
> +	/* Revisions A and B of this module have no RollBall I2C-to-MDIO
> +	 * bridge (on rev A, page 3 of the 0x51 EEPROM just echoes written
> +	 * bytes), so every RollBall command times out and the PHY probe
> +	 * keeps retrying for over nine minutes, holding rtnl_lock for ~20
> +	 * seconds per attempt. The PHY is not accessible at all, so use the
> +	 * module without one.
> +	 */
> +	if (sfp_strlen(sfp->id.base.vendor_rev, 4) == 1 &&
> +	    (rev == 'A' || rev == 'B')) {
> +		dev_dbg(sfp->dev,
> +			"rev %c has no RollBall MDIO bridge, not probing for a PHY\n",
> +			rev);
> +		sfp->mdio_protocol = MDIO_I2C_NONE;
> +		sfp->id.base.extended_cc = SFF8024_ECC_10GBASE_T_SFI;
> +		return;
> +	}
> +
> +	sfp_fixup_rollball_cc(sfp);
> +}
> +
>  static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
>  				struct sfp_module_caps *caps)
>  {
> @@ -643,7 +667,7 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	// OEM SFP-GE-T is a 1000Base-T module with broken TX_FAULT indicator
>  	SFP_QUIRK_F("OEM", "SFP-GE-T", sfp_fixup_ignore_tx_fault),
>  
> -	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_rollball_cc),
> +	SFP_QUIRK_F("OEM", "SFP-10G-T", sfp_fixup_oem_10gt),
>  	SFP_QUIRK_S("OEM", "SFP-2.5G-T", sfp_quirk_oem_2_5g),
>  	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-D", sfp_quirk_2500basex),
>  	SFP_QUIRK_S("OEM", "SFP-2.5G-BX10-U", sfp_quirk_2500basex),
> -- 
> 2.56.1
> 
> 

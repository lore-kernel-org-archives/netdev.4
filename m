Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795317811;
	b=4SzXOwaR7k0KYVijTNoNxIkuk6ChTSNygDY5n5T++xS3dSud+jG4bMMZGEVzCJAXgZjf
	 yO28iwr76mOYWyi7cM4MCpSUA8/lTRV7jFYU+H1u/asDV4mtyA7VrOQq+DOm6EYVuE5qH
	 pl2XueTLOMlJMjZ0DM3P/ZWN0Vn4fzROHaMIruuSirgjjHvZpZ4rh0UhYBmSzjK1ep9FV
	 2JTOH5+kaHzYgMDqmbbcyz03bc+zX/BRE1IHwrPXeoNi0lz1TXuzh4tcLJsYzI7CdyUAH
	 CdajUcF/ZI+BEv4w4TntFIX2J+2XorCmN8LCdQnk7AE+9BruN9BSMxWAePdo+O9FwwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795317811;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gtec66fsF0TLS6Ds0VK7TI51eLHnkFXUQHJA1Jg7LEE=;
	b=0JwqwhcbxRJh3uqyPpG4d+HdS+iT3o/CmImyrjijSAEeP0xxwcJ6ODdeVTFlp68MzFkw
	 e9p32/VVfHXYaaYEHiRHQTHVxD1w6shQyBYH3PTIoldP3pOv3p+qTZ7rgIyQIpy0Xiup4
	 ZDhbOZscqz+75eXU+AqeZhZ6p+8tNy2E4gW6EQResc8qteffO6p6vD/1hK+VEDVKp8IGz
	 ADGJdskryhO61wX4mgG/q1jmjMvYc8ljfoTnkd/9mg3fOTjN1WzJihmNtgnNkQ+R8K379
	 VU7qHEZ3TUN+FrB0blXiZNK5GnTai0R2/EtZeZnYJx5tJanqgnCSKTuiImhzKhnXdCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ebm/Pf+w";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B0606A320;
	Sun, 22 Nov 2026 03:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ebm/Pf+w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D511F000C0;
	Sun, 22 Nov 2026 03:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795317811;
	bh=gtec66fsF0TLS6Ds0VK7TI51eLHnkFXUQHJA1Jg7LEE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ebm/Pf+w/fQsfhV4M8glYVmM6FL6SmdzwulCSZjbD+Kz+0hIofhX7Y2hzrQUu20cz
	 uerl1iXELJUtJS/uLeQPbplaqq5zBSBCvOqlX30pe+pjAsw5c6w/zBSoMxQypf1mLH
	 Xt1DsbWdjI1SnsUiEJVUzqu6R6m3Wtej4zmMh2maPiXj2k0wNgZXeqILLfsoiEhJGo
	 Mwb5qZdOWUxWM8K1dH1lH09E3PxBzvdamUMtcLq9VjRmkiiZDc75KA3yPPH5cjsuop
	 6T1yVbLpZsA6Sj1hCzRdXJKgETuUz0UXEK+anIEft9K7JFCGe2Eub+ZyyT58lkM6cf
	 zDWP4LNeoMESw==
Subject:
 Re: [PATCH net-next] net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
From: netdev-bot+sashiko@kernel.org
To: github@bumblecito.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Date: Sun, 22 Nov 2026 03:23:30 +0000
Message-ID: <179531781023.3135.12920801285160298531@kernel.org>
In-Reply-To: <20261118025602.171615-1-github@bumblecito.com>
References: <20261118025602.171615-1-github@bumblecito.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new quirk SFP_QUIRK_S("ODI", "DFP-34X-2C3",
  sfp_quirk_2500basex) in the sfp_quirks[] table…
- [Medium] The ODI DFP-34X-2C3 is added with SFP_QUIRK_S (fixup = NULL),
  so its TX_FAULT and LOS signals are used as-is.
- [Low] The commit message and the new comment ('// ODI DFP-34X-2C3 XPON
  stick can operate at 2500base-X') do not say what the module's EEPROM…
- [Low] The new 'ODI' entry in sfp_quirks[]
  (drivers/net/phy/sfp.c:609-610) sits between the 'HSGQ' and 'Lantech'…

--

net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3

This adds an entry to sfp_quirks[] for the ODI DFP-34X-2C3 XPON SFP module.
The entry uses sfp_quirk_2500basex to enable 2500base-X. The commit message
says it was tested on a Horaco ZX-SWTGW2C8F switch with speed and duplex
forced and autonegotiation disabled.

> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 915156743701b..666e515d27623 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -606,6 +606,9 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	SFP_QUIRK("HSGQ", "HSGQ-XPON-Stick", sfp_quirk_2500basex,
>  		  sfp_fixup_ignore_tx_fault_and_los),
>  
> +	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X

[Severity: Low]
What does this module's EEPROM report? Each neighbouring 2500base-X entry
names the EEPROM defect, for example:

	// HSGQ HSGQ-XPON-Stick can operate at 2500base-X, but reports
	// 1000BASE-LX / 1300MBd in its EEPROM

sfp_module_parse_support() in drivers/net/phy/sfp-bus.c can already set
2500base-X from the bitrate fields:

	if (linkmode_empty(modes) && br_nom) {
		...
		if (br_min <= 3200 && br_max >= 2500) {
			phylink_set(modes, 2500baseX_Full);

Could the comment and the commit message give the reported bitrate and
compliance codes? That would show why the generic parsing doesn't already
enable 2500base-X for this module.

> +	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),

[Severity: Medium]
Will the link come up with default settings? The commit message only
describes this test:

  "A 2500 Mb/s link was established with speed and duplex forced and
  autonegotiation disabled."

sfp_quirk_2500basex() adds 2500baseX_Full and PHY_INTERFACE_MODE_2500BASEX.
It does not clear Autoneg, and sfp_module_parse_support() always sets it:

	phylink_set(modes, Autoneg);

In phylink, phylink_get_inband_type() treats 2500base-X as INBAND_BASEX.
As a result, phylink_sfp_config_optical() keeps Autoneg in the advertising
mask, and a PCS that supports in-band AN at 2500base-X will try in-band
negotiation by default.

If the module doesn't answer in-band AN at 2500base-X, would the default
link stay down until someone runs ethtool by hand?

The driver already has sfp_quirk_disable_autoneg(), and
sfp_quirk_oem_2_5g() combines it with a 2.5G mode:

	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
	sfp_quirk_disable_autoneg(id, caps);

Does this module need the same treatment? If not, has the default
AN-enabled configuration been tested?

[Severity: Medium]
SFP_QUIRK_S leaves the fixup NULL, so this module's TX_FAULT and LOS
signals are used as-is. Is that intended for an XPON stick?

The HSGQ XPON stick just above, and the Hisense GPON sticks, all use:

	sfp_fixup_ignore_tx_fault_and_los

Commit 95aca8602ef70f ("net: sfp: add quirks for Hisense and HSGQ GPON ONT
SFP modules") says these RTL960x-based sticks assert TX_FAULT while their
Linux image boots, which takes about 40 seconds.

Commit 0fd5dfa99cfc75 ("net: sfp: ignore LOS also on Hisense GPON
modules") masked LOS so the stick can be configured with no fiber
connected.

If the ODI stick behaves the same way, a TX_FAULT held that long would use
up the N_FAULT_INIT retries in sfp_sm_fault():

	if (sfp->sm_fault_retries && !--sfp->sm_fault_retries) {
		dev_err(sfp->dev,
			"module persistently indicates fault, disabling\n");
		sfp_sm_next(sfp, SFP_S_TX_DISABLE, 0);

LOS asserted without fiber would also keep the host link down.

The commit message reports no TX_FAULT or LOS behaviour from the test
board. Does the Horaco ZX-SWTGW2C8F cage wire these signals? If it doesn't,
this path would not have been exercised.

[Severity: Low]
This isn't a bug, but this part of sfp_quirks[] is sorted by vendor name
(... HSGQ, Lantech, UBNT, Walsun, YV). Should the ODI entry go after the
Lantech entries and before UBNT?

> +
>  	// Lantech 8330-262D-E and 8330-265D can operate at 2500base-X, but
>  	// incorrectly report 2500MBd NRZ in their EEPROM.
>  	// Some 8330-265D modules have inverted LOS, while all of them report

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118025602.171615-1-github%40bumblecito.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209462;
	b=Sp0HRm1PoDxlKFezHCtQpYvNvdpC9mtjGxb+k1NtNpPp441yKtVEy4pGGWlKXLRyFpCV
	 Fklho66k+vqpgCoqOxtHRwENIUFdKsxNOmYStkSPxsk7zWDU8ab1y6OOoDYzd+ggk8OFc
	 8AmMsjwHsDwvO76jOLOoQhnbHVJVm+jR53WJcb9KpH9xj8ThEh+E7w8c6ol9UI2Tisq/V
	 cjxvkHmUUWuPGeJrgw1yRkJDZWjPxdHz/CK+PRsudVgKFXiullTIwimOv6LsVsKzMbDZc
	 OveB/zUs0hUW+yB+DI817kTSB+RmC78tcscrdiEgaKszvxcs9pO1PYa3jN0MCanXrYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209462;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NnepT7a4oGWZ7w+mt7+G6UJ7Y+69gUMiWBnQOoUpVLw=;
	b=uT2O9xOmx8JcdrhQP/GhG8UhYcZrCD4xsy8likIbGoI9PliqSoPdaXavW7s2oFOgO4yS
	 1zQl/QIYlWCjmXwHjZyz3VuqCc74mVvR/p464LZLZXn3gDDphVbee6QU7o6zMlVMNKH8d
	 IIrN5NdU2innwpSp+zsmh1oyEN1+lIig4YWICtFh7m7CLEhT+CelLHWczXlnsRW8Q6g0o
	 L9NKt3XO9cT5XT8J5SgwnjxermIxYLOQw3KkEzQqxhf4F/GN2rou0YlbEwCOCI0aZh7++
	 mMZGmjJ8bahoSXJr/WOnh3PL+tZ0hxF3Xf7rNZmJ0hBB0/ZsxxaQsfgiuILoYNWrB4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XomsUE/G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0D606A6A7;
	Fri, 20 Nov 2026 21:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XomsUE/G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861991F000F2;
	Fri, 20 Nov 2026 21:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209462;
	bh=NnepT7a4oGWZ7w+mt7+G6UJ7Y+69gUMiWBnQOoUpVLw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XomsUE/GmoSFHEaP0eFWafWcXMcVGN4Bp/OF8g+AMnkGTnGQCKLEud21npnIF1Niy
	 fOiAuUTAI2JbuT7uYUzxI2dRZnrmkLEHSLt6926voQOM7II0wI5a/vj0YaE/Gqch0o
	 JCHA8HCDmQkA9T8Mykty2une/xx90bw0E2fN6C7EqoBbU2XHISt2h3/RjJQ+4I01rf
	 mU31l//xCozDk5Sc7Wa2LsWNepk7O4PkZQ/DT7CmuhhatLojOH+1UgDC8+PzjL7Lww
	 111Q21b7c52PvxjnHurrf9W9WONUTDiroeP7yfRYH3tKFu+W5PCrg8dMoPa08xIb08
	 AOvD9hIVyeihw==
Subject: Re: [PATCH net-next v3 1/2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
From: netdev-bot+sashiko@kernel.org
To: github@bumblecito.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 21:17:41 +0000
Message-ID: <179520946109.3135.2775052387986633073@kernel.org>
In-Reply-To: <20261118162323.436219-2-github@bumblecito.com>
References: <20261118162323.436219-2-github@bumblecito.com>
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

- [Medium] The only test reported is a 2500 Mb/s link brought up after
  speed and duplex were forced and autonegotiation was disabled by hand.
- [Low] The patch adds SFP_QUIRK_S("ODI", "DFP-34X-2C3",
  sfp_quirk_2500basex) to sfp_quirks[] in drivers/net/phy/sfp.c (lines…

--

net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3

This commit adds an entry to sfp_quirks[] that applies
sfp_quirk_2500basex to the ODI DFP-34X-2C3 XPON module. It was tested on
a Horaco ZX-SWTGW2C8F switch, with speed and duplex forced and
autonegotiation disabled.

> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
> index 915156743701b..960ac89cc2a0b 100644
> --- a/drivers/net/phy/sfp.c
> +++ b/drivers/net/phy/sfp.c
> @@ -614,6 +614,9 @@ static const struct sfp_quirk sfp_quirks[] = {
>  	SFP_QUIRK("Lantech", "8330-265D", sfp_quirk_2500basex,
>  		  sfp_fixup_ignore_los),
>  
> +	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
> +	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),

[Severity: Low]
What does this module actually report in its EEPROM?

sfp_module_parse_support() in drivers/net/phy/sfp-bus.c can already turn
on 2500base-X without a quirk in two cases. One is the FC speed bits
with br_nominal >= 31. The other is the bit-rate fallback:

drivers/net/phy/sfp-bus.c:sfp_module_parse_support() {
    ...
	if (linkmode_empty(modes) && br_nom) {
		...
		if (br_min <= 3200 && br_max >= 2500) {
			phylink_set(modes, 2500baseX_Full);
			__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
		}
	}
    ...
}

So the quirk is only needed if the EEPROM falls outside both rules. A
typical case is an xPON stick that reports 1000BASE-LX at about 1300MBd.

Most of the nearby xPON entries record this as "can operate at
2500base-X, but reports <X> in its EEPROM". Examples are Huawei MA5671A,
Hisense LXT-010S-H, Hisense ZNID-GPON-2311NA, HSGQ, FS GPON-ONU-34-20BI
and Alcatel G010SP. The OEM SFP-2.5G-BX10-D/U and LH03-B/LH20-A entries
have no such comment, though.

Could the commit message and the table comment say what the module
reports for nominal bit rate, BR min/max and compliance codes? The
vendor name and PN strings would help too, for example from ethtool -m.
The strings matter because sfp_lookup_quirk() needs an exact vendor/part
match after trimming.

The later commit "net: sfp: sort OEM and Turris SFP quirks" does not
change this entry.

[Severity: Medium]
Does the link come up with this entry under the default phylink
configuration?

The commit message says the link was established "with speed and duplex
forced and autonegotiation disabled". sfp_quirk_2500basex() only adds
the link mode and the interface:

static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
				struct sfp_module_caps *caps)
{
	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
			 caps->link_modes);
	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
}

It leaves the Autoneg bit that sfp_module_parse_support() always sets:

	phylink_set(modes, Autoneg);

sfp_quirk_oem_2_5g(), by contrast, calls sfp_quirk_disable_autoneg().

With this entry, the default path looks like this:

  1. sfp_module_parse_support() sets Autoneg.
  2. sfp_quirk_2500basex() adds 2500base-X and keeps Autoneg.
  3. phylink_choose_sfp_interface() picks 2500base-X.
  4. phylink_sfp_set_config() uses mode = MLO_AN_INBAND.
  5. phylink_pcs_neg_mode() takes the Base-X without a PHY branch. When
     the PCS reports no inband caps, or reports both enable and disable,
     the advertised Autoneg bit selects in-band negotiation:

		else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
					   advertising))
			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;

Suppose the module's 2500base-X SerDes does not do clause 37 style
in-band negotiation. On such hosts, would users need to run
ethtool -s ... autoneg off to get a link after inserting the module?

Could the entry also disable autoneg? Alternatively, could the commit
message confirm that the module links up with in-band AN enabled?
Several accepted xPON entries also use sfp_quirk_2500basex with Autoneg
left set, so this may be fine if the module does negotiate.

There is also the test host. The Horaco ZX-SWTGW2C8F is RTL930x based,
and this tree has no mainline MAC/PCS/switch driver for it. The only
RTL930x code under drivers/net is drivers/net/mdio/mdio-realtek-rtl9300.c.
Was the test run on a downstream kernel? If so, could the commit message
say so?

The later commit "net: sfp: sort OEM and Turris SFP quirks" does not
change the ODI entry either.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118162323.436219-1-github%40bumblecito.com

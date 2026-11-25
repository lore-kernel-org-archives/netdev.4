Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618388;
	b=EqbIe+TxlKlP8NHQutoir9acCnZaNl/7KuEI+Yz8Yqz2A6Du9eoSdVMjR5vB3tzF4ZK4
	 oU0Fz9ZDg3V/CQcaKTqwrsJ35y+KS17VrKGfJ6Iyquftr1c3DGop6stdpJh4M32dJI0Pd
	 gNcKZKY+x/Gld7tOiUSUPu54ys+wqhPCEQdaCfgjt+GFbMMTb0WKQz35iXZIKxbxNhMn1
	 qOWvY5PX0ythbra8EYGA6Qg7TIzYgjZzKZMZnmbzqFKeRO4pk7WI23n+//CklQm5eGCX7
	 qjoV6d1RgjhYud7C4bZemJNG7vi+/o7Sh4k7IpGECbIB1RNikBDk/RqmPnCef7cPjdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618388;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vqfaeXlq/VssiznG1efvyyMml39SwQVeqfz9pDezTyo=;
	b=j+ZkZ3DWM/o+x2s+feAisYPYFY7V58Uz6fTdfqpG2bhGg8bpADU9R3l7EqTE0xLr7GGm
	 KEFOkQuJ8ca4dxQ1izUQt8WcCA5lE3luAMSHKLXoavUHvhwJUcmEIq6mWz6tQVp1tBO4y
	 7ohiydbNKF3U/XDZMOfhYDdgv9gUDkOKAxcwEz5wDVNL9KKpyw3hXvbr3ttHrwymbVsAq
	 WbFKJpgGxqNg1pdPCHcmcd7x5Fh/ydQdllXgcLnjLAX/peqd1GymNEvqylfRqEeaHscdL
	 tN0zn5W/X+HjeqRtrXoH/RwBgix5voDIEp5MENjfahBp1Pm1Y4FiDSRGsu2IWHFuPqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PNyaxq/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB337606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PNyaxq/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA3F1F00A36;
	Wed, 25 Nov 2026 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618388;
	bh=vqfaeXlq/VssiznG1efvyyMml39SwQVeqfz9pDezTyo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PNyaxq/TL4syBbp5HfZZ7EJvzx0dA1Jaj+ByRtkLvttbjP1vrrKnPsntw2Js88DL1
	 HTZbgmn6mRYHLksh0pK3gD3WIVdBl5JIcKyCSYam5YIiueJe4UE99MUNcJPy+Uod9/
	 s3zYZ3JinwUXpRWI0AuY674kug2JmmAiWIZv8ATY2Wn4ODbZGF/dbPaUKAs31zxqla
	 eOO4qO5DlrFm1s4D/EC1fIvNXTbxt3EcVoQPPzmYh7p9XmaRbUBj5eXd8RkU/A4s83
	 htr2+zGBhfV1TwxEkFLbSV0eW/IJLzBTVZr/NPy2j6VKDWgXzUhK/asJ5bY6eJdBjh
	 wiZTRyWr1MpRA==
Subject: Re: [PATCH net-next v4] net: phy: marvell: add support for PHY LEDs
 polarity modes
From: netdev-bot+sashiko@kernel.org
To: olek2@wp.pl
Cc: skyline@mail.ru, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
Date: Wed, 25 Nov 2026 14:53:07 +0000
Message-ID: <179561838748.3135.16328846882228728224@kernel.org>
In-Reply-To: <20261124202054.1070702-1-olek2@wp.pl>
References: <20261124202054.1070702-1-olek2@wp.pl>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/net/phy/marvell.c, m88e1318_led_polarity_set()
  treats @modes as a complete description of the LED polarity.
- [Medium] In drivers/net/phy/marvell.c, page 3 register 0x11 (LED
  polarity) is written only once, from of_phy_led() during phy_probe(),…

--

net: phy: marvell: add support for PHY LEDs polarity modes

This patch adds a led_polarity_set callback for the 88E1116R, 88E1318 and
88E1510 PHYs. The callback programs the per-LED active-high and
high-impedance bits in the LED polarity register (page 3, register 0x11).

> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index 87f66dfa92dda..00ce215bb71ba 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c

[ ... ]

> @@ -3638,6 +3643,36 @@ static int m88e1318_led_hw_control_get(struct phy_device *phydev, u8 index,
>  	return marvell_get_led_rules(index, rules, mode);
>  }
>  
> +static int m88e1318_led_polarity_set(struct phy_device *phydev, int index,
> +				     unsigned long modes)
> +{
> +	u16 val = 0;
> +	u32 mode;
> +
> +	if (index >= M88E1318S_MAX_LEDS)
> +		return -EINVAL;
> +
> +	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
> +		switch (mode) {
> +		case PHY_LED_ACTIVE_LOW:
> +			break;
> +		case PHY_LED_ACTIVE_HIGH:
> +			val |= MII_88E1318S_PHY_LED_POL_ACT_HIGH(index);
> +			break;
> +		case PHY_LED_INACTIVE_HIGH_IMPEDANCE:
> +			val |= MII_88E1318S_PHY_LED_POL_HIGH_IMP(index);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
> +				MII_88E1318S_PHY_LED_POL,
> +				MII_88E1318S_PHY_LED_POL_ACT_HIGH(index) |
> +				MII_88E1318S_PHY_LED_POL_HIGH_IMP(index), val);

[Severity: Medium]
What happens here when the DT LED node only has inactive-high-impedance?

of_phy_led() sets each mode bit on its own and calls ->led_polarity_set()
whenever modes is non-zero:

drivers/net/phy/phy_device.c:of_phy_led() {
    ...
	if (of_property_read_bool(led, "inactive-high-impedance"))
		set_bit(PHY_LED_INACTIVE_HIGH_IMPEDANCE, &modes);
    ...
	if (modes) {
		...
		err = phydev->drv->led_polarity_set(phydev, index, modes);
    ...
}

In that case val holds only HIGH_IMP(index), but the mask always includes
ACT_HIGH(index). The on-state polarity is then forced to active-low, and
the reset or bootloader value is lost.

The binding in Documentation/devicetree/bindings/leds/common.yaml describes
inactive-high-impedance only as the off state ("Set LED to high-impedance
mode to turn the LED OFF"). The on state has its own active-high and
active-low properties.

Other implementers of this op that pick a default when neither property
is given choose active-high:

- dp83867_led_polarity_set() ("Default active high")
- as21xxx
- an8801r_led_polarity_set()
- an7581_phy_led_polarity_set()
- qca808x

gpy, xway and aqr reject any request that doesn't explicitly ask for
active-low or active-high.

On a board with an active-high LED and only inactive-high-impedance in the
DT, wouldn't the LED end up as "on = drive low, off = tristate" and never
light?

The reverse also happens: active-high or active-low on its own clears any
tristate-off setting already in the register.

Could ACT_HIGH(index) be touched only when active-high or active-low is
explicitly present in modes? Otherwise, could it be documented that an
unspecified on-state polarity means active-low?

[Severity: Medium]
Is this polarity setting lost after a PHY hardware reset?

This is the only place register 0x11 is written. It runs once, from
of_phy_led() during phy_probe(), and the requested modes are not saved in
struct marvell_priv.

On boards with a reset GPIO or reset controller, an ndo_stop/ndo_open
cycle in MAC drivers that connect the PHY on open goes through:

phy_disconnect()->phy_detach()
    phy_device_reset(phydev, 1);

phy_attach_direct()->phy_init_hw()
    phy_device_reset(phydev, 0);
    ...
    phydev->drv->config_init(phydev);

marvell_config_init()->marvell_config_led() rewrites only the LED function
register (16), plus the optional marvell,reg-init values. Nothing writes
the polarity register again. of_phy_led() is not re-run either, because
the LED classdevs stay registered.

After the first ifdown/ifup, wouldn't an active-high LED be inverted, and
an inactive-high-impedance LED be driven again when off?

aqr107_config_init() saves the polarity and reapplies it ("Restore LED
polarity state after reset"). qca808x does the same with
priv->led_polarity_mode in config_init.

The v3 changelog had "Restore polarity settings after hardware reset", and
the v4 changelog says "Throw out restiring polarity setting after hardware
reset". The commit message gives no reason for dropping it and does not
mention the limitation.

Could the restore be brought back, or the reason and limitation be added
to the commit message?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124202054.1070702-1-olek2%40wp.pl

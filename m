Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795736438;
	b=qV08a7+cbOIB1fPzwSSxOBvr4B50Z1xt8a40FvI7V/KsxhHo2UBleAelK238uUriWjyX
	 1KQmeGUEZUUzkLuc9eMWoPEvzidws7+MILPVLyFnHzs/gC2s//g7N0YwfBtEO89fDipAE
	 o92waLraBm+m68XWCodrcEjNVYRYjglH2Fg5DvxO1smFyUsVJumiP1gMXHKqOexBfrzym
	 8RcJRufZ1ubGFvU9ca7eFzuhbaq/sLpfltxi7NG4QARddXZ3mznA199nN/JKPte9cjSP1
	 1NucNr7FfE1kkHgVbx3rxDL+z7QqjKHasFZp3jOmYDxcbYCDTAY+KfYwoGned4jw2kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795736438;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=lZwxZV1uIHEBkCO+m1WjoKlS1XOvxjEn/seCm8IYvwA=;
	b=H9FmOd2Dc1YuIdw1dM0YDWIK+UqZsZx8q8avdnymwirVsKkvsX5Fi1Cxlx1MbN8lT2Qj
	 EVltAttvZNUnG2TD+vux0ZtVPbvBsOO0jO06biLPaBHidv0Snc5y3d/mNCDv3yTm9lWyP
	 AdeRo903uoAEuKXDtY2lAPZYxVXUnNx+7ugmXg3c2+JkBE/Vz0KBxc4joAGFS8kX8mtuc
	 9sxmrrZzuInqvJLNHIoXivTn331Up8CdHRVMmKUDmfegZDe1ktp6xKdf8nmTgez5qnQou
	 2sFzNed0YPLXtTbj0fz38lmxKAZtAddy5H7A77WMuWJ7BZRNXPiH3orC4ictIS+VQAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=EJ9udazr;
	arc=none smtp.remote-ip=212.77.101.12
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF9606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 23:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=EJ9udazr
Received: (wp-smtpd smtp.wp.pl 11459 invoked from network); 27 Nov 2026 00:40:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1795736428; bh=lZwxZV1uIHEBkCO+m1WjoKlS1XOvxjEn/seCm8IYvwA=;
          h=Subject:To:Cc:From;
          b=EJ9udazrYZTsYIh7qI+TQji1zZxYnKwfAbGoY7GddQ51LOMWxSpQCxfw+VP+aeIxN
           7nLFaI3R+mF+gpdsvZvjhLB08s6nwGZVUqJMO0kOr0rDxfZP8RKVIOeM4okWRQl9dK
           6blRj19pOfr6W+wH+VL6fkoOLzj4OooBuT+h6dknfnCIETZKc9VQZkauhiYl0h9gO4
           j/T6hQ3mkYcLB7zYcqepZbcCevAQgmHhmyvMGiV5YX7Pfl/gH633EAADDbHHAHj8U4
           y1tvVyTwJ1KDg9z4GvfNbQ5vbQTRDxTVHCeuKv6Kz3xkoYNPVRJBNUK3znuaTdmI6a
           FQfux92Hdts5g==
Received: from [192.168.3.224] (83.5.167.37.ipv4.supernova.orange.pl [83.5.167.37])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <netdev-bot+sashiko@kernel.org>; 27 Nov 2026 00:40:28 +0100
Message-ID: <a42801b3-9a4e-4adb-942a-0010d7f3f8bd@wp.pl>
Date: Fri, 27 Nov 2026 00:40:28 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: phy: marvell: add support for PHY LEDs
 polarity modes
To: netdev-bot+sashiko@kernel.org
Cc: skyline@mail.ru, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
References: <20261124202054.1070702-1-olek2@wp.pl>
 <179561838748.3135.16328846882228728224@kernel.org>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <179561838748.3135.16328846882228728224@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 114b3b3c2d16d1ceb8924f2ff06d6aae
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [UYNE]                               

Hi,

On 25/11/2026 15:53, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 2 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] In drivers/net/phy/marvell.c, m88e1318_led_polarity_set()
>    treats @modes as a complete description of the LED polarity.
> - [Medium] In drivers/net/phy/marvell.c, page 3 register 0x11 (LED
>    polarity) is written only once, from of_phy_led() during phy_probe(),…
>
> --
>
> net: phy: marvell: add support for PHY LEDs polarity modes
>
> This patch adds a led_polarity_set callback for the 88E1116R, 88E1318 and
> 88E1510 PHYs. The callback programs the per-LED active-high and
> high-impedance bits in the LED polarity register (page 3, register 0x11).
>
>> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
>> index 87f66dfa92dda..00ce215bb71ba 100644
>> --- a/drivers/net/phy/marvell.c
>> +++ b/drivers/net/phy/marvell.c
> [ ... ]
>
>> @@ -3638,6 +3643,36 @@ static int m88e1318_led_hw_control_get(struct phy_device *phydev, u8 index,
>>   	return marvell_get_led_rules(index, rules, mode);
>>   }
>>   
>> +static int m88e1318_led_polarity_set(struct phy_device *phydev, int index,
>> +				     unsigned long modes)
>> +{
>> +	u16 val = 0;
>> +	u32 mode;
>> +
>> +	if (index >= M88E1318S_MAX_LEDS)
>> +		return -EINVAL;
>> +
>> +	for_each_set_bit(mode, &modes, __PHY_LED_MODES_NUM) {
>> +		switch (mode) {
>> +		case PHY_LED_ACTIVE_LOW:
>> +			break;
>> +		case PHY_LED_ACTIVE_HIGH:
>> +			val |= MII_88E1318S_PHY_LED_POL_ACT_HIGH(index);
>> +			break;
>> +		case PHY_LED_INACTIVE_HIGH_IMPEDANCE:
>> +			val |= MII_88E1318S_PHY_LED_POL_HIGH_IMP(index);
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
>> +				MII_88E1318S_PHY_LED_POL,
>> +				MII_88E1318S_PHY_LED_POL_ACT_HIGH(index) |
>> +				MII_88E1318S_PHY_LED_POL_HIGH_IMP(index), val);
> [Severity: Medium]
> What happens here when the DT LED node only has inactive-high-impedance?

In this case, the active state is set to low (default after a reset) and
inactive state is set to tristate. User must clearly specify the 
polarization
expected in the active state. Also note that if the user specified no 
parameters
at all, the previous state is preserved.
>
> of_phy_led() sets each mode bit on its own and calls ->led_polarity_set()
> whenever modes is non-zero:
>
> drivers/net/phy/phy_device.c:of_phy_led() {
>      ...
> 	if (of_property_read_bool(led, "inactive-high-impedance"))
> 		set_bit(PHY_LED_INACTIVE_HIGH_IMPEDANCE, &modes);
>      ...
> 	if (modes) {
> 		...
> 		err = phydev->drv->led_polarity_set(phydev, index, modes);
>      ...
> }
>
> In that case val holds only HIGH_IMP(index), but the mask always includes
> ACT_HIGH(index). The on-state polarity is then forced to active-low, and
> the reset or bootloader value is lost.
>
> The binding in Documentation/devicetree/bindings/leds/common.yaml describes
> inactive-high-impedance only as the off state ("Set LED to high-impedance
> mode to turn the LED OFF"). The on state has its own active-high and
> active-low properties.
>
> Other implementers of this op that pick a default when neither property
> is given choose active-high:
>
> - dp83867_led_polarity_set() ("Default active high")
> - as21xxx
> - an8801r_led_polarity_set()
> - an7581_phy_led_polarity_set()
> - qca808x
>
> gpy, xway and aqr reject any request that doesn't explicitly ask for
> active-low or active-high.
>
> On a board with an active-high LED and only inactive-high-impedance in the
> DT, wouldn't the LED end up as "on = drive low, off = tristate" and never
> light?
>
> The reverse also happens: active-high or active-low on its own clears any
> tristate-off setting already in the register.

I think that's okay. By default, we enable push-pull output. User must
explicitly specify that they intend to use the tristate output in the
inactive state.

>
> Could ACT_HIGH(index) be touched only when active-high or active-low is
> explicitly present in modes? Otherwise, could it be documented that an
> unspecified on-state polarity means active-low?
I don't know what the preferred behavior is if the user doesn't provide
complete information describing the LED. If the user provides only some
of the information, we set the remaining settings to their defaults
(active-low, push-pull). I'll change that if the idea is actually 
different.
> [Severity: Medium]
> Is this polarity setting lost after a PHY hardware reset?
>
> This is the only place register 0x11 is written. It runs once, from
> of_phy_led() during phy_probe(), and the requested modes are not saved in
> struct marvell_priv.
>
> On boards with a reset GPIO or reset controller, an ndo_stop/ndo_open
> cycle in MAC drivers that connect the PHY on open goes through:
>
> phy_disconnect()->phy_detach()
>      phy_device_reset(phydev, 1);
>
> phy_attach_direct()->phy_init_hw()
>      phy_device_reset(phydev, 0);
>      ...
>      phydev->drv->config_init(phydev);
>
> marvell_config_init()->marvell_config_led() rewrites only the LED function
> register (16), plus the optional marvell,reg-init values. Nothing writes
> the polarity register again. of_phy_led() is not re-run either, because
> the LED classdevs stay registered.
>
> After the first ifdown/ifup, wouldn't an active-high LED be inverted, and
> an inactive-high-impedance LED be driven again when off?
>
> aqr107_config_init() saves the polarity and reapplies it ("Restore LED
> polarity state after reset"). qca808x does the same with
> priv->led_polarity_mode in config_init.
>
> The v3 changelog had "Restore polarity settings after hardware reset", and
> the v4 changelog says "Throw out restiring polarity setting after hardware
> reset". The commit message gives no reason for dropping it and does not
> mention the limitation.
>
> Could the restore be brought back, or the reason and limitation be added
> to the commit message?

No upstream DTS is affected by this concern. We may return to this topic
once someone adds an dts upstream that requires such a modification.

Best regards,
Aleksander

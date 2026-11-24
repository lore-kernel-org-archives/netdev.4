Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516757;
	b=SldmMdbbsPHzQkp8htLzbS+CH0wWyTHooAfHeWx+QmtJDj0NA4kLOYjPBtL+NPxybw/u
	 SxuRJbtcYIs+8Hp/lCLlIn4omd05JzzdoGQB2anZZrCn760NwiJDSACRQCgbbwSg4WvVQ
	 8+NhSrOwz62Qis7j1bNN1nJYoZiot0kZ/3vYsyKUH925ZyCwitIOCkh8xPvXLqLoaM5Gq
	 AIyaPS/BhntQh7Y9NiEn5WSYSG09E3japIMyC05m0IoLoXrRr5Hg8gSVQFIs+z50uCCaO
	 xXldrtpECcKBvbRFe86ONyscq5Qsu4pQthKgGnfGGXykBwSp74pT++jR+ysiIbCawAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516757;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=nhnmWQePDTk2vY2QnefarH/TcGfijKfTJDcr3j3N3is=;
	b=aCLsNXHyD6FdB6iBIRuX6U6syPrxVFSxnyX4jczA7ZHj1PGsAMm6LJvbfYIBS/PqS663
	 qy6iLwVvmjLJScFMxu2llCFMUNpIFIf6CYJTNK5xO7gLO8/GVDsmZYhBgQRyIkp0yMRQk
	 U8lgYsMDi1KygtUUflLpSz9Ujolqm9LQRhRY3F5RAvL49OiBCLyy82rXCo1OlBjSLWETu
	 SER4shOP2e/Ojc1UBSGyRjxrEOg/t6VBiwN9NaSGBSguodPQ3NXlz6F16YB/1g+2OcqZB
	 J1vf1ZR3fyTu14/cbI0Tsej0czVIu1zDkmQp7yG2gvEPoJ0BZguV/F4lShT5ZYc9RsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCi6sz4R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BE6606A326;
	Tue, 24 Nov 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCi6sz4R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16941F000C0;
	Tue, 24 Nov 2026 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516757;
	bh=nhnmWQePDTk2vY2QnefarH/TcGfijKfTJDcr3j3N3is=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZCi6sz4RYCJmvCNJ/AEE8hvA0F9Iv9TtFk3o3xfWouzz1RkBziO92BNH7DLF9zN+1
	 SQhxxCirVA50jrSm50TYw8mZ5LF/GTbY3iCAJr3411BIw4bCSG7YPUwuNz8HK3i7nN
	 srmTOJyEErFnJwcnpb5eLSYVbf9AtyyoYyp4OUFoB753YcIQuo2pfwB6Nz5onifGg7
	 JDqa/barcPAnkeohcErhtrcG5qSquxmVgPyJcrDe5HDdTmzBadIdMMWj/2du7a4OBd
	 6kTOCawHEbjl/D38Uq5ytakLw6TwAAMP5xm718XZe995AdHn41ltmUZK57w8Ktdbgz
	 NJ1YE+hlPu1BA==
Subject:
 Re: [PATCH v2 2/2] net: phy: motorcomm: add missing trigger link for YT8521
From: netdev-bot+sashiko@kernel.org
To: amadeus@jmu.edu.cn
Cc: Frank.Sae@motor-comm.com, andrew@lunn.ch, pabeni@redhat.com,
 kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 10:39:16 +0000
Message-ID: <179551675643.3135.11872464978293733694@kernel.org>
In-Reply-To: <20261120100001.1568757-2-amadeus@jmu.edu.cn>
References: <20261120100001.1568757-2-amadeus@jmu.edu.cn>
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

- [Medium] Since this patch, yt8521_led_hw_control_get()
  (drivers/net/phy/motorcomm.c, lines 1912-1924) reports…
- [Low] The commit message describes this as a fix for missing behaviour:
  TRIGGER_NETDEV_LINK is accepted by yt8521_led_hw_control_set() but was…

--

net: phy: motorcomm: add missing trigger link for YT8521

This patch makes yt8521_led_hw_control_get() report TRIGGER_NETDEV_LINK
when the 10, 100 and 1000 link-on bits are all set in the LED config
register. yt8521_led_hw_control_set() already accepts that rule.

> net: phy: motorcomm: add missing trigger link for YT8521
>
> TRIGGER_NETDEV_LINK is available in led_hw_control_set,
> but missing in led_hw_control_get. Add it.

[Severity: Low]
Should this have a Fixes: tag? The commit message describes this as adding
missing behaviour. The getter was added by commit 355b82c54c122e ("net:
phy: motorcomm: Add support for PHY LEDs on YT8521").

The subject only mentions YT8521. The PHY_ID_YT8531 phy_driver entry in
drivers/net/phy/motorcomm.c uses the same getter:

    .led_hw_control_get = yt8521_led_hw_control_get,

so YT8531 behaviour changes too. Would it be worth mentioning that?

If this gets a Fixes: tag and goes to stable, it will also bring along the
trigger state problem described below.

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 5a0cd4d7d6336..4552eee872a8c 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -1918,6 +1918,11 @@ static int yt8521_led_hw_control_get(struct phy_device *phydev, u8 index,
>  	if (val & YT8521_LED_10_ON_EN)
>  		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
>  
> +	if ((val & YT8521_LED_10_ON_EN) &&
> +	    (val & YT8521_LED_100_ON_EN) &&
> +	    (val & YT8521_LED_1000_ON_EN))
> +		__set_bit(TRIGGER_NETDEV_LINK, rules);

[Severity: Medium]
LINK_10, LINK_100 and LINK_1000 are already set just above this. Doesn't
yt8521_led_hw_control_get() now return LINK|LINK_10|LINK_100|LINK_1000?
Can the netdev trigger handle that combination?

netdev_trig_activate() copies the result without checking it:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
			rc = led_cdev->hw_control_get(led_cdev, &mode);
			if (!rc)
				trigger_data->mode = mode;
    ...
}

However, netdev_led_attr_store() rejects LINK combined with any LINK_xx
bit:

drivers/leds/trigger/ledtrig-netdev.c:netdev_led_attr_store() {
    ...
	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
	    (test_bit(TRIGGER_NETDEV_LINK_10, &mode) ||
	     test_bit(TRIGGER_NETDEV_LINK_100, &mode) ||
	     test_bit(TRIGGER_NETDEV_LINK_1000, &mode) ||
	     ...
		return -EINVAL;
    ...
}

The register can have all three speed bits set in three ways:

- left that way by the bootloader
- as the hardware default
- written by yt8521_led_hw_control_set(), which sets all three bits for
  either a LINK request or a LINK_10|LINK_100|LINK_1000 request

Suppose the netdev trigger is activated on a YT8521 or YT8531 LED in that
state. Any later sysfs write that leaves LINK set then fails with -EINVAL
until link=0 is written first. Examples are writing 1 to tx, rx,
full_duplex or half_duplex, or writing 0 to link_10.

Before this patch the activated mode was LINK_10|LINK_100|LINK_1000, and
those writes worked.

realtek_main.c and air_an8801.c use the same pattern. It still breaks the
trigger's rule that LINK and LINK_xx are mutually exclusive.

Would it be better to report only LINK here and leave out the speed bits?
Or should ledtrig-netdev normalise or accept this combination?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120100001.1568757-1-amadeus%40jmu.edu.cn

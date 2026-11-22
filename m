Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384545;
	b=b156QgMdXOoo2GoReuyr9I6T5sdLKiagLgqoILiclcK1rPwygZfT+G/M/9+JKNpsfVlX
	 oxnP68JJ24wLKg5iMd9KGSRkIjd3Ay6Ql/gBLCl8xWJE9fqoe2xyoG1WQDE4yaMtUbwcK
	 qOmZadaNyVym9sGH119MsBGGjKBLuRvU2pYAH/NatUKRJJHWtcb7LsafTLaH0xWryK53G
	 ePD7BDL3jwn2VF+FlBOp5t9AZdRvyrdV/iNUUAXvF5wyULYkoqBlnDChdmHR93OPNl7Uu
	 u2KPX8KSfUe6oAHiaKDz77HwnoWfF4U9E97ycnpBQcF4+XdIV3TvJmfqTcUj5Xb/9mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384545;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RArxLci6qXjjHqY3qFip/+FWbz0OrpEmO/qow7ct95M=;
	b=3RVr8ZXssVWMjCod+qX/wzpzsZQyaURjeYfvzavW7Srz8w+3Q9CEkk9h4x2ZulsM7B47
	 XfGv8A36pC2hQMbWb9GjGUMnjJORmqVZiGW3qHTEacdq89xEzEZtITAdWgqEdF53BsyoM
	 BVpRuZ47acyDYsxhhU1F38QAcpTWHVD0g7+/EwhwF9RtyCaTCtkMDEEDJjDR/6uR6YSVZ
	 09StI9SOhWjSJc+sQaYub2KxqE8vHTi2SinUyeNCwNIc9nadz7NLQ8WrLrMJIrhSfh1ab
	 ngYGFvTFY6ICN9FQtJwktb4b5U6PTfjuYWsjdEWTQbqKByUEHRUpcwMOp8yTmYF28Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=31vxIvjq;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07F5606A31A
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 21:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A07F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=31vxIvjq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RArxLci6qXjjHqY3qFip/+FWbz0OrpEmO/qow7ct95M=; b=31vxIvjqvjPQaTQ9fygTXkOSwg
	siL5Yz1T5eTUZC1FHg9PZJiuYuWRGdg5785nYiXjGMm01qMZOeILmROuPrGdkewP5A6ovJdrx60kM
	bARbdJla98jFB7RrQ+ojyEUrxOUz1vWGOZ+PALkXxwAxC+9MuX/6PFtF7B4N50LfD6x4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVFX1-000cxI-DE; Sun, 22 Nov 2026 22:55:31 +0100
Date: Sun, 22 Nov 2026 22:55:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: skyline@mail.ru, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: phy: marvell: add support for PHY LEDs
 polarity modes
Message-ID: <992ef2e7-4334-4b0e-b1ea-5ac1360fefea@lunn.ch>
References: <20261122213034.548858-1-olek2@wp.pl>
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
In-Reply-To: <20261122213034.548858-1-olek2@wp.pl>

On Sun, Nov 22, 2026 at 10:28:55PM +0100, Aleksander Jan Bajkowski wrote:
> Add the led_polarity_set callback for setting LED polarity. Implement
> this callback for the 88E1116R, 88E1318 and 88E1510 PHYs. This should
> also work on other Marvell PHYs, but I don't have access to the TRM or
> the hardware.

Marvell have an SDK called DSDT, which covers their PHYs. It is GPL
licensed, but not widely distributed. If you can find a copy, it will
give you all the details for determining which PHYs this will work
for. Just be warned, the code is horrible.

> Keep the LED polarization settings and restore them after a hardware
> reset. This modification is actually only necessary on devices with a
> wired PHY reset line and a driver that resets the PHY during the
> link-up/link-down events. I found a single DTS file in OpenWRT
> (armada-385-fortinet-fg-5xe.dtsi) that matches this hardware configuration.

Mainline does not really care about OpenWRT. However, why does
armada-385-fortinet-fg-5xe.dtsi do this? Is it because of an errata in
the PHY? Such an errata we might care about.

>  static int marvell_config_init(struct phy_device *phydev)
>  {
> +	struct marvell_priv *priv = phydev->priv;
> +	int err;
> +
>  	/* Set default LED */
>  	marvell_config_led(phydev);
>  
> +	/* Restore the LED polarity settings after a reset. */
> +	if (priv->led_polarity_mask) {
> +		err = phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
> +				       MII_88E1318S_PHY_LED_POL,
> +				       priv->led_polarity_mask,
> +				       priv->led_polarity_val);

This does not make much sense to me. If you have lost polarity, you
have also likely lost the LED blinks modes. So you are only restoring
part of the state?

And this is for a device which does not even exist in mainline.

I suggest KISS, throw this out.

  Andrew

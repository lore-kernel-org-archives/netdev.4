Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043791;
	b=lJlZ5mYyHFGX3T/pymiZBagZNTV57fE+lj44Bb1qpxj4e6TvfwYn2TEz1loNkKUboFzk
	 zHhJfMU+yR8i8Vi398rQjHPA1WAnhYDwIgYZJg+m4ng4KTAytWP0CPjxw8YNUgRxOd0dZ
	 TkL+I6LwQRmUng6MwvmsLe8nSQQ70VmJX0IoOctUE1Jn8BCCUl2uZcX56e4WYs6hTTyfS
	 10gIjJQFUvOUDWFfbusRclrQqdZER47DPMTNyYGqP/OPhLYfsRgsMuZc1L9cn+sSZxmGI
	 Y1Tja7Y/5MNPwMY45SC4+JU1Jz9pF+3Ma06+3S4dOcOSiWbrvYrHyt5G09wVvOFNzjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043791;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xiiydflEB91O48Fmb7pHblMVYGyM8PHtmi+Z46i+1H8=;
	b=xBnQfgctifrXpZC0b17aeU7vpHQmePIWy99MXI5dNJKeZBJzWZsb9BteA5P06rCVgQV0
	 TrBKMiPB9Gls1aNs3367D4zZgNIk9xWxaOjmkvx/Acy7q01hGSLIzYlLX6SPjKf41QDv9
	 pCD3l6BhJHi6PgKdf09X6Rv+/qqrQwkG4t60xLNR78NMYG+K64foQzngniwYCSVxqFwY8
	 mwGMrhlYlCtNAnacCKpJQ3RMaRs+iLNxO82STwHmMk2u4atjy4aZjfOD3PMh22nrRMQuj
	 9d8XRBdoYohOye2DIEXcBvd89ZQNz75x5uyNYiFfGAqkpC8kCtuWXjynyiulmH7EghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LutoQfhC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E21606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E21606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LutoQfhC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xiiydflEB91O48Fmb7pHblMVYGyM8PHtmi+Z46i+1H8=; b=LutoQfhCWTB+Vb+z9TekYwKr7H
	GWTVWumAwyTkxLRfFlptBdZ61SzhfTKDf/3tGI1H51bYMzRS1kJQNGbdfXFyBLM3PCo137+nr6+MT
	CWrxidRoUB7iJ2BFNgqtxQl7EPMbVR9vCAKh4nRBXSV7nnBupTkaZttdKlFC5oNpiiLg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTot2-00HWXF-Lg; Thu, 19 Nov 2026 00:16:20 +0100
Date: Thu, 19 Nov 2026 00:16:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: linux@armlinux.org.uk, netdev@vger.kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com, olek2@wp.pl, hkallweit1@gmail.com
Subject: Re: [PATCH net v2] net: sfp: skip PHY probe on bridge-less OEM
 SFP-10G-T revisions A and B
Message-ID: <4ddef89e-d6aa-4d6f-bc8d-997a9ad781b9@lunn.ch>
References: <20261118221450.1764790-1-pawlik.dan@gmail.com>
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
In-Reply-To: <20261118221450.1764790-1-pawlik.dan@gmail.com>

On Wed, Nov 18, 2026 at 11:14:50PM +0100, Daniel Pawlik wrote:
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
> Fixes: 324e88cbe3b7 ("net: sfp: add support for multigig RollBall transceivers")
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/

If i'm reading this correctly, it never worked before? So this is not
a regression? I don't think this is net material, it should go via
net-next.

> +static size_t sfp_strlen(const char *str, size_t maxlen)
> +{
> +	size_t size, i;
> +
> +	/* Trailing characters should be filled with space chars, but
> +	 * some manufacturers can't read SFF-8472 and use NUL.
> +	 */
> +	for (i = 0, size = 0; i < maxlen; i++)
> +		if (str[i] != ' ' && str[i] != '\0')
> +			size = i + 1;
> +
> +	return size;
> +}

When sending to net-next, you can move this function in one patch, and
then make use of it in the next patch. That makes the code easier to
review. Lots of small patches, with good commit messages, which are
obviously correct.

	Andrew

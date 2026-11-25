Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617512;
	b=Ut1NZl4TSkAFNQKZcfHLpv8fCXRpiUSePMgWiFqezzKuTBrki9kOwdXEC/KHP8BZvoCe
	 tnMi+orAJyDtUXADHCUdjH2nRdUtOQcwFi6SzzRnYXasOP+UVI2Tt8LM8I5taAUoKoOO6
	 pGBhsTpyI0vAux0zJ2S6ESVEAyWGk6ymF958iabNrlqeFgZ+lD7B4e48laOn+wz+c9/+5
	 b/YkUiokOhdokrWj0/s79mnfPylGr7qGPxIQz4UqqsDe4JP7r3cy5Xw4PfMp6lf0KsS67
	 m8Z7ZO3L/Awcqn8z/rWk8eHwwbjItDBgCzXJvSZWNyj5D7wkljXlGYwfuBqcU2hfEzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617512;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=fGqs6DcowK7IKELkXO0xayWMouuFNPphuLHx5fvxESQ=;
	b=4ClVz8S03W/BGrjNkaQj+c8egoFYoNwqgCWR9aca3UoXDa3oKFidV4bBGjfCUWVp+tDU
	 nmL+wrNQwOAXKhKNlCyROxADFBDOMXKqWC5VLLzF69lnslOFy0SQ1D+aD1wNFWKg/uFmm
	 SZjL65zPMm97hVnFPRymND7xuGq3w2GQ3toC0u9Qz2v3ltP9P1hVUb28ZB+K2QwogDMAb
	 5rbyS6kWEUydvWcBYMO1/5WodBnDT4iDkUWA97VG85xJp7yxYMLkohOMzRvizMnGcWTEr
	 aHzZpWerLbw8It9BBOenx9sNhu4INJuYDdMO8F7Ox+47F1B9e+TdWWP9HtpjSdBIxEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VFdECZ89;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B7606A32C;
	Wed, 25 Nov 2026 14:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E35B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VFdECZ89
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fGqs6DcowK7IKELkXO0xayWMouuFNPphuLHx5fvxESQ=; b=VFdECZ89cA0wOPVai4rKvdeZMH
	huumJAyMPj04D0JrdIBzMDD377FHoM+MvRMPgp71oziXnP5HdhOGtgj1U9EohQ7wd1R11H2yHe4A+
	EUnZiTQdpqeM0ZaqWu0fdjw1tQV24x3lZ8URtrUxfRAW+w4rFM0pdH7tindq8nIh8FTw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWE8Y-001KyU-HX; Wed, 25 Nov 2026 15:38:18 +0100
Date: Wed, 25 Nov 2026 15:38:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: bage@debian.org, hkallweit1@gmail.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, olteanv@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
Message-ID: <630d6b8e-917c-4213-b3b8-fa785ad33816@lunn.ch>
References: <20261121092933.186731-1-bage@debian.org>
 <179559958516.3135.11607042178143215952@kernel.org>
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
In-Reply-To: <179559958516.3135.11607042178143215952@kernel.org>

> [Severity: Medium]
> With the parse removed here, what happens to PHYs registered through the
> exported of_mdiobus_phy_device_register()?
> 
> drivers/net/mdio/of_mdio.c:of_mdiobus_phy_device_register() {
> 	return fwnode_mdiobus_phy_device_register(mdio, phy,
> 						  of_fwnode_handle(child),
> 						  addr);
> }
> 
> This wrapper never goes through of_mdiobus_register_phy(), so it never
> reaches the new parse.
> 
> Its in-tree caller, tja1102_p1_register() in drivers/net/phy/nxp-tja11xx.c,
> registers the port 1 PHY from a DT child node:
> 
> 		ret = of_mdiobus_phy_device_register(bus, phy, child, addr);
> 
> and does not set phy_ignore_ta_mask itself.

It feels like we are putting in too much effort for a feature which
has no in kernel users.

You solution is not 100% correct, it has some corner cases, but i'm
happy with the basic architecture of doing it once at a higher
level. If a new user comes along and lands in one of those corners,
let leave it to them to fix.

> [Severity: Medium]
> The bit is now set before fwnode_mdiobus_register_phy()->get_phy_device()
> checks whether anything answers at addr. Is it intended that nothing clears
> it when registration fails?

If the device comes to life later, it still has broken turn around, so
this is not a problem.

     Andrew

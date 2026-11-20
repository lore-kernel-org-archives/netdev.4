Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134819;
	b=KmKAjuQDh+nQ48X1VVGbuCeTQz9zcmF+AtHSupEqg8u27foS4H0Yqb9dnY4pGeFKrKUF
	 g2dmXiJ2gAIed0JNO1TqGOrRZMRByZLQi+/1EdN6Lz8hKkj7zX/2oSw6JRJAY/OPnMrZp
	 Cw3ri5y/uENaaapcPxw43zBiFmd2NTYp4tWk/5YOnpbmpV49apzSWC0W3tuiYaRg9Y6mo
	 bM678GazmEUysRbON8nkJp+VtbtImFCjkn1IPMckbkfs0HVbME38EquZz3vFC9ZZ4X0NF
	 sThhdedewOdG3Ip0dJygvggKn+ehh6vb2aasCLZpaKpxE53k6OGjatn/5RGy0f7hD4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134819;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=mSl/c/kHf5zuY8pdtj2+wYd0RoijkekTtzlrrbwzeoc=;
	b=MK7hpeL7htcv8N+2V9hB4vxT5TCH6Ej55cG2cnb58Yu6JJIHB3SXEx3XhsnYQurie7jB
	 O2nes01HvfrfbGxvSgMM5AqJiDPdfzgx5mVt2mZMdlfG/54gUOacPfMj/MI2MB9BCOMRU
	 O0McbL2vlicYSWfqPmL6UYnRmfWHIZbQFVgMywhPt2QODpiMAz2BvcIXeWPQ/adJdgVvH
	 RRoYqdFS7GwTu7+d9NENuPdLq8yrk89V2vJNpFXQl1jgZjXiP9dh/nvRXShpd0zR0vgcA
	 sITberzPac/DEsONEUN7AS/qWhDZ2vHH9dQw2IUlUr6ve7ZqVV2aGdLdCjwh946DT+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=N4ROEuDt;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E1606A325;
	Fri, 20 Nov 2026 00:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1E1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=N4ROEuDt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mSl/c/kHf5zuY8pdtj2+wYd0RoijkekTtzlrrbwzeoc=; b=N4ROEuDtvCtMSaSXYnxRwqjD4j
	hyZojSrbTM7aUYrEzfFUGyzavOtLFcLjSbRONorQ+LT0kVcFR6svT2aA/Yk55YAr8OGTm1cQ41Zab
	i/hBrwVnQ5CIeo+LbkhqK2gkElzIzdJnxi+whxvIqlXTcFmUSyfmNhLzYBTbfTUxodGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUCZ7-000AH8-Fw; Fri, 20 Nov 2026 01:33:21 +0100
Date: Fri, 20 Nov 2026 01:33:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bastian Germann <bage@debian.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
Message-ID: <19d8bfb6-074e-4344-acf8-67872f7b3e48@lunn.ch>
References: <20261119231319.1256419-1-bage@debian.org>
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
In-Reply-To: <20261119231319.1256419-1-bage@debian.org>

On Fri, Nov 20, 2026 at 12:13:19AM +0100, Bastian Germann wrote:
> The "broken-turn-around" property is documented in mdio.yaml for any
> MDIO device, but the MDIO core currently parses it only for PHY devices
> in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
> switches, are registered through of_mdiobus_register_device(), where the
> property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
> still treat the turn-around/read failure as an error.
> 
> Parse the property when registering a non-PHY MDIO device and set the
> corresponding bit in phy_ignore_ta_mask before registering the device.

What switch is causing you problems?

I do wounder if the call in fwnode_mdiobus_phy_device_register()
should be hoisted up into of_mdiobus_register_device, were it would be
common for both PHYs and MDIO devices.

       Andrew

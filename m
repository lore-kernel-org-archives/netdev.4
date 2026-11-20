Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147117;
	b=CaImzR4RDnthvt50AJQHSqHbDBPRWKv2vgRZSaxsmrT898PxXqlZGWUTIGhsCOU6iLAC
	 TxuOLHpVkgTE7i8obVPEFIDragX9Oa0hNxHtTdsle3Af/5Vk2vloYN4NmnduVzxXBhs9m
	 42vgh1habyZ20oEFhte+Go3MRLD8Kx+7GgrpsW2XcPJHAmB4wj+yFv31f1gyenE3P/ub3
	 ChpUMTMSwe/0I5odc5SbYq3naTtkv9rzsi89tgv7wPlvaqxY7uCDkhh4eaByaR33mrqRX
	 GngwsUhoozPATiVN4cApXrC5/Vx5nXsxKJR67g5EFtNYU7bGs2ArUrqilRh5mtpJXRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147117;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=aRSne2ZR6D1PEdzPCo5kpv8D00B9QyAdQT5/QElv9HE=;
	b=Wu7d4tAkAWt4AcIrF1Qv6sAx79mevpfXu5QQvGO9o99Lkpw3ngrNeLd8HAlHSR3jMJ74
	 /UK9TrqgFmucPiXWzfGO5gW9+hKwbfekDbz64eJgMDWD4f2V1XcRIa3mGBILKn+sIraUR
	 d52XvQwV60aFRYezTPRUaDWcNCT5i4q09kHCTOQSmq582jgGdJ2p7qGSQjn6Vnor/wH6M
	 vd1gEjUKgqmt72RR4RkeTQmfLzS7pQ/R7awfztFbneu9i4PYP4aFxYRHuFHzqQFVsX++Z
	 jBWG5X/+BLBTCiv2AdZFMB0M3TZ1cT1zCmWLYg5S6EkxaAkbvYCPalSyud1+aFC+zOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=p3KNVpsi;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BEF606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=p3KNVpsi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aRSne2ZR6D1PEdzPCo5kpv8D00B9QyAdQT5/QElv9HE=; b=p3KNVpsiufT6jaI5IHyCv8ZMuV
	wYegiIJW5xpkGc57pI18bHQYUJIh3BGNt12shnAy0vb7NaNAL9QHKSvZIsF3PEZWGdfoPuxv+UGeH
	V5mqi0OR2J06UV/izjmkWG02TtCkLalBQn4+48QHrt4LhZw3G8FhWCvI4wim0RzvW8j4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUFlf-000CCv-8J; Fri, 20 Nov 2026 04:58:31 +0100
Date: Fri, 20 Nov 2026 04:58:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: hix5hd2_gmac: support fixed-link
Message-ID: <2be9a845-d6fa-4b6d-9359-e135d54b33f6@lunn.ch>
References: <20261120031026.1371052-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261120031026.1371052-1-mmyangfl@gmail.com>

On Fri, Nov 20, 2026 at 11:10:23AM +0800, David Yang wrote:
> On Hi3716cv200 hix5hd2_gmac is found directly linked to another MAC
> without PHY. The driver didn't take fixed-link into account and failed
> probe when the node has no phy-handle.
> 
> Add support for fixed-link. A fixed link has no PHY address, yet
> of_mdiobus_register() walks all 32 addresses and prints a warning line
> for every address.

What warning does it give?

> @@ -1189,7 +1189,12 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
>  	priv->bus = bus;
>  
> -	ret = of_mdiobus_register(bus, node);
> +	if (of_phy_is_fixed_link(node)) {
> +		bus->phy_mask = ~0;
> +		ret = mdiobus_register(bus);
> +	} else {
> +		ret = of_mdiobus_register(bus, node);
> +	}

This seems wrong. The MDIO bus has nothing to do with a fixed
link. There is nothing to stop you having devices on the bus, e.g. an
Ethernet switch, while the MAC uses a fixed link.

	Andrew

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025739;
	b=Kf8bI6seXHRN3PxiNw/gV6Y5MbbyIixH8IUX6QaMgyBXWm9d9B0Bq7z1ZsC1uqZQVHza
	 V48GvLRo7slZGI1hNGnH+IxnIqEBBfwropfeG7HXnbzhdDnHyoALxq7G4On7D1eCK6Q1I
	 3e8rCB4cAdJFXytCPg9JPLTi+wL47ShTae32WZ70qN5wsL1BidakgaHPfJhAghFItmWcL
	 CaTtblMrdquHzZiCYD4/hiNx2HobYvOJS9iMvwS22rjRBsRVJx19xN2qG1fwJ706mVYc8
	 kJqEFPEFvSivF07MAFsz5HyMx+3PxX6J5XhRZ7tzVvOKL+dHA135KEg4MNbwNHJlK5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025739;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=78JkHS2zs6HqzMZqLbZp+GLDcokk0DzIQ0KJdR5sBzQ=;
	b=D6aaMmn9XRSsL+fVEBHFry2bObmSDUfAO24OB3LR7bWIek1EnmUO4qZF7uOvePXKEPw4
	 LVMvAfKt61uzgkcXNtYU2B1txtQQqvT2rFKOoQoKBwhZUqy7iyXnzQ5BXbmCHe17bD5La
	 YFfgK9gf/px07UuRKXtVsJO/n9jUvyBTIEvEE8fpOyY7hXLSk/ZKMfMs0MvERO4TmsS3c
	 jzTWWOHWe9lWcZWc62EdLLpV1xMxxjivJ3PawdnnHa5r2Gqt1B2XJ8AJogiIP/MrGf5Wt
	 aemSEb8sxCh+RrfiMijZsWCmO3JxPNnjYq34mc+UzoZcdKgyug+gKH7CnHLg/NCCMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=B0zsrscu;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829A9606A31C;
	Wed, 18 Nov 2026 18:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=B0zsrscu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=78JkHS2zs6HqzMZqLbZp+GLDcokk0DzIQ0KJdR5sBzQ=; b=B0zsrscu2sGHGa18bzveNEdqAr
	AhfD2N0mbS6KJ8MoUwJwA1+aWMlRI3J5QzJYeW/FOAYuO5n82hKi+8jaBWWZXaLhEWLIcTcp9CtlH
	s9Wbm4MTQqSbJU/siKREvVfHumPWGeABUxB8smATR1f+WDoufKZrzUonFRyqWhXxVgUI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTkBr-00HU9O-U9; Wed, 18 Nov 2026 19:15:27 +0100
Date: Wed, 18 Nov 2026 19:15:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: github@bumblecito.com
Cc: Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
Message-ID: <e1584dcf-bb90-4e54-8f97-f52ea3da85dc@lunn.ch>
References: <20261118162323.436219-1-github@bumblecito.com>
 <20261118162323.436219-2-github@bumblecito.com>
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
In-Reply-To: <20261118162323.436219-2-github@bumblecito.com>

On Wed, Nov 18, 2026 at 04:23:22PM +0000, github@bumblecito.com wrote:
> From: Israel Cueto <github@bumblecito.com>
> 
> The ODI DFP-34X-2C3 XPON SFP module supports 2500Base-X.
> 
> Add a quirk to enable 2500Base-X support for this module.
> 
> Tested on a Horaco ZX-SWTGW2C8F switch with an ODI
> DFP-34X-2C3 module. A 2500 Mb/s link was established
> with speed and duplex forced and autonegotiation disabled.

What happens without the quirk? Does it establish a link using
1000baseX?

I'm just trying to ensure this is not going to break anybodies working
system.

	Andrew

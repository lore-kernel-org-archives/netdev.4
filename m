Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554483;
	b=vyb5fT97UT/tXoeUgtBarZjVcBbLu1RloHca5x07JMetSKBB8FYZir+FEUZI5HZb+kKf
	 YrE4mjNehWpA6CNBEuZfgaU/DXPdDWWmuKIvu5hpqNPt5mTKDDowYmuydpCNVXtmP1iYu
	 v481zZVH4cm7f2bunhLxqiPLDyWtanT3Z67juyvm7m81dRo/kmpZdirg4N7A0AxzgVjva
	 2anUtedKRIsnmu331f8xNj7hwUqXCp0U2ceuB0b8K+Q0W22RyxgjWNdYP67zOYWz/xVD/
	 Xw3Pz25fqRqjtEXgNMVIPp2AOHwssuNze1H5rfbJ3GoWoDW7qRhxEN/FoTKkX9Pb7dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554483;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=stmJ501BpvjAccVzRZit0diOdUkKTMI8Pg27qZ0I8/Y=;
	b=TYV24E/XgZZ1AsfAdPzRFx1u3z9tBY7R0RreBXhFXJi4q9RDor2qmSCV+2UHm/3UDwAC
	 ZXpM0+ZP3DzA1dcVLVxYmOcRYRBMstc1kIQHKCwHATWY1YYjXDl3aE0OA8/Cuvmr2GBO9
	 xYkCd0pOEmYDdtJ2V8QhUqL6k5Kyrzr3qxl8fuWta+Q61IiES2fd8okekIBLV4KWiSlnI
	 rWyN7w1HGYjiqEZiC11E2E9oNs9xfLT6C+n9exYxH+TrsehqlrjsXXJGiTddQ77T9M6Oc
	 q/JmxfCFxR4749kCIn2VQ0Obc2ArrgS97z88qw3/u1KfGTFK55NvSZW8TShgeH058yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=1rWphg3B;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8689606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8689606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=1rWphg3B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=stmJ501BpvjAccVzRZit0diOdUkKTMI8Pg27qZ0I8/Y=; b=1rWphg3BlFm//KapY3okvNgmFo
	SvUk+9TRJy12J87jAnL43xRwAoVln32y6gsWNlChsM0RoasKSoNh85DivIggm0ZQn/x9+qnmv1ppp
	pBHYjIjbBQTlYYg86d+NXx16O+aV93LHKcoRri0PEZx0IRcfaD/rIwJY2WeEFRAugy+I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVxjm-001A7T-Jj; Tue, 24 Nov 2026 22:07:38 +0100
Date: Tue, 24 Nov 2026 22:07:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: skyline@mail.ru, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v4] net: phy: marvell: add support for PHY LEDs
 polarity modes
Message-ID: <bbedbdd6-8255-47ae-8411-aaba27214a8a@lunn.ch>
References: <20261124202054.1070702-1-olek2@wp.pl>
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
In-Reply-To: <20261124202054.1070702-1-olek2@wp.pl>

On Tue, Nov 24, 2026 at 07:11:35PM +0100, Aleksander Jan Bajkowski wrote:
> Add the led_polarity_set callback for setting LED polarity. Implement
> this callback for the 88E1116R, 88E1318 and 88E1510 PHYs. This should
> also work on other Marvell PHYs, but I don't have access to the TRM or
> the hardware.
> 
> Tested on Adapteva Paralella board with Marvell 88E1318 PHY.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

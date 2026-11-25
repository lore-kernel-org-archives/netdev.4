Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615128;
	b=FfCLKTAaa6//p/aRdE4G2YApIvddTW3stjd+fC608E7V918SAl2qiFN07pdfFTh8InBf
	 /UAcay/c98dPDj//Ejgrh1Vj/Z9WFMjUaBbXfFbxC8S+a9en8QneDplcso2S4vqrg+MAu
	 pKuCMdWf6UrDnqFhvYEqep3E0J/u1lbIKvu/JTYM2S9R7NbClN3Jg1MzXoZ9KR0ph0aCD
	 cr9FkFgsDry+Z88euA7p843N5/9zTQ/F2gwgu67gdwP4TJSLn+zpfccCocCE0sGe6xraS
	 A3egY79HHenrLxV4JtnBes/0/AzuhoBqLtak+sRspjT1Fibp5DbzqYCLUu//Q1nTLxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615128;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=hzpmqjgO8djp6ij2getWiuhddEa68c9xJpimSoRUQRo=;
	b=O/h/vzTRAF6mDID6osgvIrXx9TvJH/iYdgyWKwIWyAPWA2OFvh+QquA6thAfSMvGm8Mz
	 dWc8+r315w8Wm+3QHs1/80UnFg5KOWrItCs1ZAMTeGg2avRQUWiuwHZVnMqndnTpAVqGy
	 CeK0LTgTx6fl6/UDqRrgAfZoygBIF3eOPN0GZtIplvQn9NXWvTlC5dmLP/i6jag8lccZE
	 EZqhcvb7RqDtal6svsLNMRRdAq9RuaNio879ZQmpO60PJdsKL7NLGNBXSM7RNRCB1UcCt
	 WSJmxhtPWaG+E4DyKualEG/A7dD3p8ad58DvmWlMIAH//zyZaJ9vAU1nQgAK4WVUxEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3McP75jK;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16A9606A32E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F16A9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3McP75jK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hzpmqjgO8djp6ij2getWiuhddEa68c9xJpimSoRUQRo=; b=3McP75jKWCWplH1AEes39Pu9HU
	TWJDaaDCvV6vNgFVMnIY9id/ZJucwdBFVKttt2DedLaJfK+7g6tBgbZrq95y6utWghv4PC7og2ddS
	JhAHMdKluA1R3yQbvn+MeEGjfCOyp37uapR5NuT/amH3eCmh5/+z/H7gtNd3F6mSowt0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWDW4-001KRh-47; Wed, 25 Nov 2026 14:58:32 +0100
Date: Wed, 25 Nov 2026 14:58:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Hans Zhang <18255117159@163.com>
Cc: netdev-bot+sashiko@kernel.org, hkallweit1@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, linux@armlinux.org.uk, netdev@vger.kernel.org
Subject: Re: [PATCH] net: phy: avoid synchronous module request in async
 probe context
Message-ID: <24787f0c-e90e-45f1-a9f3-d0772fbafeaf@lunn.ch>
References: <20261124070753.25972-1-18255117159@163.com>
 <179559227928.3135.10596298102368144827@kernel.org>
 <0437f8be-41ca-4fb8-b775-ed02413ea16d@163.com>
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
In-Reply-To: <0437f8be-41ca-4fb8-b775-ed02413ea16d@163.com>

> The High issue is correct: request_module_nowait() would make the PHY
> module load fire-and-forget and could race with phy_device_register()
> and the MAC's !phydev->drv check. I dropped that approach in v2.
> 
> v2 changes phy_request_driver_module() to return -EPROBE_DEFER when
> current_is_async() is true.

Sorry, i missed your patch. I've not looked at the details yet, but
are you sure you are in a context that can return -EPROBE_DEFER. PHY
drivers don't fit the usual driver model :-(

	Andrew

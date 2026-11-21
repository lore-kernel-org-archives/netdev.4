Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280777;
	b=yGKIB9B+uimLTcGb/X9fjMyOiXXe5qxT3GNlqruTHOtpLcXKaUkj9N5LUlP9mvO8aiPz
	 Nsbn2v2zAs7EjcYXOJwGPNajr94wnBoL7EZRHhUH/2y0zAel1YHJj5f6E+V5AHe2P3WGG
	 DUpD3eGwoSq6kIAJuQ5mSX0xUeXkYzeqQJUcns7EikmdWqduaDTUfZgT4tJGA37s/OlXW
	 KsYn3ScCJ0pC0pkxxk1Hol2o04qAfFNW31aM1znQTmXrc+1C5BsrlTSnHXznSeRwok4rW
	 A9eny9xAdkWNvLRajzr/URGGhIMLi9JUeZ5KvO7nAE+omAFT+D0RtN3RUdQB5/u7IQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280777;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=j3HTDtY2SjfXTVXAZ9+iTSjln9u/IeXUYygv1OTtYNg=;
	b=Gh/Bu6rth3E3JdBFVwstaJlxM8xXbfJF7TNskSoJEhX5KANKEwbThhpU4TSbgkpw28Pe
	 U0Vi2kmsZD9mQeLUDbpVY7BFSHMY5398UeGdEfBfpxB17U1PEiCYX3+6mnuzf4SSwk29I
	 k1rXGJ3gKCTG7Z9Oafrn8XKSnILFOGu2XiCacNz0FnvVdijzWPwFz0tbFeQFMUh5snt6m
	 BHi5qKCib9AN8DffzAYwn3ZmWpaLfgdovzJRN/eXJcSFuVP3hSuMpOW+XE3m6YZERE6+H
	 vxHIuc0fYv33mBs7mGmlKUUC67hzMn19Z3G/wGkgcwAVpYYdfIudmhnTj0e3iZ5zg0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=YS3UJ8go;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C45606A32C;
	Sat, 21 Nov 2026 17:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C45606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=YS3UJ8go
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j3HTDtY2SjfXTVXAZ9+iTSjln9u/IeXUYygv1OTtYNg=; b=YS3UJ8goZoE1yA2BMToX7P6aca
	2treLq4tBA1ufqOFkvhLK2iXhycZOF9o/tk5BJomEdMmsIR9bkesMf1F+cg/kS8AOtGDSc7e1E+QV
	ozu+X3g/7CfbFwF3guGCvLYJa69d8hED+FT1XjWkdqkmpRL1scvDQE5IdGhvd+726wis=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUoXQ-000TAu-IZ; Sat, 21 Nov 2026 18:06:08 +0100
Date: Sat, 21 Nov 2026 18:06:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bastian Germann <bage@debian.org>
Cc: hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	olteanv@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
Message-ID: <40db2715-55cd-46cd-a2fb-8ee11b571911@lunn.ch>
References: <20261121092933.186731-1-bage@debian.org>
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
In-Reply-To: <20261121092933.186731-1-bage@debian.org>

> Parse the property in of_mdiobus_register_phy() and
> of_mdiobus_register_device() instead, so it is handled in one place for
> both PHYs and other MDIO devices, and drop it from
> fwnode_mdiobus_phy_device_register().

This seems odd. "handled in one place", yet you do it in two?

Is there a reason not to do it in __of_mdiobus_parse_phys() ?

   Andrew

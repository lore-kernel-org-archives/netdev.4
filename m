Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212469;
	b=rDQou0sxxWNxkef7x12ZwgJ1nP5tEwP+gbiojUsWzDCfTBS9sLBYVTjT/AAPOtwUnHkE
	 JIGKe3+dOEZxctVUw/UGk5Xffl8Y+u9sQBRBs7QrN8rB6e4kL0+KtronsQgV1mJzrn70U
	 JFA/H7YofTisv7Wk0+VpHpS31OdoVHW9IFG6218xrO/trPg9AENM9tAhJhEhS7uRlRMbg
	 GhJb9viFjNGAteP3z2SfPpuLFrStxxbol0NiIWF/JaRWk5TS3Om/RT2JCT/ELhS9M8OKu
	 G/9J+7XevQ4vNCiqZ/zZSZtavkbfc1/SBxRyTGqwaHVRZe2hMpwoGWXYvu8ZkwuVLhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212469;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=f4QmiUDZ4gx7yE4qy8MJEX6RsGlkm8gKrF4n69bocpk=;
	b=2L1kF8h/nXputH81nkb0I5cVouM2AqZa3LeU4fMFHvuuvgBUdnpDPFiAStzRPbL8KBoC
	 UCKKwpI5E7OsX0xeqpvpR2Mg9I8Y2+TESpQPyEP/Qbb5Q+uhi/PYYRkV1oibTYTad/Q9U
	 wWCY/KDvbsUxa4JWRJ2UUwnyDCg14kN+PNiEz7zLR1UcfgJ7SpJwDeEwJejASuY+tQkzk
	 RqRIDEtL1GhWxN1TLYxeswEnfWfMxTptUjj10IXc1jkwOb19l/GbcHPo5h5SXQDo4E9Z/
	 I7RqpcZH8jsMSPOC++XsrDMWOAROP6tGRNG8Un41ZwX40VbP9gFf1QK5kQHzklXFJlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uXuiJMgE;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD45606A339;
	Fri, 20 Nov 2026 22:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD45606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uXuiJMgE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f4QmiUDZ4gx7yE4qy8MJEX6RsGlkm8gKrF4n69bocpk=; b=uXuiJMgEfLJYDLoHXXzpu/YWwn
	XsRznvpKS8qZsraSH4YXzz7wZ19KvMWC0JOL4d1tKiqoXdGqYey0DZqlcUSmvHDwhOHZd6H6KiCxv
	MSRTrU4/D5DLaNtazXoJW5zyuu7voWAZBb+dh1XKXpljA1dZF/uJDf5dWrP4CeHe126Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUWlW-000Nl0-Qj; Fri, 20 Nov 2026 23:07:30 +0100
Date: Fri, 20 Nov 2026 23:07:30 +0100
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
Message-ID: <bb2edd63-c727-4b91-869a-2b26c0d7521f@lunn.ch>
References: <20261119231319.1256419-1-bage@debian.org>
 <19d8bfb6-074e-4344-acf8-67872f7b3e48@lunn.ch>
 <3dae9a75-52cd-4999-9ed9-b51d87488511@debian.org>
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
In-Reply-To: <3dae9a75-52cd-4999-9ed9-b51d87488511@debian.org>

On Fri, Nov 20, 2026 at 10:40:55PM +0100, Bastian Germann wrote:
> On 11/20/26 01:33, Andrew Lunn wrote:
> > On Fri, Nov 20, 2026 at 12:13:19AM +0100, Bastian Germann wrote:
> > > The "broken-turn-around" property is documented in mdio.yaml for any
> > > MDIO device, but the MDIO core currently parses it only for PHY devices
> > > in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
> > > switches, are registered through of_mdiobus_register_device(), where the
> > > property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
> > > still treat the turn-around/read failure as an error.
> > > 
> > > Parse the property when registering a non-PHY MDIO device and set the
> > > corresponding bit in phy_ignore_ta_mask before registering the device.
> > What switch is causing you problems?
> 
> It is with mv88e6085.
> 
> I have just found that Nathan Rossi sent basically the same patch as
> <20210217044443.1246392-1-nathan@nathanrossi.com>.

[Goes and find the thread]

Are you bit banging as well? Or do you have another MDIO bus
controller?

The point about the mv88e6085 using multiple addresses is valid. How
do you have the mv88e6085 configured?

   Andrew

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615430;
	b=OPtjmCcCc+dwCwhWDyUTom5n7cYKwYk8ZBUHyJUPBjJxY4fi6doMBdjttmb/ejh64xu8
	 RsL5xyNPmws/tfn40LpDrI+xDRyj3Sz6Ii0eEyV7vJg29LcG/jqVZfqJa3rKqyWmi1NK5
	 lPS3NH53ePIFHwBXW67UcFyhbqF/hYKroVwKq8QjAO1I6mWzcNTyI9YyadxGzE4+f2IXk
	 RLAhYPWzYsgukrfIyfk65N5lVJZu/btZo1DW/p5jtoXco39Q6MR5UzeQCyhF+Mi2GeaMB
	 0hbvm4Pj2YF259ZFq7lWBtJ+kofte1wUoAYJ6C08Td15aX/Ik494Opj+l3HpFaLzqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615430;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=o25SHLIsff88Zdsq5RNd9Phr4WPV2HRZoWUsgm8+eks=;
	b=wK/rEx0c2T8LT3kXJJpwM2Xt3jkKZ75xt9HJO0kOc4iJXA8sYydyUqpJsb3Ok20YOJVg
	 bwV9SVrWuS8tYSq2k8vrFgxG144GSXu6ZwvG/imo4KhoITqNn6FRhwEF6Fk+02NLqwcvm
	 WxCzO9BsySkFLf0J7nJscA3OBdIwi8+FM6SBvGSaUAL5jMNlRpzdtreA/kXiSjLZJ/iQ7
	 omSJem/Ss3fvGV9OSsqH6e/M0BR63uRpT9z6VnfwqSPi2hsupEBLJQqJTWMN/LP/3v+Of
	 FdKsWfmFSuAp4B8qVgZAIACjL5N1SEXVr/+2xRTP9I4Hy7T2Z8gKWo89OGA3MoyyP0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lEzpiLd1;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20D606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C20D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lEzpiLd1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=o25SHLIsff88Zdsq5RNd9Phr4WPV2HRZoWUsgm8+eks=; b=lE
	zpiLd1m9Cjebnmm+58sw2Y0inCMeLggdkIdlpDCyYKYYIa6JhvS0b+nLMZlPNPeDORol73vR4yV6+
	W9tLem8VBVsHhiybZa78TBqnxGlAOqbk+WGQjpQsmfKn93rbbMGPNdBol0QhZpuimyo48hYeDVSLI
	v0w+/TYquQPcX+Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWDb7-001KUm-J3; Wed, 25 Nov 2026 15:03:45 +0100
Date: Wed, 25 Nov 2026 15:03:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc: Daniel Pawlik <pawlik.dan@gmail.com>, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	petr.wozniak@gmail.com, maxime.chevallier@bootlin.com, olek2@wp.pl,
	szymon.datko@gmail.com
Subject: Re: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
Message-ID: <ba4ff715-fca7-4c90-ac4c-e44226e1d4d9@lunn.ch>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
 <20261121091235.1447291-3-pawlik.dan@gmail.com>
 <awWkbH3O8IrMYiSF@solitude>
 <20c5e53b-e2f5-45c2-9d64-d279cb884870@lunn.ch>
 <CALC2AphzUqBjgx+JqLTQU8=EizXoR+EKTJjakjKbP29exNNH0g@mail.gmail.com>
 <awalC0J9fjVgVLdk@solitude>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awalC0J9fjVgVLdk@solitude>

On Wed, Nov 25, 2026 at 10:08:11AM +0100, Marek Behún wrote:
> On Tue, Nov 24, 2026 at 06:56:38PM +0100, Daniel Pawlik wrote:
> > On Tue, Nov 24, 2026, Marek Behún wrote:
> > > It would be much better to somehow check for RollBall protocol.
> > 
> > Agreed, that is nicer than matching revisions - it covers every
> > bridge-less variant without a list. Two problems with the snippet as
> > written, though:
> > 
> > - i2c_mii_read_rollball() maps a poll timeout to 0xffff, so
> >   mdiobus_c45_read() never returns -ETIMEDOUT here.
> > - Returning 0 skips the PHY probe retry loop, so a genuine module
> >   whose bridge is still booting at the first read would lose its PHY
> >   for good. That is what got 8fe125892f40 reverted in b521003c27eb.
> > 
> > What about this instead (with Andrew's MDIO_MMD_PMAPMD/MDIO_CTRL1):
> > 
> >     case MDIO_I2C_ROLLBALL:
> >         /* mdio-i2c reports a RollBall command timeout as 0xffff,
> >          * both for a bridge that is still booting and for a module
> >          * without a bridge. Retry after one cheap read instead of a
> >          * full PHY probe, which times out on every register under
> >          * rtnl_lock.
> >          */
> >         err = mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLBALL,
> >                                MDIO_MMD_PMAPMD, MDIO_CTRL1);
> >         if (err == 0xffff)
> >             return -ENODEV;
> 
> Hmmm. It is possible that some RollBall modules contain a PHY that,
> even after booted, will contain the value 0xffff in the
> MDIO_MMD_PMAPMD.MDIO_CTRL1 register.
> 
> Maybe instead we should read some other register, like PHY ID?

I was wondering about that. It is probably a theoretical problem, but
the ID register is safer. If the upper ID register returns 0xffff
because the ID really is 0xffff, it would be an SFP vendor which has
messed up even more than the usual mess up for an SFP vendor.

       Andrew

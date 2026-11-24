Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541923;
	b=iuax8FzHtoSYouMIbgEWP8EbZGwJmQrFY7+OA4fot1mcA7x0nVK0SO4n5/Op+bTKl7KV
	 iz0jVoa9olQmG0X8fmvyg/YJVdF1teW33qAY/LQ2LHhMGcT3u7VUkSUsZQInaEZPJs8ym
	 DPJWlCAUbrTYf9iddGTT1nb1BvVRdpVqxzisBiTK7SkxkDc6NYbDI20IayiLQG7PxQx1o
	 TkxfQ3UJgadoIZ1Mk9nka1NzBojpHAuJzsGfLavHAJdba86eydcu80zGLNFHwxXY7GcR5
	 qxUZMEdItl4vwUH9nRcfBI/EyPwc1KJZcrfOmab6xZRu7EmDce8D1iLVjvOLQjSev3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541923;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=6WwJDHFygd5ftwbeZAz2XNs8Gwlb6OfvoqrNAQm9r2E=;
	b=DRzE6bZzLSA45wBNcbq3In65ucj+2NrdBBzUAKJBu4CtIug1QKFflJO4wY/foCO4E1y9
	 9l9Zg6n0XxwPE8be02z0mEMYNV3Yyd18VhTwWeIROJi4NGo8uOT8ADiKGqaw2wet+K2W1
	 reOzipTdjsbwfky3jLBlf1xUCNkCFzoe4bfLaDtFcRzIe+u4Gmue1ErOYqdiOd0XEbEZ6
	 W/8KJXvX9tRBMzpNimF6XoFmRNspyj76+9ll0L3yNIuLGXSkSJBege2YMJEcWeAXW24a6
	 ShN2pvowRhD2dehu46AQNGTJ6xyql9ZJV5Nb42+N9+eAhhppCZo401Sn678MAFZB2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=nb7MbL4q;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE9606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=nb7MbL4q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=6WwJDHFygd5ftwbeZAz2XNs8Gwlb6OfvoqrNAQm9r2E=; b=nb
	7MbL4q/bhb6dZYWqDW/sAbKOEUonRZmqmDsYqhmGH37h7MAdyQX/XKjMYrtIO/+WRq/MIcM9ei4Oa
	OgatumPbDclDmAu671GVYHOMfoBvmP9ZRXbv+GsCHUpxMBnvd/5rM9ECZeCCy4+387PTQwFxbtoyZ
	gHEVmuK7UV+rE+8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVuTX-0017LD-KL; Tue, 24 Nov 2026 18:38:39 +0100
Date: Tue, 24 Nov 2026 18:38:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Daniel Pawlik <pawlik.dan@gmail.com>, hkallweit1@gmail.com,
	linux@armlinux.org.uk, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	petr.wozniak@gmail.com, maxime.chevallier@bootlin.com, olek2@wp.pl
Subject: Re: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
Message-ID: <20c5e53b-e2f5-45c2-9d64-d279cb884870@lunn.ch>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
 <20261121091235.1447291-3-pawlik.dan@gmail.com>
 <awWkbH3O8IrMYiSF@solitude>
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
In-Reply-To: <awWkbH3O8IrMYiSF@solitude>

On Tue, Nov 24, 2026 at 04:09:21PM +0100, Marek Behún wrote:
> It would be much better to somehow check for RollBall protocol.
> 
> For example by trying one mdio read before probing PHY in
> sfp_sm_probe_for_phy():
> 
> 	case MDIO_I2C_ROLLBALL:
> 		err = sfp_sm_probe_phy(sfp, SFP_PHY_ADDR_ROLLBALL, true);
> 		break;
> 
> change to:
> 
> 	case MDIO_I2C_ROLLBALL:
> 		err = mdiobus_c45_read(sfp->i2c_mii, SFP_PHY_ADDR_ROLLBALL, 1, 0);

nitpick: MDIO_MMD_PMAPMD, MDIO_CTRL1

	Andrew

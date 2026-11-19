Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094632;
	b=l4LXBAXL/3rH4MSZEhV6f0ylu5MBPMoqu109nw6RHCGt4L6IpwGnDoH94SN6sWmcY3aR
	 CDJX4wsyctARf6pdwCl7wpbXuc6mXJj/fAiP6iE7qbMXWXBnUNuBvAg7Y9I5zi6o0XTCs
	 vmXbzcZrdXBFdy9Qx1lGYr8CLA+vOlOd/ZYlLKsn9+kwB88aQH5Xp9l6+UuZMRIFW8z4Y
	 pweaoL4/ad1hVd2tb+5nPPmZd76CNN38wlDYTFkOtZA2kdeDX6vGs3DbJ7Dsf0e7Klk02
	 qfe/YWZHCaa1OuDXpubuy1JjxgTQ8zQpKYDng9kyZoZMHFSdQjahytvUbwbAeN2DjGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094632;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=s2+EYN3sHV8P8LXqUrZ7kjnHvhCP958pbz5KmfU2vD8=;
	b=NMb89g8SFeKy8Olo2E10q83fxIA1o3QJ7EsXbV343mB3zAFYwxPyJFL0B5pZ+plujXi6
	 JK4dw7p8ob5yc0qFtF3SBNMyJwtigcW83Exu4ikBOPFnE4e7Xzi5Bnk7cvy6vKV9u5EpG
	 xwwvQFZeetO0NU+J1ZkuufMgjMBuDEa1hglkkLzuavIiTm41wyjEXdvHW4TjC7A0+2d48
	 FvFNHGhpObE071iZnbTLqx+p09UvAsE/6AEIHqPVaoY1H5RbZsI/2SdxU0Dp7biJ224QU
	 i7kAh83oaVV6GD5frI/QDieU6bLM62Fn6Wr0fv4Jhd3rEC7RBjAxyh8qkBYEnzVHzKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Qo3ivrTk;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF69606A320;
	Thu, 19 Nov 2026 13:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF69606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Qo3ivrTk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=s2+EYN3sHV8P8LXqUrZ7kjnHvhCP958pbz5KmfU2vD8=; b=Qo3ivrTkacjLjqNCO1bTwzJ/HJ
	wn+By5ghNC4evcpzV74ukvBuckxGYwHxmI+aLzmPyU+R4wFGW5xRcc5Feh2AqUVb9YaDpbRBoFj6k
	94OMDXbbTL7VnSIMnqtKv4JkYOMST4bUR6gb3GjqqXyRDQ8l1j+awxneBoXczyfWm5OU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU26z-0002Ml-AJ; Thu, 19 Nov 2026 14:23:37 +0100
Date: Thu, 19 Nov 2026 14:23:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kimberly Morris <gy770616@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Subject: Re: [PATCH net 1/2] net: phy: restore timestamping state on probe
 failure
Message-ID: <c1075f39-c0b2-44cd-9338-b3506419f685@lunn.ch>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
 <CAD-64Dfm-2U=1f3b7y3K-B3q_mijQ0xypqUEDt7o+q7Tmxx_hw@mail.gmail.com>
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
In-Reply-To: <CAD-64Dfm-2U=1f3b7y3K-B3q_mijQ0xypqUEDt7o+q7Tmxx_hw@mail.gmail.com>

On Wed, Nov 18, 2026 at 05:34:05AM -0500, Kimberly Morris wrote:
> A PHY driver can install a devm-backed mii_timestamper and select it as
> the default before its probe sequence has completed. If a later probe
> step fails, the driver core releases the driver's devres, but the
> phy_device retains both timestamping fields.
> 
> If the generic PHY driver later attaches, skb_defer_rx_timestamp() can
> dereference the freed mii_timestamper. This also affects non-PTP packets
> because the receive path tests hwtstamp_set before classifying the
> packet.

This is very theoretical. It means root has unloaded the device
specific driver leaving just genphy. Very unlikely.

> Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some
> Broadcom PHYs.")
> Cc: stable@vger.kernel.org

Since this never happens, it bothers nobody, net-next.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -3812,8 +3812,10 @@ EXPORT_SYMBOL_GPL(fwnode_get_phy_node);
>  static int phy_probe(struct device *dev)
>  {
>  	struct phy_device *phydev = to_phy_device(dev);
> +	struct mii_timestamper *mii_ts = phydev->mii_ts;
>  	struct device_driver *drv = phydev->mdio.dev.driver;
>  	struct phy_driver *phydrv = to_phy_driver(drv);
> +	bool default_timestamp = phydev->default_timestamp;
>  	int err = 0;
> 
>  	phydev->drv = phydrv;
> @@ -3951,6 +3953,9 @@ static int phy_probe(struct device *dev)
>  		phydev->drv->remove(phydev);
> 
>  out_reset:
> +	phydev->mii_ts = mii_ts;
> +	phydev->default_timestamp = default_timestamp;
> +

The basic fix is wrong. If probe fails, everything done so far should
be undone. When probe is entered, there is no stamper. If probe exists
with an error, there should be no stamper.

     Andrew

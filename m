Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017814;
	b=F0xQoLs1jKub/FE9a2Kc5cOv6yq4kuZsBH8n7bKlvq2f388tE4AjZSqz/vH+VF2almuB
	 QKxHNAPQ57b9P36uyXZTVvG5kRBsj38Y5IhzS+HcsdZJ45r8raGZPh1wGWy56V7FgZ3+5
	 raj/srXGAw5gNB5ohoBgemffSvqT92wWfZCgoYnhLEt5bKCqn/Krdkre3iYs3ej5oFbM1
	 1gPAZ20gnD2SaHQ3cBJUDFCuiqyx74ERUGAFG44LUBJsmiUM6nQIw3g9DFPYmnkAMKOcP
	 FRqkeW9UHlCthsQaws2lmS0X8gUr4dJFLfrx3UPmAEpEbJopjacRF4oBuRKRNpkRHxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017814;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FVekkBtlN14yfpnYE0c8U7gC2/EZm89fFpxS1+76H2c=;
	b=S2fQFS6WRyUjS8uzItSo89Yc7oMFuBUjCMu3oE9lNkFQZ33vD5Un9J7Llp0i71vSuD/V
	 tQ+wOUP6mdCpLVntEGORrNzZAo9H3ApWu7lMx1nUqHojkPJx/88g3xZhhOTWy4G7/kna3
	 j02hkIWJDud6qGEhA+ryeP/4yVRmalp4das0BJ25O/vv73Rs3ntOEi6fMliJ/n+Qgeads
	 bnJK9JxR6wlJgi/Oun1i8xC8x2q+PL/a4HeE7d21nhiv0db6MUoSSlgKpep2IeJO7Nmoz
	 rdHr5trzgrWNlxRYbYBl8LUOI95MIpsRJs1BUzJonNtuC66fgTFMbSftMxPx5z5kCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLV9N1FM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F7606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLV9N1FM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9D41F000C6;
	Wed, 18 Nov 2026 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017814;
	bh=FVekkBtlN14yfpnYE0c8U7gC2/EZm89fFpxS1+76H2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aLV9N1FMbm0NA2MyQqwkX5S+yw4OaDc5hU+lXNAGHPFs3DBUjNMCF3e1vHxOeFj9m
	 i2/92/ruOsBEIdjJYIMVtAm8/PZfFkVNVSxh7mFPjn3gzS3TNLDZcJJ8PxsDm4nVgC
	 QAfdHAsq81J06fy7aWhZesL1+x0Ldv7kQfiF/yMsP7oLtZ7Mh5YG1mwLrM0/Up34Ps
	 6KQEr8chVKO2TETQtPu4nicQu7q2s2ruCb0PJ7f3PFaa1r2AC96BkRlTKDF6as/bvf
	 m2y5XXUthe4a2A3+1fZ0y1hbv48fMIJr0uWFYzUm0JfMH1u5ZHv3QRzjapOT1uY34v
	 ufTi/GUxAOsEw==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTi8B-00000004ewV-2aoJ;
	Wed, 18 Nov 2026 17:03:31 +0100
Date: Wed, 18 Nov 2026 17:03:31 +0100
From: Johan Hovold <johan@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fujita.tomonori@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, hfdevel@gmx.net
Subject: Re: [PATCH net-next v2 1/2] net: tn40xx: avoid early firmware node
 release
Message-ID: <av3MU5Edsk7kLY2b@hovoldconsulting.com>
References: <20261116091149.730586-1-johan@kernel.org>
 <20261116091149.730586-2-johan@kernel.org>
 <20261118.195534.1289241641818592530.tomo@flapping.org>
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
In-Reply-To: <20261118.195534.1289241641818592530.tomo@flapping.org>

On Wed, Nov 18, 2026 at 07:55:34PM +0900, FUJITA Tomonori wrote:
> On Mon, 16 Nov 2026 10:11:48 +0100
> Johan Hovold <johan@kernel.org> wrote:
> 
> > Note that __mdiobus_register() will essentially only return early
> > without taking the reference during development when the bus structure
> > has not been properly initialised. And currently, not even that would
> > lead to a use-after-free as the child PHY node holds a reference to the
> > parent MDIO node, the child is deregistered before the parent, and
> > software_node_unregister() returns early if the parent node has already
> > been freed.
> 
> [...]
> 
> > --- a/drivers/net/ethernet/tehuti/tn40_mdio.c
> > +++ b/drivers/net/ethernet/tehuti/tn40_mdio.c
> > @@ -157,7 +157,12 @@ void tn40_swnodes_cleanup(struct tn40_priv *priv)
> >  {
> >  	/* cleanup of swnodes is only needed for AQR105-based cards */
> >  	if (priv->pdev->device == PCI_DEVICE_ID_TEHUTI_TN9510) {
> > -		fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
> > +		/*
> > +		 * drop any reference taken by __mdiobus_register() before
> > +		 * device_remove_software_node() clears the fwnode pointer
> > +		 */
> > +		if (priv->mdio->state != MDIOBUS_ALLOCATED)
> > +			fwnode_handle_put(dev_fwnode(&priv->mdio->dev));
> 
> mdio->state is internal to the MDIO core. I don't think drivers should
> look at it.

Some are, including this driver (if only for an error message).

I agree that they probably should not, but this highlights the existing
problem with the driver further.
 
> Also, 2/2 removes this code. The put is unbalanced when mdio bus
> registration bails out before taking the reference, but it does no
> real harm, as you explain in the commit message.

But that's mostly by chance. The whole thing is quite fragile.
 
> So I think we can drop this patch and fix the problem with 2/2 only.
> The explanation in this commit message could go into the 2/2 commit
> message.

Sure, I'll squash them.

Johan

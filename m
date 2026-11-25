Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625896;
	b=uGtznr9Vy+hEbiPS6Zf1EAEtKdsRuWjOmhVBiAbfNzO/zJpnKXrmKxwPd0IKm2u9WEII
	 9bLB24+YAM+pvQy10PYOG5scThEKQCSFG3uA5snMWrC+LRXQ632cHxG5muBu1tfnfLZXn
	 3uCUpN4mpwZt4xZ6Dp0fjFLrDMYl950QTurco5Fs+xKjm64pk8RjbNjljaIdUkjITNoD/
	 eOrqArYWYC834a3n+aUaXCUBtZLBhJe9Mu3+bk0zChEQYs+852ZuNx2GCA3FE8rQb58Tm
	 STIglGwew52S5TBIYagr+kaOrYsIyUYTHuT58BdoaxLrO1VoJnlAmfqoLLDCFEOS4yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625896;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uDRWcpZg2CqulO1lgiRq6c/h5UgiC59pHJr6BNxdVbc=;
	b=dDaU/pt45D96Jr0nuiDJ3BuCGa5jsR//a+1AQTJbFGfewDO/MSsPyaJJ0rcxKxsbLJoO
	 04RGm9i+HlfJqOoBxcQOSkBYp38PSkhq58PUGEk+LuTMBeXyMY3ZErQa55oc9CjDyYfxL
	 cmPFRMH2BojpGCGbjzpTjUrZmxQFYSqReLscGrdi1Eoip0vDKlBJ7hqyeOpHFd+mB/JUL
	 airCj2WRbrYXeEfFaCk7mMVL0WlYHNs6Hei5Z3s9qh4mVqefjj+ejJA3Wx91j2GC7NW2t
	 ZZT/tG0NlfjSdunkn6uqFK4HWtF6G+P6Ie9T+1yjNqB7W3mkazAgGWyu6lw9qoB2GOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Wp4E2zWH;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F86606A680
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F86606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Wp4E2zWH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uDRWcpZg2CqulO1lgiRq6c/h5UgiC59pHJr6BNxdVbc=; b=Wp4E2zWHIzC0X7KIxaQPXB0VSz
	ajEztKhwhjbHtD2aeHYdNwIhuLKAmEfKbZaeDNpQfNQ7oLnYK+5qDQvqB4ULlFaKop9jzyODIs346
	NHQMdZXsDVQ5ehY/xR/bNkQnqaa5g8aTden08+yWXaeB+J7pw9IkeMzFIZiKlf/b5S20=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWGJj-001NH7-3W; Wed, 25 Nov 2026 17:57:59 +0100
Date: Wed, 25 Nov 2026 17:57:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, hfdevel@gmx.net,
	johan@kernel.org, netdev@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH net] net: tn40xx: terminate the PHY software node
 property array
Message-ID: <871628b2-f8c3-4181-885e-ac42c8a3b40d@lunn.ch>
References: <20261124072646.3438910-1-tomo@flapping.org>
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
In-Reply-To: <20261124072646.3438910-1-tomo@flapping.org>

On Tue, Nov 24, 2026 at 04:26:46PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> The PHY software node uses phy_props[] as its property array. The array
> has three entries and no empty entry at the end. Property lookups walk
> the array until they find an entry with a NULL name, so they read past
> the end of phy_props[].
> 
> This happens on every probe of a TN9510 card. When the AQR105 PHY is
> registered, mdio_device_register_reset() looks up "reset-gpios" and
> "reset-assert-us", and the PHY node has neither of them.
> 
> On 32-bit kernels, the walk reads napi.weight in struct tn40_priv as a
> name pointer. napi.weight is 64 at this point, so strcmp()
> dereferences address 0x40 and the kernel crashes.
> 
> On 64-bit kernels, there is no crash only because of the struct
> layout: the NULL entry at the end of group[] happens to be at the
> offset of a name field, so the walk stops there.
> 
> All the properties are constant. Define them in a static const array
> with an empty entry at the end, which is the usual way to define
> software node properties.
> 
> Found by code inspection. The 32-bit crash was reproduced in QEMU with
> a test module that sets up the software nodes in struct tn40_priv in
> the same way as the driver. The fix was tested on a TN9510 card on
> x86_64.

The same problem was fixed in the txgbe driver in April.

If you have time, could you look over all ethernet drivers and see if
there are any more drivers with this problem. I don't think there are,
it is pretty unusual to do this, but i don't know every driver...

> Fixes: 25b6a6d29d40 ("net: tn40xx: create swnode for mdio and aqr105 phy and add to mdiobus")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703751;
	b=VLc9TQV9jMRob2sxFPdLH0ZO5jxmU+1BDmsFj0PcP/ajisBcbrv1B8YpIStjvFQChx7f
	 OhmLMpIn8tHsf0SFHcOUnHrQyjY4nWQGskOKxdSXdpmAkKzFUHBuDndo+FRZqNgrW8bjp
	 1/Dl8DX04LoNUZuz3WarqkKLRMnxoIrFbz6ms4oXkObU2ItumycBiD1DU+7hWBdBimuUW
	 MPsZ88Rmaii6wqEMGUi9zhV8ZlB4GOTYFftbPG4vmr9KW2sJyQQ465r9UeEkH089ouxdQ
	 u0TiGENP1GLWZJWOc7G7eVHLB0jtb1ouhBLTfxGADMDiISl9+W4ej77klIg7UUOk35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703751;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=R08AuLohZ3b0Qwcu7uzGKxtTnAp1WS86EeNomaGnUCU=;
	b=y/HidxQulVzQQWRBac69dlFLLlX61DdwvGP2xXNnCC1b0zgYUkH9vxitZN7ZGmcl1LqE
	 /hGJ3RuMN7XRYuJ457cCT3FPHx1p8pg6cFwNyC0V0cb/9OLWNuemd4mZNu+akVTNUxV26
	 7Pl4XPvC95rI5PCVtXs69Z/1HihPoGxawjGbL/PFfr4b1/dIBBSXF6I4oIYBg7fiokR7J
	 KaOIht2okkeIUVxffw2RkmutSHDKM1aP03ad9+MH3yweHEnd9IJz5OmEMnV5WyO47G9uI
	 x8FrCH7M+BDy3thrNmdEYcdEp+jk16OUVK2iCylVEd4l9JsCSstrAC8IvY/ZS4MeH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ycSSaaRO;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC5606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10AC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ycSSaaRO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R08AuLohZ3b0Qwcu7uzGKxtTnAp1WS86EeNomaGnUCU=; b=ycSSaaRO3NfW8jZkqMd9bSorG1
	/Ve3G2HwaH2g/bLk2Y8bZ6pajQeDC4rU//b9LtTJIqbSIsqtf8vxRZOiJefFXlR109fVnLNTbgOh5
	oRPgTxXmhHx1EqY9YgecLOuLXfv3NaBdd3OjpZuJXf/R5dFb8un74Tk6cRWTjH8w0FDw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWaZS-001aOX-Cq; Thu, 26 Nov 2026 15:35:34 +0100
Date: Thu, 26 Nov 2026 15:35:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Hans Zhang <18255117159@163.com>
Cc: netdev-bot+sashiko@kernel.org, hkallweit1@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, linux@armlinux.org.uk, netdev@vger.kernel.org
Subject: Re: [PATCH] net: phy: avoid synchronous module request in async
 probe context
Message-ID: <04208d88-5611-4b08-b4a3-4030d75fa946@lunn.ch>
References: <20261124070753.25972-1-18255117159@163.com>
 <179559227928.3135.10596298102368144827@kernel.org>
 <0437f8be-41ca-4fb8-b775-ed02413ea16d@163.com>
 <24787f0c-e90e-45f1-a9f3-d0772fbafeaf@lunn.ch>
 <c1ee530d-21bc-4b50-881f-3be9b2654b9d@163.com>
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
In-Reply-To: <c1ee530d-21bc-4b50-881f-3be9b2654b9d@163.com>

> For v3 I'm considering moving the check to __mdiobus_register() itself,
> returning -EPROBE_DEFER before the scan when current_is_async() is true.

Maybe. This code is tricky. There are quiet a lot of comments
explaining the issues, which the LLM quoted. You should look at the
comments, and what the LLM said, and think about all the corner cases
you can think of. 

> __mdiobus_register() already returns -EPROBE_DEFER for the reset-GPIO
> case, and the deferred-probe retry runs on a normal workqueue where
> current_is_async() is false, so the synchronous request_module() is safe
> again. Direct get_phy_device() callers would not be affected.

This does seem like it could work. However, i'm considering the risks.
Are there MAC drivers which don't correctly handle EPROBE_DEFER from
the mdiobus_register variants?

Such a change would solve it for all MAC drives which probe
async. However, i think there is a less risky option:

		.probe_type = PROBE_FORCE_SYNCHRONOUS,

for this one MAC driver.

That is also probably faster. The MAC driver has often done a lot of
work setting stuff up before it calls mdiobus_register(), which it
then needs to undo, and do again later. I assume
PROBE_FORCE_SYNCHRONOUS will completely avoid that, the probe happens
later in synchronous context, and avoids all this.

If we see more MAC drivers having this problem, we can then consider
your general solution.

     Andrew

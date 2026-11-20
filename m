Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179173;
	b=YmEbkIVJtu2aPASCVByfrmqhBQet+/b+PE7OlSNya98WFY29kETLvDQAXIhXLc+/gGo/
	 avu43x/GirSJ2edacvd5SVLFDg6D5fuSQ6sEkBrl99IlztAiB3U3u8gGWqzz9IopRNB64
	 4dpGdX1vjGYpja/RdtZ2zT2Uw8q81cbzmpdN9/4E/tv443uHdq7WprWnFByt07BqHKFIL
	 L7dhl2dyVRy1bGkFGbvFVjV3X62oGgUwZ+tQbSsU00wo2sp2vNff3s+CI6jo/AVbKXDs8
	 0qBaUTpw+OkC2vDRZE/SXOgCf7rxM5ullSgDLmPXm6PlzTUt3hUeQ0vrUrLOdf30+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179173;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OdUniBRWnOJY1JrXtFvqGTLt+MNbFt3JGeFWjR/p7+o=;
	b=T6tGcjkltmPS6u7NDAOHv3Tck+VtgmrS/qwZp02oJeK6xSwBIjHyG0qC3BqZuthMoG+B
	 lLm8tVygWBTbOE8Dzt6yJfnl9CIkOTD1X7tJ6a6efYsGz+USYKOyLXCJu/O546qdALqV/
	 t0DhaC81w3heZ3oEYj33R/9GXmD0NNJcwBJauOF57zDh812TKWBasnc8eStLb3wogTlcR
	 OXSW3yWRqV6M0ImFZfYsWmM07+gVt322vfsp/uenAQB+P7+gw5QOGuMew5QVwUt2SJBEi
	 yeyhUXPDuRU31JYMUTRdHxgyP+ycFd3ypgqTAdcKyOjtiJR9dVFwhaajn7UY1uKtByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=jKMc3MHT;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1D606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=jKMc3MHT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OdUniBRWnOJY1JrXtFvqGTLt+MNbFt3JGeFWjR/p7+o=; b=jKMc3MHT4A6U6eW558DoO60BSI
	ELOzVl2TN7VfYcjhIlrH2/ScwQ5f6KC1j4r3wcipaZ9Lj4Eh/Ztticg/gOB7dTtEoA3pe2y0V3wgT
	Mf0VPU45jhMOCVRJ6QWTzKbjyVJ/X90LpCd7NbVVGKJ+DGape9owESOWw4TTPLqOtAKg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUO6g-000I9X-Cx; Fri, 20 Nov 2026 13:52:46 +0100
Date: Fri, 20 Nov 2026 13:52:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	kabel@kernel.org, petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com, olek2@wp.pl
Subject: Re: [PATCH net-next v3 1/2] net: sfp: move sfp_strlen() above the
 quirk fixups
Message-ID: <4e624c53-8f1d-4ed2-85f9-db0a30107ddb@lunn.ch>
References: <20261120063756.3677554-1-pawlik.dan@gmail.com>
 <20261120063756.3677554-2-pawlik.dan@gmail.com>
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
In-Reply-To: <20261120063756.3677554-2-pawlik.dan@gmail.com>

On Fri, Nov 20, 2026 at 07:37:55AM +0100, Daniel Pawlik wrote:
> sfp_strlen() is defined after the quirk table, so the fixups that the
> table references cannot use it. Move it above the fixups so that the
> next patch can match a vendor revision with the same space and NUL
> padding rules as the vendor name and part number matching.
> 
> No functional change.
> 
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

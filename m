Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101806;
	b=yAq2JdfMC3qZzsaVfXn27ZBrjOm6R/W9anMmn+spu/lqRPSOzQJt2s2H/5DAtRTg6nZd
	 H/uSsMO3fEEncRgUoyYEViQa6e/fMAKWOZsdjaYaBQ4AvBT0k2tgMwqpfJAiiZmlgirGN
	 TGIcYFEotDCUXZZLBswXq7YxjcAywDvKSP0sODic/Cl5RT7SC8JiZcl7hExyZ2xbL7B+x
	 8VdvRF9lh7hBX4w+4lOdEDdjZSN8oVhSv6RnBnT0W84PTqYIVGzwMwJe9abADUK/xUsxa
	 /W4Mn900Ba4NIULAhOvBgMbi/2HmUKEV6X0c4D9/CTBNZS3D/vkEXxN3jAbB8tmC6Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101806;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YIzSyzaItZhIffQi2QtIvlrKu5BS3YVep8+7TkvwtmM=;
	b=anw26u1FbLp/4wBpkSWfczDPjUPeMVX7FTgkT3LMiQvK1UjS/j18eMKLsynnqgQyQb9b
	 GrYxDotySPjjf2395upwOBanA7GRSbfcV6TA5+EUu08cB6qL40ULREfgVkMsp866ZonJB
	 mzat1NJp3/VhlyPos9IG4qE3/KdkI9UcM1tyN2IpARbdGccJKYzccxeoPoNZyKDisEjh8
	 HUnuhBgARryyaf6PXhWiWlG3Dw68xDL2TeNswh9Abe9T0lJGIZUY85heWBqXGxB5QjbUP
	 TwZOtTrx8dSMQGb2vuSwS3SONQjv/cot4oBPFt+fx4DQAp6VteldMutnZKnmVGlVuDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=CPf7m+Xx;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4857E606A320;
	Thu, 19 Nov 2026 15:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4857E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=CPf7m+Xx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YIzSyzaItZhIffQi2QtIvlrKu5BS3YVep8+7TkvwtmM=; b=CPf7m+XxC2aOPWBIbZ1FZwojES
	KHOEmvXm7b4dxoNstIe6Pejopqwj5qDRYIxozdI041E02LMoUyQLqBRZF75tfjtg+xl0f4alFDQ5I
	CoWGLaGUHVw3f+hGZPhiEk4q9mVZoATtzVehwoMZHYBHkDLIl3nbRFynVXj4PDrYHGaQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU3yg-0004Dh-Qt; Thu, 19 Nov 2026 16:23:10 +0100
Date: Thu, 19 Nov 2026 16:23:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH net] net: phy: micrel: Fix potential shared PHC
 use-after-free
Message-ID: <ed84f6b1-4bed-4328-9278-02bbde45ca23@lunn.ch>
References: <20261107-0d0c29e10a-net-micrel-lan8814-1@mail.sdu.edu.cn>
 <71089325-dfab-45f7-9ebd-1feb65013863@lunn.ch>
 <AHAASAAGLPGJfVjn9skPJKoS.3.1794229559658.Hmail.202321181@mail.sdu.edu.cn>
 <198e6702-0663-4183-9aaf-0fa4082dbf79@lunn.ch>
 <ANsAuAAOLLS4OaDq0elM1KrN.3.1795091965243.Hmail.202321181@mail.sdu.edu.cn>
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
In-Reply-To: <ANsAuAAOLLS4OaDq0elM1KrN.3.1795091965243.Hmail.202321181@mail.sdu.edu.cn>

> On LAN8814, if the registering PHY unbinds first, the other ports would
> lose access to the PHC. Is that the behaviour you'd expect?

No, as i keep saying, i expect remove to be the opposite of probe. The
first PHY probed sets up the PHC. What is the opposite of that? The
last PHY removed releases the PHC.

     Andrew

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702138;
	b=IPb3ukzSxcWix6f+NfDPjafVP0dRo8cc8DOh3PPJ6pRyU01HdHOM0CzVSrK5urAWYikO
	 dJrDuG2iReCtfWUkJ5zvC6s4NyW5nlMamGYqIcLx66Pi+oTBZu0x+LrfvSNBsHIH8mLZm
	 k8L6tFtednNUZT2HWDIeQA5+9djFN1hQGGqTGB6nu20zlNJRQiV3ai805F7V7p+Vhs1BC
	 cFwlBK3KzzOXEAwKpd2l4EOB5jrfETnTHF73kMYO9270/tNcAunBsmHv7iO8JQXz4+OBL
	 Bfy+mhYC0elJu9OwaMyzYQrZVAZjjYENokVZVZWNJ8sUq33Uy859zCx+txzgxwxSMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702138;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=TUA/de/8tz3WmVQPWnPMRP3yO7EGZx+XrPpX979X+nE=;
	b=eQ3uimgqiBs4RtMujNt0ZwxTdcXuj6sQBEhdTGQgOlZrcgu2eYsU2ApTdcLajQageNit
	 SLLzmdUM6nk8/cGE3Shnoiuee7xvQpC2PdW4l6KQ65QRr2nshaFDINTv9TLP8IOObLgGC
	 6vLemuof/U4BTd6Kg2BCjXnP0uBh7EE9wQYEo3nVKK8Rno74PUKjVZvvEBW5W1e9lTjte
	 3/Qq+waPo+9KdfxZFy6bTBS36hdKXjEJfIdcB+cM5Wp8l1Wd5nI6+nugk7RFFaZaHXA4w
	 w60sc0hhhZG2686ej8177h3NTKdUBpmQlDBucHNyg9en9JMF4H4uuhSjVmFRWxsrO8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=51YPufO0;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13116606A332;
	Thu, 26 Nov 2026 14:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13116606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=51YPufO0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TUA/de/8tz3WmVQPWnPMRP3yO7EGZx+XrPpX979X+nE=; b=51YPufO0GdIZLQONtt46gHWDru
	XxKLMBb6zfve54jSE/l3CCQrWD6INKcZiXZiB+V7eURznO7lxLHQN+sWcKX7gRAEu12j67GWzBi/s
	yjIQ+L0F6RqB9v5ERGZi3qXxZNuL5Vt7lq3Ii3WeGbLBjDQss0uIeCHrPsLigBqzzmlE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWa99-001ZzX-7d; Thu, 26 Nov 2026 15:08:23 +0100
Date: Thu, 26 Nov 2026 15:08:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Javen <javen_xu@realsil.com.cn>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"nb@tipi-net.de" <nb@tipi-net.de>,
	"maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v4 3/3] net: phy: realtek: add hardware
 timestamping for RTL8127a
Message-ID: <07ddc9e6-2604-47d4-9e68-eedfaa4ee142@lunn.ch>
References: <20261125090217.1198-1-javen_xu@realsil.com.cn>
 <20261125090217.1198-1-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
 <awathfkR13ZQH6g9@lxl00025.wbi.nxp.com>
 <15f473435a41440da45c6d070edc1128@realsil.com.cn>
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
In-Reply-To: <15f473435a41440da45c6d070edc1128@realsil.com.cn>

On Thu, Nov 26, 2026 at 06:13:55AM +0000, Javen wrote:
> >
> >
> >On Wed, Nov 25, 2026 at 05:02:16PM +0800, javen wrote:
> >> +     phydev->default_timestamp = true;
> >
> >Enabling new instances of phydev->default_timestamp is not an option that
> >you have. Did you research why it exists?
> 
> Hi Vladimir,
> 

> Thanks for review. I understand that phydev->default_timestamp was
> introduced to preserve legacy behavior. However, RTL8127A doesn't
> support mac ptp. The PHY is the only hardware timestamping block
> available on this link. Without setting default_timestamp = true,
> the current core framework simply breaks for this PHY-only chip.
> How would you prefer handling such hardware without mac ptp? Any
> suggestion would be great helpful.

That sounds like something is broken somewhere. This should only come
into effect when there are two stampers available, e.g. a Marvell PHY
connected to a Marvell Switch. As far as i remember, the PHY one is
partially broken, so you want to use the MAC one, if available.

However, if there is no choice, i would not expect default_timestamp
to do anything.

Please spend some time to understand what is going on here.

       Andrew

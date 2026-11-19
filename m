Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094077;
	b=HpCr1Jog/ZNwTS4eZglDxNEYCGsGOT94X9LluYGgXIg6W9dtZTrP2WaQknv8QlXPRo3T
	 mt1OxEXy//mmvOUS5LHiOeAiWPb+pX/NJ09AIPT5zav/TxGmsSrFU3f91tXgDZrkb1pyW
	 u469ZQa1m31FgoY1JnwHdiwRlceakfrbeVLPCkVn5xKaSUFWRt76ahVSIa9qObM07E1Y+
	 FCjRPkBZX4KZp3SXbLx/AQEoDkIT7WDcJTFuVIjhgdGXGQ9hdT77TG0ivHC8eDf/o2iHo
	 1HvB2IlopcO3JAltyoheIHDBJGMnF14TApOg/AghelEz2mCad+wp9Ass7dn+7+tbilA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094077;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+T9GIvpqxX7q3vG3lIDHXBshm0K+se9i7/mbf4e1L1o=;
	b=4MbrT5QbO51T/miaxgGx+HxswZAYxQbEcbADCcNhjzM2uvQQ2HiDDstNE/58u50iJUKa
	 u+YKz2HTWvX4KCH+wZuWqkO50JE7oAfyMJBGpeBe+mqwWeD/UWmnOjV2fsiNKjyPGqaXb
	 Lemk/6AFH5rGR6PYfRALktwWS2NzDEKxCuBnIGtnj3lgS10+5MIvxAY1ImnvGwSVDCID5
	 DjSZxWXb3cKUEQx5LY4nXHdtmN/BDMZr2gCAjvS5F8bd8098KXmOuIoH1HO2JARmMFVxc
	 Tz4UWHokThD0CSgYZYfG2JBygJ7tovjFOe6o1RdotSCNG0AhFNuO8STsSoI6E5YfFMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=EQ+WSuqY;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37F3606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D37F3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=EQ+WSuqY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=+T9GIvpqxX7q3vG3lIDHXBshm0K+se9i7/mbf4e1L1o=; b=EQ
	+WSuqYaODRL5eqB7CntZYmtayQiSzbHdcXFefUWRfmiEFsDMIlrzHY3Btzfbu4DIcUNwpfU16Wccb
	qVDMx/HkEcSlP5kebEpFqmWjULBh3/FOJEB9MO6iC/mDMkoMh2Gj1F+udlRq8N45Vuf3ksST7FXMe
	szt0zBnNlAREp+g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU1xw-0002FP-3p; Thu, 19 Nov 2026 14:14:16 +0100
Date: Thu, 19 Nov 2026 14:14:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Frank.sae" <frank.sae@motor-comm.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net,
	netdev@vger.kernel.org, lingyu.zou@motor-comm.com,
	xiaoyong.li@motor-comm.com, jie.han@motor-comm.com
Subject: Re: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY
 support
Message-ID: <5781d5a7-68e8-4837-8eb2-c47ec2f75507@lunn.ch>
References: <20261118033539.36633-1-frank.sae@motor-comm.com>
 <20261119055645.653216-1-frank.sae@motor-comm.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119055645.653216-1-frank.sae@motor-comm.com>

On Thu, Nov 19, 2026 at 05:56:45AM +0000, Frank.sae wrote:
> > Please break the patch up. Add basic support as a patch, then
> > downshift and WoL as additional patches.
> >
> > The WoL code looks wrong, i don't see any calls to
> > device_may_wakeup(), device_set_wakeup_capable() etc.
> >
> > What exactly is AUTO_BX2500_SGMII and how does it differ from SGMII?
> 
> Hi Andrew,
> 
> Thanks for your review.
> 
> I have split the submission:
> This v4 only contains basic YT8831 PHY support.
> Downshift is not implemented for YT8831 at this time.
> WoL support is removed from this series; I will fix the wakeup API handling
> (device_set_wakeup_capable() / device_may_wakeup()) and send WoL as a separate follow-up patch later.
> 
> AUTO_BX2500_SGMII is YT8831 chip-specific mode:
> When operating in AUTO_BX2500_SGMII mode, the YT8831 adjusts the PHY media side to 2500-BaseX or SGMII based on the connection speed on the PHY UTP side.
> 1. Media: 2500BX – UTP: 2.5G
> 2. Media: SGMII – UTP: 1000M/100M/10M
> Differnece from SGMII is it also includes the 2500-BaseX mode, which is switched automatically.

Ah, O.K. Most multi-gige PHYs do this. Basically there are two
different ways it can work:

* The host side changes with the media side. When the link goes up,
  read_settings needs to set phydev->interface. See
  mv3310_update_interface() as an example.

* The PHY performs rate adaptation. The host side runs at a fixed
  speed, e.g. 2500BaseX. The PHY then rebuilds the frames it gets from
  the MAC, buffers them, and then sends them out the media at the
  speed negotiated. Pause frames are used to slow down the MAC so the
  buffers in the PHY don't overflow.

	Andrew

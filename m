Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795284225;
	b=kJ1/2YL3pCMOaPX+p5MLueV10ReyIWcnk8XQ8d85/98bhJNxlr69JnidkJpadhk0RxHV
	 CKORvEws17VZJvzkFJ0ULffA/Dv/kBR0d5c+L6rzz4b1X8HRmc8pUDEhLyWWus86GN9bX
	 kuBxfBMYVV6wJ+d3M/wRd9EIVxPCKRVXpzGVRk+kKEuSRndDcGgP0tf2qaTfXhbAgBC1e
	 JBhF7p69HkjtnrOQoDtmboNXS15+AnOQfvs5A1pke5jPzjAIphbrqkNwFmIyUbuG51EdJ
	 8y87T4Unv7edouUN3cg3g/8K7d2YGkmpqu+5VHxmKTVe9L4Z2ItfFEL8HPSL7qFEqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284225;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lkT4cCRXjwY6T2jbFJNmNK6ZFK4LPJp4W8aeO2PiZyE=;
	b=jXNE66n7Ul/59md7cE+8xhVNK5WI2gG6MFOYLcDYUJsKEssjqgIpU719+exXEq3xYuPV
	 BjrQnTeCxuNTClWDyrwbR0VIDWBq3+mIjCVStoAVvpUi0wPNFQZq7pg+/O+Ndoi/QDu5D
	 ytLBcZTw4JbtN9ks+xFERZOYeKnQsPtCQdvg2Olz73G9AWy3xXzvdjppHNLip/LJ7caGE
	 Fz6ipYGgKC6XU9SRyOvOm9JE7X+IQCrdRDZNkzBt7Sd4IOW6RekgPIrZiHGtWBm/ukqom
	 rRIHK6HG6omy7vnUP89/qES3D/Y7f57H/VaT8pxPISQoRPiiryS7gSLq2ynWSONKwew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=hmx8bxPo;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3759606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3759606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=hmx8bxPo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lkT4cCRXjwY6T2jbFJNmNK6ZFK4LPJp4W8aeO2PiZyE=; b=hmx8bxPo8S2NIYE3FwpehlybKa
	FrAQtxDPvBxEJyGaA3BAToZafaCtXd4DgdvK5ckawk2bByutJluzfQuC2t3fTzDpTJmMn84FXktAR
	RsXrdgK/uqhH65IqGmmx+PYwva8xbc/Xu8WrcMFkwaMwt6liqjvofOmNDEYfx7lp2hbU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUpR8-000TXz-Hi; Sat, 21 Nov 2026 19:03:42 +0100
Date: Sat, 21 Nov 2026 19:03:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	kabel@kernel.org, petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com, olek2@wp.pl
Subject: Re: [PATCH net-next v4 2/2] net: sfp: skip PHY probe on bridge-less
 OEM SFP-10G-T revisions A and B
Message-ID: <95d0d985-d2ce-44f2-b0fc-bde5536f39e4@lunn.ch>
References: <20261121091235.1447291-1-pawlik.dan@gmail.com>
 <20261121091235.1447291-3-pawlik.dan@gmail.com>
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
In-Reply-To: <20261121091235.1447291-3-pawlik.dan@gmail.com>

On Sat, Nov 21, 2026 at 10:12:35AM +0100, Daniel Pawlik wrote:
> "OEM SFP-10G-T" modules with vendor revision "A" have no RollBall
> I2C-to-MDIO bridge: page 3 of the 0x51 EEPROM passively echoes written
> bytes, so every RollBall command times out. With instrumented mdio-i2c,
> the CMD register reads back exactly the written command byte (0x02)
> forever, with no DONE and no I2C errors. 0x56 reads back all 0xff, so the
> PHY is not reachable at all. A genuine RollBall module with the same
> vendor and part number (revision "02", AQR113C PHY) on the same board
> answers DONE on the first poll and its PHY attaches within ~2 seconds.
> A rev B module with an RTL8261BE PHY, reported on the OpenWrt tracker,
> hits the same RollBall timeouts. The bridge probe added by
> commit 8fe125892f40 ("net: phy: sfp: probe for RollBall I2C-to-MDIO
> bridge in mdio-i2c"), since reverted, found no bridge on it, after
> which the module worked.
> 
> That module reaches this quirk entry only because its part number is
> "SFP-10G-T" at that point: it is a rate-adapting module which reports
> "SFP-10G-T" with a 2.5G or faster peer and "SFP-10G-T-I" with a 1G
> peer, and only the former matches this entry, which is the sole entry
> forcing RollBall on it. The "SFP-10G-T-I" variant matches no quirk and
> keeps the default behaviour either way.
> 
> Because the SFP-10G-T quirk forces RollBall, the kernel retries the PHY
> probe 25 times at ~21 seconds per attempt, i.e. for over nine minutes,
> before giving up and falling back to inband mode. Each attempt runs from
> sfp_timeout() with rtnl_lock held, so for the whole window every rtnl
> user on the system stalls in ~21 second chunks, including the state
> machines of other SFP cages: insertion and removal of a module in another
> cage is only processed after the current attempt ends. In one test, a
> module pulled from the other cage kept being polled by phylib until the
> attempt ended, triggering a WARN from phy_error_precise().
> 
> Give the SFP-10G-T entry its own fixup that skips the PHY probe for
> revisions "A" and "B", while keeping the forced extended compliance code
> so that the module still links up in 10GBASE-R inband mode as before.
> Other revisions keep the RollBall fixup unchanged.
> 
> Tested on a Banana Pi BPI-R4 with rev A and rev 02 modules: the rev A
> module links up at 10G ~16 s after insertion instead of over nine
> minutes, and the rev 02 module is unaffected. No rev B module was
> available for testing; its match is based on the report above.[1]
> 
> [1] https://github.com/openwrt/openwrt/pull/22910
> 
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> Link: https://lore.kernel.org/netdev/20260624084814.20972-1-petr.wozniak@gmail.com/

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

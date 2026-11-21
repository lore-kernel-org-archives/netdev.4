Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289339;
	b=KN4jHIhp/aNoEuJPWQ0bqGfaPoiCGw+xLlvqzdDDCdMONISg8pKEfyd3bXfGIgl3HJf+
	 U5TfG11Bx12sY2l3bSP5cmXsazH7OPzCMLy0ZirO5w/o5voZE9Zalbeackg7WZe62TjZT
	 /3EdP4hFxbzpEuKP8HkGLzEqaC/8opDgyXgNsVLN7kWL/jksnV+UhFGDswqq5m2PGApzz
	 XtX2rSDPFgttB/+spymajyH8kj4t9/lQsnaKf1B3K7Z6frb2FypfhBzAtpeHxzzheX0tn
	 eaeDjlF1iIzlv6i2WmfgA/n4NVYB79+BFIYzMIgiYlAzCgTRjI4p5etjRmudTuzAIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289339;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ohB/e9rrmoUW18TlMcMuisQ3OjBltSZAwbjlv2zhJHQ=;
	b=49aP26tJreuGxV2cdOPOo0iM/yY5fHrQGVAAzLfX1Py6oPcWjsCx2ScEA54+NKxe2oyL
	 ZwS2qGNGwBBR48oVvIZEj++jK0JFNHttnwq0rZOpUEZPP2wBBgBUFec9dXobeGJnr4E+W
	 6r5te+xrlAbqVAnbtCYyfR2HE2J8dF3sLA6a8CwtfMaSj8nrkA2E+qf+kLRNIMOBeV2Vq
	 1LOKp1MmMXRhtwJYMXz6bxBIYJSNIgWPu6ySjdWwH1MQgB9dOBx9SvEakj9v55qBWqW4/
	 lWICBPpIbtjGTm3YpV8Ut6ZID+gAbY21NLWU6rOIPBsepy+g+Kh7pdQZS54KAFouSfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=oLqujUKl;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15189606A320;
	Sat, 21 Nov 2026 19:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15189606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=oLqujUKl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ohB/e9rrmoUW18TlMcMuisQ3OjBltSZAwbjlv2zhJHQ=; b=oLqujUKlQhmBa6VdqknYna0FGU
	HeILxjYk2V8L97X4aO7SFp5pTZCr0d3CGYqRv9z9WxPUTljkjY5qDWIkvT+5TO63ZDJlfxYRIIuye
	YGL/IN2teCHbHQyQjssktiDkcUudkS3pe6+Y0cfiiGn1z6pcY/4VCU8vd9KPfggboXzw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUqlU-000U6E-0g; Sat, 21 Nov 2026 20:28:48 +0100
Date: Sat, 21 Nov 2026 20:28:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bastian Germann <bage@debian.org>
Cc: hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	olteanv@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
Message-ID: <06addff8-09b0-4b76-aac7-11717fbdd9f9@lunn.ch>
References: <20261121092933.186731-1-bage@debian.org>
 <40db2715-55cd-46cd-a2fb-8ee11b571911@lunn.ch>
 <ee0baf58-5795-424b-9a41-feb9a2e766fe@debian.org>
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
In-Reply-To: <ee0baf58-5795-424b-9a41-feb9a2e766fe@debian.org>

On Sat, Nov 21, 2026 at 08:07:34PM +0100, Bastian Germann wrote:
> Hi Andrew,
> 
> On 11/21/26 18:06, Andrew Lunn wrote:
> > > Parse the property in of_mdiobus_register_phy() and
> > > of_mdiobus_register_device() instead, so it is handled in one place for
> > > both PHYs and other MDIO devices, and drop it from
> > > fwnode_mdiobus_phy_device_register().
> > This seems odd. "handled in one place", yet you do it in two?
> > 
> > Is there a reason not to do it in __of_mdiobus_parse_phys() ?
> 
> Yes. My v2 draft was exactly that (which is the reason for the commit
> message oddity) but I noticed that children with empty reg that are handled
> in the auto-scan loop would then not get the bit mask set, which is an
> unnecessary behavior change for PHYs.

Ah, O.K. I never liked that scan code filling in missing devices. It
has a warning not to do that. So i don't know if it is actually used.

Also, i could not find any in kernel dt blobs using
broken-turn-around. So we are not going to break anything.

    Andrew

---
pw-bot: cr

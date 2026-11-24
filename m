Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555293;
	b=dN6EZXa1Q7674ISLKc0UgLr82q/PmGqB5tNx/My+AsDzAqv0aqgQ15kFZxGoGRW9edrA
	 y9uRnyVQQfvjVnkynboLWwNc3Ud4tmrXPT8/QUW3J8WlSmEYIaXiq7z6zDOMa1YJUyFfn
	 brxGIzakYOgL8iojYzKbtL6zyUe4ghvuV+E4DSFUlYp4ZcXIC43e3YnRSi3IRBlJWs7CB
	 RKiyJeZoEQTZKzgu7Llo+iC830CVA7zmy9M1v8Okynts6eH8R4KUCqncVDjkoSl0cC9By
	 Elt2Qt+fQhZHrrP4brY06LdiyL2qDPjTZz4q6Js4BU/isBnkQPD3UI/qhPgiWME89FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555293;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=QjfkThTVl0FcSsf2Lc31oCBWFvyyt1eUEEqDr61B9T4=;
	b=bBXIXRPWztx7Gz+RIkguYg04dJCGv1U7kGM+BuK5j+zeMHpQVmO+1QMrUMVD9B1v2Rwp
	 v4eJZbvTZGo8vCyU3uUmU8A4iO7AZdj189oXU9bdCuzNNDdNHDIbitT/18+VPENT6ShUS
	 PT0qMLhXGnbGTad750Y1MUy003NvJ/M65cXLUbak6u8NYeG+IextLwJwri7ViMhx/oS34
	 wBfiHnkoEVdnbAL26Pdltppdj2nhgit1tWXCsmgufghjGvZqa/4qKIGU1BNKmukj6kY3N
	 aERNt3mlCn6cEIAN2of6z2VNFbxWWNBAoiZeKWcuQME6NVORPaiWfTFxQMOcruqaFTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rg2O3xaN;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C0606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rg2O3xaN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=QjfkThTVl0FcSsf2Lc31oCBWFvyyt1eUEEqDr61B9T4=; b=rg
	2O3xaNJNH9NAhr/eEflLk6/OyZYbZRfwBQmuvcDLXFy9bYc8vshq4ms2RUHBDm5vda6hEqYjhVzcD
	YM12+yvHbJlEpSvC4WpS74EKiw7GbqxbFXdv5zUXJGi3VjMFKv1dXzNjjmStI6xVlaALyH1sbgInD
	hNQBcXkmFdKPOnU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVxx6-001AN4-DZ; Tue, 24 Nov 2026 22:21:24 +0100
Date: Tue, 24 Nov 2026 22:21:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: skyline@mail.ru, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: phy: marvell: add support for PHY LEDs
 polarity modes
Message-ID: <c85c4a02-6aa1-443e-a1ec-25c471552968@lunn.ch>
References: <20261122213034.548858-1-olek2@wp.pl>
 <992ef2e7-4334-4b0e-b1ea-5ac1360fefea@lunn.ch>
 <4dd66fbe-4528-4e88-91d4-87e147aa71cd@wp.pl>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dd66fbe-4528-4e88-91d4-87e147aa71cd@wp.pl>

On Tue, Nov 24, 2026 at 09:08:13PM +0100, Aleksander Jan Bajkowski wrote:
> Hi Andrew
> 
> On 22/11/2026 22:55, Andrew Lunn wrote:
> > On Sun, Nov 22, 2026 at 10:28:55PM +0100, Aleksander Jan Bajkowski wrote:
> > > Keep the LED polarization settings and restore them after a hardware
> > > reset. This modification is actually only necessary on devices with a
> > > wired PHY reset line and a driver that resets the PHY during the
> > > link-up/link-down events. I found a single DTS file in OpenWRT
> > > (armada-385-fortinet-fg-5xe.dtsi) that matches this hardware configuration.
> > Mainline does not really care about OpenWRT. However, why does
> > armada-385-fortinet-fg-5xe.dtsi do this? Is it because of an errata in
> > the PHY? Such an errata we might care about.
> 
> This is not an errata. This is a direct response to sashiko's report[1]:
> 
> Take a board with a PHY reset GPIO and a MAC driver that connects the PHY
> in ndo_open and disconnects it in ndo_stop. Wouldn't each "ip link set
> down" followed by "ip link set up" put the LED pins back to their reset
> default polarity and drive state?
> 
> This is actually a widespread  issue. PHYs from various vendors restore the
> default state of the registers after a hardware reset. Phylink does not
> restore triggers later.

O.K. You are correct, this is a widespread issue. So no need to solve
it for one device, it needs a solution for all devices, if anybody
actually cares.

	 Andrew

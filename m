Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382874;
	b=O4Bb4kbUSthOsIC5svAfkQTxqI6sPVDfdCkOdUHb1ISxFUy4s6Ikazg0TrRQngxUFcJ+
	 NZYJjMO1dLisTwc2sCTI8JwQz8MYyT3X89tW8KjewUrG0MHk9B5v1STk+RrH4Y76rNmSJ
	 6fppmWorx8c62kBcVjCpTBO6n9GKyzKPOKIvkse7WQbtAl5j6v4olNn1S/z0oTNwN88on
	 5WESX8CQuUsFw3kD4FMEO9eD0M3Wo3hZx6h1vz7nmazirDCeePQm50fPJTnY1s4Dq4+3u
	 vvQaPca131Fge1UzTnIWPS1/YTRYdApWMgWrrXP6poWNp16vadgiSPH8+pZF9Di7zBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382874;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bYD9ADuI/SURWySw0uXyEDidcs7+Esb4RNSc8eCAVQA=;
	b=B39C4INBxWK0w09jE64QjnJE2eOECuoh098CRuw5ZhnXF9mfl0+4CmeC9i+T0w4XXPfZ
	 YY2KLm+KDQy6g9q0nSyKWM7tDbzx81WRfbeHj+IUoiUa2HJPhk/xnG65nzXl7MWjkn7Wn
	 KjTe3Gt2exNavNfVFS9aMMLfni7OIaO3SyBjKH94M1jcJVEmP652sRalJiFSNjitYEooF
	 q3+KWZ/Yr+h+L5XPPyucUgqZ2HrK6k6S/RZN8pzVu5d+CtoAmkrTUZ12njjWuQqd37ct2
	 yccIYV9KgouV8qFL7lSDhDb6BeSb4Q8adLHZN0jmeH5YmmKDM/6gIGfaWeDM2bOKd9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tPCGUBE+;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E524606A31A;
	Sun, 22 Nov 2026 21:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E524606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tPCGUBE+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bYD9ADuI/SURWySw0uXyEDidcs7+Esb4RNSc8eCAVQA=; b=tPCGUBE+TszykfZMfM2E/SPK03
	HLLmuDfVmfcfvHGYFt4g0cldppHwO5eL+WM7SMkFcCetbGGM8DnpLShU+FFERjXfbyRKT0vvjVAlh
	zs3h43AkD5iXZMuYunCBxadnJe/6HIzVV1R7jFfQhZro0icjI6A+1NfQYSuCs3mzNYxM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVF68-000cgH-O0; Sun, 22 Nov 2026 22:27:44 +0100
Date: Sun, 22 Nov 2026 22:27:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Bastian Germann <bage@debian.org>
Cc: hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	olteanv@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3] net: mdio: handle broken-turn-around for
 non-PHY MDIO devices
Message-ID: <5bc2dd3b-8479-4afa-8f86-a289b8b353b6@lunn.ch>
References: <20261121193655.225520-1-bage@debian.org>
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
In-Reply-To: <20261121193655.225520-1-bage@debian.org>

On Sat, Nov 21, 2026 at 08:36:55PM +0100, Bastian Germann wrote:
> From: "Signed-off-by: Bastian Germann" <bage@debian.org>
> 
> The "broken-turn-around" property is documented in mdio.yaml for any
> MDIO device, but the MDIO core currently parses it only for PHY devices
> in fwnode_mdiobus_phy_device_register(). Non-PHY devices, such as DSA
> switches, are registered through of_mdiobus_register_device(), where the
> property is ignored, so MDIO bus drivers that rely on phy_ignore_ta_mask
> still treat the turn-around/read failure as an error.
> 
> Parse the property once in __of_mdiobus_parse_phys(), before the PHY and
> non-PHY registration paths diverge, and drop it from
> fwnode_mdiobus_phy_device_register().
> 
> Signed-off-by: Bastian Germann <bage@debian.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

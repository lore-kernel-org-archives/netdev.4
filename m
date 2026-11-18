Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033976;
	b=Suf/fWKsnSlYq71GZSI/oIjw0q4ObQ8iqyerAxUQVS6svi57qR4nnW+9TM7uIHZM4D1l
	 MKSBGhgecQ4iZeggmpIV7oAKAErp46d1uHG5ae8EQJQXbWqMgfwvJZ5VPdF7l1BHfg3Mc
	 qEXNZnLpFEMEfinCUOt2G/ZAL9FFzd7BMvGfkrApuf9Q9zYQimYXae9RTfl3MjxCt/olV
	 MS9+RiHGEe6/verxgrXs5NMW1Zv9Vf0+OtHdBfzH7JnwHP5bRw6euR+lJZvsL+j4Ypf4T
	 iyqbm3QRVSvIu6dOT521tiqt0XUeHKkjjL40FHZneXhOVRBn4kd4/xGeqRIic7SNgDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033976;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=CE9KX+XM7Bcw7+DivHRX4MOTdxHgdid3BtllF5iTvEE=;
	b=GSiAK6KVjNUlMph947opsT3BhH+4bWVIYq+M+r9cpsDlEhC294YatxW+1ulYrURCbJTD
	 I16nR/nhdnclPCigu8PCSYrCYmGAu4iYpGOYLKI5GJTxYGoSyv0fE8wLbbbBBnxGliAvF
	 PYzROiTzYX4cmaYyuFuor+OaypuKqq0y5lY8+3Qv/rGPpCM5i5CmlCo86tu5Mzwozdc5q
	 nl6ND/lGsjZdytFqLhoaknQul+LyKuA7lKIiB0D9i7tmnOSkP0/nPbNDb/fRBa3NRbmc9
	 DWs8xQGzoTP27mSqebt02zSM2D90aMcBjn/onVgSo3LXMmBN8TMlyyoY4de89NDx9qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BdWyfG1J;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7995606A33B;
	Wed, 18 Nov 2026 20:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7995606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=BdWyfG1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CE9KX+XM7Bcw7+DivHRX4MOTdxHgdid3BtllF5iTvEE=; b=BdWyfG1JUzpST0tcCcJLxlFxQI
	+Fsz773xvsuO30/qnytndAkWZC9w1GKyQIxkoS/FgiJR6AoTNsBq+4z8E2Z5rmqa9v5aJLvj0Sg41
	sFvwGgfQmwOgmjqIBWQRoVUBra5A5CHoLvlny4mYAG+88+03A4oQCgcX3VK7wPnnLxgk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTmKj-00HVff-2t; Wed, 18 Nov 2026 21:32:45 +0100
Date: Wed, 18 Nov 2026 21:32:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "icue.retsam.diman" <icue.retsam.diman@bumblecito.com>
Cc: github@bumblecito.com, Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
Message-ID: <ed0f62db-f2fc-45ff-9ccf-5aa3e50c243b@lunn.ch>
References: <20261118162323.436219-1-github@bumblecito.com>
 <20261118162323.436219-2-github@bumblecito.com>
 <e1584dcf-bb90-4e54-8f97-f52ea3da85dc@lunn.ch>
 <4fb66a63-b483-4777-9fe4-b94ccbe733b3@SynologyNAS>
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
In-Reply-To: <4fb66a63-b483-4777-9fe4-b94ccbe733b3@SynologyNAS>

On Wed, Nov 18, 2026 at 02:08:44PM -0600, icue.retsam.diman wrote:

> 
> Hi Andrew,
> 
> I tested the module without the quirk using an unmodified OpenWrt SNAPSHOT build (r38465-2ccaccdb98) for the GoodTop GT-SWTXG8FM (realtek/rtl930x).
> 
> The ODI DFP-34X-2C3 successfully establishes a 1000base-X link with autonegotiation enabled.
> 
> The  ethtool lan8  output confirms:
> 
> Advertised link modes: 1000baseX/Full
> 
> Link partner advertised link modes: 1000baseX/Full
> 
> Advertised auto-negotiation: Yes
> 
> Link partner advertised auto-negotiation: Yes
> 
> Speed: 1000Mb/s
> 
> Duplex: Full
> 
> Auto-negotiation: on
> 
> Link detected: yes
> 
> With the quirk, I was able to establish a 2500 Mb/s link with speed and duplex forced and autonegotiation disabled.
> 
> Therefore, the module works with 1000base-X autonegotiation without the quirk, while the quirk enables 2500base-X operation.

Thanks for testing. You could add a Tested-by: if you want. That will
help get the change merge.

What i was afraid of is that for some reason 2500BaseX is rejected by
the other end, and it will only work at 1000BaseX. For a traditional
SFP, that would be true if the SFP on the other end of the fibre could
only do 1000BaseX. But this is not a traditional SFP, it is XPON. Can
the OLT say no to 2500BaseX, or is this purely down to what the ONT
can do?

	Andrew

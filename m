Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528264;
	b=3zCTe2m7oC1TwJLxgg142I9JPPkcAiaAGr5qxCEXass9kJswp/RQ2tZCKC/WZ2nfyMjz
	 QYbC0ArUW8k+91JHoT0nTXGm7Ny1qtTq7WgMrD4u+VdbY7Hmy3AxwcupyeC4h3h6x5KF/
	 CeRWrnKDX2g4kgSreaWkiqaYO5Tl47M6/IPAPUTpbV3FT5HGbfLBxbff/6wUJbBJYle5U
	 5M4jh/W/7y5VB9plQHhaaKbYC5BWBNOnXWKWc/mnDy9NsZejMLGArYLrHRjN8HRbfg0ng
	 YQbPLhG95V7ymWKPWXDGrTRDk7mpWJuaiXNQS6A2hlnGZwJl4OW1+4001DNcTiyPRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528264;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=r2LxYg3lr6AkPLjCWfB98rOcBXwTYzjK29rCQX7Co1s=;
	b=otvSebhBxel3KYogRGgozqshJZkpDBAQTT2xe3gJYLRxMGT0xDI9JsCV3HTtjzjVvDEA
	 qmULH/iVwd6LeyEHpKRBjFebi/7XHs7h3WGtBJRScjOLv07poI9KAHVFsCznkS9SqiUIa
	 NvGkjM8kdsVcDfQ1Tu8e2oVbEJv6Mw522xVAKKz+QjtB7SOIFUV/zotKkLAg3EaoQ9UUG
	 Hzr9HnnYjNpOiUeZJeXaPyNaVXvgYa8JU9ou922RuwLu5SVzdIFwZXPVpVawn+Slq1Iju
	 cNGmQQbbXKRoM+nuH3/24d3TXICBfnzjHPjEFWI5xXGy6GKt2fag3An3sIJrNkXFqzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3gydEa4I;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AAE606A31E;
	Tue, 24 Nov 2026 13:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2AAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3gydEa4I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r2LxYg3lr6AkPLjCWfB98rOcBXwTYzjK29rCQX7Co1s=; b=3gydEa4IgZ42A/hmt5iMxG00GU
	pLwHh7K8LmbVxaYp0hevaw63LF8tyOsU+0ynoZY6ogzA3pjgnpUM3oPZBaUzLTNrMAJ6upgu06Vph
	Tzc3hIN9G+ZnU4+WQs5TRTrHAu3nHAhPD7OvIR7ga4E2WivII7/CFoBNiYY3lfnzmFFk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVquv-0013W4-7G; Tue, 24 Nov 2026 14:50:41 +0100
Date: Tue, 24 Nov 2026 14:50:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rosen Penev <rosenp@gmail.com>,
	Christian Lamparter <chunkeey@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, Linkui Xiao <xiaolinkui@kylinos.cn>
Subject: Re: [PATCH net v3] net: ibm: emac: attach and start the fixed-link
 PHY
Message-ID: <7057d70b-033d-49cd-9fc7-d6b9b39ffc84@lunn.ch>
References: <20261124083941.2480237-1-xiaolinkui@126.com>
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
In-Reply-To: <20261124083941.2480237-1-xiaolinkui@126.com>

On Tue, Nov 24, 2026 at 04:39:41PM +0800, Linkui Xiao wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> emac_init_phy() sets ndev->phydev by hand for a fixed link, so
> phy_attach_direct() never runs. The PHY is missing from the netdev's PHY
> link topology and ETHTOOL_MSG_PHY_GET dereferences the NULL link_topo in
> phy_prepare_data().
> 
> Attach it with of_phy_connect(), as this driver already does for the
> phy-handle case and as gianfar, fec, davinci_emac and nixge do, and start
> it with phy_start().

There is also a call to phy_start() in emac_mdio_init_phy(). If that
is how a real PHY is started, a fixed link PHY should be started in
the same way.

However, this code is a horrible mix of phylib and mii. It really
needs a rewrite to make it pure phylib, or ideally phylink.

      Andrew

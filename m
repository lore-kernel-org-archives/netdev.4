Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795284786;
	b=0jH0cO+ahX2TPgHZ8anUyD9B5P11QbiEQoi7KT8xVhC+VgHfoKxR6l0DWQp3OvL9Ryxe
	 t/YVsTPdXZvACdxGEyDEmdEkX/2DR9ZZibhvtkg66wtopUk8ECt6hYljRaud/wegCYYqu
	 xfEjv64XYNkxI3gyOHez20yK68MFfsxhitwBeKiPhRV92a/IBrhUyb85U8qRgR7fk7mJ1
	 rEePst/Stpg6djw4in62Zf5AkVg/26ItVn6Ne259qUoMSlbQmQNUBt6zxt1CJAsFRZLAk
	 K3JlmxZTzkHDFPOtkQayIs+7WF+Fk/D1A1Gtyzq4xt/5r4EVP+xcC5nN3mZMIbrhDuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284786;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OvcsXvmxV2NpAo9swbfL9baT0D2RJxOhrkhotTqp33Q=;
	b=GAzjrDKU3VOc17Ynx+e4CqEngg8iBeEyeQ1sPnw0PtmYUPGrUD3woexOtSzX4ph08w2u
	 swLMgUZZQPnz5lxxMUZCO0JU6n/PdDlE3dR/p1gJUuSwXzBmQiGqf2kYx+zFyLN+ALXCj
	 uGPlxwvD4vReFb04jCGI7Lfx1K0PteoRjsR1E4Wdx7/90DIhHh/8I1wd5bepazI1IYaHq
	 3dtI1h0GCbZhuojRFj7fkzGyuupHEsO/Org2H2ABO+olJ0rl1Qb7XXhI8AN5H02Zj9/jZ
	 SipMoWrsl1k9BzGq4ITxHxNWMzmrWpZii4RQ9HWSi06MdY2iDVaR50DoeoXEX5O/yyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gtzL7uqE;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490F606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E490F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gtzL7uqE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OvcsXvmxV2NpAo9swbfL9baT0D2RJxOhrkhotTqp33Q=; b=gtzL7uqEKmM9OrMI93aDbnJ9HN
	2wLP4MitspVQNyArBz+0yD9qGUwJCH+1foNqGriPr/E2bd7sKENPlNy6giHx0pcasgvLpbe/ufoU/
	3l6m1ENOXkMvanQzoPOUW1Yc5oaN5fL0u7CzivgwcBpYm6z1M5skvI0kcVLqubf1umXo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUpZy-000TbP-0O; Sat, 21 Nov 2026 19:12:50 +0100
Date: Sat, 21 Nov 2026 19:12:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>, matttbe@kernel.org,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	thomas.petazzoni@bootlin.com
Subject: Re: [PATCH iwl-next 0/3] igb: Align the flow-control behaviour with
 ethtool's specs
Message-ID: <4efeed7c-da91-4886-9af9-67c1df07bcca@lunn.ch>
References: <20261121103613.166611-1-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20261121103613.166611-1-maxime.chevallier@bootlin.com>

On Sat, Nov 21, 2026 at 11:36:09AM +0100, Maxime Chevallier wrote:
> Hi,
> 
> This series makes a few changes in IGB's ethtool flow-control
> configuration to align it with the ethtool expectations.
> 
> This was found while upgrading the board farm that runs the stmmac netdev
> CI tests. I've upgraded the HW and I'm now using a bunch of I350-T4 PCIe
> cards (running igb) as peers for my tests. Since then, the flow-control
> tests have started failing:

Yah! The tests are doing what they are supposed to do. I don't expect
too many problems with devices using phylink/phylib. It is all the
drivers which roll their own which get is wrong.

	Andrew

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011271;
	b=oyuekzbEmtOi0z0bZdyzyLxnQ0nHiVdEhAWdgCkMlBvOwQTyICvz4B8SkPEf6ZCLk1Us
	 tF5I2kvukc2hWrns0CWg8hhEG1ZlxhdaoU93lhN6S6Sn26OstxMLkNJWfjc2BFsa6uDDi
	 +YmaUCvTib6jm0fvALrZuqkuqm7d80qNMiGa1sKOcfSy4R6fymEXSvzSGALUY24/9OewR
	 9HvCAHGE/NUm63tQWZ9hcT7Vu3ldkPcpleYvOigwnfz01jPUn5iS8YBIAuLRDzHgSEEt8
	 QBeuWK08jTmt3tzJlIKCqicBwbd81SmG6Y5Pk0jjDw3cyySrfWWJ4wUJVyD4cnQ0Gxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011271;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=GRV1VOxfxS70H5cxlTaT575Q/FRwkvl1OT6xT28Tg6c=;
	b=zQx1a0KdaNscVxKT5hXFbYQ6rJyslGfCXSr/j1GDmZmKt82drIvxJyXPxpLC4uNea9bE
	 RtgfPq8VdFiUepLgeQQJteoVuxB7gSDq39DXNwdtqC3Iv5knqNw28mlI/+AWgEx3TYQIu
	 uP5yoSUy1lKwspWxakxCbJHrmFBzBe3fe3Nf6a5bLW4etwzfDEqUP8bWfFmTjPzhVfpup
	 qPwaYhtop8K/esrlAO7stKafz2p8VU+JbDRHtmf11b0PqG3/8YkpgwB4onKeK1zih9u8j
	 HhSYWEpQkvb4alVhpx0Xzy8i9N4RUkKdBdVAfwe2Fa131zPZZuY1KbzAuQBp+SKwFBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="2E4/q5pq";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5E60A2603
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B5E60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2E4/q5pq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GRV1VOxfxS70H5cxlTaT575Q/FRwkvl1OT6xT28Tg6c=; b=2E4/q5pq4c6qgartIK9mriJSAQ
	lRpJL9E+626Koh0D2qHb/pMjT6uDo0cKZzkWAGyRmOea83GjhHFPspG3/WXngqxMHcc9yYBIp3f2+
	lVWDXUpqta7lzWC6VuppFVvBTUe8WM4+WJSdLj6jmcQuZVG7vxlM4YmieJJR6AuwA8AQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTgQZ-00HR7p-C7; Wed, 18 Nov 2026 15:14:23 +0100
Date: Wed, 18 Nov 2026 15:14:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Frank.sae" <frank.sae@motor-comm.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net,
	netdev@vger.kernel.org, lingyu.zou@motor-comm.com,
	xiaoyong.li@motor-comm.com, jie.han@motor-comm.com
Subject: Re: [PATCH net-next v3] net: phy: motorcomm: add YT8831 2.5G PHY
 support
Message-ID: <5a873946-011a-433d-9f9f-0b29da32b8ba@lunn.ch>
References: <20261118033539.36633-1-frank.sae@motor-comm.com>
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
In-Reply-To: <20261118033539.36633-1-frank.sae@motor-comm.com>

On Wed, Nov 18, 2026 at 03:35:39AM +0000, Frank.sae wrote:
> Add a driver for the motorcomm YT8831 2.5G ethernet phy. Verified the
> driver on BPI-R3 (with MediaTek SoC)
> 
> YT8831 2.5G ethernet phy works in AUTO_BX2500_SGMII or FORCE_BX2500
> interface, supports 2.5G/1000M/100M/10M speeds, and WoL(magic packet).

Please break the patch up. Add basic support as a patch, then
downshift and WoL as additional patches.

The WoL code looks wrong, i don't see any calls to
device_may_wakeup(), device_set_wakeup_capable() etc.

    Andrew

---
pw-bot: cr

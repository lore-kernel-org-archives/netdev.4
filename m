Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180250;
	b=WeEQ+sxYtShUkCehaHmjiRgVZ1JkuLRksZvKrtaCONJphv08N/79QmlAOydiXW9rx21R
	 pmgdGiDpoiaHCc/2VcxW2oYMkwmuvvei5+dZv6YitqMJCStvEq9+c1ZDo9oiRa/mBsPkS
	 JxZaZcas6sIr46ikxcjto8B1iLnPLZ0q0tJ5fLwcAwzmXqzUB18R6DWqkoON6ECxNG4dm
	 w1sGnPzfjF+jOOX4XTvHbQRm+26sMgr44owfxRrG6jFAPG+hsGnGYyg0/xQNbDYzWuPnY
	 HzWGAWFv6xKN/cb9sZg65Zgzlp7yyNmjvLERMQfQ+rdxcGPyoKuAnO+v60eTJCYT9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180250;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vjG9ZmNvZoaC5K/Y526JjO1OvZEaHYF3hX86jRUEixU=;
	b=uWYwRKL72+NWXIz45kjqURZOUOnIb63M7tjYjz8Dk5wfMP2MPCRvIY0oGjz9f6ZOEw/K
	 M+6c63Zv+Ix66a7XGgwAhzqd0SSgiS1bf6ki6t6jL6X1zrBJJMBYSTpW0bSOeXkBS8UgC
	 Dq2f5a/ZQivaKLIyg0Aa3ea9tXqblQWOtgVINIwf59nNODEaBEtbhB7RmdZ2y715IRiar
	 wUDPvgzOdCHIXeq8qLJ1l/SqNrChp9YUme9MdcI0OrHeC/CEr6DFFIkQgwEidmS/tGSJW
	 r6DKdGhEGydsbTWjINp7mZIJcLA51jHHKnMYUpI3ZglNruOVwGlmjACSFFooxot3MAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=TfwImNmM;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50580606A339;
	Fri, 20 Nov 2026 13:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50580606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=TfwImNmM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=vjG9ZmNvZoaC5K/Y526JjO1OvZEaHYF3hX86jRUEixU=; b=Tf
	wImNmM2JCSYXU+nQeXN1DZMzfOHvN9ykh6/nd+SKnCH6PC9kiBGt1iy7I7FjUDGg8xlinIRrU6cF7
	pWJMkYdOBV6GgM2ZsuSHIiqlU6BaJOjK+WVY8ZEb43i+nOUFie45no2KcBVlbMdcyAY78qZXafCiR
	QVbrnqU1+vJS0Os=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUOO1-000ILG-QY; Fri, 20 Nov 2026 14:10:41 +0100
Date: Fri, 20 Nov 2026 14:10:41 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Rustam Adilov <adilov@disroot.org>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Linus Walleij <linusw@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Taiga Ogawa <zectaiga@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: tag_rtl8_4: add support for RTL9607C
 tag variant
Message-ID: <e9964125-48a8-4a0a-aedf-1c22aed891c4@lunn.ch>
References: <20261119165129.26693-1-adilov@disroot.org>
 <awA2z07l0ZvzcWtc@analog.com>
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
In-Reply-To: <awA2z07l0ZvzcWtc@analog.com>

On Fri, Nov 20, 2026 at 01:09:42PM +0100, Alvin Šipraga wrote:
> On Thu, Nov 19, 2026 at 09:50:51PM +0500, Rustam Adilov wrote:
> > The RTL9607C family of SoCs have an embdedded switch that utilizes
> > the same Realtek CPU Tag protocol 4 with 8 bytes in size but have
> > a bit different of a layout. And that layout is also different for
> > TX versus RX sides and introduces new fields not seen by RTL8_4.
> > 
> > Add basic necessities for this cpu tag variant to function.
> > 
> > Tested-by: Taiga Ogawa <zectaiga@gmail.com>
> > Signed-off-by: Rustam Adilov <adilov@disroot.org>
> > ---
> > Tested on OpenWrt with 6.18 kernel version [1].
> 
> Mainline doesn't have the requisite DSA driver to make use of this
> protocol. Andrew, is it normal to accept tag protocol drivers without
> the corresponding DSA driver?

At minimum, i would like to know the DSA driver is on the way. It
could be posted as an RFC. Best would be to make it a patch series,
the tag driver and a minimal DSA driver. That would be normal.

	Andrew

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320642;
	b=2+Hif0WcoqZQJYdlGXoG8tQayraMvEl7TvRFO439e0cD7phJxhATY7P0otfpsNfzwWnE
	 07UAJ7qOFUucpUemWGFz87VAj3XTksz5VhT9tksntjN1IGHwiTq1Ulu/YMtswlDjHt4df
	 0otBDK0DJ/ApUbHdKZbN5KHwF8o/ndV6xlrG3X9xoNLrKxH2UMjEh3HOVmatbdmqxP0Kc
	 Pt5odSLkjC5UHi+3lWTLALKGx9haeBsRSJJkgLsBQYpLAqtepqkPr7nJUbukOI3ZHiWso
	 ArSvPUqmVLhwdNOo8JS1l5BlEQaM1YmtHyKFzbhdqzRLbYJ+b6qpFw16tOJdOyEz7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320642;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=F4mN48hur/hnwPKJx2MzvhdiyTLGTAwTU2udreX/VTk=;
	b=CruR6jtJjgvo+QjUO5yyi/uJmjhMli5k7C+atfeypBuC1Flzj6WvDZnFwkpQZd/2t91T
	 h8EXo8VvaZT5cU+LGlBfSgPw5D7LnNmobCncaMoPUvL0+S/ybBi1kcfgwp1kvRaGZzsV7
	 WucRvkXONEQWCRkKTzbxNujKCuOxJvLy/UmnQ6Wee32T/zZGhlW3Mzb05Viyenqauv8dY
	 kHO2N20ylk8DxQBG57o1BbQYoDkwsNEdCjSuYes1qNgRcJFtfuKH3mG6KKE05dK/Yv3dG
	 71+fd//yX9qyq4ix/GT8sZg/lWoCz1Hs1ViOd/A5mRedghs7IbhlOP6GKOJZ5Ww3dBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=iZqrAFEe;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49B8606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 04:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B49B8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=iZqrAFEe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F4mN48hur/hnwPKJx2MzvhdiyTLGTAwTU2udreX/VTk=; b=iZqrAFEe8ZXNnbk0OuKebsNc2K
	0sdGSKW0ZMjPW97oR0gFhUPa8faTRvdUbXN2B3ESlMU+dX4Xo8AHBd436dztvvM0JTeTg7Z2KSv2t
	EU1SWStf5uATFGqmOYhGRhy1ZYBG+by1GeR8fDq4k2iNgzh8AdaonQi3XafR15VWVb4M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUyuK-000Wpp-Ga; Sun, 22 Nov 2026 05:10:28 +0100
Date: Sun, 22 Nov 2026 05:10:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: zero hw address entries on allocation
Message-ID: <86c2de6e-0369-406f-8d8d-99bd8d538e5a@lunn.ch>
References: <20261122002633.584362-1-yuyanghuang@google.com>
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
In-Reply-To: <20261122002633.584362-1-yuyanghuang@google.com>

On Sun, Nov 22, 2026 at 09:26:33AM +0900, Yuyang Huang wrote:
> __hw_addr_create() allocates struct netdev_hw_addr with kmalloc() and
> copies only addr_len bytes into ha->addr[MAX_ADDR_LEN], leaving the
> rest uninitialized.
> 
> If dev->addr_len later grows while entries remain (e.g., adding a
> multicast address to a down TAP device with SIOCADDMULTI and then
> switching it to ARPHRD_TUNNEL6 via TUNSETLINK), readers using
> dev->addr_len such as /proc/net/dev_mcast and AF_PACKET
> RTM_GETMULTICAST expose the uninitialized trailing slab bytes, and
> __hw_addr_add_ex() reads them in memcmp().
> 
> Switch __hw_addr_create() to kzalloc() so the unused tail of ha->addr
> is always zero.
> 
> Link: https://lore.kernel.org/netdev/179012275175.2160803.16091441325063775173@kernel.org/
> Signed-off-by: Yuyang Huang <yuyanghuang@google.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

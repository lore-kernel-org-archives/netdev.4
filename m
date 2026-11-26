Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701210;
	b=YSJLlPbQ15jSJ+PX1u3Z/h3oiXAt+JhLGse300/WKBbpf7CR1ytP71onlz+FHDZveKDK
	 LOVMOoPAyj1LzXil4kF/JBRrnnimCKrzQ06SDQKYMFfyJPalwitHN0cyBU5d9YP6IAOSx
	 LeOE3ffGDiEybp9UesdsB/d2qddNQ4SYWZwAfJbIPK2Uyb0BSr5UtKVeHxloTStPJWRkA
	 hU+9VOWTue1Uf5Mm90X7CQIjiKq3Imwv69HWId0MKXA4Td5TztdwfpERj/6HkEZAM2nW3
	 KyC0nD9hH7MwlABjhYPmKjcXSWw2xJyhhyQ7Mk88c/C4EMKnjlSFxIvvBewU9tUsvwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701210;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ebV0y2jEvuYrRrJWZSxKZ6e5HO0MkayUBG1tVhWaWqI=;
	b=qMcfCTlIUXYxtwLsoWgCbzCsXwBWsEYosVbJ27M1SN3gv28pym9dQz8TxIo6+FLf5beK
	 SRv6XioDM9EsLdonsbrLh/5PmepnZwm8GbhanpSVxxE0OY2a+X81RCHKFk8XFxdOSlHFf
	 sI0vJMZr5kt/+FCmvnXwJ+l59NO7hS6tfyoCQB+UXhN3s6GcTDaXNrqbOWt9rILWsjwvm
	 h6qhUjzcB/7bBLn7FnqcU2VlI80Q1btI4HMWxB4RB9HjacKPO9hdbKadCavlwMwV/xAap
	 nDhydXNgEKO28lpqh8G6YDIPSk8YpuF6UKlHBn0s+KudZsJ2qHZX5Pll7waAS/glopA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RK6jupH3;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28BF606A69E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28BF606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RK6jupH3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ebV0y2jEvuYrRrJWZSxKZ6e5HO0MkayUBG1tVhWaWqI=; b=RK6jupH344+N2xFlW/rgEzvAzN
	c6withQ/8rbTe+6dgVGjK/mCKU1nKIX8+WRLuH1LFyR4GBOTYdKX1ladVDx4q390RgNiLIQ+Aj+gU
	dJ7gUHvhQzNLq4M9wW541Y1/ryM1zk+sAVrg4vkyNowEt2kINqx4os3NFdDDdVF4s6FA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWZud-001Zo9-V5; Thu, 26 Nov 2026 14:53:23 +0100
Date: Thu, 26 Nov 2026 14:53:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Unregister the MDIO buses
 on teardown
Message-ID: <897d6fa1-69f6-4f4f-a7d5-88480128174b@lunn.ch>
References: <20261126034725.64709-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261126034725.64709-1-mmyangfl@gmail.com>

> +void yt921x_mbus_int_remove(struct yt921x_priv *priv)
> +{
> +	struct mii_bus *mbus = priv->mbus_int;
> +
> +	if (!mbus)
> +		return;

Can mbus be NULL when this function is called? Either setup was
successful and it exists, or setup failed and it does not. 

	Andrew

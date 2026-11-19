Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094853;
	b=2rZTQ9uuyqe5Np95y8OWeFH7ZrpYL5vXq7dY7xLjGtus7OJhLbjFaqiAINMiz4EwOECc
	 0TAyGQcMFrW6Bund6Y2/n6Ny16l2ThyCu34kfkgNg5Go94xXkFzXfFOjH6kyapbb9GDCb
	 eBL9USP0zeD3YY44TFufFrq+otqvKRCduHIXqok0KK6Ddq0y0j1FjYzbRN1dnbLCrlQlM
	 qMk4SDJW0Nk1AWG5N1afV6uln3Z/GuLyGiV/OYlRdd59iE0K62cL+mbNKF3bxsO4rZ6Lh
	 nyUGqv3eYFZUjGfvRbpqvRo1RRdZ3boxMXuixPpbPZ0Iir5JVqrdQUeczfJINi8L7Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094853;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=6iUGcJ0DFQew68LvzDgPOPMWSLkb/FS70T9kFlbnDQE=;
	b=lZEtAS4deIkFGq5Rfass6t3a9NSIL6EiyBKuFxbsQtx6aCN1e8KMjgmp6IN2iLoxj2SW
	 PA9lHt5m+zSz8QVrai5W5SKZ8SHL5RC45Fj/xiZjevvzwdsoZ8cKS00ZjFmjkb+/NsCaK
	 xqDLwTTPAu3CWsUK8DHs96+aY5QJsrM3CDw8ItONBe/Tk//ceyieqSUbD9LHIQsiC+qsT
	 0xMOk7ipFvVNrPbXpsR6nECb1/YR/FRg3ZzgrWmtkceWSYOiGPhTWtqcTn+FtKxtt3Q9K
	 W5rli/2H7NYnpsH9O8tBtqo9gx+nNxa2vJs1AsYW8G2pQhs8gjfmlCoj357VxIMf0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tnJgfNPg;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A08606A324;
	Thu, 19 Nov 2026 13:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A08606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tnJgfNPg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6iUGcJ0DFQew68LvzDgPOPMWSLkb/FS70T9kFlbnDQE=; b=tnJgfNPgABFgT1mCF8jbhZQ6Zo
	W1BqcL9PC7466mrOl9MPJsWhGAQ6v6fdoF9V75b5oLdMSZn4RYZo0FXJFzyo4npITSnam2qKKvnx7
	TxnOZOGWweLSn41wC9nwgIx5AKKw4wbRhAUR7gRBQSh+G8L4GvW9jgFSpwFFhi48rvrY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU2Ah-0002Qo-0e; Thu, 19 Nov 2026 14:27:27 +0100
Date: Thu, 19 Nov 2026 14:27:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kimberly Morris <gy770616@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Subject: Re: [PATCH net 2/2] net: phy: broadcom: release PTP clock with PHY
 devres
Message-ID: <4ef47f7f-2721-4d4e-8f9e-8555de60fe9b@lunn.ch>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
 <CAD-64DcTO2Vro3QFMizUeOft1ptFgKEK=MgJ-mDf5nVOkFkJxA@mail.gmail.com>
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
In-Reply-To: <CAD-64DcTO2Vro3QFMizUeOft1ptFgKEK=MgJ-mDf5nVOkFkJxA@mail.gmail.com>

> +static void bcm_ptp_remove(void *data)
> +{
> +	struct bcm_ptp_private *priv = data;
> +	struct phy_device *phydev = priv->phydev;
> +
> +	if (phydev->mii_ts == &priv->mii_ts) {

How can that not be true?


    Andrew

---
pw-bot: cr

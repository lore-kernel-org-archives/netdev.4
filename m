Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010927;
	b=ol47E7Zz4jGlwiV2yq+UQ2P5s2a6AivYuHUBF3e0RSkWlbph5prrt5StvtsvDIZ+iUiF
	 ckB7zjqr9GbCZ2tSNFVUUKGlwC2tKPvudXM9itgCMHLrzI6e0ro8OLL+ao/ABDo/hQObB
	 ktebvJm4AigXSfSZNQdoNbGcm1XLYwAD91NpGs5ve82ILdppKT5Zm7K3NHNKnebZRH49U
	 ArptJrC7IqQ4PuCR/pzytjCbIO7AhTCTUslgKvFeFYa76Yb1zwd4487trW6Lj0DXcsd3K
	 ENChOm7XA2JzVM3C9mdl+YXCHtKBhCgI8fiA10Mdpig9FQltKOkPvp+CTCIPStTOqmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010927;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=jbKO0uwVS8GzwQRuvY5yQET3zD+rEr4Xm6BCH+x48Yg=;
	b=oYz8vSVUQnnHyRh6Pu5jDcmOIy/7KlPzUIL59CEYLaE9V+DfVHeuTurHPUFFObtJyBek
	 ZrT58goFDj8iIPc87qmGGBxxn1MrP1fcmzTxiZg6lTaAfFrb9VXePY1t660rLlm1u6AZn
	 mwvJFu77KtuPoZKKQELEE0m7Izlo+6l3Z48DztCFYlPmUFvB5HBv03XGqJe/PEJFZYWju
	 bBIzdSs0nCvBNMxIX2dhYYMYSrRnTriGBayMGLyaqoEcXPLOF6reqM9hLPyc35Kd7cytk
	 E+snDSMpBrT32Ajcpx1Fz6oUNquOPL9jOGX7Rk2TjmPm29FZHMWbfhPzYm8+qijfXBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Wx0emL7Q;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093E60A260D;
	Wed, 18 Nov 2026 14:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7093E60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Wx0emL7Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=jbKO0uwVS8GzwQRuvY5yQET3zD+rEr4Xm6BCH+x48Yg=; b=Wx
	0emL7QLSlyC5sL3ZnW1ayJKSYpqaTAxjtdLTMcbpeuN/R+cuYu5DBfYn3fZbCBaNv9lARLdumNleT
	TJmB/aOeVVO94DFEEIKLxmf5AAoBkZlf2fbNQuFd9bkQ3erwbtUHLFCtI6Rt5RDC1mPxbq5Q7ys90
	16kFrsY3xti2kH0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTgKz-00HQzC-FQ; Wed, 18 Nov 2026 15:08:37 +0100
Date: Wed, 18 Nov 2026 15:08:37 +0100
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
Message-ID: <94231f63-940f-4788-bba4-a076a0b12d8f@lunn.ch>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-64DcTO2Vro3QFMizUeOft1ptFgKEK=MgJ-mDf5nVOkFkJxA@mail.gmail.com>

> +static void bcm_ptp_remove(void *data)
> +{
> +	struct bcm_ptp_private *priv = data;
> +	struct phy_device *phydev = priv->phydev;

Reverse Christmas tree.

> +
> +	if (phydev->mii_ts == &priv->mii_ts) {
> +		phydev->mii_ts = NULL;
> +		phydev->default_timestamp = false;
> +	}
> +
> +	ptp_clock_unregister(priv->ptp_clock);
> +	skb_queue_purge(&priv->tx_queue);
> +}
> +
>  struct bcm_ptp_private *bcm_ptp_probe(struct phy_device *phydev)
>  {
>  	struct bcm_ptp_private *priv;
>  	struct ptp_clock *clock;
> +	int err;
> 
>  	switch (BRCM_PHY_MODEL(phydev)) {
>  	case PHY_ID_BCM54210E:
> @@ -949,6 +964,10 @@ struct bcm_ptp_private *bcm_ptp_probe(struct
> phy_device *phydev)
>  	priv->phydev = phydev;
>  	bcm_ptp_init(priv);
> 
> +	err = devm_add_action_or_reset(&phydev->mdio.dev, bcm_ptp_remove, priv);

Consider if it makes more sense to not use devm_.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

says:

Netdev remains skeptical about promises of all “auto-cleanup” APIs,
including even devm_ helpers, historically.

	  Andrew

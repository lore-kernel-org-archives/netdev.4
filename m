Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366042;
	b=ic71Ty9M65YmkPNPwHCZQEnJF6f/f++jTUvKSgSvsbEd+85Y2mdA/E+3nn/b4s8PczHO
	 6jUgo1XKJQ74GLTPVFzKlPa9FeRHrKD1//F5FIVBAW5cKuOoDzDcT0Uj5b4geB+pIjrgI
	 9pe8111ofhT2QXkHkHw8154lLg3FiT2I/5p1an7DkvZouZxeRXKVEY8yrONGXvRRJjJB+
	 Aj8WMcLCtp7vTHYPISFokFdCpoEA1C2IP9v7+q3kb7gNJ8vrsD2tLlS4XPIIMVNbhMhEG
	 JUKyoJWdu0OeE3XzEONqADkQ9bUJF938O/o0QYk9EP3fbZ9cRM0JQt/2O7HCLVxdkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366042;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=j6ElqDaZMsgeILsrFsQEoNXzC/7MuQ/oW+AvP106PHQ=;
	b=JvJBfwX7mURajCLv62WrAjUjc1loZENP5AsA16F1bI++XolNTweKdowj3Lxts4keGu5z
	 cnFOUGjP4mJhTAQEvZOMJJliXIFiYM5jtzJNfF+0wHjYYp4ccjXewkgQzmNg72wz+VkVL
	 2EFlZOzRsaWkykrAJkkjxM/BVp72JQzzgKtn4CGpxYJ+JoFzVb0QnaLbeMZlbkQPYbiEM
	 qQrejMFBe8uSX5v3bflGjfRxawJrh4Nu9Xzf1jb10TEqKOB5+6VLpZFFpdRpVeBnce3Xo
	 H98xQTurixdUOv/mUboDReSUvyPHelkdvzBaV1K2oaZEqTqaLx7XfpClcX3TV2L+NnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0TwXIxCZ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83798606A330
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83798606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0TwXIxCZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A9E274E416E5;
	Sun, 22 Nov 2026 16:47:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6834460512;
	Sun, 22 Nov 2026 16:47:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B72611E6257F;
	Sun, 22 Nov 2026 17:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795366038; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=j6ElqDaZMsgeILsrFsQEoNXzC/7MuQ/oW+AvP106PHQ=;
	b=0TwXIxCZpyJzluO4Otef5fhtskfek3eFZUrcY7zZkbxpkJlQOqLSIlU+bdnxEI4ZcE6k/Y
	qV9im3CO5OK3zdgCZaEdt6NA5BtHerVgTVW5gjQtj3kH2ih4GDsARlOZWIEso0wAlhUYHI
	lCGXvNiBOwG/9lyqpBWsMb55IJ4U6ZUeu5WMfrVztpNK9fs+7mEdPz6S0nHDvTIbKK9OnC
	oCUDsyagmtk47GYt27K+/BsfgVufIElepIBh1zSTXybHhc1BeazZunRmnNR96DWPyGICk5
	UeSBlPFaLHJRQyaHvAeGK4MxazJxBWLo9oBPJ3mblZRE1qUl9HKaTfbJ1BpWWA==
Message-ID: <366c33c9-6747-424f-8df8-71f94320a857@bootlin.com>
Date: Sun, 22 Nov 2026 17:47:11 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/5] net: stmmac: dwmac-sun8i: Put the EPHY
 clock and reset after the MAC
To: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
References: <20261120-sun8i-emac-mux-uaf-v4-0-57eba8915f25@gmail.com>
 <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-sun8i-emac-mux-uaf-v4-1-57eba8915f25@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/20/26 11:45, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> sun8i_dwmac_exit() unpowers the internal PHY through ephy_clk and
> rst_ephy, but the probe error path and sun8i_dwmac_remove() put both
> before stmmac_pltfr_remove() calls it. If mdio_mux_init() fails after
> the scan of the internal bus has powered the PHY, this is a
> use-after-free.
> 
> Put them after stmmac_pltfr_remove(). The explicit unpower in remove()
> is then redundant.
> 
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73..9fb398f7cf9e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1236,7 +1236,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  		ret = sun8i_dwmac_register_mdio_mux(priv);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register mux\n");
> -			goto dwmac_mux;
> +			goto dwmac_remove;
>  		}
>  	}
>  
> @@ -1244,12 +1244,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -dwmac_mux:
> -	reset_control_put(gmac->rst_ephy);
> -	clk_put(gmac->ephy_clk);
>  dwmac_remove:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	stmmac_pltfr_remove(pdev);
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
>  
> @@ -1262,14 +1261,12 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
>  	struct stmmac_priv *priv = netdev_priv(ndev);
>  	struct sunxi_priv_data *gmac = priv->plat->bsp_priv;
>  
> -	if (gmac->variant->soc_has_internal_phy) {
> +	if (gmac->variant->soc_has_internal_phy)
>  		mdio_mux_uninit(gmac->mux_handle);
> -		sun8i_dwmac_unpower_internal_phy(gmac);
> -		reset_control_put(gmac->rst_ephy);
> -		clk_put(gmac->ephy_clk);
> -	}
>  
>  	stmmac_pltfr_remove(pdev);
> +	reset_control_put(gmac->rst_ephy);
> +	clk_put(gmac->ephy_clk);
>  	sun8i_dwmac_unset_syscon(gmac);
>  }
>  
> 


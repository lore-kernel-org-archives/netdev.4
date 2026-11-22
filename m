Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365595;
	b=Y9sMcoh+4SpA9CbXTmBJKn+EU2llT1KKF6SHXpzjI4biB6J6eoDJAPjWpQULBPLjDc7j
	 q6DaVNTY7zfxjo92oA11+eKc0iUwJglhV1HRz0oj9b52xc5tucrtzjh8+4kEfgqA5QoHD
	 4pYJ/8lLSkPirgbN+d/sD7iwXW7llA8H0/7LCAsXYc//fGEx69hKa0a318OXDrjDZCDnW
	 /Y48+qoILUCfrPu/xK9TyKNpb75PE5xUBTvt5N0Kz8A0bTJNnwkyGMT0ag+G4ZFKODObF
	 CBUFwgtOSyO1i9NnBap5+qjsn2cRVeb0JzUtQDN84wqswgDWmll+2HETfmMcODP7VaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365595;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=OoKBRcmrTDIDRIbLA9s0zXdXJ1T41upq0j5GITw3Se4=;
	b=BA2spcqVoqDAR9r5OhZbfVst9yoWoEJS3r+eUzo+2s8joCpCUU6Ms+4AwHObt8yzZIAy
	 Nl3lVmRdyX6/NKowwHCmtwVfEyjxHDvEVIVEXkfSocFEvnaM6tdEBnjixEEuX3dLpucf+
	 PI2RLZ2y54HSuUPI2TwYwFtCZ+xG2MTOKJg1WKsBN74bHUOS/iMcUTd0am57O75nLlIO0
	 6uTLROaPRBJDdxFK54m2xNwLsKrmARoBaUzBUy2seoDBAo41K+X1ut2Aw7onO2pwp6e5O
	 LR0lF5ZfO/s5dSOUOd0+TTsku0v/1TztFW0mf6nvC3UaDXF+t4g01m7FWh5CqUzZ71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SF3dONSk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18C606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED18C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SF3dONSk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 813F54E416DE;
	Sun, 22 Nov 2026 16:39:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39EC060512;
	Sun, 22 Nov 2026 16:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1BB111E624BF;
	Sun, 22 Nov 2026 17:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795365592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OoKBRcmrTDIDRIbLA9s0zXdXJ1T41upq0j5GITw3Se4=;
	b=SF3dONSkTk5Y0vNM5gm5TfPWc+ZbCt79W+USBvAJ/dr8O9klVo8/nVANu7b5aKENGSa1zc
	ETwJu+KtLet8uAatVZ1erSu371CpbWEeuRY8i9Q2b5VL3k1LKytC2MK6uH1LmGU/g7TbOO
	QN2tW15nb1pcEZFSaKDHHKmCiMvsDcMuludPaXVnKP5YIOCE4bP3LjvTcvVGoSymalLgeE
	cAgSK42KPCgOsUdoMVMg+uLfYs4UTfHGrNFml7Iq6iZg3kUjSLSWqOerzRL4pVT5Y8ohqJ
	VZmy9aWrGexT+6C1PUj7mQyrKxVQxbvpdYO7jZXwDswLlMnQ4FjcA6b/4EhTcw==
Message-ID: <b5b6953e-6b17-4de3-b3b7-789a415e03ef@bootlin.com>
Date: Sun, 22 Nov 2026 17:39:47 +0100
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
Subject: Re: [PATCH net-next] net: stmmac: eic7700: Use
 syscon_regmap_lookup_by_phandle_args
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261121170753.161170-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/21/26 18:07, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> There is also no real benefit in printing errors of missing individual
> syscon arguments, because this is done just too late: runtime check on
> static/build-time data.  Dtschema and Devicetree bindings offer the
> static/build-time check for this already.  OTOH,
> syscon_regmap_lookup_by_phandle_args() already handles error case if the
> number of arguments is too low, thus switch is safe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you,

Maxime

> ---
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   | 30 +++++--------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index c229275b11b3..287f717ab3ed 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> @@ -170,6 +170,7 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct eic7700_qos_priv *dwc_priv;
> +	unsigned int hsp_args[3];
>  	u32 delay_ps, val;
>  	int i, ret;
>  
> @@ -254,33 +255,18 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
>  	}
>  
>  	dwc_priv->eic7700_hsp_regmap =
> -			syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> -							"eswin,hsp-sp-csr");
> +		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
> +						     "eswin,hsp-sp-csr",
> +						     ARRAY_SIZE(hsp_args),
> +						     hsp_args);
>  	if (IS_ERR(dwc_priv->eic7700_hsp_regmap))
>  		return dev_err_probe(&pdev->dev,
>  				PTR_ERR(dwc_priv->eic7700_hsp_regmap),
>  				"Failed to get hsp-sp-csr regmap\n");
>  
> -	ret = of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 1, &dwc_priv->eth_phy_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_phy_ctrl_offset\n");
> -
> -	ret = of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 2, &dwc_priv->eth_axi_lp_ctrl_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_axi_lp_ctrl_offset\n");
> -
> -	ret = of_property_read_u32_index(pdev->dev.of_node,
> -					 "eswin,hsp-sp-csr",
> -					 3, &dwc_priv->eth_clk_offset);
> -	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "can't get eth_clk_offset\n");
> +	dwc_priv->eth_phy_ctrl_offset = hsp_args[0];
> +	dwc_priv->eth_axi_lp_ctrl_offset = hsp_args[1];
> +	dwc_priv->eth_clk_offset = hsp_args[2];
>  
>  	ret = of_property_read_u32_index(pdev->dev.of_node,
>  					 "eswin,hsp-sp-csr",


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537395;
	b=Orlbc4bpkref+CKeIFGdl/L77/4HDOcPo+xYzIxEULjUhEv712JWUVh95+MSA+BQitYU
	 ssQitFoTRWZXgT+MOneRILMn89b2mLLB2Ms3nZSk+ill6+ekpthPM2sh9RGhM+ZKs5NbJ
	 iENb9bf52QRzCUzaX7qee3Vc2IDVEB1bnnVresiysv4FSObskfQ8N65F8lwalioobZtSG
	 gLjonPveUrWTMuvCgrqkiWUz3gdJADfwRm/sAavbNfWoarHlqZC5gh7mKPDKHh4HQBGcc
	 e++HN1i4yitaBvdvWnkIWeNlBl9GPYXAY3Cct0uR4PLQR8OuxWmWtmsGfQuXF0A5CTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537395;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/fAyJeLPX6psmcLu3bRtntJrGTBMuzXSqMGDafrQVq4=;
	b=UDOzMt+E4AfTVWEsVddxCgoa3DK2nKF7Wp0fQsFc6jimbZNCLZH3B9Enh71v61dIRO89
	 6B4iSy7uE9nVX1/84VphBTYZjypqgpRgtl8KnaWnUsSwIO/D2Skp0wJ2RgGxbvAh2GRbu
	 dB7pUAvNPeuu9dnjChJMDfwZX59oep5nmvuGXxunhE3PQonbvT5E0z8Y83Z3YxiCNNDOZ
	 FMYfyp4CoVC0MpzpK2AksQGXfdryk/Vpb5XhTXZPJDjYhcHAb0HU+SS00/8AmWcobWERW
	 38dvHcq+9ihm+6q0UlkjwRssb4ymQE4jQ8rbTZfZplNcBYSyjMjZLUL1FudkOVpZ+6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X7Ugrn8W;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160E606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C160E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X7Ugrn8W
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 29E3C1A17A6;
	Tue, 24 Nov 2026 16:23:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E82E7601E1;
	Tue, 24 Nov 2026 16:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29D3111E69A5A;
	Tue, 24 Nov 2026 17:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795537387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/fAyJeLPX6psmcLu3bRtntJrGTBMuzXSqMGDafrQVq4=;
	b=X7Ugrn8Woddfokr6FLA20qbzDK2NELl4DQDx+HPPXRfk/l8yWbz11HRU+N8n6PDS8Oepap
	umVsvpBz6qia0hLPmeEwLkIHawgA3+FXb45ikrpmTAVQIO+eQH+XX7GMs6fUl5zjSRs7jS
	YMk+zRR1fZcF4HS9/IytPMFK8vyDkhWqVsmSASsAiLwOP+SNiPHrCkubDGFo1LDafaoXde
	8qkGXCsYZurAGUNPPLmlS1iGSh97K/jzDT7Q/JRriSfRhneLQDsXijDLeYXP9jPxXUGw3q
	BtlZOsLo9J3IrYAF5pzd2gas1FtJFxJ5nerJMiccqOrGEU60u9wIYfLvoLcZUA==
Message-ID: <1498b3ff-c43a-4087-a108-016fda1a5b03@bootlin.com>
Date: Tue, 24 Nov 2026 17:23:03 +0100
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
Subject: Re: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261124150144.7505-1-jszhang@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261124150144.7505-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/24/26 16:01, Jisheng Zhang wrote:
> If platform doesn't provide "snps,blen" property, the axi_blen[] array
> will contain random value from stack, then the array will be converted
> to mask which will be written to DMA_AXI_BUS_MODE reg later. Fix it by
> initializing the array.
> 
> Fixes: efd3c8cc52bb ("net: stmmac: remove axi_blen array")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

I let you answer the bot on how that was found, etc. (it's better
to put that in the commit log anyway)

Thanks,

Maxime

> ---
> since v1:
>  - fix subject title
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index b3e06aa58fe5..29ead405f449 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -96,7 +96,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
>  {
>  	struct device_node *np;
>  	struct stmmac_axi *axi;
> -	u32 axi_blen[AXI_BLEN];
> +	u32 axi_blen[AXI_BLEN] = {};
>  
>  	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
>  	if (!np)


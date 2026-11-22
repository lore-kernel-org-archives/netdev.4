Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369991;
	b=n21e3OkChYK0zWHepoUgMQ4PYDr05j6cY1iapQEKZtIhlOxmM8bRTspSXMRel1vYCOW6
	 QTBlLv0QAenqHZMDY5Boak9HqrUqx3Qbham63azv88FK/uaQu/Ix2HElZK7VyYUQnZ3ql
	 nR/NjqFkQigGwnDKplNeINd0s1ry9TFhmCrV1QOH4Hi9YVsy4805RPMtEy8EP9TdqHGos
	 +HfuxJRRxDmmJIQdFI/gZOE2SrBxP/hmPGtvjGdfHQw+BLAzHj6e6DCNPNwWwsMt/0sBJ
	 A4UtjpX5KyMXbGBlU10ez6a2iIkN91S1bFtmNsNtD9v7trTtnBdbBm/Fc9A5Q61ozOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369991;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=roV1y4HiOD8riMt7NYik460JFDeSI4MlS3WQXSzighw=;
	b=TH8O6WM0ti1wAd87dBLrNMzhskwQVw8aDHiOjnL1wb48CWt/1Iak0dwrnOqDfSuSC7oU
	 aVi0s6eEIX1btWYn33JOKwRwCdU8CIpssZ7UQt26n8zCWWben2sO+k390isO+w/dUmSHx
	 YoenqebhGo9/K4zsuA9ZCWej/pTQx6PatF7DS8k45F2gxOSxdGpFsDlGvoOamD2WOsW4a
	 L6i9NGVlh/KsqdAga7Tc+ETKZWJsgJrCP4zBMoth4pU32YEcnWhEuaeveHG9PL5GEX+JW
	 YbEyWQumhH8gjE5vVGBUUZ1GN/tRwr+ZFdk485fU5Mnu+2g1C3gnEhOBM6LnoRFlLUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=X9dW6HlN;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F243606A320;
	Sun, 22 Nov 2026 17:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F243606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=X9dW6HlN
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 214D2A035D;
	Sun, 22 Nov 2026 18:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795369987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=roV1y4HiOD8riMt7NYik460JFDeSI4MlS3WQXSzighw=;
	b=X9dW6HlNjtTfX9kqmk/kpg/uFUJi1KufSMS35RCqxAYXBRngTtLx9ixLJdQVpsP8D6m+xa
	vvkVnG3xP5l1z+hZRkje0bRAGYWzMNQt57ZtC2+QfSBrVFCh4kTZvuHWvzA+zDPOuWz1Pm
	AuMUtd7zP2O66DIvLM8AE2nqsnMmQYd7k2N6m+ekxLRzZItd329n9A2FAyizovOEnBolNf
	uLJocbtMwS9bH5sSoRWwCp4R8ckLopuktYjLogMN5qrry+XR/XnpCKoUhMaOdm0ufUBYas
	b9DVeSKk4AlzV8ydg0CFOWMkViQBl7v+2pMsOnpswu0I6MSS8EX5RaTxelIgjQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 18:53:03 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, jakob.unterwurzacher@cherry.de,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: reset the DMA on a fatal bus error
In-Reply-To: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
References: <20261120-stmmac_dma_fatal_error-v1-1-acd57921af57@cherry.de>
Message-ID: <b3f78ebb57866c32046ccc60c92928cb@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Jakob

On 20.11.2026 15:16, Jakob Unterwurzacher wrote:
> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> 
> A fatal bus error (FBE) stops both the TX and the RX DMA engine of the
> channel. The DMA interrupt handlers report it as tx_hard_error, so
> stmmac_tx_err() reinitializes and restarts the TX side only.

Does it? AFAIU stmmac_tx_err() only runs when status is exactly 
tx_hard_error.

> [...]

Since you hit this on real hardware, please add a Fixes tag. Also your 
subject
lacks the target tree (would be net for a fix). See [1]

[1] 
https://docs.kernel.org/process/maintainer-netdev.html#indicating-target-tree

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> index a0249715fafaf..2147403629892 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c
> @@ -165,7 +165,7 @@ int dwmac4_dma_interrupt(struct stmmac_priv *priv, 
> void __iomem *ioaddr,
>  		}
>  		if (unlikely(intr_status & DMA_CHAN_STATUS_FBE)) {
>  			x->fatal_bus_error_irq++;
> -			ret = tx_hard_error;
> +			ret |= dma_fatal_error;

stmmac_dma_err_interrupt() still checks for tx_hard_error (see 
686b5f47f8cc),
so this breaks the FBE reset. The flag needs to be handled there too.

> [...]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 0a6e82a155c0e..bc06076410dc7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -335,7 +335,7 @@ static int dwxgmac2_dma_interrupt(struct 
> stmmac_priv *priv,
>  		}
>  		if (unlikely(intr_status & XGMAC_FBE)) {
>  			x->fatal_bus_error_irq++;
> -			ret |= tx_hard_error;
> +			ret |= dma_fatal_error;

AFAIU xgmac doesn't enable FBE, so this never fires?

> [...]

Regards,
Nicolai

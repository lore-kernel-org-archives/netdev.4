Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906785;
	b=MwrXO2wWhKnXEVZTwGMpU7xm6XtbEkaglniW0c74Vc7wZyzjSak2nRhb8okKSobMH6wS
	 9Bh3xbkNNaTQi1CFj4u9drOGmJLTUWmt71tlhVQ0JEUF4jpS5n9vYeay+MJBwex2RAMlL
	 yr0jqhCaPhucq/eMPjaUKTlTaKn7OasxMHSZBM3KUSRGDyD5ZxLrxcmb/Xt0GvVozIct5
	 CHwL1ESBzrejPUcr6azINno8N773oPacufZk0OsrSujeylrn0uXL0P8eEloZJmrI6ZS9h
	 F0gA0v0++wl20pCuc4aWjxCdYESn50YfTruR+iRact/Yag6FGKL+wbLsw7ELQWxzJSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906785;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=jHmFKQcEpErH6yTd+BcsBpSAeqJz4+fdKXvQPpS1SzY=;
	b=cezfFQ9tIQYjBeGo/00LbUmzrnM6mZ2auA+fApLzlx9Q4e4qV6SEA2mCGh/Gjjoia0Kx
	 DjS4I1Z/atwa5ecUxkDduaiC0Uv3dxL3UgMCvD6e1on8Jqc5PGQactS1/evEqlSJ+3Ebs
	 jfrnkFEluN2PoxQn0bRyjUlGFaJU+j7lMgSma14zElwDrIRB72HQEbSrq3Pk6uPdKAYro
	 a9T4NO687rkFf5/hyK9JRcKsrugyGf75qntDV7MKRylmElnNEAlFkoo36VuVy03eucIvd
	 IKza1y+oV8W6Aps8ChRwWDqxsbtcf7S4ejYdhetCy1qkx+2PwQouPTJ2xpO/BiNwTvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QohGgGDT;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C70606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C70606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QohGgGDT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 188D4C4EDBE;
	Tue, 17 Nov 2026 09:13:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B28265FC81;
	Tue, 17 Nov 2026 09:13:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D7C611BC0493;
	Tue, 17 Nov 2026 10:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794906781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jHmFKQcEpErH6yTd+BcsBpSAeqJz4+fdKXvQPpS1SzY=;
	b=QohGgGDTtw8azbIR//VvfGrlr4V+zs72XDzrDyoJRb0V8W2WTIhMsS3Om45in7H2LQEW79
	y5ssLoKHMOcRF/+IV5057ZnzwjPoUzMav9cVjrADQiDTi/ngtIi9W0tDHEewPhs5aHjR6w
	e54Y8nkGdm8O0wjLBZUwxszXdEB+Ki+9uTLld22EhInWUrVgQGF8K5kfgDzvE/t+azc1oQ
	XEvKOOiOer6Uvhtd+3T59zk6YyyeWOZ7RbGJlmmIAix6Xe7iS2HWD+uXi4/dM9a3KjopYJ
	8gb8TbQdW9aL++PfMCZtctJXUqPtztwaNOaUWyr6BdJvb/ff8yfekox+qYfnLA==
Message-ID: <a0b1ea81-97bf-4a16-895f-5b6820a46c61@bootlin.com>
Date: Tue, 17 Nov 2026 10:12:54 +0100
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
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC ASP 0x2
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 horms@kernel.org, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261114015554.2187341-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261114015554.2187341-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/14/26 02:55, Zxyan Zhu wrote:
> Commit 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC
> Core 3.20") made dwxgmac3_safety_feat_config() bail out early for
> asp == 0x2, assuming that configuration has no parity protection.
> 
> Per the DWC_xgmac databook, the ASP field of MAC_HW_Feature3 selects:
> 
>   0x1 (AS_EPPE):  all automotive safety features, with ECC and parity
>                   ports on the external application interface
>   0x2 (AS_NEPPE): all automotive safety features, without ECC or
>                   parity ports on the external application interface
>   0x3 (AS_PPE):   all automotive safety features, with parity ports
>                   on the external application interface
> 
> The reset value of the field is defined as:
> 
>   (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 1) ? "3"
>   : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 0) ? "2"
>   : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 2) ? "1" : "0"
> 
> so ASP 0x2 implies DWCXG_ASP_ALL = 1, where the internal FSM state
> parity and timeout (MAC_FSM_Control) and the on-chip data-path parity
> (MTL_DPP_CONTROL) features exist; only the ports on the external
> application interface are absent.  The early return therefore skips
> enabling safety checkers that are present in the hardware.
> 
> Drop 0x2 from the condition so the FSM and data-path parity checkers
> are enabled again.
> 
> Also update the safety feature descriptions printed by
> stmmac_dma_cap_show() to spell out that ASP 0x1/0x2/0x3 differ only
> in the ECC or parity ports on the external application interface; the
> previous wording, "All Safety Features without ECC or Parity",
> suggests the on-chip checkers are absent from an ASP 0x2 device.
> 
> Keep the early return for ASP 0x4 (EASP), which selects only ECC
> protection for external memory and has no on-chip parity features.
> 
> Tested on XGMAC 3.10 and 3.40 cores.
> 
> Fixes: 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC Core 3.20")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

Seems correct to me, couldn't test it but this matches the datasheets
I have.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


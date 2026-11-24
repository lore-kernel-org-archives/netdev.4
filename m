Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539671;
	b=DA2F4ITiuSF6DQLGc/FBhDIl33z6YaV9Eq9cujH8xeUsYhb3b92pgHG91OdW2wg1K59j
	 EpFqkiz0t517vDhweZqTo3BC0+TridgC+AygKUc/79/WIbjTfDatA14+DOGGHEJJb9ljZ
	 cF2lL9Mwqvm7cHi1/A5ilUbiW1MGhoYaBAdd/jvd32ctKasjpqc1KlgSQcKjYmBN7H27n
	 0z6JZifdNTti8nTZ3sws/vsV0U4Rwb27uc6pGycEN+pZcclWVXfzku6cbsvuf+csNMcU5
	 MSNGfBAbaxSFL6tGyWi40jUr+xQLTBIQ08h0RIeJSVlEOEAnz0WSNQrk8gepUFti8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539671;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=osciUjLQZdt7MjSZGYTDWwPTvV0Ioddqf9NzVSgW9yA=;
	b=auTOABZqoUXuunTcSF2AKFUgxu4pYqiiz9seLd4fW62Jh7VCXyodgN1IqnfJc9jVKQ+B
	 xojk1Z5pfJlc8uOscX1ibIB9f8Ir2jw32K8MISH9EzJaM90coH6+y5GpArXJIt3g94WRl
	 b6ojZSbS+Pm/l5rCTVjKANfLFvOuz+Yp8dmNcXf0l28pmLKbT06Lqa48fvHOJUVuJh9+L
	 Dj0u89qweaETWwaB+ashiFAt49++vB58dg/o4fzZjGcOJHuHGqG9lMVpsB4Ggsihl7ZOo
	 CHUs+wM8zPFhKD5dVHqITjB8PqNkDxEMy+LtYrriTj4QmgmlScrKJx8Drew1VgEpPog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tXPzzdC2;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49586606A31E;
	Tue, 24 Nov 2026 17:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49586606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tXPzzdC2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE3881A17A4;
	Tue, 24 Nov 2026 17:01:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76ED6601E1;
	Tue, 24 Nov 2026 17:01:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3EEF511E69A87;
	Tue, 24 Nov 2026 18:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=osciUjLQZdt7MjSZGYTDWwPTvV0Ioddqf9NzVSgW9yA=;
	b=tXPzzdC211i3SbKqbZRiAboCnxT82UlwM5+F9yUN0/Q/oBTHNyOmnY+pH1n7hTWlWviKM8
	H52A47MkSX29iUAtmHxVANiLmG4X7WiWyaBjAC7KboaWQNYpN+XTo+EnggbmybOPMhiqUm
	WogmMOaVloip7b7acwX9KOfRPs2APxAPo8RjJcP88GPig+au/A99VNvrtvE9IYJab1on3k
	2WPImDv4nivLj/Z258sihz4WUMEy5vunt9J+GPEhCEelwUWPjGZLEKQgYgu1jEbmozrtUY
	dBCE1PUvj/2Ea0g6oPkvmWsnch9RsiV5jHJNhiddbrXpQL+qvwXaBjUWNuM4LQ==
Message-ID: <1209f1bb-99a3-4329-a234-59da708870a0@bootlin.com>
Date: Tue, 24 Nov 2026 18:01:00 +0100
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
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: dwmac-motorcomm: remove the
 device at shutdown
To: Magnus Leatti <magnusleatti@kernelriot.com>, Yao Zi <me@ziyao.cc>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
 <20261120102754.778283-2-magnusleatti@kernelriot.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120102754.778283-2-magnusleatti@kernelriot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/20/26 11:27, Magnus Leatti wrote:
> No .shutdown here, so reboot, kexec and power-off leave the MAC and
> DMA running. This chip keeps its registers through S5 too.
> 
> Hook .shutdown to stmmac_dvr_remove(): interface closed, DMA and MAC
> stopped, PHY dropped.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 42f0b11a7b60..63ce2301a0f6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -374,6 +374,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
>  	.id_table = dwmac_motorcomm_pci_id_table,
>  	.probe = motorcomm_probe,
>  	.remove = motorcomm_remove,
> +	.shutdown = motorcomm_remove,
>  	.driver = {
>  		.pm = &stmmac_simple_pm_ops,
>  	},


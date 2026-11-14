Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674733;
	b=CGOQ4llbr9vFSH69CJK+K4tSmTmXmHO6qcWMP27W6y9mcZTpWUlh6yaee17wL0LZh9ZU
	 v6wQKKOiNS3qkIB4yKGmu2B6bGUBbxkGxUWlkiTFiolERlz9kg7AdRWtp6vdeOJOKxnO+
	 2j4A0DvHZyAdRy0Pti8L+ZEpH6IbZFzOHh/rv08LIXd3oQIDp1pMDFr82dSexErZlBK/V
	 Y6be28NlMg3r5sQy07L3r7pzGykcisrkehIVJa+rhw2pfapTPmoYgqFRwl8Y8OzpM5O+K
	 piPPIzAB2+bFmnFQK26PUXFFACW3UbvT9/HMABXgWjJe7zoI91WuG115loPcYq3oMBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674733;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=HWjhff4U2bfbc71lpan6VjQI381x45+6j+0ZgY5DOCA=;
	b=O7awWKm9BjAG9XgiGZCbYoexKTPgntByUMq1p756ZVZ0NKlichUvxXCigbje2QiBVT/q
	 k3SIylAaGCPk2Sqdph4SJSWNOlLOVvvFtxLeVaMgkW+Q0+UTKGZDVnT5qPFo36W5Qb/fX
	 /toymq8Rk/jOrt6tMgIaSzh8bMKJ5/ZKwyL53gQfRMwB8FqSAUI0u7mlFzhyO6QZ7VuWk
	 hTUBbSW446XSMEM5bFJPs0wGdo1+LxwEHvzndHibMfoeJUJ6erIieWtlyJj0vseo+g4Tz
	 shbcmxpjAo+sAtZJjVUGc7qv2RP0b/a3Ng6dQfhxEG7y2ZVL/eGAeBQOByigpJu28oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z1jg6YDn;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A3606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8A3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z1jg6YDn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABD834E415A7;
	Sat, 14 Nov 2026 16:45:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D504601F0;
	Sat, 14 Nov 2026 16:45:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B413211BC0620;
	Sat, 14 Nov 2026 17:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794674722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HWjhff4U2bfbc71lpan6VjQI381x45+6j+0ZgY5DOCA=;
	b=Z1jg6YDnUBA7PClXCcfYhR7Uf9hJgkLnLFMB21wsFkQhpM70Rlejx/ZOAbvYYdnxaWkBPh
	Ee0mhP7Cx8pmPI0bZn+XIHUhDfVJheuDyvgueA1ppsONBX0SlcIpyHaZ5sy6RBsKJKRM1Z
	oB34W/wB8rPoJye4hQgp/cqavMxw+hs9QeQewuE/YFLq+ahRll0CoH4HMQmU+Eo8nQwGYo
	Sxdc3m/QN1nkN/RAV5uL8gbcepKXhRHL8v/ddK7jozmgn1X59ZJasNvR09lYQpPHe6b8gU
	JpwDw1q0Bie6dhMYqvaVBcwkmgZT1BabnuKtsXleYLftkzHU+wKk0CU40tEH6w==
Message-ID: <ebea9af3-5edc-403e-bcd1-de875137d68a@bootlin.com>
Date: Sat, 14 Nov 2026 17:45:10 +0100
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
Subject: Re: [PATCH net-next v5 10/10] net: stmmac: mediatek: add support for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
 <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/10/26 13:08, Louis-Alexis Eyraud wrote:
> Like MT8195 SoC, MT8189 SoC uses the Ethernet control registers from
> the peripheral configuration (pericfg) but at a different offset.
> It also has different RX and TX internal delay stage dividers (290ps
> for MT8195, 180ps for MT8189), and by consequence a reduced value range
> for these delays. It finally needs additional feature such as the
> TX clock output enable one.
> 
> Thus, add compatible, clock definitions and specific platform data to
> support the MT8189 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 1a0ab95dfbf0..ce232313014d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -42,8 +42,15 @@
>  #define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */
>  
>  /* Peri Configuration register for mt8189 */
> +#define MT8189_PERI_ETH_CTRL_OFFSET	0x270
> +
>  #define MT8189_CTRL0_TXC_OUT_OP_EN	BIT(20)
>  
> +#define MT8189_MII_DLY_STAGE_DIV	180  /* 180ps per stage */
> +#define MT8189_MII_DELAY_MAX		5760 /* 32 x 180ps */
> +#define MT8189_RGMII_DLY_STAGE_DIV	180  /* 180ps per stage */
> +#define MT8189_RGMII_DELAY_MAX		5760 /* 32 x 180ps */
> +
>  /* Peri Configuration register for mt8195 */
>  #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
>  
> @@ -124,6 +131,10 @@ static const char * const mt2712_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_main", "ptp_ref"
>  };
>  
> +static const char * const mt8189_dwmac_clk_l[] = {
> +	"axi", "apb", "mac_main", "ptp_ref"
> +};
> +
>  static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
> @@ -440,6 +451,20 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
>  	return 0;
>  }
>  
> +static const struct mediatek_dwmac_variant mt8189_gmac_variant = {
> +	.dwmac_set_phy_interface = mt8195_set_interface,
> +	.dwmac_set_delay = mt8195_set_delay,
> +	.clk_list = mt8189_dwmac_clk_l,
> +	.num_clks = ARRAY_SIZE(mt8189_dwmac_clk_l),
> +	.dma_bit_mask = 35,
> +	.mii_delay_max = MT8189_MII_DELAY_MAX,
> +	.rgmii_delay_max = MT8189_RGMII_DELAY_MAX,
> +	.mii_delay_stage_div = MT8189_MII_DLY_STAGE_DIV,
> +	.rgmii_delay_stage_div = MT8189_RGMII_DLY_STAGE_DIV,
> +	.peri_eth_ctrl_offset = MT8189_PERI_ETH_CTRL_OFFSET,
> +	.mac_txclk_out_en = true,
> +};
> +
>  static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
>  	.dwmac_set_phy_interface = mt8195_set_interface,
>  	.dwmac_set_delay = mt8195_set_delay,
> @@ -729,6 +754,8 @@ static void mediatek_dwmac_remove(struct platform_device *pdev)
>  static const struct of_device_id mediatek_dwmac_match[] = {
>  	{ .compatible = "mediatek,mt2712-gmac",
>  	  .data = &mt2712_gmac_variant },
> +	{ .compatible = "mediatek,mt8189-gmac",
> +	  .data = &mt8189_gmac_variant },
>  	{ .compatible = "mediatek,mt8195-gmac",
>  	  .data = &mt8195_gmac_variant },
>  	{ }
> 


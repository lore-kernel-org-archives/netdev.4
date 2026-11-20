Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170188;
	b=KP7hToCJwWK49685l+jYU3e3tos9aR2PCDzx9/73YxF0UUVvl6183ui6R4wfu9g85PaU
	 7mVG2vxfTVXUS+ybV59c7ROEq5SvBqlCO5pZPeFDO3MNDt7KNgTRuEizBzzs56MRDiw7A
	 q4XGmERZDitudIgfTAh1jLzjXZrj+5Idkpskk8Cj+utZwjFhnNfPy4K1GkXwgls20zGRc
	 oF9xC5ULlPHnhH4PQZ9MHYkUirogRXdJcnwKAcsJgb4xq9TGUfZNmzZ3ckU/z/056abOx
	 0EGkCkATyFWbq/lS9pDzL06RNPquAxTgBkNY9XI94hnyKfIy394g3gOL/ACyjFAUU6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170188;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=l0oOPOqoS6O4eTceK2XRqL1eFQ1+GtanbURyb8V/HdM=;
	b=xUXGehp8y+00NMW7qa628kbWdFh7GqjbVyuWSFvnjZlWnywhz6Ds+tdz60oltS/+M8C9
	 t+ZR+Xsk28gVDsRJ1IaEaNuFZdXTFB0flNEe25dw6MMGMR4NGwN2BxygC7OwIbJ82Uaxu
	 IU83aQFoyxrRI7WZX4H5HBDtfCbboZD8PeLNkqv4LMIo3wzHy/PazGY6K+Fu8/0fVbZNp
	 6k7+RtV8Ok1+R+eyodhdugPuIFi/IjgMzVE2b/yrDsh53Sepel1+fXOMIypAisjHHG4tL
	 hpSPcQOx3dxAj+2s7khuTn/h83AMSzQylXXn5eFsL8D5fuskwEDimdqRi2voQ277qBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="ahd7y3/K";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B2606A320;
	Fri, 20 Nov 2026 10:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ahd7y3/K
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D55FA1A173D;
	Fri, 20 Nov 2026 10:23:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FD656017D;
	Fri, 20 Nov 2026 10:23:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4C9E11BC12B8;
	Fri, 20 Nov 2026 11:22:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795170184; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l0oOPOqoS6O4eTceK2XRqL1eFQ1+GtanbURyb8V/HdM=;
	b=ahd7y3/KRLuGXbKFuJU+sxd+SulSkEpFUj0w5OZpcYq5//6lLr9VGTmhC5bn1uNU34NAFQ
	VgMt1quyUhSy/wdHc6zIdOlgPHtlRkc8egnwFMyV2IS/Tb9i+qWitgDT0rjkcMlO2/FgE0
	+yJtKtQbgPFvWRA5jJRxVWPgmpG1SVOB8PXKmwdia1f3KT3MaIjDwIWhtEH7+hKrPoRHIv
	HNPRjRYbVxc7PWTBTiYblxaDqOpob+PAg1ig0X+T9oNuuU5HrLqeZ+K1s5ZXClDSeXGfbl
	t6xJTj64pdfciybVB7yE5UI1JOS40s0qXFGUYDBda26jPjV1149d4nh9LCXtHw==
Message-ID: <4f7183c4-5a59-4c4d-8f33-a307fad4d7e3@bootlin.com>
Date: Fri, 20 Nov 2026 11:22:55 +0100
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
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 ovidiu.panait.rb@renesas.com, recv.jo@gmail.com,
 muhammad.nazim.amirul.nazle.asmade@altera.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <179510815456.3136.11469597684415088@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179510815456.3136.11469597684415088@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/19/26 18:09, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] This patch is a bug fix but carries no Fixes: tag, and the
>   subject reads like a new feature ("Report the VLAN tag type from the…
> - [Low] The ET/LT macro names in dwxgmac2.h disagree with how the new
>   dwxgmac2_wrback_get_rx_vlan_proto() reads them.
> 
> --
> 
> net: stmmac: xgmac: Report the VLAN tag type from the descriptor
> 
> This adds a get_rx_vlan_proto() desc op for XGMAC. The op decodes the
> RDES3 ET_LT field and reports either ETH_P_8021AD or ETH_P_8021Q as the
> stripped outer tag type. vlan_rx_hw() now uses that op when it exists and
> keeps ETH_P_8021Q as the fallback.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> index 6719ac6e395bc..71ce2bc9b5e11 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
>> @@ -76,6 +76,18 @@ static bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)
>>  	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG;
>>  }
>>
>> +static u16 dwxgmac2_wrback_get_rx_vlan_proto(struct dma_desc *p)
>> +{
>> +	switch (FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3))) {
>> +	case XGMAC_ET_LT_VLAN_STAG:
>> +	case XGMAC_ET_LT_DVLAN_STAG_STAG:
>> +	case XGMAC_ET_LT_DVLAN_CTAG_STAG:
>> +		return ETH_P_8021AD;
>> +	default:
>> +		return ETH_P_8021Q;
>> +	}
>> +}
> 
> [Severity: Low]
> This isn't a bug, but the macro names in dwxgmac2.h don't match how they
> are used here. The only comment on them is:
> 
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h:
> /* Error Type or L2 Type(ET/LT) Field Number */
> #define XGMAC_ET_LT_VLAN_STAG		8
> #define XGMAC_ET_LT_VLAN_CTAG		9
> #define XGMAC_ET_LT_DVLAN_CTAG_CTAG	10
> #define XGMAC_ET_LT_DVLAN_STAG_STAG	11
> #define XGMAC_ET_LT_DVLAN_CTAG_STAG	12
> #define XGMAC_ET_LT_DVLAN_STAG_CTAG	13
> 
> Read outer-first, XGMAC_ET_LT_DVLAN_CTAG_STAG means an outer C-tag, yet
> dwxgmac2_wrback_get_rx_vlan_proto() returns ETH_P_8021AD for it. Likewise
> XGMAC_ET_LT_DVLAN_STAG_CTAG falls through to ETH_P_8021Q.
> 
> The commit message says "note inner/outer is reversed in the macro
> names", but nothing in the tree records that. Could the macros be renamed
> (for example XGMAC_ET_LT_DVLAN_OUTER_STAG_INNER_CTAG), or could a comment
> in dwxgmac2.h give the tag order? Otherwise a future user of these
> constants could easily invert the mapping.
> 
> If the names do follow the databook's outer-first order, the mapping for
> values 12 and 13 would be inverted. That can't be checked without the
> databook, so it would help to confirm which reading is correct.

I don't have the databooks. The AgileX5 doc is pretty clear about which
value is what though, we could rename the macros but that's not very
urgent IMO.

> 
> [ ... ]
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> index fb9aad748cb34..bf23d82e9f383 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c
>> @@ -209,8 +209,12 @@ static void vlan_rx_hw(struct mac_device_info *hw,
>>  {
>>  	if (hw->desc->get_rx_vlan_valid(rx_desc)) {
>>  		u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
>> +		u16 proto = ETH_P_8021Q;
>>
>> -		__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
>> +		if (hw->desc->get_rx_vlan_proto)
>> +			proto = hw->desc->get_rx_vlan_proto(rx_desc);
>> +
>> +		__vlan_hwaccel_put_tag(skb, htons(proto), vid);
> 
> [Severity: Medium]
> Should this patch carry a Fixes: tag? It looks like it fixes a
> user-visible regression on XGMAC.
> 
> On XGMAC, __stmmac_dvr_probe() advertises NETIF_F_HW_VLAN_STAG_RX and
> enables MAC-level stripping by default:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__stmmac_dvr_probe() {
>     ...
> 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> 		ndev->features |= NETIF_F_HW_VLAN_STAG_RX;
> 
> 	if (dwmac_is_xmac(priv->plat->core_type)) {
> 		ndev->hw_features |= NETIF_F_HW_VLAN_CTAG_RX;
> 		priv->hw->hw_vlan_en = true;
> 	}
>     ...
> }
> 
> stmmac_fix_features() also keeps STAG_RX tied to CTAG_RX on XGMAC.
> Because of this, every frame with a stripped 802.1ad outer tag went
> through the old vlan_rx_hw() and reached the stack labelled as
> ETH_P_8021Q. 802.1ad VLAN uppers received no traffic and QinQ between
> hosts failed.
> 
> The sibling commit da17990421d7 ("net: stmmac: Disable S-Tag processing
> on dwmac4") describes this exact failure and carries a Fixes: tag. Its
> message says the dwxgmac2 side can be fixed using the RDES3 ET_LT field,
> which is what this patch does.
> 
> Without a Fixes: tag, stable trees that pick up the dwmac4 half would
> still mislabel S-tags on XGMAC. Would this be a suitable tag?
> 
> Fixes: 534df0c1724b ("net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN stripping")

That's not strictly speaking a regression, I'm ok sending this to
net but I'm not sure this is worth.

Maxime

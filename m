Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363289;
	b=BF0BTPJO/MEyHergk9P/dqHQ9JFrIZvs4fGenVMkpqYZT0jwR5mBM7t4m2Uw495QPq0g
	 tQHUmtQKEuagXdDIwnWnjMBCdW7JvHCyyRoQg5GkiyLK5FSbhvEWslmBKPiXy47aQ4rX/
	 6qg07d/uhUv6LvBcd8TN0R0oaVbRnMmo1JFngx5MKSaOjuWVGAwTrW68uES8RRfkO531T
	 NsKQQn4FeTNb4ekeWYNTcLIW1UMiyOpcudsf2Zj6DAJaE7r/zb9lYx17ckU5B0qrKzoMP
	 q/g6yu+bwvik+fU/YHi68nhaRNhHg+iG/JXhmZuHjrngn3gecpFaPIDqSaBp8fVfhKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363289;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
	b=lakzkGDSF5s6B4GxHqjinQ+MXnT6qqY4J4S+4sPkfZVcf2ETMx8vvJr16YUDAz5r39pl
	 0l3Zu7hIkMrzwa/ZeXlJV5fqOJRs58pOwN8KLAET4VpZ2COBF1v52OFbHpYszPpFWyld+
	 lkaO8tyROfGgJFVcxOGxBJ3L7oaQaRPgTTzUpCLSu1BP68NLzi6rz1BDRxlk9rhwHv9D2
	 DPToqusb4nFWKC2P97TP8TVMnhQ3KyEKrFN8w6gsmtld388GhxaomA3w88Q7yR//ymYVB
	 taLJIZDElxxOnNQLN4hKoCE2Odb1tfZay2vX5xpA+Kwm48wG/q3LmmUyjGk3Tkac1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=vyif8tzn;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b="qCOoQ/zO";
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B625606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B625606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=vyif8tzn;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=qCOoQ/zO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795363288; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
 b=vyif8tznTyZocjUubDiqQA4tctlb7WqLWFdnSYz3fXYX1PSZ39bBhcsUNhC76s+r6ksWInblA
 qjvECIny3jwGR1pnuScaGzB3CDJrOjE8592dEqZB8B9iiasqwE87RnsQ6Xx3ZYyIvJHOUfmb6hM
 UnYbeEtqCBmGswIr94foqklsHcPUm8S5lQ+2tx15/msQzoOqAu4hf2arzxh6691huMtiGCpAl3G
 V7go7mo61qbSiyrA3Ge4J8AFIz+nYMdOOsg81j188VK7uVXqvOm3cjBG20f2AHHMyNckUtS7Jle
 ZlQ/wDbQoCFx+Y4RBjyGL8YvXF9TI079vUnjK/jyHCFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795363288; bh=0nnzDdRCsGSeP+fBdqjwR5i2BMDAgYKhOGLFfKlLzIo=;
 b=qCOoQ/zO2A5/RxAeGJqaJcXbxtS2eNtUigi9ON6UKrmv398IFUZIHJqjQMWSzhYvBE/PxTmCJ
 zv0LGx//AnSASsWwslar2toBlWwbvZd8sXGetIBj7ryoYDwCZZ5eiYtwseOUMaeAC1wnfXDR/gL
 lwbxDywww7xlClBpnsmFZLw=
CFBL-Feedback-ID: 6b0311c84993f8611a547daf:b2541adc3895f43479a7fd6879cc7454
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0311c84993f8611a547daf
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5cf52e28-110a-4fc2-acfb-eb264e8c31e2@kwiboo.se>
Date: Sun, 22 Nov 2026 17:01:08 +0100
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
Subject: Re: [PATCH v2 2/8] ARM: dts: rockchip: Add support for RK3506
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-3-jonas@kwiboo.se>
 <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <86007bdd-6c10-46ba-aac6-197939934c73@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/22/2026 4:46 PM, Andrew Lunn wrote:
>> diff --git a/arch/arm/boot/dts/rockchip/rk3506.dtsi b/arch/arm/boot/dts/rockchip/rk3506.dtsi
> 
>> +		gmac0: ethernet@ff4c8000 {
>> +			compatible = "rockchip,rk3506-gmac", "snps,dwmac-4.20a";
>> +			reg = <0xff4c8000 0x2000>;
>> +			clocks = <&cru CLK_MAC0>, <&cru CLK_MAC0_PTP>,
>> +				 <&cru PCLK_MAC0>, <&cru ACLK_MAC0>;
>> +			clock-names = "stmmaceth", "ptp_ref",
>> +				      "pclk_mac", "aclk_mac";
>> +			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "macirq", "eth_wake_irq";
>> +			phy-mode = "rmii";
> 
> Sorry, missed this on the first pass of the patchset.
> 
> phy-mode is generally a board/PCB property, not a SoC property. It
> would only be a SoC property when the SoC cannot do anything other
> than RMII. But given this is snps,dwmac, i expect it can do other phy
> modes.

This SoC only support RMII mode, so I put the phy-mode at SoC level.

Datasheet for this SoC lists following:

  RMII 10/100 Ethernet Controller
  - Support two Ethernet Controllers
  - Supports 10/100-Mbps data transfer rates with the RMII interfaces
  - Supports both full-duplex and half-duplex operation

The Technical Reference Manual also only mention RMII:

  38.2 Block Diagram
  ...
  The MAC only supports the PHY interfaces of reduced MII (RMII).
  ...
  MAC Supports 10/100-Mbps data transfer rates with the RMII interfaces.

Regards,
Jonas

> 
> 	Andrew


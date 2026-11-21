Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795247220;
	b=Fkhht7p7B51e9Y7sYiwq6QVOZ7GIu1hlIFHGjg10KdFn3DmxdVmjo2Edhlcwwpk4o8FP
	 YFy/i9ktm9n/gv0IQBU+dhJ2HDF3tpwNL0nDZOb0NjfFP7jzg4P2aYgsl/ZRjQd628VR1
	 dnSnV01eLdT1SjQhz8NslsvufJxJWD1h7bZqHSZV1mYlMad0MPXUp+zSfMvti9njCIOLh
	 vBVAreC5NeQdTKja1BTDaT8CF+U10L7q4/h4Fz9WH5je0B6AQjR8Skz5osJ2C62e/BTX0
	 /0A3+lzSXFEQeXFie0CJHxH3ryswdZ0sT/ItyCQr/pfpPFnvgRQ5IQq7O2LACWxHBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795247220;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=302YmlBFcT29dtVYS2/IlQouy87kyb7NzSlXmbT4De8=;
	b=K3g4gR3vthmecUQOI8wfPINt8szbW5bKYgWUgbF7X9jvfmI5glCjW02QOvTsyQArVWTo
	 SF5atjStDUCcehEwf4T8DCQLRewb+5ar8FRstrIBpGXIZJl+HOVsn89HJ+I3jXzQKnoUf
	 wvrMogBQSjaTPoIgXAhAYU+unIA8LsvsOXeq6E24Q2lcwYjRD6CtZdDUjGNU6oJ3l+Dtk
	 /3tl/EaNndTPjLsq7SmhQ/dklZLZ6b9F0m69NqEJjLRclWt9LVlMxtzJdvqk88w7214mG
	 8smsA9giSGQlO4NN4w+f7gg9Mc7fUjOmCo1sQ+yBnGPCHkMLIffHtkNDdQ/yRZ4juIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EMYJABtc;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91376606A325
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 07:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91376606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EMYJABtc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B5E031A176E;
	Sat, 21 Nov 2026 07:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7CCE6603CF;
	Sat, 21 Nov 2026 07:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8399111BC0212;
	Sat, 21 Nov 2026 08:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795247214; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=302YmlBFcT29dtVYS2/IlQouy87kyb7NzSlXmbT4De8=;
	b=EMYJABtcdwh7iR3ROahPEAfI2aRH8ZKlnmBfiOaPOG1AhXQh2wPY+9Sat+HSryWbKRFuss
	lTfyMt5KRK+JRvn6VqnXj9j+JN3uetiwf1kfJBCmBdvIp6pMzpjBGTQn277rWd3371l/i/
	sRmPQynRg9P3vFlyAsYjkAhVet6wJXlSLfiBAAx8NzYsDyb94O7+3vCwZXQTRo9XltWwiT
	LShhvjid8ven666kDthXKVfjvDPkD2qPy1lCKwxD1uqDFyqENpu7lBJXR8QaglASPCYAVe
	R+vzBSU6/lVk9gNZqi9uJwfYim2GJbqxv/U+auoLzif0Ue4iZE1mTBDUav/G3w==
Message-ID: <2625b2b6-53f5-4c4b-b45f-fae0d7e781c7@bootlin.com>
Date: Sat, 21 Nov 2026 08:46:37 +0100
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Nicolai Buchwitz <nb@tipi-net.de>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Joseph Steel <recv.jo@gmail.com>,
 Muhammad Nazim Amirul Nazle Asmade
 <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
 <20261120164601.07f932cd@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120164601.07f932cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/21/26 01:46, Jakub Kicinski wrote:
> On Wed, 18 Nov 2026 17:21:34 +0100 Maxime Chevallier wrote:
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
> Heh, this function now does 3 indirect calls to get the info about 
> the stripped vlan. Isn't this slower than disabling the offload and
> stripping in SW at this point? Maybe the low-end CPUs are very
> different :) Or there's something else I'm missing?

We'll do like the rest of the driver and hide these indirections with
a nasty macro :)

(jk, but TBH I can't test that one at more than 1Gbps, it's very likely
there's ton of room for optimisation...)

Maxime


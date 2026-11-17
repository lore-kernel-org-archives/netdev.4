Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911035;
	b=Ec1uIylehV8Gy2Xw/3IXZ2cceCm0WGKKieJ26cSy8S9V1W1LrVOCG1X1oWnvDsfi38j+
	 jQr8INrqwTeN0TSOdIsKiPiWLLnJJcPtR45Qg2hdenGoFiHMNQ+c+UjpHfs8Q6cU5xfFL
	 tUSfDqTshf+IDXEvft8Q2Xhh6V7Piw0bg5VGHcpcYmgVOzfHXM12LgVS13epf1odLRkwD
	 Uuitm2Vo5VVc/fb5yTMrXEgng+COrI2VL6LXphOUKAkouTy+/SpV4mHYSl9ZEq65O4H2J
	 UZGes1DEH2c+Z5CKJ5L74BqjPdVhhbx5qiQ4WM2g9jJ9WFe2JlkYebU3nJOLmGgJFWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911035;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=DjF+KTI6bUfAyzuUUdOxWs2s35Pc9lvGpTrqDOnYYw0=;
	b=aV9MMsrUHTLWfKba7Vb5ptzNdAeBUbh+mLA0ZrzvMG8zoYhmP49wI1BH/k04964/qiCs
	 rZ+643eAvvEdxCKAhzk0gc1812pWIR2RxuiqhbWu+5n0Qeft6S6i5aAiBr1ajdKP0XsMv
	 KkShiK9c4qvtT8UMtqAbpuVP/bcWZORxBfyKoVcKLEhL5MTtUD3JkY1oBWp5A+99wL+4p
	 ZZoq894l4Sz/CaZxNlob4UefmqccmaEFRS5GIOmtMyhlrgLR8XgEqAbD4bzYvNZcDOz0o
	 n4H5PZcLzIp1V3Z0nrIyaFMVzVnAaY93Vx9cs+ezk98uMimzpwpDE25LBQLiSYE5OxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Syrschel;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196F606A884
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 10:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9196F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Syrschel
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A40E4E41471;
	Tue, 17 Nov 2026 10:23:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F37D45FC81;
	Tue, 17 Nov 2026 10:23:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2C0711BC02EE;
	Tue, 17 Nov 2026 11:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794911031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DjF+KTI6bUfAyzuUUdOxWs2s35Pc9lvGpTrqDOnYYw0=;
	b=SyrschelNGJ5mq9nOl9En/KFFH1oE7qbhx7tr9EvnR0ZyqUpSiyk3gfQy2sVi7juWwphmH
	4wbi/ipB3x0Hdn1OaZ1LyjN+1bXk1mNU7wHiz7IyMMEVULYPNI/sh0xQ3v512/CXvLaubP
	SanA5BJ27BU7iYmYmzKrvFXzrufSYHVAFcKuvzqpIMEQGUzBhFyMTKsMXsJ+Hdxkrxt/sT
	sjQdlxE05NCZw9u9bJHT+gr65ROfKHf5aK04PV1FI4hxIXvCCVFaKchwrC2NE7LnURG7H6
	SXvtO4raKA/y9B5l+pvrtA5BRxMkWEJwiovQtxHwtbu3KpvBCbUmzseqDnvYFw==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:23:49 +0100
Message-Id: <DMXEUVLLYME0.28DXLBJQS5GGF@bootlin.com>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Russell King" <linux@armlinux.org.uk>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Paolo Valerio"
 <pvalerio@redhat.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v6 2/2] net: macb: distribute evenly Tx SRAM
 segments
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113-macb-set-channels-v6-0-5de59d9e7f02@bootlin.com>
 <20261113-macb-set-channels-v6-2-5de59d9e7f02@bootlin.com>
 <00aea741bd079eb9168fb2ef9b656f25@tipi-net.de>
In-Reply-To: <00aea741bd079eb9168fb2ef9b656f25@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

Hello Nicolai,

On Sun Nov 15, 2026 at 8:40 PM CET, Nicolai Buchwitz wrote:
> On 13.11.2026 18:32, Th=C3=A9o Lebrun wrote:
>> GEM has registers to configure the Tx SRAM segments distribution across
>> queues. The reset value is apprioriate (even spread) but we need to
>> care if/when number of active queues is modified (or if we inherited
>> unevenly initialised hardware from bootloader).
>>=20
>> To distribute segments, we take as input the number of queues
>> (ctx->num_queues) and the number of segments (found inside DCFG6).
>> Its output is a number of segments for each queue, formatted as
>> powers-of-two (eg 2 for queue 0 means it has 2^2=3D4 segments).
>>=20
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>>  drivers/net/ethernet/cadence/macb.h      | 14 ++++++
>>  drivers/net/ethernet/cadence/macb_main.c | 76=20
>> +++++++++++++++++++++++++++++++-
>
>> [...]
>
>>  static void macb_init_hw(struct macb *bp)
>>  {
>>  	u32 config;
>> @@ -3465,6 +3522,20 @@ static void macb_init_hw(struct macb *bp)
>>  	if (bp->caps & MACB_CAPS_JUMBO)
>>  		bp->rx_frm_len_mask =3D MACB_RX_JFRMLEN_MASK;
>>=20
>> +	/* Distribute Tx SRAM segments evenly based on active number of=20
>> queues.
>> +	 * TXQSEGALLOC is only documented for some GEM integrations.
>> +	 */
>> +	if (bp->caps & MACB_CAPS_TXQSEGALLOC) {
>> +		unsigned int num_segments;
>> +		u32 val;
>> +
>> +		num_segments =3D 1U << GEM_BFEXT(SEGMENTS_BIT_SIZE,
>> +					       gem_readl(bp, DCFG6));
>> +		val =3D gem_sram_distribute_segments(bp->ctx->num_queues,
>> +						   num_segments);
>> +		gem_writel(bp, TXQSEGALLOC_LOWER, val);
>
> This only runs on open, not on a context swap. So ethtool -L on a
> running interface keeps the old split until the next down/up?

Agreed! How I'll solve this:

 - Make gem_sram_distribute_segments() self contained: it does the
   bp->caps check, figures out num_queues+num_segments on its own and
   does the writel(val, TXQSEGALLOC_LOWER) at the end.

 - With that, we can call gem_sram_distribute_segments(bp) once at
   macb_init_hw() and once at swap_end.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799769;
	b=mcuK5n+a8bHY41ksNiIOJYfNIm4DGHjyd6J7nT38wMSX17clPu/rsqh/O+NBLm4b+j8p
	 2iJpwVGj0KtCYIgy8pJuJcq6IIDBqkBj/ZAjiCJxd9x8GMv11SMNYfqY2U44LmQEMpSJU
	 8zMAFDafv/RBIiaXj+6rAIfVYGTHNcnFdEwawodttaellw+hQCG6bZs7SNY27yYBrJoqT
	 hbD+CsRDzkXUj/syCL+TJNYbS8phfWG9kkP/WBbRxrR13dDknkhihLDpZSTXqlaTN18CT
	 JXgHXHk/XWEE7OFhIqhUs3fTVyLzUwZTx7Jxi5ih3zJhYmY+leV3Rp5GX5NPNTpJ3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799769;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=oWWGjqN8OE499HH5hnT8tqqnA9LpEEbpX/53nixjxd0=;
	b=jXg32+99/TVjqCICY/4DOnc3F4M0O/v4pgW8AkGkt2HUYCNPwTwQKGNC0UzDXUEdMN5k
	 Rv0dpqG57dX/TEBewOWDJsRxzlq0+SaIwjlnOMZykPkQ+PeT+/qBdpLakGY/EuFFNVcDn
	 kMWe8qN3MzdxIwlrvbmt0uw3Wox6bYB8q1MdFc0O51i/FMjWwZI5XIy4zrG5cc4Ct7Auf
	 /TwBHxoUXQ+iHHSvU/WPzuD3bLS/Jn0CH8uUeFiH4P1Yt3y8z7qpdT6UrbtJOwOCiJ3i4
	 1dFoFIG5Q3+hZ/bJ8+KLugMw5ybQNuZfNX1183QiRKu97oC260XAKGvLEb3igqOHHXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SoaqsLhM;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35091606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35091606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SoaqsLhM
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ED25FC2AC4C;
	Fri, 27 Nov 2026 17:16:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E0516049C;
	Fri, 27 Nov 2026 17:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21F9811E90BE6;
	Fri, 27 Nov 2026 18:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795799762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oWWGjqN8OE499HH5hnT8tqqnA9LpEEbpX/53nixjxd0=;
	b=SoaqsLhM/tlXigy6t6UEhNbBvbXI+g7XezdLNppqTRArTa2/2o5hmw8cdhyeHRYNcd90TR
	mgYtm+SzR++PqgWvzWjpbVR8wnU7W4rDX8rafLt3SDg11Uw+sW7g+YCZe+Csh+hB5gfofg
	4BN5fMip5v2rUm0H9iapEGKFS1DeWoy79ZdUXz2l/Lq5rlr7mGfM2T7IHoHLLlG/JPCPeU
	XTmJTBg0rQjw+6zirHhFA+Bc5Osq6KFPg1uPhsZDN2BEk5WtUzU4jfT6NkXbhDBlPILr4E
	MYDcidYI6UcCnLRw+J75fiFE0qoGC9V7e0e9QsYf8lTr3pLHGdaaOLNIXyZHQQ==
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
Date: Fri, 27 Nov 2026 18:15:57 +0100
Message-Id: <DN65VVN9YPGF.10F46ZEJTO574@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v8 3/3] net: macb: distribute evenly Tx SRAM
 segments
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>, <vineeth.karumanchi@amd.com>
To: <netdev-bot+sashiko@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261124-macb-set-channels-v8-3-770cf8e50e6d@bootlin.com>
 <179571152787.3135.16045423533153390042@kernel.org>
In-Reply-To: <179571152787.3135.16045423533153390042@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello netdev-bot+sashiko,

On Thu Nov 26, 2026 at 5:45 PM CET,  wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] gem_sram_distribute_segments()
>   (drivers/net/ethernet/cadence/macb_main.c) writes 0 to=E2=80=A6
>
> --
>
> net: macb: distribute evenly Tx SRAM segments
>
> This adds gem_sram_distribute_segments(), which programs the GEM
> TXQSEGALLOC register so the Tx SRAM segments reported by DCFG6 are spread
> across the active queues as powers of two. It runs from macb_init_hw() an=
d
> macb_context_swap_end(). The new MACB_CAPS_TXQSEGALLOC capability enables
> it on zynqmp, versal and eyeq5.
>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index bcf77b2763448..b939a1391273b 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -3319,6 +3319,69 @@ static u32 macb_dbw(struct macb *bp)
>>  	}
>>  }
>> =20
>> +/*
>> + * Distribute evenly available segments across active queues. The compu=
tation
>> + * is complex because (1) segments are counted in powers of two and (2)=
 a queue
>> + * can only use up to 128 segments. There are four types of cases:
>
> [ ... ]
>
>> + *  - Sharing all segments is not doable because not enough segments ar=
e
>> + *    available. Take num_queues=3D4 and num_segments=3D2.
>
> [ ... ]
>
>> +static void gem_sram_distribute_segments(struct macb *bp)
>> +{
>> +	unsigned int num_segments, pow, remaining_segments, i;
>> +	unsigned int num_queues =3D bp->ctx->num_queues;
>> +	unsigned int num_advantaged_queues =3D 0;
>> +	u32 val =3D 0;
>> +
>> +	if (!(bp->caps & MACB_CAPS_TXQSEGALLOC))
>> +		return;
>> +
>> +	num_segments =3D 1U << GEM_BFEXT(SEGMENTS_BIT_SIZE, gem_readl(bp, DCFG=
6));
>> +
>> +	/* When growing the max # of queues, make sure to write into
>> +	 * TXQSEGALLOC_UPPER too.
>> +	 */
>> +	static_assert(MACB_MAX_QUEUES =3D=3D 8);
>> +
>> +	/* pow=3D0 for all queues. ilog2(0) is dangerous. */
>> +	if (num_queues >=3D num_segments)
>> +		goto writel;
>
> [Severity: Low]
> Is the num_queues > num_segments case really handled here?

Argh, once again it does this review. I'll prompt the LLMs in my commit
message (or below the '---' fold line) to avoid that in the future.
https://lore.kernel.org/all/DN2Q44M3PG5M.1Q2PKJ5A3RKNY@bootlin.com/

[...]

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450598;
	b=DN9g1J6vYJSu7cCEq2SoK5EbnjFKcxD51InxRT7rZmR7VR2408i3rB0ogZiy+lBy++E3
	 lJtW7hseNWm5P+AEj1dM/M/wK8g9qUWPSGzQ738s4XguSJUGLhZ/KZcO49YVsODwwmMzq
	 mu24ws0U3t8hLKP0YiLCyrpXbgSyZBAs1FJukcXer9JzPpQMnRENcQdtlKbyP9eBQqt1l
	 rCXjYlVlPd7EWTYXZ1i7J07OkzxoI54wWZU2/lEdTPGuaXewADDT8VJD4ymZKbDWPbfHH
	 Gw0vFS5hdk/wJIKQw32A/CxgQ4hxMrZ637zoKdrsQ4QhtbMNQmmuvr8bG6cDOyDCY0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450598;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=7GWT3S/j9/aO65w9mriGtCTik2Oh9QF71C7dfpUwzzc=;
	b=d6OTpAp9YcbmlqEBWJYsUJYrkrd82GkLyqc2tk2C4e9bMZRhZwEsw9pCACS33AhF1259
	 4zH7ncD/COLWoKm2eymea2SeABICscbgjvLFJHbhUt9hJ64TZnnO4z1XnpudmmuwJ+MKW
	 aDzNxu63uJwotRqrVNjyO0RrdJSlmFeN8S+AgHt/qltvYa+TZD9u+zSMdGaq6HkurJD2W
	 yZBkc/03b05wIjn9DZPrhvvo+UGLdcfhNlfs5QIBi1+d9pllpkH6uixZUx9pcjaO3AF/G
	 ObLx8u97sohYylkggdWnfwLSwOrw7nFkEP9jh+vgmvIYy7tSa4CpB7Lz3CEEKVJi+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eIYvsQdJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC302606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC302606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eIYvsQdJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 622434E416C9;
	Mon, 23 Nov 2026 16:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24996601E1;
	Mon, 23 Nov 2026 16:16:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40D5411E6A6F4;
	Mon, 23 Nov 2026 17:16:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795450590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7GWT3S/j9/aO65w9mriGtCTik2Oh9QF71C7dfpUwzzc=;
	b=eIYvsQdJtYxWZ/9Mp4YVjUbwRpWXdnFJZDKQxAIIKnxVA225RdGHFg2r38CZr1c839J4sE
	ognTwskLHcLYue5GxHvYt6P3j1glKRAFdJEKuYRhmCdUPXE9GOfwWBFWCCyzjSBm7A23EN
	lw8W49H1OgRz849nmvj6O4t3ZgAkmFTFxUs3LxW2j6wvB5v29zN1ujaRebiHbMGnLCQyd8
	5aPtk91XDGO7mSCIOVm0D6Exht214aw0S8Cyzt1lxjaBsPSiTepZ1ro5I0yl3gU4SMqxh8
	/Appw7k/YtmYhjbo6pF8YplmJDsKvk+q/1Wd5KiTpoLCqURAB4F0I0+vP1nS7w==
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
Date: Mon, 23 Nov 2026 17:16:26 +0100
Message-Id: <DN2Q44M3PG5M.1Q2PKJ5A3RKNY@bootlin.com>
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>
To: <netdev-bot+sashiko@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v7 3/3] net: macb: distribute evenly Tx SRAM
 segments
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-macb-set-channels-v7-3-2dbc00f686af@bootlin.com>
 <179537769513.3135.7979336425983650280@kernel.org>
In-Reply-To: <179537769513.3135.7979336425983650280@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello netdev-bot+sashiko,

On Sun Nov 22, 2026 at 9:01 PM CET,  wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] gem_sram_distribute_segments() in
>   drivers/net/ethernet/cadence/macb_main.c handles num_queues >=3D=E2=80=
=A6
> - [Low] The comment above static_assert(MACB_MAX_QUEUES =3D=3D 8) in
>   gem_sram_distribute_segments()=E2=80=A6
>
> --
>
> net: macb: distribute evenly Tx SRAM segments
>
> This patch adds gem_sram_distribute_segments(). It programs the GEM
> TXQSEGALLOC register so that the Tx SRAM segments reported in DCFG6 are
> spread across the active queues as powers of two. It is called from
> macb_init_hw() and macb_context_swap_end(), and it is enabled for the
> zynqmp, versal and eyeq5 configs.
>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index 180da5d62f09a..5d382f0e4aec3 100644
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
>> +	/* When growing the max # of queues, make sure to return a u64 here an=
d
>> +	 * to write into GEM_TXQSEGALLOC_UPPER.
>> +	 */
>> +	static_assert(MACB_MAX_QUEUES =3D=3D 8);
>
> [Severity: Low]
> This isn't a bug, but the comment talks about returning a u64.
> gem_sram_distribute_segments() is a static void function. It builds its
> result in the local u32 val and writes it with:
>
>     gem_writel(bp, TXQSEGALLOC_LOWER, val);
>
> To support more than 8 queues, wouldn't the change be to widen (or split)
> val and add a second write to TXQSEGALLOC_UPPER, rather than to change a
> return type? Could the comment say that instead?

Yes; we shall replace:

   When growing the max # of queues, make sure to return a u64 here and
   to write into GEM_TXQSEGALLOC_UPPER.

By:

   When growing the max # of queues, make sure to write into
   TXQSEGALLOC_UPPER.

For the full story for why this comment went stale:
gem_sram_distribute_segments() used to return a u64 with the low 32
bits written into LOWER and the high 32 bits written into UPPER. That
returned value was then writel() by the caller. But now that it can be
called from two places, the writel() was moved into the function to
avoid code duplication.

>> +
>> +	/* pow=3D0 for all queues. ilog2(0) is dangerous. */
>> +	if (num_queues >=3D num_segments)
>> +		goto writel;
>
> [Severity: Low]
> What happens here when num_queues is strictly greater than num_segments?

I don't know, but this is not our worry.

This check has been introduced to deal with the equality case.
From my understanding, `num_queues > num_segments` is unreachable.

And if `num_queues > num_segments` ever occurs, yes, we give each active
queue 1 segment by doing a:

   writel(0, TXQSEGALLOC_LOWER)

We will *not* introduce code to lower max_num_queues if num_segments is
found to be lower than the runtime detected queue count from
macb_probe_queues(). This would be useless.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


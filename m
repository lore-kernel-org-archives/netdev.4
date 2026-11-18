Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035175;
	b=n6BrgAMOZdUGMmPrcnwQUue91WsMUVOwlrCPVjDFr6EnfimZIm/0hk56H4bMq5kSyLvO
	 kVpzRs569PFda3/tu4VIhwoEilxQzz9rrSf+SiMEvYnOgaJnvyzuvlk4rbu3CbZTG4m/B
	 S6QeBLIXTce0BamIzSZKHFPWWhklOGdEeouco9IMUB9A4ScmWA6u+cV1qJqrGw8jsb3up
	 Ze/fhJlHH93kUUDO9wG7nZAEBAoj8OcxRplh8g6uMrVBikJ8Hk5h+7X6ETIIuTRDMNJsA
	 OS2SGoLfHa/PN72vqAxge99Fz6ZV9DihPLWipfpvpPgW0JcqpEislLwuZAoAMBYugGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035175;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=yhKCHOzNyTpfTfx7SAd3IcKFHof/Jwv+3/T1yvn88u4=;
	b=kpX4HxDNZYpzAcwGW3XP9pI/igbUvdkjFLZEXetR1nTqbDK/A8j1pn0yPTL4wH0ULtD1
	 mkrcFjDSODzt5jxOr/Oa7FDIIh55P/D2JwIAZLPcCLModk0TDYUZj4XTABNst12dbkdZA
	 DncK2k8LL9NqnJ7jAdp25tZUsUexeg3ozn5FIpBa375DO4add231WoMB8f5AhWJTQ82cG
	 lmNjEA21oCb52wdBGkkgqvjJF97D1fjy2JMLhTUdhVULat6TpqV0xDhz51X3n5eOpWEZF
	 +2X5dIyR8y8sQbRkh23Gp8xyT9wXFOQQcJ5PwzLzA2e7IAleZpgZI2kNlkD+zduFEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9QUesAP;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140B2606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9QUesAP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C8611A16CA;
	Wed, 18 Nov 2026 20:52:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5092C5FE9B;
	Wed, 18 Nov 2026 20:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 415D111BC308E;
	Wed, 18 Nov 2026 21:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795035167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yhKCHOzNyTpfTfx7SAd3IcKFHof/Jwv+3/T1yvn88u4=;
	b=D9QUesAPwYl9H7mE2wYqrqrYPZp9eltcYzDlZ0aktBrXsJgb9IbDuBmzzLY+MbGCcF/rg9
	MNZRrm8JgctksVYhj4mbfrsRjooUJUGO7DFTvCVp4VsQDzC5+2ZSBjae023fKiv6Kidcjh
	QQIW2LdexlOFXaAaJ38DEu1/GeamqgpU485nD0dX88CldCKcWcGg0kLhJDT0+VbIILAMEI
	v6UvrLnf+CwxjDDR3OH2zeM8TOJf0mMY8Ov6Lq/l34WomcMPB2YRKlnqhd06/ABVHnJGJI
	a/+g8Rnhhy27Pkt/cUYQJxY5mO/fEduyeRf1vFCM08kebTNIrR06jAoyGfgRfQ==
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
Date: Wed, 18 Nov 2026 21:52:43 +0100
Message-Id: <DMYMUY659YDR.2FPDXVGJWJAU6@bootlin.com>
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>
To: <netdev-bot+sashiko@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v6 2/2] net: macb: distribute evenly Tx SRAM
 segments
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113-macb-set-channels-v6-2-5de59d9e7f02@bootlin.com>
 <179494461057.3136.14140856412630551606@kernel.org>
In-Reply-To: <179494461057.3136.14140856412630551606@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello netdev-bot+sashiko,

On Tue Nov 17, 2026 at 8:43 PM CET,  wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The commit message says TXQSEGALLOC must be re-applied "if/when
>   number of active queues is modified", but the patch only programs it=E2=
=80=A6
> - [Medium] gem_sram_distribute_segments() can build a TXQSEGALLOC value
>   whose total segment count is larger than the num_segments that=E2=80=A6
>
> --
>
> net: macb: distribute evenly Tx SRAM segments
>
> This patch programs the GEM TXQSEGALLOC register from macb_init_hw(). It
> spreads the Tx SRAM segments advertised in DCFG6 across the active
> queues, with each queue's share encoded as a power of two. The new
> MACB_CAPS_TXQSEGALLOC capability is enabled for ZynqMP, Versal and EyeQ5.
>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index e7325af4b399c..dc1624815f71e 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -3432,6 +3432,63 @@ static void macb_context_swap_end(struct macb *bp=
,
>
> [ ... ]
>
>> +static u32 gem_sram_distribute_segments(unsigned int num_queues,
>> +					unsigned int num_segments)
>> +{
>
> [ ... ]
>
>> +	/* pow=3D0 for all queues. ilog2(0) is dangerous. */
>> +	if (num_queues >=3D num_segments)
>> +		return 0;
>
> [ ... ]
>
>> +	for (i =3D 0; i < num_advantaged_queues; i++)
>> +		val |=3D field_prep(GEM_TXQSEGALLOC_MASK(i), pow + 1);
>> +	for (i =3D num_advantaged_queues; i < num_queues; i++)
>> +		val |=3D field_prep(GEM_TXQSEGALLOC_MASK(i), pow);
>> +
>> +	return val;
>> +}
>
> [Severity: Medium]
> Can the value built by gem_sram_distribute_segments() add up to more
> segments than the num_segments read from DCFG6?
>
> A field value of 0 still means 2^0 =3D 1 segment. There seem to be two wa=
ys
> to over-allocate.
>
> First, when num_queues > num_segments, the early return gives every
> active queue 1 segment. The comment above uses num_queues=3D4 and
> num_segments=3D2 as an example, which claims 4 segments out of 2.
>
> Second, the loops only fill fields for i < num_queues. macb_init_hw()
> passes bp->ctx->num_queues, not the hardware queue count. The fields for
> hardware queues from ctx->num_queues up to bp->max_num_queues stay at 0.
> Each of those still claims 1 segment, on top of an active split that
> already uses every segment. With 4 hardware queues and 16 segments:
>
>   num_queues=3D2: 8 + 8 + 1 + 1 =3D 18
>   num_queues=3D3: 8 + 4 + 4 + 1 =3D 17
>
> On Versal and EyeQ5 (MACB_CAPS_QUEUE_DISABLE), this happens after
> ethtool -L while the interface is down, followed by an open. The reset
> value is an even split over all hardware queues, so it adds up to the
> available segments.
>
> If the GEM requires the total to stay within the DCFG6 count, could this
> give queues overlapping or out-of-range Tx SRAM regions?

The manual mentions explicitly that only active queues are taken into
account. This means writing 0 in the field for a disabled queue won't
allocate (1<<0) segments for it. Added a paragraph in the commit
message.

As for the `num_queues > num_segments` case, there is nothing better to
do than to allocate one segment per queue, which is what we already do.
We won't add code to handle that unreachable edge case. If it happens,
edit your verilog!

>
>> @@ -3465,6 +3522,20 @@ static void macb_init_hw(struct macb *bp)
>>  	if (bp->caps & MACB_CAPS_JUMBO)
>>  		bp->rx_frm_len_mask =3D MACB_RX_JFRMLEN_MASK;
>> =20
>> +	/* Distribute Tx SRAM segments evenly based on active number of queues=
.
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
>> +	}
>
> [Severity: High]
> The commit message says the distribution needs care "if/when number of
> active queues is modified". Is that case covered when the queue count
> changes on a running interface?
>
> Only macb_open() and the resume path call macb_init_hw(). Running
> ethtool -L ethX combined N while the interface is up goes through:
>
> macb_set_channels()
>   macb_context_swap_start()
>   macb_context_swap_end(bp, new_ctx)
>     macb_init_buffers()
>     macb_configure_dma()
>
> macb_context_swap_end() installs a context with the new num_queues and
> turns RE/TE back on. Nothing on this path rewrites GEM_TXQSEGALLOC_LOWER.
> The Tx SRAM split stays sized for the old queue count until the next
> down/up or suspend/resume.
>
> Two examples:
>
> Open with 1 queue. q0 gets 8 segments and the other fields stay at 0
> (1 segment each). If the interface then grows to N queues while up, each
> new queue runs with a single segment while TXPBMS is set in DMACFG.
>
> Going from 2 queues to 1 while up leaves half of the SRAM assigned to
> the disabled queue.
>
> Versal and EyeQ5 set both MACB_CAPS_QUEUE_DISABLE and
> MACB_CAPS_TXQSEGALLOC, so this path is reachable there.
>
> Could the write be moved into a helper and also called from
> macb_context_swap_end() under bp->lock, next to macb_configure_dma()?

Mentioned by Nicolai as well. The fix is to make our distribute function
standalone and call it once from open and once from context swap end.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


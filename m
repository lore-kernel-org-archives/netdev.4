Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795377696;
	b=WchZ6A9QpDKnfgkAbfJkeix36zfVczBxKo9o8EfZytZNJ8HwSyBI0kLIl93LGmStqQ4f
	 3NEjCLAp3fxBambcCrDzEAai88nslNMJ6O4FhBhL8EqSC36Qgy/kJPllUOrZ67yY78E2h
	 s23xT67cFNmtHXB0TZIzawQThjz6IEpbXF86Mikh1faN2H+rw0bCFEaKIEe6kWmJtqNmf
	 9Mlnv5Fq7SRit+xCwG/8LIccJVnkpI/Nlo4XfTgvHoITWcOP4Ux1pYYwIRcQCYeDBps5X
	 7imVcYVAzNtUlPzfCxJ2LE+kb/E1JkXSQfvC9+drcF+/YYnpFk7Q1COEc2M/kYBYsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377696;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XIWmaxpRlO77XcnPsst8fYF90FwgA99a8+etgSs5Y6E=;
	b=ElJN6Na5AWsWrmuql/9AlebxPXL2HRMIO79jKsMzLJTguGzqlvLNjR/jkjamVOXU32vF
	 0oXCP7qnc9M5xeQN/NaoQQW7pZrXRVV2Wm/ld2gLnLmtD39ovFf3ZXK+TE03JiOvibviS
	 9nxNyzNGu+Mn6FbpeqhIXZCdf1HjGY4HvV0vLxUtIb/avCpceMHQYhL0x6leYhHvnFaYt
	 bjkAIM/qOppIKZWXRJEOdQut+baB/DEeFnDyvx16Z+BMZ+7YtYPlrZJPeeBI7EVjDvcLC
	 luE2vZHdCoH17nazz+KJ+gfqnLLEdr7cezUAIWB51qUiFmDgBbkcnfMrfHiLxHkjaTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQ53T0JX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D247E606A32C;
	Sun, 22 Nov 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQ53T0JX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867101F000D1;
	Sun, 22 Nov 2026 20:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795377696;
	bh=XIWmaxpRlO77XcnPsst8fYF90FwgA99a8+etgSs5Y6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cQ53T0JXRugmOfRyc/i8lMfycRqIEaEDeHhbDTORS5mnFtnRfrLco9EMGznQ4KE6A
	 apzkqiBwq0DuVrM6Xbipv3tgdS3v8uftu0jnyuNaanWU/aYflFk14He96SrSuuaDp2
	 L5Qp6hlz5g4sPG8WXfVW19cbT7DpqWI4MQhypjk7w9bBs3zIckVQrRSyKPR5W1yCt2
	 9DlYaaHLxyXekfIzZderRc0HvBW71K80VXE8jTDd0y74nJBcfYiX3xi4L3CtIqHRuV
	 KKlH+HjPXZE5Dc/1K+iCEcg+vRDrzJ3xJRoSN9tEr9k3UgqNyv22Y4FEciq+2GGZd9
	 v/yvD8b0v8Viw==
Subject:
 Re: [PATCH net-next v7 3/3] net: macb: distribute evenly Tx SRAM segments
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com
Date: Sun, 22 Nov 2026 20:01:35 +0000
Message-ID: <179537769513.3135.7979336425983650280@kernel.org>
In-Reply-To: <20261118-macb-set-channels-v7-3-2dbc00f686af@bootlin.com>
References: <20261118-macb-set-channels-v7-3-2dbc00f686af@bootlin.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] gem_sram_distribute_segments() in
  drivers/net/ethernet/cadence/macb_main.c handles num_queues >=…
- [Low] The comment above static_assert(MACB_MAX_QUEUES == 8) in
  gem_sram_distribute_segments()…

--

net: macb: distribute evenly Tx SRAM segments

This patch adds gem_sram_distribute_segments(). It programs the GEM
TXQSEGALLOC register so that the Tx SRAM segments reported in DCFG6 are
spread across the active queues as powers of two. It is called from
macb_init_hw() and macb_context_swap_end(), and it is enabled for the
zynqmp, versal and eyeq5 configs.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 180da5d62f09a..5d382f0e4aec3 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3319,6 +3319,69 @@ static u32 macb_dbw(struct macb *bp)
>  	}
>  }
>  
> +/*
> + * Distribute evenly available segments across active queues. The computation
> + * is complex because (1) segments are counted in powers of two and (2) a queue
> + * can only use up to 128 segments. There are four types of cases:

[ ... ]

> + *  - Sharing all segments is not doable because not enough segments are
> + *    available. Take num_queues=4 and num_segments=2.

[ ... ]

> +static void gem_sram_distribute_segments(struct macb *bp)
> +{
> +	unsigned int num_segments, pow, remaining_segments, i;
> +	unsigned int num_queues = bp->ctx->num_queues;
> +	unsigned int num_advantaged_queues = 0;
> +	u32 val = 0;
> +
> +	if (!(bp->caps & MACB_CAPS_TXQSEGALLOC))
> +		return;
> +
> +	num_segments = 1U << GEM_BFEXT(SEGMENTS_BIT_SIZE, gem_readl(bp, DCFG6));
> +
> +	/* When growing the max # of queues, make sure to return a u64 here and
> +	 * to write into GEM_TXQSEGALLOC_UPPER.
> +	 */
> +	static_assert(MACB_MAX_QUEUES == 8);

[Severity: Low]
This isn't a bug, but the comment talks about returning a u64.
gem_sram_distribute_segments() is a static void function. It builds its
result in the local u32 val and writes it with:

    gem_writel(bp, TXQSEGALLOC_LOWER, val);

To support more than 8 queues, wouldn't the change be to widen (or split)
val and add a second write to TXQSEGALLOC_UPPER, rather than to change a
return type? Could the comment say that instead?

> +
> +	/* pow=0 for all queues. ilog2(0) is dangerous. */
> +	if (num_queues >= num_segments)
> +		goto writel;

[Severity: Low]
What happens here when num_queues is strictly greater than num_segments?

TXQSEGALLOC fields hold log2 of the segment count. The commit message
says "2 for queue 0 means it has 2^2=4 segments", so a field value of 0
means 1 segment, not zero segments.

When num_queues == num_segments, val = 0 gives each queue 1 segment and
the total matches the SRAM size.

When num_queues > num_segments, every active queue still gets 1 segment.
Take the example from the header comment, "num_queues=4 and
num_segments=2". It ends up programmed as 4 x 1 = 4 segments, but DCFG6
reports only 2.

Doesn't that give the hardware more Tx SRAM segments than it has, with
nothing logged? The header comment presents this case as handled.

Would it be better to limit the number of active queues to num_segments
in this case? Another option is to warn and keep the reset value instead
of writing 0.

> +
> +	pow = min_t(unsigned int, ilog2(num_segments / num_queues), 7);
> +	remaining_segments = num_segments - num_queues * (1U << pow);

[ ... ]

> +
> +writel:
> +	gem_writel(bp, TXQSEGALLOC_LOWER, val);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-macb-set-channels-v7-0-2dbc00f686af%40bootlin.com

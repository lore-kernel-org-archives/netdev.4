Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711529;
	b=xcH/O6/wHowmSftTSZPxID5+zqEQRrjofCCHnLnRmbXieH9q3f/ZGu9AuuKIOi6nfPuU
	 m2z+r55+fQa30tndgSJtxE723KX1hzulsYonkmkO22RIK86D7KtG0EJ8eiUwxpBupuBjh
	 GRLecK+3o95V3Ax3Yx4RoT99216d85y7DYNybPmWxfYXLXpNNmBkdcV+Jp9tcafDQdM7Z
	 EoqRnFS/WD92pyQQLdci/SZg4yaKIZxC9KSTkkvqKbR2qdVpwFYEyxCBk7lRur41ibfXt
	 Dg1lykiJmjW1fh953s4Noi4o4b9tGDI+YJcIUb71jfOUK3SkPoL3H1+FQAixqT47wgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711529;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NZxf7xGAxFBnM2URAY0wf9DnF6jEM57f0c1j/Omx8GU=;
	b=HKLWfaVwJuxJBAWU5GGTIkZ+/ozFSAs+T1xn2m7tAZS4JUnZhooY/AyhWJGEvowObN8v
	 ljdYc4+eLRwfiYE5zHGFzOxh9ThDkW/nzitqI8QHz5jcgDomrfRi54WbrylyBl9pJ++Nn
	 D90sNqJ8fzSbngePVPWMWgc3/fp/JR1vG2xPcTAGxRUplWOYso/guJ29880fY7tu0AHIt
	 aHuJsVX1L/SO9HphHhLyJMj1wFfUqWj024+PGQX/P2jw9hMO3Zv8ZdSEIZOcYr7hTToSK
	 l/y3QrI7vmJv68M0PF/ZdPM4nuoyfx8mY67GQ5IZTfwjzRWj4LyhaUA4iGz7hHgLmhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4o8O64h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86B606A32C;
	Thu, 26 Nov 2026 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4o8O64h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 562511F000D2;
	Thu, 26 Nov 2026 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795711529;
	bh=NZxf7xGAxFBnM2URAY0wf9DnF6jEM57f0c1j/Omx8GU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V4o8O64hwOssgLmJIEd49oAhAuLqc0hqnbnJFRvmo6LNSFQcI2TjOUu3MISL1Zt9F
	 XF6qKic7N+mzYC30zvy7uT637k16QBURiOde8EYUPaQjw0RcAK/5Fl9qDzPoSzauOb
	 Rbkpwty2a69sRl9bOIwN8SblyF1fGNZuZiOHA4glrFhlGI2YxgKTWKNCtTxrgn/N+D
	 G+OKxYHIA4q+omJba1Q6Vqb08OauuCwPwmf5z22t6mBTJ3rkEr15OU6O5035BPESpd
	 TPYmvFwskfah85BaNrqCblawkJvmYJxEmp0POF0L26j5JEfm/02NL6r7T1aAVmwuFA
	 tEREPS1UKWGpw==
Subject:
 Re: [PATCH net-next v8 3/3] net: macb: distribute evenly Tx SRAM segments
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com,
 vineeth.karumanchi@amd.com
Date: Thu, 26 Nov 2026 16:45:27 +0000
Message-ID: <179571152787.3135.16045423533153390042@kernel.org>
In-Reply-To: <20261124-macb-set-channels-v8-3-770cf8e50e6d@bootlin.com>
References: <20261124-macb-set-channels-v8-3-770cf8e50e6d@bootlin.com>
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

- [Low] gem_sram_distribute_segments()
  (drivers/net/ethernet/cadence/macb_main.c) writes 0 to…

--

net: macb: distribute evenly Tx SRAM segments

This adds gem_sram_distribute_segments(), which programs the GEM
TXQSEGALLOC register so the Tx SRAM segments reported by DCFG6 are spread
across the active queues as powers of two. It runs from macb_init_hw() and
macb_context_swap_end(). The new MACB_CAPS_TXQSEGALLOC capability enables
it on zynqmp, versal and eyeq5.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index bcf77b2763448..b939a1391273b 100644
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
> +	/* When growing the max # of queues, make sure to write into
> +	 * TXQSEGALLOC_UPPER too.
> +	 */
> +	static_assert(MACB_MAX_QUEUES == 8);
> +
> +	/* pow=0 for all queues. ilog2(0) is dangerous. */
> +	if (num_queues >= num_segments)
> +		goto writel;

[Severity: Low]
Is the num_queues > num_segments case really handled here?

Each 3-bit GEM_TXQSEGALLOC_MASK() field encodes 2^v segments, so a field
cannot mean zero segments. Writing val = 0 gives every active queue
2^0 = 1 segment.

When num_queues == num_segments that fits exactly. When num_queues is
larger, the hardware is told to use num_queues segments on a buffer that
has only num_segments.

The block comment lists "num_queues=4 and num_segments=2" as one of the
four handled cases. In that example the code programs 4 x 1 = 4 segments
on a 2-segment SRAM.

Nothing seems to prevent this configuration. macb_set_channels() checks
the requested count only against max_num_queues:

    if (num_queues > bp->max_num_queues)
        return -EINVAL;

So on versal and eyeq5 (MACB_CAPS_QUEUE_DISABLE), ethtool -L can select
more queues than DCFG6 reports segments. The same applies at probe/open
time when all queues are active.

Should the active queue count be limited to num_segments on
MACB_CAPS_TXQSEGALLOC parts? If not, should the comment stop describing
this case as handled?

> +
> +	pow = min_t(unsigned int, ilog2(num_segments / num_queues), 7);
> +	remaining_segments = num_segments - num_queues * (1U << pow);

[ ... ]

> +writel:
> +	gem_writel(bp, TXQSEGALLOC_LOWER, val);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124-macb-set-channels-v8-0-770cf8e50e6d%40bootlin.com

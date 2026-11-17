Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944612;
	b=TdpuW9tD7miYy70uQIj7NHFg0iAJqLI6lNfhi8DcFll/BcIw9qsebs3lDBkNj80VGbzB
	 t6EpmWbT880TNk1bDe2m/j/4PqPdSW8hovYddvTzsFUnA8zdZyh10wuzju8XK138eXjPb
	 /QFm2uhqBGhFPgdjobzsXHzB69Nn6F17PShZoeWwglLvy/DL6jKPvu80iMCh6yWwfzrrc
	 ZXCnnT68ksEsg9YQqtVpN4RS3CN1bGkJw0HrCK5cVQWhzpUHf8VZJMhMySNeYKS1LyLWq
	 T1OQOUadyHU1v5uCXD2YEi+Jbio3xQG2751OYwTzKzEH4M/77oR/AWKJ8IaqMDcY1bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944612;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=22X6MMF33QpWPGoxzbN5VyAvk07V42cvGCYrX8i0f4I=;
	b=K/ltCAHri0idex/+gcc1F7Rj84gIFlKeYZpwCWZ07wjSjHN1XOHoEg/RMJsRhG3fZk1F
	 Rp9Muw9EUAoP6dekVfECopKg3PbmiQ6mOSZHQZOlwZlLS6KSquwT3li09Uwbth0/nm0XJ
	 cQ14xTr9gd9OB9VRHCag3bylxqMxJTcKsF4FjAzOhqgY11xF+635l6/c7wSbQE12SyZJ8
	 pqnP2mGyvffpR7kRyFeO9lq7bYQLUTiQD5p0S5NC+OBs5q/9dgQIEow5zdpfkgZIjPjqu
	 bQL/9O5hCsgvznt5fPeIspJzDU3ZT3ed5UGJd7uMOq6dgH4rQ7EKjzEKCMKahj6B/rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjxqLx2E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D7606A881;
	Tue, 17 Nov 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjxqLx2E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DBD1F000C7;
	Tue, 17 Nov 2026 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944611;
	bh=22X6MMF33QpWPGoxzbN5VyAvk07V42cvGCYrX8i0f4I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cjxqLx2EYP6oDGVzBn2oeLEDsHvJoXjkuMHRgiPSM3WKjTkK4tR3CA/AsPFn+RE0L
	 NBpjEub88nkMzdY5EnTNZ2BvMKh89u1KABSKEc81D21VVFfHUps4LQLmFySIEue2vB
	 rHvDisZyaWh+eQL7YYJp5Eir5+rgQdRB9O+jr4iGEFWX7hJpCnXKM9716VPQ330XQy
	 NeNjvV1NjChaqi0CN+qFbJ4zBKdS7Xh/cG5g8skd1GdyKGa1U19nAprku6yS2mR56i
	 jbUw3ukn7aXPQ+nxI73xPQHjlKn/CVVeIoERKhk3MyLTWN+GDPh4Fm+W6p7W+CvZGO
	 gxSZcSqhOjr2w==
Subject:
 Re: [PATCH net-next v6 2/2] net: macb: distribute evenly Tx SRAM segments
From: netdev-bot+sashiko@kernel.org
To: theo.lebrun@bootlin.com
Cc: conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 nb@tipi-net.de, pvalerio@redhat.com, vladimir.kondratiev@mobileye.com,
 gregory.clement@bootlin.com, benoit.monin@bootlin.com,
 tawfik.bayouk@mobileye.com, thomas.petazzoni@bootlin.com
Date: Tue, 17 Nov 2026 19:43:30 +0000
Message-ID: <179494461057.3136.14140856412630551606@kernel.org>
In-Reply-To: <20261113-macb-set-channels-v6-2-5de59d9e7f02@bootlin.com>
References: <20261113-macb-set-channels-v6-2-5de59d9e7f02@bootlin.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The commit message says TXQSEGALLOC must be re-applied "if/when
  number of active queues is modified", but the patch only programs it…
- [Medium] gem_sram_distribute_segments() can build a TXQSEGALLOC value
  whose total segment count is larger than the num_segments that…

--

net: macb: distribute evenly Tx SRAM segments

This patch programs the GEM TXQSEGALLOC register from macb_init_hw(). It
spreads the Tx SRAM segments advertised in DCFG6 across the active
queues, with each queue's share encoded as a power of two. The new
MACB_CAPS_TXQSEGALLOC capability is enabled for ZynqMP, Versal and EyeQ5.

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index e7325af4b399c..dc1624815f71e 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3432,6 +3432,63 @@ static void macb_context_swap_end(struct macb *bp,

[ ... ]

> +static u32 gem_sram_distribute_segments(unsigned int num_queues,
> +					unsigned int num_segments)
> +{

[ ... ]

> +	/* pow=0 for all queues. ilog2(0) is dangerous. */
> +	if (num_queues >= num_segments)
> +		return 0;

[ ... ]

> +	for (i = 0; i < num_advantaged_queues; i++)
> +		val |= field_prep(GEM_TXQSEGALLOC_MASK(i), pow + 1);
> +	for (i = num_advantaged_queues; i < num_queues; i++)
> +		val |= field_prep(GEM_TXQSEGALLOC_MASK(i), pow);
> +
> +	return val;
> +}

[Severity: Medium]
Can the value built by gem_sram_distribute_segments() add up to more
segments than the num_segments read from DCFG6?

A field value of 0 still means 2^0 = 1 segment. There seem to be two ways
to over-allocate.

First, when num_queues > num_segments, the early return gives every
active queue 1 segment. The comment above uses num_queues=4 and
num_segments=2 as an example, which claims 4 segments out of 2.

Second, the loops only fill fields for i < num_queues. macb_init_hw()
passes bp->ctx->num_queues, not the hardware queue count. The fields for
hardware queues from ctx->num_queues up to bp->max_num_queues stay at 0.
Each of those still claims 1 segment, on top of an active split that
already uses every segment. With 4 hardware queues and 16 segments:

  num_queues=2: 8 + 8 + 1 + 1 = 18
  num_queues=3: 8 + 4 + 4 + 1 = 17

On Versal and EyeQ5 (MACB_CAPS_QUEUE_DISABLE), this happens after
ethtool -L while the interface is down, followed by an open. The reset
value is an even split over all hardware queues, so it adds up to the
available segments.

If the GEM requires the total to stay within the DCFG6 count, could this
give queues overlapping or out-of-range Tx SRAM regions?

> @@ -3465,6 +3522,20 @@ static void macb_init_hw(struct macb *bp)
>  	if (bp->caps & MACB_CAPS_JUMBO)
>  		bp->rx_frm_len_mask = MACB_RX_JFRMLEN_MASK;
>  
> +	/* Distribute Tx SRAM segments evenly based on active number of queues.
> +	 * TXQSEGALLOC is only documented for some GEM integrations.
> +	 */
> +	if (bp->caps & MACB_CAPS_TXQSEGALLOC) {
> +		unsigned int num_segments;
> +		u32 val;
> +
> +		num_segments = 1U << GEM_BFEXT(SEGMENTS_BIT_SIZE,
> +					       gem_readl(bp, DCFG6));
> +		val = gem_sram_distribute_segments(bp->ctx->num_queues,
> +						   num_segments);
> +		gem_writel(bp, TXQSEGALLOC_LOWER, val);
> +	}

[Severity: High]
The commit message says the distribution needs care "if/when number of
active queues is modified". Is that case covered when the queue count
changes on a running interface?

Only macb_open() and the resume path call macb_init_hw(). Running
ethtool -L ethX combined N while the interface is up goes through:

macb_set_channels()
  macb_context_swap_start()
  macb_context_swap_end(bp, new_ctx)
    macb_init_buffers()
    macb_configure_dma()

macb_context_swap_end() installs a context with the new num_queues and
turns RE/TE back on. Nothing on this path rewrites GEM_TXQSEGALLOC_LOWER.
The Tx SRAM split stays sized for the old queue count until the next
down/up or suspend/resume.

Two examples:

Open with 1 queue. q0 gets 8 segments and the other fields stay at 0
(1 segment each). If the interface then grows to N queues while up, each
new queue runs with a single segment while TXPBMS is set in DMACFG.

Going from 2 queues to 1 while up leaves half of the SRAM assigned to
the disabled queue.

Versal and EyeQ5 set both MACB_CAPS_QUEUE_DISABLE and
MACB_CAPS_TXQSEGALLOC, so this path is reachable there.

Could the write be moved into a helper and also called from
macb_context_swap_end() under bp->lock, next to macb_configure_dma()?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-macb-set-channels-v6-0-5de59d9e7f02%40bootlin.com

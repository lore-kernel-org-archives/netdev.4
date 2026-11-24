Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545001;
	b=Lu74YvbxVzPwHvDZ7dt1JLsYkFbSu166ovoheSrr1J3y1W2AHDnDMPvVmelXAKe7Lmk/
	 mEpI1foUGknzp5iXzWHvMNUuKARXrJBRr/aMh20DbT1pMh3ofFd4IJwX6LSTx+0tYcgVw
	 AQPEC8DOP9Kp6AArBpNcrxSpiu7Ege0oUNsVlb2cG2/txnNfvhTdsdshlQAMm9bt0haSP
	 DWS6hejAy1XJ854YSJt7K5vwUKaefzrL37ikVNiZWUpI+DrsI7GXDYrdjXXXQ/yUyqaLk
	 TBIeI9JG1z/OddAr20rtFYdKcwsol95uDDElBR2JF8QgsaQUV2aEk9ONZEPO0EU1mNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545001;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BS/hITMY8CNZEdrwqncFX9F0WLUeVKA8pCahN++pnZI=;
	b=5AB4KWgJNY7UybWrzIqi9Sj1aI+NR/1tgFosBaYlGJnjjmsuQn0dW2kadkTvfxywIz/R
	 oW1DThqghHT2tPNNsn+yrwWk55Hc62WsmDspEeIfPt5rrrAjdnGJhnWyj3OgWenSmMh9Y
	 LfdX84ECHbjKLdGG+E3+6XDScR+AUJfkrPWtduj3y/TsrK/mT3e1K9tzw82SAkfJI+GHm
	 VfBJCxG6o9LjdBD4aYpl26tFXa7QXE9iJZ4lZuLgfwE5tJ9+OBJBIKfLKZb4eLrD2JImB
	 m8EHyjMFdIwQJktmHo25HN1GwYgaQclxP6TU93A2nkzkLAu3DBj84bWrJAZ+kCMaL0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsPxC8rq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B679606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsPxC8rq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BA51F000C6;
	Tue, 24 Nov 2026 18:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545000;
	bh=BS/hITMY8CNZEdrwqncFX9F0WLUeVKA8pCahN++pnZI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IsPxC8rqBBC4dX+zfcMEmRzggPF725JHxuPQd6ZunJMYzyXt4/494EwgAIg1Zk7Df
	 5WKUtrPmwxAOZd54PwAXpyoVUp0jiL/nPuFPlaVOl74oAqXcNWwhVI2CXoKM61eH7j
	 bkg08XAZtzSGwSWAJ5A90cOqtRANwf6rxbSiisQBUj6mcfd+fASQmLQ4kHNvSdAj1I
	 NFrR17kZi2yzY5YHbEhmejO0twelYlEcdXrsj2ugJzsKMmMrMaAtB6ZXXTicdx6pFY
	 4cLaxA1w8i4nrbHkdLET5z8Mag+cdBdh5DPfJTIw5DwfEZ7nVFB4y6ZiXJc7VaSE9D
	 3XCWORxNiqDmg==
Subject: Re: [PATCH net-next v9 13/14] net: ethernet: cortina: Release partial
 RX frames on stop
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:59 +0000
Message-ID: <179554499959.3135.10353219127658240816@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-13-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-13-298671d799d5@kernel.org>
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

- [Low] The commit fixes a real lifetime bug but has no Fixes: tag.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it sits in the
  stop path the patch changes.

--

net: ethernet: cortina: Release partial RX frames on stop

This patch frees a partially assembled RX skb held in napi->skb when
gmac_stop() runs, so a reopened interface does not get the stale skb back
from napi_get_frags(). The dropped frame is counted in rx_dropped under
the RX stats seqcount, using the irqsave update helpers.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 5f8f220ad9d73..3d121eec88733 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -2269,12 +2269,19 @@ static int gmac_open(struct net_device *netdev)
>  static int gmac_stop(struct net_device *netdev)
>  {
>  	struct gemini_ethernet_port *port = netdev_priv(netdev);
> +	unsigned long flags;
>  
>  	hrtimer_cancel(&port->rx_coalesce_timer);

[Severity: High]
This isn't a bug introduced by this patch, but it is in the stop path this
patch changes. Can the RX coalesce timer be re-armed after this
hrtimer_cancel()?

The RX interrupt is not masked until gmac_enable_irq(netdev, 0) and
free_irq() run later in gmac_stop(). An RX interrupt in that window goes
through gmac_irq():

	if (val & (DEFAULT_Q0_INT_BIT << netdev->dev_id)) {
		gmac_enable_rx_irq(netdev, 0);

		if (!port->rx_coalesce_nsecs) {
			napi_schedule(&port->napi);
		} else {
			...
			hrtimer_start(&port->rx_coalesce_timer, ktime,
				      HRTIMER_MODE_REL);
		}
	}

In that case ndo_stop returns with the timer still queued.
gmac_set_coalesce() sets rx_coalesce_nsecs to rx_coalesce_usecs * 1000
with no upper bound, so the timer can stay queued for up to about 4.29
seconds.

If the interface is reopened during that time, gmac_open() calls
hrtimer_setup() on a timer that is still queued. Could that corrupt the
hrtimer timerqueue?

If the device is removed instead, could gmac_coalesce_delay_expired()
fire after the netdev private area is freed and call napi_schedule() on
freed memory?

gmac_open() has a related ordering problem. request_irq(),
gmac_enable_irq(netdev, 1) and gmac_enable_tx_rx() all run before
hrtimer_setup(). gmac_set_coalesce() has no netif_running() check, so
coalescing can be set before the first open.

On that first open, an early RX interrupt would call hrtimer_start() on a
zero-initialized hrtimer whose timer->base is NULL. Would that oops in
lock_hrtimer_base()?

Would it make sense to set up the hrtimer once, at probe or ndo_init
time, and to cancel it only after the RX interrupt is masked or the IRQ
is freed?

>  	netif_tx_stop_all_queues(netdev);
>  	gmac_disable_tx_rx(netdev);
>  	gmac_stop_dma(port);
>  	napi_disable(&port->napi);
> +	if (port->rx_skb) {
> +		napi_free_frags(&port->napi);
> +		flags = u64_stats_update_begin_irqsave(&port->rx_stats_syncp);
> +		port->stats.rx_dropped++;
> +		u64_stats_update_end_irqrestore(&port->rx_stats_syncp, flags);
> +	}
>  	port->rx_skb = NULL;

[Severity: Low]
Should this patch have a Fixes: tag?

The port->rx_skb = NULL assignment here was added by commit 06937db21ee3
("net: ethernet: cortina: Make RX SKB per-port"). Before that commit, the
static skb in gmac_rx() kept its value across stop and open. The next SOF
descriptor then freed the leftover frame in gmac_rx():

			if (skb) {
				napi_free_frags(&port->napi);
				port->stats.rx_dropped++;
				skb = NULL;

Since 06937db21ee3, that check no longer fires after a reopen.
gmac_skb_if_good_frame()->napi_get_frags() then returns the stale
napi->skb.

Commit ebd8ec2b309e ("net: ethernet: cortina: Carry over frag counter")
later added port->rx_frag_nr = 0 to the same stop path, and the gap
remained.

06937db21ee3 has its own Fixes: tag and was merged through net, so it is
probably in stable trees. This change only touches gmac_stop() and does
not appear to depend on the earlier free-queue rework in the series, so
it could be backported by itself. Would this tag fit?

Fixes: 06937db21ee3 ("net: ethernet: cortina: Make RX SKB per-port")

>  	port->rx_frag_nr = 0;
>  	port->rx_dropping = false;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org

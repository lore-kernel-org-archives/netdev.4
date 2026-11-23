Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449868;
	b=Atv5zmcShCWpdig5RYWCk4QsiL40tXmfU6mg1sZfPg4O9RQ/VSxZ127nNg8H62Arnz/s
	 TfqqtGeFY9qCH8746hxGpGYlSobKFPmAtgZkahWWyLZcCJMq9aQ+MtRhZ2es23ATsF97F
	 PYO4V0ARSVy3rU0+AlfvyBim9HXK4IwgJEovNutqHcgIw1PmJS1ig6y6X8SGH+wER+ddt
	 LP2XppmFfXpJZlkxjjpN3YyXM3yzOMDYpu74ZRzPxUvBv32TZ2Qkdk5C4hdcll8eaG1q6
	 juexHEmjADBdY2hRsNeB7oYC5fzjDlw5fVFjfFVtsPRZIJxTfhrXphozYuXFQ6L8Fpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449868;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=LwN3fDmMgmrTxD3q1KoPz3VI89oxMTQsPO4gySpZ9os=;
	b=mDwHfOFbQ8WovzRDm3VQy4RpvCkGy2iOBpwNNd6h7s7rHrlWepVijPK36DMMHyLZQEHb
	 cChhhj7sT1UtcXAqdcZ2ZfauRVbM5yv06W2zM61Xn9HXh9WD4Mys4WfmEtnF9inxe7JW/
	 EYJdYzj6H6t6y8lxwK13aSZzBsk57/1jvyqD+LHmpWewr2LHkTSPA9Wk89N/g7ugJbnAV
	 H27ZlojuF6Vl3arLX4+vAYg7uipCPdO2JwZhjnCTuOXhCqGwQt+E9LOQWjcwAMDVSu97U
	 RJZgNWsX5+dMCNBfufLbHfzmwjZcSkGUigRyqVLBWbm8wdK+A4yeKT/E/tdFZH49S7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X4tIIP5i;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62009606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62009606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X4tIIP5i
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF24D1A179E;
	Mon, 23 Nov 2026 16:04:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C05A601E1;
	Mon, 23 Nov 2026 16:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DD5711E68E6C;
	Mon, 23 Nov 2026 17:04:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795449859; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LwN3fDmMgmrTxD3q1KoPz3VI89oxMTQsPO4gySpZ9os=;
	b=X4tIIP5iygtUvgvo4MLBe8xMaYOVznmQU+DhBI1yCvQ3ErNnGNeN6YCNkhB8t8R+iJYDFP
	KgtpS4QQNO9ZmE8W+AwIaokXUf+CURl1t+Og5k/8ixy7a6oGpIS7HQ0MVb+fJbOAIeWAGJ
	abRa3uGR5+Yrw5akspjsPWaw6R5vsX2F/cs3e6njJc7+FmYNVYaMAkQIjkCBad5gEGQO60
	4GD5IYBdipJuxAL7fPKJaUQXL72Su6wN5a7aWAgSewXsiFvdOnCC/Wmgtbm227XVQHk+SV
	zi4AcLc8ENZTeVJGMPbpNHQfGlGyCBrGAx1/jFzma5E57tC31WnZQu9MEJr2aQ==
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
Date: Mon, 23 Nov 2026 17:04:08 +0100
Message-Id: <DN2PUPUBWLIS.XU99VSML8U14@bootlin.com>
Subject: Re: [PATCH net-next v7 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>
To: <netdev-bot+sashiko@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
 <179537769318.3135.17791912110495668142@kernel.org>
In-Reply-To: <179537769318.3135.17791912110495668142@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello netdev-bot+sashiko,

On Sun Nov 22, 2026 at 9:01 PM CET,  wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When TX queues are disabled, their BQL/DQL state is never
>   reset, so they can stall after a later regrow.
> - [Medium] The new rollback path in macb_set_channels() restarts TX on
>   the old rings without realigning the hardware queue pointer.
> - [Low] The new comment in macb_init_buffers() (line 514) says that
>   "macb_set_channels(), which is the only way of writing to=E2=80=A6
>
> --
>
> net: macb: implement ethtool_ops.get|set_channels()
>
> This commit moves num_queues from struct macb into struct macb_context an=
d
> adds bp->max_num_queues and bp->configured_num_queues. It then implements
> the ethtool get_channels/set_channels operations, using the existing
> context swap window to reallocate rings when the interface is running.
> Queues beyond the active count are disabled by writing QUEUE_DISABLE to
> their RBQP/TBQP registers.
>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index 1e06666921160..180da5d62f09a 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>> @@ -504,11 +504,25 @@ static void macb_init_buffers(struct macb *bp)
>>  		macb_writel(bp, TBQPH, upper_32_bits(txq->ring_dma));
>>  	}
>> =20
>> -	for (q =3D 0, queue =3D bp->queues; q < bp->num_queues; ++q, ++queue) =
{
>> -		rxq =3D &bp->ctx->rxq[q];
>> -		txq =3D &bp->ctx->txq[q];
>> -		queue_writel(queue, RBQP, lower_32_bits(rxq->ring_dma));
>> -		queue_writel(queue, TBQP, lower_32_bits(txq->ring_dma));
>> +	for (q =3D 0, queue =3D bp->queues; q < bp->max_num_queues; ++q, ++que=
ue) {
>> +		if (q < bp->ctx->num_queues) {
>> +			rxq =3D &bp->ctx->rxq[q];
>> +			txq =3D &bp->ctx->txq[q];
>> +			queue_writel(queue, RBQP, lower_32_bits(rxq->ring_dma));
>> +			queue_writel(queue, TBQP, lower_32_bits(txq->ring_dma));
>> +		} else {
>> +			/* macb_set_channels(), which is the only way of writing
>> +			 * to bp->configured_num_queues, is only allowed if
>> +			 * MACB_CAPS_QUEUE_DISABLE.
>> +			 */
>
> [Severity: Low]
> This isn't a bug, but is this comment accurate? macb_probe() also writes
> bp->configured_num_queues:
>
> 	bp->max_num_queues =3D num_queues;
> 	bp->configured_num_queues =3D num_queues;
>
> The else branch is still only reached on QUEUE_DISABLE hardware, because
> macb_set_channels() is the only path that can lower the count below
> bp->max_num_queues.
>
> Could the comment say that instead?

Yes but that's nitpicking. Of course we init bp->configured_num_queues
to the hardware's queue count. By saying

   macb_set_channels is the only way of writing to configured_num_queues

we mean that macb_set_channels() is the only way to make

   bp->configured_num_queues < bp->max_num_queues

>> @@ -3359,10 +3385,6 @@ static void macb_context_swap_start(struct macb *=
bp)
>>  	 */
>>  	netif_tx_disable(bp->netdev);
>> =20
>> -	/* Now that everything is stopped, clear DQL. */
>> -	for (q =3D 0; q < bp->num_queues; ++q)
>> -		netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev, q));
>> -
>>  	/* Safe to call outside bp->lock because bp->irq_quiesced ensures the =
IRQ
>
> [ ... ]
>
>> @@ -3399,16 +3421,26 @@ static void macb_context_swap_end(struct macb *b=
p,
>> =20
>>  	lockdep_assert_held(&bp->mac_cfg_lock);
>> =20
>> -	/* Swap contexts & give buffer pointers to HW. */
>> +	/* Swap contexts & give buffer pointers to HW.
>> +	 * !new_ctx means that the swap failed and we keep the old context.
>> +	 */
>> =20
>> -	old_ctx =3D bp->ctx;
>> -	WRITE_ONCE(bp->ctx, new_ctx);
>> -	wmb(); /* ensure IRQ enabled below read the new context */
>> -	macb_init_buffers(bp);
>> +	if (new_ctx) {
>> +		old_ctx =3D bp->ctx;
>> +		WRITE_ONCE(bp->ctx, new_ctx);
>> +		wmb(); /* ensure IRQ enabled below read the new context */
>> +
>> +		macb_init_buffers(bp);
>> +
>> +		/* Clear DQL (only on successful context swap). */
>> +		for (q =3D 0; q < bp->ctx->num_queues; ++q)
>> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
>> +								  q));
>> +	}
>
> [Severity: Medium]
> This reset runs after bp->ctx has been switched to new_ctx, so it only
> covers the new, smaller queue count. Take a running shrink such as
> "ethtool -L eth0 combined 2" on a 4-queue GEM. What resets the DQL state
> of queues 2 and 3?
>
> macb_free(old_ctx) at the end of this function frees the in-flight skbs o=
n
> all 4 old queues. netdev_tx_completed_queue() is never called for those
> bytes, so num_queued - num_completed stays non-zero on queues 2-3. If BQL
> had already stopped those queues, __QUEUE_STATE_STACK_XOFF also stays set=
.
>
> macb_close() only resets the active context's queues:
>
> 	for (q =3D 0; q < bp->ctx->num_queues; ++q)
> 		netdev_tx_reset_queue(netdev_get_tx_queue(netdev, q));
>
> macb_open() has no reset. netif_set_real_num_tx_queues() does nothing
> with DQL when queues are re-enabled. So consider this sequence:
>
>   ethtool -L eth0 combined 2   (running, TX in flight on queues 2-3)
>   ip link set eth0 down        (resets queues 0-1 only)
>   ethtool -L eth0 combined 4   (down, no swap, no reset)
>   ip link set eth0 up          (no reset)
>
> Can queues 2-3 come back with stale in-flight bytes and STACK_XOFF still
> set? The hardware ring would have nothing to complete, and
> macb_tx_timeout()->macb_tx_restart() doesn't touch DQL. Flows hashed to
> those queues would stall. Even after a completion, the stale bytes keep
> dql_completed() from growing the limit.
>
> Before this patch, macb_context_swap_start() and macb_close() both reset
> every hardware queue. Should these resets cover the old context's queue
> count, or bp->max_num_queues?

Yes, that is correct. Nicolai, a human, already reported that! [0]

V7 resets BQL on the new context queues (ie those that will be active
soon) when we should be resetting the old context queues (ie those that
were active until now).

To be safe, let's reset all queues here and at close. This will be a
in-depth defense barrier if we ever reintroduce such a bug. Otherwise
we risk queues that are stalled forever.

[0]: https://lore.kernel.org/all/cc50263bc4f161b2fff96e04306868cc@tipi-net.=
de/

>> @@ -4618,6 +4658,75 @@ static int gem_set_rxnfc(struct net_device *netde=
v, struct ethtool_rxnfc *cmd)
>> +	if (running) {
>> +		new_ctx =3D macb_context_alloc(bp, num_queues, netdev->mtu,
>> +					     bp->configured_rx_ring_size,
>> +					     bp->configured_tx_ring_size);
>> +		if (IS_ERR(new_ctx))
>> +			return PTR_ERR(new_ctx);
>> +
>> +		macb_context_swap_start(bp);
>> +	}
>> +
>> +	ret =3D netif_set_real_num_queues(bp->netdev, num_queues, num_queues);
>> +	if (ret) {
>> +		if (running) {
>> +			macb_free(new_ctx);
>> +			kfree(new_ctx);
>> +			macb_context_swap_end(bp, NULL);
>> +		}
>> +		return ret;
>> +	}
>
> [Severity: Medium]
> Is it safe to restart TX on the old rings here? By this point
> macb_context_swap_start() has already cleared NCR.TE:
>
> 	ctrl =3D macb_readl(bp, NCR);
> 	macb_writel(bp, NCR, ctrl & ~(MACB_BIT(RE) | MACB_BIT(TE)));
>
> On GEM, clearing TE resets the transmit queue pointer to the TBQP base,
> i.e. descriptor 0. Commit 881a0263d502 ("net: macb: Shuffle the tx ring
> before enabling tx") relies on this, which is why macb_mac_link_up() call=
s
> gem_shuffle_tx_rings() before it sets TE again.
>
> With new_ctx =3D=3D NULL, macb_context_swap_end() skips macb_init_buffers=
()
> and doesn't rotate the rings. If bp->link_up is set, it goes straight to:
>
> 		ctrl =3D macb_readl(bp, NCR);
> 		macb_writel(bp, NCR, ctrl | MACB_BIT(RE) | MACB_BIT(TE));
>
> The link never went down, so macb_mac_link_up() and its shuffle don't run=
.
>
> Would the hardware then restart at descriptor 0 while txq->tail points
> somewhere else?
>
> If descriptor 0 has TX_USED set, TX stops with TXUBR. macb_tx_restart()
> then keeps issuing TSTART because TBQP !=3D head, and TX stalls for good.
>
> If descriptor 0 is a middle descriptor of an earlier multi-descriptor
> (SG/TSO) frame, TX_USED is clear. The DMA would then fetch a buffer that
> macb_tx_unmap() has already unmapped.
>
> This path is reached when channels are grown on a running, link-up
> interface and netif_set_real_num_queues() fails with -ENOMEM while
> allocating the queue kobjects. Does the !new_ctx path in
> macb_context_swap_end() need the same gem_shuffle_tx_rings() handling as
> macb_mac_link_up()?

Yes. Again, Nicolai the human had caught that in his review! [0]

The short summary: stopping the MAC TX engine resets the hardware ring
cursors. That means our TX SKBs are at some slot in the ring (like 42).
When we restart the MAC TX engine, it will work on slot 0 and not 42.

We already have a solution for this: gem_shuffle_tx_rings(). So that is
what's missing from the successful context swap end.

[0]: https://lore.kernel.org/all/cc50263bc4f161b2fff96e04306868cc@tipi-net.=
de/

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


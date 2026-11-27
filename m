Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799699;
	b=Ph+tGx6HsDj10MbNBbJ/86nCojMcM5HiW6GVDVZl9a4szD3KEzLUcuNZ1YPWv6JfDViA
	 dMqMODoqvzzPPCZa8hpN0LZ8J3KFs5nvUAV3sYVNg+0OsalyO49PCNZe/xTvDgOqTfq4c
	 vHbBDU01bEtrKpwwFaYfwiHcQSFBMw+rHaLFJCaAETcnu8Y5mjidARW1CQbq+clRUQR1x
	 ulg7YK1NMgOZ15L540WEARyP0RItLDiVWFutEvImf2u/5tqRmaThZ3ZbtPCFfpY2Uhau0
	 uC1mp1D9tqAhvG+hx8uhX8NTNZMfPeDBHbEkmLcIL3vbFvFqoVEombb8mYO4jW3c5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799699;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=/MqoVVokKifkTRP8a2e4Ou+A0vUAcRxSvdRQdtIKvJc=;
	b=U0ZCgXCqNipSP/UyCLeWL2zTKA74OaHcnLWJ0UoxDtudbY8S7bNirkb2zxM08yXoiqMc
	 gDZ9c0OCgCgepT1oWXUz359G3A147t0W2iA0CrwLhUTPDosMFXrT6ZraTBNly0Mp1xvXk
	 piA3XVhRd3JAQivZigWpTgWTbY6YyRLby6dxqux8cwe1gecMigtxp23fuxodYjLSh3TpC
	 zFeyKqnPrmOBQpdfTqkfXAXZC8FkPV1Op91KiuY0WkWxouZE2aGoPWsrjJFSvisivo84M
	 hrKqHIMXKjnVmQKtYDQUW9tsPBZ+7U1EYdwVSQqTIwEXQgUZhitRiQXxa4h/Q8OSeoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A4rnxq6G;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D95B606A31E;
	Fri, 27 Nov 2026 17:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D95B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A4rnxq6G
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DBC5B1A183A;
	Fri, 27 Nov 2026 17:14:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97C156049C;
	Fri, 27 Nov 2026 17:14:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECB8311E90BE6;
	Fri, 27 Nov 2026 18:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795799686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/MqoVVokKifkTRP8a2e4Ou+A0vUAcRxSvdRQdtIKvJc=;
	b=A4rnxq6G9TAuP6teLDmc1pkmtE4G0RWW7fRuKO2Th6mcAgEfs/fKdCB2HFnJtvGk/9aEbX
	sOJfG649C3ULV/bcQjAlJR3Ixz+FPAkF26n+//HckujJ23NKdyKMOZjXqxv6244bfxqXwK
	4L5rawC2Q/DQuHJN+nPz/HSgRnt0kMTdCCzSr8frPVgdKo/cNtT+dakQ911OIxxpVbbHoR
	FUMFSrqwghuqKXLWqxfmXoseTaZzFKionaRAgcx9OwLCv3alW5P+IZXlvxecZndYA7cdlm
	TlsCRR22G/pUz+3YeDcyRi+acWXtm3Qg/BFzPdm0PBv99HMTQDmyOvr/gh02ow==
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
Date: Fri, 27 Nov 2026 18:14:38 +0100
Message-Id: <DN65UVCVRPGW.3O5CCD2XBNR@bootlin.com>
Cc: <conor.dooley@microchip.com>, <andrew+netdev@lunn.ch>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nb@tipi-net.de>, <pvalerio@redhat.com>,
 <vladimir.kondratiev@mobileye.com>, <gregory.clement@bootlin.com>,
 <benoit.monin@bootlin.com>, <tawfik.bayouk@mobileye.com>,
 <thomas.petazzoni@bootlin.com>, <vineeth.karumanchi@amd.com>
To: <netdev-bot+sashiko@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v8 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261124-macb-set-channels-v8-2-770cf8e50e6d@bootlin.com>
 <179571152544.3135.2345418313808406902@kernel.org>
In-Reply-To: <179571152544.3135.2345418313808406902@kernel.org>
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
> - [Low] The commit message does not mention changes to shared context-
>   swap code that the existing MTU and ringparam paths also use.
> - [Low] On multi-queue GEM devices without MACB_CAPS_QUEUE_DISABLE,
>   macb_get_channels() advertises a channel range that=E2=80=A6
> - [Low] macb_set_channels() checks `bp->enst.queue_mask >> num_queues`
>   before it takes bp->mac_cfg_lock.
>
> --
>
> net: macb: implement ethtool_ops.get|set_channels()
>
> This commit moves the queue count into the per-context struct and adds
> bp->max_num_queues and bp->configured_num_queues. It also implements the
> ethtool get/set_channels operations. When the interface is running,
> set_channels allocates a new context with the requested queue count and
> swaps it in through the existing context swap window.
>
>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethe=
rnet/cadence/macb_main.c
>> index 1e06666921160..bcf77b2763448 100644
>> --- a/drivers/net/ethernet/cadence/macb_main.c
>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>
> [ ... ]
>
>> @@ -3399,16 +3421,28 @@ static void macb_context_swap_end(struct macb *b=
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
>> +		for (q =3D 0; q < bp->max_num_queues; ++q)
>> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
>> +								  q));
>> +	} else {
>> +		gem_shuffle_tx_rings(bp);
>> +	}
>
> [Severity: Low]
> This isn't a bug, but the commit message doesn't mention that this patch
> reworks the context swap helpers that macb_change_mtu() and
> macb_set_ringparam() share. The message says set_channels:
>
>   "ends up only being an assignment to bp->configured_num_queues plus a
>   call into netif_set_real_num_queues()"
>
> The patch also:
>
>   - moves the netdev_tx_reset_queue() loop from macb_context_swap_start()
>     into macb_context_swap_end(). The loop now runs only on a successful
>     swap and is bounded by bp->max_num_queues instead of the active
>     queue count.
>   - adds a new_ctx =3D=3D NULL rollback mode to macb_context_swap_end(). =
It
>     keeps the old context, skips macb_init_buffers(), calls
>     gem_shuffle_tx_rings() and skips the free.
>   - makes macb_interrupt() self-disarm on queues where
>     q >=3D ctx->num_queues.
>   - switches gem_get_rx_ring_count() and macb_poll_controller() to
>     bp->configured_num_queues.
>
> The existing MTU and ringparam callers always pass a non-NULL new_ctx, so
> their behaviour doesn't appear to change.
>
> Could the commit message describe these helper changes, or could they go
> in a preparatory patch?

That is correct. What the model doesn't point out above is that the
reason for all those changes is pretty simple: our context swap window
might now error out. Before all swap operations had to succeed. Now we
have netif_set_real_num_queues() which must be called in the window and
which can fail.

>> +static int macb_set_channels(struct net_device *netdev,
>> +			     struct ethtool_channels *ch)
>> +{
>> +	struct macb *bp =3D netdev_priv(netdev);
>> +	unsigned int num_queues =3D ch->combined_count;
>> +	bool running =3D netif_running(bp->netdev);
>> +	struct macb_context *new_ctx;
>> +	int ret;
>> +
>> +	/* MACB_CAPS_QUEUE_DISABLE means that the field QUEUE_DISABLE/BIT0 in
>> +	 * the per-queue RBQP/TBQP registers disable Tx/Rx queues. If we don't
>> +	 * have that capability we can have multiple queues but we must always
>> +	 * run with all enabled.
>> +	 */
>> +	if (!(bp->caps & MACB_CAPS_QUEUE_DISABLE))
>> +		return -EOPNOTSUPP;
>
> [Severity: Low]
> Does macb_get_channels() advertise a range that this check never accepts?
>
> macb_get_channels() always reports:
>
> 	ch->max_combined =3D bp->max_num_queues;
> 	ch->combined_count =3D bp->configured_num_queues;
>
> Some multi-queue GEM configs don't set MACB_CAPS_QUEUE_DISABLE, for
> example zynqmp_config, raspberrypi_rp1_config, pic64hpsc_config and
> default_gem_config. On those devices ethtool -l shows something like
> "Combined: max N, current N", but every request for 1..N-1 fails here
> with EOPNOTSUPP.
>
> Should max_combined be reported as bp->configured_num_queues when the
> capability is absent?

When cap is absent, bp->configured_num_queues =3D=3D bp->max_num_queues.
So this review sounds wrong.

>> +	if (num_queues > bp->max_num_queues)
>> +		return -EINVAL;
>> +
>> +	if (num_queues =3D=3D bp->configured_num_queues)
>> +		return 0;
>> +
>> +	/* If we allow disabling a queue which has TAPRIO active, we'll keep a
>> +	 * transmission window which would be unusable.
>> +	 */
>> +	if (bp->enst.queue_mask >> num_queues) {
>> +		netdev_err(bp->netdev, "TAPRIO schedule gates queues >=3D %u; destroy=
 the qdisc before reducing channels\n",
>> +			   num_queues);
>> +		return -EBUSY;
>> +	}
>
> [Severity: Low]
> Is it safe to read bp->enst.queue_mask here without bp->mac_cfg_lock?
>
> In the running case the lock is only taken later, in
> macb_context_swap_start(). In the not-running case it is never taken.
>
> Other writers of bp->enst hold mac_cfg_lock. For example,
> macb_taprio_destroy() does:
>
> 	guard(mutex)(&bp->mac_cfg_lock);
>
> 	netdev_reset_tc(netdev);
> 	memset(&bp->enst, 0, sizeof(bp->enst));
>
> macb_mac_link_up() also clears it on a link speed change. It holds only
> mac_cfg_lock and runs from the phylink_resolve() worker without rtnl:
>
> 	memset(&bp->enst, 0, sizeof(bp->enst));
>
> So this unlocked read can race with a locked write, which KCSAN could
> report. The worst outcome looks like a spurious -EBUSY.
>
> Could this check be done under mac_cfg_lock?

ACK, will grab the bp->mac_cfg_lock mutex. It is done before the context
swap window so it is all safe and easy.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


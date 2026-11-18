Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012336;
	b=2Hnc8s1j3oLvApM5PRTd73RQU+nRf9g1DeOQJwPs8YP8+fnyj2pk5mVGNd9Dnt/3NSUz
	 9jeTIj6i11ZzHvAzEkkwrZYQISxDC5l1tl9ZK7sAb2tAUOHNzUBCG73zezIvGBsJPc8jl
	 IpaG8ajcwCm0veU/xxtqZdYbSka5F5NWJfTOJpFrj1YShPZQFuoUaAC+F3rUvePOMn10g
	 yl+/ELxS8O8sjZFgGiRU/3H4/Y+SZtQKsXqm6LuX56WfqUxo4j2KY+V3X4RQ10d731//0
	 WLbnEil2nXFGjXX7/jFni25Rtc4+F4eX9fa885j063sLdhFhBAflvS3e7vFMFavimtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012336;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e+b32G03EPQJGG4TuFx2MYnPePwUlj3+JM0uGkr6zD4=;
	b=oKgRfNtOlb9cy7hEMMb0RZ0Tjx/GYpHhupG1MvnPV5RJl/EiVM6RjNzQuDw/F5kXmEJf
	 wYCz9seAxOFWj+739k7BA8D5yzjUPjmBcvJSJEbyr8ZKrHSs/7gEz0o+m98rO82XBDGoW
	 vsf7EddI95uVTa/T2UiLVFo/dxLG9RJgJUBeaxzymJ7v/f0t4GfTMo1ZmOnzuAsvvJJnV
	 lrx9iaqxVepWHlLqFTqUdM9RUxGTvExJR3/ARmm8V8GBLJoWKe9INH5SLTYoCPk5aUrES
	 /RCgYvvGbXrsKJjfuYwwfsS1zzDSjiXqVl+GCjH2qEC+B38YlG4OEKtG3KVmYlnDnGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ub6W/pX1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC5606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ub6W/pX1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7651F000C4;
	Wed, 18 Nov 2026 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012335;
	bh=e+b32G03EPQJGG4TuFx2MYnPePwUlj3+JM0uGkr6zD4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ub6W/pX1mC7IY7rMoMyv4yYYkMN39ZnGKPD9uvdFccWdwD2f/KEfDPbHcddpfhuto
	 L79pa+5P/ZmsAooOBrGpfg0koXGAGU/3B7wxv8jMtP1IbwV1h6zX57876GbSSEHLzf
	 8C58a7pUKYr9HyTtXT3rC2g4ICDxfHZLbnnokbcypK/ZYocICSMhYgrYHpUThN9skX
	 Pp7XNpfZ/ckZ2SBvzr+DcmO9hwRsMzR9VNN/TriXoqOn/QbITGzhceIFlV90SjfjjH
	 zYWdOLa/Ea5A+35IyeiLbW0ZAEsXvuAleCIncw3YlPIH8AbIMKZcMU2isZ4ZkWyY58
	 Obxk5Wq2T1S0w==
Subject: Re: [PATCH net 1/4] eth: fbnic: wait on the correct queues in
 fbnic_queue_stop()
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org, almasrymina@google.com,
 vadim.fedorenko@linux.dev, daskald@meta.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 14:32:14 +0000
Message-ID: <179501233405.3136.1951462935602133003@kernel.org>
In-Reply-To: <20261116202957.3601684-2-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-2-dimitri.daskalakis1@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] eth: fbnic: fbnic_wait_queue_idle() only polls 128 bits of
  256-bit Tx idle regs
- [Low] This patch changes what `struct fbnic_ring::q_idx` holds for Tx
  completion rings, but the field's comment still describes the old…

--

eth: fbnic: wait on the correct queues in fbnic_queue_stop()

fbnic_queue_stop() now passes cmpl.q_idx to fbnic_wait_queue_idle(), so
each queue triad is checked against its own hardware queue. Before this,
sub0.q_idx was used and every Rx triad was checked against queue 0. The
patch also sets q_idx on Tx completion rings, and the stop/wake loops now
skip disabled Tx rings.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 07d4b2e923627..5efed21e59329 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -1772,7 +1772,7 @@ static int fbnic_alloc_napi_vector(struct fbnic_dev *fbd, struct fbnic_net *fbn,
>  
>  		/* Configure Tx completion queue */
>  		db = &uc_addr[FBNIC_QUEUE(txq_idx) + FBNIC_QUEUE_TCQ_HEAD];
> -		fbnic_ring_init(&qt->cmpl, db, 0, 0);
> +		fbnic_ring_init(&qt->cmpl, db, txq_idx, 0);

[Severity: Low]
This isn't a bug, but should the comment on struct fbnic_ring::q_idx in
fbnic_txrx.h be updated along with this change? It still says:

	u8 q_idx;			/* Logical netdev ring index */

With this patch, the Tx completion ring's q_idx holds the hardware TCQ
number. fbnic_queue_stop() now relies on that, because
fbnic_wait_queue_idle() uses idx only as a bit position in the QM idle
registers:

	off = idx / 32;
	mask = BIT(idx % 32);

On XDP-only Tx triads (txq_count == 0 in fbnic_alloc_napi_vector(), with
sub0 marked FBNIC_RING_F_DISABLED), no netdev Tx queue has this index. In
the "rx 34 tx 34" example from the commit message the value is 39, but
the netdev has only 34 Tx queues.

Future code that trusts the comment, for example
netdev_get_tx_queue(dev, qt->cmpl.q_idx) or fbn->tx[qt->cmpl.q_idx] on a
Tx triad, would get the wrong queue or none at all. Could the comment say
that q_idx on completion rings is the hardware queue index?

[ ... ]

> @@ -3089,13 +3092,16 @@ static int fbnic_queue_stop(struct net_device *dev, void *qmem, int idx)
>  	napi_disable_locked(&nv->napi);
>  	fbnic_nv_irq_disable(nv);
>  
> -	for (i = 0; i < nv->txt_count; i++)
> +	for (i = 0; i < nv->txt_count; i++) {
> +		if (nv->qt[i].sub0.flags & FBNIC_RING_F_DISABLED)
> +			continue;
>  		netif_stop_subqueue(dev, nv->qt[i].sub0.q_idx);
> +	}
>  	fbnic_nv_disable(fbn, nv);
>  
>  	for (t = 0; t < nv->txt_count + nv->rxt_count; t++) {
>  		err = fbnic_wait_queue_idle(fbn, t >= nv->txt_count,
> -					    nv->qt[t].sub0.q_idx);
> +					    nv->qt[t].cmpl.q_idx);
>  		if (err)
>  			goto err_restart;
>  	}

[Severity: Medium]
Does fbnic_wait_queue_idle() actually wait on the XDP Tx ring here?

The commit message says that in the "rx 34 tx 34" case the vector now
waits on tx 39, the XDP Tx queue of rxq 5's vector. That ring is
qt->sub1, which is TWQ1 of hardware queue 39. qt->sub0 (TWQ0) on the
same triad is marked FBNIC_RING_F_DISABLED. The first Tx triad of every
vector with Rx queues has the same XDP sub1 ring, combined or not.

In fbnic_csr.h, FBNIC_QM_TWQ_IDLE, FBNIC_QM_TQS_IDLE and
FBNIC_QM_TDE_IDLE each have 8 registers. That is 256 bits, enough for
TWQ0 and TWQ1 of all 128 queues. FBNIC_QM_TCQ_IDLE has only 4.
fbnic_wait_queue_idle() derives a single offset and mask from idx:

	off = idx / 32;
	mask = BIT(idx % 32);

It applies those to every Tx register base, so it only reads registers
0..3 of the 256-bit arrays.

If the upper half holds the TWQ1 bits, TWQ1 is never polled.
fbnic_queue_stop() can then go on to fbnic_nv_flush() and clean up the
XDP Tx ring and its buffers while the hardware may still be processing
it. If the bits are interleaved per queue instead, the bit polled for
idx > 0 is not the TWQ0 bit of that queue at all, and we would either
miss the real queue or hit spurious idle timeouts.

The register handling predates this patch. Until now, though, every Rx
triad was checked against queue 0, and this patch makes the XDP-only
triads depend on this wait. How are the TWQ1 idle bits laid out? Should
fbnic_wait_queue_idle() also poll the TWQ1 bit for the TWQ, TQS and
TDE registers, perhaps only when sub1 is not FBNIC_RING_F_DISABLED?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116202957.3601684-1-dimitri.daskalakis1%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205825;
	b=lCk1B+0ygv8aUNi0IZ3IxGmhjrk6pZpcGPX/s4e4MsAnNurQkoUdpo3QL9ImNAFNrEuQ
	 8eCgeOFSQDrWyZP9ZkNXxOoEZwF9QlreqYEGZegcToTwKaKinmOEAuLjDbHaJiQpSC/cT
	 VM9Mfq8se7cA/F4BQqJ2GCHvDnvTuZt871UKF1u4mF4HmsGMvEA+4GLcv/wHRA2jeJ0nm
	 WCxmYTYUk22QW9a58g24nikoeXaKIgNq7bOoO3/TH+pOIoTs4OFmvGu+OsEVYY5S1Xt1n
	 8mlZPLe2FLLzn2la4B4ZUtB58g4IdJ1LE3uK851ylUydpUHmY2ywTvXp99j6RA9dm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205825;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=0e8bBESaPWfHk+nLoYr0qrHXqPuIeAD8bwji0lFZ80g=;
	b=HT7sIXuZt5BAInFj0bpgTxnxHQRcSqdvzkPOoZ4pmeXmsurDwZ3+P+FQrepNfXxfG6/S
	 KnIzIoFztAlAB7q26SCY9yOl5Q7gIZ/O5JRnjaLUFO6H9eCsyoTpkqnPFarh4AfsBmghD
	 ZrKBFNG4+bALRo1cVfr+U7kpk4++IhH9smPz69vApga7fBrLVlo2uRLVQms/ya+9koaCS
	 zys2bHVpOYi+lG304ZX051ondcOs1cQIoZqYjQuu37tWyOWPFwUyQl1+Zkd6/T+VNzTRN
	 biVAJo2xQMJL46+cVpBXmHovAxjx6A7XexH28b11rrQOs9aNk2AlOBuscgUwnF4UCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=LBmXLWl2;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00945606A6D5;
	Fri, 20 Nov 2026 20:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00945606A6D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=LBmXLWl2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C071A1579;
	Fri, 20 Nov 2026 21:16:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795205819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0e8bBESaPWfHk+nLoYr0qrHXqPuIeAD8bwji0lFZ80g=;
	b=LBmXLWl2Kbf0qEd5Xq9w2yGHcgSLUIbVZOBKUMt/vqfBf7yPioyyJ6zzvCykICwnHDrtgA
	WHCqrjutXKElukP7fA6bLvy9+Q6zmj8jLz6AjG72r4QC3jj2LL2iIVqebzUvqaO0YjuoBG
	bFf724PtfILGRDu25Ui9LbxS7C2DfojAwTPuSxW/lriTHO1YEiItQXlsc4Lpcqltux2Eka
	Fg3aZSng/CfYn1lUk1nRgb1gwEBCBJX2Z427l1WQrzswZgiF7zEqIMyP784xmmll0QrlsA
	yIqTVb9SKtvWNUe8+jdfMDjCktYNU5dYdcwgKXbytkmo5btCt9esWmxCPwvFow==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 21:16:57 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, justin.chen@broadcom.com, pgynther@google.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com
Subject: Re: [PATCH net 2/4] net: bcmgenet: restart DIM from the default
 profile on ring init
In-Reply-To: <179512026414.3136.5512333445190926749@kernel.org>
References: <20261118-nb-genet-dim-stats-net-v1-2-13b275f1e088@tipi-net.de>
 <179512026414.3136.5512333445190926749@kernel.org>
Message-ID: <8b3c7fb8c73f1f5b224052752969eda4@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 19.11.2026 21:31, netdev-bot+sashiko@kernel.org wrote:
> [...]

> [Severity: High]
> Can the same stuck DIM state still happen through Wake-on-LAN
> suspend/resume?
> 
> The reset only runs from bcmgenet_init_dim(). Its only caller is
> bcmgenet_init_rx_ring(), which is reached through bcmgenet_init_dma().
> 
> The WoL branch of bcmgenet_suspend() goes through the same cancel that
> the commit message describes for close:
> 
> bcmgenet_suspend()
>     if (device_may_wakeup(d) && priv->wolopts) {
>         ...
>         bcmgenet_disable_rx_napi(priv);
>         disable_irq(priv->irq1);
>         ...
>     }
> 
> bcmgenet_disable_rx_napi()
>     napi_disable(&ring->napi);
>     cancel_work_sync(&ring->dim.dim.work);
> 
> Suppose the last net_dim() call set dim->state = DIM_APPLY_NEW_PROFILE
> and scheduled the work just before this point. The work is cancelled,
> and bcmgenet_dim_work() never runs. It is the only place that moves the
> state back to DIM_START_MEASURE.
> 
> On resume, the fast path in bcmgenet_resume() re-enables RX NAPI 
> without
> reinitializing the rings:
> 
> bcmgenet_resume()
>     if (priv->tx_cbs && (reg & CMD_RX_EN)) {
>         /* Successfully exited WoL, just resume data flows */
>         ...
>         bcmgenet_enable_rx_napi(priv);
> 
> That means bcmgenet_init_dim() is not called, so the new memset and
> profile_ix reset never run. After that, every net_dim() call hits:
> 
>     case DIM_APPLY_NEW_PROFILE:
>         break;
> 
> Adaptive RX coalescing stays frozen until the next ifdown/ifup. Also,
> profile_ix already points at the new profile, while the
> DMA_MBUF_DONE_THRESH and DMA_RING0_TIMEOUT registers still hold the old
> values.
> 
> Toggling adaptive coalescing through ethtool doesn't seem to recover
> from this, since bcmgenet_set_ring_rx_coalesce() never touches
> dim.state.
> 
> Would it work better to reset ring->dim.dim.state, and re-sync
> profile_ix, in bcmgenet_disable_rx_napi() right after
> cancel_work_sync()? That would cover both close and WoL suspend.
> 
> The later patches in this series ("net: bcmgenet: reset the Rx discard
> count with the ring" and "net: systemport: accumulate the DIM packet 
> and
> byte counters") don't touch this path, so the gap is still there at the
> end of the series.
> 
>>  	dim->event_ctr = 0;
>>  	dim->packets = 0;
>>  	dim->bytes = 0;

Valid point. I will use flush_work() instead, which is IMHO a better 
fit.
It applies the pending profile, so profile_ix and the hardware stay in
sync, and it covers both close and WoL suspend.

--
pw-bot: cr

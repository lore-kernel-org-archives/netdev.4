Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840351;
	b=3PwgAbU+tf8oB70HYx4FXsTTfSixDSpQsa3+cGuAh7YhKkalHn1ET5L15Kw5xa6T21vn
	 wftsNbo4+Yohrc+TImp5kjNNaXAeCIW/xppn1RVW9qkeCfQ6h4wdimWA8pRXcIFRC5MAH
	 Wzi3G45xGOBziPH3RIglz9CgRe1jsdNDfSU12Jistn+7FNRbdVKFocuc+8CIu8ZK/vmFK
	 gbTPzKavbRKUCr9BwajBeqpnxKkTPrC7N/k1JkLrIqDEkqAhFL5JCwCEMgCGARws63Ip+
	 hJGLItLVbxq3fxvkS7VIMeasED9MSTP9Oin0a7DWkDRK5+W/4ySGrL9lcTaV6RreO7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840351;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Bi/4dPeSwghWgR8QDDa3TC7/z8x4W3Cuv/2vNXQIGzk=;
	b=Onesc3tJvivW0yfIoJMmwT8lXGj5bw0kJm7okWQ2zwdNfJjOEx7ThczFIfC6BdX1KlCA
	 gQuO8zLP8xUZwcjCaHMkNN8UQileMocxODwnwGwe3VSqf0cEjmprsh9TfW7jNGFCME3rO
	 HunUPKh7VrGbrBgO5S1DcV07zfOmerRJXKCC4bRVYL+5SnPDdQBv05Eu4xBPWx6KNmrPo
	 Q5u3doNYt99nG9ibQo+C0Ndmr5ej0FhhKKp418PiMGbCjTDpwfImgk/A1Oj64h6zkNwuu
	 KUW1k63YyJdxq6vQ9QLJXUcPBO/P0EWactzeQ/4c6/7fjB+5G1VNhTDJJN+HtHK7Akw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AfZlphR/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5583606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AfZlphR/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAED1F000C9;
	Mon, 16 Nov 2026 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840351;
	bh=Bi/4dPeSwghWgR8QDDa3TC7/z8x4W3Cuv/2vNXQIGzk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AfZlphR/MnZwo6uF6WkoRjn8DIghoJYtcYdrklLDYrLzBTbz7OPVYsK7C4p+XRHyI
	 6sztVxMaoTujZuXVdIVmCF4+F4XA28Tpi4XVuKXBCNK73loMzc0Cvvuz0rTnMFVMXO
	 OzAIDwZWSoRYdVPuyJ/nyjcatII/7MRU+ks7aJSAwM0fuOA5DRri5pvEtKs4LcxXMq
	 DrKpwZlwJOx0uQalb4mii6438hFtmUrZ0SAZZdAR/H9BLpv2qDRE/Zd67KaVtK/3Iv
	 VbpLo5eYGW8i7qmMPnGu46VykTJ9MZNsLlbIXPf2qMcGBcZ/05QJmzKgB/2PvLhex+
	 87XlSETB8Xy6w==
Subject: Re: [PATCH net-next v8 15/19] net: ethernet: cortina: Serialize TX
 completion statistics
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Mon, 16 Nov 2026 14:45:50 +0000
Message-ID: <179484035038.3136.14929259935888158241@kernel.org>
In-Reply-To: <20261112-gemini-ethernet-fixes-3-v8-15-f55bd43e02d3@kernel.org>
References: <20261112-gemini-ethernet-fixes-3-v8-15-f55bd43e02d3@kernel.org>
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

- [Low] The comment on geth->irq_lock still describes it as a lock for
  IRQ-related registers.

--

net: ethernet: cortina: Serialize TX completion statistics

This commit takes geth->irq_lock around the ir_stats_syncp writer section
in gmac_clean_txq(), so the TX completion counters are serialized against
the MIB and RX overrun writers. It also switches the tx_frag_stats update
to the irqsave variants of the u64_stats writer helpers.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index 5a87d88607cdb..cc26ff16a0a36 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c

[ ... ]

> @@ -716,18 +717,21 @@ static void gmac_clean_txq(struct net_device *netdev, struct gmac_txq *txq,

[ ... ]

> +	spin_lock_irqsave(&geth->irq_lock, flags);
>  	u64_stats_update_begin(&port->ir_stats_syncp);
>  	port->stats.tx_errors += errs;
>  	port->stats.tx_packets += pkts;
>  	port->stats.tx_bytes += bytes;
>  	port->tx_hw_csummed += hwchksum;
>  	u64_stats_update_end(&port->ir_stats_syncp);
> +	spin_unlock_irqrestore(&geth->irq_lock, flags);

[Severity: Low]
This isn't a bug, but should the comment on irq_lock in struct
gemini_ethernet be updated as well? It still says:

    spinlock_t	irq_lock; /* Locks IRQ-related registers */

This new critical section in gmac_clean_txq() does not touch any registers.
It only serializes the software counters under ir_stats_syncp against the
writers in gmac_update_hw_stats() and gmac_irq(). After this patch, irq_lock
is also the lock every ir_stats_syncp writer has to hold, and the struct
comment does not mention that.

A related issue predates this patch and was not introduced by it. The
reader in gmac_get_stats64() says:

    /* Racing with MIB and TX completion interrupts */

gmac_clean_txq() is only called from gmac_start_xmit() and
gmac_cleanup_txqs(), never from an interrupt handler. Could that comment be
corrected at the same time?

>  
>  	txq->cptr = c;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3%40kernel.org

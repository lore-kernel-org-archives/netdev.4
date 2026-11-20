Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170758;
	b=KcZ7IkR5t7e3pATGs4J5zdyPYkMFVdk7Vue652X2N0CliY94L1igY5Rwiadtqh/09dDr
	 yAVja1y6EJwNRKVZmtTZGT6awZ/qU0ZQqhXnH3CiEpzn7qZqS4tCLYd95/DUBCjXGtL4x
	 IBY7dIXwGE1RB0Jft4nwfTXW+ukmEggxigydBgek/UsbuImAfizEJCh4wgF2zOaQhXUI0
	 qfj9SdWZ/InasMUSs/5gwzR2M2A3J3eOy2sjhhx/v3CCTOAMLi6UNwLh86V6hwTXs+uYG
	 ZFfe0IvGIsW1Z6DbgCbc2BWfh88FuaLdBhGL4gOFyDdKCF94Yh7vqOX2PMQy6Uw2Gig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170758;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4w47F1oOudqCCMJksXFKfd7JVduY8lHHMV19vhSptJo=;
	b=k0579IQqCCLj72BvghrqocWcNd9zQ8GucWAMazf1pRaXN4/EslTw3O4Z9owX4soOc+AQ
	 gSZjzvrGxrjNzo1lCZUdw0np7xVnB5KgGVuTP9/KBxk8A3PMqahZ/daS4fvfd3kTrpisz
	 XypFEkLj6Xl3ODphYRxNgjlps3dbYGcaCZJh9usNHPunvKaLhwkanTHV7MJH5E2XYrO4r
	 uCujUkRJvc8stA1hZMdapT1ibjV61q7Z2DL6zo7crfBFWbxMr9IFamnvoPMFGfK/ckdmb
	 qavcLfhlk9BfS2NPctVl7OCvL+oiKgAOGxDgo3qyPkFs3ivnsB+lgX/9yTsUDPMMbCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PALy035L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0F606A338;
	Fri, 20 Nov 2026 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PALy035L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B553D1F000E0;
	Fri, 20 Nov 2026 10:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170757;
	bh=4w47F1oOudqCCMJksXFKfd7JVduY8lHHMV19vhSptJo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PALy035LgsUPHsychnN6eW9sJZvQZ416VbtvD2aHoRuz5jP/MoLSYjqwdbQRfFsfE
	 Ohpi2Q40SSuwGRpHELNWO0lEmlNCWMKu3yAZwxG/MfAtoWuLYnuBHKCrsMl6WVxzny
	 a4JmJdJfKkkw2Uk1b+E/HtNnf4nIo68sO84ox2rRLljKuNXuDM/GL6la0gjFhxgtsI
	 nEUf3hTWUJZA3xJ/ZT7FhPto8HyjGjI3NscMDathwjHyDA/cx7Bqtnw3EQf9kLu8Ba
	 RzZyvQTCkYhvbP27SPob0QOXJOBJqyI+RLxg5DI33RAsM376ZiCB7LrqNMJXUFCHty
	 Ccl8vyyNE6RTQ==
Subject: Re: [PATCH net v3 05/10] net: au1000: serialize TX completion with
 packet submission
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Fri, 20 Nov 2026 10:32:36 +0000
Message-ID: <179517075632.3136.4816970691265925776@kernel.org>
In-Reply-To: <20261117193223.2795612-6-f.fainelli@gmail.com>
References: <20261117193223.2795612-6-f.fainelli@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] au1000_tx() (drivers/net/ethernet/amd/au1000_eth.c) now holds
  spin_lock_irqsave(&aup->lock) for the whole transmit path.

--

net: au1000: serialize TX completion with packet submission

This patch takes the IRQ-safe aup->lock in both au1000_tx_ack() and
au1000_tx(), so TX descriptor reclamation and queue state changes are
serialized. When au1000_tx() reclaims a completed descriptor at tx_head,
it now also advances tx_tail. The skb is now freed with
dev_consume_skb_any() after the lock is released.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index 1935b1d4b1738..805aabc6721b8 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c

[ ... ]

> @@ -972,21 +976,25 @@ static netdev_tx_t au1000_tx(struct sk_buff *skb, struct net_device *dev)
>  	u32 buff_stat;
>  	struct db_dest *pDB;
>  	int i;
> +	unsigned long flags;
>  
>  	netif_dbg(aup, tx_queued, dev, "tx: aup %x len=%d, data=%p, head %d\n",
>  				(unsigned)aup, skb->len,
>  				skb->data, aup->tx_head);
>  
> +	spin_lock_irqsave(&aup->lock, flags);

[Severity: Medium]
With this lock taken here, the rest of au1000_tx() runs with local hard
IRQs disabled until the spin_unlock_irqrestore() at the end. That
includes the packet copy and the zero padding loop:

	pDB = aup->tx_db_inuse[aup->tx_head];
	skb_copy_from_linear_data(skb, (void *)pDB->vaddr, skb->len);
	if (skb->len < ETH_ZLEN) {
		for (i = skb->len; i < ETH_ZLEN; i++)
			((char *)pDB->vaddr)[i] = 0;
	...

On Au1000/Au1500/Au1100, MIPS_ALCHEMY selects DMA_NONCOHERENT. That
makes the dma_alloc_coherent() buffer uncached, so every store into
pDB->vaddr is an uncached bus write. A full frame is up to about 1514
bytes.

The RX side has only NUM_RX_DMA (4) hardware buffers, and they are
serviced only from au1000_interrupt()->au1000_rx(). Before this patch,
the RX interrupt could preempt the copy.

Could this longer IRQ-off window on every transmit lead to more RX
overruns (RX_MISSED_FRAME) under combined TX/RX load? It would also add
interrupt latency for the rest of the system on these single-core
parts.

The copy does not appear to need the lock. Suppose au1000_tx() has
checked, under the lock, that TX_DMA_ENABLE and TX_T_DONE are clear at
tx_head:

  - au1000_tx_ack() stops at the first descriptor without TX_T_DONE.
  - It never touches the tx_db_inuse[] buffers or tx_head.
  - ndo_start_xmit is already serialized by the TX queue lock.

Would it be enough to hold aup->lock only for the descriptor state
check, the tx_tail/tx_full handling, and the final len, buff_stat and
tx_head updates, and do the copy and padding outside it?

>  	ptxd = aup->tx_dma_ring[aup->tx_head];
>  	buff_stat = ptxd->buff_stat;
>  	if (buff_stat & TX_DMA_ENABLE) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193223.2795612-1-f.fainelli%40gmail.com

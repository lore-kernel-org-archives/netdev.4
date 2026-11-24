Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523626;
	b=NHwgg5Yqs3xKmZP9naVY1lH/VOty737hMX/NH1miE2iSJTps+TXwGZ+z4N1/e26G08Yz
	 pNM+ONH1ZDHXA2FFr8025G9PEgj2FcuSDOXFUe+d6H1YyBZpwnZ1JVldkAXhdde2a7W5b
	 j5hUOf3wCvvEyrqeRszg+Uq8JXUuW2++BWaFz95cky+AEfzv8NmM3ciaLFRt9hwyVlExB
	 ZjctuKieDdy3V67UV1laSG3qToKBw3umbzdfibWJvQpZ3rSLK3UZ1OAnz9bNwC5evRMLr
	 dx/jCajB/tShZo5SzPYa+B2INf8Bcnue9NTIElOvUUonNx70UOPP9Bi6IHXceAb9CcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523626;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Z4d3nL7OYdYZt4tg7FEsgePZF7AWi0rnbr/OxJzP0IE=;
	b=tltzES0xhhSxzOSM5UwJgGDjVjWxjZ7jzY/ZCKGdFS/3zssLiK9rqC3iINWwPXuDpONm
	 de4KB+SNzAYKO2+2EKXVs261aoD2DLRuN8KxmmG9ncDLhZhu3orYvlJOrXDT107jaJSTb
	 r1zYnKyuvPokDe9W54cKHGdM07bSdsmN+sE9c+Vu6/4bZ35igFqRkMt39Iqcs5OInjSga
	 JjtyC0k8yPICBXH8L5ltV6O7eVVorH/JLHzj6IcRKZyuR78FhFFKYZAjYeBUAwmm7vrZ6
	 KDmpD2M+mR8ePVGaZXE39LEvb9dR70PiRFIvq0Twi2eTlQydvetIXTfBLVHwchNqiVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QS5wPKP7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0D8606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QS5wPKP7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA31C1F000D0;
	Tue, 24 Nov 2026 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523625;
	bh=Z4d3nL7OYdYZt4tg7FEsgePZF7AWi0rnbr/OxJzP0IE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QS5wPKP7+uhkgh87b3SgFOyHSqEAV+eq/xyQ5x2LW7gU7FJJtYOtOYMDMSnmkIsSL
	 46ZkvNrVk4eagkFRlh3uzYVdqJK6neBLVuZsrfc0wOVFDF7h/rdqillffKEVWBQXA9
	 /4ZQeRS2f/rfjH7oqYrF7OJYUDUvZ4E5bxhOUs7R0Fl7XbhulZFyxOROByplb5yDmH
	 JlsV4RUnYb2EjGqQGsM2A2b98QQh3aJRZHpmGsWqYLrr2+d2L+7sDSR5nrznvemJLy
	 22zZEfBwz5alBvtlWITvvd9NFjtxPaJEHTfHH7HyuZI8EVq9kCO0iTEB/qTHColHCG
	 nrWQHkKjEPKpw==
Subject: Re: [PATCH net 2/4] net: add netif_disable_subqueue()
From: netdev-bot+sashiko@kernel.org
To: dimitri.daskalakis1@gmail.com
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, willemb@google.com, horms@kernel.org, bjorn@kernel.org,
 bobbyeshleman@meta.com, almasrymina@google.com, daskald@meta.com,
 netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 12:33:44 +0000
Message-ID: <179552362454.3135.13950803840518714648@kernel.org>
In-Reply-To: <20261121033215.1020506-3-dimitri.daskalakis1@gmail.com>
References: <20261121033215.1020506-3-dimitri.daskalakis1@gmail.com>
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

- [Low] The commit message for "net: add netif_disable_subqueue()"
  describes the patch as only adding a new helper ("Add a helper like…

--

net: add netif_disable_subqueue()

This commit adds netif_disable_subqueue(). The helper stops a single TX
subqueue while holding that queue's xmit lock, so ndo_start_xmit() is no
longer running on it when the helper returns. The commit also rewrites
netif_tx_disable() so that it calls the new helper for each queue.

> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 435be7880d7e5..e716b98e8b4c8 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h

[ ... ]

>  static inline void netif_tx_disable(struct net_device *dev)
>  {
>  	unsigned int i;
> -	int cpu;
>
> -	local_bh_disable();
> -	cpu = smp_processor_id();
> -	spin_lock(&dev->tx_global_lock);
> -	for (i = 0; i < dev->num_tx_queues; i++) {
> -		struct netdev_queue *txq = netdev_get_tx_queue(dev, i);
> -
> -		__netif_tx_lock(txq, cpu);
> -		netif_tx_stop_queue(txq);
> -		__netif_tx_unlock(txq);
> -	}
> -	spin_unlock(&dev->tx_global_lock);
> -	local_bh_enable();
> +	spin_lock_bh(&dev->tx_global_lock);
> +	for (i = 0; i < dev->num_tx_queues; i++)
> +		netif_disable_subqueue(dev, i);
> +	spin_unlock_bh(&dev->tx_global_lock);
>  }

[Severity: Low]
This isn't a bug, but the commit message only talks about adding a new
helper:

  Add a helper like netif_tx_disable() (which drivers commonly use
  when stopping the interface) but for one queue.

It doesn't say that netif_tx_disable() itself is rewritten here.

The old body disabled BH once, read smp_processor_id() once, and used
__netif_tx_lock(txq, cpu) for each queue. The new body uses
spin_lock_bh(&dev->tx_global_lock) and calls netif_disable_subqueue()
for each queue. That helper does its own nested
__netif_tx_lock_bh()/__netif_tx_unlock_bh(), and it takes the queue
index as u16 rather than the unsigned int loop counter.

As far as I can tell the behavior is unchanged. Still, every driver
calling netif_tx_disable() on its stop path picks up this change.

Could the commit log mention the conversion? Something like "Convert
netif_tx_disable() to use the new helper, no functional change
intended." would be enough.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121033215.1020506-1-dimitri.daskalakis1%40gmail.com

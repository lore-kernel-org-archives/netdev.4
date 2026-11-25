Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570112;
	b=q5Na8hfE0/zjoWaP0/k24U9/Tg4NTK9xHaMg/xfv28J7foBqVC7EoG+9hMENWqxay+YI
	 dDSzvy/eCU+0m6xk5L7Wmwc9speaRv8IPq4QAq/VLp8urXM6wLg6uVsa7oQzyZNwSNWYv
	 qHpohYKbMs1oZN7q9Xg/KVm5/Mkb+0Dock2lPhvJxLC/DF4rvZLzhJu5JCbxOlgRXOPvT
	 9XFuPikQPGZTXwY0zxTN6QPXv9gBFEn3k3UnU63rUEpHmF5czX85WGI+IDxODzk8DG2S4
	 m+0os+Gp1yknXgDFhKe+op3B4+mmOokFzW+K4oFW87T+ieZKxh7dMWs2erb+aOrFOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570112;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YvHf32I3CxsjZN9KDS8kUqYRtxaIn+dFhytpRDYuc4A=;
	b=vbo86Ij8cyEvW6ugxq+gqIg7H2fzNxNNB7v5YEsemqeoCJSx6jKNvBKjM4JUOIuVSobb
	 lUEKvg0BOe5lUxz1aTiCVzUpAcb7xUVcXgznLotUimEShR8iH2HoBf1FsNl+lDhIlPlqK
	 YQh/o0cJwKRD/SagaMr7Jhl+IvX4AKWMRvZUiIjIISkUmQaSkLQzdPxAbX/6gomomZEoc
	 lxCnlY6k/OpcBzoKW/DQ2+F5vBW4YvQu/iGI+bFbDdipqnY/GDJDiSUiIQduerb1l/8dG
	 f9qruv8QBJCW0OmQW3Ed0+BJfwLql7XntB8rq2THFmcuOUB/+PaxZIRAOOEAltMrZjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKZI7uve;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C3606A31E;
	Wed, 25 Nov 2026 01:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKZI7uve
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBC81F000C6;
	Wed, 25 Nov 2026 01:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570112;
	bh=YvHf32I3CxsjZN9KDS8kUqYRtxaIn+dFhytpRDYuc4A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iKZI7uveY4lg1vxjNYhLQ49O7l2U5wZWAKHgGnO3R4mw1eJGGCoK7TYaVnJI53u4s
	 CnDZ1hj2vZCpK0ZSYG/BS1UPXR0zEmR5YZQskn+VQJmwroIgzJbD85HdpBjmAiq5r3
	 SQOMVznDBkjhLq2NECs9yd0iqYIvNhAnKWX7ERuTKB2qVh0+GcbfFcePoiqnycJ1fp
	 y1sMbzWOxO7iIjiyB4sIhsxj32CM7JEh70IzUZ3JVK3wHs3AJkQquw24/FOnUwgTIp
	 5A4/d3hzg5+Pgf28tvYEeIqj5ICUxK22iapbs3x9TUsyuzn5yfIrQ9fojJ2ZI+anJ2
	 PtuJ+THQn1jlQ==
Subject: Re: [PATCH net v4 07/10] net: au1000: restore RX buffer addresses
 when restarting the MAC
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Wed, 25 Nov 2026 01:28:30 +0000
Message-ID: <179557011055.3135.6140198422373932770@kernel.org>
In-Reply-To: <20261121004809.1690280-8-f.fainelli@gmail.com>
References: <20261121004809.1690280-8-f.fainelli@gmail.com>
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

- [Low] In `au1000_init()`
  (drivers/net/ethernet/amd/au1000_eth.c:727-728), the patch writes the…

--

net: au1000: restore RX buffer addresses when restarting the MAC

The commit changes au1000_init() to reload each RX descriptor's buffer
address from rx_db_inuse[] before setting RX_DMA_ENABLE. Before this,
it only OR-ed in the enable bit on whatever address the DMA engine had
left behind. That could make a receive after close/reopen start partway
into its buffer.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index ea2766343d518..ec28ed33bf698 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> @@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
>  
>  
>  	for (i = 0; i < NUM_RX_DMA; i++)
> -		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
> +		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
> +		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);

[Severity: Low]
This isn't a bug, but should this be a plain store, like the other
accesses to buff_stat?

The commit message says this matches the receive completion path.
That path does a plain C assignment, not a writel():

drivers/net/ethernet/amd/au1000_eth.c:au1000_rx() {
    ...
	prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
    ...
}

au1000_probe() initializes the same field the same way:

	aup->rx_dma_ring[i]->buff_stat = lower_32_bits(pDB->dma_addr);

au1000_reset_mac_unlocked() and the reads in au1000_init() and
au1000_rx() also use plain loads and stores.

In au1000_eth.h, rx_dma_ring is declared without __iomem:

	struct rx_dma *rx_dma_ring[NUM_RX_DMA];

Passing &aup->rx_dma_ring[i]->buff_stat to writel() therefore gives a
sparse different-address-space warning. It also means this one
register is now accessed in two different styles.

The driver already passes non-__iomem pointers to writel() for
aup->mac and aup->enable. What this patch adds is the mixed accessor
style on buff_stat.

There's no runtime difference. MIPS_AU1X00_ENET depends on
MIPS_ALCHEMY, which only supports little-endian, so writel() and the
plain store write the same bits.

Would a plain store match the surrounding code better, like this:

	aup->rx_dma_ring[i]->buff_stat =
		lower_32_bits(aup->rx_db_inuse[i]->dma_addr) | RX_DMA_ENABLE;

The other option is to mark rx_dma_ring and tx_dma_ring as __iomem
and convert every access to readl()/writel().

>  
>  	wmb(); /* drain writebuffer */
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121004809.1690280-1-f.fainelli%40gmail.com

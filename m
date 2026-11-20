Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170759;
	b=LttHiY/Ekk+/fOYLtoDQV+P2Hjz4V36W4IHKWICwBu9Ht545Ow5ETtOTJXIYYYEfQWJa
	 hv49IJQFrNa73OAg1fcmP0J2PvmOm8GF2MyDt2g2RWc4ABI+zq4pGsS4/e/z7yPY36/4n
	 IZHLcPL/5wkC1q6q2I50aCsWVfmK54BA+ZgTykGmHZKx7YZ97rQj8TlWYmRe/XDDZRXg9
	 +KElmUyWhKCMO4jk7hekjNeGJaA6K4QkXYZYLGE4x/oJh80S1TaJqOzoAfZqwhAtgmQE7
	 xkbm46qKv0lMiqAQM3IbtidTRf3CauLzCPhSBLkcNgUCzSUD6PQFaGCAsQdThj6M3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170759;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hTNOfdeCvWouP9Nqqtvad4CK/MnaRwkTHqEbV+y/SmE=;
	b=HuYxesjv+mNqDOD4xc7a+n0ls6/gzUI9xzYI5Xt+dFjfFXE+dJUGEuQwUODPSytwOXIU
	 louIxUgxMDfXx7s5d0VxSYjtoYPJmXhH4J3mzgHhY6USnSIcJua7ZhBFH0BGAVtu6M2Yb
	 5aBuF0t0qk4LSxXc8+MD92NeD17usk4v9g9BQNdUjgHK2dNV4M1R+QYsGroqz6k0raKJe
	 /Mr6M5ax4hd3kwxesjoC2BKKhyDcab3depY6rQPw/ZX+psJf17Mk/mMxW3QYSKAZ0kKvN
	 rdcLW0N+UHnjHpKpXD0POm9iQe2dHDV7OlaTeBQUVKbNavSrdEBmUJJohKfHWf9ElRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+LQ6t0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926E606A33B;
	Fri, 20 Nov 2026 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L+LQ6t0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1991F000D0;
	Fri, 20 Nov 2026 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170759;
	bh=hTNOfdeCvWouP9Nqqtvad4CK/MnaRwkTHqEbV+y/SmE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L+LQ6t0MQiyXMI13RMfIlEoxNujKZpGm0ZO70XcDImQhSg+HGaYWo3Tp36wSHQdRv
	 VknAFkPYqIMGLQWVwdjUE90cx2PPlCnxOYBFDrHXzNeFBFe1XC+bEn13oI2aCr1WXF
	 YkpZr4toUPm03dWg3JUaMbNMZsyDkN062BkyMNqv/5MExvWpsypG7SrzgGX8QkfV21
	 8+PTTsEJ0NB2+0HAjSOGRduVl4M26cpPj6KM85Oa4EFFRBPsBx8e6+6OslgBRtbF9C
	 O2tJ4aaOqTeVlq+yA+d6sZP+aH8AvCaZlO92Hh2lDL8as08B8dWudRwmpwVCPz0/vE
	 0uji5FH4M6LUw==
Subject: Re: [PATCH net v3 07/10] net: au1000: restore RX buffer addresses
 when restarting the MAC
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Fri, 20 Nov 2026 10:32:37 +0000
Message-ID: <179517075795.3136.15427400757159569527@kernel.org>
In-Reply-To: <20261117193223.2795612-8-f.fainelli@gmail.com>
References: <20261117193223.2795612-8-f.fainelli@gmail.com>
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

- [Medium] The patch puts each RX descriptor's buffer address back to
  rx_db_inuse[i]->dma_addr only in au1000_init()…

--

net: au1000: restore RX buffer addresses when restarting the MAC

au1000_init() now rewrites each RX descriptor with its buffer's start
address from rx_db_inuse[] before setting RX_DMA_ENABLE. Before this,
it only set the enable bit on whatever address the DMA engine had left
behind. That could let a receive after close/open start partway through
its buffer.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index 0e9226ea05e18..cb2f3333ba9fd 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c
> @@ -724,7 +724,8 @@ static int au1000_init(struct net_device *dev)
>
>
>  	for (i = 0; i < NUM_RX_DMA; i++)
> -		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
> +		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
> +		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);

[Severity: Medium]
Is au1000_init() the only place the receiver gets restarted?

au1000_adjust_link() also stops and restarts RX on every duplex change,
and it does not go through au1000_init() or au1000_reset_mac_unlocked():

drivers/net/ethernet/amd/au1000_eth.c:au1000_adjust_link() {
    ...
	if (phydev->link && (aup->old_duplex != phydev->duplex)) {
		/* duplex mode changed */

		/* switching duplex mode requires to disable rx and tx! */
		au1000_hard_stop(dev);
		...
		au1000_enable_rx_tx(dev);
    ...
}

On link down, old_duplex is set to -1, so this path runs on every link-up
after a link-down. au1000_hard_stop() only clears MAC_RX_ENABLE and
MAC_TX_ENABLE in mac->control. It leaves rx_dma_ring[i]->buff_stat alone.

Suppose clearing RE stops a frame partway through. The descriptor would
keep RX_DMA_ENABLE with RX_T_DONE still clear. au1000_rx() only reloads
the address inside its while (buff_stat & RX_T_DONE) loop, so it would
not reset this descriptor:

	prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;

Could the next frame then start at the advanced address, partway into
the MAX_BUF_SIZE buffer? The free list is LIFO, so rx_db_inuse[0] at
probe is the last slot of the dma_alloc_coherent() region. An overrun
from that slot would land outside the allocation.

A later patch in this series, "net: au1000: keep the MAC stopped until
the PHY link is ready", adds another au1000_hard_stop() on link-down in
au1000_adjust_link(). Each link flap would then stop RX twice, and the
restart on link-up still skips the reload.

This depends on what the MAC does when RE is cleared mid-frame. If it
always finishes the frame and sets RX_T_DONE, au1000_rx() covers it.
Nothing in the driver documents that behaviour.

Would it make sense to put the descriptor reload in a helper that both
au1000_init() and the au1000_adjust_link() stop/start sequence call?

>
>  	wmb(); /* drain writebuffer */
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117193223.2795612-1-f.fainelli%40gmail.com

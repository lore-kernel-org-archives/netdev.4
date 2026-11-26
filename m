Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695346;
	b=Gr8bfP4IMxNI8jG1zPF1fr5gc2CQoYKAb/65Ln0Tn2o4niEuiTo+Yr7YdI4uzoUBN8Gh
	 ZIwQWc1m+qgfLagPdnWZXTQ+dSDfx/XEjYRXgz+nMM8keFpIDgLkWdAW+ggSN49wCzyAf
	 Ckv4Q9oKgRdJjLRT3gRgy7lBIKw3V/mhgnML+71pe2enD7lEw+24OYZR/ikTjIlAWv1V5
	 ZOuRnD7o/wHES4aESGfls4iwOthobwY9oHpR0Lm7dQJUcO9kS8JbDBtn9walYoEYkIp2q
	 Pd4klannZr1wnVy/aACSYBk9iChL4l4SRnLt3wG0OPnRzE5IOKvkUxF/+9XqDEip7jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695346;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ejTolVWS/3eK+IMYMtAIj+rYv+HyvbjZG2pfQPmahAg=;
	b=ctAeKsxUo3mJ+yPp//iwZXOkAPKYp24gIO0gR1RPwrwS/uFT0/HSz7qw/gwXE4ilXbTI
	 PTqtClDrId2EpYjNUzA74m5qiiRvP01Eq9dzUN6hfqtUenngaHPEpRczINEal5/8SuNmc
	 ASlJAsm8PRRFO8PtmmfaQ9WiC6VJ7xLNHw0Oixrh1Hd7oWgkbZMnAThGK/IWDUSmHIAoi
	 TdOjgtdxNN/cD8yW3TwDEpeor8toE6z5KpaF3gBUqlgkXbZEQYed2wfgVG/NDtPF+rD3s
	 OleslkIqUwhclen1P7iuQzw1zDMuwAI05/OeEHYomtUc/2bAfDrhodps0PT/tlDdaag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Hb6u32uf;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257D606A323;
	Thu, 26 Nov 2026 12:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5257D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Hb6u32uf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795695354; x=1827231354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hQyIbm7vXOCwN75H9xbgMrw794v67s7pmm0O8GSxXE0=;
  b=Hb6u32uff+UwzR/gCQdwUrW0DCg+ct1kpHdaC8C9LtlqfS9/QAjHWPsu
   J/eCGxx9n/k+hIIyzjoT7bwXC3Tuvv5JTUzADoC3GzI6DcuKt2YBNe1rH
   3PkRZXvrChi4W1fp7yDlz8m3GIx6kcAvyrlQy9Za36aIa1kx4B7YUgQsI
   WoftD8C/1lZq9sVRXEWbcaqsXXupwJk3GnEnobnC0hsmTOKWHjSY94w6c
   tLmoMWAwdk2oIh77CY4wvfbS4IstODiLoy7unHGzGsFEM5bxhMgpu1dvG
   84tCiBOYRKfN4FYO5MrAXrQitB/iINHX42AS6+7F79akIAzhxc/Gp6ZPm
   w==;
X-CSE-ConnectionGUID: A0wiu6lCTdKIYILWdkd/4Q==
X-CSE-MsgGUID: D1OP0uW+ReqLjguteQSEaA==
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="66109279"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:15:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Thu, 26 Nov 2026 05:15:45 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 26 Nov 2026 05:15:42 -0700
Date: Thu, 26 Nov 2026 13:15:41 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
CC: Doug Berger <opendmb@gmail.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Florian
 Fainelli <f.fainelli@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH net-next v9 7/8] net: bcmgenet: allow the MTU to be
 changed
Message-ID: <20261126121541.6gybeqbkxsvjav5i@DEN-DL-M70577>
References: <20261123-nb-genet-mtu-nn-v2-v9-0-4f93ded19bbb@tipi-net.de>
 <20261123-nb-genet-mtu-nn-v2-v9-7-4f93ded19bbb@tipi-net.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261123-nb-genet-mtu-nn-v2-v9-7-4f93ded19bbb@tipi-net.de>

Hi Nicolai,

> The driver never sets dev->max_mtu, so the MTU is stuck at ETH_DATA_LEN.
> 
> One descriptor reaches as far as the packet ready threshold, so derive the
> maximum from it. The threshold registers are 8 bit in units of 16 bytes and
> want a multiple of the 256 byte burst size. A descriptor is one page and
> also holds skb_shared_info behind the frame. On 4K pages the page is the
> tighter limit and leaves 3564 bytes. That includes room for a VLAN tag so a
> VLAN interface can run at the parent MTU. The MAC accepts a little more
> than one descriptor holds, so a double tagged frame at that maximum is
> dropped as fragmented until a later patch reassembles those.
> 
> The PHY keeps running across the change so the link stays up, with its
> lock held so that a link event cannot enable the MAC while the registers
> change. Two MTUs at or below ETH_DATA_LEN derive the same values, so a
> change between them needs no restart at all.
> 
> Only v5 is known to size the TBUF for a long frame and to carry the full
> length in a transmit descriptor, so the older parts keep the default MTU
> until someone confirms them.
> 
> Only a DMA that refuses to halt still takes the interface down, because
> nothing is left to run on.
> 
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Link: https://github.com/raspberrypi/linux/issues/5561
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---
>  drivers/net/ethernet/broadcom/genet/bcmgenet.c | 99 ++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index ae20c4b3c570..8dcee6951be3 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -91,6 +91,12 @@
>  				      ENET_THLD_MAX * ENET_THLD_UNIT, \
>  				      ENET_THLD_PAGE_LEN)
>  
> +/* Largest MTU that fits one descriptor, with room for a VLAN tag so a VLAN
> + * interface can use the parent MTU.
> + */
> +#define ENET_MAX_MTU		(ENET_THLD_MAX_LEN - GENET_RBUF_ALIGN - \
> +				 ETH_HLEN - VLAN_HLEN)
> +
>  /* Tx/Rx DMA register offset, skip 256 descriptors */
>  #define WORDS_PER_BD(p)		(p->hw_params->words_per_bd)
>  #define DMA_DESC_SIZE		(WORDS_PER_BD(priv) * sizeof(u32))
> @@ -3988,6 +3994,89 @@ static int bcmgenet_change_carrier(struct net_device *dev, bool new_carrier)
>  	return 0;
>  }
>  
> +static int bcmgenet_change_mtu(struct net_device *dev, int new_mtu)
> +{
> +	struct bcmgenet_priv *priv = netdev_priv(dev);
> +	unsigned int old_mtu = dev->mtu;
> +	struct bcmgenet_dma_set set;
> +	int ret;
> +
> +	/* A failed resume left the datapath down, nothing to reprogram */
> +	if (!netif_running(dev) || !priv->tx_cbs) {
> +		WRITE_ONCE(dev->mtu, new_mtu);
> +		priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
> +		return 0;
> +	}
> +
> +	/* Below ETH_DATA_LEN everything is floored, so there is nothing to
> +	 * reprogram and rx_buf_len stays as the receive path reads it.
> +	 */
> +	if (max_t(unsigned int, old_mtu, ETH_DATA_LEN) ==
> +	    max_t(unsigned int, new_mtu, ETH_DATA_LEN)) {
> +		WRITE_ONCE(dev->mtu, new_mtu);
> +		return 0;
> +	}

What about a similar check for MTUs above ETH_DATA_LEN? AFAICT, there are
ranges where you don't need to do a full replacement of the buffers, yet
you still do.

> +
> +	ret = bcmgenet_alloc_dma(priv, bcmgenet_rx_buf_len(new_mtu), &set);
> +	if (ret)
> +		return ret;
> +
> +	/* The watchdog trips on an idle queue once the rings are gone */
> +	netif_device_detach(dev);
> +
> +	/* The PHY stays up, hold its lock. A link event would otherwise take
> +	 * the MAC out of reset and enable it mid rewrite.
> +	 */
> +	mutex_lock(&dev->phydev->lock);
> +	bcmgenet_netif_stop(dev, false);
> +
> +	WRITE_ONCE(dev->mtu, new_mtu);
> +	priv->rx_buf_len = bcmgenet_rx_buf_len(new_mtu);
> +	bcmgenet_set_mtu_regs(priv, new_mtu);
> +
> +	ret = bcmgenet_init_dma(priv, true, &set);
> +	if (ret) {
> +		/* The datapath is gone, do not leave the interface up */
> +		netdev_err(dev, "failed to initialize DMA, closing\n");
> +		WRITE_ONCE(dev->mtu, old_mtu);
> +		priv->rx_buf_len = bcmgenet_rx_buf_len(old_mtu);
> +		mutex_unlock(&dev->phydev->lock);
> +		/* bcmgenet_close() attaches the device again */
> +		netif_close(dev);
> +		return ret;
> +	}
> +
> +	bcmgenet_hfb_restore(priv);
> +	bcmgenet_netif_start(dev, false);
> +
> +	/* bcmgenet_netif_start() only restores the link interrupt */
> +	if (bcmgenet_has_mdio_intr(priv))
> +		bcmgenet_intrl2_0_writel(priv, UMAC_IRQ_MDIO_EVENT,
> +					 INTRL2_CPU_MASK_CLEAR);
> +
> +	mutex_unlock(&dev->phydev->lock);
> +
> +	/* Interrupts were off, so a latched link event is lost. Internal PHYs
> +	 * on v1-v4 are not polled either.
> +	 */
> +	phy_mac_interrupt(dev->phydev);
> +
> +	/* An energy detect event cancelled with the work is still latched */
> +	if (READ_ONCE(priv->irq0_stat))
> +		schedule_work(&priv->bcmgenet_irq_work);
> +
> +	netif_device_attach(dev);
> +
> +	/* Filter updates that came in while the device was detached got
> +	 * dropped. An IPv6 join does not hold RTNL.
> +	 */
> +	netif_addr_lock_bh(dev);
> +	bcmgenet_set_rx_mode(dev);
> +	netif_addr_unlock_bh(dev);
> +
> +	return 0;
> +}
> +
>  static const struct net_device_ops bcmgenet_netdev_ops = {
>  	.ndo_open		= bcmgenet_open,
>  	.ndo_stop		= bcmgenet_close,
> @@ -3999,6 +4088,7 @@ static const struct net_device_ops bcmgenet_netdev_ops = {
>  	.ndo_set_features	= bcmgenet_set_features,
>  	.ndo_get_stats64	= bcmgenet_get_stats64,
>  	.ndo_change_carrier	= bcmgenet_change_carrier,
> +	.ndo_change_mtu		= bcmgenet_change_mtu,
>  };
>  
>  /* GENET hardware parameters/characteristics */
> @@ -4352,9 +4442,18 @@ static int bcmgenet_probe(struct platform_device *pdev)
>  	/* Mii wait queue */
>  	init_waitqueue_head(&priv->wq);
>  	bcmgenet_hfb_init(priv);
> +
>  	priv->rx_buf_len = bcmgenet_rx_buf_len(dev->mtu);
>  	priv->tx_thld_len = bcmgenet_tx_pkt_rdy_thld(dev->mtu) * ENET_THLD_UNIT;
>  	priv->tx_thld_window = priv->dma_max_burst_length * ENET_BURST_UNIT;
> +
> +	/* Only v5 is known to size the TBUF for a long frame and to carry the
> +	 * full length in a transmit descriptor, the older parts stay at the
> +	 * default MTU
> +	 */
> +	if (GENET_IS_V5(priv))
> +		dev->max_mtu = ENET_MAX_MTU;
> +
>  	INIT_WORK(&priv->bcmgenet_irq_work, bcmgenet_irq_task);
>  
>  	priv->clk_wol = devm_clk_get_optional(&priv->pdev->dev, "enet-wol");
> 
> -- 
> 2.53.0
> 

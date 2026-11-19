Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111559;
	b=zXDapubck/8hVn2MLISFajeFR9IAWpXmt4motr+QvmeaG+0Oggj6Ys3NC4VPmEGUryHN
	 kl3e3zMQWMqYXXcKTDgXnpXnCT4P/ofgPyZgUrX52HltNjyQx9jBv0bt3gTwdlU9GyALX
	 3z5Iuv3y0rDeJMxV4TqzI9T3LrA1YOAZsn9P1bEk/AAZxygc9PqFph0Fgp45rhYxce3mO
	 WC6rrDy+2q5k1fGOq+mn6s48tYLCWHEo7WNLKQYWiodiHdZX0XIwmcmPixqf95yHbhduw
	 XOr8dwrw15v70GUma3FS96E9BNPKUBgwix8om/TmA8JFPRhd9+5tfGet8+6c96KA7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111559;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=q4x5gqZjFY/LWvZQ28+D944n8xPpX4jYSxIYgcSXumc=;
	b=yo7yLhJY6r5d8hYUo+Dc22L2gN+Gn84HFjCof/5W4DIO2sdKcDrrTzqpO6iSLJqT+Kzn
	 FcIQY0H0Z5doHFQ/c08mIyiKfWEccA+K3DqoC9toO2078e2W1gd5WGwJGueXODWZ1J/aJ
	 1r/Jt36fJ8JZR2MH6ZeanD4LcBYy5cewLZgEidsBU9m/dtmMsPxTssCl3GrLvAomrdegu
	 vh0khKROE+jUkMg+zThn2MAl2wwWJ3jwJW760SKMGukIQKUk7o7ESqOyHw6imxH12FsX7
	 d4a1L5vm+srG0JZqF7y+i6QNSDN8cQWt7jSM4I1WRtyL40/53c6I2/hIlZEWXIooqjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=du7ZAZKl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8103E606A325;
	Thu, 19 Nov 2026 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=du7ZAZKl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9AF1F000C6;
	Thu, 19 Nov 2026 18:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111559;
	bh=q4x5gqZjFY/LWvZQ28+D944n8xPpX4jYSxIYgcSXumc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=du7ZAZKlQ4VHYLljQe6Ihb9bmuIZcDum3bxHXvU16x4+NmnaqPqDa9hH7zStCE0Qs
	 seRAUAHCXJHIf/JpaaZBlVgdmtcnScXBv+uFyGYfESH1Q8+M1zKnyKgmLq5bm6Wl/s
	 vqGqiVD19pWSB4oVPzHp4pA/c86/E7kBmxyWGvlmr4TkuhsaIfY6PfSnlEtGVJAW/L
	 lBnTx+TMV5It9CIiXLvs33VKENwUHUSsjGRZ/j5Dmye4oJcrTdzt4CJ8kTR2BnUuAY
	 Xin509C5MEQqiv1OM1+e0vtWEObPDK/VBd8VABaxvXH/gHh+Bc8VEZ+jFR2xOUEuxx
	 mfFz/jOHoHrBg==
Subject: Re: [PATCH net-next v8 6/9] net: bcmgenet: split frames that end just
 past the transmit threshold
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 justin.chen@broadcom.com
Date: Thu, 19 Nov 2026 18:05:57 +0000
Message-ID: <179511155798.3136.7155955737462813812@kernel.org>
In-Reply-To: <20261118-nb-genet-mtu-nn-v2-v8-6-68f75eadf3e2@tipi-net.de>
References: <20261118-nb-genet-mtu-nn-v2-v8-6-68f75eadf3e2@tipi-net.de>
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

- [Low] Baseline decision: false positive.

--

net: bcmgenet: split frames that end just past the transmit threshold

This commit avoids a Tx DMA stall by splitting a transmit frame across two
descriptors that share one mapping when the frame ends within one DMA
burst past the transmit packet ready threshold. Once the MTU exceeds
ETH_DATA_LEN, it also programs TBUF_PKT_RDY_THLD to ENET_THLD_MAX. Frames
longer than the threshold fall back to software checksumming.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index e0edfe3fc94a2..2b402c067e63e 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> @@ -2704,8 +2794,10 @@ static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
>  /* Program the MTU dependent registers. Call with the MAC disabled. */
>  static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
>  {
> +	u32 tx_thld = bcmgenet_tx_pkt_rdy_thld(mtu);
>  	u32 thld = bcmgenet_pkt_rdy_thld(mtu);
>  
> +	priv->tx_thld_len = tx_thld * ENET_THLD_UNIT;
>  	bcmgenet_umac_writel(priv, ENET_MAC_FRAME_LEN(mtu), UMAC_MAX_FRAME_LEN);
>  
>  	/* GENET v1 maps other registers at these offsets */
> @@ -2713,6 +2805,8 @@ static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
>  		return;
>  
>  	bcmgenet_rbuf_writel(priv, thld, RBUF_PKT_RDY_THLD);
> +	bcmgenet_writel(tx_thld, priv->base + priv->hw_params->tbuf_offset +
> +			TBUF_PKT_RDY_THLD);
>  }

[Severity: Low]
This isn't a bug, but bcmgenet_set_mtu_regs() sets priv->tx_thld_len
before the GENET_IS_V1() early return. The TBUF_PKT_RDY_THLD write that
it tracks only happens after that return.

Suppose a v1 part ran with an MTU above ETH_DATA_LEN. tx_thld_len would
become 0xf0 * 16 = 3840, but the register would never be programmed.
bcmgenet_xmit() would then split frames and fall back to software
checksum based on a threshold the MAC is not using.

As far as I can tell, this can't happen today. Nothing at this commit
changes max_mtu. The later "net: bcmgenet: allow the MTU to be changed"
patch raises max_mtu only under GENET_IS_V5(). So v1 always gets
ENET_THLD_DEFAULT, and tx_thld_len stays at 2048.

Would it be clearer to update tx_thld_len only on parts where
TBUF_PKT_RDY_THLD is actually written? That way the software value
could not drift from the hardware.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-nb-genet-mtu-nn-v2-v8-0-68f75eadf3e2%40tipi-net.de

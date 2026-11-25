Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617425;
	b=Fcpt9boVLO8rsDymNpD2rc6cJ2XofMKAR+w/WoqW3qj0eyO854XqVhe09ts0qUFD8xnZ
	 kg+btLdldQgGlIm/BXUxhNBtwRdMZuOTB+tWm+7e0B/lc6SRV2XhT8c3SEJFeap50/r59
	 brW20to7aT4iAkQlc4MZ71yxG6E3YUxa17v0TiHujxK4hDcW06bg90b1z/9hrNkHtSg9y
	 TZHmhZm5whfMsTp8fKflc89gPYQB0nAAufL5bxQAPb4uumoicsMZHHTUwI0w5NXq/rv0E
	 d1HwGmXuDeqYPudEkauip3aAwu07GbGJ6tB/39zcr/UgD2HiWuco1FjiIX3PdObUqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617425;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JDQYLhkx3ifF2oHJyX37emTxsECIsqLUKP5qTVuaAoA=;
	b=oDPFT2PEgcaggsq8N4rCFLNQZwPrDp9/vEQMDiM8vbfpW9fTJsYWzDpJcEq9dPW2Cb1z
	 5J38QUcGNyXG7Kim5ZxA8yPy+6A6ggh5yodU3MjAlsyIcv4cYCPvoQ8DiI1SuKxTt/yo1
	 okgboNum4KqmS643oswxEq+9mh1Mnr3FCsPTqnJPkJFEkcz3Z33UkcwftAJc+bjtuhmn4
	 l2MWZcREf5WWGJF/QBMDlxpmZxSPDRRbQlByuVpk6eyQJZ8Ncp8ZqpKPKu+T+DW7lzXGp
	 32SFlJI4okPa87Uex8rVgJoDmrJ0b+kPRGqj7sAfLwwybYjW3//kOuBYuJc8zuN7DBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxgWGokV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59AD606A31E;
	Wed, 25 Nov 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxgWGokV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EA61F000C6;
	Wed, 25 Nov 2026 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617425;
	bh=JDQYLhkx3ifF2oHJyX37emTxsECIsqLUKP5qTVuaAoA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MxgWGokVAFEdZlkpkG272J3qLR1uNets5ZP/PN0nFuxRe0H//fgevUghY+Wkhaxum
	 TXwSsMtMYjLduhjba9k5zDy53cm8sznd+J0Xh20doxNm/WuFDlh4+PdfkofLayOg5E
	 FEV36x1+bYOJ9KeLXvo68qBTS7bSxrMa6o+mCwtLicSS3BFDFN6dh5d+53ZCgXi24a
	 gTfc00bmD+0f1t8T3yrrnxwtbpC/WvVMz/mzso7PZn8ZQadPaBbjJYWCm/JNZb6NAX
	 McuIxmtNu3RSS1s03gO9xXelwuI4bJ6TzU5LwPjrWNCVqhvttOQfsIxoPtZ8BKOcvv
	 ltghvLdwsvuzw==
Subject: Re: [PATCH net-next v2 3/7] net: lan743x: start phylink last and stop
 it first
From: netdev-bot+sashiko@kernel.org
To: cbabroski@nvidia.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, Raju.Lakkaraju@microchip.com,
 maxime.chevallier@bootlin.com, yuiko.oshino@microchip.com, nb@tipi-net.de,
 woojung.huh@microchip.com
Date: Wed, 25 Nov 2026 14:37:03 +0000
Message-ID: <179561742372.3135.13284250569382417809@kernel.org>
In-Reply-To: <df1845de5cbdd4c556a39a48faa23848e02d4944.1795027003.git.cbabroski@nvidia.com>
References: <df1845de5cbdd4c556a39a48faa23848e02d4944.1795027003.git.cbabroski@nvidia.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In lan743x_netdev_close()
  (drivers/net/ethernet/microchip/lan743x_main.c:3378), the patch now…
- [Medium] lan743x_netdev_open() now calls lan743x_phylink_connect()
  (drivers/net/ethernet/microchip/lan743x_main.c:3430) after all RX and…

--

net: lan743x: start phylink last and stop it first

This patch moves lan743x_phylink_connect() to the end of
lan743x_netdev_open() and lan743x_phylink_disconnect() to the start of
lan743x_netdev_close(). The goal is that mac_link_up() can no longer wake
the TX queues while the rings are missing. The phylink disconnect is also
dropped from the open error path, because phylink is now connected only
after everything else has succeeded.

> diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
> index 57d52930f89be..8eb0645493e63 100644
> --- a/drivers/net/ethernet/microchip/lan743x_main.c
> +++ b/drivers/net/ethernet/microchip/lan743x_main.c
> @@ -3375,6 +3375,8 @@ static int lan743x_netdev_close(struct net_device *netdev)
>  	struct lan743x_adapter *adapter = netdev_priv(netdev);
>  	int index;
>  
> +	lan743x_phylink_disconnect(adapter);
> +
>  	synchronize_net();
>  	netif_tx_disable(netdev);
>  

[Severity: Medium]
Does the whole of lan743x_phylink_disconnect() need to move ahead of the
ring teardown, or only phylink_stop()?

lan743x_phylink_disconnect() does both:

    phylink_stop(adapter->phylink);
    phylink_disconnect_phy(adapter->phylink);

phylink_disconnect_phy() ends up in phy_detach_internal(), which calls
phy_suspend(phydev) and later phy_device_reset(phydev, 1).

As a result, the PHY is now powered down before lan743x_tx_close() and
lan743x_rx_close() run their DMAC_CMD_STOP_T_ / DMAC_CMD_STOP_R_ and
FCT_TX_CTL / FCT_RX_CTL disable handshakes. If a reset GPIO exists, the PHY
is also held in reset at that point. This happens on ndo_stop, on the
suspend path through lan743x_pcidev_shutdown(), and on the TX timeout reset
later in the series.

Suppose the FCT or DMA teardown depends on a PHY-sourced clock, such as
RGMII RXC, MII TX_CLK/RX_CLK, or a PHY-supplied RMII REF_CLK. Could the RX
FIFO then still be half-disabled when the ring is freed? The result of
this poll in lan743x_rx_close() is ignored:

    lan743x_csr_write(adapter, FCT_RX_CTL,
                      FCT_RX_CTL_DIS_(rx->channel_number));
    lan743x_csr_wait_for_bit(adapter, FCT_RX_CTL,
                             FCT_RX_CTL_EN_(rx->channel_number),
                             0, 1000, 20000, 100);

lan743x_tx_close() could also take the "failed to stop, resetting it"
path, and lan743x_tx_fifo_disable() could time out.

I couldn't confirm from the driver code or a datasheet that the FCT and
DMA teardown needs the PHY clock. Also, lan743x_mac_close() already ran
after the PHY detach before this patch.

Keeping mac_link_up() from waking the queues seems to need only
phylink_stop() first. Could phylink_disconnect_phy() stay after the ring
and FIFO teardown? __stmmac_release() uses that order: it calls
phylink_stop(), stops DMA and frees the descriptors, and only then calls
phylink_disconnect_phy().

The ordering here is still the same at the end of the series.

[ ... ]

> @@ -3409,10 +3409,6 @@ static int lan743x_netdev_open(struct net_device *netdev)
>  	if (ret)
>  		goto close_intr;
>  
> -	ret = lan743x_phylink_connect(adapter);
> -	if (ret)
> -		goto close_mac;
> -
>  	ret = lan743x_ptp_open(adapter);
>  	if (ret)
>  		goto close_mac;
> @@ -3431,6 +3427,10 @@ static int lan743x_netdev_open(struct net_device *netdev)
>  			goto close_tx;
>  	}
>  
> +	ret = lan743x_phylink_connect(adapter);
> +	if (ret)
> +		goto close_tx;
> +

[Severity: Medium]
On a reopen, the PHY is still suspended from phy_detach_internal() in the
previous close. It is only resumed through phy_attach_direct() and
phy_resume() inside lan743x_phylink_connect(). Before this patch, the PHY
was attached and resumed right after lan743x_mac_open(), before any FIFO
or DMA reset.

With connect moved here, the FCT resets and the DMA channel resets
(lan743x_dmac_tx_reset() and lan743x_dmac_rx_reset()) in
lan743x_rx_open() and lan743x_tx_open() now run while the PHY is powered
down.

If the FCT resets need the PHY-sourced MAC clock, can this make the open
fail? lan743x_tx_fifo_enable() returns an error on timeout:

    lan743x_csr_write(adapter, FCT_TX_CTL,
                      FCT_TX_CTL_RESET_(tx->channel_number));
    ret = lan743x_csr_wait_for_bit(adapter, FCT_TX_CTL,
                                   FCT_TX_CTL_RESET_(tx->channel_number),
                                   0, 1000, 20000, 100);
    if (ret) {
        netdev_err(adapter->netdev,
                   "TX channel %d FIFO reset timed out\n",
                   tx->channel_number);
        return ret;
    }

If that times out, the interface would not come back up after its first
ifdown or suspend. The FCT_RX_CTL_RESET_ wait in lan743x_rx_open() ignores
its result. In that case FCT_FLOW would be programmed and the RX FIFO
enabled even though the reset never finished.

A second effect is that phylink_start() now calls mac_config() after the
FIFOs and DMA are already running. For SGMII, 1000BASE-X and 2500BASE-X,
lan743x_phylink_mac_config() calls lan743x_serdes_clock_and_aneg_update(),
which switches the SerDes MPLL, and then lan743x_pcs_power_reset(). Is it
safe to do that on every open while DMA is active? phylink_resolve() can
already call mac_config() at runtime when the PHY changes interface, so
this part is less certain.

As on the close side, I couldn't confirm the clock dependency from the
driver code. The DMAC global reset in lan743x_dmac_init() also already
runs on resume with the PHY detached.

Would splitting the helper avoid this? The PHY could be attached early as
before, with only phylink_start() called last. mac_link_up() would still
not run before the rings exist.

This ordering is also unchanged at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795027003.git.cbabroski%40nvidia.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517634;
	b=n9VkFlXUfczL5pG85PHh529HMiZ+QGmEys86STFiZWkHsh+LULNLc0yIUw9bTUUY4fmm
	 4IRMSyUiLaKoGqHzUNF21ro32b8TdtpAMCx5P5nvb+WgqO/zXkBZHtd18Yo6fc+WbWh8R
	 ZsntMYHJdx+slPBASdCZzjAsgLlSLmPvnE9I8q/KpzQOMNGPP3g7madb2RiiflSYgstHU
	 RBi9e8yKcJrVAW2T5kA/Ii4EhgvcJUgs+lUHu5YOyzOZBik5KAwRSaTsVW4ha91QDFeiT
	 1NDFMQpkP5r+NMm4jLVu2qsIIU7KHAbshgTIwbwPw/2vkrcTmEJF16rrNp3TCrHW+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517634;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ImEtvNWvzTOvpmwvm5vtIEFBJqDak/XudWlCPtKGMAk=;
	b=JXMMiFtpuktQctAtsWmQmvK+km1EnaJLDdHU0HvSPKV8negMO3Qli0UD8I035hPQ3IkC
	 yG+XZvw3EzGoJ4K5G1qGZRXQyPPhiEyZA9xFoJZrrDJkCWQupuHprHX1MlSzJMVYj78ds
	 b7CqngUS/BeOOc4yO69hWTN7oVUzhdQL7d/vorMMX0CeGTB/j1kzj+t6Tesqh6G3b9XE4
	 KGBcJlHnGboebZ/6LoDabHPI9ZaT4JrJyHlTffl4XWZIx6QaEuinQG9XVOqJ4rDT0YVrV
	 FHndk1fgG7XW9Hn7JVuX1g1tQFdtWQzon/r+Hz7q7+/5eUmVH6V6UGgXCeCltiiJ3pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=L0qltyPl;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E207606A330;
	Tue, 24 Nov 2026 10:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E207606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=L0qltyPl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795517633; x=1827053633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NZzJfpuCc0e5y8fSi2MKme7usMgFTjTUHJjCebFAsCY=;
  b=L0qltyPlBICzKiZo8g/IbB7xEOf2KhSbfZ4HFS0ZeieadJa2ABU76VKO
   mllGONZrurLgT8+3Pvq/VDbVoHtmUd1DmjJ5BZK+OCHhB1+1xVIlUIuyv
   +C8Ssqw+HgxO0g/MPeg+3/ORiEkUKBi4hHKoUNem8cHthy8pBd5wTkoWg
   5Tb0vDw3h/y37OyQ4th9XaKlt9uEpZuVK2lpeSf6EJ9j3m7FylCBt/le2
   PtCwsZ2xiKeOIB4D9xJdiOWq4nMwh/A5xQYaIhcBcBKqHKcGVXA6nTqV8
   zSTZst1qZqsdoN792WTzbQllfuSnCeMC/rUIP9bx5AWSQMZYu1vJn3hCQ
   g==;
X-CSE-ConnectionGUID: L0NeTWWgQbm+cZHMMZTvlw==
X-CSE-MsgGUID: qJCY95cSQCmx17tDJg7K0g==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="67206422"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 03:53:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Tue, 24 Nov 2026 03:53:46 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 03:53:44 -0700
Date: Tue, 24 Nov 2026 11:53:43 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horms@kernel.org>
Subject: Re: [PATCH net-next v3 1/9] net: sparx5/lan969x: stop the FDMA
 channels properly
Message-ID: <20261124105343.fm6oddjcnxaly7or@DEN-DL-M70577>
References: <20261120-sparx5-mtu-change-v3-1-55c272fe1acc@microchip.com>
 <179544589189.3135.16381181122597988250@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179544589189.3135.16381181122597988250@kernel.org>

> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The new sparx5_fdma_stop() disables both channels
>   (FDMA_CH_DISABLE) and waits for FDMA_CH_ACTIVE to clear.
> - [Medium] sparx5_fdma_stop() now detects when the RX/TX channels fail to
>   go inactive within 10 ms (SPX5_FDMA_STOP_TIMEOUT_US).
> - [Low] This commit fixes bugs that already exist in sparx5_fdma_stop(),
>   but it is framed as preparation for a feature and carries no Fixes:…
> 
> --
> 
> net: sparx5/lan969x: stop the FDMA channels properly
> 
> This commit changes sparx5_fdma_stop() so that it disables the RX and TX
> channels through FDMA_CH_DISABLE and waits for FDMA_CH_ACTIVE to clear.
> The old code cleared bits in FDMA_CH_ACTIVATE, which has no effect. The
> commit also stops the injection port with INJ_STOP, fixes the inverted
> XTR_BUF_IS_EMPTY poll, and adds the FDMA_CH_ACTIVE register definition.
> 
> > The stop sequence is used by the FDMA deinit, and by the FDMA buffer
> > resize added later in this series.
> 
> [Severity: Low]
> The patch is presented as groundwork for the resize later in the series.
> But the commit message also says the current stop sequence never stops the
> channels, and that the XTR_BUF_IS_EMPTY wait always runs until it times
> out.
> 
> Both of those problems seem to date back to:
> 
> Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")
> 
> The existing deinit paths free DMA memory right after the stop.
> sparx5_fdma_deinit() calls fdma_free_phys() on the DCBs, and
> lan969x_fdma_deinit() frees the coherent rings and the page_pool. So on
> current kernels, unbind or probe-failure teardown frees DCB memory while
> the channels are still active, and every stop stalls for 10 ms.
> 
> Should this carry a Fixes: tag and go to net on its own, rather than as
> part of the net-next MTU series? Without the tag, stable kernels will not
> pick it up.
> 
> Could the commit message also mention the risk of the device doing DMA
> into freed memory?
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > index 8675702bf1504..8a847ec067de6 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> 
> [ ... ]
> 
> > @@ -474,20 +477,39 @@ int sparx5_fdma_start(struct sparx5 *sparx5)
> >  
> >  int sparx5_fdma_stop(struct sparx5 *sparx5)
> >  {
> > +	u32 channels = BIT(sparx5->rx.fdma.channel_id) |
> > +		       BIT(sparx5->tx.fdma.channel_id);
> >  	struct sparx5_rx *rx = &sparx5->rx;
> >  	struct sparx5_tx *tx = &sparx5->tx;
> >  	u32 val;
> >  
> >  	napi_disable(&rx->napi);
> >  
> > -	/* Stop the fdma and channel interrupts */
> > +	/* Disable the channels, and wait for them to finish the current DCB */
> > +	spx5_wr(FDMA_CH_DISABLE_CH_DISABLE_SET(channels), sparx5,
> > +		FDMA_CH_DISABLE);
> > +
> > +	if (read_poll_timeout(sparx5_fdma_ch_active,
> > +			      val,
> > +			      !(FDMA_CH_ACTIVE_CH_ACTIVE_GET(val) & channels),
> > +			      SPX5_FDMA_STOP_SLEEP_US,
> > +			      SPX5_FDMA_STOP_TIMEOUT_US,
> > +			      false,
> > +			      sparx5))
> > +		dev_warn(sparx5->dev, "Failed to stop FDMA channels\n");
> 
> [Severity: Medium]
> What happens to the DMA memory if this times out? The timeout only causes a
> dev_warn(), and sparx5_fdma_stop() still returns 0. The deinit callers then
> free everything without checking the result:
> 
> sparx5_fdma_deinit() {
> 	sparx5_fdma_stop(sparx5);
> 	fdma_free_phys(&sparx5->rx.fdma);
> 	fdma_free_phys(&sparx5->tx.fdma);
> 	...
> }
> 
> lan969x_fdma_deinit() {
> 	...
> 	sparx5_fdma_stop(sparx5);
> 	fdma_free_coherent(sparx5->dev, &tx->fdma);
> 	fdma_free_coherent(sparx5->dev, &rx->fdma);
> 	lan969x_fdma_free_pages(rx);
> 	page_pool_destroy(rx->page_pool);
> 	...
> }
> 
> After the next patch in the series, sparx5_fdma_deinit() also calls
> consume_skb() on the RX skbs.
> 
> If a channel is still active after the 10 ms SPX5_FDMA_STOP_TIMEOUT_US,
> can the extraction engine write received frame data and DCB status words
> into freed and reused memory? Can the injection engine also keep reading
> freed memory?
> 
> For comparison, lan966x uses the same CH_DISABLE/CH_ACTIVE sequence with
> a READL_TIMEOUT_US of 100 s rather than 10 ms.
> 
> Later in the series, sparx5_fdma_pause() follows this stop with an
> FDMA_CTRL_NRESET reset, which covers the resize path. At the end of the
> series, both deinit paths still have no reset and no error handling.
> 
> Would it work to reset the FDMA (FDMA_CTRL_NRESET 0 then 1) after the stop
> in the deinit paths? Another option is to return the timeout from
> sparx5_fdma_stop() and not free the DMA memory when it fails.
>

This was already dismissed on v2 [1].

[1] https://lore.kernel.org/netdev/20261113075155.srvezxa2arqti64e@DEN-DL-M70577.microsemi.net/

> > +
> > +	/* Stop the fdma and the RX channel interrupt */
> >  	sparx5_fdma_rx_deactivate(sparx5, rx);
> >  	sparx5_fdma_tx_deactivate(sparx5, tx);
> >  
> > -	/* Wait for the RX channel to stop */
> > -	read_poll_timeout(sparx5_fdma_port_ctrl, val,
> > -			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val) == 0,
> > -			  500, 10000, 0, sparx5);
> > +	/* Wait for the extraction buffer to be empty */
> > +	read_poll_timeout(sparx5_fdma_port_ctrl,
> > +			  val,
> > +			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val),
> > +			  SPX5_FDMA_STOP_SLEEP_US,
> > +			  SPX5_FDMA_STOP_TIMEOUT_US,
> > +			  false,
> > +			  sparx5);
> 
> [Severity: Medium]
> Can this wait succeed if the extraction buffer is not already empty?
> 
> Both channels, including the extraction channel, are disabled and polled
> until inactive first. Only after that does sparx5_fdma_rx_deactivate() set
> XTR_STOP:
> 
> sparx5_fdma_rx_deactivate() {
> 	...
> 	/* Stop RX fdma */
> 	spx5_rmw(FDMA_PORT_CTRL_XTR_STOP_SET(1), FDMA_PORT_CTRL_XTR_STOP,
> 		 sparx5, FDMA_PORT_CTRL(0));
> }
> 
> During the disable window XTR_STOP is still 0, so the extraction port can
> keep moving frames into the FDMA extraction buffer. Once the extraction
> channel is inactive, nothing writes that buffer out to memory.
> 
> In that case the wait runs for the full 10 ms. Its return value is then
> dropped without a warning. FDMA_PORT_CTRL_XTR_BUF_RST is also never used.
> 
> Would the expected order be to set XTR_STOP, wait for XTR_BUF_IS_EMPTY
> while the channel is still active, and then do CH_DISABLE and wait for
> CH_ACTIVE? Resetting the buffer with XTR_BUF_RST could be another option.
> 
> Later in the series, sparx5_fdma_pause() drains the CPU queues before
> calling this stop, and runs FDMA_CTRL_NRESET plus sparx5_xtr_flush() after
> it. That lowers the risk on the resize path. sparx5_fdma_stop() itself
> is unchanged at the end of the series, though, so this wait still does
> not do what the comment and the commit message describe.

The datasheet only requires the channel to be disabled before its DBs are
discarded, so disabling it before XTR_STOP is fine. No issues observed about
this ordering in our tests.

> 
> >  
> >  	return 0;
> >  }
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010549;
	b=VzljlB4UxR5yAykMRXx31JIxZ2PJm6wlqvzZJlVi+N3CtvJp3jWWncP59BBEixzHGdkc
	 yja/lZDeT65jzKjiO2V63Q9wDu9HR83FJn64glFb0rxCexGhrOJtuMH5+pbPCxMQZsAr+
	 75b+hyM32+cC24miA/36iYcXgCvi6AcP9xzaM9kI1I2qUNqrvASmWzeOXes0HqaYd+l6E
	 ZIlbSushf5+v6hHCjAgrC0QFwt2mItyWxpfc0WmEqOoG14KgrmTNW1Z5bOFxy7XC7XGgE
	 lGfLtMYfr9UkPXsGcX5FTxuopt0YJYUhlSY4L1Tasf/Hswf8oIbQtPj07TceeI/o44A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010549;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=D1ytyBDMlOX6xXQFzmjoPjWpVLrnUh/kjLxQs2FDLlY=;
	b=PkJNHeSoc6975BWuFkNIC7XOoxIL6yZkl627bL51T7yuek8ODmVHVcDhpsuIqTnXN+r8
	 QTeaXTLL68MdaAxGpL9CdXbpawshaaf35kSBnyoZj/uQ1tW17q39CxqJPlVvra4IEJXrw
	 0NozxgItRmlAxQ09pPY0kJlEJLmarKoZhdrley6xr5F1w0o1Ui9nFP5f3AjB2PBs7lehb
	 v8OcNkpf/XNj95HANAbG2kd+A+KWjAcXhW8i6mH4dDghPeh18m7RWl8wv3LkgGmVSIRD/
	 qT5DTNnDGIoczjdy+jx61ymSMBcbpMBDx31nQa3vkszz3cq0OFeBxr7++3FCTaiqcNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=TyCtMjsh;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0469606A31C;
	Wed, 18 Nov 2026 14:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0469606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=TyCtMjsh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795010549; x=1826546549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HZQVTI80+qjdMwq80pohoXy+0i654zmIk/9TEV7TNEc=;
  b=TyCtMjshH8KMF1oVoP1yNLoZtNMALsPWMGYb6hzOh8ujk41FJPT3CP3W
   1hkEf9M++Tvkbj/G5ceHFKHxsFJ6ml3osBKy3acYJp0o2VDlSt6iL05/M
   mj4hlPVlW9eIOzuwICo33/FEOMIZD4gb/JE0Ky0tY5yGc5NYBInjSzRF/
   MIugFHzEUYSdvWVdB5QPxY2p2+Hxj9X3QAwuumiiXtgX+FRo6haSS5NGk
   ufD5fJSVSVEZ6gVg7sMOimWhJ1v0U35JdP0AdGkYg4Kk5kIp9f/P4MdbK
   xdyHmeRskezBbO4y54D5aX/Vze9LCRxfX+DUY1NcvpOWwoj/a8xdlCv0n
   g==;
X-CSE-ConnectionGUID: liUdNI3yS4ek62uLi32K3Q==
X-CSE-MsgGUID: a/qv8/FZS16uJH7eahYj5w==
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="77437893"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2026 07:02:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 18 Nov 2026 07:02:21 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 18 Nov 2026 07:02:19 -0700
Date: Wed, 18 Nov 2026 15:02:19 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <horatiu.vultur@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: lan966x: free the RX pages when the TX
 allocation fails
Message-ID: <20261118140219.cug5pbuxkqigidey@DEN-DL-M70577>
References: <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
 <179500729408.3136.14303184286284983260@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179500729408.3136.14303184286284983260@kernel.org>

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 0 (2) � Medium: 1 � Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] lan966x_fdma_rx_alloc() ignores the return value of
>   fdma_dcbs_init() (line 137).
> - [Low] Missing Fixes:/Cc: stable tags.
> 
> Pre-existing issues:
> - [High] NULL pointer dereference in the open-coded page-return loop of
>   lan966x_fdma_reload().
> - [High] The new `if (rx->page[i][j])` check in
>   lan966x_fdma_rx_free_pages() assumes a slot without a page is NULL.
> 
> --
> 
> net: lan966x: free the RX pages when the TX allocation fails
> 
> When lan966x_fdma_tx_alloc() fails in lan966x_fdma_init(), this patch
> returns the RX pages to the page pool before the pool is destroyed, so
> the pool can finish shutting down. It also makes
> lan966x_fdma_rx_free_pages() skip empty entries, because
> lan966x_fdma_rx_alloc() does not check that every DCB got its pages.
> 
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > index 1fbe910c5ec38..586ee648c7741 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > @@ -54,9 +54,11 @@ static void lan966x_fdma_rx_free_pages(struct lan966x_rx *rx)
> >  	int i, j;
> >  
> >  	for (i = 0; i < fdma->n_dcbs; ++i) {
> > -		for (j = 0; j < fdma->n_dbs; ++j)
> > -			page_pool_put_full_page(rx->page_pool,
> > -						rx->page[i][j], false);
> > +		for (j = 0; j < fdma->n_dbs; ++j) {
> > +			if (rx->page[i][j])
> 
> [Severity: Medium]
> The commit message says "lan966x_fdma_rx_alloc() does not check that
> every DCB got its pages, so skip the entries that are still empty".
> 
> Instead of treating a partly filled ring as normal here, would it be
> better to check the return value of fdma_dcbs_init() in
> lan966x_fdma_rx_alloc() and unwind?
> 
> lan966x_fdma_rx_alloc() {
>     ...
> 	fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
> 		       FDMA_DCB_STATUS_INTR);
> 
> 	lan966x_fdma_llp_configure(lan966x, fdma->dma, fdma->channel_id);
> 
> 	return 0;
> }
> 
> Say page_pool_dev_alloc_pages() fails in lan966x_fdma_rx_dataptr_cb()
> at DCB k. Then __fdma_dcb_add() returns before it links prev->nextptr.
> DCB k-1 keeps FDMA_DCB_INVALID_DATA as its next pointer, and DCB k and
> the ones after it are never linked into the chain. Even so,
> lan966x_fdma_rx_alloc() still returns 0.
> 
> lan966x_fdma_init() and lan966x_fdma_reload() then call
> lan966x_fdma_rx_start() on the short chain. When NAPI has consumed DCBs
> 0..k-1, fdma_dcb_advance() moves dcb_index to k. From then on,
> fdma_has_frames() in lan966x_fdma_napi_poll() polls a DCB that the
> hardware never completes.
> 
> Can CPU RX stall permanently this way?
> 
> The PCI variant, lan966x_fdma_pci_rx_alloc(), already checks this call:
> 
> 	err = fdma_dcbs_init(fdma,
> 			     FDMA_DCB_INFO_DATAL(fdma->db_size - XDP_PACKET_HEADROOM),
> 			     FDMA_DCB_STATUS_INTR);
> 	if (err) {
> 		fdma_free_coherent_and_unmap(lan966x->dma_dev, fdma);
> 		return err;
> 	}
> 
> lan969x_fdma_rx_alloc() in sparx5 has the same unchecked call, and
> lan969x_fdma_free_pages() has no NULL guard.
> 
> > +				page_pool_put_full_page(rx->page_pool,
> > +							rx->page[i][j], false);

The concern raised is valid, but for what this patch fixes, out-of-scope.

This patch is scoped to the TX allocation failure path, which before this patch,
didn't return the RX pages.

The reason that the ring can be partly filled at all, is because the return
value of fdma_dcbs_init() is ignored (not just in rx_alloc, as the bot points
out, but also in other places), but that needs its own fix in a separate patch.

> 
> [Severity: High]
> This is a pre-existing issue, but does the NULL check catch every slot
> that no longer owns a page?
> 
> lan966x_fdma_rx_dataptr_cb() is the only writer of rx->page[dcb][db].
> It does not clear the slot on -ENOMEM. Nothing else sets a slot back to
> NULL after its page has been handed off. That means a slot is only
> guaranteed to be NULL on the first init, when struct lan966x has just
> been zeroed.
> 
> In lan966x_fdma_napi_poll(), lan966x_fdma_rx_get_frame() hands the page
> to an skb, or lan966x_fdma_rx_free_page() recycles it, but the slot
> keeps the pointer either way. The refill then ignores failure:
> 
> 	fdma_dcb_add(fdma, old_dcb, FDMA_DCB_INFO_DATAL(fdma->db_size),
> 		     FDMA_DCB_STATUS_INTR);
> 
> In lan966x_fdma_reload(), lan966x_fdma_rx_alloc() refills rx->page
> without clearing it first. After a partial fill, the slots that were
> not refilled still point at pages from the old pool. Those pages are
> then returned to the old pool and freed by page_pool_destroy(page_pool).
> 
> Later, lan966x_fdma_deinit()->lan966x_fdma_rx_free_pages() or the next
> reload puts these stale pointers into the current rx->page_pool.
> 
> Could that put a page twice while an skb still owns it, or put an
> already freed page into a different pool?
> 
> Would it help to clear the slot whenever its page is given away, and
> also check the return value of fdma_dcbs_init()?
> 
> > +		}
> >  	}
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but if NULL slots are
> expected here, what about the open-coded copy of this loop in
> lan966x_fdma_reload()?
> 
> lan966x_fdma_reload() {
>     ...
> 	for (i = 0; i < fdma_rx_old.n_dcbs; ++i)
> 		for (j = 0; j < fdma_rx_old.n_dbs; ++j)
> 			page_pool_put_full_page(page_pool,
> 						old_pages[i][j], false);
>     ...
> }
> 
> If the first fdma_dcbs_init() at probe stops partway, the rx->page[]
> entries from DCB k onward stay NULL, and lan966x_fdma_rx_alloc() still
> returns 0.
> 
> A later MTU change through lan966x_fdma_change_mtu(), or an XDP setup
> through lan966x_fdma_reload_page_pool(), reaches lan966x_fdma_reload().
> That function kmemdup()s those NULL entries into old_pages.
> 
> Once the new lan966x_fdma_rx_alloc() succeeds, this loop passes NULL to
> page_pool_put_full_page(). That leads to page_pool_unref_netmem(), which
> reads the pp_ref_count of a NULL netmem. Can this oops?
> 
> > @@ -999,6 +1001,7 @@ int lan966x_fdma_init(struct lan966x *lan966x)
> >  
> >  	err = lan966x_fdma_tx_alloc(&lan966x->tx);
> >  	if (err) {
> > +		lan966x_fdma_rx_free_pages(&lan966x->rx);
> >  		fdma_free_coherent(lan966x->dma_dev, &lan966x->rx.fdma);
> >  		page_pool_destroy(lan966x->rx.page_pool);
> >  		return err;
> 
> [Severity: Low]
> Should this patch have a Fixes: tag and go to net with Cc: stable?
> 
> The page_pool_destroy() call on this error path was added by commit
> 076344a6ad9d ("net: lan966x: fix page pool leak in error paths"), which
> is tagged Cc: stable. Since that commit, the pool is destroyed while the
> RX pages are still in flight. That causes the page_pool_release_retry()
> warning described in this commit message.
> 
> Something like:
> 
> Fixes: 076344a6ad9d ("net: lan966x: fix page pool leak in error paths")
> 
> Without the tag, stable trees that picked up 076344a6ad9d would keep
> the warning.

I routed this to net-next without a fixes tag, because its not a regression, and
its an init error path leak.

> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650%40microchip.com

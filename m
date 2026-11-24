Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518311;
	b=4L9O7HDfCbWyUY/rPk+4GtbzVc5mGfasS+FlAB68xzkm5PzDLxswPP3hQfwDpRrmjfMX
	 0/3sQ6VqlI7uFmugDWp7kUAtetnMn9Xa/bTGzYy0cjCLQY7GCj1PIyhc4Br5jeOqOjuA4
	 rRiEOcuzcK3Kkoxvfkh2YUqA9b1hfIdDFYwWnfm2NI+WMhBkkHFkMvNbVLzuRNYLhMs+y
	 /Acc2k8W6bMeuM8uoRp+MxtEw/Zy2lkdlfHhBhZgGmWP95/A25SBMYKqwwDaIpOvnCAQo
	 aOQMupe3SA6XK9Cg4KE/S5ZfIJZl7ANyzXkS8/QohkaQ39PVZshx3TfrQohZmKBnxug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518311;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=cMYYBh43HY5xutvnzofxwE95gQWfanq+WzepalGdUdE=;
	b=Cit8Bz916nHQuX2HSsFdYPuX+7nmcFCPZvynCq6NaPBRlPODz9bo221nYS9o2gi2OpF8
	 avxGmCj40+FYtqVFQXtXuejBir9IbgwHbOjVEwIzPjmhetHtkEyvQixS1zhlhhc5yq8Qi
	 za4bg/2mL72DlUMgWCODgIhgLUR8Va6moLi7YhP60VJAs+OtP+rYkYeXD1+96/1jg+ffj
	 +j06o1+VlnISbzV16hcidNDF4pU2uow3Lup4Rfaz8Ckjoaq26QUU/Q6bAg/rJw2Mnr2ee
	 +5W9Q4CgbEficR30z7cIm+R+eEK8r8hLN/pgQ8QgCMAmHebwJeeRaz2eabvXHAHlf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=kIFlonZS;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E68606A334;
	Tue, 24 Nov 2026 11:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E68606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=kIFlonZS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795518310; x=1827054310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Of+dCjox0s9BBeFJuiYkmvAKAj13vw6zap47XQbk6Oo=;
  b=kIFlonZSgM4/72v39DA+gSAhGW8JDIJvVTafxBRe4y/ut0FR5ukriyRV
   i0Hu0U3+s3vekG7pVUh7mmSznZ1DuXsDhAtMr/+ZB+VeQLtqM+/Kfmted
   YEugnSJ6HFQ8USGnWIWLd8jrKAl0NjydEpHcD7qyK+PzOLua8jxmdE0Qv
   j1y6zg6Asy05qCCr/svs2r4rHWV7tgaFssv8ZUI9ijl8j98Y3ObRDjW1+
   4kqYrjm1IqKcQQsejV8l94GU1TMMXyGhO8w1YJB2plOnWhaVmn8wppuhf
   TykY4PekDYl7XTwyx4p0XOD1Yb3Rk7J+hwFOFBsokpmHzcmoTiUfs2Chd
   w==;
X-CSE-ConnectionGUID: RdIhBla4TTmUq7KP99ZVFQ==
X-CSE-MsgGUID: RG/anjkeS4Gk78FY/ubCuQ==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="234021366"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2026 04:05:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 24 Nov 2026 04:05:09 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 04:05:06 -0700
Date: Tue, 24 Nov 2026 12:05:05 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horms@kernel.org>
Subject: Re: [PATCH net-next v3 5/9] net: sparx5/lan969x: size the FDMA
 buffers from the port MTUs
Message-ID: <20261124110505.66k7x7qluhxcnm62@DEN-DL-M70577>
References: <20261120-sparx5-mtu-change-v3-5-55c272fe1acc@microchip.com>
 <179544589573.3135.16010204842375196022@kernel.org>
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
In-Reply-To: <179544589573.3135.16010204842375196022@kernel.org>

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 (1) � High: 1 � Medium: 0 � Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] net: sparx5: UAF of two-step PTP skb on TX drop in
>   sparx5_port_xmit_impl()
> 
> Pre-existing issues:
> - [Critical] Use-after-free and double free of two-step PTP skbs on the
>   Sparx5 TX drop path.
> 
> --
> 
> net: sparx5/lan969x: size the FDMA buffers from the port MTUs
> 
> This commit sizes the Sparx5 and lan969x FDMA buffers from the largest port
> MTU plus the Ethernet header, FCS, IFH and two VLAN tags, rather than a
> fixed single page. On Sparx5 the RX and TX DB size is that length rounded
> up to 128 bytes, and sparx5_fdma_xmit() now drops frames that do not fit.
> On lan969x the page_pool page order is derived from the max frame size.
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > index 537c945409bba..b92d249777f0b 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> 
> [ ... ]
> 
> > @@ -224,6 +223,10 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
> >  	struct fdma *fdma = &tx->fdma;
> >  	void *virt_addr;
> >  
> > +	/* Drop frames that do not fit in the TX buffers */
> > +	if (unlikely(IFH_LEN * 4 + skb->len + ETH_FCS_LEN > fdma->db_size))
> > +		return -EMSGSIZE;
> > +
> 
> [Severity: High]
> This is a pre-existing problem in sparx5_port_xmit_impl(), but the
> new -EMSGSIZE return makes it much easier to hit. What happens to a
> two-step PTP skb that fails here?
> 
> sparx5_port_xmit_impl() calls sparx5_ptp_txtstamp_request() before
> ops->fdma_xmit(). For two-step PTP, that puts the skb on
> port->tx_skbs with skb_queue_tail() without taking an extra
> reference. It also increments sparx5->ptp_skbs and port->ts_id.
> 
> If fdma_xmit() then returns anything other than -EBUSY, the code
> jumps to the drop label, which only calls dev_kfree_skb_any(skb).
> Only the busy label calls sparx5_ptp_txtstamp_release(port, skb). The
> freed skb is therefore still linked on port->tx_skbs.
> 
> Later walks of port->tx_skbs happen in
> sparx5_ptp_txtstamp_old_release(), in the sparx5 and lan969x PTP IRQ
> handlers, and in sparx5_ptp_deinit(). These read SPARX5_SKB_CB() from
> freed memory, call __skb_unlink() through stale list pointers, and
> call dev_kfree_skb_any() on the same skb again. Isn't that a
> use-after-free and a double free?
> 
> sparx5->ptp_skbs is also never decremented for these skbs. After
> SPARX5_MAX_PTP_ID such drops, sparx5_ptp_txtstamp_request() returns
> -EBUSY forever, and two-step TX timestamping on the switch stalls.
> 
> Before this patch the Sparx5 TX DB was PAGE_SIZE. The drop path could
> only be reached through the -EINVAL ring-full return here, or through
> the -ENOMEM DMA mapping failure in lan969x_fdma_xmit(). With the
> default MTU of 1500, db_size is now
> ALIGN(1518 + 36 + 8, 128) = 1664. Any two-step frame with skb->len
> above 1624 now takes the drop path every time.
> 
> Such frames can still reach a 1500 MTU port, for example through tc
> mirred or bpf_redirect from a device with a larger MTU. They can also
> arrive when the MTU is lowered while larger skbs are already queued,
> which becomes possible later in this series.
> 
> The commit message relies on this drop path. Should the drop label in
> sparx5_port_xmit_impl() release two-step PTP skbs the same way the
> busy label does? Or would you rather check the length before
> sparx5_ptp_txtstamp_request() is called?

This is pre-existing. The drop path already misses the PTP release before this
series, e.g when the TX ring is full, so the handling of the PTP tx_skbs is
broken regardless of this check. I have two WIP patchsets for lan966x and
sparx5/lan969x that will rework the PTP tx_skb handling. These will be submitted
in the near future.

> 
> [Severity: Critical]
> This is a pre-existing issue, but this new return gives a second,
> deterministic way to hit it. What happens to a two-step PTP skb that gets
> -EMSGSIZE here?
> 
> By this point, sparx5_port_xmit_impl()->sparx5_ptp_txtstamp_request() has
> already put the skb on port->tx_skbs without taking a reference:
> 
> sparx5_ptp.c:sparx5_ptp_txtstamp_request() {
>     ...
> 	skb_queue_tail(&port->tx_skbs, skb);
> 	SPARX5_SKB_CB(skb)->ts_id = port->ts_id;
> 	SPARX5_SKB_CB(skb)->jiffies = jiffies;
> 
> 	sparx5->ptp_skbs++;
> 	port->ts_id++;
>     ...
> }
> 
> Back in sparx5_port_xmit_impl(), only -EBUSY goes through
> sparx5_ptp_txtstamp_release(). Any other negative return frees the skb
> while it is still on the list:
> 
> sparx5_packet.c:sparx5_port_xmit_impl() {
>     ...
> 	if (ret == -EBUSY)
> 		goto busy;
> 	if (ret < 0)
> 		goto drop;
>     ...
> drop:
> 	stats->tx_dropped++;
> 	sparx5->tx.dropped++;
> 	dev_kfree_skb_any(skb);
> 	return NETDEV_TX_OK;
> busy:
> 	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
> 	    SPARX5_SKB_CB(skb)->rew_op == IFH_REW_OP_TWO_STEP_PTP)
> 		sparx5_ptp_txtstamp_release(port, skb);
> 	return NETDEV_TX_BUSY;
> }
> 
> The next two-step request then walks the list in
> sparx5_ptp_txtstamp_old_release():
> 
> 	skb_queue_walk_safe(&port->tx_skbs, skb, skb_tmp) {
> 		if time_after(SPARX5_SKB_CB(skb)->jiffies + SPARX5_PTP_TIMEOUT,
> 			      jiffies)
> 			break;
> 
> 		__skb_unlink(skb, &port->tx_skbs);
> 		dev_kfree_skb_any(skb);
> 
> Does this read the cb of the freed skb and then free it again? The TX
> timestamp IRQ handler can also find the stale entry. ptp_skbs and ts_id
> also stay incremented, so can the PTP ID pool run out?
> 
> This path could already be reached through the -EINVAL return when the
> next TX DB is not done, i.e. when the TX ring is full.
> 
> With this patch and the default MTU of 1500, db_size goes from 4096 to
> ALIGN(1518 + 36 + 8, 128) = 1664. A two-step timestamped frame longer
> than 1624 bytes used to be sent, but now it always takes the drop path.
> Such frames can still reach a 1500 MTU port, for example through tc
> mirred or bpf_redirect from a device with a larger MTU.
> 
> The commit message says it will "make sparx5_fdma_xmit() drop frames that
> do not fit", so it depends on this drop path. Should the drop label in
> sparx5_port_xmit_impl() call sparx5_ptp_txtstamp_release() for two-step
> PTP skbs, the same way the busy label does? sparx5_port_xmit_impl() is
> still unchanged at the end of the series.
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

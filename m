Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168682;
	b=ud3kqsmmP/bPlz2IJXFc7mwDIbTmQbcuIOzatjBmV1U4MPjrSR+z19DmNjGgSSx1Xmlm
	 VD1rdPzNbYo1Z/664xfen0coN5rOIQigpMJQoClVMP+iF3lJkm1OyGhNN1aMGciRrPNZx
	 2TAAHth28TeZjy+HCmL9UC7caikQgDPBNK1ipiq+ZPtdWJjfUpJ2ME1vtVLL+QnMDr/B0
	 njISgHCpZbUfGBRhqDINnaODztvZzWcYB593jXQ6F/+2WyUk3QrmiQFjPHbc4fD4gK8HK
	 BE/NmXSZQFAeoWPYO5INUy3xF2b3Ux0VuBVh6oOk9LINaELjdq4lBNuV3cJP92r0R4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168682;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=18K2QVX9wsuXcDjVy4klLRXHgcGtXDEcAsxGkgJfiz8=;
	b=gbpr9DMwUVSveZwtBoFazfF7pHD6veyB5fTaHG9pQajBIjMKdLyDWi1IkdEMKuOStx5q
	 urzIwC9xoh6ZRzOnHuLfPlGt5cjBb+pEAkh0SIkExx/NAp5h28Dh2WB1O0tAzNflhpqVs
	 VGyhmjDafsHvvztxOGopCWz6Gsy1HDk1hs/19sMw/mD1cqsPtjSD2hmk1PYiXIVF0GXk/
	 I7Jhs4lKEHOeqLHSpdOIzAJom0/S7HbzZWflhJnGVfGmUQbBAyv6F/oQdP6yfDc4v93p2
	 cQ78PRixLiQGYsgyJMn1oAaxH8t7/ltuOprZOIVjPrrlWPfUGkYzGY/pIneikp1pqwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=vIJ0WrAH;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0F606A320;
	Fri, 20 Nov 2026 09:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=vIJ0WrAH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795168682; x=1826704682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3pe3cqwMoeM9BUmbzWe8+5h4ErVAO7PLZ1zk5jx0Ijg=;
  b=vIJ0WrAH0cOABYwTU71zkROyPfAav6Dqd3oGbfYt3qqrmOJwgcYe5T0Y
   buVOz2HJvYgn1h/nlbaxLRYHswvqEUboXMT9mN6tg+UvOCFxvnrID61X0
   NqysiA4gk6iSj41QUD0JKSHemtq4wqbFkPl8TaIMgvnPxNtb9Vz3AOL6C
   e3X8mluLbkJ0Kj3hYz3EMJwoGkPRC2c7RzwFjJFRMWlr0s+83lrsXK40i
   XoEAKnzIjIXdsV7fpU7lH0AsHJIVRwb5dBEymfsdgktB4JJIhGnQW1Wx0
   JcfhQ9mOWY9Nr6iUBXN7YW1gN8QPey/3gB8/fEMrSpPZ75x/1FAxJ3YoX
   A==;
X-CSE-ConnectionGUID: JnaHMu3yQ7S4W16Kr4Rk/g==
X-CSE-MsgGUID: P4BY+QXbReyZQZX4cfRE2Q==
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="77585934"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2026 02:57:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 20 Nov 2026 02:57:54 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 20 Nov 2026 02:57:51 -0700
Date: Fri, 20 Nov 2026 10:57:50 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Ian Rogers <irogers@google.com>
CC: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH net] net: lan966x: Free skb when PTP TX timestamp request
 fails in xmit
Message-ID: <20261120095750.njqvupqpfuh443rh@DEN-DL-M70577.microsemi.net>
References: <20261119170729.1524516-1-irogers@google.com>
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
In-Reply-To: <20261119170729.1524516-1-irogers@google.com>

> When all LAN966X_MAX_PTP_ID timestamp slots are in flight,
> lan966x_ptp_txtstamp_request() returns -EBUSY without queuing or freeing
> skb, and lan966x_port_xmit() returns that negative errno directly from
> .ndo_start_xmit. Because dev_xmit_complete() treats negative return codes
> (< NET_XMIT_MASK) as packets already consumed by the driver, skb is never
> freed or requeued, permanently leaking the sk_buff and its socket
> sk_wmem_alloc accounting.
> 
> Free skb with dev_kfree_skb_any(), increment tx_dropped, and return
> NETDEV_TX_OK when lan966x_ptp_txtstamp_request() fails.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
> -Wimplicit-int-enum-cast; not tested on Microchip LAN966x hardware.
> 
> Fixes: 77eecf25bd9d ("net: lan966x: Update extraction/injection for timestamping")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  .../net/ethernet/microchip/lan966x/lan966x_main.c  | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> index b8696fc7e9b9..9c722d23e0bb 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
> @@ -392,6 +392,7 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
>  	struct lan966x_port *port = netdev_priv(dev);
>  	struct lan966x *lan966x = port->lan966x;
>  	__be32 ifh[IFH_LEN];
> +	netdev_tx_t ret;
>  	int err;
>  
>  	memset(ifh, 0x0, sizeof(__be32) * IFH_LEN);
> @@ -404,8 +405,11 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
>  
>  	if (port->lan966x->ptp && skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
>  		err = lan966x_ptp_txtstamp_request(port, skb);
> -		if (err)
> -			return err;
> +		if (err) {
> +			dev_kfree_skb_any(skb);
> +			dev->stats.tx_dropped++;
> +			return NETDEV_TX_OK;
> +		}
>  
>  		lan966x_ifh_set_rew_op(ifh, LAN966X_SKB_CB(skb)->rew_op);
>  		lan966x_ifh_set_oam_type(ifh, LAN966X_SKB_CB(skb)->pdu_type);
> @@ -414,12 +418,12 @@ static netdev_tx_t lan966x_port_xmit(struct sk_buff *skb,
>  
>  	spin_lock(&lan966x->tx_lock);
>  	if (port->lan966x->fdma)
> -		err = lan966x->ops->fdma_xmit(skb, ifh, dev);
> +		ret = lan966x->ops->fdma_xmit(skb, ifh, dev);
>  	else
> -		err = lan966x_port_ifh_xmit(skb, ifh, dev);
> +		ret = lan966x_port_ifh_xmit(skb, ifh, dev);
>  	spin_unlock(&lan966x->tx_lock);
>  
> -	return err;
> +	return ret;
>  }
>  
>  static int lan966x_port_change_mtu(struct net_device *dev, int new_mtu)
> -- 
> 2.56.1.708.g77570a6a1d-goog
>

Hi Ian,

Thanks for the fix. The issue is real, and also on my backlog of work to
upstream.

Just a heads up, I expect the AI review to flag issues in this area. The lan966x
PTP TX path has a number of known problems that I am are going to address in a
PTP series soon. I'll go through the findings once the review is in and follow
up on this one.

/Daniel

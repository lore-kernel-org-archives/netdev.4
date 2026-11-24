Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519543;
	b=0QcM2hDVWrAIDATf1fnJq4LhMO/F34lBZNqJuuOGnTuC7oswxW0LMv2by3rA+teylL32
	 hOjLKV/gtilMb81LKSYYfPo+JQPe0zo6ZcfbDNWY2G90zCYwWPbw0kzW04nRUYvP54QwM
	 87grAAkmTx5ON7ptBcFBTcyZPgLeAZzuT7TlV8svSz2IBx+2buTK4KRTLMt8tKEJ2DMnB
	 crg26X+/kV4H4af8LuSYofZPWQPtCQ9uHL2so4bvvzQy6VLjD7k6pkQVU+Jq749BMFVvG
	 /8eWxtIRrXhd2ztkwGdX9fp/h1PmkXfvFJVZHQeouIFylUrb76eDJh4Ag7cZBTBR3Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519543;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5OCkNJcdG6wUIrNckrz847Dwsg7KGd8B3Hb3AHOi1Xo=;
	b=x6B2LDu9p7/iHAWbiUAht1Oi9Uclr6I/WWRKbc5OpZuGYAxjAnI6mrsBP+x+0r6Zljdk
	 KGQGpnbsGIFUwvw2D3zSLrJsik9xh6zipB7o19gh9SAQMa+lGC6FOWOateXda2+tfiCxT
	 rP+YQAlhHxVOGUky5EKiLFlxXe9LbEyoSdyW09RrooJLBz8+Z1aZAm0w1d18j5RYG0j9+
	 0M4KC5J16Yrin4v9ykD0LRZFgGRUKbQVqiip6kjEThOGfBAuNeSupRMIFbqOhic5npKBt
	 vuDFdsxPgG7BpmmfoC2rW/ym1femXznEhatDdDjTQYpLybTdont+2kip4u694ciKrlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czGXVEYq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA805606A333
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=czGXVEYq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3671F000C6;
	Tue, 24 Nov 2026 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519543;
	bh=5OCkNJcdG6wUIrNckrz847Dwsg7KGd8B3Hb3AHOi1Xo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=czGXVEYqz8nBUZ7ZN2bPh8urRroY+70tnNSz4Bp8WTEGyAQbLMNKMjel0sonsFM9K
	 D7s8WZiVbMsDis2T0RayV23JgfpvS1guHTh7WV9gDCxTgFHHe0yfVOWy4dYjF5WKLj
	 g20YaJq/eD0dvHFz5dDysrIXlEtIA2Iwy1/mh767e0zc/KoCpjwtHQa4WYkQFwnYOr
	 VM3uNIjplHliftq7RiwyfAPSFVhrdyP/wsk0vRCX4Z54F/F3a5BzTQ9/WBOK1VjlhS
	 GVh7VbvI6qNMShDaKzHrRyP4LefaHaYWkrd+mDHWXqQDi2ucgJDZ6w1+Eg6vdPia4b
	 jE+v1wtnqNEsA==
Subject: Re: [PATCH net-next v11 4/8] hsr: Drop received PTP packets
From: netdev-bot+sashiko@kernel.org
To: bigeasy@linutronix.de
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
 danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net, fmaurer@redhat.com,
 kuba@kernel.org, neelima@ti.com, pabeni@redhat.com, praneeth@ti.com,
 pratheesh@ti.com, richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
 willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
 edumazet@kernel.org
Date: Tue, 24 Nov 2026 11:25:41 +0000
Message-ID: <179551954166.3135.8484737548969907135@kernel.org>
In-Reply-To: <20261120-hsr_ptp-v11-4-264c88f4f1d0@linutronix.de>
References: <20261120-hsr_ptp-v11-4-264c88f4f1d0@linutronix.de>
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

- [Low] In net/hsr/hsr_slave.c, hsr_handle_frame() now drops every
  received L2 PTP frame on every HSR/PRP port type, including…
- [Low] The new comment in hsr_handle_frame() (net/hsr/hsr_slave.c) says
  'Userland needs to capture the packet on the original interface…

--

hsr: Drop received PTP packets

With this commit, hsr_handle_frame() drops every L2 PTP frame received on
an HSR/PRP port instead of forwarding it through the HSR stack. Tagged
frames are matched on the encapsulated protocol in the HSR tag, and all
other frames are matched on the ethertype. Userspace is expected to
capture PTP on the original slave interface with an ETH_P_ALL socket.

> diff --git a/net/hsr/hsr_slave.c b/net/hsr/hsr_slave.c
> index 84d8a40bba0a6..86a05f3fc1cc5 100644
> --- a/net/hsr/hsr_slave.c
> +++ b/net/hsr/hsr_slave.c

[ ... ]

> @@ -64,15 +64,28 @@ static rx_handler_result_t hsr_handle_frame(struct sk_buff **pskb)
>  	skb_reset_mac_header(skb);

[ ... ]

>  	skb_reset_mac_len(skb);
>  
> +	/* PTP packets are not supposed to be forwarded via HSR as-is. The
> +	 * latency introduced by forwarding renders the time information
> +	 * useless. Userland needs to capture the packet on the original
> +	 * interface instead of hsr.
> +	 */

[Severity: Low]
Should this comment also say that only ETH_P_ALL sockets on the original
interface will see the frame?

The PTP branch jumps to finish_free_consume, which frees the skb and
returns RX_HANDLER_CONSUMED. In __netif_receive_skb_core() the ptype_all
taps run before the rx_handler. A consumed frame then skips the
protocol-specific delivery:

net/core/dev.c:__netif_receive_skb_core() {
    ...
	rx_handler = rcu_dereference(skb->dev->rx_handler);
	if (rx_handler) {
		...
		switch (rx_handler(&skb)) {
		case RX_HANDLER_CONSUMED:
			ret = NET_RX_SUCCESS;
			goto out;
    ...
}

As a result, a packet socket bound to ETH_P_1588 on the slave device never
receives the frame. The commit message mentions this, but this comment is
the only description of it in the tree.

> +	if ((!hsr->prot_version && protocol == htons(ETH_P_PRP)) ||
> +	    protocol == htons(ETH_P_HSR)) {
> +		hsr_ethhdr = (struct hsr_ethhdr *)skb_mac_header(skb);
> +		if (hsr_ethhdr->hsr_tag.encap_proto == htons(ETH_P_1588))
> +			goto finish_free_consume;
> +	} else {
> +		if (protocol == htons(ETH_P_1588))
> +			goto finish_free_consume;
> +	}

[Severity: Low]
This check does not look at port->type, so it also covers
HSR_PT_INTERLINK. It also runs before both hsr_forward_skb() calls below.

Is it intended that a RedBox stops bridging PTP between its interlink/SAN
side and the ring? A node that forwards in software also stops relaying
PTP around the ring, and PTP no longer reaches hsr0. There is no way to
opt out of this.

If this is intended, could the commit message mention the interlink and
RedBox case explicitly?

The commit message also says:

  For the PRP configuration it is the ether type, for HSR configuration it
  is the encapsulated protocol, that is checked.

In HSR mode, frames from the interlink port and from ports with
NETIF_F_HW_HSR_TAG_RM are untagged. They take the else branch and are
matched on the plain ethertype. The code handles them correctly, but the
description is slightly imprecise.

>  
>  	/* Only the frames received over the interlink port will assign a
>  	 * sequence number and require synchronisation vs other sender.
>  	 */

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-hsr_ptp-v11-0-264c88f4f1d0%40linutronix.de

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681249;
	b=125G+3tIli3iltCuTwJS72q0oyiPaUKuZrhTpg98NKHfJixQOEQV2gd6c13kd800BysF
	 n4IgCtsB21qajGp64FCvBzrPyWYwDIiJw0Hc6V8ti/qyRInMw8MUZbFHfkS631FrhzA7b
	 BQUwSA+/6x6WCErh/ar4l3eYv/hvieZXnsxuj2M5fMUiHxbU8wj9f7JFLXijz/C/6Vazl
	 hOgnyR7ZJldyMi1udnxmbwkjR81Z6ob+NpIsMjze60FaMOuTX3dmKrPbCd/w8JfMuBJsr
	 pvbxBnWVYsKuPQYQoOebAI14MF/HHE/YmP066F0wlOlJp49bZow7QNdIeReLSVQ5iqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681249;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=480ULLOLrifBd/vovICYhZKlfz9IIMZeCXmPHfiiLag=;
	b=xeno+9C7cxT63Q4raXsqLAk3VysLGnJlOlb13qL//wvNxWS+AR9b73Dmgdqk1Rbw+6Pp
	 VpZlNJHnFQnbBcQd92Rnpr0+/Vxyugn8PuMv4frRSTiZYxGBnL+Oit20DFTkwo86330Sz
	 IhXuwOYb6s81rqJXXaxKDotVIUCdO1UCzL2gXdFB0tUc0Og8gkovjzXddTPoU6eEQxZc0
	 fwfhN5XR9qjPaVanzzLjnj8yH4yq5pvEvWPbae8LBDPEb7+cHNo2Q/qfhkZ7BMXAHMY5n
	 uS+lnWpsW8iHXGbADGNZI7FRPAsLik02yIz0ZjHGLsJS5Wti2Teewg5ESQoqdIg2x3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=JnIWVnot;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1111B606A6A1;
	Thu, 26 Nov 2026 08:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1111B606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=JnIWVnot
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 2323520764;
	Thu, 26 Nov 2026 09:20:46 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFVW2IQNZS1s; Thu, 26 Nov 2026 09:20:45 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 26DF120728;
	Thu, 26 Nov 2026 09:20:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 26DF120728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795681245;
	bh=480ULLOLrifBd/vovICYhZKlfz9IIMZeCXmPHfiiLag=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=JnIWVnotfwX0C9Q5tXToJSQmDkd84Ki4Ohw+ugwbLkOxHUkPzBi3VgVvYDjHEF3bP
	 9dVUz32jIfWxImM5HV0aE/Fzz97xn99Oif3VG7I0yKpyATGl0no0y2G0A9uVbJxBXy
	 OCBzi8dzxvs5NYz+yhVgIchZUc/V8hk3hmaLPsnt/nl4HHk6smKnMZLTXhCNRP58et
	 cFRI6Vw5U41v5ihvbZnWZpOl3mVzoqDlOri8uqsUmXR0Fl1v536Qq6HVx3xfgdh3hU
	 0D9bSraRP/GLiUL5jdT4pnCWW/GLMR5hAuoWBXbGR7Lne7rnO23KXniU0T/SJ71CNU
	 71omklC9FZHPQ==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 26 Nov
 2026 09:20:44 +0100
Received: (nullmailer pid 1982003 invoked by uid 1000);
	Thu, 26 Nov 2026 08:20:44 -0000
Date: Thu, 26 Nov 2026 09:20:44 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Jun Yao <yaojun8558363@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <herbert@gondor.apana.org.au>,
	<dsahern@kernel.org>, <idosch@nvidia.com>, <lkp@intel.com>,
	<victor@mojatatu.com>
Subject: Re: [PATCH v2] xfrm: avoid stale tunnel pointers in deferred input
 callbacks
Message-ID: <awfr3GBxx0WKz0-1@gauss4>
References: <20261112111946.375692-1-yaojun8558363@gmail.com>
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
In-Reply-To: <20261112111946.375692-1-yaojun8558363@gmail.com>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
---
Author: Jun Yao <yaojun8558363@gmail.com>

> xfrm: avoid stale tunnel pointers in deferred input callbacks
>
> IP-TFS input can be deferred while its reordering queue waits for a missing
> sequence number. The VTI receive callback stores a pointer to the tunnel in
> skb->cb, and the device can be removed and freed before the callback runs.
>
> The issue was discovered by Qihoo 360's Tulongfeng multi-agent system.
>
> This IPv4 VTI use-after-free was reproduced on Linux 7.4-rc2 in an x86-64
> QEMU guest. When the IP-TFS reorder timer resumes input after VTI deletion,
> KASAN reports an 8-byte read from freed memory in vti_rcv_cb(). Relevant
> parts of the report are:
>
>   BUG: KASAN: slab-use-after-free in vti_rcv_cb+0x696/0x770
>   Read of size 8 at addr ffff88810eae4b58 by task swapper/3/0
>   Call Trace:
>    [...]
>    vti_rcv_cb+0x696/0x770
>    xfrm4_rcv_cb+0xa6/0x110
>    xfrm_rcv_cb+0xca/0x140
>    xfrm_input+0x11eb/0x6660
>    __input_process_payload+0xb87/0x24c0
>    iptfs_input_ordered+0x560/0x8e0
>    iptfs_drop_timer+0x464/0x8e0
>    __hrtimer_run_queues+0x270/0x600
>    hrtimer_run_softirq+0x14b/0x270
>    [...]
>
>   Freed by task 394:
>    [...]
>    kfree+0x23c/0x490
>    kvfree+0x31/0x40
>    netdev_release+0x6d/0x90
>    device_release+0xce/0x250
>    kobject_put+0x18d/0x4f0
>    netdev_run_todo+0x724/0x1360
>    rtnl_dellink+0x401/0x1020
>    [...]
>
> Keep only scalar tunnel metadata in an skb extension. The VTI callbacks
> look up the device by ifindex under RCU and check its link configuration
> before using its private data. If the VTI no longer exists, drop the
> deferred packet. Use the same metadata to preserve tunnel mark handling
> and IPv6 tunnel detection, and clear it when a new XFRM receive path starts
> and after the callback completes.
>
> Guard the skb extension accesses with CONFIG_XFRM and provide no-op or
> NULL-returning helpers when it is disabled, since xfrm.h is also included
> by code built without XFRM support.
>
> Signed-off-by: Jun Yao <yaojun8558363@gmail.com>

Should this bug fix include a Fixes tag for the commit that introduced
the tunnel pointer in skb->cb:

  Fixes: 70be6c91c865 ("xfrm: Add xfrm_tunnel_skb_cb to the skb common buffer")

[ ... ]

> diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
> index c4f14d42df248..3594254df9de9 100644
> --- a/net/ipv4/ip_vti.c
> +++ b/net/ipv4/ip_vti.c
> @@ -58,10 +58,25 @@ static int vti_input(struct sk_buff *skb, int nexthdr, __be32 spi,
>  	tunnel = ip_tunnel_lookup(itn, skb->dev->ifindex, flags,
>  				  iph->saddr, iph->daddr, 0);
>  	if (tunnel) {
> +		struct xfrm_tunnel_info *info;
> +
>  		if (!xfrm4_policy_check(NULL, XFRM_POLICY_IN, skb))
>  			goto drop;
>
> -		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = tunnel;
> +		info = xfrm_tunnel_info_add(skb);
> +		if (!info)
> +			goto drop;
> +
> +		*info = (struct xfrm_tunnel_info) {
> +			.ifindex = tunnel->dev->ifindex,
> +			.i_key = tunnel->parms.i_key,
> +			.type = XFRM_TUNNEL_INFO_VTI4,
> +			.ip4 = {
> +				.link = tunnel->parms.link,
> +				.saddr = tunnel->parms.iph.saddr,
> +				.daddr = tunnel->parms.iph.daddr,
> +			},
> +		};
>
>  		if (update_skb_dev)
>  			skb->dev = tunnel->dev;
> @@ -96,18 +111,28 @@ static int vti_rcv_proto(struct sk_buff *skb)
>
>  static int vti_rcv_cb(struct sk_buff *skb, int err)
>  {
> +	const struct xfrm_tunnel_info *info = xfrm_tunnel_info(skb);
>  	unsigned short family;
>  	struct net_device *dev;
>  	struct xfrm_state *x;
>  	const struct xfrm_mode *inner_mode;
> -	struct ip_tunnel *tunnel = XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4;
> +	struct ip_tunnel *tunnel;
>  	u32 orig_mark = skb->mark;
>  	int ret;
>
> -	if (!tunnel)
> +	if (!info || info->type != XFRM_TUNNEL_INFO_VTI4)
>  		return 1;
>
> -	dev = tunnel->dev;
> +	dev = dev_get_by_index_rcu(dev_net(skb->dev), info->ifindex);

Does looking up info->ifindex in dev_net(skb->dev) break cross-netns VTI
and VTI6 tunnels in vti_rcv_cb() and vti6_rcv_cb()?

When a VTI or VTI6 interface is created in or moved to a different network
namespace from its underlay link netns (tunnel->net != dev_net(tunnel->dev),
which skb_scrub_packet() at the end of vti_rcv_cb() and vti6_rcv_cb()
handles), vti_input() is called with update_skb_dev = false, so skb->dev
is still the underlay ingress device in tunnel->net when the callback runs.
Looking up tunnel->dev->ifindex in dev_net(skb->dev) searches the underlay
namespace instead of the overlay namespace where tunnel->dev is registered,
dropping all inbound packets with -ENODEV (or matching an unrelated VTI
device with the same ifindex and parameters in the underlay netns).

> +	if (!dev || dev->rtnl_link_ops != &vti_link_ops)
> +		return err ? 1 : -ENODEV;
> +
> +	tunnel = netdev_priv(dev);
> +	if (tunnel->parms.i_key != info->i_key ||
> +	    tunnel->parms.link != info->ip4.link ||
> +	    tunnel->parms.iph.saddr != info->ip4.saddr ||
> +	    tunnel->parms.iph.daddr != info->ip4.daddr)
> +		return err ? 1 : -ENODEV;

Should vti_rcv_cb() and vti6_rcv_cb() return 0 rather than 1 when err != 0
and the tunnel device is gone or reconfigured?

In xfrm4_rcv_cb() and xfrm6_rcv_cb(), cb_handler callbacks run in priority
order until one returns <= 0; returning 1 means the packet was not claimed
by this protocol handler.  Here info->type already shows VTI claimed the
packet on input, and when vti_rcv_cb(skb, 0) returns -ENODEV, xfrm_input()
jumps to drop: and calls xfrm_rcv_cb(skb, family, xfrm_proto, -1).
Returning 1 on that second call lets xfrm4_rcv_cb() continue to
lower-priority handlers such as xfrmi_rcv_cb(), which can match an xfrmi
interface and increment rx_errors and rx_dropped on that unrelated device.

[ ... ]

> diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
> index c790278391519..6cf40b0009845 100644
> --- a/net/ipv6/ip6_vti.c
> +++ b/net/ipv6/ip6_vti.c

[ ... ]

> @@ -342,18 +361,29 @@ static int vti6_rcv(struct sk_buff *skb)
>
>  static int vti6_rcv_cb(struct sk_buff *skb, int err)
>  {
> +	const struct xfrm_tunnel_info *info = xfrm_tunnel_info(skb);
>  	unsigned short family;
>  	struct net_device *dev;
>  	struct xfrm_state *x;
>  	const struct xfrm_mode *inner_mode;
> -	struct ip6_tnl *t = XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6;
> +	struct ip6_tnl *t;
>  	u32 orig_mark = skb->mark;
>  	int ret;
>
> -	if (!t)
> +	if (!info || info->type != XFRM_TUNNEL_INFO_VTI6)
>  		return 1;
>
> -	dev = t->dev;
> +	dev = dev_get_by_index_rcu(dev_net(skb->dev), info->ifindex);

Can dereferencing skb->dev via dev_net(skb->dev) before checking err cause
a use-after-free in vti_rcv_cb() and vti6_rcv_cb()?

When asynchronous crypto resumes in xfrm_input() via xfrm_input_resume()
(encap_type == -1, async = 1) and later fails, the drop path releases the
reference on skb->dev before running xfrm_rcv_cb():

net/xfrm/xfrm_input.c:xfrm_input() {
    ...
drop:
	if (async)
		dev_put(dev);
	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
	kfree_skb(skb);
	return 0;
}

Previously, vti_rcv_cb() and vti6_rcv_cb() checked if (err) before touching
skb->dev.  If the ingress device was unregistered while async crypto was in
flight, dev_put(dev) can drop its last reference and allow netdev_run_todo()
to free skb->dev before vti_rcv_cb() or vti6_rcv_cb() reads
dev_net(skb->dev).

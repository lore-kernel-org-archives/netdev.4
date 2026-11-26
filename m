Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681153;
	b=FNcco5OV2GZf22S53fuI9v080wxEhoHxebIZ0NYI2ZcPKQ3k4QplmidrZUpDkUN6pwwL
	 biX4L2R1Fa//zgnS4C4ajVl1Ur81R1Mx7wEjAOKLZij7ijWrGRK+m06klNvrzNfx3NlAD
	 k8Od6L+6hrHVw+oJNI2Sd4QcSyjfJkun6kPu7qEmwZksNwebM7MiupFEwe48Hh3mL5vBR
	 A9/u8wK4+b6L8H0Wb2LURqCBcvq61TO52PZ429kvxb0pYGrzp5cl2thEnUvxAbWmB0vqn
	 aSsob0DBrFh8+x0zkJSu/NdFFdIF7DA4PnK524g/E00cnmwGz6XZEXKWccdqu+vxXKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681153;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=XBk6l5QW+e5tIM40DG+y+F2iKqGamonsktqME9Dbsmc=;
	b=cVUcT8+wPntnBiSJGbXMP8amKctwy3sM6j9Hdl+1WRR8BVavoT4KyleiNFkmttf0V6DU
	 ljfqPYeQsjk6b5hMZmCVoCxj8AIqP2B8z2bKPy//ooiu59x6Mru5D+bTmsA/EDGy+/tnv
	 ozUtNV72xQz5nv7tSiP9edWhAC9fw3EOrjfBO/gpeoWZwmMOF8SGEg5sxUEjslk/16GeA
	 ArhI2ptmpsjWu0hOqf0nA3axJBKpP6vYyKi0bWY/jfK0jwi5s3wnhuX30El/YUaxjJ8Dc
	 ALTlNt8zjWY6S2cz9EnT70lfJmZQMUuFgwau927R863cGJr/9HNMrgROPzN2g2Sw5Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=bnxdlg8U;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EA606A31C;
	Thu, 26 Nov 2026 08:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=bnxdlg8U
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 72DD820728;
	Thu, 26 Nov 2026 09:19:09 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gREvfF4GR3PW; Thu, 26 Nov 2026 09:19:08 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id 4D0AD2085F;
	Thu, 26 Nov 2026 09:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com 4D0AD2085F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795681148;
	bh=XBk6l5QW+e5tIM40DG+y+F2iKqGamonsktqME9Dbsmc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=bnxdlg8UogTPcqiPfkeQBCgsE+A+vw3ieVQcIh26B9HTceV7blzqqYSRLzyFA8/X5
	 lisoHMPStJ5Lnwf2Wlv+ZbUp1kplkX1rgYFYhHAChBpm/ZTWudUE7GS55pyrQDDa/b
	 6AJV5z8zmBcVULk5UJl4+xC848fmn5jH08cK3CdSU4ZizVQhcK2e2OPExkUsClY9wj
	 wgUvio+nFymZ6ReiO/HqeV7j8gmr+pp0Kty6bd7ejOPH2Ilxyg711ts9C4H/n2RnD+
	 Dc4lFosyXNnPJEHqN0kCv7AMjutuUZntJtDlmT3z+fL9oYSV+xzsNKSii62+zm4IeS
	 e+jLuhmWOmbHg==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 26 Nov
 2026 09:19:07 +0100
Received: (nullmailer pid 1980212 invoked by uid 1000);
	Thu, 26 Nov 2026 08:19:06 -0000
Date: Thu, 26 Nov 2026 09:19:06 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Jun Yao <yaojun8558363@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <herbert@gondor.apana.org.au>,
	<dsahern@kernel.org>, <idosch@nvidia.com>, <lkp@intel.com>,
	<victor@mojatatu.com>
Subject: Re: [PATCH v2] xfrm: avoid stale tunnel pointers in deferred input
 callbacks
Message-ID: <awfrerO8s00MtKza@gauss4>
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
X-ClientProxiedBy: EXCH-04.secunet.de (10.32.0.184) To EXCH-01.secunet.de
 (10.32.0.171)

Sorry for the delay, but I had to think a bit longer about this.

On Thu, Nov 12, 2026 at 07:19:46PM +0800, Jun Yao wrote:
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

Fixes tag is missing.

> 
> ---
> v1: https://lore.kernel.org/lkml/20261111094629.230568-1-yaojun8558363@gmail.com/T/#u
> 
> Changes in v2:
> - Group the tunnel info helpers under CONFIG_XFRM and provide NULL-returning
>   or no-op stubs when it is disabled, fixing the !CONFIG_XFRM build errors.
> - Document the runtime reproduction and include a trimmed KASAN report.
> 
> Build failure reported by the kernel test robot:
> https://lore.kernel.org/oe-kbuild-all/202611120519.EG3LbKfu-lkp@intel.com/
> 
> Build-tested bzImage and modules using x86_64_defconfig-based configurations
> with CONFIG_WERROR=y and GCC 13.3.0:
> - CONFIG_XFRM=y, including IPv4/IPv6 VTI and ESP offload, XFRM interface,
>   and IP-TFS.
> - CONFIG_XFRM=n and CONFIG_SKB_EXTENSIONS=n.
> Both builds completed without errors or warnings.
> 
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 6787fcf6a..f97412b95 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -5044,6 +5044,7 @@ enum skb_ext_id {
>  #endif
>  #ifdef CONFIG_XFRM
>  	SKB_EXT_SEC_PATH,
> +	SKB_EXT_XFRM_TUNNEL,
>  #endif
>  #if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
>  	TC_SKB_EXT,
> diff --git a/include/net/xfrm.h b/include/net/xfrm.h
> index 445223a8d..38815faca 100644
> --- a/include/net/xfrm.h
> +++ b/include/net/xfrm.h
> @@ -382,6 +382,7 @@ struct xfrm_dst_lookup_params {
>  };
>  
>  struct net_device;
> +struct ip6_tnl;
>  struct xfrm_type;
>  struct xfrm_dst;
>  struct xfrm_policy_afinfo {
> @@ -740,14 +741,70 @@ struct xfrm_tunnel_skb_cb {
>  		struct inet_skb_parm h4;
>  		struct inet6_skb_parm h6;
>  	} header;
> +	/* Keep the layout of the other XFRM skb control blocks stable. */
> +	unsigned long reserved;

The comment above only makes sense if you know why it was
introduced.

> diff --git a/net/ipv6/xfrm6_input.c b/net/ipv6/xfrm6_input.c
> index 07edef258..9aed0b21d 100644
> --- a/net/ipv6/xfrm6_input.c
> +++ b/net/ipv6/xfrm6_input.c
> @@ -15,6 +15,7 @@
>  #include <linux/netfilter.h>
>  #include <linux/netfilter_ipv6.h>
>  #include <net/ipv6.h>
> +#include <net/ip6_tunnel.h>
>  #include <net/xfrm.h>
>  #include <net/protocol.h>
>  #include <net/gro.h>
> @@ -22,7 +23,28 @@
>  int xfrm6_rcv_spi(struct sk_buff *skb, int nexthdr, __be32 spi,
>  		  struct ip6_tnl *t)
>  {
> -	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
> +	struct xfrm_tunnel_info *info;
> +
> +	xfrm_tunnel_info_clear(skb);
> +	if (t) {

I don't think this can happen. All current callers
of xfrm6_rcv_spi() set t = NULL.

> diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
> index 5ed87d513..a5d67d506 100644
> --- a/net/xfrm/xfrm_input.c
> +++ b/net/xfrm/xfrm_input.c
> @@ -466,6 +466,7 @@ static int xfrm_inner_mode_input(struct xfrm_state *x,
>  int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
>  {
>  	const struct xfrm_state_afinfo *afinfo;
> +	const struct xfrm_tunnel_info *tunnel_info;
>  	struct net *net = dev_net(skb->dev);
>  	struct net_device *dev = skb->dev;
>  	int err;
> @@ -555,16 +556,20 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
>  	}
>  
>  	family = XFRM_SPI_SKB_CB(skb)->family;
> +	tunnel_info = xfrm_tunnel_info(skb);

Touching the skb extensions are usually an expensive operation.
Did you do some performance benchmarks?

VTI is superseeded by the xfrm interfaces and will go away
some day. So we should try to not add more VTI speciffic
code to the generic codepath. This patch is quite big for
a fix, something shorter would be preferable. But if we
really need to do this, we should try to move it to VTI.

>  
>  	/* if tunnel is present override skb->mark value with tunnel i_key */
>  	switch (family) {
>  	case AF_INET:
> -		if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4)
> -			mark = be32_to_cpu(XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4->parms.i_key);
> +		if (tunnel_info &&
> +		    tunnel_info->type == XFRM_TUNNEL_INFO_VTI4)
> +			mark = be32_to_cpu(tunnel_info->i_key);
>  		break;
>  	case AF_INET6:
> -		if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6)
> -			mark = be32_to_cpu(XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6->parms.i_key);
> +		if (tunnel_info &&
> +		    (tunnel_info->type == XFRM_TUNNEL_INFO_VTI6 ||
> +		     tunnel_info->type == XFRM_TUNNEL_INFO_IP6))
> +			mark = be32_to_cpu(tunnel_info->i_key);
>  		break;
>  	}

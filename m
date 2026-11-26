Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659428;
	b=i/Xuny1s6gOnZAvkpLhIGWwIeBJYOG3GAc0wBgx3PdcIWtVXr42fXLxkMShUvyRHZke5
	 +ED7GX5uWlPUbtZpNzbPgUtXpF+hM36vty/d3OWEvBSeMjn361cUoQRGw/ToxJ+YiDgIH
	 FMLzjy4zi2dfivVa0GQ6gyP7WRbFgOVA4xfybf6poAWnIXGys585Y2kubbsg8X7AI7003
	 +dv6CwRO93iLRDdzRkR+T6pZTYVmM7zqt0JqIt7Ar2UId5pZO8nrGHyTksfJgPrxjrjyd
	 NN5Ebo3EvWU/zI3/c0j//XJshYC3YP+qNAWTUoplTI4g0KIKfT7KoJhH0tT8dU5PQrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659428;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fXzIvj+Miyv8ZDxvJY4Vt+UHPfI7SJW5A3pgxQ1P/8s=;
	b=LpCuox6OkzfxbQBbCgS6WU+99pRf+6RBDbSs2lseVt38c+qf2uQSw10kvqPx6Tj+yEHD
	 90TKBAezLFUXn+PhVZL0Y+paa6XgQ4yDVtll+jgwctjTCXrm+V6AKJaMxLMTf97ooYFMA
	 86s6g3geNmSsMqLZgf3ASbYqK69tqTqZyH4yTT2CDb/mvp/YDYIxN+WdvJ5210KokyJ39
	 q1c6NcHE66AdtYHBxZKBEin6SOzGVMG3UzOUbNKstd+v5t2dnJJFvXqlPKhqXIe3Jisns
	 7I/Qokl887HD8/KOvRaZQnc5yXMrb9plt78RMz16QUma9cGt5HpuubqBgyJy9fTKLvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hnjv2FFX;
	arc=none smtp.remote-ip=91.218.175.203
Received: from mta0.migadu.com (out-203.mta0.migadu.com [91.218.175.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4B606A32D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE4B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hnjv2FFX
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h5tYjmYXwN37vDwarjJmMf6ijB9noyW46ya0yJ1tctQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795659425; v=1; x=1796264225;
 b=hnjv2FFXsGH45uJ3QPsl772Qo8BjtlWhTpdo3f12viqCW7k2cFg7DJ2KP/b4EGhjSbS9KAh2
 /sduLUxJc5Gs8Zc1JPVkyglDgwYqmRj5K50FgMKs1UgsWXnOdZHWxjxLuQwwnXRpkvR+A8x2sdp
 PUMIDaeLSwGyNcO3n4z66hs8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68a03a1d74c74de9;
	Thu, 26 Nov 2026 02:17:05 +0000
X-Mizu-Trace-ID: 68a03a1d74c74de9
X-Migadu-Flow: FLOW_OUT
Message-ID: <675a13e9-ed23-4a73-8d09-28517c377353@linux.dev>
Date: Thu, 26 Nov 2026 10:16:56 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: xdp: fix generic XDP on skbs without an
 Ethernet header
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, kennethbwlee@snu.ac.kr, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, kuniyu@google.com,
 wang.zhan@smartx.com, mkarsten@uwaterloo.ca, bpf@vger.kernel.org
References: <20261124142545.221584-1-jiayuan.chen@linux.dev>
 <179561685970.3135.9452194614168004635@kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <179561685970.3135.9452194614168004635@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/25/26 10:27 PM, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] dev_xdp_attach() (net/core/dev.c) now rejects every
>   XDP_MODE_SKB attach with -EOPNOTSUPP when dev->type is neither…
> - [Medium] The new early return in netif_receive_generic_xdp() (`if
>   (skb->data - skb_mac_header(skb) != ETH_HLEN) return XDP_PASS;`) skips…
> - [Low] Documentation/networking/af_xdp.rst (around line 86) says XDP_SKB
>   mode, which is used when the driver has no XDP support or XDP_SKB is…
> 
> --
> 
> net: xdp: fix generic XDP on skbs without an Ethernet header
> 
> The patch refuses to attach a generic XDP program to a device that is
> neither ARPHRD_ETHER nor ARPHRD_LOOPBACK. It also skips the generic XDP
> program at runtime for any skb whose mac header is not exactly ETH_HLEN
> bytes. The goal is to fix a WARN in skb_vlan_push() that comes from the
> Ethernet header fixup in bpf_prog_run_generic_xdp() on L3 devices such as
> sit0.
> 
> Closes: https://lore.kernel.org/bpf/20260812043643.808295-1-kennethbwlee@snu.ac.kr/
> 
>> diff --git a/net/core/dev.c b/net/core/dev.c
>> index cd0796a1dbfdf..a9ef193967bab 100644
>> --- a/net/core/dev.c
>> +++ b/net/core/dev.c
>> @@ -5825,6 +5825,10 @@ static u32 netif_receive_generic_xdp(struct sk_buff **pskb,
>>  	if (skb_is_redirected(skb))
>>  		return XDP_PASS;
>>  
>> +	/* XDP is Ethernet only, skip skbs without an Ethernet header. */
>> +	if (skb->data - skb_mac_header(skb) != ETH_HLEN)
>> +		return XDP_PASS;
> 
> [Severity: Medium]
> Can this silently skip a program that was attached successfully to an
> ARPHRD_ETHER device?
> 
> Take a VLAN device with reorder_hdr off. Its type is ARPHRD_ETHER and it
> has no ndo_bpf, so dev_xdp_attach() defaults to XDP_MODE_SKB and accepts
> the program. On receive, vlan_do_receive() does this:
> 
> net/8021q/vlan_core.c:vlan_do_receive() {
>     ...
> 	if (!(READ_ONCE(vlan_dev_priv(vlan_dev)->flags) & VLAN_FLAG_REORDER_HDR) &&
> 	    ...
> 		skb_push(skb, offset);
> 		skb = *skbp = vlan_insert_inner_tag(skb, skb->vlan_proto,
> 						    skb->vlan_tci, skb->mac_len);
> 		...
> 		skb_pull(skb, offset + VLAN_HLEN);
> 		skb_reset_mac_len(skb);
> 	}
>     ...
> }
> 
> That leaves skb->data - skb_mac_header(skb) == 18. Then
> __netif_receive_skb_core() jumps to another_round and calls
> do_xdp_generic() with the VLAN device's program. The new check returns
> XDP_PASS for every packet.
> 
> Before this patch the program ran on the full Ethernet+VLAN frame, so
> read-only filters and XDP_DROP filters worked. reorder_hdr can be toggled
> at runtime, so a filter that is already attached could stop being
> enforced. Nothing reports this: no warning, no extack and no tracepoint.
> 
> The commit message justifies the runtime check only by dev->type changing
> after attach. The VLAN effect appears only in the v2->v3 note below the
> --- line, and that note won't be kept when the patch is applied.
> 
> Would it make sense to warn once here, or to reject the attach, and to
> describe this in the commit message?
> 



This is on purpose. The direction from the maintainers on v1 was that
XDP is Ethernet only, so generic XDP only handles skbs with an ETH_HLEN
mac header. v2 tried to let this VLAN case through, and the review on
v2 asked to skip it too, because the fixup after the program is wrong
for it.

v1: https://lore.kernel.org/netdev/20260813113229.381136-1-jiayuan.chen@linux.dev/

> A separate point: bpf_xdp_link_update() calls dev_xdp_install() directly:
> 
> net/core/dev.c:bpf_xdp_link_update() {
>     ...
> 	mode = dev_xdp_mode(xdp_link->dev, xdp_link->flags);
> 	bpf_op = dev_xdp_bpf_op(xdp_link->dev, mode);
> 	err = dev_xdp_install(xdp_link->dev, mode, bpf_op, NULL,
> 			      xdp_link->flags, new_prog);
>     ...
> }
> 
> This path never reaches the new dev->type check in dev_xdp_attach(). The
> device type can change after the link is created, for example through
> bond/team port enslavement or TUNSETLINK. In that case the link update
> still succeeds, and the new program never runs either.
> 
> Is this inconsistency intended?


Yes. dev->type can change after attach anyway, the run time check is
what covers it.

> 
> [ ... ]
> 
>> @@ -10775,6 +10779,12 @@ static int dev_xdp_attach(struct net_device *dev, struct netlink_ext_ack *extack
>>  			NL_SET_ERR_MSG(extack, "XDP program already attached");
>>  			return -EBUSY;
>>  		}
>> +		/* lo is ARPHRD_LOOPBACK but uses Ethernet framing. */
>> +		if (mode == XDP_MODE_SKB && dev->type != ARPHRD_ETHER &&
>> +		    dev->type != ARPHRD_LOOPBACK) {
>> +			NL_SET_ERR_MSG(extack, "Generic XDP only supports Ethernet devices");
>> +			return -EOPNOTSUPP;
>> +		}
> 
> [Severity: Medium]
> Does this break existing generic XDP users on L3 devices?



Yes, that is the direction from the maintainers on v1: XDP is Ethernet
only, and BPF on L3 devices should be attached at TC instead.

> 
> Today an XDP_MODE_SKB attach succeeds on tun in IFF_TUN mode, wireguard
> (ARPHRD_NONE), sit/ipip/gre/ip6tnl, PPP, RAWIP WWAN and IPoIB.
> 
> Some programs never modify the first 14 bytes, for example read-only
> filters or programs that return XDP_DROP or XDP_PASS. These programs run
> correctly, because the fixup in bpf_prog_run_generic_xdp() only fires
> when those bytes change:
> 
> 	if ((orig_eth_type != eth->h_proto) ||
> 	    (orig_host != ether_addr_equal_64bits(eth->h_dest,
> 						  skb->dev->dev_addr)) ||
> 	    (orig_bcast != is_multicast_ether_addr_64bits(eth->h_dest))) {
> 		__skb_push(skb, ETH_HLEN);
> 
> A plain "ip link set dev X xdp obj ..." with no mode flag is affected as
> well. dev_xdp_mode() falls back to XDP_MODE_SKB when ndo_bpf is missing:
> 
> 	return dev->netdev_ops->ndo_bpf ? XDP_MODE_DRV : XDP_MODE_SKB;
> 
> tun_netdev_ops (TUN mode) has no ndo_bpf, so XDP on an IFF_TUN device
> always uses generic mode and is now always rejected.
> 
> The commit message says these attaches will be refused, but it describes
> generic XDP on L3 devices only as comparing garbage.
> 
> Could it say that generic XDP setups that work today on these devices will
> now get -EOPNOTSUPP? The Fixes: tag points at a 2017 commit, so this uAPI
> restriction would also reach every stable tree.
> 
> [Severity: Low]
> Should Documentation/networking/af_xdp.rst be updated in the same patch?
> It describes XDP_SKB mode as:
> 
>   A fallback mode that works for any network device.
> 
> After this patch, dev_xdp_attach() returns -EOPNOTSUPP for XDP_MODE_SKB on
> any device that is neither ARPHRD_ETHER nor ARPHRD_LOOPBACK. That covers
> both cases the document describes: an explicit XDP_SKB request, and the
> fallback for drivers without XDP support.
> 
> netif_receive_generic_xdp() also skips skbs whose mac header is not
> ETH_HLEN bytes, so generic XDP runs in fewer cases than the document
> describes.
> 
>>  	}
>>  
>>  	/* don't call drivers if the effective program didn't change */
> 


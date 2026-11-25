Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619716;
	b=NzE1IE/QibGDvkI9Dtodh3TwpYoAfIp8+Y+qaKVV1MzCYr4NLaJRSVN8QMY3G34+JckC
	 e/GIzq9BDUQMEq9+Eue7oBK99Q973c5JLcKt3W/KyhDYGL7yrIn4cfD7TIVTGIeZTkPe9
	 AMKQ0EiOxzSjRdkfXvgSFGoXSsGV0PuG/bvM3RYuyabWY8Xm9CRaj0Ca8CzqqnLbSqW1S
	 Xoh5wa8gqrUoWsUsDFkrnWecMLnmkiGEtfoTLQDCqFa/SP6ywamY3wgb9490kgghqAItE
	 O7lGCsJV0gOH4NNiCInfU4k+sG9B+Ch1XVV7J0SL79nbgAmCBtvHrN3bwMv7KNP7BWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619716;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8rQDdqftQbRWfsR0J08iUtDFETao79Pu7IsBN1K8Eak=;
	b=mOdYp7kMn4v3EZtRHFXhcCAzwUUSlSKbvMbKBuJ7wyO5UZnLhVrbu7KJXJR98vdthczV
	 vWNfDdc6k4xW9rkX38HduSJ+d38nvnmCN9AP38tkPiy6eYkuSiOh9TOzbomMPSAe9bVwD
	 7uhm34l2cFGrNr385FZZn2YgsbBBgGSq+xmvrPdC8ZqEVwuQ4Db0ahwLzcXKdR+3G8FvY
	 ivtfq4VUuLS3HWuw1xVxc6DqS55qVpPhsho8fGLOHmvHEeYUSk8K0HEjPq3DnUwjgCsev
	 i1mdq7fEYh+xitQHJBU6Y3wqkqWYvzS0t5xIKdxjZA7UeEYSwiFMX2EdLR9hV5JIGtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccIROgzG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0A606A332
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccIROgzG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731921F00A19;
	Wed, 25 Nov 2026 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619716;
	bh=8rQDdqftQbRWfsR0J08iUtDFETao79Pu7IsBN1K8Eak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ccIROgzGTsRWKB0Hznrujc4oDttOQ2PFLqp4k4ujG6DJBUsjtMUsUiNKmd81i5U+/
	 tFa0QoZtaTUZfDI5DbEAhAsQ9QtrD/1JuYGHTNYlrVVWei0+iLRuiB7C/0puVHuHNs
	 nclVygPHmn1zU0OGTxrjS4kKLY3U9cWc2KWONNSXrvxpIg4QYWp3f4Ey2rre5elw1a
	 Df9DjIGG+yQo+6KC6sVbbZprCxIYmOggAovv8dt9X10Y90VmxrWIEa13CdRIxx4rRp
	 N+n5bnvwXdQDganXofpmuVB1cLDBH+PDJXtKPY+bWGeWtY6jg1anZQ4cvXYO75CmFz
	 69PCcF6D+DYfw==
Subject: Re: [PATCH net v6 4/5] ipmr: set up GSO state for tunnel vifs
From: netdev-bot+sashiko@kernel.org
To: julius@bairaktaris.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, willemb@google.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com, nbd@nbd.name,
 jiayuan.chen@linux.dev, mfleming@cloudflare.com, almasrymina@google.com,
 bigeasy@linutronix.de, richardbgobert@gmail.com, ecree.xilinx@gmail.com,
 bsdhenrymartin@gmail.com
Date: Wed, 25 Nov 2026 15:15:15 +0000
Message-ID: <179561971501.3135.8394313222349713065@kernel.org>
In-Reply-To: <ffd8ca7abd44882707fbca297889f6e43ced4a65.1795295554.git.julius@bairaktaris.de>
References: <ffd8ca7abd44882707fbca297889f6e43ced4a65.1795295554.git.julius@bairaktaris.de>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new filter in ipmr_prepare_xmit()
  (net/ipv4/ipmr.c:1964-1966) drops an encapsulated GSO packet only when…
- [Medium] ip_encap() (net/ipv4/ipmr.c:1873-1890) adds a new outermost
  IPv4 header with frag_off = 0 (DF clear) to a GSO skb, but leaves…
- [Medium] ipmr: skb_checksum_help() in ipmr_prepare_xmit() corrupts SCTP
  CRC32c
- [Low] The commit message says the encapsulated GRE and UDP-tunnel GSO
  packets the patch now drops were already lost before: 'without this…

--

ipmr: set up GSO state for tunnel vifs

This commit makes ip_encap() in net/ipv4/ipmr.c set up GSO state for
VIFF_TUNNEL vifs. It calls iptunnel_handle_offloads() and
skb_set_inner_ipproto(), reserves one outer IP ID per segment, and sets
the outer length with iph_set_totlen(). It also drops encapsulated GSO
packets without SKB_GSO_IPXIP4 in ipmr_prepare_xmit(), and completes the
pending checksum of encapsulated non-GSO packets before encapsulation.

> GRE
> and UDP tunnel aggregates do not: gre_gso_segment() and
> skb_udp_tunnel_segment() take the payload type from
> skb->inner_protocol. Drop those before the vif counts them; without
> this change ipip_gso_segment() dropped them, as they lacked
> SKB_GSO_IPXIP4.

[Severity: Low]
Is this accurate for devices that segment these packets in hardware?

It holds when the packet is segmented in software. Some NICs list
NETIF_F_GSO_GRE or NETIF_F_GSO_UDP_TUNNEL in hw_enc_features and accept
an outer IPPROTO_IPIP header in ndo_features_check. On those, the old
aggregate never reached ipip_gso_segment().

mlx5 is one example. Its hw_enc_features gets GSO_UDP_TUNNEL and
GSO_GRE, and only the _CSUM variants are in gso_partial_features.
mlx5e_tunnel_features_check() also keeps the features for an outer IPIP
header:

drivers/net/ethernet/mellanox/mlx5/core/en_main.c:mlx5e_tunnel_features_check() {
    ...
	case IPPROTO_IPIP:
	case IPPROTO_IPV6:
		if (mlx5e_tunnel_proto_supported_tx(priv->mdev, IPPROTO_IPIP))
			return features;
    ...
}

So netif_gso_ok() passed and the skb was handed to the hardware, which
most likely produced malformed segments.

On such hardware, the new early return in ipmr_prepare_xmit() changes
the result from transmitting to dropping. The drop also happens before
any vif, device or MIB counter is updated, so nothing records it.

Could the commit message describe this as a behaviour change on these
devices rather than a no-op for all of them?

> diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> index 836f3f95b20c4..eae382a2fadb3 100644
> --- a/net/ipv4/ipmr.c
> +++ b/net/ipv4/ipmr.c
> @@ -1869,6 +1869,10 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
>  	struct iphdr *iph;
>  	const struct iphdr *old_iph = ip_hdr(skb);
>  
> +	/* skb_cow() in ipmr_prepare_xmit() leaves no header to unclone */
> +	iptunnel_handle_offloads(skb, SKB_GSO_IPXIP4);
> +	skb_set_inner_ipproto(skb, IPPROTO_IPIP);
> +
>  	skb_push(skb, sizeof(struct iphdr));
>  	skb->transport_header = skb->network_header;
>  	skb_reset_network_header(skb);
> @@ -1882,8 +1886,8 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
>  	iph->saddr	=	saddr;
>  	iph->protocol	=	IPPROTO_IPIP;
>  	iph->ihl	=	5;
> -	iph->tot_len	=	htons(skb->len);
> -	ip_select_ident(net, skb, NULL);
> +	iph_set_totlen(iph, skb->len);
> +	ip_select_ident_segs(net, skb, NULL, skb_shinfo(skb)->gso_segs ?: 1);

[Severity: Medium]
What happens to SKB_GSO_TCP_FIXEDID and SKB_GSO_TCP_FIXEDID_INNER here?

These bits are positional. Documentation/networking/segmentation-offloads.rst
says "For encapsulated packets, SKB_GSO_TCP_FIXEDID refers only to the
outer header". tcp4_gro_complete() maps them as:

	BUILD_BUG_ON(SKB_GSO_TCP_FIXEDID << 1 != SKB_GSO_TCP_FIXEDID_INNER);
	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4 |
			(NAPI_GRO_CB(skb)->ip_fixedid * SKB_GSO_TCP_FIXEDID);

inet_gso_segment() then computes:

	fixedid = !!(skb_shinfo(skb)->gso_type & (SKB_GSO_TCP_FIXEDID << encap));

When fixedid is set, it does not increment the ID per segment.

ip_encap() adds a new outermost header with frag_off = 0, but it leaves
these bits as they are. Fixed IDs are common for TCP GRO aggregates:
DF packets get ID 0, and inet_gro_flush() sets ip_fixedid when the first
two IDs are equal.

For such an aggregate, doesn't the FIXEDID bit that described the
original header now apply to the new DF-clear ipmr header?

If so, every segment would carry the same outer IP ID with DF clear, and
the gso_segs IDs reserved by ip_select_ident_segs() would go unused. The
original header, now at encap level 1, would be segmented according to
FIXEDID_INNER, which described a different header. Nested IPXIP4
aggregates would shift the same way.

This seems to contradict "reserve one outer IP ID per segment as
iptunnel_xmit() does" in the commit message. Before this patch,
ipip_gso_segment() dropped these packets because they lacked
SKB_GSO_IPXIP4, so this is new behaviour.

>  	ip_send_check(iph);
>  
>  	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
> @@ -1951,6 +1955,15 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
>  	}
>  
>  	if (vif->flags & VIFF_TUNNEL) {
> +		/* An encapsulated packet carries the inner headers of its
> +		 * own tunnel. Only IPXIP4 GSO packets nest: their IP headers
> +		 * are segmented by protocol field, while GRE and UDP tunnel
> +		 * segmentation read skb->inner_protocol, which ip_encap()
> +		 * sets for its own header.
> +		 */
> +		if (skb_is_gso(skb) && skb->encapsulation &&
> +		    !(skb_shinfo(skb)->gso_type & SKB_GSO_IPXIP4))
> +			return -1;

[Severity: High]
Can FOU and GUE aggregates get past this check and then be segmented
with the wrong inner protocol?

The check only rejects encapsulated GSO packets when SKB_GSO_IPXIP4 is
clear. fou_gro_receive() and gue_gro_receive() clear
NAPI_GRO_CB(skb)->encap_mark, so ipip or sit GRO can nest inside a UDP
tunnel aggregate:

  udp_gro_complete()
    gso_type |= SKB_GSO_UDP_TUNNEL(_CSUM), encapsulation = 1
  sit_gro_complete() / ipip_gro_complete()
    gso_type |= SKB_GSO_IPXIP4
  ipv6_gro_complete() / inet_gro_complete()
    skb_set_inner_protocol(skb, ETH_P_IPV6 or ETH_P_IP)

Such a packet has both UDP_TUNNEL and IPXIP4 set, so it passes this
check. ip_encap() then overwrites the recorded payload type:

	skb_set_inner_ipproto(skb, IPPROTO_IPIP);

skb_udp_tunnel_segment() in net/ipv4/udp_offload.c dispatches on that
field:

	case ENCAP_TYPE_IPPROTO:
		offloads = is_ipv6 ? inet6_offloads : inet_offloads;
		ops = rcu_dereference(offloads[skb->inner_ipproto]);

For FOU or GUE carrying 6in4 (ipproto 41), wouldn't this run
ipip_gso_segment() and inet_gso_segment() on the IPv6 header?

That would usually fail with -EINVAL and drop the packet after it has
been counted as sent. When the traffic class and source address bytes
happen to form a plausible ihl and protocol, malformed segments would be
built instead.

Before this patch, these aggregates segmented correctly in software. The
outer ipip_gso_segment() accepted them because sit had already set
IPXIP4, and skb_udp_tunnel_segment() dispatched on ETH_P_IPV6.

The comment above says UDP tunnel segmentation reads
skb->inner_protocol, which ip_encap() overwrites. Should the check reject
GSO packets that have any of SKB_GSO_GRE, SKB_GSO_GRE_CSUM,
SKB_GSO_UDP_TUNNEL or SKB_GSO_UDP_TUNNEL_CSUM set, instead of testing for
the absence of SKB_GSO_IPXIP4?

FOU carrying IPIP still works, but only because IPPROTO_IPIP happens to
be the right handler.

>  		rt = ip_route_output_ports(net, &fl4, NULL,
>  					   vif->remote, vif->local,
>  					   0, 0,

[ ... ]

> @@ -1985,6 +1998,17 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
>  		return -1;
>  	}
>  
> +	/* Complete the pending checksum of an encapsulated packet, as for
> +	 * a packet sent through an ipip device. This may reallocate the
> +	 * head: no pointer into it is used after this point.
> +	 */
> +	if ((vif->flags & VIFF_TUNNEL) && skb->encapsulation &&
> +	    !skb_is_gso(skb) && skb->ip_summed == CHECKSUM_PARTIAL &&
> +	    skb_checksum_help(skb)) {
> +		ip_rt_put(rt);
> +		return -1;
> +	}
> +
>  	WRITE_ONCE(vif->pkt_out, vif->pkt_out + 1);
>  	WRITE_ONCE(vif->bytes_out, vif->bytes_out + skb->len);
>  

[Severity: Medium]
Does this do the right thing for an encapsulated SCTP packet whose
CRC32c is still pending?

The comment and the commit message say this matches what happens to a
packet sent through an ipip device. validate_xmit_skb() does not call
skb_checksum_help() directly, though. It calls
skb_csum_hwoffload_help(), which checks for SCTP first:

	if (unlikely(skb_csum_is_sctp(skb)))
		return !!(features & NETIF_F_SCTP_CRC) ? 0 :
			skb_crc32c_csum_help(skb);

skb_checksum_help() has no such check. For a non-GSO skb with
encapsulation set, ip_summed == CHECKSUM_PARTIAL and csum_not_inet set,
it computes a 16-bit ones-complement sum and writes it at
csum_start + csum_offset. That overwrites half of the 32-bit SCTP
checksum field with the wrong algorithm. It sets ip_summed to
CHECKSUM_NONE but leaves csum_not_inet set. skb_crc32c_csum_help()
would have written the CRC32c and called skb_reset_csum_not_inet().

Such a packet can come from BPF encapsulation (bpf_skb_adjust_room(),
bpf_lwt_push_ip_encap()) or IPVS tunnel mode on a device that
advertises NETIF_F_SCTP_CRC. The receiver would then drop every one of
these packets on a bad CRC, after the vif and device counters have
recorded them as sent.

The trigger needs CAP_NET_ADMIN and an unusual setup, but this is new
behaviour added by the patch, and it does not match the parity the
comment claims.

Would calling skb_csum_hwoffload_help(skb, 0) here be the better fit?
That is what validate_xmit_skb() ends up doing for an encapsulated skb
on an ipip device. It falls through to skb_checksum_help() for the
non-SCTP case and dispatches SCTP to skb_crc32c_csum_help().

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795295554.git.julius%40bairaktaris.de

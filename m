Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619714;
	b=JtfmmbIV87DALsrAjzcCShU5xsSWEUUSHjnxWRVb0WJHN/D70JUlYCQy1LhQc2InjnHG
	 Q3j+lpnEMreXPrfZBlJ1/XqWTXdHLzBHvDHBRObFRWxytMYcJ1YXR9YiZshOnKx0Ywa0R
	 RCbjujAaObP0KvmlcM3xkj5Wh4VyDte+wxqSNvu7ZBsEwkrh0VIcfbcGwy4TavNY0ULbm
	 wSkQffiCBUJANJA2MuGEVHMwBXLkjKBkpwG0h/OcGdd+giwNOmZwj7I8EiR+if8B79Rty
	 25X4+gI0pFAU89bG4DFeSt9WyySkA0XPwu5HXaPDMEdoIdFTm0WQVsLxmM60t9YwYDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619714;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ag1YZ4P2iBHHX0PPnVooWHiOZf/qB5w/3z66asEECLQ=;
	b=4HrZTBk7SAXYSHhyDRqJw4V1/AJ8qW070MU9puYdWEThlVRv13OiVLDa6L3bMdHvNX64
	 myOH8o/mK+DD5MtNhO+rum5/YRJr44jS2QcRGrRr1BWJHsgZzFiF74f6IQ3+uTFlW7tI1
	 maxd+3mTTsh7IYN2L2t3Z+gDAN3zGv1M06zad8gwIoOc6LAwcNLpA7OCdCokwS/QGGGhU
	 bj2/n1BFeKY1cGmp7KTYBHtGrqn0ovcOyGx1JKZK2PzXO8/Caz6l2C08Wu9BFT/gieJ6t
	 QEJeyTl0An8Gi8LjIJ3KonkIDE+lZBm6SegcBb7kDRHKlJUHA5ANtzcknfiGTn0wuBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDfzHkDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1640606A680
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDfzHkDi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A82D1F000E6;
	Wed, 25 Nov 2026 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795619714;
	bh=Ag1YZ4P2iBHHX0PPnVooWHiOZf/qB5w/3z66asEECLQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PDfzHkDicsZkuwNZeGPtOcYqpgvlQSCSZKtBds75H9Hef5BZBoZJ9Jf8gKMP3G5fR
	 yoyhFxLDL2DWEbhBsNkLTY414P27uA/HFSYxoqQH7dcJWnSfExmnt+HeoTMAuAj6nW
	 ppztgsk3DfWp/xthhmTu+CvNB7UGt9lJCUh6lYRSmGoJbH2IMc7X2Bd5JM7KBPYP6y
	 1gSzGllSCo3rqUlgEWz8uz8Or7Omj0Niu3Wq370SyGzJGAxZv5I5NyM/s+uxFnjqvA
	 uixzwRV14k5RJ3bE2TG8sSCOnoGPrYPFzLTswmOxiZW0KCOF9Fi2Lr/rPmCE9jgdmd
	 xx4nL1MuGoy0Q==
Subject: Re: [PATCH net v6 2/5] net: gso: segment fraglist packets with a
 software tunnel checksum
From: netdev-bot+sashiko@kernel.org
To: julius@bairaktaris.de
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, willemb@google.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com, nbd@nbd.name,
 jiayuan.chen@linux.dev, mfleming@cloudflare.com, almasrymina@google.com,
 bigeasy@linutronix.de, richardbgobert@gmail.com, ecree.xilinx@gmail.com,
 bsdhenrymartin@gmail.com
Date: Wed, 25 Nov 2026 15:15:12 +0000
Message-ID: <179561971293.3135.1414270038839047097@kernel.org>
In-Reply-To: <c512956bc8cc74688721e3d5a52016ee85966484.1795295554.git.julius@bairaktaris.de>
References: <c512956bc8cc74688721e3d5a52016ee85966484.1795295554.git.julius@bairaktaris.de>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] skb_gso_tnl_csum_sw() (include/net/gso.h:87-97) is meant to
  predict whether the tunnel segmenter will compute the outer checksum…
- [Low] For UDP, the fix sends affected fraglist aggregates into
  __udp_gso_segment()'s DODGY / changed-geometry fallback, and that…

--

net: gso: segment fraglist packets with a software tunnel checksum

This commit stops skb_segment_list() from segmenting fraglist GSO packets
when a GRE or UDP tunnel segmenter will compute the outer checksum with
gso_make_checksum(). skb_segment_list() sets no SKB_GSO_CB() checksum state,
and gso_make_checksum() reads that state. The patch adds
skb_gso_tnl_csum_sw(), which sets skb->encap_hdr_csum only in those cases,
and skb_gso_list_csum_ok(), which sends such packets to skb_segment() in the
TCP and UDP GSO handlers.

> diff --git a/include/net/gso.h b/include/net/gso.h
> index 119fc4c170e16..1cf2bf3a2b4aa 100644
> --- a/include/net/gso.h
> +++ b/include/net/gso.h
> @@ -84,6 +84,30 @@ static inline __sum16 gso_make_checksum(struct sk_buff *skb, __wsum res)
>  	return csum_fold(csum_partial(csum_start, plen, partial));
>  }
>  
> +/* Whether a GRE or UDP tunnel segmenter computes the outer checksum of a
> + * segment with gso_make_checksum(): when it does not offload it, and for each
> + * segment that is CHECKSUM_PARTIAL, as it then sets skb->encapsulation. Every
> + * segment of skb_segment_list() has the ip_summed of the head.
> + */
> +static inline bool skb_gso_tnl_csum_sw(const struct sk_buff *skb,
> +				       bool need_csum, bool offload_csum)
> +{
> +	return need_csum &&
> +	       (!offload_csum || skb->ip_summed == CHECKSUM_PARTIAL);
> +}

[Severity: Medium]
Does this predicate match what __skb_udp_tunnel_segment() does when
SKB_GSO_TUNNEL_REMCSUM is set?

With remcsum, the segment loop clears CHECKSUM_PARTIAL before it checks
encapsulation:

net/ipv4/udp_offload.c:__skb_udp_tunnel_segment() {
    ...
		if (remcsum)
			skb->ip_summed = CHECKSUM_NONE;

		/* Set up inner headers if we are offloading inner checksum */
		if (skb->ip_summed == CHECKSUM_PARTIAL) {
			skb_reset_inner_headers(skb);
			skb->encapsulation = 1;
		}
    ...
		if (skb->encapsulation || !offload_csum) {
			uh->check = gso_make_checksum(skb, ~uh->check);
    ...
}

So with remcsum and offload_csum true, skb->encapsulation is never set and
gso_make_checksum() is never called. The helper is called without remcsum
and still returns true for a CHECKSUM_PARTIAL head. Its comment also says
"for each segment that is CHECKSUM_PARTIAL, as it then sets
skb->encapsulation", which does not hold here.

vxlan_build_skb() sets SKB_GSO_TUNNEL_REMCSUM only when the skb is
CHECKSUM_PARTIAL, so a CHECKSUM_PARTIAL head is the usual case for remcsum.

Take this setup:

  - VXLAN with REMCSUM_TX and UDP checksums on
  - an egress device that offloads the outer checksum
  - CHECKSUM_PARTIAL fraglist GRO aggregates

Here encap_hdr_csum now gets set and skb_gso_list_csum_ok() returns false.
Before this patch, skb_segment_list() segmented these packets correctly. Now
tcp4_gso_segment() and tcp6_gso_segment() fall back to skb_segment(), and
__udp_gso_segment() linearizes the whole aggregate.

Is this a performance regression for a configuration that already worked?
Could remcsum be passed to skb_gso_tnl_csum_sw(), so that remcsum with
offload_csum counts as offloaded, and the comment updated to match?

[ ... ]

> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index 7dc85eb333aa3..fb2f63774cf6c 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c

[ ... ]

> @@ -521,6 +521,7 @@ struct sk_buff *__udp_gso_segment(struct sk_buff *gso_skb,
>  		 */
>  		if ((skb_pagelen(gso_skb) - sizeof(*uh) == skb_shinfo(gso_skb)->gso_size) &&
>  		    !(skb_shinfo(gso_skb)->gso_type & SKB_GSO_DODGY) &&
> +		    skb_gso_list_csum_ok(gso_skb) &&
>  		    ip_hdr(skb_shinfo(gso_skb)->frag_list)->version == (is_ipv6 ? 6 : 4))
>  			return __udp_gso_segment_list(gso_skb, features, is_ipv6);
>  

[Severity: Low]
For UDP, this sends the affected aggregates into the DODGY / changed
geometry fallback just below, which linearizes the whole aggregate:

		ret = __skb_linearize(gso_skb);
		if (ret)
			return ERR_PTR(ret);

__skb_linearize() goes through __pskb_pull_tail() -> pskb_expand_head()
with GFP_ATOMIC. A GRO aggregate can have up to 64 frag_list members. That
means one high-order atomic allocation of around 64KB per aggregate on the
xmit path. If the allocation fails, the aggregate is dropped with -ENOMEM.

With skb_gso_tnl_csum_sw(), this fallback becomes the normal path for UDP
fraglist traffic in a checksummed VXLAN, GENEVE or GRE tunnel in two cases:

  - the egress device does not offload the outer checksum
  - the aggregate is CHECKSUM_PARTIAL, even when the device does offload it

These packets used to leave with wrong outer checksums, so nothing that
worked before gets slower here. The commit message only says the patch
will "segment a fraglist packet with skb_segment() when it is set". It does
not mention the linearization in the UDP case.

Could the commit message mention the UDP linearization and its cost?

Alternatively, would it be cheaper to keep the skb_segment_list() fast path
and set up SKB_GSO_CB() checksum state on each segment it builds? That would
mean gso_reset_checksum() for CHECKSUM_PARTIAL segments and a payload
skb_checksum() for the rest.

TCP does not seem to be affected, since tcp_gso_segment() -> skb_segment()
walks frag_list without linearizing.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795295554.git.julius%40bairaktaris.de

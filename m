Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800475;
	b=dSHnVfaG7HLwpLsXqA09KM+KvcK8Fepl4YB+Xfc/7gi0ksRJKUUQ0NDcmSeZm/12h4l9
	 tD1O0VAKL1SX7aT4han3f1cm6VlyGTJDXeZnzKrc0uqBRnbO6Uif7iaJd6qvNfhpA3ZU/
	 z9U/I69vkS0U78bIUq7GNvpnpTuZhZZtsxbwExCCqLFLnaqrRt9mR9FUKw5jPpo+0voCl
	 lFkCCIDTMcjh+KIwqMBRa/hHBaW+dksBJWYcJvAOaVJJoudNjtPNfRkFlS29xXCdRttcd
	 RzRCPA0s+uEGzgQGaOYb+R3tQszGRopZWFvOIxFlCSt0Otnb2ror1gvqIQ/HjVqz/mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800475;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pBYpLLyYTuBK9CRoRtN49pj0op5fF/cCdNRMi340gxA=;
	b=zY0elxnJD9+WKH4P4N6QITsJ5EnTKnCxdzyrZxoTK1hyMoo0C2+Hw0JZNCgkNEqdSZ9K
	 AIdTb7s2x57KbMvuI/YC7V4MUFMhfo1Y2Wd6iKOdmP7+N1a9JlRkLevnJ3NFMWUDA1Jd9
	 9Oy+g+YsCIoTmMkkG0YzcXD/9ZYs3z212Tj2SSKIFiR2LqYaSi5fttRnHB1AAS691kNw/
	 hJBxiAte9XSLMBXqt5Uw/t3yrVp9yag4YAHVp9eHMISARnByPPKCmnnAQ8JdHvu8eTw6r
	 Bes3Hnea84KAcGpELgKzMKadZyi8ot2jLW4sIdL6fb+Iivfi5VjSe6RRDNe/D5MWkdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsAignx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D57606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 03:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsAignx8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9771F000C4;
	Mon, 16 Nov 2026 03:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794800474;
	bh=pBYpLLyYTuBK9CRoRtN49pj0op5fF/cCdNRMi340gxA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WsAignx8r2McRfA7Gd7d9sWBNv3e9epcnF6xvP1VxCojnUjrJmLk/H3yXmzZR4VJq
	 p9i4FBHI608hH2wTK6HxuxrBT0iadscqTRzPnMIqglUITRuifDqEwfr+WlagDYpqbM
	 F7ymCft7h0nr3W08xUGj14MFH9ct0Unl1FSnS0kAft8+ZZSDrwG+o0cSW9aRXlzNEy
	 wxaFtK2xtIBt0hbvbeM6YAg4ov+LD2Ldhe8JqHsMmx0JjYZsa5ciBCF9NlFFls39hC
	 C/ZBqfejZ7j7XijDA9X65kYfBS45yfw700j47s/O9SWIQjRquuqxHvfbZi0UIvpMss
	 Pskfrfcf4TL3Q==
Subject: Re: [PATCH net 2/2] seg6: drop the packet if no outer source address
 is available
From: netdev-bot+sashiko@kernel.org
To: justin.iurman@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 andrea.mayer@uniroma2.it
Date: Mon, 16 Nov 2026 03:41:13 +0000
Message-ID: <179480047386.3136.1354948992890219716@kernel.org>
In-Reply-To: <20261115000047.14669-3-justin.iurman@gmail.com>
References: <20261115000047.14669-3-justin.iurman@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes the seg6 lwtunnel and seg6local callers, but
  the BPF callers of the same encap path can still send the packet.

--

seg6: drop the packet if no outer source address is available

With this change, set_tun_src() returns the error from ipv6_dev_get_saddr()
instead of ignoring it. __seg6_do_srh_encap() and seg6_do_srh_encap_red()
now return early on that error, so that a packet is not sent with stale
headroom bytes as its outer source address.

> diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
> index 3bc47c5614ff4..395614fdb83f3 100644
> --- a/net/ipv6/seg6_iptunnel.c
> +++ b/net/ipv6/seg6_iptunnel.c

[ ... ]

> @@ -213,7 +216,9 @@ static int __seg6_do_srh_encap(struct sk_buff *skb, struct ipv6_sr_hdr *osrh,
>  	isrh->nexthdr = proto;
>  
>  	hdr->daddr = isrh->segments[isrh->first_segment];
> -	set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
> +	err = set_tun_src(net, dev, &hdr->daddr, &hdr->saddr, route_tunsrc);
> +	if (unlikely(err))
> +		return err;

[Severity: Medium]
Does every caller of seg6_do_srh_encap() drop the skb when this returns an
error?

At this point __seg6_do_srh_encap() has already called skb_push(skb, tot_len).
It has also rebuilt the network and mac headers and copied the SRH. On
failure, hdr->saddr is still unwritten, because ipv6_dev_get_saddr() only
writes *saddr on success. The payload_len write and skb_postpush_rcsum() are
skipped, and the push is not undone.

The lwtunnel paths (seg6_input_core() and seg6_output_core()) and
input_action_end_b6_encap() free the skb on error. bpf_push_seg6_encap() in
net/core/filter.c does not:

net/core/filter.c:bpf_push_seg6_encap() {
    ...
	case BPF_LWT_ENCAP_SEG6:
		skb_reset_inner_headers(skb);
		skb->encapsulation = 1;
		err = seg6_do_srh_encap(skb, srh, IPPROTO_IPV6);
		break;
    ...
	bpf_compute_data_pointers(skb);
	if (err)
		return err;
    ...
}

This function is reached from bpf_lwt_push_encap(BPF_LWT_ENCAP_SEG6) in
LWT_IN programs, and from bpf_lwt_seg6_action(SEG6_LOCAL_ACTION_END_B6_ENCAP).
The second caller expects the header to stay in place after an error:

	err = bpf_push_seg6_encap(skb, BPF_LWT_ENCAP_SEG6,
				  param, param_len);
	/* The header can be in place although err says otherwise */
	bpf_update_srh_state(skb);

	return err;

On this path, can the BPF program read the 16 uninitialized saddr bytes and
the stale payload_len through direct packet access? bpf_skb_generic_push()
zeroes pushed space to avoid exactly this.

If the program ignores the helper's return value and returns BPF_OK, it looks
like input_action_end_bpf() still forwards the skb. seg6_bpf_has_valid_srh()
passes because the SRH was copied before the failure, and the skb then goes
through seg6_lookup_nexthop() and dst_input(). run_lwt_bpf() treats BPF_OK
the same way.

In that case, would the packet still go out with stale headroom as its outer
source address, a wrong payload_len, and an inconsistent CHECKSUM_COMPLETE
csum? This is the case the commit message describes as fixed.

This can be triggered when no per-route or per-netns tunsrc is set and
ipv6_dev_get_saddr() returns -EADDRNOTAVAIL. Examples are a link-local or
multicast first SID, or use_oif_addrs_only set, with no usable address on
the egress device.

The commit message says:

    Return the error from set_tun_src() and drop the packet; all callers
    of the encap functions already handle their errors.

That does not seem to hold for the BPF callers. Would it be better to resolve
the tunnel source into a local struct in6_addr before skb_cow_head() and
skb_push()? Then a failed encap would leave the skb untouched for every
caller.

>  
>  #ifdef CONFIG_IPV6_SEG6_HMAC
>  	if (sr_has_hmac(isrh)) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115000047.14669-1-justin.iurman%40gmail.com

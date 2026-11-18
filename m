Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015522;
	b=veTpEaLtNCmbS6c0OOEyoOOluI8Ypim3cYf73j0oSFZB6bjAioHnpsDeYO4BPeqb7kca
	 xo9DPMuMi9hMVR9HmBaKMkGolNER9+cWr86dDm87Yeg8WcvZETSXfhYEIBm2buWLKekhj
	 gem5wxBXtoMKSCXAkpqMDpV+TVbU+0HODrH8MQo5owOa6ISBEL4K7xxkRr72D2T0mPagT
	 tgcKcfIiN5SwGY7EjNucBqeidLrXjFd0H5Y1qpRT3OwQ3rnuUuhe9NNFrPbTJTqToK8BP
	 MeoxUwxTQNF41+LVFEOFzxDTKbs/OpyOnyOPz8XBfVJqxn4mkGKt6bmRy5FB9svM5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015522;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=W3Mvq/V/FTM8oAlqR9lvj/DYhM4Cp9mepGfr85l/rQA=;
	b=jx7TZqW3acH70MZMUgOd0Cr8/9+zzflG5oJzN2cEdmxAiUckTvr9TYA/9+eYM6D4Tqko
	 /SLa1UnDE8nOoJYhrBAxHOMASFxJa4zxT4RA7g8kTw8D2VJEhq4yGHuJ9VswddZ2zkwza
	 zz8swONuoMmWU+rx9dKqZ3AT5hWkJyVFZQiw8zXWVGH/tr+X7LhCSYQEkp0a0+lGOGM71
	 cyJ6Tlc0kTjKqqQO6YYq4wbxh7NqiMIf/Qnmyl5bzMons8/B1pRnohojKCzqmeXkYGYRh
	 YNDdMxoHGdJvbXhFSnkfJmYWzS3e5a0SQ5DmfehB3ZG7reGSKvSO/6cDc0AgEUlANuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DoBqXlMg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC460A261E
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DoBqXlMg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A20E1F000C7;
	Wed, 18 Nov 2026 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015522;
	bh=W3Mvq/V/FTM8oAlqR9lvj/DYhM4Cp9mepGfr85l/rQA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DoBqXlMgjBTOeEf6+1v0+jRMxC7AbPhuZBJFruOd78MvouWw7tUVUuT2dkiVpdXsI
	 +uYxy3hTtAiA3RWbYKlSSLcbi7+VjvWQABXNDp0jQLttCyCLxFP7i4/npnsrhvNaPj
	 M61KKnv3WfGrvvsRPQTFMCqZk+PcBeGcE5UX0IcHs8pt5k2LCPQuw9vjhkJy3VhLKY
	 HxTiQCxVI2T356KKMuCFDMIPETKP7E1E3ue4X9bQCsdz+F9+F00jp4VOH3WCP+ziFt
	 vEhbzuQ4glcaChyizxd/ty3JYYiBpDE51GBU0P+V0n/Lgv3IIttONTDBDYklX6VK7a
	 Cqj8joyC5MllA==
Subject: Re: [PATCH net] ipv4: don't let the transport header offset wrap
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, kuniyu@google.com, netdev@vger.kernel.org,
 josef@toxicpanda.com
Date: Wed, 18 Nov 2026 15:25:20 +0000
Message-ID: <179501552093.3136.9815450954820570467@kernel.org>
In-Reply-To: <20261118004850.52808-1-mason@kernel.org>
References: <20261118004850.52808-1-mason@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The IPv4 xfrm transport-mode (ESP/AH) receive path still lets
  the transport header offset wrap, and the wrapped value still reaches…
- [Medium] Sibling receive paths still compute the transport header with
  the unchecked 16-bit addition this patch removes from ip_rcv_core().
- [Low] The new drop path in ip_rcv_core() (net/ipv4/ip_input.c:576)
  reports SKB_DROP_REASON_PKT_TOO_BIG.

--

ipv4: don't let the transport header offset wrap

This patch replaces the unchecked 16-bit transport_header computation in
ip_rcv_core() with skb_set_transport_header_careful(). If the offset from
skb->head doesn't fit, the packet is dropped. The helper computes the
offset from skb->data, so it also catches a network_header that was
already truncated.

> diff --git a/net/ipv4/ip_input.c b/net/ipv4/ip_input.c
> index 9860178752b8c..3970438933764 100644
> --- a/net/ipv4/ip_input.c
> +++ b/net/ipv4/ip_input.c
> @@ -572,7 +572,11 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
>  	}
>  
>  	iph = ip_hdr(skb);
> -	skb->transport_header = skb->network_header + iph->ihl*4;
> +	if (!skb_set_transport_header_careful(skb, iph->ihl * 4)) {

[Severity: High]
After this check passes, can the transport header offset still wrap on the
IPv4 xfrm transport-mode (ESP/AH) receive path?

ip_rcv_core() only validates the outer header. After that,
esp_input_done2() pulls the ESP header and IV, and then sets the transport
header relative to the new skb->data:

net/ipv4/esp4.c:esp_input_done2() {
    ...
	skb_pull_rcsum(skb, hlen);
	if (x->props.mode == XFRM_MODE_TUNNEL ||
	    x->props.mode == XFRM_MODE_IPTFS)
		skb_reset_transport_header(skb);
	else
		skb_set_transport_header(skb, -ihl);
    ...
}

Next, xfrm4_transport_input() moves the IP header and resets the transport
header without a check:

net/xfrm/xfrm_input.c:xfrm4_transport_input() {
    ...
		skb->network_header = skb->transport_header;
	}
	ip_hdr(skb)->tot_len = htons(skb->len + ihl);
	skb_reset_transport_header(skb);
    ...
}

This stores (u16)(N + ihl + hlen), where N is the outer IP header offset
from skb->head. Suppose N + ihl <= 65534, which passes the new check, but
N + ihl + hlen >= 65536. For ihl = 20 and hlen = 16 that is N in
[65500, 65514]. Then transport_header wraps to a small value while
network_header still fits.

The skb is then re-injected without going back through ip_rcv_core():

xfrm4_transport_finish()
  NF_HOOK(NFPROTO_IPV4, NF_INET_PRE_ROUTING, ...)
    xfrm4_rcv_encap_finish()
      dst_input()
        ip_local_deliver()
          ip_local_deliver_finish()
            __skb_pull(skb, skb_network_header_len(skb));

With the wrapped transport_header, skb_network_header_len() returns
0xFFFF0000 + ihl as a u32. __skb_pull() then raises skb->len by
65536 - ihl, so the skb->len < skb->data_len BUG() never fires. It also
moves skb->data about 4 GiB forward on 64-bit, or wraps it back toward
skb->head on 32-bit. The protocol handler then dereferences skb->data.

This needs a transport-mode SA and an ESP/AH packet that authenticates
against it. It also needs a head offset near 64 KiB, which the commit
message says nested decapsulation produces. It hasn't been reproduced at
runtime.

The subject says this wrap is fixed for IPv4. Should the series also
cover xfrm4_transport_input() and the esp4/ah4 transport-mode paths?

[Severity: Medium]
The unchecked 16-bit addition that this patch removes from ip_rcv_core()
is still present in several sibling receive paths:

net/bridge/br_netfilter_hooks.c:br_nf_pre_routing() {
    ...
	skb->transport_header = skb->network_header + ip_hdr(skb)->ihl * 4;
    ...
}

net/bridge/br_netfilter_ipv6.c:br_nf_pre_routing_ipv6() {
    ...
	skb->transport_header = skb->network_header + sizeof(struct ipv6hdr);
    ...
}

net/ipv6/ip6_input.c:ip6_rcv_core() {
    ...
	skb->transport_header = skb->network_header + sizeof(*hdr);
    ...
}

The commit message says:

    So it also catches a packet whose network_header was already
    truncated, where network_header + ihl * 4 would look valid.

Does that hold only for native IPv4 input?

After VXLAN, GENEVE or gretap decapsulation, bridged traffic reaches
NF_HOOK(NF_INET_PRE_ROUTING) from br_nf_pre_routing() and never passes
through ip_rcv_core(). The outer header can pass the new check just under
the limit, and the tunnel then pulls about 50 more bytes.

br_validate_ipv4() is a copy of the ip_rcv_core() checks, but it still
validates ip_hdr(skb), which is based on network_header. If network_header
was truncated, it validates stale bytes, and the netfilter hooks see a
wrapped transport_header.

For IPv6, transport_header can wrap to 0..39, below network_header. That
looks like it would cause:

- ipv6_parse_hopopts() in net/ipv6/exthdrs.c reads
  skb_transport_header(skb)[1] from stale bytes at the start of the head
  buffer.
- ip6_parse_tlv() starts from a negative skb_network_header_len() offset,
  so the jumbo, RA and IOAM handlers act on stale bytes.
- Local delivery drops the packet, because
  pskb_pull(skb, skb_transport_offset(skb)) in ip6_protocol_deliver_rcu()
  gets a huge length.

If network_header is truncated, IPv6 validation, route lookup and
PRE_ROUTING/FORWARD filtering all run on stale bytes. Forwarding still
sends the real bytes at skb->data.

Could filtering and routing decisions be made on one header while
different bytes are forwarded? Should br_nf_pre_routing(),
br_nf_pre_routing_ipv6() and ip6_rcv_core() get the same treatment in
this series?

> +		drop_reason = SKB_DROP_REASON_PKT_TOO_BIG;

[Severity: Low]
This isn't a bug, but is SKB_DROP_REASON_PKT_TOO_BIG the right reason
here? include/net/dropreason-core.h documents it as:

	 * @SKB_DROP_REASON_PKT_TOO_BIG: packet size is too big (maybe exceed the
	 * MTU)

By this point the packet has been trimmed to tot_len and has passed every
length check, so it can be a minimal 20-byte datagram. The failing
condition is that skb->data - skb->head + ihl * 4 doesn't fit in the
16-bit transport_header. That is about buffer layout, not packet size.

The other in-tree users of this reason are size or MTU checks, for example
in ip6_output.c, openvswitch actions.c and xfrm_iptfs.c. As a result,
dropwatch and the kfree_skb tracepoint would report these drops as
size/MTU drops.

> +		__IP_INC_STATS(net, IPSTATS_MIB_INDISCARDS);
> +		goto drop;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118004850.52808-1-mason%40kernel.org

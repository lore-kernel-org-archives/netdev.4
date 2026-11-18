Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023569;
	b=RNwTHq7M0kN7llYuhIy2KDj/C/VCbErUg40+PVlxjlHyiFfqJxYYuOfDdHNCm40J4tg/
	 Vr5xErVF+LgHRVhLrf5I4OMIMhJjv/Y2lhc4czHC8K3UdDKjxGhCMuBR/HfpHjoJPPjru
	 plykskZlC17E5HBYk18EjgyvbSnNL13bFWxDH11+JFWA0iS4N/6PofW6H4PNnVTTUgXBV
	 FSB4aQpCoIaLlgPPEjp4pfTUx6BkHDrwHCcr1vvd1bjVst0UD1GYrt6/TnL1uP1iA/nup
	 TyrfcrR3KQGrjloAo/oM+881UZOiyAUaJwTY+D6GPHi5XMLAheWgBe0PwaZ+zvcd9OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023569;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+PqVG7MhQmqTP/NdjYjEGqbld94Z8cH2TJptRWQDgKk=;
	b=IIYCB/Q9WAiuinlMFsa5PljSV/w6wMYxSX+f2oa86s4y8RKUdRQZxo2hX7DUijpSh4pO
	 NmvwdKuF6H7Zcnq75dhR+28z/OTJKEQB6juiQ2qP52VXx9PdeMNC0Say+J8RpIXwhr9Qd
	 OSovI1bcLcjnaDYTnKo2RRy2jcjs3jIFgdallN3CWn4wpx3PPLDFQ6bokMDQAGv4UvYm+
	 B3NQ0Ox9nQYTLxXdUUqigUyq5ONY11AyTAk2lwz0rl5gzgQix7rzVoYhtJJetdy4UNXF6
	 w4Pt/OUo2wiheLdoTVI/TtKI+xUKnitgH2G+4yzkieGC0wPCe2NQQGJicepRo4XcOhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odIgW2cI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5760A260B;
	Wed, 18 Nov 2026 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odIgW2cI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143DA1F000C6;
	Wed, 18 Nov 2026 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795023569;
	bh=+PqVG7MhQmqTP/NdjYjEGqbld94Z8cH2TJptRWQDgKk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=odIgW2cIK1uIca3UKHc10d/MsJGgadnbcRypsrdIZS6AmwCf4LwwvP0nRXorWL7h3
	 3DgeePmQDMgHgHLnSye5tf1JkH1yUE96s8MFPauWtAk7NQztHjWlR76ug+8kuI09aL
	 maV0xakpsIbbLgSINnZmNf65Eac8ZqlQGpwNUs0NgjAI2hMhwRNwNtE6KCJ6Cr0nZC
	 jvYCbjU9ULS+hwTSKMvusP7Pl4Bl9zdouNiVt819iN/iwN7vqjurt7IFkMDJwx/6qF
	 IKiMT1yLdtFFZ1T5sdudZ/fs7GTQsuRJ97Dtl0deBd5QrVFmwNbM6E1mxFKLHweyJ4
	 HZHt6CClVp0XA==
Subject:
 Re: [PATCH] net: prevent receive header offset overflow during decapsulation
From: netdev-bot+sashiko@kernel.org
To: carges@cloudflare.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 june@cloudflare.com, danjones@cloudflare.com, jbrandeburg@cloudflare.com,
 josef@toxicpanda.com, mason@kernel.org, kernel-team@cloudflare.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Date: Wed, 18 Nov 2026 17:39:27 +0000
Message-ID: <179502356763.3136.15330216541876894208@kernel.org>
In-Reply-To: <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
References: <20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994@cloudflare.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new SKB_MAX_RX_HEADROOM (32 KiB) checks run in only three
  places: when __netif_receive_skb_core() is entered…

--

net: prevent receive header offset overflow during decapsulation

This patch limits receive headroom to 32 KiB (SKB_MAX_RX_HEADROOM). The
goal is to keep the 16-bit skb header offsets from being truncated after
repeated decapsulation. The check runs on entry to
__netif_receive_skb_core() and at the resubmit points of
ip_protocol_deliver_rcu() and ip6_protocol_deliver_rcu(), and drops
packets with the new SKB_RX_HEADROOM drop reason.

[ ... ]

> diff --git a/net/core/dev.c b/net/core/dev.c
> index 3c58db732761a..6140fd9d11cd0 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -6223,6 +6223,10 @@ static int __netif_receive_skb_core(struct sk_buff **pskb, bool pfmemalloc,
>  	trace_netif_receive_skb(skb);
>  
>  	orig_dev = skb->dev;
> +	if (unlikely(skb_headroom(skb) > SKB_MAX_RX_HEADROOM)) {
> +		drop_reason = SKB_DROP_REASON_SKB_RX_HEADROOM;
> +		goto drop;
> +	}

[Severity: High]

This check runs once, when __netif_receive_skb_core() is entered. That is
before the another_round label, sch_handle_ingress(), vlan_do_receive()
and the rx_handler call.

Can headers stripped later in the same receive pass still push the 16-bit
header offsets past U16_MAX?

For example, tc act_mpls with TCA_MPLS_ACT_POP calls skb_mpls_pop() once
per action. Each call stores the current headroom into the u16 header
fields:

net/core/skbuff.c:skb_mpls_pop() {
    ...
	__skb_pull(skb, MPLS_HLEN);
	skb_reset_mac_header(skb);
	skb_set_network_header(skb, mac_len);
    ...
}

Outside CONFIG_DEBUG_NET, the only guard in those helpers is
DEBUG_NET_WARN_ON_ONCE(), so the value gets truncated silently.

The number of pops per pass doesn't look bounded:

  - a filter can hold up to 32 actions
  - a filter whose action control is continue returns a negative result,
    and __tcf_classify() moves on to the next tcf_proto without counting
    it toward max_reclassify_loop (that limit only covers the
    TC_ACT_RECLASSIFY / TC_ACT_GOTO_CHAIN reset path)
  - about 512 matchall or flower filters with 32 pops each comes to
    roughly 16K pops in one pass

veth_setup() sets dev->max_mtu = ETH_MAX_MTU. A frame of about 65.5 KB
carrying about 16K MPLS labels, sent with AF_PACKET on one veth end, would
reach __netif_receive_skb_core() on the peer with about 30 bytes of
headroom and pass this check.

tc ingress could then pop the labels while skb_ensure_writable() keeps
pulling data from the frags into the linear head. At some point
mac_header and network_header would wrap past U16_MAX.

After the wrap, the remaining skb_mpls_pop() calls would run memmove(),
skb_postpull_rcsum() and skb_mod_eth_type() at the truncated offsets.
ip_rcv_core() would then read ip_hdr() from stale bytes and set
transport_header from that position. L4 code could then misparse the
packet, for example in tcp_data_queue():

	__skb_pull(skb, tcp_hdr(skb)->doff * 4);

Here doff comes from the wrong bytes, so could this wrap skb->len or hit
the BUG() in __skb_pull()?

This setup needs only CAP_NET_ADMIN and CAP_NET_RAW in a netns owned by a
user namespace.

Similar in-pass header strips look possible elsewhere:

  - openvswitch pop_mpls with recirculation, where
    ovs_dp_process_packet() runs again without re-entering
    __netif_receive_skb_core()
  - bpf_skb_adjust_room() shrinking, which adds len directly to
    mac_header and network_header

The commit message says:

    Together, these checks
    prevent 16-bit header-offset truncation in cases of repeated
    decapsulation.

Is that still accurate given these paths?

Would it be more robust to bound the offset where it is stored, either in
the skb_set_*_header() / skb_reset_*_header() helpers or in the pop/shrink
helpers, instead of only at the chosen re-entry points?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-prevent_rx_header_offset_overflow-v1-1-92a5be55f994%40cloudflare.com

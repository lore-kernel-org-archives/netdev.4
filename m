Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459216;
	b=HOSVe8LIAbK9nai9d/DypXz5Rj4DWl48u3XgTDHgUImsvumVNgwt0RM9PsBHn9dr3368
	 8v7vWOnuc0zdOCgPzDUdis24zPUh1MIjZZwB9yhUiPkzaZTIDZ8UYBGIag/jKs/1WyhCL
	 iY4vutGOs9xmg9gCExwQFAcHQ/InVQ/saHV9vLoMfM3w2VUUQ5zQKjIiv4+UNjINwi6ve
	 SVGSkoLEsrTtBU/hzMYVqm8sITlbiv6FXWTwTCvtpQTQomMqIxCVEDX4b+IheESDfWxHC
	 7q7NmdjktVYLX2FMcnu/Dr7af3B5IdiTuEN5zakLUEanmmKdGIx08Md6tOVh27PBA2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459216;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=97n/AA44OWEFHAxhIbrtHJJ0Jb7k6ivcJGdUSEplDWU=;
	b=MQJI0h0MNj0nrDqEB2mhn2bGQ5YMj9R1vJeB2PFzx5EImNBHbMyGeIZvH041F124Ef37
	 RN9NYIMSDd53juBGjkH36YsCJSnIhF6cV5oIMqSknrkaN3NRXvji44xflsNL4dAj6q7EY
	 OA9zsRDCHA2ofXW+gRQfMp8g5u0ponN14l7CUWJeUDA0k2G2sVvCDkD2XKQrVEocZfOCM
	 dMeaUCI332VfIHErLgSAalyriKNK4uHrThRKELtE4yU4Sva/6yx3RvpZJPpjCeuyWNYOI
	 lROYqNesQjjf1Tbn/q/GofbPrAELDV2NmxctNdVGa14m2OW03YgH+5xG4uzrCukSK7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9jy3mg7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D5606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9jy3mg7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96A11F000CF;
	Mon, 23 Nov 2026 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459215;
	bh=97n/AA44OWEFHAxhIbrtHJJ0Jb7k6ivcJGdUSEplDWU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A9jy3mg70bfhipdHr1f6Gjr3jKKYux/gZDGREMVky1I3aZgo+6zADncbVQYP3Xv01
	 rFm0BC3xDxiK/g4NmU7HLkznPPf9xpD1QyvETpl+DNVSVSeBcgrw4Vtk4KhuuNxewa
	 rxFiBKpzAGppzzkYu7lZ7+A71/i1bAc4hpQNMg48PZd2v4YnQVT84WGU9lvFEU93fY
	 70a9TbUc6HeoyqeLRUx950weTrRqiWAIgqjRh2ypGR9/4pQzsQ6E+TedcrEQ5ial2a
	 idTnnyd/fGOTEePVmP1OhkMa2beefjbG7J7eUNafaSysyvjavhCImYlirxwtjxNLJv
	 OWcUJasQaaIUg==
Subject:
 Re: [PATCH net] udp: gro: do not match tunnel-processed and plain packets
From: netdev-bot+sashiko@kernel.org
To: aviralyash27@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, willemb@google.com, horms@kernel.org
Date: Mon, 23 Nov 2026 18:40:14 +0000
Message-ID: <179545921450.3135.6404804724515356262@kernel.org>
In-Reply-To: <20261122183951.73210-1-aviralyash27@gmail.com>
References: <20261122183951.73210-1-aviralyash27@gmail.com>
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

- [Medium] The Fixes: tag covers only the out-of-bounds read, not the
  older mis-merge bug.
- [Low] The new comment and the commit message both say encap_mark is set
  for any tunnel-processed packet; FOU and GUE clear it.

--

udp: gro: do not match tunnel-processed and plain packets

With this patch, udp_gro_receive_segment() skips held packets whose
NAPI_GRO_CB()->encap_mark differs from the incoming skb. A plain UDP
datagram is then no longer compared against, or merged into, a held
packet that went through a vxlan/geneve GRO handler. For such a packet
udp_hdr(p) points at the inner L4 header.

> When the bytes read happen to match, the UDP payload is merged into the
> tunnelled TCP aggregate. With rx-gro-list and forwarding the datagram
> is then segmented and sent out with the inner flow's addresses, without
> having been seen by the forward or egress netfilter hooks.

[ ... ]

> Fixes: 4b0ebbca3e16 ("net: gro: move L3 flush checks to tcp_gro_receive and udp_gro_receive_segment")

[Severity: Medium]
Does this Fixes: tag cover the whole bug?

4b0ebbca3e16 added the gro_receive_network_flush() call, and that call is
where the out-of-bounds read comes from. The port comparison against a
tunnel-processed held packet looks older:

net/ipv4/udp_offload.c:udp_gro_receive_segment() {
    ...
		uh2 = udp_hdr(p);

		/* Match ports only, as csum is always non zero */
		if ((*(u32 *)&uh->source != *(u32 *)&uh2->source)) {
    ...
}

Blame traces these lines to e20cf8d3f1f7 ("udp: implement GRO for plain
UDP sockets.").

udp_hdr(p) points at the inner L4 header because the inner
inet_gro_receive() resets p's transport header:

net/ipv4/af_inet.c:inet_gro_receive() {
    ...
	skb_set_transport_header(skb, skb_gro_offset(skb));
    ...
}

Before 4b0ebbca3e16, flush came from NAPI_GRO_CB(p)->flush/flush_id.
inet_gro_receive() computed these by comparing the outer IP headers (ttl,
tos, DF, id) at the same offset in both skbs. The remote sender controls
all of those fields. Before 5babae777c61 there was no flush check at all.

On those kernels, can a plain UDP datagram whose ports equal the inner TCP
ports of a held vxlan packet reach skb_gro_receive() through a UDP_GRO
socket or rx-udp-gro-forwarding, without reading any out-of-bounds bytes?

If so, "when the bytes read happen to match" is only true after
4b0ebbca3e16. Backporters who follow the current tag would skip 6.6, 6.1,
5.15 and 5.10, and those trees still have the cross-flow merge. The
rx-gro-list forwarding variant needs TCP fraglist GRO, so it does not apply
to those older trees.

encap_mark has existed since 2016, so the check should backport easily.
Would it make sense to add:

Fixes: e20cf8d3f1f7 ("udp: implement GRO for plain UDP sockets.")

and keep the current tag for the out-of-bounds read? The message could
then say that on older kernels the mis-merge does not need the
out-of-bounds read.

> diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
> index b77ae2f00c626..160b60005a1b6 100644
> --- a/net/ipv4/udp_offload.c
> +++ b/net/ipv4/udp_offload.c
> @@ -723,6 +723,17 @@ static struct sk_buff *udp_gro_receive_segment(struct list_head *head,
>  		if (!NAPI_GRO_CB(p)->same_flow)
>  			continue;
>  
> +		/* encap_mark is set once a packet has been through a tunnel
> +		 * GRO handler (vxlan, geneve, ...). For such a packet
> +		 * udp_hdr() points at the inner L4 header and its network
> +		 * offsets describe the inner packet, so it must not be
> +		 * compared with a packet that has not been through one.
> +		 */
> +		if (NAPI_GRO_CB(p)->encap_mark != NAPI_GRO_CB(skb)->encap_mark) {

[Severity: Low]
Is this comment accurate for FOU and GUE? The commit message makes the same
claim:

  NAPI_GRO_CB()->encap_mark records whether a packet has been through a
  tunnel GRO handler.

fou_gro_receive() and gue_gro_receive() in net/ipv4/fou_core.c both clear
the mark after tunnel processing:

net/ipv4/fou_core.c:gue_gro_receive() {
    ...
	NAPI_GRO_CB(skb)->encap_mark = 0;

	/* Flag this frame as already having an outer encap header */
	NAPI_GRO_CB(skb)->is_fou = 1;

	ops = fou_gro_ops(sk, proto);
    ...
}

For GUE version 0, the sender chooses proto through guehdr->proto_ctype.
With IPPROTO_UDP, the packet reaches
udp4_gro_receive()->udp_gro_receive_segment() with encap_mark == 0. No
inner IP layer runs, so the transport header stays on the outer UDP
header.

Two such GUE-direct-UDP packets have equal encap_mark, but the headers
being compared are from different layers. uh from udp_gro_udphdr(skb) is
the inner UDP header. udp_hdr(p) is the outer GUE UDP header.

If the sender sets the inner ports equal to the GUE port, can the packet
match any held GUE-direct-UDP aggregate of the same outer flow, whatever
its inner ports are?

This path has no out-of-bounds read, because the offset difference is only
the outer IP header length. The cross-inner-flow merge also predates this
patch. Still, the invariant stated in the new comment and in the commit
message does not hold for FOU/GUE.

Could the comment say that encap_mark tracks whether an inner network layer
was processed, rather than tunnel processing in general? Alternatively,
could the check also compare is_fou?

> +			NAPI_GRO_CB(p)->same_flow = 0;
> +			continue;
> +		}
> +
>  		uh2 = udp_hdr(p);
>  
>  		/* Match ports only, as csum is always non zero */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122183951.73210-1-aviralyash27%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537658;
	b=B4OlMVMr4o97QPYoDWjK99c6ifM7J8u8wJ2dSAQaZrKPBIrEqSAeAk/D1nZqojOJB4Vp
	 p4Mlfqzec0bHaX3ReqJY97WLgSxpN3YOg8mxePrSie64WGpoin8xt4fSnMSfs5BQrBLaa
	 54kXex6fDqeohzj8YMj6TnY1WzEp4CDmjrm6xSeUQUEeOF7cpnJEbiLcI9bTBzyQuhB6n
	 WeF8ENPs+/ZTzM9AcOqHEZQN/QrKeAskCBoB2S3yfKEiZ5u+Xu1dDTpQ/VfCo4Cm5QPSD
	 gPBfGbSsadSLm8beTGYI30G6MHb7Vir3tglxf3lzVxodKAOrdQYvfPYHP64Bt9gTzKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537658;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4L1pAx1aJ9UiuZlP1S95Mk5NDr/KAS3Rr/m1DST9u5I=;
	b=1bp0fHkNz8eBv+B4nV6om9m2IJBsoIkjobEnwgFITXOyN5OhCOhGoCs6jbuDxpU/zeUI
	 r1sJZdGHQekCWKfVIO+JjmQjIfMORtsPgjiqn0ixm8PCn4lzq4EcNUIxEtQpzHd61A71U
	 Qv0Q/7lHB5D2fTGVPIc+1OVOF4Fh+MLrWV9UDk3twVGjUcR/m48ftbds8vFxeJpmG/hPI
	 /sxc34rewC3FXUs9v2ll+tNxp8ShA499A2ZaQW0qWCT2kxaqqsP/dmHO6942sF8u/7187
	 TtNL+Of5gWzr+iXru7etwV9HmYDKf8lFGihurAJvPscQ1hpHKKj1zyIlTvt8ii66byg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MKor/yir";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B146606A338
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MKor/yir
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816371F000F2;
	Tue, 24 Nov 2026 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795537658;
	bh=4L1pAx1aJ9UiuZlP1S95Mk5NDr/KAS3Rr/m1DST9u5I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MKor/yirXmDmsFP8rvn0bTvpo2dhVP9mVLnTLa1oyYuB2yX8DHQWuGHClb7yNK9AD
	 81Z2/7JhkR36t4Hx+6b+mn2Zdgw+UihDv6x0jOKIcXBYW8Do0KD+Kh8UuqtccJ2QLB
	 sp0ueZRr2kz5PQ69dSVOa+fHTaSt9V11ssMkfMMT6Y1v7PCwrExfgZzwQdTt/sycYV
	 Tj1XHyqhtCX/QghfIU5syUydYcEnakt2THXxwFeUF0SlkI03suw8YIH3BiYleiozj2
	 fJZVzBNwy8NDm4qoIgydaeP2CMMXf3D+jjdtOewjgxj7ti3EGqXVFPmU+oiLtTtu+7
	 ghXynh5HevS9A==
Subject: Re: [PATCH net-next] tcp: use order-0 page frags in tcp_collapse()
From: netdev-bot+sashiko@kernel.org
To: edumazet@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com,
 ncardwell@google.com, horms@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 16:27:37 +0000
Message-ID: <179553765702.3135.10078888309251944054@kernel.org>
In-Reply-To: <20261123154708.360226-1-edumazet@kernel.org>
References: <20261123154708.360226-1-edumazet@kernel.org>
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

- [Medium] tcp: linear head in tcp_collapse() prevents
  TCP_ZEROCOPY_RECEIVE

--

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5983,34 +6034,47 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
>  	    sub_end - start >= TCP_COLLAPSE_MAX_TOTAL_SIZE)
>  		goto skip;
>  
> -	/* Third, check if the new skbs have high density. */
> -	nskbs = (sub_end - start) / TCP_COLLAPSE_MAX_SIZE;
> -	new_truesize = nskbs * SKB_TRUESIZE(TCP_COLLAPSE_MAX_SIZE);
> -
> -	remainder = (sub_end - start) % TCP_COLLAPSE_MAX_SIZE;
> -	if (remainder) {
> -		nskbs++;
> -		new_truesize += skb_head_truesize(remainder, GFP_ATOMIC);
> -	} else {
> -		remainder = TCP_COLLAPSE_MAX_SIZE;
> -	}
> +	/* Third, check if the new skbs have high density.
> +	 *
> +	 * Payload is stored in order-0 page frags: one sk_buff can hold
> +	 * up to MAX_SKB_FRAGS pages, and truesize stays close to the
> +	 * payload size.
> +	 *
> +	 * What does not fill a page is stored in the linear part of
> +	 * the first new skb, unless a page is cheaper.
> +	 */
> +	size = sub_end - start;
> +	linear = size & ~PAGE_MASK;
> +	if (linear > TCP_COLLAPSE_MAX_SIZE)
> +		linear = 0;
> +
> +	npages = DIV_ROUND_UP(size - linear, PAGE_SIZE);
> +	new_truesize = skb_head_truesize(linear, GFP_ATOMIC) +
> +		       npages * PAGE_SIZE;
> +	if (npages > MAX_SKB_FRAGS)
> +		new_truesize += (DIV_ROUND_UP(npages, MAX_SKB_FRAGS) - 1) *
> +				skb_head_truesize(0, GFP_ATOMIC);
>  
>  	if (old_truesize <= new_truesize)
>  		goto skip;
>  
> -	while (nskbs--) {
> -		nskb = alloc_skb(nskbs ? TCP_COLLAPSE_MAX_SIZE : remainder,
> -				 GFP_ATOMIC);
> +	while (size > 0) {
> +		int len = min_t(int, size - linear, MAX_SKB_FRAGS * PAGE_SIZE);
> +
> +		nskb = tcp_collapse_alloc_skb(linear, len);
>  		if (!nskb)
>  			goto end;
>  
>  		__skb_queue_tail(&pool, nskb);
> +		size -= linear + len;
> +		linear = 0;
>  	}
>  
>  	while (before(start, sub_end)) {
> -		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
> +		int copy;
>  
>  		nskb = __skb_dequeue(&pool);
> +		copy = nskb->len;
>  		memcpy(nskb->cb, skb->cb, sizeof(skb->cb));
>  		TCP_SKB_CB(nskb)->has_rxtstamp = false;
>  		skb_copy_decrypted(nskb, skb);

[Severity: Medium]
The changelog says the collapsed page frags can be used by
TCP_ZEROCOPY_RECEIVE. Putting the sub-page remainder in the linear
part of the first new skb seems to defeat that for the whole skb.

When 1 <= linear <= TCP_COLLAPSE_MAX_SIZE, tcp_collapse_alloc_skb()
builds an skb with skb_headlen(nskb) == linear, followed by up to
MAX_SKB_FRAGS full pages.

In tcp_zerocopy_receive(), a read offset inside the head makes
skb_advance_to_frag() return NULL. The loop then breaks with nothing
mapped, and zc->recv_skip_hint is left at skb->len - offset. That is
the entire collapsed skb, not just skb_headlen(skb) - offset.

Without a copybuf, userspace is told to copy the whole skb. With a
copybuf, tcp_zc_handle_leftover() copies min(copybuf_len,
recv_skip_hint). That copy runs past the head into frags[0] and
leaves copied_seq at a non-zero offset_frag. Every later
TCP_ZEROCOPY_RECEIVE call on that skb then bails out on the
offset_frag check as well.

The tcp_rcv_collapse_bloated.pkt example from the changelog hits
exactly this case. 30000 bytes gives linear == 1328 ahead of the 7
pages, so none of those pages can be mapped. Any multi-page range
whose remainder fits in TCP_COLLAPSE_MAX_SIZE behaves the same way,
which is most of the non page-aligned ones.

This is not a regression compared to the old all-linear skbs. But
the zerocopy benefit claimed in the changelog mostly does not
materialise.

Would it be better to keep the remainder out of the head of a paged
skb? For example, it could go in a partially used last page frag, or
in its own small linear skb. That trades a little truesize for a
layout zerocopy can use. Or is zerocopy not a goal here, so the
changelog claim should be dropped?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123154708.360226-1-edumazet%40kernel.org

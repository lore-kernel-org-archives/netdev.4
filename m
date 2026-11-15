Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715851;
	b=dNo1GcOmpR//ZDIBu3/vf172lR+nvEYBC+E+sbU3KuIXdcd4cOWv3X4CrULyaYNnD3Jw
	 +eO9kn2h2VmOOpdY9pq8MAi+l47sGzfs6AuQCuaQZWCqcwVGpQOQ67iBfxfrW1FCkxC/A
	 7HUvvy8wDX7EcoJXZLhW/y+rC+AmdnBtXnMw+8Mlx9bk6wahFfBKdVFO89EXQ/2eOLUxZ
	 P9WHb+FkH7/ZUGt8/8bSCV0aUXAQj8m/yCDkImjdn9aqgs29vN/0r4hCIVHZ2fbiBvSNO
	 cK58Ufb5H/g/RuHNMChrssalcyGFz1aEUco6hg4ikr2ace6+R2LeQ5pHhsIo07UaYRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715851;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tsLCwFlP8oV0uxIOwY1n3e/7rDkFW/5EHcAnj0k6cBU=;
	b=VZttnuGINwTYmEsKGzBUMXCjYf3HulXfWsuDWjxkYz8cXhFps5xRIIkvZ4OSmCWfo6vb
	 rZJttEL9SbGKH/MEoZKxDMcs245rSyrIdD1xnadyp+5Lqn2LwFrbgb5D/KOY3QbsOTBrG
	 zjqllp2QNNP2IzAxyUCSD7SVrfZsFUjmUrT1caFQ6ZldHye3BMcMx3YdjPEYO6yDbYapp
	 6y/t6tdHwSVpKcv47Z2txZHTBedOFe/yM8B5rovHlnnh7U38c8nyBfD9xLGfKqojdS8Pt
	 jdRVQWdBtuRN3aBLnImxgFZe3hB+XxG6DALpMjTo45mOdB/cW3kKDYDf71Du51qkGzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUVHtCPo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224B606A327
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUVHtCPo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CBC1F000C4;
	Sun, 15 Nov 2026 04:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794715851;
	bh=tsLCwFlP8oV0uxIOwY1n3e/7rDkFW/5EHcAnj0k6cBU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NUVHtCPoba7GDwYb73IYD07zpC1Is4uHZlfPm7KwsgwwteCyR6oddB194N/ouAau+
	 jLVA54EsyIbhKtq+mtocMh2mSzM4HRub7eqxYOmY15yuN/gKKo6n3cg51Z33zUpsaE
	 Aiw/nDjvyAINz663LYMuQm+RTS1zzbCKDlvJfIepyEyxGVZRbVubAhmHEAJLMsW3Gi
	 2lYUuEb1/bCdDIY1E9XW4MGGB89QpSxnq3Raeoz+jkiatuRJEBWRwQb4646vZpWijM
	 ARnSGjEQbUQNIZK7+2tnQqanlw7yF6A1As2LQOtQnU55mKHhK0KrJpUia8VgDDquee
	 5ZhD9VI69n1Jg==
Subject:
 Re: [PATCH v1 net-next 1/8] tcp: Clean up the first loop in tcp_collapse().
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Sun, 15 Nov 2026 04:10:50 +0000
Message-ID: <179471585026.2199510.8755335400317906663@kernel.org>
In-Reply-To: <20261114040101.1043546-2-kuniyu@google.com>
References: <20261114040101.1043546-2-kuniyu@google.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch is titled a clean-up, and its message presents the
  change as equivalent to the old code ("If we goto skip_this in both…

--

tcp: Clean up the first loop in tcp_collapse().

This commit restructures the first loop of tcp_collapse(). The SYN/FIN
and skb_frags_readable() checks are folded into one goto skip_this test,
and the end_of_skbs flag is replaced with the inverted loop condition.
It also moves the readability check after the fully overlapping check.

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index a2074a1af4222..32e63d089db89 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5839,23 +5839,17 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,

[ ... ]

>  restart:
> -	for (end_of_skbs = true; skb != NULL && skb != tail; skb = n) {
> +	for (; skb && skb != tail; skb = n) {
>  		n = tcp_skb_next(skb, list);
>  
> -		if (!skb_frags_readable(skb))
> -			goto skip_this;
> -
>  		/* No new bits? It is possible on ofo queue. */
>  		if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
>  			skb = tcp_collapse_one(sk, skb, list, root);
> -			if (!skb)
> -				break;
>  			goto restart;
>  		}
>  
> @@ -5864,27 +5858,25 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
>  		 * - bloated or contains data before "start" or
>  		 *   overlaps to the next one and mptcp allow collapsing.
>  		 */
> -		if (!(TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) &&
> -		    (tcp_win_from_space(sk, skb->truesize) > skb->len ||
> -		     before(TCP_SKB_CB(skb)->seq, start))) {
> -			end_of_skbs = false;
> +		if (!skb_frags_readable(skb) ||
> +		    TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN))
> +			goto skip_this;

[Severity: Low]
The commit message describes this as an equivalent clean-up:

  If we goto skip_this in both cases, we can remove the second
  tests and simply replace end_of_skbs with the inverted loop
  condition.

Is that true for SYN/FIN skbs? Before this patch, take a SYN or FIN skb
whose readable successor n overlaps it and is allowed by
tcp_skb_can_collapse_rx(). That skb reached the second break with
end_of_skbs = false:

	if (n && n != tail && skb_frags_readable(n) &&
	    tcp_skb_can_collapse_rx(skb, n) &&
	    TCP_SKB_CB(skb)->end_seq != TCP_SKB_CB(n)->seq) {
		end_of_skbs = false;
		break;
	}

The post-loop test then returned early:

	if (end_of_skbs ||
	    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) ||
	    !skb_frags_readable(skb))
		return;

So nothing in the head..tail range was collapsed in that call. The
post-loop SYN/FIN test was not redundant.

With this patch every SYN/FIN skb goes to skip_this. start advances and
scanning continues, so later skbs in the same range can now be collapsed.
A peer can reach this path, for example with a FIN segment followed by an
overlapping segment in the ofo queue.

The readability reordering also changes behaviour. Unreadable (devmem)
skbs that lie entirely below start used to be skipped. Now they are
unlinked and freed by tcp_collapse_one(), which also increments
LINUX_MIB_TCPRCVCOLLAPSED. The message only says:

  Also, skb_frags_readable() should be tested after the fully
  overlapping check.

It gives no reason for the change.

The new behaviour looks safe as far as I can tell. The copy loop still
stops at SYN/FIN skbs, and offset stays non-negative.

Could the changelog state both the SYN/FIN change and the devmem change
explicitly, rather than presenting the patch as a pure clean-up? The first
loop at the end of the series still behaves this way, so this patch looks
like the right place to describe it.

> +
> +		if (tcp_win_from_space(sk, skb->truesize) > skb->len ||
> +		    before(TCP_SKB_CB(skb)->seq, start))
>  			break;
> -		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114040101.1043546-1-kuniyu%40google.com

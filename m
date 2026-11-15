Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715853;
	b=pXuovoEkRTEMyvvzimoiqG++XiqZzHmXUszirMczZiqvk+LF6CMmVcw13hn4anJy/Kuk
	 Cs8cejWkDg8th/pIh0Z4Xnu96U5L0mZ5ZUOd5GWssM674JtXL3A5ZFoM4EcjX8CsEyo8p
	 HxvffZxnkhJrIEegQOerAJ9lOHUJ7MnrowYznxZ2Rsn1PQmaWhjDhgbk8uXV21eLboP08
	 LVieyuY7I5vFHwt5EYNYn+eX8EimDM2XObniAqwHk8Fxc5ui3u4tX99ExS+mFEo3k7erg
	 MOLb7e8ImduqdKOlS5y9WH+dLu2rXqqUUkqYKCP0lPT0c0sT0HaFDAQASdcyXF0R4nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715853;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rlRzOAPCRngy/bL8DyI0XFpgtucuf34SjRajoMzLA/E=;
	b=HFN+LPngMGczek+/RSL06BNhQG+fd8JY4xkzoSYMLc1AvJyyezgmz/HsTfXUpSY2zoXD
	 33hZoT60ijgpnsYR2m7lwqpMIilof5x9JSeeFgTc1/138MEL8PA4nNSfnWlDQbwXb6enB
	 9tcEqXQ8wyb7ZEBbGs7D1LDCD7p6Bt5G6Ry+jRFpFjwo+JqQmGw35tNMg4JJHLzRCDiEs
	 JC4SNHWT8oH21Xb1Aoo+b7B8I0jSs0HQGVTE02VuXrnTqxikzb8sepokgI1UtAgQCAopz
	 tb23HXCk00l7ox7rt+0I3r0NgRuVxoDnzYa5xSdW4Sk0SmjtHuj0+KViFGS21x00cTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+pdlUmW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91410606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+pdlUmW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69DC1F000C4;
	Sun, 15 Nov 2026 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794715853;
	bh=rlRzOAPCRngy/bL8DyI0XFpgtucuf34SjRajoMzLA/E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c+pdlUmWLlTi0gFcX99G8ZzGMT+9/xlOUGIVlS8j/QVVxp1MfUIPdDAYkOKGubfEX
	 l2yNCe1BiBSdFDnTjZ1UvFSyJU89VnMhe2NMxT925+1gCcVO+BR561B6n+5hk/P8cO
	 SRCXQhSqOD6kcc1qTylB5OXRt4RVC6u/pp2BnNxJ9N/tCFV9J0VyCgIYCws1jlVb6m
	 HtB5AHYD+qLw2el9ComhN99f5ugqglJP6QlwDp1FGiuOEADx64ImKWKf7woQ5TJLRg
	 YD9z0c9WJ2qONRrdewSKw8GnNIUyE9ZCj2M/o7OzObG1DVcZW407ppdgqiKk9O8Pqy
	 MAulz9wJRxZcQ==
Subject:
 Re: [PATCH v1 net-next 6/8] tcp: Allocate all new skb before collapsing.
From: netdev-bot+sashiko@kernel.org
To: kuniyu@google.com
Cc: edumazet@kernel.org, ncardwell@google.com, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org
Date: Sun, 15 Nov 2026 04:10:52 +0000
Message-ID: <179471585247.2199510.2265123752105906742@kernel.org>
In-Reply-To: <20261114040101.1043546-7-kuniyu@google.com>
References: <20261114040101.1043546-7-kuniyu@google.com>
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

- [Medium] In tcp_collapse() (net/ipv4/tcp_input.c), the new
  TCP_COLLAPSE_MAX_TOTAL_SIZE cap sits inside the second operand of…
- [Low] Concern: preallocating every skb makes tcp_collapse() all-or-
  nothing per section.

--

tcp: Allocate all new skb before collapsing.

This commit changes tcp_collapse() to preallocate every replacement skb
for a section into a temporary pool before copying any data. An
alloc_skb() failure therefore no longer leaves partially-copied skbs and
duplicates in the queue. To bound the batch, the section size is capped at
TCP_COLLAPSE_MAX_TOTAL_SIZE (16 skbs). The exceptions are a single bloated
skb and overlapping OOO skbs.

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index fe71305f6e673..9f32577b0b53c 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c

[ ... ]

> @@ -5908,8 +5911,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
>  
>  		/* seq and end_seq must increase monotonically for rbtree. */
>  		if ((list || !before(TCP_SKB_CB(n)->seq, sub_end)) &&
> -		    !tcp_collapse_skb_bloated(n, sub_end,
> -					      TCP_COLLAPSE_SCALING_RATIO))
> +		    (TCP_SKB_CB(n)->end_seq - start >= TCP_COLLAPSE_MAX_TOTAL_SIZE ||
> +		     !tcp_collapse_skb_bloated(n, sub_end,
> +					       TCP_COLLAPSE_SCALING_RATIO)))
>  			break;
>  
>  		sub_end = TCP_SKB_CB(n)->end_seq;

[Severity: Medium]

Can the TCP_COLLAPSE_MAX_TOTAL_SIZE cap ever stop the section on the OOO
overlap path?

For the OOO rbtree (list == NULL), suppose n partially overlaps the
section, so n->seq < sub_end and n->end_seq > sub_end. Then the first
operand of the && is false. Neither the cap nor tcp_collapse_skb_bloated()
is checked, and sub_end keeps growing.

The peer controls seq and end_seq. tcp_data_queue_ofo() keeps partially
overlapping segments in the tree:

net/ipv4/tcp_input.c:tcp_data_queue_ofo() {
    ...
			if (after(seq, TCP_SKB_CB(skb1)->seq)) {
				/* Partial overlap. */
				tcp_dsack_set(sk, seq, TCP_SKB_CB(skb1)->end_seq);
			} else {
    ...
}

So a chain of segments, each starting just before the previous one ends,
can turn into a single section. Its size is limited only by the OOO memory
of the socket.

Only the first skb has to be bloated. The overlap also inflates
old_truesize, so the old_truesize > new_truesize check is easy to pass.

> @@ -5932,14 +5938,19 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
>  		goto restart;
>  	}
>  
> -	while (before(start, sub_end)) {
> -		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
> -		struct sk_buff *nskb;
> -
> -		nskb = alloc_skb(copy, GFP_ATOMIC);
> +	while (nskbs--) {
> +		nskb = alloc_skb(nskbs ? TCP_COLLAPSE_MAX_SIZE : remainder,
> +				 GFP_ATOMIC);
>  		if (!nskb)
>  			goto end;
>  
> +		__skb_queue_tail(&pool, nskb);
> +	}

This loop then allocates every replacement skb with GFP_ATOMIC. All of
them sit in pool before any source skb is freed or any new skb is charged
to the socket.

Before this patch, alloc_skb() alternated with
tcp_collapse_one()->__kfree_skb(), so only about one extra skb was in
flight at a time. Now the number in flight is about
ceil((sub_end - start) / TCP_COLLAPSE_MAX_SIZE). With one-byte overlaps and
typical MSS truesize, that is roughly 0.7x the OOO memory of the socket,
on top of the existing queue.

A larger all-or-nothing batch is also more likely to fail under the memory
pressure that triggers collapse. In that case goto end frees the pool and
tcp_prune_queue() falls back to tcp_prune_ofo_queue().

The commit message does mention this exception:

  except when a single bloated skb or overlapping OOO skbs
  must be collapsed together to free the original skb or keep the
  rbtree monotonic.

However, the size of the overlapping OOO case is controlled by the peer
and bounded only by the OOO queue. Should the overlap path be bounded as
well? If not, could the commit message say that this exception is not
covered by the bound on the temporary allocation?

[Severity: Low]

Each section is now all-or-nothing. A single alloc_skb() failure in this
loop jumps to end, and nothing is reclaimed for this section or for any
later one. Even in the capped case, up to 16 skbs (about 70 KiB on 4 KiB
pages) are held before any source skb is freed.

The unused skbs are released by __skb_queue_purge_reason() at end, so
nothing leaks.

The commit message describes this tradeoff ("It is only when all
candidates are properly collapsed that we can save memory" and "a small
tradeoff to bound the temporary allocation"). The goto end on allocation
failure was also already there before this patch.

Is it intended that one failed batch also skips the remaining sections,
rather than only the current one?

> +
> +	while (before(start, sub_end)) {
> +		int copy = min_t(int, TCP_COLLAPSE_MAX_SIZE, sub_end - start);
> +
> +		nskb = __skb_dequeue(&pool);

[ ... ]

> @@ -5985,6 +5996,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
>  end:
>  	skb_queue_walk_safe(&tmp, skb, n)
>  		tcp_rbtree_insert(root, skb);
> +
> +	__skb_queue_purge_reason(&pool, SKB_CONSUMED);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114040101.1043546-1-kuniyu%40google.com

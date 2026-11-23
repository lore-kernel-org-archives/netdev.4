Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468740;
	b=FbhzfzftNOiVd10vtpyPSg+dNSiLoU/mOtadfXALnSTC+DNeyoN0CQUvKDEtIlI5sq1a
	 PcHvD3bjAxZ8U0a1hFbbvRH4zVlEqiOWd8/mhY3TqU7mCUQSaWt9J36nq1b167+BUc2Ud
	 7rBXlOGHVwFe8enYDBDWstG1XYSildyIuwDNAJHxjvJZl6VQRW2KHDxyQHZQsUEGMOzWc
	 0SQ6uXjVSP5R6EEIe3m0BEaOc3AB0D4gIYDnUAU6ZSTvj+CubrNgbhAWMgaTGrh0OEdSj
	 9ZMcXDWavA1Vyue0SB0vpWY+JLcj8Xi1dBzLm1lOJjBVl0yykJNkXq7S6JgUGyIWBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468740;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=qEIinZtcBAYEv52+JOKWtbTYLe1Rs9Vkqc2XQn0JmQ4=;
	b=ISlmJTTOWEuUhudtKWoqpvofHxFex+Xp8W+rN5t/2Vb2xCZ8BUPOCHYzmBNTLYsLcrgg
	 EWBgnQXL1gD0/kPtBYO7PTJcxFDGCrFSkOlWwLg0gSVUYmmEL2pSGwaSBxsgtHMIwlBSF
	 T5tZtNPhM8wj2r8M++HcTzUhiYbZap0bY4RdDzXZnA/sKyeaABP6IQfYMsjkKsbWhjueg
	 wKBaOD2QM4loEdVcQFtDv5PWlgPBGZ3x63pRJ48oNNhrdhtRcRjU87MU4chmuPqk4wHFh
	 FolQrjrAdnZujrWzQpDpkntB9WaZK8+zM0z2BPjbUM5UOeHDyCkQjLWHow/fXi6AnbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYLtC2ty;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F28606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BYLtC2ty
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D8A1F000D2;
	Mon, 23 Nov 2026 21:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468740;
	bh=qEIinZtcBAYEv52+JOKWtbTYLe1Rs9Vkqc2XQn0JmQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BYLtC2ty0GG92t+7DLPgLeK9gS5u/4wdWB2fLUlJh4AfEu32iwZDYcKlkBx5U2tQE
	 eW1yrtg3ipNebVp+GTbTtLBniRDWlJF0oAARU4inhn3NGHiBu0X+ncmemfhiiSUGEu
	 XTAleKMXAh3zbAzoPLZpKqND+n+dC4bSjWnRAlolp+NNssrZnHjGyHvrMZQcsy98rp
	 oVZD1ONlWkl/ebt8nMsEMzePJTybnn9vg53f3zx84B4V0zTDUR7ifqWQZ9ce9KfiFN
	 XjR7RnktlzjKDVOFxhSbqtM5EBvMnBjn1zMDhQDE/PysJzaya2BnKPm6JXq0YRZQov
	 mxjfcgxQHeeDA==
Subject: Re: [PATCH net] net: avoid clobbering active cork flowi union on
 datagram connect
From: netdev-bot+sashiko@kernel.org
To: dmnk@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, kuniyu@google.com, horms@kernel.org,
 willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org,
 dmnk+artist@google.com
Date: Mon, 23 Nov 2026 21:18:59 +0000
Message-ID: <179546873902.3135.3909249766807884385@kernel.org>
In-Reply-To: <20261119192147.2640881-1-dmnk@google.com>
References: <20261119192147.2640881-1-dmnk@google.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Regression on AF_INET UDP sockets: once a datagram is corked, a
  later connect() leaves the socket sending all of its connected traffic…
- [Low] The Fixes: tag does not cover the IPv4 hunk.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it comes from
  the same root cause and limits what a connect-side guard can achieve.

--

net: avoid clobbering active cork flowi union on datagram connect

When sk->sk_write_queue holds pending corked frames, this commit stops
__ip4_datagram_connect() and ip6_datagram_dst_update() from doing the route
lookup in inet->cork.fl (and np->final). New noinline_for_stack helpers
handle that case with stack-allocated flow keys. The fast path with an
empty write queue still uses the cork flow.

> The symmetric overwrite of
> inet->cork.fl.u.ip4 in __ip4_datagram_connect() when an IPv6 or IPv4
> cork is active predates the IPv6 change (since <= v4.19).

[ ... ]

> Fixes: 4e6c91cf60f2 ("ipv6: use inet->cork.fl.u.ip6 and np->final in ip6_datagram_dst_update()")
> Cc: stable@vger.kernel.org

[Severity: Low]
Should the IPv4 hunk have its own Fixes: tag?

4e6c91cf60f2 only touches net/ipv6/datagram.c. git blame traces the
fl4 = &inet->cork.fl.u.ip4 assignment in __ip4_datagram_connect() to
3038eeac027d ("ipv4: Lock socket and use cork flow in
ip4_datagram_connect().") from 2011, so "since <= v4.19" is also not quite
accurate.

With only the IPv6 tag, stable tooling would limit the backport to trees
that contain 4e6c91cf60f2. The older trees that the message describes as
affected would not get the IPv4 change. The IPv4 question below also
applies before the backport scope is widened.

> diff --git a/net/ipv4/datagram.c b/net/ipv4/datagram.c
> index 7d25519a6cdd3..4fdad1d2e42f1 100644
> --- a/net/ipv4/datagram.c
> +++ b/net/ipv4/datagram.c

[ ... ]

> @@ -82,6 +81,25 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr, int
>  out:
>  	return err;
>  }
> +
> +static noinline_for_stack int
> +__ip4_datagram_connect_corked(struct sock *sk, struct sockaddr_unsized *uaddr,
> +			      int addr_len)
> +{
> +	struct flowi4 fl4;
> +
> +	return ____ip4_datagram_connect(sk, uaddr, addr_len, &fl4);
> +}

[Severity: High]
On a plain AF_INET UDP socket, does this leave inet->cork.fl.u.ip4 holding
the old corked destination after connect()?

The route lookup goes into the stack fl4, which is then thrown away.
inet_daddr, inet_dport and sk_dst move to the new peer. cork.fl.u.ip4
still holds what udp_sendmsg() wrote while corking:

net/ipv4/udp.c:udp_sendmsg() {
    ...
	fl4 = &inet->cork.fl.u.ip4;
	fl4->daddr = daddr;
	fl4->saddr = saddr;
	fl4->fl4_dport = dport;
	fl4->fl4_sport = inet->inet_sport;
    ...
}

The commit message calls cork.fl scratch storage for connect. For IPv4 UDP,
though, the lockless fast path in udp_sendmsg() also uses it as the
connected flow whenever the cached route is still valid:

net/ipv4/udp.c:udp_sendmsg() {
    ...
	fl4 = &inet->cork.fl.u.ip4;
    ...
	if (connected)
		rt = dst_rtable(sk_dst_check(sk, 0));

	if (!rt) {
		...
		fl4 = &fl4_stack;
		...
	}
    ...
	saddr = fl4->saddr;
	if (!ipc.addr)
		daddr = ipc.addr = fl4->daddr;
    ...
		skb = ip_make_skb(sk, fl4, ip_generic_getfrag, msg, ulen,
    ...
			err = udp_send_skb(skb, fl4, &cork);
    ...
}

ip_make_skb()->__ip_make_skb()->ip_copy_addrs(iph, fl4) fills the IP
header from that flow. udp_send_skb() takes uh->dest and the checksum
addresses from the same fl4.

The sequence would be:

  sendto(B, MSG_MORE)      cork.fl.u.ip4 = B
  connect(C)               corked branch, cork.fl.u.ip4 stays B
  flush (UDP_CORK=0 or a send without MSG_MORE)
                           udp_push_pending_frames() sends to B,
                           cork.fl untouched
  send() ...               fast path builds packets for B's address
                           and port, sent over C's route

Before this patch, connect() always rewrote cork.fl.u.ip4, so only the one
pending datagram went to the wrong place. With the patch, it looks like
every later connected send() goes to B until the route goes stale or the
socket reconnects.

The dual-stack case in the commit message doesn't seem to reach this fast
path. For v4-mapped peers, udpv6_sendmsg() always passes an explicit
sockaddr_in to udp_sendmsg(), which forces connected=0.

Would it be better to make the connected fast path in udp_sendmsg() stop
depending on inet->cork.fl.u.ip4, or to resync it after the cork is
flushed, rather than skipping the write in connect()?

> +
> +int __ip4_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
> +			   int addr_len)
> +{
> +	if (unlikely(!skb_queue_empty(&sk->sk_write_queue)))
> +		return __ip4_datagram_connect_corked(sk, uaddr, addr_len);
> +
> +	return ____ip4_datagram_connect(sk, uaddr, addr_len,
> +					&inet_sk(sk)->cork.fl.u.ip4);
> +}

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. It has
the same root cause, and a guard in __ip4_datagram_connect() can't cover
it, because no connect() happens while corked:

  connect(A)               cork.fl.u.ip4 and sk_dst = A
  sendto(B, MSG_MORE)      connected=0, sk_dst left alone,
                           corking writes B into cork.fl.u.ip4
  flush                    udp_push_pending_frames() sends to B,
                           cork.fl not restored
  send()                   connected=1, sk_dst_check() returns A's
                           route, fl4 stays &inet->cork.fl.u.ip4

That last send() builds the packet with B's saddr and daddr via
ip_copy_addrs() and B's port in udp_send_skb(), and sends it over A's
route. This keeps happening until the route goes stale or the socket
reconnects. It appears to date back to around 2011 (b6f21b268026,
9cce96df5b76, e474995f290f).

None of the functions changed by this patch run in this sequence. Could a
change in udp_sendmsg()'s connected fast path fix both this and the case
above? Options would be rebuilding or checking the flow from socket state,
or falling back to fl4_stack.

The dual-stack variant can't reach this path either, since udpv6_sendmsg()
passes an explicit sockaddr_in for v4-mapped destinations.

> EXPORT_SYMBOL(__ip4_datagram_connect);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119192147.2640881-1-dmnk%40google.com

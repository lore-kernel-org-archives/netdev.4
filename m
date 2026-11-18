Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015524;
	b=wBsBzxwx4KlvW1jJ+04JpZneKQF1o6po9G7lLhykfNUKfaXA+aaCapADQ6Zzyzxf2vn0
	 5pS2RqEimdB1OM0+0HNjx70VD21U9coBk9O28IxCVnYni5y3eLEXW3n1ugr86QoLvKrLi
	 o11WYpjc5LY9+Ib0KmoCdyFCUJhSDS6rirv2/cmjh0LXv6Wag9B4aO802bX2CdcHu9k9r
	 dt7HEhJmZmRTDUZvc5WCvMsr18l/q0cETFBgZ4TOvHch2gKzNmqQtldlElvb8zPYe1kCY
	 YVTCsRY3o26gEMVy2x5j61gWlOhGtGD62obdgtb/SkSjw7J6CkTioMdrKPJNWEzMfCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015524;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VSMvxq4N5yR8RjP6D+FF1rKlg4RSlRUvjhwSrqxukGA=;
	b=4sQNMCCugyqT1qYpqXAhEiugsdzDMUTbcPBA3TYw4h6Yoq2OY0XprzQwtVC+Xif64P7Q
	 rQiQzffMpYtu/r2otcPV0oumal7D+cFS6BhzlvQCkbGM54W/KN+/wnEoHcFZ61OqtMG2x
	 i/pYlplpJCDUv2Zh9mLr9fhk5roOrJ1Ok+YmApAMaj4Mru4nrfA7Fc39U4gBMvGsB03xZ
	 SuxCbfXT7JN9v3N8v+Ns0x4H7kXcqFTXEIava72K1CArE2SSGMNu0yZQkNEuyBOdTSbB1
	 K+PB55lfk6vAvmrk2epeMOaGThUVtytm3oE0iEhmncKI6MuZGwDplo9GkKiPIc4iCfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=od8E5wLX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750EA60A2622
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=od8E5wLX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8185C1F000C7;
	Wed, 18 Nov 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015524;
	bh=VSMvxq4N5yR8RjP6D+FF1rKlg4RSlRUvjhwSrqxukGA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=od8E5wLXedGBXCPsF7WiFDLPRLir7ASdbedDr79fUuXhKfgnD73OZRgZf4qYDHd7Y
	 r81gjmlQx0KIJ1AOY6qT3bFAnt3RLI/6xPOF53vcFTMM4yAD+KgUtZlRUwvSb1+EPp
	 QCeqOFNA+shiKrjEJLwbHFOBOlNPuJZP7L7PYuxvCwYhokub9dEJvPOo70VJoSUwl7
	 hmRM5vDr7tI03IS//mvcGp2h3WSWO01CHjDmg/RjOWZNWT6k9NHtjHXOU2ajWouUQb
	 p5fmf4tHIrbC9LC25BEEgkEnTefhPA+OzzI4VvcsawbaRZA8eTDGjO6qvmKEasUCZ3
	 jPLcOdtegwgNg==
Subject: Re: [PATCH net 1/3] tcp: don't let __tcp_set_rto() return 0
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 15:25:23 +0000
Message-ID: <179501552309.3136.7905606885338776327@kernel.org>
In-Reply-To: <20261118005048.53393-2-mason@kernel.org>
References: <20261118005048.53393-2-mason@kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2 (2)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] tcp_init_metrics() (net/ipv4/tcp_metrics.c:535-538) is a
  sibling writer of icsk_rto that does not go through __tcp_set_rto().
- [Low] The commit message blames the zero RTO only on a u32 wrap of
  (srtt_us >> 3) + rttvar_us, and it understates the impact.
- [Low] This concern is retained only because it requires validation; the
  baseline decision is false.

Pre-existing issues:
- [Low] This concern is retained only because it requires validation; the
  baseline decision is false.
- [Low] This concern is retained only because it requires validation; the
  baseline decision is false.

--

tcp: don't let __tcp_set_rto() return 0

This patch makes __tcp_set_rto() return at least 1 jiffy, so that the
exponential backoff in tcp_retransmit_timer() can always move icsk_rto
away from zero. It also rewrites the comment in tcp_set_rto() to say
where the tcp_rto_min() floor comes from.

> __tcp_set_rto() computes the RTO as (srtt_us >> 3) + rttvar_us, in u32
> arithmetic and with no lower bound. A comment in tcp_set_rto() says that
> the algorithm guarantees an RTO above TCP_RTO_MIN. But tcp_rto_min() is
> only applied to rttvar_us, so that guarantee is lost if the sum wraps.
>
> tcp_retransmit_timer() backs off by doubling icsk_rto, so the backoff
> only works if icsk_rto is nonzero.

[Severity: Low]
Is the wrap really what produces the zero here? usecs_to_jiffies() rounds
up, so __tcp_set_rto() returns 0 only when the u32 sum is exactly 0 mod
2^32. A wrapped sum that lands anywhere else still gives at least 1 jiffy.

Another trigger needs no wrap at all. ip_metrics_convert() accepts a
locked RTAX_RTO_MIN route metric of 0, and then tcp_rto_min_us(sk)
returns 0:

net/ipv4/tcp_input.c:tcp_rtt_estimator() {
    ...
    tp->rttvar_us = max(tp->mdev_us, tcp_rto_min_us(sk));
    ...
}

In that case rttvar_us can be 0, and srtt_us can be below 8 after a 0 us
sample, so the sum is 0.

Later in this series, "tcp: clamp RTT samples in tcp_rtt_estimator()"
keeps the sum below 2^32. After that, the rto_min == 0 case is the only
trigger left that this patch is needed for. Could the commit message name
it, so that stable backporters can see why this patch is still needed?

The impact could also be described more fully. When icsk_rto is 0,
tcp_retransmit_timer() does this:

    icsk->icsk_rto = min(icsk->icsk_rto << 1, tcp_rto_max(sk));

It then re-arms ICSK_TIME_RETRANS with a 0 timeout on every expiry. The
socket retransmits on every tick until retransmits_timed_out() gives up,
which takes about 924 seconds at the default tcp_retries2.

> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 5c9203aae8341..6a714189bcc7f 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -910,7 +910,9 @@ static inline void tcp_bound_rto(struct sock *sk)
>  
>  static inline u32 __tcp_set_rto(const struct tcp_sock *tp)
>  {
> -	return usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);
> +	u32 rto = usecs_to_jiffies((tp->srtt_us >> 3) + tp->rttvar_us);

[Severity: Low]
This isn't a bug introduced by this patch, but the sum here is still
computed in wrapping u32 arithmetic. When it wraps, the result now falls
somewhere between 1 jiffy and tcp_rto_min(). tcp_set_rto() and
tcp_ld_RTO_revert() apply only an upper bound to it.

If this commit is taken on its own, can a peer still cause the wrap?
tcp_rtt_tsopt_us() accepts TSecr deltas up to about 2.1e9 us:

    if (likely(delta < INT_MAX / (USEC_PER_SEC / TCP_TS_HZ))) {

tcp_rtt_estimator() then uses that sample without clamping it.

Later patches in this series close that path:

- "tcp: clamp RTT samples in tcp_rtt_estimator()" changes the sample to
  min(mrtt_us, TCP_RTT_MAX_US), with a 120 s bound.
- "tcp: reject RTT samples from TSecr above 120 s" makes
  tcp_rtt_tsopt_us() return -1 for such samples.

With both applied, srtt_us >> 3 stays below about 536.9e6, even with
TCP_TX_DELAY. rttvar_us stays below about 2.147e9, so the sum stays
under 2^32.

One way to wrap is left: a locked RTAX_RTO_MIN route metric near 4294
seconds, where jiffies_to_usecs(tcp_rto_min()) is already close to 2^32.
That needs an admin-only configuration. It is a gap in the bound chosen
by the sample-clamping patch rather than in this one.

> +
> +	return max(rto, 1U);

[Severity: Medium]
This floor only covers callers of __tcp_set_rto(). Can
tcp_init_metrics() still store an icsk_rto of 0?

net/ipv4/tcp_metrics.c:tcp_init_metrics() {
    ...
	if (crtt > tp->srtt_us) {
		/* Set RTO like tcp_rtt_estimator(), but from cached RTT. */
		crtt /= 8 * USEC_PER_SEC / HZ;
		inet_csk(sk)->icsk_rto = crtt + max(2 * crtt, tcp_rto_min(sk));
    ...
}

This assignment uses u32 arithmetic, has no lower bound and does not
call tcp_bound_rto(). When RTAX_RTO_MIN is locked, tcp_rto_min() returns
dst_metric_rtt(dst, RTAX_RTO_MIN). ip_metrics_convert() accepts any value
for that metric; its only zero check is for a locked RTAX_CWND.

There are two ways to reach 0:

- With a locked rto_min of 0, a cached RTT below one jiffy but above the
  SYN RTT gives crtt = 0, so icsk_rto = 0 + max(0, 0) = 0. An example is
  100-500 us on a local network or loopback at HZ=1000.
- With a very large locked rto_min, crtt + rto_min can wrap to exactly 0.

Suppose the peer then stops answering after the handshake. No RTT sample
reaches tcp_set_rto(), and this happens:

tcp_init_transfer()->tcp_init_metrics()      /* icsk_rto = 0 */
tcp_retransmit_timer()
    icsk->icsk_rto = min(icsk->icsk_rto << 1, tcp_rto_max(sk));  /* 0 */
    tcp_reset_xmit_timer(sk, ICSK_TIME_RETRANS,
                         tcp_clamp_rto_to_user_timeout(sk), false);

retransmits_timed_out() is time based, so the socket would retransmit on
every tick for about 924 seconds at tcp_retries2=15.

Setting the route metric needs CAP_NET_ADMIN in the netns, which an
unprivileged user can get through user namespaces.

The new comment in tcp_set_rto() says rto must never be 0, and the rest
of the series doesn't change tcp_metrics.c. Should this assignment also
be bounded? Either max(..., 1U) or a clamp to [tcp_rto_min, tcp_rto_max]
would work. The floor could also go where the backoff doubles icsk_rto.

>  }

[ ... ]

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index a2074a1af4222..f65697bc96c9d 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -1221,8 +1221,9 @@ void tcp_set_rto(struct sock *sk)
>  	 *    with correct one. It is exactly, which we pretend to do.
>  	 */
>  
> -	/* NOTE: clamping at TCP_RTO_MIN is not required, current algo
> -	 * guarantees that rto is higher.
> +	/* NOTE: clamping at tcp_rto_min() is not required, tcp_rtt_estimator()
> +	 * applies it to rttvar_us. But rto must never be 0, which exponential
> +	 * backoff could not leave: __tcp_set_rto() takes care of that.
>  	 */

[Severity: Low]
Is this comment accurate at this commit? It says no tcp_rto_min() clamp
is needed because rttvar_us carries the floor. The commit message,
though, says "that guarantee is lost if the sum wraps", and
__tcp_set_rto() only guarantees 1 jiffy. While the sum can wrap, the
result can fall in [1, rto_min).

The contradiction goes away once "tcp: clamp RTT samples in
tcp_rtt_estimator()" later in the series keeps the sum within u32. From
then on, rttvar_us >= tcp_rto_min_us() does imply rto >= rto_min, and the
1U floor only matters when rto_min == 0.

A smaller gap remains, and it predates this patch. rttvar_us is not
raised when tcp_rto_min() increases in the middle of a connection.
tcp_rtt_estimator() resets mdev_max_us to the new value:

    tp->mdev_max_us = tcp_rto_min_us(sk);

But rttvar_us only grows when mdev_us exceeds mdev_max_us. The old
comment ("current algo guarantees that rto is higher") had the same gap.

>  	tcp_bound_rto(sk);
>  }

[Severity: Low]
This is a pre-existing issue, but the three users of __tcp_set_rto()
apply different lower bounds. The thin-stream branch of
tcp_retransmit_timer() clamps at both ends:

    icsk->icsk_rto = clamp(__tcp_set_rto(tp),
                           tcp_rto_min(sk),
                           tcp_rto_max(sk));

tcp_set_rto() (through tcp_bound_rto()) and tcp_ld_RTO_revert() (through
inet_csk_rto_backoff()) apply only tcp_rto_max(). On those two paths, the
documented tcp_rto_min_us minimum is enforced only indirectly, through
the rttvar_us floor in tcp_rtt_estimator(). That floor holds once the
later sample-clamping patch keeps the sum from wrapping.

Is it intended that raising rto_min mid-connection takes effect at once
only on the thin-stream path?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118005048.53393-1-mason%40kernel.org

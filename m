Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026184;
	b=LyzhBGz0S/40KjLCw+BKySn2DnhdrkjONUQ4+bSfhKVc0SYeNdC7fGIjG4b0gfi1fN6B
	 R0VeEQy5uAdy9nLvr3tMy1cdHelDTh7DmAvnCkAr6noTvLZe8ZX5PbnKlw2gisCdP+GgL
	 CmLf+2fg++A6V+e0LrSRUGCMC6YEtd2DJmDOwVZgVh7R3ppm4OAeMXCsbKu+t5DOVpawR
	 V5Y8lw+vvxZhZfE3+mZPtY2pvgQmU21Vvt9VfAWQbxEJD55GH5owteiqEgG4EasTwIVMm
	 NeBnHrF1v+n5Qqml5oBUJJsnEBBwKsmDxqw2LH1K/wqLuSGSaI5c3j94EoKs3vQDD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026184;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1BLuMdvTJ1JeEYJY7PkA8OaRV4HThP5dbZvdIrOXxco=;
	b=Uo4RHoC0hgJvmCj+UEgQp+ejwvsVKHAg2sZ/3tsOFlPHS3WJVVjw5CLLOzH0dfYdkLH/
	 K3Ml1BZQCZzKrX/hH6gXn2NpGZQag1TjJu4eEN04r8TI9M+ideAhjGOO5ui825jIqgZu5
	 pO1cGOFbo94L4tdTGcKRkFWfDZw0hNiVw8xlhVy2q+FVHCRKIY2zduCsBQZc35i1+gDIg
	 04mOZd/68X6C7umJQpFGDJ92s4zmgK+b/H+iDrbJIKzhwJ+z1lOAfyH0dcMsov1+vA7hi
	 183Jsm0QDaswL0SGGU9Lh27rez66Id14u5//SSpyQZc4bogtFVVnGXRJkCjfotwafjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fg8QpE8D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE58760A260C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fg8QpE8D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F151F000CA;
	Wed, 18 Nov 2026 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026184;
	bh=1BLuMdvTJ1JeEYJY7PkA8OaRV4HThP5dbZvdIrOXxco=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fg8QpE8DIiQzDSw7eGq0ChdNF/BTPr5uKYZ6yfoxkKRkPG+HHpiqLMtxOqLM8VTkJ
	 KZq529Fa+EH2m2yj03DhIl0NBrUjo/ZNEtaanJaWt3sd17nqyEeHZzHLZGIFNuJrg/
	 UNhgqPYWtUl8xKJFyjFZ46Mp9c26rTulQEsFZMevYrCQKAkoqpqIkliN6FihY4GPaB
	 WLhbMw8A/heeVGc8agblO8i+Np1/RFqUxkw5WlBLWH7OZiUco0qEl2meWYmAEdJFu4
	 9HX7rViP9zskpkhdKEtuOJF419wAd7vJBR3/rGdeCShWqxPXm6rvhOgbMb410Z3ZRW
	 6eCbbV5rfqfiQ==
Subject: Re: [PATCH net v2 4/5] tcp: clamp the samples in tcp_rcv_rtt_update()
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 18:23:03 +0000
Message-ID: <179502618349.3136.1063676165373741119@kernel.org>
In-Reply-To: <20261118155144.18393-5-mason@kernel.org>
References: <20261118155144.18393-5-mason@kernel.org>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Low] The comment on TCP_RTT_MAX_US in include/net/tcp.h (lines
  167-172) still says it is the 'Max RTT sample for tcp_rtt_estimator()'…

--

tcp: clamp the samples in tcp_rcv_rtt_update()

This patch clamps the sample passed to tcp_rcv_rtt_update() to
TCP_RTT_MAX_US before the shift left by 3. The goal is that a
receive-window fill time of 536.9 s or more no longer wraps in u32
arithmetic. The commit message says this covers both callers of
tcp_rcv_rtt_update().

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 69e038b9389ae..d9a66a1342efd 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -857,7 +857,11 @@ void tcp_initialize_rcv_mss(struct sock *sk)
>  static void tcp_rcv_rtt_update(struct tcp_sock *tp, u32 sample, int win_dep)
>  {
>  	u32 new_sample, old_sample = tp->rcv_rtt_est.rtt_us;
> -	long m = sample << 3;
> +	long m;
> +
> +	/* Keep sample << 3 and the smoothed estimate within u32. */
> +	sample = min(sample, TCP_RTT_MAX_US);
> +	m = sample << 3;

[Severity: High]
Can a long window-fill time still wrap before it gets to this clamp?

In tcp_rcv_rtt_measure(), the sample comes from tcp_stamp_us_delta():

net/ipv4/tcp_input.c:tcp_rcv_rtt_measure() {
    ...
	delta_us = tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
	if (!delta_us)
		delta_us = 1;
	tcp_rcv_rtt_update(tp, delta_us, 1);
    ...
}

That helper narrows the s64 difference to u32:

include/net/tcp.h:
static inline u32 tcp_stamp_us_delta(u64 t1, u64 t0)
{
	return max_t(s64, t1 - t0, 0);
}

So by the time min() sees an interval of 2^32 us (about 4295 s) or more,
it has already been reduced modulo 2^32.

For example, a 4300 s window-fill time arrives here as 5,032,704 us
(about 5.03 s). That passes the 120 s clamp unchanged. With win_dep=1 it
is stored when old_sample == 0 or when m < old_sample.

The only writer of rcv_rtt_est.time is the new_measure label in
tcp_rcv_rtt_measure(), and nothing resets a pending measurement when the
connection goes idle. The window-completing segment could arrive after
more than about 72 minutes of idle time or a slow sender. Would that
still hit the case the commit message describes, where "the wrapped
value is kept whenever it is below the current estimate", only with a
higher threshold?

Without timestamps the win_dep path only lowers the estimate. A bogus
small value would stay for the life of the connection.

Would it be better to clamp the 64-bit delta in tcp_rcv_rtt_measure()
before it is narrowed to u32?

[Severity: Low]
This isn't a bug, but the comment on TCP_RTT_MAX_US in include/net/tcp.h
still describes the constant only in terms of tcp_rtt_estimator() and the
RTO:

/* Max RTT sample for tcp_rtt_estimator(). srtt_us holds 8 times the RTT, and
 * mdev_us and rttvar_us up to 4 times its deviation, all in u32, like the sum
 * in __tcp_set_rto(). A larger sample could not raise the RTO, which
 * TCP_RTO_MAX bounds.
 */
#define TCP_RTT_MAX_US	(TCP_RTO_MAX_SEC * USEC_PER_SEC)

After this patch, tcp_rcv_rtt_update() also relies on 8 * TCP_RTT_MAX_US
fitting in u32 for rcv_rtt_est.rtt_us, which is not an input to
__tcp_set_rto(). tcp_rtt_tsopt_us() also uses the constant.

Could the header comment be extended to cover the receive-side users?
Alternatively, a static_assert could check that TCP_RTT_MAX_US << 3 fits
in a u32.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118155144.18393-1-mason%40kernel.org

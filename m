Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015525;
	b=tj7vpCBIGUQ/yC4z7NMy6eZGQBvfKqW8lDjjhHsbu0dxRg3cM79YqHrdMblbL9cUFFfq
	 rh25/bOn9aYxshFjM82LlQ6GWtMPtK+Y1e9vlEjQWGnaQNzKX2vZnJr3InWg0SR9LUb0E
	 CwcxuPSEI90UUdBmHqTdpLxxGOFMO9wZzt3K9E7yWwYLi4zlPzuWyct7jj8FOCoS5ybYZ
	 Oe9m+Ji811VxwE3HIe+x1mnQQrZD2rP8yh6NjIhBdWXWBp/AINHjDOhhtRZQjMuJTUoTR
	 1TnoSVSh/fHNIYOFKCRc9YpZW3/5cJ1i9L9peomQKJXM2NUmS+RYNtV7dM2OJSe7toA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015525;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OiSHSKwdXm5j2YeluHJz0o6yNhImcnXreOgbp9RzXzE=;
	b=Mdld8PqlciVjAXbJ2D9j1j2GMjuCf3p1dyhL9ZZFO8G84lpsw90ipJDYHS8yCEOAXFT6
	 wFwELhnwtQq88d/UZaAxSTW43Rxele7vhLlX0veKDO51kIaAxBA7GMLhFwSmfBkLkE3d9
	 5Tu9vf1TE5n3zTRmbWyOsxX+iF59T8wZYVeKAhgkfQBSPFocR7yp2+pRaPdnaWnl4Oye2
	 PhO5600fnoHTkJnnPXWUdT0afG5AZhK/+BxkhcV9iwqAwzD7n6V/N5lCTga4UBi9b5M7v
	 OI2N+lolRXUDdjNivVcuFI2TDEU9bxyiSQFj7GNprhRc1hYd+DzO3W3DkpdG7LV4nNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bb1i/l7I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DAA60A260B
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bb1i/l7I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18631F000C5;
	Wed, 18 Nov 2026 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015525;
	bh=OiSHSKwdXm5j2YeluHJz0o6yNhImcnXreOgbp9RzXzE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bb1i/l7ILloYSqpuOpMCwTM6Ac9O3tPNxXYphGcJhqb+G03P2+cyl840lK9gb/kEO
	 hJR+omncvUfn79s5yklUnFzpPCWP3uszxZo8ojgKZTBF9KmO7g4kW6+8clhdX4A3Mq
	 zgJoDun+7zfZ3KWDXe7jLlHSAFUXo+DzjVmLcXfxXIh/rhusbq9EHP+7KiGTK2C3hO
	 8sNOEhusBL7qsB/hkLplLi5WjNEJ/DbMnOVxiO4fwQTYMQ9DbW4tT4jzzg+oirE14X
	 FkKpiO9LyWddWH7YZEu0IKpxcD5OfQCnnqmXWJU48r2aZs4lPbmq4iO2793g6wXvzT
	 g3h2FM+myrNdA==
Subject: Re: [PATCH net 2/3] tcp: clamp RTT samples in tcp_rtt_estimator()
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 15:25:24 +0000
Message-ID: <179501552423.3136.11696546788119477411@kernel.org>
In-Reply-To: <20261118005048.53393-3-mason@kernel.org>
References: <20261118005048.53393-3-mason@kernel.org>
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

- [Low] The new comment above TCP_RTT_MAX_US in include/net/tcp.h says 'A
  larger sample could not raise the RTO, which TCP_RTO_MAX bounds.' This…

Pre-existing issues:
- [Low] The receive-side RTT estimator has the same u32 '8x RTT' wrap,
  and this patch leaves it alone.

--

tcp: clamp RTT samples in tcp_rtt_estimator()

This commit clamps each RTT sample in tcp_rtt_estimator() to
TCP_RTT_MAX_US. That is 120 s, the largest possible RTO. The clamp keeps
the u32 fields srtt_us, mdev_us and rttvar_us from wrapping, and the
smoothed RTT now saturates at 120 s.

> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 6a714189bcc7f..a617a72ee2c6b 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -164,6 +164,13 @@ static_assert((1 << ATO_BITS) > TCP_DELACK_MAX);
>  
>  #define TCP_TIMEOUT_MIN_US (2*USEC_PER_MSEC) /* Min TCP timeout in microsecs */
>  
> +/* Max RTT sample for tcp_rtt_estimator(). srtt_us holds 8 times the RTT, and
> + * mdev_us and rttvar_us up to 4 times its deviation, all in u32, like the sum
> + * in __tcp_set_rto(). A larger sample could not raise the RTO, which
> + * TCP_RTO_MAX bounds.
> + */

[Severity: Low]
Does "A larger sample could not raise the RTO" hold beyond the update
that uses the sample?

For that update it does. With m >= 120 s, (srtt_us >> 3) + rttvar_us is
already >= m in __tcp_set_rto(), so the RTO is capped at TCP_RTO_MAX with
or without the clamp.

But the clamped m is also what gets stored in srtt_us, mdev_us and
rttvar_us. For example, a first sample of 500 s gives srtt/8 = 500 s and
mdev = rttvar = 1000 s. The clamped sample gives srtt/8 = 120 s and
mdev = rttvar = 240 s.

When smaller samples follow, the clamped state falls below the RTO cap
sooner. Later RTO and TLP timeouts are then lower than they would be with
the unclamped sample, though still within the cap.

The commit message describes the saturation in TCP_INFO, the pacing rate
and the metrics cache, but this comment only talks about the RTO. Could
it say that the clamp leaves the RTO of the current update unchanged,
while later RTOs computed from the clamped state can be lower?

> +#define TCP_RTT_MAX_US	(TCP_RTO_MAX_SEC * USEC_PER_SEC)
> +

[ ... ]

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index f65697bc96c9d..10a23ee20e61d 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -1098,7 +1098,7 @@ static void tcp_event_data_recv(struct sock *sk, struct sk_buff *skb)
>  static void tcp_rtt_estimator(struct sock *sk, long mrtt_us)
>  {
>  	struct tcp_sock *tp = tcp_sk(sk);
> -	long m = mrtt_us; /* RTT */
> +	long m = min(mrtt_us, TCP_RTT_MAX_US); /* RTT */

[Severity: Low]
This is a pre-existing issue, not one introduced by this patch, but the
receive-side estimator has the same 8x RTT in u32 wrap. Should
tcp_rcv_rtt_update() get a similar bound?

net/ipv4/tcp_input.c:tcp_rcv_rtt_update() {
	u32 new_sample, old_sample = tp->rcv_rtt_est.rtt_us;
	long m = sample << 3;

	if (old_sample == 0 || m < old_sample) {
		new_sample = m;
	} else {
		...
		if (win_dep)
			return;
	...
	tp->rcv_rtt_est.rtt_us = new_sample;
}

sample is u32, so the shift is done in 32-bit arithmetic. It wraps for
samples above 2^29 us (about 536.9 s) before the result is widened to
long. A wrapped m below old_sample is stored, even for win_dep=1 samples.

There are two sources of large samples. The TSecr path,
tcp_rcv_rtt_measure_ts(), passes tcp_rtt_tsopt_us() results of up to
about 2,147 s. The later patch in this series, "tcp: reject RTT samples
from TSecr above 120 s", makes tcp_rtt_tsopt_us() return -1 above
TCP_RTT_MAX_US, which closes that path.

The non-timestamp path is still unbounded at the end of the series:

tcp_event_data_recv()
  tcp_rcv_rtt_measure()
    delta_us = tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
    tcp_rcv_rtt_update(tp, delta_us, 1);

Suppose a receive window measurement spans a stall of more than 536.9 s.
The wrapped value is accepted only if the stall falls in a narrow band:
from 536.87 s to about 536.87 s plus the current receiver RTT, modulo
2^29 us. The win_dep check rejects most other wrapped values.

When the value is accepted, tp->rcv_rtt_est.rtt_us is too small. Without
timestamps this is a min filter, so the bad value stays for the life of
the connection. It is read by tcp_rcv_space_adjust(), tcp_rcvbuf_grow(),
the compressed ACK delay in __tcp_ack_snd_check(), tcpi_rcv_rtt and
mptcp_rcv_rtt_update().

A remote peer can already push this min filter down by sending a window
quickly, so the wrap doesn't give it anything new.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118005048.53393-1-mason%40kernel.org

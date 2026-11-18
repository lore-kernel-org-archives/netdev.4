Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015526;
	b=iqECS7oA9oPe93bWn2yseW764KpRgGTC2Gv0yGByRvLa/x0vKL8ZR044RL8Jt0b9RKMB
	 KhX7Ku+LfKiRmpeyck/tva7FkNJ3FlLLtHTbddWdE2B4bnMF7EaQEwUdjZeWynW2RB4tb
	 +M/UVByj0vhPPtVhqBmeZy4A09EmLky/eZ1n4l0N6o2gGUKs5VeFjvM07n/lhJLzay+85
	 Y49+BvQ7LU7AqMr8Ghjd+59+o2RvUN/xSuNicdCrPPcvIrtQnWHdlgVN5Xv0eRBs0YQFw
	 1lItIlxe03LwjbRQPPkwSfFIef+rOIjmYCwOSOnSDgOceB0Gk8weL8fZ8W7NVC5bCzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015526;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Li5RhxTSiePdLlq+mMg/fEoHQhNnsTLg6FVyrSqfWQg=;
	b=u3JsqYjFfY22wGOABaGJPgtknSYCrUwoIdm95hTaSY40oYyUgnlpu1fr+QUnu7vJS5Q0
	 nPwtAdBZMLEkjOMR1UJJS1RqTNqese07OxeTCOi3zi25orZsukB8jSKvHmFyH9UQmSAPG
	 9cjv9CZTMAkPC272TGNZFEg87Ot9pQzlL++owkHFN6D5OhUMJ38aNuZfadNpkzJTRV51i
	 MxBXfY8wBqWxUZ4t94kZX32oTYTqFtrQBk3n+9WBiVUpjeO/c03pdIJE/1nH0k2VQOVHy
	 10JBQ8WbyHAJtFDCvRhl+r+MA2ZtU9e9YFubfpei9ZCYn3PJ0jazPuP9xvzLzRog82w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXgRIViv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95160A261A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IXgRIViv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54E81F000C7;
	Wed, 18 Nov 2026 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795015526;
	bh=Li5RhxTSiePdLlq+mMg/fEoHQhNnsTLg6FVyrSqfWQg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IXgRIVivb0NLSyU8ibrcU5D1lYKHRtLS6iZPx1G7wkACjoltrsHYDTDwgZ6dsN5DS
	 kO5VT/GXEnh8AcEaXF0801lew7WWCgbkqcRJuB5RN9ymwk443sbLcrTZAj5MCkQ45Q
	 TWsyNnG6RprmJj8x8a031rdeU4lx7wFPm5JfPMAy11Q4sFikmA+5kDEcPg+4IgNjsZ
	 sEXyDaqYlA9i6qH/HhMIqPeh4QmHsOXASeK4iVPDqiZKfwhg/8sGKSGe7Vs7GU6MEy
	 qiu6peCzDZxdMl72uMIraQtE19yRWDDqJEQRvuB2xiEP+iClrKPBZubZwXEzFsm00M
	 XKB5taSFQWSzA==
Subject: Re: [PATCH net 3/3] tcp: reject RTT samples from TSecr above 120 s
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 15:25:25 +0000
Message-ID: <179501552536.3136.7079470135971485944@kernel.org>
In-Reply-To: <20261118005048.53393-4-mason@kernel.org>
References: <20261118005048.53393-4-mason@kernel.org>
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

- [High] The fix is incomplete: the u32 wrap of `sample << 3` in
  tcp_rcv_rtt_update() (net/ipv4/tcp_input.c:860) can still be reached.
- [Low] The patch gives TCP_RTT_MAX_US a second meaning but leaves its
  header comment as it was.

--

tcp: reject RTT samples from TSecr above 120 s

This commit makes tcp_rtt_tsopt_us() reject TSecr-derived RTT samples
above TCP_RTT_MAX_US (120 s), for both the usec and ms timestamp clocks.
Both callers are affected: tcp_ack_update_rtt() and
tcp_rcv_rtt_measure_ts(). The goal is to stop feeding the age of a stale
timestamp to the RTT estimator, the congestion control, and the u32
sample << 3 in tcp_rcv_rtt_update().

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 10a23ee20e61d..8de54d9804e17 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -901,15 +901,16 @@ static inline void tcp_rcv_rtt_measure(struct tcp_sock *tp)
>  	tp->rcv_rtt_est.time = tp->tcp_mstamp;
>  }
>  
> +/* A sample from TSecr above TCP_RTT_MAX_US is bogus, not large. */

[Severity: Low]
The header comment for TCP_RTT_MAX_US in include/net/tcp.h still
describes the constant only as a clamp for tcp_rtt_estimator():

    /* Max RTT sample for tcp_rtt_estimator(). srtt_us holds 8 times the RTT, and
     * mdev_us and rttvar_us up to 4 times its deviation, all in u32, like the sum
     * in __tcp_set_rto(). A larger sample could not raise the RTO, which
     * TCP_RTO_MAX bounds.
     */
    #define TCP_RTT_MAX_US	(TCP_RTO_MAX_SEC * USEC_PER_SEC)

That matches how tcp_rtt_estimator() uses it, where a larger sample is
clamped and then used:

    long m = min(mrtt_us, TCP_RTT_MAX_US); /* RTT */

Here the same constant becomes a threshold for rejecting a sample. The
TSecr path, tcp_rcv_rtt_measure_ts()->tcp_rcv_rtt_update(), also now
depends on TCP_RTT_MAX_US * 8 fitting in u32.

Should the header comment mention this second use? As it stands, a later
change that raises TCP_RTO_MAX_SEC above about 536 would bring the wrap
back silently, and no BUILD_BUG_ON guards against that.

>  static s32 tcp_rtt_tsopt_us(const struct tcp_sock *tp, u32 min_delta)
>  {
>  	u32 delta, delta_us;
>  
>  	delta = tcp_time_stamp_ts(tp) - tp->rx_opt.rcv_tsecr;
>  	if (tp->tcp_usec_ts)
> -		return delta;
> +		return delta <= TCP_RTT_MAX_US ? delta : -1;
>  
> -	if (likely(delta < INT_MAX / (USEC_PER_SEC / TCP_TS_HZ))) {
> +	if (likely(delta <= TCP_RTT_MAX_US / (USEC_PER_SEC / TCP_TS_HZ))) {

[Severity: High]
The commit message says:

  tcp_rcv_rtt_measure_ts() passes the sample to tcp_rcv_rtt_update(),
  which computes sample << 3 in u32 arithmetic. That wraps from 536.9 s
  on.

Can that wrap in tcp_rcv_rtt_update() still be reached through its other
caller, tcp_rcv_rtt_measure()?

tcp_event_data_recv()->tcp_rcv_rtt_measure() runs on in-order data, with
or without timestamps. Nothing bounds its sample:

net/ipv4/tcp_input.c:tcp_rcv_rtt_measure() {
    ...
	delta_us = tcp_stamp_us_delta(tp->tcp_mstamp, tp->rcv_rtt_est.time);
	if (!delta_us)
		delta_us = 1;
	tcp_rcv_rtt_update(tp, delta_us, 1);
    ...
}

rcv_rtt_est.time is only refreshed once rcv_nxt reaches rcv_rtt_est.seq.
Suppose the peer completes one measurement, stays idle for more than
2^29 us (about 536.9 s), and then sends a window of data. delta_us is
then above 2^29, and the shift wraps:

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
}

If delta_us lands within about one RTT past a multiple of 2^29 us, the
wrapped m is below old_sample. It is accepted, and rcv_rtt_est.rtt_us
ends up near zero.

With win_dep=1, every later, larger and correct sample hits the early
return. So on connections without timestamps, the bad value appears to
stay for the life of the connection. Several things read it: receive
buffer autotuning in tcp_rcv_space_adjust() and tcp_rcvbuf_grow(),
tcpi_rcv_rtt, and MPTCP.

Would it make sense to bound sample, or do the shift in 64 bits, inside
tcp_rcv_rtt_update()? That would cover both callers, not only the TSecr
source.

>  		if (!delta)
>  			delta = min_delta;
>  		delta_us = delta * (USEC_PER_SEC / TCP_TS_HZ);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118005048.53393-1-mason%40kernel.org

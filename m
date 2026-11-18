Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026183;
	b=kY0RKRuMGFaFLW/A5vrYLag9lj6oY9rMxnORTmktVs2dXawPEy0NxZepCsEj+/+Y++Q1
	 pFrK0gP1utfK+vfBBTEoQb0YxkBYm+5ftJ1Q+uqjA/0Da9Z0p/tC4yt5iIYhTFzSGgeHp
	 oWLPGWcuAGvtmGo69EANLRKYL1Kmb8w14DjjH1V6fpFewRS6tUUK9hakqRcLGVutgGmW9
	 kaT07gqKvvvuBBgJCzsWE9lbFM84iwRdJMo4uyT7PqKpOMSSqZSRSDVoQEIpNsDRz9ZGB
	 LYGgIjOizl8Grs+Hxvojyk2SvbJfQbAnn5rIZxv1LC1MiPJn0kngPPmrnq/2BGKQV3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026183;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lNuKjpJK9D+QRY5daBoPqTUSuR+D+q18m5okL3/K2hc=;
	b=Cy/mdTs8aAlF0+dGezpM1MqOBuq5UTJh8zncWfa0JEypwU20B8ddgJND8pRG2/Y6LXyH
	 GK/9jlvNYH8qafr6aKGrw+OY5T2dDjsvlix7SM7IoZdlPfoTjReaKznQrVn1TDs/fq7A4
	 VqLBMct4TglChUlVqnip5+OvfDe0H10OmKBMnqOE+PJzebZ69uP4rd27sHLxRRBPpjcq1
	 czOz4agLZhmwE/mjjDNpHO4gg7WizEzrwdOf3QRlf6WPwRVX34a/0TFiQtFJkVjJfQd9E
	 L3A4Wyx0/vFeW5luZQTzcRl+v47q3Go2DcYTBu2qX4FCmaATb116GQjqFwMFIk5zjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kpE/GwEw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E4A606A336
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpE/GwEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5291F000D2;
	Wed, 18 Nov 2026 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795026183;
	bh=lNuKjpJK9D+QRY5daBoPqTUSuR+D+q18m5okL3/K2hc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kpE/GwEwVXzj1fPydacHZtjh4LSw8b2otfovA7chQe3wftBaJodvhCtX5vMVOxcgt
	 rw2vVMs871/sLt2G9CvdzKlAfu6Datyh26jiANjQ6PhSZFMupAaOL5MipDjRgxp/6+
	 /DfV95wYF3x1RI3mPbnYL1jM7kvgkTbUxlIvKABJKvRjFa21pbYjf9IaR0m8Hqxl3I
	 rAYQZds2/GMziBAefNXvAtCRzoGkm++j4q3qoJfocFHXXCGlEyKyBE4+aSGQ+hDTV+
	 hcIuK1ZcCtGF+4WPyfbyYPrkAGle8MvtX1UlGTbGUvfkOSrOh6FMNK0YFvwF6QAqJj
	 a4MPysD7bvd8Q==
Subject: Re: [PATCH net v2 3/5] tcp: reject RTT samples from TSecr above 120 s
From: netdev-bot+sashiko@kernel.org
To: mason@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Date: Wed, 18 Nov 2026 18:23:02 +0000
Message-ID: <179502618234.3136.4048099006829780599@kernel.org>
In-Reply-To: <20261118155144.18393-4-mason@kernel.org>
References: <20261118155144.18393-4-mason@kernel.org>
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

- [Low] The header comment for TCP_RTT_MAX_US is out of date after this
  patch.

--

tcp: reject RTT samples from TSecr above 120 s

This patch makes tcp_rtt_tsopt_us() reject any TSecr-derived RTT sample
above TCP_RTT_MAX_US (120 s), in both the usec and ms timestamp branches.
Before, samples of up to about 2,147 s were accepted. Both callers,
tcp_ack_update_rtt() and tcp_rcv_rtt_measure_ts(), now get no sample when
TSecr echoes a very old timestamp.

> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e796497b84be8..69e038b9389ae 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -901,15 +901,16 @@ static inline void tcp_rcv_rtt_measure(struct tcp_sock *tp)
>  	tp->rcv_rtt_est.time = tp->tcp_mstamp;
>  }
>  
> +/* A sample from TSecr above TCP_RTT_MAX_US is bogus, not large. */
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

[Severity: Low]
This isn't a bug, but should the comment on TCP_RTT_MAX_US in
include/net/tcp.h be updated to match its new use here? It currently reads:

/* Max RTT sample for tcp_rtt_estimator(). srtt_us holds 8 times the RTT, and
 * mdev_us and rttvar_us up to 4 times its deviation, all in u32, like the sum
 * in __tcp_set_rto(). A larger sample could not raise the RTO, which
 * TCP_RTO_MAX bounds.
 */
#define TCP_RTT_MAX_US	(TCP_RTO_MAX_SEC * USEC_PER_SEC)

That comment names tcp_rtt_estimator() as the only user. The only reason
it gives for the value is u32 headroom for a saturating clamp.

With this patch the same constant is also the validity cutoff in
tcp_rtt_tsopt_us(). That cutoff covers more than the estimator: it
decides rs->rtt_us, the tcp_update_rtt_min() input, and whether
icsk_backoff is reset in tcp_ack_update_rtt(). It also gates the
receive-side estimate in tcp_rcv_rtt_measure_ts().

The later patch in the series, "tcp: clamp the samples in
tcp_rcv_rtt_update()", adds another user, and the header comment is still
unchanged at the end of the series.

Someone who changes TCP_RTO_MAX_SEC or TCP_RTT_MAX_US because of the u32
headroom reasoning would not see that this also moves the TSecr rejection
threshold. Could the header comment mention that the constant also bounds
valid TSecr samples?

>  		if (!delta)
>  			delta = min_delta;
>  		delta_us = delta * (USEC_PER_SEC / TCP_TS_HZ);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118155144.18393-1-mason%40kernel.org

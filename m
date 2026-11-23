Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393545;
	b=QAxAP4SznzHD0fRZyz3N89IoSeBuYW5e6yy+cPsRD6zZJ5ZQthdXCYfjq2oHtiTCR4Lt
	 dvY5lBWkhE0k6qrHFihAzmFBpxaryL7HRhVLIo27X4y1H0FYjzV7e7/Pg5WWMUmxSa5MD
	 8dLfICKm8etQ16yRO+hJVSrSWx4Cac9Qa/ucOvnsfWyNFSQqP9Z5Nb+9MUAHsGKWxGlxk
	 /u7JLqbmcBm2rpd6OqfoDtKL/QFpfa/xuWoBGewI92dcmEDVN7iVTP9XPaCIhJCWVHRr7
	 SWS4Qo9hn8FYidk/NlFO/MGx3kr3Wuhb59p6dINp9xRvniwtiOuMv679vXAY6KHn5CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393545;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=maWlAAFqQjxbn3YXaSl729CQEIP7qAtbCEyOK+WjJsc=;
	b=pdvwqzur3Ub2LWiyVPU7n2ML57Zx/IVhuhEML7cEgGaUCI+a5r82rSLuurm3lWzdbEi7
	 EnuGAg/HLG/Ggh9hY4/7gJ+WE/8xxeT66/jlRaWCz6EbmxWByyEvM5xL8q/T5xWrJUz6G
	 yn0/whzQgL6sOiJQHHbrtKNe+zfoRju/daZp87+VCKXH1FkGRz2UwuBqKX4Jtqz4PZV/M
	 MBXn41THL+6wlBWgIPhOTzl4KFzHObFa5wIvnNFCXfRY3g0MUPA0MzFJ3BZkPkSFP1im6
	 6xKWIjJtCg18+MqzcZl9jc+42pPYNVEEPVAEdQMDUHOPw5hsRGEWxHZN/nqgXf2Um4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f2liLc8/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD07606A335;
	Mon, 23 Nov 2026 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2liLc8/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC6B1F000D8;
	Mon, 23 Nov 2026 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393545;
	bh=maWlAAFqQjxbn3YXaSl729CQEIP7qAtbCEyOK+WjJsc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f2liLc8/SHgTB9PUk9mec04JNXtmqa8gXddil96Ml7wb9kv12fqEI1je63EiYLRHx
	 2msCpGjcZ2nQNkFqyHRZzedssasz2+tnct3goH2yWeiG1K+XnZy0bqn2UShrytZlKt
	 n4pk9lFjFArorDthKm96ztCm9hWueP//ZXgVxAVm/ihf2p6Q57FAk9gZnnlD240nAd
	 7o44Du5ovfGz/9olrdZ+zZPI/gRpItwzk2WI9bJX2y/yWY/xmq1CNZj6D0uEAK3r0S
	 3NSng6n8dnPdmp9n7520dkDNIJmuvrBivF6rGeE+w4w5I9K9LUUB0GXqSBku9Wn8Xk
	 qR1XZN+vUoqnA==
Subject: Re: [PATCH net-next v5 2/4] ipv6: take fib6_sernum from a sequence
 shared by all netns
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, ralf@mandelbit.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:25:43 +0000
Message-ID: <179539354386.3135.18364920527227915268@kernel.org>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-2-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-2-100a3b5d9090@linux.dev>
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

- [Medium] Once the shared fib6_sernum_seq has wrapped, a bump in
  fib6_new_sernum() (net/ipv6/ip6_fib.c) can set a netns' fib6_sernum to…
- [Low] The commit message has no Fixes: tag and does not mention stable.

--

ipv6: take fib6_sernum from a sequence shared by all netns

This patch makes fib6_new_sernum() draw every fib6_sernum bump from one
sequence shared by all netns. The sequence hands out values from 2 to
INT_MAX and then wraps to 2. The goal is that a per-cpu nexthop route
cached against one netns no longer matches the sernum of another netns
after its device moves. rt6_is_valid() also now rejects sernum 1, the
value every netns starts with.

> diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
> index e1d49897d6ab0..71490edb01e99 100644
> --- a/net/ipv6/ip6_fib.c
> +++ b/net/ipv6/ip6_fib.c
> @@ -123,12 +123,38 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)

[ ... ]

> +static atomic_t fib6_sernum_seq = ATOMIC_INIT(1);
> +
> +static int fib6_sernum_draw(void)
> +{
> +	int new, old = atomic_read(&fib6_sernum_seq);
> +
> +	do {
> +		new = old < INT_MAX ? old + 1 : 2;
> +	} while (!atomic_try_cmpxchg(&fib6_sernum_seq, &old, new));
> +
> +	return new;
> +}

[ ... ]

>  static int fib6_new_sernum(struct net *net)
>  {
>  	int new, old = atomic_read(&net->ipv6.fib6_sernum);
>  
>  	do {
> -		new = old < INT_MAX ? old + 1 : 1;
> +		new = fib6_sernum_draw();
>  	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));
>  
>  	return new;

[Severity: Medium]
Once fib6_sernum_seq has wrapped, can fib6_new_sernum() publish the value
the netns already holds?

Suppose a netns publishes V and then makes no more bumps. Meanwhile other
netns make about 2^31 - 2 bumps through route add/del, PMTU exceptions or
flushes. The next draw for this netns can then return V again:

fib6_new_sernum()
    old = atomic_read(&net->ipv6.fib6_sernum);   /* V */
    new = fib6_sernum_draw();                    /* V again after the wrap */
    atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new);  /* succeeds */

The callers then write V onto nodes that already hold V:

  - fib6_add() via __fib6_update_sernum_upto_root()
  - fib6_update_sernum_upto_root()
  - fib6_update_sernum() from rt6_insert_exception()
  - fib6_flush_trees() via __fib6_clean_all()

So the bump has no effect.

Would cookie-validated dsts then still pass fib6_check() and rt6_check(),
and would nexthop per-cpu dsts with sernum V still pass rt6_is_valid()?
If so, sockets would keep stale routes after a new more-specific route,
an exception insert or a flush, until the next real bump.

The old formula (old < INT_MAX ? old + 1 : 1) could never return a value
equal to old. Would drawing again while new == old be enough to close
this?

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 4a4c5ace63c54..6731665fbb16d 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -1466,7 +1466,11 @@ static struct rt6_info *ip6_rt_pcpu_alloc(const struct fib6_result *res)
>  
>  static bool rt6_is_valid(const struct rt6_info *rt6)
>  {
> -	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
> +	/* Reject the initial sernum, which every netns shares and which a
> +	 * route can record before its insertion bumps the sernum.
> +	 */
> +	return rt6->sernum != 1 &&
> +	       rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
>  }

[Severity: Low]
This isn't a bug, but should the commit message carry a Fixes: tag, and
possibly a Cc: stable line?

The comparison in rt6_is_valid() and this line in ip6_rt_pcpu_alloc()
both come from commit 8f34e53b60b3 ("ipv6: Use global sernum for dst
validation with nexthop objects"):

    pcpu_rt->sernum = rt_genid_ipv6(dev_net(dev));

That line stores the sernum of the creating netns on per-cpu nexthop
routes.

Without Fixes: 8f34e53b60b3, stable backporters and automated stable
selection cannot tell which kernels need this fix.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090%40linux.dev

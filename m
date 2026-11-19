Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080175;
	b=0IyLXsSb3vZ4LsAoh0S/GZMB45aLEW1jEYMhXG4ZuJp+5AfRcSbzfRdOPcxOczxq4bdw
	 6h8erqJnQSggb4O0+8/ArxqpFlbgIw7r26m/X0rouYhq5jMhl2pyJ2cYR7gnVvT/pDK8j
	 4GJMbGSirhkxQcxHznmYuWrrvIiaQEO1qd4yWPqA6l6PG8DgjkB7CspH5hdBjqGw+Z1Bx
	 vkA3PeGiuDKOBNhn9FMzxQObXUZ0xRM3aXzpGyeWLr1UBNHluGa/Aw7/Mq+U26LvDS5iA
	 VphDteoXA1nVM0Jj0nV572J8mKkU8wcWViHnE70KsyxJlog/Vcv+BlOysA6+VFebNxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080175;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kzsMYLfZXiKrbOaMXHiKVjUwtocAv3+Lqf58JawFXZ8=;
	b=FthLmbLvFYmsM2ApJ43SGE6mszGmJlSghqxLt2oOKBrxHyrtAyr25aVPrsXY0aW5pgKG
	 iziDhDLOOS2B2y3rLamDVle7hu5pKeMQsB6n6r4CIQ8E+2I+ciXfy3YXInY7koRhquDAf
	 dPDjixyZCi64wOTubFckElpL8yq/fd4oxJBDHDlIYYVv18VWfw7YLKFd+MN4Mn5LNlf02
	 WdeOpn533uNrBDXarxkkEiR1o01kDjsu9J/zi9F1VXCMJC27CY3ioOZPIja/QYJZdo7Cm
	 89x5S2Qb4QHatQARzY+plQVNLaiTO6Ls3LLbxrE2InrRhwLM4XhZycD2EuKQ/J+1puQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQmu62NT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4505606A338;
	Thu, 19 Nov 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQmu62NT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1631F000C4;
	Thu, 19 Nov 2026 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080175;
	bh=kzsMYLfZXiKrbOaMXHiKVjUwtocAv3+Lqf58JawFXZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UQmu62NT4e6+7GIwusD7nz695x6seqmFReRWnay2IejkW/ulbjSeQO8Wns2g36rqD
	 Qvobp9NYralqMLKWcLrldISnWm7r1SkS5E4uaCbaP2mi3TCjRvFfbY6S7EkpKumQXV
	 v+dBNhov+oedtS9A2Mcp+TgG6SAfLQXj3IG6a0+qEIggx4Nvuc0MxROex6ivikkENV
	 hnTTU9GFZEYEOF/A4+QISCQ4WT/RleWs6Zq933oWvxphvEladSyxIKjNv7+ZcPTHNc
	 Lff91lb6icrBKYQrkA5aHC/TCJmXtCCh7KSYFS5PU1J95dKV1q9b74rO7/CRSoyNua
	 xZ5i29enrpjHw==
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 sd@queasysnail.net, antonio@mandelbit.com, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 09:22:54 +0000
Message-ID: <179508017446.3136.16309442875415057261@kernel.org>
In-Reply-To: <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
References: <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
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

- [High] ip6_dst_lookup_flow_cookie() (net/ipv6/ip6_output.c) is meant to
  close the late-cookie-sampling race.
- [Low] The new kernel-doc for ip6_dst_lookup_flow_cookie() says 'If the
  IPv6 FIB changed during the lookup, a route dst no longer validates…

--

ipv6: add ip6_dst_lookup_flow_cookie

This adds ip6_dst_lookup_flow_cookie(). It returns a dst together with a
validation cookie that is sampled between two reads of the IPv6
generation, and the cookie is 0 if the generation changed. For
nexthop-object dsts, ip6_dst_check() now also requires the cookie to
match rt->sernum, and fib6_ifup()/fib6_ifdown() now advance the serial
after rt6_multipath_rebalance().

> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 3cc911f6618e7..b87ccb5586cf6 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c

[ ... ]

> @@ -1300,6 +1299,54 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
>  }
>  EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
>  
> +/**
> + *	ip6_dst_lookup_flow_cookie - perform route lookup on flow with ipsec
> + *				     and return the matching dst cookie

[ ... ]

> + *	Same as ip6_dst_lookup_flow, but also returns the cookie describing
> + *	the routing state the dst was obtained from. A caller caching the dst
> + *	should use this cookie when validating it with dst_check. If the
> + *	IPv6 FIB changed during the lookup, a route dst no longer validates
> + *	with it. An xfrm bundle is validated by xfrm and ignores the cookie.

[Severity: Low]
Does this guarantee hold for nexthop-object dsts (rt->sernum != 0) when
the FIB change is a route deletion?

For those dsts the helper returns gen0, and ip6_dst_check() only checks
this:

	if (rt->sernum)
		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;

It never looks at rt->from.

Route deletion goes through
fib6_del()->fib6_del_route()->fib6_purge_rt()->__fib6_drop_pcpu_from().
None of these call fib6_new_sernum(), so net->ipv6.fib6_sernum does not
change. Deletion only clears pcpu_rt->from:

	from = unrcu_pointer(xchg(&pcpu_rt->from, NULL));
	fib6_info_release(from);

Say the selected nexthop-object route is deleted between the gen0 and
gen1 reads. Then gen0 == gen1, and the cookie still matches
pcpu_rt->sernum. The cached dst keeps validating until some unrelated
generation bump, such as any route insertion in the netns.

The stale-dst behavior itself predates this patch, since callers of
rt6_get_cookie() also get rt->sernum. What is new is this kdoc claim on
a new exported API.

Could the comment be narrowed so future callers don't assume deletions
are covered?

> + *
> + *	Return: a valid dst pointer on success or a pointer encoded error code.
> + */
> +struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
> +					     const struct sock *sk,
> +					     struct flowi6 *fl6,
> +					     const struct in6_addr *final_dst,
> +					     u32 *cookie)
> +{

[ ... ]

> +	gen0 = rt_genid_ipv6(net);
> +	/* read the generation before looking at the FIB or xfrm policies */
> +	smp_rmb();
> +
> +	dst = ip6_dst_lookup_flow(net, sk, fl6, final_dst);
> +	if (IS_ERR(dst))
> +		return dst;
> +
> +	rt = dst_rt6_info(dst);
> +	*cookie = rt->sernum ? gen0 : rt6_get_cookie(rt);
> +
> +	/* keep the FIB and cookie reads before the final generation read */
> +	smp_rmb();
> +	gen1 = rt_genid_ipv6(net);
> +	if (unlikely(gen0 != gen1))
> +		*cookie = 0;

[Severity: High]
Does setting the cookie to 0 here have any effect when
ip6_dst_lookup_flow() returned an xfrm bundle?

The commit message says:

    xfrm bundles retain their existing validation
    through their own route and path cookies.

However, those cookies are sampled late too, which is the pattern the
commit calls buggy. Both are set inside xfrm_bundle_create(). That runs
after ip6_dst_lookup_tail() picked the route, and after policy lookup and
state resolution:

net/xfrm/xfrm_policy.c:xfrm_init_path() {
    ...
		path->path_cookie = rt6_get_cookie(dst_rt6_info(dst));
    ...
}

net/ipv6/xfrm6_policy.c:xfrm6_fill_dst() {
    ...
	xdst->route_cookie = rt6_get_cookie(rt);
    ...
}

xfrm_bundle_ok() then validates only against those two cookies:

	if (!dst_check(xfrm_dst_path(dst), ((struct xfrm_dst *)dst)->path_cookie) ||
    ...
		if (!dst_check(xdst->route, xdst->route_cookie))
			return 0;

xfrm_dst_check() ignores the cookie the socket stored:

	if (READ_ONCE(dst->obsolete) < 0 && !stale_bundle(dst))
		return dst;

So when a change lands while the bundle is being built, the helper sees
gen0 != gen1, but nothing acts on that result.

Here is one sequence. A socket is covered by IPsec policy P1. During
tcp_v6_connect(), someone inserts a higher-priority policy P2 that does
not replace P1, for example a block policy or a different tunnel:

xfrm_policy_insert()
    rt_genid_bump_ipv6(net)   -> fib6_flush_trees(), new node sernums
    (xfrm_policy_kill() only runs for a replaced delpol, so the genid
     of P1 is untouched)

If path_cookie and route_cookie are read after the flush, they already
hold the new fn_sernum.

Would the cached P1 bundle then pass xfrm_bundle_ok() on every later
send, and bypass P2 until some other relevant FIB change?

The next patch in the series ("ipv6: use lookup cookies in selected
socket dst cache paths") fixes this policy bypass for plain routes. That
patch only routes tcp_v6_connect(), ip6_datagram_dst_update() and
ip6_sk_dst_lookup_flow() through this helper, so the bundle case is still
open at the end of the series.

Could the bundle route and path cookies be sampled differently, or could
the detected generation change be passed into the bundle?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794906743.git.ralf%40mandelbit.com

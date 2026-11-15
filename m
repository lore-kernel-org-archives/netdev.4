Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732993;
	b=QIq9GTNAr7Iq0+UaEwre0Iay0NUfB1RqFO63bif71J8XQWezIvcgWw48lHMJUlZxGnYP
	 Jy5tdMd+ClmMLv/r7wjJbG0GYqEfOGGs4XK106fnxbmFH7onLvgciPULRjGN6M7OU433A
	 YpqkrDTrwtae7vLVnyK0uA3p8AqfbsyzOWOF52rxlBy2SPUPkeUM/g1Ev+ymt0JFhv2YQ
	 FufIffjxbvL+dWZgglPG3h63WCF/N//7CgvFexne//gz1DX+9ApRBABJmbiiPcoyoeZKu
	 OXjXu+4Z2XN3wv7DqCA07opXC5jZ4X1m9seiah/i1tJz17q6KSjcnEf+iwzVNYV1u2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732993;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2UW9jHJgU3GDTCyDqq3tjM1WJfMeCrwjZ8NO71WNV7w=;
	b=UQBWGpHqveqsbq1IU4hECry8l1aiWLuALgFBqAh0DFqLeC9ExX7GHnd4SnUrSEoDIMV3
	 LcBqDOCag4KjfjRVlp0b+WnGXLKfDgErfYNJYbjiZ/qFv98Jye0Y4rxyYr9tLJbsTkth4
	 LMogKgZwTM8TSpzKITvlNzj+irYyixXA7HnJjPwT78SfCQrPD7DrsoXFXaGY/DwpNdk16
	 sXU3IgDHeBXTx0ztVPTKMu21WeqZ3vJaRWVEEZDe3CCNFCLoNfW2tSdQOi+zdUFkFQT5d
	 vKOQpilRYaGP2PZoInQcsOS7BDqj5NO4hc9WcQNGR45rDEhSKLIOls5/J61P7R7bnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmKQccVx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0509606A330
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WmKQccVx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F781F000C4;
	Sun, 15 Nov 2026 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732993;
	bh=2UW9jHJgU3GDTCyDqq3tjM1WJfMeCrwjZ8NO71WNV7w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WmKQccVxJbfJypLYF4z03WRNQ1C9BNQwitnZxK0EBEB12bUYbOQ79O4RwB73VbswZ
	 56xLkhDd+4nVci4+qv1HQbRlDWVnbyowoPTo5Lu5Yl+tSR88uATUe5S0krq/TShuNB
	 e2uwEBZJzCAVAA7fNWxazZqkhOepFSPqoJNJw3lJbGhROwW88SupUjbmk+fmPYf2Jo
	 yS4bbZ7hKkQS7TapPK3ZsakcNlHJu0H9gN/VFpqox7XgWUHeBJP2vmwLmLdbul6r/w
	 liZ7Pso+EfNqF2U/+lWk491/jqWxiLBHo9dJgdMR/DY9HpxesKJCZV8fF7kPfwIgjE
	 qZqq4BZUYNenA==
Subject: Re: [PATCH net-next v2 2/3] ipv6: add ip6_dst_lookup_flow_cookie
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 sd@queasysnail.net
Date: Sun, 15 Nov 2026 08:56:32 +0000
Message-ID: <179473299212.2199510.11039200949372183485@kernel.org>
In-Reply-To: <e48cac0cdf9f3adcedecbbfff4a314a98bc22d01.1794384146.git.ralf@mandelbit.com>
References: <e48cac0cdf9f3adcedecbbfff4a314a98bc22d01.1794384146.git.ralf@mandelbit.com>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The stale-cookie race that this patch describes as a general
  flaw of 'callers that keep a dst in a persistent cache' is still…
- [Medium] The gen0/gen1 check in ip6_dst_lookup_flow_cookie() only
  notices a FIB change if the writer updates routing state before…

--

ipv6: add ip6_dst_lookup_flow_cookie

This commit adds ip6_dst_lookup_flow_cookie(). It returns the dst
together with a validation cookie that is sampled between two reads of
the IPv6 generation, and the cookie is 0 if the generation moved during
the lookup. For nexthop-object dsts, ip6_dst_check() now also requires
the cookie to match rt->sernum.

> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 25fe0ba98b1a6..1b273714f7cc3 100644
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

[Severity: High]
The commit message describes the stale cookie as a problem for "Callers
that keep a dst in a persistent cache", and names an xfrm policy
insertion as one trigger. This patch converts no callers.

At the end of the series, only tcp_v6_connect(), ip6_datagram_dst_update()
and ip6_sk_dst_lookup_flow() are converted, by "ipv6: use the lookup
cookie when caching the dst in sockets".

Are the remaining persistent caches still exposed to the same race? The
TCP re-route path, for example, still does this:

net/ipv6/inet6_connection_sock.c:inet6_csk_route_socket() {
    ...
	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);

	if (!IS_ERR(dst))
		ip6_dst_store(sk, dst, false, false);
    ...
}

ip6_dst_store() reads rt6_get_cookie() only after the lookup has
returned. This path runs from inet6_csk_xmit() whenever __sk_dst_check()
fails, and that happens right after a rt_genid_bump_ipv6().

tcp_v6_syn_recv_sock() has the same pattern for accepted sockets. Its
window runs from inet6_csk_route_req() to ip6_dst_store().
inet6_sk_rebuild_header() has the same pattern too.

dst_cache_set_ip6() computes the cookie itself:

net/core/dst_cache.c:dst_cache_set_ip6() {
    ...
	dst_cache_per_cpu_dst_set(idst, dst,
				  rt6_get_cookie(dst_rt6_info(dst)));
    ...
}

It has no parameter for a cookie from the caller. Without a new dst_cache
API, these users can't adopt the new helper:

- udp_tunnel6_dst_lookup() (vxlan, geneve, bareudp)
- ip6_tunnel
- wireguard
- ovpn
- the seg6, rpl, ioam6 and ila lwtunnels
- tipc

Suppose this sequence lands between ip6_dst_lookup_flow() and
rt6_get_cookie() in any of these paths:

xfrm_policy_insert()->rt_genid_bump_ipv6()->__fib6_flush_trees()

The plain route would then be cached with the post-insertion serial and
keep passing rt6_check().

Wouldn't that socket or tunnel keep sending without the new IPsec policy
until the next FIB change? That is the plaintext leak this series sets
out to close.

> + *
> + *	Return: a valid dst pointer on success or a pointer encoded error code.
> + */
> +struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
> +					     const struct sock *sk,
> +					     struct flowi6 *fl6,
> +					     const struct in6_addr *final_dst,
> +					     u32 *cookie)
> +{
> +	const struct rt6_info *rt;
> +	struct dst_entry *dst;
> +	int gen0, gen1;
> +
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

[Severity: Medium]
Can the gen0/gen1 check catch writers that bump the serial before they
finish updating the routing state?

fib6_ifup() clears the nh flags, bumps the serial, and only then
rebalances:

net/ipv6/route.c:fib6_ifup() {
    ...
		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
		fib6_update_sernum_upto_root(net, rt);
		rt6_multipath_rebalance(rt);
    ...
}

fib6_ifdown() uses the same order for NETDEV_DOWN on multipath routes,
and also for NETDEV_CHANGE:

net/ipv6/route.c:fib6_ifdown() {
    ...
			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
						   RTNH_F_LINKDOWN);
			fib6_update_sernum(net, rt);
			rt6_multipath_rebalance(rt);
		}
		return -2;
    ...
}

The -2 return makes the walker skip the other siblings, so no second
bump follows the rebalance.

Suppose gen0 reads the new serial N+1 and fib6_select_path() runs before
rt6_multipath_rebalance(). The lookup then sees the old
fib_nh_upper_bound values. rt6_get_cookie() returns fn_sernum N+1 and
gen1 is also N+1, so the returned cookie is valid. rt6_check() keeps
accepting the dst after that.

rt6_score_route() doesn't check RTNH_F_DEAD or RTNH_F_LINKDOWN. Could
the cached dst then stay pinned to a nexthop that was just marked dead
or link-down, or to a stale weight split, until some unrelated FIB
change?

The writer ordering predates this patch. Still, the kdoc above says "If
the IPv6 FIB changed during the lookup, a route dst no longer validates
with it", and that doesn't seem to hold for these writers.

> +
> +	return dst;
> +}
> +EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow_cookie);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794384146.git.ralf%40mandelbit.com

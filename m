Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516017;
	b=Cr+cClyecPfHZ5ct4sRpn9EMBiKDKlvgkIg8c0muV+nThxm3/tjzxXCDCiU+5OvUm61S
	 x94IdE9N4WeiRM/zZnxcxxwi+0/SwfEssUxmwPDclYP9jFzFEs94vAallCMUs0+kj4lEy
	 DTnGfk5f6wUMm2h9Dxc9RQKRQ9GKgvdCB08B36nwRs246j0bjGX/xFLoGFs25jfBkcw4A
	 oGhipwXwbWLxm0zVYZveuS2JQ+EPvlZ9eDmHm48JEpSo4zdh3yGaZQjpUChtA/JMh2rQT
	 x2gABHsZGGmOCmMMF+AnlDyuDG9Xy4F1ySk/fwf9dU5p9C+CL5IxtPD2E1HITXzoShQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516017;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RR8/wx+Bi2pUf4daCstWfkjJ5lPJfN0XHQOGHvFDzXg=;
	b=p9/jAXQDrvcqBur5p6diiB55FODJcWdVWx92y1KD6gnw1smrSOuO4EB4R5ZCPEfBDJgK
	 JzdciH4fxMOZfIT0ehEN4Y4Q7e3byYKKGnkusCknEL1LVM82KD4umR8dFnAMb4DMxTXmq
	 d5bUB9BmJM/8QWFGAo5z9NSCH1MCw9hz7T4af45enni1VkJWBEV0vosts3yj0yBUGgubB
	 hst2mV0h5j8cZ0OH1KpG+cMM+jN5REk+X2vHm/+DQAKVCQxcVQ0Y1I7lckMd+3BV+y7gO
	 ga0l3awtrCOTtCBKEPTgfXmvraJaC961DhUNgIOfXok4kdp/4Sk6Z6p14fSPE8lbhow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exRdq0Np;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BC606A338;
	Tue, 24 Nov 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exRdq0Np
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E0A1F000D4;
	Tue, 24 Nov 2026 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516016;
	bh=RR8/wx+Bi2pUf4daCstWfkjJ5lPJfN0XHQOGHvFDzXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=exRdq0NpUtTmSkH8QoKpDdNaVH6lsM0El6Ttqg0SNtTQMvjtCrIILilab84hkuaZH
	 PXLw/J9LZQYCO8dXgxjqmxLMJ0epOmuzOnIakEjNCV4cvw5TRWTQTGiA+N5XTI6PmU
	 03B+U8jQrB+LxocxKVvnx5Dyf0QExnc3I+Fi2W0672L/YvsE9S/1cI+f17+Pb83Lf8
	 WQMvJRLv8+v3HKNCIyCoPIjad2yJbXWzTAqKJG4O5maZXBQKtZNpmfhAY9QlLdFn9G
	 TgkHwd9YGy4Y71DjSIhz+1NYhXb7Sq5Mes/pZgykyhMSLXgzW+RggkKm8g5nkjaeOc
	 05xRorL4PtWRg==
Subject: Re: [PATCH net-next v4 4/5] ipv6: add ip6_dst_lookup_flow_cookie
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 yanxia@cmss.chinamobile.com, sd@queasysnail.net, antonio@mandelbit.com,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 10:26:54 +0000
Message-ID: <179551601473.3135.7741252633833955764@kernel.org>
In-Reply-To: <65536a8e6733b8fb94614de2e104548a921a52dd.1795166508.git.ralf@mandelbit.com>
References: <65536a8e6733b8fb94614de2e104548a921a52dd.1795166508.git.ralf@mandelbit.com>
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

Critical: 0 · High: 2 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] ip6_dst_lookup_flow_cookie() (net/ipv6/ip6_output.c) only closes
  the lookup/cookie race when the returned dst is a plain route.
- [High] The generation check in ip6_dst_lookup_flow_cookie() is only
  sound if every writer publishes its full routing/policy change before…

--

ipv6: add ip6_dst_lookup_flow_cookie

This adds ip6_dst_lookup_flow_cookie(). Like ip6_dst_lookup_flow(), it
does the route and xfrm policy lookup, and it also returns the dst
validation cookie. The cookie is sampled between two reads of the IPv6
generation and forced to 0 if the generation changed. A comment is also
added to fib6_new_sernum() describing the writer side ordering that the
helper relies on.

> diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
> index e1d49897d6ab0..1915d31136d65 100644
> --- a/net/ipv6/ip6_fib.c
> +++ b/net/ipv6/ip6_fib.c
> @@ -123,6 +123,10 @@ static void fib6_walkers_skip_rt(struct net *net, struct fib6_info *rt)
>  	fib6_walkers_replace_leaf(net, rt, next);
>  }
>  
> +/* The successful atomic_try_cmpxchg is fully ordered: it publishes the
> + * routing change before the new generation, and the new generation before
> + * the nodes stamped with it. ip6_dst_lookup_flow_cookie relies on both.
> + */

[Severity: High]
Does xfrm_policy_insert() follow this ordering when it replaces an
existing policy (excl == 0)?

In xfrm_policy_insert(), the IPv6 generation is advanced before the
replaced policy is unlinked:

net/xfrm/xfrm_policy.c:xfrm_policy_insert() {
    ...
	__xfrm_policy_link(policy, dir);
    ...
	else
		rt_genid_bump_ipv6(net);

	if (delpol) {
		xfrm_policy_requeue(delpol, policy);
		__xfrm_policy_unlink(delpol, dir);
	}
    ...
}

Nothing advances the generation after the unlink. xfrm_policy_kill(delpol)
only does atomic_inc(&policy->genid), and that only affects bundles.

Suppose the new policy has a larger priority value than the old one, and
a later entry in the chain has priority <= the new priority. Then
xfrm_policy_insert_list() links the new policy behind that entry, which
puts it after the old policy. During this window, xfrm_policy_lookup_bytype()
takes the first match, so it keeps selecting the old policy.

Can this sequence happen?

CPU2 xfrm_policy_insert()        CPU1 ip6_dst_lookup_flow_cookie()
  __xfrm_policy_link(P_new)
  rt_genid_bump_ipv6()  /* G+1 */
                                   gen0 = G+1
                                   xfrm_lookup() matches P_old
                                   (allow, no templates), returns
                                   dst_orig untransformed
                                   *cookie = rt6_get_cookie(rt) = G+1
                                   gen1 = G+1, cookie is kept
  __xfrm_policy_unlink(P_old)

The socket's cached plain route would then keep passing ip6_dst_check().
Traffic would go out in plaintext even though P_new requires IPsec or
blocks the flow. This lasts until an unrelated IPv6 generation change.

The following patch, "ipv6: use lookup cookies in selected socket dst
cache paths", relies on lookup cookies to prevent this kind of plaintext
bypass. No later patch in the series changes xfrm_policy_insert().

> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 3cc911f6618e7..083ffdc8f4046 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c

[ ... ]

> @@ -1300,6 +1299,60 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
>  }
>  EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
>  

[ ... ]

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
> +	/* read the generation before looking at the FIB or xfrm policies,
> +	 * pairs with the full barrier in fib6_new_sernum
> +	 */
> +	smp_rmb();
> +
> +	dst = ip6_dst_lookup_flow(net, sk, fl6, final_dst);
> +	if (IS_ERR(dst))
> +		return dst;
> +
> +	rt = dst_rt6_info(dst);
> +	*cookie = rt->sernum ? gen0 : rt6_get_cookie(rt);
> +
> +	/* keep the FIB and cookie reads before the final generation read,
> +	 * pairs with the full barrier in fib6_new_sernum
> +	 */
> +	smp_rmb();
> +	gen1 = rt_genid_ipv6(net);
> +	if (unlikely(gen0 != gen1))
> +		*cookie = 0;

[Severity: High]
If ip6_dst_lookup_flow() returns an xfrm bundle, does zeroing the cookie
here change anything?

xfrm_dst_check() never reads the cookie:

net/xfrm/xfrm_policy.c:xfrm_dst_check() {
    ...
	if (READ_ONCE(dst->obsolete) < 0 && !stale_bundle(dst))
		return dst;
    ...
}

xfrm_bundle_ok() checks only dst_check(path, path_cookie) and
dst_check(xdst->route, route_cookie), plus the policy and state genids.

Those two cookies are sampled with rt6_get_cookie() after the route and
policy lookups, which is inside the gen0..gen1 window. That is the same
late sampling that the commit message describes as the bug:

net/ipv6/xfrm6_policy.c:xfrm6_fill_dst() {
    ...
	xdst->route_cookie = rt6_get_cookie(rt);
    ...
}

net/xfrm/xfrm_policy.c:xfrm_init_path() {
    ...
		path->path_cookie = rt6_get_cookie(dst_rt6_info(dst));
    ...
}

Could this interleaving occur?

1. A reader (tcp_v6_connect(), ip6_datagram_dst_update() or
   ip6_sk_dst_lookup_flow() after the following patch) reads gen0 = G,
   looks up route R, and xfrm_lookup() selects the existing policy P_old.

2. A higher precedence policy P_new with a different selector is
   inserted, so P_old is not killed and its genid does not change.
   xfrm_policy_insert() calls rt_genid_bump_ipv6() -> fib6_flush_trees(),
   which sets fib6_sernum to G+1 and stamps every node with G+1.

3. The reader's xfrm_bundle_create() then reads route_cookie and
   path_cookie as G+1.

4. Since gen1 != gen0, *cookie is set to 0, but the bundle ignores it.
   The socket caches the bundle. Later dst_check() calls pass because
   fn_sernum is G+1 and P_old->genid has not changed.

The flow would keep using P_old until some unrelated generation change.
That means the old tunnel or SA stays in use, even if P_new is a block
policy. A concurrent fib6_add() of a more specific route could pair the
old xdst->route with a new serial in the same way.

The commit message says:

    xfrm bundles retain their existing validation through their own route
    and path cookies.

That validation depends on the same racy sampling this patch is meant to
fix. The cookie value alone cannot invalidate a bundle, so does the
gen0 != gen1 case need something more? For example, a result telling the
caller not to cache the dst, or marking the bundle obsolete.

> +
> +	return dst;
> +}
> +EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow_cookie);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795166508.git.ralf%40mandelbit.com

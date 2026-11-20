Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140796;
	b=qXVnY/KjgDDaFY5Adcit/Qi6ZAJyFBr/67zmAuoltrzY4BDi1zlLRyyfjFRDbGTzx58M
	 Tzl6G5H6AiyzLfrOWPa2FqPDih/ObzSZOi2uA7/Roeh6vU91WNCGYFpMDxJCE9743pWnc
	 nBtLsix22YQ9DBoKCqcC2pKRST8sbC+7lC5QLKek+0CJuh5Ir47G3ugFiEfVWFXSEAy+T
	 0kx5qy6kDhDdEEkOxVh0VhwCzGeuAq6k68HN0LtOFwPfJdKC71+ZKOo29AwpTaGWSdQRK
	 IV5O7LSm/XcCAfDbGduUnPlhtzqipkLIzlnLY9d9YWfPRJWQ/gctAONBCRCsLSxL0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140796;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ws6BnD7DvrtX7tpZzVtK4JHO3eme1zv2JhnGB9HbSQY=;
	b=RZafpf9GI1W0gXsT8HH5uD8VbNL/BixqgBS1mCrh+uEUxQX1CT693IQkhEynY/4oTBbH
	 fslVcglPjJ3cw44pTevPmMKm5IUa4WkosvBFvgUAwlXVqh1KzNfh6UfTkeLFFtVkDfHrc
	 RG2thuqQK/P8QFRfKxQPpjkDRnWvv2DDHrfAw33HGXoNiAyW0ehROlIky2NJUY8NNSJIr
	 BIlEso5ClO9OiRTMTsYCHcmGWeFfEvnwFs5pHWgnJZxdXtKEuFdbzukPHgd67yHXPbprf
	 fnKuLJRzHtVPXdF8/kQuCJOsHGtOaoEiE8SfX5jdm8jmerLpKcHIqLgWFoQZJtRbT6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SL55XnNI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B74D606A326;
	Fri, 20 Nov 2026 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SL55XnNI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2991F000C4;
	Fri, 20 Nov 2026 02:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795140795;
	bh=ws6BnD7DvrtX7tpZzVtK4JHO3eme1zv2JhnGB9HbSQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SL55XnNIR1wy0o5ZKorhvb8MyeWJhn7wF+uTS1ukf6zCbZ2lMRbVz8390mfnAe7fv
	 rs2RYHdeH++oDr9ry6K3PhiZubVnDrMgD81Ox9bLWfe3Gi2aLaVbud2mp+p5ihR4Yk
	 zW1FeObElDiOdXQrEdxXyIHorJ5y/2E2z5af7BnplJDYYjXTS7Tqrb+IkAI/zw5jYT
	 JZygLDIbKC4JJ2xeg6sjnObF7oMcBAIUrinfSqs95Of1IXKWsV2WYs86dGJ/VXJDpq
	 CAa6k2iuWHQVBf0qMIE364UzHAO261lTtl1wraAtTs0qNCr3neTFpfC/+aZ9KojbI1
	 MG1KqMg6eNKgg==
Message-ID: <677402dc-c023-4c41-b437-f29083ab2a35@kernel.org>
Date: Thu, 19 Nov 2026 19:13:14 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
To: Ralf Lici <ralf@mandelbit.com>, netdev@vger.kernel.org
Cc: Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Florian Westphal <fw@strlen.de>,
 Sabrina Dubroca <sd@queasysnail.net>,
 Antonio Quartulli <antonio@mandelbit.com>, linux-kernel@vger.kernel.org
References: <cover.1794906743.git.ralf@mandelbit.com>
 <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
Content-Language: en-US
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <7af19082325ce83699c5fd82de4925e52ed7dff2.1794906743.git.ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 2:21 AM, Ralf Lici wrote:
> Persistent dst caches read the validation cookie with rt6_get_cookie
> after route lookup has returned. For routes without their own sernum,
> this reads the current fn_sernum of the associated node. A concurrent
> FIB change or xfrm policy insertion can therefore pair an old dst with a
> new serial, allowing subsequent dst_check calls to accept the stale
> result until another relevant change.
> 
> Add ip6_dst_lookup_flow_cookie to return the dst together with its
> validation cookie. Sample the cookie between two reads of the IPv6
> generation and return cookie 0 if the generation changed. This lets the
> route dst serve the current packet while preventing its subsequent reuse
> through cache validation. xfrm bundles retain their existing validation
> through their own route and path cookies.
> 
> For nexthop-object dsts, return the pre-lookup generation and require
> the supplied cookie to match rt->sernum in ip6_dst_check. This also
> rejects a dst allocated with a newer serial after route selection.
> Existing callers passing rt6_get_cookie retain their validation
> behavior.
> 
> The generation checks require writers to publish routing changes before
> advancing the serial. Move the serial updates in fib6_ifup and
> fib6_ifdown after rt6_multipath_rebalance, preserving their existing
> invalidation scope. Otherwise, a lookup can observe the new serial while
> selecting a nexthop using the old ECMP bounds, without detecting a
> generation change.
> 
> This establishes the API and writer ordering needed to address late
> cookie sampling. The following patch converts selected socket cache
> users while other persistent caches are left for follow-up conversions.
> 
> Signed-off-by: Ralf Lici <ralf@mandelbit.com>
> ---
> Changes since v2 https://lore.kernel.org/all/e48cac0cdf9f3adcedecbbfff4a314a98bc22d01.1794384146.git.ralf@mandelbit.com/
> - Move the serial update after rt6_multipath_rebalance in fib6_ifup and
>   fib6_ifdown. (Sashiko)
> - Clarify that this introduces the new API while the following patch
>   converts *some* users to it while leaving the rest as follow-up.
> 
> Changes since v1 https://lore.kernel.org/netdev/e40f48e925a0950eac99a3f084e485e82cabe88f.1793806941.git.ralf@mandelbit.com/
> - Fix kdoc return statement in ip6_dst_lookup_flow and
>   ip6_dst_lookup_flow_cookie. (NIPA)
> 
>  include/net/ipv6.h    | 13 +++++++++++
>  net/ipv6/ip6_output.c | 51 +++++++++++++++++++++++++++++++++++++++++--
>  net/ipv6/route.c      |  8 +++----
>  3 files changed, 66 insertions(+), 6 deletions(-)
> 
> diff --git a/include/net/ipv6.h b/include/net/ipv6.h
> index 579df1516d25..5a6c66504056 100644
> --- a/include/net/ipv6.h
> +++ b/include/net/ipv6.h
> @@ -1062,6 +1062,11 @@ int ip6_dst_lookup(struct net *net, struct sock *sk, struct dst_entry **dst,
>  #if IS_ENABLED(CONFIG_IPV6)
>  struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, struct flowi6 *fl6,
>  				      const struct in6_addr *final_dst);
> +struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
> +					     const struct sock *sk,
> +					     struct flowi6 *fl6,
> +					     const struct in6_addr *final_dst,
> +					     u32 *cookie);
>  #else
>  static inline struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk,
>  						    struct flowi6 *fl6,
> @@ -1069,6 +1074,14 @@ static inline struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struc
>  {
>  	return ERR_PTR(-EAFNOSUPPORT);
>  }
> +
> +static inline struct dst_entry *
> +ip6_dst_lookup_flow_cookie(struct net *net, const struct sock *sk,
> +			   struct flowi6 *fl6, const struct in6_addr *final_dst,
> +			   u32 *cookie)
> +{
> +	return ERR_PTR(-EAFNOSUPPORT);
> +}
>  #endif
>  
>  struct dst_entry *ip6_sk_dst_lookup_flow(struct sock *sk, struct flowi6 *fl6,
> diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> index 3cc911f6618e..b87ccb5586cf 100644
> --- a/net/ipv6/ip6_output.c
> +++ b/net/ipv6/ip6_output.c
> @@ -1279,8 +1279,7 @@ EXPORT_SYMBOL_GPL(ip6_dst_lookup);
>   *
>   *	This function performs a route lookup on the given flow.
>   *
> - *	It returns a valid dst pointer on success, or a pointer encoded
> - *	error code.
> + *	Return: a valid dst pointer on success or a pointer encoded error code.
>   */
>  struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, struct flowi6 *fl6,
>  				      const struct in6_addr *final_dst)
> @@ -1300,6 +1299,54 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
>  }
>  EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
>  
> +/**
> + *	ip6_dst_lookup_flow_cookie - perform route lookup on flow with ipsec

what makes this an ipsec lookup?

> + *				     and return the matching dst cookie
> + *	@net: Network namespace to perform lookup in
> + *	@sk: socket which provides route info
> + *	@fl6: flow to lookup
> + *	@final_dst: final destination address for ipsec lookup
> + *	@cookie: where to store the cookie for the returned dst
> + *
> + *	Same as ip6_dst_lookup_flow, but also returns the cookie describing
> + *	the routing state the dst was obtained from. A caller caching the dst
> + *	should use this cookie when validating it with dst_check. If the
> + *	IPv6 FIB changed during the lookup, a route dst no longer validates
> + *	with it. An xfrm bundle is validated by xfrm and ignores the cookie.
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
> +
> +	return dst;
> +}
> +EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow_cookie);

I think this can be a standalone patch introducing a new API

> +
>  /**
>   *	ip6_sk_dst_lookup_flow - perform socket cached route lookup on flow
>   *	@sk: socket which provides the dst cache and route info
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index cc505817399b..c54844b83828 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2817,7 +2817,7 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
>  	rt = dst_rt6_info(dst);
>  
>  	if (rt->sernum)
> -		return rt6_is_valid(rt) ? dst : NULL;
> +		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;

unrelated change to both the new API and the ordering changes below. It
deserves to be a separate patch with its own clear explanation of why.

>  
>  	rcu_read_lock();
>  
> @@ -4911,8 +4911,8 @@ static int fib6_ifup(struct fib6_info *rt, void *p_arg)
>  	if (rt != net->ipv6.fib6_null_entry && !rt->nh &&
>  	    rt->fib6_nh->fib_nh_dev == arg->dev) {
>  		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
> -		fib6_update_sernum_upto_root(net, rt);
>  		rt6_multipath_rebalance(rt);
> +		fib6_update_sernum_upto_root(net, rt);
>  	}
>  
>  	return 0;
> @@ -5015,8 +5015,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
>  			}
>  			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
>  						   RTNH_F_LINKDOWN);
> -			fib6_update_sernum(net, rt);
>  			rt6_multipath_rebalance(rt);
> +			fib6_update_sernum(net, rt);
>  		}
>  		return -2;
>  	case NETDEV_CHANGE:
> @@ -5024,8 +5024,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
>  		    rt->fib6_flags & (RTF_LOCAL | RTF_ANYCAST))
>  			break;
>  		rt->fib6_nh->fib_nh_flags |= RTNH_F_LINKDOWN;
> -		fib6_update_sernum(net, rt);
>  		rt6_multipath_rebalance(rt);
> +		fib6_update_sernum(net, rt);
>  		break;
>  	}
>  

And then these ordering changes need to be separate patch with an
explanation.


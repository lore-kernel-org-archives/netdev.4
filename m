Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163056;
	b=ZjTDMDXZ1C7eVqgfQAxFuJNKYtH6WAt3dMsq3ZyHaaKtRSTaSmCfTlw7bYGMwPxOiOMP
	 BvSHqB0yXNXsK8Lrgjz4wSfjw4Vofmfu/u1Fn0l0e+UkX9dTBx/c3vD08YZUw22nFukoZ
	 lztqdR6GZ7c4P88bg4OyUCmcAJItpCh5O5oWD8+CEh3Gt+1w6iY43xjFF8CTkJPHStfgz
	 Ha1qn6QgVglsX5lbgtH745IK1+yR5jyd9EZUdi1YZvp9KHiULozvqntoxrlRqfq0/Nz1Q
	 nh/bHDNMZZSqH9XKwtNCXq/cULaZ5twad3r1eAVrSChYJpNxdO6W7LyR8MMsVgsg+Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163056;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=7LKSKk2iD+DknScAygyVvaiVz+L1R9/iJ/TN8A2KQss=;
	b=fS7rc9GmWZRv3r1cBR1xfLXeHzt0Txx93CA+keddrcitMimn9ejQOmDaw9+usfF+Mb7U
	 521f9+DBkB5bzOD4CjSW1SoF2VnifnqaXi7JJTOpFQiLrgiA7uvhrVoI0ZB0JTK1hQZ7g
	 CQAtuaF7vlvSVbephMo5ArlkLbisDvKLPGYrZ15Xe86c12nhnVs6Usn0IO4mn1z5Byrxz
	 JHtjpkd+d/48nmCrJvmFS+hMaFij1J1vHagXFdm2AR6zdQU7tiSSIPs6xLnih00BiV7G8
	 GVQbWHWMjqXjPhbWQq89u3TXIR/7mOkoGy/ZKr0PtR8p4FvpWu67ikLbTjo/2HMUg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=NnVJIhtn;
	arc=none smtp.remote-ip=195.10.208.46
Received: from mout-b-106.mailbox.org (mout-b-106.mailbox.org [195.10.208.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17272606A320;
	Fri, 20 Nov 2026 08:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17272606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=NnVJIhtn
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-106.mailbox.org (Postfix) with ESMTPS id 4jW7TM1vvWzNlwH;
	Fri, 20 Nov 2026 09:16:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795162583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LKSKk2iD+DknScAygyVvaiVz+L1R9/iJ/TN8A2KQss=;
	b=NnVJIhtnN8kNzPQZPmGXKZcsAFUJT5T0f2koOkKfZiftoNKUPaEeyqWiej/QIr9nObrUcw
	AXaXIhNtZv9SMSbAd3mbQwpdv/y7+fjZYqyBLG5lECWU6SiBTtVPcdo1OESYZFC/SGmhvb
	Ws9fsCHK+mUFj6OJgk28tDS8TA6wdRHU4a1HHW+9Ds0t7KynZB76/M8sUSDybxNymwijXA
	Ju8lAfZUqWPbxN9aq10wXZ9rVG3MmsBiAaQh/IkCoKHjtHrR2LXSVL6ViiY7ARLEA3Kv1a
	uoOh5TjGpTeSgnhZxE11UB7zjeEzE3juTk/ZjJwgtqfvneRDEDoGqjymyXCDEg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Florian Westphal <fw@strlen.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Antonio Quartulli <antonio@mandelbit.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
Date: Fri, 20 Nov 2026 09:16:03 +0100
Message-ID: <20261120081604.71209-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <677402dc-c023-4c41-b437-f29083ab2a35@kernel.org>
References: <677402dc-c023-4c41-b437-f29083ab2a35@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jW7TM1vvWzNlwH

Hi David,

On Thu, 19 Nov 2026 19:13:14 -0700, David Ahern <dsahern@kernel.org> wrote:
> On 11/17/26 2:21 AM, Ralf Lici wrote:
> > @@ -1300,6 +1299,54 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
> >  }
> >  EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
> >  
> > +/**
> > + *	ip6_dst_lookup_flow_cookie - perform route lookup on flow with ipsec
>
> what makes this an ipsec lookup?
>

Like ip6_dst_lookup_flow, which it wraps, it calls xfrm_lookup_route
after the route lookup, so the returned dst can be an xfrm bundle, and
the generation check also covers xfrm policy insertion, which advances
the IPv6 generation through rt_genid_bump_ipv6.

The summary line was inherited from ip6_dst_lookup_flow but I'll reword
it in v4 to say route and xfrm policy lookup.

> > + *				     and return the matching dst cookie
> > + *	@net: Network namespace to perform lookup in
> > + *	@sk: socket which provides route info
> > + *	@fl6: flow to lookup
> > + *	@final_dst: final destination address for ipsec lookup
> > + *	@cookie: where to store the cookie for the returned dst
> > + *
> > + *	Same as ip6_dst_lookup_flow, but also returns the cookie describing
> > + *	the routing state the dst was obtained from. A caller caching the dst
> > + *	should use this cookie when validating it with dst_check. If the
> > + *	IPv6 FIB changed during the lookup, a route dst no longer validates
> > + *	with it. An xfrm bundle is validated by xfrm and ignores the cookie.
> > + *
> > + *	Return: a valid dst pointer on success or a pointer encoded error code.
> > + */
> > +struct dst_entry *ip6_dst_lookup_flow_cookie(struct net *net,
> > +					     const struct sock *sk,
> > +					     struct flowi6 *fl6,
> > +					     const struct in6_addr *final_dst,
> > +					     u32 *cookie)
> > +{
> > +	const struct rt6_info *rt;
> > +	struct dst_entry *dst;
> > +	int gen0, gen1;
> > +
> > +	gen0 = rt_genid_ipv6(net);
> > +	/* read the generation before looking at the FIB or xfrm policies */
> > +	smp_rmb();
> > +
> > +	dst = ip6_dst_lookup_flow(net, sk, fl6, final_dst);
> > +	if (IS_ERR(dst))
> > +		return dst;
> > +
> > +	rt = dst_rt6_info(dst);
> > +	*cookie = rt->sernum ? gen0 : rt6_get_cookie(rt);
> > +
> > +	/* keep the FIB and cookie reads before the final generation read */
> > +	smp_rmb();
> > +	gen1 = rt_genid_ipv6(net);
> > +	if (unlikely(gen0 != gen1))
> > +		*cookie = 0;
> > +
> > +	return dst;
> > +}
> > +EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow_cookie);
>
> I think this can be a standalone patch introducing a new API
>

Ok.

> > +
> >  /**
> >   *	ip6_sk_dst_lookup_flow - perform socket cached route lookup on flow
> >   *	@sk: socket which provides the dst cache and route info
> > diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> > index cc505817399b..c54844b83828 100644
> > --- a/net/ipv6/route.c
> > +++ b/net/ipv6/route.c
> > @@ -2817,7 +2817,7 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
> >  	rt = dst_rt6_info(dst);
> >  
> >  	if (rt->sernum)
> > -		return rt6_is_valid(rt) ? dst : NULL;
> > +		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;
>
> unrelated change to both the new API and the ordering changes below. It
> deserves to be a separate patch with its own clear explanation of why.
>

It is the validation side of the new API for nexthop-object dsts: the
helper returns the generation sampled before the lookup as their cookie,
and ip6_dst_check currently ignores the cookie when rt->sernum is set.
Existing callers pass rt6_get_cookie, which returns rt->sernum for these
dsts, so their behavior does not change. I'll move it to its own patch
with that explanation.

> >  
> >  	rcu_read_lock();
> >  
> > @@ -4911,8 +4911,8 @@ static int fib6_ifup(struct fib6_info *rt, void *p_arg)
> >  	if (rt != net->ipv6.fib6_null_entry && !rt->nh &&
> >  	    rt->fib6_nh->fib_nh_dev == arg->dev) {
> >  		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
> > -		fib6_update_sernum_upto_root(net, rt);
> >  		rt6_multipath_rebalance(rt);
> > +		fib6_update_sernum_upto_root(net, rt);
> >  	}
> >  
> >  	return 0;
> > @@ -5015,8 +5015,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
> >  			}
> >  			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
> >  						   RTNH_F_LINKDOWN);
> > -			fib6_update_sernum(net, rt);
> >  			rt6_multipath_rebalance(rt);
> > +			fib6_update_sernum(net, rt);
> >  		}
> >  		return -2;
> >  	case NETDEV_CHANGE:
> > @@ -5024,8 +5024,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
> >  		    rt->fib6_flags & (RTF_LOCAL | RTF_ANYCAST))
> >  			break;
> >  		rt->fib6_nh->fib_nh_flags |= RTNH_F_LINKDOWN;
> > -		fib6_update_sernum(net, rt);
> >  		rt6_multipath_rebalance(rt);
> > +		fib6_update_sernum(net, rt);
> >  		break;
> >  	}
> >  
>
> And then these ordering changes need to be separate patch with an
> explanation.
>
>

Ok. v4 will be:

1. ipv6: stamp the default route node with a fresh serial on link
   failure
2. ipv6: advance the serial after rebalancing in fib6_ifup and
   fib6_ifdown
3. ipv6: validate the cookie of nexthop-object dsts in ip6_dst_check
4. ipv6: add ip6_dst_lookup_flow_cookie
5. ipv6: use lookup cookies in selected socket dst cache paths

so that the requirements are in place before the API and its users.

Thanks for the review.

-- 
Ralf Lici
Mandelbit Srl

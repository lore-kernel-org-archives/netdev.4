Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819506;
	b=Wd0AUn5Uf6eZBWjuEhUvr1/Ixw9RdMxlGG3FlibcPmR22UWPBdIH1FDm/go0uy0/k4pJ
	 pP3ZA0JatZk5/015rv0v+jFiefesxlYKfeD2o3yUGGdasu6LXXbC5sIPZip0Qntp1jtPO
	 TXQaoKBpYnXn/ilWF3nb0lC2p5z0xyAuy1RDzQIdRCNicX0pBrxacr7qn8AcW+dEEyaOV
	 kSP2/s+3pLxnOC6sGmQgLfAb8YXDZKtxQL4BzK7l+Tbb4WNa32B6IFp8CT+MUel5GHtGf
	 6fit9JHkq9JFW3rglXhaALZfgDoEmjziBAnDwasrRK3EPE8TpTUF4pTZGYpBebSGdVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819506;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=d+qrq6vv2aw2bL74uQkrGOOKi6zkgV0o1N/w1R0SAZI=;
	b=uvYYykUavpKHzgnksO5NBAI1ez6kWdAzFipDYEfE5QUjjKKXdjfylwrd2mKliJEbNZOP
	 wIJpYB9QxfqUV28WWhQWY6tKov50hI39Khl5ATeb54WCNzIHkdSlokcyjWVB0/IQ6f6Ig
	 5YFqFGKNG1eId6P+DyGH8PVZLtfsWufLfgCQQSOWYySxtlT7to3IfIZv2S7FOXK4NHBhh
	 G7GwTQTNuo/u36fcN9YgIA50g8OXdwriYZ7isAvgsWvOCH015NdOMXG5/7xEgnPpKESLX
	 jaKGtF+tr7K4bd061vdLWYzbV2geJBcZrt63FkQgPKYHOxj7cTAaD9LGzuf0Cm4eG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=Tseskbbx;
	arc=none smtp.remote-ip=195.10.208.52
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45FB606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=Tseskbbx
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4jShbX4JBDzLlyk;
	Mon, 16 Nov 2026 09:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794819496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+qrq6vv2aw2bL74uQkrGOOKi6zkgV0o1N/w1R0SAZI=;
	b=TseskbbxTohLs5DpmA50zBki6CifID/4T6lQFxUFAWvTM550e6xe0cmjmpaPEdpx3/+ZIW
	jmnzr1qSoumeFgwM3nAZWsFqcRcqOiH1D5zHVzRi/FJuKVJTW5y3MdhQMf84DyJHmWH+Wv
	ilphG0CSefACuTYsnw8W8Q+aOUxev98KhBaIDEJ8SW+K0Fz0lGGZuHtvY7DNrji8lojm4I
	W10xpmURHYL8xDIGVnwwVy1SAzFRJg0nqUbuQM3AKfbTdJKJaYrcCZmSOJln6CwIceehYg
	QuEjmRcwAX4ZL4Gc8VRSR2LFbBOfXytMlzjJlYUsrylJES4rzPQkhNUdd43zfA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	fw@strlen.de,
	sd@queasysnail.net
Subject: Re: [PATCH net-next v2 2/3] ipv6: add ip6_dst_lookup_flow_cookie
Date: Mon, 16 Nov 2026 09:58:05 +0100
Message-ID: <20261116085806.88363-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179473299212.2199510.11039200949372183485@kernel.org>
References: <179473299212.2199510.11039200949372183485@kernel.org>
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
X-Rspamd-Queue-Id: 4jShbX4JBDzLlyk

On Sun, 15 Nov 2026 08:56:32 +0000, netdev-bot+sashiko@kernel.org wrote:
> > diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
> > index 25fe0ba98b1a6..1b273714f7cc3 100644
> > --- a/net/ipv6/ip6_output.c
> > +++ b/net/ipv6/ip6_output.c
>
> [ ... ]
>
> > @@ -1300,6 +1299,54 @@ struct dst_entry *ip6_dst_lookup_flow(struct net *net, const struct sock *sk, st
> >  }
> >  EXPORT_SYMBOL_GPL(ip6_dst_lookup_flow);
> >  
> > +/**
> > + *	ip6_dst_lookup_flow_cookie - perform route lookup on flow with ipsec
> > + *				     and return the matching dst cookie
>
> [ ... ]
>
> > + *	Same as ip6_dst_lookup_flow, but also returns the cookie describing
> > + *	the routing state the dst was obtained from. A caller caching the dst
> > + *	should use this cookie when validating it with dst_check. If the
> > + *	IPv6 FIB changed during the lookup, a route dst no longer validates
> > + *	with it. An xfrm bundle is validated by xfrm and ignores the cookie.
>
> [Severity: High]
> The commit message describes the stale cookie as a problem for "Callers
> that keep a dst in a persistent cache", and names an xfrm policy
> insertion as one trigger. This patch converts no callers.
>
> At the end of the series, only tcp_v6_connect(), ip6_datagram_dst_update()
> and ip6_sk_dst_lookup_flow() are converted, by "ipv6: use the lookup
> cookie when caching the dst in sockets".
>
> Are the remaining persistent caches still exposed to the same race? The
> TCP re-route path, for example, still does this:
>
> net/ipv6/inet6_connection_sock.c:inet6_csk_route_socket() {
>     ...
> 	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
>
> 	if (!IS_ERR(dst))
> 		ip6_dst_store(sk, dst, false, false);
>     ...
> }
>
> ip6_dst_store() reads rt6_get_cookie() only after the lookup has
> returned. This path runs from inet6_csk_xmit() whenever __sk_dst_check()
> fails, and that happens right after a rt_genid_bump_ipv6().
>
> tcp_v6_syn_recv_sock() has the same pattern for accepted sockets. Its
> window runs from inet6_csk_route_req() to ip6_dst_store().
> inet6_sk_rebuild_header() has the same pattern too.
>
> dst_cache_set_ip6() computes the cookie itself:
>
> net/core/dst_cache.c:dst_cache_set_ip6() {
>     ...
> 	dst_cache_per_cpu_dst_set(idst, dst,
> 				  rt6_get_cookie(dst_rt6_info(dst)));
>     ...
> }
>
> It has no parameter for a cookie from the caller. Without a new dst_cache
> API, these users can't adopt the new helper:
>
> - udp_tunnel6_dst_lookup() (vxlan, geneve, bareudp)
> - ip6_tunnel
> - wireguard
> - ovpn
> - the seg6, rpl, ioam6 and ila lwtunnels
> - tipc
>
> Suppose this sequence lands between ip6_dst_lookup_flow() and
> rt6_get_cookie() in any of these paths:
>
> xfrm_policy_insert()->rt_genid_bump_ipv6()->__fib6_flush_trees()
>
> The plain route would then be cached with the post-insertion serial and
> keep passing rt6_check().
>
> Wouldn't that socket or tunnel keep sending without the new IPsec policy
> until the next FIB change? That is the plaintext leak this series sets
> out to close.
>

This is the deliberate scope of the series, as described in the cover
letter. The remaining TCP paths and other persistent caches are left for
follow-up conversions.

The goal here is to introduce the lookup-cookie API with a small set of
users and get feedback on the approach before extending the conversion
across the networking core and drivers. Is there a reason that this
incremental introduction would be unsuitable?

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
>
> [Severity: Medium]
> Can the gen0/gen1 check catch writers that bump the serial before they
> finish updating the routing state?
>
> fib6_ifup() clears the nh flags, bumps the serial, and only then
> rebalances:
>
> net/ipv6/route.c:fib6_ifup() {
>     ...
> 		rt->fib6_nh->fib_nh_flags &= ~arg->nh_flags;
> 		fib6_update_sernum_upto_root(net, rt);
> 		rt6_multipath_rebalance(rt);
>     ...
> }
>
> fib6_ifdown() uses the same order for NETDEV_DOWN on multipath routes,
> and also for NETDEV_CHANGE:
>
> net/ipv6/route.c:fib6_ifdown() {
>     ...
> 			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
> 						   RTNH_F_LINKDOWN);
> 			fib6_update_sernum(net, rt);
> 			rt6_multipath_rebalance(rt);
> 		}
> 		return -2;
>     ...
> }
>
> The -2 return makes the walker skip the other siblings, so no second
> bump follows the rebalance.
>
> Suppose gen0 reads the new serial N+1 and fib6_select_path() runs before
> rt6_multipath_rebalance(). The lookup then sees the old
> fib_nh_upper_bound values. rt6_get_cookie() returns fn_sernum N+1 and
> gen1 is also N+1, so the returned cookie is valid. rt6_check() keeps
> accepting the dst after that.
>
> rt6_score_route() doesn't check RTNH_F_DEAD or RTNH_F_LINKDOWN. Could
> the cached dst then stay pinned to a nexthop that was just marked dead
> or link-down, or to a stale weight split, until some unrelated FIB
> change?
>
> The writer ordering predates this patch. Still, the kdoc above says "If
> the IPv6 FIB changed during the lookup, a route dst no longer validates
> with it", and that doesn't seem to hold for these writers.
>

Right, this appears to expose a pre-existing writer-side ordering issue.
Moving the serial update after rt6_multipath_rebalance, while preserving
the existing node/ancestor invalidation scope, looks like the
appropriate fix: the new serial would then be published after the
routing state it describes.

That needs validation, but it can be addressed as a separate writer-side
fix without changing the proposed lookup-cookie API.

-- 
Ralf Lici
Mandelbit Srl

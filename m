Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091519;
	b=lVtxkSCAKf26ql1s/zRyptR68DyC5oNkdcmoR8Uwc14E4T3HIf7UbtAsdVY4FOfKRq81
	 naOk7IJn5Ps0PZh9h0o0afNZBZam5+9EO4dOve/NNkhzqA7LyoKMniKV/KyCu3GFml5ZN
	 wRkO0pOm5vEU8kY0AG4WgJyt7FJVQCO36Hl+dlaYLPxZybgq5auPNoXKkc4BYaEQHmkNg
	 +T8iZyW0hwtBk88C2ZvI2vNXdQMILQ13fKEs7U3sWbNdY2c2ZsardJDwsOi4RLUBqTSyQ
	 WqODYYKqFFmmdlDFNgCKzT5+ZFjbUgJLOStYpvlizMJ9l+K101KmboaQffGMga5TxsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091519;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=PIbOxOg8FM/DRXd4djXsQpjPVjSRPF5mihfK2YtuonE=;
	b=jpB+2NgooZQ78/UxDzDCMEVnbmOIA9FXdqvgQkown2aO2RudjGiel42gbPVWx3xfLtwM
	 vJEa1NVXDupDF188R+CXO56LerswFukyaugXcnlFddsNfYY6aQMEaQL3ObPje1RC/9uZr
	 BXPvJ0M+f6cl9FQ9OhOTxYGgGZ5VRP3vq2cQADCcILZDp/sJ5bYMsdLYAgsgUNNPcDiD6
	 vUgmOLDhEyiir27arpx1/8y3NNTxYjlJPjOUvZC8uKEgF6BA8HzYVjVJxwwKWdIUVB2AE
	 rLrTKrzg7U6M1K+4bHEdwjnz/0ZFeVVEdE6kHXVIEutE0HYOIp8fL/aMsc516fGJoKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=wuGJH7OY;
	arc=none smtp.remote-ip=195.10.208.62
Received: from mout-b-202.mailbox.org (mout-b-202.mailbox.org [195.10.208.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313A606A326;
	Thu, 19 Nov 2026 12:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E313A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=wuGJH7OY
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-202.mailbox.org (Postfix) with ESMTPS id 4jVdBX5rpnzKm4P;
	Thu, 19 Nov 2026 13:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795091508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PIbOxOg8FM/DRXd4djXsQpjPVjSRPF5mihfK2YtuonE=;
	b=wuGJH7OYFgau1Lu9kuq/0CSPIOYMo2y7DbcfBgabMdVUaj3E1A/lcXVJw+9nlFr+1csOw9
	BPKAES/GwDzuoykrOK7LpOyx8IvgL4KjMH7QV+llhs9r7jNeKvisc4p0yNE8BiH9uOOrt8
	cQwcMQveMTY++j0v9jfpXC91cv0bfCs+y4DO6eEtjRvCGiImAGsNXR9XIfm4orF29td1v8
	yiMcaclviflYofGXaVPNOSGM7+6qrydeUjJ3R3pwMhnnpZZxEgg2vbPDLiOJUqpFml4mK+
	kqm8XAfG9cyqQgnXlp/mQ1bqNWQgEqYjq+SfWO4a0QnYDvQ8RGsaEJ5MA3VKnQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
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
	sd@queasysnail.net,
	antonio@mandelbit.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/3] ipv6: add ip6_dst_lookup_flow_cookie
Date: Thu, 19 Nov 2026 13:31:36 +0100
Message-ID: <20261119123138.416106-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179508017446.3136.16309442875415057261@kernel.org>
References: <179508017446.3136.16309442875415057261@kernel.org>
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
X-Rspamd-Queue-Id: 4jVdBX5rpnzKm4P

On Thu, 19 Nov 2026 09:22:54 +0000, netdev-bot+sashiko@kernel.org wrote:
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
> [Severity: Low]
> Does this guarantee hold for nexthop-object dsts (rt->sernum != 0) when
> the FIB change is a route deletion?
>
> For those dsts the helper returns gen0, and ip6_dst_check() only checks
> this:
>
> 	if (rt->sernum)
> 		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;
>
> It never looks at rt->from.
>
> Route deletion goes through
> fib6_del()->fib6_del_route()->fib6_purge_rt()->__fib6_drop_pcpu_from().
> None of these call fib6_new_sernum(), so net->ipv6.fib6_sernum does not
> change. Deletion only clears pcpu_rt->from:
>
> 	from = unrcu_pointer(xchg(&pcpu_rt->from, NULL));
> 	fib6_info_release(from);
>
> Say the selected nexthop-object route is deleted between the gen0 and
> gen1 reads. Then gen0 == gen1, and the cookie still matches
> pcpu_rt->sernum. The cached dst keeps validating until some unrelated
> generation bump, such as any route insertion in the netns.
>
> The stale-dst behavior itself predates this patch, since callers of
> rt6_get_cookie() also get rt->sernum. What is new is this kdoc claim on
> a new exported API.
>
> Could the comment be narrowed so future callers don't assume deletions
> are covered?
>

Right, deletion does not advance the generation, and the rt->sernum
branch of ip6_dst_check never looks at rt->from. This predates the
series, but the kdoc should not promise more than the helper does. I'll
narrow it to FIB changes that advance the IPv6 generation in the next
revision.

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
> [Severity: High]
> Does setting the cookie to 0 here have any effect when
> ip6_dst_lookup_flow() returned an xfrm bundle?
>

No, it doesn't. Bundles are validated by xfrm_bundle_ok against their
own route and path cookies, which are still sampled late in
xfrm_bundle_create. The cover letter lists the xfrm bundle cookies among
the cache users this series does not convert.

> The commit message says:
>
>     xfrm bundles retain their existing validation
>     through their own route and path cookies.
>
> However, those cookies are sampled late too, which is the pattern the
> commit calls buggy. Both are set inside xfrm_bundle_create(). That runs
> after ip6_dst_lookup_tail() picked the route, and after policy lookup and
> state resolution:
>
> net/xfrm/xfrm_policy.c:xfrm_init_path() {
>     ...
> 		path->path_cookie = rt6_get_cookie(dst_rt6_info(dst));
>     ...
> }
>
> net/ipv6/xfrm6_policy.c:xfrm6_fill_dst() {
>     ...
> 	xdst->route_cookie = rt6_get_cookie(rt);
>     ...
> }
>
> xfrm_bundle_ok() then validates only against those two cookies:
>
> 	if (!dst_check(xfrm_dst_path(dst), ((struct xfrm_dst *)dst)->path_cookie) ||
>     ...
> 		if (!dst_check(xdst->route, xdst->route_cookie))
> 			return 0;
>
> xfrm_dst_check() ignores the cookie the socket stored:
>
> 	if (READ_ONCE(dst->obsolete) < 0 && !stale_bundle(dst))
> 		return dst;
>
> So when a change lands while the bundle is being built, the helper sees
> gen0 != gen1, but nothing acts on that result.
>
> Here is one sequence. A socket is covered by IPsec policy P1. During
> tcp_v6_connect(), someone inserts a higher-priority policy P2 that does
> not replace P1, for example a block policy or a different tunnel:
>
> xfrm_policy_insert()
>     rt_genid_bump_ipv6(net)   -> fib6_flush_trees(), new node sernums
>     (xfrm_policy_kill() only runs for a replaced delpol, so the genid
>      of P1 is untouched)
>
> If path_cookie and route_cookie are read after the flush, they already
> hold the new fn_sernum.
>
> Would the cached P1 bundle then pass xfrm_bundle_ok() on every later
> send, and bypass P2 until some other relevant FIB change?
>
> The next patch in the series ("ipv6: use lookup cookies in selected
> socket dst cache paths") fixes this policy bypass for plain routes. That
> patch only routes tcp_v6_connect(), ip6_datagram_dst_update() and
> ip6_sk_dst_lookup_flow() through this helper, so the bundle case is still
> open at the end of the series.
>
> Could the bundle route and path cookies be sampled differently, or could
> the detected generation change be passed into the bundle?
>

Passing the cookie from this helper into the bundle would only cover
dst_orig: in tunnel mode the outer routes are looked up inside bundle
creation. The fix I have in mind applies the same bracketing within
xfrm, reading the generation before the policy lookup and storing 0 as
route and path cookie if it changed by the time they are sampled. That
also covers bundles created through xfrm_lookup outside of this helper,
so I'd rather do it as a separate change on top of this API.

-- 
Ralf Lici
Mandelbit Srl

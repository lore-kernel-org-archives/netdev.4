Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818972;
	b=YJ8gwA4/RJlKn5VowReu66CKfDh/PUR9bfDRFyx0wDKLU6bEQdSQZvPoAheOTJMIXkse
	 kXh5oyhcxgOBZNF/hEnJ3p0ZqEx/epP7eo8qLsOcxTPXWDz7SRXWryy33pidSbSgVpn6a
	 Gj2iuJ5uNJEQXQEzduaUruccxvZWQUC/+ZwhgAMtixPZlin9U/xz0fF63rv57qIhZR7hG
	 VR/wK8BDwEQrhs6bUdU3+JZGh/AbLW7tuCWY/nPYEVHmwfazDMzfJdKMoGyKgOnQ8CImp
	 EyYi3JwWjyuqeLy6XcZYXRYJ66/NdposyyadnB4ooW86Uzn+8vdJBvuRBrzlLWUAYng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818972;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=J3R5YJVnjvE/lFoovdgv9CLPdz+jpEBCNM0gYW8aPIk=;
	b=0Q/npYuwc6aw20dUIng1idCceXe0Q+xNGcqPrb211KC+yCRoImBNFu5lpozSUedhCu2W
	 4jkgjO7BPyKUyJVqJko+MZ7Es+zbQ1Tlix/8ljWtVkJWKVOxKfa9Si7Zh6SdP1AZ7YJjH
	 Dl8U6NPE1IzTFvxUY2Nn7//JaSYFPMYPUvAcsjRJVdaA0LwueASS1z8juZfzEslycqTn0
	 Blp6re08TGIm8ifV6mOgZGoAeeUfLKbLM8sH1p10qBam+wZY5AJ4tMIQ4QEGZ4dxtTX04
	 BB9t3tOBVhuPKmXDyH5zbfMkV4wX2xy9GSKPfXAniWY218s8o0QwOUNJYyBq5dobsnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=oeCN3zJK;
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A3606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=oeCN3zJK
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jShPF1LpLz9sSv;
	Mon, 16 Nov 2026 09:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794818961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J3R5YJVnjvE/lFoovdgv9CLPdz+jpEBCNM0gYW8aPIk=;
	b=oeCN3zJKXz9KnmG4y6004NjLp8xipFNG+50zRYJXjRlGMELOko97T7gEGhpFo+t+aGQNMY
	RRg8NubwQPtu7WRTXEuqS3m5gYMwULwdz899GkvCVCCEScEXDHyAWXXtTjjkdQhSZgM83r
	tGMWq9ULTL1G96VZFfnEGsMejZ26QFyLqD5Cp5GPtn/ZuHnN5jeUlAXsA0QToNcEUKOSwc
	zChTf6bQ6Ep2qNNFKNwCJByTYfZv9xTIWLXWOXBBeGYJTG7VzE8rRDisxwj0tGGvJuNjUH
	YuIIma0AK0WwnUBpjRc3V12+z7smtHs+YVyYUEvO4hTiIZDzqG4aeKzri/OzOg==
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
Subject: Re: [PATCH net-next v2 1/3] ipv6: stamp the default route node with a fresh serial on link failure
Date: Mon, 16 Nov 2026 09:49:10 +0100
Message-ID: <20261116084912.78030-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179473299065.2199510.876988869343037585@kernel.org>
References: <179473299065.2199510.876988869343037585@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jShPF1LpLz9sSv

On Sun, 15 Nov 2026 08:56:30 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The commit "ipv6: stamp the default route node with a fresh
>   serial on link failure" fixes a real, long-standing bug but carries no…
> - [Low] The commit message's account of nexthop objects is misleading.
>
> --
>
> ipv6: stamp the default route node with a fresh serial on link failure
>
> For an RTF_DEFAULT route, this patch makes ip6_link_failure() allocate a
> fresh serial with fib6_update_sernum() under tb6_lock. Before, it wrote
> -1 into the node's fn_sernum. With the change, repeated link failures
> invalidate cached dsts, and the change becomes visible through the
> netns-wide generation.
>
> > ipv6: stamp the default route node with a fresh serial on link failure
> >
> > [ ... ]
> >
> > The write is also a no-op when the node already holds -1, so dsts cached
> > after one link failure survive the next one. dsts of nexthop objects are
> > validated against the generation and ignore fn_sernum, so a link failure
> > never invalidated them.
> >
> > Allocate a fresh serial under tb6_lock instead, as for any other FIB
> > change. A link failure now invalidates the nexthop-object dsts of the
> > namespace too, as a route insertion does.

Agreed, I'll correct that wording when revising the patch. The intent is
to make this path follow the usual fresh-serial allocation pattern,
which also makes the invalidation visible to the generation checks in
patch 2/3.

>
> [Severity: Low]
> Is this account of nexthop objects accurate? The second paragraph lists
> "a link failure never invalidated them" as a defect. The third paragraph
> then presents invalidating them as part of the fix.
>
> Can a route that uses a nexthop object ever reach the RTF_DEFAULT branch
> of ip6_link_failure()? RTF_DEFAULT seems to be set in only three places:
> rt6_add_route_info() for a zero prefixlen, rt6_add_dflt_router(), and the
> legacy SIOCADDRT ioctl path. None of them attach a nexthop object.
>
> The netlink path is the only one that sets fc_nh_id. It starts from:
>
> net/ipv6/route.c:rtm_to_fib6_config() {
>     ...
> 	.fc_flags = RTF_UP,
>     ...
> }
>
> and never adds RTF_DEFAULT.
>
> In practice, every default router link failure now goes through
> fib6_update_sernum()->fib6_new_sernum(), which advances
> net->ipv6.fib6_sernum. After that, rt6_is_valid() fails for every
> unrelated nexthop-object dst in the namespace:
>
> 	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
>
> The global bump looks fine in itself, and the follow-up "ipv6: add
> ip6_dst_lookup_flow_cookie" depends on the generation moving.
>
> Could the changelog call the nexthop-object invalidation a harmless side
> effect, rather than a deficiency being fixed?
>
> > diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> > index 04098cf32eabe..89fddc9df55ce 100644
> > --- a/net/ipv6/route.c
> > +++ b/net/ipv6/route.c
> > @@ -2867,13 +2867,13 @@ static void ip6_link_failure(struct sk_buff *skb)
> >  			rt6_remove_exception_rt(rt);
> >  		} else {
> >  			struct fib6_info *from;
> > -			struct fib6_node *fn;
> >  
> >  			from = rcu_dereference(rt->from);
> > -			if (from) {
> > -				fn = rcu_dereference(from->fib6_node);
> > -				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
> > -					WRITE_ONCE(fn->fn_sernum, -1);
> > +			if (from && from->fib6_table &&
> > +			    (rt->rt6i_flags & RTF_DEFAULT)) {
> > +				spin_lock_bh(&from->fib6_table->tb6_lock);
> > +				fib6_update_sernum(rt6_exception_net(rt), from);
> > +				spin_unlock_bh(&from->fib6_table->tb6_lock);
>
> [Severity: Low]
> This fixes a long-standing bug in ip6_link_failure(). Should the commit
> carry a Fixes: tag, and possibly Cc: stable and a target tree?
>
> With the old code, the first link failure writes -1. A socket that
> re-validates its dst then caches it again with cookie 0xffffffff, taken
> from:
>
> rt6_get_cookie()
>   fib6_get_cookie_safe()
>     READ_ONCE(fn->fn_sernum)
>
> The next link failure writes -1 again, so this check in rt6_check() does
> not fire:
>
> 	if (!from || !fib6_get_cookie_safe(from, &rt_cookie) ||
> 	    rt_cookie != cookie)
> 		return NULL;
>
> The socket then keeps using the failed default router until some
> unrelated FIB change restamps the node.
>
> git blame on the removed line points at aafc2e3285c2d7, the WRITE_ONCE()
> conversion. The surrounding block was shaped by a68886a691804d and
> c5cff8561d2d00, but the -1 sentinel itself appears to be older than all
> three.
>
> Without a reference to the commit that introduced the -1 write, how would
> stable maintainers know which trees need this?
>

The -1 assignment is already present in the initial git import, so a
Fixes tag would have to point to 1da177e4c3f4 rather than the actual
introducing change.

I deliberately targeted net-next because this is also a prerequisite for
the lookup-cookie API introduced by the series. Before pursuing broader
conversions or backports, I would appreciate maintainer feedback on that
approach. I can clarify the historical origin in the changelog when
revising the patch.

-- 
Ralf Lici
Mandelbit Srl

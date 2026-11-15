Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732992;
	b=XEY+VbMV3fVlW43LFMQrPpfvtjZ9+IIqw0enWoWNsRsMENR5V5wcyOixBKLRj0wZYGmt
	 31p9w9g3K1O1dhhrfwgZVfS4IqZxDD55V47TWtzhsStldWZ089P7pmvSgUOHlFJWexE9H
	 WQEa9R7mOFmoNgGQoph2Z2YP+9jYhbFJzFdKhjzi3BgujC1cc3/1e2e7Ke33x9WDArYxi
	 xc07DwuLbUQoGKOg5Wgc78MsQ1+Ecir+K+yVvvaqyPrLBZrBDItDPsmdPKEa8oFv6HzNy
	 PVImllkC/4uYoK9DkfMXqyhMfVi1Cm2++4PUs7+ef4vMtp9v1+6zPm01K0l2YNupgqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732992;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OSQTUzxyuDLnKHvaO6FZ/b5NARCSjqk7yzRtPO6rnRs=;
	b=LuGPdqE0RE/1MX2SECtOvEjljMg8mH/hQQy7MtRs+amCSNbn3k8kFQDKR1Z4QvrFAznQ
	 f0xFI7KROmniayyLBfyoFaRd69h22lhELw4PXdGecshs1cUClkj0FWLSac0ieY1TxN0s8
	 5yULbO8UXD7Pd4cWiL90HGSIkgLrQEaRRlxK1ysk1dUgPJXHk14fNwYcDLWo3Vt88qBu+
	 td8EvACOyWci4aeRGoe4rP2AYrWeHNW9R23LgvNhQwFvfTY4pNxv1lGCy8fUZFazDI+vE
	 9+j1nzInN+Mwm3x+detT5MTWhaLz1jcTRClc3FOXKY7BeVQ4moxJY1DI8dKNOHyxu4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zcb62gSM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402DC606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zcb62gSM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2857D1F000C4;
	Sun, 15 Nov 2026 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732992;
	bh=OSQTUzxyuDLnKHvaO6FZ/b5NARCSjqk7yzRtPO6rnRs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Zcb62gSMd0X8/tDpEI6jieZIGno+OuF7+CKYwLu0rf/B2CZBBUtrraSLhpSGNq7mM
	 sCNE5y7H4HPJ8fR4rk01TFkkVKpE3t6mTK+Cfg0F2Ed9/C1+QMvC00ysR/VXhlJuDF
	 dxiVwJrwGWCy1stvy83XYhZ5fYBytpFwpPJJyLUyi/iNnB9WqioNfDg2I8aT9HP5Y0
	 sjKNVKT6Uh709lpmcrwXgXeHjz9BbmwsrQ+hcxmAmuadHQig2/FXQcBrenEu4/Hm44
	 zM6Cc5d9SVZtfUSHJvEN7m5GVK/gHimwENEJ2hIFRra1/2zALvYqvX0yMBabqnbIb2
	 YA9klmHNumksQ==
Subject: Re: [PATCH net-next v2 1/3] ipv6: stamp the default route node with a
 fresh serial on link failure
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 sd@queasysnail.net
Date: Sun, 15 Nov 2026 08:56:30 +0000
Message-ID: <179473299065.2199510.876988869343037585@kernel.org>
In-Reply-To: <143461e2c94a20060ff4c7d6e5eb46c47ac46aa0.1794384146.git.ralf@mandelbit.com>
References: <143461e2c94a20060ff4c7d6e5eb46c47ac46aa0.1794384146.git.ralf@mandelbit.com>
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

- [Low] The commit "ipv6: stamp the default route node with a fresh
  serial on link failure" fixes a real, long-standing bug but carries no…
- [Low] The commit message's account of nexthop objects is misleading.

--

ipv6: stamp the default route node with a fresh serial on link failure

For an RTF_DEFAULT route, this patch makes ip6_link_failure() allocate a
fresh serial with fib6_update_sernum() under tb6_lock. Before, it wrote
-1 into the node's fn_sernum. With the change, repeated link failures
invalidate cached dsts, and the change becomes visible through the
netns-wide generation.

> ipv6: stamp the default route node with a fresh serial on link failure
>
> [ ... ]
>
> The write is also a no-op when the node already holds -1, so dsts cached
> after one link failure survive the next one. dsts of nexthop objects are
> validated against the generation and ignore fn_sernum, so a link failure
> never invalidated them.
>
> Allocate a fresh serial under tb6_lock instead, as for any other FIB
> change. A link failure now invalidates the nexthop-object dsts of the
> namespace too, as a route insertion does.

[Severity: Low]
Is this account of nexthop objects accurate? The second paragraph lists
"a link failure never invalidated them" as a defect. The third paragraph
then presents invalidating them as part of the fix.

Can a route that uses a nexthop object ever reach the RTF_DEFAULT branch
of ip6_link_failure()? RTF_DEFAULT seems to be set in only three places:
rt6_add_route_info() for a zero prefixlen, rt6_add_dflt_router(), and the
legacy SIOCADDRT ioctl path. None of them attach a nexthop object.

The netlink path is the only one that sets fc_nh_id. It starts from:

net/ipv6/route.c:rtm_to_fib6_config() {
    ...
	.fc_flags = RTF_UP,
    ...
}

and never adds RTF_DEFAULT.

In practice, every default router link failure now goes through
fib6_update_sernum()->fib6_new_sernum(), which advances
net->ipv6.fib6_sernum. After that, rt6_is_valid() fails for every
unrelated nexthop-object dst in the namespace:

	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));

The global bump looks fine in itself, and the follow-up "ipv6: add
ip6_dst_lookup_flow_cookie" depends on the generation moving.

Could the changelog call the nexthop-object invalidation a harmless side
effect, rather than a deficiency being fixed?

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 04098cf32eabe..89fddc9df55ce 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2867,13 +2867,13 @@ static void ip6_link_failure(struct sk_buff *skb)
>  			rt6_remove_exception_rt(rt);
>  		} else {
>  			struct fib6_info *from;
> -			struct fib6_node *fn;
>  
>  			from = rcu_dereference(rt->from);
> -			if (from) {
> -				fn = rcu_dereference(from->fib6_node);
> -				if (fn && (rt->rt6i_flags & RTF_DEFAULT))
> -					WRITE_ONCE(fn->fn_sernum, -1);
> +			if (from && from->fib6_table &&
> +			    (rt->rt6i_flags & RTF_DEFAULT)) {
> +				spin_lock_bh(&from->fib6_table->tb6_lock);
> +				fib6_update_sernum(rt6_exception_net(rt), from);
> +				spin_unlock_bh(&from->fib6_table->tb6_lock);

[Severity: Low]
This fixes a long-standing bug in ip6_link_failure(). Should the commit
carry a Fixes: tag, and possibly Cc: stable and a target tree?

With the old code, the first link failure writes -1. A socket that
re-validates its dst then caches it again with cookie 0xffffffff, taken
from:

rt6_get_cookie()
  fib6_get_cookie_safe()
    READ_ONCE(fn->fn_sernum)

The next link failure writes -1 again, so this check in rt6_check() does
not fire:

	if (!from || !fib6_get_cookie_safe(from, &rt_cookie) ||
	    rt_cookie != cookie)
		return NULL;

The socket then keeps using the failed default router until some
unrelated FIB change restamps the node.

git blame on the removed line points at aafc2e3285c2d7, the WRITE_ONCE()
conversion. The surrounding block was shaped by a68886a691804d and
c5cff8561d2d00, but the -1 sentinel itself appears to be older than all
three.

Without a reference to the commit that introduced the -1 write, how would
stable maintainers know which trees need this?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794384146.git.ralf%40mandelbit.com

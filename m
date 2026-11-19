Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096199;
	b=bRqBIKFRGeZmxdsoZdHnkZvq6TkY7ezcGNTI4jjrnKKZ577yx/o9x7HLEN4ceBD7Ic0g
	 jqn7EHJFxrUPD/tbdss5r+EQPNuz9Gc5Odr7uv9HQ+IXyhtS83Bw97Q3OJspRnQqnylo3
	 AAYvq3gHO0h2JIMx6nba0th1JCc0lVZ1Pg4ZYFYuP6NEMTJtDIFTrba4ex6Kpbqd3M/IH
	 Gd81ko3EJdcSa2InzHFHROABSTGmr1P18wbmFCfMUSMTf3nB6J9JK4tnP4SozLL/ZzV/z
	 rQcX/1xI8bEaxv8wTmXGzDix99n1sEtaH5EFvmhRwZ+vRCRdqAe6AxhJa2OXO9MtA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096199;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=58COCihoOQ7PhpFRXW0Y+4pP95V9YDXbpL/oR9DL2Lw=;
	b=etmSEwpHdKekKh43QrdXpbZJA9NUWbjHjYThLcfn9D/TuOkHUlmb4/Nk4O3PTPtTEKeh
	 B7r+67i4/XKPY05fX9t5+bOZ+S7DD73Y+NfNOSG5g71mmRCiq2wnM7VDT12dG0ZeyXHVD
	 HOkOB9d63xIzqYYrL3kN0lgxoOi+DPSq8GYNeBJRhHVqqg+pDs3HgoqjmpUUZcd+GLK3X
	 q8c6TLlWYV80hJBW4pJ+nwhEWqKyY/mtgkrpoCJBhsR4M3/vC84vgykeTgll8tsHwNIfq
	 Wm86GWPUoRNbY6pyJcjnMhylMfqMRNaptl7lfmTglDynniaDCRB9qiQQdkHKU/9T7TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lx5iTXXy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BF5606D3BC;
	Thu, 19 Nov 2026 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lx5iTXXy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757031F000D3;
	Thu, 19 Nov 2026 13:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096199;
	bh=58COCihoOQ7PhpFRXW0Y+4pP95V9YDXbpL/oR9DL2Lw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lx5iTXXy8X+7vmvfZLLyA2IQNfZDHl2tREDPQgv8uw1Mj8FS4vjfwGPFLmHk4Ng/Q
	 GxcOpdSFy+eSKLS4hK2u9kirM7186EJv2Z33IuDNXx2MNV9gJtFur3Efa+awA/zdm3
	 PBWgdHAdRIUreWKnbtOYAW6CXNhsiuRwXCRDIXufy1s5voepMZUUwhmUD7QGIBCsNF
	 sifKN3OkX8GU0EldJgmEpIgByR7TzLsIP/nBHP8KuyN1bZepg/AnyhWDAWb82w5e2i
	 LlZOpvhHzwCU923fJv5GOXpl0ZM6rhI+k8xfR/E5WFkgoZCj5zuuPImv28zROSDeqo
	 GvNREugLpFo5Q==
Subject: Re: [PATCH net-next v3 1/2] ipv6: check mc_forwarding before calling
 ip6mr_get_route()
From: netdev-bot+sashiko@kernel.org
To: sunwenbo@cmss.chinamobile.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 hangbin.liu@linux.dev, liuhangbin@kylinos.cn, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 1342116488@qq.com
Date: Thu, 19 Nov 2026 13:49:57 +0000
Message-ID: <179509619796.3136.11845865038486249097@kernel.org>
In-Reply-To: <20261116014744.18223-2-sunwenbo@cmss.chinamobile.com>
References: <20261116014744.18223-2-sunwenbo@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete: its own root cause is still there.
- [Medium] This is an undisclosed regression.
- [Medium] The commit says link-local (ff02::1) and interface-local
  (ff01::1) queries now succeed with mc_forwarding enabled.
- [Low] The commit fixes a user-visible failure: RTM_GETROUTE with
  RTA_IIF for multicast destinations returns -EMSGSIZE ("RTNETLINK…

--

ipv6: check mc_forwarding before calling ip6mr_get_route()

This commit adds a guard in rt6_fill_node(). ip6mr_get_route() is now
called only when mc_forwarding is enabled and the destination is not
interface-local or link-local multicast. The goal is to match IPv4
rt_fill_info() and stop RTM_GETROUTE with RTA_IIF failing with -EMSGSIZE.

> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

[Severity: Low]
This isn't a bug, but this fixes a user-visible failure, so should it
carry a Fixes: tag? The ip6mr_get_route() call under if (iif), with no
mc_forwarding or scope check, appears to date back to:

Fixes: 7bc570c8b4f7 ("[IPV6] MROUTE: Support multicast forwarding.")

Later commits 22d0bd82cc7c and fd61c6ba313d only renamed the field to
rt6_dst->addr and removed the nowait argument.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 4a4c5ace63c54..305ae2ac359ea 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -5868,7 +5868,12 @@ static int rt6_fill_node(struct net *net, struct sk_buff *skb,
>  #endif
>  	if (iif) {
>  #ifdef CONFIG_IPV6_MROUTE
> -		if (ipv6_addr_is_multicast(&rt6_dst->addr)) {
> +		const struct in6_addr *mc_dst = dest ? : &rt6_dst->addr;

[Severity: Medium]
The multicast test now uses dest instead of the matched prefix. Does that
change the result for multicast queries that match a non-multicast route?

The input device may have no ff00::/8 route:

  - addrconf_add_dev() skips IFF_LOOPBACK devices and l3mdev masters
  - addrconf_sit_config() adds it only for IFF_POINTOPOINT devices
  - an admin can delete it

In that case a query for ff0e::1 with iif X can match a ::/0 route via X.
Before this patch rt6_dst->addr was not multicast, so RTA_IIF was emitted
and the query succeeded. That is also how the data path behaves.
ip6_rt_init_dst() picks ip6_mc_input only when the FIB prefix is
multicast:

net/ipv6/route.c:ip6_rt_init_dst() {
    ...
	} else if (ipv6_addr_type(&f6i->fib6_dst.addr) & IPV6_ADDR_MULTICAST) {
		rt->dst.input = ip6_mc_input;
    ...
}

With mc_forwarding != 0, the guard now passes on dest.
ip6mr_get_route() then looks up (::, ::) from rt6i_src/rt6i_dst, misses,
and returns -ENODEV because skb->dev is NULL.

Is this regression intended? The commit message doesn't mention it.

[Severity: Medium]
What happens with RTM_F_FIB_MATCH queries here? The commit message says
ff02::1 and ff01::1 queries with mc_forwarding enabled now succeed. The
fibmatch branch of inet6_rtm_getroute() passes dest as NULL, though:

net/ipv6/route.c:inet6_rtm_getroute() {
    ...
		if (fibmatch)
			err = rt6_fill_node(net, skb, from, NULL, NULL, NULL,
					    iif, RTM_NEWROUTE,
    ...
}

So mc_dst falls back to rt->fib6_dst.addr. For the default ff00::/8
route from addrconf_add_mroute(), that is ff00::.

The multicast scope of ff00:: is 0. ipv6_addr_type() therefore sets
neither IPV6_ADDR_LOOPBACK nor IPV6_ADDR_LINKLOCAL, and the new exclusion
never fires.

With mc_forwarding enabled, a query like:

  ip -6 route get fibmatch ff02::1 iif eth0

still calls ip6mr_get_route(). That call misses on (::, ff00::) and
returns -ENODEV with skb->dev NULL.

Should the fibmatch path check the queried fl6.daddr instead? Or should
it skip the mroute lookup entirely, as the IPv4 fibmatch path
(fib_dump_info()) does?

> +
> +		if (ipv6_addr_is_multicast(mc_dst) &&
> +		    !(ipv6_addr_type(mc_dst) &
> +		      (IPV6_ADDR_LOOPBACK | IPV6_ADDR_LINKLOCAL)) &&
> +		    atomic_read(&net->ipv6.devconf_all->mc_forwarding)) {
>  			int err = ip6mr_get_route(net, skb, rtm, portid);

[Severity: High]
With mc_forwarding enabled and a routable group, does this still fail for
the reason the commit message gives?

Take a query like:

  ip -6 route get ff0e::1 from <S> iif eth0

The guard passes because it tests dest (ff0e::1). But ip6mr_get_route()
never sees dest or src. It works from the dst attached to the reply skb:

net/ipv6/ip6mr.c:ip6mr_get_route() {
    ...
	struct rt6_info *rt = dst_rt6_info(skb_dst(skb));
    ...
	cache = ip6mr_cache_find(mrt, &rt->rt6i_src.addr, &rt->rt6i_dst.addr);
    ...
		dev = skb->dev;
		if (!dev || (vif = ip6mr_find_vif(mrt, dev)) < 0) {
			rcu_read_unlock();
			return -ENODEV;
		}
    ...
}

ip6_rt_copy_init() copies rt6i_dst from the FIB prefix (ff00::/8 from
addrconf_add_mroute()). The lookup is therefore for (::, ff00::), and it
misses even when an (S,G) MFC entry exists.

The miss path then returns -ENODEV. inet6_rtm_getroute() only calls
skb_dst_set(skb, &rt->dst) on the alloc_skb() reply skb and never sets
skb->dev.

So this query still ends in -EMSGSIZE after this patch. After the
follow-up "ipv6: preserve ip6mr_get_route() error in rt6_fill_node()" it
ends in -ENODEV instead.

On the IPv4 side, inet_rtm_getroute() sets skb->dev = dev, and
rt_fill_info() passes the flow addresses through:

net/ipv4/route.c:rt_fill_info() {
    ...
				int err = ipmr_get_route(net, skb,
							 fl4->saddr, fl4->daddr,
							 r, portid);
    ...
}

Would it make sense to pass the queried (S,G) and the input device into
ip6mr_get_route(), as IPv4 does, so the guard and the lookup use the same
addresses? As it stands, the one case that needs the mroute lookup
(routable group with forwarding on) appears to always fail.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116014744.18223-1-sunwenbo%40cmss.chinamobile.com

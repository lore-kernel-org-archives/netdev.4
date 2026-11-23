Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393547;
	b=0/Z8bb1MmK0SSPqz0Ab1u+hpKTeC8fsP9WvW0ZoQd6d9E1dp3am9M3cMLIxFWW/f92v2
	 gaNRDR7LiuRqVjWfu5vmonbhDtYU9+fwuw9eycNqhfU9O+7q0ZZ7knFVyykQYUX4pa6Y4
	 6SQzhdA1C49SP4JmsW5qmZs3Oxo6+wk/2a3VGuultXxVEK26VJx+QL9KFyJCrBanY/UMs
	 mAEFDB2Xqe7K+yE8yLeUyY8trMGRa0hJo+lHdg5DaSd9uRlvOYEFJAv4HaptYvT7dTIXE
	 YamVPGzcPpW8eseWp03FPwsXj1+MeMfjX3lcixvJtRPBebsqmxHkuGzoQW5DLBE6JRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393547;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=TZ0rpHy2ujwVMpfaHpoxQQNYlgDHNkNxkEJF98FFsmc=;
	b=kRh0XwbG116XDTVgjGDaA5XAihr+D9S+uDnfBpytv6KiD1SWbJQjKFidc6miwX4HoGCF
	 FN+n+BBwydO6zdLX9PnI9+oihmis9w5ODDe79rqmRZ93ebt7Z6qzDzRKk4WTCw5qTZjB3
	 u17kitfv4rXU+cC+wL1pQKe88POE6szGkLRqkPBYMY7NmVshGgGW8Fh0nA357+9cxG8T7
	 zDrXfi81V4munaQTqIWZyH1jz8iJE7nedo2hX3lphdAOuNfkC/ga6NxmFMatkPpzfWUG2
	 FimOwB6MDLl/qVDXbGxZwYyFo6u8BU/IDz0PazhXNeQ4fj+00mgwZE9poJa/ed3YEYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ASoP2Te/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F13606A333;
	Mon, 23 Nov 2026 00:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASoP2Te/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381821F000D3;
	Mon, 23 Nov 2026 00:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393546;
	bh=TZ0rpHy2ujwVMpfaHpoxQQNYlgDHNkNxkEJF98FFsmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ASoP2Te/0ariVjgsd04Nzl6wIkNiGiKQPudHfxhzn4GdcKMwY5ksurj/epOR92qJ+
	 4Jkt7XvGwiMVUKBl0QPsRlFo/80oPD5/tDOShvlgecMDgDCVs5T7NRP6ilV8XKz7h5
	 Tbgf+RvmdYmB6kDntD/bSFl2LcJRFFgXRLH+uCsa0+XDg3SblzV5IM+w2G2VVE3sEn
	 YsjGZHbaiBR9YWWD0uX1Pj7fnQ39gza4BYPh66h4tAXNNcWb9L2MyDBxYYdN+In1Ng
	 0E3DPFf9PnjrhNbeT/5XZ5e80GsrlPP1B2xJIv9r2KEEoBTH+33B6ESKNsxrCRB7LZ
	 CTp/cavMGYbNw==
Subject: Re: [PATCH net-next v5 3/4] nexthop: release cached routes when a
 nexthop leaves a group
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, ralf@mandelbit.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:25:45 +0000
Message-ID: <179539354580.3135.4168319613426691276@kernel.org>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-3-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-3-100a3b5d9090@linux.dev>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch adds IPv6 dst release to remove_nexthop_from_groups(),
  but it skips the IPv6 invalidation step that the group-replace path…
- [Medium] The same stale-dst window remains when a group member is
  replaced in place (RTM_NEWNEXTHOP with NLM_F_REPLACE on a non-group…
- [Low] The commit describes user-visible behaviour (a socket keeps
  sending through a deleted group member until the nexthop is freed from…

--

nexthop: release cached routes when a nexthop leaves a group

This patch changes remove_nexthop_from_groups() so that, once the new
group arrays are published, it releases the per-cpu routes and exceptions
of a removed IPv6 nexthop. It also flushes the IPv4 route cache if any of
the affected groups carries IPv4 routes. The aim is to stop sockets from
sending through a nexthop that has left a surviving group while they wait
for that nexthop to be freed from RCU.

> A connected UDP socket in netns A sends to a route through group {nh 1,
> nh 2}, on an IPv6 exception of nh 1 created by Packet Too Big, while nh 1
> is deleted.

[ ... ]

> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

[Severity: Low]
This isn't a bug, but the commit message describes a user-visible
behaviour: a socket keeps sending through a deleted group member until
the nexthop is freed. There is no Fixes: tag, though.

Should one be added if this is meant as a fix? Or is the patch only
net-next groundwork for the rest of the series?

> diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
> index 42e55b5a755ee..3fccd4f2f916b 100644
> --- a/net/ipv4/nexthop.c
> +++ b/net/ipv4/nexthop.c

[ ... ]

> @@ -2130,6 +2131,20 @@ remove_nexthop_from_groups(struct net *net, struct nexthop *nh,
>  	/* make sure all see the newly published array before releasing rtnl */
>  	synchronize_net();
>  
> +	/* Routes through the groups can still hold dsts cached through @nh,
> +	 * which are only released when @nh is freed. Release them now that
> +	 * no reader can pick @nh from the old groups any more.
> +	 */
> +	nhi = rtnl_dereference(nh->nh_info);
> +	if (nhi->family == AF_INET6)
> +		fib6_nh_release_dsts(&nhi->fib6_nh);

[Severity: High]
Does this also need an rt_genid_bump_ipv6()? The commit message says this
works "as replacing a group already does for its old members". However,
nh_rt_cache_flush() bumps the IPv6 genid before it releases the old dsts:

net/ipv4/nexthop.c:nh_rt_cache_flush() {
    ...
	if (have_f6i)
		rt_genid_bump_ipv6(net);
    ...
		if (nhi->family == AF_INET6)
			fib6_nh_release_dsts(&nhi->fib6_nh);
    ...
}

Without the bump, can the released per-cpu dsts still pass
ip6_dst_check()? A per-cpu route of a group route has a non-zero sernum.
That means ip6_dst_check() returns early and never looks at
dst->obsolete:

net/ipv6/route.c:ip6_dst_check() {
    ...
	if (rt->sernum)
		return rt6_is_valid(rt) ? dst : NULL;
    ...
}

rt6_is_valid() compares the sernum against
rt_genid_ipv6(dev_net(rt6->dst.dev)). fib6_nh_release_dsts() calls
dst_dev_put(), which does two things to the dst:

  - it moves the dst to blackhole_netdev, which lives in init_net
  - it sets dst->output to dst_discard_out

In init_net, the sernum still matches if no other IPv6 FIB change has
happened since the per-cpu route was created. Take a connected UDP
socket with no bound oif. Would it keep the dead dst through
ip6_sk_dst_check() and silently drop every datagram? It would never look
the route up again and move to the remaining members.

Before the patch the same thing happened one grace period later, in
nexthop_free_rcu(). The patch makes it happen immediately. The test in
the commit message ran in a non-init netns on a PMTU exception (sernum
0), so it would not show this.

There is a second case. When the nexthop has no gateway, ip6_pol_route()
builds uncached rt6_infos for FLOWI_FLAG_KNOWN_NH lookups. These users
take that path:

  - IPVS DR mode, through __ip_vs_route_output_v6() and
    __ip_vs_dst_check() with a stored cookie
  - nf_dup_ipv6
  - raw hdrincl

Those dsts are checked by rt6_dst_from_check() -> fib6_check() against
the group f6i and the cookie. fib6_nh_release_dsts() never reaches them,
and the node sernum does not change. Can they keep sending through the
removed nexthop with no time limit?

Would it cover both cases to bump the IPv6 genid when any
nhge->nh_parent->f6i_list is non-empty, like the fi_list check below?

> +	list_for_each_entry(nhge, &deferred_free, nh_list) {
> +		if (!list_empty(&nhge->nh_parent->fi_list)) {
> +			rt_cache_flush(net);
> +			break;
> +		}
> +	}

[Severity: Medium]
Is the same stale-dst window still open when a group member is replaced
in place? One example is "ip nexthop replace id N ...", where N belongs
to a multipath group and no route uses N directly.

replace_nexthop_single() swaps nh_info. After the swap, the old
fib6_nh/fib_nh and their cached dsts belong to the temporary new
nexthop:

net/ipv4/nexthop.c:replace_nexthop_single() {
    ...
	rcu_assign_pointer(old->nh_info, newi);
	rcu_assign_pointer(new->nh_info, oldi);
    ...
}

replace_nexthop() then does:

net/ipv4/nexthop.c:replace_nexthop() {
    ...
		nh_rt_cache_flush(net, old, new);

		WARN_ON_ONCE(__remove_nexthop(net, new, NULL));
		nexthop_put(new);
    ...
}

nh_rt_cache_flush() only checks old->fi_list and old->f6i_list. Those
lists hold routes that use old directly, not routes through the groups.
The function then returns at !replaced_nh->is_group without releasing
the old IPv6 dsts.

__remove_nexthop(net, new, NULL) does reach remove_nexthop_from_groups().
But new->grp_list is empty, so it returns early and the new release code
never runs. The per-group loop in replace_nexthop_single() only sends
hardware notifications.

So the per-cpu IPv6 dsts, the IPv6 exceptions and the IPv4 rtables built
on the old nh_info would stay valid until nexthop_free_rcu() frees new.

Should this path get the same treatment?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090%40linux.dev

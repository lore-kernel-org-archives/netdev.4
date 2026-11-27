Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753816;
	b=oXIo5P2/xWLPsC/RYvgrjb18RJ2yL03lmzB5HjsjbffuprMjeqwn/nSn7XwHO0+rhVdp
	 OSVXDHmDo06NSH1QUH7ag41MZwMaMxng/RQl/GNFllJtUIUKOJae53SRVDhcjGoVSKyP8
	 9MBcEQqXxAC2QJuxdMNEQUDO/9xRK/w1spvAWPEHCXdwo9Ti/zqhgevR176zpAGKDN610
	 WgZ9fu9C95SPTXuq+6Vha4ZaIV+R4GghszvJc1AXwjFQSLVbCO4oELdt4HgbT9abiXtwm
	 EbOOLQwY+QdtoXSeEP2sRjPTe44O7CDnLY0InJKQUMxpEVMKZJinzEyRU4gas3D/iSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753816;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Qg2Xm3UAUNltu/ilbEL+FRJYYhFOBnKuXI2w4PjwXOA=;
	b=tGS/oRX5r82kYKNnZc4/wSyH7p/Vn1/KhEj6NlUehBFLmWRNPRaZNqqFe4VrrtIKKE2d
	 oVkcfXQLGBby+y0HeiKj+P0+vqp7dEl0T5S62hfCV46mnPFfJryHoRlWtkszibo9dqGmc
	 KTNZcIVk0umXWzo9LHWhI5pCPpnQ2SijLsjQYAekgwk1oxL4P7IEVp1nKWyy9NQlPEXjo
	 DnmSXy4chLqYD4lff1HVz3ERH/0ssySMgDCmVrhfIEeaAfpMcACSaqoh+LRJwGQhIhWIW
	 i1f/Qf2S1VvMi22O+OZIs/H4IOJfVx3TzmxR4ApiYB/529UWpcFtlQxCM0U1smfuTrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tl4VkrPl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C0606A323;
	Fri, 27 Nov 2026 04:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tl4VkrPl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700AC1F00893;
	Fri, 27 Nov 2026 04:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753816;
	bh=Qg2Xm3UAUNltu/ilbEL+FRJYYhFOBnKuXI2w4PjwXOA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Tl4VkrPlZu1OtfzlvOpqNpLkRsmv4JXlLauvbM5DntfwWx3JJQSEYEDvMqpoR+0sP
	 WsPHjeCTW8OhwdeAeH8QBudYyHziHpt9JvsX16/HT+VM/0e2k3Xie7o3VbNfNSsSL6
	 gkk3AMWtL/AvtITfk1nTrAhY09bDJY+W227LKt+NnWWMQa33WSC4TlEUNxpb7zqPbr
	 LZPNtYhvYVzaetShWXYWA1AlLM7x9jKeM07OqcsFqUs+EOSKBi/Q93oCc1aDZz5XH+
	 thNJaKNjVOAMlXbY9IGR+WabepX2SBzI+Ma3cJ5Ei0VyPUR1/reudSecx71bNssYCA
	 zQwo0za5mL+BA==
Subject: Re: [PATCH net-next v5 4/4] ipv6: validate dsts against the state
 their lookup found
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, fw@strlen.de, yanxia@cmss.chinamobile.com,
 sd@queasysnail.net, antonio@mandelbit.com, linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 04:30:15 +0000
Message-ID: <179575381501.3135.10569623196421084985@kernel.org>
In-Reply-To: <4b2bf5de6c9837fee8db88d639db0e27e6d687b9.1795537128.git.ralf@mandelbit.com>
References: <4b2bf5de6c9837fee8db88d639db0e27e6d687b9.1795537128.git.ralf@mandelbit.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 (1) · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Default and other covering routes now lose their pcpu dst
  after every FIB insertion.
- [Medium] Lookups that race with any FIB change can now kill a valid
  shared pcpu dst.

Pre-existing issues:
- [High] Pre-existing, but this patch spells out the hazard and fixes
  only its own release path: fib6_nh_release_dsts() still drops the pcpu…

--

ipv6: validate dsts against the state their lookup found

This patch changes ip6_dst_check() to validate non-exception dsts
against the stamp (generation and node fn_sernum) recorded by the lookup
that built them, rather than the cookie passed by the holder. A pcpu dst
is now reused only if its stamp matches the current lookup; otherwise it
is replaced and released with dst_dev_put() and a dst_release() deferred
by an RCU grace period.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 8b98ee945c583..be9bf7a4e7808 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -1511,6 +1511,33 @@ static bool rt6_is_valid(const struct rt6_info *rt6)
>  	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
>  }
>  
> +static bool rt6_stamp_matches(const struct rt6_info *rt,
> +			      const struct fib6_result *res)
> +{
> +	if (rt->sernum || res->f6i->nh)
> +		return res->gen && rt->sernum == res->gen;
> +
> +	return res->cookie && rt->cookie == res->cookie;
> +}

[Severity: Medium]
Does this make the default route lose its pcpu dsts on every route
insertion in the table?

Before this patch, a non-nexthop pcpu dst had sernum == 0, so the old
check in rt6_get_pcpu_route() never replaced it at lookup time:

    if (pcpu_rt && pcpu_rt->sernum && !rt6_is_valid(pcpu_rt)) {

A holder with a stale cookie failed dst_check, looked up again, and got
the same live dst back.

With this change, any difference between the node's fn_sernum and
rt->cookie makes rt6_get_pcpu_route() xchg the dst out of the slot and
call rt6_pcpu_release()->dst_dev_put(). That turns the shared dst into a
blackhole (dst_discard/dst_discard_out, blackhole_netdev) for every
holder.

fib6_add() stamps the inserted node and every ancestor up to the root:

net/ipv6/ip6_fib.c:fib6_add() {
    ...
    __fib6_update_sernum_upto_root(rt, fib6_new_sernum(info->nl_net));
    ...
}

::/0 routes live at the root node, so a route add anywhere in the table
changes the default route's cookie. fib6_flush_trees() stamps every node,
so every pcpu dst in the netns would be replaced. One trigger is
rt_genid_bump_ipv6() on xfrm policy insertion.

The next lookup on each CPU would then tear down that CPU's pcpu dst,
allocate a new one and queue a call_rcu(). Holders that reach
dst_output() without checking the dst again would have their packets
dropped by dst_discard_out. Examples are NFQUEUE reinjection into
ip6_forward_finish(), async-crypto xfrm output resuming to a pcpu child,
and corked UDP.

The commit message says:

    and invalidation keeps its per-node scope: a FIB change only invalidates
    dsts of routes under the nodes it stamps.

and:

    validating it again, such as a corked UDP socket, loses those packets,
    now also when a FIB change in the route's subtree replaces the pcpu
    dst.

For the default route that subtree is the whole table. Nexthop-object
routes already behaved this way, but plain routes did not.

Is this behaviour intended for routing daemon churn, RA-learned routes,
or VPN route installs?

> +
> +static void rt6_pcpu_release_rcu(struct rcu_head *head)
> +{
> +	struct dst_entry *dst = container_of(head, struct dst_entry, rcu_head);
> +
> +	dst_release(dst);
> +}
> +
> +/* Release a pcpu dst taken out of its slot. Lookups may have read the slot
> + * without taking a reference, so drop the slot's own only after a grace
> + * period: an xfrm bundle holding the dst as its child releases its
> + * reference without waiting for one.
> + */
> +static void rt6_pcpu_release(struct rt6_info *rt)
> +{
> +	dst_dev_put(&rt->dst);
> +	call_rcu(&rt->dst.rcu_head, rt6_pcpu_release_rcu);
> +}

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. This
comment describes the hazard, though, so should fib6_nh_release_dsts()
get the same deferred release?

It still drops the slot reference immediately:

net/ipv6/route.c:fib6_nh_release_dsts() {
    ...
    pcpu_rt = xchg(ppcpu_rt, NULL);
    if (pcpu_rt) {
        dst_dev_put(&pcpu_rt->dst);
        dst_release(&pcpu_rt->dst);
    }
    ...
}

nh_rt_cache_flush() calls it at runtime after replace_nexthop_grp(), for
each IPv6 member of the old group. The synchronize_net() in
replace_nexthop_grp() only covers the old nh_group array.

A member nexthop can still be in the new group, or another route can use
it directly through nhid. Lookups can still reach its rt6i_pcpu slots.

Could this sequence lead to a use-after-free of the pcpu dst?

1. xfrm bundle X, whose child is pcpu dst P of member A on CPU0, drops
   to refcount 0 and queues call_rcu(dst_destroy_rcu).

2. After that grace period starts, reader R on CPU0 enters an RCU
   section, runs ip6_pol_route() with RT6_LOOKUP_F_DST_NOREF and reads P
   from the slot.

3. CPU1 handles RTM_NEWNEXTHOP replacing the group, and
   nh_rt_cache_flush()->fib6_nh_release_dsts(A) clears CPU0's slot and
   drops the slot reference. X's child reference is now the last one.

4. X's grace period ends without waiting for R, and
   dst_destroy(X)->dst_release_immediate(P) frees P.

5. R calls dst_hold_safe(P) in ip6_route_output_flags(), or uses P
   through skb_dst_set_noref()/dst_input().

The other caller, fib6_nh_release(), only runs after the fib6_info or
nexthop grace period, so it looks safe.

The commit message only says that __fib6_drop_pcpu_from is unchanged.
That function drops from references, not slot references.

> +
>  /* It should be called with rcu_read_lock() acquired */
>  static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
>  {
> @@ -1518,16 +1545,19 @@ static struct rt6_info *rt6_get_pcpu_route(const struct fib6_result *res)
>  
>  	pcpu_rt = this_cpu_read(*res->nh->rt6i_pcpu);
>  
> -	if (pcpu_rt && pcpu_rt->sernum && !rt6_is_valid(pcpu_rt)) {
> +	/* A pcpu dst is shared by all its holders, so it is never re-stamped.
> +	 * Reuse it only if it was built under the state this lookup found,
> +	 * otherwise replace it: a dst rebuilt by another lookup after a FIB
> +	 * change must not be returned to a lookup that selected before it.
> +	 */
> +	if (pcpu_rt && !rt6_stamp_matches(pcpu_rt, res)) {
>  		struct rt6_info *prev, **p;
>  
>  		p = this_cpu_ptr(res->nh->rt6i_pcpu);
>  		/* Paired with READ_ONCE() in __fib6_drop_pcpu_from() */
>  		prev = xchg(p, NULL);
> -		if (prev) {
> -			dst_dev_put(&prev->dst);
> -			dst_release(&prev->dst);
> -		}
> +		if (prev)
> +			rt6_pcpu_release(prev);

[Severity: Medium]
Can a lookup that races with an unrelated FIB change destroy a valid
shared pcpu dst here?

rt6_lookup_stamp() zeroes the stamp whenever the netns-wide generation
changes during the lookup:

    if (unlikely(!linked || rt_genid_ipv6(net) != gen)) {
        res->gen = 0;
        res->cookie = 0;
        return;
    }

Every fib6_new_sernum() in the netns bumps the generation, so a change
to an unrelated route or table is enough. rt6_stamp_matches() is false
for a zero stamp. This code would then call dst_dev_put() on the slot
dst even if it was built under the node's current fn_sernum.

It then installs a cookie-0 dst, which ip6_dst_check() always rejects:

    dst_ret = rt->cookie ?
              rt6_dst_from_check(rt, from, rt->cookie) :
              NULL;

The next lookup replaces that one as well.

An older stamp has the same effect. ip6_pol_route() calls
rt6_lookup_stamp() before local_bh_disable(). If the lookup is preempted
or interrupted there, another lookup can install a dst with the newer
cookie. When the first lookup resumes, it calls dst_dev_put() on that
newer, valid dst and installs one with an outdated cookie.

On PREEMPT_RT, rt6_make_pcpu_route() now does:

    prev = xchg(p, pcpu_rt);
    if (prev)
        rt6_pcpu_release(prev);

This can blackhole a dst that the other task on the same CPU has just
returned to its caller. That caller's first packet would go to
dst_discard_out. Before this patch, this path returned prev unchanged.

dst_dev_put() switches input/output/dev for every holder. Sockets on
other CPUs that already passed __sk_dst_check() and are about to call
dst_output() would also drop packets. Those holders do revalidate, so
they are not among the holders listed as not covered.

Doesn't this conflict with this part of the commit message?

    and invalidation keeps its per-node scope: a FIB change only invalidates
    dsts of routes under the nodes it stamps.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795537128.git.ralf%40mandelbit.com

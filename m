Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795317254;
	b=p32C7frmcn/p/UOpBcV3U6sW4ecBfPs2FJ43lX3ZF6NoY+UkiG7KLskPu0jgtUiLIzpX
	 PXDytiWYKYN1S49cnDt4W/XqAQEmK3F5qA5OVr4iXFVYZp7CpauHvvhISsVd7R/XDj41R
	 RKLp0Csu+VOiBl+GEeNREqgGag5fTI/nH1oFU78L8tnukUpnTtYg/qqYhsEw3AEapl38W
	 KKpBVslsQqMU0fsLQpVXPUPSs0TDW7LLu1MvfzIzJbRXuuwHakyvwldZMXtcIQu4kudvo
	 oM1VmDH4e/SYTxaYTABvI87Tn1Mhs/h3DqW/eos6l8vYVnfpdk0Gpb+EkMMxBZY1IZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795317254;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MiHnBCHWuGCXIjnf+5r31E/jBmeDF1IrNB3zfS0Is7Y=;
	b=XEsQS3YDfiq1C1tC6l9pKmTSvC2Q2QAr7J2NnF3mvCTJXezZf8WcUkdPB7Y2BkP/zVz/
	 rBOhq1OfuaOClV5mpbgBWqM/PR4DHZdduAynv3GUon2EGS6wt6ZF/S+wLIQ3DbF+Mt9Qe
	 JCDY8zAN0uP3Lbh627pPuX2URiyfpe0ECcOFld79Tc67ydOtLg/ofkDNKm7tEzZgSyUO7
	 frJWSFLOCQPKLExh/GhstL1uUckgaW4ABh371GUiyWvYC7+Z0qMqQs4zXB2G39tunq3E4
	 K/gHK8PFZ3Iyj0t1djLcj8Y30p/vJXew3+3hUNeWb5LRbP/6+RDBGDcBjScTjg3DPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGTk69ay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834EE606A690;
	Sun, 22 Nov 2026 03:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGTk69ay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCD71F000C0;
	Sun, 22 Nov 2026 03:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795317254;
	bh=MiHnBCHWuGCXIjnf+5r31E/jBmeDF1IrNB3zfS0Is7Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dGTk69aykAgsofnN++pYnu7DiiGK7OlWFcb3XRPELjfAjMp8Iqox5rKtNuHRvApme
	 7T/T9utC8Dkh+3KwQxbQxJXlI8IvmlTTAzYdCnpQLFTEW+Wz6nueTo2A1L2NmA+g1c
	 /t5Yi1CVgS81QMos0kWMj1iinryJBJbHNn0wkdYf4inUFWgFPrAEgj7AbwVWQFeF5w
	 FX8b5u/MLWzAiRuZwIAXyVOvP7pxJ89A+98SDk3c0lK749LU87IlyCNLFfDsniQJTB
	 85hfhLbnefeg/F2xkV6qvjQWNpYyZZ9AD8+31Yvu/Rx7wlpuyB2ek6VKsLLQhfuAtF
	 /95JToKExNmLA==
Subject: Re: [PATCH net-next v4 3/4] nexthop: release cached routes when a
 nexthop leaves a group
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 03:14:13 +0000
Message-ID: <179531725321.3135.3845475174656034580@kernel.org>
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-3-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-3-43e1ca0aac7f@linux.dev>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] nexthop: missing rt_genid_bump_ipv6() in
  remove_nexthop_from_groups()
- [Low] The new block comment in remove_nexthop_from_groups()
  (net/ipv4/nexthop.c) says "Routes through the groups can still hold…

--

nexthop: release cached routes when a nexthop leaves a group

When a nexthop is removed from a group that stays alive, this patch makes
remove_nexthop_from_groups() release the per-cpu routes and exceptions of
the removed nexthop once synchronize_net() returns, if it is IPv6. It also
flushes the IPv4 route cache once if any affected group carries IPv4
routes.

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
> +	list_for_each_entry(nhge, &deferred_free, nh_list) {
> +		if (!list_empty(&nhge->nh_parent->fi_list)) {
> +			rt_cache_flush(net);
> +			break;
> +		}
> +	}

[Severity: High]
Does this also need an IPv6 genid bump for the groups that carry IPv6
routes?

For a route through a group, ip6_rt_pcpu_alloc() records the current
rt_genid_ipv6() in pcpu_rt->sernum. ip6_dst_check() then takes the
early path for that route:

net/ipv6/route.c:ip6_dst_check() {
	...
	if (rt->sernum)
		return rt6_is_valid(rt) ? dst : NULL;
	...
}

rt6_is_valid() only compares rt->sernum against
rt_genid_ipv6(dev_net(rt->dst.dev)). It does not look at
dst->obsolete or rt->from.

fib6_nh_release_dsts() calls dst_dev_put() on each per-cpu route.
That marks the route DST_OBSOLETE_DEAD, points dst->output at
dst_discard_out and moves the device to blackhole_netdev. Nothing on
this path bumps the IPv6 genid, though. The group's routes stay in
the FIB, and __remove_nexthop_fib() only walks nh->f6i_list, not the
parent's.

In a non-initial netns, as in the test from the commit message,
moving the device to blackhole_netdev changes dev_net() to &init_net.
The sernum comparison then fails, more or less by accident.

In init_net, dev_net(blackhole_netdev) is still &init_net and the
genid has not moved. rt6_is_valid() keeps returning true for the dead
dst. Wouldn't a connected socket in init_net then keep that dst in
sk_dst_cache and silently discard everything it sends, instead of
failing over to the remaining members of the group?

The same missing bump would also seem to leave uncached routes
through @nh on rt6_uncached_list valid. Those routes are in neither
rt6i_pcpu nor the exception buckets that fib6_nh_release_dsts()
walks.

nh_rt_cache_flush() handles the replace case by checking f6i_list
under the lock first:

net/ipv4/nexthop.c:nh_rt_cache_flush() {
	...
	spin_lock_bh(&nh->lock);
	have_f6i = !list_empty(&nh->f6i_list);
	spin_unlock_bh(&nh->lock);
	if (have_f6i)
		rt_genid_bump_ipv6(net);
	...
}

Should the loop over deferred_free also check
nhge->nh_parent->f6i_list under nh_parent->lock? It could then call
rt_genid_bump_ipv6(net) once, the same way it calls
rt_cache_flush(net) for fi_list.

[Severity: Low]
This isn't a bug, but is the comment accurate for the IPv4 case?

The comment says the dsts cached through @nh are released here. That holds
for IPv6, where fib6_nh_release_dsts() flushes the exceptions and drops the
per-cpu routes.

For IPv4, rt_cache_flush() only bumps the genid:

net/ipv4/route.c:rt_cache_flush() {
	rt_genid_bump_ipv4(net);
}

That invalidates the cached rtables, but it does not release them. The
rtables in @nh's fib_nh_common (nhc_pcpu_rth_output and the fnhe
exceptions), and the device references they hold, are still dropped later
from the RCU callback, through nexthop_free_single()->fib_nh_release().

nh_rt_cache_flush() describes these as two separate things. One comment
says the dst entries "need to be regenerated" (the genid bump), and another
says "we have to release all old dsts" (IPv6 only).

Could the new comment draw the same distinction, so it doesn't suggest the
IPv4 dsts are freed at this point?

> +
>  	/* Now safe to free percpu stats — all RCU readers have finished */
>  	list_for_each_entry_safe(nhge, tmp, &deferred_free, nh_list) {
>  		list_del(&nhge->nh_list);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f%40linux.dev

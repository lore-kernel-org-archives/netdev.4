Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795317252;
	b=3sbw+XBErKT+gQo1v9QIwOXvO2rYSIDUbUiqwbb3TZMAX2ZUlXCW3NqJ/vWnHA7PVakN
	 47fPMDrstUmtOABeYSk/lwfAp4vnGjfsFCrJlqu9E5xQaDEoG5ZyXVBw+AQn2apVG5kXP
	 OyV6aKyF0vA5vUEHuyg40uwCK4FV5jrxloNP8ryhdDsnGSdB3byp+dt9cT5kTDvOhlsW1
	 fxufEZoDmBZk/LyT169Jw84fmxkj3q10rLnAEbx1Hhi2fPhqpn/nHG9oKt3L3Umv9qC4d
	 YSICJcEKyJ+y3+IK0sHnE4oP4gh3lvWarruA8eU6bUlnQBt7YF952fLdefenNXGHkqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795317252;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7Ns55xut4wz7vG77YRa5nbcVjMgJklqitMO+QAV2xks=;
	b=r87OAOTg9pokwTXu/8PU59kEyGyGepmWB+rWq+qAN5ET+g0aG+0MDmorwMfQJToVX6Qr
	 rlivW9+3SSBdL/grAgHxpNXeCSicBGKVtc76WXg/J/A4qPgPsAxz/bUG716hJuXAgA5YZ
	 h3MQlOGZ3+ZAjnH2+KBHlCOuC4LsljPuI83tT+BnQnr27QIlMSs/ssQlUpaH4P1qFnyKv
	 SQE5MiNROlPrGw2wB49mHGbEoI51V9a8aZYVERr12l1QO5ocu2qqjOs184CxUo54Pi78x
	 brXCs2eO7EjwoU/Ncv5/U4UNE8Oq9isyDhUuuQptXwGrRdZq/1pW6U+xe+prIEclt9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IomTqYql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4AD606A320;
	Sun, 22 Nov 2026 03:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IomTqYql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C221F000C4;
	Sun, 22 Nov 2026 03:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795317251;
	bh=7Ns55xut4wz7vG77YRa5nbcVjMgJklqitMO+QAV2xks=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IomTqYqlczk0mk/OlfqSLip09QYoefByDmBiWtb3OFdBlpusgtgf/Qh8sZZdBpqRn
	 fM38FRF2va7pnkyPl31ITKOXMlSeqHWfCB08XbjNqV+rJmdaCN/FfTOKlxPZlt6Dbq
	 k/BUakT9MJk85k5Af4bkXBhX5/VK/6mSySzhyTHXgI1fIdhEYExBM69DYkEyHUt4qw
	 KCKgYFLpGzg+lRFJnaeZSLZU+i3/aCdM7pZucF70bmZbT3qKtrOSvJerJiJAkUT9Ur
	 s4RlGf2bL/CJb0ZEnDSryM1oUQMRkBmWdVqCtT++F3d2eA+vMzygq+nVBPKeVSGhtN
	 D4zAv4Tc7/PfQ==
Subject: Re: [PATCH net-next v4 1/4] ipv4: draw rt_genid from a sequence
 shared by all netns
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 03:14:10 +0000
Message-ID: <179531725087.3135.405511503096660392@kernel.org>
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-1-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-1-43e1ca0aac7f@linux.dev>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix depends on one guarantee: no other netns holds a given
  rt_genid value until the global 32-bit rt_genid_seq wraps.
- [Low] The commit fixes a cross-netns isolation bug that already exists
  in the current tree but has no Fixes: tag and no Cc: stable.

--

ipv4: draw rt_genid from a sequence shared by all netns

This patch moves rt_genid_bump_ipv4() out of line and takes every IPv4
rt_genid value from one global atomic sequence shared by all netns. That
sequence never returns 0. The aim is to make sure a route cached in one
netns cannot match the rt_genid of the netns its device has moved to.

> When a device moves to another netns, routes cached through it remain
> usable until dst_dev_put() points them to blackhole_netdev. For a route
> using a nexthop object this happens in nexthop_free_rcu(), which
> free_fib_info_rcu() queues from inside an RCU callback, so the
> rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
> the rt_genid of the new netns matches the cached one in that window,
> ipv4_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.

[Severity: Low]
Should this carry a Fixes: tag and a Cc: stable?

The premise holds in the current tree. For a fib_info that uses a nexthop
object, free_fib_info_rcu() in net/ipv4/fib_semantics.c only drops the
nexthop reference:

    if (fi->nh) {
        nexthop_put(fi->nh);
    } else {

The cached rtables are released later, through this chain:

    nexthop_free_rcu()->nexthop_free_single()->fib_nh_release()

That runs from an RCU callback queued inside another RCU callback, so the
rcu_barrier() in __dev_change_net_namespace() does not wait for it.

The old rt_genid_bump_ipv4() was a plain atomic_inc() from 0 in every
netns, so this cross-netns leak is visible to users in released kernels.
It most likely dates from when nexthop object support was added to
fib_info.

Without a Fixes: tag, how can backporters tell which stable trees need
this?

[ ... ]

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index b9f5397336d34..294c9c278c403 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -393,6 +393,27 @@ static inline int ip_rt_proc_init(void)
>  }
>  #endif /* CONFIG_PROC_FS */
>  
> +/*
> + * Draw rt_genid bumps from one sequence shared by all netns. A route keeps
> + * the genid of the netns it was created in, and is checked against the netns
> + * its device is in now, so distinct values make that check fail once the
> + * device has moved. Every netns starts at 0, which the sequence never hands
> + * out, and inserting a route bumps the genid, so cached routes carry values
> + * drawn from the sequence.
> + */
> +static atomic_t rt_genid_seq;
> +
> +void rt_genid_bump_ipv4(struct net *net)
> +{
> +	int genid;
> +
> +	do {
> +		genid = atomic_inc_return(&rt_genid_seq);
> +	} while (!genid);
> +	atomic_set(&net->ipv4.rt_genid, genid);
> +}

[Severity: Medium]
Can an unprivileged user force rt_genid_seq to wrap and bring back the
collision this patch is meant to close?

The fix assumes no other netns holds a given value until the 32-bit
sequence wraps. However, sysctl_route_net_init() deliberately keeps the
per-netns route flush sysctl for netns owned by non-init user namespaces:

    /* Don't export non-whitelisted sysctls to unprivileged users */
    if (net->user_ns != &init_user_ns) {
        if (tbl[0].procname != ipv4_route_flush_procname)
            table_size = 0;
    }

Each write to that sysctl advances the global counter, with no rate limit:

    ipv4_sysctl_rtcache_flush()->rt_cache_flush()->rt_genid_bump_ipv4()

Route add/delete loops and xfrm_policy_insert() also advance it. The
period is 2^32-1 nonzero values, so a few threads could cycle it in
anywhere from minutes to about an hour.

After a wrap, the NETDEV_UP rt_cache_flush() in the device's new netns B
can hand out the same value that a route cached in the old netns A
carries. rt_is_expired() only tests for equality:

    res = rth->rt_genid != rt_genid_ipv4(dev_net_rcu(rth->dst.dev));

so ipv4_dst_check() would accept the stale route. A socket in A would
then send through a device that belongs to B until dst_dev_put() runs.

Lining up the exact count between the two draws without being able to
read the counter is uncertain. Still, the commit message's "no other
netns holds until it wraps after 2^32 bumps" seems to treat the wrap as
unreachable.

This matters more later in the series. "net: remove rcu_barrier() from
__dev_change_net_namespace()" removes the barrier, so rt_genid uniqueness
becomes the only guard for all IPv4 cached routes, not just nexthop
object routes, until the deferred dst_dev_put() runs.

Would comparing netns identity, or using a wider sequence, avoid relying
on a value that unprivileged users can cycle?

> +EXPORT_SYMBOL_GPL(rt_genid_bump_ipv4);
> +
>  static inline bool rt_is_expired(const struct rtable *rth)
>  {
>  	bool res;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f%40linux.dev

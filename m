Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393543;
	b=EP0myJcI2vM5dAP6lpqELldz/udOKGtn3mCy/TpaQ9Y5uJEd+g9chPm1/4/u7YMGM+5S
	 5i4VpxU7ZQguscS/C2yl5pw/RkT2QZzViZUaH+hKETmZAw11KmdNxGOIFt9xpQ1R45f4v
	 /vXpLXCYh0db8T0LRwrJd9McN7qzdH9vP56uHGLvvmOAqk14vmebWZhhZKR/AzxO4v/Q/
	 WjLecSMtX9rZ6A5axRjhRR5ZLYQ5+INBLNb6UIWtdOzLCc1Su6HIZBb0bDCbg9dqtbfas
	 aUQDk2LkVGmMS/SW17nYDSIqtbhZ4cLavoSJjP3fTiyzy0MFtgWjtIYyl4iqi+zRf/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393543;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rFGFyJlMM2hycCOeLd2pZeLmJL2ifKJTAEAyuF1Hf08=;
	b=wXEDMFWmOuMPkC+lp5ScH+CSyoQZ+SncekzlDVSYDaW9kTobQYHSFb47iMm+2qj/Cg7S
	 r+FX1PL+80wIJqrPcWKf5j3xmTa9YzLOdfLfg2IU9ickIY9kxaFdVIIO5Jw68JUWLPwpk
	 sIym9NeqbMmY0Lpa1ZhbtaiuavMHFw8Rs5MDcgVu6ZUQ3CUvlTz6SrzHZ1DH3U8s5WNg7
	 F0aKVwuXAogWBM22WjDtG+vPQV77f9ly3RuCioUw3FqNr4A3Z2Yq8viHLD/E6b0UA/WlZ
	 XM3nvfa1R4u+5F8lHmtsWNd+cYQWia0H53JDf3P7yFN9DfCy5ZgnyRAGv6ytvj3pbFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEhgc8Rj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32E606A31A;
	Mon, 23 Nov 2026 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CEhgc8Rj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3B01F000CF;
	Mon, 23 Nov 2026 00:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393543;
	bh=rFGFyJlMM2hycCOeLd2pZeLmJL2ifKJTAEAyuF1Hf08=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CEhgc8Rj7bXRxrF3lCeo9H52AZlytk+nH4eFDkekc1rC00J9s295zHLx+onNmvXU8
	 /vrsGIWUK4zcdci/YuipELQjYkFCjz3UebuqpG9N3R4Y1tLkCcEG0F9bwQKf+rn/1H
	 pEqv1C8NAOiKhHe0yh9AhiRSMtWlPyxWcUguoJY3AwfFKIF+PsZl5MnQLymfriAQTE
	 sPv8KfT/2i0AB4RVuw3gxFdn6HrePUfX1WUtC87XksMynaxfAL6eJqpHXrn38o9PAF
	 JQCh/jT4eacD18hnt/+Ap9TcQSywGIjvGgt97jOn75mYOOWJFeYRWbhdLwmJjKtYGQ
	 zrs6dVwaQKN7g==
Subject: Re: [PATCH net-next v5 1/4] ipv4: draw rt_genid from a sequence
 shared by all netns
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, ralf@mandelbit.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:25:42 +0000
Message-ID: <179539354213.3135.13464015676697562807@kernel.org>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-1-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-1-100a3b5d9090@linux.dev>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rt_genid_bump_ipv4() in net/ipv4/route.c can return without
  changing net->ipv4.rt_genid, so a requested route-cache flush is…
- [Low] The commit message describes a netns-isolation bug in the current
  tree, but the patch has no Fixes: tag and no Cc: stable.
- [Low] The fix relies on every rt_genid value being unique across netns,
  and that only holds until the global 32-bit rt_genid_seq wraps.

--

ipv4: draw rt_genid from a sequence shared by all netns

This patch replaces the per-netns atomic_inc() of the IPv4 rt_genid with
values drawn from one global sequence shared by all netns. That sequence
never returns 0. Each drawn value is published with a cmpxchg on the netns
rt_genid, so a route cached in one netns cannot pass rt_is_expired() after
its device moves to a netns whose rt_genid happens to match.

> When a device moves to another netns, routes cached through it remain
> usable until dst_dev_put() points them to blackhole_netdev. For a route
> using a nexthop object this happens in nexthop_free_rcu(), which
> free_fib_info_rcu() queues from inside an RCU callback, so the
> rcu_barrier() in __dev_change_net_namespace() does not wait for it. If
> the rt_genid of the new netns matches the cached one in that window,
> ipv4_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.

[Severity: Low]
This describes a netns isolation bug in the current tree, but the patch has
no Fixes: tag and no Cc: stable. Should it have them?

The window does exist before this patch. free_fib_info_rcu() runs as an
RCU callback, and from there the nexthop release is queued as a second,
nested callback:

free_fib_info_rcu()
  nexthop_put(fi->nh)
    call_rcu_hurry(&nh->rcu, nexthop_free_rcu)

The rcu_barrier() in __dev_change_net_namespace() does not wait for that
nested callback.

The likely origin is the change that let fib_info use nexthop objects.
Could the exact commit be identified and cited, so stable maintainers know
which kernels need this?

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d0930ae4c5ae6..ece931f7d9e4d 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -393,6 +393,42 @@ static inline int ip_rt_proc_init(void)
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

[Severity: Low]
Values from this sequence are unique only until the 32-bit rt_genid_seq
wraps. The commit message says so ("until it wraps after 2^32 bumps"), but
it doesn't mention that an unprivileged user can now force the wrap. Is
that intended?

sysctl_route_net_init() keeps the flush sysctl for netns owned by non-init
user namespaces:

net/ipv4/route.c:sysctl_route_net_init() {
    ...
		if (net->user_ns != &init_user_ns) {
			if (tbl[0].procname != ipv4_route_flush_procname)
				table_size = 0;
		}
    ...
}

After unshare -Urn, each write to /proc/sys/net/ipv4/route/flush takes
this path:

ipv4_sysctl_rtcache_flush()->rt_cache_flush()->rt_genid_bump_ipv4()

Each write advances the global rt_genid_seq, and this is cheap to repeat.

After a wrap, the genid that netns B draws can equal the genid cached on
routes in netns A. One example is the draw at NETDEV_UP after a device
move. A netns can also draw back the value of an older generation that was
invalidated, for example by an xfrm policy insertion. Either case lets
rt_is_expired() accept a stale route again.

This is hard to hit on purpose. rt_genid is not visible to userspace, so a
collision is roughly a 1 in 2^32 exact match. Per-netns 32-bit counters
could also be driven by unprivileged users before this patch.

It matters more once the later patch in the series, "net: remove
rcu_barrier() from __dev_change_net_namespace()", removes the barrier.
After that, genid uniqueness is the only check that rejects IPv4 routes
cached through a moved device.

Would a 64-bit generation be worth considering here? If not, could the
comment and commit message say that unprivileged users can drive the wrap?

> +
> +static int rt_genid_draw(void)
> +{
> +	int genid;
> +
> +	do {
> +		genid = atomic_inc_return(&rt_genid_seq);
> +	} while (!genid);
> +
> +	return genid;
> +}
> +
> +/*
> + * Publish the drawn value with a cmpxchg on the netns genid, drawing again if
> + * another bump got there first, so that a stalled bump never overwrites a
> + * newer value and each bump is ordered after the ones it replaces.
> + */
> +void rt_genid_bump_ipv4(struct net *net)
> +{
> +	int genid, old = atomic_read(&net->ipv4.rt_genid);
> +
> +	do {
> +		genid = rt_genid_draw();
> +	} while (!atomic_try_cmpxchg(&net->ipv4.rt_genid, &old, genid));

[Severity: Medium]
Can this bump return without changing net->ipv4.rt_genid?

rt_genid_draw() rejects only 0. Nothing compares the drawn value with the
current genid of the netns.

Say netns A last drew V. Other netns then advance the shared rt_genid_seq
until it wraps back to V, and A's next bump draws V again. In that case
atomic_try_cmpxchg() runs with old == genid == V. It succeeds, the loop
exits, and A's rt_genid stays at V.

The old atomic_inc() always changed the value. Now the requested flush is
silently lost, and rt_is_expired() keeps accepting routes cached before it
until the next bump.

Callers that depend on the flush include:

- fib_trie route insert and delete
- rt_cache_flush() from the NETDEV_UP/NETDEV_DOWN and address handlers
- xfrm policy insertion in xfrm_policy.c
- rt_genid_bump_all() on SELinux policy reload

Would redrawing while genid == old avoid this? For example:

	do {
		do {
			genid = rt_genid_draw();
		} while (genid == old);
	} while (!atomic_try_cmpxchg(&net->ipv4.rt_genid, &old, genid));

> +}
> +EXPORT_SYMBOL_GPL(rt_genid_bump_ipv4);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090%40linux.dev

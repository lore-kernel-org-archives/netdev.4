Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767317;
	b=admiL+L0bXndqBmqqvjehsR1DyphfmZjDEXE7+guP/bAMPdmN2YV9InArZV0JgWbZcNy
	 kMOLuKEqL8/6baWKV/MPz2fnucUOVLzRJhgS1LGqaHt1Lld/5moJ6AARDcfI9DQ0fBDUe
	 EXFFsTVH+OcLCuuDS7y2ctA0i81cQXSfZxNaYUQYJ4A2OiA6hBgnCe4X8+uoN59/9dKI6
	 ENjncZ3m2M+9G25MHD7+kDzrByI8vVwk0aw9OtAmLX1zWytAqVVqjThpINk803P+uTF8r
	 +O0AasXL4WFtBPS6Q+3d9qizrTUYzo56pxEq61/x6ST988h8c0dX9d+roQSS1Gx0Chg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767317;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hNVKbbcb0rH2k0oNa/+8nHEpScggSuU/akAN9eg5SSc=;
	b=4PnJdk1loxjlgEaMUsorOe1rh4nVk0lyL6U/yuRpAyDjQYBol/y2aNiDa4/TCGrjiDZ3
	 1axLkhpxIgvbGGZV9C1nrdbEFLE6jv3FMwtJLBqCY0Bz3Nq/KbQ47vv7fpi4aO/6O79hk
	 ZC/ziU245wZ7KUu/ng4FbTYy53PeJYpfags9y0T+pFV/mmxYe5fstb+PacAJHNNuTZWvx
	 vFfzVGBBv/v+Zey2aKZHKE58+PYeDdrImXEzxeEicTro5kcd4RPfi03MCWh8q8RL8F3jM
	 rHtg1KsdKKo2//mfPp+vHfeN8EyQhFDa8LbSoiDXNXyx7gFRiXobkC3D4Wgx78ZfXcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8IVcIrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2938C606A329;
	Fri, 27 Nov 2026 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8IVcIrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66D81F00897;
	Fri, 27 Nov 2026 08:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795767316;
	bh=hNVKbbcb0rH2k0oNa/+8nHEpScggSuU/akAN9eg5SSc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g8IVcIrK8zL3DCRDYGPavDfosidzrXPu1WfuHPY0y+37wVOUTGRCX6lYKdpxweFLf
	 naI+ayemB9VY2dCVZVBa0sgf8axH4ArGQS5aRbHfnz6A7wXgPkVkFD9br5jkkFV7ht
	 q1GMN55wAAcaCM6Ww1TgX4K8/TDIIdT3/G+L9O3ThdoU0q9vL6yFCR47mgnHCdwEj0
	 UPFcLLBMN2tmUuAEiFloEvwgtb0lipav6SffofREdzJj74KqyzEHGzoZMNpxjFim4t
	 U7JRzPyw2DP/z9N9fqTKuc11cc9TOGIiNqonvW0RNgB4qoXScIN43cgDWe/KUr1YIL
	 t0z2enrllYzWg==
Subject: Re: [PATCH net] ipv6: advance the serial after rebalancing in
 fib6_ifup and fib6_ifdown
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, sharmasagarika@google.com,
 kuniyu@google.com, yanxia@cmss.chinamobile.com, linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 08:15:15 +0000
Message-ID: <179576731529.3135.10238815120466881443@kernel.org>
In-Reply-To: <20261126081353.55240-1-ralf@mandelbit.com>
References: <20261126081353.55240-1-ralf@mandelbit.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Moving fib6_update_sernum()/fib6_update_sernum_upto_root()
  after rt6_multipath_rebalance() in fib6_ifup() and fib6_ifdown() makes…

--

ipv6: advance the serial after rebalancing in fib6_ifup and fib6_ifdown

This patch moves the fn_sernum update in fib6_ifup() and fib6_ifdown() so
it happens after rt6_multipath_rebalance(). The new serial is then
published only after the ECMP upper bounds it describes. The fully ordered
atomic_try_cmpxchg() in fib6_new_sernum() orders the rebalance before the
serial store.

Link: https://lore.kernel.org/netdev/cover.1795642432.git.dahern@nvidia.com/

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 1b2dcc066e198..194432f1fd66b 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -5015,8 +5015,8 @@ static int fib6_ifdown(struct fib6_info *rt, void *p_arg)
>  			}
>  			rt6_multipath_nh_flags_set(rt, dev, RTNH_F_DEAD |
>  						   RTNH_F_LINKDOWN);
> -			fib6_update_sernum(net, rt);
>  			rt6_multipath_rebalance(rt);
> +			fib6_update_sernum(net, rt);
>  		}
>  		return -2;

[Severity: Medium]

Does this reorder close the race, or does it only make the window smaller?

Some multipath routes do not use nexthop objects (rt->nh == NULL). For
those, ip6_rt_pcpu_alloc() leaves pcpu_rt->sernum at 0:

net/ipv6/route.c:ip6_rt_pcpu_alloc() {
    ...
	if (f6i->nh)
		pcpu_rt->sernum = rt_genid_ipv6(dev_net(dev));
    ...
}

The cookie therefore comes from fn->fn_sernum through
rt6_get_cookie()->fib6_get_cookie_safe(). It is read only after the lookup
has finished, for example in ip6_dst_store():

	np->dst_cookie = rt6_get_cookie(dst_rt6_info(dst));

inet6_sk_rx_dst_set(), udp6_sk_rx_dst_set() and xfrm6_fill_dst() also read
the cookie after the dst has been selected.

Before that, the lookup reads the nexthop state without the lock, in
fib6_select_path() and in rt6_score_route():

	if (hash <= atomic_read(&first->fib6_nh->fib_nh_upper_bound)) {

So the reader reads upper_bound and flags first, then fn_sernum. With this
patch the writer stores flags and upper_bound, issues a full barrier, then
stores fn_sernum. That order only pairs with a reader that reads the
serial first.

The smp_rmb() in fib6_get_cookie_safe() comes after the fn_sernum read.
It cannot order the earlier upper bound reads.

Can this interleaving still happen?

CPU0 (connect())            CPU1 (fib6_ifdown(), NETDEV_DOWN)
fib6_select_path()
  selects sibling A with
  old upper bounds/flags
                            rt6_multipath_nh_flags_set()
                              A |= RTNH_F_DEAD | RTNH_F_LINKDOWN
                            rt6_multipath_rebalance()
                            fib6_update_sernum()
                              fn_sernum = N + 1
ip6_dst_store()
  np->dst_cookie = N + 1

Later, ip6_dst_check()->rt6_dst_from_check()->fib6_check() compares N + 1
with N + 1. It accepts the cached dst for the dead nexthop A.

The NETDEV_CHANGE path in fib6_ifdown() has the same ordering. So does
fib6_ifup() with fib6_update_sernum_upto_root().

The commit message says:

  The cached dst then passes dst_check although it was selected
  from the old state, until the next relevant change.

That outcome looks reachable whenever a lookup overlaps both writes. The
patch only removes the case where the whole lookup falls between the
serial bump and the rebalance.

A full fix seems to need the reader to sample the generation before the
lookup. The separately proposed "ipv6: validate cached dsts against the
netns route generation" series does that.

This patch carries Fixes: tags and may be backported without that series.
Could the commit message say that the patch narrows the window rather
than closes it?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126081353.55240-1-ralf%40mandelbit.com

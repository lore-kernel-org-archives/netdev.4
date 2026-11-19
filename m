Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080174;
	b=x/d6UIVzOh7KpnH9rZsbNGHYBPq6uqwhpmpghHot3SXYBKG9lBMp3CK4ZNZL30u/KJrj
	 dRr06X3mRtHHDDkPw3DOGDSrVVuBdMV91PgSQFg1sHJtdY/ggtJx92dqaVhvzCFoLxFpY
	 vGlu7Fh5z8tFP2k7sc2LS55W2nLRIvsz3B9Txn2ydJz80OI5zPxztCdE2stO7I0VnO8ba
	 swi1GFLbvgb+Jl7O6VArrsHrwAOahSYewqaB8WKn31ZE1nVKq1fbpe0f9zYS1Gml6t9EI
	 D7J3Ppjwop4wiatrtJRLO3O5iTUNIfHxOFTdt/7KPHzpS8nj1kundRFiAb9PSTA/J6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080174;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kzTbXStisJTpwvkLD7D1wA2Fot0EqQtg6G0ERSDfDCo=;
	b=IleecB4l4CaL08TCfMX16BSj9MrzCn7yZbSSHIsnUld6OLpae3gVCbLgaxsMxsJTpn2/
	 AmqoyJ8fNZZvEzFNCl1yh2EYNc2FdLqXTM7Q9+JE/dUYbjy/Pn0Wz84khpsvyWFXjbLsY
	 Zst7iUxXuCxXpfjsCePVbzNc5oZUnfYzs7lYmzhA1zFOa5fcagOROX6cHi0RLUVHeP3UP
	 +IIWizrt1droGfG4dB1JWyyQYRBr57tYpsCe6RR/0KYS41mDUDRnMpSWLDevy5q0UIKuG
	 dZxjjjK1AfPP0oJG5tR2kle3FXu0XKLGNz9JwNhkM18eHV45Suf/JZdsb8a6DttNtyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXqaXkXQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1167606A320;
	Thu, 19 Nov 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXqaXkXQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7211D1F000C4;
	Thu, 19 Nov 2026 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080174;
	bh=kzTbXStisJTpwvkLD7D1wA2Fot0EqQtg6G0ERSDfDCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QXqaXkXQPXl7Kk3MSyfTRPZhH03G20sdcA5zC5JeO2TGjpB3UZ8ftYutCUfeycJg+
	 CN3RR37P7K9LvcTlDBCAQgkpVKCk+pxOUp2pmoNMptf/mbqMGbJ+W6uNCnGMcVtxWb
	 f9pA5/yn5BBq3JAEabrqbfH4V6AIO7/DQQlt9emt5MkwXhi4lH4UXvXMUppi033Bv5
	 mLbBlaEbDPZQWY+89LcKubTC1GUrXLbT4LE/aU5+NHnnedgWWCPdtUBHqs8VE+P+qK
	 bsAVJ6kenqiMHJKmSeqnAmWBZXy46EMafKXnxxCcyLV2rMYuvSnD2Vv94gTta5ltw2
	 ASrvP+zsl34wA==
Subject: Re: [PATCH net-next v3 1/3] ipv6: stamp the default route node with a
 fresh serial on link failure
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 sd@queasysnail.net, antonio@mandelbit.com, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 09:22:53 +0000
Message-ID: <179508017302.3136.6673661223156092826@kernel.org>
In-Reply-To: <5b59512a6c51c7a5d7c7b4e16728de3c522d9a1e.1794906743.git.ralf@mandelbit.com>
References: <5b59512a6c51c7a5d7c7b4e16728de3c522d9a1e.1794906743.git.ralf@mandelbit.com>
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

- [Low] ip6_link_failure() (net/ipv6/route.c) used to do one idempotent
  store, WRITE_ONCE(fn->fn_sernum, -1).
- [Low] The patch reuses rt6_exception_net() in ip6_link_failure() for a
  dst that is not an exception (the !RTF_CACHE, RTF_DEFAULT branch).

--

ipv6: stamp the default route node with a fresh serial on link failure

For a non-cached RTF_DEFAULT dst, ip6_link_failure() used to write -1
into fn_sernum. With this patch it takes tb6_lock and calls
fib6_update_sernum() instead. That stamps the node with a fresh serial and
advances net->ipv6.fib6_sernum, so the lookup-cookie checks added later in
the series can tell repeated invalidations apart.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 4a4c5ace63c54..cc505817399ba 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2873,13 +2873,13 @@ static void ip6_link_failure(struct sk_buff *skb)
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
The old code did a single store that gave the same result every time.
The new code takes the table-wide tb6_lock and advances the netns-wide
net->ipv6.fib6_sernum on every call. ip6_link_failure() runs once per
skb, not once per event.

Is that per-skb cost intended on these paths?

For example, neigh_invalidate()->ndisc_error_report() calls
dst_link_failure() for every skb queued on the default router's
arp_queue:

net/ipv6/ndisc.c:ndisc_error_report() {
    ...
	dst_link_failure(skb);
    ...
}

The err_count paths in ip6_tnl_xmit() and ipip6_tunnel_xmit() also reach
this code, at one link failure per received ICMP error. These are 1:1, so
they don't amplify anything. The sit path can't be reached for ISATAP,
because ipip6_err() returns before incrementing err_count when
parms->iph.daddr == 0.

Each bump goes through fib6_new_sernum():

	} while (!atomic_try_cmpxchg(&net->ipv6.fib6_sernum, &old, new));

Nexthop-object pcpu dsts are seeded from that generation in
ip6_rt_pcpu_alloc() and checked against it:

net/ipv6/route.c:rt6_is_valid() {
	return rt6->sernum == rt_genid_ipv6(dev_net(rt6->dst.dev));
}

So each call drops and reallocates every nexthop-object pcpu dst in the
netns. ip6_dst_check() also rejects every socket-cached one, which forces
a re-lookup.

The commit message says:

    Advancing the namespace generation also invalidates unrelated dsts using
    nexthop objects, which are validated against that generation.

and the v3 changelog calls this harmless. Could the commit message say
that this happens once per skb? That includes bursts when the neighbor
entry for a default router fails.

For reference, rt6_insert_exception() already does the same tb6_lock plus
fib6_update_sernum() once per event. Per-event invalidation is also part
of the fix itself: coalescing would let dsts cached between two failures
survive. The later patches in the series don't change ip6_link_failure(),
and "ipv6: add ip6_dst_lookup_flow_cookie" relies on this generation
bump.

[Severity: Low]
This isn't a bug, but rt6_exception_net() is now used for a dst that is
not an exception (the !RTF_CACHE, RTF_DEFAULT branch). Here it picks the
netns whose fib6_sernum gets advanced. Its name and comment still only
describe exception accounting:

/* Exceptions are accounted to the netns their dst was allocated in.
 * Unlike dev_net(dst->dev), it does not change when the device moves to
 * another netns or when dst_dev_put() points the dst to blackhole_netdev.
 */
static struct net *rt6_exception_net(const struct rt6_info *rt)

The netns it returns looks correct here, and dev_net(rt->dst.dev) would
be wrong after dst_dev_put(). Other readers of the same counter, such as
rt6_is_valid() and ip6_rt_pcpu_alloc(), use dev_net(), so it isn't
obvious why this one is different.

Would it make sense to update the comment, or rename the helper, so that
it covers this use?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794906743.git.ralf%40mandelbit.com

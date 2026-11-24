Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516012;
	b=ssZW5gc/7Hi5MIv8iOFcyTkTN8MGyiqYdxAfcygduL4U4TkoNVlKtQww+RZG9veoO2eC
	 +u0/i5U9fKqEbqVavFsdLZKVxoZy2gF3m+8XMFIl8Y+BIz3iNFZme4T39j355YTXE67Ma
	 +2EV4YzhkyUtIlsvyAlDNEdBz1yDyYNGoL03BYb+Mn2c29OPrw7hjn7ewjv3yoYbWQbWI
	 24BQHExkX3WHflufUghNvT7D4rfUx5ci/ZxvIfCpDPAagbvYfsf+hh1E6vfjT7uFr5OiM
	 bNc3AvCmp5d5dXJ3KZ/CZRFdNm3xBKcKZfj7UtqQ6fFdyJb5b7RzePNmJPgWiUaVnrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516012;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=HnrGYXuG6KO9wQGzYBGIZMUrCQTMR5ZPPuGjWtonSXY=;
	b=qnWLFcObLo9+PbISnvvKI8xaSyik7Kvn1HiEkZQ/4l4OcLOuANGNRvWi0jufSemYscT3
	 6j4yNHTRNO5/Gr9oZRRF5TUpTaiUCYf+lgGGVRQHeTGMGuiWILaI3s6pd4OMs8CGxERu0
	 FdBHZ8YdrxV2973qbKkHgJNOIDV22LlDisF+H4TLXhooUprTVKa23mXRAZcopixeq4e4q
	 IkGxhFzR0z2WTmmxcOSldACwEAYa6xMYqCbYUdeI2O/9IO5iyAPgi+h84wk4yfwHDoCeR
	 v2jd80vsXvEKjDWw97a5WmPw4ZgXafVAz8G8010ndlO4zDbZI4+5Tngc1itqs0iM2pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqBp9jyx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA590606A31E;
	Tue, 24 Nov 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqBp9jyx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868031F000C0;
	Tue, 24 Nov 2026 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516012;
	bh=HnrGYXuG6KO9wQGzYBGIZMUrCQTMR5ZPPuGjWtonSXY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FqBp9jyxqVIqq+DQaQFjqfl03yLSdZ1mYChCD4+5Ko4klrA9XRGWLS1P7fXO1KHrW
	 i0et1eXProQgUEGLhpXcCW3fpt4WS+3vKWUvmBXslup8xZz3WPRxPADyEwenoxBQOi
	 ugOA4g2XaTjIdUgEQvrHJhwvpM/qy2LUUIROlLpIPIspB0Hbh8sUk/yk/cTaCnw++p
	 KBBQVp5j67N3ARIlr36TEHB0WjdDk68wzu2BGGBOgwWF5cpEcNQLqXfMIKuyNstw21
	 Btv3/cuDL9k1ULaT25mdGDuTyp8KB8CyCtfXmOhsnvZEyvemQBi2BcjHwNIPphxRWW
	 y9qIr1hTIVVGw==
Subject: Re: [PATCH net-next v4 1/5] ipv6: stamp the default route node with a
 fresh serial on link failure
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 yanxia@cmss.chinamobile.com, sd@queasysnail.net, antonio@mandelbit.com,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 10:26:51 +0000
Message-ID: <179551601105.3135.14543779680619984305@kernel.org>
In-Reply-To: <79fea581787dd175005d81090d246e982a07cc51.1795166508.git.ralf@mandelbit.com>
References: <79fea581787dd175005d81090d246e982a07cc51.1795166508.git.ralf@mandelbit.com>
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

- [Low] The patch makes ip6_link_failure() (net/ipv6/route.c) do much
  more work for an RTF_DEFAULT, non-RTF_CACHE dst.

--

ipv6: stamp the default route node with a fresh serial on link failure

This commit changes ip6_link_failure() so that it no longer writes -1 into
fn_sernum of an RTF_DEFAULT route's node. It now calls fib6_update_sernum()
under tb6_lock, which allocates a fresh serial and advances the netns-wide
fib6_sernum generation. The changelog says the extra cost happens once per
queued skb when the neighbour of the default router fails.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 4a4c5ace63c54..bbe6d67bb6964 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c

[ ... ]

> @@ -2873,13 +2875,13 @@ static void ip6_link_failure(struct sk_buff *skb)
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
Is the cost of this path limited to neighbour failure, as the commit
message says?

  This happens once per ip6_link_failure call, so once per queued skb
  when the neighbour of the default router fails.

Several tunnel transmit error paths call dst_link_failure(skb) once per
packet. For an IPv6 inner packet the inner route's dst is still attached,
so they reach ip6_link_failure():

  ipip6_tunnel_xmit() in net/ipv6/sit.c:
  tx_error_icmp:
	dst_link_failure(skb);

This one is taken when ip_route_output_flow() fails or when the underlay
route is not unicast or local.

  ip6_tnl_xmit() in net/ipv6/ip6_tunnel.c:
  tx_err_link_failure:
	DEV_STATS_INC(dev, tx_carrier_errors);
	dst_link_failure(skb);

This one is taken when ip6_route_output() returns dst->error, when
xfrm_lookup() fails, or when ip6_tnl_xmit_ctl() fails. skb_dst_set() runs
later than this, so skb_dst is still the inner IPv6 route here.

ip_tunnel_xmit() in net/ipv4/ip_tunnel.c also reaches tx_error_icmp in the
NBMA case when the IPv6 next hop is not v4-compatible.

There are also the err_count paths in ip_tunnel_xmit(),
ipip6_tunnel_xmit() and ip6_tnl_xmit():

	WRITE_ONCE(tunnel->err_count, err_count - 1);
	dst_link_failure(skb);

These run once per ICMP error received for the tunnel, so a remote host
can drive them.

RA-learned default routes carry RTF_DEFAULT, for example a default router
learned over ISATAP/sit, gretap or ip6gretap. pcpu copies keep the flag
through ip6_rt_copy_init().

While the underlay is broken, wouldn't every IPv6 packet sent through
such a route take tb6_lock with BH disabled? Each one would also run
fib6_new_sernum()'s atomic_try_cmpxchg on net->ipv6.fib6_sernum.

tb6_lock is the same lock that route insert/delete, GC and PMTU exception
insertion use. Each generation bump also invalidates every nexthop-object
dst in the netns, because rt6_is_valid() checks those against the netns
generation. Later in the series, ip6_dst_lookup_flow_cookie() returns
cookie 0 to socket lookups that race with a bump.

These are error paths where the traffic is already being dropped. Also,
rt6_insert_exception() already takes tb6_lock and bumps the generation on
remotely triggered PMTU exceptions. Still, the cost here seems to scale
with packets on these tunnel paths, not with neighbour queue length.

Could the changelog mention these callers? Would it be worth
rate-limiting the bump, or skipping it when the node's serial has already
moved past the one the dst cached?

>  			}
>  		}
>  		rcu_read_unlock();

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795166508.git.ralf%40mandelbit.com

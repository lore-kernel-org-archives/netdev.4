Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795317255;
	b=jX61MeGFT9uKGhBWhtN0HtWq8x4VSYcmsdnke5/LLuIVZD9BDAXBwwYAOxVS/CAnH193
	 Bftb4vLClZ8yNIUEM9zSIDuzRIaoxyPSxcgtbFCMKMXnNfTuGXNfBssDXQSwIDgnsrH/C
	 XafAJ8HpkWp2uzIEFBwWmyh7+hJY+Cn8LPygiIxL2Rw3NUZ2Ozv+zWMY08RZRjcS70bDj
	 YdalDR930Z24kswSawpxPARUpc9w40LdQK08/mwR+ASimapfaHO7NkhzTY1uISxqaigOa
	 oq4DI1XDvsgmsOktx/3SF1jytpgjmS0o8eqceoe0jntJwNQ6I4WPb/Y0zbg9tvzVKKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795317255;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2+tghrPSyjUuptNRmSeL7lFlWpthZ2Um/xg8dU0e42k=;
	b=aFQzdYq7N9YnEAf9sP0k19ZbQ3GtdVaXVa4w2JtBAGiyFy17RuSa/9WGyQ9AJOMQOLlt
	 em2KQ7oikix//noELvVq8D7N4OhZe2t4BoiHWPczSxqYhb8NS0SmkBORk7e1Byp6iq2hu
	 KqyL0N7APjKsvcsNhrJd3ii5GdSqwM6gX7hKRa/Wqz/C5pchXRQXMy+BHiOWJbYUkJ2vg
	 lOCJFj4OxJ8M93mGNnjvFySpU8qIq/MeYQmubCCO3kdxmrMch7jFssZX9+IQbhr8R+4wt
	 sV378vHI+C0PVPNe5v9hdNgxMpdFqGsSAtMbBIYaKKsetwwPZtsS0Piu8ed4rIcIi4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqztIP+0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349A606A681;
	Sun, 22 Nov 2026 03:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqztIP+0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9731F000CA;
	Sun, 22 Nov 2026 03:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795317255;
	bh=2+tghrPSyjUuptNRmSeL7lFlWpthZ2Um/xg8dU0e42k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SqztIP+0mE0v1OG2b3C0bV3SgMK0pYsHJQmoiOVwJpMzbZaIDVodUKkxP5bdnAynm
	 xS7M7jXLbqtEK5kDgPVh0cLV6ya0RZuES5HOwcucvsKqkVq4vsdxqCUttsBRqGXMoM
	 NwV3YCWScoFQJyDWEzCvvBNwq+x4OGkehvTCI/9X11l/1ebxNSsBiup0oLgh3nH6h2
	 olQC5PBhPMmsyDUtScqn6dGC0mF/or19fhzwiZjbAQa7xl8U4k9Z9sxc5qU+wEMu+e
	 Q2CoCT5bwrjq1RbdX1eMdspHiopKxi00fTonDr5uUGcBuIQQ00v+ODgZXCUuWjb6JX
	 13eLEBjOMlu7g==
Subject: Re: [PATCH net-next v4 4/4] net: remove rcu_barrier() from
 __dev_change_net_namespace()
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 03:14:14 +0000
Message-ID: <179531725438.3135.9155413849195157249@kernel.org>
In-Reply-To: <20261117-bug-net-netns-move-rcu-barrier-v4-4-43e1ca0aac7f@linux.dev>
References: <20261117-bug-net-netns-move-rcu-barrier-v4-4-43e1ca0aac7f@linux.dev>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: race in __dev_change_net_namespace() leaves moved dev on
  xfrm_dst
- [Medium] net: missing dst_dev_put() wait in
  __dev_change_net_namespace()

--

> diff --git a/net/core/dev.c b/net/core/dev.c
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -13153,7 +13153,6 @@ int __dev_change_net_namespace(struct net_device *dev, struct net *net,
>  	 * the device is just moving and can keep their slaves up.
>  	 */
>  	call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
> -	rcu_barrier();
>  
>  	new_nsid = peernet2id_alloc(dev_net(dev), net, GFP_KERNEL);
>  
>

[Severity: Medium]
The changelog says routes cached through the moved device are
rejected once the netns changes. That only covers users that go
through dst_check(). Is that enough here?

For routes without a nexthop object, dst_dev_put() on the per-cpu
and exception dsts only happens in two places: free_fib_info_rcu() ->
fib_nh_release(), and fib6_info_destroy_rcu() ->
fib6_nh_release() -> fib6_nh_release_dsts(). On NETDEV_UNREGISTER,
fib6_drop_pcpu_from() only clears ->from.

Without rcu_barrier(), __dev_change_net_namespace() can therefore
return while those dsts still have dst->output set to ip_output() /
ip6_output() and dst->dev_rcu pointing at dev.

A few users don't call dst_check():

A corked UDP, UDPv6 or RAW socket in the old netns keeps the dst from
ip_setup_cork() / ip6_setup_cork(). On uncork,
udp_push_pending_frames() -> ip_send_skb() -> dst_output() uses it
as is. If dev has already been brought up in its new netns, the
corked packet goes out there.

The following read dst_dev_rcu(__sk_dst_get(sk)) directly:
get_netdev_for_sock() in net/tls/tls_device.c,
net_devmem_get_sock_binding(), smc_clc_prfx_set(),
smc_clc_prfx_match(), smc_vlan_by_tcpsk() and
smc_pnet_find_roce_resource(). They would get the moved device
rather than blackhole_netdev, and attach offload state to a device
in another netns.

The window is small. The synchronize_net() at the end means the
grace period has elapsed and only callback invocation is pending.
But rcu_barrier() closed it completely before.

Could the changelog cover these users? If the barrier has to go,
would it be better to release the cached dsts of routes on dev
synchronously in the NETDEV_UNREGISTER handlers? Or is there a
reason these paths don't matter?

[Severity: Medium]
Does dropping the barrier open a window where an xfrm bundle gets
built on the moved device after the uncached list flush has run?

NETDEV_UNREGISTER queues free_fib_info_rcu() and
fib6_info_destroy_rcu(), and those are what call dst_dev_put() on
the per-cpu and exception routes. Until they run, dst_dev_rcu() on
such a route still returns dev. netif_is_alive(dev) also stays true,
because reg_state remains NETREG_REGISTERED across the move.

ip_route_output_flow() and ip6_dst_lookup_flow() take a reference on
the base route and drop rcu_read_lock() before calling
xfrm_lookup_route(). So the synchronize_net() earlier in
__dev_change_net_namespace() does not wait for them.
xfrm_policy_queue_process() also passes xfrm_dst_path(skb_dst(skb))
from the hold queue to xfrm_lookup() without a dst_check().

Suppose xfrm_bundle_create() or xfrm_create_dummy_bundle() runs
after NETDEV_UNREGISTER has done rt_flush_dev() and
rt6_uncached_list_flush_dev(), but before the RCU callbacks.
xfrm4_fill_dst() / xfrm6_fill_dst() then take a reference on dev.
Once NETDEV_REGISTER has run in the target netns, they also take a
reference on the inet6_dev that ipv6_add_dev() just allocated there.

The xdst is then added to rt_uncached_list / rt6_uncached_list with
no flush left to catch it. It keeps the moved device and the new
inet6_dev referenced, and traffic can leave through dev in its new
netns.

With rcu_barrier() in place, dst_dev_put() had already switched these
routes to blackhole_netdev before dev_net_set().

The rt_genid / fib6_sernum argument in the changelog relies on
dst_check(), which these xfrm paths don't seem to do. Did you look
at them? Is there something else that closes this window, or does
the move still need to wait for these callbacks in some form?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-bug-net-netns-move-rcu-barrier-v4-0-43e1ca0aac7f%40linux.dev

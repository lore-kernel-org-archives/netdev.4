Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393549;
	b=YuFJN9+RkESyoDtcTspvcmu3dhnz7JA7YcgeFr0yEGpbALrLnDqpjgIv8CtljueuUNVR
	 3BeqOrO87XaLUkdtGQ0w7Y+b9/eVEFZM60VcQ8jZG7heRFX8VRcsjXR21+zoSaUnzV5mL
	 Ew2b9wCTPcYYlDYOrxnYjizp2jTij4VNZtL2KkTaqS30QNGJMXqnA26nixkjnAsVLbGXj
	 2b09WeCLLZjArPqZlfcSgyAR/uqZ6qjzrugKfoBhWEdRU9Gwr0teYC1feLsMjrQqzU7B5
	 1F/IyxvvKZENhtbK+xTAgStpXM829IWjDcni9RoBHsS1SK4B1TgTbp/2LC82AvD4d6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393549;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=x3ncCyWJI0oNs/+akg/GeXDiW5NuNouBcyrkOXqIEmI=;
	b=bUwNo85VlxGop1n4zdASVV7OeWdFpU9lRrbHBomGY/221BpRJUqlbCvRZT28J1abFqbC
	 YBjMFraXU531Ue/VvCo4FhA0o8g73xtla0WKb4RNsxtQCnEn/Fz+dGOeXyMTRBufgDYnp
	 7zIZXcL5U4pbn1EuGEsVtZWO4hzjvhn3BcFcpgzo3I2maQWPOgC80EiZOWT034/dOn5rG
	 2CmGOrJBqirjEw6vTnh3DxG55wJiRg/qRKU5Cvasv/zZ1IcNKqbWgmIvtguqPVtsWu/th
	 TlFrXhCyX5D4NPdDzU9vDZ11VDq47TIK1Yp3C80+N53nfE3ISmLT/4TomaEmbXPQj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLxLY0EQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DF6606A32A;
	Mon, 23 Nov 2026 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLxLY0EQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F33B1F000ED;
	Mon, 23 Nov 2026 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795393548;
	bh=x3ncCyWJI0oNs/+akg/GeXDiW5NuNouBcyrkOXqIEmI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jLxLY0EQ58PO4v6I43woUnmoZ86qP0MzRdtY3vCShfUCa6m/FgHIARViAp915MLT7
	 vA9mWnhbaQJOB3BvR1eeLpcH1jdabug45lLOGy4zKp2WaHgmNxy/rdki7y0HokcYm4
	 1IwLtB89Jm2Kh8bPsYvuXkX2kn/CMpDqHtzh9koNDQho9aIzpZfAUsFAYC4vS87eMi
	 oWQO9Ti13HKJdspf6xAzUybHDCV+4v180paTtVVmS9x3ip6zGARW5W6IPrKwQ4mDE1
	 vnwKu1pVjsnlUoyyUC2TXCG9uiReQb3uCMh+19YFYenLDEUhNiWB7IIpAyWU1GG+ji
	 1Gdv+0TVXpxPQ==
Subject: Re: [PATCH net-next v5 4/4] net: remove rcu_barrier() from
 __dev_change_net_namespace()
From: netdev-bot+sashiko@kernel.org
To: qiliang.yuan@linux.dev
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 razor@blackwall.org, kuniyu@google.com, ralf@mandelbit.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 00:25:47 +0000
Message-ID: <179539354761.3135.3163461672937357719@kernel.org>
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-4-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-4-100a3b5d9090@linux.dev>
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

Critical: 0 · High: 0 · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Removing rcu_barrier() from __dev_change_net_namespace()
  (net/core/dev.c, right after…
- [Medium] net: race in __dev_change_net_namespace() leaves moved dev on
  xfrm_dst
- [Medium] net: missing dst_dev_put() wait in
  __dev_change_net_namespace()

--

net: remove rcu_barrier() from __dev_change_net_namespace()

This patch removes the rcu_barrier() that follows the NETDEV_UNREGISTER
notifier call in __dev_change_net_namespace(). The commit message says the
barrier is left over from NETDEV_UNREGISTER_FINAL handling. It also says
routes cached through the moved device are rejected by the rt_genid and
fib6_sernum checks once the device's netns changes.

> diff --git a/net/core/dev.c b/net/core/dev.c
> index 1a63f6b939f70..88dcd30f59d22 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -13168,7 +13168,6 @@ int __dev_change_net_namespace(struct net_device *dev, struct net *net,
>  	 * the device is just moving and can keep their slaves up.
>  	 */
>  	call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
> -	rcu_barrier();
>  
>  	new_nsid = peernet2id_alloc(dev_net(dev), net, GFP_KERNEL);
>  

[Severity: Medium]
Is there still anything that makes dst_dev_put() run on the old
netns's cached routes before the device is usable in the new netns?

For IPv4 routes with fi->nh == NULL, the per-cpu and exception routes
are only released from free_fib_info_rcu(), through fib_nh_release()
and fib_nh_common_release(). For IPv6 routes with f6i->nh == NULL,
fib6_drop_pcpu_from() clears pcpu_rt->from at purge time but does not
call dst_dev_put(). That only happens in fib6_info_destroy_rcu(),
through fib6_nh_release() and fib6_nh_release_dsts(). Both callbacks
are queued from NETDEV_UNREGISTER. The rcu_barrier() removed here was
what made them run before dev_net_set().

The synchronize_net() at the end of __dev_change_net_namespace() only
waits for a grace period, not for those callbacks to be invoked. So
they can still be pending after the move returns and the device has
been brought up in the new netns.

Until they run, dst->output is still ip_output() or ip6_output()
rather than dst_discard_out. dst->dev_rcu also still points at the
moved device. Some users never go through dst_check(). A corked UDP
or RAW socket in the old netns keeps the dst it got in ip_setup_cork()
or ip6_setup_cork(). On uncork, udp_push_pending_frames() reaches
__ip_make_skb(), which moves cork->dst onto the skb, and then
ip_send_skb() and dst_output(). The corked packet would then go out
through the device in the new netns.

Socket offload setup has the same problem. get_netdev_for_sock() (used
by tls_set_device_offload() and tls_set_device_offload_rx()),
net_devmem_get_sock_binding(), smc_clc_prfx_set(),
smc_clc_prfx_match(), smc_vlan_by_tcpsk() and
smc_pnet_find_roce_resource() read dst_dev_rcu(__sk_dst_get(sk))
without sk_dst_check(). In this window they would bind to the moved
device rather than blackhole_netdev.

The window is narrow. The callbacks have to still be pending after the
final synchronize_net(), and the device has to be up in the new netns.
Still, the commit message reasons only from the rt_genid and
fib6_sernum checks, and none of these paths use them. Can the barrier
be removed without first releasing these dsts some other way? For
example, would a synchronous dst_dev_put() at NETDEV_UNREGISTER work
when the device is moving?

[Severity: Medium]
Can an xfrm bundle still be built on the moved device after this?

ip_route_output_flow() and ip6_dst_lookup_flow() take a reference on
the base route and drop rcu_read_lock() before calling
xfrm_lookup_route(). xfrm_policy_queue_process() also passes
xfrm_dst_path(skb_dst(skb)) for skbs on pq->hold_queue straight to
xfrm_lookup(), without a dst_check(). None of these callers sit inside
an RCU read section, so the synchronize_net() before dev_shutdown()
does not wait for them.

For a normal FIB route, dst_dev_put() on the cached per-cpu routes
only happens from free_fib_info_rcu() and fib6_info_destroy_rcu().
NETDEV_UNREGISTER queues both with call_rcu(). The removed
rcu_barrier() made sure those callbacks had pointed the dsts at
blackhole_netdev before dev_net_set(dev, net) and NETDEV_REGISTER.

Without the barrier, NETDEV_REGISTER in the target netns can run
ipv6_add_dev() and install a new inet6_dev in dev->ip6_ptr while the
callbacks are still pending. Suppose xfrm_bundle_create() or
xfrm_create_dummy_bundle() runs in that window:

net/xfrm/xfrm_policy.c:xfrm_bundle_create() {
    ...
	dev = dst_dev_rcu(dst);
	if (!dev || !netif_is_alive(dev)) {
    ...
}

dst_dev_rcu(dst) still returns the moved device. netif_is_alive() is
true because reg_state stays NETREG_REGISTERED during the move.
xfrm4_fill_dst() and xfrm6_fill_dst() then netdev_hold() the device.
xfrm6_fill_dst() also takes in6_dev_get(dev), which is now the target
netns's inet6_dev. The xfrm_dst then goes onto rt_uncached_list or
rt6_uncached_list, but rt_flush_dev() and
rt6_uncached_list_flush_dev() have already run for this move.

Would this leave an xfrm_dst in the old netns that sends or queues
packets through the device in its new netns? It would also hold device
and inet6_dev references that the flush for this move already missed.

The commit message argues from the rt_genid and fib6_sernum checks.
These paths, though, hold the base route across the move and do not
recheck it before building the bundle. Was the xfrm case considered?

A plain synchronize_net() in place of the barrier would not cover
this. It waits for readers, not for the queued callbacks to be
invoked. Is there something else that orders free_fib_info_rcu() and
fib6_info_destroy_rcu() before NETDEV_REGISTER in the new netns?

[Severity: Medium]

Without this barrier, is there still a grace period between the IPv4
teardown in the old netns and dev_net_set(dev, net) plus NETDEV_REGISTER?

Only two waits remain. One is the synchronize_net() before dev_shutdown(),
which runs before the notifiers. The other is the synchronize_net() at the
end, which runs after the switch.

An IPv4 output lookup in the old netns that starts after the first
synchronize_net() can still pick the moving device as dev_out. One way in is
ip_route_output_key_hash_rcu() with saddr set, oif 0 and a multicast or
limited broadcast daddr:

net/ipv4/route.c:ip_route_output_key_hash_rcu() {
    ...
		if (fl4->flowi4_oif == 0 &&
		    (ipv4_is_multicast(fl4->daddr) ||
		     ipv4_is_lbcast(fl4->daddr))) {
			/* It is equivalent to inet_addr_type(saddr) == RTN_LOCAL */
			dev_out = __ip_dev_find(net, fl4->saddr, false);
    ...
}

The device's addresses stay in the hash until inetdev_destroy() runs at
NETDEV_UNREGISTER.

A host-scope route through the device is another way in.
fib_create_info() sets fib_nh_scope = RT_SCOPE_NOWHERE for it, and
fib_sync_down_dev() with force == false skips that scope at NETDEV_DOWN.

Suppose that reader is preempted under PREEMPT_RCU, or stalled some other
way, until after dev_net_set(). It then resumes in __mkroute_output() and
calls rt_dst_alloc(), which takes the genid from the device's current
netns:

net/ipv4/route.c:rt_dst_alloc() {
    ...
		rt->rt_genid = rt_genid_ipv4(dev_net(dev));
    ...
}

At that point this is the new netns's genid. On the multicast/broadcast
path fi is NULL, so the route goes onto the uncached list. rt_flush_dev()
has already run for the old netns by then.

The validity check reads the same netns:

net/ipv4/route.c:rt_is_expired() {
    ...
	res = rth->rt_genid != rt_genid_ipv4(dev_net_rcu(rth->dst.dev));
    ...
}

So ipv4_dst_check() would accept the dst. Can a socket in the old netns
then hold a dst that passes the check while its device belongs to the new
netns? That would last until the new netns bumps rt_genid through
NETDEV_UP, an address add or a route insert.

Between dev_activate() and the NETDEV_UP flush, packets would go out
through the device in the other netns.

The shared genid sequence from "ipv4: draw rt_genid from a sequence shared
by all netns" doesn't seem to help here, because the stored value really is
the new netns's genid.

The old rcu_barrier() covered this case. NETDEV_UNREGISTER always queues
RCU callbacks (neigh_parms_release(), inet_free_ifa()), and waiting for
them needs a grace period that covers the stalled reader.

Given that, does this part of the commit message hold for this
interleaving?

    Routes cached through the moved device are rejected once its
    netns changes: IPv4 and per-cpu IPv6 routes no longer match the rt_genid
    or fib6_sernum of another netns

The IPv6 nexthop object case looks unreachable this way. There,
ip6_rt_pcpu_alloc() takes sernum from dev_net(dev), but
nexthop_flush_dev() removes those nexthops at NETDEV_DOWN, before the first
synchronize_net().

Would replacing rcu_barrier() with synchronize_net() be enough here? Under
RTNL that is an expedited grace period. It costs much less than
rcu_barrier() but still makes readers from the teardown phase finish before
the switch.

Another option might be to take rt_genid from the netns of the lookup
rather than from dev_net(dev).

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090%40linux.dev

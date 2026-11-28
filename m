Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848158;
	b=3UylBLcpr3N2dSrGcpUb2e+K/3xMwtC8k1ckMAHi8jQ6Z1pEAdfclv543rprZpAHs8ub
	 X9FhbnOS0fREPu3WiHcp7p+O3sIvAD/dE2KQhr5kCRVbn3pDtOco7LxrL+YJAlOfJVAPA
	 iTh3vVOSheFTed9jdSjvKexTQzkEdwLpR2P+h4xBUnKaVyJwNdVKrfPTrRX8LThFobWB0
	 /I5MGAUyhpmNGwqk61k1fFLOC9f98HdGJr1PiPO3unFraX5fyRoC/h+0LzdYWiga+OSwb
	 /rWSVzBiPhRlrsosklDY9TrrNncgkq1scpnF7282kQNmx+NI2Ns0KHkZXA5WK9d6U9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848158;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/46tpLCHBarOr1nJSSNpTCgNB/+AZxC0310uNX9POUA=;
	b=URVz7xXcG973YIrpvZjuUsJHuB2jNTVIAPbKM/CBA6tZohqk3yZ2i3Z+B8SyBuSeSvct
	 RAzYLAofq7KsjvRLo3EWLaDq0o/l0tJPJP8PO2WYD8arOucbVH1lgsf9h7D0H4FT1KHpz
	 qhky9uHTTjOi38RH/OjC94+dURoTstRXO8Q97jTO8oNEgyx9fdnO98fDb7hoQ97pqRkIn
	 YDIGJeULjKB+VWkWQGDVi8Kbndv8rNPlrppc5WykntjIjiJs89r4eDLnYq6WaF4VI1six
	 F4mHUv6HJKox4PezOiceOX79x5EOtdnWV8aSozJXXUsBhgn7U1sNawSHShQOWfqCbBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ztc4I4Fm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41815606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 06:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ztc4I4Fm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FA21F000C1;
	Sat, 28 Nov 2026 06:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795848157;
	bh=/46tpLCHBarOr1nJSSNpTCgNB/+AZxC0310uNX9POUA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ztc4I4FmnXm5ScpkHFSIsKgpKxP/NrNpSrWIwZ282k1Uni4G6WBRyvANUyXRVnu2f
	 Jps8XaVe3KYu0Ggx1ddHBWQTgFOXDCbZGqtEPVSKwN0U9Hmqgm/z+8OKpi+5nKVqmI
	 c6mJ7Xib6sGnL68T0DsRgG5N4vmZQFtFnxRdQgW0beVHCVCkxhOiH6TY9P/NGwmpam
	 YO1YHETR+uhwkt3lraWCRE+apF69jFgqzd6pRaFUBV6xDl45TLd3p9Ch6MfSLrjCFJ
	 DgiSSpAUT075ipUwvl0X7j7syXd1pn1pSnuwOv/2KYSeeGg9CYIB+Ddc7gd+7afP5/
	 9Famf4BBre64g==
Subject:
 Re: [PATCH net v2 1/4] net: wait for RCU readers after flushing routes
From: netdev-bot+sashiko@kernel.org
To: n0ps1edzz@gmail.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, willemb@google.com, kuniyu@google.com,
 hangbin.liu@linux.dev
Date: Sat, 28 Nov 2026 06:42:36 +0000
Message-ID: <179584815675.3135.5910244068046256837@kernel.org>
In-Reply-To: <f717d85edfc29966526f156ecfcf5b9dfca23fab.1795754281.git.n0ps1edzz@gmail.com>
References: <f717d85edfc29966526f156ecfcf5b9dfca23fab.1795754281.git.n0ps1edzz@gmail.com>
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

- [High] The new grace period runs too early, so the fix is incomplete.
- [Low] The Fixes: tag only names 4a6ce2b6f2ec ("net: introduce a new
  function dst_dev_put()", 2017).

--

net: wait for RCU readers after flushing routes

This patch adds a synchronize_net() call to netdev_run_todo(), after
rt_flush_dev(NULL) and rt6_uncached_list_flush_dev(NULL). The goal is to
wait for RCU readers that loaded the old device from dst->dev before
dst_dev_put() dropped the last device reference, so the device is not
freed underneath them.

Link: https://lore.kernel.org/netdev/20261125190113.GA421469@shredder/

> Fixes: 4a6ce2b6f2ec ("net: introduce a new function dst_dev_put()")

[Severity: Low]
Should this also have Fixes tags for these two commits?

  ca6854799069 ("ipv4: Batch rt_flush_dev() in netdev_run_todo().")
  f12d2907992d ("ipv6: Batch rt6_uncached_list_flush_dev() in netdev_run_todo().")

Those commits added the block in netdev_run_todo() that this hunk changes:

  rt_flush_dev(NULL);
  rt6_uncached_list_flush_dev(NULL);

They also added the dev->dismantle early return. That return makes the
NETDEV_UNREGISTER-time flushes in fib_netdev_event() and rt6_disable_ip()
into no-ops.

Before those commits, both flushes ran from the NETDEV_UNREGISTER notifier.
The synchronize_net() in unregister_netdevice_many_notify() always followed
them, before net_set_todo():

net/core/dev.c:unregister_netdevice_many_notify() {
    ...
	synchronize_net();
    ...
}

So the window in the first paragraph of the commit message seems to exist
only on top of the batching commits. The 2017 tag seems to apply only to
the RCU-callback case in the second paragraph.

With Cc: stable, the hunk will not apply to trees that lack the batching
commits. Those trees would also need the wait in a different place.

Could the tags and the commit message keep these two cases apart?

> diff --git a/net/core/dev.c b/net/core/dev.c
> index cd0796a1dbfdf..2a9d9a06ccb58 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -12039,6 +12039,7 @@ void netdev_run_todo(void)
>  	if (!list_empty(&list)) {
>  		rt_flush_dev(NULL);
>  		rt6_uncached_list_flush_dev(NULL);
> +		synchronize_net();
>  	}
>  
>  	cnt = 0;

[Severity: High]
Is this grace period late enough to cover every final device reference
drop?

It only covers references dropped before this point. Some RCU callbacks
can still call dst_dev_put() after synchronize_net() has returned.
dst_dev_put() drops the device reference right after the pointer swap:

net/core/dst.c:dst_dev_put() {
    ...
	rcu_assign_pointer(dst->dev_rcu, blackhole_netdev);
	netdev_ref_replace(dev, blackhole_netdev, &dst->dev_tracker,
			   GFP_ATOMIC);
    ...
}

The first path starts in the flush this patch targets.
rt6_uncached_list_flush_dev() calls fib6_info_release() on entries that
have fib6_destroying set:

net/ipv6/route.c:rt6_uncached_list_flush_dev() {
    ...
				from = unrcu_pointer(xchg(&rt->from, NULL));
				fib6_info_release(from);
    ...
}

If that drops the last fib6_ref, it queues
call_rcu_hurry(&f6i->rcu, fib6_info_destroy_rcu). This happens after the
first rcu_barrier() in netdev_run_todo(). The callback then runs:

fib6_info_destroy_rcu()
  fib6_nh_release()
    fib6_nh_release_dsts()
      dst_dev_put(&pcpu_rt->dst)

It does this on the per-CPU routes of a fib6_nh on the dying device. Those
routes hold their real device reference until then, because
fib6_purge_rt() only drops their from reference.

The second path is a chained nexthop callback.
fib6_info_destroy_rcu() or free_fib_info_rcu() can run during the first
rcu_barrier() and call nexthop_put(). nexthop_put() then queues
call_rcu_hurry(&nh->rcu, nexthop_free_rcu) from inside that callback.
rcu_barrier() does not wait for the chained callback, which later runs:

nexthop_free_rcu()
  nexthop_free_single()
    fib6_nh_release()
      fib6_nh_release_dsts()
        dst_dev_put()

IPv4 has the same pattern through rt_fibinfo_free_cpus().

In both paths, a reader can enter RCU after synchronize_net() has started
and before the callback runs. That reader can still load the old device.
One example is ip6_dst_mtu_maybe_forward(), reached through dst_mtu() on a
socket's cached per-CPU dst:

include/net/ip6_route.h:ip6_dst_mtu_maybe_forward() {
    ...
	rcu_read_lock();
	idev = __in6_dev_get(dst_dev_rcu(dst));
    ...
}

netdev_wait_allrefs_any() returns as soon as the refcount reaches 1. On
the first pass wait is 0, so msleep() is skipped. The device can be
returned right after rcu_barrier() has run the callback:

net/core/dev.c:netdev_wait_allrefs_any() {
    ...
		rcu_barrier();

		if (!wait) {
			wait = WAIT_REFS_MIN_MSECS;
		} else {
			msleep(wait);
    ...
}

netdev_run_todo() then moves straight to freeing the device, with no
grace period after the last reference drop:

  netdev_do_free_pcpu_stats()
  priv_destructor()
  free_netdev()
  kobject_put() -> netdev_release() -> kvfree(dev)

Can the reader still be running when kvfree(dev) is called?

Two later patches in this series depend on this grace period:

  "ipv4: route: fix use-after-free in ipv4_confirm_neigh()"
  "ipv6: route: fix use-after-free in ip6_confirm_neigh()"

Both say "The grace period added to netdev_run_todo() ensures that the
device remains alive until the read-side critical section finishes". No
later patch in the series changes net/core/.

Would it be better to wait for a grace period after
netdev_wait_allrefs_any() sees refcnt == 1 and before the free? That could
be a batched synchronize_net() at that point, or an RCU-deferred netdev
free. Either would replace the placement in this patch rather than add to
it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795754281.git.n0ps1edzz%40gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330380;
	b=BqbILzmKQgZvWkCkxndjlXJBIbCP+nonoecVc3DNZCF5OpWagI3t2SLU2ZOhSoPJcr9G
	 hCVE9hn8KL+WXmr6g8CnvOBjCH0eWOXDMkvzGwpced0q+pg6ZFLEHhdzb19ohcNjvGEtP
	 a6FjLXWMv8Q60oMvNP3xr5zogshvLqDdrlkRltfA4LcUZMTMA1Fe32sa+WXTVjBulxPIF
	 tJLDYfRBIjLDnnCA3VUqPojEgbju71muJMartA3PJFwJV6ZYZao3B0Tq1HTzpNNYBI3yC
	 L6Jl4WEkkeCgOnGyKfU96+rfBgIbwodWtOUGD5YdIfmIdHzaZQMqnhP1gW5W7cK4KjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330380;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=p8ITJh2geOk14WBw6w3vQ+exrKWJVU0oWY//4aCp5/g=;
	b=VU/Wa+O6w9JzHfEFBv3uvY3xnvDnA0j9H3/xDDWyBrBy1AmocE5Fr1MioE418utieJ9Y
	 uRLYNPQu4UmIx3yBx7iBmDqwuYBmwbXEKIAcM5eAV+A8g2ebsluU/EeoivrMRBd2DwuZL
	 4lTpVpbzt4/kDTlNhoA/6/SFKJ+kzoz5oNJOKV1cYXM8lCVQ+CmUIGnaLvnllpTRPlTar
	 omdrMR0clT3BnPzJ66n16FEc4OZGfZgB9gzC3NSvun5Up3CDQqcNq11ADN3qAVnxNkDpj
	 u2QJXNU7JG6buESrMZgLdGkbgPej7/qf7yC4BEXZikVbcaQTIaw/rS7hV8Xu0eycntg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkEPu6Ci;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C784F606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkEPu6Ci
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06F81F000C0;
	Sun, 22 Nov 2026 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795330380;
	bh=p8ITJh2geOk14WBw6w3vQ+exrKWJVU0oWY//4aCp5/g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jkEPu6Ci9IzoZC3F3EVazDbJQulLJr9o0OTKQNaRo1uDf6WwOuD88ZzhH5z7mooua
	 CTDfLuQ6IWgpvuyCMXcxqYo2sF2R4W992qeQ9FACbzAyBFaydkiFu1vBT+h5n/jknN
	 825ze2MThFiUA8v4FO52apzgXxqssDDgnxB/AOaliTUFXbMwCyxBHvrs3vQQ5+JbC9
	 lywLZxj4zPuYjj3eAkj0qOAu2Z8s+ladXH1JT1CHn1sl7TAqRhrPwTPDII1ch+wigN
	 JRynHIaQs4fo4cH7wWoaaJDPxqrmYONEHK6oqUEqHYgonLp04vkL2Diqvi4aAUNbzh
	 VtW6RzeWvzhxw==
Subject:
 Re: [PATCH] ipv6: addrconf: regenerate missing host route on RTM_NEWADDR
From: netdev-bot+sashiko@kernel.org
To: 847807867@qq.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Date: Sun, 22 Nov 2026 06:52:59 +0000
Message-ID: <179533037927.3135.9489105429921450491@kernel.org>
In-Reply-To: <tencent_F3B718D78486FB80B4040B92FC5BD3076E06@qq.com>
References: <tencent_F3B718D78486FB80B4040B92FC5BD3076E06@qq.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch leaves the root cause named in its own commit message
  unfixed.
- [Medium] ipv6: addrconf: __ipv6_ifa_notify() inserts routes while IPv6
  is stopped
- [Low] The commit message says the patch will "regenerate the host route
  with fixup_permanent_addr()".
- [Low] The two callers of fixup_permanent_addr() handle its failure
  differently.
- [Low] The new call in __ipv6_ifa_notify() does not check
  IFA_F_PERMANENT before calling fixup_permanent_addr().

--

ipv6: addrconf: regenerate missing host route on RTM_NEWADDR

This patch changes RTM_NEWADDR handling in __ipv6_ifa_notify(). When an
address on an up device has no ifp->rt, the host route is now regenerated
with fixup_permanent_addr() instead of only printing a warning. It targets
addresses kept by keep_addr_on_down after addrconf_ifdown() ran because
the MTU dropped below IPV6_MIN_MTU.

Closes: https://syzkaller.appspot.com/bug?extid=af16ddc8fd22a1d135f8

> Instead of only warning, regenerate the host route with
> fixup_permanent_addr() when RTM_NEWADDR arrives for an address
> without ifp->rt on an up device, keeping the warning only for the
> allocation failure case.

[Severity: Low]
This isn't a bug, but fixup_permanent_addr() does more than regenerate
the host route:

net/ipv6/addrconf.c:fixup_permanent_addr() {
    ...
	if (!(ifp->flags & IFA_F_NOPREFIXROUTE)) {
		addrconf_prefix_route(&ifp->addr, ifp->prefix_len,
				      ifp->rt_priority, idev->dev, 0, 0,
				      GFP_KERNEL);
	}

	if (ifp->state == INET6_IFADDR_STATE_PREDAD)
		addrconf_dad_start(ifp);
    ...
}

Could the commit message say that RTM_NEWADDR handling can now install a
non-expiring prefix route and start DAD for PREDAD addresses? It could
also mention that the failure handling here differs from
addrconf_permanent_addr(), which deletes the address when the fixup
fails.

> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 4b0cb7d23541d..70230ffdc077f 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -6357,17 +6357,17 @@ static void __ipv6_ifa_notify(int event, struct inet6_ifaddr *ifp)

[ ... ]

> -		if (ifp->rt && !rcu_access_pointer(ifp->rt->fib6_node)) {
> -			ip6_ins_rt(net, ifp->rt);
> -		} else if (!ifp->rt && (ifp->idev->dev->flags & IFF_UP)) {
> -			pr_warn("BUG: Address %pI6c on device %s is missing its host route.\n",
> -				&ifp->addr, ifp->idev->dev->name);
> +		if (!ifp->rt && (ifp->idev->dev->flags & IFF_UP)) {

[Severity: Medium]
Can this reinstall routes on an interface where IPv6 has been stopped?
The only check here is IFF_UP. addrconf_ifdown(dev, false) can stop
IPv6 on lo while lo stays IFF_UP. That happens when the MTU drops
below IPV6_MIN_MTU in the NETDEV_CHANGEMTU case, or when lo comes up
with a too small MTU in the NETDEV_UP case.

In that state rt6_disable_ip() has flushed the routes and IF_READY is
cleared. Kept addresses are left in PREDAD with ifp->rt == NULL.

addrconf_ifdown() only calls addrconf_del_dad_work(). That uses
cancel_delayed_work(), which does not wait for a dad_work item that is
already running and blocked on rtnl_net_lock().

On NETDEV_UP for lo, addrconf_permanent_addr() calls
fixup_permanent_addr(), and addrconf_dad_start() queues such a work
item. This happens before the MTU check calls addrconf_ifdown(). The
NETDEV_CHANGEMTU path can race with a pending dad_work in the same
way.

Once the lock is released, addrconf_dad_work() sees PREDAD and calls
addrconf_dad_begin(). The early completion branch runs before the
!(idev->if_flags & IF_READY) check. It is taken for IFF_LOOPBACK or
IFF_NOARP devices, for IFA_F_NODAD addresses, and when accept_dad is
below 1. The resulting call chain is:

addrconf_dad_begin()
  addrconf_dad_completed()
    ipv6_ifa_notify(RTM_NEWADDR, ifp)
      __ipv6_ifa_notify()
        fixup_permanent_addr()
        ip6_ins_rt()

Before this patch that sequence only printed the warning. With the
patch, doesn't it allocate a new host route and insert it together
with a prefix route? The device's MTU is still below IPV6_MIN_MTU and
its idev is not IF_READY. As far as I can see, nothing removes these
routes until the next addrconf_ifdown(). The prefix route is also the
non-expiring one from fixup_permanent_addr(), even if the address has
since been given a finite lifetime.

Should the regeneration also require IF_READY on ifp->idev? Or should
addrconf_dad_begin() bail out for a !IF_READY idev before it takes
the early completion branch?

[Severity: High]
The commit message says recovery "never happens when IPv6 is stopped
through the NETDEV_CHANGEMTU path", but this change doesn't touch that
path. Is the kept address recovered when the MTU is restored? Or does
recovery only happen if some later event produces RTM_NEWADDR for it?

The keep path in addrconf_ifdown() leaves the address like this:

net/ipv6/addrconf.c:addrconf_ifdown() {
    ...
	ifa->state = INET6_IFADDR_STATE_PREDAD;
	if (!(ifa->flags & IFA_F_NODAD))
		ifa->flags |= IFA_F_TENTATIVE;

	rt = ifa->rt;
	ifa->rt = NULL;
    ...
}

IF_READY is cleared as well, and rt6_disable_ip() has already flushed
the host and prefix routes.

When the MTU goes back to IPV6_MIN_MTU or above, the NETDEV_CHANGEMTU
case in addrconf_notify() finds the existing idev and only does this:

	if (idev) {
		rt6_mtu_change(dev, dev->mtu);
		WRITE_ONCE(idev->cnf.mtu6, dev->mtu);
		break;
	}

A later NETDEV_CHANGE that takes the idev from !IF_READY to IF_READY
only calls addrconf_dad_run(idev, false). That call skips PREDAD
addresses:

	if ((ifp->flags & IFA_F_TENTATIVE &&
	     ifp->state == INET6_IFADDR_STATE_DAD) || restart) {

So the only way to reach the new fixup_permanent_addr() call seems to be
addrconf_dad_run(idev, true). That needs an IFF_NOARP change while
IF_READY is already set, which is the second toggle in the syzbot
reproducer.

Without that toggle, wouldn't every permanent address kept across the
MTU dip stay tentative, with no host route and no prefix route, until lo
is brought down and up or disable_ipv6 is toggled? This only needs
CAP_NET_ADMIN in a netns: set keep_addr_on_down, drop lo's MTU below
1280, then restore it.

Would it be better to restore the kept permanent addresses in the
NETDEV_CHANGEMTU path when the MTU returns on an idev that
addrconf_ifdown() stopped? That would mean addrconf_permanent_addr()
plus the IF_READY and DAD handling, instead of recovering from
__ipv6_ifa_notify().

> +			if (fixup_permanent_addr(net, ifp->idev, ifp))

[Severity: Low]
Should this also check IFA_F_PERMANENT? The only other caller,
addrconf_permanent_addr(), passes only permanent addresses:

	if (ifp->flags & IFA_F_PERMANENT)
		list_add_tail(&ifp->if_list_aux, &tmp_addr_list);

and fixup_permanent_addr() installs the prefix route with expires set
to 0.

A kept address with rt == NULL can lose IFA_F_PERMANENT before
RTM_NEWADDR fires:

1. A permanent address on lo is kept across an MTU dip, so rt is NULL
   and the state is PREDAD.

2. ip -6 addr change ... valid_lft N preferred_lft N runs.
   inet6_rtm_newaddr() clears IFA_F_PERMANENT, and inet6_addr_modify()
   re-adds the prefix route with RTF_EXPIRES. The address is tentative,
   so no notify is sent and rt stays NULL.

3. An IFF_NOARP toggle while IF_READY is set restarts DAD:
   addrconf_dad_completed()->__ipv6_ifa_notify()->fixup_permanent_addr()

4. addrconf_prefix_route(..., 0, 0) then hits the duplicate route branch
   in fib6_add_rt2node():

	if (!(rt->fib6_flags & RTF_EXPIRES)) {
		fib6_clean_expires(iter);
		fib6_may_remove_gc_list(info->nl_net, iter);
	...

Doesn't this make the prefix route of a finite-lifetime address
non-expiring? The route is still removed when the address is deleted or
expires, so only the route lifetime is wrong.

> +				pr_warn("BUG: Address %pI6c on device %s is missing its host route.\n",
> +					&ifp->addr, ifp->idev->dev->name);

[Severity: Low]
Here, fixup_permanent_addr() can only fail when addrconf_f6i_alloc()
fails, because addrconf_prefix_route() returns void. Does an allocation
failure still warrant a message that starts with "BUG:" and is not
ratelimited?

The other caller handles the same failure differently:

net/ipv6/addrconf.c:addrconf_permanent_addr() {
    ...
	if (fixup_permanent_addr(net, idev, ifp) < 0) {
		net_info_ratelimited("%s: Failed to add prefix route for address %pI6c; dropping\n",
				     idev->dev->name, &ifp->addr);
		in6_ifa_hold(ifp);
		ipv6_del_addr(ifp);
	}
    ...
}

Keeping the address here matches the commit message and the behaviour
before the patch. Deleting it from __ipv6_ifa_notify() would not be
safe, because addrconf_dad_completed() keeps using ifp afterwards. So
the concern is only the log text.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/tencent_F3B718D78486FB80B4040B92FC5BD3076E06%40qq.com

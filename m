Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330747;
	b=tdd0yV/wDWVgmiqC8o9N5IihGIG4IGcPoWhmAkuRODfwdM9JX3JDjf+9uyDiE25NZCGX
	 tEON/TZuOPTfn0D/RfjJ0o5xCMi+RIJ/uvO7OIKHtF+UI1UymB4qWfDc1fdV5ggfExh5b
	 xj3IqKo81cREaPI1OSz6txyuKHL4UAXsmpAgf+GiTFYDWo6nGsPspqfzMHwtjCzmHhtPS
	 nZ1xrBvxe+OMrSlMimMyGZflA/HrJ9JMVr4swn0sXiYIk7n0ISYa9QrUX0SfzzPzhFpmD
	 sevRAO2d5VOxv60boPdDjEESEHgCsitny8INcIY2ouCOJIsIKtGcvGnuEvO4mZdtVJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330747;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V/48laXJQkbdxZn/Y74K7XNybzq3LqLMyqUr/rnTTBI=;
	b=pq63MNojVrShlQ+Nxp5LKy26YMO4/niOUSfE7Cn00hWmcHg2PiE7qlE3ynSAcgPO7Wim
	 PvsKvSr0zVhlwAFc9Ea0Fz7yzHKJ4CrthKVQDrYr5bJqeoYMsB++ohmi2bqhpN5Rn6Ew/
	 /e117LjKtXxTRvysZGcgg30L70PGIMRDGnif6cb3kiCpo1uQfSF0wNLXS6gIRcVWqhx0G
	 ZCbdIA4AXQ+0ZUuf8CXcoK0EF+iim53QDWFwg8H+Go9w+rO6aEqcsTludWgREQrvY1dgZ
	 az9A7wy38y8LVfuZSqO8vazqRB6GZCJw9sY0zqlIjTR6NVpEH/f8K1K/yA+SwH+Wr0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6srZpZ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99C7606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6srZpZ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFDD1F000C0;
	Sun, 22 Nov 2026 06:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795330747;
	bh=V/48laXJQkbdxZn/Y74K7XNybzq3LqLMyqUr/rnTTBI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=F6srZpZ8vB3nFw8tMBPPrPRjY1hTVDC5tMwHKVwYSFo8iQ3OMQYMo+NfbHHwjm1Le
	 uVUtoKc1pn2BDiPODxo2CfvN8kiAzvVF2osRIRkvoGLOSlQKyeQ5DScUf9cKrkD59v
	 +zklWVBz6fBLwn7kaJDKFQxDMj+NdygEjoQ9MKnj/wpw9zoIwvUU5uKFKCLDadd7BF
	 j3wql3kzJH7TauCjiBGjBu61TfLkYXyrw7N4sSG4wT1B/IqvJlTeU11DVH0Rd22Zo6
	 8NFuPxqr0x45KvFkkcphnGOPmNtQMWwink5YVmM1l166l2ks/PdN3YxnGtsTI40QDJ
	 Py8WQKStLWOCQ==
Subject: Re: [PATCH net v2] ipv6: addrconf: regenerate missing host route on
 RTM_NEWADDR
From: netdev-bot+sashiko@kernel.org
To: 847807867@qq.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Date: Sun, 22 Nov 2026 06:59:06 +0000
Message-ID: <179533074631.3135.9591129364058936619@kernel.org>
In-Reply-To: <tencent_98F714E924966679E826125C2CB18B092A07@qq.com>
References: <tencent_98F714E924966679E826125C2CB18B092A07@qq.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix does not address the root cause its own commit message
  names.
- [Medium] The new RTM_NEWADDR branch in __ipv6_ifa_notify() calls
  fixup_permanent_addr() for any address with ifp->rt == NULL on an…
- [Medium] ipv6: addrconf: __ipv6_ifa_notify() inserts routes when IPv6
  is stopped
- [Low] The commit message ("regenerate the host route with
  fixup_permanent_addr()") and the new comment in __ipv6_ifa_notify()…
- [Low] The commit message says that when "an interface MTU drops below
  IPV6_MIN_MTU, addrconf_notify() stops IPv6 on the interface via…
- [Low] The kept pr_warn("BUG: Address %pI6c on device %s is missing its
  host route.\n") now fires only when fixup_permanent_addr() returns…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the same root
  state the patch handles (a kept address with ifp->rt == NULL on an up…

--

ipv6: addrconf: regenerate missing host route on RTM_NEWADDR

This patch changes __ipv6_ifa_notify(). When RTM_NEWADDR arrives for an
address that has no ifp->rt on an up device, it now calls
fixup_permanent_addr() to regenerate the host route instead of only
warning. The warning remains only for the case where
fixup_permanent_addr() fails.

Closes: https://syzkaller.appspot.com/bug?extid=af16ddc8fd22a1d135f8

> When an interface MTU drops below IPV6_MIN_MTU, addrconf_notify()
> stops IPv6 on the interface via addrconf_ifdown(). With
> keep_addr_on_down enabled, permanent addresses are kept but their
> host routes are deleted and ifp->rt is cleared; recovery is expected
> to happen when the device is brought up, where the NETDEV_UP path
> runs addrconf_permanent_addr().

[Severity: Low]
Is this true only for the loopback device? On the NETDEV_CHANGEMTU path,
addrconf_notify() calls:

	addrconf_ifdown(dev, dev != net->loopback_dev);

addrconf_ifdown() only looks at keep_addr_on_down when unregister is
false:

	if (!unregister && !idev->cnf.disable_ipv6) {

On any other device the idev is marked dead and every address is
removed. Through this path, the state described (a kept address with
ifp->rt == NULL on an up device) can only happen on lo.

Could the commit message say that?

> That recovery never happens when IPv6 is stopped through the
> NETDEV_CHANGEMTU path: the device itself never goes down, so no
> NETDEV_UP event follows when the MTU is restored. The address is
> left with ifp->rt == NULL while the device is up, and every later
> RTM_NEWADDR notification only warns:

[Severity: High]
This paragraph names the NETDEV_CHANGEMTU restore path as the root
cause, but the patch doesn't change that path. When the MTU is restored
on an existing idev, addrconf_notify() still only does this:

	if (idev) {
		rt6_mtu_change(dev, dev->mtu);
		WRITE_ONCE(idev->cnf.mtu6, dev->mtu);
		break;
	}

It doesn't call addrconf_permanent_addr(), set IF_READY, re-add ::1 or
restart DAD.

The addresses kept by addrconf_ifdown() stay PREDAD/TENTATIVE with
ifp->rt == NULL:

	if (keep) {
		state = INET6_IFADDR_STATE_DEAD;
		ifa->state = INET6_IFADDR_STATE_PREDAD;
		if (!(ifa->flags & IFA_F_NODAD))
			ifa->flags |= IFA_F_TENTATIVE;

		rt = ifa->rt;
		ifa->rt = NULL;

After a plain MTU flap, nothing sends RTM_NEWADDR for these addresses,
so the new code in __ipv6_ifa_notify() never runs. addrconf_ifdown()
also removed ::1 and cleared IF_READY. So IPv6 on lo stays broken after:

	ip link set lo mtu 1279; ip link set lo mtu 65536

The new code only runs when something later forces DAD to complete, as
in the syzbot reproducer. The first IFF_NOARP toggle only sets IF_READY
and calls addrconf_dad_run(idev, false), which skips PREDAD addresses.
The second toggle gets to:

	addrconf_dad_run(idev, true)
	  -> addrconf_dad_begin()      (IFF_LOOPBACK branch)
	    -> addrconf_dad_completed()
	      -> RTM_NEWADDR

Does this silence the warning but leave IPv6 broken on the device?

Would it be better to fix the NETDEV_CHANGEMTU branch instead? When idev
exists and IPv6 was stopped (IF_READY clear), it could do the same
restore as NETDEV_UP. That would replace this notify-time workaround.

> diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
> index 4b0cb7d23541d..70230ffdc077f 100644
> --- a/net/ipv6/addrconf.c
> +++ b/net/ipv6/addrconf.c
> @@ -6357,17 +6357,17 @@ static void __ipv6_ifa_notify(int event, struct inet6_ifaddr *ifp)
>  		/*
>  		 * If the address was optimistic we inserted the route at the
>  		 * start of our DAD process, so we don't need to do it again.
> -		 * If the device was taken down in the middle of the DAD
> -		 * cycle there is a race where we could get here without a
> -		 * host route, so nothing to insert. That will be fixed when
> -		 * the device is brought up.
> +		 * Otherwise, if the host route is gone while the device is up
> +		 * (e.g. dropped by addrconf_ifdown() for a low MTU and the
> +		 * address kept by keep_addr_on_down), regenerate it.
>  		 */

[Severity: Low]
This comment and the commit message describe the change as only
regenerating the host route. fixup_permanent_addr() also does this:

	if (!(ifp->flags & IFA_F_NOPREFIXROUTE)) {
		addrconf_prefix_route(&ifp->addr, ifp->prefix_len,
				      ifp->rt_priority, idev->dev, 0, 0,
				      GFP_KERNEL);
	}

	if (ifp->state == INET6_IFADDR_STATE_PREDAD)
		addrconf_dad_start(ifp);

So a prefix route is added from inside the RTM_NEWADDR notify handler,
and DAD may be started. The new call site also drops two things that
addrconf_permanent_addr() has: the IFA_F_PERMANENT filter and the
delete-on-failure handling.

The DAD start branch doesn't look reachable today. Every RTM_NEWADDR
producer that can see rt == NULL runs after addrconf_dad_work() has
moved the state from PREDAD to DAD. The prefix route insertion does
happen, though.

Could the comment and the commit message mention these side effects?

> -		if (ifp->rt && !rcu_access_pointer(ifp->rt->fib6_node)) {
> -			ip6_ins_rt(net, ifp->rt);
> -		} else if (!ifp->rt && (ifp->idev->dev->flags & IFF_UP)) {
> -			pr_warn("BUG: Address %pI6c on device %s is missing its host route.\n",
> -				&ifp->addr, ifp->idev->dev->name);
> +		if (!ifp->rt && (ifp->idev->dev->flags & IFF_UP)) {
> +			if (fixup_permanent_addr(net, ifp->idev, ifp))

[Severity: Medium]
Can this put routes back on a device where IPv6 has been stopped?
The only gate here is IFF_UP. addrconf_ifdown(dev, false) can run
while the device stays up, for example:

- on lo, in the NETDEV_CHANGEMTU branch, when the MTU drops below
  IPV6_MIN_MTU
- at the end of NETDEV_UP or NETDEV_CHANGE, when dev->mtu is below
  IPV6_MIN_MTU
- under NETDEV_CHANGEUPPER

In each case rt6_disable_ip() flushes the routes and IF_READY is
cleared. Kept addresses are moved to PREDAD and ifa->rt is set to NULL.

addrconf_del_dad_work() uses cancel_delayed_work(), which does not wait
for an addrconf_dad_work() that is already running. That work may be
blocked on rtnl_net_lock(), for instance one queued by
addrconf_permanent_addr() or addrconf_dad_run() just before the MTU
check. Once addrconf_ifdown() drops RTNL, the work sees PREDAD and
calls addrconf_dad_begin(). There, the completion fast path runs
before the IF_READY check:

	if (dev->flags&(IFF_NOARP|IFF_LOOPBACK) ||
	    ...
	    ifp->flags & IFA_F_NODAD) {
		...
		addrconf_dad_completed(ifp, bump_id, send_na);
		return;
	}

	if (!(idev->if_flags & IF_READY)) {

addrconf_dad_completed() sends RTM_NEWADDR. With this patch,
__ipv6_ifa_notify() then calls fixup_permanent_addr() and ip6_ins_rt().
That reinstalls the prefix route and the host route while IF_READY is
clear and dev->mtu is still below IPV6_MIN_MTU. This breaks the
expectation that no IPv6 routes stay installed on a device after
addrconf_ifdown() has stopped IPv6 on it.

Before this patch, the same sequence only printed the warning, because
ifp->rt was NULL. Routes on a stopped device are new behaviour.

Should the regeneration also require IF_READY in ifp->idev->if_flags?
Or should addrconf_dad_begin() check IF_READY before it takes the
completion fast path?

[Severity: Medium]
Should this check IFA_F_PERMANENT? fixup_permanent_addr() is written for
permanent addresses. It installs the prefix route with expires == 0 and
flags == 0, and its only other caller, addrconf_permanent_addr(),
filters on the flag:

	if (ifp->flags & IFA_F_PERMANENT)
		list_add_tail(&ifp->if_list_aux, &tmp_addr_list);

A kept address can stop being permanent while ifp->rt is NULL. Say
addrconf_ifdown() has kept the address as TENTATIVE, and then an
RTM_NEWADDR arrives with NLM_F_REPLACE and a finite valid_lft. That goes
through inet6_addr_modify(), which clears IFA_F_PERMANENT:

	ifp->flags &= ~(IFA_F_DEPRECATED | IFA_F_PERMANENT | IFA_F_NODAD |
			IFA_F_HOMEADDRESS | IFA_F_MANAGETEMPADDR |
			IFA_F_NOPREFIXROUTE);
	ifp->flags |= cfg->ifa_flags;

It also installs or refreshes the prefix route with RTF_EXPIRES, but
ifp->rt stays NULL.

DAD can complete later, for example when an IFF_NOARP toggle forces
addrconf_dad_run(idev, true). Then this runs:

	addrconf_dad_completed()
	  -> ipv6_ifa_notify(RTM_NEWADDR)
	    -> __ipv6_ifa_notify()
	      -> fixup_permanent_addr()
	        -> addrconf_prefix_route(..., 0, 0, GFP_KERNEL)

fib6_add_rt2node() treats the existing expiring route as a duplicate
nexthop. It clears that route's expiry instead of returning -EEXIST:

	if (rt6_duplicate_nexthop(iter, rt)) {
		...
		if (!(iter->fib6_flags & RTF_EXPIRES))
			return -EEXIST;
		if (!(rt->fib6_flags & RTF_EXPIRES)) {
			fib6_clean_expires(iter);
			fib6_may_remove_gc_list(info->nl_net, iter);

Does this turn the expiring prefix route into a permanent one? An
expiring prefix route learned from an RA, with the same prefix and
metric, would be hit the same way. Before this patch, this path only
warned and never touched the prefix route.

> +				pr_warn("BUG: Address %pI6c on device %s is missing its host route.\n",
> +					&ifp->addr, ifp->idev->dev->name);

[Severity: Low]
fixup_permanent_addr() only returns non-zero when addrconf_f6i_alloc()
fails:

		if (IS_ERR(f6i))
			return PTR_ERR(f6i);

So this message now reports a memory allocation failure. A failed prefix
route add is ignored, and the function still returns 0.

addrconf_permanent_addr() reports the same error from the same helper
with net_info_ratelimited(). Should this one be ratelimited too, and
drop the "BUG:" label? The string is the same signature syzbot matched
for this report, so allocation failure injection could produce new
reports.

>  		}
> +		if (ifp->rt && !rcu_access_pointer(ifp->rt->fib6_node))
> +			ip6_ins_rt(net, ifp->rt);

[Severity: High]
This is a pre-existing issue, not one introduced by this patch. The
state this patch handles (a kept address with ifp->rt == NULL on an up
device) can also lead to a NULL pointer dereference. The regeneration
here runs too late to prevent it.

addrconf_dad_begin() inserts the host route for optimistic addresses
without checking ifp->rt:

	if (ifp->flags & IFA_F_OPTIMISTIC) {
		ip6_ins_rt(net, ifp->rt);

__ip6_ins_rt() then dereferences rt->fib6_table. All of this happens
before any RTM_NEWADDR notification reaches __ipv6_ifa_notify().

A possible sequence with CONFIG_IPV6_OPTIMISTIC_DAD=y:

1. Set keep_addr_on_down and optimistic_dad on a non-loopback device
   that has IFF_NOARP set and a permanent address.

2. Take the device down. addrconf_ifdown() keeps the address as PREDAD
   and TENTATIVE with ifp->rt == NULL.

3. While the device is down, send RTM_NEWADDR with NLM_F_REPLACE, a
   finite valid_lft and IFA_F_OPTIMISTIC. inet6_addr_modify() keeps
   IFA_F_OPTIMISTIC because the address is TENTATIVE, and clears
   IFA_F_PERMANENT:

	if (!(ifp->flags & IFA_F_TENTATIVE) || ifp->flags & IFA_F_DADFAILED)
		cfg->ifa_flags &= ~IFA_F_OPTIMISTIC;

4. Bring the device up. addrconf_permanent_addr() skips the address
   because it is no longer permanent, so ifp->rt stays NULL. IF_READY
   is set, and addrconf_dad_run(idev, false) skips PREDAD addresses.

5. Clear IFF_NOARP. NETDEV_CHANGE calls addrconf_dad_run(idev, true),
   and dad_work enters addrconf_dad_begin(). The device is no longer
   NOARP or LOOPBACK, so the optimistic branch calls
   ip6_ins_rt(net, NULL).

Can this oops the kernel? It needs CAP_NET_ADMIN, which an unprivileged
user has inside its own user and network namespace.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/tencent_98F714E924966679E826125C2CB18B092A07%40qq.com

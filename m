Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609683;
	b=WSTDjxu9HJ+m4hQZqMZx7hZ46UoNZdiOJpOKquwl2Iot9E8QN+OHjQW0begTpBhYAIpM
	 rC1IbdRTSkAUmWnId2dZejzCZTHzGB7i3RcYvgGSlTQXaXzK+4xCQkrTeKGRGH2SLPZc1
	 QtTRzTc+T5II0gqqZYcIq08TYtGDbVIQd/q4EJpbwfbMC6VpE9wCQLvdQUuXywWmeR/MW
	 /nf24FmfqFCHvobtSs7rdtafc9XWJMTV1lH5Cei07sdlM67JHTFLBN1dZ7MtAb04EiflN
	 lwzfq7G8Y+Hw0K7fVxFP5Sf0NGAWNiqTXNTMmm9s+OS1t4jKJJL06dfg5jLT547wwQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609683;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Go7wfYO26GC8RBYfpLB4Qb+pE6mL+tMek88kGKiloGI=;
	b=TjkbKUPm1prEhfmTDkNwz5SS63pgZ9OWg17JnMpHDLY++dxyrcloLc0YpwQclFQIUgZ2
	 KWZ846WtP25aVYGUI47nRFokrgS51iucRWQzFueHhLPNe/LbCqZCN1iAEmO5yIB3aW+F9
	 c0L0sujuH4sd7BMNd3SyKR3rOjIjaCi5vVe4xCLyZiAcd1BejG3WxK/4c94T2snG8x5cj
	 nwyvvmQCja/Y1F9chlCRmA1xd3mZPZICOP83pLf8yj8aypZBfDEWNJCbDKUOotI6GigCL
	 2V+SFtvph/kJzEthXZVDsEJp25W8ynJJKxgHLSYGTi4I5mbpSE7euQrZ2os971d9XsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFslA5CO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275F606A321;
	Wed, 25 Nov 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFslA5CO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AE31F000C0;
	Wed, 25 Nov 2026 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609683;
	bh=Go7wfYO26GC8RBYfpLB4Qb+pE6mL+tMek88kGKiloGI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LFslA5COGM/ReWR6JO/jvt2rvde1K8QjfVXaDF0SykdN2mjAJ5wEiXHg+isJfwM4+
	 P8LFlMDOZ26hM/9EI+FyUNBvLyLbMZ+b2VrCggROrW5wznO7cuWBBRfp3HwOfP5Dmh
	 l6eA5TvtzGxaKu2nMOmur+eqyDqq6wFbZVPYiRkhntTGZqf6SkyfNO6gGBVX7VwZ1w
	 6iUgEwLkNHSeSRlN58M9p5Kavrh/Hph32AdPtkNGo8H7qZ9pJWVNphdldfXGFzgcbh
	 xbJ05o4ox9iUXoDNSoBu3zMRR4FYOOKpcXByR7WA+8mDMnnFBHk+DrbeVHOLFU3iQT
	 69YSFc4rFsg7Q==
Subject: Re: [PATCH net] bonding: clear stale usable_slaves in broadcast mode
From: netdev-bot+sashiko@kernel.org
To: jiangjiehua1@huawei.com
Cc: netdev@vger.kernel.org, j.vosburgh@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 liuhangbin@kylinos.cn, zhangchangzhong@huawei.com,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 12:28:02 +0000
Message-ID: <179560968241.3135.13874120007474157909@kernel.org>
In-Reply-To: <20261124130102.18807-1-jiangjiehua1@huawei.com>
References: <20261124130102.18807-1-jiangjiehua1@huawei.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch only fixes one target mode.

--

bonding: clear stale usable_slaves in broadcast mode

When the last slave is released in an xmit-hash mode, an empty
usable_slaves array is left published. If the bond is later switched to
broadcast mode, that array survives and makes bond_miimon_inspect()
ignore updelay. It also leaks from bond_uninit(). The patch frees the
array and clears the pointer in bond_option_mode_set() when the new mode
is broadcast.

> diff --git a/drivers/net/bonding/bond_options.c b/drivers/net/bonding/bond_options.c
> index 9efadeff6a223..f65916444fa1c 100644
> --- a/drivers/net/bonding/bond_options.c
> +++ b/drivers/net/bonding/bond_options.c
> @@ -936,6 +936,14 @@ static int bond_option_mode_set(struct bonding *bond,
>  	WRITE_ONCE(bond->params.arp_validate, BOND_ARP_VALIDATE_NONE);
>  	WRITE_ONCE(bond->params.mode, newval->value);
>  
> +	if (newval->value == BOND_MODE_BROADCAST) {
> +		struct bond_up_slave *usable;
> +
> +		usable = rtnl_dereference(bond->usable_slaves);
> +		RCU_INIT_POINTER(bond->usable_slaves, NULL);
> +		kfree_rcu(usable, rcu);
> +	}

[Severity: High]
Does balance-rr still skip updelay after this change?

The commit message says the cause is that "later mode changes do not
clear it". It also says "Broadcast never publishes usable_slaves, so it
stays NULL". The same is true of BOND_MODE_ROUNDROBIN. Nothing in
balance-rr replaces or clears usable_slaves. bond_mode_can_use_xmit_hash()
covers only 8023AD, XOR, TLB and ALB, so these refreshes all skip
round-robin:

drivers/net/bonding/bond_main.c:bond_open() {
    ...
	if (bond_mode_can_use_xmit_hash(bond))
		bond_update_slave_arr(bond, NULL);
    ...
}

drivers/net/bonding/bond_main.c:bond_enslave() {
    ...
	if (bond_mode_can_use_xmit_hash(bond) ||
	    BOND_MODE(bond) == BOND_MODE_BROADCAST)
		bond_update_slave_arr(bond, NULL);
    ...
}

The same check gates the refreshes in __bond_release_one() and in the
NETDEV_UP/CHANGE/DOWN handler. The miimon and ARP commit paths refresh
the array only for XOR.

bond_miimon_inspect() handles every mode except active-backup the same
way, so round-robin also reaches this code:

	usable_slaves = rcu_dereference(bond->usable_slaves);

	if (usable_slaves && usable_slaves->count == 0)
		ignore_updelay = true;

Here is the trigger. Release the last slave in balance-xor, 802.3ad,
balance-tlb or balance-alb. __bond_release_one()->bond_update_slave_arr()
then publishes a count-0 array. Switch to balance-rr, bring the bond up
and enslave a slave whose link is up. bond_enslave() puts the slave in
BOND_LINK_BACK with delay = updelay, but bond_miimon_inspect() skips the
delay because ignore_updelay is set.

The reproducer in the commit message, with "mode balance-rr" in place of
"mode broadcast", should still bring dummy0 up at once. The array does
not leak in balance-rr, because bond_uninit()->bond_set_slave_arr() takes
the non-broadcast path and frees it. Only the updelay bypass remains.
The balance-rr case looks like it dates back to f8a65ab2f3ff74.

The mode option requires BOND_OPTFLAG_NOSLAVES | BOND_OPTFLAG_IFDOWN.
bond_open() rebuilds the array for the modes that use it. Could the
broadcast-only condition be dropped, so that usable_slaves is cleared on
every mode change?

>  	/* When changing mode, the bond device is down, we may reduce
>  	 * the bond_bcast_neigh_enabled in bond_close() if broadcast_neighbor
>  	 * enabled in 8023ad mode. Therefore, only clear broadcast_neighbor

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124130102.18807-1-jiangjiehua1%40huawei.com

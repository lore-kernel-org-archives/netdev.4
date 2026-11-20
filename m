Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219002;
	b=krVYApjd2D0DVX/njrN+UGlZ9/bDCFIkOaBfTVVz7RDdz/ycuhRD33tOOsYFpT8n+pUm
	 X41UskSYVqAoLTJBWdTwpwyWQo+26OzSSubcjsZtPd60ct7NlyezubbrhPTx1khUcAV6z
	 KlnTcoN0nvY3H94aMPlUgcwtU8bKhGXAMC+j8osccDc8jwOFYDj4rNEKenmzeuhW0bimY
	 Qg8juHQ1tbxA8vAarN/YVGuMwER+p89X/M8q7SiQLT8/uEXhlE9LIHn7bHZz2TdBonw7F
	 XN3WH2RRXGWNjq/Qnvf/qcoNtsEpUstU39ckeTwJCCBGwPya9QMgeMYtiupyTApd4bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219002;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cURjqbFZ9ajyWde9z4VPmL8uchIRR0mkeMbwrPQE50E=;
	b=dQDwKutF9gs17gTTseJemFxtOfhG91iQ8FQSTaHZaMHi8tsWLO9EbBsnFWVmfjYeitam
	 +rUzHBEp2eDDrqixW6LGVt9G1i5wDcVGIKCabANWo9j32Z3Gh5R67Wk41CbQ0UUGHD4SA
	 UiA9PiidC1abMysEszHZlgJbzh8a6p/bDCpyhO6yvCyN7BIG9mirKIX4ZKilxuz5okMrt
	 MlaLQaZal/PMAyfYgtNFAUpfoJ/9KyUHDFTx8NM6ldiLEX0YyTuI8wMTNhwlKZCf9rMAT
	 odMfPo1L7UqubJ0Kfxj/YaSkc6HH65Mgpd7anwYOi0BV0Qwu5c23FttxPYY0BduoOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DokEm2vQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02791606A6BC
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DokEm2vQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5091F000C4;
	Fri, 20 Nov 2026 23:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795219001;
	bh=cURjqbFZ9ajyWde9z4VPmL8uchIRR0mkeMbwrPQE50E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DokEm2vQ2ojWOaRyi+sFlbL8J3S+2KExtMDybRuky+5ojyGrEPFRAMI2XxA51kbby
	 /tZ5B3lmZ3k8PkC2B4X+b/4CF3Ba4RwO/vUMR7MvnQHY7DcNX8roAiue/Z6QgH57X+
	 6k0jr0hSVTQZtyXDeqfZi6jUYq0l3ala8wILX/XHPTRFpnk8oiKNmnKSXmgZt703Vn
	 TtrjPdU1sBpYPhb5BsTNb9Spuq4S43S5fi/+OtjgohY1vuBQZEJfM87fxvbW4Imj0T
	 G2CHkme5ljW/sqmCIGLmNmK488BLDbI9CpohBipuHDahFnFHgBtYor+GmM9KhNd1z0
	 7MhVDNI+cPykA==
From: Jakub Kicinski <kuba@kernel.org>
To: zihanx@nebusec.ai
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vega@nebusec.ai
Subject: Re: [PATCH net v2 1/1] ipv6: mcast: pass resolved interface to source update
Date: Fri, 20 Nov 2026 15:56:37 -0800
Message-ID: <20261120235637.868362-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <43dfcc2e60579f68e436ade82bbd7ab7c727e250.1794738094.git.zihanx@nebusec.ai>
References: <43dfcc2e60579f68e436ade82bbd7ab7c727e250.1794738094.git.zihanx@nebusec.ai>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
ipv6: mcast: pass resolved interface to source update

This patch changes __ipv6_sock_mc_join() to resolve the device before the
duplicate membership check and to return the resolved ifindex to
do_ipv6_mcast_group_source(). ip6_mc_source() now matches memberships only
on the resolved interface and passes that ifindex to ipv6_sock_mc_drop().
The intent is for the membership lookup and the source update to share one
route selection, as in the IPv4 group-source path.

> When gsr_interface is zero, the SSM join helper resolves the default
> interface before checking for an existing membership. ip6_mc_source()
> then resolves the route again. A route change between these lookups can
> leave a membership on the first device while the source update fails on
> the second.

[Severity: Medium]
Is this an accurate description of the pre-patch behaviour? It looks like
no route change is needed, and the source update doesn't fail.

Before this patch, ip6_mc_source() took idev from the route when
gsr_interface was 0. Its membership loop, however, skipped the interface
check:

	for_each_pmc_socklock(inet6, sk, pmc) {
		if (pgsr->gsr_interface && pmc->ifindex != pgsr->gsr_interface)
			continue;

The old __ipv6_sock_mc_join() also matched any interface for ifindex 0 and
returned -EADDRINUSE. do_ipv6_mcast_group_source() treats that as success.

Take a socket with a membership on device A, while the route for the group
points at B. A MCAST_BLOCK_SOURCE, MCAST_JOIN_SOURCE_GROUP or
MCAST_UNBLOCK_SOURCE call with gsr_interface 0 then updates the
sflist/sfmode of the A membership.

The ip6_mc_add_src()/ip6_mc_del_src() calls run on B's ifmcaddr6 instead.
This covers both the mode-switch pair and the per-source calls. The
syscall still returns 0.

If another socket has joined the group on B, B's per-source
sf_count[MCAST_EXCLUDE] goes up. ipv6_chk_mcast_addr() then drops that
source for every listener on B:

	rv = READ_ONCE(psf->sf_count[MCAST_INCLUDE]) ||
		READ_ONCE(psf->sf_count[MCAST_EXCLUDE]) !=
		READ_ONCE(mc->mca_sfcount[MCAST_EXCLUDE]);

The mode-switch path can also lower B's mca_sfcount[MCAST_EXCLUDE] and flip
B's filter mode. Nothing undoes this later, because ip6_mc_leave_src() runs
against A, not B.

The ip6_mc_source() change in this patch does fix this.

Could the commit message say that an unprivileged socket can reliably
change another device's source filter state, affecting other sockets?
Right now it reads like a timing-dependent failure. The difference matters
for stable and security triage.

> diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
> index ecef55f261890..3f2a431ea0c81 100644
> --- a/net/ipv6/mcast.c
> +++ b/net/ipv6/mcast.c

[ ... ]

> @@ -207,25 +208,30 @@ static int __ipv6_sock_mc_join(struct sock *sk, int ifindex,
>  	if (!ipv6_addr_is_multicast(addr))
>  		return -EINVAL;
>  
> +	dev = ip6_mc_find_dev(net, addr, ifindex);
> +	if (!dev)
> +		return -ENODEV;
> +	ifindex = dev->ifindex;
> +	if (resolved_ifindex)
> +		*resolved_ifindex = ifindex;
> +
>  	for_each_pmc_socklock(np, sk, mc_lst) {
> -		if ((ifindex == 0 || mc_lst->ifindex == ifindex) &&
> -		    ipv6_addr_equal(&mc_lst->addr, addr))
> +		if (mc_lst->ifindex == ifindex &&
> +		    ipv6_addr_equal(&mc_lst->addr, addr)) {
> +			dev_put(dev);
>  			return -EADDRINUSE;
> +		}
>  	}

[Severity: Medium]
With this change, join treats ifindex 0 as the route-selected device.
ipv6_sock_mc_drop() is unchanged and still treats 0 as a wildcard:

net/ipv6/mcast.c:ipv6_sock_mc_drop() {
    ...
		if ((ifindex == 0 || mc_lst->ifindex == ifindex) &&
		    ipv6_addr_equal(&mc_lst->addr, addr)) {
    ...
}

Is this asymmetry intended? Joins with ifindex 0 can now create several
memberships for the same group. A drop with ifindex 0 removes whichever
matching entry comes first in the list (the most recent join), on any
interface.

For example, using IPV6_ADD_MEMBERSHIP/IPV6_DROP_MEMBERSHIP or
MCAST_JOIN_GROUP/MCAST_LEAVE_GROUP through ipv6_mcast_join_leave():

  join(G, 0)  -> membership on A
  route for G moves to B
  join(G, 0)  -> membership on B (previously -EADDRINUSE)
  route for G moves back to A
  drop(G, 0)  -> removes the B membership, not A

Some of this ambiguity already existed when an explicit-ifindex join was
mixed with an ifindex 0 join. Now ifindex 0 joins alone can produce it.

An application written for the old -EADDRINUSE behaviour sends one leave.
It then keeps receiving G on the other interface until the socket is
closed.

The IPv4 path mentioned in the commit message resolves ifindex 0 on leave
too. ip_mc_leave_group() calls ip_mc_find_dev(), which fills in
imr->imr_ifindex, and then matches that exact interface:

	ifindex = imr->imr_ifindex;
	...
		if (ifindex) {
			if (iml->multi.imr_ifindex != ifindex)
				continue;

The leavegroup path in ip6_mc_msfilter() also still passes the raw
gf_interface, which can be 0. ip6_mc_source() now passes the resolved
ifindex instead:

	err = ipv6_sock_mc_drop(sk, gsf->gf_interface, group);

Should ipv6_sock_mc_drop() resolve ifindex 0 the same way? Then join,
source update and drop would all use one interface, as the commit message
describes.

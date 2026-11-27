Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742809;
	b=TYpuxGZwkqLByCcwtud9Bufr+06KGVHXsM/sKxbPGiizTErYepAroti8q+k7MGICXJbj
	 3C7uOnD5/TY4LoJp6+qFMW2Dm6v1LyC+HL7hIC3jamIdMIg79WVMIUMswbKHLYvvuHfFZ
	 5aMccRt+roV+Dvt5orsZ3ZGeX+3jNVnKB7Dmnb3Ew7sE/cPz9oz3asLjiUbaQNaDv/NMM
	 Z0bRAOcrtzsAS/lFSyg7MKuL5he5QhCnX6poqmnZWvyuGdF8CTTidW1IagC4/KKC+Y77N
	 WtZbY7uc6jsoWfQqO7KkH1OtfNeBHlX1JaVTMQ68zJjir20WxcPBqx3pR3EAE2nKeKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=vRrj8qr43dvniYSEmMzgXGa9Ix3A2lKb+LnTX91ybfs=;
	b=jwY8qWsLccoIYIT1iGYAxIIRD+7g9xA2NWfiL4vYI0TW+tgteNP8HQ3w94ims2WfEAJG
	 Jtv8Gb4ZYPCDpA4iQJIis0NQm/wUbSnA/vY7bw7bjd1LMxyZbe8EFtj+V7ttz8akOY1wt
	 tQKNsHKrL990/pHULLtlx6feshrIHUWUVK+NXNXQUmUH05Qb1MzOG0TOX++yP3bg/FS7O
	 C+6WTxDO6KGsIIztEpeTEqW86mRFCWxuE3EgosXzXleriJ71VCmP3JY8WLt0LWfVQ4TJz
	 /DTLWxTkDMKO6G/Yorh86v/v8hL1rl1DeBi8xl2PTn472cS9h07OvPCevxO5xvAmgNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAeedaWe;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C56606A327
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C56606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAeedaWe
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0e3ffabe0so22147525ad.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795742808; x=1796347608; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRrj8qr43dvniYSEmMzgXGa9Ix3A2lKb+LnTX91ybfs=;
        b=IAeedaWeASoGkFG4rYSVpiyeU9ODNEPuF4Zt4ZP9tmB4mlVrw1k4ANwFeRf/qL3BPV
         8IhfMzTILEFxnSeVcTEiSS3ZlLfA2sjxCwVBThJPrb/KecjIkfImYRDcsmoFhvqZO5+C
         7woUUMsA16/2SS72W2yZrh/ESUSnVVHWbzIq6ZoTiX56LiVypVvChBEKO7aq1wf0Lg/V
         JKl3NgISwKgn0n9/RYSyHKqWX/38n2xgc5rJHBPbB5wsXRNprQtqr85yorhBTlD+MgBw
         Lsv0Rp64I4XQD6VipcQQlkk0NMtmA6rpfgqrIFH980iUQV3xNtTOI01biAhxN/Z0vWDh
         rjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742808; x=1796347608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRrj8qr43dvniYSEmMzgXGa9Ix3A2lKb+LnTX91ybfs=;
        b=2ggcw0kMMaT6L7JlpDVWKyRhZFj7YfcfZ9/in/Uy5AdR1uOA3oPwvW9uLjsJYpHzEm
         ULbfXjKuoIBf3XzRETp74REW4GCcoH3YRCzT+mYsCD6RNcvIrI+zsiR0+2JTdT1zHsvy
         Y1/PIzySvwBBXHXkDROn1BMRhSgNRToNVDjnJupGvGVqM4RSKZZT+nvs38vCDlgb/ir6
         EyLMXsrD7DQEfrY8EdS1y5fIdN4CPpZvOm6EEvunHgS2hIuSlmPmxyx9+1552Yl2TnB9
         2AMtuX5l8vkak/3i5qFRldXQ46pq7QtvmeIFyErWmZ2IbqIpsC2X2fBdkyyTFKWxQdRA
         VjRg==
X-Forwarded-Encrypted: i=1; AL+hErHNmDxHpZuKtIo4ar6Bb+F7tFSJ5fxuR6TwPJgweaE+FmuLJkN6bNuFWky3z+bYvhd6qK8AYR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JnwhVtC2GT/wBm64Emu5kgamEjh+F8A+REKmegRNlZb8vc/ev
	TAxufRMyz/lfxd6ymnYmuRDVqDv0A4u3nl4yWMEeKTTkdyv3p5mlhAnwT5aPSvjEuhp+bLLbtrX
	56DB1Vg==
X-Received: from plha17.prod.google.com ([2002:a17:902:ecd1:b0:2f0:6f2e:4b9f])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c
 with SMTP id d9443c01a7336-2f0a7c27e29mr141076525ad.35.1795742808033; Thu, 26
 Nov 2026 17:26:48 -0800 (PST)
Date: Fri, 27 Nov 2026 01:26:47 +0000
In-Reply-To: <20261125190113.GA421469@shredder>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123133000.1.n0ps1edzz@gmail.com> <179550368695.3135.12579094604954175182@kernel.org>
 <20261125190113.GA421469@shredder>
Message-ID: <awjbaKiRpvUyHA3z@google.com>
Subject: Re: [PATCH net] ipv6: route: fix use-after-free in ip6_confirm_neigh()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev-bot+sashiko@kernel.org, n0ps1edzz@gmail.com, netdev@vger.kernel.org, 
	dsahern@kernel.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, hangbin.liu@linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 25 Nov 2026 21:01:13 +0200, Ido Schimmel wrote:
> On Tue, Nov 24, 2026 at 07:01:26AM +0000, netdev-bot+sashiko@kernel.org wrote:
> > ipv6: route: fix use-after-free in ip6_confirm_neigh()
> > 
> > This commit takes rcu_read_lock() in ip6_confirm_neigh(), loads the device
> > with dst_dev_rcu() and holds the section through the dev->flags test and
> > __ipv6_confirm_neigh(). It is meant to stop a use-after-free when route
> > teardown swaps dst->dev to blackhole_netdev and the old net_device is freed.
> > That race is reached from rawv6_sendmsg() and udpv6_sendmsg() with
> > MSG_CONFIRM|MSG_PROBE.
> > 
> > > diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> > > index 1b2dcc066e198..6bdd4423ce784 100644
> > > --- a/net/ipv6/route.c
> > > +++ b/net/ipv6/route.c
> > > @@ -257,16 +257,21 @@ static struct neighbour *ip6_dst_neigh_lookup(const struct dst_entry *dst,
> > >  static void ip6_confirm_neigh(const struct dst_entry *dst, const void *daddr)
> > >  {
> > >  	const struct rt6_info *rt = dst_rt6_info(dst);
> > > -	struct net_device *dev = dst_dev(dst);
> > > +	struct net_device *dev;
> > > +
> > > +	rcu_read_lock();
> > > +	dev = dst_dev_rcu(dst);
> > 
> > [Severity: High]
> > Does this RCU section cover the uncached-route flush that the commit
> > message names as one of the two teardown paths?
> > 
> > Since commit f12d2907992db7 ("ipv6: Batch rt6_uncached_list_flush_dev() in
> > netdev_run_todo()."), rt6_uncached_list_flush_dev(dev) returns early when
> > dev->dismantle is set. During unregister, the pointer swap now happens
> > from netdev_run_todo(), after that function's only rcu_barrier():
> > 
> > net/core/dev.c:netdev_run_todo() {
> >     ...
> > 	if (!list_empty(&list))
> > 		rcu_barrier();
> >     ...
> > 	if (!list_empty(&list)) {
> > 		rt_flush_dev(NULL);
> > 		rt6_uncached_list_flush_dev(NULL);
> > 	}
> > 
> > 	cnt = 0;
> > 	while (!list_empty(&list)) {
> > 		...
> > 		dev = netdev_wait_allrefs_any(&list);
> > 		...
> > 		kobject_put(&dev->dev.kobj);
> >     ...
> > }
> > 
> > rt6_uncached_list_flush_dev(NULL) does:
> > 
> > 	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> > 	netdev_ref_replace(rt_dev, blackhole_netdev,
> > 			   &rt->dst.dev_tracker,
> > 			   GFP_ATOMIC);
> > 
> > netdev_wait_allrefs_any() returns as soon as netdev_refcnt_read(dev) == 1.
> > kobject_put() then reaches netdev_release(), which frees the device right
> > away:
> > 
> > 	/* no need to wait for rcu grace period:
> > 	 * device is dead and about to be freed.
> > 	 */
> > 	kfree(rcu_access_pointer(dev->ifalias));
> > 	kvfree(dev);
> > 
> > free_netdev() only reaches synchronize_net() through netdev_napi_exit()
> > when the device has NAPI instances. Dummy devices have none.
> > 
> > As far as I can tell, nothing between the swap and the free waits for
> > current RCU readers. Can a task that loaded the old device here with
> > dst_dev_rcu() just before the swap still read dev->flags, or dev_net(dev)
> > in __ipv6_neigh_lookup_noref(), after the device has been freed?
> > 
> > User space can get such a dst. rawv6_sendmsg() sets FLOWI_FLAG_KNOWN_NH for
> > hdrincl sockets, and ip6_pol_route() then puts the route on
> > rt6_uncached_list. MSG_CONFIRM|MSG_PROBE then reaches dst_confirm_neigh().
> > This is the same rawv6_sendmsg() path as in the KASAN report.
> > 
> > The dst_dev_put() path looks covered, because the NETDEV_UNREGISTER
> > notifiers are followed by synchronize_net() in
> > unregister_netdevice_many_notify().
> > 
> > Would netdev_run_todo() need a synchronize_net() or synchronize_rcu() after
> > the rt_flush_dev(NULL)/rt6_uncached_list_flush_dev(NULL) batch, before the
> > device can be freed, to close the uncached-flush case?
> 
> I believe the bot is correct, but I don't think the problem is specific
> to uncached routes. Regular per-CPU routes are released from an RCU
> callback (e.g., free_fib_info_rcu()) and these callbacks can start
> running after the last synchronize_net() in
> unregister_netdevice_many_notify() together with an RCU reader.
> 
> The callback then drops the last reference on the dst->dev used by the
> RCU reader and nothing in netdev_run_todo() waits for the reader before
> freeing the net device.
> 
> We probably need:
> 
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 6140fd9d11cd..3fbd375c12dc 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -12037,6 +12037,7 @@ void netdev_run_todo(void)
>  	if (!list_empty(&list)) {
>  		rt_flush_dev(NULL);
>  		rt6_uncached_list_flush_dev(NULL);
> +		synchronize_net();
>  	}
>  
>  	cnt = 0;
> 
> With:
> 
> Fixes: 4a6ce2b6f2ec ("net: introduce a new function dst_dev_put()")
> 
> Kuniyuki, WDYT?

Thanks for heads-up !

I agree that we need synchronize_net() there.



> 
> > 
> > >  
> > >  	daddr = choose_neigh_daddr(rt6_nexthop(rt, &in6addr_any), NULL, daddr);
> > >  	if (!daddr)
> > > -		return;
> > > +		goto out;
> > >  	if (dev->flags & (IFF_NOARP | IFF_LOOPBACK))
> > > -		return;
> > > +		goto out;
> > >  	if (ipv6_addr_is_multicast((const struct in6_addr *)daddr))
> > > -		return;
> > > +		goto out;
> > >  	__ipv6_confirm_neigh(dev, daddr);
> > > +out:
> > > +	rcu_read_unlock();
> > >  }
> > 
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does the IPv4 callback
> > ipv4_confirm_neigh() in net/ipv4/route.c have the same use-after-free?
> 
> Fixed by:
> 
> https://lore.kernel.org/netdev/20261123133000.2.n0ps1edzz@gmail.com/
> 
> Both should be in the same patchset.

+1


> 
> [...]
> 
> > [Severity: High]
> > This is a pre-existing issue, but ip6_dst_neigh_lookup(), just above this
> > hunk, still uses the unpinned load that this patch removes from
> > ip6_confirm_neigh():
> > 
> > net/ipv6/route.c:ip6_dst_neigh_lookup() {
> > 	const struct rt6_info *rt = dst_rt6_info(dst);
> > 
> > 	return __ip6_dst_neigh_lookup(rt6_nexthop(rt, &in6addr_any),
> > 				      dst_dev(dst), skb, daddr);
> > }
> > 
> > __ip6_dst_neigh_lookup() calls __ipv6_neigh_lookup(dev, daddr), which only
> > takes rcu_read_lock() after the pointer was loaded. On a cache miss it
> > calls ipv6_neigh_create(dev, daddr), which leads to ___neigh_create():
> > 
> > net/core/neighbour.c:___neigh_create() {
> >     ...
> > 	n->dev = dev;
> > 	netdev_hold(dev, &n->dev_tracker, GFP_ATOMIC);
> >     ...
> > }
> > 
> > After that it calls dev->netdev_ops->ndo_neigh_construct.
> > 
> > Suppose dst_dev_put() or the uncached-route flush moves the dst to
> > blackhole_netdev, and the old device is freed between the load and these
> > uses. Could netdev_hold() then increment a refcount in a freed net_device?
> > 
> > Some callers get here holding only a dst reference. For example,
> > irdma_addr_resolve_neigh_ipv6() in drivers/infiniband/hw/irdma/cm.c calls
> > dst_neigh_lookup() after ip6_route_output() without rcu_read_lock().
> > 
> > The IPv4 counterpart ipv4_dst_neigh_lookup() already holds rcu_read_lock()
> > around dst_dev_rcu() and the lookup/create.
> 
> Please add a patch for this.
> 
> Let's wait for Kuniyuki before posting v2. Ideally v2 should include
> four patches:
> 
> * The missing synchronize_net() in netdev_run_todo().
> * The IPv4 patch.
> * The two IPv6 patches.

Sounds good to me too.

Thanks !

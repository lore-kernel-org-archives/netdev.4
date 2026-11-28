Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848159;
	b=rJX2vYoX0cHg6wB9iPpKP4aRwT5VNWIRUxmcku8MQgBH3XHrzT4akMe2AN2Argr/+ctc
	 mBhBWnJ1xbVTrMEuxk0j+Deo1nvt2qjWKFT1sgakMPcapePWrRF4E2S+InHoYDhe/TGX9
	 YS3Mjidvr1tW4I/5P4h04WkbiH1zwtgtdFs7TLCjgB6s9pDKuRcpdcEtQ91sOr8+EPOCu
	 8urtFMbJeRLHSj00WXgV5Ar0pcNqrOctgPMD6viItu9Q4SZOW5GHuq9IYMtFiWp+PwOCb
	 cbC+19hVs/vYb8VmB84+xhPplG19Ij0ePOqzj0j7eD4yFnkNr5h5ONPJWINIRBypA1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848159;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=l49AbvBiUeyoIZ4W5YDZD4tOl8C4Jc4U6WVcPXEZuec=;
	b=lbVkuG1D8OWmsVg7DrgvBn1QfHmLIGqjeVoxMW1kMUZ8pJtGY/+kSFWn2X74KhFXimXg
	 jmQ3uvjigBYNxbp50xhUa5aBMIpwWL4uoLoUH8NQ6hAdzD+JG5JaRE0TDUVTHg/ErnlRQ
	 f3XiIXgUgb54nfjU1iejLegvAmFzKZ3U2T43oJGx5IlD9VluhNu0sHbjE1WkC2VB6OWRB
	 tF4r6U3ciwlqU3dodarw558ax9tL0cPcdVFHKly1h8I21BnuR4kxObwHChZSmwEaIbHHi
	 /zxn8OmbSikVd9Ob6iN/CJ+/dJrXpjATB8hQmIKUgWXDo5sPCgNpEr3bpBaxDvRmFJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYgubF9L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA9606A32A
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYgubF9L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0721F000C1;
	Sat, 28 Nov 2026 06:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795848159;
	bh=l49AbvBiUeyoIZ4W5YDZD4tOl8C4Jc4U6WVcPXEZuec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iYgubF9L3DGaay4VLZN/DTmAcNGWsUQzo+hcplc/LaLfntN83IH9JbIPNuRJ2Cv6c
	 L+yB/lbWfGFCbILU2W3S4xAGD4r3HLXuYqW1web3I9k3njtzOE6B/tRj/jNQQ/Rrj8
	 R4wmZNLPin5xVYJnCwHIdELvC4X8G4Ir3SvvcwPAjZ9E80R3WHwjJ9YQRJNI9icKxf
	 hJThUU1ziIzPotzG/h+eVCW+1hT/ula3AVI0/1ZLbSy7LJmve7NWbZ/w7AzZPpxq4W
	 pZhPRr4xv2MFUCwU2ynSoBqKWjsspQq9XlPgpbey6RiCzAepzd1SJG3//nnHpaUIna
	 IA3wYaO3NwwAg==
Subject: Re: [PATCH net v2 2/4] ipv4: route: fix use-after-free in
 ipv4_confirm_neigh()
From: netdev-bot+sashiko@kernel.org
To: n0ps1edzz@gmail.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, willemb@google.com, kuniyu@google.com,
 hangbin.liu@linux.dev
Date: Sat, 28 Nov 2026 06:42:38 +0000
Message-ID: <179584815806.3135.2658352587378278244@kernel.org>
In-Reply-To: <1a0a6b41df2422c4cea67f1571772b9d22ab200d.1795754281.git.n0ps1edzz@gmail.com>
References: <1a0a6b41df2422c4cea67f1571772b9d22ab200d.1795754281.git.n0ps1edzz@gmail.com>
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

- [High] The fix makes ipv4_confirm_neigh() (net/ipv4/route.c) load the
  device with dst_dev_rcu() inside rcu_read_lock().

--

ipv4: route: fix use-after-free in ipv4_confirm_neigh()

This patch makes ipv4_confirm_neigh() hold rcu_read_lock() and load the
egress device with dst_dev_rcu() instead of dst_dev(). It relies on the
grace period in netdev_run_todo() to keep the old net_device alive after
a concurrent dst_dev_put() swaps dst->dev to blackhole_netdev.

Link: https://lore.kernel.org/netdev/20261123133000.2.n0ps1edzz@gmail.com/

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index cd69242afab07..5ceea01f27b4e 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -441,19 +441,25 @@ static struct neighbour *ipv4_dst_neigh_lookup(const struct dst_entry *dst,
>  static void ipv4_confirm_neigh(const struct dst_entry *dst, const void *daddr)
>  {
>  	const struct rtable *rt = container_of(dst, struct rtable, dst);
> -	struct net_device *dev = dst_dev(dst);
> +	struct net_device *dev;
>  	const __be32 *pkey = daddr;
>  
> +	rcu_read_lock();
> +	dev = dst_dev_rcu(dst);

[Severity: High]
The commit message says:

  The grace period added to netdev_run_todo() ensures that the
  device remains alive until the read-side critical section finishes.

Does that hold for dst->dev swaps done from RCU callbacks?

The synchronize_net() in netdev_run_todo() only covers dst_dev_put()
calls that finish before it starts. The commit in the Fixes tag also added
dst_dev_put() to rt_fibinfo_free_cpus() in net/ipv4/fib_semantics.c, which
works on per-CPU cached output routes. Those routes are not on
rt_uncached_list, so rt_flush_dev() never touches them.

For routes that use nexthop objects (ip nexthop add id N dev X; ip route
add ... nhid N), it looks like the teardown can be pushed past that grace
period:

  unregister (RTNL held)
    nexthop_flush_dev()->remove_nexthop()->nexthop_put()
      /* not the last ref, fi->nh holds one from fib_create_info() */
    fib_flush()->fib_release_info()->fib_info_put()->free_fib_info()
      call_rcu_hurry(free_fib_info_rcu)

  netdev_run_todo()
    rcu_barrier()
      free_fib_info_rcu()
        nexthop_put(fi->nh)
          call_rcu_hurry(&nh->rcu, nexthop_free_rcu)  /* chained */
    rt_flush_dev(NULL)
    rt6_uncached_list_flush_dev(NULL)
    synchronize_net()

  later, from the chained callback:
    nexthop_free_rcu()->nexthop_free_single()->fib_nh_release()
      ->fib_nh_common_release()->rt_fibinfo_free_cpus()
        ->dst_dev_put()
            rcu_assign_pointer(dst->dev_rcu, blackhole_netdev);
            netdev_ref_replace(dev, blackhole_netdev, ...);

rcu_barrier() does not wait for callbacks queued by the callbacks it
waited for. That means nexthop_free_rcu() can run during or after the new
synchronize_net().

After that, netdev_wait_allrefs_any() hands the device back as soon as
netdev_refcnt_read(dev) == 1. This can happen on its first check or right
after an rcu_barrier(), and neither of those implies a grace period after
the dst_dev_put() above. netdev_run_todo() then frees the device.

Here is the sequence I have in mind. A udp_sendmsg() caller using
MSG_CONFIRM|MSG_PROBE holds that per-CPU route. It enters rcu_read_lock()
here after the synchronize_net() has started. It loads the old device
through dst_dev_rcu() just before the swap. It is still inside the
read-side section when the device is freed.

Wouldn't __ipv4_confirm_neigh()->__ipv4_neigh_lookup_noref() then read
dev->flags from the freed net_device?

The same window seems to exist when a switchdev or offload driver (mlxsw,
prestera, rocker, mlx5 lag, netdevsim) holds a fib_info reference with
fib_info_hold() and drops it from a work item after netdev_run_todo() has
gone past its rcu_barrier() and synchronize_net().

Is another grace period needed between the last dst_dev_put() reference
drop and the free? One option would be a synchronize_net() after
netdev_wait_allrefs_any() sees the refcount reach 1.

> +
>  	if (rt->rt_gw_family == AF_INET) {
>  		pkey = (const __be32 *)&rt->rt_gw4;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795754281.git.n0ps1edzz%40gmail.com

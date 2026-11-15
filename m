Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794766927;
	b=mRDA/5l94FOOm7LhyffF7SQ3aCp6WAmxBXfVUngA5hb+eFwum/GTtfuxbv32W3BGa4uB
	 3IqMS2W+4Tz+Q6lyzAo7boR9TMJAe8rdvm1NDOpo3xrxdR5kQLXBjZnNZU1tb0hZ5lYj8
	 cN9FDDVniBzdsupWAoAdL+Z33axp2Bb7gtQTg0ATgJ2xYm22K/KCz62Z1G5hID3sCR8D4
	 cu8UKzOOoqkqDAQMrRA/5yAZpL9REMzAoMmlTtX2euXonWm15oR5X2pAFfE1slqIIw15n
	 z6Tj1+gkT67E0Z981yVAY3XPZmyElQ+ILQVHYdVE0b7E6denTTy/OuUS5ym3oGccAxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766927;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SRqp5mooACPAzd2gHIUg+QDQfae5E/MU1m2NjYPrGBU=;
	b=fOulJduz0olhwkm/Ca8ESYfIQO8woZtymJ9rtaiSeOOMD8SAxOCW2jbpGCBGeIJ6qsI2
	 7zlXcn0n1q8N8sLZGBnJPSzmzDmzG9pWe9vmUSLuPkU0A6tRAS6dQCa84HZjyA9vM0mQz
	 X5tP/UNz8q8vCCKHaGvtLkkEE2E7FYZ7V3znf/PlwaImGaUoKEuApRJAezb9jEXPrOV6D
	 uXaKeNPEVqLq3rb6LujZn3oHA7YSV8KJczPeapYjLORceJUW5AAqNM+swvtjvbQu1BWAq
	 Jl3chgIJ0YO7v4NqdP46Vt6Tp62ob+414jYMZ+BSLRw3yeWsuBYUfft9Nj35RO/Dsdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CaEAhSB8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6237E606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CaEAhSB8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820B61F000C4;
	Sun, 15 Nov 2026 18:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794766927;
	bh=SRqp5mooACPAzd2gHIUg+QDQfae5E/MU1m2NjYPrGBU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CaEAhSB8XRa5vE4XbV/yT6HYSLDpdxQd6SdFaGmPbKgyFmiKCEpmnqfaRxnKIbLQ/
	 ZUARpZCbj2CIjzDP9baOXA4zxN9huxQQ9FL4xCuTe1UonO37ngOxRJPnMn+qicm2mC
	 54oRD5wWijhOFUZgtyl+55eSoHkZTvTe5WDXrVZgcZBWfydQbnMzmMInFzMV9zRCoy
	 slflHGV9rrT/TSp7UTdXfrbpx0CM7AJlGyejplr9/18FAp4ZkJV7aJJfULdD7YE+Rw
	 bi83zmYWI8IeuKvEZfxTS9PW8FAUujT5t2cU4JP0EV4UdvLWcaS6IFsyi3GJ8nrY5p
	 PC3tboA7TNgBQ==
Subject: Re: [PATCH net v3] vxlan: reset the remote's dst cache when snooping
 moves a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com,
 mschiffer@universe-factory.net, nicolas.dichtel@6wind.com
Date: Sun, 15 Nov 2026 18:22:06 +0000
Message-ID: <179476692608.3136.1555292091406016703@kernel.org>
In-Reply-To: <20261111180001.2475-1-ilskdw@gmail.com>
References: <20261111180001.2475-1-ilskdw@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In vxlan_snoop() (drivers/net/vxlan/vxlan_core.c), the patch
  writes the snoop-derived `ifindex` into rdst->remote_ifindex (line…
- [Medium] The stale-dst_cache bug the patch claims to fix can still
  happen through a race with a concurrent transmitter.
- [Medium] vxlan_snoop() now clears rdst->offloaded
  (drivers/net/vxlan/vxlan_core.c line 1488) right before…
- [Low] vxlan_snoop() (drivers/net/vxlan/vxlan_core.c, lines 1485-1488)
  now writes rdst->remote_ifindex and rdst->offloaded from RX softirq…

--

vxlan: reset the remote's dst cache when snooping moves a MAC

When vxlan_snoop() migrates a learned FDB entry to a new remote, this patch
resets the remote's dst_cache, sets remote_ifindex to the snooped ifindex
and clears the offloaded flag, the same way vxlan_fdb_replace() does. The
goal is to stop traffic being routed through a stale cached dst after a MAC
move, and to stop repeated migrations for IPv6 link-local remotes.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b374721..6bc54642e7f45 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -1482,7 +1482,10 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
>  				    "%pM migrated from %pIS to %pIS\n",
>  				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
>  
> +		dst_cache_reset(&rdst->dst_cache);
>  		rdst->remote_ip = *src_ip;

[Severity: Medium]
Can a concurrent transmitter still put the old remote's dst back into the
cache after this reset?

vxlan_xmit_one() reads the remote without any synchronization:

vxlan_xmit_one() {
    ...
	ifindex = rdst->remote_ifindex;

	if (addr_family == AF_INET) {
		key.u.ipv4.src = cfg->saddr.sin.sin_addr.s_addr;
		key.u.ipv4.dst = rdst->remote_ip.sin.sin_addr.s_addr;
    ...
	dst_cache = &rdst->dst_cache;
    ...
}

On a miss, dst_cache_per_cpu_get() sets refresh_ts when the lookup
happens, not when the new dst is stored:

fail:
	idst->refresh_ts = jiffies;
	return NULL;

The entry then counts as valid as long as refresh_ts is after reset_ts.
So this sequence seems possible:

CPU1 (TX)                          CPU0 (vxlan_snoop)
reads old remote_ip/ifindex
                                   dst_cache_reset()   /* reset_ts = J1 */
                                   rdst->remote_ip = *src_ip;
                                   rdst->remote_ifindex = ifindex;
<jiffies ticks>
udp_tunnel_dst_lookup()
  dst_cache_get_ip4() misses, refresh_ts = J2 > J1
  routes to the old remote
  dst_cache_set_ip4() stores the old remote's dst

After this, packets sent on CPU1 carry the new remote_ip but use the old
remote's dst. That is the same blackhole the changelog describes, and it
lasts until the dst goes obsolete or the cache is flushed.

The plain stores also let the TX side read a remote_ip from one remote and
a remote_ifindex from the other.

vxlan_fdb_replace() has the same window. Does this patch fully close the
case it targets?

> +		rdst->remote_ifindex = ifindex;

[Severity: Medium]
Does this clear an egress interface that user space configured for a
remote that is not link-local?

In vxlan_snoop(), ifindex is non-zero only for IPv6 link-local sources:

	if (src_ip->sa.sa_family == AF_INET6 &&
	    (ipv6_addr_type(&src_ip->sin6.sin6_addr) & IPV6_ADDR_LINKLOCAL))
		ifindex = src_ifindex;

However, vxlan_fdb_parse() accepts NDA_IFINDEX for any remote address
family, and vxlan_fdb_add() accepts dynamic (NUD_REACHABLE) entries.

Take a dynamic entry added with "via <dev>" for an IPv4 or global IPv6
remote A, on a device with learning enabled. The first packet from A then
fails the early return:

	if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
		   rdst->remote_ifindex == ifindex))
		return SKB_NOT_DROPPED_YET;

It fails because remote_ifindex holds the user's value while ifindex is 0.
The entry is not static, so the code logs "migrated from A to A" and this
new line sets remote_ifindex to 0.

>From then on, vxlan_xmit_one() sees ifindex == 0 and falls back to the
socket's bound device for the route lookup:

	if (!ifindex)
		ifindex = sock4->sk->sk_bound_dev_if;

RTM_NEWNEIGH also stops reporting NDA_IFINDEX for this entry.

Before this patch, this case sent a notification on every packet but kept
the configured interface. Could remote_ifindex be compared and overwritten
only when the old or the new remote is IPv6 link-local?

> +		rdst->offloaded = false;

[Severity: Medium]
Can clearing offloaded here leave a stale entry in the mlxsw hardware
FDB?

At this point the ASIC may still have a tunnel FDB entry for this MAC that
points at the old remote. vxlan_fdb_switchdev_notifier_info() copies the
flag into every switchdev notification:

	fdb_info->offloaded = rd->offloaded;

mlxsw_sp_switchdev_vxlan_fdb_del() skips the hardware removal when that
copy is false:

	vxlan_fdb_info = &switchdev_work->vxlan_fdb_info;
	if (!vxlan_fdb_info->offloaded)
		return;

The new remote is programmed later, from deferred work in
mlxsw_sp_switchdev_vxlan_fdb_add(). That function can return without
setting offloaded back to true, either when br_fdb_find_port() does not
return the vxlan device or when mlxsw_sp_port_fdb_tunnel_uc_op() fails.

There is a second case. If the vxlan FDB entry is deleted after the snoop
but before the ADD work runs, the DEL captures offloaded == false. The ADD
then programs the hardware, and vxlan_fdb_offloaded_set() finds no entry
to mark.

In both cases a later DEL skips the hardware removal. The ASIC then keeps a
static MAC to VTEP entry that software no longer tracks, until FID/NVE
teardown. Before this patch the snoop path left offloaded set, so a later
DEL removed the hardware entry by MAC/FID.

vxlan_fdb_replace() and new entry creation follow the same pattern. This
patch adds a trigger driven by received packets, and mlxsw supports
VXLAN_F_LEARN for an IPv4 underlay.

>  		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);

[Severity: Low]
A related question about locking: this branch runs in the RX softirq
without vxlan->hash_lock. The other code that writes remote_ifindex and
offloaded holds that lock: vxlan_fdb_offloaded_set(), vxlan_fdb_replace()
through vxlan_fdb_update_existing(), and vxlan_fdb_clear_offload().

Can this race with vxlan_fdb_offloaded_set()? Under hash_lock it looks up
the rdst using the old (remote_ip, port, vni, remote_ifindex) tuple:

	rdst = vxlan_fdb_find_rdst(f, &fdb_info->remote_ip,
				   fdb_info->remote_port,
				   fdb_info->remote_vni,
				   fdb_info->remote_ifindex);
	if (!rdst)
		goto out;

	rdst->offloaded = fdb_info->offloaded;

If the snoop rewrites the tuple and clears offloaded between that lookup
and the store, the clear is lost. The new remote then shows as offloaded.

A concurrent "bridge fdb replace" is similar. If vxlan_fdb_replace() runs
after the snoop has passed the f->state check, the rdst can end up with
remote_ip from one writer and remote_ifindex from the other. If the
replace made the entry static, the snoop path never touches it again and
the mixed state stays.

The unlocked remote_ip store was there before this patch. This patch adds
two more fields to it, while the vxlan_fdb_replace() code it copies runs
under hash_lock.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111180001.2475-1-ilskdw%40gmail.com

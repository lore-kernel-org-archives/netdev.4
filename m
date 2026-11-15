Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794705525;
	b=en9M2yanM47yyWA6tvSK29MrX53AlXgjkzXIcFVM6ihpLDv0/F29cdb8MdFEZAx4APRp
	 1FvxPdcLi6uSrG3zt1Jtu++/cfaNxC/VAloWAHyUUBSqLVP1kXPtitif3JO/jYD3OZ495
	 Gl3BS67GyUlOw8ZydwqwvasKLsFSa0KLhkASFQXNKLBt0ZnkqIe/I7UlYyWR56hsaaY0K
	 2Vdw3PI/OHJJ0NdMXxNmRKVTLaaLlNahUcxVVqPdkZBXkz9RqAzFhtK0Wu391FP2ZOPrw
	 pHZDak97GrGkgO4ifxfjgexTxsPU4tOTbJXYFjeBIRcL0VWxo7E9fz5FBUnHEFuANpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794705525;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4qd6hX1WLftDV2sN2gyXYqHiJIx56OqOiY6Zn5Q3OFQ=;
	b=i5Kpu7HWGDxdqYuAB6d3/exJ2SliKsfBaTRYxuokTaVv3j7h5lmid3lX0/WUneHoiaIN
	 Q0rnMf4WwdO/cpOhUBzD7PR4All4QAd0suIrxem7iLRXuJI8WHRnf++KbsV/xptzJoNsy
	 nruqUjHGPi9h4yh1qnb3UwBErlpCnOiFWYy9Y8JK7tfoM53ugLJrhg6lhUqpTt2vBJYYG
	 9vlGK6RwSlqrZYTTWE8Jg7yI/r5+OxJ7QRrUX+GnC+Ogq2UR+t+5UNVzJZTzXkVAv/uQS
	 BGxJVzLBYJJBylfXQkwJStbimVc9FQ2CM6sq3pP1gw5scXFHqia/ua5IaYUcuVPBISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9E4V40Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD43606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 01:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A9E4V40Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807331F000C4;
	Sun, 15 Nov 2026 01:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794705525;
	bh=4qd6hX1WLftDV2sN2gyXYqHiJIx56OqOiY6Zn5Q3OFQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A9E4V40YP3N0SXyJwn1LfpIQkGtQEd4HOosPESNfzjIFtSDXH6oJx95ecGDtq+pWo
	 GMoe2St9hgfFSqmopP2nqRp+0W2atWrlO1A6T1eFsO/BgdNfh8/FaAo6P98vk4P14J
	 k5EaZEySl/XXTAU9q0JP2ltA9MCUuHfnL9i7rxoeyUHpTpMWZh4efkljkT7P6B8qz1
	 UMTuianNqBv43pgdidUpxldUAK1TU5to2gCwdKM7p8XGAGueC8MhYnh9ujKU6tZI4E
	 Mz4BjZeAR3hA0lcgKeImp6t7/d68V145m+Td3GR3F0E8po+kYA6n/uysbXfQQbmxWE
	 mFNcb8hcRxPoA==
Subject: Re: [PATCH net v2] vxlan: reset the remote's dst cache when snooping
 moves a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com,
 mschiffer@universe-factory.net
Date: Sun, 15 Nov 2026 01:18:44 +0000
Message-ID: <179470552404.2199510.13614872178874456081@kernel.org>
In-Reply-To: <20261110153020.9635-1-ilskdw@gmail.com>
References: <20261110153020.9635-1-ilskdw@gmail.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In vxlan_snoop() (drivers/net/vxlan/vxlan_core.c), the
  migration branch now does `rdst->remote_ifindex = ifindex`.
- [Medium] The stale-dst_cache problem this patch claims to fix can still
  happen through a race.
- [Low] The patch adds lockless plain writes of rdst->remote_ifindex and
  of the rdst->offloaded bitfield in the vxlan_snoop() migration branch…

--

vxlan: reset the remote's dst cache when snooping moves a MAC

When a learned MAC moves to a new remote, the vxlan_snoop() migration
branch now resets the remote's dst_cache, updates remote_ifindex and
clears offloaded, the same way vxlan_fdb_replace() does. This fixes stale
cached routes after a MAC move. It also stops the repeated RTM_NEWNEIGH
notifications when a MAC moves to or from an IPv6 link-local remote.

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
Can a concurrent transmit still put the old remote's route back into the
cache after this reset?

dst_cache_reset() only stores jiffies in reset_ts. The remote_ip and
remote_ifindex stores that follow are plain stores, with no lock against
the lockless xmit path. vxlan_xmit_one() reads the key from rdst before it
looks up the cache:

drivers/net/vxlan/vxlan_core.c:vxlan_xmit_one() {
    ...
	ifindex = rdst->remote_ifindex;

	if (addr_family == AF_INET) {
		key.u.ipv4.src = cfg->saddr.sin.sin_addr.s_addr;
		key.u.ipv4.dst = rdst->remote_ip.sin.sin_addr.s_addr;
    ...
}

On a miss, dst_cache_per_cpu_get() stamps the per-cpu entry with the
current jiffies:

net/core/dst_cache.c:dst_cache_per_cpu_get() {
    ...
	if (unlikely(!time_after(idst->refresh_ts,
				 READ_ONCE(dst_cache->reset_ts)) ||
    ...
fail:
	idst->refresh_ts = jiffies;
	return NULL;
}

dst_cache_set_ip4() does not touch refresh_ts. Consider this interleaving:

CPU1 (xmit to the MAC)            CPU2 (vxlan_snoop)
reads old rdst->remote_ip
                                  dst_cache_reset() (reset_ts = J)
                                  rdst->remote_ip = *src_ip
dst_cache_get() in jiffy J + 1
  miss, refresh_ts = J + 1
route lookup with old key
dst_cache_set_ip4() old route

The cached entry now looks newer than reset_ts, so later transmits to the
MAC on CPU1 would use the old remote's next hop. Packets from the new
remote take the early return, so the cache is not reset again.

Would this bring back the blackhole described in the changelog, until
something like "ip route flush cache" runs? The window is narrow, but in
the live migration case there is usually traffic to the MAC while it
moves.

Moving the reset after the field stores does not appear to close the
window. The reader still builds its key before it checks reset_ts, and
freshness is only tracked in jiffies.

vxlan_fdb_replace() uses the same order. The hash_lock it holds does not
exclude xmit readers either.

> +		rdst->remote_ifindex = ifindex;

[Severity: Medium]
Does this overwrite a user-configured egress interface with 0?

In vxlan_snoop(), ifindex is only set from src_ifindex for IPv6 link-local
sources. For IPv4 and global IPv6 sources it stays 0.

A user can create a dynamic entry with NDA_IFINDEX, for example:

  bridge fdb add <mac> dev vxlan0 dst 10.0.0.2 via eth1 dynamic

vxlan_fdb_parse() stores that in remote_ifindex. On a learning device,
the first packet from 10.0.0.2 with that inner source MAC does not take
the early return, because remote_ifindex != 0:

	if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
		   rdst->remote_ifindex == ifindex))
		return SKB_NOT_DROPPED_YET;

The static guard only skips NUD_PERMANENT and NUD_NOARP entries, so the
packet enters the migration branch. It logs "migrated from A to A" even
though the IP has not changed. With this patch, the branch also sets
remote_ifindex to 0, resets the dst cache and clears offloaded.

After that, vxlan_xmit_one() passes ifindex 0 to udp_tunnel_dst_lookup()
and falls back to sk_bound_dev_if, so the configured underlay interface
is no longer used.

vxlan_fdb_info() also stops reporting NDA_IFINDEX for the entry:

	if (rdst->remote_ifindex &&
	    nla_put_u32(skb, NDA_IFINDEX, rdst->remote_ifindex))

Before this patch the configured ifindex was kept, although every packet
produced a notification (the behaviour since 87613de95041).

Is it intended that the snoop path treats ifindex 0 as an authoritative
new value here? 0 only means the ifindex is unknown, so this path cannot
tell a user-configured ifindex from a stale learned one.

> +		rdst->offloaded = false;
>  		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);

[Severity: Low]
Should this branch take vxlan->hash_lock, as the else branch in
vxlan_snoop() already does?

The new remote_ifindex and offloaded writes are lockless and run in
softirq under RCU only. The other writers of these fields hold hash_lock:
vxlan_fdb_offloaded_set(), vxlan_fdb_replace() and
vxlan_fdb_clear_offload().

For example, vxlan_fdb_offloaded_set() is reached from mlxsw's
SWITCHDEV_VXLAN_FDB_OFFLOADED work, and mlxsw supports VXLAN_F_LEARN. It
could race like this:

CPU0 (vxlan_fdb_offloaded_set)       CPU1 (vxlan_snoop)
spin_lock_bh(&vxlan->hash_lock)
vxlan_fdb_find_rdst() matches on
  old remote_ip/remote_ifindex
                                     rdst->remote_ip = *src_ip
                                     rdst->remote_ifindex = ifindex
                                     rdst->offloaded = false
rdst->offloaded = fdb_info->offloaded

The new remote would then be reported with NTF_OFFLOADED even though the
hardware has not been programmed for it.

Two RX CPUs snooping the same MAC from different VTEPs could also race in
this branch. The result could combine remote_ip from one packet with
remote_ifindex from the other. vxlan_fdb_switchdev_notifier_info() could
then snapshot that torn tuple.

The remote_ip store predates this patch. The new remote_ifindex and
offloaded writes also have no WRITE_ONCE()/READ_ONCE() pairing, so KCSAN
is likely to report them.

Taking hash_lock here and re-checking the entry once it is held would
serialize these writes the same way vxlan_fdb_replace() is serialized.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110153020.9635-1-ilskdw%40gmail.com

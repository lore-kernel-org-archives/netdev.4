Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437110;
	b=hdscmr/eXvxnD00NQJklCG6L1E+P1PlUnzgxH3cHmGgd4dc/Yyt/lT3ySd04+lEkR37i
	 ehuzQxHhMTo7rBPbUjJDyHHZ1SzFI+rqEjTWHSSqxwCZluU7emRfYVLRxj0lRFN+b26DI
	 ELKX6j1aiT9fHdeQ00Od9i9DjWhON02newXveJ9etMpoWKfBOjmwgQ6O1EeCw8Rc+6w6w
	 rpVLikXQOTtCeqBQYw6O2+oPKE4ZLK4loXHitE5arvh+C8fwGZrVQ5SiVJNKMBBl1pcX7
	 4WEljoiOpxDt904XJpIiXBu9VnDk+bKq3W8mwWO4hvHoMNRsTESZnWk/MOpqMJoqHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437110;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dnURE+gc5hnvwX/1PcDxNTIpk6Q2+hCZDq2FOE6jgzc=;
	b=XDVfuPOwkHpMeBI/QoxolDXg/4k0l8xEku4XUbn46t9XmU0MA5i42Sd+2ovFpn+PBWeG
	 auiOsWrlFkeCYBub+5UW1I+Epsc7UQLTHUUJH92r0KSi+dHiV8/MMJSN6ZeO6MAL/wggB
	 UdmVqbAHc96jcvKTVQQY2q9Q+aLO1PItj1eTrl2O3+W6vlZE59yBjwgSR5gTJcfakOjLQ
	 1a3nerNDzlNz+uD1opvObW6XDtagsnN8fCDfbkWAG1x+CaKoTLw+HcJLm0R74xho30+Cw
	 TotRgVSV4Fa5Eo540do8WNPvr68ennaFnCw5gs7az59RKCofAOkSbD/NtQUvyHQ54Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmUOCayZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A9B606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MmUOCayZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1BE1F000EB
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437108;
	bh=dnURE+gc5hnvwX/1PcDxNTIpk6Q2+hCZDq2FOE6jgzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MmUOCayZiSbJ4hWxoe1p9n3DxC1k9TWIj6NMxcCKNAGzwmCBseSVv9wRxrWfvL/0d
	 lkqfXgwryC8ydGYOkH5vj0Qy9LHOHJXfAjzp0kAsVmXvsi6KvfcfIQc5KJYEtIFb4R
	 rHAoeBWAFHtb7vg4uKz7xda4Fq3jrbWafW35OP9usNv1hdFDPw/Iakl8Kps+GwquJk
	 otrViBT5YaGr1fZ7uufnXRiMeob76+hyk17ij2TKP7RqSXNs1o7mkLJZ4BPZaHZQ8P
	 P6RXOy+h8dqEk+mgBh15n1pCxQ4uCYsvX9MwG8nHHeV0v068FF4R0TAapcqZh8uN39
	 xYNqfK/azmK6w==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ab5e64742so1931438eaf.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEmPW7rKK06rO3y7Hyxt5v7kPEerF3CFusAzlf372SKcITLvg0kZosIsl6uygYVQvDYqiku/k8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jMwnLTwIRhkfiEXc1X9z3BjoYA5/yF+k7Wq5fzN+XJZODmzGg
	6SoGoddKCjr8apHCg+cult5T2tVfttQ9O8SqwxcbTYLXpuJjWYhDTBHDHDkKsJQ8ZJx7op8SH/6
	3uihWNKAAakq0cUyh8y3yHpMJEflJDK0=
X-Received: by 2002:a05:6820:c0c2:10b0:6e1:b850:8c33 with SMTP id
 006d021491bc7-71b396065d6mr6058793eaf.67.1795437108068; Mon, 23 Nov 2026
 04:31:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118125443.1137177-1-edumazet@kernel.org> <179512665919.3136.5931555157250030152@kernel.org>
In-Reply-To: <179512665919.3136.5931555157250030152@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 13:31:35 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqQJrMpm+rWxhhqqgexgAZzi+vdu=PxL_UMDcbmB5T0hg@mail.gmail.com>
X-Gm-Features: Aa3M54rOd5Urs-wohrSIwcHsLciQOHrWImYfjpzV3vRqLX60hmJxiNMUaARauSA
Message-ID: <CAL4WiiqQJrMpm+rWxhhqqgexgAZzi+vdu=PxL_UMDcbmB5T0hg@mail.gmail.com>
Subject: Re: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	willemb@google.com, horms@kernel.org, netdev@vger.kernel.org, 
	bsdhenrymartin@gmail.com, willemdebruijn.kernel@gmail.com, 
	jasowangio@gmail.com, andrew+netdev@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 19 nov. 2026 =C3=A0 23:17, <netdev-bot+sashiko@kernel.org> a =C3=A9=
crit :
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix's own claim is still reachable through a race, so
>   uninitialized kernel memory can still leak.
> - [Medium] The new dev_uc_flush()/dev_mc_flush() in TUNSETLINK
>   (drivers/net/tun.c:3393-3396) frees every netdev_hw_addr in=E2=80=A6
>
> --
>
> tun: flush uc and mc addresses in TUNSETLINK
>
> When the new link type changes dev->addr_len, this patch makes TUNSETLINK
> flush dev->uc and dev->mc. Entries created with the old addr_len would
> otherwise be searched and dumped with the new length. This follows what
> bonding and team do between NETDEV_PRE_TYPE_CHANGE and the type change.
>
> Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymar=
tin@gmail.com/
>
> > diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> > index d4870bdc156f4..a2f56a4febb57 100644
> > --- a/drivers/net/tun.c
> > +++ b/drivers/net/tun.c
> > @@ -3379,6 +3379,8 @@ static long __tun_chr_ioctl(struct file *file, un=
signed int cmd,
> >                          (unsigned short)arg =3D=3D ARPHRD_MCTP) {
> >                       ret =3D -EINVAL;
> >               } else {
> > +                     unsigned char addr_len =3D tun_get_addr_len(arg);
> > +
> >                       ret =3D call_netdevice_notifiers(NETDEV_PRE_TYPE_=
CHANGE,
> >                                                      tun->dev);
> >                       ret =3D notifier_to_errno(ret);
> > @@ -3387,8 +3389,13 @@ static long __tun_chr_ioctl(struct file *file, u=
nsigned int cmd,
> >                                          "Refused to change device type=
\n");
> >                               break;
> >                       }
> > +                     /* Addresses were added with the old dev->addr_le=
n. */
> > +                     if (addr_len !=3D tun->dev->addr_len) {
> > +                             dev_uc_flush(tun->dev);
> > +                             dev_mc_flush(tun->dev);
> > +                     }
>
> [Severity: Medium]
> Can this flush break the reference bookkeeping of holders other than
> IPv4 and IPv6?
>
> dev_uc_flush() and dev_mc_flush() free every netdev_hw_addr no matter
> what its refcount, sync_cnt or global_use is. Only IPv4 and addrconf
> (ipv6_mc_unmap()/ipv6_mc_remap()) give back and re-take their references
> across PRE/POST_TYPE_CHANGE.
>
> Upper devices that sync into a tap do not veto NETDEV_PRE_TYPE_CHANGE on
> the lower device. Two examples are bonding, via bond_set_rx_mode() ->
> dev_uc_sync()/dev_mc_sync(), and macsec, via dev_uc_add(real_dev,
> dev->dev_addr) in macsec_dev_open() and the syncs in
> macsec_dev_set_rx_mode(). After the flush, the upper device's entries
> still have sync_cnt =3D=3D 1 and the extra refcount.
>
> On bond failover, bond_hw_addr_swap() -> bond_hw_addr_flush() ->
> dev_mc_unsync() reaches:
>
> net/core/dev_addr_lists.c:__hw_addr_unsync_one() {
>         err =3D __hw_addr_del_ex(to_list, ha->addr, addr_len, ha->type,
>                                false, true);
>         if (err)
>                 return;
>         ha->sync_cnt--;
> }
>
> This returns early on -ENOENT. __hw_addr_sync() then skips the entry for
> the new active slave, because sync_cnt is still non-zero:
>
>         if (!ha->sync_cnt) {
>                 err =3D __hw_addr_sync_one(to_list, ha, addr_len);
>         ...
>
> Would the bond's uc/mc addresses then never be synced to the new active
> slave?
>
> The same applies to AF_PACKET PACKET_ADD_MEMBERSHIP. The packet_mclist
> entry survives the flush. If addr_len later returns to its original value
> (for example ETHER -> NONE -> ETHER), packet_dev_mc() passes its check on
> close or drop:
>
>         if (i->alen !=3D dev->addr_len)
>                 return -EINVAL;
>         ...
>         return dev_mc_del(dev, i->addr);
>
> Can this plain delete in __hw_addr_del_entry() decrement, or even free,
> an entry that now belongs to another holder (SIOCADDMULTI, IPv6, or an
> upper device's sync)?
>
> bonding and team only flush their own master lists, and only when they
> have no lower ports, so no downstream sync state exists at that point.
> tun can be a lower device and has no such check. Should it handle this
> case differently?

This is not new with this patch.

Without the flush, the entries synced by the upper device stay in the
tap lists, but dev_uc_unsync()/dev_mc_unsync() then look them up with
the new addr_len of the tap. When addr_len changed, the lookup compares
the wrong number of bytes, so it either fails (and sync_cnt on the
upper device is stuck the same way) or matches an unrelated entry.

Changing the link type of a tap that has upper devices makes no sense
anyway: bonding and team check the type when the port is added, and
team already vetoes NETDEV_PRE_TYPE_CHANGE on its ports.

I think the right fix is to refuse TUNSETLINK when the device has upper
devices. This is a behavior change, I will send it as a separate patch.

The AF_PACKET case needs addr_len to change and then come back to its
original value while the socket keeps its membership. bonding and team
have the same limitation, I do not plan to address it here.


>
> >                       tun->dev->type =3D (int) arg;
> > -                     tun->dev->addr_len =3D tun_get_addr_len(tun->dev-=
>type);
> > +                     tun->dev->addr_len =3D addr_len;
>
> [Severity: High]
> Is the uninitialized-byte exposure described in the commit message still
> reachable through a race here?
>
> dev_uc_flush() and dev_mc_flush() each take and drop netif_addr_lock_bh.
> The dev->type and dev->addr_len stores come afterwards, as plain stores
> outside that lock. __dev_mc_add() reads dev->addr_len under the addr
> lock:
>
>         err =3D __hw_addr_add_ex(&dev->mc, addr, dev->addr_len,
>
> IPV6_ADD_MEMBERSHIP does not take RTNL. do_ipv6_setsockopt() only does
> sockopt_lock_sock(), and the join path is:
>
> __ipv6_sock_mc_join()
>   ip6_mc_find_dev()
>   __ipv6_dev_mc_inc()          /* holds only idev->mc_lock */
>     igmp6_group_added()
>       ndisc_mc_map(&mc->mca_addr, buf, dev, 0)  /* uses dev->type */
>       dev_mc_add(dev, buf)
>
> igmp6_group_added() does this before its IFF_UP check, so it also runs
> on the down device that TUNSETLINK requires.
>
> Take a tap switching from ARPHRD_ETHER (addr_len 6) to ARPHRD_IP6GRE
> (addr_len 16):
>
> TUNSETLINK                        IPV6_ADD_MEMBERSHIP
> PRE_TYPE_CHANGE (ipv6_mc_unmap)
> dev_mc_flush()
>                                   mutex_lock(&idev->mc_lock)
>                                   ndisc_mc_map() fills 6 bytes
>                                   __dev_mc_add() reads addr_len =3D=3D 6
>                                   __hw_addr_create(): kmalloc(),
>                                     memcpy() of 6 bytes
> dev->addr_len =3D 16
> POST_TYPE_CHANGE (ipv6_mc_remap)
>   igmp6_group_added() skips the
>   group, MAF_LOADED already set
>
> The entry survives. Afterwards, dev_mc_seq_show() (/proc/net/dev_mcast)
> and dev_mc_fill_addr() (RTM_GETMULTICAST) copy dev->addr_len bytes of
> ha->addr to user space:
>
>         nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||
>
> Since __hw_addr_create() does not zero the allocation, wouldn't 10 of
> those 16 bytes be uninitialized slab memory?
>
> There is also a stack variant. idev->mc_lock is a mutex, so the joining
> thread can be preempted after ndisc_mc_map() has written only 6 bytes of
> the on-stack buf[MAX_ADDR_LEN]. If TUNSETLINK then flushes and stores
> addr_len =3D 16, its POST remap blocks on mc_lock. When the join resumes,
> dev_mc_add() copies 16 bytes from buf into a long-lived netdev_hw_addr,
> 10 of them uninitialized stack.
>
> Would the flush and the dev->type/dev->addr_len update need to be atomic
> under netif_addr_lock_bh? Would mappers that build the address from
> dev->type also need to agree with the addr_len used for the copy, for
> example by zero-initializing buf in igmp6_group_added() or re-checking
> under the lock?

The race is real, but it is not specific to tun, and not added by
this patch.

Since commit 1767bb2d47b7 ("ipv6: mcast: Don't hold RTNL for
IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP"), igmp6_group_added() reads
dev->type and dev->addr_len without RTNL, while every driver changing
them (tun, bonding, team, qmi_wwan, hdlc) only holds RTNL.

Doing the flush and the stores under netif_addr_lock_bh() in tun would
not close it: ndisc_mc_map() reads dev->type before dev_mc_add() takes
that lock.

The heap variant is closed by Henry's patch, which zeroes the tail of
ha->addr in __hw_addr_create(), whatever the path or the race:

https://lore.kernel.org/netdev/20261123121325.3137049-1-bsdhenrymartin@gmai=
l.com/

The stack variant (buf[] partially filled by ndisc_mc_map(), then
copied with a larger addr_len) needs a fix in net/ipv6/mcast.c.
I will send a patch zero-initializing buf in igmp6_group_added().

IPv4 is not affected, the IGMP paths still run under RTNL.

So I am not planning a respin of this patch: it removes the stale
entries in the non racy case, and the two remaining points are
addressed by separate patches.

>
> >                       netif_info(tun, drv, tun->dev, "linktype set to %=
d\n",
> >                                  tun->dev->type);
> >                       call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261118125443.1137177-1-edumazet%40kernel.org

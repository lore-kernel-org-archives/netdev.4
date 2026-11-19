Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126660;
	b=AT0tL0xpzyDxa49O4z1E1fcN5cNl4rvHu9F4P1z6AKyiS2+umJ+eyVONrh5pmmySVB9g
	 EoVkOvgSVv78OD+16lscOGf2l401KzWFfMK/Jnz3oSZDjvJ10YauASxEtyrAiQJ/BVuaz
	 Jb297g+hXN2cc8MGom8d5jgevdBnEuGhu4m/gSpgl8aWxd5VUWIrWflU85DaqN67QhxSc
	 9nPB0gVgMwAiXVHL92WRMZbmYx/WBKN82t/MCtawJmXlYnHsI4ZMoF6HtEVup2lfM63f1
	 OOCKHNRx+37IK4Xyoayuogk4fzIib9k1+8rooRf7pLGewpdk336ZQuBBCBNhAuDpEvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126660;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FSKXTIopWI2QEbO/fiB83yC9X6BuSlUmNBzn+/m05MA=;
	b=MURDPr2XwomK71+jDH9jDCCs5HWqo5SvJ0/Mzon2wuOb0ecZHIHWzjhMf53xT9MhMcej
	 /4G7V7fXkv1RFKr84yyKAOzRqU6S1IPm0MSVFOixApMadKsU9UiKUZsOSf4efRcGNJtkQ
	 60o6RreDxZh0Xa4+Ju767P3KaEDk7xS4BdjVddGDmismx5g4Rp0C9H4atp03Ww5ZzneE4
	 pnJqMBZAzLCiPot3XZJ3P+tdbUHnN9xyAj1mOhVN4DS/4pZqy0PETKuS3A271HmCVTX8F
	 u0Ds7CAC7gU8m2HWRnxyiDR5S8myRG9FebgV3klwRElnjjDldHsiCPDOfTrA1MqsWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BspMPkwi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5A606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BspMPkwi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA261F000CA;
	Thu, 19 Nov 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126660;
	bh=FSKXTIopWI2QEbO/fiB83yC9X6BuSlUmNBzn+/m05MA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BspMPkwitfHw7ts6tK/trHN+Ep8D8+VzYlW94uVtHPcR5TNWoWayFGfHtazmooVoq
	 MEIIrCExei3VAoc38IbH6gGjRrDEDlqxr7U+529eGbsLlr5rYVxkxgInGIuW706ST0
	 /dGjkypjzHBWLhlnrBpZHTrncD2cvou9u/qBa09GBVfJEpIYaCo5m1LItXs8fdHw5H
	 0wWaP2TfERIEsZhYx4PdcgzdvpbjYo2HSTWTRxnaAc/6qE0B+uHP+z617hXQsvbrbu
	 /bD8l3dDw4qLruVVlAXxVVc/XB5uU1PET2o03kkje8FMHhkSGyj+SXlR83JqW+0ccd
	 kfPgoPuZv3RdQ==
Subject: Re: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
From: netdev-bot+sashiko@kernel.org
To: edumazet@kernel.org
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org,
 bsdhenrymartin@gmail.com, willemdebruijn.kernel@gmail.com,
 jasowangio@gmail.com, andrew+netdev@lunn.ch
Date: Thu, 19 Nov 2026 22:17:39 +0000
Message-ID: <179512665919.3136.5931555157250030152@kernel.org>
In-Reply-To: <20261118125443.1137177-1-edumazet@kernel.org>
References: <20261118125443.1137177-1-edumazet@kernel.org>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix's own claim is still reachable through a race, so
  uninitialized kernel memory can still leak.
- [Medium] The new dev_uc_flush()/dev_mc_flush() in TUNSETLINK
  (drivers/net/tun.c:3393-3396) frees every netdev_hw_addr in…

--

tun: flush uc and mc addresses in TUNSETLINK

When the new link type changes dev->addr_len, this patch makes TUNSETLINK
flush dev->uc and dev->mc. Entries created with the old addr_len would
otherwise be searched and dumped with the new length. This follows what
bonding and team do between NETDEV_PRE_TYPE_CHANGE and the type change.

Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymartin@gmail.com/

> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index d4870bdc156f4..a2f56a4febb57 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -3379,6 +3379,8 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
>  			   (unsigned short)arg == ARPHRD_MCTP) {
>  			ret = -EINVAL;
>  		} else {
> +			unsigned char addr_len = tun_get_addr_len(arg);
> +
>  			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
>  						       tun->dev);
>  			ret = notifier_to_errno(ret);
> @@ -3387,8 +3389,13 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
>  					   "Refused to change device type\n");
>  				break;
>  			}
> +			/* Addresses were added with the old dev->addr_len. */
> +			if (addr_len != tun->dev->addr_len) {
> +				dev_uc_flush(tun->dev);
> +				dev_mc_flush(tun->dev);
> +			}

[Severity: Medium]
Can this flush break the reference bookkeeping of holders other than
IPv4 and IPv6?

dev_uc_flush() and dev_mc_flush() free every netdev_hw_addr no matter
what its refcount, sync_cnt or global_use is. Only IPv4 and addrconf
(ipv6_mc_unmap()/ipv6_mc_remap()) give back and re-take their references
across PRE/POST_TYPE_CHANGE.

Upper devices that sync into a tap do not veto NETDEV_PRE_TYPE_CHANGE on
the lower device. Two examples are bonding, via bond_set_rx_mode() ->
dev_uc_sync()/dev_mc_sync(), and macsec, via dev_uc_add(real_dev,
dev->dev_addr) in macsec_dev_open() and the syncs in
macsec_dev_set_rx_mode(). After the flush, the upper device's entries
still have sync_cnt == 1 and the extra refcount.

On bond failover, bond_hw_addr_swap() -> bond_hw_addr_flush() ->
dev_mc_unsync() reaches:

net/core/dev_addr_lists.c:__hw_addr_unsync_one() {
	err = __hw_addr_del_ex(to_list, ha->addr, addr_len, ha->type,
			       false, true);
	if (err)
		return;
	ha->sync_cnt--;
}

This returns early on -ENOENT. __hw_addr_sync() then skips the entry for
the new active slave, because sync_cnt is still non-zero:

	if (!ha->sync_cnt) {
		err = __hw_addr_sync_one(to_list, ha, addr_len);
	...

Would the bond's uc/mc addresses then never be synced to the new active
slave?

The same applies to AF_PACKET PACKET_ADD_MEMBERSHIP. The packet_mclist
entry survives the flush. If addr_len later returns to its original value
(for example ETHER -> NONE -> ETHER), packet_dev_mc() passes its check on
close or drop:

	if (i->alen != dev->addr_len)
		return -EINVAL;
	...
	return dev_mc_del(dev, i->addr);

Can this plain delete in __hw_addr_del_entry() decrement, or even free,
an entry that now belongs to another holder (SIOCADDMULTI, IPv6, or an
upper device's sync)?

bonding and team only flush their own master lists, and only when they
have no lower ports, so no downstream sync state exists at that point.
tun can be a lower device and has no such check. Should it handle this
case differently?

>  			tun->dev->type = (int) arg;
> -			tun->dev->addr_len = tun_get_addr_len(tun->dev->type);
> +			tun->dev->addr_len = addr_len;

[Severity: High]
Is the uninitialized-byte exposure described in the commit message still
reachable through a race here?

dev_uc_flush() and dev_mc_flush() each take and drop netif_addr_lock_bh.
The dev->type and dev->addr_len stores come afterwards, as plain stores
outside that lock. __dev_mc_add() reads dev->addr_len under the addr
lock:

	err = __hw_addr_add_ex(&dev->mc, addr, dev->addr_len,

IPV6_ADD_MEMBERSHIP does not take RTNL. do_ipv6_setsockopt() only does
sockopt_lock_sock(), and the join path is:

__ipv6_sock_mc_join()
  ip6_mc_find_dev()
  __ipv6_dev_mc_inc()          /* holds only idev->mc_lock */
    igmp6_group_added()
      ndisc_mc_map(&mc->mca_addr, buf, dev, 0)  /* uses dev->type */
      dev_mc_add(dev, buf)

igmp6_group_added() does this before its IFF_UP check, so it also runs
on the down device that TUNSETLINK requires.

Take a tap switching from ARPHRD_ETHER (addr_len 6) to ARPHRD_IP6GRE
(addr_len 16):

TUNSETLINK                        IPV6_ADD_MEMBERSHIP
PRE_TYPE_CHANGE (ipv6_mc_unmap)
dev_mc_flush()
                                  mutex_lock(&idev->mc_lock)
                                  ndisc_mc_map() fills 6 bytes
                                  __dev_mc_add() reads addr_len == 6
                                  __hw_addr_create(): kmalloc(),
                                    memcpy() of 6 bytes
dev->addr_len = 16
POST_TYPE_CHANGE (ipv6_mc_remap)
  igmp6_group_added() skips the
  group, MAF_LOADED already set

The entry survives. Afterwards, dev_mc_seq_show() (/proc/net/dev_mcast)
and dev_mc_fill_addr() (RTM_GETMULTICAST) copy dev->addr_len bytes of
ha->addr to user space:

	nla_put(skb, IFA_MULTICAST, dev->addr_len, ha->addr) ||

Since __hw_addr_create() does not zero the allocation, wouldn't 10 of
those 16 bytes be uninitialized slab memory?

There is also a stack variant. idev->mc_lock is a mutex, so the joining
thread can be preempted after ndisc_mc_map() has written only 6 bytes of
the on-stack buf[MAX_ADDR_LEN]. If TUNSETLINK then flushes and stores
addr_len = 16, its POST remap blocks on mc_lock. When the join resumes,
dev_mc_add() copies 16 bytes from buf into a long-lived netdev_hw_addr,
10 of them uninitialized stack.

Would the flush and the dev->type/dev->addr_len update need to be atomic
under netif_addr_lock_bh? Would mappers that build the address from
dev->type also need to agree with the addr_len used for the copy, for
example by zero-initializing buf in igmp6_group_added() or re-checking
under the lock?

>  			netif_info(tun, drv, tun->dev, "linktype set to %d\n",
>  				   tun->dev->type);
>  			call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118125443.1137177-1-edumazet%40kernel.org

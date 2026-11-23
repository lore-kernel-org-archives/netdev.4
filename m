Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404771;
	b=G8Km+OrTgPYHRLqRTIHgfZERTkDsnALVlmH19dlREO2CMmhMpctdeOBHPYtryf/dR9Gr
	 HNJLHfcZ+1Q+0beOOLCfqSkD8qZJWx6ogRVuAXQxKmCgdLpuCbFOXhY+DRTrJkm2dBooB
	 FSNMb+byWkaSQicUBOHLipjlrY6IW0v+cwcc8pZ7WV0MoaAFcKcPgCYWcE2aaLad8EWgF
	 Iu7Cz6KwbsaooVJw+pkvCjmMPb19D/qyKe9SPv1gW9Ct74+broFvg3crKClsEnxIjuMzY
	 TrPllup7zpy86FVAYT6RCpT37mjH4cuZUe4HLsJUXn6Pf0rh0/Hkf3JYIww3S2iKkBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404771;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=kBqe9Dl7xjSgmQlMJ6gpivRKSw2tHUzsUfeHJzmYSX0=;
	b=wvbyT2bi8R+9Az2iPaTZwMxTcARUbyGRu2QVuX4kzSuVQbF7RW2hVHn7AzGnNdQHj2pC
	 c/1OMMd2hT+mXB58D/gybsCFkUE0xG+prn9mKWN0zYighIT1v1D8MtNtfe3OvX+w3aU5e
	 nevC94yIpBKtGrq04DhKQ7IXYsIVQAMKylgkSaGLA2q3QeGhSaflGSOj9LrS9vS/zGMtg
	 kIAUfSEvSBZPZDSEUZ5CsWGx7Vr7Kv7FoWy4QD0qeZQ9E1mvmGXFb8TFaSCdvFNtsLVxw
	 JrTH+iUmTP60qeUWGQohRF61itKbBnkVtLFM7D6qDAsz89BsNleFXKO5XfWUwAg8ilg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7iJWcjh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B25A606A31E;
	Mon, 23 Nov 2026 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7iJWcjh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7DF1F000CA;
	Mon, 23 Nov 2026 03:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795404770;
	bh=kBqe9Dl7xjSgmQlMJ6gpivRKSw2tHUzsUfeHJzmYSX0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y7iJWcjh04wCGKVPx7raF2JWc/HbkfzOOSasgMbRVafFItfolMiKnVi5YFheqqJsX
	 Tn+Q4HzRT/QIrqJUw6nD6sn9hkad9OvZ7OEDiN+nlCwgL2BKiaYXwRGEwkbFkk491v
	 ecjlgxYiX/4j/h0NW0JJtpA7geXXJ7v8s508A7S7GrK0NRhKuXDEsr3jHbTkBzjHox
	 +KYZIGFssV1O80ui6KBsEkJrykv7aOrXUKkf0yHht0z3aIMwpaXeHBAX9TvWvXlL5G
	 f737O6cxev0t4Ht9gccqt00uApy8TjDQsQthXOT1yhMVqjdC5nUMj6/RczFWzK/UUV
	 MXWXp31kS9gdA==
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
From: netdev-bot+sashiko@kernel.org
To: kyuwoncho18@gmail.com
Cc: netdev@vger.kernel.org, jv@jvosburgh.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 03:32:49 +0000
Message-ID: <179540476963.3135.15854448705865137311@kernel.org>
In-Reply-To: <179505868590.3571070.12381528230330714812@gmail.com>
References: <179505868590.3571070.12381528230330714812@gmail.com>
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

- [High] The fix is incomplete.

--

bonding: reject a non-Ethernet 802.3ad slave even when the type matches

This patch moves the "8023AD mode requires Ethernet devices" check in
bond_enslave() above the bond type handling. The check now applies to
every slave, not only to a first slave that changes the bond's type. It
targets a KASAN global-out-of-bounds read in bond_open(), where
dev_mc_add() copies a 16-byte addr_len from the 8-byte lacpdu_mcast_addr.

> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 042d7c75548fa..bcc12ef34d9ab 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -1951,6 +1951,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  		return -EPERM;
>  	}
>  
> +	if (slave_dev->type != ARPHRD_ETHER &&
> +	    BOND_MODE(bond) == BOND_MODE_8023AD) {
> +		SLAVE_NL_ERR(bond_dev, slave_dev, extack,
> +			     "8023AD mode requires Ethernet devices");
> +		return -EINVAL;
> +	}
> +

[Severity: High]
Does this fully close the out-of-bounds read on lacpdu_mcast_addr? The
check only looks at slave_dev->type when the device is enslaved. A slave
that is itself a bond can still change type afterwards, while it stays a
slave of the 802.3ad bond.

Here is a possible sequence:

  1) Create B1 in 802.3ad mode and B2 in active-backup mode. B2 is
     ARPHRD_ETHER because bonds are created with ether_setup.
  2) Enslave B2 into B1. Bond masters are allowed as slaves, and B2 is
     ARPHRD_ETHER, so the new check passes.
  3) Enslave an ip6tnl device (ARPHRD_TUNNEL6, addr_len 16) into B2.

Step 3 goes through:

bond_enslave(B2, ip6tnl)
  call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE, B2)
    bond_netdev_event()
      bond_master_netdev_event()   returns NOTIFY_DONE
      bond_slave_netdev_event()    returns NOTIFY_DONE, no PRE_TYPE_CHANGE case
  bond_setup_by_slave(B2, ip6tnl)
    bond_dev->type     = slave_dev->type;      /* ARPHRD_TUNNEL6 */
    bond_dev->addr_len = slave_dev->addr_len;  /* 16 */

Nothing in bonding vetoes the type change, so B2 is now a TUNNEL6 slave
of the 802.3ad bond B1. Setting B1 down and then up again reaches the
same sink as in the commit message:

bond_open(B1)
  dev_mc_add(slave->dev, lacpdu_mcast_addr)
    __dev_mc_add()
      __hw_addr_add_ex(&dev->mc, addr, dev->addr_len, ...)
        memcpy(ha->addr, addr, addr_len)   /* 16 bytes from an 8-byte global */

with:

drivers/net/bonding/bond_3ad.c:
const u8 lacpdu_mcast_addr[ETH_ALEN + 2] __long_aligned = {

bond_hw_addr_flush() has the same problem through
dev_mc_del(slave_dev, lacpdu_mcast_addr). The bytes read past the end of
the global end up in B2's mc list, and /proc/net/dev_mcast prints them.

A team device used as the inner device should follow the same path,
because team_dev_type_check_change() also relies on the notifier chain.

Other upper drivers block type changes of their lower devices. For
example, team_device_event():

	case NETDEV_PRE_TYPE_CHANGE:
		/* Forbid to change type of underlaying device */
		return NOTIFY_BAD;

Bridge, macvlan, ipvlan, hsr and vlan do the same.

Could bond_slave_netdev_event() refuse NETDEV_PRE_TYPE_CHANGE, at least
in 802.3ad mode? Another option would be to check the slave's addr_len
before dev_mc_add()/dev_mc_del() of lacpdu_mcast_addr.

>  	/* set bonding device ether type by slave - bonding netdevices are
>  	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
>  	 * there is a need to override some of the type dependent attribs/funcs.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179505868590.3571070.12381528230330714812%40gmail.com

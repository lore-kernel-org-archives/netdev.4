Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570002;
	b=07PL+5HDMc19HfQrLu+WhhpRiwmJAC0/bkPgS7YqJJflSEQPgw0O38rr4rKugb57Z9JA
	 yYOdz2EQeUJDecxX335KYd3dKg5hcErVwMKVVA0rYU/2FAsvzF5w+yw6ikn1LIus6vvep
	 BnLlSx98iJxj6XNSMaP9krfMhq6rtu2BxIXNbqc49PaAft3LUzTY8WhVZK4W8j4fke1gz
	 9CCMssC9n5w/Qvmuq9ZecWe/IbCNNbSJ8b1SmOgtWjnfCWrSoExuI3j6i5jGMOWHc/04I
	 ELWY04oGbeg+mGd65SZW9BSHNsprwdhyrG5q/XOwlW0+IgT9PuYLZi0METHTY0U/mKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570002;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GYnMm6oY2CoBK3VQDfahz7r3axfDYTK/q7aun/2ckiM=;
	b=T1lxrNuyvGHqbnfP7tGN5lPZ/3gbHZmnMU+ERS2aWWRg9FYMvaj6uxwaDl3T4mCNG74a
	 tiA3ELsrngwWwSCsI+4HzwLADSdaGaGHgENSvHEGy04L7ogEoD7rnRooL/ey3hgiBB/Le
	 OEj7M/0V6UPEpULCSY8/PewkimN/M0zeqU6j6nw82BVGwHiRuzTkKyaWz/aJ+MkeOyOEW
	 R8tpnKhzo2mt8DuE+TR4JXCWIq+epUu/0hkOkElmAkBaBCGJP5/zeRsLm0ai11n735t+e
	 lw+TLfxR9VWDeBvEAKdGrgL/Usc39fDW/b4zPHDeDsLgwDSbNQHm6C0iFAzDkVrgQhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ch4jCDMM;
	arc=none smtp.remote-ip=95.215.58.50
Received: from mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4E606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C4E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ch4jCDMM
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xAfnthVrgNB8tpYjNLuTpMrchkhx5LSnJ0Zyzi4R/fc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795569999; v=1; x=1796174799;
 b=Ch4jCDMMhT5G5wa2/hi6TzX8vIDzKiE/hQlgCuPRhO0dkr1805Zy3nLvvh3DLe4Tg5JnmvTH
 WS6N/H/utZKgKaBDoNmmpufjYgYUeKyXs0zfqZ+7jVmR+d4ypKCcZm3VYokTwzDWD+fDlTTQOwR
 Zb6fanCO0HPWlrOGt6UGAyFc=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7beb4e14288bbdcb;
	Wed, 25 Nov 2026 01:26:39 +0000
X-Mizu-Trace-ID: 7beb4e14288bbdcb
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 09:26:32 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: JiangJieHua <jiangjiehua1@huawei.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <j.vosburgh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Changzhong Zhang <zhangchangzhong@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bonding: clear stale usable_slaves in broadcast mode
Message-ID: <20261125012632.GB19338@Liu-laptop>
References: <20261124130102.18807-1-jiangjiehua1@huawei.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124130102.18807-1-jiangjiehua1@huawei.com>

Hi Jiehua,
On Tue, Nov 24, 2026 at 09:01:02PM +0800, JiangJieHua wrote:
> In broadcast mode, bond_set_slave_arr() frees the usable_slaves argument
> and returns early, but does not clear bond->usable_slaves.

Since the issue was introduced in bond_set_slave_arr(). Should we set
the bond->usable_slaves to NULL here before return?

Thanks
Hangbin
> 
> A mode change requires the bond to be down with no slaves.  When the
> last slave is removed in balance-xor, balance-tlb or balance-alb,
> bond_update_slave_arr() publishes an empty usable array, and later mode
> changes do not clear it.  If the bond is switched to broadcast, the
> stale pointer remains: bond_miimon_inspect() sees count == 0 and
> ignores updelay for slaves enslaved while the stale array remains, and
> bond_uninit() leaks the array.
> 
> Clear bond->usable_slaves when the mode is changed to broadcast.  The
> bond is down and has no slaves at that point, so the array can be freed
> and set to NULL before the bond is brought up again.  Broadcast never
> publishes usable_slaves, so it stays NULL.
> 
> The issue was discovered by an AI code review agent and confirmed by
> manual code inspection.  It was reproduced on mainline with virtme-ng;
> no kernel modifications or error injection were needed.  With a dummy
> slave and miimon=1:
> 
>   ip link add bond0 type bond mode balance-xor miimon 1 updelay 1000
>   ip link add dummy0 type dummy
>   ip link set bond0 up
>   ip link set dummy0 master bond0
>   ip link set dummy0 nomaster
>   ip link set bond0 down
>   ip link set bond0 type bond mode broadcast
>   ip link set bond0 up
>   ip link set dummy0 master bond0
> 
> After the final enslavement, dummy0 comes up within 50 ms despite
> updelay=1000 (20 of 20 runs on the unpatched kernel).  With the fix,
> none of 300 runs skipped updelay.  The bonding mode-2 recovery-updelay
> selftest passes on the same kernel.
> 
> Fixes: 45fc134bcfad ("bonding: do not set usable_slaves for broadcast mode")
> Signed-off-by: JiangJieHua <jiangjiehua1@huawei.com>
> ---
>  drivers/net/bonding/bond_options.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/bonding/bond_options.c b/drivers/net/bonding/bond_options.c
> index 9efadeff6a22..f65916444fa1 100644
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
> +
>  	/* When changing mode, the bond device is down, we may reduce
>  	 * the bond_bcast_neigh_enabled in bond_close() if broadcast_neighbor
>  	 * enabled in 8023ad mode. Therefore, only clear broadcast_neighbor
> -- 
> 2.33.8
> 

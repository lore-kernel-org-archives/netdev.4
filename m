Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620123;
	b=NEX5h8vIhxP31o+qXrx/RCBcnm25mMhXNi1V8jd5GNlN+NYJnMd+f541Z7W/3CWyjK2b
	 uxYTvn3H3cViprx9YizYTEUDAre3gMuO4oacp8EgrU2EXGWWBpxINFxSNY69dOTLAiSU/
	 dkt1JJuwO7b7WRuCi7LM3N9cNzSpkq/XiZ8tdHraBZ+mwgWOC/+UA48Xk8d4IdzlNlNza
	 gV33g9Y+54AiVnyBKBC8GGFkrltDKXOklBXhbbabFijiv56y9HU7duC1qOoHT1jFz+LnW
	 vAC6S5WrKKibR8ssByfov4Nc+51SMDZoYKsZM/M/4RV5JeeTmiMkUURzk9aLxmCDBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620123;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CifWyrn9kLivKLGUJMFWOKg6eEMnLvcZRh6jBkDlvmg=;
	b=vRGktJZThTunMkaKk1AS8b4tA04EyCfR3B1zLmw+6scO6Z7G33bHyIkMQvgnzMx1vcVz
	 LxvrlQa9IyER//Lhzk6Ekqp4f/rGBRutdOcjT5GVI978KQQ2vyAu31ocfxqVqY5UrAJSy
	 xxmeM/NVVwT7pVKIkAOTsdfu3+jCkjpmMNmGvgdDGEpkVmbzzgiM1Kf2ygOekoPK0YVS4
	 dAhet5A0vvIzp05XH5T3V4QtA3fqHHe0mLcBq+oQPISfFKNCSvVBUEtvx/XF2vBH0gh7t
	 c/g7Ti2aWjtwz5AucnTttJHU+8ekzQpukriLOttyOzYjas57/VRDJLagSBXrLfZIVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="eu/acfj7";
	arc=none smtp.remote-ip=95.215.58.45
Received: from mta1.migadu.com (out-45.mta1.migadu.com [95.215.58.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140F606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8140F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eu/acfj7
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LHXtKsSSTtBxV1tByXCuT3bFUh7XApx4GtOxSomysqU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795620119; v=1; x=1796224919;
 b=eu/acfj7GOF9XKHbMFBtE01hUnABYS0nNhMB9WXUidlL3g9IOU+uCYdcG1/4YysYopk4QLej
 7fLCp3yp/9jJH2hIWNOV7HMGZV0tvLDBW+WegYUfGvo0ZIVJDkx5r7ebVGdHQutwmYl3TcViVYy
 8pXQx49BW0o1fyRfFHasTUws=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 327d822d9fb9905d;
	Wed, 25 Nov 2026 15:21:59 +0000
X-Mizu-Trace-ID: 327d822d9fb9905d
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 23:21:49 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "jiangjiehua (A)" <jiangjiehua1@huawei.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <j.vosburgh@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Changzhong Zhang <zhangchangzhong@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bonding: clear stale usable_slaves in broadcast mode
Message-ID: <awb9DbxQwIFaO3nJ@fedora>
References: <20261124130102.18807-1-jiangjiehua1@huawei.com>
 <20261125012632.GB19338@Liu-laptop>
 <3001f950-9693-4f71-aabc-41b741af865b@huawei.com>
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
In-Reply-To: <3001f950-9693-4f71-aabc-41b741af865b@huawei.com>

On Wed, Nov 25, 2026 at 03:00:37PM +0800, jiangjiehua (A) wrote:
> 
> Hi Hangbin,
> On 11/25/2026 9:26 AM, Hangbin Liu wrote:
> > Hi Jiehua,
> > On Tue, Nov 24, 2026 at 09:01:02PM +0800, JiangJieHua wrote:
> > > In broadcast mode, bond_set_slave_arr() frees the usable_slaves argument
> > > and returns early, but does not clear bond->usable_slaves.
> > 
> > Since the issue was introduced in bond_set_slave_arr(). Should we set
> > the bond->usable_slaves to NULL here before return?
> 
> Clearing bond->usable_slaves in bond_set_slave_arr() does fix the leak,
> but it is too late for updelay: bond_enslave() links the new slave via
> bond_master_upper_dev_link() before calling bond_update_slave_arr(),
> so miimon can already see the slave while the stale empty array is
> still there and skip updelay.
> 
> Clearing when the mode changes to broadcast happens while the bond is
> down with no slaves and mii_work has already been canceled, so the
> stale pointer is gone before any new slave is visible.  That fixes both
> the leak and the updelay issue.

After a second look, I found we should ignore the updelay based on
bonding doc section 13.1 paragraph 4.

I will revert 45fc134bcfad and prepare another fix.

Thanks
Hangbin

> 
> > 
> > Thanks
> > Hangbin
> > > 
> > > A mode change requires the bond to be down with no slaves.  When the
> > > last slave is removed in balance-xor, balance-tlb or balance-alb,
> > > bond_update_slave_arr() publishes an empty usable array, and later mode
> > > changes do not clear it.  If the bond is switched to broadcast, the
> > > stale pointer remains: bond_miimon_inspect() sees count == 0 and
> > > ignores updelay for slaves enslaved while the stale array remains, and
> > > bond_uninit() leaks the array.
> > > 
> > > Clear bond->usable_slaves when the mode is changed to broadcast.  The
> > > bond is down and has no slaves at that point, so the array can be freed
> > > and set to NULL before the bond is brought up again.  Broadcast never
> > > publishes usable_slaves, so it stays NULL.
> > > 
> > > The issue was discovered by an AI code review agent and confirmed by
> > > manual code inspection.  It was reproduced on mainline with virtme-ng;
> > > no kernel modifications or error injection were needed.  With a dummy
> > > slave and miimon=1:
> > > 
> > >   ip link add bond0 type bond mode balance-xor miimon 1 updelay 1000
> > >   ip link add dummy0 type dummy
> > >   ip link set bond0 up
> > >   ip link set dummy0 master bond0
> > >   ip link set dummy0 nomaster
> > >   ip link set bond0 down
> > >   ip link set bond0 type bond mode broadcast
> > >   ip link set bond0 up
> > >   ip link set dummy0 master bond0
> > > 
> > > After the final enslavement, dummy0 comes up within 50 ms despite
> > > updelay=1000 (20 of 20 runs on the unpatched kernel).  With the fix,
> > > none of 300 runs skipped updelay.  The bonding mode-2 recovery-updelay
> > > selftest passes on the same kernel.
> > > 
> > > Fixes: 45fc134bcfad ("bonding: do not set usable_slaves for broadcast mode")
> > > Signed-off-by: JiangJieHua <jiangjiehua1@huawei.com>
> > > ---
> > >  drivers/net/bonding/bond_options.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/net/bonding/bond_options.c b/drivers/net/bonding/bond_options.c
> > > index 9efadeff6a22..f65916444fa1 100644
> > > --- a/drivers/net/bonding/bond_options.c
> > > +++ b/drivers/net/bonding/bond_options.c
> > > @@ -936,6 +936,14 @@ static int bond_option_mode_set(struct bonding *bond,
> > >  	WRITE_ONCE(bond->params.arp_validate, BOND_ARP_VALIDATE_NONE);
> > >  	WRITE_ONCE(bond->params.mode, newval->value);
> > > +	if (newval->value == BOND_MODE_BROADCAST) {
> > > +		struct bond_up_slave *usable;
> > > +
> > > +		usable = rtnl_dereference(bond->usable_slaves);
> > > +		RCU_INIT_POINTER(bond->usable_slaves, NULL);
> > > +		kfree_rcu(usable, rcu);
> > > +	}
> > > +
> > >  	/* When changing mode, the bond device is down, we may reduce
> > >  	 * the bond_bcast_neigh_enabled in bond_close() if broadcast_neighbor
> > >  	 * enabled in 8023ad mode. Therefore, only clear broadcast_neighbor
> > > -- 
> > > 2.33.8
> > > 
> 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501950;
	b=p+X+NgOkkCmJBsUyO2ljL6LSZrKKTi8pZtMDuYsZWkYw9v1LHgCu4TVwPR6MLQsRRZjh
	 9sPUtD3hh1tRENHdzBrki6Kbtfk1gBMzxZ9Jhsq2E+Ad9aGU3KePrwRrXu66x3Gs47I6I
	 kAQ3V1x2VaA6hdPrzQAyvDq9t1icGZvl6DcMs58h2bHPC0mkAn6TeLAZCpevUI9lj29UQ
	 Q1pBCzn18joPie3+X6ClQUo1L9KXAWxFLpfJ0On6KgZ8QSbRg0yf6HWNptm5ceVs/AjxT
	 7GJ3KBCFrE1X/+PdKRjBzTBxhkU1swY5qGHm2PD98EKIYyTtRkFmv19yj1GG3EMEcjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501950;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eIsQJv9Oj9zGZmN+c0jrpc0IZPXKs0cvb4N1pTA7hAg=;
	b=tqi6qyC0l6hGhrLwjVyhfdg3nJPtfYGTxfbw/aDFlqgtF97yXqFihiavZSOGMFUYVjDA
	 hLectGh6m1Rs4zosW0cxJTF96JroIakW1KJb0zABHHTkCS52PbJqPya6SrC110o+RgyTP
	 HvtUanzCvsnp1FwpAhhU15GMihhGXzurftdpIlvIsYwtnxKHQeCA8Y7uYeYzVH2mhZNXz
	 e07BGnWC+zBXb0hUDVyc4cBK80k0bmM03OjSzmdiQIzzpCVYeN5hKepkcFUUt9PGleWoq
	 gtrtjXVhOFIakbkZA7/jfzPh5wo+n9Dy9PLsmGUvxFyeR8nY/HOJ/uH9oX94SbV/wkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FXirBR9n;
	arc=none smtp.remote-ip=91.218.175.150
Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A775606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A775606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FXirBR9n
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=coFYJTNAO2JCglWYtwvpj8VRSsxBhfxAQ3/CUjARS3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795501947; v=1; x=1796106747;
 b=FXirBR9nLD677/Dzg+KBSQfUH03GDT/LNfdHBSxrTugXy3OtDJ7sWeIt13hIbClZOc0Ej387
 XmhmPKt89gsl85Dq1u2YCeb7+wSvC9/QjF0KyfBAzez6B/OaYpweFfozzFFMVHnl300CdH9kdRH
 QiEh+UqddWAz/ohaeplaU6+I=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5948dfb6ee4b1eee;
	Tue, 24 Nov 2026 06:32:27 +0000
X-Mizu-Trace-ID: 5948dfb6ee4b1eee
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 14:32:22 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/1] bonding: keep non-Ethernet slaves out of
 802.3ad bonds
Message-ID: <20261124063222.GB14932@Liu-laptop>
References: <179549697473.218888.8044828119056769556@gmail.com>
 <179549697473.218888.6814133305133689781@gmail.com>
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
In-Reply-To: <179549697473.218888.6814133305133689781@gmail.com>

On Tue, Nov 24, 2026 at 02:13:03PM +0900, Kyuwon Cho wrote:
> bond_open() adds the 8-byte lacpdu_mcast_addr to every slave of an
> 802.3ad bond with dev_mc_add(), which copies the slave's addr_len bytes.
> A slave with a 16-byte address, such as an ip6tnl device, makes it read
> past the array:
> 
>   BUG: KASAN: global-out-of-bounds in __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>   Read of size 16 at addr ffffffff878a2940 by task test/114
>   Call Trace:
>    <TASK>
>    __hw_addr_add_ex (net/core/dev_addr_lists.c:102 net/core/dev_addr_lists.c:157)
>    dev_mc_add (net/core/dev_addr_lists.c:1036 net/core/dev_addr_lists.c:1054)
>    bond_open (drivers/net/bonding/bond_main.c:4405)
>    __dev_open (net/core/dev.c:1762)
>    __dev_change_flags (net/core/dev.c:10022)
>    netif_change_flags (net/core/dev.c:10087)
>    do_setlink.isra.0 (net/core/rtnetlink.c:3294)
>    rtnl_setlink (net/core/rtnetlink.c:3633)
> 
> Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
> devices") rejects such a slave only when enslaving it changes the
> bond's type. A bond keeps the type of its last slave after that slave
> is released, so a bond that once had an ARPHRD_TUNNEL6 slave can be set
> to 802.3ad and take another TUNNEL6 device. A slave that is itself a
> bond can also change its type after it was enslaved, when a
> non-Ethernet device is enslaved to it.
> 
> Check that an 802.3ad slave is an Ethernet device before the type
> handling, for every slave, and refuse NETDEV_PRE_TYPE_CHANGE for a
> slave of an 802.3ad bond, as team does for its ports. Other modes still
> allow the type change, as bond-eth-type-change.sh expects.
> 
> Fixes: c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet devices")
> Suggested-by: Jay Vosburgh <jv@jvosburgh.net>
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> ---
>  drivers/net/bonding/bond_main.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 776afdb9df43..cf67104777d0 100644
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
>  	/* set bonding device ether type by slave - bonding netdevices are
>  	 * created with ether_setup, so when the slave type is not ARPHRD_ETHER
>  	 * there is a need to override some of the type dependent attribs/funcs.
> @@ -1960,12 +1967,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  	 */
>  	if (!bond_has_slaves(bond)) {
>  		if (bond_dev->type != slave_dev->type) {
> -			if (slave_dev->type != ARPHRD_ETHER &&
> -			    BOND_MODE(bond) == BOND_MODE_8023AD) {
> -				SLAVE_NL_ERR(bond_dev, slave_dev, extack,
> -					     "8023AD mode requires Ethernet devices");
> -				return -EINVAL;
> -			}
>  			slave_dbg(bond_dev, slave_dev, "change device type from %d to %d\n",
>  				  bond_dev->type, slave_dev->type);
>  
> @@ -3992,6 +3993,10 @@ static int bond_slave_netdev_event(unsigned long event,
>  	slave_dbg(bond_dev, slave_dev, "%s called\n", __func__);
>  
>  	switch (event) {
> +	case NETDEV_PRE_TYPE_CHANGE:
> +		if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +			return NOTIFY_BAD;
> +		break;
>  	case NETDEV_UNREGISTER:
>  		if (bond_dev->type != ARPHRD_ETHER)
>  			bond_release_and_destroy(bond_dev, slave_dev);
> -- 
> 2.43.0
> 

The type change for other modes can be discussed later. The current change
targeting this issue looks good to me.

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

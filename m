Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503120;
	b=BZD+tz3892zW3kqSUB7USGP4CeQhf/6TwDqE+5e0g+RiZThGV/cht8TFYPVpyHwwausR
	 hPEpqc4DgXIqQtj8qStsMoGsA/3lgAvf7jDLbwSWpjojMkgSwyZG68iCzOKoilpEjTKfv
	 P3Rb/UJKrqNcNOLAbqQ+b/DZNFlS6ZPBt5IxAMjwEU/eIQo+EU0Erh4RZQFVO77b24cCZ
	 nMWMXsEGB08H6ZdAh1+5MgoKgIo3YpGzRXAUhQq8MnDHvx26zd2ZLp57Cs3znnYkomCwU
	 inSqmec5xCWJvcpuXH0se4bDyZYqphaveduF62QCeTlgxid38VrrxdHZbRazRudsgdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503120;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+TQgzbu7eki9ghahx9MmLJOAjgLfaobMZIU49rinkbg=;
	b=hK5w/pXulYszvajMrgcX/05vfwsa1S5cfXjwuqT6ISAb9ETBx1Nzk2QLVzjdP9AFXT9W
	 5iiGF4dYjC9cEiuTHMojsFEp0RdXtKCJFo6x6zBKEILc0iQ6Wmn+8wMQlV6kLYZ2JaJTF
	 pgZu+NFH9RLW4/OC8i2g1JWN9VJNc2OeDuQKfyvy0MB6y7rXxmnS8rhTb6FNeyyT9qwLv
	 1gpbkFTo5kpFwzTcX8iXMnV+9LMKmqHpjDcm8EcRdvHAj5nIeef30ydnTlAXUK3l1DWgm
	 IpueeIFVUUNWwRWzH71vNhEX65t9d+cDy219I/wA+qHyHBcVy0XBZxX9IImp2ACCX1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fmpHXC4r;
	arc=none smtp.remote-ip=91.218.175.159
Received: from mta0.migadu.com (out-159.mta0.migadu.com [91.218.175.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A29606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fmpHXC4r
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2VNXjrXER2Twx8s+CxDzcOf/vNM716Jpu07paukE/EU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795503117; v=1; x=1796107917;
 b=fmpHXC4rnHqfqX9Ca/U7SjntT8nkSqWWiGB3rwFSX4UkTOm+GI3IuiUxLLSnFPTLBgF94sWp
 itESCPZSZZG7hDfTEbSIR87Ihn9I8UWq4i4mcRSHprUnVyPOxxZ8U1zaLdWaT8tNeQksMRGgW67
 BUPR25YxBvzIchdNBSOXKDTc=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b2dea94989d3552c;
	Tue, 24 Nov 2026 06:51:57 +0000
X-Mizu-Trace-ID: b2dea94989d3552c
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 14:51:52 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH net] ipv6: mcast: do not pass uninitialized bytes to
 dev_mc_add()
Message-ID: <20261124065152.GD14932@Liu-laptop>
References: <20261123124458.205233-1-edumazet@kernel.org>
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
In-Reply-To: <20261123124458.205233-1-edumazet@kernel.org>

On Mon, Nov 23, 2026 at 01:44:58PM +0100, Eric Dumazet wrote:
> igmp6_group_added() and igmp6_group_dropped() build a link-layer
> multicast address in an on-stack buffer with ndisc_mc_map(), which
> fills a number of bytes depending on dev->type.
> 
> dev_mc_add() and dev_mc_del() then use dev->addr_len bytes of it.
> 
> Since IPv6 multicast joins and leaves no longer hold RTNL, dev->type
> and dev->addr_len can change between the two steps, for instance with
> TUNSETLINK, or when bonding or team change their type.
> 
> If addr_len grows (eg ARPHRD_ETHER -> ARPHRD_IP6GRE), dev_mc_add()
> copies uninitialized stack bytes into a netdev_hw_addr, which can
> later be dumped to user space by /proc/net/dev_mcast and
> RTM_GETMULTICAST.
> 
> Zero the buffers.
> 
> Found by Sashiko AI review of a tun patch, by code inspection only.
> Kernels built with CONFIG_INIT_STACK_ALL_ZERO=y are not affected.
> 
> Fixes: 1767bb2d47b7 ("ipv6: mcast: Don't hold RTNL for IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP.")
> Link: https://lore.kernel.org/netdev/179512665919.3136.5931555157250030152@kernel.org/
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
> ---
>  net/ipv6/mcast.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
> index ecef55f26189..bce7287ae709 100644
> --- a/net/ipv6/mcast.c
> +++ b/net/ipv6/mcast.c
> @@ -684,7 +684,10 @@ bool inet6_mc_check(const struct sock *sk, const struct in6_addr *mc_addr,
>  static void igmp6_group_added(struct ifmcaddr6 *mc)
>  {
>  	struct net_device *dev = mc->idev->dev;
> -	char buf[MAX_ADDR_LEN];
> +	/* RTNL might not be held: dev->type and dev->addr_len can change.
> +	 * Make sure dev_mc_{add|del}() do not use uninitialized bytes.
> +	 */
> +	char buf[MAX_ADDR_LEN] = {};
>  
>  	mc_assert_locked(mc->idev);
>  
> @@ -720,7 +723,10 @@ static void igmp6_group_added(struct ifmcaddr6 *mc)
>  static void igmp6_group_dropped(struct ifmcaddr6 *mc)
>  {
>  	struct net_device *dev = mc->idev->dev;
> -	char buf[MAX_ADDR_LEN];
> +	/* RTNL might not be held: dev->type and dev->addr_len can change.
> +	 * Make sure dev_mc_{add|del}() do not use uninitialized bytes.
> +	 */
> +	char buf[MAX_ADDR_LEN] = {};
>  
>  	mc_assert_locked(mc->idev);
>  
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

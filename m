Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338236;
	b=2Z/aCyv/4Bwp8HsdXzYHcOppYzESHfsUlAfLD6b5JVobU97cPIffQvJM097QE6aFsD8b
	 szUAPvEs2Opti4pxreI4bLm1epn91ebvKHbbluseEQKJBD+Mh3h/aJWdbZQ1RsM1/gicv
	 04WeRwXa4+aj2aGy8YKRz7HkVJGuzl3GcFyr6slJrtWk7SqqWuMVUuNjP6kEqzvoYdf8w
	 6tTUc6S+Xyq04tXA80doe1E6aKj0OcAv66iFXcA9dChXatR168RgfCpkEq/e0+AmGZT7C
	 KdW4dkkBmzMsfj1WTNUXT9n6XG+w30pixrbGKg3k/ngMORlWhZKt/tb3K87f5lXVdMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338236;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=Q1DhCDTvrKUFmV4rM/Yb4wzHSmQHrL4w1MRg2+vD0j0=;
	b=gObex5oVwwxYO3rCYV/g4TW0rqaTuj4WJUMCTF4KUuKHAj0ypRNNrtrijVJ7x2c/HKOM
	 UOFd9ZQHlELjSOM2i9/IazvglG8daBwDkmRqMslqyp+hMrS5V/Lq7r+Krp+afXxVm1NAM
	 uNCSKDeHDfUJYZY5iuAlw9QcEukIdxy+uRAyLY6PCll+PJ03nkOXBrhUSH3s8KG7USAM4
	 vUVX+RvUUw2ayIIAt8aFWoSxWMiuy4UXeGhAnIAVQIz3/8PyrSKqVqZKVy1gZvwYHeG/B
	 v9CZhYtIueBcad+wS98YZErqbeKKhjUba4zGVJpcwOWau6bHQGwW8QVau9ExGdZHPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=RX6VmKPt;
	arc=none smtp.remote-ip=195.10.208.50
Received: from mout-b-105.mailbox.org (mout-b-105.mailbox.org [195.10.208.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2574606A320;
	Sun, 22 Nov 2026 09:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2574606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=RX6VmKPt
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-105.mailbox.org (Postfix) with ESMTPS id 4jXNR671Tgz9tp8;
	Sun, 22 Nov 2026 10:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795338227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1DhCDTvrKUFmV4rM/Yb4wzHSmQHrL4w1MRg2+vD0j0=;
	b=RX6VmKPtGbdvpm4XjGhSxcXW1c6be+X9OvA6nlhrfuHFtgBU9yLjzEVWk8wvJlV1tlBaa4
	d3MTraQtUDtTq7pyktuxufS79T7uyzGoOnQSb+kuPRSTVIqQBLk0Y3pjx4GkF/yfD+3ms+
	Tl55gc1Ig1LsI1CNYGShiJ8JSw/EdOklEgsdnH6O2rBNnCrSsYVy1gwJ5EoBbrXuhMqrVT
	Dx4k83OyN5xWp40e9xKgjerPvxqB5IPwVZvzXkn5cSaELM067X//ESgOOcC8B/gf772sPN
	rY5Pa5bHx/ZGsVUr/Bd74ESx6eL2dGV5/eirbQJlysGlKNPXfGXuXiF+NzMtIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/4] ipv6: take fib6_sernum from a sequence shared by all netns
Date: Sun, 22 Nov 2026 10:03:34 +0100
Message-ID: <20261122090337.43949-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121-bug-net-netns-move-rcu-barrier-v5-2-100a3b5d9090@linux.dev>
References: <20261121-bug-net-netns-move-rcu-barrier-v5-0-100a3b5d9090@linux.dev> <20261121-bug-net-netns-move-rcu-barrier-v5-2-100a3b5d9090@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jXNR671Tgz9tp8

On Sat, 21 Nov 2026 18:21:20 -0500, Qiliang Yuan <qiliang.yuan@linux.dev> wrote:
> A per-cpu IPv6 route of a nexthop object records fib6_sernum of the
> netns it was created in, and rt6_is_valid() compares it with fib6_sernum
> of the netns its device belongs to when the route is checked. Every netns
> starts its fib6_sernum at 1 and increments it on each tree change, so
> different netns often hold the same value.
>
> When a device moves to another netns, such a route remains usable until
> nexthop_free_rcu() releases it, and fib6_info_destroy_rcu() queues that
> callback from inside an RCU callback, after the device has moved. If the
> fib6_sernum of the new netns matches the cached one in that window,
> ip6_dst_check() accepts the route and a socket in the old netns keeps
> sending through a device that now belongs to another netns.
>
> Take every fib6_sernum bump from one sequence shared by all netns, which
> only hands out values from 2 up, and have rt6_is_valid() reject 1, the
> value every netns starts with: fib6_add() publishes a route before it
> bumps fib6_sernum, so a route looked up in between can record 1. 0 still
> means there is no sernum to check. Any other value a route records was
> drawn from the sequence, which no other netns holds until it wraps after
> 2^31 bumps. fib6_new_sernum() callers only hold their own table's
> tb6_lock, so bumps of one netns can race. Publish each value with a
> cmpxchg on the fib6_sernum of the netns, drawing again if another bump
> changed it first. As before, this orders the routing change before the
> new value and the value before the nodes stamped with it, and keeps
> fib6_sernum monotonic per netns.
>
> A connected UDP socket in netns A caches a route through an IPv6 nexthop
> object on a veth. The veth is moved to netns B and brought up with one
> RTM_NEWLINK, then the socket sends 200000 datagrams. A route is added to
> and removed from B 0 to 20 times before the move, 63 trials:
>
>                                      before   after   change
>   trials sending after move (count)       3       0    -100%
>   datagrams sent after move (count)    6634       0    -100%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

Reviewed-by: Ralf Lici <ralf@mandelbit.com>

Thanks for picking this up.

-- 
Ralf Lici
Mandelbit Srl

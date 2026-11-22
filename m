Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386630;
	b=ei39oxZlbBUDODEPM8P1gyjQkrMKKdwE5sqfMUwARhirLqW9LZhZ4yOEMxEK5BP6GVv9
	 QlYOzOVeP3tXqIdlK45YEjdB2TA0zUZfiVhaVKPy7iZYIki2zj/p6hYfWmfzk5fhmMZh3
	 eaRPf1vgXjIc4ROohM3J5uN0d39YdaBnjdky/nTgfKTDDFt4Mho6upsAu2yLNJogJ/Mea
	 AcqMGStAI2H8juRfTkyGqVwzv0RzE8GT9IsY4OCacMoBNZjKmlXqb+PlGRms+H+1+3tFG
	 /9+pd9jHDWh6W9ItZAAeuNBlZK4jhPnMp0pT5e41TMZYiDo/eekFDN3GKL9u71U8wvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386630;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=df1EiFED+Ng8Vy98ChQa21Dqutb4xnhJtsqjG2a3KC4=;
	b=HNJst4k9OrtfeQACgZ9L4u0bVQCz5D9elsp+p7GrXul2EJImq1ZzsjPxMfUk3tVjQ9ma
	 KoYxMDgCfBSbOZhONnm0T/tXMkFi8O03GhztNZAhrpY7sZ6YKGlaxLWyZRY06EC7x045F
	 Kh4SgMg0jWS57fqa2Bw/co6oOK5F0zYfmzgLluxNJ1KWIhgezQAk/EgJgw8E5bB6WstKv
	 sHhYo6YL1JzFSmC+FIpzOq8o+gPMEeNqGH/GsOmxg7Itd/J9FK9W8zqgWcQA7FGunMQxl
	 maMYQ5brFBYWagLYDqp2Ul2P+/4uZOjv5zA9oRxgUD/jfvmNCOoJqBw4eS32r78HCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWQFOm9Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8575606A31D
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWQFOm9Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38FB1F000C0;
	Sun, 22 Nov 2026 22:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386630;
	bh=df1EiFED+Ng8Vy98ChQa21Dqutb4xnhJtsqjG2a3KC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EWQFOm9ZRnocwq9fo7ctTzYOT5zoX+ref3KTCEaKm8DWKcvnDO+wWSUGzVy8MgBbe
	 1LOyLzDIRfV61xR76yYNVlRv+ympRZNnaLmxi1d4w2t8QdUz3uZV6FT7EvdySIpVTC
	 XfjGMeP4dnD0dKltY5Ea9tyelg6Ubibuj2dVH3Y+t06LFrWEcdEJZg0n4wY+QPw3yD
	 4NA7+/26d4P8/zppXdesM4DRQivrq//dy03oS0LMj/AcUATcg5ZOgf5HPdURSp1kdq
	 IjHAoJDEKuWHI+r6Bq+1cDrSk+RzyyBZiUnd8pUvlFQpkIHgQbYd6BW08Td39RDeJ/
	 ffM7RMWX1NSSA==
Message-ID: <a31eccac-79fb-4fcd-81ea-243592f20c58@kernel.org>
Date: Sun, 22 Nov 2026 15:30:29 -0700
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC net-next 0/6] ipv6: validate dsts against the netns route
 generation
Content-Language: en-US
To: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>
Cc: David Ahern <dahern@nvidia.com>, Ido Schimmel <idosch@nvidia.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
References: <20261122222717.126333-1-dsahern@kernel.org>
 <20261122222717.126333-2-dsahern@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261122222717.126333-2-dsahern@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 3:26 PM, David Ahern wrote:
> From: David Ahern <dahern@nvidia.com>
> 
> An IPv6 dst has never carried the fib6 serial number it was created
> under. rt6_get_cookie() reads fn->fn_sernum through rt->from when a
> socket, dst_cache or xfrm bundle stores its cookie, so a FIB change
> that lands between the route lookup and the cookie capture is folded
> into the cookie and a stale dst looks valid. The only dsts stamped at
> creation are pcpu dsts of nexthop-object routes, which store the netns
> genid in rt->sernum.
> 
> Looking at this I found that rt_genid_ipv6() and the fib6 serial
> number are already the same counter: net->ipv6.fib6_sernum, which
> fib6_new_sernum() advances on every FIB change. fn_sernum is a per-node
> copy of it. So this series moves dst validation onto that counter, the
> way IPv4 uses rt_genid, instead of adding another one:
> 
>  1. Stamp every dst with the counter in ip6_dst_alloc() and validate by
>     comparison in ip6_dst_check(). Long-lived dsts (pcpu dsts of routes
>     with an embedded fib6_nh, and exception dsts) are re-stamped when a
>     lookup finds them again, otherwise they would stay invalid.
> 
>  2. ip6_link_failure() forced a new lookup by writing -1 to fn_sernum.
>     That no longer invalidates anything, so clear the failing dst's
>     sernum instead.
> 
>  3-4. Nexthop objects: factor out nh_has_f6i(), then bump the counter
>     when a nexthop used through a group is replaced, and when a member
>     is removed from a group.
> 
>  5. A new PMTU or redirect exception used to bump the counter, which
>     with (1) would invalidate every dst in the namespace. Do what IPv4
>     does in update_or_create_fnhe() and invalidate only the pcpu dsts
>     of the affected fib6_nh. Route dumps still need to see that an
>     exception was added to the root node, so add a per-table sequence
>     for that rather than inventing fn_sernum values the counter could
>     later issue again.
> 
>  6. Since nothing validates against fn_sernum any more,
>     rt_genid_bump_ipv6() no longer needs to walk every node of every
>     table. Make it an atomic increment like rt_genid_bump_ipv4(), and
>     drop the __fib6_flush_trees pointer. fn_sernum remains only for
>     route dump consistency, so nexthop, address and rule changes no
>     longer restart in-progress dumps.
> 

Ralf: This aligns with the direction I meant in my reply on October 13.


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707657;
	b=Fo23fhUT0b5kuldUXwLN5+vtKP26N88yoyZ7hyoPl7TxkXoQVlI8RUM7ghxShyWkRpk5
	 PonAwAMtrbWUl5CMPLb7/1lAPwrzyZjzs2WYFaYTc2M6TIQTbIbQxpVJ5A3ucwF09WjCV
	 KHm/n2BtOhAwvUNOJ/lDwcJGn9kOvKeRF1wdNEnzVvDBsIU6llAt0mSrqHn8TQHyVkuN3
	 i4yeHtdQCbmnp3RIyhhYFglsfLv4irJdikr62P8rCEXpKphD9X3/PcnoKypf89Wu9ZtgJ
	 AJh6EoPX+ZwLDI3cAW1gbj0DpUBJw+i+1kuKhesXAhiRsmPeoQScgV+dTClzAGMeLmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707657;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ogYCtgKgHVD13I4qsn1bL0KfpJN+Qrt66VctFGFBTn0=;
	b=KdsYUQthIZzST6a6tZ2qV4k00f7u1WaxC+QBNJ4hpnTnOpyL2PUOnWku0nkacVEENxO1
	 1jA0hN69nmwwD9QXPx2RKb2bqgR600Lv1kf40AsNXYUf39b8AGG/I1MzeNjUCKZRXDDGX
	 RUal+Ju9zdgn9Ah1BzCuSxKx7ekQ/A2Vuq/HYq4D5g6WvkESONQ/iI/5MuNPIfntCaivV
	 phpjI5lNrunTKBUds3cP2QPTwm9kBRVcexnWwkNgRIDFrWfhZejYQbFGeT7Vbb5AL6QUa
	 YDC2bYcZ/IQHuuUPBIkh6KGhakpZIPiAkTv2mr48MbXZmrEmgUotbqVlPDXXthGu7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgRqvd4D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786A9606A31C;
	Thu, 26 Nov 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgRqvd4D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C961F000C6;
	Thu, 26 Nov 2026 15:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707656;
	bh=ogYCtgKgHVD13I4qsn1bL0KfpJN+Qrt66VctFGFBTn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DgRqvd4DuyL7bqhpyf4IQIxmSzfh9P82XP3/b18DEX1KOFsZUg+8nba5urhLgyIpK
	 FOskC43QKlz6X7H1STKWpQbYSluhWUB7ei/UGl60hlR5jCqyAiz7YDr5wXx2gKnpWA
	 YFBOWaHGkB02BWJ4VlGwGh40TD9anqx0KVFv8NvfkNC/HOpAL53vRJqG7PK1qKcDnp
	 qBDkp+sjbV2b4eK+ONDJSOWel8pYfvLOIn37U10yLqIUa5f10StJySR46cVrrxKhYt
	 6h4f/9Oj1DoIPD0TxD/KkNtXmT+mM1NR8xNzT2KnRvoCg3LRAh7JF34x0i2P75XJni
	 yk7+i46FeCS1w==
Message-ID: <2c21814f-c378-44c8-a01b-1e1c0a7c037c@kernel.org>
Date: Thu, 26 Nov 2026 08:40:55 -0700
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
Subject: Re: [PATCH net] ipv6: advance the serial after rebalancing in
 fib6_ifup and fib6_ifdown
Content-Language: en-US
To: Ralf Lici <ralf@mandelbit.com>, netdev@vger.kernel.org
Cc: Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>,
 Sagarika Sharma <sharmasagarika@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Xia Yan
 <yanxia@cmss.chinamobile.com>, linux-kernel@vger.kernel.org
References: <20261126081353.55240-1-ralf@mandelbit.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261126081353.55240-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 1:13 AM, Ralf Lici wrote:
> fib6_ifup and fib6_ifdown update the node serial before calling
> rt6_multipath_rebalance. A lookup that runs between the two can select a
> nexthop using the old ECMP upper bounds and read the new serial as its
> cookie. The cached dst then passes dst_check although it was selected
> from the old state, until the next relevant change.
> 
> Update the serial after rt6_multipath_rebalance, so that it is published
> only after the routing state it describes. fib6_new_sernum allocates the
> serial with a fully ordered atomic_try_cmpxchg, which orders the
> rebalance before the serial update. The invalidation scope is unchanged:
> fib6_ifup still updates the node and its ancestors, fib6_ifdown only the
> node.
> 
> Validating dsts against the generation sampled before the lookup, as
> proposed in "ipv6: validate cached dsts against the netns route
> generation", relies on this order as well: a lookup that reads the new
> generation must also observe the routing change it describes.
> 
> Reported by Sashiko while reviewing an earlier version of this change.
> 
> Fixes: d7dedee184e7 ("ipv6: Calculate hash thresholds for IPv6 nexthops")
> Fixes: 4bc852006b62 ("ipv6: update route serial number on NETDEV_CHANGE")
> Link: https://lore.kernel.org/netdev/cover.1795642432.git.dahern@nvidia.com/
> Signed-off-by: Ralf Lici <ralf@mandelbit.com>
> Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>
> ---
> Split out of v5 of "ipv6: tie dst validation to the lookup that
> returned the dst", which is withdrawn in favour of the series in the
> Link above:
> https://lore.kernel.org/netdev/cover.1795537128.git.ralf@mandelbit.com/
> 
>  net/ipv6/route.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: David Ahern <dsahern@kernel.org>



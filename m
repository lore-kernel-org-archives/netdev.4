Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101736;
	b=2IS6uVLnorIc3KaMB7xkrJ0FNz6v2zXz70qC75FHegnfmlaFkzQEWC7F7fXP2pBThMi6
	 asVSYTlZIaDnClSMmbjQSJ3DcGFZZsjfKRd0ouzwBxbAglSscJgMcrtZbxwOUjUBYJ6bT
	 QaiaGH7KHW6wJItCvd3toaFae1bdUXRuTlN0URTvVkbA2MjK0RFlX6ymkdnhcXBuuhmCP
	 0bQsAvRCPWZPWQwC0v5KQZnbnhkbNJRB/zW2NlaLpU4a7T38RU+xvebo59lyg2htGcvK0
	 4swbL7Q9PzTDYr5zJkaprGEPJMuK6NE2ujH1/t5qZejLTYbq3JfoOYa/4oQV6+/L7Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101736;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WOBMgTjD1aH3/vBF1uqNQyOfNqHdGqc6ZU6xHbMB52w=;
	b=ElVqspWpTbEPBchrT7joaC/kUlwjS/eCbzfqksQ+T7gED9Hn49aR1PNVEYr5S6MJ14KB
	 0sSmA2EBkEXsJptz+5cEcOikRT9QU0I6P+5+w1Ti3vU5OKeMux1rOxULKV7nLFao4WMVD
	 lCsT+/VRmP5o0A/q1oYBuyEuBuTceryk+wUzsE1gI/TE5QPToFJUxX7p2zsqhciVNx0Sw
	 fC9sa17C4Ad7XfftUbwS4Cpjlka+okBqJCXaD7OF40tSbGmK/qf0UNABJyidQvcIr40WU
	 5sljiSaCzkxxwkaDWbkObRVVBbqD/XEBXnh02/XwO75jTeBSNDSWBqbD3i3IwK3N3Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcYqImOI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76B606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcYqImOI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B365F1F000C5;
	Thu, 19 Nov 2026 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101736;
	bh=WOBMgTjD1aH3/vBF1uqNQyOfNqHdGqc6ZU6xHbMB52w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZcYqImOI7FiKGWp6SM7L6K/8skRpDG/UrKweTILu1pcpChZLG9MeT4Obygq9W215r
	 AQ2oE6fFA5unrCEZG8+k212mrcFEF3vtvsstFHdPOokJt9PEepnoHikGspTcRqqAcZ
	 qoP92dw+LzWBUoRmFwns0vDhiMt7DhwV2MtnZDh7bj1RlYltC+XUd95XGmrUz2tDLd
	 rkYHdvTRlpNTIBvyCW8Dc4UTfQ2INM99oFRAXNhevl1YkM4mx4w+cdsOlQ7plX1zze
	 P6cpI5Zm8GzjHoHiAfZGenWxKEVueTg9XyPnXUGXzAheFFNM7hmlkDiNRaTNY7inTF
	 EJsXab8Ervo1Q==
Message-ID: <9315f508-0db9-42a5-9684-0b8e5c7d528f@kernel.org>
Date: Thu, 19 Nov 2026 08:22:14 -0700
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
Subject: Re: [PATCH v1 net 7/8] tcp: Pass inet_sdif() to
 __inet_lookup_established() in tcp_v4_err().
Content-Language: en-US
To: Kuniyuki Iwashima <kuniyu@google.com>, Eric Dumazet
 <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@gmail.com>
References: <20261117053543.84032-1-kuniyu@google.com>
 <20261117053543.84032-8-kuniyu@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261117053543.84032-8-kuniyu@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 11:35 PM, Kuniyuki Iwashima wrote:
> tcp_v4_err() passes 0 sdif to __inet_lookup_established().
> 
> So, ICMP error coming from VRF can be leaked to a socket not
> bound to the device.
> 
> For example, this test fails at the last assert because the
> socket receives ICMP error:
> 
>   --ip_version=ipv4
>    0 socket(..., SOCK_STREAM|SOCK_NONBLOCK, IPPROTO_TCP) = 3
>   +0 connect(3, ..., ...) = -1 EINPROGRESS (Operation now in progress)
>   +0 > S 0:0(0) <...>
>   +0 `ip link add vrf0 type vrf table 10`
>   +0 `ip link set vrf0 up`
>   +0 `ip link set dev tun0 master vrf0`
>   +0 `ip route add 192.0.2.0/24 dev tun0 table 10`
>   +0 < icmp unreachable port_unreachable [0:0(0)]
>   +0 %{ assert tcpi_state == TCP_SYN_SENT, tcpi_state }%
> 
> Let's pass inet_sdif() to __inet_lookup_established().
> 
> Fixes: 3fa6f616a7a4 ("net: ipv4: add second dif to inet socket lookups")
> Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---
> Cc: David Ahern <dsahern@kernel.org>

just this one is needed.

> Cc: David Ahern <dsahern@gmail.com>
> ---
>  net/ipv4/tcp_ipv4.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: David Ahern <dsahern@kernel.org>



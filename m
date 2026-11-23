Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467647;
	b=h8Ln5gPsD0BncuG5sksnjvzR/M01JyugA21sZSfZfgX7/X20mJ0kLYX9SMWsJyFfhF8V
	 90hdwJJ/DhEF0HopyAkU4j2lELEFQrbl/Eoxwt2RUhHor1rcPXz8unVLVLgXliXKW9QOf
	 XMSYrinF9iZs5UrRBzc8rS4FmhnX00eRx7ER0dKhlosxp941AlJLamhngmMQYangEuoOB
	 qb7MuXAk89wWwk61/4mOMCzUwM/OEb35ltj9kKgsGwlsRuLSn6P+0ATOOGMObgPv08CNO
	 /zdwe6oogKX8h1G56WS/dZB96jRU1cm3ieh5ecl9ldxD21IexvDDyzKYHB6Gn56ROIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467647;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=n0OlGyNCtS+IVqupZWPwYf/nHNYmLZNNhAUFHnKyxsw=;
	b=xQ6rVOV5PSbAVYJ1ur2DN7S0j1TVvKrKEBANUHskRgLuIloAdsn7q9dHW6j7yrk+bngc
	 oMz9Fic6iNwFsrwlXcH/pG0M5XMx3xYAyTjIelzIYiWeDHPE4KyUbIkRkDbf2A3yebOuH
	 47ds9VZr3UFaegyqrblvChxtkSturNC/mYMaU7o6Mwv15DMxxcn4qih24G9l0p8YuH3j9
	 aPGZ8DfWrM511/7iwv7MGAmpRbSbrAnhzGqtx0wBBiH+O/qwyjx1x0tu532tcpXuLHcXg
	 9t79L2gwtplWmvgIoW+YE8eK7pCNa+gwpzSQvKPzhWezAbswZCUqePcadVggXnNyjeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2DtdOgS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D3E606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2DtdOgS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531A21F000C4;
	Mon, 23 Nov 2026 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467646;
	bh=n0OlGyNCtS+IVqupZWPwYf/nHNYmLZNNhAUFHnKyxsw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y2DtdOgSdfRw8MlPH7tKDgDzhZu4u7/ihoINLLzE/eDdvrghVV7SOwGna65k972Dn
	 IXq6S+WF56wuIfXRIyy2liMhf38lCS6SZbvtQLrAt5nYLo/U0s7qHS7PIJX6U0/RHs
	 86EcybzJzETF4qAZSbtjMVVTd9CKv3mzWAy7ps33KSYz40oQT5kBVfYT22qAb2vg8b
	 YMckI32uor5I26ugmQTKYTMXckvgmty0Rhu86J1Swbyviunj65yc6m+VP+XjTHQpQT
	 dPBiWjK10sSczjn4LyvR7dZtOXsjBdoh/Oy0x0j0XOgHF3hZTwkDAMUVBjknr05pNs
	 54Zk+P2TR7A0w==
Subject: Re: [PATCH net] udp: preserve explicit sk_bound_dev_if across
 __udp_disconnect()
From: netdev-bot+sashiko@kernel.org
To: dmnk@google.com
Cc: willemdebruijn.kernel@gmail.com, edumazet@kernel.org, kuniyu@google.com,
 pabeni@redhat.com, davem@davemloft.net, kuba@kernel.org, horms@kernel.org,
 dsahern@gmail.com, netdev@vger.kernel.org, dmnk+artist@google.com
Date: Mon, 23 Nov 2026 21:00:45 +0000
Message-ID: <179546764586.3135.7708187711251172412@kernel.org>
In-Reply-To: <20261119192138.2635070-1-dmnk@google.com>
References: <20261119192138.2635070-1-dmnk@google.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new SOCK_CONNECT_IFINDEX flag only records a 0 -> non-zero
  change of sk_bound_dev_if.
- [Medium] The patch adds a read-modify-write of sk->sk_userlocks
  (`sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX`) in __udp_disconnect().

--

udp: preserve explicit sk_bound_dev_if across __udp_disconnect()

This patch adds a SOCK_CONNECT_IFINDEX flag to sk_userlocks.
__ip6_datagram_connect() sets it when a scoped connect() changes
sk_bound_dev_if from 0 to non-zero. __udp_disconnect() then resets
sk_bound_dev_if only when that flag is set, so bindings from
SO_BINDTODEVICE, scoped bind() or cgroup BPF survive an AF_UNSPEC
disconnect.

[ ... ]

> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index 2e5562f353f85..4943afe9a9c29 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -2190,7 +2190,10 @@ int __udp_disconnect(struct sock *sk, int flags)
>  	WRITE_ONCE(inet->inet_daddr, 0);
>  	inet->inet_dport = 0;
>  	sock_rps_reset_rxhash(sk);
> -	WRITE_ONCE(sk->sk_bound_dev_if, 0);
> +	if (sk->sk_userlocks & SOCK_CONNECT_IFINDEX) {
> +		WRITE_ONCE(sk->sk_bound_dev_if, 0);
> +		sk->sk_userlocks &= ~SOCK_CONNECT_IFINDEX;

[Severity: Medium]
Is this read-modify-write of sk->sk_userlocks safe without the socket
lock?

For raw6, ping6 and l2tp_ip6 sockets, an AF_UNSPEC disconnect reaches
this code without lock_sock():

inet_dgram_connect()
    if (uaddr->sa_family == AF_UNSPEC)
        return prot->disconnect(sk, flags);

rawv6_prot and pingv6_prot set .disconnect = __udp_disconnect directly.
l2tp_ip6_disconnect() also calls __udp_disconnect() without taking the
lock.

Their connect path, ip6_datagram_connect()->__ip6_datagram_connect(),
runs under lock_sock() and can set SOCK_CONNECT_IFINDEX. So this new
write can happen on those sockets.

Every other writer of sk_userlocks holds the socket lock. Examples are
__sock_set_rcvbuf() setting SOCK_RCVBUF_LOCK, the SO_SNDBUF and
SO_BUF_LOCK handling in sk_setsockopt(), and sock_bindtoindex_locked().

Suppose setsockopt(SO_RCVBUF/SO_SNDBUF/SO_BUF_LOCK) and
connect(AF_UNSPEC) run at the same time on the same socket. Can one of
the updates be lost? That could drop a SOCK_*BUF_LOCK bit. It could also
leave SOCK_CONNECT_IFINDEX set while sk_bound_dev_if is 0.

Testing the flag and clearing sk_bound_dev_if are also not atomic with
respect to sock_bindtoindex_locked().

Before this patch, __udp_disconnect() only read sk_userlocks. The
lockless disconnect callbacks already existed, but this write is new.

> +	}
>  	if (!(sk->sk_userlocks & SOCK_BINDADDR_LOCK)) {
>  		inet_reset_saddr(sk);
>  		if (sk->sk_prot->rehash &&

[ ... ]

> diff --git a/net/ipv6/datagram.c b/net/ipv6/datagram.c
> index ff7a7ffbf9833..36581c6d39ca5 100644
> --- a/net/ipv6/datagram.c
> +++ b/net/ipv6/datagram.c
> @@ -240,6 +240,8 @@ int __ip6_datagram_connect(struct sock *sk, struct sockaddr_unsized *uaddr,
>  			err = -EINVAL;
>  			goto out;
>  		}
> +		if (!old_bound_dev_if)
> +			sk->sk_userlocks |= SOCK_CONNECT_IFINDEX;
>  	}

[Severity: Medium]
What happens if the socket is already bound to a VRF (L3 master) device
and connect() passes the ifindex of a device enslaved to that VRF?

Earlier in __ip6_datagram_connect(), sk_dev_equal_l3scope() accepts the
slave ifindex because its L3 master matches the current binding. The
binding is then overwritten:

	if (addr_len >= sizeof(struct sockaddr_in6) &&
	    usin->sin6_scope_id) {
		if (!sk_dev_equal_l3scope(sk, usin->sin6_scope_id)) {
			err = -EINVAL;
			goto out;
		}
		WRITE_ONCE(sk->sk_bound_dev_if, usin->sin6_scope_id);
	}

In that case old_bound_dev_if is the VRF ifindex, so the flag is not
set. On connect(AF_UNSPEC), __udp_disconnect() skips the reset, and
sk_bound_dev_if stays at the slave ifindex.

The sequence would be:

1. sk_bound_dev_if is the VRF master, set by the cgroup BPF hook used by
   ip vrf exec or by SO_BINDTODEVICE
2. connect() to fe80::x%slave1 sets sk_bound_dev_if to slave1, and the
   flag stays clear
3. connect(AF_UNSPEC) leaves sk_bound_dev_if at slave1

So the explicit VRF binding is not kept, and the connect-time binding is
not undone either.

After this, a connect() to a link-local peer on slave2 of the same VRF
fails with -EINVAL, because slave1 is not slave2's L3 master. Before this
patch that connect() worked, because disconnect reset the binding to 0.

An unprivileged user also cannot get the VRF binding back.
sock_bindtoindex_locked() requires CAP_NET_RAW once sk_bound_dev_if is
non-zero.

A single flag cannot restore an earlier non-zero value. Could the
previous ifindex be saved instead? Alternatively, connect() could leave
an existing L3 master binding in place.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119192138.2635070-1-dmnk%40google.com

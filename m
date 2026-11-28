Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827334;
	b=uZcws+Kqa4eEmYW3a8qQtWmEEZ7uVlwnP+XQ1Kcjq9iXaGVb7dWM7TChCCzAT+G3WpSs
	 J65YpCXUmOQlFPTG2JBIWsO90BRe29pv9qHy0HRgbvqVps9/c3hII9aUIF4U8RHtUi4oN
	 ms5S9Gb5Kw+V50siXvOgZJ4YRQ4uHjcVfk/+Hp05+o79QDqs3VMAfMourdGG8Hn/jsA/Q
	 SS9MYeDf3A8JDk3lg/yc6r/tmazMHlCEwIgY/NsphO0Z6/xFpcu6stvZhlpY21LCyaXGP
	 Bn9GkPgpASUC3ZBz1Fexz1OPHmay9op3AzsU9f724CH2DOr3d4KqDbcZDc7yYp3k9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827334;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZTOhxoKU8GUiGexTUj7cLrGVt1cdN9yy2b0AR3Jjovw=;
	b=z2uYfqO2fx8QV6DoNtFkY1XMxrOQzqZFvuIIfYrAP2jle3NtSRa2SiHP2UKIxnt5VYiR
	 8fdiUo7FIhW+2s7caHBhfvBgwT7+LZZ/kLy/EybLFce/VdzNRsp2iJHszqPWDGSZp7tG3
	 HGWVZgR2HsUvEKz1hSg3EmM0etDD3qGe90AW9eLsCuDbV1Y7YmywiRQkJIDanY1UYtRhp
	 8GrLnRQ2VrhDSaa0G9+9lyFOT69Cq+DmZMgTHzZfujNXURlQF7CSIFeAOWHqfsyXDNKAd
	 Q3WHNKC6yP79Z5sB80owb5m74FYeokIAA3rtotq4pjsgnjxwBgV2WTN5flUdwZWUR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbzUbAGS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE6D606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MbzUbAGS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E7D1F000C1;
	Sat, 28 Nov 2026 00:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795827333;
	bh=ZTOhxoKU8GUiGexTUj7cLrGVt1cdN9yy2b0AR3Jjovw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MbzUbAGSnJLIVDEQxpq55oC2qqNtzEgdToiofIHJDGCQy3HMth3mBnwOuEJaSsbJk
	 6kyuTU+BkBrnBctlUYXvZBw5fbE062n9U8MEWpEjEOgbgm1wb2ig6Ba8ZN/mbZiZau
	 JArr2uf9nd4Qti9ZlF628SiViyoL9DvHcrCZaIZBmKv0IVfFSJKvZPj+p3GL+kaH7w
	 x6jkqLRmujQwOSEYm4/OPR6fqMN5ilBZkSbejwkjED4bhC+Kc+6OxpwVj054Nat5Nk
	 d6/vd84pJGIph+Yaq+0NUY6oliwi9I+VcSZev8koOcYg9ZMnSN/apw/tsk5H/fw7lt
	 hraFtPwmhZBwA==
Subject: Re: [PATCH net v2] inet: reject multicast and broadcast bind
 addresses on SOCK_STREAM
From: netdev-bot+sashiko@kernel.org
To: dmnk@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, dsahern@kernel.org, idosch@nvidia.com,
 ncardwell@google.com, kuniyu@google.com, horms@kernel.org,
 joannelkoong@gmail.com, netdev@vger.kernel.org, dmnk+artist@google.com
Date: Sat, 28 Nov 2026 00:55:32 +0000
Message-ID: <179582733273.3135.9459901181747092692@kernel.org>
In-Reply-To: <20261124180601.71719-1-dmnk@google.com>
References: <20261124180601.71719-1-dmnk@google.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix leaves the bind-conflict bypass it targets reachable
  through the missing-FIB-table RTN_BROADCAST fallback.
- [Low] The commit message presents the IPV6_ADDR_MAPPED hunk in
  __inet6_bind() as part of the bhash2 bind-conflict fix, but the…

--

inet: reject multicast and broadcast bind addresses on SOCK_STREAM

This patch rejects IPv4 multicast, limited broadcast and FIB-confirmed
subnet broadcast bind addresses on SOCK_STREAM sockets, in __inet_bind()
and in the v4-mapped branch of __inet6_bind(). The aim is to stop
tcp_v4_connect() from moving a socket that has inet_rcv_saddr set and
inet_saddr cleared into a unicast bhash2 bucket without a bind conflict
check. A new helper, inet_addr_is_mcast_or_bcast(), re-checks
RTN_BROADCAST results against the FIB so that binds hitting the
missing-table fallback are not rejected.

> diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
> index 8c123b111b3d8..5968aa29f4abb 100644
> --- a/net/ipv4/fib_frontend.c
> +++ b/net/ipv4/fib_frontend.c
> @@ -289,6 +289,30 @@ unsigned int inet_addr_type_dev_table(struct net *net,
>  }
>  EXPORT_SYMBOL(inet_addr_type_dev_table);
>  
> +bool inet_addr_is_mcast_or_bcast(struct net *net, u32 tb_id, __be32 addr,
> +				 unsigned int addr_type)
> +{

[ ... ]

> +	rcu_read_lock();
> +	tb = fib_get_table(net, tb_id);
> +	if (tb && !fib_table_lookup(tb, &fl4, &res, FIB_LOOKUP_NOREF))
> +		is_bcast = res.type == RTN_BROADCAST;
> +	rcu_read_unlock();
> +	return is_bcast;
> +}

[Severity: High]
Can the bhash2 bypass still be reached through the missing-table
fallback?

With CONFIG_IP_MULTIPLE_TABLES, fib4_rules_init() only installs rules.
RT_TABLE_LOCAL is created later by fib_new_table() from fib_magic(), when
the first address or route is added (for example when lo comes up). Until
then, __inet_dev_addr_type() returns its default for any non-multicast
address:

net/ipv4/fib_frontend.c:__inet_dev_addr_type() {
	unsigned int ret = RTN_BROADCAST;
    ...
	table = fib_get_table(net, tb_id);
	if (table) {
		ret = RTN_UNICAST;
    ...
}

In that window this helper sees tb == NULL and returns false, so
__inet_bind() allows the bind. The v2 notes say this is intended.
inet_addr_valid_or_nonlocal() also accepts RTN_BROADCAST. That means any
address X can be bound, including a nonlocal one, without IP_FREEBIND or
ip_nonlocal_bind.

However, the later step in __inet_bind() still uses the raw chk_addr_ret:

	inet->inet_rcv_saddr = inet->inet_saddr = addr->sin_addr.s_addr;
	if (chk_addr_ret == RTN_MULTICAST || chk_addr_ret == RTN_BROADCAST)
		inet->inet_saddr = 0;  /* Use device */

This leaves the TCP socket with inet_rcv_saddr = X and inet_saddr = 0.
That is the state the commit message names as the root cause.

Once networking is configured, another user can exclusively bind
127.0.0.1:PORT with no conflict, because X is a different address. A
later connect from the first socket then runs:

tcp_v4_connect()
    if (!inet->inet_saddr) {
        err = inet_bhash2_update_saddr(sk,  &fl4->saddr, AF_INET);
    __inet_bhash2_update_saddr()
        relinks sk into the (PORT, 127.0.0.1) bhash2 bucket
        without calling inet_csk_bind_conflict()

Is this the same port takeover the commit describes for 224.0.0.1?

There is also a narrower variant: a race between the two separate FIB
lookups. If a subnet broadcast route is removed between
inet_addr_type_table() and this helper, the helper returns false. The
stale chk_addr_ret still clears inet_saddr.

Could __inet_bind() use one classification for both decisions? For
example, on SOCK_STREAM it could clear inet_saddr only when the address is
confirmed multicast or broadcast, and treat the missing-table fallback as
unicast. Another option is to run a conflict check when connect rewrites
the source address.

> diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
> index a9b8b4b42a1af..2b5d5ee9d0dfe 100644
> --- a/net/ipv6/af_inet6.c
> +++ b/net/ipv6/af_inet6.c
> @@ -322,6 +322,13 @@ int __inet6_bind(struct sock *sk, struct sockaddr_unsized *uaddr, int addr_len,
>  		/* Reproduce AF_INET checks to make the bindings consistent */
>  		v4addr = addr->sin6_addr.s6_addr32[3];
>  		chk_addr_ret = inet_addr_type_dev_table(net, dev, v4addr);
> +		if (sk->sk_type == SOCK_STREAM &&
> +		    inet_addr_is_mcast_or_bcast(net,
> +						l3mdev_fib_table_rcu(dev) ? : RT_TABLE_LOCAL,
> +						v4addr, chk_addr_ret)) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}

[Severity: Low]
Is this hunk needed for the bhash2 fix described in the commit message?

On the v4-mapped path, __inet6_bind() later does:

	inet->inet_rcv_saddr = v4addr;
	inet->inet_saddr = v4addr;

It never clears inet_saddr for multicast or broadcast. When
tcp_v6_connect() passes a mapped destination to tcp_v4_connect(),
inet_saddr is non-zero. So tcp_v4_connect() takes the sk_rcv_saddr_set()
branch, not inet_bhash2_update_saddr().

The route lookup in ip_route_output_key_hash_rcu() also rejects such a
source:

	if (fl4->saddr) {
		if (ipv4_is_multicast(fl4->saddr) ||
		    ipv4_is_lbcast(fl4->saddr)) {
			rth = ERR_PTR(-EINVAL);
			goto out;

A non-local source such as a subnet broadcast address also fails there
without FLOWI_FLAG_ANYSRC.

So this change seems to only add a new -EINVAL for binding
::ffff:<mcast/bcast> on TCP, for consistency with the native IPv6 check.
Could the commit message say that? Right now it presents this hunk as part
of the bypass fix that goes to stable under the Fixes: tag.

>  		rcu_read_unlock();
>  
>  		if (!inet_addr_valid_or_nonlocal(net, inet, v4addr,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124180601.71719-1-dmnk%40google.com

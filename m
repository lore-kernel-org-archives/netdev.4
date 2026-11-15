Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732994;
	b=FDsRHFXq4+/9AzyQ1O60TCzb4kLDX8S1UoFL1L6HZuvOyAqRpcNmsl7PlULranM2Zsrq
	 EIDPAllGSHHzPmMd/hmHv5U86DdYdA+At3/DMT381UMd5/S7+68P3S4qxsAPk4BuCqePQ
	 bs0QXOn+5zCLEmP01dd29lE6Kxo1wmT+JMonPrmMT3/37F9lMVnTkvrGq9oPxtdp5szjc
	 rKxxM67STDVNJ99O88OyS0F9K2IVKommO67wQWBayvObQxe90B0w0F+Y2gJMcnUyptieR
	 kEzedew5hr1vCJg3sBqKTleCM8WZZVImRm0/YJ9Ypq0q44LrfvkmuRjiNXnL0oaQvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732994;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hZutrCgrHp+HfKt1eaWw1kaNR+voSV9Gbn2B4Nn674s=;
	b=sHqBHR59RFx6TvcRDdqAWJTEu+ljopSiVXrssxct0CQKSHmZHzibck7G9YbZgZR6+g0S
	 u0K/LWfVHCcDN9+9aGGh9Wmnw4RUbM90lswZGBEpSNTiaVr4Tkiw0kAMhjdbyHpBBrsDd
	 CIf0thbD/stSdAuvuJUAGXCbNcUtu7KSiCuod0RNcTFgzdITuC8BdSdoqT8tJe4BNwCnK
	 eaNPyDqj+JNdZ1jmNi8Ctgwenm2iIDt9GrvtAnSeIrN592rJcYRdBZlxpABaJoTDFI+gL
	 OEyeK6Qm0lBLngeXNqOS6desZz9c+YEwas5EH1QBK8lwOd/7CIgg8K9m/iK/1EyzXQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRgNKMA7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982B606A32D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRgNKMA7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EED1F000C5;
	Sun, 15 Nov 2026 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732994;
	bh=hZutrCgrHp+HfKt1eaWw1kaNR+voSV9Gbn2B4Nn674s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lRgNKMA7JJMdxp4FPHSJCFpnuTfWW7I348qFqJemuv7VpVrQkmO4wH2SX4rDpmxV2
	 RssQcef8v/ip34HWPc2f+1QPiFNCUJHFUir0at5eQU/f967GHbKWQQBst49cpPy3xQ
	 d9QIWdAAoF+hdfG6lTTM1mitZ0O5EumMErCoLp1hxbjrzegWjumx3KcH7tAsOee4nb
	 2sGm5RJAwFyt4oEEusxL9EZA4c7T2R7YQmj7Rg/usdQYeOj5KopQeWlVchsHrxsOr+
	 jaxrPk5yS0jFDtVRe+nmOprNeJzJEJBEdwgsvob6b5erdIbozYq+y7ipG8hb/9QkZV
	 VItKbY5O4Qn8g==
Subject: Re: [PATCH net-next v2 3/3] ipv6: use the lookup cookie when caching
 the dst in sockets
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 sd@queasysnail.net
Date: Sun, 15 Nov 2026 08:56:33 +0000
Message-ID: <179473299346.2199510.11559140714770152951@kernel.org>
In-Reply-To: <43917b9119e13e54dcde0e2941d3f4a1fe255df7.1794384146.git.ralf@mandelbit.com>
References: <43917b9119e13e54dcde0e2941d3f4a1fe255df7.1794384146.git.ralf@mandelbit.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Incomplete fix: on the TCP side only tcp_v6_connect() was
  converted.
- [Medium] The same bug class remains in the SCTP per-transport dst
  cache.
- [Low] The commit fixes a user-visible security problem: 'a socket that
  should be using IPsec keeps sending plaintext until the FIB changes…

--

ipv6: use the lookup cookie when caching the dst in sockets

This commit changes tcp_v6_connect(), ip6_datagram_dst_update() and
ip6_sk_dst_lookup_flow() to store the cookie returned by
ip6_dst_lookup_flow_cookie(). Before, they read rt6_get_cookie() after
the route and xfrm lookup. It adds ip6_dst_store_cookie() for this, and
ip6_dst_store() stays as a wrapper that still reads the cookie after the
lookup.

> Store the cookie returned by ip6_dst_lookup_flow_cookie instead. Add
> ip6_dst_store_cookie for this and keep ip6_dst_store for callers that
> have no lookup cookie.
>
> Signed-off-by: Ralf Lici <ralf@mandelbit.com>

[Severity: Low]
This isn't a bug, but should this have a Fixes: tag and Cc: stable? The
commit message describes a socket that "keeps sending plaintext" when it
should be using IPsec.

The patch also calls ip6_dst_lookup_flow_cookie(). That helper comes from
the previous patch in the series ("ipv6: add ip6_dst_lookup_flow_cookie"),
which also changes ip6_dst_check() behaviour for nexthop-object dsts. So
this patch can't be backported on its own. Could the dependency be noted
for stable?

> diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> index 95f936be32c6c..2684f6069a5e1 100644
> --- a/include/net/ip6_route.h
> +++ b/include/net/ip6_route.h

[ ... ]

> @@ -266,8 +266,16 @@ static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
>  #endif
>  }
>  
> +static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
> +				 bool daddr_set,
> +				 bool saddr_set)
> +{
> +	ip6_dst_store_cookie(sk, dst, rt6_get_cookie(dst_rt6_info(dst)),
> +			     daddr_set, saddr_set);
> +}

[Severity: High]
Is the TCP side of this fix complete? The commit message says this
"affects TCP and connected UDP sockets alike", but tcp_v6_connect() is
the only TCP path converted. Other TCPv6 paths still call
ip6_dst_lookup_flow() and then ip6_dst_store(), so they still read the
cookie after xfrm_lookup_route() has returned.

Here is inet6_csk_route_socket() in net/ipv6/inet6_connection_sock.c:

	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);

	if (!IS_ERR(dst))
		ip6_dst_store(sk, dst, false, false);

inet6_csk_xmit() reaches this whenever __sk_dst_check(sk, np->dst_cookie)
fails. inet6_csk_update_pmtu() also reaches it through
tcp_v6_mtu_reduced(), and a remote peer can trigger that path with
ICMPv6 Packet Too Big.

inet6_sk_rebuild_header() in net/ipv6/af_inet6.c has the same
lookup/store pair. It is ipv6_specific.rebuild_header, and tcp_connect()
calls it right after tcp_v6_connect(). Suppose
ip6_dst_lookup_flow_cookie() saw the generation move and returned cookie
0. Then __sk_dst_check() fails immediately, and the lookup is redone
through the unconverted path inside the same connect() call. The
retransmit path also reaches inet6_sk_rebuild_header().

tcp_v6_syn_recv_sock() in net/ipv6/tcp_ipv6.c gets its dst from
inet6_csk_route_req(). That function calls ip6_dst_lookup_flow() without
capturing a cookie. tcp_v6_syn_recv_sock() then runs
tcp_create_openreq_child() before it does:

	ip6_dst_store(newsk, dst, false, false);

So every passively opened IPv6 TCP socket has the same window.

An xfrm policy insertion goes through
rt_genid_bump_ipv6()->__fib6_flush_trees(), which invalidates every
cached socket dst. Established sockets therefore re-route through
inet6_csk_route_socket() right after a policy change.

Suppose another policy is inserted during that re-lookup, which can
happen when an IKE daemon installs several policies back to back. Can
the plain route then be cached with the post-insertion serial? If so,
inet6_csk_xmit() would keep accepting it and send plaintext.

The commit message says ip6_dst_store is kept "for callers that have no
lookup cookie". Each of these callers does its own ip6_dst_lookup_flow(),
though, so each could use ip6_dst_lookup_flow_cookie() with
ip6_dst_store_cookie(). For the passive-open path, inet6_csk_route_req()
would need to return the cookie.

The kernel-doc of ip6_dst_lookup_flow_cookie() also says "A caller caching
the dst should use this cookie when validating it with dst_check."

[Severity: Medium]
Does the same window remain in the SCTP per-transport dst cache?
sctp_v6_get_dst() in net/sctp/ipv6.c does its route and policy lookup
through ip6_dst_lookup_flow() and stores the result in t->dst. Only after
that does it read the cookie:

	rt = dst_rt6_info(dst);
	t->dst_cookie = rt6_get_cookie(rt);

sctp_transport_dst_check() later validates t->dst against that cookie.
If an xfrm policy insertion restamps fn_sernum between the lookup and
this read, could an SCTP association over IPv6 keep using the route that
was found without the policy?

dst_cache_set_ip6() in net/core/dst_cache.c has the same pattern. IPv6
UDP tunnels and ip6_tunnel use it:

	dst_cache_per_cpu_dst_set(idst, dst,
				  rt6_get_cookie(dst_rt6_info(dst)));

The previous patch in the series describes the problem as affecting all
"callers that keep a dst in a persistent cache". Should these sites also
be converted to ip6_dst_lookup_flow_cookie(), or at least mentioned in
the commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794384146.git.ralf%40mandelbit.com

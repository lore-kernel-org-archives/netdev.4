Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080177;
	b=UKyvfU/peNdGCxp5AozAVPO9CgtmmDQUxnHsuhQDjlqz42RI8PvuQpFZw+PzxN0bwuy7
	 zch+mLow3mnEBeMq0LFbDzGYov/NtE7Z39H4JUOijotLsyKkMNzcEIOxtmBz+Z2/CntKM
	 T3B+tvdjbKAyUvLDDEItz1YDkS/6LxNj4lDAJw80t7GN6uvwMBSlhv80pCBMZ2C4zPCJ7
	 KsT3UvOrTIJ1hs5xh8ANxb+NsdZfShDFo+dtNN467cSJoK22bqdzyPUgkUAbk9Tk5Leo6
	 y/60NKKlS1QJPGn4ExOIIE6m+pBg4HibbpqZH+fMRuqMUueBKGAQW6Jp1qx07KoqO1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080177;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BQ2lnBFbJ23uOP8A1QEFwnqNG7eY2eGB8Q6tQ0RjBRI=;
	b=mdHeXHWYWuALOIoUBdoIMX5cu8+F0kPHL8HkmgvgirSAF6JeVaEx81F1BT6yn88ZIipX
	 AVyi+O2lwtE4+m05zd3rXdN7NXBngG2QcY1FlN89nLkl6mYHVEmbOPrcDqhr37DT9MLly
	 AUqSa5qYrqoOg9gRcnXe2zteYBJqwhqEHHBm4RCa/pgz3anYvg3EaydDO1HjanWvwvrtR
	 16z0YHDuKT9SI7wP6CteKrHi08ytaA7/FjsH2bRCTIaGmzOXEtRpi10yObVY4ehQ4zsZH
	 2RTQBS1WkhjWTfNbFKbfrNJyJD2iusdEuwSBdUQDBEOy/u4TS7zANkX6xkbGo09jvEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vhg1ojQ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A613C60A261C;
	Thu, 19 Nov 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vhg1ojQ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BE11F000C9;
	Thu, 19 Nov 2026 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080177;
	bh=BQ2lnBFbJ23uOP8A1QEFwnqNG7eY2eGB8Q6tQ0RjBRI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vhg1ojQ2Rc6va153o1ENe21se5QAcg08aI+bwjpY3OhxrjAF23QtUfTW5YJzyWi8h
	 MNw3dK+aaFz4yhCNsw+m7ikn1gh5MTzSZtIUTjf5OgNtvtguHFTCH6yg8zvgSqiD/R
	 UXLqlGIOxVRan+9gRE9VvicNq5ivBC8r5bbDNjbdh3q6RWpz+5UPzsmSV8dXB9nLhk
	 iFvTLJBXNB1+JOGbjTZUmuihYoYDX8kmJFR/PeADNVCiNLVgZ6defra61TEJ/w9S3g
	 Pw5dRuOt6L8gesRUtoQ1WPuGTuNCPnpM5ayJg2pvarNrPvseG/xQe9PwcV+MibDwlu
	 vItMk9N4vxLpA==
Subject: Re: [PATCH net-next v3 3/3] ipv6: use lookup cookies in selected
 socket dst cache paths
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 sd@queasysnail.net, antonio@mandelbit.com, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 09:22:55 +0000
Message-ID: <179508017589.3136.2311893930440004501@kernel.org>
In-Reply-To: <60907e12930f38ba6c45c4ccfdca7abee068b765.1794906743.git.ralf@mandelbit.com>
References: <60907e12930f38ba6c45c4ccfdca7abee068b765.1794906743.git.ralf@mandelbit.com>
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

- [High] The patch fixes the IPsec-bypass race (late cookie sampling) in
  only three paths: tcp_v6_connect(), ip6_datagram_dst_update() and…
- [Low] This patch carries a Fixes: tag and is the one stable selection
  will pick.

--

ipv6: use lookup cookies in selected socket dst cache paths

This commit changes tcp_v6_connect(), ip6_datagram_dst_update() and
ip6_sk_dst_lookup_flow(). They now store the cookie returned by
ip6_dst_lookup_flow_cookie() instead of sampling it after the lookup.
The commit also adds ip6_dst_store_cookie() and keeps ip6_dst_store() as
a wrapper for callers that are not converted yet.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

[Severity: Low]
This patch depends on the earlier commit "ipv6: add
ip6_dst_lookup_flow_cookie". That commit does three things:

- adds ip6_dst_lookup_flow_cookie()
- changes ip6_dst_check() so that a dst with rt->sernum must match the
  supplied cookie
- moves the fib6_update_sernum() calls in fib6_ifup()/fib6_ifdown() to
  after rt6_multipath_rebalance()

The prerequisite has no Fixes: tag and no stable note. This commit does
not mention the dependency either.

If stable selection picks only this commit because of its Fixes: tag, it
will not build, since ip6_dst_lookup_flow_cookie() is undefined. Could the
prerequisite be tagged too, or the dependency be noted here, so both get
backported together?

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
This wrapper still samples the cookie after the lookup. Three other
writers of np->dst_cookie on TCPv6 sockets still go through it:

net/ipv6/inet6_connection_sock.c:inet6_csk_route_socket() {
    ...
	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);

	if (!IS_ERR(dst))
		ip6_dst_store(sk, dst, false, false);
    ...
}

net/ipv6/af_inet6.c:inet6_sk_rebuild_header() {
    ...
	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
    ...
	ip6_dst_store(sk, dst, false, false);
    ...
}

net/ipv6/tcp_ipv6.c:tcp_v6_syn_recv_sock() {
    ...
	memcpy(newnp, np, sizeof(struct ipv6_pinfo));

	ip6_dst_store(newsk, dst, false, false);
    ...
}

Can the same xfrm policy bypass still happen through these paths?

xfrm_policy_insert() links the policy and then calls
rt_genid_bump_ipv6(). Suppose an insertion lands between
ip6_dst_lookup_flow() returning a plain route and the rt6_get_cookie()
call inside ip6_dst_store(). The plain dst is then cached with the new
serial, and ip6_dst_check() keeps accepting it.

These paths run much more often than tcp_v6_connect():

- After connect(), every refill for an established socket goes through
  inet6_csk_xmit()->inet6_csk_route_socket() whenever __sk_dst_check()
  fails. That includes the invalidation caused by the policy insertion
  itself.
- A remote ICMPv6 Packet Too Big can force refills via
  tcp_v6_mtu_reduced()->inet6_csk_update_pmtu()->inet6_csk_route_socket().
- For accepted sockets, tcp_v6_syn_recv_sock() reads the cookie only
  after inet6_csk_route_req(), tcp_create_openreq_child() and the
  ipv6_pinfo memcpy. That window is wider than the one in connect().

The commit message says this is a partial conversion. With the Fixes:
tag, though, stable trees would get a fix that leaves established active
sockets and all accepted sockets exposed. The new kernel-doc for
ip6_dst_lookup_flow_cookie() also says "A caller caching the dst should
use this cookie when validating it with dst_check". These callers don't
do that.

Would it make sense to convert inet6_csk_route_socket(),
inet6_sk_rebuild_header() and tcp_v6_syn_recv_sock() in this patch as
well?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1794906743.git.ralf%40mandelbit.com

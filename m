Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819756;
	b=rWORpJoE2XD3pmNjs/xCYgg/zw/j/9dUqwTlgSvc9Xslpc5O4lH+1hhsGnSL8617uX/v
	 Eum3q6YzuFcDnVB4/9xavznVajLWpT0vpX4Kv5e8yXbru9doN2y7MWod5/5/4yYcLXXJ5
	 SziH7nTb+gdNCaLecJe0XLYPKe1a7e9S5cPYDRQnL92AN0c3GS0h/3gzPt9QmAmjYyvOH
	 c88XqK0Ms02tdLxrTiVe6vDqhcy+UPIHJ7nIn4VtjbRxLiyD9uFlqkSi2g5p+8axDA1sf
	 2MS/g0eoTwxT7osWxz3HVvyHwW9MPz3t/oMYMDRZH+BLpCgHMEPwTup+URc1dK7Heog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819756;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=e1jHKgD0PHuVoAJ43vN9/cFeazU0vXqWKmj5q4/sSpU=;
	b=5sw0JbMLBhrXnf3H8Z4YXFQVTp5V8/PVHof2nTxcbA46zGpYOzMGhn9x25FR8zKmfcsb
	 IlpuBkJ55YsvFU0cq29yYKtSDadG04Lh2ZnQ8kZbGSqozNUO+MnT0PFiGP8Af19E/nqnP
	 skmtcVOT/e5vZ081Kw9oWDx9cOqppNSfZIGL4eh7qo6BBtubggDF3yOXJ4qqzbLs3mq9B
	 HyT7sX0/icjMr7XzGsK2RcR3G594X/oIgO4KNsPmqFD5b6gcKsw2jsbQez0JsoT4Vl2aC
	 8/rMmqt8B1nq/pNsXXqOWXONNFXZZ68kvdJu7MpQ1qzULgREsdSt4JWNk855QVNxNtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=OWTNGCPS;
	arc=none smtp.remote-ip=195.10.208.40
Received: from mout-b-210.mailbox.org (mout-b-210.mailbox.org [195.10.208.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC5606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=OWTNGCPS
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-210.mailbox.org (Postfix) with ESMTPS id 4jShhL4c35zFpXW;
	Mon, 16 Nov 2026 10:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1794819746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1jHKgD0PHuVoAJ43vN9/cFeazU0vXqWKmj5q4/sSpU=;
	b=OWTNGCPSn2TLDY6BxTW8hPkHvliS4y2mkptCsHRFdIpWmw9hdbPIZVpiCaWzKvvfCP3MT9
	gFWo4tJg/k5xPRftDXs0RST5/0Py+RKv4khavZsx3Y9dNOw2lN7cdlLdT86PNm9/dGZN9b
	RHDqW+DLerspJ5+ytcJfYxoJ4Yj/bFs/8UQCEn5DdYU1rg4b/Fm54uU6rwbrTDsb1QH7bV
	RcD8zeE5iDlN9JOgwN/UzYim4zFXtlBBZSzFzsIM2Y5d6/83TPb8fmxgcMSaahbUpP73o8
	yJb6r63fzE/O7HaB1xzEHHKO5NeA3/Pycy9N7PNzgfaHeBtSlebnrJ8uMxMESQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	fw@strlen.de,
	sd@queasysnail.net
Subject: Re: [PATCH net-next v2 3/3] ipv6: use the lookup cookie when caching the dst in sockets
Date: Mon, 16 Nov 2026 10:02:15 +0100
Message-ID: <20261116090215.93209-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179473299346.2199510.11559140714770152951@kernel.org>
References: <179473299346.2199510.11559140714770152951@kernel.org>
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
X-Rspamd-Queue-Id: 4jShhL4c35zFpXW

On Sun, 15 Nov 2026 08:56:33 +0000, netdev-bot+sashiko@kernel.org wrote:
> > Store the cookie returned by ip6_dst_lookup_flow_cookie instead. Add
> > ip6_dst_store_cookie for this and keep ip6_dst_store for callers that
> > have no lookup cookie.
> >
> > Signed-off-by: Ralf Lici <ralf@mandelbit.com>
>
> [Severity: Low]
> This isn't a bug, but should this have a Fixes: tag and Cc: stable? The
> commit message describes a socket that "keeps sending plaintext" when it
> should be using IPsec.
>
> The patch also calls ip6_dst_lookup_flow_cookie(). That helper comes from
> the previous patch in the series ("ipv6: add ip6_dst_lookup_flow_cookie"),
> which also changes ip6_dst_check() behaviour for nexthop-object dsts. So
> this patch can't be backported on its own. Could the dependency be noted
> for stable?
>

The same historical and target-tree considerations discussed in my reply
to Sashiko's review in patch 1/3 apply here as well. The late cookie
sampling in the socket cache is already present in the initial Git
import. I can clarify that attribution when revising the changelog.

> > diff --git a/include/net/ip6_route.h b/include/net/ip6_route.h
> > index 95f936be32c6c..2684f6069a5e1 100644
> > --- a/include/net/ip6_route.h
> > +++ b/include/net/ip6_route.h
>
> [ ... ]
>
> > @@ -266,8 +266,16 @@ static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
> >  #endif
> >  }
> >  
> > +static inline void ip6_dst_store(struct sock *sk, struct dst_entry *dst,
> > +				 bool daddr_set,
> > +				 bool saddr_set)
> > +{
> > +	ip6_dst_store_cookie(sk, dst, rt6_get_cookie(dst_rt6_info(dst)),
> > +			     daddr_set, saddr_set);
> > +}
>
> [Severity: High]
> Is the TCP side of this fix complete? The commit message says this
> "affects TCP and connected UDP sockets alike", but tcp_v6_connect() is
> the only TCP path converted. Other TCPv6 paths still call
> ip6_dst_lookup_flow() and then ip6_dst_store(), so they still read the
> cookie after xfrm_lookup_route() has returned.
>
> Here is inet6_csk_route_socket() in net/ipv6/inet6_connection_sock.c:
>
> 	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
>
> 	if (!IS_ERR(dst))
> 		ip6_dst_store(sk, dst, false, false);
>
> inet6_csk_xmit() reaches this whenever __sk_dst_check(sk, np->dst_cookie)
> fails. inet6_csk_update_pmtu() also reaches it through
> tcp_v6_mtu_reduced(), and a remote peer can trigger that path with
> ICMPv6 Packet Too Big.
>
> inet6_sk_rebuild_header() in net/ipv6/af_inet6.c has the same
> lookup/store pair. It is ipv6_specific.rebuild_header, and tcp_connect()
> calls it right after tcp_v6_connect(). Suppose
> ip6_dst_lookup_flow_cookie() saw the generation move and returned cookie
> 0. Then __sk_dst_check() fails immediately, and the lookup is redone
> through the unconverted path inside the same connect() call. The
> retransmit path also reaches inet6_sk_rebuild_header().
>
> tcp_v6_syn_recv_sock() in net/ipv6/tcp_ipv6.c gets its dst from
> inet6_csk_route_req(). That function calls ip6_dst_lookup_flow() without
> capturing a cookie. tcp_v6_syn_recv_sock() then runs
> tcp_create_openreq_child() before it does:
>
> 	ip6_dst_store(newsk, dst, false, false);
>
> So every passively opened IPv6 TCP socket has the same window.
>
> An xfrm policy insertion goes through
> rt_genid_bump_ipv6()->__fib6_flush_trees(), which invalidates every
> cached socket dst. Established sockets therefore re-route through
> inet6_csk_route_socket() right after a policy change.
>
> Suppose another policy is inserted during that re-lookup, which can
> happen when an IKE daemon installs several policies back to back. Can
> the plain route then be cached with the post-insertion serial? If so,
> inet6_csk_xmit() would keep accepting it and send plaintext.
>
> The commit message says ip6_dst_store is kept "for callers that have no
> lookup cookie". Each of these callers does its own ip6_dst_lookup_flow(),
> though, so each could use ip6_dst_lookup_flow_cookie() with
> ip6_dst_store_cookie(). For the passive-open path, inet6_csk_route_req()
> would need to return the cookie.
>
> The kernel-doc of ip6_dst_lookup_flow_cookie() also says "A caller caching
> the dst should use this cookie when validating it with dst_check."
>
> [Severity: Medium]
> Does the same window remain in the SCTP per-transport dst cache?
> sctp_v6_get_dst() in net/sctp/ipv6.c does its route and policy lookup
> through ip6_dst_lookup_flow() and stores the result in t->dst. Only after
> that does it read the cookie:
>
> 	rt = dst_rt6_info(dst);
> 	t->dst_cookie = rt6_get_cookie(rt);
>
> sctp_transport_dst_check() later validates t->dst against that cookie.
> If an xfrm policy insertion restamps fn_sernum between the lookup and
> this read, could an SCTP association over IPv6 keep using the route that
> was found without the policy?
>
> dst_cache_set_ip6() in net/core/dst_cache.c has the same pattern. IPv6
> UDP tunnels and ip6_tunnel use it:
>
> 	dst_cache_per_cpu_dst_set(idst, dst,
> 				  rt6_get_cookie(dst_rt6_info(dst)));
>
> The previous patch in the series describes the problem as affecting all
> "callers that keep a dst in a persistent cache". Should these sites also
> be converted to ip6_dst_lookup_flow_cookie(), or at least mentioned in
> the commit message?
>

Both points concern conversions explicitly deferred in the cover letter.
The same scope discussion in my reply to patch 2/3 applies here: these
paths are follow-up work, pending feedback on the lookup-cookie API and
its incremental introduction.

-- 
Ralf Lici
Mandelbit Srl

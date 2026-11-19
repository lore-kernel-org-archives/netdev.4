Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091711;
	b=SjoMVqbyFyZFwyTsXzuS7CIoyhLhblwkQuI/ZA1QrnWtE9uwcyiAV6PS9t+4LhSDtYDm
	 KoWtob8XWKMvt1wzL0y41n+U22UoDruFCxWQTRi+tYxqyjvGGtIpvMZzaBRBP6Dtlvprl
	 kFN5Go7fVQorwMzAaS9N5GG0ubEd4MU9fb1J8QNsL0g9AMxyDEXUbJhHA5QqiyQuBt74o
	 jftr4XRt2u7jSvUU0tsPc1BfI+pQih5AMFBxQ6RoXk7JTRZ5AQ3Cklkb5okqWwcF+A4Pg
	 Rh2FYvrn9KAE6sQ15Ddv0HiTN1W8Y5Exw45nIzIUFQey1BgNIpxPFHltV3SwrvrVa2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091711;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=5SeJaTDft0GtN1F516svdvvqapqgOgbQ5E+Wp/co4eU=;
	b=pM2Ki55RlmUhQVic1++JXH9fW09MZetaWk1sHkJQTh/OUlLHbpG3AeiLFTuCdxHtYds6
	 Lij6XlABgKe+pOmMVScHtQQPKcmAf7cBAmSqJ7MXSXSmKPMwRKHnfSFuHTaoA4n4vWtCH
	 QZMcBwWliXqBtQUfITF9kLV7hHaKVPZUNOH9gRhBD9xRxQfKm6+d/SbvzGakHUr4rQo4C
	 jOCBiRnyJznlLnPAeza+ocEPvsUK+pPD67f9GYXd0FyUDLLH77NsgtWUcliPeEESV0PSO
	 Tt2wmFilVbSjl+xVxJkAarnNLwmx2o/X7hKkl7GoS0XBfp1xppxf9fD4AAzEf7Febjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=DXDECqZ+;
	arc=none smtp.remote-ip=195.10.208.61
Received: from mout-b-201.mailbox.org (mout-b-201.mailbox.org [195.10.208.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA6606A324;
	Thu, 19 Nov 2026 12:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DA6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=DXDECqZ+
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-201.mailbox.org (Postfix) with ESMTPS id 4jVdGF0rz5zLmF7;
	Thu, 19 Nov 2026 13:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795091701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SeJaTDft0GtN1F516svdvvqapqgOgbQ5E+Wp/co4eU=;
	b=DXDECqZ+PGVFm3Zgfl/+gcIjru7TFsHtt4lGq/kn8dMKDfOJZuA3cfXoO371dZwS8a4CPz
	O83RExzA0Z/CKF3lrtFWLK8AIgwvmFJ1nPEHI1VsRBHNEKrL3wqtf3TntGZ6ZP9Bv0KCEh
	T/lSsoUJDnv4dnhjTSb52LJSjA1roICIzopncEoywHfJj+KKXlw1P7KSeTInecdbeh9Z+v
	gAXLm1C2J4CG7AJJDtHG79l9J9oKFASZDzqfUrs5naDZBxGqdT8QkyVOf0bvkeJdgEhGY+
	3XMEDrLJ5tvmfAE9dGtcDLIi9MEtDBAilW2jkGoX2EPdPGEeNAGYYM80Y9/tZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
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
	sd@queasysnail.net,
	antonio@mandelbit.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/3] ipv6: use lookup cookies in selected socket dst cache paths
Date: Thu, 19 Nov 2026 13:34:50 +0100
Message-ID: <20261119123451.419865-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179508017589.3136.2311893930440004501@kernel.org>
References: <179508017589.3136.2311893930440004501@kernel.org>
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
X-Rspamd-Queue-Id: 4jVdGF0rz5zLmF7

On Thu, 19 Nov 2026 09:22:55 +0000, netdev-bot+sashiko@kernel.org wrote:
> ipv6: use lookup cookies in selected socket dst cache paths
>
> This commit changes tcp_v6_connect(), ip6_datagram_dst_update() and
> ip6_sk_dst_lookup_flow(). They now store the cookie returned by
> ip6_dst_lookup_flow_cookie() instead of sampling it after the lookup.
> The commit also adds ip6_dst_store_cookie() and keeps ip6_dst_store() as
> a wrapper for callers that are not converted yet.
>
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>
> [Severity: Low]
> This patch depends on the earlier commit "ipv6: add
> ip6_dst_lookup_flow_cookie". That commit does three things:
>
> - adds ip6_dst_lookup_flow_cookie()
> - changes ip6_dst_check() so that a dst with rt->sernum must match the
>   supplied cookie
> - moves the fib6_update_sernum() calls in fib6_ifup()/fib6_ifdown() to
>   after rt6_multipath_rebalance()
>
> The prerequisite has no Fixes: tag and no stable note. This commit does
> not mention the dependency either.
>
> If stable selection picks only this commit because of its Fixes: tag, it
> will not build, since ip6_dst_lookup_flow_cookie() is undefined. Could the
> prerequisite be tagged too, or the dependency be noted here, so both get
> backported together?
>

Since this targets net-next and I'm not asking for a backport, I'll drop
the Fixes tag from this patch in the next revision.

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
> This wrapper still samples the cookie after the lookup. Three other
> writers of np->dst_cookie on TCPv6 sockets still go through it:
>
> net/ipv6/inet6_connection_sock.c:inet6_csk_route_socket() {
>     ...
> 	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
>
> 	if (!IS_ERR(dst))
> 		ip6_dst_store(sk, dst, false, false);
>     ...
> }
>
> net/ipv6/af_inet6.c:inet6_sk_rebuild_header() {
>     ...
> 	dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
>     ...
> 	ip6_dst_store(sk, dst, false, false);
>     ...
> }
>
> net/ipv6/tcp_ipv6.c:tcp_v6_syn_recv_sock() {
>     ...
> 	memcpy(newnp, np, sizeof(struct ipv6_pinfo));
>
> 	ip6_dst_store(newsk, dst, false, false);
>     ...
> }
>
> Can the same xfrm policy bypass still happen through these paths?
>
> xfrm_policy_insert() links the policy and then calls
> rt_genid_bump_ipv6(). Suppose an insertion lands between
> ip6_dst_lookup_flow() returning a plain route and the rt6_get_cookie()
> call inside ip6_dst_store(). The plain dst is then cached with the new
> serial, and ip6_dst_check() keeps accepting it.
>
> These paths run much more often than tcp_v6_connect():
>
> - After connect(), every refill for an established socket goes through
>   inet6_csk_xmit()->inet6_csk_route_socket() whenever __sk_dst_check()
>   fails. That includes the invalidation caused by the policy insertion
>   itself.
> - A remote ICMPv6 Packet Too Big can force refills via
>   tcp_v6_mtu_reduced()->inet6_csk_update_pmtu()->inet6_csk_route_socket().
> - For accepted sockets, tcp_v6_syn_recv_sock() reads the cookie only
>   after inet6_csk_route_req(), tcp_create_openreq_child() and the
>   ipv6_pinfo memcpy. That window is wider than the one in connect().
>
> The commit message says this is a partial conversion. With the Fixes:
> tag, though, stable trees would get a fix that leaves established active
> sockets and all accepted sockets exposed. The new kernel-doc for
> ip6_dst_lookup_flow_cookie() also says "A caller caching the dst should
> use this cookie when validating it with dst_check". These callers don't
> do that.
>
> Would it make sense to convert inet6_csk_route_socket(),
> inet6_sk_rebuild_header() and tcp_v6_syn_recv_sock() in this patch as
> well?
>

This is the same point as on v2: the partial conversion is deliberate
and stated in the cover letter and in this commit message.

That said, these are the only remaining ip6_dst_store users. Converting
them would let me drop the late-sampling wrapper, so every write to
np->dst_cookie would use a lookup cookie. inet6_csk_route_socket and
inet6_sk_rebuild_header are direct conversions. tcp_v6_syn_recv_sock
needs the cookie to follow the dst that Fast Open passes in from
tcp_conn_request.

David, Ido, would you prefer this series to cover all ip6_dst_store
users, or to keep the current three paths and convert the rest along
with the other cache users in a follow-up? I'll respin accordingly.

The next revision will also include the small changes from this round: a
note in 1/3 that the generation advances once per ip6_link_failure call,
a wider comment for rt6_exception_net, the narrowed kdoc and the barrier
pairing comments in 2/3.

-- 
Ralf Lici
Mandelbit Srl

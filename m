Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516014;
	b=y52wPlXJNTRhsXjAmqs/B4GalffyVWx+EraV2UeFvEipYt+YcQ8AYd0BezL91pv0hRjw
	 Bh3JifzHQsKy/Pn6GCgcjMs24zldxbNsjKmIJAPeenmMXhSez+oGfu0l51C3dC2VAY364
	 ZEuXnOp5BJubMRGByeBKDS1Al4Rus2p0a8oAm+Slya017E2vPG9wJvugVzFTGr20LDyCb
	 kzhWctCdl+Q3b35LVvfS7+hM2m3T/wIyYQzv4pgJOwFWYm8LacO0Mlh1cVy4Yb7jS5UFN
	 +PQyeMu4ndx8I1CG/IK6ewAcoF+E6YlFsxpw2ax28oIa39FQqj45hSqXqtW3NbV4OAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516014;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Sevsvslciu/b1XJi0xOmfbyqyJrdaSWPCb4QgCYZGzQ=;
	b=iEqfUJDaNBbilsqSYM56VX0/9YsqrMyHkPg8CbkdaAMI53brtMt1oeOP7HFj/XiDAW/w
	 g3iWAc7o9sJEklpJ54b+0ocuLoaRC5ndatrc8yD5mZwzQx1j49eDesYR1hgL3NuqNa55z
	 oQys+iRq5WO0Dw599QF6q4XzWYTXvCzdu1pUCG5rJ9K/hdhkcV8NhNoQXfPugMeBCHVYA
	 OL+RdjWwIl0IOyHZ/fVQspzFK/PiQKuCx3SI/HdCCgCGVt1lX4YrcgboXd6LKNT0E3xvq
	 EDhLWXAypwkpXf8T+OZX4t2VvA78lr2RL54YztXTNUB1NRACBftcIr4eIxh72vD7ZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMBbFvQ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99DE606A326;
	Tue, 24 Nov 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lMBbFvQ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F101F000C0;
	Tue, 24 Nov 2026 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516014;
	bh=Sevsvslciu/b1XJi0xOmfbyqyJrdaSWPCb4QgCYZGzQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lMBbFvQ1/jou2PAJqBXK8QECbJEJxk/JwTdF//j1ZqwjYQkTEz3HYUhFj/PIs4KhR
	 xGim/oVEFJgPAakgGGO8ot8GUTNRXixQ4VibAm0tZU4AXMX45Jj0VoJAFgQVIYJd/k
	 VVdY1azSo54mh0j2c2Zk96pCPa9pPG1+TTyHC516BUK9269PdOYNzvPb4lcHUzvt5H
	 iWaAHkFcxAOafuk4bZ4/3AkMf1LJVsEtJRkO+LkMPyywlSFoH7ozpcu+u4Jtr75oIP
	 fyXNu7TXSNwKDzJsR68bbscfkjelLB5TOjWAdNQeJ8PyBkGBb4V5Dph3YebnnJ+itd
	 sl0nbZ2/t0sTA==
Subject: Re: [PATCH net-next v4 3/5] ipv6: validate the cookie of
 nexthop-object dsts in ip6_dst_check
From: netdev-bot+sashiko@kernel.org
To: ralf@mandelbit.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, ncardwell@google.com, kuniyu@google.com,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au, fw@strlen.de,
 yanxia@cmss.chinamobile.com, sd@queasysnail.net, antonio@mandelbit.com,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 10:26:52 +0000
Message-ID: <179551601267.3135.12313397782341117829@kernel.org>
In-Reply-To: <5409c8c2f60cdc4816a57adf841934688a5a010d.1795166508.git.ralf@mandelbit.com>
References: <5409c8c2f60cdc4816a57adf841934688a5a010d.1795166508.git.ralf@mandelbit.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In net/ipv6/route.c, ip6_dst_check() (lines 2821-2822) now
  returns a nexthop-object per-CPU dst (rt->sernum != 0) only if `cookie…

--

ipv6: validate the cookie of nexthop-object dsts in ip6_dst_check

This patch makes ip6_dst_check() compare the cookie passed by the caller
with rt->sernum for dsts of nexthop-object routes. Before, it only checked
rt->sernum against the current IPv6 generation. The commit message says
existing callers are unaffected because rt6_get_cookie() returns
rt->sernum for these dsts.

> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 98e3ca0644ab9..4c02c5168163c 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -2819,7 +2819,7 @@ INDIRECT_CALLABLE_SCOPE struct dst_entry *ip6_dst_check(struct dst_entry *dst,
>  	rt = dst_rt6_info(dst);
>  
>  	if (rt->sernum)
> -		return rt6_is_valid(rt) ? dst : NULL;
> +		return (rt6_is_valid(rt) && cookie == rt->sernum) ? dst : NULL;

[Severity: Low]
Is "their validation is unchanged" true for the IPv6 UDP rx dst cache?
Until now the cookie was ignored for these dsts, so a cached dst and its
cookie could come from different lookups without any effect. With this
check they have to match.

In udp6_sk_rx_dst_set(), the dst and the cookie are written separately:

net/ipv6/udp.c:udp6_sk_rx_dst_set() {
	if (udp_sk_rx_dst_set(sk, dst))
		sk->sk_rx_dst_cookie = rt6_get_cookie(dst_rt6_info(dst));
}

udp_sk_rx_dst_set() updates only the pointer, using xchg(). Nothing
serializes softirq writers running on different CPUs, so this ordering
looks possible:

CPU A
  xchg(sk_rx_dst, dst1)            dst1->sernum == g1
                                   IPv6 generation moves to g2
CPU B
  xchg(sk_rx_dst, dst2)            dst2->sernum == g2
  sk_rx_dst_cookie = g2
CPU A
  sk_rx_dst_cookie = g1

The socket now holds dst2 with cookie g1. After that, every call to
udp_v6_early_demux() fails:

    dst = dst_check(dst, sk->sk_rx_dst_cookie);

rt6_is_valid(dst2) is true, but g1 != g2. udp_v6_early_demux() does not
clear sk_rx_dst when this check fails.

The full input lookup on CPU B then returns the same per-CPU dst2. So in
__udp6_lib_rcv() this condition is false:

		if (unlikely(rcu_dereference(sk->sk_rx_dst) != dst))
			udp6_sk_rx_dst_set(sk, dst);

That means the stale cookie is never corrected.

Could this leave early demux disabled for that socket on that CPU? Each
packet would pay for a full FIB lookup until the generation advances again
or a packet arrives on a CPU with a different per-CPU dst.

The window between the xchg() and the cookie store is short, but a hardirq
can stretch it. On PREEMPT_RT, softirqs run in threads, so preemption can
too. Later patches in the series do not touch this UDP rx path.

ip6_dst_store() has a similar split-store pattern. There, a failed
sk_dst_check() resets the cache, so it recovers. TCP rx dst writers are
serialized by the socket lock, so any mismatch there is only transient.

>  
>  	rcu_read_lock();
>

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795166508.git.ralf%40mandelbit.com

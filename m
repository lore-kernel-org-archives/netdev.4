Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439616;
	b=pwTO1f6z0GmSp01tCdlhxUnhq/XWvAybcT/qSmH3SwP8k5f4GnJOU7vW66gSiSnP9Rmk
	 kKfHGvHXN8oQTFuNarrbrUMvYfqAg5xIkTMm8+Svdufvb6sDtI1bqByez+cN245JFpdFk
	 767kSjxUpdxUrMuHM1iWbVLSehnEwTxGOeKsoiPqfunvMQ5TW6SlMtNu4Jn3OpFTixeiM
	 +/nwawE3lbRz5Ko3p6EYHKcgVn8CBAkMhSnLZSvCv3RAue0N8IPBK/UxRwanhoE9jY2oD
	 i5dD5JERW11kGfEMeAZ5380oeKyNWm3a6mQFib9k/uoJtOmSVqHUsPz5oQeKcngb+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439616;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=s4xiX9NuRtD/nUozH1kv7Vg68ZZWMqUGKWxJHU6wK94=;
	b=FeXClYehirsOjTyFvg2iaqTnGBE6eUWoU09cigGpnFjfrWG7L2A+zQaHj3n1ULG44pN/
	 ohaA94pvk0D3iPBDnoemoO/Hj52SgvUl64QagwB8YuVV5NXJrPF+jcK67ImEnvARhsHe6
	 nAIuHB1wq2kDO56OnmESDBO7s60EBsQ33YSI3a1M1QUp7BFXeUiOVbDlTRJ6XhQfNV1FC
	 /pngi4z843BOu6DiPaTIc7tb+6jOnIUBOwMuFkozKHNEESmUVor3umlMX/nefnMs/SmCK
	 bXQGOLx5pGmxx/okFBW9R4Jl5whcgYYVASmYGxZCuPdygkLgkck4WYIJtvnowddEWNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdfux8c2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7896606A31A;
	Mon, 23 Nov 2026 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdfux8c2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3A71F000D8;
	Mon, 23 Nov 2026 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439616;
	bh=s4xiX9NuRtD/nUozH1kv7Vg68ZZWMqUGKWxJHU6wK94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mdfux8c2bpM++Nz5z/Wn9NcH8DoKCYL3wZx2FblfqxcC3VZMWFrlO6JpXp/7oWRyU
	 wGVl+umzjvhuoq9A6PkCZ06p0ceW+ofUtMqys75sx192kjjsTs4NV6SQA+c26zknWH
	 U5ebwHvaCOFSvMUYMOSzHM97qBohzQxCJiFaTxscGESBQoC8UIahGW2Q1Q/8MSn917
	 YZyIGvOPMVGPgmMN+z5ZHdDW03fB3z6i6IwX0yyFsiREj2QW3/tYkA+A1SGeR67f0X
	 iFhqc71r015agmGdfZHNU3dSfD5BC2CwT23ASaeAuQ5MNWz4kbL+qpbY18dmFMZUB+
	 Vx7iV3aE1i3yg==
Subject:
 Re: [PATCH net v2] igmp: use copy-on-write RCU updates in ip_mc_source()
From: netdev-bot+sashiko@kernel.org
To: 18983559317@163.com
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 13:13:35 +0000
Message-ID: <179543961529.3135.8092538762905615997@kernel.org>
In-Reply-To: <20261119125112.540125-1-18983559317@163.com>
References: <20261119125112.540125-1-18983559317@163.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In ip_mc_source() (net/ipv4/igmp.c), the rewritten add path
  makes the source list far larger than it needs to be.
- [Low] In ip_mc_source() (net/ipv4/igmp.c), removing the last source
  from an EXCLUDE-mode filter now sets pmc->sflist to NULL (`if…
- [Low] In ip_mc_source() (net/ipv4/igmp.c), the source-removal path
  (IP_DROP_SOURCE_MEMBERSHIP, IP_UNBLOCK_SOURCE,…

--

igmp: use copy-on-write RCU updates in ip_mc_source()

This commit changes ip_mc_source() so that adding or removing a source
filter entry builds a fully populated replacement ip_sf_socklist. It then
publishes that list with rcu_assign_pointer() and frees the old one with
kfree_rcu(). The goal is to stop ip_mc_sf_allow() readers from seeing a
list that is being changed in place.

> diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
> index 52cde8782eebd..75292f4550216 100644
> --- a/net/ipv4/igmp.c
> +++ b/net/ipv4/igmp.c

[ ... ]

> @@ -2556,13 +2556,33 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
>  			goto done;
>  		}
>  
> +		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
> +			&sk->sk_omem_alloc);
> +		if (psl->sl_count == 1) {
> +			newpsl = NULL;

[Severity: Low]
Is this change in setsockopt behaviour intended? When the last source is
removed from an MCAST_EXCLUDE filter, this now publishes NULL into
pmc->sflist. The old code shifted the entries in place and left a non-NULL
list with sl_count == 0. The MCAST_INCLUDE case with one source becomes
leavegroup before it gets here.

The mode check at the top of ip_mc_source() only allows a mode switch
when sflist is NULL:

	if (pmc->sflist) {
		if (pmc->sfmode != omode) {
			err = -EINVAL;
			goto done;
		}
	} else if (pmc->sfmode != omode) {
		/* allow mode switches for empty-set filters */

Take this sequence: IP_ADD_MEMBERSHIP, IP_BLOCK_SOURCE S,
IP_UNBLOCK_SOURCE S, then IP_ADD_SOURCE_MEMBERSHIP S2. The last call used
to fail with -EINVAL. It now succeeds and switches the group to
MCAST_INCLUDE with S2.

This matches what ip_mc_msfilter() and ip6_mc_source() already do.
ip_mc_sf_allow() also treats a NULL MCAST_EXCLUDE list and an empty one
the same way.

Since this is a Fixes: tagged data race fix, should the commit message
mention the change?

> +		} else {
> +			newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr,
> +				psl->sl_count - 1), GFP_KERNEL);
> +			if (!newpsl) {
> +				atomic_add(struct_size(psl, sl_addr, psl->sl_max),
> +					&sk->sk_omem_alloc);
> +				err = -ENOBUFS;
> +				goto done;
> +			}

[Severity: Low]
Can removing a source now fail with -ENOBUFS? Before this patch,
IP_DROP_SOURCE_MEMBERSHIP, IP_UNBLOCK_SOURCE, MCAST_LEAVE_SOURCE_GROUP and
MCAST_UNBLOCK_SOURCE always succeeded once the source was found.

The old list's charge is subtracted first, so the optmem check usually
passes. However, sock_kmalloc() reads optmem_max at call time:

	int optmem_max = READ_ONCE(sock_net(sk)->core.sysctl_optmem_max);

	if ((unsigned int)size <= optmem_max &&
	    atomic_read(&sk->sk_omem_alloc) + size < optmem_max) {

This allocation can fail in two cases:

  - optmem_max was lowered below the socket's other option memory use
  - the GFP_KERNEL allocation fails for a large list

In either case userspace cannot drop a single source, and an
MCAST_EXCLUDE block stays in force.

The error path itself restores the accounting cleanly. The workarounds
are IP_MSFILTER with zero sources or leaving the group.
ip6_mc_source() can fail the same way.

> +			newpsl->sl_max = psl->sl_count - 1;
> +			newpsl->sl_count = psl->sl_count - 1;

[ ... ]

> @@ -2572,49 +2592,52 @@ int ip_mc_source(int add, int omode, struct sock *sk, struct
>  		err = -ENOBUFS;
>  		goto done;
>  	}
> -	if (!psl || psl->sl_count == psl->sl_max) {
> -		struct ip_sf_socklist *newpsl;
> -		int count = IP_SFBLOCK;

[ ... ]

> +	i = psl ? psl->sl_count + 1 : 1;
> +	count = IP_SFBLOCK;
> +	if (psl)
> +		count += psl->sl_max;
> +	newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, count),
> +		GFP_KERNEL);
> +	if (!newpsl) {
> +		err = -ENOBUFS;
> +		goto done;
> +	}
> +	newpsl->sl_max = count;
> +	newpsl->sl_count = i;

[Severity: Medium]
Does sl_max now grow by IP_SFBLOCK on every add? The old code only
reallocated when sl_count == sl_max, so the spare slots were filled
before the list grew.

Now a new list is allocated on every add, but it is still sized as the
old sl_max plus IP_SFBLOCK. The spare slots are never used:

  add 1: sl_count = 1, sl_max = 10
  add 2: sl_count = 2, sl_max = 20
  add 3: sl_count = 3, sl_max = 30

After N adds the buffer has room for about 10*N entries instead of N.

The old list's charge is only removed after the new allocation succeeds:

	if (psl) {
		/* decrease mem now to avoid the memleak warning */
		atomic_sub(struct_size(psl, sl_addr, psl->sl_max),
			&sk->sk_omem_alloc);
	}

So both oversized buffers have to fit under optmem_max in sock_kmalloc()
at the same time.

Assume the default optmem_max of 128 KiB and a raised igmp_max_msf. In
that case IP_ADD_SOURCE_MEMBERSHIP, IP_BLOCK_SOURCE and
MCAST_JOIN_SOURCE_GROUP start returning -ENOBUFS at about 1600 sources
per group, compared with about 16000 before. Large lists also become
high-order allocations.

With the default igmp_max_msf of 10, sl_max stays at or below 100.

The delete path in this patch and ip_mc_msfilter() size the new list
exactly. So does ip6_mc_source() in net/ipv6/mcast.c:

	i = psl ? psl->sl_count + 1 : 1;
	newpsl = sock_kmalloc(sk, struct_size(newpsl, sl_addr, i),
			      GFP_KERNEL);
	...
	newpsl->sl_max = i;
	newpsl->sl_count = i;

Should the IPv4 add path use struct_size(newpsl, sl_addr, i) and
sl_max = i as well?

> +	if (psl) {
> +		for (j = 0; j < psl->sl_count; j++)
> +			newpsl->sl_addr[j] = psl->sl_addr[j];
> +	}
> +	newpsl->sl_addr[i - 1] = mreqs->imr_sourceaddr;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119125112.540125-1-18983559317%40163.com

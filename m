Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084955;
	b=yXZzS6Re55XWSydRKMP/yBkbiOlGkE5tMaND2QWiR2Egf43FCvLGJcGW55M7IoRKQ+CO
	 3uYUx+CxZANjzWjJ43K8SfsR23qkHxKle2dAtt4fxC5josq+7E+ddR2Yktr0xPU6d2N+o
	 iZFhQG9hR9qRfMkYg9Np54UvhwU134eWCt2HjCn/TBYj/SuyOxGaM5vsPPCtH5A9K7oVD
	 ksZnEiqjdavG1wYUGo0CwT81G36YTgmx0QD8O9SZjWunVTJUluOFloesSRIQaKpDTSf8r
	 eLll3HNCQ3oG1Dc1VlSOCymm8c9CBl5+Kf2b7nMDaXtJT0fLTrD/e7x7AlP558ZPBEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084955;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QnXZokuDLYMZLjJ6ee2/Ob0NQxuJ0RZGSiWoiYV2gM0=;
	b=Mv5J5UvkV8LkvVdIiw/XtF5lWsfy23nCtTRW+PMLJg5hDihYekSNAQrWTLxpfgvS51l2
	 YMQm0XXh8v0B9FWcdhOpA1sLmTNDt/TKQBtcCRBhrBecs3hFSGgAWp34fZ2xJ5zZnNung
	 CO1RNylew/EUJrmQ6Ft1sRrCw13CM41idHaZ5kmc2bZWJXWz33rYqSqb/kYuhfP+G2SKp
	 DmFWaUFZTdOtDRPj2gip2A9scpLj8PP3m/MFNdILH+WUSl1IiGlZT3nzQ4mePsgK4ocja
	 lEG4nDrBozDyQ4qC5NjxhBWAS9LJsexKstnm6mUi4UQab+aB71oy6NnwRmozxidT49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMoFhX2N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367A5606A33D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMoFhX2N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA1E1F000C7;
	Thu, 19 Nov 2026 10:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084954;
	bh=QnXZokuDLYMZLjJ6ee2/Ob0NQxuJ0RZGSiWoiYV2gM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMoFhX2NYyv25GWPIeMdUiSkPOw5kFii2OemDLZYHC8eAlTo5+fHWzu9c0UJTShwr
	 Km7T9ojV5xEP4cHSCIi2DeFu4E0Q0B1vPn7XCmH1yFhjMpiA7vYKS1nNyGR4sFJv8H
	 9Lex/k8Yrx2T4ArCYAvhJNNznrTS3VvWrgWuizp8e6uLaoOZ/1qg/D4vb4nCUSSj5z
	 KjhZz+vsbAB1P4v6whalbSONQJuFqEe5Dg0ESDDognloLLsqgctXjhfs92vAoE54pF
	 rWA4RrIGHh4EfJ8peu2buub/njqKKMjnnvWIkNGwGqlKdZLpcIrnx/T8/KaVcpHqq6
	 WqkxKbW5sFnyQ==
Date: Thu, 19 Nov 2026 10:42:30 +0000
From: Simon Horman <horms@kernel.org>
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	vega@nebusec.ai
Subject: Re: [PATCH net 1/1] ipv6: mcast: use resolved interface for source
 filters
Message-ID: <20261119104230.GT860048@horms.kernel.org>
References: <cover.1794492711.git.zihanx@nebusec.ai>
 <a5d3d0505baed01a213ea7953f0fe78cb025ee22.1794492711.git.zihanx@nebusec.ai>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5d3d0505baed01a213ea7953f0fe78cb025ee22.1794492711.git.zihanx@nebusec.ai>

On Thu, Nov 12, 2026 at 03:19:04PM +0000, Zihan Xi wrote:
> When no interface is specified, ip6_mc_source() resolves the multicast
> route to an interface but searches socket memberships with a wildcard
> index. A socket joined to the same group on multiple interfaces can
> therefore update its source filter on a different interface from the
> interface filter.
> 
> Use the resolved interface index for the membership lookup and for
> dropping the membership after leaving the last source.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Hi Zihan,

I see that Paolo has responded, and his comments should stand.
But I had been looking into this patch and I think it's worth
sharing two points, in case they turn out to be useful in future.

There is an AI-generated review of this patch available at
https://sashiko.dev/#/patchset/cover.1794738094.git.zihanx%40nebusec.ai

It states:

  Furthermore, the duplicate membership check with ifindex == 0 in
  ipv6_sock_mc_join(), the -EADDRINUSE handling in MCAST_JOIN_SOURCE_GROUP,
  and the leavegroup handling in ip6_mc_source() were introduced later by
  c9e3e8b6958e ("[IPV6]: multicast join and misc"), while
  ipv6_sock_mc_join_ssm() was introduced by c7ea20c9da5b ("ipv6/mcast: init
  as INCLUDE when join SSM INCLUDE group").  Should the Fixes: tag point to
  those commits instead?

I would lean towards using c9e3e8b6958e as the Fixes tag as it seems to me
that is the commit that that first introduced this bug.

> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> ---
>  net/ipv6/mcast.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
> index ecef55f26189..63770b3a7bb2 100644
> --- a/net/ipv6/mcast.c
> +++ b/net/ipv6/mcast.c
> @@ -362,6 +362,7 @@ int ip6_mc_source(int add, int omode, struct sock *sk,
>  	struct net *net = sock_net(sk);
>  	struct ipv6_mc_socklist *pmc;
>  	struct inet6_dev *idev;
> +	int ifindex;
>  	int leavegroup = 0;
>  	int i, j;
>  	int err;

For reference, please preserve reverse xmas tree - longest line to shortest -
ordering for local variable declarations in Networking code.

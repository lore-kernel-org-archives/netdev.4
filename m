Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048207;
	b=p5z23XLWuI/pUBJfL4X16YZREkAxwvgqFDxTC9MKzkBTi5ELriphu0u0a4LN+ThVQqhT
	 WdJZ2WlFKpDzZm+CuJdfE7Ek1oIC2Z8PXhddCWwiV5KekkJ3JDQNvJjV+ZlS0YPQrTH/M
	 kCl3fRFYQ5IUEU7aoMdsW1lN7EYLjdcZ+fwnXbfIedJ+5W8WZi60GHGzBIWRVrE4RoJC0
	 10WXclNjAuf814WirdE004Csln9uCXHv4cSiWPcevOubWfvBw5/Q6DM4Vd1kKQq70M2u/
	 tQqC479HicPO56dHtrSo8QdsNfjaL8HoWvfTkkdbGYmd0K4IrjYc0h/beZeF7Rcb+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=q4uUwijGwEGNahwvfbi1awakekbl6fH77V+e6oo82Vw=;
	b=qmLVPpXvUlOHFg0ZXphoYd4KunOC0SEZjdWx2Mv7pcZRMntqlkwYh68GwwXRm8RDdC5L
	 +tWNHBcpQrjAtvpGCQ49/7kfT/shqFwPdjMP7X61JcFd9Ct9pSdeWalqw9kRSjRdlY7JS
	 TVskvx5iDzKdDCGqPndC1AvATBlWeu/WelxHELRCEdFtdoW6Wq/9y6mOQOO3GyyxW0Vzv
	 9+lef0lxo/eKjwtRJjSMjlK7YCNyeickO/331qmxvcVTyWdFlQ/JE+E78S3sdGE5A7yBi
	 e+xPGFD+OKCaWuhxo/XUY1ozDqbOsUibVt15ntyZE9jSmnbnwGwfgD0h4HgZgAzyJRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BjnKmAXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04986606A32C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BjnKmAXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816951F000C4;
	Thu, 19 Nov 2026 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048206;
	bh=q4uUwijGwEGNahwvfbi1awakekbl6fH77V+e6oo82Vw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BjnKmAXOShs3vN5KPy2NqK6YAJ7RxpV5FRJ5q50a2Q0jeRDXV2p6Q8I6cZJ5YEQpc
	 1S81drNXRRnZQ8NFEMCFR8B4jqD/Q9/KLwx+5rtqVHl3Url99GFmBWhIcsVUiudfaP
	 1gdwesKJleOurpii5v8Ys2GMMjNqY3a8hNlmE9YsglnS9aLbQnw5HEZRK4a2V65vyL
	 7gzvdd13erTA40fgSMmg7C4dKq9/5LQoaL+r1nUgsc8BYh+Ghhz7oQfy9GfhQkJ3Zs
	 jZBE2WffyLwilvnaCAxeVB6WmTgIQdSQtj8FqNb/kqiDdXcywfm+pBUSa9Dj0ALOE0
	 4VBzi6V/QrM3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7743D3808210;
	Thu, 19 Nov 2026 00:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Subject: Re: [PATCH net v3] fou: reserve headroom before pushing the encap
 header
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504820528.2657179.7362359071229117121.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:30:05 +0000
References: <20261116113845.166280-1-theodorlarionov@gmail.com>
In-Reply-To: <20261116113845.166280-1-theodorlarionov@gmail.com>
To: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 nicoyip.dev@gmail.com, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 14:38:45 +0300 you wrote:
> ip_tunnel_xmit() and ip_md_tunnel_xmit() push the encap header before
> reserving headroom. A packet redirected into the tunnel (tc mirred, nft
> fwd/dup) keeps the headroom of its original device, so fou_build_udp()
> panics:
> 
>   kernel BUG at net/core/skbuff.c:214!
>   Call Trace:
>    skb_push+0xcc/0xf0
>    fou_build_udp+0x2f/0x380
>    gue_build_header+0xfa/0x150
>    ip_tunnel_xmit+0x87f/0x21c0
> 
> [...]

Here is the summary with links:
  - [net,v3] fou: reserve headroom before pushing the encap header
    https://git.kernel.org/netdev/net/c/bcb42672751a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651805;
	b=kGf+bW1so5JckUFXH/D+y6QpdCUn1s3oohh/ZPcNrAvujVJP2Jinwj7hpF8lCxnndVi2
	 uwrxz/QIC1E+g5K8Y6cXq3lu/Vy9Rxmpdyq6jVSRGQGsMvw34HaO8By53CgWVU/zPueuA
	 w+9tMgzvRGgvSE93QwMr3J/SmU7hNJv+c5g6TYq3OSY7AVHJggIwa1SLATMpA7uSUm51Y
	 w6CMD9aK8TAPG2GBNpiAh2wkw5fGcpKPDU7l2Ou4i4JhcW7UCP22wiFf/pBYvcyShPxlS
	 hKn02y4n9zJQ4gBNbutchdbzAtDLFqVyxtpdExRZaU3ymDtS4vnvNS8Xow1d86zkIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651805;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=7YlCoEoJkV6YaVDpx4dm/M10Ti1AWk1BcHSm4cKDbNU=;
	b=XEWGcMv69Vc0a0v6vUBKaw1Yfyek1WtKRPaysPus0SxdAAs8AI5o4T5w+QXUTGk9cLGs
	 ZqQV1gXxjSWLVdOI5wN7jsk5YYX5oGOPT+OhAMjm6ffo+Qbe5wxWCaC87Erx1sworElRl
	 cgr1FmNgRUrK0109DtIYil8WKG+4cwKu90cPB18oXj7NTtHQaK143ilysmYUCMyIGL3gq
	 +1VxqJZX1s+fiXPInjhrz41Glhr0dfLL6Eknfqy4/LtV5YkTvWv7UZNBiZOSKMqNVbsMC
	 eRBLB6AKbth2Fk6HVKzbzFuNt+BdQ4Lt3iLpLXd0ulr57eHGgSe2bkB4r/7cFnEJMRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iwny6lwB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D6606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iwny6lwB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4250D1F000C4;
	Thu, 26 Nov 2026 00:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651805;
	bh=7YlCoEoJkV6YaVDpx4dm/M10Ti1AWk1BcHSm4cKDbNU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Iwny6lwB+3NGr/3T/gwaZyZDMn04h/zhrSvigk/fJDcOzzqOMcWxemi+ksGDc1b13
	 bWKgxa0BT9e7MLFcR6K96KZIBAcHEO9syBv/6K8eqw772pz776KbRUOH6bdW0l3s6L
	 N5KX1OmIy2FuRdHQT+OXN21ZvRV6zyB9lVP/XUdHTMFCnRfG3DQ2B57xp10bz/ZBKN
	 joPfdZOOnrQvUZwYUhXorDhdI4w5vpCGS9Naf39dBJlaynOiK3mmwTyssf/9YsBcdt
	 qfrXkKayv8kmdL+XtvnUJXgdsK/YsnGoxHyFtIrcoyM/X7WmSrqEYPGLHKhknRyv7L
	 zha0vPcps0xRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3193809A24;
	Thu, 26 Nov 2026 00:10:05 +0000 (UTC)
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
Subject: Re: [PATCH net] ipv6: mcast: do not pass uninitialized bytes to
 dev_mc_add()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565180403.1406798.10272171758652441248.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 00:10:04 +0000
References: <20261123124458.205233-1-edumazet@kernel.org>
In-Reply-To: <20261123124458.205233-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, dsahern@kernel.org, idosch@nvidia.com, horms@kernel.org,
 netdev@vger.kernel.org, kuniyu@google.com

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Mon, 23 Nov 2026 13:44:58 +0100 you wrote:
> igmp6_group_added() and igmp6_group_dropped() build a link-layer
> multicast address in an on-stack buffer with ndisc_mc_map(), which
> fills a number of bytes depending on dev->type.
> 
> dev_mc_add() and dev_mc_del() then use dev->addr_len bytes of it.
> 
> Since IPv6 multicast joins and leaves no longer hold RTNL, dev->type
> and dev->addr_len can change between the two steps, for instance with
> TUNSETLINK, or when bonding or team change their type.
> 
> [...]

Here is the summary with links:
  - [net] ipv6: mcast: do not pass uninitialized bytes to dev_mc_add()
    https://git.kernel.org/netdev/net/c/58f419bfa4c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



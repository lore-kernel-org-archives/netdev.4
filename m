Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141206;
	b=eYlr3A6KsZTgRyUJ7HMkoCnwIUCbRNwzZYHTJr0cK5ccU9Yl0WysbyJJeuvfXFN1sDwm
	 jgtZOEoslnh/hZGviE6H3lNlE0laJiIs9IlGtXkgMfXYSvUGAOQiIUeWD37DUqVU7+GaQ
	 F/h6Zd3xEljtjv7SPEoksAkCbi15lBE5pQlPgUim+H1UzgIPTIVVaxWs5BpOCpjB1au+i
	 5SjhbmO+JC6Xlku2y7kL6e5MaKJLh0Mw+5UkKfFpleosnAGtSnGmUJnuEhfvp0DLCqI1D
	 t+zPGy1VMZ/G/oXAWaqCnXV1NfJ3jkyzEnFdF7daQzlg0GV5eu6zMUKiK9PXxh2c2iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=x1c+OZN74ZYwtE3WiEL44d5tdZ3m6forxJPuQ8GDPfM=;
	b=MJUHJrNvVrmZhdcaXzr97Wi7m+ag7wgr54S1cMeWH+oSupzjPg4+QOvEkzDcJOrCwQSZ
	 OQOKjJSAh6AE8d+CQgeyexi4cEYwwVt/3YgNtWarVVtKFify0568V2kYO08mlR8HJ0dK6
	 efCiFFaaBwuCnDEe3kBM75Xht5CCYdqP9wxj3uYvO3wjfkGP8C89O3FwQDWGTkJtk2n5x
	 Ps7YFrgzhUyvCOz0IPYdINWz1J3FIa/6ukdIPmoDpOJIzuNLWLqpqmtibikQL+KPzPmX5
	 pUWb8OAmEGD26dV+RmB2JMhmfhqziynzIn1Em0Q0cZ8vCL42Lr4zsP/UTUWUBc9wLlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRjpQu1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B8B606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jRjpQu1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBBD1F000C4;
	Fri, 20 Nov 2026 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795141205;
	bh=x1c+OZN74ZYwtE3WiEL44d5tdZ3m6forxJPuQ8GDPfM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jRjpQu1y5111tZBgUF4VnCfeFclrjv86VsMxsdxfWm7ztow021sVlcxJz94B9PgeJ
	 7HawZKbQsm/5kgf+b25CCsdehLEFCuCSBwl+oq3BinH5bpyeeubq8tvGPNOqCV86tr
	 kij4Vixc3r+MaKjHm974Mq9AUtsu3yzPNQOy2MH2zcJgJOzuCEjT3kY3PaZ6a0rCaw
	 VsCnf9mX6vyvT+W3avYgsQcQEf9dljJ9MLmqzA0fTRTmhwFhPT3W+sf4pneabl6/uG
	 hOrAYEOB5ncbtTbT1uBtgL7oMXnciBmoNTFwB+UZ8y+O4PPHHznHiUtYHuRR0ny674
	 mJDYgHagbGPqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43513808209;
	Fri, 20 Nov 2026 02:20:05 +0000 (UTC)
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
Subject: Re: [PATCH net] MAINTAINERS: add Willem de Bruijn to networking
 maintainers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514120453.3982074.9533130612474958102.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:20:04 +0000
References: <20261118195525.3449546-1-kuba@kernel.org>
In-Reply-To: <20261118195525.3449546-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, andrew@lunn.ch,
 willemb@google.com, edumazet@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 11:55:25 -0800 you wrote:
> Willem is one of the pillars of the community and already
> maintains a bunch of core protocols and pieces of the stack.
> Make Willem a maintainer of all of networking.
> 
> Acked-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Willem de Bruijn <willemb@google.com>
> Acked-by: Simon Horman <horms@kernel.org>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> Acked-by: Eric Dumazet <edumazet@kernel.org>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] MAINTAINERS: add Willem de Bruijn to networking maintainers
    https://git.kernel.org/netdev/net/c/d0c28729c10f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



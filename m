Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696208;
	b=WP6jtCLtLeCigTidjyzw9Bms3FJwNMNd8fXX3g4BAz8Huii98iutJ3Q+/C04qbB7tHqV
	 VuWFEP7bzr63ImEY7w36DhKRmlHbITOK8kAS3sgpScTzdRedHEbAMO31YbCKoG0pXLShU
	 xaMVdicXs6094HuxTVNSRRiPLaHGr9VsTm3pZ4m3t/ydXW7Y/IjZUSUOpT9nwcI9zrwSE
	 04QkGYkNruNGK2mRohw+/3PntPQGOhlNLM3lSZIc6HFJMuvmBL8JMHZfJoWMsfvlnPOL/
	 EmMiUqkIh8yCLp4BgTWiet9NR/sN3PvOr9Pa/uLqtejqa7hZfCWnyCJ1nZ9ANMvNe+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696208;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2JcUQEufPKK062OffZmjGcMramKRVL5iAMDN8dKwrmQ=;
	b=kvIPyWSOqfFF6vtV8DwC1jZFZLWEWmD0/V55FC5JWY5dGAUzg/2K3iijJC94CidyZr4F
	 7OEQuHxl3tQhBoopc2h8GwNn0bVSY3HFL8Z0hhr1ywyLZz4ssfGoZK2kZALdTY1igqvhJ
	 /sVv8wwo5eYZX+8bhoq6O5+olgEBZHUEWsX27ACGibui8yh/vCdAsiXqH6Y9we2RJcVrC
	 UWU5BPsw+B7qULwsUREjnOJV/PARlVp3BUMWv16T7KwNDvUlmsqNHcvN6kgwi1Ptjmw6/
	 yi4I7KG8RGAxOAfALjNVQ0iQbxPR4kE0hEx+bnSkJOF3UPb5+uOOWTaxVdMprhuSMAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnhDBjoM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30151606A31E;
	Thu, 26 Nov 2026 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnhDBjoM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6981F000C0;
	Thu, 26 Nov 2026 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696208;
	bh=2JcUQEufPKK062OffZmjGcMramKRVL5iAMDN8dKwrmQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LnhDBjoMNviGeSQN+2+JMfVkLVXS+0sueQtzdRPAgrYWLcuBp4PmpUtCGYMlEIz9g
	 nT+8+V4PhczyesrX8+3GaSOQ7abKNbfFQcLs8f2lnBI8eRA3Ki8+2GWu8H0ovNqp56
	 qTIM+77iAPPghBrcAY3z+fZDmtS2zOSkkTXMTuE8fLyZZ3jAX9zAkv3O22Wm5pi459
	 aHRqr4cEmmQdcvVonna3TlUAZFc3xE7yKjTNMCwGTI3fu0Gv0gmlPAqWthQfwAuZyk
	 1tQAYDecFYx+wb7ydvice53/fzdhIitmbk4CQPh6aWHN5wwBCGSJhBa1wa6XZeApQD
	 +IdaPGmmYqpGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1485380A96A;
	Thu, 26 Nov 2026 12:30:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/6] net: mvneta: fix the TX queue arbitration
 and
 the mqprio offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179569620677.1794069.2209582235932936688.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 12:30:06 +0000
References: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
In-Reply-To: <20261118093012.90121-1-pepe.schlehofer@gmail.com>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: netdev@vger.kernel.org, marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, w@1wt.eu, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 10:30:06 +0100 you wrote:
> The NETA TX arbiter is left at its reset default, fixed priority.
> Under load a busy TX queue starves the others. OpenWrt has worked
> around this since 2017 by sending all TX traffic of its 32-bit boards
> through queue 0 [1].
> 
> Patch 6 serves the TX queues in weighted round robin, as mvpp2 does.
> With an mqprio offload the fixed priority stays, so a class that fills
> the link still starves the lower classes. With the default priority
> map this includes ARP, which is in class 0.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/6] net: mvneta: lift the per-queue TX rate limits
    https://git.kernel.org/netdev/net-next/c/3df2dec2bf57
  - [net-next,v4,2/6] net: mvneta: fix the removal of the mqprio offload
    https://git.kernel.org/netdev/net-next/c/4e26c63e8d58
  - [net-next,v4,3/6] net: mvneta: check the TX queue range of an mqprio offload
    https://git.kernel.org/netdev/net-next/c/427360d7b71c
  - [net-next,v4,4/6] net: mvneta: keep the TX rate limits across open and MTU change
    https://git.kernel.org/netdev/net-next/c/96ef1ae9e1de
  - [net-next,v4,5/6] net: mvneta: validate an mqprio setup before applying it
    https://git.kernel.org/netdev/net-next/c/b95f2641df3d
  - [net-next,v4,6/6] net: mvneta: serve the TX queues in weighted round robin
    https://git.kernel.org/netdev/net-next/c/3977c38edc0c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



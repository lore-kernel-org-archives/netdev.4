Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795144814;
	b=RXfZ+ZvqZXtC4/eXH5phBcRntWcsQPe9ARZIushovQnBsvKIy8OTdjThJ5O266jcCE01
	 R4XCQ36bVOcpjJyzBiHxVXy4f4QJKM9Q0DcKXhzSOWJowzuurxg7XGDoEewgaZek7XGEu
	 Dugdj4iC0xYMWfV6ApODOhJ3dwjmoUlxORaTF1jWmp3mfz3FQ1yO28ZUjkYIIDPy9EIfZ
	 ekbZqk3/502+l9ZS8dG8349ApfixIXruRQH10c9VKyNZiBybxSRhij0dK6ZjJoqgBjxVg
	 198DWJhhbyUAuatFZj+U2UR/niMqhwGg4fffBxHY5k4Y2TlL2MDEjrACB2NP3VlQpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795144814;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Fn14pDsJOXNYBR0Hx6ngL3nO3uLg8RV/4h744OUD760=;
	b=oSwOyzThPXx8aSbfUJuCRUOI+qMJ7nJCzXIRMWh2EMQP+OxFvuhVr1ds3tOhM0BxbYfv
	 Mi7lpzRMrXZg7cVNP2xVEoUCppVur4h2HNLE3MFf0kp1wNyz1iuWpuO14Kb7+IlFsYNTa
	 HMb0cmJf62gBsgclZWIDMWO8ySFNjn6FdF/aDrH1euRuzIOh8A40K+SVHIZnhxOaq5arA
	 fgkhLhNIELp2aFRsOovX81/XLcjl0dDf2SyqY+vqrhiA6PZ4mK2huwzGChR+WbZv3SPQz
	 6SrLGiuQoEhJ9EOnOBOg4hcAAjT6ufrNxnmxH7snTZ1ZXjgt3ZEj3Ogniz7vEubm8LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAYywufS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA70F60A2625
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAYywufS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F631F000C4;
	Fri, 20 Nov 2026 03:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795144814;
	bh=Fn14pDsJOXNYBR0Hx6ngL3nO3uLg8RV/4h744OUD760=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MAYywufS9MQgnywlry9u6bOvxxIFA+71OAu5P2NQg2AiKnpCbRn6OoZGINN0WqIwk
	 uB73R2XccVXGVkJr43zN3c34PjQM59vCtWtn7Nnf/PLN+0OZ8m2DXjhFaUDq+Uham3
	 nDGgQvfSxHMv5txWWcOWC20jlPNIHFK/2YSnSdioAgVd5Jf9ksSb1Eb5t2wDONRdWU
	 o+pIgiZbRVMDvEUujSJZ0G/c/FqnnLHk2WhYR+oUHtVvkfAG11U1H1jCPBao6hBgNI
	 /jl3MHcHmFF904KPmGGs7XEBIetclQ8tNodXCm5OLfGeyk+27MrnaDiKogHBayZ+Dv
	 tD8N+8rtQcq5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15503808209;
	Fri, 20 Nov 2026 03:20:13 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net/packet: wait for a single RCU grace period
 in
 packet_release()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514481252.4002121.7167185361157860861.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 03:20:12 +0000
References: <20261118211439.1453635-1-edumazet@kernel.org>
In-Reply-To: <20261118211439.1453635-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 22:14:39 +0100 you wrote:
> Closing an AF_PACKET socket waits for one RCU grace period per ring
> in packet_set_ring(), then for another one at the end of
> packet_release(). A socket with an rx ring (libpcap, tcpdump) pays for
> two grace periods, a socket with both rx and tx rings for three.
> 
> All the RCU unpublishing is done at the beginning of packet_release(),
> when unregister_prot_hook() removes the socket from the ptype lists or
> from its fanout group. Nothing is unpublished after that point:
> 
> [...]

Here is the summary with links:
  - [net-next] net/packet: wait for a single RCU grace period in packet_release()
    https://git.kernel.org/netdev/net-next/c/2208ab00f4f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



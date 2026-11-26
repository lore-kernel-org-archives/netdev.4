Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704006;
	b=YAKqsFSRx1q+6OfYksVO0BchS13Rduk9n5JbNkoo48pMq/KG0UCDcuOl1oOgnuTpwrw+
	 WHG1qeCkKczuNe/o4iFPeL6B7NsvOOGvegp9rR5Oc9zjCeFBbxJ+zt3wCqHNpJz+JQ2PF
	 brHX9QteufGDTV9ec7ULxBrYAvTtk69ofk8w/BFfvmNavfx7lrjWQm//JEgI1Kd+FeGbd
	 ghqZOgEFTzp12svnadxt4B+1iCP6eA9Qae8+V2Fgrvci6TKdZUk6RyLrcNup5Po2krobf
	 agNbx+7dL+jI781mjfhjVrcsrLNyx6XyLchwNPbVmCJz6qDsjhMqqwLBH6yNVmWEWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=bLpMVTvmslHL+ssqcpZsOrXgszOR9judXGULCxVmx60=;
	b=JoN6XTWePPJJp/j6eO8jrb/MA3Nfyp4DSgirGrHtoQg41eVUNMtRH740cwm6tySr4WIx
	 sDnld0q+svgihWYKJeyKBIX4q5ebI9EgrUe3GOLPQ3i99flcjI4bO8uSEZmnoX4TuOW1N
	 Y1BWVb5mL1bMdABw5yUIaeiXK1Isx0oBDWdY888ABCAyO6Q0xK+VEkrOlyUNeyKJNKQpI
	 8aPr336BMikMgUg9P+bQx9SX+kwF9hVikUkQskWdlB7ALg9X/ej4esMuOi0Y9tqEVmv2M
	 WqVwU92sc3aSWuSmFwgqZZg+f18EYmctu+TSSYWxfR9YHS0c+V8F4ZIXQpaeNcEqeSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a06OJAhO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C268606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a06OJAhO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B591F000C4;
	Thu, 26 Nov 2026 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704006;
	bh=bLpMVTvmslHL+ssqcpZsOrXgszOR9judXGULCxVmx60=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=a06OJAhOt2+6VAEmQr7KgVGT1PgPqNK8bahPv6oKHWdNhdsP+OnVZ1z+odRV0GpRW
	 3cWWnOHaS5Zo6hQK4eWhhkePGAYubRq4sn4gXSOryO0tOhyxKY1g5R/2nd9zEMhUoq
	 5kiPwdVD+b4jG5Y3MHhVBSXCmnqdrWYtbVZCu7HphH2zxjx/UN8uXGKAQGpAS8/dC0
	 7p4bf+ofGTH939ho0rnKwORLTZ583kMgFvsW9KYAP2iZsKVE51C2CcD7UkJgAUcx/P
	 xYIfjaZYpL0SJfdm/RA2Pw3draZS1woK+TPC1oUWSPIsCxMBSLAtzWGo07u02oBUqR
	 +9FvHjK69A+oQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15C8380AA5E;
	Thu, 26 Nov 2026 14:40:05 +0000 (UTC)
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
Subject: Re: [PATCH net] udp: only quit inuse scan early on identical
 SO_REUSEPORT
 sockets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179570400478.1866113.17394711120879763013.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 14:40:04 +0000
References: <20261119192142.2637952-1-dmnk@google.com>
In-Reply-To: <20261119192142.2637952-1-dmnk@google.com>
To: Dominik Maier <dmnk@google.com>
Cc: willemdebruijn.kernel@gmail.com, edumazet@kernel.org, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 dmnk+artist@google.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 20:21:42 +0100 you wrote:
> Commit df560056d960 ("udp: inuse checks can quit early for reuseport")
> optimized udp_lib_lport_inuse() and udp_lib_lport_inuse2() to return 0
> immediately upon encountering the first same-UID SO_REUSEPORT socket
> that matches under wildcard conflict rules.
> 
> However, a socket that matches under wildcard rules (or shares only a
> relaxed subset of bind attributes) does not guarantee that the remaining
> sockets in hslot->head or hslot2->head are conflict-free for the new
> socket. Because IPv4 UDP sockets prepend to the head of the hash chain,
> an unprivileged local user can bind a non-conflicting SO_REUSEPORT
> socket (e.g., 127.0.0.2:PORT) ahead of another user's exclusive
> 127.0.0.1:PORT UDP listener, then bind 0.0.0.0:PORT (returning early on
> 127.0.0.2:PORT without reaching the exclusive listener), and finally
> bind 127.0.0.1:PORT at the head of hslot2->head to intercept cross-UID
> UDP datagrams.
> 
> [...]

Here is the summary with links:
  - [net] udp: only quit inuse scan early on identical SO_REUSEPORT sockets
    https://git.kernel.org/netdev/net/c/d77700039d09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



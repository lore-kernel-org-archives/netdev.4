Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660210;
	b=LrA0lNvdPh1sItATkLnXwJ/xXq7JLbhCa77U2kgksYAERRH2H3fKyhY6/SpfkdVpL0XO
	 0q5kfOKfWjXDk6GdvS4TTGxJGz9Nfwa6tBpAUz2DUJj+d0X7ihAp1qTcJyXsb3z0Rjc58
	 KelboTl0V3m2wq/t8qga5d0CMJ7xhLtDxKFTsOQGwhmh+SMQhczOeDVpRUTaZ4crrSdqS
	 WGr6nyz2AIn3sYRVPcs3lVptT6TCbJrSLZrC7GU/ME4odhpYzxIF5K8L69pRAfVsAcq9e
	 OQC5bPSk2O/E4KOWM9SuMdpEGW8R1bD4vFDACfVIVV0S7Yy3OpazLGtjA23j7zHWMOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=CuTLuW99litnwhKjybz0qyePoE3fFf0bu/Q7994QcHc=;
	b=CJ7HPkfKJGIrYaGBv8cphhQsamOz2XvtjMb7hmV2NtYeJRugX43PQD+7icQL+UVxFkGc
	 iOQU2xC1tpGz+kpYudFAM7Ximd1ralPAIfsPZEZ8gQAOzMEcJVmYmv8t41rLDcolAcDnc
	 gygGuYW9lios181kdwAzdCA3iNr2722GgKBBjrl/Y/O3Nb6Tyqw0n383fNLEBcwqM+8P1
	 Ok49LOpf0BiPBdVwPKdh9eDFEy3CjZuCVvXivqeM4bjeNVB+aIU8rA/2Lbtne6alqQsSP
	 spGo6mKrBAumbkWshM32iLL4njq79BOz70MRnyMwS67ZmLRbVKQVjpDfh15L6xXgw1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCq29dqh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A61606A683
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KCq29dqh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435B41F000D1;
	Thu, 26 Nov 2026 02:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660210;
	bh=CuTLuW99litnwhKjybz0qyePoE3fFf0bu/Q7994QcHc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KCq29dqhBG1nFvfZpPoBAxGR7owTrZwESy9NGn/CeggWBMKjla2q7dB8p1UbihWUR
	 SkL55OM5V00l8juocio5e84Vnovfz30cnbcUVVLt8tkZZ3hAqRaxx6c4tQkQc+R+sB
	 qAsdgJJGNlPwHW1B6wJIoJ7uHmfqqHyj6WWm8AvIf3F5FhBj2zq8pIXYbQSWjfpDZG
	 yY4Y2p0ljG2Kx54IjbyYtNkcyEMFhaEQ4Vp0TM69+FYJNGtxI9szj8tZxdjiMlNSup
	 JFy1PNqH43NO5sJO6qtwOpL3R0vppoFxZ9E9mIpCNyQpjm2ag4o9GudtVUB5esfHbk
	 0kPZSdGd01qLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2FD3809A24;
	Thu, 26 Nov 2026 02:30:10 +0000 (UTC)
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
Subject: Re: [PATCH v2 net-next] tls: wait for a single RCU grace period in
 tls_device_down()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179566020877.1457344.3011566029447227321.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:30:08 +0000
References: <20261123092851.137140-1-edumazet@kernel.org>
In-Reply-To: <20261123092851.137140-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, kuniyu@google.com, horms@kernel.org,
 netdev@vger.kernel.org, jiayuan.chen@linux.dev

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Mon, 23 Nov 2026 10:28:51 +0100 you wrote:
> tls_device_down() calls synchronize_net() for each offloaded context
> bound to the device going down. As this runs from the NETDEV_DOWN
> notifier, a device with N offloaded sockets waits for N RCU grace
> periods while RTNL is held.
> 
> Split the loop:
> 
> [...]

Here is the summary with links:
  - [v2,net-next] tls: wait for a single RCU grace period in tls_device_down()
    https://git.kernel.org/netdev/net-next/c/b94392bfdd59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



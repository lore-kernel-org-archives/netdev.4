Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516212;
	b=y6M9S8g1r1hgvyjsYLFGE7JoCaVKYl1m/VzrsoK0KUNfnMZBWSsKlVmeRIMmDiUDYEIk
	 DadhA8i6LKpIE+uovAgvReFPQIow92zb4Nb4ytMI7CGf5/f/dxAq9p83YeSge6E0bTv5/
	 qmJxzsxfn5oNuk66yNqE8ErWcOJO7H8/6Kzq52zh0gB5k+ecn2XLwcnJ3zFZXcZ5rM1js
	 k/fB1t2zjFxKdonO212Zg+lmseY1FcAuhoiiA8cRUGv9WRtimBz1l8lETAVQMOXbJdSJA
	 /pJ7kJTDvlcDP4gvMuowGeMUFEKxPO4fzL9DQVwG72zOLi8tMZzVs2poQjLb/YImECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516212;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=EsF9EevdYBXXWKZREWB5ipTnH3GHZRdyoVvIk1kOoAI=;
	b=P8HOfobKubCZjQU1i9c1v6593eTsdvyBH4bZLVOPQysjTPHMtOmzROw5qtGjuP2CxbjS
	 CNxscSv+MAwdFXptSgX7dlmjXjOC7UeiLLOvbN5q9s2G8VXNtiCDZcGcZuspaPdkDlXh6
	 2hiZnR8BKpjNetFwNs6SNK4jG4l8cV4na2rKn9ouAtGEvC4tI64pX3hWYjKywSjsiFiaB
	 ChdtMhRqQ/0Y+CsykLbQtbMEqs4ItijFtGjbt7QEImO+YuMUvKnr4Dvd3nJo+yKCAO+ia
	 5iRsMkSjUdJ876r2WloJeDz5HLfFG6Cog4TcnhIe5eOpbqq857552ZgcCCatNSeuwkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nm6NaEhs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F1F606A33D
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nm6NaEhs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450BB1F000D8;
	Tue, 24 Nov 2026 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795516211;
	bh=EsF9EevdYBXXWKZREWB5ipTnH3GHZRdyoVvIk1kOoAI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nm6NaEhs4zPYWEYSIxSh0fadh+4b9q5eA+wlKVROYQimZ1AcCePfVUgWz036JXyIg
	 rmzGlaapqWbFJXk4eVNqUphh9QoxZ2/qTUGcvWXZSGmtN7whbSUJXyMDsceyrw4LUZ
	 T8G3SSYNChcCzntyxgZue/SfrE1LXgD6QtYjJ1ico9XUx4kzX31AG6vskCtHfY5jR6
	 4Ux22aBDM+GdMA/anSQ3h4g6ynD09bahktzUfCHdtvKiTak9tgXvvWiK74qwLx5Etx
	 mL8lVHnkWYwhFZ53+woQgA2BYkFiXT9gf/G0sbVQTIfhXqVYmkROoXCOOOHsSYGt2g
	 GeDAIqyGoS/4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A34A3931025;
	Tue, 24 Nov 2026 10:30:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3] net: tn40xx: avoid early firmware node
 release
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179551620977.3433632.17902196513306006139.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 10:30:09 +0000
References: <20261118163602.1141227-1-johan@kernel.org>
In-Reply-To: <20261118163602.1141227-1-johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: fujita.tomonori@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, hfdevel@gmx.net

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 17:36:02 +0100 you wrote:
> The mdiobus allocated by tn40_mdiobus_init() has no primary firmware
> node so its firmware node pointer points to the secondary software node
> added by device_add_software_node() and whose reference is released by
> device_remove_software_node().
> 
> As device_remove_software_node() clears the firmware node pointer, any
> reference taken by __mdiobus_register() needs to dropped before removing
> the software node. This is currently done unconditionally however, which
> could result in the dropping of a reference that was never taken if
> registrations fails early on.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: tn40xx: avoid early firmware node release
    https://git.kernel.org/netdev/net-next/c/0f0ec7ad716c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



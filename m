Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127409;
	b=uv67kYkEzv/AQzoX9+hGKVZNrwBbyMvSO2vPuRJrlxPuCyLAnZ0NjKRaCC9u4eohxVdN
	 Fg0rqN3TfV+Sm1yD+wVL6zBhfB6sKXHe6cweOexy3xxmUkJ4CehxBfY7E1LyreXyMIFUo
	 TLcMmVyvTiQCSLTkFoH4UF1xvctqS24OtNBPgpps8jXTbZzDWQnK5ooysKCkcNc53cFM2
	 MLFycDslb4PmOvDXNxThbWxXU1+jYDqe26EJfnzga1xKQKNzGKDersVxCwUOMTz9Jm9sq
	 SirWuEodV/P5LqRE6PnRV3S7nm2yRtusR8BFgoD4hN5yOQiT24SEMhitNBys6InOZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127409;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=S7dKCPHiSRAWQ9ddU1m1cmm8om8WXp60NnZvtNk0cmw=;
	b=3pBIQAmUCKtGQnEpme1nW/G0wFffS6OJghDVCDyMuy5oEm8Wd78E5BLgJb45dngjpsxW
	 FablV6B4j7tqCYNt+1ssr52+cP8PRQhhlgGNo3KgB50cDxASDeUftreKqrKP5Vx0KvsuH
	 t1dCnMZ7bB7q4P56gFzdkyOmP1w1u1jC1/w4GcS5nLSVCnKq+SCZ21r4h+4/r2f7+36kc
	 oZoWgYUUcYm4mNWdeLWteD+sG7HrFxP4F6qTrGrEVvHkaVmijx3P4hMqTsHcY32XWgrom
	 qkPt7fPeSizFG5C5wGn4HnzOalAy1s/cVWJYO75DjZLuQZteUR0AKcaEcK9Rp9wA7vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BStRh6/Z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD73606A332;
	Thu, 19 Nov 2026 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BStRh6/Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFBCE1F000C0;
	Thu, 19 Nov 2026 22:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127408;
	bh=S7dKCPHiSRAWQ9ddU1m1cmm8om8WXp60NnZvtNk0cmw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BStRh6/ZPu8YUNaLdgzXpLfOkH6VBNGjGnCqMgnCSlHwALLD92PyhzvDinli1yPmA
	 LJoX7G8n67LAdx9UTp8NpLU/yldY1TZ+fBpHUeaPib9iVqJq+xzquK3OBaqnr0D9Bm
	 I+GXeFrFyv9zbUYdD2sMKQMRtFdLfMLtilfFSe+hQDHX+KUmcb438wGQM6lkQvlVIa
	 yqZog9C7RygE81O08qU3YR5thtx/cuMVluO9nTjziXY0za+8Y+O/09Z2IRsMGoE/Sk
	 JuzGorECW81Nc9LaKNEa9Kf2O6oSJyiM0HpYwfuhLXlyWmoKNecbzkgKnWNHk59QI1
	 dtbUOKVxvi2uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F93808209;
	Thu, 19 Nov 2026 22:30:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: lan966x: extract IFH fields with word loads
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179512740728.3899857.6173388789030590538.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 22:30:07 +0000
References: <20261117-lan966x-ifh-word-loads-v1-1-93063ec6b701@microchip.com>
In-Reply-To: <20261117-lan966x-ifh-word-loads-v1-1-93063ec6b701@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 13:49:34 +0100 you wrote:
> Every frame the CPU receives goes through lan966x_ifh_get() for its
> source port and timestamp. lan966x_ifh_get() builds each field one bit
> at a time, with a 64 bit shift for each bit.
> 
> On a lan9668, this bit loop takes about an eighth of the CPU time spent
> on receiving a small frame, which limits the RX frame rate.
> 
> [...]

Here is the summary with links:
  - [net-next] net: lan966x: extract IFH fields with word loads
    https://git.kernel.org/netdev/net-next/c/6d53e01dd9bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



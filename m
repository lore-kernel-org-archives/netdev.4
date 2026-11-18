Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964808;
	b=fSZBksnabyW4m7+22srghJGg1OvoLMxN1pUj6bDMFXO4ExpVLvXbqYq5CP2SzKC1j3u4
	 5NX9cdjOr5xlOrI3qYrqdjepBBQIH+4pihpF5FGpR3zq58ea7miIK8H5c0nySV6N1oBTj
	 vllGwt3Iu5doeRah/DD7ymILYJ2PWVOxMNEdwzQ8DHRet3Rs3YS9GydDTwQVZNXdmFTS6
	 jEBgeJiYXFMHTfkJ0bO8Ja6a3TOi7Kqn5AfrLqRZcH3z9FN8g9LKRUGQoFYyZFPuy/6AV
	 V5RSoLD81RhhQQbz+WtUKwB9MNvjQxE18hBaHJwAREpm+bawjk3ZM3co6Muxng3siUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964808;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=eJUTXskiWgQBSdUMfOC5s2GeR5EqKdABOK9Mklx8/Js=;
	b=PgSzoyp3nw0kZY3WaKyUj3GIORkAhVzmzXPfIEzYL+FK4CjHjb84PpNKEVM1dt92lBij
	 0a91ji2Mozrq3XFp/VoWO5VLkG+vwuuNfNi0fEUvNLFQE4UrmFHBFrTagkBWlzOzKUbqX
	 yvhIXiNjgN17xYLIcpQX1J/DezdM615o/grLXid36h+hR0qxeI7qKAN6QZ/qyYoFMjmEz
	 5lwpGd7BjfdJJK3TMZ9I1JABifEd1MCO8HSCCuIl/VRc7HwRT4v+DxPLRFNLU8C68LrIU
	 LuAjx5i6XSlNQiX3yjCHnVo4FQ7uzBZ5g94tRbZO3SM3FvaLNkrZGXR4muenDpWnvxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3LkhCob;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77114606A332;
	Wed, 18 Nov 2026 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3LkhCob
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461EF1F000C5;
	Wed, 18 Nov 2026 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964808;
	bh=eJUTXskiWgQBSdUMfOC5s2GeR5EqKdABOK9Mklx8/Js=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n3LkhCob7vuvUsib2hG3DRnGkTgndMrk12dBHi7DvL0wZ3vNVlR9jksr4wtSgs17G
	 V5TTFq5OR7IdC8xHdUG99bLFzgkEjRmkAHiaJs8/hZ7p1Ba+PZyAdiw+vMLSQ0OCfK
	 a/dPu3r7YMIL2s8pUF0cg1p0aOfsP5HWoL8weh+FNK3ZPKo/CpyZDJol6cDVsI0+1X
	 YStwCMVC61Zsn8IMxVkPVWfOlBc2RCrMpun59Dh/e0LS9OqLwo0/e7oO5HC+f4euQH
	 K1sc7ngHt4m8qsc80g5Nisy1KKQnp1kox5SYFa9jHh5p5MsRvUM9CKo3muVm5fHoEa
	 UYiTHTWpALAYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3F5392B1FE;
	Wed, 18 Nov 2026 01:20:08 +0000 (UTC)
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
Subject: Re: [PATCH net] neighbour: do not update an existing proxy entry on
 SIOCSARP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496480678.1388923.12375210323893207367.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:20:06 +0000
References: <20261113193355.3820232-1-hengyul@cs.unc.edu>
In-Reply-To: <20261113193355.3820232-1-hengyul@cs.unc.edu>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, kuniyu@google.com, dsahern@kernel.org, idosch@nvidia.com,
 horms@kernel.org, sd@queasysnail.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 14:33:55 -0500 you wrote:
> Commit dc2a27e524ac ("neighbour: Update pneigh_entry in
> pneigh_create().") moved the update of flags, protocol and permanent
> from neigh_add() into pneigh_create().
> 
> However, arp_req_set_public() also calls pneigh_create(), with all
> three set to zero. As of now, SIOCSARP on an address that already has a
> proxy entry clears the flags of the entry and makes it non-permanent.
> The entry is then removed when the carrier goes down, and the host no
> longer answers ARP requests for the address.
> 
> [...]

Here is the summary with links:
  - [net] neighbour: do not update an existing proxy entry on SIOCSARP
    https://git.kernel.org/netdev/net/c/035fe1092f38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



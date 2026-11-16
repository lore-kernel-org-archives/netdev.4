Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871811;
	b=zMBw1/gYGQ8DKca5C0Ze4bC85TNGiPTlB3gwFfarCZUMmF+ljfKNYzEdf+8Yb2fAowIh
	 jM4xE0R61aSS8m084Ddp0DXg+kt4vGXj3EYrzuv1Ret19DX2Gr/enGZi+F5m3WCfyknGh
	 OsX2uH4JgwBZzk5/+DnngZtzoLtkm26+OVks4AZfh8v7wJFl4QNFN408nBmlpyqSiB7pv
	 fV+IeY9oek8lKOxm7djWAgeSmzqStLakXXbBukstfb9x+F73QQdfkVfKzthgTmznBpisV
	 1AHUNInwnSrTPyD20Eh2VZ5RQoJ/9wCk3TX06bT1/Bk6RjAuSjJxGiEqccYzjbTYoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871811;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=AWnlNjcGotVnwaX8dQ3jtdiRufZvI6bnqo1TsvdLexM=;
	b=XmgB2aqG8wl9pOVWQQtBjTyAtGOTEz8BXi9Vb5z2/k7bzLuNf5x2qGMLmAB93Pf4V+9Q
	 Xc7cpNXdKAnPSdyG4GFnVN7MMuykqs9K9bO13UytfH/RHXVIbn0aoC5WDPzLMEuXZAQjK
	 JmISwvS6mFbCrMZ00COdkH8C76Qvcrp7kOZJuKFYLt0sx4G9WMwrP78f56J8aR54T7QdF
	 IhTXkKUsr8A8TKhGkufl39oIJ0sQYhUIatvfvEXGuEoF2+ImPEgUSPHsaZvxm6eQJKdET
	 kuJ5nKY2WcX6zB0+QXHEYBMlM3f2HMTVYva5xeUmoHUGB1lj5fZe3I/duhNyCd5dCIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuleWpFZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB5606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 23:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QuleWpFZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470311F000C6;
	Mon, 16 Nov 2026 23:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794871811;
	bh=AWnlNjcGotVnwaX8dQ3jtdiRufZvI6bnqo1TsvdLexM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QuleWpFZjjnDWcO2SQFAvigNzv75lG7ENpfOvMnsjeiy2iIQjcBJFZJXYxozx5dn0
	 fYD5ysM9bkoD9KowkN6hW8twcTkcTUG7jk1wpEVEeIS1/XDAlSrlEndJzQDRK5jgWY
	 hBR7Lg8saVrX8a0OA+/+xijJGBNO52XC6qhxZ1vVnTgkk/EBsqryYJs+BX+IEJP9VL
	 0B7QVtGP9Fi/Actrj/HQ9X/8AV8P/L7gpJ+hwcPVmgT38v05LMmONPws133BWCuwQe
	 xfavke3OyKeCN2L4+YX7ZHu7jyeWsLdUNJ5SR5CN+T2K3MMUIRDP8sqjVbP8M6yBEl
	 4bbas5Uef4bQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2D5391B059;
	Mon, 16 Nov 2026 23:30:11 +0000 (UTC)
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
Subject: Re: [PATCH net v7 0/2] enic: retain admin DMA resources and identify
 V2 VFs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179487180977.238365.17100707829599131024.git-patchwork-notify@kernel.org>
Date: Mon, 16 Nov 2026 23:30:09 +0000
References: 
 <20261109-b4-enic-dma-vf-index-net-generic-first-v1-20261010-v7-0-30ca6f467673@cisco.com>
In-Reply-To: 
 <20261109-b4-enic-dma-vf-index-net-generic-first-v1-20261010-v7-0-30ca6f467673@cisco.com>
To: Satish Kharat <satishkh@cisco.com>
Cc: netdev@vger.kernel.org, sebaddel@cisco.com, aradhana@cisco.com,
 rfaucett@cisco.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Nov 2026 12:39:33 -0800 you wrote:
> Fix premature freeing of admin-channel buffers and set the correct V2 VF
> source ID in mailbox messages. This is v7 of the two-patch admin-only
> series. The generic datapath quarantine proposal withdrawn in v2 remains
> out of scope, including its page-pool/device lifetime problem.
> 
> The first patch releases the admin WQ/RQ/CQ allocation only after both
> complete queue-disable helpers succeed. Give both queues a first attempt,
> then retry once only a helper which timed out. The 500 ms polling bound
> is local to admin shutdown, and both RQ disable/check passes are preserved.
> Ordinary datapath and DEVCMD2 queue timeouts are unchanged. Admin receive
> buffers are driver-owned mappings, not page-pool pages returned later
> from the networking stack.
> 
> [...]

Here is the summary with links:
  - [net,v7,1/2] enic: retain admin-channel DMA until queues stop
    https://git.kernel.org/netdev/net-next/c/b3ae89a2e167
  - [net,v7,2/2] enic: require DEVCMD2 and set the V2 VF mailbox source
    https://git.kernel.org/netdev/net-next/c/65230b3ffd75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



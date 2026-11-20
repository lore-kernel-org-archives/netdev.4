Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134008;
	b=KGX5zMlZzXJCG45bRugIqKTJ7tr2ilmQvn1jAGX4hVUrb/82wt3MK6/IBZyVQcl54SrC
	 TBpKb5NgyBTz/quYwN6dvErIsP85fXCZdKKhJG+l0TMn33s6c/pDeZRAHSlGxv9iTpAV1
	 daBkwcz17FrfP2XKynEcy7DS6ovIP3Ve66x840lmYuqwSDdBKu/z3GTnacK9k1p+76tne
	 m7MPxbTfb6i/9HAPiVm5iNGMZrOyDgeFB/W6QGsajs6w1VrHhuICpEyCi3jFPzH3kEtxl
	 IccOjcld28deiMDLOpXw8s2+YupOZ4vzBbvPzOYa86RnrZk+qYpG2HbMCecAt6SNJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134008;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Qpn6qAydWqmOHij+CmTZiZIlVhqlL6VvvY8KVcbTtZE=;
	b=2lq3G/4yWVMwphoyHUxZlDHl9d/oP1kpivFZpN/vs0Wv16rk0ydQM2hUqmErGZ5HgCWk
	 PdT7WfptjoXiBOu82yBqgQzYowRmu6uBJMCJ7odpWWLU4rmpLyioUqvh0SIiFRmCTEF+P
	 m3ifE/VljXOgF5f1AgV41KmiOHCQa1x5oRvyF/PtvqZEwU0hZ8clEqaaVwARlbDMbUUKF
	 PMGIlNrYu9Qxvd6C9lleBHoF2OAfzCLOBjb2QQK1q8PkNk/7KiBRCuJG/TyO9q2S7dK0j
	 NfGKww4Ie3o/8yeHJLVvnxedg3mkHHVZ9PuZ1EmA8c1KVdVGCt6C+Pz4+iXUkNhbCOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0LHfYeR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C4606A330;
	Fri, 20 Nov 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0LHfYeR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DC41F000C4;
	Fri, 20 Nov 2026 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134008;
	bh=Qpn6qAydWqmOHij+CmTZiZIlVhqlL6VvvY8KVcbTtZE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=D0LHfYeRBdF+FOchM2If9OlMKNYnHUUykiUiUfWj7ivnncwrFiPVVcA7Q6Aez778w
	 x6xvhq+4OcASnDqEa8v904/3C8davWTb+CYNVVzfq2doiZPCkMBOEcvoszc+HTjOV1
	 6KI9BV+Fbs9IoSZ3M6NSF3ya211G3oURGzIiFJQbQekFeQVaHFUdWve3g/J70SzOAn
	 zIns4UEfjOksPK/yefJXQC8xhSGg9NH4ItgZIHbROk+8Pq+t8DPZ8SqlB9J4NiBlA/
	 yBuUph6GgkkoyDN28UaKmSKhr7ecoKUpINQDEwSuLIgtJ0G9UTZ7CacljcRC7a3N4s
	 SXQD0OTmJl0tA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14F63808209;
	Fri, 20 Nov 2026 00:20:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/4] eth: mpnic: L2 address filtering
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513400678.3940111.14124494697474875515.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 00:20:06 +0000
References: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
In-Reply-To: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, dimitri.daskalakis1@gmail.com, mohsin.bashr@gmail.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 13:11:18 -0800 you wrote:
> The mpnic device has a TCAM that is keyed on DMAC addresses in the Rx
> path. Up to this point, the TCAM was unprogrammed, and the default
> action was set to pass all traffic to the host. This series programs the
> TCAM to filter Rx packets based on DMAC address.
> 
> The device, broadcast, sencondary unicast and multicast addresses are
> added to the DMAC filter. Promiscuous and all-multicast modes are also
> supported by reserving the last entry in the TCAM for inexact matches.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] eth: mpnic: add filters for dev_addr and broadcast address
    https://git.kernel.org/netdev/net-next/c/419c42cb567e
  - [net-next,2/4] eth: mpnic: add promiscuous and all-multicast filters
    https://git.kernel.org/netdev/net-next/c/5f969cf59b64
  - [net-next,3/4] eth: mpnic: sync unicast and multicast address lists
    https://git.kernel.org/netdev/net-next/c/135603cd9dd9
  - [net-next,4/4] eth: mpnic: support changing the MAC address
    https://git.kernel.org/netdev/net-next/c/1b271185a32b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



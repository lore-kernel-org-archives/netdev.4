Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134613;
	b=HKmAm6GgHPoMhjTK35fU537C5YUg45U1dZL44tsCdMaWsrDJM0ExjbB9uwuqEyeb4daV
	 6WnnVivQUITCCKQy5sSPP2dxwLkyzQDrgZNarCY57jq43+JX/GOoJiIAID7Op2qHdS27w
	 BNqfdzBnLSnAR9rJkblZITKC+67kFUGz7OOjOUQbxzQe+cnJfN3cuaxGnQCX0QGy7gUEm
	 hG+DWpZSSRTa7RG/tNACZwWwlb3IihaICjtyVxJz9Que9R1RH20//0Lg8HIsmNm9P9ArM
	 scpBFyfTIAW69+IYC4qh0ZfXZD3QxmuMzsDHsml1FDtXHSHp8qmyRCcXCAmBVUWTf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134613;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=AngAzITub0A3x9auQ+0QbkscxzPM0Pwj+8cGEPHrpl8=;
	b=wgrgqLWubc4Xg2j1PYMdKK2+4LBBzGDBfutL71/Kzb8FrmphLgzVOuxGZ/Do3ocGdzHe
	 a4Mi3+gbOM7ZCjJtPAUIo2thRUSrg/NA49hE1lrsdt8RadCO7ZEVBUNUo5vA/uBYzHGCi
	 qw8H4dV5v9BiGKa6LlNrnU9/0UUhqpFnDvGv5iN6F680PhwOZAV6fdw26kFsmnheOSEaM
	 +s1JjDvkNdqE89SBNrqRNSfczIIy5cFZH4AEWeuTYSyCAHz0k5+4QeCuzF+aDg21xaEgL
	 FEFjyk94l2phHkNA5crI75PzzRHfwVSG3KPSEz5HkSerKz9qFXowTlevqicMvy5t7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mvrtx4uf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C1D60A260C;
	Fri, 20 Nov 2026 00:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mvrtx4uf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062581F000EC;
	Fri, 20 Nov 2026 00:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134613;
	bh=AngAzITub0A3x9auQ+0QbkscxzPM0Pwj+8cGEPHrpl8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Mvrtx4ufXhCYG7BiTSRQ2AYUQUpzQ7FcDIHgKPaaCufIBGQuNZr8xpMurAoNb3g9N
	 AQGvhQnEeBDD2QK727df5FsqUenH5oH8/NbQ4iLgaBJ7A0gyqufGRstvaOlnIvVCir
	 tfKmyG29L+Lk4mz4+TLF3smGMto3ptbvRxUq4Ei+9u8GmZkdObJmUn2bqE0cy5Yh+w
	 KIgBlhjMCYkRzNDk8kb5lVERiU9k98Yz5LZ/E8BPZi+5u+QAXdHKFPTbPSdRcK3EUH
	 96be6lDYkgOf6xCGfjKNfThqGxiovFB2mi9s4Xw3D0idvn5Apb6EVmWWAMKlfRozTZ
	 5GD6PdyUDL6rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15273808209;
	Fri, 20 Nov 2026 00:30:12 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: use inet_rcv_saddr_any() in udp_tunnel and
 ping
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513461152.3945374.6656914068258741357.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 00:30:11 +0000
References: <20261116200854.3799498-1-antonio@mandelbit.com>
In-Reply-To: <20261116200854.3799498-1-antonio@mandelbit.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: netdev@vger.kernel.org, kuniyu@google.com, dsahern@kernel.org,
 idosch@nvidia.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, ncardwell@google.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 21:08:53 +0100 you wrote:
> udp_tunnel_core.c carries its own copy of inet_rcv_saddr_any(),
> sk_saddr_any(), as it can be built as a module while
> inet_rcv_saddr_any() is not exported, and ping_bind() open-codes the
> same check for its AF_INET and AF_INET6 sockets.
> 
> Make inet_rcv_saddr_any() a static inline in <net/addrconf.h>, where it
> is already declared, and use it in both places.
> 
> [...]

Here is the summary with links:
  - [net-next] net: use inet_rcv_saddr_any() in udp_tunnel and ping
    https://git.kernel.org/netdev/net-next/c/03c18e3989c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



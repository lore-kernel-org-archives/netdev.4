Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533606;
	b=TNZI2SkycAPStB/YbPOFfcq0qPWfK9xXrqM/BkkSt3mX2fidyRCS7L6xdy3Q9u3Fezvo
	 J8ob7V0/56RjciLqxAYnV4S80kSUyFRmatmNi75KQTSarggoju8oJm4GFRbxr11drTEgH
	 hPeXGtbFDA7Gi3GNMr/U63A0Sk24CO6461o4YtjNUb7kkXY42l6zhkGQZdyKIhSkL5iQy
	 WM07fPkQa/U89b7WtcDsP5syDltPhde42tr9iR437vZae0O6E0I365+Qa3ZbkLmPYauqL
	 9my3YKsPhJ7hent8b9llftiO0YSDwoQ6fG9xl3MkZFsPjWvonteX6ggXFnLFCmtte5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=8lhhEIhnsSMdAeahBuagq2dcObQ9f7qZivqCnpCb6r0=;
	b=P1+BN+Kb3WoH48LhP3uNClQWl6KLABETi/Yk0q26VEdmUPe4jxBlMSFbdV+7llj0+Q2S
	 7czhD8q4FqFCgNivl/0q5flkPvYG3QWHifpoC6+VX1/y9gwJiP5brYClMnwLkI6i0WcDF
	 1gT36snPgAOX0CsB86EPN1jRQcIB+GMequG9OECZNqagLFMeDrETxbfuSAfa334Rg6Uil
	 Ag7+LDUWQNmIra1Pc+Ag5U6OptnDWSuPuZaDEgvXPkyynS2yB9zPCbT25qYqud1yy0n7b
	 buoq3Lc7ebGVvI8wLk3MSlRaYvxWkX7lbGZ35/3AQ/xJ6ITMi/5/3I91gwgL8HncUQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhdnseWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F9D606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EhdnseWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444201F000CA;
	Tue, 24 Nov 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533606;
	bh=8lhhEIhnsSMdAeahBuagq2dcObQ9f7qZivqCnpCb6r0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EhdnseWgJlB881oaD/SYcq+NTTkOQSjN6WZQDkhAIiDNDe7NccHmAB3DFB2Lsgtju
	 pL8fQ1eZwEifBhlnxcKz1LdgX+neli93Fqi3Zz077gkqN+4KYTMh9qDwgB6U9bXrR9
	 oLosw4h/0qbfYhTyhcBUVTd701FBTvmvkj4f0s/RXOWuWaZ3HO/CEOy63ajS4vzcyS
	 /+Qp17D73qmWbP7aA7ths2hS6ALGXMznAbkO6zTeYforNbna9cPaOL2FgwaHEwwHNG
	 7StvHpfhnfC75x9zj04FlYrBa3D3Xs2J7EzpEoEwu088GGhKqhMES5NZweXf/gp4MV
	 xOlZUlbADXW4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3A83931129;
	Tue, 24 Nov 2026 15:20:06 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/2] net: gso: fraglist segmentation fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179553360503.3597123.12071768635664066323.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 15:20:05 +0000
References: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com>
In-Reply-To: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 23:46:38 -0500 you wrote:
> From: Willem de Bruijn <willemb@google.com>
> 
> Fix two issues when segmenting SKB_GSO_FRAGLIST packets.
> 
> Patch 1 unshares the head before the TCP fallback to skb_segment()
> rewrites the TCP checksum field.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: gso: cow head on tcp fraglist fallback to skb_segment
    https://git.kernel.org/netdev/net/c/3f137feaad8e
  - [net,v2,2/2] net: gso: fall back to skb_segment when fraglist cannot satisfy checksum
    https://git.kernel.org/netdev/net/c/ab5b219a7340

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



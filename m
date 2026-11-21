Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300207;
	b=5MNPjAGodcaGmVNGsElPBBg5ttRz3aX9jzGkP0g2N0BSuFGMNtgS684seDNxRfq6mLM6
	 4g2mNdCRCANI+ik0F0Yh4kLJoWAO9XVnr3TfmC70A1J9Mj2BXt+WdVnizqX5WzHnUS5+D
	 01Xbz+a8/4oBU6d+4bC48MCnxWlY036AI0rdF4tGvfRBx5bp9Sml92i+/1Zt/yeETJjHn
	 vDsqtqxpZ2vzgTJ6yRBp9smWx80TmkRhW28JFRFF7PMF5V/QYZTjoRzHyEg5lgW/WdS2Q
	 GFeXuXYmeurZOOG9zqqJvOkga7xmHhWyCT6zpjfw08RXLjIkno32sOiIpbjf6AxQu6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5JWJEVm5ycxocJaBKUv1x27gdNjptbNYtP5TvAZBP64=;
	b=DfLHhxmRi4yNUkU1y7qEZ/AeZFOwrWyNgu7JTtJAVTDyvotaQyu2fB2pP0BBrXCLpG33
	 SZc0GLtZkVfp10nTA1V+h/XChpZbgjPUxKpfD5wMwb0ijOWjFkVtcBoIyvtRfDXAKnpZZ
	 dbeHxr51RlXDeyg/QrB16ynYdxy3ejPGoJ0ZRH4qt5/bZDSvhYoM6fYYUtru5yQ+nflUC
	 2sjgg9MPToGhNQbygTcMZYep/7iIyqmbbLIVAeBIFQk1PSb8OwF4mPOBqlwlkM4Gg9fJ2
	 v/OiBUiIgX86Ou3OGkgSYMDxw41RHYOVs6OeVyzNMkmeL0qIS/OFiYwD5/NvhMriFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjUs8Ohg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30976606A32C;
	Sat, 21 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjUs8Ohg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E3C1F000C4;
	Sat, 21 Nov 2026 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795300207;
	bh=5JWJEVm5ycxocJaBKUv1x27gdNjptbNYtP5TvAZBP64=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XjUs8OhgGTwy90ejxwmUS83s/sNS0aa6x0gUtNvoNTr1teNMHoKQhfJOWGzm47xLk
	 YtJgKAuX8XX2C8L0ZCCT5HaebHnV7vxE5akI349CHbqFvpzwnm/z8T5sKvAx19eeRy
	 ctq5Za2Y+l0LbCa3PZg1H98AZGGLPjCdIOPfsmPT3NoatfH/wUT2O4iJ82rwwee8E/
	 nJHr1jL56JpGS3CTCmclstUMWJJN+s2Fo3vpd04+vMUHiXx7g828tDqLZUUXt1r0XL
	 bDL2WQmlKRkED1QIVX/2NmGTfWf6FJaY6TnFQ9KXokrcgSXI13GXQd+DggicOnh1mD
	 aLqNmDFc/V4IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F18B0391B081;
	Sat, 21 Nov 2026 22:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net v3 0/2] net: do not run out of frags in
 alloc_skb_with_frags()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530020578.1192635.2530675311737257518.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 22:30:05 +0000
References: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
In-Reply-To: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, almasrymina@google.com,
 daniel@iogearbox.net, willemb@google.com, willemdebruijn.kernel@gmail.com,
 mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com,
 narcisav.kernel@gmail.com, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 20:56:18 +0900 you wrote:
> alloc_skb_with_frags() can fail with -ENOBUFS for a data_len that passed
> its size check. Patch 1 fixes it, patch 2 adds a KUnit test.
> 
> The issues were found with the help of an AI coding assistant.
> 
> Changes in v3:
> - Patch 1: check the frags left only after a failed allocation, with a
>   shift (Eric).
> - Patch 1: say that the allocation still fails if the retry fails.
> - Patch 2: skip only if MAX_SKB_FRAGS - 1 order-3 pages can't be held
>   at once; one page was nearly always available (netdev AI review).
> - Shorter changelogs (Eric).
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] net: do not run out of frags in alloc_skb_with_frags()
    https://git.kernel.org/netdev/net/c/5924465bb4e9
  - [net,v3,2/2] net: add a KUnit test for the alloc_skb_with_frags() tail split
    https://git.kernel.org/netdev/net/c/e8c39bfac24d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



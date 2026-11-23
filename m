Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445405;
	b=z48xHFvWBPLyvBJ9a+LZ0bSxj1qXy57POGDiV53MbXHv4DeJZb1mjTcHTHSQqLJkP4He
	 cfGNWDJftERlThUHNeuO0+8DnmzRQ2KCYyNmcGUMmwV6Fkw28zc/j6nBk7IXcosp79t7T
	 s+FaieNJakWH3oSUBLJ2RXJ3pfSOLomdFLEv40nkfWTfcwVqrvjM2vckiL4zXXJOFHl4d
	 LbYF3JJ3yqmuyULtNgiutU7A6O5Dwt/GshIXCYty6070Ma5sJw/7OlVRhhlIejMSzCEhj
	 rjTtLbOPSIMd8Vm2fWcBn3iZ8CRJMRdZZF3Q9PjJCHjGbjzit5a4bcpqegLMbSSLd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445405;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=UJxjgbqMepFKBMsU3/v8S2Wz923zPUejcCXzazPuMbc=;
	b=X4ADtReGeKuiY577iSbgT7kvjb2AAS4cuB8ntdZQWs8P7bRE83MqoNoYzMM7kDKnLbrh
	 aO7p6nx+ydRD7OiTro+TH6hQVDj8GFAgSwxZ70MxZpq8OHW9VLErlKH+U8MKnRs+eK0WV
	 Zl+2AsEUtF1ZvFEllicvT+ObIj8+LrvvmOF1lAmzbyQ0FMrA8A9J7/agEDoK993vanDVV
	 8jjqkzs4XtjJS7gRjAYU0sA5CtYRWMGBYhNv7yH2SijEFC8xHiFWOE0YxLzS+WLC+o2Jz
	 +ECRC+Z20BYMa0BBYHZRSG8GwleBzXKKcZskjtb+pa9ge2xIJq1lBppZt6j9IxgmCVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8QX9NUQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21AA606A327;
	Mon, 23 Nov 2026 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8QX9NUQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8084F1F000C6;
	Mon, 23 Nov 2026 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445405;
	bh=UJxjgbqMepFKBMsU3/v8S2Wz923zPUejcCXzazPuMbc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b8QX9NUQWzv3ufBuB1WeiapQSUKuVvvKn/HWzpzNrX6GWs3vQeBhsS2wa5cvT1+ed
	 J4e8peVUvR5uaz3xkd4brBfGXYJ2g8pDzTCCvm6+vCm+HoiatOUiasWbebfqgxWEY1
	 h/9Lzr6pBWHWUCku/BdoEzS5uXFMBywGx1Us84vd74OONJYJJXe1O4WQ3dm4KkVOP4
	 fGC+HZgch+onBwOlbjT289R8WLFf3cK69yOyjfThTkCXEdFtMxPU1ezUabCPbAgjtm
	 Yx/b2734mOlTsu4/XYnpTblGVswNKX2pJXpRe8q7TRZWhWGE/Lq7IXAO3VVr1uqg2Z
	 MvzLNu6vEtQPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77467392EDAF;
	Mon, 23 Nov 2026 14:50:05 +0000 (UTC)
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
Subject: Re: [PATCH net v5] net: txgbe: fix stack size for PHY interface mask
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179544540428.2436434.16012690783566890267.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 14:50:04 +0000
References: <20261117175528.3018609-1-coiaprant@gmail.com>
In-Reply-To: <20261117175528.3018609-1-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: jiawenwu@trustnetic.com, netdev@vger.kernel.org,
 mengyuanlou@net-swift.com, andrew+netdev@lunn.ch, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 01:55:28 +0800 you wrote:
> The DECLARE_PHY_INTERFACE_MASK_ZERO() macro currently defined in the
> txgbe driver incorrectly uses PHY_INTERFACE_MODE_MAX as the array
> length instead of BITS_TO_LONGS(). This allocates significantly more
> space on the stack than necessary.
> 
> Since hiding the zero-initialization inside a macro is discouraged,
> drop the local macro entirely and use the standard
> DECLARE_PHY_INTERFACE_MASK() with explicit zero-initialization at the
> declaration site instead.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: txgbe: fix stack size for PHY interface mask
    https://git.kernel.org/netdev/net-next/c/60cf8fade566

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



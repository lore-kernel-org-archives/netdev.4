Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134607;
	b=SGY0FPKQYfW4yemJ5DOPZkrg0M2mQNdPOyLJfgNoglZuP9xYvX4N+xnxF4d2r7iSO+2w
	 r7OpnUgY/D2Pq3cqzxhWIpH5MVoK4rAcmNDSrQ/zlFkwOF4avXLfhLDty7kNuBluy5rlz
	 ONuqgv4FGvoKKDIjdqTqcQfuluzVSIjbTZlUYd9/i1aROm0YWuIBPXVkwNzNoV/Z/+lJS
	 po8MJCheAd8m/srsuPa1d81AOOJcZ7YQM785oYetigpHe9xtUqVvVH7S+siKfxtRNOKiO
	 87xFAwQ9WEtYaFEB3vRrumPE0sWu4v2Q+r4APBK9hAxkF7NmeMSXkzXO/pl6ZSaGFQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=cYyIRdBVlZQr5tj0epQbe9SU5tKCNbopKrqEqRM0nHw=;
	b=oWwImeL4zX1/03F0WlxIHmAZeZJPxtD1b5sms95CJXXHWmv/YGe0l/7o+PeGE1s5duno
	 IXQHRl8StMUGN28K+zf6D1XCgolFDM6WPg3Zmko2E5SlGCz68+2pV67ulkGv57/JGbCIW
	 q292CLXFxfFZ+31nJ+oyhu2u+JfKOnRC2vN1V6qhsBY/zEzkUBSRlFQFqMayCg35gWFgz
	 cmYYwNu/O0DJoq0MMjmTZURY9jaxS/9fxCdAL1xXoy94SX/xKft3bvDX8jRhJrD1T30PL
	 MmcCPpT1PXtnzzPBjrIOgvRiG0W8SgZc1swboxl7B4Va+GazqSq1uvUDoDO9Fmf1/Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgFqyq9T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A010606A33F;
	Fri, 20 Nov 2026 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgFqyq9T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B241F000CF;
	Fri, 20 Nov 2026 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134606;
	bh=cYyIRdBVlZQr5tj0epQbe9SU5tKCNbopKrqEqRM0nHw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PgFqyq9TfsH1wcveHGKVzWO7ng50Nc+XOVgRr+y9/QUeAGqNllvc9wHZAIDrbprXW
	 NlmsBy3Hx+ILNs0y8Voq6GFOEdIK8LegW/FIiCssbhEboXUcb5BDXjlcSu5ARyRVnn
	 ClFfIsy815KNBNhdrd6XcDjTyGd9qRY/87TItnNGDr/0NRcp1V6xcjaxmjP3IlHqQv
	 Et3aWJbkN/jghSjuCBHaa+hGP8PLWNU8gSyLx7KtEmuMFUD/jAoyOzf+emWAACIK+D
	 TDgq0fUn0Msfo9Cgt/uRee4jwb5Had9Rp6K/SHK3eFUPiTctnvr6LV3NjS038SbCXQ
	 Z6vPknDC6N4hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3643808209;
	Fri, 20 Nov 2026 00:30:06 +0000 (UTC)
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
Subject: Re: [PATCH net] cxgb4: allocate the full ethtool filter location
 array
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513460503.3945374.720008246616028374.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 00:30:05 +0000
References: <20261117090608.33178-1-ralerrdirsardx@gmail.com>
In-Reply-To: <20261117090608.33178-1-ralerrdirsardx@gmail.com>
To: Artemii Mashanov <ralerrdirsardx@gmail.com>
Cc: netdev@vger.kernel.org, bharat@chelsio.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 12:06:08 +0300 you wrote:
> The ethtool filter location array stores nentries u32 values, but
> cxgb4_init_ethtool_filters() passes nentries to kvzalloc() as a byte
> count. The insertion and lookup paths allow indices below nentries,
> which can address memory beyond the requested allocation.
> 
> Allocate nentries elements with kvcalloc() and the element size.
> The array remains compatible with the existing kvfree() calls.
> 
> [...]

Here is the summary with links:
  - [net] cxgb4: allocate the full ethtool filter location array
    https://git.kernel.org/netdev/net/c/ad2c7240a398

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



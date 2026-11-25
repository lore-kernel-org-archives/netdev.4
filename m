Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620006;
	b=RtY/M9nHH8mXOl0NJbLR3uBxRqAzAz5YKHiLRAcuCeNVKT1vN9N34AP68cQCV764Ssgy
	 sX/TDlyIl/Etbf42s88BI8E+a0emsnCSpmUFD1kTsCyJAugYM7k8tMqcSeQEdgumIy98c
	 3Gq9ttLHmHDhRRO2dBrwjfFTG9zTwyN87eeQN5CosrvrmErX8ioT3NYXDigUSTlv4+Z02
	 w3LtaNS2+KoR1sdu9VA1oDY8iwGieaX6Ceji4chwMpkFrbC57IJ0Jiga7ZxvVaPDm9AJb
	 OTx9qBf8xOTX6PiWxKKznt7+dtapdTZUB99aZCvpYGJyiSq1QbjCQWkGKyyHOvpOEZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620006;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=4e/igr/hCL+x6as0JsPTtFNyoPooNZMckLepSULavBw=;
	b=sFGDwPj7PVJRBzb6v8eFFK4vpWDHGWXALGFHU4XWuwaDakvsLbJmTL4ReWZUnpQ6xTFV
	 bdNXpTbSM5lBxLxJn4p3xkbCQ5Sr833vHPY8aejwU5sb6q3/tsJ6bEsCyf+rkKW5IveIZ
	 WtjZVQImKMLXNIahkgAYRxJhIvtyk2POEyjg//9x52oIzF6pUCNUrJO8eaKxlcFmXVaFA
	 p15xxzUWWNMGW4VaLIcREa25hLpJTMgs7957+frJBATOgmSsZeTnqNKWrZ3yYq2XDrw0h
	 Nc8lr85C8VpxfFw9Y3n8V06XQtopnVR6b3c+/1ZWFZvCYjWgqbZovyA6KWEq1bvpcRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UkuxzScQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484DB606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UkuxzScQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3A81F000C4;
	Wed, 25 Nov 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620006;
	bh=4e/igr/hCL+x6as0JsPTtFNyoPooNZMckLepSULavBw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UkuxzScQUpTN7W82ieDbgtICDEitaTd4szxH4/UxwYMj14+0FIfXdoENyt434WAdc
	 N5iEE9QCQmKWRpOcKsk2ESwKn9LnjJ96OKMh7pPnEYfznPePiEfYfu3Nm9w1q9p+3Q
	 1ZADBKff1Q20Qheop/AtHy8hP4G0x4t1W/78riQC0AlsuSga7Kcy1zPn643B8hXtsX
	 AxsBfa9mN5zrjwTTy+A9wT++OY8EqNqtEd/WKp9kG/Yml06rdRVPMm/jjjANYsrSzb
	 cxopvMk8lRCS/LTj+j/i/QXJ00BaLk8h8MRofEz7gFzqCKaB3Ct8sM6J/VcOu61ji4
	 E9YbZiVJcEbLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F149B3808209;
	Wed, 25 Nov 2026 15:20:05 +0000 (UTC)
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
Subject: Re: [PATCH net v8 0/2] net: wangxun: protect ring accesses with RCU
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179562000477.599083.13675009350549054359.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 15:20:04 +0000
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
In-Reply-To: <20261118081329.39551-1-mengyuanlou@net-swift.com>
To: mengyuanlou@net-swift.com <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com, linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, hramamurthy@google.com,
 jacob.e.keller@intel.com, przemyslaw.kitszel@intel.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 16:13:27 +0800 you wrote:
> This series protects Wangxun ring-array accesses during interrupt-scheme
> reconfiguration.
> 
> Patch 1 converts ring-pointer access to RCU and initializes reg_idx before
> publishing each ring. Patch 2 pairs lockless queue-count reads and writes
> so readers remain safe while queue vectors are torn down or rebuilt.
> 
> [...]

Here is the summary with links:
  - [net,v8,1/2] net: wangxun: protect ring accesses with RCU
    https://git.kernel.org/netdev/net-next/c/39c4174d0e9c
  - [net,v8,2/2] net: wangxun: access queue counts consistently
    https://git.kernel.org/netdev/net-next/c/174a5d00db9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



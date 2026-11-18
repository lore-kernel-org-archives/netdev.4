Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966015;
	b=kbAwpPSbOHWR+xikEJJv3JqDiMsCl7Ys258BDPGVTWtITBoA3CVIWzSCh69tGsrNOwmH
	 4yREluflv7eJEyjDE3LfRGeeSb1zL7b4qPgiwTOiznlKH8bjF3GdpwAE1CASz75ogQTjK
	 RkdMuskkcKZvOiWc+Jhkzi6zYnAUKZQgEQnGQcWeU6Hjv9zOfDxnVA7v9UywczQJIT+TA
	 +SOLLtiJaeWSjetIiaJtCC24iB1M+xu5Wygoqptbe062IFLuq4qhyMvdBcgU0fsUOt5Xb
	 Ikcr21v7li0YXAqU6poWMYmJRedFST+YCq78JbHVZIgympZ6BdsxideCjrAJ6BLjDEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966015;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Yr03p+7vUaXrmtZ48lm37axmhamBdNeywOXi8yAKdoM=;
	b=16IiKZtX8aWUEokNvzs2Rfeo74+ofOrQ6EebIZJdc6oVLljfznCWn2J0/YZ2MwDlOdxY
	 oJgElsXIwca6npuXwnPwbAg0UFghNOpiH4f7/YsKhusfLBDQXekUc8L0mLVAyPNfO1PGx
	 9lqF9cwZ+XGGAtEupvFR1imxxyCGS0TrjKkqP3WPUBz5OVs0hKh4oAk0lNASukrHqqps4
	 +85iW2LOJLyfVRu7+CNk7NOjF/CjxrM5JJyb/b+KQy37rZqrBURSBZnr456MaF7LZODvt
	 UycSKtMPXyMAIyStDS+yBYDdthGGHDg5DeM9VV8Yh9uvJaAKj7LGgJipPvqDdioaBgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2E9wnrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF093606A31C;
	Wed, 18 Nov 2026 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2E9wnrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4567C1F000C4;
	Wed, 18 Nov 2026 01:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794966015;
	bh=Yr03p+7vUaXrmtZ48lm37axmhamBdNeywOXi8yAKdoM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=T2E9wnrKa5mC1Y7SLOtX4k6071lQIvEJjbgZOtchjhMLDfAYITOsgNf9twGEk9JXs
	 uqJu5tBc4C03h2p+fwXL3WNRw2edp+Sc362G8ronf5rggqklDsPBiyQ9cXMAlU4OuW
	 jOGIRO1c9v9ojU6vVwytlyu2xfT2nT5XdB+gIO/BkphdhUJRS5wXIUtShYtgQPuofm
	 8oWHE8WwhsX91FP3++WJCoGWuJgyLihoYROpu0U0qhf8MvFR40DzFnAViVIFpeI7BE
	 wR5NUfHalIBH2bEJEQx1MoewMwsn7BHdJv1RMrIjuUWUXl5MLs5Wy5Nwz+lRB79zYt
	 kKWNLP1qkQOTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A371392B1FE;
	Wed, 18 Nov 2026 01:40:15 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] vlan: remove MII ioctl forwarding
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496601377.1396957.3735556863769474155.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:40:13 +0000
References: <20261115085343.53218-1-dennylin0707@gmail.com>
In-Reply-To: <20261115085343.53218-1-dennylin0707@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, yuantan098@gmail.com, n05ec@lzu.edu.cn,
 ylong030@ucr.edu, andrew@lunn.ch, f.fainelli@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 08:53:43 +0000 you wrote:
> VLAN devices forward SIOCGMIIPHY, SIOCGMIIREG and SIOCSMIIREG to the
> lower device. This exposes the lower device's PHY through the VLAN
> even when the two devices are in different network namespaces.
> 
> Bonding used MII ioctls as a fallback for link monitoring. Commit
> 23a6037ce76c ("bonding: Remove support for use_carrier") removed
> that fallback.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] vlan: remove MII ioctl forwarding
    https://git.kernel.org/netdev/net-next/c/fbf9026e3503

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



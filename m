Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970807;
	b=ScgPx9ug9LJcmW92ab1gjGd8PYEUa8AIb9rryX796s77qDEMYdlUq2F749EIZmcMexhL
	 odGOFFdKsVWRo5dfbtOdcw4TiWYRakX/ZHO9KWHs/mP3TxJtJzDAkcc2cMij9y8hesShN
	 80jmg0KE+XV8GJBSAXM7Uc+3uk1lW0bpPq2Q1yj0gSJHOYXbfsAlS3+FLKLYZW/qHdAbz
	 tDz5UglnL2MP27I649VRjDtTRdckfOFJUoTbFt6J74K/lrPPHshpN2Mf9wuok4Ij2gGCH
	 V6czjs5w0D4iy/9TOk5rboEQ+TEZfchDCqG8UIzr7jby2KazLpFAcQOwCk+UC+km21g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=nxw3T6hIiyrliHjAIUAtUnPcNMPfg3kcXV8A3vdG7MQ=;
	b=A3nqWEIz/3dQD2FMLzaERoSBt8VwnmJVgXcOnlgv0tKlnLrSCyHc7EV56ObehuaxgWWC
	 EvNK7GYHDOVq1y+w3o3KzrHymTxsbnVzGRw7Jvn08fVB9FxZed37MYHvYpSTjHUVpuPfB
	 r2Z9O+Y8M8yi8kECjqmFjqjwOH+HWruUt6FfVG4ADPPoUDAxEIn0Oe+Ag2kKBFUPZJjQY
	 z/aEqDcF9vEFC42dwqmMavmblDy4DkqJ/4im5W5TO8jOX6T+l/Sz/98jKwioUWW0Whzvi
	 aMfN/OgFpxpZonlWUnoXULIPH/YUp0uECsPIV72VFWD6B0+jMnUo9OXpwAvPhCORJIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=en1D0uBC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0595C606A334;
	Wed, 18 Nov 2026 03:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=en1D0uBC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4641F000C4;
	Wed, 18 Nov 2026 03:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794970806;
	bh=nxw3T6hIiyrliHjAIUAtUnPcNMPfg3kcXV8A3vdG7MQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=en1D0uBC01DCLbTYgyzEy15JLNWkhpp3JeKaP08htwXR6RsSGmnok+L7B+zvO9BEu
	 M5cv7/Bh005CER+hzdom7cAemdgX7TWGC22UwsAFY7vrA9AC1r3sQjrIWB3ZkLbZQ4
	 mrTJCaAcv4/QgVwtVgoj26GKngxRiiEZq6tAkdzPB3R7dy/C2vPCpbFmJlDVQyxfYM
	 yWVvRfIbcnHgNRTZfATI+KAILfN6eceDv6rtsmDX18fVEfZXqzaCChuczkHQY1eryO
	 nA0YKeXBpcicjdZmP89bCJFb91I+WPU8soYudxoKzaPO6aROS3FfHEypO3jZfzeudE
	 NvNIhDzjqnKRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43F4392E981;
	Wed, 18 Nov 2026 03:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net 0/2] net: sparx5/lan969x: fix RX ring stall on frames
 from inactive ports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179497080553.1433107.371747421258981777.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 03:00:05 +0000
References: <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
In-Reply-To: 
 <20261116-sparx5-rx-inactive-port-v1-0-343d8bab58bb@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, memoriaru@foxmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 10:56:03 +0100 you wrote:
> On Sparx5 and lan969x, a received frame whose source port does not map
> to an active port is never consumed from the FDMA RX ring: the NAPI poll
> stops on it, and finds the same DB again on every following poll.
> 
> Patch 1 fixes Sparx5, where the same skb grows on every poll until
> skb_over_panic().
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: sparx5: fix RX ring stall on frames from inactive ports
    https://git.kernel.org/netdev/net/c/81d2cf1c6d56
  - [net,2/2] net: lan969x: fix RX ring stall on frames from inactive ports
    https://git.kernel.org/netdev/net/c/1a47bc214d00

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



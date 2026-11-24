Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795563606;
	b=UynYIfw8wdVEwN64pNGyuzka8z1rPGgaDi7tSO9iggRHYV+TEyvkUoCO2Gzxm4SD/08o
	 tMOaUecZHwewQ5gGZ9Xm+khX/vt4GzYz5MWVMdmrYIyxegRrVrAzsAVzngfFZMrsGmC2K
	 pGfGedeZ6pDD+X5uDIkEcm5YWEfNgsvJnm8ZM0X/3yaLbEEU9GfExbunosSz2IDvQX6Tb
	 C8J1Id2sP2eysq4DzCFCFFCe/ZRYyG2PPRISTa6XbAhF81d9du3Oq7518fi5dlO4pEGoL
	 Wjf/CkVDgU1fRUbTh0ibHMGfY+FfKxc0OXEyHl2cEIYJxA+WP8Di0hJsAbfuxlv8rZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=OilXcVwWhH2/4ei4wSv+KY1qkLy6rCbfdcZz+Lmnyxc=;
	b=EzLXIAMu240YUcPKxZEnTbLbH/JACV1JtOoopqKq7EL6M4zZ6/JBdALxWG9wEa4oq9zE
	 wIBDg9Sj+k+L1q+HG1X8si+NwxIdBg7TDRUyqW9ATENxgSai7zIpqs3YJ1krYjlFx/0Mz
	 i4LxZ7MQXWtJL9nNK+6PUKRVR3RBu1Vy74NyGK6IAMFGZneqaLB/V7fxLLJYeeTGs8xl2
	 t9QRWzm4ZP0JxXRX8BHI3mI/QVKCYVXxucEpOI9EW2x7NM2VH9H6xg0iyMf/kYKOidIZx
	 wC/XV+2DYxrM/2ROjBVjm1J+2PcbutfCYh9LjO4vmAfak4IuzNN09FbFB8UJkw6c34Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaqMZID0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D0606A31E;
	Tue, 24 Nov 2026 23:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaqMZID0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED521F000C6;
	Tue, 24 Nov 2026 23:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795563605;
	bh=OilXcVwWhH2/4ei4wSv+KY1qkLy6rCbfdcZz+Lmnyxc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GaqMZID0eKkWY1QqMIEKtGoJhwlQAulGZYVaORZwemvbVcM/EZaSDhFdDgUegDUUN
	 F7TGMvzjnWeh93BGrCdIwuGJWxZdPOn2EAYRyYiWetfXgWl+NnrjHvalpJMkpmyrE9
	 rfwA3j1EZQ+V2cAxsRYnAcDWx6XnWh3i3wvZX70r2kXZ8FX4cwBgymZVWaYbUroviC
	 jBG2Qrjt1Lko8jhCJxiiUXyPQGFzSst1F+s9Ly+NXuycGcGiatxED3tB5Wjbo1X6UB
	 GU+8mvPP36u8bch2VfiTgG26dRoNRN1+lb8ov/4ojtOe4563sPO157LEiF4OOs410p
	 0G/KejHafsftw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43D43808209;
	Tue, 24 Nov 2026 23:40:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3] net: dsa: motorcomm: Resync SMI slave before
 register access
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179556360453.119376.7882110407417172723.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 23:40:04 +0000
References: <20261119183539.1028929-1-mmyangfl@gmail.com>
In-Reply-To: <20261119183539.1028929-1-mmyangfl@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 02:35:35 +0800 you wrote:
> A register access over MDIO is 4 frames: 2 address writes followed by
> 2 data reads or writes. The SMI slave tracks the phase in a state
> machine, so an access interrupted between frames, e.g. on an MDIO bus
> error, leaves the machine in an unknown state, and every following
> access fails or acts on a stale address until the machine is realigned.
> 
> The driver has so far assumed every access succeeds, and relied on
> manual resetting when the state machine wedged. However, without a
> dedicated reset line, the reset itself goes through the same SMI
> interface, causing a chicken-and-egg problem.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: dsa: motorcomm: Resync SMI slave before register access
    https://git.kernel.org/netdev/net-next/c/bc686737f555

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



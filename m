Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288808;
	b=AhptKPFeuykS/7EXOc6qg2iUzfW+52C9na2BUn9J2pgU+5pchrIwUEmLLOL2nRxnPDjp
	 5E2Nbu+y0bs8SpMXxm4Y7cJQnSyQO85kPfUYYzduvcn85BPaVAm8gLGCf0TZ7jKxREqdD
	 /LrK4zWFMSIbZN/CV7ysF/I7p8B6yyrRXb8stR3TRXDf9J+bLX2YuN80dQA2tHOcqZLl0
	 BPN5tUaOjDPTgxetlOHqS2ieV3dmrT6m4DfN/0OJNSXQYS4A9ZBPkW8fRvHb5LSnqvDKB
	 I97uWsrBU+EUyOrc7QjXV3BEMbmvo4N7nIWBD3F3OdDIe5RqUxLIG//8pcm+NVLyvmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288808;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=YjLQWV/AVBFpwIIU7wjg15hGl+4/0AlNVRiO49kavjk=;
	b=fLPPubd4JQPPnnq5A4327qtcAuQovKy0D2faAurllLX0c4LzsbOXvXxKAOs72KFNoD16
	 lvh0Fe3h1/PhUw9zwX6bJIZ1LuDTmAy4UesNJqIpTFOizPXCVCBN5CwHMindVHPKjddfJ
	 OoJGeR+bgHOHZl7niDnO5fcYf2BRcyQzodXR5HnAE15ritLlHCR+0dTR2ubhmWcAaXZuS
	 ztFl1rsbPyuqfsJ/hUVoQrr0wPaOkhA63Y0IneM7FMw4UE66Fz1uI/XoJKKK6rDlToMyl
	 FfuIiOoZqhCkSqTfWy22Op/ASRWBbh/YupLVGuWNZ5S45yYTSatiMvCHlb2lcIyzbVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqxDOXMs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726F606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqxDOXMs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC531F000C4;
	Sat, 21 Nov 2026 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795288807;
	bh=YjLQWV/AVBFpwIIU7wjg15hGl+4/0AlNVRiO49kavjk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RqxDOXMsKGRHgYgpA2dh0ObbVDYoUzAdgiZJvLlpr1lBzdmiM4u/k2HkojZF76k08
	 2VUILsDORApcdMk45/J2jyf3BsvWbxZ5HE84uFb1Z36MgnumqxrCpl7Mu5QI3FLwkx
	 Otq+m5oWM2coarKKlF3AxcYdZLcI7pzEwpaKaDLMqed35FyHWNtHas7MbwAWyHdbqU
	 7qhwt5nIjDOYMsDgp6UOQZFv6f15ha6aFPiMiCM/AuGxge91V+Q2PhQQLm82dHOQXd
	 bvF5et52gnkgXfcrvjoeOKTKkpAmtKyt0lVFuphK/vnalrshDzbzUgap9hVkd1qY+l
	 xXtQOJrrDidHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773D9391B06D;
	Sat, 21 Nov 2026 19:20:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/4] tap: do not hold RTNL in open(),
 release() and queue ioctls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179528880628.1140982.13826508228871085522.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 19:20:06 +0000
References: <20261119072258.3157902-1-edumazet@kernel.org>
In-Reply-To: <20261119072258.3157902-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, kuniyu@google.com, horms@kernel.org,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Nov 2026 08:22:54 +0100 you wrote:
> Opening or closing a macvtap/ipvtap char device acquires RTNL, as do
> the TUNSETQUEUE and TUNGETIFF ioctls, although they only manipulate
> the list of queues attached to the device, which is private to tap.
> Hosts starting and stopping many virtual machines thus add contention
> on RTNL for no good reason.
> 
> This series protects the queue list with a per-device mutex, and
> stops taking RTNL in these four paths.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] tap: detach queues from the NETDEV_UNREGISTER notifier
    https://git.kernel.org/netdev/net-next/c/5a4431ff4fa7
  - [net-next,2/4] tap: add a mutex to protect queue management
    https://git.kernel.org/netdev/net-next/c/c70849e0b16d
  - [net-next,3/4] tap: do not hold RTNL in open(), release() and queue ioctls
    https://git.kernel.org/netdev/net-next/c/ef7b12deec78
  - [net-next,4/4] tap: remove tap_get_tap_dev() and tap_put_tap_dev()
    https://git.kernel.org/netdev/net-next/c/3d5aa58bec4f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



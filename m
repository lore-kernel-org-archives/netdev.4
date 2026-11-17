Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885610;
	b=kQ7guPh09oyMLw4mhke8/SowrqJ9tqqhScjEDLSma4CAQnStkUKlEr5EWdF/ElaxZ7hN
	 37EENL0LarO/iaiW2tIK2c6IGHq/EGVlwjAuDnTdnCcRij47/PFBBE+2+yrwhLcVWK4jn
	 +28VQg/68+s9fBtYTQcC5yZcaVvXZyPCFpczhDMlKOhwrNYN9ul7TiMC1wThSMjgtyCwn
	 hc2/cPdVpZKM/QYw5Svt4EJp+sKTJExWh84CCY6yINgJlkgJr0QBaNQ/ShNLbT8DlkN07
	 uz/rBMI4mgg7kY3ORCDrm68j9Xdf+QNFEupOWKnVLiaNi2olzbQv+gEkq4ANSpzlcHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885610;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=3RGoCBh47dSDTCstthCAIZ1pEsXl/vKhhB9tPSmNOyg=;
	b=MHdnqJF2wQ8g1qE/O62sIKRKswv/AZBdNhJcsgeG2PEwQDFGi5LTl8WOK3EUFaVXhAno
	 17wgFRKxuHHh2CxtpYBx0+52LiG01V44iDQ+8xbdCGYkbZNsNfP5CDaoa8Bb5/DuIdyGV
	 XDQqse8qPOikBiuBvW9hSs9Gz0xHW/LIuf5iAPgXS8+8hFbazpBrsrBLUo3meLP4VFpeW
	 /zv1HDb6di34RdAKyL5qSR8m5kIAmH4dAJz3nHOlFUYFCEolL3bmv7qczxMgtloVIRPDF
	 cGWGqJV1xcNm2sWrFAesg1Bne2e8RBiy1i3inbu89neWAtEqUIVyzKI9NZ3kzEWdSJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XARNMMac;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE165606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XARNMMac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1B01F000C4;
	Tue, 17 Nov 2026 03:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794885609;
	bh=3RGoCBh47dSDTCstthCAIZ1pEsXl/vKhhB9tPSmNOyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XARNMMac7b9oAraixoILphhxLkouN3lwz1s+iTp+B/6tZ5VqIw38uFEto3/wuIKv2
	 dcgXPbp2pAeqRP4Xea07dBxuaIdFGtrrdgCDROYdf8yiQVRd2APb6F+tuZdjfORo2C
	 A919RlWyMVzaruXYRIF/+9LNooe3B2rLD9+CsZdfQ6UgqCNn3efN0u8bLmOt90OWoL
	 7EEVPozogtEBA4zu/ZYL/0c4gS/7i+76K54AKXwYQA2Em/xl/spJNOtshseKF9wW7U
	 /lR3jlkpfzVzmMqQ4sR8jJlSfikLpsnp6iynJ/C+GE4JchyA8NIAbQ8peLmSNehMXx
	 YGXPZozrO+izQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77328391B099;
	Tue, 17 Nov 2026 03:20:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/5] tcp: better visibility when receive queues
 are
 full
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488560802.316053.11655745821190774508.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 03:20:08 +0000
References: <20261114155150.235743-1-edumazet@kernel.org>
In-Reply-To: <20261114155150.235743-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 kuniyu@google.com, ncardwell@google.com, horms@kernel.org,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 16:51:45 +0100 you wrote:
> When a TCP socket can not queue an incoming packet, it is currently
> hard to tell why, and how often the stack had to work to make room.
> 
> Patch 1 adds TcpExtTCPRcvCollapseSkipped, counting the collapses
> skipped by the rate limit added in commit c2213d9b61c1 ("tcp: rate
> limit receive queue collapsing"). Patch 2 is the packetdrill test
> for this rate limit.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] tcp: add TCPRcvCollapseSkipped counter
    https://git.kernel.org/netdev/net-next/c/7bf8b8ce32a5
  - [net-next,2/5] selftests/net: packetdrill: add tcp_rcv_collapse_ratelimit.pkt
    https://git.kernel.org/netdev/net-next/c/32d99662c363
  - [net-next,3/5] tcp: use SKB_DROP_REASON_SOCKET_RCVBUFF when over sk_rcvbuf
    https://git.kernel.org/netdev/net-next/c/27a46d593d89
  - [net-next,4/5] net: add SKB_DROP_REASON_MEMCG
    https://git.kernel.org/netdev/net-next/c/a2f25e291be5
  - [net-next,5/5] selftests/net: packetdrill: add tcp_rcv_collapse.pkt
    https://git.kernel.org/netdev/net-next/c/756561fcd216

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048806;
	b=MBs3PfYBi2hMhBtNtNZpngk9Kz0fcY9f1cSLmGTQahnxSaEF/nYPte6Ja1dwS1VVpUdX
	 R3NjUHKB439FT+UlTcU29hzdKrugQSkd6b4Jd3Fy6zaami/PPA+luVZsO/Cg0OhrXHav6
	 607kqJOCQYy/ZdAB0a/D6sDfk7ncm2S8z0di28oy74cRMAHrbb8FTUlj0aZpjdMhLW1Ic
	 2F1EodAaR1igFPSdXk3cbqQvL1Bz0IvEpIXPAAugmwCqK8wp3Ky6Un3+51vX+fH0HQ9+r
	 3k9+P2wB3acEV0GRuR8EW7/s9tyQKFJx7WpIdz1Gl3VNyhVoUvYb+EbdFBMfKDBm1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048806;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=5sVvInssu5gcBZZ0Bkr8S7VMK1ychpL9/zOHbE/cQK0=;
	b=2zP+mrL3N1fjfalHP3BStkE08yjGNhpjTzjkOZUQDly7aEgGpXi3GvNXVtRwaH0Z7DPI
	 48t105PjwFpq9weln9K1R5iI96POuq46bACviRRSHjB3Fe2JoOMxSPcezuBHpbpowxoUZ
	 JswBEM0sHj8pf7gefvMNkjcmDDhnBFYecvT0a5H/trSpW7tCf5bY4s57UwNfhk5/0UWsp
	 g4K5oGeqMuoZXm3GQijQJgOyWTmF5kpZVyD1UgTOKcWUAX47E5+Yr4ZXcpZMFatJK18na
	 mT4jNcMCYBkBUNaS/ky1yfr88J0cgQQVg87vAJ/5ZbHgmgJQtk9UFP2lfiljqKfnUBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3JgQXRF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C079606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3JgQXRF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420551F000C4;
	Thu, 19 Nov 2026 00:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048806;
	bh=5sVvInssu5gcBZZ0Bkr8S7VMK1ychpL9/zOHbE/cQK0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z3JgQXRFWJubUchoq77j141d2tWDB6wayW89UfyHEFBHlkHNQKfwQzrvq8GRtZVtq
	 /odReqyTvq/MF/WHAP+AymDGmwCcMJANdQCITPR5eHabnLCQnN3aNW045ID9WOrPqp
	 UtQNtO9h2olsTRtfnpj6lxWZZ/bYrDWrqb1ngEq6Iy1l+OJ1+YREs86mvuAPfhcyt2
	 kTD2IXZ7k4eyFB82ZXzheH7vuu3alfgWIt/ERwQevszmHfZ1KRROxmCg4FKiPkccnq
	 wJinPJkxzsZT/MGkR7kuiEGeMlmZdkQixKp0pRqlSE3z430l6km0KiYLdWaPRNBHJI
	 wwsrLoqr1XFpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2433808210;
	Thu, 19 Nov 2026 00:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net] tcp: purge Fast Open RST queue when listen() fails
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504880503.2666484.16618327561848600344.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:40:05 +0000
References: <20261114111247.21995-1-edumazet@kernel.org>
In-Reply-To: <20261114111247.21995-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 kuniyu@google.com, ncardwell@google.com, horms@kernel.org,
 netdev@vger.kernel.org, netdev-bot+sashiko@kernel.org, imv4bel@gmail.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 12:12:47 +0100 you wrote:
> inet_csk_listen_start() moves the socket to TCP_LISTEN before calling
> ->get_port() and ->hash(). If one of them fails, the socket goes back
> to TCP_CLOSE without going through inet_csk_listen_stop().
> 
> If the socket was a Fast Open listener in a previous life, and was
> stopped with shutdown(SHUT_RD) or connect(AF_UNSPEC) while an accepted
> Fast Open child was still in TCP_SYN_RECV state, the request_sock of
> this child still points to the listener.
> 
> [...]

Here is the summary with links:
  - [net] tcp: purge Fast Open RST queue when listen() fails
    https://git.kernel.org/netdev/net/c/342e62fd34c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



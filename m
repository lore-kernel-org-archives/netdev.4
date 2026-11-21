Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220407;
	b=SNMV93x1J2oW9L06ynS0twH7pj5Rd5Wq3fUPPoLI4eF+H2LjS6rN1a8yi9XViaC9MSkz
	 E/py0VUPKTcD8U1KvAhmhlve782E9FQNsvzPkdlAzH2aCcS+fHUQGd5VnoiFCktqXxTtR
	 Dj0h6upRypCWWGR95SsMkxffeFx+MJJYSOYvbuZh52hmTeaipYOeLz0qaDzg2rQ/nJ1AX
	 j3nEH2YhYUJHbFH2sf/gxL9MUDBh8l6Yk6HQJ3lGRSnPeacvF6tQ3hIuff0GzgfTiKjrW
	 itWHLCSmh4pmAV++L8y8ORrNHQFAPnyJIDeVa3ndZati/uM9/W3aEf6b3Dwj6yb/5Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220407;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=6spmL1rIgWxgazMI6jzjI54LcxxEexoyEDWZbs+USXU=;
	b=MxD1gnsuP46Zahsaat0ntkzlZe5Ppmlc9EJ1jP0z8yMkuLRDmJf+twuTcBRGfhILjQcu
	 x3faN0C2OcTpTdwsGg3znDOQ828syDSP5bQtEVlGRkol2yGtw165501NLs//pEJ4lCvpp
	 s2xuMlwKCphFLeFTCJ+9q+FU+54Hscok7efcCcp+Dg1E+tYCG0nCsABCQsQcvQvc+VhwB
	 JNtOM3ENuwbHo/zDZdXyz/aV/cemUe3oruApgUN5u6044NSeMG6J1y5zUibrjkt4FwDb4
	 jK/zD42lFyU8E9FEG7+ANDq04nY9X7AH9iQfCpHSUpToqkDMDc0eMBnbp1P8Obv8r2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0CSDo5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651F8606A33B;
	Sat, 21 Nov 2026 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0CSDo5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A561F000C0;
	Sat, 21 Nov 2026 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220407;
	bh=6spmL1rIgWxgazMI6jzjI54LcxxEexoyEDWZbs+USXU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=e0CSDo5F5P0FQZ3eHFY86+yvsWSLTg0JoQv1hmaw3GVo/RiVq5AT/hkWHZDRzfXUp
	 OGIHCmxGhE/zk8RwoXBoCorPV8sTkYt6bOrmOvBT28/QSvAFNGQeH9Kw5/IMIzkE1g
	 SWYSuRRBGJ19831j9Y7QyYOHJO7UcxAF7m/FZWVNyB88po93SD1oGnw+ObvvTYqCtJ
	 jd0oIbxv+XFqJvlFHLSxaK8NkqW3MV0uCxDnQUO9hrPa6SIgTgrAEA5vPYoPflAhik
	 lSkT7flrV6tidOgaPtwabu9tmuxT5jLXWFzzPyFDGHZTgarrm9TQ/uZ2e5XEZibNkQ
	 l9EOgnn/p4E9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F172F380AA4D;
	Sat, 21 Nov 2026 00:20:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3 0/3] net: dsa: make a shorter bridge ageing
 time take effect
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522040578.853171.11730674310408449744.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:20:05 +0000
References: <20261117-ksz-stp-ageing-v3-0-135de6b9f8ad@pengutronix.de>
In-Reply-To: <20261117-ksz-stp-ageing-v3-0-135de6b9f8ad@pengutronix.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, arun.ramadoss@microchip.com,
 jiri@resnulli.us, linusw@kernel.org, f.fainelli@gmail.com,
 vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 jensemil.schulzostergaard@microchip.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 14:02:10 +0100 you wrote:
> During an STP topology change, the bridge lowers the ageing time so
> that stale FDB entries go away quickly. When the change is over, the
> bridge sets the configured value again. On DSA switches, both steps
> can go wrong:
> 
> - On a KSZ9893, ksz9477 does not apply a shorter value at once. Patch 1
>   fixes this.
> - The DSA core can keep the short value after the bridge has restored
>   the long one. Patch 2 fixes this, and patch 3 does the same for a
>   port that has left the bridge.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: dsa: microchip: ksz9477: apply a shorter ageing time at once
    https://git.kernel.org/netdev/net-next/c/bf18142882a0
  - [net-next,v3,2/3] net: dsa: ignore the old ageing time of the port being changed
    https://git.kernel.org/netdev/net-next/c/133927a00589
  - [net-next,v3,3/3] net: dsa: forget the port ageing time when the port leaves the bridge
    https://git.kernel.org/netdev/net-next/c/eb0431e3f3e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047013;
	b=2JxEQ5eab+ScNmxdNpot7oUK62OwWRAVvYBFHHCcGxaNNwlZ2Osuov7MuYf8kDMHXUYs
	 3/4faBqkuoGpB3eXA5H2WeirLrukIxhWG/mQGcoAe3qDdt1Y8adQQQR8I085I+dmGwMJC
	 X8WFLirrUvRN7dA0zO9kVSyrfNXF/if+t3kFyUyCD/Z85WYkUDzuisQJTsSxUb20pRVv0
	 kAi25L6lY8zg9IYYFykEm8whnLQjHf6B2iK4fZYaNHNtT/QSooOyq6ibs82d3AHsLgixW
	 6DF7LfRCSx6tjfYwv6vp3NVUxNWRdgJfbnRHMs/XHG1cNYqZ/iPgw9XYqXMSM9HLAeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047013;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=PhMX4cAwpJGXD1gU6oVnlpVXH8u76VL9hE+5dhIxfl4=;
	b=HmyTlGIgN0DtJaVqHgsLyPqVkBKIIxIE7WuWMSUO+ary/QcLgXvfZbJoSOnvs9PhL2Gg
	 dvGHkSc39RZauA3ipTWIciy2FNeld+3N/y7/bCDYbbVV5QCuraZ3+LDi204VJr1WrdOHe
	 vbrCMY1vMrIXEcsBG7QWYLYU77OI9Q/lxqEEeKaoSywqaItXpFZ422zyI+zqW9J00291G
	 yn8CcY1o2RU1Qduq+iYknmicHDbBrYgZ6vhgEFP23Ibv+QAM9jxnwnyJsQP41fBCiGOHf
	 qtLGux1BZf+2cOqOeFfFqunxJ+Pye2+YF8lYkfM5BCcy1lTbHjK5umCI5/YF2/kH6iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FScmRlxK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D460A2600
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FScmRlxK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BEC1F000C5;
	Thu, 19 Nov 2026 00:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047013;
	bh=PhMX4cAwpJGXD1gU6oVnlpVXH8u76VL9hE+5dhIxfl4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FScmRlxKxCYLIUGY46BYVRTj9+TFKjrxAV9gsxRcuN1YwMJo7E+u0a4mq/qLkrWSf
	 CwgrXS6h2lJr2y85pLbltqkT9rIp8B4sb3rqn7SetN9ED9tBIzq+3ZrDZySD5Vd0vO
	 4BJi59IPaDZqJ+/c7cQPticjgIWdn58DO4OZPwi9r6t0qTf/NW8QaGeOo2JBrBNRJO
	 27rWG0ajwPxXIkdiBjWjQPGtFcxEYpccl2btHq2cNDT/n1JDRrLexV0knTrgTJYdu0
	 SD0nkQik/r5F2CiK7NW3LHhxzywX80AAZ2ZceO2iwyCpHxqIo4autiDALDe2hFOMfd
	 cSWVq4BZAFJRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14853808210;
	Thu, 19 Nov 2026 00:10:12 +0000 (UTC)
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
Subject: Re: [PATCH v1 net-next 0/4] af_unix: Drop MSG_OOB support.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504701152.2637749.17494957758610196904.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:10:11 +0000
References: <20261116021845.2533130-1-kuniyu@google.com>
In-Reply-To: <20261116021845.2533130-1-kuniyu@google.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, kuni1840@gmail.com,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 02:18:17 +0000 you wrote:
> MSG_OOB implementation is quite buggy and has received many CVEs,
> which led to CONFIG_AF_UNIX_OOB, but the default is 'y' so it is
> enabled by major distros, even though there is no clear use case.
> 
> In addition, such bugs have changed user-visible MSG_OOB
> behaviour many times, but no one complained about that.
> 
> [...]

Here is the summary with links:
  - [v1,net-next,1/4] selftests: landlock: Replace MSG_OOB with O_ASYNC+F_SETSIG.
    https://git.kernel.org/netdev/net-next/c/e0fa647fd313
  - [v1,net-next,2/4] selftests: bpf: sockmap: Remove AF_UNIX MSG_OOB test case.
    https://git.kernel.org/netdev/net-next/c/30eb4baebfde
  - [v1,net-next,3/4] selftests: af_unix: Remove MSG_OOB tests.
    https://git.kernel.org/netdev/net-next/c/f4dc608a4bd1
  - [v1,net-next,4/4] af_unix: Remove MSG_OOB.
    https://git.kernel.org/netdev/net-next/c/387f48167305

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



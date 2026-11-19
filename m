Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086011;
	b=kC0O0HOuJoY1RqAvz6MP2tBe88EyhsZB/gb8kGx9QsicuA2KkIDzDfKkQ3sN5L8SHUMQ
	 oNOfmexwxI57yFmA5ZXAE6a61CmPk8qKrj4DybaeSjq0a5kr9r5dRGRaVNCRFYwJHYjFa
	 ttbqsnacNLmX69K4YKQIhpJpsRzWE5TFtAQPvrUTezr/EzMsVGK5Z0GlsKNUZ8mWk5Ocv
	 2smFJfB7DKtjLN0JLakLP1dBsjtZh4J23WniSoDPC7mciUwYDBPl3E7qRyVovu4wGznGn
	 Oi27lf66EtGngkymYa/RVmJqEbXy6SGkj8vgPot5IMtVlswFfVjUQGCo7X8kZJ084xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086011;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=EOAIY6Mo48SyMkRcHZAR8iSPX2Jzj60lb3VnvqePsD4=;
	b=DkKgJ72wXKatWV+BjV/Tdt33DLFrQzyhDqmbWQ7jkd3ihTe7/A2xXPzttRClXAXvBR+E
	 kCNn8GmaHRji/tLh0foG22aJTB4j5/3JOKHlybAQS0y5FrJZfeMf5F1Luk7XsxPxrKTd4
	 lb1fFGykFer6x8Y45ybvhnqv18QXTCuNWgXElEx0hwA+wo1yyNqeSahLEyKijIFkO5XnN
	 o2IVW/zPS/nyv5JI99vbCAkcgz+RhLYwwzgfcPsv+nlFIGYKzvH7UpMN7BKE3/B1EFPPR
	 goNXemYaEwMW9YYgUKhg/jnA0cefXY0dueJiDCuC6JezqVuGD80o57RvO17M+ftlhFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYBv1w5Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB4606A336;
	Thu, 19 Nov 2026 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYBv1w5Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8587A1F000C4;
	Thu, 19 Nov 2026 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795086010;
	bh=EOAIY6Mo48SyMkRcHZAR8iSPX2Jzj60lb3VnvqePsD4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SYBv1w5QFWaru3fDGklHdAoXezEFJwHPUqB0DZxhOhpLF7cpX0e3HemuMJ30CQezR
	 +24aTNmfHNFcDYWnnX/WspuYkOSBFRg4KSv40GgciG7Ne/yVPBtQZSmnCToYwysBZs
	 zG79wqsi0KQZD7rwLLd3zIi4wb7NtDz1AyL9TlEVhZMIhfLB4y3XVTPK9qlfiGlMYD
	 LdLZEqS539N2aN1YKlmyng/eUm1dezdNu73/Q0oAPhegMcsXa4+4im9SZNl1v3/QRK
	 Kf1JZiYVpl4BQi8N2j7VztSQp6K0cLL9h+d/y2esr6E6BQ2XkcYCs5PsQIQdgmdLsT
	 s1lw1VHz5Appg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772553808210;
	Thu, 19 Nov 2026 11:00:10 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3] net/sched: cls_flow: avoid integer overflow
 in
 perturb_period
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508600902.3017313.12997293213535292238.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 11:00:09 +0000
References: <20261113024802.71680-1-taowei@kylinos.cn>
In-Reply-To: <20261113024802.71680-1-taowei@kylinos.cn>
To: Wei Tao <taowei@kylinos.cn>
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 13 Nov 2026 10:48:02 +0800 you wrote:
> flow_change() calculates perturb_period by directly multiplying
> nla_get_u32(tb[TCA_FLOW_PERTURB]) by HZ, without any overflow
> protection. Since perturb_period is a u32, the multiplication
> overflows when the value from netlink exceeds UINT_MAX / HZ.
> The result can be an unexpectedly short period or even zero.
> 
>   # tc qdisc add dev lo clsact
>   # tc filter add dev lo ingress protocol ip pref 1 handle 1 flow \
>         hash keys src perturb 42949673 baseclass 1:10
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net/sched: cls_flow: avoid integer overflow in perturb_period
    https://git.kernel.org/netdev/net-next/c/042ca0604cbb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



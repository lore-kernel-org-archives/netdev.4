Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659606;
	b=M5pItTEvNxsq5BV7BgNmXz3F7LxRbs0ZDgbZ0F/UNGuaqwqGFx0I/CJcmlH3KJJb68mw
	 DWuSlgO4OscWr4nAB58zeLqWH8gkpsqNjhqjWtnUrZcgUKvIWIOcHhD2MYIfa4bT/xVks
	 p+vGD4w7On0/AE/Ci4sYg1pGgiz+2cjORFWP+8uWP7w4giIGluusde+CRzupe47ze2QM5
	 9d7X6IvvAS761zTdNAPUFc8s+p1u4vc43PAQHgeJoUPofa5+JY+wXOl3DcxPJCfAAiGKI
	 ax+AlgogIZUi640qIz/G5VSlDK0ZyXm4oDnbaPk719RXdHQ9MML/kpH4V8g7geHc/jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659606;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Ns0mVYDKGOCO6KeAYhf7GdoRYBOj0mb68wm8huiKxeI=;
	b=VVbTrf1qp3rJaYfJq3qeyiZfY9EJ0wq+U27hv8NHhK62P2iFBRhk+9YW13pW7xgE6sFK
	 v8G1k3O6U5HE0QIq1y6BQzZG15EXNzv3EyIwSe01uaL/4RMcFxFVdhqp/AE9qaXK+fMsT
	 +G8tnB2KTr6wSNPUmg6fT+oa2zaa/q5JZrI2875k9rlaQDLjCvtetQ+opNVJ9EuP6ETLL
	 gQyKLjIO5cF3EfvbZdfmny4cItE6zkXci7kABe5YKOzWPJRPLPWqsGzPHCtx47M++Mj8O
	 hByCYAW85vkZStI3vcln7zTWNni7u5nCCCbWZZVOtV6cJSKjUvmGZ9unTdIOm6PPjMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMrzkUjO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281BF606A31E;
	Thu, 26 Nov 2026 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMrzkUjO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB191F000C4;
	Thu, 26 Nov 2026 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659605;
	bh=Ns0mVYDKGOCO6KeAYhf7GdoRYBOj0mb68wm8huiKxeI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VMrzkUjOUByXB5XrW2X98KtUxyU1KkT5/aYGbDSG183Om+xTTUcp3tUXaqyXnit50
	 gFFFv/dQShB7UqMikrHL5jmtAj9JblhoToNqOlS+cI5epXky+/LLCAjz5pY5GHG+f1
	 gczAXOhfJUkQWkovARH4ZIvrmVcl4TYVoo8kUNyMVZgXSbcUT1Fgm94Bp6apfCJXAq
	 J+1APH2u2tkTOoUmjkzKBxKTCB+1EQfrHQVCVPdWaLGNWukjB6A/K7SC+tVq/Jgtet
	 JGko/weV/+An6s7M3cDnemqLby9XbY7Arz6igQucfXwX9CFk4fP1QjutNTjYJDXDDx
	 wPNqTkd2JxpcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44CD3809A24;
	Thu, 26 Nov 2026 02:20:05 +0000 (UTC)
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
Subject: Re: [PATCH net v3] tcp: fix negative sk_forward_alloc after
 MSG_ZEROCOPY
 append
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565960453.1453810.14078959645080448938.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:20:04 +0000
References: <20261123122432.297135-1-jiayuan.chen@linux.dev>
In-Reply-To: <20261123122432.297135-1-jiayuan.chen@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, edumazet@kernel.org, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, weiwan@google.com, shakeel.butt@linux.dev,
 soheil@google.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Mon, 23 Nov 2026 20:24:31 +0800 you wrote:
> Our local syzbot reported the following warning:
> 
>   WARNING: ./include/linux/ucopysize.h:57 at tcp_sendmsg_locked+0x1e13/0x1f20
>   Modules linked in:
>   CPU: 3 UID: 0 PID: 377 Comm: syz.2.2248 Not tainted 7.4.0-rc2+ #398 PREEMPT
>   RIP: 0010:tcp_sendmsg_locked+0x1e13/0x1f20
>   Call Trace:
>    <TASK>
>    tcp_sendmsg+0x2c/0x50
>    inet_sendmsg+0x62/0xb0
>    __sys_sendto+0x2fe/0x350
>    __x64_sys_sendto+0x7f/0xb0
>    x64_sys_call+0x1375/0x27e0
>    do_syscall_64+0xe4/0x470
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
>    </TASK>
> 
> [...]

Here is the summary with links:
  - [net,v3] tcp: fix negative sk_forward_alloc after MSG_ZEROCOPY append
    https://git.kernel.org/netdev/net/c/e50436deae92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



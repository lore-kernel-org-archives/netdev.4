Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651807;
	b=PdrPkEWqxROy8eg9unY09/9nxXEUtyflPklhRmP446xjFT3qPEr2d+bq6xPhaWFgNj/g
	 RU5bwemUC7wlKb93UCaxyRmC6nf7PiOByR7BXIaT4GMgxUJjDrx02ysT2kj9+xyo6hreL
	 oYr17noYSN4DKv/LIuVHZtV0AxVpgY9Ff1CY3txHmfNtl2z1nQqFVZWXWTZ3byzemOWkF
	 2w7ykNSDCM2HSnVKV29DK6MabXCL0zDIsaQbI3j53vQzVGWjlyfr/1BNgui+Xf4Ti4QHV
	 gHiO9fTfEZpTEL0iOwmHXDZQSw6DxhhCOKvxPUJMKu1pDjpUPB6G8iwsg7DFDWNAEhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=m7Qp3o5cxtTvhapUci3aHk3uRXH3r7Me18ppH65z4bE=;
	b=ExZxd/v6S66uXhI65GTh/d1MdOHq7etNpimesl+JUFbUkLjIQgrGh2pNuPpKRu0zvdGf
	 NewV1l4WHj8F+Uc7tr5kgVwyjwPyeQfZaxxyBQu35gUYWpvAIEQL/r9G/wcCrXjLJxVoN
	 ODeM0jb5G1QwixeMINC+r4OETyPOW1NaPJQriez62f5R1X9GUb78hj57hSl1srUclf2UD
	 h4nHbQ/cv39Abm/hXPiF+OpGJF9uS+LLAvrkkM24Sm0n98E+4WStHY3HF+iiJkYGQYfAZ
	 l1t7Pm2D+XKq4MiEEefFXvwD8vQS2FrjeqWdcc4clA7lJ+W3OtbkHtbaBcShs2okGiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYFCwNXe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C71606A326;
	Thu, 26 Nov 2026 00:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYFCwNXe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE66A1F000C0;
	Thu, 26 Nov 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651806;
	bh=m7Qp3o5cxtTvhapUci3aHk3uRXH3r7Me18ppH65z4bE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OYFCwNXevkU6Wb/w4ZbKiYZoOFrYWCW4F8738/lLdFM09ZGbyEBEl6LLDN2dSP8+d
	 05mhSlZVtRp/TEHqpB33KXUJx2QKrd6sGDljnlZcRZT0Jnw8FdlJV/hzTFUiSFWd0A
	 GVmd7KaGlM0KFz5O5AoYjxzUJr95rWIPnUyHfAGY0E8zQydsJTE6/DlcOqdjcQT4Tr
	 3ByBMeMayE28ZbEO2rhjEdCMUWLzEdTr3o752O8n/w+Vt1FzKvuvwhh77deMituU3Y
	 OF/Af/Q6y2+vA83yfsOLMtL6IsBDcLkZoy4tTZCHWqpBhSSIQF7My8LclNpS9pp2Zo
	 3lIjqpMEgadRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45E73809A24;
	Thu, 26 Nov 2026 00:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net] tipc: restore write readiness when a socket's group
 goes away
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565180527.1406798.1348417398640533183.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 00:10:05 +0000
References: <20261119-tipc-group-open-v1-1-cb725145da51@gmail.com>
In-Reply-To: <20261119-tipc-group-open-v1-1-cb725145da51@gmail.com>
To: Wong Steve <shyckless@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, edumazet@kernel.org,
 jmaloy@redhat.com, pabeni@redhat.com, horms@kernel.org,
 tipc-discussion@lists.sourceforge.net, tung.quang.nguyen@est.tech,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Thu, 19 Nov 2026 21:39:02 +0000 you wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> tipc_group_create() sets tsk->group_is_open to false, and tipc_poll()
> only reports EPOLLOUT for a socket in TIPC_OPEN state when that flag is
> true. Commit 1b22bcad7e39 ("tipc: correct initial value for group
> congestion flag") made sure the flag is true for sockets that never
> join a group, since otherwise "SOCK_RDM/DGRAM sockets sending datagrams
> never receive POLLOUT".
> 
> [...]

Here is the summary with links:
  - [net] tipc: restore write readiness when a socket's group goes away
    https://git.kernel.org/netdev/net/c/39738c813c71

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



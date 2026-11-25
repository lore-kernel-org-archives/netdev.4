Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573809;
	b=ZyNqFXuRjctL1suDwuKWw5DbCOn/+OFvVW86NNujve3EPKlPQa1UfnTt1HMkgfa6peQu
	 s72EggqIzmpxpMpF5bkQ+ZGs4qHqrYIQqN/JIvVnphgiN7mMWxyANXOAOC71z7DGvUzKl
	 R8lnVUEIrio5q+FEcLb80vJqcuoYXiq0304r7ESkCrnVb7FUxoWOvnxcKVzAVwwScCww3
	 NrOFWloqf3cI+VLL5HUZcN+nvVyyT2eAk5OX22SLQ5G+6jbVi3vY1YbXMiK7r+bml8nA1
	 ganq3hu2E+XWLeblTLKMgVYfyQlRJypgFUR/gu6YbnOrEA+Ha9ev+Miu+IUzPkQZ9Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573809;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Vn0U0xhFRW/j1G2qXML8Xe4bQkucsgVdQ5KP6qLm0zo=;
	b=4BHL6w6vcax7jaFfAVfrzueo3AlEVtGk0xdbPjfJHgBf2R9u2BV+8AMke5J5MwqgbK92
	 vOjrgq8jFQ/QJJ+BAzXVoeX/8Oxaa4Fa4cdqpVvvYJGSrgyDU0nFPACv0S0KG/deiIarX
	 vdorWr4emtIK3fk1P2O1mICrQF+2K3OcJYR/E9Oy5YU0TvgS80qk2MnbOLgx0OVjMlSeZ
	 wRM3KvhlOBlkgfqnOyG2Wup7C1i6MWQqoZnFGt5Vt1rIHKQ8iceVshtC4BSy2OsbIcnsn
	 m4EBejsQK9hMwm+RD9te2FQQO0HQEPyL0qmfqngHBk5ctsd73WDbWr+AzrpWBbixvWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzF+32zG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406D606A31E;
	Wed, 25 Nov 2026 02:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PzF+32zG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC47F1F000C6;
	Wed, 25 Nov 2026 02:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795573808;
	bh=Vn0U0xhFRW/j1G2qXML8Xe4bQkucsgVdQ5KP6qLm0zo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PzF+32zGXCiUOjUoA4M+55gYzEcZ2y4JRjZtZmYBpku3vI2bSsGDkS2eFJ5r1F7tI
	 AckqdwtfZpuLri7t/zuNgZczdEh6lI9m5YQxaa3R5jP1Ne2kSbgsv+3NPiu9Xd5iyf
	 g0P2bg7WTj8XSxJ6v9fTvjaXlQkPaMe008uy2I6Z5wmK6vofsqqyQTuVdk7DcLF9Nq
	 w47wfn0JvomPiIM5ncZNJXQtJKFrlEp3kf3bi8BihJQKOx7SyiOWfM0qx1iiF1qQoH
	 DGJgjfuH8//1rMWR4MRUh8dBR6awhkwXvnTAMY3by6EyCm3Tj+bhXfTZb31LwQZquc
	 rhDxWLLaeSHUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44273808209;
	Wed, 25 Nov 2026 02:30:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] netconsole: harden the enablement through
 configfs.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557380727.173698.14068827370668526971.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:30:07 +0000
References: <20261120-netcons_double_cleanup-v2-1-dccfb71e0ddb@debian.org>
In-Reply-To: <20261120-netcons_double_cleanup-v2-1-dccfb71e0ddb@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: gustavold@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 10:58:10 -0800 you wrote:
> There is a possible race when enabling/disabling the target through
> configfs with netdev events that can call a null pointer dereference.
> 
> My robot was able to come up with a reproducer by adding a bunch of
> msleeps() around.
> 
> The race is basically this one:
> 
> [...]

Here is the summary with links:
  - [net-next,v2] netconsole: harden the enablement through configfs.
    https://git.kernel.org/netdev/net-next/c/06d7ef874666

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



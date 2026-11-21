Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301408;
	b=ZwFRaCf/oi5NLs20K9orXc3OWngE/yYgZODOWlNBoZZeSQApY2VZnHPa2iTtJqhTvGC9
	 at5l+y6I8fDhqzQNQdIhD8uoJL/KVPJxkBzsaRSKBJxtKgRKIaKlpda3hK3WewyrntL5D
	 RR3uoV4Q1xdivs5kZr4Jwfngl9vl3ePs8ARY0N8EJNprI4zMEj8tKmu2273FlTwPGZsYW
	 8g2CPfTZBiEeSTYjrrc3YyX7DSoJ6hOwtU0HL12XxasAEk5h2Z5G/YlUe0Cio0YvOGLxi
	 8dr2+ntYr8aX5dwmJRjOGygbxJ8nP+JyArp+FtrPxDNppDJe49BAPzVe4HikJblukUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301408;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=7vSQYcMPHeeJmT3gjpVhMXddTizbh6H2A+z5Z24uc8k=;
	b=LHkgUC7ttbCPhhdV+WH8wpoObQ5eCdNToSHZfNpd597pu2DMlRxIEGYLgpU0Pv3LGkoH
	 bHdD5WhBxTErprkbizF0w4u3fIH8YWFyGiqon0SsEBOG4r/J/fDjAcTOzgbqq+U4glOrE
	 9ERTUEyRtZeBvnCjjnf6jCUOpyLF0rTNJO+wq9xFa8yogPUDbAhvzHi0n199a0H3k+btp
	 6rqNw6ADSwAWhvtQ/AX6/0Pw8Een6bmwH6SQghP5sH3oCAGEf2JQPx8fF33+4hXAoVFaO
	 cP0XduTGS349cS08cyavg4QcHfKPEJJPU2RMTeinocQG0z/17Acd+dWGnbwHylp+cqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQQnHK6m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5FE606A320;
	Sat, 21 Nov 2026 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQQnHK6m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4242B1F000C4;
	Sat, 21 Nov 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301408;
	bh=7vSQYcMPHeeJmT3gjpVhMXddTizbh6H2A+z5Z24uc8k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gQQnHK6me3drca2IlWLiZ6In7gVU28C+QW/mMk6K2qEiPatx4XS2oTKvq/gaci8GS
	 tWLAJSJu+RGr0E3DttMU3aycu3/n/D4QEh6sxjj+MvcmW9rSHeBFVse8qZQoOAC0Gf
	 bXywv4j4rnta6IHbr3tLK9hV6MEeY1vkIVhdyoJzAZPi47awvafgrUH6hWXOG7okdB
	 OoKbEivAPE98zTVqauMyYzreDFDfclDFbugpMY2bl10N4JWOBQcM7WziqZYAvE+zQc
	 r48gYGg6Pe5MCPFECe8S8WhcJKsv95PPzSpnu80qg0xY5D+r6PnrPctaH2nSgrcJ0+
	 hUHUS9wJTV0Xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A34E391B08F;
	Sat, 21 Nov 2026 22:50:08 +0000 (UTC)
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
Subject: Re: [PATCH net-next v5 0/5] bnge: Make NQ0 persistent across
 open/close
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530140703.1198296.17185704761543686840.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 22:50:07 +0000
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
In-Reply-To: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
To: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 06:16:36 +0000 you wrote:
> Hi,
> 
> This series ensures the bnge driver's Notification Queue 0 (NQ0) remains
> persistent across interface close/open cycles rather than being destroyed
> and recreated on each cycle.
> 
> Currently, NQ0 exists only between ndo_open() and ndo_stop(), so firmware
> async events (e.g., link changes) and HWRM completions are not received
> while the interface is down.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/5] bnge: factor out per-NQ alloc/free helpers
    https://git.kernel.org/netdev/net-next/c/fd60aec4b427
  - [net-next,v5,2/5] bnge: add bnge_err()/bnge_warn()/bnge_dbg() logging helpers
    https://git.kernel.org/netdev/net-next/c/47a515a29e69
  - [net-next,v5,3/5] bnge: add bnge_for_each_open_nq() iterator
    https://git.kernel.org/netdev/net-next/c/e648e5ea36d4
  - [net-next,v5,4/5] bnge: make irq_tbl layout depend on BNGE_FIRST_OPEN_NQ
    https://git.kernel.org/netdev/net-next/c/15120271cc51
  - [net-next,v5,5/5] bnge: create NQ0 during probe and keep it active across open/close
    https://git.kernel.org/netdev/net-next/c/bcd72b750864

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200007;
	b=nHYWM+7PevPFzwaV6L+v6MZgDx3j1cVcR4xbLs23L83RFbiy5Fiah2ymZJoEBZ7D8pif
	 SHHNixUW7kcq4Cwx/z0gz1oIEaZ6QDUcLmu9n4JWwg1MkM8A/7Ptfxw0JI/E+iKMDdWQ/
	 Eey9OJ41vXiXruKqTuUNeNRifdgXLCOvQ9dFf3BzYU6RMw/uEeDxY91itwdAdrAliTOss
	 OP9XDSRJOuhYrCq4yq9bm1Cu4SwIcJok9wcX38yikwYS5g6xLzJcPvYn1S+Qq+RScjNKH
	 ZXgSkW78nQ/OkeXxbuAYOdX14yQDErVpdIMqpbQ/B1c1/cExLWWEwPFKmDkNj3Q8tgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=KowZfwiFCJNEZwPlpnkpTpfQB7DrOhvwcZCjXH+2mo4=;
	b=vIAqQf7r9ln+2kCLIfpMB4TGCB+53zm55wlVZTH/Jiqb17beLdLvTYTVWmZJCjNkTXNJ
	 9/cMxzt7et7FaUU3NwLUJFvxnaB5z69EONSrZsQJSUWZ79R6ABuzHzG+0FaTkhS73QeJ4
	 wt1mkX/+fy5X7OuKTRTHk16OlkPiNIMzs5xRevui1xPkhJf/WKv+uwe8SOlzQ7tBig+D4
	 tmonXn0Nmta7NLnQ/QN/BCjq4L3tMxZijZECTLWsFSX6jPx1MaoU75HeMLYvoVOcjvdmk
	 kfRRIqpLcv3oFAJxGllbDYAsFmmR11oySp3ZYOTgD4uXsu9RKjd4ptRVC5otvb68Z6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Njkokn7L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CB606A338;
	Fri, 20 Nov 2026 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Njkokn7L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9341F000CA;
	Fri, 20 Nov 2026 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795200006;
	bh=KowZfwiFCJNEZwPlpnkpTpfQB7DrOhvwcZCjXH+2mo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Njkokn7LQqpxcdFdrEg4aNCyPAf1f50XmXSiN/IDJZJDoixc07/WMecptFkUzUnt3
	 907/6DrnHSYqBj4PVc/crCe8e8V/Nrz8wwVchA4Mx0Q5E47MheM/t+yZTLvHq1VgfW
	 /FZH0IufyQhxlkw4APksE2eV4/U4/mkv3H2Ko81gmwJewaPT858MLkOgGdSiuc4yJG
	 w6xVZjUQL0oYTwDKxbfYXexnaRZSTX80gicrSRFtDHtGSLNBJl9ee+uRUH9bwxoJSY
	 5OqMQJfhrbYFV+YFbRotaGHuV1k4yr5zTCqOui37fLMugi5fMBCB3XSlr/D/AQILNY
	 9oktnQNI6E3GQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4531380A950;
	Fri, 20 Nov 2026 18:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net v6] af_packet: avoid waiting for TPACKET_V3 copies at
 retirement
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179520000553.726917.14536544979792375292.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 18:40:05 +0000
References: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
In-Reply-To: <20261118135443.24767-1-jingxuanxie@deeproute.ai>
To: Jingxuan Xie <jingxuanxie@deeproute.ai>
Cc: netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 shaoyanghan@deeproute.ai, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, john.ogness@linutronix.de,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 13:54:43 +0000 you wrote:
> TPACKET_V3 retires a full or expired block while holding
> sk_receive_queue.lock. prb_retire_current_block() takes
> blk_fill_in_prog_lock for write to wait for in-flight skb_copy_bits()
> before publishing the block.
> 
> On PREEMPT_RT a read lock can be held by a task that has been
> preempted or is running on another CPU. The packet path or the
> retirement timer then blocks on the write lock while holding
> sk_receive_queue.lock, and the receive path resumes only after the
> copy completes. This was observed as a receive stall of hundreds of
> milliseconds in a PREEMPT_RT deployment; manual inspection found the
> same unconditional write_lock() in both the full-block and the timer
> retirement paths.
> 
> [...]

Here is the summary with links:
  - [net,v6] af_packet: avoid waiting for TPACKET_V3 copies at retirement
    https://git.kernel.org/netdev/net/c/d7f2d9b6c7d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



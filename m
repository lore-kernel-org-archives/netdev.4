Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966007;
	b=aVuYGY5UOmFANKvXToWRfASp+LL6pdeOvD/9DTtGoSGUNmutN6SE27vrn4MB8X1stF9r
	 cCkxlYAoF8pjYo4SluG/OiqdYT9x0Od04qYYYR/hPOMCxYe4dZSLsPZ9J26nunO5I+74o
	 ACTZV8fIxdU9KY25GA5RmZ+rU2FlpmBCk+p3rTP7VOsdgvgIB+PW6Sn9//4OigjY1U9Cz
	 f0oAROBbC4tB37PRLqpXhXx9vAa0kbYdQygUGCWm9ksDV6J6rgw4LJDLE3dtQgyhwi4A+
	 pcYCbo7ZcyllFQWGylM0BRFSKzVpYkYQimPlZ0ROLiWeLc6AN0Fd1luuUhjpk285zbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=1soOCZTnRX0vpb/4qrQe+S6aRL4U0UuphsWjNwvbDCg=;
	b=akPPDY4onU+Rmwz39jFdnESFfwGcbtHw4OjFaH5s3NmFLOHr583pAUqs9Er6hUwP1e1x
	 /v3OgLGrG61hdvRDLBnPf8QfrUj6BW2Oju4dvqY01PBnfS6z6VtWWFqGEyxnOq6z6skgS
	 nByuJvGEk2Kokq1f4faKJg/sdcWI7Lf3DrvExMA3AsFQlOjJRZGsijTTo6t5WpPKbjQWP
	 4G1pd4wU7UxooPpZrKnhbRdLao7thSCM7leMV5lvJH/Qnmjp+c5oCjR5vDq40Y43Vob4A
	 WwytfJzKAvlqednYBsEWNeTohHEA5H5yA19DB2ju9+Dh7rWBWmTDF9LXemW4HUUmoQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ubg9Deyk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFFD606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ubg9Deyk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EB31F000C5;
	Wed, 18 Nov 2026 01:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794966007;
	bh=1soOCZTnRX0vpb/4qrQe+S6aRL4U0UuphsWjNwvbDCg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ubg9Deykmr1DY04NuHptWPJBXKup8nlXKSllC3cXd4fTNb0PuVLygnQmG3DR84Gm9
	 Ihbiz5m998eM7kafYegzRUU3LK3W/sDH/rMGLIMVBkkYIg/oaUwaZ2Nib2mZIuDDdr
	 GtUyjUBdWu7KK+xXjUK/98yQsmNmtDjbbOQtQxbV2u7IkV+awhtCXdb5L3LDMFHSnU
	 IiV4QX45/ADK3JUYpVskdJlFQMXmgpqabLEc9bW8eKVuGz9DOg/Z7fB+wL+i7H4M4E
	 rOt439DbWkstyB0qOb4bikYADpxjhQzVBpTEdlqxWPCKZkRsMsBmHRDaxmguAhmT7z
	 OCOFgFXn6CntA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2F8392B1FE;
	Wed, 18 Nov 2026 01:40:07 +0000 (UTC)
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
Subject: Re: [PATCH net v2 RESEND] net: ena: set admin device pointer before
 queue
 allocations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496600603.1396957.7963670985944377138.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:40:06 +0000
References: <20261115114239.2308017-2-thnkslprpt@gmail.com>
In-Reply-To: <20261115114239.2308017-2-thnkslprpt@gmail.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: netdev@vger.kernel.org, akiyano@amazon.com, darinzon@amazon.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, atrwajee@amazon.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 13:42:40 +0200 you wrote:
> From: Wajeeh Atrash <atrwajee@amazon.com>
> 
> On the first probe, ena_com_admin_init() allocates the completion
> contexts and admin SQ/CQ buffers before setting admin_queue->ena_dev.
> Their allocation failure paths log through this pointer, which is
> still NULL. A failed allocation therefore dereferences NULL instead
> of returning -ENOMEM.
> 
> [...]

Here is the summary with links:
  - [net,v2,RESEND] net: ena: set admin device pointer before queue allocations
    https://git.kernel.org/netdev/net/c/c5e5ac57b559

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



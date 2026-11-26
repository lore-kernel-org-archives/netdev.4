Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795659607;
	b=ezuhWv59ZMHMvjwUJa//QEqjcauKYtT417I7/2gfngrvEq5WN3KAcKgKeSLn1GorKQ1k
	 0pnitbVBw7xC12WUrbDaXfVHun4R0QpJjrgTKSSLwrhoqSwFkZWcSyblmLjiIFwtDE3ep
	 GyKJZfa9xJ1p2q2qp1RnIy3Z35fFZji7pZPJWp7FA6QJDdQHmPGX+RqH9ngLhVWnzUL7s
	 lfJhrz7GfOBERlg1iqTrNAYJopIAFa0/Ewfpb3sZbm13ozKZV+DuY3ARByhcQI0apZ+9y
	 hbG9OyufvGs8Dem5Hrc7b35t5pVo+eymA31KCwzw9XqakM9Lr1W4wG0v3BaKWBQt07Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=8LLh1IQvOtnDIDr0VrhqdhiT3Y4g0KpdSFHS+ADwpPw=;
	b=iy+lg7U5WGL6AZSisZwFAQxbdLmSXKTpXXeXEamVdKPsTZ09c96CFDwUAVlyOECQ0Oy3
	 3kmIGO/FlZCzImzfhHxdzajEwqiK4u+fNcTwG7tkHA0xzUZBfzGo87wWlrZpEibRfGBf7
	 QlJOGCWsZHvSUCaN3aujuou4NeSd4jTZVrCx76HSzraGVAXwUU/wmur1oPisr1fHUULAk
	 4qRXKb+Ekxh5eONvPXSfhT8MsAj8BzJ/K4zlcDxvV8r+iGibZwOPmXCRIznZlVxg9eW1V
	 6UOFMtBHnkh8qNgF0zmJpRWE0LWRV1nbIG/SBBtsD1S3SapZ/rci9bRemV8fDWYjgtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3MQiBvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9CB606A331;
	Thu, 26 Nov 2026 02:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3MQiBvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436F81F000CF;
	Thu, 26 Nov 2026 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659607;
	bh=8LLh1IQvOtnDIDr0VrhqdhiT3Y4g0KpdSFHS+ADwpPw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F3MQiBvr3f0yzfZgeLqhx7QieQ3vCPLia7w/r53O25rsXhohNC4C9svoh6iEdKDdb
	 vrh9sTlvdtlOQKAuKJIRTHuxIEY3e4aBU4EwC5u9OQQonfbh/zQiuo/YRD9AQ0RekC
	 ntfOyrRMwB89zG8pdlu5b7UpysQfP5OeVf7XP6bighG8vEqrddYvpdyDklfyxcOsDU
	 Qm+uyAjbC8acgJcLRv44MVFbbt06o5Ju5TlBn7vsUiy4glJFveG51Vs+luQ3ON+rCu
	 lowzhIfspo5Z8qLJoqwv4TG1fS3aj0AxUOKBiUnBPf7vPwi71De8ZIbeyQ2brtljIi
	 aAxrUypqcxQCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3823809A24;
	Thu, 26 Nov 2026 02:20:07 +0000 (UTC)
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
Subject: Re: [PATCH v2 net] net/tcp-ao: fix reset key lookup for IPv4 segments
 on
 IPv6 listeners
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179565960577.1453810.2247217476715849616.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 02:20:05 +0000
References: <20261123034047.56745-1-dennylin0707@gmail.com>
In-Reply-To: <20261123034047.56745-1-dennylin0707@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, 0x7f454c46@gmail.com, fruggeri@arista.com,
 noureddine@arista.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Mon, 23 Nov 2026 03:40:47 +0000 you wrote:
> tcp_ao_prepare_reset() looks up the key for a reset that is sent on
> behalf of a listener by the address of the peer. It takes that address
> from the IPv6 header whenever the listener is an AF_INET6 socket, also
> when the segment is an IPv4 one that arrived on a dual-stack listener.
> The address is then read from the middle of the IPv4 header, the key of
> the peer is not found and the reset is not sent.
> 
> [...]

Here is the summary with links:
  - [v2,net] net/tcp-ao: fix reset key lookup for IPv4 segments on IPv6 listeners
    https://git.kernel.org/netdev/net/c/ef3e21c61baa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096814;
	b=BO3Sm6aAlXE4VgFw7VuQgvcabsL/mJV11ZXMN27R/thSqUxi5LTyX2+N1MKS+763TV57
	 YPL7LLMXQ33lGNDVoSq5Ut76Xh8P2GqUT11wsBOdvgPvkYFBuqw3pLC5C08pTladJdZs7
	 OuZj6RVHkiLucoDEzkfxt8NI6HqsWhDcxpYB4fvw66fE+vStyq4ngSn6cz8yFptui6twC
	 nl/zqea0AQ2PIb8wf4Em38CaW8UmV8xIE0OWRnbOyxCLwzLBzWa1QT1rCt6X/Kvhs8Sa4
	 SfPlN41HX6mVjxu/Mg2milBdGNXcEfDetmQY1JVvhEXy2ePbIoxBsqReAS0hJvs1Ogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096814;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=XHMfCTSd4Me+39ra2yYUFHcxatlMnpVyEhC1fpgU2ZY=;
	b=5Be/UQTYtto8mgn1ljtAHqCrzcE96xJZEnjiBbuOrP4mI6J1IVSjyiV4WQ9cfjocnCXB
	 N2SMmlIBfJssuyICjCLbnX5UvPL/LGno8fqhaYMkS19Lvbi49foMOlardN4TZfMf3I/ns
	 lce8tFixsFj7s3YvyrveocDx1zmYNYQj+UQj4W5G7ZzIjsKHPlsUYS29cuGYtPcLWgIZX
	 3QVY1ox8vphKkJ0AMUJ1kf1NDVUJIjeu6oQLZjdOEqjkKRjJI+7W08aD0yqCKmAFyNpaH
	 0OYi15xy0gUHevWpG1AragVJbsZTXvlKY6nTQwT4ZzG4WvtDQWTpX4x9M3EcwYJOHAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Piymz8hX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE577606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Piymz8hX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8162D1F000C4;
	Thu, 19 Nov 2026 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096814;
	bh=XHMfCTSd4Me+39ra2yYUFHcxatlMnpVyEhC1fpgU2ZY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Piymz8hXD1/snqdZAZ6Rhy2oDS3aFZWwa8snfb0+jfg9Xf3b74lxncNK7BgztVyMz
	 KsYHPkkvCXnrJIfsaTIrpH+U5bm8zbbXu9ltxuLoI3AkqGanuMqPAeZFNNBnE7OHuX
	 Ri71wvTGIDoVECUThnO24vEW3wjc2oRlBSYfPn8iFRy3ztNTJfUCl66jQT5gtt2BnF
	 nhsl3vV4r5733sPMNutYYqX6P4h0JdlglAR7EVg/O7ZPmD3H0n0Q4uSCiSJRbPF5N9
	 c6vvr7u9VInOwiLPSXyDXAUieXz/K7k3vbfjKejeBMCBne8bmN9ZbliHFehbFefAJ5
	 nEMDiXDvsluhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773D83808210;
	Thu, 19 Nov 2026 14:00:14 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/5] tcp: avoid integer wraps in the RTT estimator
 and
 the RTO
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179509681302.3111853.9422946326470199818.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 14:00:13 +0000
References: <20261118155144.18393-1-mason@kernel.org>
In-Reply-To: <20261118155144.18393-1-mason@kernel.org>
To: Chris Mason <mason@kernel.org>
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 10:51:44 -0500 you wrote:
> Hi everyone,
> 
> This is v2 of the RTT clamps, with Eric's review folded in.
> 
> Patch 1: __tcp_set_rto() never returns 0, so that the backoff recovers
> from any state of the RTT estimator.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] tcp: don't let __tcp_set_rto() return 0
    https://git.kernel.org/netdev/net/c/5d2a5ad03677
  - [net,v2,2/5] tcp: clamp RTT samples in tcp_rtt_estimator()
    https://git.kernel.org/netdev/net/c/fa472d53d9b7
  - [net,v2,3/5] tcp: reject RTT samples from TSecr above 120 s
    https://git.kernel.org/netdev/net/c/1b91d9c09aa7
  - [net,v2,4/5] tcp: clamp the samples in tcp_rcv_rtt_update()
    https://git.kernel.org/netdev/net/c/f22d5042faa6
  - [net,v2,5/5] tcp: bound the rto_min of a route in tcp_rto_min()
    https://git.kernel.org/netdev/net/c/314b35c8173c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



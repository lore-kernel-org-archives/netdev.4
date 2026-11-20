Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140610;
	b=MR3eXaO4rKRzTkooye+y2jphs5GtJLdvhg7kUiOSIEgfvGpWpgWgtVXs/t0/lQ+iWKxG
	 +hedNjYrZDsApPT94C6L/+RLpOII61J/8cGZL1kN7Z0vNBU05vs6sa2yDu1t07Vb5xXL2
	 NiMFrdcPehevP3BTJgOrL+xb2AbPLitgZWsM3bE34hP/xSHRho/WO0DKYJK1V5eZKfGv7
	 rqRsLOHmtw58g9kuZGvZf+vJZRacI3YP79jdJud8RmWwgb6RPzFWVUnIZjCkjdYTHeG62
	 lSbn07tUji4bdPr2MdlvHGF0pHl9HQZsBXJEY83jQhK2zMnIOGCVxwX2Z5l+MRaFKXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140610;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=BWF/o7HxuhpeDvyIS/P6u0dIIiRMG6uCfb04buHYMAw=;
	b=PHKhYzdxKxccMDqwKhJMzeq6md37xypVRG0+RT0uNYg3UJmyZMIwAaH+EYE3ukJgE9Uc
	 f7Gz2mvq6YrMp6KhqV3W8gACM9eF1ggC9tlQbihJVw0OOsFkNVve+RurFCeUCIOPpC6Pm
	 uv4UUuEM8ot2C40fcEure2LX9a0A53mrwvxhiHl5HefEWPPiwbaC+KihTA+AQtEl9p9mu
	 XFf1rbQ2g0dusLPwbPd3L4Aoi2rRKfBF4KVlbyVMA5PqAlyWHcIPKl+She36/YRxWYyyv
	 /d5bmxo/6kuwxihSLzoYMd3jwzB7xGjqYM/+miiV15SThiV6m2t9Wj7Ip1xCVs722aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fsn3MbM1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B316E606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fsn3MbM1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AD31F000C6;
	Fri, 20 Nov 2026 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795140610;
	bh=BWF/o7HxuhpeDvyIS/P6u0dIIiRMG6uCfb04buHYMAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Fsn3MbM1H8nPZJ5Fnfy0J2BpkjlfovQSkKuSMxkqUkudoBMwl7bOJNplRBqkoJklq
	 +0pRVHLck9QVfXX55D3S/gck+EPp2Ne2R3TWCyMh8Jh02zntwgwpMAl5HlwH2gyhuq
	 i9vyD1BZpUmLxEVMetuJbg6i6MRrpnX/ZH3FLqzaMjOKNOdAXOUpp4qIpEhhuwRgPQ
	 7xTjI3BhRdA6j8R6J0HKLeGQdyE+SCS/Fl30ML8ELd+UvNsoEWVdei7r8wnH6cqpEz
	 HIEMs8jHeVbJv60aMTlIGM0qpspSmem6y3Z+p9xkbWorXX8ChfStoYB0wiXrwN73+G
	 xnSXt9z9fZR8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A32B3808209;
	Fri, 20 Nov 2026 02:10:10 +0000 (UTC)
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
Subject: Re: [PATCH net-next 01/15] batman-adv: bla: use dedicated key type
 for
 claim hash
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514060903.3979015.3571765439725680582.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:10:09 +0000
References: <20261114091556.3336038-2-sw@simonwunderlich.de>
In-Reply-To: <20261114091556.3336038-2-sw@simonwunderlich.de>
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, sven@narfation.org

Hello:

This series was applied to netdev/net-next.git (main)
by Sven Eckelmann <sven@narfation.org>:

On Sat, 14 Nov 2026 10:15:42 +0100 you wrote:
> From: Sven Eckelmann <sven@narfation.org>
> 
> The claim hash lookup functions are given a struct batadv_bla_claim.
> For a lookup, a dummy claim is created on the stack and only its addr
> and vid members are filled. All other members stay uninitialized, and
> only by reading the hash and compare callbacks can one tell which
> members form the key.
> 
> [...]

Here is the summary with links:
  - [net-next,01/15] batman-adv: bla: use dedicated key type for claim hash
    https://git.kernel.org/netdev/net-next/c/e5604b4bf76c
  - [net-next,02/15] batman-adv: bla: use dedicated key type for backbone gateway hash
    https://git.kernel.org/netdev/net-next/c/f23273d7aa9d
  - [net-next,03/15] batman-adv: dat: use dedicated key type for DAT hash
    https://git.kernel.org/netdev/net-next/c/77e73f6381f6
  - [net-next,04/15] batman-adv: tt: use dedicated key type for hashes
    https://git.kernel.org/netdev/net-next/c/d4813c39c32d
  - [net-next,05/15] batman-adv: originator: pass explicit key to orig_hash
    https://git.kernel.org/netdev/net-next/c/8c42235b3d88
  - [net-next,06/15] batman-adv: hash: document key argument of hash operations
    https://git.kernel.org/netdev/net-next/c/733eaea66bf9
  - [net-next,07/15] batman-adv: never consume skb in BLA rx and DAT incoming snooping
    https://git.kernel.org/netdev/net-next/c/114fd66162da
  - [net-next,08/15] batman-adv: always consume skb in batadv_forw_packet_alloc()
    https://git.kernel.org/netdev/net-next/c/873b9f25cd4b
  - [net-next,09/15] batman-adv: split fragment forwarding into lookup and forward
    https://git.kernel.org/netdev/net-next/c/04fb828b297f
  - [net-next,10/15] batman-adv: document skb ownership of always-consuming functions
    https://git.kernel.org/netdev/net-next/c/770779407c2d
  - [net-next,11/15] batman-adv: tt: increase hash generation when purging clients
    https://git.kernel.org/netdev/net-next/c/581a1de769e4
  - [net-next,12/15] batman-adv: dat: increase hash generation when purging entries
    https://git.kernel.org/netdev/net-next/c/f984ddb2522d
  - [net-next,13/15] batman-adv: bla: increase hash generation when purging entries
    https://git.kernel.org/netdev/net-next/c/b34f640b6d90
  - [net-next,14/15] batman-adv: increase orig hash generation when purging originators
    https://git.kernel.org/netdev/net-next/c/d1c3f6e0d7f3
  - [net-next,15/15] batman-adv: annotate functions returning objects with __must_check
    https://git.kernel.org/netdev/net-next/c/e2c4b4b08e96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



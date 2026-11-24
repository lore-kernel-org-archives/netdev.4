Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522809;
	b=ITnbuYNmjOKW156aaFklmHOrJy7aJ675tZItEPMQe1xuTMYgrjElCATYSzxX2i7GmfXt
	 UF+Dg9aAa3Rrx82Ru94bNaRGZqLapeC7aER/41E9bPTBWYTGNiZkL8Nvw1igXcmkJ7EP3
	 iTQrBqfk4MUqj/QyO+ilqWEEuPbn6pVzLy3SrecCMlBhvQ5IDjovP1xlDoiH19uvl7Sj3
	 uulrYf3iR3BPXIvuwgsZnf0HTTBEa6mjbtjlURAXZ+czWtl6A+W/3uCvwZQ1ts0DVRLly
	 /ZTgeFpj3l10BPxhuCjikNvj74zUK5Sj4uRzDu3Teu05UaU74QRuvDjs/RFPKTL6Hwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522809;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=gzN1qDG3DahP5B3noBfp8hpGNH6z5PvQy6fzoS5h2jg=;
	b=xi48ZUVlIWCus/8Q9ZGNCrHrdKtb5SjHnN85jnYh75ou4fVRRphxS2nTQGKVpbfp/LQV
	 3ZNa/dno/PY0Wjy3k8sv26S+phCjQWlFPXRilpFPhXJ5NyX/rCLTUIkMJlZoF875jMxsU
	 CpS9aQgW/PFWRd3tww4jmfYIa8s4ghoxYndyh/xG2ClLMxWq1RU/4OtKO+nS059D8prhO
	 TlQCkqidcwl7t3RbZvpRHWC1Larthaew1Vs/in+uGgN7Hwd7LoIb/RXF4lZp/xkWrPHrS
	 EbaBxJH6m2qRadt+FoyAxdvQOK6JfSg1Y96hkVmIBy9z0M7MrKym7ymEKFuPyNBYMnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTnZrQmU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF892606A31E;
	Tue, 24 Nov 2026 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTnZrQmU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0613D1F000C0;
	Tue, 24 Nov 2026 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522808;
	bh=gzN1qDG3DahP5B3noBfp8hpGNH6z5PvQy6fzoS5h2jg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PTnZrQmUsgxV4O6uMFDvOQ2bYoex7sA4bGjaYcBCOqAMeqGc12l9KPJ6o5B5sw5pN
	 dC0BizJUPr5/FYMUKzfmGAEuxMx+cEZ/AN/328+oszZIIDHfTYSO/knSBm7x8EuOuP
	 +cLc47154jJ3/13X6CLvztlC2+kf5R+R0RZZ5u3JcJ/n1RZCnc68K05G4nhPwYUkcp
	 Rk4y7rs18cBp5lkMsLEPOGz4/rbnKee1pV92GTxale4y21a3nRieQGHeccf53lv9Si
	 ieSUMWA44Jf2hzi7S5QkBv+vBDQ4X9hei6whxL4WTvywMCQAmhRjIB7fxZxVX5WKLF
	 NANUDU/bK1JKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F17E8393107C;
	Tue, 24 Nov 2026 12:20:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: avoid hashing the namespace pointer for
 device names
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179552280678.3493825.12303833584298594015.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 12:20:06 +0000
References: 
 <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
In-Reply-To: 
 <c9b3c1a0e3410ffa70db448e2299ed420528b5ff.1794981913.git.zcliangcn@gmail.com>
To: Zhengchuan Liang <zcliangcn@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 17 Nov 2026 22:26:52 -0800 you wrote:
> dev_name_hash() salts device-name hashes with the network namespace
> pointer. An unprivileged user can time SIOCGIFINDEX lookups for chosen
> missing names and identify collisions with a resident name such as "lo".
> Ranking this collision pattern across possible KASLR slides recovers the
> init_net pointer and thus the kernel text base.
> 
> Use an unsalted name hash. Each network namespace has a separate hash
> table, so this does not change lookup or namespace-isolation semantics.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: avoid hashing the namespace pointer for device names
    https://git.kernel.org/netdev/net-next/c/a4c450594f5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



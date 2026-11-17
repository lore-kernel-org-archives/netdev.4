Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882608;
	b=DGwgfH8jXoTHgisl4Uitv3Me94oQzC9B3QJAFImd8N6vbw4yprxNv6ZdVdnHGI887/Xa
	 me2k15ZRwid2GUdgSKGKrwekpkxiXdWxdFrHSpTSabFM+lP0e+wPsp3iD9UFyxJSOPFhC
	 0/iDxNs2jNkYAciFB73w44jBG308mRR/9Xt986OVtuXV6GqIDWIjf7WgWHEf5vEtuaGwu
	 QBlMU404MCcp5aQ5qE/sJ0JxBMZ2vWIgF29Obra2BANr3owGvdAv54qtjyz/utcweq/k7
	 lVAZPTOsINhPexkIItEo5na4y3tx+NveZhLbWTxLpWHS1z9qZcqjBszGyzmWya0xQAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882608;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kUuSC94oO3/oz5N3y5d23xYGfsDteOEa8OSE9TcfuLY=;
	b=sL7Ywamajm3/goNKN5lcKNumK7zdU6lkr3MNKeFzfha86Z9vtlP3tKUqn2sroYgVxFoy
	 zVPHs3ZNltlJmDZeCY180KH4f1n/5GJ0VF8RYDEwb5M7sFkoD3x6N2/6iLR3QLDKRc5G1
	 CoVaCVj3jaSWgj89CVNKrroxv+r+OcHEVRYyXBNUb6KPjF7hVJcOCmIjaIyF7NIxfGi1k
	 hCo3JWDcnaSF265Dvg62PnaARAtAc2/AaZ8PZmXgqkgF+iEhW4p9gjf/u/eImRF/Qgky2
	 +eWppswVvswPiaWQ+ySGyH/k1/ye7Xx222Pxhoovxwn3cYh2LOVHl+WDpSodBfdVYww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGkqBFiq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAF5606A323
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jGkqBFiq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE99A1F000C4;
	Tue, 17 Nov 2026 02:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794882607;
	bh=kUuSC94oO3/oz5N3y5d23xYGfsDteOEa8OSE9TcfuLY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jGkqBFiqQ2tQK+dU+1kXVS3FYXO3GWK3gQOl21swvoSrUKNIX4qvwDrgpSibX7uME
	 QCRqqYr4fxsTdjh3twKWOY0lS80X7TevZXgkxjqpStoBLwLUOaT1V3j34zqd6Viia0
	 jDPGmGe4lsAQB9SLgsG7hlvBT2itnIVq1D8XkX9l5L5PtY+vAbkhzfr3iAcBhKEtyw
	 R8xcqDlvwXpE/VBJ+J13gJuV+C8krW8NWpzWBfJwJBvu5TU8q6DII2ENTpJAUigfM/
	 rsdAaX5QAB2vTrzqO2S7sAzBRAdc9REPjwY6m/+nka39icQHd8fW/ELsu4JgNlidxZ
	 zO1LoKT8VtwAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44DC391B088;
	Tue, 17 Nov 2026 02:30:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/4] selftests: net: add performance metric
 reporting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488260653.297000.12268110044714000172.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 02:30:06 +0000
References: <20261111000246.962871-1-sdf@fomichev.me>
In-Reply-To: <20261111000246.962871-1-sdf@fomichev.me>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 16:02:42 -0800 you wrote:
> Let Python selftests report numeric measurements, so that CI can track
> the performance of drivers over time, and add two performance tests.
> 
> ksft_metric() reports a measurement of the current test case, which is
> printed right away as JSON:
> 
>   # ktap-metric-json: {"goal":"higher","name":"throughput","value":389.127}
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/4] selftests: net: py: add metric output
    https://git.kernel.org/netdev/net-next/c/d3def02d1d5f
  - [net-next,v4,2/4] selftests: drv-net: add an iperf performance test
    https://git.kernel.org/netdev/net-next/c/c1d2b8e89a29
  - [net-next,v4,3/4] selftests: drv-net: add a kperf runner
    https://git.kernel.org/netdev/net-next/c/d069373da963
  - [net-next,v4,4/4] selftests: drv-net: measure devmem performance with kperf
    https://git.kernel.org/netdev/net-next/c/a642edca4a88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



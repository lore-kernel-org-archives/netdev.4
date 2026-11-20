Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140612;
	b=FdQmDWw1VeciiZli6uzlISdsFbO2oYfKDwc1eMLZHAXECOsMV+NTKFuOqU6MqPrUFTg+
	 yS6EXJjjaMC4TM5KbbFarSbAaPwV4Y8psxilHCgnOEvkZTHp/w6pQi1Qfgd/X6fMZelr6
	 OKpK4l3JFkuJSRUaYNUAKLfvHpA5JpdaPlAU6EwdpOBVIU0IEzJuFqK+yASN88Tz7kTh/
	 vK6pNFfgORsj2YQE2sybxGI0koGoNqbXDoyI791fNom7/tjEq1u7dWLUvxnqHgkhG1qCX
	 fmxvpM/uSdfZDnNHxGnD/A/bRsVrzqq6dtiZQmk0mXSn7DKuklDdIZQBj+vyHDUgS2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140612;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=m6dX7bMKg0suoqPEar3y5ccuT+x7eN4my9DRKPnLM7s=;
	b=YyxE23K7m0y8hWZrcAEnLjpu8KH811iIAo6N3B1H1sd3IKRJJOxcqhgoEdnqMYuzf+If
	 KDUNZ9sWMkKoVIFT2DigYHgJi6IeSFKNqTbNz6JfWC6L1QooNH5Oxn7N46KC3B18Frb1o
	 8wMzrMZEKiq5tQkzDwcMmQblELafhuldI3g3AYL3XYvHiqHH7Q3x+1+8vXBszHn2vZMur
	 gJYUeYHxYCWSoWqk2L9xxMFlwijfCGDX7FWmuQtcIECTN8HqoPPtGpc4eD7s+7J1f3knm
	 gI6jlMmOX6qfZTJ9PVPH8D0/dPa481AR7Llr5xrafNCK/vdUWkXuix2bNdDRevdAz6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mG0Nk3C4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D41606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mG0Nk3C4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8081F000CA;
	Fri, 20 Nov 2026 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795140611;
	bh=m6dX7bMKg0suoqPEar3y5ccuT+x7eN4my9DRKPnLM7s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mG0Nk3C4rQ5sJaV2ZogJA8CQAZ/suL40j2a1moaJbpZE3hYg9tExWNDYfIVKJZ6j1
	 ZW8xk1GcKPyUjzh+37a+YRyViWUH78O2p7/xkWY+FViUlI3gswsQma4vjL+lColtX+
	 Ygubt1L6VlAvUPgb8TX+7zzJBeA7PgPoLTcVP0nzrafNao5vxgYzYidzFYlcIBRdJL
	 ZVpHTFVtahpmQQprfUD0C5pO94ajt0z/qQKzlNAL+GqGU4gZgOvuqSqQXcIVpOC4lT
	 aNg8rnA01CL1iJnGkvShYur369d7rd51KazlS+Cy9J4pq0o9pk7onU4/AYxQqNCDda
	 DYZ/zOtMiPt2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B456E3808209;
	Fri, 20 Nov 2026 02:10:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/2] mlxsw: Fix teardown order of CQ NAPI
 instances
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514061027.3979015.1986878671638427049.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:10:10 +0000
References: <cover.1794823524.git.petrm@nvidia.com>
In-Reply-To: <cover.1794823524.git.petrm@nvidia.com>
To: Petr Machata <petrm@nvidia.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 idosch@nvidia.com, mlxsw@nvidia.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 11:16:45 +0100 you wrote:
> There are the following principal objects for processing of hardware
> events: event queue (EQ), completion queues (CQ), and receive and send
> queues (RDQ, SDQ). RDQ and SDQ are then configured with a CQ to which
> they report completion, and CQ is configured with an EQ, to which it
> reports completion events. The order of configuration is therefore EQ,
> then CQs, then RDQs and SDQs.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] mlxsw: pci: Process EQ in the IRQ handler instead of a tasklet
    https://git.kernel.org/netdev/net-next/c/a467c628a7cb
  - [net-next,2/2] mlxsw: pci: Fix teardown order of CQ NAPI instances
    https://git.kernel.org/netdev/net-next/c/b494a6d7da32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



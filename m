Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446010;
	b=upq19rbNNt25zAEPYF1xaJ5c45Jg8NQJzZEmtDHq1iQQIBSjcC6VHIvs8nND0ZkoNMym
	 hmP82RvnNQ1Pq0XUwmpTbizbJ5b9GFq6OCkFk8VJXLXBZnzedjegvx/qoR9D8sGoArTIR
	 tTckIaYIFyAfOatf5Ygq3VqiXxuXcY72Zm/IgDu9LLj2et5yU942CuH1P+0jhBvx/cfmI
	 NWdVIO49oxK1PfSSPqNkTAW7/oJEHvPU1ZsI00EhiECr5QAom8/4ntZyjxVwdGQSkAz2E
	 enRQ+gQ+fb4muAXrwCRrKK5uigGapcy/Q0+adzWkhl333unV4xqsWRpVFfpmDVcbeyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446010;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=YeKTj8sU3PPVK1jqHNIBn6E0hYZh7ngUgDcVZ2nW3qI=;
	b=nWQjJMijLPKzk8EbsGmmWlV2zofRcKc/1PnQ8z3t9zG9GkR0peL8X6rKaY0P2e7oQ6HX
	 eBJ5AKSwbETB5fEbz/8emBs4PV3IWYMoDo1x2SQp5XuyxQwl3lYvwqfZ2tw83SBvhaaIm
	 WZlzfgQ7No9s2MCGScS3v+5YJw2CNk8VeGvDDoytt8ehEKlD7Cyqo8Ey7LCHIoeeUd3xM
	 52T8uxturdc0SRM62THBHAUuT0Glvf/pY+MPnxXt083D7MRc5XM3qoun5UtbDY6ybediG
	 tl9MR+sLZJ4fTCbYZ6oLJdL4j3Eqzm4vjtYBFCYWEwOmxA4FGMofijAcoh5rXOJOQmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePQy81q8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BCB606A335;
	Mon, 23 Nov 2026 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePQy81q8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0D01F000D3;
	Mon, 23 Nov 2026 15:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446009;
	bh=YeKTj8sU3PPVK1jqHNIBn6E0hYZh7ngUgDcVZ2nW3qI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ePQy81q8oFLsSMqmQViHrg3+sOBKvkUC99sl1+PnNaGR6tMcujMT8LkkOUuKAN1QA
	 vy8d9rcf/VcdP1rrhdI9uaTR+Gh/FTJfB3bInhjOYbJtUhkkU3PAW9nX0Vz0STRlw9
	 63MvXgLyghChW36pV2kH/HNI2ddnA7syovuMcq6fc98NjMn0vO75oCXIyPaMAIBT6e
	 yvmBJPk8Xo4k9YvO5TMCuwnaDTAmxzjZSFm2mNxlg9gNHTPKY2vEwEdwlWTKfJfskA
	 H6WhvJj9B4CYJvCc7p0ZIJMlVR9fS0MU56PoBK32THlh1e9ajmilG2VBlTNlRFXedK
	 xzZN8gBWB2VPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4593392EDBC;
	Mon, 23 Nov 2026 15:00:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port
 count
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179544600827.2443681.14423703100229910536.git-patchwork-notify@kernel.org>
Date: Mon, 23 Nov 2026 15:00:08 +0000
References: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
In-Reply-To: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
To: =?utf-8?b?546L5rWp54S2IDx3YW5naHIyMDI2QG1haWwuemdjbGFiLmVkdS5jbj4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: daniel.machon@microchip.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 14:43:07 +0800 you wrote:
> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: sparx5: check DT port reg against chip port count
    https://git.kernel.org/netdev/net-next/c/5a1f67933615

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



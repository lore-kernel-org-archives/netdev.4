Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689609;
	b=dbJJmQhtbYPlLsXrFTFcAe9K5286rqLh2V53lawPCudGE9caAmkikdzB1oGgoCwN+2du
	 YIPPDTx61yOM4/bgEMmpW8hHn3Fm1mOY0mKucA31kv+3FMbZa3MOXP6hL8Aemwzj7uAI1
	 qzEHVkJfals3omtgvS6EPCnRI3EDhhEeqlO0WhPOXpzCRSrYMD/t1V6ME1xfk1CbeU8Q5
	 BLo0OEe8pIe5GRhD9j+ilBf3rx4s+mlh33tEt6Tn1rhFfZiFDXICahKgzmnXo75DiRorI
	 7Ppo5klOljEcypaP9HfyQkJyznZKXSwBDFFN8aqGkjX57//UN6qPPcb9Avt/7FSUljg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689609;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=LfprxN/QdAZnrSHHhLltBZXduMe3vynMUFYHITEv9BM=;
	b=assbu/M/Tl+O8qcLxu/IaeK1uUtUmWreq/7r5Twr0rT3xUYu6kvHubchA6sjAOT4gePy
	 bY2Fs0T4WYcMaY9areARn8b6cDCQneN0VVHQTOJMWUtV9elALEDKYJT0AtcqKragKTJG6
	 X7Pw15eCCRuh9myJ9NYywz1X4I3JjiyRvPRkplvz49CzE9OwrmUCM6cXGe1cJqHTICdrI
	 jBkxzGlXu1FrGWDJ85qJOa/dUiz1F3aLrk97TQjiwqlmxP0F152/roKbhqtmUsxK2l/1q
	 tQf2nsQJ4dAZ6noEQZndfm30zm42iKnIkqS5zz25Mw4Ux0qPjp6RcS1Bf0khJ9rke8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJfSq1Rx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05886606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJfSq1Rx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828B81F000C6;
	Thu, 26 Nov 2026 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689608;
	bh=LfprxN/QdAZnrSHHhLltBZXduMe3vynMUFYHITEv9BM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iJfSq1Rxsv1X7z/bQqnpOUaqccbYFpNUAJ+4Blu23/7S+UxLr0lxuk7ceWBJTDDks
	 WTbZcK6TXhS1YHcubeEotGarwGzTbfUFKl9uYTFUg3Uim7BeHGBLwpeEIXLbYywbdb
	 T561lA6iVNlcVGdTtNx4CX54QXtkCa4Tun2XlI3BsrqzOtJt8ujjgC1dhe9Ogut0sa
	 FvETJ6txRR+vIsITIRjGUlvl6wpJE1oKzzZaSVYFSebjRXZqhavD3HmAnmJlXMlHxp
	 PL5iP+kCpswm12M0yfeCvx5KJw290pArskU0ZKJ9AUWXr4kiO5Ei8+ssClfzr0rIVF
	 C3CRoMt5y0kQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 775B1380A95A;
	Thu, 26 Nov 2026 10:40:08 +0000 (UTC)
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
Subject: Re: [PATCH net v3 0/3] tg3: Bug fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179568960727.1739056.17753987360556950866.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 10:40:07 +0000
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
In-Reply-To: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 16:24:05 +0530 you wrote:
> This patchset has 4 fixes.  The first patch restores probe on 57766 when
> the 31-bit coherent DMA mask cannot be set.  The second patch makes NCSI
> PLL lock on the TLP clock to fix WOL at 1G speed on 5720.  The third
> patch fixes ethtool -i display on 5719/5720 when NCSI component is
> missing.  The fourth one fixes a possible heap overflow in the NVRAM
> write path.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] tg3: Don't fail probe if 31-bit coherent DMA mask is unsupported
    https://git.kernel.org/netdev/net/c/686b8dbcedf8
  - [net,v3,2/3] tg3: Skip management FW version when APE firmware is not ready
    https://git.kernel.org/netdev/net/c/70e57e1255e0
  - [net,v3,3/3] tg3: Fix heap overflow in unbuffered NVRAM write path
    https://git.kernel.org/netdev/net/c/0323a4270524

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088406;
	b=uUj9WraM48L3QEk74Gu9xIh1bvXe7aoLt0iYWKKbdj8r7XcgKB1vYG//Gf/bZurIwQRy
	 g99ZkBr/5TPKX5CGJkWj+hiYccUFs/wfh3BscqaucTgNfCHN5GFraQDlWLTdPbyyOars/
	 oc0JByTAE0ETNm900ioJdKl+5Qb+PObXjjstZVIPgkZaApsGBdk7OBXbstHHtTvH51FOH
	 ogX5Fk84Q3/4mST7P+WuyqW10og9xjebtgUbtUcfe3lUknjPaa2zwX4pD6eG5Pt5XeAC3
	 vc4+PWOM076SOKuYMoFgz3ghElbxXVYkgrW6AvxVH+feieUTIBBRQfzuQNJOx1SnyVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=e1OqyWJkdqJlILrOCfF4VIv+SoCP4n191/FHdTdmxoc=;
	b=hsvlUgWCBVV50cKJb8QRqV6XyfmvQ75EME0+LtI6sYIKsTpaxMkihtIjUTUHyZLEXDDe
	 GnVzNf85nKvGBi6VxDU8TDRRH620KKiERI6h2gC30KXN8H684mXm/u83koSsBM43aQLo3
	 vOhwQAb1iLZzjL61czWjrqDVhRZoathkGwBey1E+YzhmSheQHQJDytBWTcVmMi5xxsENd
	 3lQrlPccOhShx8Tpui6Vihd+93Sv6Q0MY5X9C5DXqsffEdBlCyyWtIqN3fNLn7nQS6lAX
	 NAQ2K7DS/BtgbcExhnGU92iu88siqoZgIuN0JLehnWu3awnus65sr4BYNd6x+q452aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c61jP1Og;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF8E606A320;
	Thu, 19 Nov 2026 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c61jP1Og
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F311F000C6;
	Thu, 19 Nov 2026 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795088406;
	bh=e1OqyWJkdqJlILrOCfF4VIv+SoCP4n191/FHdTdmxoc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=c61jP1Og09VZiRQJvRXCIKsQ/w7VOUly2g/FoNm/sjQJL3VB1T02NuDuQtFOlD2kF
	 VxfvYyeGvx9guU8benV4AF3EAsJ9tMrRomBJFEB+DP1+4zu5RAL6NnpYpjiEXnJr8b
	 UBSyOTsNZ0S/MM2mUm6mqEwgJUS9Ir4kFgmHtb0xsao2v9W/baB5LtRXlabsKp8aoq
	 o19Qng1VTnBNrKbvl2HvDhm63/LTgp0LFAB88rO1Sv1WRgpePt6ZTQqUu43JkX4Pf2
	 SSXXfRjg28gXkv/THmIcEKIa+6HUN04kclLBSgkiagYTCT73nd4iamYovNy1Idfk3l
	 m49wEwjC2gccA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3603808210;
	Thu, 19 Nov 2026 11:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next] tun: don't steer a flow to a queue index that no
 longer exists
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179508840503.3038224.16974538898248760446.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 11:40:05 +0000
References: <20261114153617.102288-1-umangpokhriyall@gmail.com>
In-Reply-To: <20261114153617.102288-1-umangpokhriyall@gmail.com>
To: Umang Pokhriyal <umangpokhriyall@gmail.com>
Cc: netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 jasowangio@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat, 14 Nov 2026 21:06:17 +0530 you wrote:
> A multi-queue tun device keeps a flow table that maps each flow to the
> index of the queue it last used, so that packets sent back to the flow
> go to the same queue. When a queue is removed, the last queue moves
> into its index. An entry that still holds the last queue's old index
> then holds an index that no longer exists. Packets of that flow are
> sent to queue 0 with a "selects TX queue" warning, until the flow sends
> again or its entry expires after a few seconds.
> 
> [...]

Here is the summary with links:
  - [net-next] tun: don't steer a flow to a queue index that no longer exists
    https://git.kernel.org/netdev/net-next/c/9068e05d35f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226429;
	b=5hmEjEbUzRrza+TH1lJ5BAaB0vl7t4zQQQ7e8umn8BfX80EQP//9wjVZnfokTVv3VxcZ
	 k7/QRv6sQzjFC/z9zsi7T379ax5heW+XgAFr+DSKEesabYwtSOq4caZlp+Y2kDtM6aB4s
	 sIa6KWWuJsUTEixUM1rCJxdColaflAuglaBLJm+eoqj6e/jpnxvzbUQEdglwD7lwH7Dwr
	 98b1aQqLII7JWRZmmWztohgJqVeNw5it5Bfx551PDmEQVOVfCLErYXa82R7tVgI8d/4b/
	 oqtMChM0Gz8xdRainMQcs7aDFi1prQap8cCmaIqlTAApVFA7R/zp24FfyhDUU2XvYBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226429;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=aPePkVdlv4Ua5CfKAyX0XpdHtZd7fuJYPmRxDSlARlk=;
	b=h/ysBTyAsAQsLJtfmmueQi5o7hv/dsvUHD1c5MYMv+Ay7UBXUY2BhieRWqhJeYLLTuKb
	 IqYkT19SHBlEe1mGnAI2Z6pmUIMe8Q96RzUWbfdqC0EGlbC+0CcpufJonob6mO0DOHwPd
	 3wYUwI3pyOAkUm7HCNc3kX6zWhip87pXuRbvV6DRAZ9PV25TnefWRvg7Qx8f0dJidI4tN
	 ukUndFAxYUpzcllItvi2lKu29UQpsCTQdawAGHBl6XnXIChS1QSmGooAj4QRTHugbd9MA
	 0vtlrwCmjTmS6MVL+zcLL+eh4Cq53kuM8a1mF72kkKZqQRZBwYof1HKvpo+lLm6v9vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7uzfMBP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F27606A339
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 02:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H7uzfMBP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAC41F000CA;
	Sat, 21 Nov 2026 02:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795226428;
	bh=aPePkVdlv4Ua5CfKAyX0XpdHtZd7fuJYPmRxDSlARlk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=H7uzfMBPCrJ7qvvWvG8qYCENMg/9pKvNYB0YTUAlxnlsl3NlXTvBXGlsR6CeCQ7/v
	 Ya01uLqoih53FUI853qB27iCEtJ7H60yP6HBJhfeIBmm/BF9UC/JuNE1yD4+MuN/tf
	 ZaU8FR/rK1mz3umQ4ekVcwEOLGRvqcb8F8I6RZidl9yaas+We7avwrQ4dgM5XfPskg
	 xPlzQatusg35NEVK5Se/dMiziD1zAv0FbxiuWz/jVzcv0hbFefGnrwYEAdMgNGFvRL
	 dT1h5lASd0kKTihG492xoNtJcbkl1cUdF2q+lPddfL0Jn4Ky+750gKI7d5eMIapzh7
	 fnt8Jrl5d/+FA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43EA380AA5E;
	Sat, 21 Nov 2026 02:00:28 +0000 (UTC)
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
Subject: Re: [PATCH net-next] 6lowpan: nhc: use RCU instead of lowpan_nhc_lock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522642727.886068.16842769887373188114.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 02:00:27 +0000
References: <20261118221820.1601273-1-edumazet@kernel.org>
In-Reply-To: <20261118221820.1601273-1-edumazet@kernel.org>
To: Eric Dumazet <edumazet@kernel.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 willemb@google.com, horms@kernel.org, netdev@vger.kernel.org,
 alex.aring@gmail.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 23:18:20 +0100 you wrote:
> lowpan_nexthdr_nhcs[] is protected by lowpan_nhc_lock, a spinlock
> that is acquired with BH disabled for every compressed or uncompressed
> packet, even though the table only changes when an NHC module is
> loaded or unloaded.
> 
> lowpan_nhc_del() already calls synchronize_net() after clearing
> its slot, so readers only need to be in an RCU read-side critical
> section to safely use a struct lowpan_nhc.
> 
> [...]

Here is the summary with links:
  - [net-next] 6lowpan: nhc: use RCU instead of lowpan_nhc_lock
    https://git.kernel.org/netdev/net-next/c/111e1b0b985e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



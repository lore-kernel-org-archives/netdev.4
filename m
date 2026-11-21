Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305009;
	b=VTw73ya3c0DMB2c6WlHDkfnQpQbGMNBswiKCn1PiCcjXxoDbcwwr2DkX8tZ79ORI0NbZ
	 u9+q5mCXRJDMia9xq/CzE5RFQ06cDV2E5z9Xd0q9LfWG1kL3SfZC5YvHlZage1u46TykF
	 k8tyXvlzmSb95JqDqovvebJkQZWLob7U7aGm0S+4/6J3iiwmy7JkbTDGHyrosAjsPeUkw
	 +rGrDekg6eJwIXSWMiQxgU5GI+9AdXmoFdOM32IFZ4TiOWRlgFke/foiJcVp0eOSZOZZh
	 wR4e18T9RPRRvRE2DRc3UIk9FdRlzH9dniLlQFGk3FaezejwmEluCeuVPMC4uISoCkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305009;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=BoWjDlU4fOqWS1qCJrCy23RseH/raBFcQljY17gEYZc=;
	b=eGNNbZN6uxFhZRloVA1RqXt7/EUlcIt8sUPU3Ln4JVS3+xhpPEIvEWjvnQisoYqWEXYG
	 bQFxh7m7ec6b4CFlQu0CovBH6m7HcNJxUi5MP9uXpxX4RE5Hnmiu80p/Ypw+jZp+mHdLI
	 68rq9ipLn22LfpRxmudqXntE6oOxW5a8c2G8axNDTcIvjzKZhwvh/wplyA0jlkzb3igOU
	 y39Yx7i6xi9JftnJwaXRb/m3e5AKsedLC1QY/SF/nzuqX0gS25K/k+zLjajKtITizwhrE
	 ipuMR0/ddAdy/bdu0kAsVhCHgbaL2BINHwDAXbhJJifnY5Q7vh7G43TASOF6igszfNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OH7Nils8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68482606A33A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OH7Nils8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435871F000C4;
	Sat, 21 Nov 2026 23:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305009;
	bh=BoWjDlU4fOqWS1qCJrCy23RseH/raBFcQljY17gEYZc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OH7Nils8eDjnsUSQ9Ozzo8j31uE1TbgebK8aINAJVIEuOvrq9rqR7S5540Uvw4YDC
	 NhbcUnU902kT4v/dUvXt0raaBEhuZFDZycJ006xUgmM7fIopAs0Xwl6Ny9bLnZMvve
	 GKPIDWrAgpEmZUPCvYbhx1TjYrnkz+5yP81/dmzFdH+8L019tGD2joXgyTBYZEOp6X
	 viB2mVPFKSZSV3vTZ9my9D7GiYoMQ47TxsOk02jwipwfVLEpE7h5QGzSZaIy708fzV
	 umd/8ab0dcBbEGvuJnIoLhFWNKE+F50TjQbvxLKxDaThQX+7RHRikgqapxrAEQ6HN/
	 ApmHp8ELCph9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A45E391B08F;
	Sat, 21 Nov 2026 23:50:09 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the
 ematch dump
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179530500778.1221130.7273439049785357350.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 23:50:07 +0000
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
In-Reply-To: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
To: Victor Nogueira <victor@mojatatu.com>
Cc: netdev@vger.kernel.org, jiri@resnulli.us, jhs@mojatatu.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sashiko-bot@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 16:10:03 -0300 you wrote:
> This is a followup of commit 9c572a83037a ("net/sched: fix potential
> stack infoleak in em_text_dump()") as reported by Sashiko.
> 
> The issue: em_text_dump() appends the text pattern with nla_append(),
> which is a bare skb_put_data() and does not pad the attribute to a 4-byte
> boundary.  When pattern_len is not a multiple of four the skb tail is left
> unaligned.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net/sched: em_text: pad the text pattern in the ematch dump
    https://git.kernel.org/netdev/net-next/c/eb6d6c80d354

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



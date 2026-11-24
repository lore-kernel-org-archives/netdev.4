Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529410;
	b=YezZ46bhPwZm8tNUs863qk/jrASbyHhjetGJ3j0jYsozCHAQl8qgv0DbB7UoDqSowe3t
	 ZMXcbsQKRidDovtgu8PCQoHBrpp0EnG9a7xN+/Bur3vbf42GYCtUrr7EbMHfBf7q+dOHh
	 fnBC1+UqmaRyCZc/U6bw0kTmI1bP3ADkKERrlmMIdq6ssnMBfAHz5rgT3o7PdnFgubl+N
	 bQ4m89XI/k8sPelAAf6WumZJ011+36Scpqh15lBgYSkPkIHd6cJB2WeWsotOAKSeD9vHr
	 rTW9cKffNwnNLeteqrjLYF8NGIgyMe4iWFozsbNgiKb7LMP3S9igVXXFqvtYTnRSLkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529410;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2F33fJJ196T7IHOr3O9jDTp+8XN2H9SHjKysdDpLZ9I=;
	b=fHnQDdaDHpeFyAER5cE66f/z2Wu5ZCkeC4l2NacZDAS4oIXLiJEoFTl1QKkKtcUZ+Kup
	 gr7RCgphPKRsx4/W2O2iGRAaiWsizi/XwDyXSMeQtxlzSLQVSuTcatvwlU5iljTOQJiGZ
	 HqzmmZF8blVMAI77GTl1NGCD1+eC9X6GTe1OYY9naCAl2w9Qtjjpm995f5M24/2wrDceq
	 RH9CtVO8RYGi5ftBKQAIXjNfIX+xtRYMAFE8OlJLt8qhmRYOzZD0wjRDcOYThO/pRp0F2
	 4TC7rLkypIJc/PmYyZBTt9VGEwV8mkwY8BjBq1DortmCW+oDrYkK52yFv/vBnMaFHRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oog8CgNz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B61606A6A5;
	Tue, 24 Nov 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oog8CgNz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813401F000D2;
	Tue, 24 Nov 2026 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795529409;
	bh=2F33fJJ196T7IHOr3O9jDTp+8XN2H9SHjKysdDpLZ9I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Oog8CgNzq/1+vsCvFV4st+G+/YHyWCpLCF18I0P9McohANPE4BKH0HSf0ki9PvRSo
	 +7cvM+rP1MZGiD9G1u9WWhO2gdzERqKqbSWEa1fDl7DbDlbIS7WFpjuJ+fszn/Kbnv
	 i7RwG5xC/7oM9B9/bhRF12UqwD5Fy0XPHfGS56PtvNoHEOmvjqv1zc45v/eW4h5XRq
	 cCSYgTu/1meO+BsQ1J5jyrw7qaJ40RJsU+yZ1PqR6jUfFWBCg//mt2ZRum4Ssz4ly4
	 dlMI7nZTL2BV6Qftqyp198e9OrmPWcC8nB50ax6cRmMPeubFVJhmJLjE83KcekyREL
	 HqqUzlZKR0U/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774833931120;
	Tue, 24 Nov 2026 14:10:09 +0000 (UTC)
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
Subject: Re: [PATCH net] net/sched: sch_cake: fix unintended tin override with
 cake_mq
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179552940802.3557137.6295650996391216301.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 14:10:08 +0000
References: 
 <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
In-Reply-To: 
 <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
To: =?utf-8?q?Jonas_K=C3=B6ppeler_=3Cj=2Ekoeppeler=40tu-berlin=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: toke@toke.dk, jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, toke@redhat.com, cake@lists.bufferbloat.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 19 Nov 2026 10:43:57 +0100 you wrote:
> CAKE allows overriding the tin selection through skb->priority: if the
> major number of skb->priority matches the qdisc handle, the minor number
> selects the tin. With cake_mq, the per-queue CAKE instances are created
> through qdisc_create_dflt() and never get a handle assigned, so
> sch->handle is 0 for all of them.
> 
> For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
> byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
> enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
> all with a major number of 0, which matches the handle of the cake_mq
> children. The minor number is then taken as a tin override and the DSCP
> mapping is skipped.
> 
> [...]

Here is the summary with links:
  - [net] net/sched: sch_cake: fix unintended tin override with cake_mq
    https://git.kernel.org/netdev/net-next/c/7b75467462af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132207;
	b=Vw2cCn+dC5UiS1NeLvDSGOur8E8DqBjPluIhGm1+z4h6tse0ptDuFugPPqKzAVKBEDxz
	 N8Yzgmf/WwA1I61+c0fnqO7jB33Pq8woARCH5HT7AmY/oXlfvZG2lP9mIBof9E+zRyYin
	 ZcwtHCQP0Q4P64xUqo8391OGsaCvAOQWI6A996pNnt2SngGeG8nCwaI36VS07wBKGIkht
	 akZXqDxncIk+cXgwXdLAeqgDpv0CdJ8Rna2vPQwnoimV3YxuUx+FmXv7gquV+xmU9uW6A
	 2j7unOrnQqmg3gdZioRAc2gihgGoGeYG5yh8CHYwY1JazG2LHWtL8/50SkhyaLkqzRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=o1SU+t4mqyZqVJ8A+o+dnd+7ntN600YxWGC6YBUr0OA=;
	b=3BilpQWrddu9/jQUpV2m6jIE5sw529kNgTM5AnydoXtZZf0HanNu8FeQFFT+uPa657S1
	 Zx31iVhGuy+Zxj4eNQti0LvFTq9urruieBqZlNa7q71319gXnp230a4UMtDudcwaoMO9l
	 fYMhR7EXAS06n28cpfxXS2KsnES4aM9+fAJTcNrVKsx3j2MjQSEovp0QFPZmQmqTqGVTC
	 RebGzJ8EpFZx2wuZqkBQK12b0PfuI2z94fI4hpEOZUSZ++3N8LKGiCiswmmj5OnNXkt10
	 tSmESJe0q6J2IXa90KlrbZbGWJXvMEZoIBRcAl3/alYFJTlbhRu6lb9U5Nz/2gCUEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhkuhDOm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A47606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhkuhDOm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060CB1F000CA;
	Thu, 19 Nov 2026 23:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132207;
	bh=o1SU+t4mqyZqVJ8A+o+dnd+7ntN600YxWGC6YBUr0OA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nhkuhDOmO2HWETeEyyoR8SBZjVZnNi7UcBkM1SNWnSW1WoRKNif+OEEtTtQDuCUov
	 tv+AQJCH6OCZozuQ75dSuKzoWxpJMsM29QNKiz6C/6ttFFFOnPpYMeAugi+4XaMm3b
	 QNf1BcbM7R/oy2+X2QuZ7rEqeDGu9tGUwOU/81EuKN8fTDeCphuOZ06sg9FaumiQfm
	 qlbPMA6y/CYtjnJe3E4j1h10XSWarl99VynQmWfO8JJzmWffQV9ezUBKYotYmNNCf3
	 scKWs7qqokqNjbW8g7ri1VHE35ZebOQHMGBeClHpR0X8IN+dXCeYfEUAziiXBGKrI7
	 s9pq6H35ruKkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15763808209;
	Thu, 19 Nov 2026 23:50:06 +0000 (UTC)
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
Subject: Re: [net PATCH 0/6] fbnic: Follow-up fixes for the Tx idle check,
 HW stats and FW mailbox allocations    
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513220578.3927581.16979332960210990151.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 23:50:05 +0000
References: 
 <179460241885.8819.7179935130629202331.stgit@ahduyck-xeon-server.home.arpa>
In-Reply-To: 
 <179460241885.8819.7179935130629202331.stgit@ahduyck-xeon-server.home.arpa>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org,
 pabeni@redhat.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 12:41:19 -0800 you wrote:
> Follow-up fixes for fbnic on top of the series that was just applied
> to net, plus two fixes for FW mailbox allocations under memory pressure.
> 
> Patch 1 makes the Tx idle check wait for in-flight PTP timestamps. The
> QM idle registers do not cover the TMI completion path, so they can
> report idle while a timestamp completion is still outstanding.
> 
> [...]

Here is the summary with links:
  - [net,1/6] fbnic: Wait for in-flight PTP timestamps before treating Tx as idle
    https://git.kernel.org/netdev/net/c/6ada0c276966
  - [net,2/6] fbnic: Do not accumulate HW stats from failed register reads
    (no matching commit)
  - [net,3/6] fbnic: Cover all of the HW stats with the stats lock
    https://git.kernel.org/netdev/net/c/52a64e64230e
  - [net,4/6] fbnic: Initialize and reset the HW stats before they can be read
    https://git.kernel.org/netdev/net/c/4b5153b38962
  - [net,5/6] fbnic: Stamp heartbeat and ownership requests after allocating them
    (no matching commit)
  - [net,6/6] fbnic: Allocate FW completions with kvzalloc
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



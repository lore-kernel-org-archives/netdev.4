Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047015;
	b=GUatl1Rn3/+IKc26qlAXJh+HGI0h12eoog4VPbxETESp+AnFBkMcYBh49LrjUvAFQXe9
	 tKyn6YSsov23TN51i+SE+OsWtd7E37kBXYEoZzqW7CYY7vzVhIXMa52oWhOhlYHfRgvSK
	 QWO593+uweDLJgeD00z9Uj9o5gQDPZr9LYBBbukHzoExa+ftRgwmiakRMuL5D0a4FW47S
	 kRYPgmgXFYzQUZzzzspCve5ITceoHfod/8Mw2SrVIy4wrwEBNDqD8lvGEkz51r6YIq2NO
	 uJVdo0opcshraWSb0+DHGniV8Pfmpew+eJPr5Meb/NXpatNmeLRRZgBqOUhrgE9edjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047015;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vShwwcdKXfV6b//zN/c3BAsGnYIMcDyPCkI3GwOqics=;
	b=4bYQYLkhaLF6RORiNEieox1IHKlkhJI44u36E6usSwBtg5wy6MyWkuFcG78abQdyudYK
	 mWXnTL9IKA3o2yjH2yfgnQec/zu6NuUEdx8BTiU1PV234kcl/btWnT/HzN/JVnfD3WRWj
	 2Hcn8g2BxP8DUQetaSNZRzICLg7oF4bH9EBQtEQsOxsH1vjfnfpF+Cg2NDz1YUCHqh3pX
	 J7uRmvEsZe94vADae4j/7QME8DoWmldM5ZEGUwHKA8NZDm+Xc8sInt22UeqYunvE6Vz5L
	 FssQ9Btej1jqJYwPMjbohO7UunEUIy4hqpQOfSbffzd4/YdiEZJzkkqmXHDAn/EcNtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MVJ91Cg8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0510D60A2600;
	Thu, 19 Nov 2026 00:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MVJ91Cg8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809861F000C5;
	Thu, 19 Nov 2026 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047014;
	bh=vShwwcdKXfV6b//zN/c3BAsGnYIMcDyPCkI3GwOqics=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MVJ91Cg8vwJCYPe6ExvGwk7UMHqWXxjS55qSRdwMojaIHdqGNzFThvQarr01Kx8RI
	 9eP56yQTWwz06Lq4rLZl/zO64Fim2oghUAoKOwXiAEu55ZBXmLB0rsTi0pvQOb72c2
	 TojhseEaPP8G+3vlNAep9+N7PSdgSoygBu9C5GSEA+Wqwi7sRRCPm5FtxznLfdb9Ns
	 ua5gaBsiMCzHoj46q79fbeHONwA9y4VIaAwKfzF1w3V9I/H6fuMULU5bUzjyx0jC7v
	 23gmp8eDHX9yH7fxwypdD6Y8ivp1B/RxfpbLzw5G9TNn4sOx5ZTGATwpRcUdEJsPc7
	 /8img8BMzW67A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7740E3808210;
	Thu, 19 Nov 2026 00:10:14 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: wwan: mhi_wwan_ctrl: say the DTR drop
 flush
 is best effort
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504701302.2637749.17906773480423689958.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:10:13 +0000
References: <20261112172216.31216-1-peter.hunt@opengear.com>
In-Reply-To: <20261112172216.31216-1-peter.hunt@opengear.com>
To: Peter Hunt <peter.hunt@opengear.com>
Cc: netdev@vger.kernel.org, loic.poulain@oss.qualcomm.com,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, dnlplm@gmail.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 10:22:16 -0700 you wrote:
> Four comments around the DTR/RTS work don't match the code since
> commit 10f51f4fb99d ("net: wwan: mhi_wwan_ctrl: send a DTR drop before
> it can be coalesced"):
> 
> - the ->dtr_rts() comment says the drop is sent now, but a drop that
>   hits a full UL ring or a failed allocation is retried with whatever
>   state is latest by then,
> - the stop() comment says pending state is sent before the channel
>   stops, but the flush there makes one attempt as well, and a retry
>   goes out from dtr_work after the channel has stopped,
> - the dtr_mdmbits comment only describes coalescing,
> - the remove() comment says the removal drop gets one attempt, but the
>   drop and stop() paths now flush the work as well.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: wwan: mhi_wwan_ctrl: say the DTR drop flush is best effort
    https://git.kernel.org/netdev/net-next/c/84a828d40fae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



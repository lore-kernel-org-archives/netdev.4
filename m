Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574407;
	b=slTvx72svJ08Q0YUOBvmuIpHmb37oksZsKHQVqK5vWVkToxlgx9qI3ThuhtWV+fVW2RZ
	 1VO6eDvgUEGNSLSANNuGnOdQCXFsG/0Q9YPUr801GJ26C7s9ihmtx6tBfCs2sv/NhuO5Y
	 XQvonS4QVfOuwRlNsK8NAFae8vGXHCDLgxIXdHL7GCkGHN2gFOFYeKrY44qB43SBBNRid
	 5OLe27hT4kIZy8jSoBVRO4TVdML4NWaZIHJoRwo00bV1O6cyB4mdiP0QuX1zyHIWoooNP
	 SV7svlRmnyFhaSgFhlbqXWtF+N0FsBsWxalSKdVRTRYUyCnrgmgN8K9nSYxzrTPYvAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574407;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=2psxhemLwWePLKMkwXTMskyCXNpmQmIq5wJPjFBPrXU=;
	b=drS6D8BSYcij+C5nzUvxhbDLtNvNvKuQR/AEFtXe8sbaxrkHFy13A30WGuCK3lvmPxvK
	 xOkR7rLc4mQgWR1SJz9uDyHltG16c/hbCRRTjVnp1YI0rKOKrFqopTFVqaJMdT6GImhMU
	 MEhK6hxdBcSgWHN7D1pejKmJH3z0uvciRCiMBFJNQhnBEC2fdrZk+NhJExEScOoflUX0e
	 0FFiHjF6ME2KG9HT/GAyoSXnB5EhWu8OsMagCxJLnkDOaH+KT8cKk6usBbBtSARbbs67W
	 6pdwI42ToaV53nPRF3biL34s/R9ldHfirQxWSF1Rm73qA0dwZKZRCNG7tVhXKgUJrQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=liAyDYO8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98399606A31E;
	Wed, 25 Nov 2026 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=liAyDYO8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091C71F000C6;
	Wed, 25 Nov 2026 02:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795574407;
	bh=2psxhemLwWePLKMkwXTMskyCXNpmQmIq5wJPjFBPrXU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=liAyDYO8srVd5ct5gTi2CBiSgtmgSFCEdBgoV7K9+Mkm0qMvDPp2yQQr6eSg1ODXj
	 3qwDJ3wrs1beyRODV7IhScVv0GOBwm6leE2ZsRN1jx4F5lKT9CQYoPOc5mXtGJ8Vu0
	 dvzlvDr254TuiS2RODv4dp+RH04qjoG+TPPdwNYcdhu/T65PmulK0g8tj0hBS4eqZt
	 t8cRCwjXsqrh+78ywWGEOMFwz9yFiDip2Vlsw5VQS5C23i3md1jHl+eAaLLVxu+jft
	 gxD+jKIvJmD/EUHABLzqJc1uxFbSqmd1QXUzRw614QafyDlsX2QA0h5dyC0eowdAZ6
	 n2owtdtWi1G0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15A13808209;
	Wed, 25 Nov 2026 02:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/5] net: bcmgenet, systemport: DIM and Rx discard
 fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179557440577.178200.16007627750203770675.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 02:40:05 +0000
References: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
In-Reply-To: <20261120-nb-genet-dim-stats-net-v2-0-1a7cece7dd1a@tipi-net.de>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 justin.chen@broadcom.com, pgynther@google.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Fri, 20 Nov 2026 23:42:34 +0100 you wrote:
> Sashiko has flagged a few genet bugs over time. I'll work through them
> as time permits, fixing the ones that seem worth it.
> 
> DIM on genet and systemport wants running totals but gets per-poll
> counts, so it picks bogus profiles from the wrong numbers.
> 
> The series also fixes DIM getting stuck after a down/up or suspend and
> resets the Rx discard count with the ring.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/5] net: bcmgenet: keep DIM from getting stuck after close or suspend
    https://git.kernel.org/netdev/net/c/aa5a537ec43c
  - [net,v2,2/5] net: bcmgenet: accumulate the DIM packet and byte counters
    https://git.kernel.org/netdev/net/c/a15079369636
  - [net,v2,3/5] net: bcmgenet: reset the Rx discard count with the ring
    https://git.kernel.org/netdev/net/c/e99faa3a1620
  - [net,v2,4/5] net: systemport: restart DIM from the default profile on start
    https://git.kernel.org/netdev/net/c/8e428e263fa4
  - [net,v2,5/5] net: systemport: accumulate the DIM packet and byte counters
    https://git.kernel.org/netdev/net/c/3e7e20beef4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



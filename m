Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795054206;
	b=yxzkwfCIdly1vzMx78y7kd2y5XwcjS6nhlB4Rpfs1AOOIk7OCovAgwRCtMuy9juTlzeG
	 mXuDIAfWVsCRpISYgU01t8ish6bTHGF+G7TQmkfB4SjqMFvFKpQDg21GBV95RlhSZWFk/
	 y6D/AyMHPrbWJ0g1G8cwLZEeJ7IxDx80ksPxirJRI0DuxUCvUIDLJFNB9n5muKcvqt86F
	 ilDyfZ5gnYtDwL3l9oGeHH/tIAmwGOj8QqQG9Ix+oSDbAlxDB90BC8zbPhTb1wJNcDBva
	 g+TvGS/494rDXW1zemEbKS+ZADPQ+KLurL+k1ye3oZvqsUn+mrTyiaheNBo/iW9VW+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795054206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=UEjhzhCjQdaRhLGAQv+AyZZcdtMTWVkXBmp9NELmJzs=;
	b=5fM9Goo5GX2+mKV6iZHZipNCAlyT89ZosPvrW+qDXN9M5Ap9TiCLWMIzHveLMsvUXzgd
	 Vx5J/wYlywm+cO49XKqDblyEf2GIJ/Qry4CdttaAa9TylB08Tm2YkwnKFP9hnYHCuDaqR
	 9Ye9S0n0CUoRo3obnVQNL6u1UGL12aPz9bwQPWzXLaV+VN9C8OvOCsaVmQuqmSqg6txDq
	 z968J5aqTcW55iOLuMtCO9q+f7MAwM5gF1Cm200yefuplm9tY90bekEUi50c60TqCYXDN
	 Gc0QC2MIcUotqdCvFC6/fKtCiymRtFj8UO91vQGKf8HVwOm7jwZPTkLsD/4WfNTdSsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BENrbtHc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8244D606A32A;
	Thu, 19 Nov 2026 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BENrbtHc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4233B1F000C4;
	Thu, 19 Nov 2026 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795054206;
	bh=UEjhzhCjQdaRhLGAQv+AyZZcdtMTWVkXBmp9NELmJzs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BENrbtHcfeLmLZAUEZEdbOi+stF1n3MNYQxdS+9PUk9ONECL/kDh6aCGWEy4bltuh
	 oOU7pyneLH9u4WQ1VF8VeSCisY8oygcgAjMQTbGB/MsZZw+vVtcjdno7Mv/8Qa3sTa
	 o5ADQGUNSq1/6YUhHJNnrsn25DmOB02H18UBoPss+FcYSdprIEBsc3pozoAq+L8VnW
	 LhGwH9oW1Jc5rsjTzB9q+MWyX0nee2p3GhdI4pU2qCLm2psqK4yMKvIP9Xhg10hf4O
	 6XZ3ogVrsKiXQ0XIosDVD5z+wq9hHruM33owfcLepSYuuQ1JDllOvqa27HnrWkSOU1
	 IdParg3ZaNwBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3393808210;
	Thu, 19 Nov 2026 02:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net v2] net: hsr: clean up synced addresses and allmulti
 in
 hsr_del_port()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179505420503.2716323.9284279349036950699.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 02:10:05 +0000
References: <20261112064716.85381-1-sunwenbo@cmss.chinamobile.com>
In-Reply-To: <20261112064716.85381-1-sunwenbo@cmss.chinamobile.com>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, hangbin.liu@linux.dev, fmancera@suse.de,
 danishanwar@ti.com, m-karicheri2@ti.com, wojciech.drewek@intel.com,
 r-gunasekaran@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 1342116488@qq.com, liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 14:47:16 +0800 you wrote:
> hsr_set_rx_mode() syncs unicast and multicast addresses to slave A and
> slave B devices via dev_uc_sync_multiple() and dev_mc_sync_multiple(),
> and hsr_change_rx_flags() propagates IFF_ALLMULTI via
> dev_set_allmulti().
> 
> When an UP HSR device is deleted via hsr_dellink(), hsr_del_ports()
> removes all ports from hsr->ports before unregister_netdevice_queue()
> leads to hsr_dev_close(). Consequently, hsr_dev_close() iterates over an
> already-empty port list and cannot execute dev_uc_unsync() or
> dev_mc_unsync() on the detached slaves. Likewise, when a slave device is
> unregistered while the HSR master is UP, hsr_netdev_notify() calls
> hsr_del_port() directly without running hsr_dev_close(). In addition,
> hsr_dev_close() does not release IFF_ALLMULTI on slave devices either.
> As a result, detached slave devices can retain synced unicast/multicast
> addresses and an elevated allmulti reference count.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: hsr: clean up synced addresses and allmulti in hsr_del_port()
    https://git.kernel.org/netdev/net-next/c/a02d05f6aff8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053608;
	b=2CAjop/UmZvVFk1FJVRFKBsCDk9EeSiO9ZmEzPRIggzmVqJj54cub/r1u4Sgr0F27phu
	 MSuXsDLt/SrFp1ZeQXgOnyxF9HMVyD2XD4Yhk0hy+tdhRtFCvZVHp91J9G9IYaIe6GtN+
	 iD8MKucRPQ3tkU7MJiBqhvzXr0WRsLl+Y53yedQ/xIvqK1HDUT6PHWdpnXJyj3xwhi9+S
	 r8Wlkgn2MxSWgZEcpAns8s+IIZ8xo8vXDvRJBZUBF+8+UtrNoph9nTVrjDa0OKT70rK/5
	 4W0mKylbdsBWgUjlbEE4qwqOMAmBIT0KMN6KKFwjXqKOSgtnN6cu0VZuzzbEeUpVE0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053608;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=1C408Plf+PpCCQJIv8vfJX7AKu969dw4X06nTdduXKE=;
	b=Vb22qTc7cl8kKYyMyxDNS+0OrDK5vPDh/ttJw8Vkbc7byyrRDNXEiveRbAIiFIMYwT/9
	 ZiCVGKXL7wpOOXrWzISGaQ8R0lb/wcicO1mC52csD+DQAVnnoAV+prRstpuCbmpeaTPeg
	 puLlkIA8F2O6IomRRDBrSxVJn0Y3uzvuqcmPdz4msxGOYAMNHe7xs/Uv99i8b3JxCmeDN
	 atD/pLBv8gDJrUisRZ+2dTEHHFYdvJ7ko9SCKDTB0UfYp9uJ5yK4j/HzaWzJOHRuBT0qJ
	 Y6IzzhGkSsTSlDgbZiz2CTG++62Eh+IzeFdZpvcBquTqfROY7kXnjAWHj3LVZybxZuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0UpdRHC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A19606A31C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0UpdRHC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EEA1F000C4;
	Thu, 19 Nov 2026 02:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795053608;
	bh=1C408Plf+PpCCQJIv8vfJX7AKu969dw4X06nTdduXKE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=c0UpdRHCSt//BxJy1NphJwQKB4akcPOVY2PMueFzGfZ867uqI+Nz9WgpsKa+PgR6a
	 H2pNX7Gmt3mj7rTDE/xV1vvAp9OhzseUCZHCuiH8vqxCPsYBNrmgAvR7ztU/b+wDce
	 HlUZcCX6u7lEitEltd4k733SD1dvYiF0yI1ywqC5MU23hdugBwc4aQsYZ7oWOIABIY
	 sno9scSYQp3cPUViqSF/UTXsdp/Mvlu9Xpx5oMO7o1UeAMVPXdfnoS68k8nmwI+sd/
	 LFNCZ4ZJQfhiE2fLyNU23weZnXezEbYd9HTFtadQbfLIro5jNN76y9HK4titiO3Zl/
	 gs30v39YYJzOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772FF3808210;
	Thu, 19 Nov 2026 02:00:08 +0000 (UTC)
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
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-12 (i40e, iavf)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179505360728.2713881.10859053822875993430.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 02:00:07 +0000
References: <20261113004602.129864-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20261113004602.129864-1-anthony.l.nguyen@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 mheib@redhat.com, fballuch@redhat.com, aleksandr.loktionov@intel.com,
 luoxuanqiang@kylinos.cn

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 16:45:54 -0800 you wrote:
> For i40e:
> Mohammad Heib adds missing set of VSI down bit prior to calling
> i40e_down() as is expected by the call.
> 
> Filip Balluch fixes incorrectly provided Tx rings in error path of
> i40e_set_ringparam().
> 
> [...]

Here is the summary with links:
  - [net,1/6] i40e: fix napi_disable hang in i40e_down() during firmware update
    (no matching commit)
  - [net,2/6] i40e: fix freeing of TX rings on RX allocation failure
    https://git.kernel.org/netdev/net/c/4957f668681a
  - [net,3/6] i40e: avoid resetting BQL state when freeing temporary Tx rings in set_ringparam
    https://git.kernel.org/netdev/net/c/e3916fa03f4d
  - [net,4/6] iavf: fix QoS capabilities memory leak
    https://git.kernel.org/netdev/net/c/65f6ffb9001b
  - [net,5/6] iavf: fix ASQ command buffer leak on init failure
    https://git.kernel.org/netdev/net/c/2a1f106379a9
  - [net,6/6] iavf: add missing PTP adjustment callbacks
    https://git.kernel.org/netdev/net/c/adbc4d0fff64

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



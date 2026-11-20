Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135212;
	b=2D4EVlZKjtdnZtHReHESCyty0FUqdvINQYHHLzmvll+K+UbTY041urpdQ5nX5zVudnte
	 547a9Bbj7Od80Dhy1ne23BgkYwIoVPy7OoJd7KMHL5VJdDHF3Tg/klYv/Y+qcnJOrMOfv
	 CN5+zN3MTFokaNPSAn1n5NZlfwqKQkcEp0fa7OcKb7esmBTHxIwNhkMzGOJp7VDolXSG+
	 9J6JLaPInY8w70h/pOPmvbvjtaOSPyPeVtUJH6oU3Dmh3F9bQeNj8Ur8Vlr705iNjjCID
	 whnbANqDcvmEP1EbCVmKRHiEsAnnL5gjwOPRWmEDMLURf7hgZBmXkEAPgqAex43wGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135212;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=MN2zkIl6wbaYpBfERF5tVGD42xlu9uvt5ycgzaOn4Fs=;
	b=050C3rvNW+Q7hvjemN9a4HAeqjrDBtliBKjoGlS+q2YXKSy4k0tTqzaLQpsqMGTEXwPL
	 p4uAzKocvArV3BaSJobJo683b//ceRJGHuqD+Pfrjrmw0fDl51l+qUTlj89XOu9XHim/J
	 TUHl9dMS/fut9ruG+9AZKIDY/XlIYyE3+Zj2AWNqgWpSgDKUqLhoWnuKHjbLOv/2XHdJ8
	 0ZSn5wpLlpaaaffN1GWq0utsI6YL1EU2Jto862I6oc286dx1SsREBc8KA2Mbj6Vxae71U
	 TdVxEaJI8nFRavG2QIb1k+AnqSH/1hAAQu2kBnzrbvz0W6HHFyAsHnwk0RD4PnPtzaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BN8RLG2u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B079606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BN8RLG2u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AB71F000CF;
	Fri, 20 Nov 2026 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135212;
	bh=MN2zkIl6wbaYpBfERF5tVGD42xlu9uvt5ycgzaOn4Fs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BN8RLG2uPgDrvEbfEfT+pSoup7v4V+b3nBNQdyZ8vuuIRc9k2McqLqhkAPCCh1P0W
	 CSfA4Sg0STc6xkPGdxW23WIQrbvtXOQPAMbmqpCm4x+v1Tb/peOko7nm6fYx1rzrcx
	 kVDEVOe4bTPda8n8xGwIHuRawe94vpvSYgiLFjydowgqEj37wJP3lXgBhgpSmIVDiT
	 yJTzzJC4PykyUJubu9yuWtT/5NvykktFZdtRFCD5F7ZfjcOkwzGT4t9lCl2qTWAmxU
	 p9scNNVySkNXx17/B+elgPfNYv7YeIp34niOEVTllTONXjIWyzao2rY+rhpLIM5gyN
	 v4pRCKrLOLZ5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3963808209;
	Fri, 20 Nov 2026 00:40:12 +0000 (UTC)
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
Subject: Re: [net-next v6 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179513521077.3950719.2196461661423804757.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 00:40:10 +0000
References: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
In-Reply-To: <20261117094913.100756-1-przemyslaw.kitszel@intel.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, aleksandr.loktionov@intel.com,
 andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, anzaki@gmail.com,
 brett.creeley@amd.com, corbet@lwn.net, davem@davemloft.net,
 edumazet@kernel.org, horms@kernel.org, jacob.e.keller@intel.com,
 jedrzej.jagielski@intel.com, jiri@resnulli.us, leon@kernel.org,
 mbloch@nvidia.com, mschmidt@redhat.com, ohartoov@nvidia.com,
 pabeni@redhat.com, poros@redhat.com, rdunlap@infradead.org,
 saeedm@nvidia.com, skhan@linuxfoundation.org, tariqt@nvidia.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Nov 2026 10:44:38 +0100 you wrote:
> Also available here
> https://github.com/pkitszel/linux/tree/xlvf-v6
> 
> The purpose of this series is to allow iavf to use more than 16 queue
> pairs, in two modes: up to 64 and up to 256 queue pairs.
> 
> In order to support more queues for VF, we must give it a bigger RSS
> table (GLOBAL LUT or PF LUT). There are 16 GLOBAL LUTs on E810, and one
> PF LUT for every PF on given card. Both kinds could be (re)assigned to
> a VF, while a PF must hold at least one of them at any given moment.
> GLOBAL LUT allows VF to use up to 64 queues, PF LUT lets it use up to
> 256 queues.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,01/15] devlink, mlx5: add init/fini ops for shared devlink
    https://git.kernel.org/netdev/net-next/c/0d76479bc852
  - [net-next,v6,02/15] ice: use shared devlink to store ice_adapters instead of custom xarray
    https://git.kernel.org/netdev/net-next/c/6381ef1b1338
  - [net-next,v6,03/15] ice: add VF queue ena/dis helper functions
    (no matching commit)
  - [net-next,v6,04/15] ice: add helpers for Global RSS LUT alloc, free, vsi_update
    (no matching commit)
  - [net-next,v6,05/15] ice: rename ICE_MAX_RSS_QS_PER_VF to ICE_MAX_QS_PER_VF_VCV1
    (no matching commit)
  - [net-next,v6,06/15] ice: bump to 256qs for VF
    (no matching commit)
  - [net-next,v6,07/15] iavf: extend iavf_configure_queues() to support more queues
    (no matching commit)
  - [net-next,v6,08/15] iavf: temporary rename of IAVF_MAX_REQ_QUEUES to IAVF_MAX_REQ_QUEUES_VCV1
    (no matching commit)
  - [net-next,v6,09/15] iavf: increase max number of queues to 256
    (no matching commit)
  - [net-next,v6,10/15] iavf: use new opcodes to request more than 16 queues
    (no matching commit)
  - [net-next,v6,11/15] ice: introduce handling of virtchnl LARGE VF opcodes
    (no matching commit)
  - [net-next,v6,12/15] devlink: give user option to allocate resources
    (no matching commit)
  - [net-next,v6,13/15] ice: represent RSS LUTs as devlink resources
    (no matching commit)
  - [net-next,v6,14/15] devlink: add devlink_alloc_drv()
    (no matching commit)
  - [net-next,v6,15/15] ice: support up to 256 VF queues
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



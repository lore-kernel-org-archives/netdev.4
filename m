Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967207;
	b=JQmwPviy0M7ndXKQyVHOuiqwfyvq3IJ0v43p3NB10melXMrc52mw7CHSOeLXuA/jkW0x
	 pX/XT3MAPj020A5kyw8z80eVz54TVvmAODgiuluYCKQT+Twh7bM4MyNSeocxrJFlXZQKS
	 Tjn5kEdEIJlsOSoioF6+VNP3BN7UINY4JSjF09G+0wVpdW3wedPGLhHMCwgPSQJscueJ4
	 Nc+xx3wOFmotUpQSDyA1T7/YZMv6vdyST95qBu8lZJHipMJ7ZDp8wEPFbcXgv4Sv5o9Yc
	 rHjzefANBcp6elaMirhjGxtt3rLk+Z29EtwtViNM4M34CrpY4nkJcGIO49N2IqCZfxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=0dtbJ5ojmD2EFUK6STepqEIIYt21cHF3X/tQBf0MmkI=;
	b=ebCaaFpN5JppG/3Ghu979lOC9zKi4gikEeG8COIGIdUQLwv4W19mMNiV3okaWMlIG5pO
	 vtxpxEb/5bEdItj8d5Og1tm21nCRZrdm1xqwb9FClGz2C27uRFbyROkJQRCrMNSB9Hneh
	 AK/K1AFnM0EUNwBjbVfSiInqoBAMzhSWsscw7J6OACOs+H04zQPrwEb8gCn0YEnaoAAsG
	 xDvdh71byfAcQDzcg1W+xfgy1jTVE/c4na8YzWu44nKm4+QUSQ6zDi9EqohqUw4o3NWJ0
	 2rmo/hvPCWicSYEtP9P/xExWepVeJeunQkrd32cQ5fihXjfEALTG9U2VN2ku45cq0+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLp7DrJD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A1606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLp7DrJD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837881F000C4;
	Wed, 18 Nov 2026 02:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967206;
	bh=0dtbJ5ojmD2EFUK6STepqEIIYt21cHF3X/tQBf0MmkI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cLp7DrJDIMI9lY6hKpRxzQjXTTS8+9HrFh3JCEpDUZY99Lcf2jj8q9VJbIlZc8RWx
	 dAblI6TOjqMn0IJgz/h4Scp8bwT+Mxz70rAvKodQwSfaxtZfV9BjyB/05vEsF1fD4R
	 tT/J88IEAP03wypKkUtHncljM1jrb3cR46D2Uda8S3LCF+RF6HCt+oeGUipFGEblr4
	 MJZbCFKF3UT5N2sW0Nc3CmZY1xnu6x0vP2skDiZXcMMpDcGPzSKd084e3zoQV4Y0cL
	 MRwCcz6eMYnuxdPUwzobfNkyUv76yNedRwsvSLe/p8gGj8fJIHl50IIDNjHwh3E0vi
	 HQeAs6KKevfoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7736B392B1FF;
	Wed, 18 Nov 2026 02:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net 1/3] e1000e: fix incorrect modified flag check in
 e1000_read_nvm_spt()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496720528.1405006.5833740959078510076.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:00:05 +0000
References: <20261113005823.130021-2-anthony.l.nguyen@intel.com>
In-Reply-To: <20261113005823.130021-2-anthony.l.nguyen@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 skunkolee@gmail.com, dima.ruinskiy@intel.com, luoxuanqiang@kylinos.cn,
 nsvatoslav515@gmail.com, aleksandr.loktionov@intel.com,
 moriyax.kadosh@intel.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 16:58:18 -0800 you wrote:
> From: Ivy Lopez <skunkolee@gmail.com>
> 
> e1000_read_nvm_spt() reads two adjacent 16-bit NVM words as one
> 32-bit dword for efficiency. When deciding whether to use the
> shadow RAM value for the high word (data[i + 1]), it incorrectly
> checks the "modified" flag of the low word (shadow_ram[offset + i])
> instead of the high word's own flag (shadow_ram[offset + i + 1]).
> 
> [...]

Here is the summary with links:
  - [net,1/3] e1000e: fix incorrect modified flag check in e1000_read_nvm_spt()
    (no matching commit)
  - [net,2/3] igb/igbvf: disable work items before device removal
    (no matching commit)
  - [net,3/3] net: e1000: fix warning in iounmap on probe failure
    https://git.kernel.org/netdev/net/c/cf704cc62ffa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



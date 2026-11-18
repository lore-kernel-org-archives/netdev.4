Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967218;
	b=0Qv9OkgNdYq1WelzyLS90VX/fOg9DSk7fZaNH2LEHDYXhtEw+9zSb57pplLHGEa4Gw3D
	 SsqQRQMLan3G140wQAxWZLARdgcADSVLI72GrcAFXBbuUbnA5zMq0YQX6ugFXxuCFL3fy
	 e19zTXNA0DOeMlfyE1rT6+wpxfKC31MsmY8vDpyJbb6UtnByO7IoVpb6IaEvnSA38K0rF
	 DwpSzS6eUKUgtq4S9zohFHzGzBvN0R/189WDPdmN7xYYsZo0SuhyRlpON1IY0xXmmLTvE
	 Gm35yMGThCNh6G+mxqiMubEjYZ04+q+LJojRJJCuXhvqniqdCqs3p4WK3RQu3IL8WAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967218;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=6ya8+yit2ISjV8P5nON1sJDOiTvpqKQFia+p9oe+V1I=;
	b=5KonAkD+KFI46CtnAyrPGAB8O0XDPcA1tN6DpntGgYnRrU2xYT72J4AXZuXNUpFSnT8U
	 DJWn5Cgy/lXbmV+LrL/a2egIYMqDK0EX4qROAlEw1xDT05MmtbPmcO0vADq1QByEX8NqA
	 e71dtF6oFtLl6SHngx7W7lX3iK/usxbfRelLtunmn5EY1JfvNanMgaJAiH/oHIcH2utM+
	 zve1JU0DuroEzEuAGnEljGMLrDrV5Mr4sB+Khc7McsqDbFqs47RhCMhOD33zQpdnhiUwE
	 HgqXR11z5pLkPCE90HwuWSOuafGohivf+xGGauyNiIbHlsZrvE0hxWSwdlO3dDDWQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCXUVDok;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E9606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCXUVDok
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135E11F000C4;
	Wed, 18 Nov 2026 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794967218;
	bh=6ya8+yit2ISjV8P5nON1sJDOiTvpqKQFia+p9oe+V1I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gCXUVDok14UZPdju+SlxzrWBwpvYTYGlSvPannaWCnO9ygT32IF+EHYGnL8CnQPfY
	 FdFD/b9gJ1nrgU+z9hMf8++KAkVm20yaAUivI+2FQHoU0cdWtuY0ZxbhHJrYIdv2Tb
	 u1gypD0qTYtWZFt1g4gH8Xp1kCWooQts3cuzAWlrafqk59NpFKDkBuNhiDIbWGgBHX
	 jiRP7LEVu46Dv/3yKVSRYaV+DQ05Mzxi5a9Y26GCcab+qwcRlXmmq6LvWEyGazZsdL
	 xEX6AXxWwpSyU/yvZz2Df4WolZA7IGjupqiQJ0P+VwfY9hWYJNJKmQkvh1o2ShsLD+
	 DlOhEn4EKOWuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F135A392B1FF;
	Wed, 18 Nov 2026 02:00:17 +0000 (UTC)
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
 <179496721649.1405006.7185574573967334937.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:00:16 +0000
References: <20261113005823.130021-2-anthony.l.nguyen@intel.com>
In-Reply-To: <20261113005823.130021-2-anthony.l.nguyen@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@kernel.org, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 skunkolee@gmail.com, dima.ruinskiy@intel.com, luoxuanqiang@kylinos.cn,
 nsvatoslav515@gmail.com, aleksandr.loktionov@intel.com,
 moriyax.kadosh@intel.com

Hello:

This series was applied to netdev/net-next.git (main)
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
    https://git.kernel.org/netdev/net-next/c/5efe340e9ab9
  - [net,3/3] net: e1000: fix warning in iounmap on probe failure
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



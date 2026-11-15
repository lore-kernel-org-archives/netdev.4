Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772206;
	b=tMncX70obVbvES5A0N7WU0w5vAU0BjVX0QtvPL0QrHnnRgpsGipdD2JA1f8CqO/yLOij
	 qMfhNGxZOK/xfZX0+82RmpdozV8BGOj17gBDnSCKiUHAPMX5uY/OUl+PE4KnjEvn6cjA+
	 rkPmXMCFwmQryL1M3RQq0WYWU+H5erzCXVPtoXunJWxHWXZWn0tz9TT/3wYTxdOsSVO1v
	 wuA1P7/tC2eD64UTEvc2uZdksdulsKEnbwWD/w6n2gdZbBphxMAfzztITx4Sk/PiAXyZX
	 i7TFV0+mdX6/SLO9m8UAcC9XYmRabITgUc1J6ekLVzQJPTG++PD8YyPVqf4KW1TsFhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kPpmRRjyGCht82dM5reMbhzqr7qtCsdwz8T7fnbchjU=;
	b=xVYstt7mHCg2HIwlU/oGr3QFzvjKLvm+QfTNVX0DKw7Uzwrw9ceybsez9oY9Sn5jFCjm
	 +FS362ED7YeOQxV8AhFrVEt9rhcOC9JPRzCm97ouTDY+Xdt+Dprbj6zWrNh0dNz0Kzk0A
	 MZsRGGqKG3a5ZVp6MjQfQc4F/rs4FBFgmQw66FgQH877uNKW5yDFm/9kJSAB8jXNiavQc
	 jD9+3rQEZe1IoDm/ZlkN6HxJ7XvvEKf5m2iQ0nPw3oQwHDUl4FnP8knWwDbQxzHf8lCpc
	 6L9B6+BgHvmZwFwsstVG6bK6p43l+BAgfXCU911oPtg+BuDbK3H6bqqm4BpxeVOdE1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JoF0spzS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69432606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JoF0spzS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058F91F000C4;
	Sun, 15 Nov 2026 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794772206;
	bh=kPpmRRjyGCht82dM5reMbhzqr7qtCsdwz8T7fnbchjU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JoF0spzS3VcGI0tYSyNFNdYiP7kxuAGbf2CWRsN5vT7JLf8pk3Hz7MPmjGQkrKAa1
	 cdZNzMgbhFP0Yvsraxs9dV+jUTqHJzbDpKJZRgA2OonCjPaSUt6U6NBoLNId+yLWAH
	 UIuOLunBX/T1mF7yUz0EZpdV52lww3O473FZ4URmftx3/YYVw6SZTbAO4TP7og661I
	 QsR29w8atLiEqGXnlWo+hkhdHpqRnpMG475s9Dj2kqft/RHe9g2irIsd37oIP57wyM
	 apm+hmBaOxofmkfXEhPpKUUvcoDtbed41GIKyI7Zr/Ytyhnwe/pP3Sdn4wcCi4Xvp0
	 6i5EBxhGh0c6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15773808235;
	Sun, 15 Nov 2026 19:50:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next 1/2] bonding: 3ad: Receive packets in COLLECTING
 state
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179477220478.2712597.6476904392323343804.git-patchwork-notify@kernel.org>
Date: Sun, 15 Nov 2026 19:50:04 +0000
References: <20261111171947.2816258-1-idosch@nvidia.com>
In-Reply-To: <20261111171947.2816258-1-idosch@nvidia.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, razor@blackwall.org, aahila@google.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Nov 2026 19:19:46 +0200 you wrote:
> When coupled control is disabled, a port in COLLECTING state is supposed
> to receive packets, but it does not. The bond only delivers packets from
> slaves whose 'inactive' flag is cleared, whereas
> bond_set_slave_rx_enabled_flags() only clears 'rx_disabled'.
> 
> Fix by clearing 'inactive' as well.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] bonding: 3ad: Receive packets in COLLECTING state
    https://git.kernel.org/netdev/net-next/c/ee97179b6851
  - [net-next,2/2] selftests: bonding: Add a test for 802.3ad with coupled control disabled
    https://git.kernel.org/netdev/net-next/c/478d2905efce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



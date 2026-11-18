Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968406;
	b=QhUIIjaTafmjosLwnSJmGziSVnxGN4hIzZy3Wgbr6lot+WALwMsYZ6MdL174Rx/gNybH
	 aeJxCuypsG3hDQ0LY/aMIZRtOGuwXQxF9S1wPiiPB3r/HI60j6nyum4Z/FXrwOo4orqad
	 Z6ZfFOxTEXXb/rmbbYVkOanVNbRjlLZLGPoiGEL4ZQxvKL7NQ9L43xYKmvc2eHYp2oCAm
	 9yfE632SJcbhvCPtnfqKXAn2pNyY1/5X32+9q3Dk/td+BBb3tf7PtFvgIyfVU08dT8Ucr
	 kEebtB9C2/sk4BrKe1e3Vet19n96smypowiLoX9Y2mQ/ZaY2dIub1/hGBq9Nks44XcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=kPZCTwpOAmoAE1kau1yrrrh1w6+4vxttMu35OzYwaM8=;
	b=nmIDn+9AxuKCeL/RQ6ApBMM/xTQCpmAsPI2YisxRZtsqW7bQJk0t1yNR6FNPkSY4/H+E
	 qXRK+lVmrKPhu3lF9BuOSX9sl2jasf/D5HbLdopj2pcNS8AjisyGxPH9lmz+o5CVQe0RR
	 HEQHPEzOyiYgsn4OkIdl9SXf8xewRw1p1XQgiVTrmvubU9GNm/x0gAWG65KHfXh2y4teh
	 u3aSwgfpimHAwftzYlVum2aR1ImS9RhkBYcFacmUIQHo7cs41aZmR0cC7JOim47Yz1NdG
	 F9/DKu0I/iFtvsVCzj6+pzzgtD0+2Q8920dxewurIA7Zj75oF80vyqYYXraNPWKDmLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyek+RUS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7A1606A31C;
	Wed, 18 Nov 2026 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyek+RUS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16B31F000C6;
	Wed, 18 Nov 2026 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794968405;
	bh=kPZCTwpOAmoAE1kau1yrrrh1w6+4vxttMu35OzYwaM8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eyek+RUSDkUxy0P/ZvZCDtyn53KL68dF1NZvM9hqbsLa9YLzLTSYncJSx+kqrKrBS
	 ZiXP4Xymnw1k6fCSk6IyQCMS2BWcWsDLxFjUWq8hOpatgfGjr6jlclN5XAlDnI9gi+
	 WQTdSlYHtwO53RoDubbqcY/+S/TketSAEPNadXqsxPdQsaAgZ7G5Yl2Xx7vF2O91y+
	 MRKl4a9I0YTbv8ClKJN/yX7IyLT/6Tin5kzcx6OyMdbFP7xVEh3z/Pv1/1bslr3PUz
	 gXZ1nX8rpiDV6sXKOpyrIbVDgdtyilFln6yvgWcW7rpk9I+ua1kfZ9R/wsZHd1WFxD
	 Qc4wizQhOC8MA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B443B392B1FF;
	Wed, 18 Nov 2026 02:20:05 +0000 (UTC)
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
Subject: Re: [PATCH] tun: disallow setting ARPHRD_MCTP link type via
 TUNSETLINK
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496840454.1411964.2818262145565407284.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 02:20:04 +0000
References: <20261112131056.234801-1-skalpesh942@gmail.com>
In-Reply-To: <20261112131056.234801-1-skalpesh942@gmail.com>
To: Kalpesh Solanki <skalpesh942@gmail.com>
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com, jk@ozlabs.org,
 matt@codeconstruct.com.au, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 18:40:55 +0530 you wrote:
> When an IFF_TUN device is registered as ARPHRD_NONE, mctp_register()
> attaches an mctp_dev context to it. For ARPHRD_NONE and ARPHRD_LOOPBACK
> devices, incoming packets in mctp_pkttype_receive() invoke __mctp_cb(skb),
> which initializes cb->magic = 0x4d435450 and zeros cb->halen.
> 
> If a userspace process sets the link type of the TUN device to ARPHRD_MCTP
> via ioctl(fd, TUNSETLINK, ARPHRD_MCTP) and transmits a frame carrying
> protocol ETH_P_MCTP, mctp_pkttype_receive() evaluates dev->type ==
> ARPHRD_MCTP and calls mctp_cb(skb). Because frames allocated in
> tun_get_user() have a cleared skb->cb and were not constructed by an MCTP
> hardware driver, mctp_cb() trips:
> 
> [...]

Here is the summary with links:
  - tun: disallow setting ARPHRD_MCTP link type via TUNSETLINK
    https://git.kernel.org/netdev/net/c/0a3778b93be4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693210;
	b=U4Pb/5kGkTokL+3BmYbHo50eoUxvSiiMUxsl0NR4h8jub7o4cL5W9mBzx7J4B0dabGxr
	 fOhrKqeyaUKOLaXKVDGYzkyzBpZYJhIcHL1h4sCgBE2umqGoQgH6Q/+skQnrC5exk/x1e
	 Jg89K2e0DQMRroUCtQDVIZmrYZnwhwtrStr45ZiTBaHwZScw7yVy+N6hEdRDPgSXa3s4y
	 lv7uQxJ/ewy5/+q+nSzkMSmfkHx4GQ/AzYPjGDhpZ19YAnGLkw2FQnDR5ic3cYCfBzu/o
	 w6Un//COabCtDBlYxdpW1JqLoH8XTO+l33C8aXO6Xz/2G6Eugw1woqhaFUc4UNlamzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693210;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=WapnNrSMtWRMh/DEtJXyNZGqF5pDOdH/wpWy76Is1Bw=;
	b=5LIQDQBV37IlYrjjHMaRbQcKL3bQ56F2jKFa0y45WaXus/R3uZS8aU07P5YKzYean3D8
	 O3g62/kriUFJX1o58EOKPWUATBfcJWWvEOtaNZhPH2z6dDlRvsfz1ZSrp9PVb72R3d/CT
	 8+XDjiJpGajyspzxQ3KNaExj2XU51yflyS27m10q0ZdR6GMYYRRR7BUCCDznZjwIrGSSv
	 Dj8yHlkDGG+b7UUR56K1AZ7W7247zwQy4oHSKetxLr0zYbTHexn0jrI+vCTAEKWcnUviT
	 KttARjmIK8KIMUK/YROmFfhNz0bsg+XBA/mljdkEOEa4PNgvHkdLeyqUPIF+ncAF5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlHUa8qi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F0C606A321;
	Thu, 26 Nov 2026 11:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlHUa8qi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC801F000C4;
	Thu, 26 Nov 2026 11:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693209;
	bh=WapnNrSMtWRMh/DEtJXyNZGqF5pDOdH/wpWy76Is1Bw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mlHUa8qiOFWYe6znCBRriSSrERXJykaxtY6EmY/adah8A98Z+TIytTHleBm0tDqTh
	 c4bPk1SO9QNDAccVa6dwchhvaKHVsxtuonlomy28NFxjletrI4qMPTwFDhKY/G8PnC
	 vgINVoUWAjcKZVZfyqv59ShvFH/JeL6s+DNlVtek0VpJXc0VkBTtXmd7bB9ok2shJM
	 PE/mcPgoPVnVpczgBQhq0GLkZvDuGyJv+aTeCwaA+IGFqojVAPL6PDxhj5zon6qeHk
	 zxu4KCsVOE437kY7mV0kO9Faf4NQtjtEO+RVnn5aXbLn28V0j/JXwWkVHGsOMcGnLW
	 Zf0wdI4tLXWFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45F3380A962;
	Thu, 26 Nov 2026 11:40:09 +0000 (UTC)
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
Subject: Re: [PATCH net v5 00/14] net: pse-pd: assorted lifetime and
 error-path
 fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179569320852.1770964.6389266555271149762.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 11:40:08 +0000
References: <20261118183957.2031311-1-github@szelinsky.de>
In-Reply-To: <20261118183957.2031311-1-github@szelinsky.de>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 maxime.chevallier@bootlin.com, kyle.swenson@est.tech, ross@r-sc.ca,
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 19:39:43 +0100 you wrote:
> Fixes for the PSE core and the pd692x0 driver, found while working on
> the PSE controller teardown. Most of them are about what happens when a
> controller unbinds or fails to register.
> 
>  1  The kfifo is too small: podl-pse-regulator and any controller with
>     0 or 1 lines cannot register.
>  2  Removes two checks that can never be true. Not a fix; it makes 3
>     smaller.
>  3  A module reference leaks when reading the port state fails.
>  4  A failed IRQ request stays in pcdev->irq, so unregister disables a
>     line another device may own.
>  5  The notification worker can read a PHY that was already freed.
>  6  Setting a power limit checks the PI state without the lock.
>  7  A power domain shared by two controllers is freed when the one that
>     created it unbinds, or when registration fails part way.
>  8  Unregister frees the PI array before it stops the IRQ handler and
>     the notification worker. The worker can also be queued again
>     during unregister.
>  9  Unregister frees the PI array while a lookup can still find the
>     controller.
>  10 The PI regulator ops can run after the PI array is freed.
>  11 A failed registration leaks the kfifo.
>  12 A shared power domain's supply handle goes stale when the controller
>     that created it unbinds.
>  13 pd692x0 leaks its manager power budget when probe fails.
>  14 pd692x0 crashes on a manager supply that is not resolved yet.
> 
> [...]

Here is the summary with links:
  - [net,v5,01/14] net: pse-pd: size the notification kfifo after defaulting nr_lines
    https://git.kernel.org/netdev/net-next/c/374589c02b1f
  - [net,v5,02/14] net: pse-pd: remove dead pi_get_admin_state() checks
    https://git.kernel.org/netdev/net-next/c/3bbb278ccc73
  - [net,v5,03/14] net: pse-pd: fix module refcount leak in pse_control_get_internal()
    https://git.kernel.org/netdev/net-next/c/d1e25868c63b
  - [net,v5,04/14] net: pse-pd: do not keep a failed IRQ in pcdev->irq
    https://git.kernel.org/netdev/net-next/c/d4917898edb1
  - [net,v5,05/14] net: pse-pd: do not reach a freed PHY from the notification worker
    https://git.kernel.org/netdev/net-next/c/788ab871cce2
  - [net,v5,06/14] net: pse-pd: check the PI state under the lock when setting a power limit
    https://git.kernel.org/netdev/net-next/c/dd81d889a87a
  - [net,v5,07/14] net: pse-pd: do not tie a shared power domain to its creator's devres
    https://git.kernel.org/netdev/net-next/c/7bb86f016211
  - [net,v5,08/14] net: pse-pd: stop async event sources before freeing PI data in unregister
    https://git.kernel.org/netdev/net-next/c/bab065ee89bb
  - [net,v5,09/14] net: pse-pd: unregister from the controller list before freeing PI data
    https://git.kernel.org/netdev/net-next/c/89015cdd7920
  - [net,v5,10/14] net: pse-pd: keep the PI data until the PI regulators are gone
    https://git.kernel.org/netdev/net-next/c/83683cb6ae01
  - [net,v5,11/14] net: pse-pd: free the notification kfifo when registration fails
    https://git.kernel.org/netdev/net-next/c/0cfc9d478abe
  - [net,v5,12/14] net: pse-pd: use each PI's own supply handle for the power budget
    https://git.kernel.org/netdev/net-next/c/7abc960054eb
  - [net,v5,13/14] net: pse-pd: pd692x0: release the manager power budget through devres
    https://git.kernel.org/netdev/net-next/c/758dcea92de2
  - [net,v5,14/14] net: pse-pd: pd692x0: defer probe while a manager supply is unresolved
    https://git.kernel.org/netdev/net-next/c/9e83fadf3887

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219807;
	b=4RjDcxJhw6Kxlv+g2fKbgUB16MSFQWAhUrqNF1XleRl6foJN2xCt0vnCxhNDnV1lr++W
	 ftr7lfswQ5sQk3qxCZoISstvA1a2OhmbbPDfMvYZgUf33/6nF6RH2HxcgFvsemz1QzeqY
	 duYkpH41PiQ3cGgiIjmEM+e3RnnBrL91pEYpvL7YsSViE9GaZCh0QyFy69bhoCzXepm6S
	 d24BLNVV2OBmQDxBqKZQXS2iEoHaLBkHJz+RkKfYmAb9h5msJwWMbTAgHRlyWjCr7J0MX
	 0GdFn7z1ftV8+tw92rShP5Hp8OSsWMdhlAn/ISGXemrw+rQqK+zkqcCwoOn8uCvMswg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219807;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=JgXYWVr2SMG9hDxw3XhU0xANOZpGpOvloJb2TXhTK1Q=;
	b=aRnh30capYeUN2u6ZOdsZ7333xG/u9AwvPJWKFstxK770Nq3uPWpAN8JnRqVdzlDwS1g
	 RtLd5ydgY5TJZP3EQz6v+t7E7MoT9T0xxXb3jm3mgDkzQRJjowzFm0ZKToytahI1PB1AQ
	 qTkgOM7QJyChNZCfmKf2DSVVnwp6Ez5EoocRVRVOJu6YSjc8uT2wCAj+VWBQHGTF5WdqJ
	 HotkPpS3hGznQk/mXHkcY8+HtOYfHOXwWwxFoSIBbiSY26t1WPXzT88BydpK+GbG33R3x
	 SMv0l4+IM53K8NtUhQgg/TCUlBCIyfw8ME6TZS62VCXMljj9eLT2bynzFUCnICqAKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eZFTP/Mn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C660A6F7E
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eZFTP/Mn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC041F0089F;
	Sat, 21 Nov 2026 00:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795219807;
	bh=JgXYWVr2SMG9hDxw3XhU0xANOZpGpOvloJb2TXhTK1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eZFTP/Mnc/2d8mODxE9pgVdf2l4a6DIxRaClDjKVtQPXKhG123o9RWkAdYPJCR8nV
	 CJZpf0i7hUHCrJIpInjILlGfc57/EATaqRCFyjTpgjQzYzmJtcj0HPaQkKoFOU2nsl
	 UXZGsDUgn8RzZeht7sd//ybgkxKh7e3dCxtCWi+UPJE2BCx+xyOP0NhKWVa71/2uV8
	 QieNbblH3zDFeslX/MvxXpkvFJwRQj7yINBXqfLs+LCWf5N4OR8IKTMN4k1fv+URL3
	 QshU/kXdEjKl+vVRdrKwo/IYDb0MXgIG226c2gjVa0ilIC2YqL+qvyvWV+DOzSSoSP
	 qqlhRMrNk7F3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3AB380AA4D;
	Sat, 21 Nov 2026 00:10:07 +0000 (UTC)
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
Subject: Re: [PATCH net v2] net: marvell: prestera: disable port before
 changing
 its MAC mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179521980577.848072.5290579375875129990.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:10:05 +0000
References: <20261115230812.29644-1-kaloz@kernel.org>
In-Reply-To: <20261115230812.29644-1-kaloz@kernel.org>
To: Imre Kaloz <kaloz@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 enachman@marvell.com, oleksandr.mazur@plvision.eu

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 00:08:12 +0100 you wrote:
> prestera_pcs_config() writes a new mode, speed or inband setting to an
> enabled port. The firmware can then report link down until the port is
> disabled and enabled again.
> 
> Disable the port before such a write. 2500BASE-X and SGMII share one MAC
> mode, so SGMII sets its own speed and the speed is compared as well.
> Exercising this needs a link partner, so no in-tree test covers it.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: marvell: prestera: disable port before changing its MAC mode
    https://git.kernel.org/netdev/net/c/fdb6fcabdbb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



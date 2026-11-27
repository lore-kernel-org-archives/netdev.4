Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776010;
	b=CDe7eNiZbNczIQrlh+n8d10asjBGj/X0yTVaH54hiUBOVuoMI4HNqfUHb0SmLvNOjyyr
	 xA7hHMYgPBsAQfhQzaQiBuZjgnchV0PQGysBX7p6vtN7mG8I0wlSetd7BkH9U2Util7BF
	 NSz/wV5NWTaLFTzKRPjinNSqGJnQMs0OIiQe+q8EAEIymUxKtOhr0HBHDDBNnh2+7jbal
	 HSHTwIzTbFiepkKOlMWZax5J9XVlkso1A3JaTnG2/yMiWiJLHnr6+u1eKYiPlV+eiHdsF
	 9icoR8ZLL+Ch8o/6bmZ6GulGQXXN1wnViTk3c17gRIBbppUZ/Qqva7zfnF6lcN2b6hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776010;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ssRt8khlJRmuStv6JKy0P5WWHz74K+gj5ySkQRGlyDY=;
	b=qQOzg9ViCZqnr9PVUR1B5i/CdTJ8Yikbd3Li2UAp9fr7eCgQdWvKjEPGpUzFrF9AFPE0
	 VQFGfbXsIsvWI2Y7+HgVB/AmXFLIQJYLMvrhyP+hc8eF6sXFzqjm7YLrZ5ZxzvhZilCc+
	 8qwIMBubD13XVtCqDSugRyx36rj2ifMFuX4lKOKKvDUniOcymuIYz43vDAUESMEgOb1Or
	 1Wb8NEEnoEjo2MCTcR69w1CzFbi2/6hPF2rd1P0npL7UQAyq1VBAiu9kinCWxqzNSIhcV
	 on35WkMgnNy2T5wgSmZBXPJDzmRf9kq17GsB1BEXBK9Sv4H5MIrz4UI50wrCQIeRSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZdrCXOPV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB4C606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZdrCXOPV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD291F00893;
	Fri, 27 Nov 2026 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776010;
	bh=ssRt8khlJRmuStv6JKy0P5WWHz74K+gj5ySkQRGlyDY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZdrCXOPVWamWJkHmasLj2LvO/x9zUavmgIuerg5Zci6k1utZ+/Yp+8nY2JTNRmiV5
	 +CebtXD2q8j/h4xSJcyYhXEVG+TxQ8wbB2IUMamvJfWWBx4wURTqdxDCm9fNR2BJS2
	 wV29hdbwhp87MfZHe9XdCJLeAPvUGVseZRUvrzxDzc7NPyzi9JHljADfwZWGFqoqEX
	 IKJ1hvxgREjBGLgQmRoVAT/v35fG+YRKAX58jn0rYmE6ey6H0PMBHFV6X0SftQKmIL
	 pk4gytMJSH7gDaRE+tOCy+uQ4JZv4wpSfnRwsmWWMHVax4P/GHbDdKJPPW2lJ7IhG+
	 pP8/zVVFn27Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345C338003C5;
	Fri, 27 Nov 2026 10:40:10 +0000 (UTC)
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
Subject: Re: [PATCH net] net: lan966x: fix disabling timestamping without PTP
 traps
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179577600874.905521.17848243841779986693.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2026 10:40:08 +0000
References: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
In-Reply-To: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 23 Nov 2026 15:53:54 +0100 you wrote:
> lan966x_ptp_del_trap() looks up a PTP trap rule with vcap_get_rule() and
> removes the port from it, or deletes the rule when no other port needs
> it. The traps are removed whenever timestamping is configured with
> HWTSTAMP_FILTER_NONE.
> 
> Before this patch, every vcap_get_rule() error is returned as -EEXIST,
> including the -ENOENT for a trap rule that does not exist, so disabling
> timestamping on a port that has no traps installed fails. This breaks
> moving the hardware timestamp provider of a port from its PHY to the
> MAC.
> 
> [...]

Here is the summary with links:
  - [net] net: lan966x: fix disabling timestamping without PTP traps
    https://git.kernel.org/netdev/net-next/c/e20a00eb02ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



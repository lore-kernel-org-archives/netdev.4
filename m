Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051206;
	b=yzRKhwrWfo0S1m4KwHUN8yfi7VcQgm598i69siIPzYOhxIPXiwfDtpA0GIOe4AP/iZHH
	 glSiLxHXSuyEAOZijEtSv3Wp4GTpbV8vrJ7OrbiVdehDU40sxrNlcKtVF2emVXFJmSGDq
	 YqKb/yeVXK7yiAqVC4wQ7YHHtMWQXBziakcLRRwMYNOY4a2f7vW2vFgQ+YfdrfdJCeFvv
	 p3FiAj8dxpawEqSeHnR+OkoUhce7HvN5DBEp2rSMDUsOwdTAKz+EFqUeZwyB3KOuwbS4e
	 vqq8kVxBZZZr1ntQx6Epau13bzEf3c5cwzYMpE+szstyudxPreLmnFzqIYnmV0sSN8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=qgHsEUikwM+60A8ptHPHQnZQfW8HPbV+b8O+mpPz1tk=;
	b=tPqpyp27s6kaGvipFXhCSKAgaiVQTR1eHQX+S5EBKcTZYmcvw1uvQFwUkQJTG1XupGdt
	 NSoCzGLCgngj1pz7iGo8sVCbIbCUAorA63RtwpbvtWXcYPduQ21KdHAVYjsNJsCf/BKiv
	 koPRdlaNt50BwvUAj17GJFGoi37FbLNpQQ97Nb7uSrLtWUWto8A+cv2ADdCpaLa967T24
	 6jMF8Z4bbMePqfgYNJIWSaIGgfJ14AwRseck5vIWczrCO2wwpMfKjokx6uqsvvmZ/1ox1
	 P7ta3nOSm7Y03N+RN0+tOhBzEjw37t3K/9tt94oxboJzGmRGbIvgRwH7rtzTqdO83Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BIWFjQle;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1137606A320;
	Thu, 19 Nov 2026 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BIWFjQle
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446851F000C5;
	Thu, 19 Nov 2026 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795051206;
	bh=qgHsEUikwM+60A8ptHPHQnZQfW8HPbV+b8O+mpPz1tk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BIWFjQleikRiJt6eyCsAtN3sv++8lkkndwvsRZM0buTIX2vnqwT+/KhbiMU3atj4m
	 nH2gtzkKPHtu/DswXOJ2uHHz6qQT6pgAWN2l3IghFhFKJnJL6i7oyNLgoYRas0oXM8
	 upbNTs1RGwci7g+2ldDYcPxxYlTxo/Hp5heXtcMuoCqQ8qwYGW1EWaZlkrI0MWSBI2
	 Gr3m99TH4a6ANihhmJmPWQhfCD9eccPvLJtTqecLTAZPHdiCrCRYi+QXyM3CLklYIo
	 9Hu8x2H2owstJbjlE0ayN/D0roq2FbGXpaNW5aD/smfxRWA5v8auTEQq6aPIIcjigc
	 u6LZdD0AE8izw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2743808210;
	Thu, 19 Nov 2026 01:20:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] net: phy: air_en8811h: use firmware loaded by
 the
 bootloader
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179505120504.2698221.2135616364374088700.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 01:20:05 +0000
References: <20261112134300.4188612-1-f@lex.la>
In-Reply-To: <20261112134300.4188612-1-f@lex.la>
To: Aleksei Sviridkin <f@lex.la>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, ericwouds@gmail.com,
 lucienzx159@gmail.com, albert-al.lee@airoha.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 16:43:00 +0300 you wrote:
> On a Keenetic KN-1012 (MT7981) the EN8811H sits behind a port of an
> MT7531 switch. The driver has to be built in there: as a module it loads
> after DSA has validated the port against the generic PHY driver and
> failed to set it up. Built in, it probes when the Ethernet MDIO bus is
> registered, before the root filesystem is mounted, so
> request_firmware_direct() fails with -ENOENT, the PHY stays without a
> driver and the port never comes up, although the bootloader has already
> loaded and started the MD32 firmware.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: phy: air_en8811h: use firmware loaded by the bootloader
    https://git.kernel.org/netdev/net-next/c/89f0fb60afdb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



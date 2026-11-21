Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225813;
	b=hrKViZ0t5DQZmbfihnys+725nf/4ELgHWb19J/4f8vlhxE7IsxaSh/NwWlZCL5260g9j
	 VR8a8jHM7jZeNtVsXUoqhihw0qhxua3Po7k+qMVUe/Fn5eai7Nb/MVqsTjtoJ7A14swUN
	 oa0rNb2z/CLXdUzbSPUnN8MQbEm0Gs5c1/3VeIRrFpw6FCT6SflcE0ViSnoPIKd8FIT02
	 HVHZ5yADiUSLY11bpC3QfHX9OOcw11gj8P9iSjH1XQQF3NmOFNRR1n9fBwGyHKCcJb9oS
	 kFgJbPl6Wd8WfDP3heC2LzWgA4MFYZ0L5IgBrwuaQ9APRAeg0uOPXfMmTpb5YiRF88w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225813;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=EMCAKhcauQqF4krrprPAqbzo9TePN9barIrQOovM2kw=;
	b=JU+TN8WbccRvia2zhIn9kMWjIp5SSh8xeaSJgHcdpyhemLl3TNbESwrPsUR8tIuLxthl
	 GYyXG1kTKiE02Q49Ai5hU816snNRRKo4fdYYEmHKIUO3/zajLpESSWq013hz1BeJL9kJD
	 8KobFztnDh7zx9p8BIKGHqNUqXmlTN4u1wSGBqWw5Cf1+/xUOpgzTGyvpd8oKKKjSnK96
	 ITnL+Oph/pjEHLPNAsp6oXLqScue69s8Weq8WMDQoTAjD+HXTuoLcxtVPLm1Y9b+IeT9O
	 BwJ5LW12cs3nj01KpXZgrH0iHmf/5GS4EiMJyNctyG6k7VdeeSGpFhrvRLuM9Wjk6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqOFmsnc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411F606A6B7;
	Sat, 21 Nov 2026 01:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KqOFmsnc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA121F000E0;
	Sat, 21 Nov 2026 01:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225812;
	bh=EMCAKhcauQqF4krrprPAqbzo9TePN9barIrQOovM2kw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KqOFmsnc71y3ofBBu9xyCEYqK/DAyjN4APR5/FqaSuM1DtxL5iqyGya+mESPgCcop
	 dH8vJ9HiKcdKBT68CfRcBujLEqZTNBYHJzxpoOgvpTleiX0jj5UuuGujucuR2rmRFR
	 l8P1eRPBYlTrPu6Gx9aNotHFyNA/h8tQgy7JC4Ze6VcdiHzFpFqTMtG7Y87nCX7rzV
	 DVkVJRmnK84cs52a66YyBoYLFRJxm2nuLhnUbk+Qf86y2UH6fI2s/Ad/xENvfW3czi
	 vbD4JYCWJ3oG4CtztXK73BSaRQ2J7DeRd+TWBh6fOpHMp3w5VfN8J8/8Nr7WEyjENV
	 DTPTUscPu8Z+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773C9380AA5E;
	Sat, 21 Nov 2026 01:50:12 +0000 (UTC)
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
Subject: Re: [PATCH net-next v5] net: pcs: xpcs: make supported_interfaces
 authoritative
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522581102.882976.1777503818733834004.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 01:50:11 +0000
References: <20261117175215.3015703-1-coiaprant@gmail.com>
In-Reply-To: <20261117175215.3015703-1-coiaprant@gmail.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: kuba@kernel.org, pabeni@redhat.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 heiko@sntech.de, netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 01:52:15 +0800 you wrote:
> pcs.supported_interfaces is the mask of interfaces a given xpcs
> instance actually supports. The compat table describes what the
> Synopsys IP can do in general, but a specific integration may support
> a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
> SGMII and QSGMII in hardware, but does not implement the C73,
> 10GBASE-R or 2500BASE-X modes that the Synopsys compat table
> advertises.
> 
> [...]

Here is the summary with links:
  - [net-next,v5] net: pcs: xpcs: make supported_interfaces authoritative
    https://git.kernel.org/netdev/net-next/c/b09a65056479

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



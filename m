Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221616;
	b=0Z72n+ehoceLx42zEAolxM46tnkmshAaG7bhsMkIbsRIt5QVCm1XfzyXqvDouPrfRKEz
	 W8pUxqlWoKe+HirmTxSDolHptCAOpKiWzsAUP+byF6lSmd/xAemw+ImGEU39YDE0mRbOq
	 gE9czBaAGoxdMfDXNeaVPnKin+opClVubAZh0NG72a6565lYO03nLLdyHkalrFlauU/U9
	 vSf7n/xKhZ+CJv1rRdxTdpQQhn7zjy625diQ1YMe9yt9g64Q40qaPlB9riUcZXZRKPciI
	 nDexY9xzFbwe2b7kh/ad9QOUX83i2YOvLcQAUvsNWTyHcTF2NSOLiv4RDmryc/0SdFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221616;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=PJJlqGi3V350ibIqKqCAf9QXZXN1HZ9/vmZrioLMsRk=;
	b=fPZlTD4vctAOvD1GSlcvjylu32cFyLVECWA+s0tFuVrMqE1aLpj1/JjjVzmD8GUshODy
	 ldj1wxmyWuHUNZpVX+PUlVznZYVwLYLNzH6JaqgnPdS/1p8SDtbbQ2wR1N2tfy4bQqFbz
	 zlBCzLQwQC2mHBK1YMkXptcYD0Pyedu6yzkKVyqswSYFDdV0Ih7Mj6M4scesngJ0HnLck
	 Jma7ZokbT8Dp7H0IbY2BPGXZY8m8Wa4sPMV7N2cBDUfBlu3LHOLBOU9crp4GhzHI7Twkz
	 KoMOA/w0LReLmm9zfPbXsWxD/hdWgblBWuV6L6AmfMGuiSXGlYrFiE4B+OAn3Xmvs0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Mc/ekKED";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA3606A6BC;
	Sat, 21 Nov 2026 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mc/ekKED
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A3D1F000F4;
	Sat, 21 Nov 2026 00:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795221616;
	bh=PJJlqGi3V350ibIqKqCAf9QXZXN1HZ9/vmZrioLMsRk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Mc/ekKEDE+T1RCsWUH+bj5Tc3dVuSc9jLDGlcgncMAHCYuM4vLOElpdIwht/vxxyZ
	 DBKhh1wu8sTtHjWGPgAwTUgEJg/H7Sj4KosgSh7Wr4WcGM6n+WQk+56Ilj1S12alGx
	 5PWQ9Hi+fUGz1ZHCNgDC0C1g/8WeWaLOsemt38WUawHaIDStCNeo03eNrNArqQITG1
	 XULuzcm/J8hkMt8bjcU0UN9vrBOrmGgyUhJKzdd506iqMhslJf/NoFaPlec9Ha+TzF
	 GyLRaA2vj5iYzJ8rNG7sXpj3NF7/rhfPELds6IGsioH243JGu2Z4AtgRuuIMxbU2OC
	 fHns0WGFCwlbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F146C380AA4D;
	Sat, 21 Nov 2026 00:40:15 +0000 (UTC)
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
Subject: Re: [PATCH net] net: bgmac: Fix potential MDIO use-after-free during
 removal
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522161452.860209.12072101505879493784.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 00:40:14 +0000
References: <20261118-324f82bd41-net-bgmac-0@mail.sdu.edu.cn>
In-Reply-To: <20261118-324f82bd41-net-bgmac-0@mail.sdu.edu.cn>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Nov 2026 22:18:23 +0800 you wrote:
> The BCMA remove callback destroys its MDIO bus before
> bgmac_enet_remove() disconnects the attached PHY. The PHY detach path
> still accesses that bus.
> 
> Remove the netdev and disconnect the PHY before unregistering the MDIO
> bus.
> 
> [...]

Here is the summary with links:
  - [net] net: bgmac: Fix potential MDIO use-after-free during removal
    https://git.kernel.org/netdev/net-next/c/f18a85d9dea6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



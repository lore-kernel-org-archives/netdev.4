Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694407;
	b=Q7FNDPimHS761XzX25bGX9zpnLIMcmT9dEAiQHp6M/TEulNDmOamCzZAGs69xRSUft85
	 jQCGvGWhO4Me9txfG9SgxA/jSh1/UK1PSLOYFrIWf0evaISjm9bi3d6M5tTvJ5aPfSdpE
	 VbT6t0WPFJD6X78xZDpl8ELvRO21V/3jqQiNWrQdaLelkvetMSfWwqUlmXpEpzwIEcTFY
	 fiwTE6Yj+Je1WCoxQL+gq8OebTSKyMQeuaEoAtoPt/IgWdilj/DyiuTEyropZnoj2Dsgo
	 5RdFTYjAoCPO6BrJARF3fBrH415bjbUN9uOejeZ/pui+LB+K0nJpjRbZQwLN4t64pMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694407;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=j6mVNxa5ZIIys5YzBgMtF53fVPUMEzmGnA7SbgZM5xE=;
	b=yLlZSFpRshbqBzUsB6RXktOQXJIQfUq4K3+pUpqLWxD573wCXMh5vjFAfykS+ISjH5+F
	 JtcmqGBahX2r/+wvU5pHwQcvm+JQ6/V/jiqdHh63ne85H8xVRC8bwJR8GScwc6l/45B3t
	 AmmybcKaZravJdB4vdD3KYCmmKDs3GUJeiuEDpqNKi1j0ZlSaWM6JcIPfzCsodaU8EPdf
	 hG8PDLEBL1u8KhBEN8MAp8QDhBt1Xr4b4Uj2jwPmu+HGrwQA+iEOYGpG57O+0f7MbrVvi
	 YAcapn1LD0BzlhqJG0DM1E1Lj6pFKnkOhh51ID9oElximiz9Zj0k1g2Wd44JdGktPpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRLzE7qW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B61606A326;
	Thu, 26 Nov 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gRLzE7qW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE72C1F000CF;
	Thu, 26 Nov 2026 12:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795694406;
	bh=j6mVNxa5ZIIys5YzBgMtF53fVPUMEzmGnA7SbgZM5xE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gRLzE7qWxUGUkw6D2VvIqkCxeESUFAVSORjbXaT5FRRK2z/0Mn2N+9+aWhGwR36gJ
	 E9O7Lf3jwGkDf6YaE+t066Unc4bawS9bEdkjneEcdeK8qTcY6pE6RmQJtQKfFH9vAo
	 +vjQveUCtV8PsIqQVmuGXX25vkhN+duBL+WY4mllUE5ggFl/BXLqhrl4exFQhl7d4k
	 AjsY9eVVarLfve66t61LUhquLT4nDETVVe6+sF5M3vFiEtKJj7mM2JMh11tUn3Rk6h
	 /sQkSBVvR0F8vKSq13YWPwHwbxZUi9YxezcSJIQBdTAt8IyWx/mZp/uDTNd+eAiG/q
	 XnwzYgyGKbk9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4532380A96A;
	Thu, 26 Nov 2026 12:00:06 +0000 (UTC)
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
Subject: Re: [PATCH net] net: dsa: tag_brcm: fix link-local detection with a
 prepended tag
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179569440527.1780623.1665313975505848003.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 12:00:05 +0000
References: <20261118184004.1916105-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261118184004.1916105-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 10:40:04 -0800 you wrote:
> brcm_tag_rcv_ll() checks eth_hdr(skb)->h_dest to avoid marking link-local
> frames as forwarded by the switch. With a prepended tag, eth_type_trans()
> sets the MAC header at the start of the tag, so the address checked is the
> tag plus the first two bytes of the real destination address. Link-local
> frames such as BPDUs, LLDP or EAPOL are then not recognized and get
> skb->offload_fwd_mark set, which keeps the bridge from forwarding them in
> software to the other ports of the switch when it is configured to do so.
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: tag_brcm: fix link-local detection with a prepended tag
    https://git.kernel.org/netdev/net/c/ae8e5ef9fa9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795569609;
	b=IF/5wi7q8Mlm3vMVT9HRgycqX8nfY6DJaWg2Gsv/x32RbJwjOEYtrt/Rd53zDa/KHEqT
	 rWH3CKnXkjl5OoAwh6FGhbT5G3AGcQNULYgoSV0PJ1+vD2Mn/3VL6b3/YUdI4LFtUr2QT
	 O2biQVcUXDMi2UYnTi+dkzJlJdjG8rwGrXrE8osUVKe6s22712DBj39tVS0IqpSlMvUug
	 eHVvb5GcvYNbewumSnbTTfi+lx6/ul7IS1xzzsKeKx2MMUU/D9shiiUiD6md8wx9vnISG
	 3pBIfy5fxVNhDJSU76wS3NoZViochjA/u7kgVQvGdf5zvF3sUR6MbbVjKUYqL4PB9sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569609;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=ebJI9YJIGxltNFXRiSVqbB6kDZnBZS9T25Ay02Q44n8=;
	b=il1T5IQWBEpmfSd2I2t7Lk4ceRi+wwdOSKQel/n75Y97CR0MzTBq2JuDXf6dXa/W85UF
	 yZBu2ht1Wu3fId8gblhI1P0+wWcUcAKpXJEITNVracve5yRfRAKPiVANVBsK3Cc73fD1+
	 64U7AYxoutdhk0j4JIO75EWuahUVR2ebWbSH5vH/iZEDliqRthy7PdqSRIaXUE0qOM/Fx
	 aViDAoBunbfkDZdbeM/tnoYcuuCGqKIT5orDOHTuRFmJwARFKVbbcyklEPpUuJQL0zV2l
	 7RzNkMf5ZYTWvmFFeGQAFFYaSJXqBvW0xCOYxDmAI3OFa6dFguP7zlQRDvowEWac5Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5Cc6oBz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E62606A31E;
	Wed, 25 Nov 2026 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5Cc6oBz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461291F000C6;
	Wed, 25 Nov 2026 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795569608;
	bh=ebJI9YJIGxltNFXRiSVqbB6kDZnBZS9T25Ay02Q44n8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=m5Cc6oBz3FMiCtRe22fHZ4nImWc5kICZL9ZDU9bnUzryAM/R82L0hZ3/xKqz0UCXo
	 32uIlwakRmgPoBNvsGO9JgA8J2prmOi3IZFGtdnuj8me0nsP9tciSGo1KXm+7Z3tyz
	 Vo26ZU8YnSYsYZuTFzesH5Jqi5K1TVCyxVgO4d7Tx+MVRNBwlvUARB8CzQDskpU8KJ
	 JBtmMkaFBaHBokuzMVsYU0mT3r3bRMRpgkHXzf5iFUIaHZEk+JUNz8Vp8R/5YSO5FZ
	 EBp8KgBlnNJwT0Vfuli3jm28GunBsiyN8SuG4QwealmGCLu7Ashn7Wf8gb5newLcq2
	 FoDCYbnP/EN3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4EB3808209;
	Wed, 25 Nov 2026 01:20:08 +0000 (UTC)
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
Subject: Re: [PATCH net v7 0/6] net: dsa: b53: Preliminary fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179556960702.150816.16216671017919717979.git-patchwork-notify@kernel.org>
Date: Wed, 25 Nov 2026 01:20:07 +0000
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Willem de Bruijn <willemb@google.com>:

On Thu, 19 Nov 2026 11:03:42 -0800 you wrote:
> This patch series contains fixes to issues reported by Sashiko on the
> b53 PCS bug fixes being submitted, and then some more that came from
> code review and testing.
> 
> Except for issue #2, all of the other issues did trigger in testing and
> needed to be corrected.
> 
> [...]

Here is the summary with links:
  - [net,v7,1/6] net: dsa: b53: initialize the jumbo frame size register offset
    https://git.kernel.org/netdev/net/c/5d30a02245c3
  - [net,v7,2/6] net: dsa: b53: fix the SRAB grant timeout check
    https://git.kernel.org/netdev/net/c/bd7fc60896b3
  - [net,v7,3/6] net: dsa: b53: clear stale state when creating an ARL entry
    https://git.kernel.org/netdev/net/c/c6f0992ff6c2
  - [net,v7,4/6] net: dsa: b53: use the correct override register 2 Gbps bit
    https://git.kernel.org/netdev/net/c/fd2752aac6c2
  - [net,v7,5/6] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
    https://git.kernel.org/netdev/net/c/000d46885594
  - [net,v7,6/6] net: dsa: b53: fix mirror destination and source state tracking
    https://git.kernel.org/netdev/net/c/320bc9b8e2bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



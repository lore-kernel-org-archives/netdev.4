Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048211;
	b=Txnfzq/XUgjOcDBkKAVfFcvzS3K+Gt2VFK30qzGIBdPOcO1BWQZzi3qn7c5I8tC1GaiL
	 HG3VA2fJmyWz1jUDIDYFPiFKrO2fcuzDUospaAlk7lT7pWK+s/d2YGI8YvFCMTzKbqrtX
	 J3fDsk/hK5FFeHWHT8ZyJw1fjJMo5cLZ7Me4YmepCcBpjHe9b8x5px10+pHVPF5gne7yD
	 /Wl3kEGgSwloC8ytzLc+HglP0IGx00zi0rDJEYEUBejeGt2ULfRYCo43sxxNwPAJDBW2M
	 iCj9JPJSmxhFx+pkj3DCqfp3WN/m5aPNLCkR6KEBuJ2+jczW/A0eEYyzVwo4JVzKosg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048211;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=qSET/Qq9EXIlbLWRq2dvRErGntI6O6jvJQpX9CpjxkI=;
	b=njmCIa+FL2oIwRwAcXrb5c3bgU8KguwcO2i3OrV8j67Hk+WP4CZ7qlK9QLa53EOXym6L
	 dZ7oFEE2sxmjEsRGWFfsS/1CMMC7viIdmBcBmvachf9rK5TCzNAAA3WAlshmW/jZ1CZaH
	 hkYVMjeLW7IreOpellt3Fi4f/hWynsr+I/UyD6xbrLi7TSTz94YQQOlKTSeSlV+HT/S1S
	 g0nuCS9b6bobKtDAG8WESWnrDzxwCTRk6n3rQ4j8t0Dmdoe1+bSQBwa0rtFCGmGL2h17K
	 w2LECqRbZuOJ2yzlYzV1M/aenMykIojNgmYPckkPWRtACaB80sI9S9C4bfBOR7AP27g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCS2c8VK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2E606A31C;
	Thu, 19 Nov 2026 00:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCS2c8VK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446831F000C7;
	Thu, 19 Nov 2026 00:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795048211;
	bh=qSET/Qq9EXIlbLWRq2dvRErGntI6O6jvJQpX9CpjxkI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kCS2c8VK27ElBKx4FdoXozguddT10Ff6F3borx9uKsfC0pcRc/fqR71rQomnNYssv
	 OevUchcx4KnGjHU4uEn9Ed7da/iarzOPyxv1WqaYq00xYNemX+DmvFymu1Wndo6mf5
	 RGvxiIdpxxm6XVBFLdNbq85XMpItgg76RCGlj3Ye1GPzqPK0rnxpUkSfv+4NOQ1cnJ
	 Oj/tPaHceD9qAO5tZdhdzkZpnBbVAlJwfZad+DwcxLJOsxSJ7dmve2SswgMx9Hdw6e
	 OeRG/Et1moa4dHWhCAjQ+bIukXePzD4bO9hC4QWQnUxk5JH+LPuNRXo/ZGzesEWSi6
	 OLaeIq+LQklCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3C13808210;
	Thu, 19 Nov 2026 00:30:11 +0000 (UTC)
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
Subject: Re: [PATCH net-next] net: pse-pd: realtek-pse-mcu: add RTL8238C
 device ID
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504820977.2657179.13912428474327823978.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:30:09 +0000
References: 
 <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
In-Reply-To: 
 <EEsDzyK4pKqMZ9P6eCtfk5Qp2SXyprlFB4e4uQ7_O1iw3BuvnNm95DKBxuHy-mp3vdmUWhob9UWOzN9VWXoYyQIADqKPNvJt_gfaLaWpSkU=@proton.me>
To: John <therealgraysky@proton.me>
Cc: jelonek.jonas@gmail.com, jonas@jonasjelonek.de, o.rempel@pengutronix.de,
 kory.maincent@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 09:40:01 +0000 you wrote:
> From: John Audia <therealgraysky@proton.me>
> 
> Some Ubiquiti USW Pro Max 16 PoE units (boardrevision 3) carry a PSE
> MCU that reports device id 0x0238, so probe fails with "unknown PSE id
> 0x238". poemgr names this id RTL8238C.
> 
> The high byte of the id follows the chip revision, as with RTL8239
> (0x0039) and RTL8239C (0x0139), so add RTL8238C with the same power
> limits and power limit command as the RTL8238B (0x0138). Tested on such
> a unit, PoE works on all ports used.
> 
> [...]

Here is the summary with links:
  - [net-next] net: pse-pd: realtek-pse-mcu: add RTL8238C device ID
    https://git.kernel.org/netdev/net-next/c/48198bec8475

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



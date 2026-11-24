Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536841;
	b=UERlQ6sMZPc+EOE08hNdV9/zNBujK0gErzsjA6Q7OXJJA13CSiUlWKxqubvGAnPxgMic
	 iDPhYsRE4L+ziB3Jen+VzUF2DODvAGRoe/wP5ildWKRLGxP2NN3SeLZ9Pi/9jrTjg3eJR
	 u6PO39OSXjMFgHQuPVy3He6y/3zuAQfeVrYAyswbP4xYgP7O3pcOApf1xizZIdSkKWk3T
	 SZfW484N0Gbth3Trn5gytmUIuXbYK4G5A0E0CrUlLdysGFa1AYugICO3hqgNdW/Q7vgyh
	 1d2alw5/8cqNA1Extvhx6iHGTq8wOZ7nNRDMLCYylYwIJoCfsf02Qy4UjjolhrVFh2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536841;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=;
	b=r+f7ihqzDRlhjRNX2oBm5UPCWaxrxDj87OWhvU4+aKZBHqcW13b+bAbQCoOOTe4R3Omz
	 RfD+YzfQZYMmsamtyGXb9xtKTdJ3sbma2ZBM2ikvwp4uCk64xB3tg2rOSzAAv1JD0fZwH
	 yNbPGpw20kmaPv8DZs9PWilJ7pWklgOhPErChuLG5ItI5OYV2BRDn0r+RZHH4D6my8Q6K
	 oj41V2TnK/RbsFx42evLSFgEe3WkIeuV/polRSL8y1NmfbaLxCFgSnbGzfHNzD1AB14Kx
	 WRwD2ZdfK/qwUWlrSwJupnhrFtnhVt0CY8IbvDEGM1pHIcyOqO0gH0LVZJfgli7sW8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="OiDP+/11";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48675606A323
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48675606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=OiDP+/11
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EEA46C2C65E;
	Tue, 24 Nov 2026 16:14:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76D2C601E1;
	Tue, 24 Nov 2026 16:13:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CCAB11E6809C;
	Tue, 24 Nov 2026 17:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795536837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3skHsXPWAPA6xtcJjoetiAZ5hNyad5A7kWWBwX3cakc=;
	b=OiDP+/118IsNkkWNjVvkTkhOkwiJEOWOgt/AuPd0p7RfL1uW/xPditFOwmUGlJAF+/ald1
	94jFeUbZ18pOhAWP9JdAeLzCIfoUAY4H4OLm6IcU6FaEegWeAb7ja+V5e/5aqY4C8GxgE5
	iqe7I80hpVi1dW09EJBRUcbNKJsfYRc2brJ4F8i9ljOvjSYCXRrEoLADhLZWn03WgVC4a2
	f2Qevq0S93oGchK8Au4ccupyRpgPxM/JKMqxEHx7mf0ufKL10dWwB8aT9iELn7GHRBGQ6Z
	vcceJIYH2yJ111oJRwPMlSr/FKSRRThvC7sxN43b2KaSllqYZp4v+ef2o9qd/A==
Message-ID: <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
Date: Tue, 24 Nov 2026 17:13:49 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: netdev-bot+sashiko@kernel.org, zxyan0222@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261118025528.2703790-1-zxyan0222@gmail.com>
 <179520945915.3135.14304625182301747705@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <179520945915.3135.14304625182301747705@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] On every in-tree XGMAC platform, the XGMAC half of the fix never
>   runs.
> - [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
>   non-NULL.
> - [Medium] The patch turns on an FSM timeout check that resets the
>   interface, with a hardcoded NTMRMD = 0x6 (about 1 s) for every…
> - [Low] The commit is written as a bug fix: the protection is
>   'ineffective' and a stuck FSM 'was not reported through the safety…
> - [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1US
>   .. 64SEC) to include/linux/stmmac.h, the platform-data header shared…
> - [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
>   1us tic' register value in two places that use different conventions.
> 
> --
> 
> net: stmmac: program the FSM timeout timer
> 
> This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores after
> TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMRMD
> is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
> safety_feat_config callback, and NTMRMD encoding macros are added to
> include/linux/stmmac.h.
> 
>> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
>> not reported through the safety interrupt despite TMOUTEN being set.
>>
>> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[...]

> [Severity: High]
> XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
> timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
> platform set plat->safety_feat_cfg?

This looks valid, on what xgmac platform did you test that ?

Maxime

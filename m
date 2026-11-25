Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594220;
	b=aJco9ibvEGN94OJh/t5/bns94e3ZGyJ5BZMj42v3e5MukQTho+AF5DgvsrutJf3oupf+
	 df4FHcVgxteVjGa1X2LpfAm+85A0g2eMsCNC5mInUWAIbiTp2ZBkNbcBI2szHv4CoQulj
	 MMlP/Wt4rtB6HW1ZKatqmLRO4Deiy7qGo23eeTP/TjjZXbr8Oit8k6WHHo4OtVcKiOeyt
	 cL4K0QeTaYGY+s+2Htkl5V3PWWSohobQG/nVosbF7Cfukp9TDw5MICjFta9XmeQlGL3bl
	 8X5a4MetHLY+D7UZhzbWl1E/bEIDxGRg4yByj3LAXp1kEpsc7hlZ44LgAKp4w9n7K9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594220;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=EZeIddDxt24rVimWv2GYDAtePnr1zfDgT9qisCJrRAE=;
	b=3WQK25x+2zk/NqHsOKdVyRjGJLM/0ofc6l9wh9BJioY4tFtPS8OjQNeUG4dOrnQYD+V2
	 j0nB6YvcWODRSKgj7u3KuZKC9tHdCtrw4pAadkt6EE2wYWU6vlAIu1ITh747eojTYpDPL
	 NWo8dA58sJw/luAr2Az8r2Niky7sp2belCxVZNUYKxRNtTneUOTAm2Dtn3OPon3oqkRXD
	 lAaLZBgUbpYducMpGGjWjDrGiluBVLGiRi7cMEV+UN3gjUH4nncXQ/FzKlmIyKD5jccUL
	 AcjkRibw8boMq8cnH7OJRDxNU1QFzuuceJ285Wq4Del/C2ndqCM4ep+pHvxAmHMk2pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cgEfGQ43;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910ED606A323;
	Wed, 25 Nov 2026 08:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cgEfGQ43
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC7244E41762;
	Wed, 25 Nov 2026 08:10:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76E3160480;
	Wed, 25 Nov 2026 08:10:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D2A711E69A4B;
	Wed, 25 Nov 2026 09:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795594215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EZeIddDxt24rVimWv2GYDAtePnr1zfDgT9qisCJrRAE=;
	b=cgEfGQ43D37X3Y47TvTD2Mgi35Eh7tmhpZFNQv+WFASJ1AzeUvt8/fGFK3HCVhWpsxJRXs
	L0kWy8ZLOtcRSjrs4KfdcXzdyjAiavoRWckmTTN8q2uBm+aePqbYvnDxeuiRfLLnTsWOe6
	4+2pZnwYF3Hda5PazDvAvqSWXZYk/Oic78DZgbo/7Gx7aga3OpwkdEfjNNDVG6CAFt+DRv
	ys/5dhJJSDJ0vIzQiNciChAi+NmE6UAXcCnEGTBeV8qZh6BhRrssildDx3EojMs4S0uQ85
	IaIlvRE+4mmORFaEziFloHa4q0BX4MjN1mhNxwsMcKRI4w4Y37D4R2FseICJTg==
Message-ID: <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
Date: Wed, 25 Nov 2026 09:10:07 +0100
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
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
To: Zxyan Zhu <zxyan0222@gmail.com>, romain.gantois@bootlin.com,
 cathycai0714@gmail.com, avifishman70@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <7732873.EvYhyI6sBW@fw-rgant>
 <20261125075716.2262174-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261125075716.2262174-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/25/26 08:57, Zxyan Zhu wrote:
> Hello Romain, Cathy, Avi,
> 
> We hit exactly the interrupt-storm scenario you discussed, on a local board
> running a PREEMPT_RT kernel, and I'd like to ask whether this series is
> still being worked on.
> 
> Our setup and trigger:
> - stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
>   with PREEMPT_RT and panic_on_rcu_stall.
> - Trigger: fault-injection of an uncorrectable MAC safety error, which
>   makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e. 
>   dev_close()/dev_open().
> 
> Symptom:
> About 30 seconds after the injected error the board panics with an RCU
> stall (rcu_preempt detected stalls, rcuc starved).
> 
> Root cause (confirmed on-board):
> - The main level-triggered IRQ storms at roughly 820k irqs/sec during the
>   reset window (irq count jumps from ~220k to ~23M in ~28s).
> - stmmac_interrupt() returns IRQ_HANDLED without clearing any status while
>   STMMAC_DOWN is set -- exactly the "unconditionally returning without
>   clearing any interrupt flags" behaviour you flagged as dangerous.
> - The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
>   grace period never converges -> panic.
> 
> This matches Romain's point: the unconditional early-return in the
> STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
> watchdog.

Taking a step back, I wonder if the right move is not to just get rid
of STMMAC_DOWN entirely.

It seems to me that it does not protect stuff that much, reading the
different sites in the code where it's used... It just seems to cause
more problems than it solves. All of them work without STMMAC_DOWN
if I'm not mistaken.

It's even misleading, as it's only set during a reset from the service
reset subtask, while most of the callsites seem to assume this really
means 'interface is down'.

I think this is the better lead to follow there.

Maxime

> 
> Fix we validated:
> disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->state)
> in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
> during the synchronize_net() window.
> 
> Results: irq count peaks at ~724 instead of ~23M.
> 
> Questions:
> 1. Is anyone still working on this series, or should we revive Cathy's RFC
>    with the evidence above?
> 2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
>    window" be acceptable, or do you prefer the more general approach you
>    suggested -- wrapping the STMMAC_DOWN set/clear in a handler that also
>    disables all interrupts?
> 
> Best regards,
> Zxyan Zhu


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680425;
	b=M2AgX7dzY2ZYbRpVqWLIkMon5Nhxm9XdLoPn39oyRqmVQIapl2KEq8GfLNBz9PS+zhEl
	 L/MLl9vq1puj0uQ8iAKYajHeTbGPuXRTW3Q4fUPVK+JaI7XmzQNnf162raQBpfJOXEwjK
	 ogVrI6YG07qndfDCq3BSlV37azcKa0HeGjGmz1wSTfgmO6BSp3VOdOq7dNkuxxvQR28/D
	 WB8cLqY+HP8J/mPUQNdQlaBgGeFuGTC+VmB87raIPC7COb9IZY6LoKz1K9DY12VkutUyM
	 UKb35JslEcKMW3BpKOdjoseZL11X9D9Hk7UFCoJZGFyVNpbjT8jG/QyHXC1Goh5EFQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680425;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=OchicsanssR3AdJ00LY+3McNXqSzaIMckCwuyN0twwQ=;
	b=wTaDwYTMwo31CEhkhWxXWZ50TFiX7kn/3o/g6PlqUSy+YkKTHehKL7W2Zo8xGIaMLP2q
	 SlexPNq8U0PPuJbLBqC2i28hB9FwysG3R76s7qr8KC60qIlATBx/SmTO6G0XNm6UluMmO
	 mbjpja/m5YubsEpIq3f4VBLyn1XKlpAftDbdJBLVykuqgI7qIdx9xakMtjN5Umx2FLe1a
	 /RqKgAHemEsevYdweLON4ExBAlfR+H65tZbHW7AsnCOGIvsk+CVY8VxmVeCpnLLNROFbE
	 i+IF1ZL/SN39OmByaZG0pRLJGt7wzVjzrJdZtMVfdm5oVhxcGdKXvxA46V7vOqq2eJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SrrfR7Zc;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0813A606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0813A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SrrfR7Zc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 146111A1814;
	Thu, 26 Nov 2026 08:07:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D193F60237;
	Thu, 26 Nov 2026 08:07:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1694B11E6B27F;
	Thu, 26 Nov 2026 09:06:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795680421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OchicsanssR3AdJ00LY+3McNXqSzaIMckCwuyN0twwQ=;
	b=SrrfR7ZcuX6e8a0vz/8yqbuzwyHlo8IAOY99nK7EZ4yitmDBz+ys/kSQlnNBI08XaLGEp0
	hyr5DkipP6U1pY5olD/YICFVF55Qy96f/N/JEm4q7an5IsYpgVSJsgvejTnW8WL77sqEjc
	ohmJhf8qGOjYK3FqBPqqr7OopELWOLzrrhWpEo2WwcmoLXkAVq4vzUUi3EP+gpmehfqBRR
	Lg+RlnQizk4xVkEhtKOi5RGFMZ8r/hPo4SlZH1LymmR0E2VqwgYUT7LIi3dmShVy14ZVM8
	5M8t2vxicrCABrEDvXJlof+0fT8DoENlVmgMT1iuvs/SncHM2gHPKlnc+J6A6A==
Message-ID: <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
Date: Thu, 26 Nov 2026 09:06:54 +0100
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
Subject: Re: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
To: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
References: <20261125111929.3395740-1-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261125111929.3395740-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/25/26 12:19, Zxyan Zhu wrote:
> stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> MAC_FSM_ACT_Timer register.  Per the databook the checker only fires once
> NTMRMD is programmed with a non-zero duration; NTMRMD == 0 disables the
> timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> never reported and the advertised timeout protection is ineffective.
> 
> Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
> 4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
> quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
> timeout could wrongly report a flow-control stall as a stuck FSM.
> 
> The NTMRMD field holds a power-of-two microsecond timeout per the
> databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> 
> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM was
> not reported through the safety interrupt despite TMOUTEN being set.
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

[...]

> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d22..659f5db528d3 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
>  	u32 tmouten;
>  };
>  
> +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> +#define STMMAC_NTMRMD_1US		0x1
> +#define STMMAC_NTMRMD_1MS		0x2
> +#define STMMAC_NTMRMD_16MS		0x3
> +#define STMMAC_NTMRMD_64MS		0x4
> +#define STMMAC_NTMRMD_256MS		0x5
> +#define STMMAC_NTMRMD_1SEC		0x6
> +#define STMMAC_NTMRMD_4SEC		0x7
> +#define STMMAC_NTMRMD_16SEC		0x8
> +#define STMMAC_NTMRMD_32SEC		0x9
> +#define STMMAC_NTMRMD_64SEC		0xa

This whole patch starts to look good, one last comment, sorry I
didn't spot this before. Can you put all these definitions
in the "common.h" file in the driver folder ? These are some
register values (same on dwmac5 and xgmac, but still), so they
should go there.

With that changed, you can send a new iteration with

  Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

pw-bot: cr



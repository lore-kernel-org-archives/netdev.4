Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033012;
	b=pOmEvmHtFDzwbA0C/keHwZ3cbPkISbNaQ0/aBN8cId4VeOYztynFmkt7XgMhbaYpGLST
	 p1WDxAngocZ9Z+cfzDPcllWE4urqFco7b+Ag4zvwNQqbhMwQQDWq+5kGhz1J1aG2Ii3Th
	 ZTAKhlMx82K0kTCoKcwvNxiBVBMqKxJNvE0CKrHv4l4YqtCFs/2e4Sri4v2xRvCF+r2GY
	 KHAw85QqIdZoKxLJea4u+fvbdDgUFaWA1brEtXEe+fq3qyxkMGSevja2V3Bsy4xAZg8Ya
	 aE4E6a40UZ+EyAIsFyhTl3JM3Es5ugPdy4dX41QClOi6svJUcND5fInjnYOfJkTqAqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=5UnqAJ+AexMehXANmzRxjm1wi6GBuId92BoCIleFMPc=;
	b=ogyVAcAsImUKi5OIpmiD36SY1l2fWA+ajJESyFbXPSYuLD9HPg4Cf0saQJ1Cr+8yRou5
	 otWcmuPOnu6N1TAerPm4KUkEKkAijAN9IdZL/q9Sj2kQc6moNerb9oGde2lkJjNCnH48u
	 30rbS4O5f7qA+iuFfmSCNHdB3TaMgycThNUJFmX2k9b2O8NB0xgvUCjMgs9ebgkUJmpRn
	 moyQrbtO8rxzX6RnJdtvr74YkC11EjfzJWN/cjIRLm+fiLJ25g7Q785oB/lEfwR8aBf2l
	 VHsl26QyTb3OISTWUhQXx/eTUvpchGaE0eM/mE6O0YZq14tDDytn9LHzUaS0odYGeLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C89606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b3b75aae4cso1235296a91.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:16:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033011; x=1795637811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5UnqAJ+AexMehXANmzRxjm1wi6GBuId92BoCIleFMPc=;
        b=LoogRtAeXldvNwIWFRqN/i/f6GUd2iFaraarlA17VbEkOGutIemkTigz4tYmXErBMd
         fHwSvW++gs9nLmlNnYRqnM57IBwaLR3ZeJtuXL5wfq/Ov0nFj6gi0DwoD001I+AHtmBb
         1CWOiH5P8QYbnWsKgrOe43+aX9zb3z30ig3myrWDApYdR327krTXicCjQlE6w3pC17GI
         J8z5iXQB0y/YDcZZMgFeGLybvEXBR+2TGlCrrWZtqqmBOpUj41kI3VuofnTfvcqfVGcK
         frUyTwIICkXxsMQh9Y2JPpNu6efqcRWJzKs35AkaRvWZp4Ps0EMmCW7MSZOIyHx+CFzq
         rqig==
X-Forwarded-Encrypted: i=1; AL+hErE37atr+UZwGowswFQWRGnPrtNGS4hiHPNQ8dMWZAVvArNKP7TSG++0RVywddL3+Yqm33oVbPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GsAqpZ9ayYnlaJSFcNmqP1108ADbE4bm1Zg//oIgM2pzOB5b6
	ugq4bvfAoMBv0f0GzG9mk9BEOTGJlTa1a736ca7bF3js3ldAof+QqbtKmiDlfR0a
X-Gm-Gg: AZFdTZejute1+5ayt4EN+IxaZ8X+04BSDM8gws4yygCCbbio55QQbkJVSWMUYmPDIab
	EQFIqRMlnLNadnZ9QGN8bgpwplhQi5yJnKrDnoXd0T1scg2uZRHGnh4cqomQjtVvnrZKyi1+2fO
	2hviF3n1DC6t42ZpsMqgOHPjJnDzBTqj6RM59mWmKK11Uxa4BO6YJveewtqQBWWslehE88f9r6U
	vabfuKxl6/+6Aib2LG2F6jKhzk8nMg6tRbmQUC91fCq/3y/c+6XBu/P2D9Xvpuxc4TLk1miFE1s
	DWS2tPS/N7lT2rtB6vqv0c/fb0LkmTWaymrnetc+eDs9vghCjaANEe6tZ8AP/yyos6smrqEoBl1
	ibKhjavc66dXG2XpQk8+szRus2pCO5RVM05KvbuUbgXG40q9T4R0i8bYlz1d5uZLalPmZCPmuQI
	TgTnlVVSTX6M7tySmCj6O3qhkjAPzGGLcUL83TAC1Rq6UdKcXM4zC10mbyW/yTmrtrhVnbTnEwi
	KFw/zbPyOCHOBFIpitZUOvnqt+/ZXpULWRXQPGmowte3ubfIjFNX3E/u4vepxDUf1yXfYGwTf4w
	l8Fk6OnK+xitYSKqvnIhJ5Iv5pCahZnVY4IO8SI2EVwGh2hhEfX7KC7N80QumPMoFXXedaFCAgJ
	ac5oUPShzK4M/
X-Received: by 2002:a17:90b:3892:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b3d07c2484mr3812060a91.53.1795033010901;
        Wed, 18 Nov 2026 12:16:50 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde5348b3fbsm498221a12.15.2026.11.18.12.16.50
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:16:50 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382c3c9671fso1744831eec.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzSyWj/KxKKcLXETqMljIN/GyMtyhKJzkWob/F5oVz0rvGJJ25tN5F0RLuPn5yzqJoaNj01Sc=@vger.kernel.org
X-Received: by 2002:a05:7300:7314:b0:35f:8c5d:5928 with SMTP id
 5a478bee46e88-38281213cbcmr3898471eec.30.1795033010021; Wed, 18 Nov 2026
 12:16:50 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev> <179500523674.3136.3797005435367758007@kernel.org>
In-Reply-To: <179500523674.3136.3797005435367758007@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 18 Nov 2026 15:16:38 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5MxJJvfPehp+1cFMRZYRa059H5NqbivaHgHymCni=MtQ@mail.gmail.com>
X-Gm-Features: Aa3M54rVwPf5ul66wX8lmbjDq-z9xoC_lJskOBFIWYhripfW-S7U1hEPGn-f_Xs
Message-ID: <CAPY4CJ5MxJJvfPehp+1cFMRZYRa059H5NqbivaHgHymCni=MtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: netdev-bot+sashiko@kernel.org
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org, 
	p.zabel@pengutronix.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 12:33:56PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> If the switch node has reset-gpios, can the reset still be skipped here
> with no message at all?

Only in a kernel built without RESET_CONTROLLER or without RESET_GPIO,
and then the switch runs as the bootloader left it, as it did before
this patch. That is how an optional reset control behaves in every
driver that uses one. The driver uses the reset controller API rather
than devm_gpiod_get_optional() because Daniel asked for it in v1.

On the SF19A2890, the board this is for, the SoC's peripheral clock and
reset driver (under review on linux-clk) selects RESET_CONTROLLER, so
the imply does enable RESET_GPIO there by default. Selecting
RESET_CONTROLLER from this driver would turn the reset framework on in
every config that builds it, for one GPIO line; imply only takes effect
where RESET_GPIO can be enabled.

> Does this pulse the reset again on every probe attempt after
> -EPROBE_DEFER?

Yes, as in the realtek DSA drivers. The v4 changelog says why the pulse
stays in probe.

Joseph

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773280;
	b=KpREQWnaS1msgfQmMguUEqrQyNZkt1E/IU2nf6tmRrjXM79UOG5ZLsIhXjRySvh0fzg4
	 5mkCY3q7dfj54gRDb0DLBdkeaVtJcQXNyx9/msVMMHyL4AHonNK0HJHjOR5cMIMe5kktD
	 hNo1lmlOCHBNjov3cVmBcjexP6aPr64UpQ17C8oYzxHuz4/nE18zB7NbVszSMb3KRqEF3
	 siO9FAAKyuuyN2EZ2BzC24EL9JtAGXn26vsOq3tTyahbSpi+axFMa1cAFd4N/xS9hJ5+s
	 RP3eWJvar1ZhMHNfunMe6Xkltp7/88UPA+J+vA0YWaN2Czkw/UG4C7dcYWrWR7LMYiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
	b=lQ1P0tksfolUoA586r1RKDynmkQfDpyqxtG7PmgcJq/v8LNdOrHdGg8iRFg6mIhuF8CA
	 m4ikZrmidAkvTMTix+xLplXalPpMvFAO5Gj+Zt7f/tBnbDy114O1bPAzySbXC1DEXiMBN
	 nC1fwiKjTqJiqphGuziFbqpSyVUscRGpcK+FBMTYtZEjuaJj2Nm1Qx8DxvJN+80jorHau
	 BdE93M6vjRmpRc2cBJ28l7m5wUOsxcUq6vyNHyHaF1rBYCeHMVAtmj0SRmqcBvckzfwOK
	 /0DDSHi0aAUmrAxIARMGTiVPk7T5a/S3LUcb7WhOwKjP3x4m+jzvQ/XeAfHmGepnJFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gF4N7eR6;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19937606A33E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19937606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gF4N7eR6
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so63908655e9.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795773278; x=1796378078; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=gF4N7eR6wbYxwpQdFZRD8u17QtLAeOHIGciJxFGFH0qkLFvkBGSIn4zqV/9OUhTqk2
         FYuKv7WGQ3iuusTnIDVnRWlXfcm9AUa9E4borOHqUGVvpakVeRHFSjA7LPh4mADdfGkQ
         9XpGyPmX/jQubZVBdjszhdl4P2WDYuk9W4knbSftqmc79Rwlxo2hR4FCYOkOnOJuDsrW
         S84pjwAOq1EUSEIyhkZGtLuNEFo5ZWBYq4vRy8m52F8z9HTiFIw8XYNL2Gq+1TaZ3Ike
         gnRQ/HSdhJ7Xq9dplpKJd63EkMUZ0cBh4ordEUr4F0NALX62RlM1bBuSuofWgLjYav2K
         gT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773278; x=1796378078;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oJiHhRhtTGk9PbbV01vyfsi+daGewTNyYI/p6gVR8Vc=;
        b=c8gOxu+5FUrDRJ7AWPz/sp/D+7Z0Iq0daDiJARB/SFOkDPRq6gEq5pHsq6uWvZdZpl
         CI3pCHwWuFWkn5jYhfjHVLtUxhg516QvwEZm2F464rdHKanEgqbweBnJ4mcK9cDw9yof
         5eZ1tjFHjce45yYHxHDiLEQzy8pvdOwmgUD5fTolKdFGU/2QYO1ceWzZcv9DosoEYoO/
         lIfbEPMgoosCLTl+1y6fz5FFtfRqBCJe9hjQI4orZIbe9eKnTz7jKPtU/L2wrWlr9RSX
         1viGh0HMsPzELKCSvAAI1VD+ky6a4PwYN/qXO54BvlY7T9X8Ts02T4yM57vCQS7iDf5y
         ZSWw==
X-Forwarded-Encrypted: i=1; AL+hErEFQZW4H/ggU/4BFurfYiZVnYwciDVSJMO36GQ/pN1mWLr0RHokUVglEMVamoyYyoJNA2iiZkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LwG9jZjx5QHXfKBX5MJzN0LCFwiuU+DclrRNIv0UcHDNg+zAS
	4n1KNhLj4mQE0RuaZT+4E/e8Ug9Jq9Vf1qEz2uPoQUeTW4YBbQTsvpqcHXPcRuql5QY=
X-Gm-Gg: AZFdTZe4kKWjQz/F8kNXa21haS0PX7PH5brM6DyXdTqrbGEf/brIlUnAmTo0UTeXX72
	xXXcEV2zwPkDHqM4dM0trdP7XQJOpFzuePdiGnEUQQIw4L2VbimvYxB1p5J5/FXrVVFWX7MPUhe
	pSGn2+dwcO6hnwLRIX9FaRO6oExhc4mXSHro1XW9xFlhZhNPG/KBU56wG3yG0ubH14YJx9qL/ye
	hguLfcZqbBFZQim8/IYNhBGpQCG0YZ0zboj4GP/+Fk6ia8M5QmzljFfwTQpkB+lWERACo3xXSQc
	75Z7NQum9W9oFF+US2sQkA9mTTkk2g+vLjBcfR5Mm54CDzIN+3+zrYbxHsHsisp9VuPZW8yILB8
	oPHXyKrXcYQKFhICJPAMI24CH1QgAiLjXhkpzq96ED9Ensa3SRic3/pIPGZai8ijgOKaE5GQ6tu
	9lrk2bevfZ3jPtIkuX6l1UlWM1x/N9NaleKDX5RzIqA+MB6bD/HBL091x3e7uFed5XY6xl3puoR
	laT8kEqh185OTjyijullr3q456Ev9T5K8flm9fYXDMwfGohJy41TP2OXL4i8t7r5yHoH1GwIIms
	4/YqzCKz82eGdHtMfmJr2AjpoxdMeHxZKsw9X51YEiUYxuht
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr473789905e9.10.1795773278505;
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm560118415e9.9.2026.11.27.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:54:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, Andre Przywara
 <andre.przywara@arm.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Alastair
 D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH net-next v3 5/5] net: stmmac: sun55i: Add support for
 Allwinner A733 GMAC210
In-Reply-To: <20261126064345.2569445-1-alastair@d-silva.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-5-15735155a789@baylibre.com>
 <20261126064345.2569445-1-alastair@d-silva.org>
Date: Fri, 27 Nov 2026 10:54:37 +0100
Message-ID: <1jik1iwqea.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 26 nov. 2026 at 17:43, Alastair D'Silva <alastair@d-silva.org> wrote:

> Hi Jerome,
>
> While testing A733 GMAC210 on the Orange Pi 4 Pro (YT8531 PHY), we hit
> two hardware differences that also affect this series:
>
> 1. External vs. internal RGMII TX clock (SYSCON_ETCS_EXT_GMII):
>    Unlike the Cubie A7A, the Orange Pi 4 Pro wires the PHY's 125 MHz
>    CLK_OUT back to the MAC and stalls on 1 Gbps TX with
>    SYSCON_ETCS_INT_GMII (0x2). It requires SYSCON_ETCS_EXT_GMII (0x1),
>    matching Allwinner's "aw,rgmii-clk-ext" BSP property. A733 GMAC210
>    will need a DT/clock way to select EXT_GMII vs. INT_GMII so both
>    boards work.
>
> 2. RX clock inversion (BIT(4), ERXIE in glue offset 0x00):
>    With BIT(4) = 0, Orange Pi 4 Pro required ~3.8-4.1 ns of total RX
>    delay (matching what you saw on Cubie A7A with 1800 ps MAC delay on
>    top of 2 ns PHY delay). Testing with BIT(4) = 1 (ERXIE) confirmed
>    it inverts RXC by ~4 ns (180 degrees at 125 MHz), centering RX at
>    0 ps MAC/PHY RX delay. Andrew Lunn requested fixing this clock
>    inversion rather than compensating with ~2-4 ns rx-internal-delay-ps.
>
> I plan to rebase the Orange Pi 4 Pro Ethernet support on top of this
> series and address these in follow-on patches unless you intend to
> roll them into a v4.

Hi,

I'll resend the series soon. I don't think there was a major change
request on it. The way forward on the delay matter was not
entirely clear to me to be honest but I know a similar discussion was
happening on an Amlogic series. I need to check this pan out.

I'd suggest you build your changes on top this. I can't test your property
changes without the board so it is better if it comes from you.

>
> Thanks,
> Alastair

-- 
Jerome

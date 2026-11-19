Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124283;
	b=P/EwY1RCJvY49U6gyUSMFor1pIjdQ/9Os9o4jIBQdwo+0M3xPYOM0fSFiHiaxIUWQ24y
	 0ygHBPpBOXbkib33+Lg+OwppAtiPJEwYM1oQBaU0lDjDxqnySFnQ24q8gGq4YmKjI/t4V
	 eQC5mLTNONGxS4BxcdwaoikOAxnwstrisRVBXNWHTsmHQh5WHrUC9P3bcA3LDC93/tZxH
	 uUrse3s0jfnHdOuXIQer+Oa6A4y9XjB7RR0seTkXpmwBzR4X+9N2stooWDyk9ILJWFBTd
	 m5DZZf2QN5sVt44tVEqMnXb1EeX01ewiuFPTLy6eS6+uJJmEND3edLyAKq9isICCVVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+tXZIEcXVKBOgmJAGg+yO4C/ghlngG3VTAuvxGSGieQ=;
	b=IU/LRVZ1gCS4Dlp/PXGL3pHNFbfzb1aC+C0zOnRjAnDRucZAvOz6TPzS4WTaoT8p2+GQ
	 jLoGRjDBPrUbxrQ0pYJA8XlJ/VTTNaKKKagxW1lL8pGpoYp4yCPhqpyEOEXCfxgNlGi4Z
	 3lkODLusu3LeHsALYOjBL3OcDN2VlaL6nC9AQI0jV5DebV95vz/r/uc7q4QyJaC97SgPC
	 oLTW7Wp1ExcbiaczQYUOip4caKYnWtoG0runLK+0EBLs4AvjhVumqAuJqfPEenRt12rwl
	 KsKrUtDOl/Q2d6fNH9R0MRcqH3W/sh2Ljc2qoxfQx7EUxQuXoktGHnWiHwzDsyayWlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FA606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72FA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso251400a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124282; x=1795729082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+tXZIEcXVKBOgmJAGg+yO4C/ghlngG3VTAuvxGSGieQ=;
        b=1Ct+21b0lUZGdNkp8DGMg4YEuqB2TUUmAg6OOLXEeL2NrOTn/shGAv7LysgUZ1IWhd
         19i3BNEEnVVmbOGKnOE0YlRnJndpTIdYMSw1hRijDZLpwU8vpA/a15iGJmMOd+zdFI9v
         tLNkOu/yewqFEf5nWJqlXG/aI5II9FccirLWCszp5fCCnC6vAn9KqevSsdh2LskRf6e0
         LHVUlebexKLZrm+I848+DQWjrSzrpOPfQwVOqxK3kog3eFNq7FXCDLeAd03PVHQRkXam
         BN/v8CgtuwaGtr4X1LX8C8ctm9iU/lb3GD8mPUlEg9nHQHqP559jSuylxLq778ZQUJpf
         FswQ==
X-Forwarded-Encrypted: i=1; AL+hErHu3APbP9Ap6GdRDUBxE/1H5nC/NWUn/KuSRwzqJzMW6xUD7wk3vabusuuskoHCZXe4xPQQnRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jHWwzqH+oSmYhCo0VcDkVYiZNjWBdnrQ12yRuji3FYZdCRO+v
	riRhYomHlRUuTbzcG608VXmdC7Xd7vlICf3Ov065/xVovh447TLq2K6uWdCB5f+a
X-Gm-Gg: AZFdTZfGLSrAY7+pA7jGo78tb2GPDmhjCmHGV3jWztuvamDEeRGQQOw63EkODUCLSoj
	QEuDGvUjHHs+aSo9nv5nx94YNOv8Dm8NSxn8PnoRsUjWSbBey61+QhHrwPEM0OIz3FX/92UAFAe
	8PaT2GjMjnb6k+KwLeoQ5G0QTiOCf2XJBuFxGm8tixd7/3YsLbmyNUPkBWzgCLMXFHd0PxIFqms
	k7L4fuoJ7NP2odEqYRz7OPyfTPkHW/t7mIHmSW892SHp1Ajodj3BDGnkmIJsWigDRP7MjigWwjQ
	awm4PAafsgiHNVI84bDjnK8GNAtLScb7t0lPyqW1YwkK53W3dAlMmUSwU62T4rAYWQ7rC8S5YhH
	nXn7qiCWMvDHrIb3CfUfCaaYzBbpvsqU+70oyc3DQmGrY0vM2cBvVIvtaX1GetSkSWSn0wnWOBi
	Ru7gnJtYK95ifGrEynl1wFoJIAdqcrCIAwCLOzL2cxBhoBQ89IHnfTRGpaBtOsC8kG84x0B+EDs
	Rj1lhw0epGWZMRw+QiSUAs685oVnGOHA4ahkONlfq2JnbxMkmb0DD0GGmURlZFmyaiKSeF7vWXD
	USriOjLPjKrzlXNhYL/5OQFMj1RiZjEjMwPGM5uH0H5Kh1mbxFPyUnILQfuqwLNm1glnMvfCNtx
	yF/k7U0oMDGfSDul/ZP/DXSaUKKMgLQBfyJ6J1cPzwwvq
X-Received: by 2002:a17:90b:278c:b0:3b3:b0e5:57ee with SMTP id 98e67ed59e1d1-3b41c97ac48mr663491a91.54.1795124282105;
        Thu, 19 Nov 2026 13:38:02 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm314291a12.9.2026.11.19.13.38.00
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:38:01 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3282db206d3so469612eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:38:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHLlTRyGXOV8QwuTQkc/tTXpfrg9///UtGAQZgLn47JlEXXhTv56Dvt0WukSouru85Sqqphb3o=@vger.kernel.org
X-Received: by 2002:a05:7301:923:b0:36a:1709:458 with SMTP id
 5a478bee46e88-3856f859121mr685420eec.27.1795124280020; Thu, 19 Nov 2026
 13:38:00 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-b53-bpdu-mirror-v2-1-c39ab745730f@telaak.dev> <179512384634.3136.13428964502385964682@kernel.org>
In-Reply-To: <179512384634.3136.13428964502385964682@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 19 Nov 2026 16:37:49 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ53Cqu49fBk7qTU3uBSpJNM4zsfxozxse4Oi9fjU2-sAw@mail.gmail.com>
X-Gm-Features: AclHuK-2Q-gMJH4IlkEn1ipFjhxqZCbUaVAiID_5MLwXbdcal8bh219EYACPfj8
Message-ID: <CAPY4CJ53Cqu49fBk7qTU3uBSpJNM4zsfxozxse4Oi9fjU2-sAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: b53: mirror CPU-bound frames to
 port 5 when port 8 is unused
To: netdev-bot+sashiko@kernel.org
Cc: florian.fainelli@broadcom.com, jonas.gorski@gmail.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Can dsa_is_unused_port() tell such a board apart from one where port 8
> is wired inside the SoC and only disabled in DT?

No. On 5301x and 58xx port 8 is wired to gmac2, and boards that use
port 5 disable port 8 in DT, so v2 would enable it and force its link
up toward that MAC. v3 will set the mirror up only on the external
531x5 switches, and add Fixes: 4227ea91e265 for the standalone traffic.

pw-bot: cr

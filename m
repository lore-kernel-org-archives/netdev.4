Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966965;
	b=p7N3pSHF5AfxjtsD5ML2BOceYHvrUPcXqTa47mGC6F0qUPwPGyoPRKCrN8+04ccEwvn/
	 UBUdKcVw/m2qXARWjS5ftIKEyxfzsjm6FCy4jk6wVuPMOQ0JIs7CmA49mchPDanvomD2V
	 NFhXo/1gKfdaUssRPrvxzDIMzYbrte0B+rU35YJPi1A8IU1Qey5//yHnsyeifvjLTCJO6
	 iIWV3AM4DL0RWWxc+wUEppdPvk0eHD7ozgSR4oO0KB5M7BLilkDbTMZZ+EW1l8P5CgT9c
	 TUZ/AT0t257PK8PkWQlgJTyr4ZdgEWjdEhNaxCMkORchqwwtqCegJU/YUuD/3Wlhvpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
	b=weCcwW4ZPiWat8VkbBAhIbuQppkiw2GE8RSAW/4EV4TUXCBb3uJjpptGHD5MQTNn3Qw4
	 6y2b+4kdZGb0/ZpZD/rpCIcoBRuJXVpICGmIps7xERw6uxY62ZD6imr3nzMii18zuAc0q
	 eH8VZT+7o4vCQN1dgRYltL43jO7B4yFz4JYj36hKVWG8eWRnU4+H8VsnqCGx5k8r62ryF
	 ov32WZEzRQzTrFMn0+49YxQFYuDLV52CzcnLeF4hakCLiGdvqTihnmRg/KgtcF4+YIO3/
	 JqhDaChZsrg2j1YTvSg0UfISBiP7Ri68PUffxKbjlXm2GqbkX+kfW4/oXuDTCmqCKYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PgG4Qlw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A0A606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A0A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PgG4Qlw
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db35e7953so415423d50.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794966964; cv=none;
        d=google.com; s=arc-20260327;
        b=TsgApFPCGU5aH52nL1PA2cFtldvLHaAsZGEjL19tKBC1b4fk2HLFuaSUVIho91/W36
         LM/St0/E+arBPOmu3vbN2JAR5ARGQN6AsMc0I+XZGscmRDrOijYEbkUCX+VQCtUYX8ee
         dXTKhD940j9d7Ek+r7JmQ2lZbd5DE55l/7JefyF7XAbQGwzz5JZgDOiIbiabLpdpk0MA
         8EWFeZgkeh2CjOaepxhsUCJ6l2Q6fp8HcsX4rQRiL0LHOHfrsadpO61zz1tK7EveMphF
         Ka6dAWkQXXZ+fTtdypht4o6c0zNpAe8k3BbC8jfXd7YaE96CMyvXSK1TkWr1TTHPtBgZ
         vR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
        fh=VJXwTXBcObxsnKl5qhWPE/j4gIM5HRzj+eUyr/u5dVM=;
        b=S7ZTNvDQMOQuJMa25+KKdQ01+CNRgMnXeFH46CAJQ47XJyXjmXCKUljLPBBXyDiIiN
         5oyZOaAFXZaSB71+mt5/K0InKPxNca6TPxOP+Dh1ZNYYBL1HRAKdAFAQWccE3wDpvnry
         3AkO22gyFe2e/KK2gFzMT+x+/CQm7S4/tRZ62lVaLSB8faDNUARelawhDPhV+1Pn6MCB
         gMNgMfuNgEpkX1nDETXN9Kz+22YKogL01BjQUzPKXrPVcVR0+7Qm+e4m1vAgG0DzH3la
         VbS8I2rZMf2wtBCBlDUn0OZD72c8SJfA1eyV0kzGO+QtzxcV9d4Xicl+hVDYv/Zc2u5y
         jYkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966964; x=1795571764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
        b=0PgG4Qlw7lF/CxqAO/mhpfqQWgwoMdyyVbMSI3RIowTfZTNlRnA1F+IDegq/0QU2mo
         iU/0OHEKudUImQJg3wVL5FNFnRzDFSyqPiKVZxlsQqEVmrBt/+3S9tqHgLWfDGw3gdEw
         kYzbOGFz3F4uGQn79pgqx8Zah235LyWDQy/Q+//wXwhLjidKsWHp6rsDzFyKf9Y56SuX
         MqlXyIJm6N2cqHkDHy8RAKRAt38yJc3/B8m/YTXIlwA6swGvW3qecFASE+PXtLAFsgbH
         V2aWgu3SfyOTvTw0g6lfXmi45JT0PSc98UIHEg0m+fSnGyskJm3fQQLXVyBkafyyAzzl
         MamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966964; x=1795571764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2eyVexux7xZ2qLgWDwjsl1IL+COs4FsJsVc6uJeVnA=;
        b=fgdWdquSiAIA9e4XCes4uxYpfaxjD9M1JzQGiUug2ImN/H86RnsiJLrAUnu/BSzMr1
         +LluuuhRZfZji/fTCESDc3M+ytkQDsIAJC44yV0RFW5DRkLNGIh4aq23FV107vXYUJcV
         oWwOO/4SjC99gGZ3P1MIAxlzVoSAptUqB1wzdkHmBEdnEnhhWa29su2D+fzQv4HP6w34
         mS69+TwrQhSPxNJN9pMZiKuUB1UARHT8Y1Mqw3heVGswVtz+wPA4bYnIhn/e/LrBroU6
         eMe5daIZRCwZ4xkflZmMAkU/CBUC+QshiZHXpmshapNVR+gwvH0zz2bioIrLMRkD/Xpc
         648g==
X-Forwarded-Encrypted: i=1; AL+hErHuN9JAIjfE3ly72LKxitri7KMzlKvOlnL51H7OhEl0BO9ZCWl00bjchoCUa2N07g+5bUwgHYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E0dPUTZEIy9h87O+qyFbgaV7jjrtcyD1TT4JcoLHgZRPKhENb
	Cjy0fZfpKpm40KVbJarwgGSXF1+GuVTMTZFznEX6W7nrXLF96ZihHRI5ej8da8OhE+z14R2ETQM
	YKOGZNRY8Ls12hmrDymJSpAS2g0r/LSo=
X-Gm-Gg: AZFdTZfVjN5JpZ2k34EVyyxkxugJ8E+Ry2C0qg2ZVPsXTP+Kjm9MVsPDWl/eLv+x9xx
	X79hZhC2QCW41poCqHKlnf5m5nglSIIjEj1bBzGywNX7j95EDd9KlWajgWbXH+4RGdEF6e8hLXw
	zPmAZ9PGejPLt1Sv3APmbiA0DHhX/n5/ghr/vE9UCbYvtN++xB09nxTeRqNzbnZoRQF+I0j77dc
	kCcHe2/jev57Ie/tozN9qCMVGCBHCOVQKfg2PcncftlWX0w8cAzaf9R7cPwdZEGirEhHtR+Dmkq
	ZOX1Tf/IM02PUqdY8wG2ygJ1r+tncG659gNzJMtzyq5CtHg61mV4zxkp26ntDVUUMXULrp1n8ru
	SfzHdnCK8EWZ/88Ps4QuXDPjo255FTiG3vHY0y4QEVVGh8xie4o1g6b5Tf5vWzedFZ5YQS7aGdt
	4uEL9dupo1UeqZo3YMLw==
X-Received: by 2002:a05:690e:4086:b0:67d:be72:8776 with SMTP id
 956f58d0204a3-67dd45ea00amr463913d50.91.1794966964498; Tue, 17 Nov 2026
 17:56:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com> <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
In-Reply-To: <bee46abf-f05f-4ea4-9797-f47adf8c78e7@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Tue, 17 Nov 2026 22:55:53 -0300
X-Gm-Features: AclHuK9EWKO0TFISSwiSK9OFoeyFR4IjX0irTWLTwRxNcN1S8kecosOA6iRlcK0
Message-ID: <CAK+kzgxnKDWi=Fp-5t5_JjN9dwARTgeoHP+XvryPQ1w_gkRn5Q@mail.gmail.com>
Subject: Re: [PATCH net-next v11 08/13] net: dsa: realtek: rtl8365mb: refactor
 PVID handling
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on family D only (RTL8367S-VB, TP-Link EX511 v2): the PVID paths
now reached through the family info behave as with v10, PVIDs set and
cleared on access ports, untagged and priority-tagged frames handled per
PVID, deleting another VLAN keeps the PVID. The family C implementation
is not exercised here.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo

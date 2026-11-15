Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765487;
	b=GMS9dBX6M28++OXV9Vin1+iVJb9LMaa3n5Qj6vVcgwHlgGrO9rxzrmfkZOaTHdHwwht4
	 yisX9qPP1PWovRgezmeqYZIvEee6MeW9Gi7Xflfg8YZEzcIrHeBVZ1Ou/hod+YlKiW+PZ
	 FNSMRcmx9RHB6hZk66KGA91IoQNjn0h2dngUyLd+KzFNp4xSeBxmWkp2f0Drv3UNP5eFQ
	 7B5h0m0WwozoBje+QDWurtmDbAe8tw/vfMIrvfwGmuz4DlCilIpHHuv1CO2BpfRfcEJqE
	 7D8dijO4sU1+zw1ELSu2zqd+T8ZCN7q36+xYiwO8FWYutmHnFCCITZsqBNH2Unq6TMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
	b=p7DKEvRRcbAAf4rd14tf256V9CoM/YcOqtIcq360opLAtv7Zkh7+gMpmTdHw1NW3u+QO
	 TttPQP5L1YHQvYTolEqCihMO/7Df6CfMcthtdbolk0Kh+z8r+uvFr4oj4IJh3fVWwV3sn
	 DEZ8JJAAF77W9OEyc5VVTsy+6Pi7bhWv22mlvZYQRnzSgK92PIEFWwW5a6MZ2TqBIvugu
	 HcGh/5fKFQKFyqs5S+iMMgho45dzEeSmELYoMI14ETQ42ptmlrnSBfb+EXBbvdcLn9QLi
	 h4Npkz14krqiZcjlGim1v9Jc9LHokTsY10beQhqidSk7lqfuBse5KVZgmWPhdeu3DjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UMJw813N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01C606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E01C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UMJw813N
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67db5e13b0cso222900d50.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 09:58:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765485; cv=none;
        d=google.com; s=arc-20260327;
        b=EyiENdn/0c6Y+4fWHFdU3/tF7URGQdvUfOZ5uoEHhMbMs70ZI/J809le0k3ZI99Fmm
         gA7l2QD6H094zNZ6xqFQwo5cFTv7XWm7VhipI9SN00Vljw65c07iyK5bYJ9234UZk8PX
         0hXE1A+tinUTlZA0fapuUfmJ2jeKOZTc/mQ9DxLdirKhb8d8VjZ0QKhdR4l1wg2rXyYo
         9FQVf2ERMFR9G7VOX1DhI3z6Bb8noubie+3hOvy4HzJtwgUceQvBnT92ADRkxZ1PKEBk
         KpHC8MpMBRR1TDzXMpEqJZ4NyVNPx+PR5jKv2RHV/aAzvi3FgKeLfYacwLB6vFjEB2/Y
         7lgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        fh=w7uHhgaDJQpoZLfHruSXLU06DCPmasfvNLWW42FppT8=;
        b=G/JIjL8wUiYAHn/6tm9MJ1NMIj5fFkpp745chlGWElAycFkWtx79dflIxHbl1ssgZj
         nSrGXypTuAMCsMo8L8rXwIt/4lPO5DEzz+Y5Qq+H6dbBF2dkQCG2wR2QYhItHrsEJ1Pu
         PzV6ag5Uj+gypfmeZnB/zLDtAHm1sMAumN+X3Qj40iS2aZcmVPxWOwINlEQdaT4LRjM2
         Wylorbba9AoGPUp0788CvQUJPVDNDLW4r2aRtqgtlZZWHN4cSH+cif6PLqADJ32Ji2L6
         WparZXffRTu2AfSI9PRLhTJmWbBxZ3hhhjC1yrjtjqrw+DKkkwUQEK1qZ8R/fI/XJlwW
         CUZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765485; x=1795370285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=UMJw813NaHp2fp6GmFJEff+sL10VP1gPjYCiJH+OebAxKxF4/haNwCNOZVgE3x8Hsz
         YoID5uBXWYsSL+Xefhx5dU31eW0jDmxlRjsIkwD7vgjEshvRnN7X/hx3MHRrdkNNeOCW
         dj0EvTOlqMvpSvOzfmIoMeut65M6YYPOLfyfoVNW3mMTwXnNcbvGHwykkQ3zB84ZM36w
         1xiDvW64PrJLN7niDMEYHv12teBDEP3RWJgJ1FPrWLNqfTUhgTFwyTv/7D/yov+oim23
         Me/+GAb1wMtADSz5Y7FtMjMOp9pRHW2YJ/z336YKZoFynJXlX0eQikruMka/4QDeLURe
         S7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765485; x=1795370285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6EkiZTsrK4weHp4bp257FUTfMCYoyNr2SVzcxt+tW8=;
        b=0ehEMiGy3Sj1PuUlhy26wGGBoZA7Trh0FcMS5Q+aMuh5Iobd+yzYhPxbMGHii3PoWQ
         O/G7iPH5ZQtR4KkDPnc+3I+Mc7XfBiphZpe0nflXLvgdSu/pIg8Sv5p1dbboQzelQGL1
         oQOK0IU9exieUVBbyLkN0dSIb8wuP2w3uHlihtJDOVnsMqyJL8TS/J3FqJJJ1CPtGYA/
         nf480mVHem04tT4SD6NzegFm1U84vxnMLU/h4X1Q++HNiKgPZpurx6d6PKRO6h3h1nQL
         axL3fIOaCTJKo2sUh0fjqvursgVP8jRg8c2NM/QoVFCFBI8Gdu7vNotDI+lHDwlfK+8/
         JpKw==
X-Forwarded-Encrypted: i=1; AL+hErF0ZfrJWSsrAhaQCiEv6VLol7Nn2xxqFNZtf/86RSZd/Y3D43xDy/R/gt5TY3Vj5UGS08ACUb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvrkKWeqTbMLgoXVdmCdfPH8boRTByrV7/Qb6w9TTVHazwPAH
	DxUsMrQCCn/SDMnfSJnHur2QiJntg6z6ztWe4Qas2TOpyQZt95cwDk6txewSajflUNF017sEP83
	7D9ooJEfBt8BAejE7xu0nploH1lMxRh8=
X-Gm-Gg: AYBFou1+3fxpYHP5nFK8oQid5GcNG7MJCAtXJRSeWkoB+m2ZLYkeXtj3qhJJW61RGYs
	SY9XYxTXwcrBt5YHlYCPIOzbbovjCcqNV9RUWh/+xlqoqcxPuFYsuTAcqKZcNXo0vaIoYm2YB4f
	FXLBXz7MCpACEz2TUeaTRc5tx4PPDhkj48CWdq0tAZV4hinKMlDUVGLksNeFtZcZvhgb7xYg5xC
	muikEfo38jpCC9jkDe4scwRtnKK19ehUROyOhzrT/e1styGnUWIYTAQr0QnPkUUfOohdqdeqy7H
	eT5a5pPzk9Ey7RazgfR7Bh8upb8GUIhq1y7X7NyeMTezvsgZ8sAXWvSM2hoCxeZcNSPsNFwkODm
	YKKdK8FtTgJBSiTZTfEnnz/pBtiQ3rusisPxKg4Lbpa08NAqGP4tdBjWMmQEBzTaWzI2MHA==
X-Received: by 2002:a05:690e:803:10b0:679:af57:d19e with SMTP id
 956f58d0204a3-67d89661b52mr2605986d50.45.1794765485479; Sun, 15 Nov 2026
 09:58:05 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-5-tanure@linux.com>
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 18:57:54 +0100
X-Gm-Features: AclHuK9m7YW9F8wMPiMsA7yThjtGjePZoU8lN6bMh8Ee4d6dZkum7e9qCRT0s2I
Message-ID: <CAFBinCA7XhksQaTHoGP3jCCeSCBdwAYgamW2AfPTdK0ncSCzCw@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
>
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

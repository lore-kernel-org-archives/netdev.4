Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794765740;
	b=HdqoHGzsbVSWayF2x2vIKkQFeemehQIFgaT0HGeE369XLlhlxqe+9RvhYPLRTGeoyCeZ
	 dHUiLe6sxjwzDt+S2t3IRfPHDxlG9LrsZaYDbVWYUFCw1ZAfvSFlkvH+5+hCObcJXo3ne
	 s6IQ59hkldajSijn4TRwxe/SIJGzzFwXZXr8aCML1ZamiCLjbDbJmbVQkzMYrqIaZhhwg
	 +SsGVZOb6KX47dpHlpRJFe4WvK3iMfw5APlUYqXqOhtE535i6Wv57s7fKJuinfmeO7K/A
	 YgfR5gEHD1xU0QnHHLJo8azkcRBoImwD7aUi8DxFuifmcDs2dKr8YQp2DSTHl/UglkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
	b=1Lp5WT3hw8GAxAUlOiCMty3yK6hgtpmStAD2xF/htEeED9vbSHs//ED4d7JHEnqoRiGf
	 dspnJm3ewz7pDmhk/zzgFBZ6NyA8PvtnpGCwOJyLUYbeUvjyLONcmglRmkyfhG8IWIh9H
	 r25FE7Vm/f7C3I0LCUuGkm68j/MDeOYESBu2SQJ5Kymo+mZTx6YXcwK/DUQaayxhIaEgb
	 cIp1NBIKcGptpoUhBwo0C4M5Dk+BqvmvSgdDK7kmrn2yprEIgbZukQLqd6WhFRhvtJ/v8
	 7MD5YG5Qovc/D9R8wTNbMKOli2jykQWA8+toZr69r8y3934g5KUI8JtoHX4LYHVFnrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=trcjy1Js;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E04606A327
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E04606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=trcjy1Js
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67da7d18f2fso873646d50.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 10:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794765739; cv=none;
        d=google.com; s=arc-20260327;
        b=DhwEPvsznUh8cEwpt5Ryl9muuRG9uY6lgfYD0C9vHygeDa4tZHtfx44cnvs2WXTCVx
         jmnyhyER+bjaIj9Wy3cKsWg0XtQwHv4vPObSwatOGfiHATPsBFcLnSMkH/GIdWD3+Vlm
         yt48V4i4abHkVpnYCyVEOOfEspmoNG9FyzUj7tg3adosOJRpyMZaC6jSRf67aw1+UJWn
         eRMIfnqwQnTe/02iZ/UEbcLssf6ucKTrtwTIjop03lBOf4bjgrqiW25ZnRwfsQt8fmUv
         kGs78MkEX1OgY4eH51HlPtQwDjwMY4/EonyLd4WKpTyZaxnLsmCwqCbQwfZH1N6AtD0u
         C5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        fh=PZYdpToSq1kNM9Cu5UtbjMdV15TYdjSRZq4ARS3Z5sg=;
        b=ZThDqkxZwn7Nl4hVKWzlpn9trkF1nU825j6++1OZL5ZJ9wxX4EPSicU/E836kKIWbg
         F2Ufq8GRKbMOPEI4xf6BuKAn6AUDc+dmRUb4q+7h+7s64pCYhjpPn7bQPb6TIAH/KMCa
         jaHGK8rm6niJGQkoZ5g5O6USQmaWFrtoznmOPrtxgoRCW7Opj1rUa353nZKVNDvkYgCc
         LskWzCql12+sObEV70urit8csUYLRmvgUyqKPNL5Pci60qYPNnv/Z1rWIo5tFFwMtLD6
         X5lPbs0PO41sbaLRrYVHg5wneScu0Cuz0pFMzyQVV69yxZGw+FlyLEFDQX+RDaW66lUs
         lu9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794765739; x=1795370539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=trcjy1Jsu6uraAxeRq1k2El7wn6wlXZF2ZLBh9CCWP5wataRKIvera4oeEeA9Z1su2
         s9rEizFFkNLrERo4aaXhfnjn9AWhTpvcK1Yv9W0dwusaSCKr1DmtYB4pptoKFiiVgmtB
         7hGbZtwRP+sl5/0vR4DNalGHry3ANAx1LFtAl7jvxdJbXSEuMHW8hiy13yP8hv9Xt/Cv
         CPD6SmiUfnDj9w2N5G5lbCdciKToWR/8X2PQEb2Hc/GXJJ4Yxrt8NzSvaMVaXY9adj0r
         kQLWGvZTOyb6rns6/kjEKSUdPkshaXES9quCICOwsSJfLfP+Gk90Je4Ts65VttVf4grr
         oFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765739; x=1795370539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLexbnWyTvjn94KDBFaQzivLM34q5OtBuqgOMwsa1pM=;
        b=HA3XaBHtlMk6MsO9ceIT3iT/jywgQ8A7qcF19/E328kHn2HLf5rSwAz8AQY35pdhzy
         j6BVWhC3TPCnJ6cGfYyI5syl62RoVcFCyDG/mGovBj0t4Y+lKuuztBVzqwkc9cxjxVuM
         tzGMU2Q+uXuFsKTpiow0YiCX4wvGEKOtIHAhpe5GOFV4lu8xMlZR539Sfv15iJ+wuYO/
         DawcNe3oir94bjI6sqy4KuJZhxUMJwhxRO/La8GSDOqxnc+TMZi7Oo91VncX5ujHb9Oq
         hw/K3enQln3Iq+NuVtgBwS+U3oPHkLRGsHwI8O2byn0meT5s6yDjbzlcan5oQovSh+KB
         ZnsA==
X-Forwarded-Encrypted: i=1; AL+hErG1s/4BR2GNE8TcOh+zcFCpuQKVLPVPEfJZtrmX+ikfCWT6R8EKob5NJ9I7bXZvuHJHMsK/ayg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wK1IfB5UkAtM1rnlaBohRWl9go7FTeWM8QyabFXI0RBBR+8pP
	+DFN/Zg4XZC4TIKLkEP6DraBTIiCAVxn0iWOhDPHctJRR8B1JohGSeKieWiPS9TUOLTBk2Z8GVr
	oIUr9Gp6OCgHq2IOqQfFvYsXhX2ygIeo=
X-Gm-Gg: AYBFou1E9csFVKLti4tZeEoY/WX8iYm4zW5Egvo9cNBHxuS1VvjPiBAlFNFWGvPRmx+
	HCzCrHkryOo523KmrFQdxG/TRd95f0ORBJYH7GhF1NPaTXvFcRk3nUNpTC7VmdL3kIqAyJkdH4B
	3cD7nJTXLRE/Zf97YKkXcmHt7aUt0wfpPtHaBuPOZyfhQ7SY1gZCLRWzQNzbQDGjMf3XVIeGCmE
	593yVE/ivoMeZdWoRAIgg5Etcgn00LgpiTWAQXyqSdlVh2zvoteeThR0U64H2iwEjre8fRuDJ4L
	UlUbJ7BU5rIgiUpc+PZHp0lHcOsj6zfAPsNMFB2tIx+iSfgdeFcBQtnF7hSfg2tjNDRdxtJY2nF
	O+qIA9+KuCxTVVWMCL00Ql/6uFRCbbSiPmjar5JzL30sI5b6nK3kEppcjJ/MnD+WuOWnVRA==
X-Received: by 2002:a05:690e:c8b:b0:67d:9fef:d62e with SMTP id
 956f58d0204a3-67d9fefe0ebmr2566936d50.6.1794765738737; Sun, 15 Nov 2026
 10:02:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-7-tanure@linux.com>
In-Reply-To: <20261113121852.334604-7-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:02:07 +0100
X-Gm-Features: AclHuK982JSfMQyLz3Nt-omny5MSefKP7dqRCWJKkI82T-Lx69OJ3UT6uTKWWOc
Message-ID: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +                       eth_phy: mdio-multiplexer@28000 {
> +                               compatible =3D "amlogic,g12a-mdio-mux";
I think this has to get a T7 specific compatible string (dt-bindings
only, no driver change needed):
  compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";

If we find differences in T7's mdio-mux compared to G12A then we'll be
able to manage them.

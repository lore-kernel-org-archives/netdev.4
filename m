Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296432;
	b=2N94TDaPoMhC2vYqvRo55+MXWRIwqwao6V8tAR8DFoD4dBbIr92+b9Ym06P1Ggthoxcg
	 Qkif0eNmm4VO9vTKiYvjpgXYZ5GEVmBQWYtBR6V3wJtOclfsZWifX3N2Csqc8P8knkMpI
	 U1NZ+kW+4QphbBunyOzeqRiXitrLN/9Sf319pxFYUM9nB8mVTJd/yHSk2HC7gQfHAuHeX
	 qyi8ghJMvZNUhIr8J9rRmlx1r4YdLWmOECYz9ZK5xvENlQKOjPICxhXXF1rHY0HZfMx3K
	 TBjJwEetqu5U42E+KLCJE+vjIcpbioOkB+/CY9D/TANDcGGPGLoNWVIlYBKwxxNBVLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296432;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
	b=xE1Ye95NzKFHlw4zET7p7qP+PL8IWTRTsaBQncZxx4LVta66KYjjmnNl7wVaBiOiwSMg
	 Yp+ujo4WTrwPp6Z4QF7ZRYsiFdZyzSEMcrDknexYd9izPqYBXmIE7A6dIgXRS/RpQiM4T
	 WBw1WEtB7ga9rx/RgK5VwNTbmJkqu/55y/Fdey7vlf6qO68A5fvwD1mEe/Gx4/jy5mGYS
	 0QYJLG8J7hdqWrqpygC18c5M4dwURAkIPfOs5y8mpdLPighE56hSlxnPjbZWsAJtXF+jC
	 0KV1Ook8eew/YFRwjGDZ9P4wFIx7YI/luJSqIR2ZZtVp0WsoPqqwFhyTZAPvoD8EGzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CFF606A333
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 21:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03CFF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2062564d50.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296431; x=1795901231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLPdwXc/aJvHEChEYmLlCcJA1K0ap0UNibPU2Yd3+IU=;
        b=g7J8EXY58xoWnwKUbQZueX2RNqos6OPdnI6Zz/lrmxLElSS3sLtpNigxoDjtKf0hAe
         t354vk4jLMl1fVSuRhqNf+WaqUxakYK+sdNnuMIndkxh5goeVdmR3Zd+kFjXItv0I68O
         2WkrC4CAA8/EutEg7b9aNJji+Ggrvgmy95KtZxoI7W3hb5ijJ3wZBhgnyRvliBL9InBo
         PiAa9XZUNCitqDADTRg08WmUrSkQRelC62Qg3zEqSqml2WuwZ1mixnpL/tdwLX/UCc2J
         BaBUmmdbPa2S+8ZEE4eIODliqF2feD2NXAJXgG+L9rCF9W/CxMsDq/GFcBIj/BrvpWQX
         85/w==
X-Forwarded-Encrypted: i=1; AL+hErHPGnQvyLIA+voZLEtl+BvyykEL59CnrCCzkekjGtjUHiqqaLtiM53uTKlRKTKVBdPvRpUUqWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ke1hgTCwwK0fbauLjBh4wC5RrqvCJwU64d/5pwzew27li0/d3
	pQxgLQs9De1ZwsXHtUkGtaor87GA+saM6u9c+jlzIcRLH6CQwuWdWDxInY0mavXD
X-Gm-Gg: AZFdTZeagtdWw0fy6xQCvaVYuOcLuB1h6gFS8vttGw6T5APVMJ7B1R21hCmhPy8WwqL
	/mHQgjWRyEAr7F4cYYnpWhy34VyHyctxz0ERonTox+9gVkJ8GbxV85XXJwcl8vNEA/3YcA3sCLH
	6/2v/AMs42FiryzNoDJb1TGIKd8UvebHDpyGnOQ4IMUtRpk6ogAveNctA2oB0q4sOAv7V4JD86b
	7jbj7vEhUXigGld9NX2H1j2fCjswZ8/+3WCRfzsYL71mGcIRoxOZ5lsC0arrt3L6x5P0iL6RXfF
	nHZnVa9SqTUIMj6W3MidbQMTi2a/XFOSVjsWIuW/Vr7lonjqivbJhBaH3FW+1Bo9eHKoG11Or+L
	ke5mRhILASsYXQceGryyXfKFQ3/bqAsajhQZAFskmAaEcLDiKTKvb097plQpVDFyqyKG29TwXa2
	FfPjcdPq6GPmgHogIH69z/dOXSqE4R/Q9wk8CsdWg3xkNbcAV+tvnFBWuQWIHOhNQBcCnjNHBp7
	u6F86FtjT/agpdT4jbOwQzv374ClRg/VWr+35DnsO00w0E1QaIeZgHHT6IavzjfOySFfZHfYb/a
	Gf4AzLEvh0E4lWDSudwIbgAXOoWr0DB8Q+8Jicmd9v0BaUGexoB5Fsl21Bs0Q+uVTLRpbPaTpzg
	30gNJeAg8rUoQKJNFBXtOn6VZNygYhMCOg+gfl0y3/S0DfrdBHIgA+6g9bw==
X-Received: by 2002:a05:690e:440c:b0:67d:b4ba:b4c5 with SMTP id 956f58d0204a3-67df4422c12mr1566068d50.31.1795296431074;
        Sat, 21 Nov 2026 13:27:11 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df337bfd7sm3547464d50.15.2026.11.21.13.27.09
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 13:27:10 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4d543b6b6so11464007b3.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:27:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIL6xwxr/YR9AMsASW9p5/6d8HwMF0hFjsBk/XaDyN8sRBwtxVakfNhl3QYIe0w2SpInBFXMA=@vger.kernel.org
X-Received: by 2002:a05:690c:6c92:b0:8b3:7782:675f with SMTP id
 00721157ae682-8b5204bb6b2mr23239647b3.66.1795296429324; Sat, 21 Nov 2026
 13:27:09 -0800 (PST)
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
 <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
In-Reply-To: <CAFBinCBFfs85ZgYLq0Hbx-E22twLYMZztk3inRuRLaBB+MXsOg@mail.gmail.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sat, 21 Nov 2026 21:26:57 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
X-Gm-Features: Aa3M54q0-4I4quSKRWB1j7w8Nv6x5L8DyHdNe8I0CVnAIjNuxS8ecYBkoD_MhLQ
Message-ID: <CAJX_Q+3eB5K3UjfPHnsD8OrCg6GA8zOLWVdfFONFT_aociTCrw@mail.gmail.com>
Subject: Re: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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

On Sun, Nov 15, 2026 at 6:02=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Fri, Nov 13, 2026 at 1:18=E2=80=AFPM Lucas Tanure <tanure@linux.com> w=
rote:
> [...]
> > +                       eth_phy: mdio-multiplexer@28000 {
> > +                               compatible =3D "amlogic,g12a-mdio-mux";
> I think this has to get a T7 specific compatible string (dt-bindings
> only, no driver change needed):
>   compatible =3D "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
>
> If we find differences in T7's mdio-mux compared to G12A then we'll be
> able to manage them.

Done in v8: a new first patch adds "amlogic,t7-mdio-mux" to
amlogic,g12a-mdio-mux.yaml with the G12A string as fallback, and the
node uses both. No driver change.

Thanks,
Lucas

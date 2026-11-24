Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556328;
	b=y63jW10W4b6pUY2ZtCvJFu0szScPNFKMsjV0mL/Og/MTcxE/ucT2A7NYdc/zOU1mLjMU
	 BuaK1zqtycQTb+EWbB1STFvGSHCBV8Zk2112GJB09BsSXMuFBTYiiZQ/ugD3pizRWSz6U
	 Mxd5RQlRdvDi7Vza00nrxGntW89qRGaBON/elfl5kARINO2d9zUHImmSmk9GeWZTVRRkW
	 XrqcfhfZKGILwdgOBcVCLHJiy36L/Fpc93y98+m4dGhhfY3D2AKSqCG2TM+eiS4KqdcXt
	 EoNmB/WwOhVMcO7DPG1Q3wH+z5ZysIGNBRMG0LknBvfxkPglKcD7/DNy59jT2meESbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
	b=Wy+BPPbzRpGZoA/n9QO5/1DiTIvxzfWDigm9aaRm/01+DlexSy3VeARXOithfsi24LYZ
	 j4X4wdd1PJjQPpisNQ79Q/UVVYiBy0TBFzo2zh5cneKzx1t5OMTZXjmora73c6XGDYNz7
	 vTIKF6VI+18ji8OIy1H/r5kJBMHp2kVS1JRekWakgsWwAecjp34cYCVwdfXQa1QjEd3KR
	 kf0OaVOJn5kmBO+V63NOjw6grbyVQtYOUuRrX1/8ts/pwoez0KivldXcRM4Wf5ZEM2HrP
	 sKTdZQgC5dgEECEulSRwTUP3gKDrzbCz2BxjVG+uQxJyP9BaGTDf2Dyl11SSz2uHCbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=MRQzwtKc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7D6606A6A6
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7D6606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=MRQzwtKc
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4dbdc9592so14440277b3.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556327; cv=none;
        d=google.com; s=arc-20260327;
        b=PiNcSl8vO5ztC/IMXE7Hys6k0Y5ahUfqlekqrUurSKTAKs1yPGV+dNWqV/x76NL5oh
         3rdxgwEXkwAqubIUzvY3DZ8Nji/f0SiyCZbeqc1B8RwizTE3xhKjc0vUa6Nh2aZsE/wv
         a6mVZ5rOlUr1esPClt8hN1p9Z62jVdYhIVp7MV36J+5yOyKP4d111IQFTDVV5BDldlGv
         ql3xaSMiu7IMm03MB7+d1+HUrHsHc1g6sa/nsfNQgsoOGG8Rlvqxs0C7IpqYh+KmZN8h
         zXR3qQJ+rtHHDcaVTlwFrYzv3kgYjmOhXWa042FohXgg8YtKf6Tksv5aswzZPu0UP9XT
         ttLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        fh=W/lj0JZjGhNgLPmpZuYFOzMRALEmYDWW38KFfJUxKxA=;
        b=HBiXzThetXOr9V0grpsrBxpCZpe6ve3kRIOrIcwLiDe292Jio0IefB7b2uNcpWlcJc
         34AEr/A4GIeKZw1waCteSJMFD0cQdEzpWrpKZtRkkV3dC+NRpRP4HTBeqYzAPWXF4FVH
         XzA3ZUtLAHSKVPVI6iQbwNp06FCIJfmwisGW6XZQyaTax/A1km5Q8J5D6x5ySe8kiTS1
         dcLRMp9MCtdZPmoRuJtc5PLsP92SzehbgpF24ZaE+Ki2lx2FAL5jVT/JwYFnjTzxtCC1
         wzQIWzQoOibEw9B/0vWGsvhd6UCNqWIejg+TaIGlE5Tm/D0Zfkw5Z9IsI1ZnV5YOGSjn
         nlRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556327; x=1796161127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=MRQzwtKcpvuLUX7gVFRmvaBf8z7TwF++fqSkjnaqL1tkiZF2n360rRhGPODzSqMsnz
         zS37yyGaj2vH/anO7WJ+uamepQe28WsybHNyBjInK1z3ONzdi2zK1+uppWvMUg7wik0m
         gcJBvoj3c5yvQ34d0DjEotBoOJUdjYa8+PP5o5lvgotgvWd9/6I1uk+Ii284UD6vy2cB
         w4mqTszc8iSfhtwpprCcjmziMe72Tivt6bN/SKVnsWn4GLlcPszevwZc2jygNhGIO8D3
         CzuSGzzrhmPt9HboLdYrw/LCjRk/imUgqoxKarwk38lmHJ13AjqTP3iCI/G96LY6lW2H
         Weaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556327; x=1796161127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=zT+wlRtGVezsWb1fhKRyLoI8/55jb+0SHK70FgnntvfeUueT1Iu0s9SAnkNT6+EzvD
         W37/7goj9Nj+R7JGO+IFe6cvi2jh3L7d9mOK0eHENCXu5yE6yYtUSiod/v/j0elq7mm9
         9ejyNh4Uvnevbb2QkYgm3Bik1W0wJ/6TQGqB4dnhVI+IiNnOTLQ/oL3Q0nf05J4R0Vbl
         qM3uuvY2PAZU1WcejiLpfhXwZ6RMWQ3fZa289Ab6ZFCeT+H7aDf3NQ46ltYDPB3zobT6
         VKkD/7F9XuH8A7S3LKUqJsvms81kFgloIIaXjFiXnA6qmFPuDGmCEUCseh64YsN4+0Mg
         +3lw==
X-Forwarded-Encrypted: i=1; AL+hErGMugQiUakwYd0heoURLtn6JzpmQg5w1GipoVSAFnymWdy9+eQx1Bs5mUR7HuatWt+nu78EhHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dQCUw1ehn3BoLAJd1Z9slPXFXE9OlPjX5HZpiXsB085F1Nyhp
	4Cd0/FXfew6cmVjzQ9P17fgO2N9xedJTI1sGzNPnF0/j61Kfpu0eE3FD2iO7ceWmmGDFFs5v8Ex
	S3lFBFjDKFp35Zr0kTX+qqQqhvDcZ9K8=
X-Gm-Gg: AZFdTZdC5B1n1tdYlbQl26gPztAqGRx5wxrQYV8nHRN1/P8BnbZoNK8szt2YxmhPPvt
	oE+TKZ1aN1bJHPTwNsQRgcIrxB77d8d8Yb81D8GdMrVkFLU/GY77w/qK26jjtc0XBoPzbX2xpbc
	L7FfzK8bsJty4HXDIs0506Qq94YS5hxVEjbJFUUgSzeut4r6B9ddNpwjHBoNm7L11St3dizUzNt
	o/KtbETPeE5iE+6lgfFpehINw/yxdbBN049b3NddXPAOzTVo72Sv6IzJBnzNjLEwB7HUguarvFu
	/8C093QFSGO1upKgQxNEmI0URZRqBjrnFY/WCruGvttZZN8WE8Iw3ZGbQLoEz+FGCQ9AFty4Zs4
	7ONRg6n2wtV4Z5UU8uTwqgtn6biPY+6K+WdkG1Zas2Hn7W1a/tbN8kLF7hIa7ey1pGHzdDQ==
X-Received: by 2002:a05:690c:a89:b0:8b4:c1ef:db88 with SMTP id
 00721157ae682-8b5204dc558mr63502567b3.40.1795556326911; Tue, 24 Nov 2026
 13:38:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:38:36 +0100
X-Gm-Features: Aa3M54pH5ipmAt51OQad9aGPrJTAjEJ236HllU0tqVNlknXoe88HjErnJUF6ArA
Message-ID: <CAFBinCD+JwU4mdgE54r0_XT8K5eMt2rjKQ9+3Pnt9V2nviH-fw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, iav@iav.lv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:37=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +                               int_mdio: mdio@1 {
> > +                                       reg =3D <1>;
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       status =3D "disabled";
> Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
Sorry, I forgot to Cc him :-(
Now he's actually looped in

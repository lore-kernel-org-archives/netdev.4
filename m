Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693504;
	b=sB4DR8gXTcsDUtKzt8RJIARyGUvOeRdi30ENx3T4d/2Cpd3QcQS+3yovaPiuJ1TEO5Nz
	 GLjF34s6iYwcZgJWS5gt1lhKW4E7dQ0NUsfe1lo5wz9KXmflTiCdIxYKJVIFCU1LfDUPu
	 DGnQIVYPH5sATH/cDJdm6cbQFYz/Ai+DdppnKs6d8cswYhWWubhPuii2AiqxtqN0BxtZJ
	 DaPAOcI247hErAdN81MnlRvS7rhKO+zZBvBzH/FhJ3orY2wEA6lXK/FoU6ByM14KYjDCh
	 FdLhGFqHZTDDHYfocR0vju+uVcMILjULLWVcZlaNe7gCMT3qiVlYfiXFmrNYY5UjOxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693504;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
	b=gx15kdwfLydXbLwjwKI+tNk3FX7mNTpCBCFfz06g3fko2WU/DE8+6qqHk1d5Rd/55+2Q
	 60dM0dMLteP3Y3yKvygVQfARYF+IaXFAb3kFUseC3wnd6yP9dWsB4cF66j5d+l/m04FkT
	 6qL7NKd0Cr8Q98zqTnLkr256YahJxhRL0gjKkCkBMuBvLjKNC5gBGIP47RF6M4DEYRYPf
	 Tr6SC6c5dYB6qRIAEJtrk29r4iyGD7K+npc6NqAlWDMgZJ+Xvw3lBGtw4hRPSD6Ymbq3c
	 d0mGnC5RUQxwovNpc6d7UJVEHDP0Df2rmDGCOh/q+BccYgIhda1KrtwmGcv9hOuz09w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE8606A33D
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FE8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-677bc4704cbso8107266d50.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693503; x=1796298303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/w9woKIDcG1KIzz6jIjSge7TDzANIjKjukbxSS5bGE=;
        b=k3Y5p0JKturBJeZ95wI9Dl/1YlWcMgJjEFCo+jqQph7Ipm9XBTw8ByQb3J+97OJze9
         oHXZZpu9iloYoZDUAOhDWojgVusN/WipfEClF4QeDmcpRjnVCCPoABwZQyHjCaHM2YfL
         8klhhwEHgmHUZcJ6ULGXoZiZzSeeYuhy8X7sUOEB9th9TM26NaLlXa/Mk0bBSLGgBp+p
         vAIMcySVj5d7ZlKfS9ogqhaXwxgvPM3OgZ04LqmYG4MeJBAqFlC0hVdiXo9oUWzRC1uW
         D/oKPD0mgXIejBGX6R0q9UvfBR769uLeQ20+rnFX4hp5hVjPq7GDtwWqBTGBPW7tjwAm
         f5zw==
X-Forwarded-Encrypted: i=1; AL+hErHZyzuOvTP7VnxZQL/I4Un36wM+OPcyuWobm7aa1lqc90dzZGgCMQcz3WiPvqw5lOFqzdeG7kI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KI4kx6LZnAULFVoUMveZiOKUncrvFbWm1+r3sdmxC2QM8Qw9v
	QSC50S3w5gq/ODH2rpfrHZ8ng4e6jUB5/iAznvJBzxu6KPiJUbceeJVLfTU0AqdR
X-Gm-Gg: AZFdTZfqtrZAMr7V6gClpI4IZ8iuHW3HJt4GTuUKQ/gtM++mjUtstPA0lx3S+g1ERZt
	eM/vMqF6XmyOmwRgqCW9I6pIzra+u0FDEjlsTVxV2F2WRMCGCFEDAE9R2hBCW/4deV2HFuuYL5S
	U8WURqn5wZUOxrMKgEMzRttwVUTDWSpltYydiNl3CRkd6KbfPw72AVDkQeVYe8zhSQpkLhztLMx
	uzXoqF97JY3FSpo9CpJ7ppukh20vSWZ9smK8yParDVLXa6I6TK9CQP/39jVEf6llA5xni77ke1u
	Yu06gthxWq2McD0VkgS0t3+dSEnHeHEgIOYeUkBFG7yCF5K3rtGJ2oo0oukcl2ISNCVk3XnyT1Z
	f63PEbFlFsFQlms0SqsQSXr5FZHIEb1n+OJbJlNuRDGbeVXSS4El5s1TFlLLPRyg6TX6m63whUB
	qoXwBtAJrWU7HChNZzN83Ocpdn1bF7G5bCdB1JbbIJlkLiODsmxSrgyvZ0LPOIuCE7yIY38yJf3
	SyyezQhhE0wvhGH/RfRhFjQ6kbBmGd2Ddm65ZhH1ZHs0nUIV0IZfHQDw3yzd6262hymmvosF0MT
	NpBS+u+t3jm73/j0r2qI3xGCOkQMIBUkvZyzZ7G57FUJOmkKLxHVvYbMQ9CI+HKZ3XAXpCKDG8k
	qqQTBWKjRUSbMOBODOATO/YF3N1PybakhjfWtZTZ6cBBwf1pkZYe69FFXFg==
X-Received: by 2002:a05:690e:bc6:b0:67d:bf51:7016 with SMTP id 956f58d0204a3-67df43f2ec1mr7067773d50.45.1795693502620;
        Thu, 26 Nov 2026 03:45:02 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e507c2e8asm1649246d50.19.2026.11.26.03.45.01
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:45:01 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4e18369c8so41252977b3.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:45:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEa83oD+sqtag+r3Xym3csnkO/HQ9Fjr4h1P+/Bh384/hEazy3taKCGoMn2AvQ/xMU8bfpaxaA=@vger.kernel.org
X-Received: by 2002:a05:690c:4985:b0:8b3:3854:c28b with SMTP id
 00721157ae682-8b520435d1bmr62048027b3.22.1795693500919; Thu, 26 Nov 2026
 03:45:00 -0800 (PST)
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
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 11:44:49 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
X-Gm-Features: Aa3M54p7abSX0OPwjSGJJWzx2W6fGgqfMqyz9aVR061y3YOch6bS5dv9yFIyoYk
Message-ID: <CAJX_Q+1or5Eqe46hdtv0CtekSnLTJkfZ3UQY=RmfmYGeXd7YxA@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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

On Tue, Nov 24, 2026 at 9:37=E2=80=AFPM Martin Blumenstingl
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
> What he's saying is that (in my own words):
> - status =3D "disabled" is unnecessary
> - if you had problems without status =3D "disabled": Igor's patch should
> fix it, can you please test it?
>
>
> [0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@=
iav.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a

I never saw a problem without it. v1 to v4 had the on-chip bus
enabled and the VIM4 ran at full speed. v5 disabled it after a review
comment, so that a board enables only the bus it uses, and Igor calls
that ordinary practice for a new SoC. I am fine either way: keep the
line, or drop it in v9 if you prefer.

Tested Igor's patch on the VIM4 on linux-next (next-20261120, which
has it and the T7 driver) with the on-chip bus enabled, the MAC on
the external RTL8211F:

- both buses come up, mdio_mux-0.0:01 (RTL8211F, the MAC's PHY) and
  mdio_mux-0.1:08 (Meson G12A Internal PHY); link 1Gbps/Full;
  ETH_PHY_CNTL2 reads 0x0 after the attach
- while receiving 942 Mbit/s with iperf3, I unbound and re-bound the
  internal PHY driver twice (phy_probe reads the PHY through the mux):
  after each bind ETH_PHY_CNTL2 reads 0x40, SMI_SRC_MAC only,
  USE_INTERNAL and RX_CLK_EPHY clear
- the stream kept 941 to 942 Mbit/s in every 2 s interval, 0
  retransmits, 0 errors in 2.4M received packets, and receive keeps
  running with the register left at 0x40

So the data path stays on the external PHY across an internal access,
on the T7 as well.

Lucas

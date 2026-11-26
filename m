Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707105;
	b=xGVtc1f/nyVVk5oJDaXjiEEgUIwqy8ImQmfxfZ8sFkLxSHbeqTBPGNRBgiiG53qLAVCJ
	 UvPVjpwUa3Gcn76kV/O2B+D9iLV/uyXOTmdHmi6XwBvFlRet2NMqBuEIWwwIBLg68vpWW
	 MRWV6oc1XoKxxQcrT7to0qeZbiBmU3oBprIOkZqTopcxdFLwPjIuCKjJbInfpNpgfq9e0
	 v5875fnhRawVlhMvJ+TxsruJ1WBe6l0MDWsYWxIGbmNF1nfDCJw6BgpfSUI6yNHQiEPZ2
	 HsHezaOV0vTMe3B0sf4aGEuX8tRkAGMgFMS6U0RtbfidG7SeJAXK7kcEWGYM0hvoClw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707105;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VTt6jbaht2zGBYKNI2lpBkMP4t0i6MoEcGFYwP5l2hs=;
	b=rr8KgH4xh3LGSNtV7s8LVMSRMSm7tVOahVE3HCpob2hZc6DepfHcomZ4DknFq0Pdxe84
	 2Zz7R3sjtqBjyHg44YlKLdA8fus57VeH/zzVOBvyWSlXznNYR1kQvmidlQ5qVaQrXoN1B
	 UoI+AGbAeurf/sVwm2JCmU5CQfH1ensw6OlmjYo2zVypPiQqdDTVaaN7Q5nDdOSmTQbvN
	 60ob1jUN2MxL/l8C8TpyCsSn1Y4Lzi1hbU6bKQvXJEP3TJV1VYaQvEtCdNB+opjpDlDy3
	 TQyZPfvvFFftnNmRShhuocw0N/PfDy3dMdL6y41VrRM5EN6Wf2+r5ZXsnklyY9mUAHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6076606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 15:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6076606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f3c616c84so553184085a.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:31:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707104; x=1796311904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTt6jbaht2zGBYKNI2lpBkMP4t0i6MoEcGFYwP5l2hs=;
        b=YFbedbrrFlZ0himJIkoOS9ubpmW4Wmv6hWteY1y3y2CZHaBcXI6InzlImL/sq5ARX2
         atWHZNogGAiz7maMmvHhqOZ+HFuWT2klN/48AmNvDAHc6EDxiydEGv8B8aogwBs5FzB2
         doIpT0dqSmesz5o5TRB3AvgoRlZX2N5v1rMwWlSV6urUM0NTn+/PEoQ1V8ruRqXPWGsA
         2UdAbLo9ELbk4muZgI0k/I8SSBMj8XQqGpjpaWPhBYriw/TozNXqZySSNeDtPTPzCOc+
         UXGlc7jCAftXOtLudrvJeYAOHYnF1AOWwrCB8ezc95j6cdDXb0KEjMeIny7H+x/L7BI0
         PXFg==
X-Forwarded-Encrypted: i=1; AL+hErGuu14iu7VBUwNSkNROgFXDN2p3EqC6Nd3aYUL+taZpfFLcV2LZl9+cOoPzbSmbjW6KviIhLBA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7es5WZJl11dmuO1nB9P7o/SnYOeHPy9IeTlEqafXhhuE+tYSy
	yPwMTk2CzA5b241wV58jikh0SPUye5azf4iCo+ZGhDrR07g4ZEB0hdf2mvxK85tB
X-Gm-Gg: AZFdTZf07xGJemCI102sG1aiKSBGQhEkZCuOzideVDj6cDj01omGz7O9obbavc3qlUd
	aITnJppox8mRgno5V6VdHHMrBn3rSqfIh/W2wSUtraR5+cEf0JdEKZsXqYN/6TGpQBtzEi41MBg
	ZBsqpWn7iONHYv5KujxdjDikAT++IX8HbmXPBIrsTt3C1RMCl8MJDZJRi7XTyrZlhW0Zz2uhyzN
	kiTYgM/wdhaLKQwP8InfrNnOWTF/4+aNzdQuBkvztB5ttED+g5AIa/ooM8jfeZJ1pjogHyOu0O7
	h9ML8X/8/k1ZupAxhEMZT9cR4JUqcFewWENxuZhxXEJdGjAYfCSCuUEXGo+N5taWoO8OJtMChyQ
	Mft01ShaoGwl42rdkoCbAQEFtXSgjzAkm/g64wpsDyP0eOI+BWnNZ6GF4AL9F6iH7POH6FdnfqX
	8ZBP6dB+dw75/eKHlmw6wmlCSa++ZPkyQfN1ToDJDho7GbIA3uIbMHvo+Gz0X10xlawm/X3o9zL
	GcQoL+OyjwEa1PNtiT1A/9KSS0wlN95UkWbMrVasu4/w2yLPCKAyJdevQveA71MriRdpTsCc95I
	ujQxqcMDQ+coT71TxORwqfk8hqpDSBX/yVylmelieMVjKY01FSp/6xlO+0S8YI51RlplnMY=
X-Received: by 2002:a05:620a:459f:b0:948:48b8:6736 with SMTP id af79cd13be357-949ba965a61mr3737192885a.16.1795707103654;
        Thu, 26 Nov 2026 07:31:43 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1600769885a.37.2026.11.26.07.31.42
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:31:42 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ee3a3d281fso4541457e0c.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 07:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEEH8N+9Qxp7jZpdOkuClgCk5HSzPj8hdP09rI/X99lqkpPnrakWN7Ab0wuC/zJDl3K5tWSvz0=@vger.kernel.org
X-Received: by 2002:a05:6122:1352:b0:5ea:d247:adb0 with SMTP id
 71dfb90a1353d-5ee8aec0273mr12525476e0c.4.1795707102063; Thu, 26 Nov 2026
 07:31:42 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se>
 <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com> <20261126151633.GO3898744@ragnatech.se>
In-Reply-To: <20261126151633.GO3898744@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 16:31:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS=HmLkWJayNjWiuaWaCEsq=TZe3Z2d955FiqiT3R0LA@mail.gmail.com>
X-Gm-Features: Aa3M54pKeTC5hUFcgZHzefDJuLY0GDmu_UJnMCzuy7g_xoL8fTHhTprfIbzhyhc
Message-ID: <CAMuHMdWS=HmLkWJayNjWiuaWaCEsq=TZe3Z2d955FiqiT3R0LA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 3/3] arm64: dts: renesas: r8a779g0: Add gPTP node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "DavidS. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Sergey Shtylyov <sergei.shtylyov@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 26 Nov 2026 at 16:17, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2026-11-26 14:33:17 +0100, Geert Uytterhoeven wrote:
> > On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The gPTP module is shared between the RAVB and RTSN Ethernet devices =
on
> > > the SoC.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > > @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
> > >                         status =3D "disabled";
> > >                 };
> > >
> > > +               gptp: ptp@e6449000 {
> > > +                       compatible =3D "renesas,r8a779g0-gptp", "rene=
sas,rcar-gen4-gptp";
> > > +                       reg =3D <0 0xe6449000 0 0x500>;
> >
> > Can you please remind me again where I can find this base address in
> > the documentation?
>
> It's very well hidden. The gPTP device itself is only described in the
> attached files to the datasheet, but it does not describe how it is
> wired into the V4H.
>
> For the longest time I assumed each RAVB (and RTSN/RSWITCH) had its own
> gPTP device as it where on Gen3. I got feedback from Renesas this is not
> the case and there is only a single device on Gen4 which is shared
> between all users. That is RTSN and RAVB on V4H and RWSITCH and RAVB on
> S4. To make it even more fun the gPTP device uses the same clock and
> reset as RTSN on V4H and RSWITCH on S4.
>
> I got final confirmation of the address itself from the address map in
> 002_R-CarV4H_Address_Map_D_r1p30.xlsx.

Thanks, found it!

> > The size looks too small to me, though, as there are registers at offse=
ts
> > 0x500 - 0x788.
>
> You are correct, it should be 0x1000. I will send a new version in a few
> days in case you have feedback from the question above.

I can fix that while applying, no need to resend.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

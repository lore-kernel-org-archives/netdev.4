Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700467;
	b=3xZ55RUajafY9xfdPqfIpSea8L/NYQ4RORCALMqW4Tgvpz5lR5bsDkEVv0Fv6OTwREry
	 C0zkhOFEPnBcg3B77RamKnU2Zvh8Y+RJbNrC5HQupumGErTukS6F3p28vajT09dTVTzgC
	 zL4nZOqhefS6N0He3uvne+oF7q3hlPoLHdmDhWKJ6qw3J27sNOndAYYxQhWuISFR81A2+
	 GRJ32viG8xtcHM0778GemrOOxlEI5oNI0LScuxUXdvR/OBBsYYDIY+otEzxWls4D+qhC3
	 RQFcUOv7rjFwFvXShrWInvegg/U+BlIhl3WLVcEWRAbgxV0rsaetBt+bp/h+6bctCRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700467;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
	b=p26qeCvUMtPSOrcOqN8qeSWXC4UkRWEEclrdvGQDN4iLbogJKfN9l0baMmBnd061zGGB
	 /sNxh8XmZm+qIibDPEjCWdopG7dgK5nHHFrTQH0V8BvlkReP6GBmYkVGoLFpy5krkTPiM
	 hSe68by0Azzd1K6MHMax3QIikGlgv4w470DPB+AHDWN//JC5RXJqSngcgUxxMJN19F0Cg
	 8s/eH4WGbQWTdcFCdx3dwMJ8vLt6xjfnXhe/Iyd4Xb/Jp5lOhUg5NppluAF36AK2n8QGO
	 9sADt6A4eNgnnJFt6/OVB8cqeFFzsaMa26hXM/qOM16MjTandxWBpiAMUORuZnbM9KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E9606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 13:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70059e4dab6so3711150eaf.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 05:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700465; x=1796305265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcwFZv9BM0w57FN62L5UyDAXYgvPAV25zeOmEc/ACiU=;
        b=Qa1dYGLFbnkn4HbpYK6d89MuTlqRRHqM1cJoctOFI/kAVjHgRbR1bByQ2/GhVfEK68
         OUZ4zU+nb6FAo87Ah5p+u2f0YxMdiFUgjkpaNtAFj2/4ijF3DfoDvWKqqKwEJIJh+c/U
         m4JxohEXkdM1ZQfZ9AdFyKhhaCBjPh+BwLdG1OZvaL0zH5UNYk/a0SeTHwq9fE49XfbQ
         JRwEoMmIx1RzRg4EglHleSAwK2fp2w0NLkbI9kttmViDhcdRKxeWNxo5z+FQuUHUzF+E
         1NuWkkj+ekbWPBx98Tx7JzRS13N1YIijy1spCHiixvaESVKhv3sOcz8go6BZ/8Rrpupd
         //CQ==
X-Forwarded-Encrypted: i=1; AL+hErEVIR4D+OOB3V6tV+oNsxOdtcR340yKaZS63EPU2VLbgVYTdY0Qn2lahtJyMT6OcXLUWa+OUTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HvRwWpVjvtDE0M5n4195XYYSKT7CsP5nmu3oDKRyb1W23sL3p
	xS+wZPNTDuiUJ6ICdPD2lFUUSni3FjoFgxEv4zNY+bOfOtD+SYcELWJgXJOrs1U0
X-Gm-Gg: AZFdTZfhexTDyrpip+ebp81KL3HLdFmvL/8fU/wsHRf7PRqqbQbW8+rZs6Qgfe0Ln4C
	H35j7SS3y9jXBTbrH2hIicIxPNkoTyw3Ss71BOvhy6IRStHQ4ICtxXCCQEpark+Kf2V424R5VC1
	DdLStODyBL78z74qEgaLIYW3tBLRPdiyoQRUJhI62wJ1NKTt2vI3HUEQN1Epo1W1nMo1omF7buu
	Lgqov0FYPQ+gS6JqCIM5gfz3UiqtiPCe8s5ym390E367jF3Vd1jzY3D9z1mmbF6z6L7sHNzCUwA
	fAEscIk/0yyqg2BhTLvJrcEmw6r+eRmMgXorUUBcbi3sZ4OUHGUqQwjAUI+SKxFZ4+ZbXbs3+Q1
	coF02cCq90fdOpPi5MVlAvozD5sjlu07mST5pV0DFReDOAJ8pDUZKMDWvd1tl2uGTlJ1qIU//PQ
	w9Hi1HXN0jinF3JSxV/ma7jUXtqor2M+MXFc/fJGb3JSSaFHN08+PSEa7hDe3+ZFBeWGUuYhbgL
	3vEMXCr1Gd8garsIX8wjFLJf+w8gbb00yWd31CveU9H7HmwXiA+I18ogNCqDDGKJAsLwo4qWMoa
	ocnBzMVKQ5MVA/hnwUiMcNNWBq3jrjEYPkaivw7ZBmNuiLKDaAqiFMRgU6xqI05I1CU=
X-Received: by 2002:a05:6820:f021:b0:71b:8345:c24c with SMTP id 006d021491bc7-71b8345e14emr3388351eaf.25.1795700465529;
        Thu, 26 Nov 2026 05:41:05 -0800 (PST)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8345e1f1sm2774795eaf.5.2026.11.26.05.41.04
        for <netdev@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:41:05 -0800 (PST)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4b8587b395aso4070983fac.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 05:41:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFu3RvFoFC+d8OmbspmR/ntukAiJxMck27LkNr+GdgksKKLM4pLbygjkMj8es5gxfGmsCo6r5k=@vger.kernel.org
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id
 ada2fe7eead31-7d739391bf3mr11259967137.7.1795700008033; Thu, 26 Nov 2026
 05:33:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110080727.2377040-1-niklas.soderlund+renesas@ragnatech.se> <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20261110080727.2377040-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:33:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
X-Gm-Features: Aa3M54q5_iVD09yTxiCPbutEOoqFTTuL8Qbh52NAGvGv6cSg6_A-6RxSK9Zhqcw
Message-ID: <CAMuHMdWpZfsaJOcTEBCugyDgKDXNRje68n59OrGFx-0hJXG+4Q@mail.gmail.com>
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

On Tue, 10 Nov 2026 at 09:10, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The gPTP module is shared between the RAVB and RTSN Ethernet devices on
> the SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -606,6 +606,15 @@ mfis: system-controller@e6260000 {
>                         status =3D "disabled";
>                 };
>
> +               gptp: ptp@e6449000 {
> +                       compatible =3D "renesas,r8a779g0-gptp", "renesas,=
rcar-gen4-gptp";
> +                       reg =3D <0 0xe6449000 0 0x500>;

Can you please remind me again where I can find this base address in
the documentation?
The size looks too small to me, though, as there are registers at offsets
0x500 - 0x788.

> +                       clocks =3D <&cpg CPG_MOD 2723>;
> +                       power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 2723>;
> +                       status =3D "disabled";
> +               };
> +
>                 tsn0: ethernet@e6460000 {
>                         compatible =3D "renesas,r8a779g0-ethertsn", "rene=
sas,rcar-gen4-ethertsn";
>                         reg =3D <0 0xe6460000 0 0x7000>,

The rest LGTM, the bindings don't descripe the two gPTP interrupts,
so they cannot be added to the DTS yet.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

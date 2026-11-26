Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684795;
	b=p6QXvOmYeL1cDDAIQbsQv08A6aafI21mdPcY2JcsrOR06n5idcyFLtx8fdiGikJF4GDj
	 BEcvSvkVcNDk7B+3yIKV/tdv/KS4vFfpflf06tTiMD5Tag7WRkNCakJ2VjYPTybKDja48
	 odYcNezkSs9zWcwuoLxkYdMtSEjFO6UxITw/Ifa/WW8b5kdvE/ObyIgPKMWUB8+bvzZon
	 YABDireEyGiQ4GFEC/wyDU2rlDHZTHll9b/eLuThXQ0+VSRK1b/fOkjwhSlP4Pxsf79Ch
	 +JnUmSkI3SLzqnzvUqrC8j02/0NiewpJZogDwW01gUb/b5tSdElbqcxmOPWK4h1Bzwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
	b=mcsq/vxOriBC2cdGuaH8K+nrXs7hfYOzrYY2k/FIT9rBiekKAD0u/pqu5d7/vcj523Gb
	 Er1BeGw+UVO4N+cR2ILPiAXzZ4JHVlXTcUT7zRb105VzO0gaBujGLgb3aU4r+fV7xNvO4
	 wAbJ1VtMae2157RePfD0CCREaaKHUpPkcMqN3JjsXxjWxy8HeM/q8R+qpFdSMDPzVy64H
	 8dQxxSYggg02XmoBpXPxY7SQS0d8sIx2EScbVFs6wLBCHyhdNfnFePCFb8D9KJhNQxng1
	 q86qv5tRJvlQXatjTTbVoDNqF5/TSvWa+qw1k25V4lZR0Vuku47K/anAy+EyIx7MLEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6d7tzwx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4F606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6d7tzwx
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9213fddb596so17366036d6.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795684794; cv=none;
        d=google.com; s=arc-20260327;
        b=OrBXmd/WA2FU5sl6cmL1Go0XWl8iSwTkFH6tw2c63oekOwQMe37B7Q6W/ZqY6O02Bu
         OSOoAxqYfhiXUkYe9x+gN34ak9YwDmjkmZkFxjpn/xnB/zTCJ3mrBraGrEClR5OWV0sN
         evoKnV32rPDXr+toPBNSIin7ebjIHQ++Wsh5bfjKkEkcM+UKWPWmilm4sGUA92gxWSCw
         JIKl0VFq1Aig/+0WW+AfC9jk7XCi0PcX6np9XHFVPjDoVV/O8ixHYM3BjgyfUVWqpBEI
         Us9rUWa0c1T2TcznFJPDu8AT8NLVQG8IIImp4CuO/DedZsbYp7UbgGzLTcw0au6211R5
         bxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        fh=9eaUfQLqTDdV1zuifk3HY8MP8ucIzVfz/pnhThzJzew=;
        b=oZrLNxG0vL0VUV4X7q/xOPRhSdJawTBppxnsTOMFR4vqHbjXRzzsegVzFq1anDKWsv
         x7MWe7YiozFeTeIUviGEzokmfS/zmyn++qtktsleSHMwzOtkctVSR3WDwzybftpOpuF/
         NF2uSjx9sAp+zd6YnPBocGxXMkKOv5sjwcWSMJiavqFnRaNwL1Wy9dsZgbtIjxHzoPpf
         x77fSU0uPPyLgY78Zbz2t6W5cXn4k6Tvpw7GntiDjxFYV+vB3FKglVfCkiahibUYn2kg
         UFvyZxmdRDHF84PxK7qxLr1R1KkqtoJOMK3alPL91yb3ANJGr9nQPd1uGGVRVIBGbS++
         EF/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684794; x=1796289594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        b=F6d7tzwx/wBnDJgy4uypNLO0KOuNPFnvh071pgdD89w3KKiShPurni1Wx1/bJYs1SZ
         Nef6FMAEfVbxGyRfALtEHLxwMBjs5+OzC2ax0YvrNYNTluZNk3vELeKACq/7S5v9EPeU
         rbmdbJ+oIunY69B6/2qN1sz85OxYLY+5xIvK3VUg1FlDw8K0UUyepNHwkK/IOsGv+II0
         wYm76ChbimtYNhfVxaoBmt6J2Tg4HRh5XqfeS7XvQlrr0EpqTc3FY1IsFBnk4L2+RSTh
         0t8cjyZgxuBWvnKvVmyNX/4LBMx0UdR+PzYZBkF2vgCn4dpuuN9ECebdS6M1RAtdl+aC
         E4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684794; x=1796289594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UA99tMdzwZI6vPjr4l2t8uq5YE/+8SMplB7ARc+Cy2I=;
        b=RwKPJ91x0EP+hUhcPulxZYhViEQbhjt7Y0ooj0c15lJlaRgPnK0jhapGVdaiOZPe9m
         sObGPGQuf3X8HYEL0BZT6Z6LJWLYMUr2gfKcntuZqAsBtlPbKp/YabeM3oAC6X3fp66X
         GVvrZpDczVzlgc/pA0GdnvUrBTxe2JQiv79NkDXgwREW3i/c+dTCjEUobuIsmxyX/q/Z
         +C2Qg2/looXhEN9WEIrgoVUULqWrPj7E+vPiABbjmfBYPa1jfZRZzG/7DHrlEHTnyrZH
         IiRiSM5lPgMe2F6owmnfc//tZrQ/LmIs7peFTLMR1cdkqCDdLRSwoigzJpQ448r0nj3r
         Jdhg==
X-Forwarded-Encrypted: i=1; AL+hErExgRF3wMPvU9pjqN+rd4KnF3DeHMTUvFWPfmBbemlwLlaTqRTkd4oN39h0czLZRBHmMybdMIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3hz0miSyWYdKPNTSRIC/LGRcF80/aqOOJphaizoZI8C5LJUHr
	ecJHJ8jGjgjH5rFPlbS5p5yq2jFgzxcDxpFfIqXGu2wMiq69vbbXtiUBsr5hMHYVyOp9k4om6s3
	ML03ivoyKLNkaEipIEmxsJOMOu42D34k=
X-Gm-Gg: AZFdTZesloNQ/0zKAgMTkCA1D8Yu/n7oj9EH2I9ebYrlNKYGiLCE5khGqyL/1K8icfX
	BIToYuHQpi6+uq5xkJJL1L8dnqgzX6/ib7HSNisksgFt34A/Coxlu/mMI93dyFStMHJMqQgyB7m
	e5IBfxloPEtl4Z8dDwYR6AvPwFmVc5gHQdifoyoS1Yyz+TEpviEGmi9gbwF2tmV0kepN8NbJDrl
	vAYka82MXN7FS8El5wftqO7H6adlOE9lRuj3GQHqvRMuDA3+mrqdVGdXy85C0qmh8kA2hfK84R6
	y/TUcJgo66bHOxIfksGbnouaPn24b31lJcRH5eIZMTzWDATArss3BxKuszu5WwXvqyZFqnV+bPg
	DBqK1i4zq+ZhBT1dsXCiyR88du4jtsisRuQcFCX4vuxy5hG0bEtYJ2XV/bg==
X-Received: by 2002:a05:6214:4704:b0:921:21ed:f9d5 with SMTP id
 6a1803df08f44-92134af8629mr316655716d6.38.1795684794393; Thu, 26 Nov 2026
 01:19:54 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125111929.3395740-1-zxyan0222@gmail.com> <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
In-Reply-To: <544205c7-7590-4a6a-8abb-0199768ed283@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 26 Nov 2026 17:19:42 +0800
X-Gm-Features: Aa3M54oz8uKYvBtRCaFsIkKluWFn0wSjjEFxOCH-vgc1j273HD6pimb83pZTgGg
Message-ID: <CAP7veT+ZJ_oW=PueTUwrZ9jGj=oYmRxYNRfeVeM2Rkr-RThkeg@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, Nov 26, 2026 at 4:07=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/25/26 12:19, Zxyan Zhu wrote:
> > stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> > MAC_FSM_ACT_Timer register.  Per the databook the checker only fires on=
ce
> > NTMRMD is programmed with a non-zero duration; NTMRMD =3D=3D 0 disables=
 the
> > timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> > never reported and the advertised timeout protection is ineffective.
> >
> > Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> > TMR field (CSR clocks per 1us tic) from the CSR clock rate and using a
> > 4s timeout.  4s is chosen because a PAUSE frame with the maximum 0xffff
> > quanta stalls the transmitter for about 3.36s at 10 Mb/s, and a shorter
> > timeout could wrongly report a flow-control stall as a stuck FSM.
> >
> > The NTMRMD field holds a power-of-two microsecond timeout per the
> > databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> > 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> > 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> >
> > The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM w=
as
> > not reported through the safety interrupt despite TMOUTEN being set.
> >
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> [...]
>
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 00be2df63d22..659f5db528d3 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -170,6 +170,18 @@ struct stmmac_safety_feature_cfg {
> >       u32 tmouten;
> >  };
> >
> > +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> > +#define STMMAC_NTMRMD_1US            0x1
> > +#define STMMAC_NTMRMD_1MS            0x2
> > +#define STMMAC_NTMRMD_16MS           0x3
> > +#define STMMAC_NTMRMD_64MS           0x4
> > +#define STMMAC_NTMRMD_256MS          0x5
> > +#define STMMAC_NTMRMD_1SEC           0x6
> > +#define STMMAC_NTMRMD_4SEC           0x7
> > +#define STMMAC_NTMRMD_16SEC          0x8
> > +#define STMMAC_NTMRMD_32SEC          0x9
> > +#define STMMAC_NTMRMD_64SEC          0xa
>
> This whole patch starts to look good, one last comment, sorry I
> didn't spot this before. Can you put all these definitions
> in the "common.h" file in the driver folder ? These are some
> register values (same on dwmac5 and xgmac, but still), so they
> should go there.
>
> With that changed, you can send a new iteration with
>
>   Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Sure, I'll move the STMMAC_NTMRMD_* encodings to the driver's common.h.
v6 follows with your Reviewed-by.

>
> Thanks,
>
> Maxime
>
> pw-bot: cr
>
>

Thanks,
 Zxyan

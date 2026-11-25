Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795594968;
	b=KPsVyC5fzlyfgFAHg7jXTxtuX+SE0CKV7YuvOOdtY8oQrHDAR8TiW1wN3ZbC5NWeVB8C
	 HBI43at1dHaJ4JDT8GbXC+8STY6Int0c3mBBlcNM7WWSF8a0E200qcjwZiWP4HKcLGJIs
	 +8um/FjrcluNvcyO5dAtyFc9cIaQ2GYXKcdp0BegS9lkRikZVdnIhVEPOg9JaPmUhJN5M
	 0FuuJfzpwVI/xtrkxFyVzA/BSPIWw9sxCvd18BIie0Wf1lggdu16yenwWkydI2Fv8XmeB
	 bX2INQWsIgfF/KMwe/fKdLj51wEEF9lPqcVMQ2evtLsOuklScO2ctUnxTvMsOCidDFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
	b=Gn2JEBV9ziXkAUadj33aST0B1ohQ8se+EWO5j2uE4rNfnsNYp/KloqAAg2ugxEFUyx9S
	 xBiBBLrTFr1pgHaxkcDFMfuIBmiYE4zk4LVJDuzGEDaGFwXmPnR6gOtQYDIjxAXHU/gZO
	 IWOY3U9XxsVuhGQpcC47zvguejzLOWJtkXOApXQzIRqvWDRGBtJcZsSfubpN4X14LBkuM
	 SO/yvOmCc5ZrgpcOfIL2ayivaXYXKb+xMQ9X1P8PtOAdzZk33FCeb27fuODFK38rge+CW
	 bPwjfP7PViPLHedOGYOEF58GRHQCpjQzmeVe6Sbe2I5CqUcfYCwOJ984mmKFHHY7wCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ+ZhKYK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760CA606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UQ+ZhKYK
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d03bfd477so63365801cf.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795594967; cv=none;
        d=google.com; s=arc-20260327;
        b=G/j5NvxaAcGn5SQw5OvDuaC3YHL7WUPS66U82lsB91RtNAeLwIOQuXlm2NZSbYamK7
         gLwUJH7VLL2COHKfWii/11uJLeclStndKNQL7P/U0dTriIyZdxVeFVMXK5b/ryk79E4S
         GGTTFeN470u1pfdtx1+Oq9ubh2UXgNlgwSv9AUC4GmujFP050NoMqxFyFlWjjnbHuh3M
         KbkfhhypKVltSDd9MnjZdsNSpQuhoF9dNqXmr3IoxDhjp00DKnkh4wXRnUNG3T4jGwAI
         3nlPQbD3rNI+TYAz5ICvX+h0+KmYxam/z8w2dpM1hqkknaJd5nxU0hIh31ZHQz0ISQpU
         Q6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        fh=fJtnFsIZt4fM3xf7rAUxJDGVZlP9bQxtLva8iqKuRY8=;
        b=Ay5qGcK4Mqe6NXPDAz4jVxYlnOTrrizn31Q9MhNlv/Z5AAG6qCfxCoDdL6ayZLGh5P
         pbzhT4yYxKgNV4Ve6mZtvXONWVffCs9LlRvuWFqtunEKiIkOu62haERs1eEI5l+64ODm
         6LCqxD75i1v8Bd0fT0k/FNj+eguONkfYxTgHZXtM9bOV2kYKlkD6Vq+ckC1lEJDtmV+6
         Jh6Fhcb1tHaNdPtU0r/6tQhYEVWlGG3a2tFCqvS31me1WgOqq6qoNczSYesuSt0Wr7ZW
         UUdfaj38V3kh9rqq0vUtHDPmT1FfXpiDb3ubXFSdtrBsEIc8o0Eazrm4eSx70F0gS7Sx
         dj2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594967; x=1796199767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        b=UQ+ZhKYKMqHz0co/m7DiXuPVLgdRwlUTsMtBcqk4UFtMBiAZjqUn8QAH0E2C5MFL3R
         9E8K//pOQ/sZCE694c860uccIJyCm++8hiPUflRAgrkV6s2FmJ30+zKSFuoHI9Y3M0H1
         c9XOIftkBrHijkFLV4tl5SsFFdQgX2QybcBcDC+FQDAyGi/ALtYRmn0Lb+AT6x7iToDm
         senCCxCI54HR2dZJoEz/u60k/Ufp8Tci00jBXQrOeaU3K9JY+GyuwLaMbyWxMnBxldx7
         QuBz3yJIEjbQoWdvjItY2FpMK/oxXtsSB6EkCHdb84lWRDW2GhKBBrtGs2UL6/Xdw1bE
         +bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594967; x=1796199767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oho1xmtj65FmYOXL2GEcPL6DfHTszkZM74IxrPJmq7k=;
        b=PKdDB4OREzvyJDo0KBBuwoDUMv3KyFVIck3ki0t8P5ZHoD8IuHZxuzaKKfBb7YZAVC
         AB16U39+OdpkoxtOZUkDTuDEV+dwg6XBtJcbjfL/LWFTnchYsEppWb8dupCVu4Y5exDq
         2SDuOlPzmpHPf6wZ3wLRPXGSetK6SvQ9f1x8GBdzrXDkge0RqhQ4kYvAXzzlLS0yZ35z
         3pfa9iB/patQGZGb/RkUvbCIx4IIDBqxvI83zgodtKMG1Bhz6gSBdjIKIE3us9Dt6BN5
         q9ESZZYu5yXdSvRIXo62eLSBepwZY9VSuHakDx/zKv+KgeDIVIprDCXytI3sfVlxqzu6
         +Prw==
X-Forwarded-Encrypted: i=1; AL+hErGRq5cGSwXS9mSpmpEy4RIIF2I2c9/zqLSMtIY9oElJV7QZBzk6zB87hjnJIcu1MgCL11Y7fmo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GYMCcqIoI76FWbL9kEpUXnUuaVlSKdbUEhZvGirFCzg0gzTON
	VOVSEUmTNLAUaUy7vSxLsAsZ3nXaaVJEPu5iOKBK0oCCZywFtiQSsinenRzYnnIJgPNLTuX1xUE
	Ja6rfIY3ayQL/nb2VPY+gKRJOBcBzeOA=
X-Gm-Gg: AZFdTZcAKjDdBU1QSPqfcU0FXhL9riQkixQuLdbS+xKvGhfNAgbmqWa77frSG4b2+T+
	AIUy3/IRPPBEiyJjTaUEnw1+AjcGxx50Y+MMxK0xKKhqluEtlWWHVEPjyTdGNf/LN+Xiyc+7ykM
	5if8o8vxxrlADmO7u4QiBeHWbytYDVOvNwd7hsw3gCzXF1jRBfgLvca3M63y2veoxfTBHVxY1rv
	HlKlXqYu9Oim+UXlMCg823LwDMRpLHCk4iP81mDH2s1aVsQ+m5EQ6pCVQuizLrgIO+YLEgHR0aU
	LGF01hdnrDAYCg6CNeySnLTexzflDYH92/HBDZ8YmL9qDUeHlszKMWBZZ4EPpwIfpvGFloEqtb5
	YYZcwTcGn3qZkeLG4fHnn3ZDry+w4RnIZ/08e
X-Received: by 2002:a05:6214:4902:b0:921:4095:deae with SMTP id
 6a1803df08f44-9214095e374mr275869476d6.42.1795594967356; Wed, 25 Nov 2026
 00:22:47 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118025528.2703790-1-zxyan0222@gmail.com> <179520945915.3135.14304625182301747705@kernel.org>
 <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
In-Reply-To: <500079e9-e626-4e4b-9880-adeea0724338@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:22:36 +0800
X-Gm-Features: Aa3M54p_SsKnYA1fkhhch1lh4sekLQ8FDtnE0xjVxJSelF4g56LC_eSsC56YYio
Message-ID: <CAP7veT+EjJabWrvczNwcZQ16P_SyH_rAQkTz+nf1G+FjxMvgNw@mail.gmail.com>
Subject: Re: [PATCH net-next v4] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Nov 25, 2026 at 12:13=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
>
>
> On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 3
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [High] On every in-tree XGMAC platform, the XGMAC half of the fix nev=
er
> >   runs.
> > - [Medium] csr_clk_mhz is only computed when priv->plat->stmmac_clk is
> >   non-NULL.
> > - [Medium] The patch turns on an FSM timeout check that resets the
> >   interface, with a hardcoded NTMRMD =3D 0x6 (about 1 s) for every=E2=
=80=A6
> > - [Low] The commit is written as a bug fix: the protection is
> >   'ineffective' and a stuck FSM 'was not reported through the safety=E2=
=80=A6
> > - [Low] The patch adds ten STMMAC_NTMRMD_* register-encoding macros (1U=
S
> >   .. 64SEC) to include/linux/stmmac.h, the platform-data header shared=
=E2=80=A6
> > - [Low] The same clock (stmmac_clk) is converted into a 'CSR clocks per
> >   1us tic' register value in two places that use different conventions.
> >
> > --
> >
> > net: stmmac: program the FSM timeout timer
> >
> > This patch programs MAC_FSM_ACT_Timer on dwmac5 and dwxgmac3 cores afte=
r
> > TMOUTEN is enabled. TMR is set from the CSR clock rate in MHz, and NTMR=
MD
> > is set to a fixed 1s timeout. A csr_clk_mhz argument is added to the
> > safety_feat_config callback, and NTMRMD encoding macros are added to
> > include/linux/stmmac.h.
> >
> >> The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM =
was
> >> not reported through the safety interrupt despite TMOUTEN being set.
> >>
> >> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
>
> [...]
>
> > [Severity: High]
> > XGMAC_TMOUTEN is set just above without looking at safety_cfg, but the
> > timer is only programmed when safety_cfg is non-NULL. Does any XGMAC
> > platform set plat->safety_feat_cfg?
>
> This looks valid, on what xgmac platform did you test that ?

Agreed, it's a real gap. The dwxgmac path was tested on a downstream
platform whose glue does allocate safety_feat_cfg; none of the in-tree
XGMAC platforms (dwmac-tegra, dwmac-socfpga) set it, so the timer write
never runs there.

In the next revision I'll make the timer write unconditional, matching
the unconditional XGMAC_TMOUTEN set just above, so NULL-config platforms
program it too. Adding an all_safety_feats fallback (like dwmac5 has)
and gating PRTYEN/TMOUTEN on the config is better done as a separate
patch.

>
> Maxime

> [Severity: Medium]
> Is a fixed 1s timeout long enough at every link speed? A link partner can
> send PAUSE frames with a quanta of 0xffff. At 10Mb/s that holds off the
> transmitter for:
>
>     65535 * 512 / 10e6 ~=3D 3.36s
>
> That is longer than the ~1.048s selected here. At 100Mb/s it is around
> 335ms.

Separately, I'd like your take on the hardcoded 1s timeout. At 10 Mb/s a
PAUSE frame with the maximum 0xffff quanta stalls the transmitter for
about 3.36s, longer than the ~1.048s NTMRMD programmed here. If the Tx
FSM is still timed during a flow-control stall, that would raise a
spurious FSM timeout and reset the interface. I don't have a 10 Mb/s
link locally to verify it, and the databook only hints at a large-mode
(LTMRMD) without being explicit. Would you prefer bumping the default to
4s to be safe, or is 1s acceptable?

Best regards,
Zxyan Zhu

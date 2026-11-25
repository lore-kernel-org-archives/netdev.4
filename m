Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795596611;
	b=sYtQbzxrpcNZDmPWHMbGddKH5LcLUl6OaOMXFUQwKzfM+pIb9vgeg8sxQS2uYaK5PXHQ
	 KvdFhXexNisbOuftESA/IX8cfIt4DS86hZTuBu4QPEz7CXnqyK4EqcVDSTWbSndLpG9i9
	 yQS4qpcoWu3eprClce01ddVfYd18QaUU68oSqfXC+6T0EUVfAKkiKL/s8BPjSK3xuFSou
	 NpxL/Rg3Jaq1xI5YI63KaGemZUKPheJJAZYVZ2JhJdzMdJLzTzAwvQ3AFBCcOrs+OwmfY
	 a51aESn55e6DmWlGQiOdgIAFKVgb79Zx72q6NR+oLBgp7gKgppGgjuesAT/CEKHoAFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
	b=BiAdjEYHDGqmKuwPWy4i79hbxQbWYe+Hu9eHDr9R/X9Tpjp/m/1nAPqfSeJ05f2jhL2F
	 FJAMP+Z+qsjTMyEMoeXOZx5R/uZBqFVWGsP0003ora1mRWjaXnaSQIoR5nzqhnNrUk/JF
	 +MKEGrb9lgVtc4X6ShmloMN8852coTjety+IMKQivSWz7AUKwrX/sdNKw5qDnbT5vE8JX
	 vw6Us4H7T0bERXHqQDVbUZrCixgd3chhBuidVYXHntLY+35f/rCgZC365+ZArNcmF1W0M
	 aB70T/UeXc0uP8IARsivlSzFLDzeGJfIXcfGtmW8ZTspknRW9DwZYB9+t8OJaJFiLQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbtwmHkm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DFB606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbtwmHkm
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-921318b2eb8so70875766d6.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795596610; cv=none;
        d=google.com; s=arc-20260327;
        b=aD+l5EFM+gQ+/aoHwPltS2B2qnbS1zJ8n6lB6LnlJOTD13t7WEVaNAR/hvNbvxyPr8
         v96E8eXdS4S2UzHFvbrGN0aDGv29JbJcMn6Q/MEa9vHak4x/JNQyjMLnBkXeDs9HeyX4
         QB1d+k8mQ3/z8casMvazUGbDEV9eLQmnG0DiKmutKtLgolv/nQLI+glK73zw4ypa75zp
         Ovi8AA0O+UFm7wvDoH2n7/qN/mVOnaU/6vLN8nj64oHh7iZLVE8a4b8NHQaOAqisauvV
         M/ko/JW0UJEmwfUFv5vTnCOjKB4/8wzWAAfgXos/5lqLptRgwXpT5SLpuvAXMCG++lUu
         yCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        fh=u8ljUKpTYE/pbbe5QFuo3QVJjOljArOGppeDBACj4q8=;
        b=e7aB7FGggAesUXsuI7uoO6RX8lKvPU5EyYRwQWceDGaXKAkHibL/BUthcmyad+oDkO
         J3viV2ERxIcCJrMmOggG07UVzOVXctXcFdmvqyt4cvPseSlMoK8uPjnqk+mM7j059qgU
         D6qri4Xzl6OQOlqhBmzBbhrFuOKigk6RnLbq37GoalDcgq37VjTCSEDZeUPd0iL6yjgt
         b6ElDO/gk6N8RbKkKpkQt0tnQUEMGnqQ+4pk9dHqhHDf4jDPqS/LD9p2zRn7NVsShFvM
         ATVzNk4fgm941lOhKDSbJIy0vm1bgb3cmvZNz9r03lpxwABbJDF7f34rwZIZF7BCoSbs
         p59w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596610; x=1796201410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        b=RbtwmHkmTsmyfAKcggWTMLdqqFGXsdOC8ivNLMZIaAPMC3V6ywVQvsZHoChnnOrRiB
         PxuxVADtPCpMvJYzzZU1L9Rc6VtKzsbSfyOkeTr1WlmBPb20jjFMQWk5y6RRbohAc7x3
         egyx+hfvsVVkTLVMIHtIghL9uixOzwITELfYOW92sQW+1L3Ju8PFpxggXW2r52UqVNHa
         t53saIRH+nsFBQbb7P5vxjrxAcClz7vRbGXC0vHx+VtBR64EHNkg3xBWBQADpzECB/kQ
         aSHi1G/RgKC/ebvGnjslsvtlI728NGwzRjWMbsrH3FhbdN+1pBXehaOdFiRDpzxatWlB
         AJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596610; x=1796201410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huaeUnA8VNpUuIejnx/kUAs+Y2K0T8LOpxzNwKLu1uU=;
        b=xzmDfWl3ShUHnKqh2GznRVenaPu+r7HaI4skvUubK3KdTzUx/B8sxMuyD8BHopROL+
         BIjOlRucxtnq5eG6l82GA4RMevgDv7v+KE2YqtBfPFyC2CrHqvJs9Xi33o8YjBM1tRs0
         c9s+kCIYv026u1na7LBAnVkAzgRSJttfghDlkz95yVoUpbB894k9uF/v+GgD/1C5JxoE
         kEuvCNIXWtmFo/dxfuV9yYihF93F0V12XGAGtrou/OhDrM8O0UaJ32M8RKbnj+AT/jOd
         rAmoPjbBvzKyvTBJUK58W7vcY4Zpni1dh0vzMcrIN0M1MK+zSswffCy/g3txO5PZlDUQ
         T6mQ==
X-Forwarded-Encrypted: i=1; AL+hErH+S5n7kgm4C+VAeTFJL6lkY/CkKDXnIsj0d7ovQ9F9aoISVj5jmC5ZL+8UPpMvvWFRZvfh9Ro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iYS81m2j0Xg8lR7N7MbmwnKtiE0oc1W25LzDAWA/TNsNzbRML
	HZhXFEP+knxl3SoQfi9zGm5B9OlLVXEq8fwKn0PI+T9oK0ozBSiQdM8P+O3tIvzXAmLD1l5o3iN
	u47T9OGXyPgFBSMCgbZ4SRvu1rsGIFFI=
X-Gm-Gg: AZFdTZcGMFuZwdIEV/pRUP6FWZ8dU02GIz1x4CSXqCa+DWq7Zk0AuNrB8FoA++/RX/A
	nG490W87plIbcfP/vkB4S3p4ozoc5yvKG6L70lEPRQKVcC5WpW11bbpDtH187BqGQPVkm4xX1Cu
	gfyOI/U/orH60A7eQOA6vnl8FW0blwauljN9UEqcNKx8tSXA6CkCUKvVLR/b3Y8mP4DNrX733hq
	h/OZzlGsAQM3mxAN2QPpESXVgyiXtkz5C+6ntBZ7nzar2L8r8aDEZNtODB8uXe1LKDMHWawu7OY
	UhmmgmrWrcVwob6rGhz0wuCUQbBrEEBP4oHfwRj1JdNuDSCFtTyEEcLy+ENf28Iyf9Qw+sIxNOj
	Ay/cCk5bI1cQqEOJsj4uexPxkYF2t+VMkJcAa49CU01YGJjQmXGHxUFGhlNU=
X-Received: by 2002:a05:6214:124c:b0:921:161a:b17e with SMTP id
 6a1803df08f44-9213498856dmr319005746d6.3.1795596610191; Wed, 25 Nov 2026
 00:50:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7732873.EvYhyI6sBW@fw-rgant> <20261125075716.2262174-1-zxyan0222@gmail.com>
 <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
In-Reply-To: <d515df02-0cb7-4641-a6ed-d73f2220f5c5@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Wed, 25 Nov 2026 16:49:58 +0800
X-Gm-Features: Aa3M54qogCRfGRjMdhXVV7JZ70rq5pMVX6XB8mYHty8P7davZNgqCbSK2atTVWU
Message-ID: <CAP7veTJnJEmqAr4pfzSwLPNHCFc=yuzzAbkeLEvAMjZf71-dcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: romain.gantois@bootlin.com, cathycai0714@gmail.com, avifishman70@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Wed, Nov 25, 2026 at 4:10=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/25/26 08:57, Zxyan Zhu wrote:
> > Hello Romain, Cathy, Avi,
> >
> > We hit exactly the interrupt-storm scenario you discussed, on a local b=
oard
> > running a PREEMPT_RT kernel, and I'd like to ask whether this series is
> > still being worked on.
> >
> > Our setup and trigger:
> > - stmmac with dwxgmac2 (xgmac) and dwmac4 (gmac) MACs, kernel 6.18.34+
> >   with PREEMPT_RT and panic_on_rcu_stall.
> > - Trigger: fault-injection of an uncorrectable MAC safety error, which
> >   makes stmmac_global_err() schedule stmmac_reset_subtask(), i.e.
> >   dev_close()/dev_open().
> >
> > Symptom:
> > About 30 seconds after the injected error the board panics with an RCU
> > stall (rcu_preempt detected stalls, rcuc starved).
> >
> > Root cause (confirmed on-board):
> > - The main level-triggered IRQ storms at roughly 820k irqs/sec during t=
he
> >   reset window (irq count jumps from ~220k to ~23M in ~28s).
> > - stmmac_interrupt() returns IRQ_HANDLED without clearing any status wh=
ile
> >   STMMAC_DOWN is set -- exactly the "unconditionally returning without
> >   clearing any interrupt flags" behaviour you flagged as dangerous.
> > - The level IRQ stays asserted -> infinite storm -> starves rcuc -> RCU
> >   grace period never converges -> panic.
> >
> > This matches Romain's point: the unconditional early-return in the
> > STMMAC_DOWN state is the actual storm source, not the TMOUTEN/safety
> > watchdog.
>
> Taking a step back, I wonder if the right move is not to just get rid
> of STMMAC_DOWN entirely.
>
> It seems to me that it does not protect stuff that much, reading the
> different sites in the code where it's used... It just seems to cause
> more problems than it solves. All of them work without STMMAC_DOWN
> if I'm not mistaken.
>
> It's even misleading, as it's only set during a reset from the service
> reset subtask, while most of the callsites seem to assume this really
> means 'interface is down'.
>
> I think this is the better lead to follow there.


Thanks for the feedback. Agreed -- removing STMMAC_DOWN entirely is indeed
a cleaner fix than the interrupt-masking approach.

We'll try going in that direction, and report back if we make progress or
run into questions.

Best regards,
Zxyan Zhu


>
> Maxime
>
> >
> > Fix we validated:
> > disable_irq(priv->dev->irq) right after set_bit(STMMAC_DOWN, &priv->sta=
te)
> > in stmmac_reset_subtask(), before dev_close(). This masks the level IRQ
> > during the synchronize_net() window.
> >
> > Results: irq count peaks at ~724 instead of ~23M.
> >
> > Questions:
> > 1. Is anyone still working on this series, or should we revive Cathy's =
RFC
> >    with the evidence above?
> > 2. Would a patch along the lines of "disable_irq around the STMMAC_DOWN
> >    window" be acceptable, or do you prefer the more general approach yo=
u
> >    suggested -- wrapping the STMMAC_DOWN set/clear in a handler that al=
so
> >    disables all interrupts?
> >
> > Best regards,
> > Zxyan Zhu
>

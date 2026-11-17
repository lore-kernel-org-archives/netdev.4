Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931833;
	b=uITpQr64qg2a/b7Nia2WtADfjPrZdoi5p8zc6zflSjJopXWq/CiEQsHaxkduwTL1iAnW
	 WINLC4ar0vWadxAEk2iq2Hy0ScR5I2lbLWFFzJ+YRM+LIovvaGrDKPaIidpZUoyn4EA0e
	 yjAyf7D3xzB2OjakUgt4Hac7Qj1R9nF2keD1vwOrCcEX7Ik+XZmGzZKclwIZr3CDI+Tny
	 rbf2iZp4tCZDw22tcpoQ/MnxrXqInRhE3013Ha4IHjVIwIPYOrrwpz8ksPheudu12Clod
	 +GtTv0vK2Pt4/C/dCxV6vFnRdQCsw39sEjLPeluXbIL2IbZDDX3Z8iXhfyEcKARejcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KQsfspyv7FxKfVXvjs+RL244yChzQ2I63yZXKKFl0Wo=;
	b=uIKf+4n25PvJ2t/ueu7uNia8/bOv9PJu3EMNZ602d7IbjjpTjrEADrCs7Kir7GYtHD1i
	 ZpN4OnTm2tCaGHZjgO3zwzp/uCNLozATrLG/UCqh8YRHL9YngERKZo+q1KcGh3AE2gzmW
	 rnNjuLwSEHFd5OvcyB3FFtDT+H+ojImXCnbzV//JhXpRmV12z5SCZyEPtKvUNIOm6CH4e
	 Qk295rIHMQtokZo/Xb9dlItcgCXxI2FZTPUcMzXAiDwoIvLAtKW++BR/3yKc1odNZB691
	 cg31WL2B9Wqwbjf7Q+DZjLEZ3jwwGaR2pbNrlFzHlBaaI9F4d+M0mDeoWsfJnCaX/aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sJy0fsKU;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8467606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8467606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sJy0fsKU
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a07078200fso2302524b3a.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 08:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794931832; x=1795536632; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQsfspyv7FxKfVXvjs+RL244yChzQ2I63yZXKKFl0Wo=;
        b=sJy0fsKUNBzt2aSbTq6/VhkmVQBu5hbU6sAWIVgiqlIuIveBlICoK6kPpgDs2vVfoS
         l+pt5dinyX3Pfa99dY63jFwkrs/Afzn3jMiUOzy/f5p1Tmy0M0Nmfas+ibIbr25bBuuM
         KYQP40YA6A9ffvxShZHUneUcRrNmB6xO1GFwnIoaoU1vHyZMdDECWRxitrlrwn2gSYF3
         jfNrASEM4kH50eAP5fx0pYqp+TPzJH5TJijAs9OzG4X2rF6IxNTC/3ZbRPDGvGvQZrJa
         G/ZwAS9xovP5LtGS7O16QvfFRwibkZCSCPjVIEbY1zzpB1SIklhNnm63MvX5AVHujNGv
         cZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931832; x=1795536632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KQsfspyv7FxKfVXvjs+RL244yChzQ2I63yZXKKFl0Wo=;
        b=ZvjWyiTz1apq3F/XKFFITB4vTNRtqAID4mpCXg2FqccdMoQsKv8sM3D8jnY1vxw7Ul
         Z7l7P7sfmhfiSXybXnLWBysdBg2sjn2+3Fa4KvVDGywMLo+mZULT0onTPkmQQffLEosQ
         OLkIsjL2B/YeWNcUP69RB+RneeMJrkjSSAwU5dC09mzUbPV8xBgnDsiX3N23PVzYvJAg
         +5LC5f6mKDjR6fk2YajteeFkTnCDqPwKlXwctYbzylvlDAR8H9BQpDFPh7nl70tM0fk7
         YXmCakjxf46aMnZUujzcHtpzBVk1CS2fmOF0wmhf1ba6JtHAUWMuH/2XXV5NmdYgPv3d
         V6Qw==
X-Forwarded-Encrypted: i=1; AL+hErG38YqH1sYPAyzOZpEptnP6bdgpM4yOp82cnKSX+xkX+Q8l1reX4m/BdJGS5v2Lc3XELldPNHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iU08LqvZ7LNrI1340I2k7RigwPhkFc2t6Zw40b9Xca2S7KWWk
	7S/7NNiSzLKGhMuLWQdL0DZUh6/V7uVm8vU1c2d04zdVRYY9PxYYchkWHsIitgUZaOY=
X-Gm-Gg: AYBFou21/Te7HdYyVjl0sat8eL/Asklb//996R8oEq9zbMcq4yq8zKAxVrIrCG4QMqe
	rXKhc7vy/1cL5bP32zWX207NFoj//iuUO2v20g/z4FSzTlHNN9oepWVDd0FAZbpwaWMECETvhe9
	aeedhREF5KN92DGQRZgPhKeOg/6K0HNLUJk5ZKaGYOGcerQEfp+Cbcjkyaiocpr3Zxv3W+WhGtx
	PcrB8W15eLPbzwthoG/KBqfPpXNqOATABCJhNFhodr5ze+CWmaWSlt0slZUXlSRe+dKO+H37s7e
	hPUfhSqQLFMPmsBzCTOy/dcjcZKWUYXPaW5Ymar/80QZmCsK83YZEgMGLA06WqY9h2bsJB6Iq13
	4SAaBcokgpQ+rvCIUZLk7k02diFfwZT52tvPY+OIFT/6JATvQuUhiygbxN+xnjyzfV6FDXYyCsK
	vUV5VDZqcDyADA+uBUbwTWaZgikcnkUbp4K2SxLbBQRs5eYDSoJkYOK0zefsgBaIF/zOoeyXelF
	1UmNuHqPUB3v4giX4LQio+RMoaQkNmQBx1eg9hSqcnl9ojAYJT/e2GjYm8edHUfySSILcN5sIfe
	SpbyUgyA8fKqK9UljgLPh3BNoy/+5aHvH3BlL5aC+jD/v0o66mQSSOTJ4qmovEqi
X-Received: by 2002:a05:6a20:2446:b0:3fa:63d2:4aab with SMTP id adf61e73a8af0-3fe8a41140emr2627637.37.1794931831938;
        Tue, 17 Nov 2026 08:10:31 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c800esm6071458a12.29.2026.11.17.08.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:10:30 -0800 (PST)
Date: Tue, 17 Nov 2026 08:10:29 -0800
From: Joe Damato <joe@dama.to>
To: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Cc: Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <avx8da+htUim/x9i@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
References: <20261106191423.4194081-1-joe@dama.to>
 <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
 <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com>
 <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>
 <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com>
 <CACKFLinsQdoZhEnhmZmMEMZVyGC10KZZRciBGLzA12W2iOK60Q@mail.gmail.com>
 <CAH-L+nOyNgAUMCF74OE+oU2gSCaV_tVcgm2QQFvjge10A+qAYg@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH-L+nOyNgAUMCF74OE+oU2gSCaV_tVcgm2QQFvjge10A+qAYg@mail.gmail.com>

On Thu, Nov 12, 2026 at 09:37:55PM +0530, Kalesh Anakkur Purayil wrote:
> Hi Michael/ Joe,
> 
> On Wed, Nov 11, 2026 at 4:34 AM Michael Chan <michael.chan@broadcom.com>
> wrote:
> 
> > On Tue, Nov 10, 2026 at 2:13 PM Joe Damato <joe@dama.to> wrote:
> > >
> > > On Tue, Nov 10, 2026 at 10:14:50AM -0800, Michael Chan wrote:
> > > > I'm copying our RoCE developers Selvin and Kalesh.  I think that if
> > > > you call bnxt_re_suspend() before you disable DMA, nothing special
> > > > needs to be done because the chip is still functioning.  It will go
> > > > through the normal removal process.
> > >
> > > I'm probably missing something but I think that the ring frees can only
> > fail
> > > in __bnxt_close_nic, where rtnl and the netdev instance lock are held.
> > DMA has
> > > to be stopped before bnxt_free_mem. bnxt_re_suspend() takes both locks,
> > so it
> > > can't be called.
> > >
> > > I think there's two options:
> > >
> > > 1. Stop DMA as now, but queue a work item to run bnxt_ulp_stop without
> > the
> > > locks. bnxt_re_suspend would need to treat BNXT_STATE_DMA_STOPPED like
> > > FW_FATAL_COND and take the detach path.
> > >
> > > or
> > >
> > > 2. Call bnxt_ulp_stop() in bnxt_reset() before taking the locks, the way
> > > bnxt_fw_reset() does, and bnxt_ulp_start() after a successful reopen.
> > That
> > > covers the TX timeout reset, which is where all the ring free failves
> > I've
> > > seen come from and it doesn't need any bnxt_re change, but it restarts
> > RoCE on
> > > every TX timeout and it wouldn't cover a case where the user triggers
> > > close/open.
> > >
> >
> > I have a slight preference for option 2 because TX timeout ->
> > bnxt_reset() should be rare and stopping RoCE briefly even if all the
> > HWRM_RING_FREE calls succeed should be ok.  We don't want to stop RoCE
> > unnecessarily during a user-initiated close/open though (failure
> > should be very rare).  So we may still need option 1 to cover the
> > other rare failure cases.
> >
> > Let's wait for Selvin's and Kalesh's feedback.
> >
> 
> Yes, we are okay with option 2.

One more question before I put together v6.

bnxt_reset() is also called for the silent reset on a VF: the
VF_CFG_CHANGE async event sets BNXT_RESET_TASK_SILENT_SP_EVENT, and
bnxt_sp_task() calls bnxt_reset(bp, true). With the ULP patch as planned,
RoCE on the VF would be stopped and restarted every time the PF changes
that VF's config.

Not sure how often config changes happen with RoCE in use on VFs? If not
often, then treating silent and non-silent resets the same should be OK.
The cost is a brief RoCE restart on the VF for every config change.

Let me know what you think.

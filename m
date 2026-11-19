Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795119598;
	b=VbbZqeBFxiaPPboqmdOMA7yC/lgTJBIXI4JcqS/H3WMTALiVcIspObP3p/Slgkzz8FcS
	 NaMT6Z4IOaNJUSF07D5j1SYO5UY4TdCenoiAVnflgKlC/X1H1jRhxfwHe7PyXlQskMZpE
	 KKxzDO8RVaVX+xUpYIMrEVwGGzFOho9nIkLxi6+nqAmsJ3v15IRe3DDddx4yh5+M/zzVR
	 I61/98NqWCi0SBT9wmYoCFuORp8aiSkic1i0HDl9B/MF9DtlCKj/C8apCH0AFH3bv2pSK
	 tKHR+GNNQtI12piZqon69H3fOgmyja/UZLeYF3PC+b6fm4fc4eNAlvMnmHTaa4ooOvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F2xVoYxI8iHY+M4xby/Fu/A2eRS3tQMl1tCS9r9EBus=;
	b=Ap7zazWmQOzFKZh6LrnnK7O0yvQ+J1PMfHe6q7fmA4GYZzoVEfB1tEdLyuEEBQU1oKan
	 bjhplHlFeXOdKqf6/FhUgajRSXG2IENCbqEQBeG0zuGv9vnn9mNWA6CqoTWW9nsmWGvTN
	 bEMSD1XhX3pMxeh6QnIDbdV67dzbnTucVnPf+IBfhj1hIXZKYhn4EdqqMgwTSw9u1Ii7x
	 N3xN8YM+fHY10VAnV1XLRwXkaXUeQ30i0s70BCfdqNbJphdDnWHDR9HpwpD9RcmXHBv+q
	 30qcCl3k5VXsXl3wmLLzrCqqXxUeZixOhs9dg+fVYYvL17kLqzN4jows3P5geCKSwAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jG3UyrHv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8AB606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8AB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jG3UyrHv
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070755c8cso114714b3a.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795119597; cv=none;
        d=google.com; s=arc-20260327;
        b=B2St59v77qmm6eUvxp/Y+I/T7f8we691dFEKSTmnjA+cJD32KQhYGNf6uqkOtHVljk
         eNYGhpsnhLvWzBoUKaO+oT7+ByxyzhNj+GCu/lwDnWO94XA/uG1Kw+pIqV2xsWXrMQpe
         F7A2euTaxIcdiZ3jaJ2aBzXei13Ry3e4H/6VPZbCof2qZfY7tH9IWc3qwea7sFQAUNJT
         TjUy8ITQu+wtPQujVI6P2iFGF2wJcQlSVoTH69WDW20w5kkzZ+giHdYbxACC7rkS+dzZ
         70WcvQl74gtx65SPhrPxTMPInWlfsFBBrybs87ybZBfRsFgoA6xpAHRL7nHt0DHG+xXn
         KMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F2xVoYxI8iHY+M4xby/Fu/A2eRS3tQMl1tCS9r9EBus=;
        fh=SoqfWmFpXsOUNRHT4vW0F90KhA/VxvaNeSDqj0VlzeE=;
        b=gYrBqphlSVAWTMaHcQ89yqC+qyJiqdmel5cBjwGLFMiKipci4LrNAvLusuJlh6z4M/
         GDQuXN5n9HMMkQv0p+vGPyKCQ5fiGp++Pq6ZkDjNEidUL8/3+XcSMKsf0+MnKx19x/EB
         PHmvvOtPKDIo4MW2UH+dDL7oyV7wiS1B8S1Lh0mgiz58E+say9o5FRerdK9q7M5oZq+r
         7zzqy7Emf89WrErTsE5y4j4OT792tYtg82jyK29n+Q/SafFZihdQ99EboTkyCgGcR780
         En+79lFPSv7y566x+2jLJ8MvEUhBaoJrYhdpw9zD669jolZNw6ujT4XcstpzmegT0HN0
         +5dg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795119597; x=1795724397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2xVoYxI8iHY+M4xby/Fu/A2eRS3tQMl1tCS9r9EBus=;
        b=jG3UyrHvzA+tr8YwOoFqIsjQ8PduudBjIJDr1LVn6XbovPc7bAGv1y11zo+kOwQ/oB
         mgH4z7+lLt5NVc58AR5AoZAmPPxv6+5EKi6L0cfJVTLU+45S2wDoUXj1+D/07djQZqWx
         YvMjh85mGUBdTTL7bN0VklX2QcCyFwdZ77ihI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119597; x=1795724397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2xVoYxI8iHY+M4xby/Fu/A2eRS3tQMl1tCS9r9EBus=;
        b=lT5D2ykoAxE5MEXlZ7SbbBRkkgYI2P1ptl4/Z2/76a1j9KEARh0oLdu1nEZfrMFguz
         qvPwnfFWNLDAQnyk2TLk7jdZ8iY/ucGcOuwbzCCZe7ny20VKDPs1szCefkDA8IFRjxGQ
         ScUOKlPtyOU2A87lEOReczBjQ1vbbUN6aMWVMu0Dla9hoxi3qM6MRzdg8Dgd4OdA5bCX
         xgyW035PcLRFQYdoCoQT7t0knUAsRYANqUcZwfOxokz2FhxB5LRqhJaaeX8u6je198Lu
         ZNc+2aa+u2O+Js0bF88pMqogvOr8eJKjPchA/ms/Gn9vC2hipb+9INxHbOCeZHpBBDdH
         Ph/Q==
X-Forwarded-Encrypted: i=1; AL+hErH46y5cIASS4vlfaTPiDmr7QA0sWBExPV5ebiwiz6P4M8FHnGgw+h9sRKFtJs2eeVuhaSSrujc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bvsk8fzPa0XQFVgPGK+gM4/Or1wHqc459hRCazCYlfeEOd0IL
	qX2MFV0Q5D4y7esDm469jyxBCaTyOhFj7HUiwWLjGVt6jha4zmMDon67t4EXTz1/oK497xw7Fzq
	6RUzNX05/72XOnwyWf4lCCxGb8iNaVzG25WPqp0oj
X-Gm-Gg: AYBFou0/aV2UR/aybo1VQCiUFKZs0z1ugJazAKy0O0vsz2HR0SKxLRt9cbq46rWjej/
	WJU9douVTTHFHkazLJPXEMr5PMy24lb5DSiZw+truLjv3MVWpVFitfGTIdH/vZY75MFAxtyJBSV
	MpT0H8apNS/FDf2YGL3NZi6f8qulLkuT4zgMAPjOFtwF5CYNaQi3eOAJLWtZDjGp31EX1aLdNKe
	BlDqnG7vdvNZOPQX61vgSX3bZ545sZPJFzxUEDj4c9ZnUV0KMUgK5CRVYHut4zaxXM5GTWAjy06
	/EfpfPiDII9f9uCsisRsUxDKckFxN4sSaZO1rLlcbrLywQFh16TVUIDPAOS/A4HHQXAL13m7SdZ
	jlonKGhp2reMHoX0o6gwQRDgl+lQ5sW8PJaxmAH6Rj9a2kfxFIaJ1Egn1nMXfG2LjJpUruYFZwc
	KBiryLHp+UVZVwzQyMDoBe4mAPoJTY3MGGq5QO
X-Received: by 2002:a05:6a00:94f3:b0:882:6836:25f0 with SMTP id
 d2e1a72fcca58-8c87d1234e8mr688259b3a.52.1795119597132; Thu, 19 Nov 2026
 12:19:57 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <QDISC-7SHE.v2.r0.20261109072128-1@mojatatu.com>
 <179494556684.3136.3254895311432959761@kernel.org> <20261119133720.GY860048@horms.kernel.org>
In-Reply-To: <20261119133720.GY860048@horms.kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 19 Nov 2026 15:19:46 -0500
X-Gm-Features: AclHuK-1ZyLGQrtoEZVe7WxfAah1ikW8aqkVa1d3jd55mlqmaGFTG78YIM9i2VY
Message-ID: <CAM0EoM=5dp_51Gr1Zz8+YaFO74L0A56xbmtW8reMTVQT4auMKw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net/sched: em_text: pad the text pattern in
 the ematch dump
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, victor@mojatatu.com, netdev@vger.kernel.org, 
	jiri@resnulli.us, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 8:37=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Nov 17, 2026 at 07:59:26PM +0000, netdev-bot+sashiko@kernel.org w=
rote:
> > Thank you for your contribution! Sashiko AI review found 3 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The commit message says "A padded text ematch is the same si=
ze
> >   as the request that installed it ... Since the dump is no larger than=
=E2=80=A6
> > - [Low] The patch fixes a long-standing, user-visible netlink dump bug
> >   but carries no Fixes: tag.
> > - [Low] The commit message describes the impact as "the ematch list is
> >   therefore misparsed", and its reproducer needs two text ematches.
>
> Hi Victor and Jamal,
>
> I'd appreciate if you could respond to Sashiko.
> Even if it is only for the record.
>

Sigh. Ok. There is nothing for us to fix. Same comment i made to Paolo
when we posted v1. We sent v2 with to fix it's dislike of the commit
log.
We could go and resend the patch and fix the commit message but that
is another 7 days waiting for the next review. And it will find
something else in the commit to complain about.

cheers,
jamal

> Thanks!

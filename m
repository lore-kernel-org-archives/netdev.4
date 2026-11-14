Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672473;
	b=Wwk53FhffvSMn85v6rBoBS2gDLUO+ANXFp2+Yt9KIPlr3EsKqwlu3JChAym8BvThaVyW
	 XXkVIjx8pJayPuXRa1y6D1YJm6LRtE6tgltdz5NrPK0N4DU56mPomgmLvabPxjv8YbjcP
	 U5va/X5eXupzQQPoVI970eNuw2gYA1dfD4gLdZynxgupluHaGIqZajffT6iJH64m622+a
	 RwM05oXDDJzkZP4gJEGCEeRF+EEx32WySz/L2SAI2aopXsCKxZ8Yg23mK9iWf8YQWGzdY
	 sC/t2xUJHRIR0mQLUeCKUffXVrJwa6aHIPBlpltKtf8LOaXY54OvDVLd3eCICmYvCXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=an3kCK4L6fdSMAjvEFasfLoHSmzT6HolukDgWBOE/rc=;
	b=YGfuOSapOlZPuONt/x67vWBcQQG26v8ogusOs/6o5TCInXyWvvao+dueiWs2JuuYROGC
	 A/um+zUccLUFtaOVsyBo/au1wtXOUJIdCCaDvDVQ6zKHguBDvjADGxyCc7vCrxjFo/dwm
	 Y5sftvh/Y5UR07XF+ElfqEHypx6fcYDD9v5LkKh29Svbqm4OE2oC8VBYKypHre6rtahNK
	 53AOyY2ruwiiyyosHjrnEdeagx6Wg5E61Wi5ytD1E2O8/FQR21NWLG7FR0W6tgCr9i/l1
	 uxcLdC+Iyl/rxZHvYph0jSK2OX/tsCCsPREA951evgy4fO7jKF9wC2vogjrm05ASXnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EM8HOOKX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DF5606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58DF5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EM8HOOKX
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3ada81853so1898403c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672472; cv=none;
        d=google.com; s=arc-20260327;
        b=hYzef4DEdjT/8nkATBmzXib+lsvrM3pmLk6d90jWOAn8DSNxtIzl5nZH2M1n9rteSi
         05mFSBTrnt87hyunGJBaxGNAJP5DVcK6nwj+O0joZnGktyxU9/PsWtlaDm7FWAd4N/Qa
         gwMiLUgqia6FUrQ3jBMMIPNjlhGIoO8QeSo9VLdHoo8r0XxjUIPM+cxMSzI5poovN533
         MMTqrWRdlyflU6XLvHjQhsaxy3HhyF5R4aQs0CrTASQE0r/+HYjs1xUKsLTtvMMJjkbw
         +7Nt9xZcA3ZpPIopMgSuwoOw2eL8AJkgYaaJU94G9VoQtqZ8OKySmler3SVl7ojCzPnQ
         PLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=an3kCK4L6fdSMAjvEFasfLoHSmzT6HolukDgWBOE/rc=;
        fh=q4M+8b/8XtJQ2KCR5uqj+wKFpdQs5MzvxMz+NCo6MSw=;
        b=PsFYJ3ExusuUCUmgfsgYsuIteOdg35QWthTDVJ3GU5v+N7pe+RDkQV+jjTLcU+VNq3
         h7kRY/L3Zw2i6MeDmW9Y3kqQWuFKwYinKC+jPqNk3KnXcveEoUGPc1zVrjrcBtow8llJ
         M3RZgDk9czsywecGumkNULD5r7nKps7I+pKKweU+TIVWObaMVakmTSPSrJPg5uCm3gvS
         /aQZ7b/z+hVPP21sgM2+Z0oLod58MsLeZzQ1nQs0CeHAw8GRXAX5L6F9Z1dO1WB7bu9j
         zTEW3z0ybn4zNwbqCNYQiM54RY6grZyfOZ2Kdv0TTf17h0Sb4GavkCg8AGMX6sZNzN66
         zE2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672472; x=1795277272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=an3kCK4L6fdSMAjvEFasfLoHSmzT6HolukDgWBOE/rc=;
        b=EM8HOOKXkXs2sle8jxXpESIIPu7gh94FpbgAGesjMfR2ipa9+RZ0VcDGSEUb0jeQal
         /D3g5w3fCOh74bbYcyPtSGU4fCaMxeALAwXdRJUhO3n+/GzdtCFAF9GwgSbTCgCGn0TR
         CqzasPhCdtzS1o647naLUNctVPpF/Mbt96xSaw5j31sg9E/HskFhL+9LqMF8XsFG1Ka0
         5jGd0xuDlGlhWcA+0E/qdBK+ZgRUNCCw076nkSnCTnaf49ka6c9SaGgm9bdrKmvlO9Rm
         JPAYWilY/U/7u3hl+sNoZotHEyKtc86P/m2PRD2s34mpZgSuysYAsXae47Ckq1+boDXC
         poEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672472; x=1795277272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=an3kCK4L6fdSMAjvEFasfLoHSmzT6HolukDgWBOE/rc=;
        b=W9jCvlA21uh5TIGf7bJ2a68Dim4+uGzGnQK1nwRecIWXV3qpJwopEU1500LvGTBN/R
         3YjgFUwzcEWMQFA0flA+GzApgWNvCrHiPOPYyRVYCEGx/y543gxa5xOvH1ZrBnAu0fwI
         NnF9obGU9PxV3+T0GfVTcpTFmRzHhW/eejvH5CiIkkcozB99bWDv5erkv7UPNKZBgqna
         IR81u+z2snjTIoUYSnnRiWT20P0jFI4G5fACxNuk2GihFvMv0eqkTkW0QcZuX2Db/V37
         sqNAzLy75WhBacAdIZL2XZtmqNUoHwGDRgitT3gEXeZbHyGU4xbYWboUEvdwp/DC1Lhc
         339g==
X-Forwarded-Encrypted: i=1; AL+hErEQVdJIYQO5Ywho+3jiWIUr0n9N9zOAaCHxGkTXri+OK6Yam7HkuHR+yP++3pUUJDXzA9gfmiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z83xVYtIrv+l55l166s52TnfcvQhTV+BjKNZtXikey6h91J9lt8
	41S8Kxwu/cj/gvZzwD2SAk0d8+VjvjvT7W0HFacMPu6Iz1ylzZ+HM2LAxRpdiBWv3w3FMp0eqXF
	c9ULDiW42pKEzbJ/ezfDawi/San3NEG/hoAQNLXD8
X-Gm-Gg: AYBFou0CZ2YHf1V1wrLCGis408B4fC4iR2Fb7h88FUbJwyaVqSyvc7STg2qYceoMheH
	tAXMqSNck/cryOjfgRhNruF88fWg/fBRdiEEzodeUOh0tGrjyvqFBNa9zYjiHp4XGpxStoEO2Rg
	/KOx9QRjHN9Wd1RM604z2SKSxE3fmuR3fZxNvyXngtEChMhMzbrwAR/pNSyoUoiHfJLm2M/3csx
	RjU+4kGJRxIbB9+lHhgZYzqEWp0MFB/snD9kulJD9DJmKMoZyu18IfzQkPH4jlhBFwH4xp6ki6u
	PSgENyH29HiNH4oFJpXk/wNcxLe0/byAP9iWdvMxGN5fLhepPiwduXhDGU2WCBf/4d83XDBJ9ce
	JZqYMexVlun8qk6xCKav4FQvBOlx8nyHqHGpEkJrdLgFMPbW80XdrzYpc6Yz0FNGWPSeLxzmZPI
	LxoPeVuicLFKDRY7s1lh7rfh94JvuemtaECoOYXS3SQugzGl8qi9l2C5Yt+rndSQKIPzGMCYtza
	1Vsb4aqzg==
X-Received: by 2002:a05:701b:4558:10b0:159:aa67:28c1 with SMTP id
 a92af1059eb24-1b5031006f4mr5525004c88.20.1794672471459; Sat, 14 Nov 2026
 08:07:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114040101.1043546-1-kuniyu@google.com> <20261114040101.1043546-2-kuniyu@google.com>
 <CAL4Wiiq9VH0hw0=TnDc_f5v4AMpkFpuRB4t8vNME-KzKKzy1uQ@mail.gmail.com>
In-Reply-To: <CAL4Wiiq9VH0hw0=TnDc_f5v4AMpkFpuRB4t8vNME-KzKKzy1uQ@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:07:40 -0800
X-Gm-Features: AclHuK9M0h3L2Edp8g_DMTAT0Avzo6dD2oqoMsDM9nCD3Iwykny-FS6BUuxMc3Y
Message-ID: <CAAVpQUDB8RFaHCHnZKRodm0xhJz=zQWxF_69j46=uo4NP1-PQQ@mail.gmail.com>
Subject: Re: [PATCH v1 net-next 1/8] tcp: Clean up the first loop in tcp_collapse().
To: Eric Dumazet <edumazet@kernel.org>
Cc: Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 7:32=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le sam. 14 nov. 2026 =C3=A0 05:01, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > tcp_collapse() detects skb to start collapsing from in the
> > first loop.
> >
> > If the last skb has SYN or FIN, the condition is tested
> > again after the loop.
> >
> > skb_frags_readable() is placed inside and outside of the
> > loop as well.
> >
> > If we goto skip_this in both cases, we can remove the second
> > tests and simply replace end_of_skbs with the inverted loop
> > condition.
> >
> > Then, we do not need a test for tcp_collapse_one() too.
> >
> > Also, skb_frags_readable() should be tested after the fully
> > overlapping check.
> >
> > Let's clean up the loop.
>
> This is not only a cleanup.
>
> Before this patch, when a SYN/FIN skb was overlapping with the next
> skb, the loop was left with end_of_skbs =3D=3D false, and the test
> following the loop made tcp_collapse() return: nothing after this skb
> was collapsed.
>
> After this patch, this skb is skipped and the following skbs are
> considered.
>
> I think the new behavior is fine, but please mention it in the
> changelog.

Will add more description in v2.

>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thank you!

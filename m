Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929498;
	b=HHI8ORuOEFi9fjNtdkbZrD9nSnUdUX8JFcehndrxUCZtCjgru2z9ydXdp1pFy1dCZaDA
	 OuFOkdp5pJeG4LMzy2JPZL0AbRKLiv3NxaTJMXu+HxecGXK2GNWZGdDfTwL8rzG3e78Y+
	 o6GbcnULMJlzj+moqR/rN+lD+QISRyhlYKnyGQuEOYN9VjY5qFQxoF+n6JCh1WGPnRkHp
	 9LXJue8TA3ARUtyuYldLWcG4x786hWrCKZ+DxwO1dMMD0T8DHmCRndlaz7z/WXlm5bKQU
	 Wmu/89abm0MHj39Ul86NGEQeRmi8CObkK26CR2OlSkbq8UN02FCIOUilCUBBI++ZVfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929498;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=ec5MdJhhgO/VJCpAu5Hd71J2TEFZvSCO8r6kfzvrqSY=;
	b=KPTdozqFhg19b6i5SIb5McHO8GLoQPRnG2PGhTP344CRgftvy7ocUyjMhE/YlTeVGZ6g
	 h1q44xUQUgkQ9NgtJsFmCk/D+LfrAay1K9nUR4pASMEhXixwRI5mxP+5pxLJTHQKKrvGm
	 Srr6Zzo81v6g0ymQYR2LHITgslrEhteRbAEgpnA3hVEaD49k+X15wkOnlHMJ9GGoNNcKj
	 aN2H+eX2mQms2jYZI3hU9gfkf6zNj6dqSibggkkeGxNNk3vVsy8DdTecKm1aQCvV7ZjRW
	 vWJyogErNtCrJ+jRDwvNNGQemITOP13O0E6qPhy+6NFmFrn/dpKqYxcHkxXCandK//g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dSWMKyXO;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A327606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A327606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dSWMKyXO
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so886008a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929497; x=1795534297;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ec5MdJhhgO/VJCpAu5Hd71J2TEFZvSCO8r6kfzvrqSY=;
        b=Z3fXBZnWEaLUK/avTG+aws4DdPMvrbDaatkTTVfYhXUC0DkaqTi2rpfbKTAy9wkOJG
         jnekI95snNANFKqoYThJjVhxphmRc/CTW1a+hbadnIbIQicJqIEttgDOdxRRoViPdtsE
         735T3IG0T4TxRGGyHJP1bwaBxE2N5/PzIQY0oYXq+q09wZZu5SEAvwmorIyRvwCbmOr6
         IPT4GYFB4dMsZo1/hqTjd8JnObEJ4xr2utOfq6FlFbrvtDk+ubpMMDmvioRX75VdBCt6
         hyHXZTqBvL/0Fg4FnaT2OjcgOFDLeuWXBlquQg8YOP9SsNgouprgZZ4ZVmog2/YBeGxG
         qgGg==
X-Forwarded-Encrypted: i=1; AL+hErE9DMx5iIxUURlM71mOx3orJT51noYvP+gQel2yi8vyhz98Rt6TpQT1y84kPxkS3OAlgAWv8yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b0iPQOCeT6FavM6iXbLxS0mVx/XK41BId+7fgfAjGb6/cWmHj
	jjmqtGXQqXycgeuJquuaUaPtqwrcx2jVj1SYABTKdtHkT4g9Fb1zQWWInC06qfqyVvZAzC4AZP7
	aTadvX2UPc0DC+sH10s1XNh9vw4/IP3ru18MrABAjD/MftEfLJlKUQQtZ6oLoHK6hmkZIFMl2+T
	sJQ2VO63qz9/soIVvoDSVyDp7Ic7kmmMF4GXQ7r2eSE04xq3ZcMwhXgyeCccskH1tEEzs0hFBzo
	D9dW3vKRus=
X-Gm-Gg: AZFdTZeOdg2S1HziJwJ1Q967sZnGiz7AEeyNSs+Mmcn9mqxFdw/wBu6qjfm6el3hjRw
	V6JFywPiRxh2+/rzOmazjVstNZ5pHD9sVzAvUpkvaa7F4Szuqx9AwVcqQsqg8lPAY66fhRqYgXl
	C9Vh5/uAupWj85qnnQA2WvP9zWkGN7y6mn5kF14GqkOP6+4I4fpMVb4vWmJDZ3KFojtvTMYE3bV
	AZ2XeiYjDTMxZ4pbFfhMh/DinO2X45biJCi3dbr3av5M9Sd4xq1zwEvWCAI0CRVhHYTs+L/K8hZ
	fqPrjcrBcTb6+8pSTRX1eHx2a2wZ9mdbCwJ6B6Y3XZOROPh/IE1GVIXyOKw1tNiSCMwUIrHTToX
	MU1P5aGfWTA8XAOwS2QLbGwTIa1SAL1tDORAKIBL3Gcq99RFmMttwsRnbEnKOdO0p+eRwINueaL
	2dYK/J+RZ8QbcdyEj7zgt9Ab4Zpik8qH+xo22H9g==
X-Received: by 2002:a17:90b:4f8b:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b1b09f60efmr13860243a91.17.1794929496608;
        Tue, 17 Nov 2026 07:31:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abece214sm2145759a91.3.2026.11.17.07.31.35
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:31:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b6723180baso4882026a12.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 07:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794929494; x=1795534294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ec5MdJhhgO/VJCpAu5Hd71J2TEFZvSCO8r6kfzvrqSY=;
        b=dSWMKyXOZQlD5A3nH50R9UrmmyPJqpbKE4CFg5LRGllG8A3nkVxTj+bLvf13FQvP2o
         cSAUGx3y+ntQ8JlJRu39t8m9Hwf/v90wYxwb/QS+wu2JKHspoC8gk779oMnqHyDzYSTc
         9tTelSc5i+2bMOBW8ign0/KVaDiqd+n8qh0Jo=
X-Forwarded-Encrypted: i=1; AL+hErF9xDU5ZD3u2/7djOcuEJWRK6fNmjVFlwSBkvr5GRCxUzlh4FfX7IarlcC+zmFejvvyFKz3OVw=@vger.kernel.org
X-Received: by 2002:a05:6402:1d52:b0:6b8:6f88:b642 with SMTP id 4fb4d7f45d1cf-6b86f88b84dmr1596599a12.44.1794929494461;
        Tue, 17 Nov 2026 07:31:34 -0800 (PST)
X-Received: by 2002:a05:6402:1d52:b0:6b8:6f88:b642 with SMTP id
 4fb4d7f45d1cf-6b86f88b84dmr1596564a12.44.1794929493925; Tue, 17 Nov 2026
 07:31:33 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111123917.910416-3-pavan.chebbi@broadcom.com>
 <179474752179.2199510.16313103373279878088@kernel.org> <CALs4sv3HQEOHfQG+b1j8p8_iOAYoX4iq=3odsGHFkM=wbpQm=A@mail.gmail.com>
In-Reply-To: <CALs4sv3HQEOHfQG+b1j8p8_iOAYoX4iq=3odsGHFkM=wbpQm=A@mail.gmail.com>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Tue, 17 Nov 2026 21:01:13 +0530
X-Gm-Features: AclHuK-8XiWwKgSLLGklnNRsdICURpWHdvp-FrqFBYiNycaSxzeZ_vI73eDdD7I
Message-ID: <CALs4sv1pFUo8yWCK9a2XknYiPV=R=CHkszkvvKNyfdzRcqBYLg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/4] tg3: Select PLL clock when preparing for shutdown
To: netdev-bot+sashiko@kernel.org
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch, 
	andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com, 
	vishvambar.panth-s@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000eed8b106607a96b9"

--000000000000eed8b106607a96b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:34=E2=80=AFAM Pavan Chebbi <pavan.chebbi@broadcom=
.com> wrote:
>
> On Sun, Nov 15, 2026 at 6:28=E2=80=AFPM <netdev-bot+sashiko@kernel.org> w=
rote:
> >
> > Thank you for your contribution! Sashiko AI review found 5 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 4
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [High] The workaround is skipped on system suspend when the interface
> >   is administratively down but Wake-on-LAN is armed.
> > - [Low] Claim: the commit message says the bit is set 'On system suspen=
d
> >   or power off', but tg3_power_down() is also reached from=E2=80=A6
> > - [Low] The clear in tg3_resume() (line 18277) sits behind `if
> >   (!netif_running(dev)) goto unlock;`.
> > - [Low] In tg3_resume(), the new tg3_ncsi_pll_tlp_clk(tp, false) (line
> >   18277) does a BAR0 read-modify-write of TG3_CPMU_PLL_CTRL_STAT.
> > - [Low] tg3_ncsi_pll_tlp_clk() returns silently if tg3_ape_lock(tp,
> >   TG3_APE_LOCK_GPIO) fails.
> >
> Agree with the findings. I will address in v3.

Addressing all sashiko issues has changed the patch drastically from
the original and needs re-validation on reported platforms which is
going to take time.
I will drop this patch from the series for now until I get it tested.

--000000000000eed8b106607a96b9
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
/HTPxpDrr4vzZL0yoc9XefyCbdiwfyFl99oBekp+1ZxXc5bZsVhRPVyEWFtCys66nqu5cU2GPT3a
ySQEHOtIKyGGgzMVvitOzO2suQkoMvu/swsftfgCY/PObdlBZhv0BD97+WwR6CQJh/YEuDDEHYCy
NDeiVtF3/jwT04bHB7lR9n+AiCSLr9wlgBHGdBFIOmT/XMX3K8fuMMGLq9PpGQEMvYa9QTkE9+zc
MddiNNh1xtCTG0+kC7KIttdXTnffisXKsX44B8ECAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUxJ6fps/yOGneJRYDWUKPuLPk
miYwDQYJKoZIhvcNAQELBQADggIBAI2j2qBMKYV8SLK1ysjOOS54Lpm3geezjBYrWor/BAKGP7kT
QN61VWg3QlZqiX21KLNeBWzJH7r+zWiS8ykHApTnBlTjfNGF8ihZz7GkpBTa3xDW5rT/oLfyVQ5k
Wr2OZ268FfZPyAgHYnrfhmojupPS4c7bT9fQyep3P0sAm6TQxmhLDh/HcsloIn7w1QywGRyesbRw
CFkRbTnhhTS9Tz3pYs5kHbphHY5oF3HNdKgFPrfpF9ei6dL4LlwvQgNlRB6PhdUBL80CJ0UlY2Oz
jIAKPusiSluFH+NvwqsI8VuId34ug+B5VOM2dWXR/jY0as0Va5Fpjpn1G+jG2pzr1FQu2OHR5GAh
6Uw50Yh3H77mYK67fCzQVcHrl0qdOLSZVsz/T3qjRGjAZlIDyFRjewxLNunJl/TGtu1jk1ij7Uzh
PtF4nfZaVnWJowp/gE+Hr21BXA1nj+wBINHA0eufDHd/Y0/MLK+++i3gPTermGBIfadXUj8NGCGe
eIj4fd2b29HwMCvfX78QR4JQM9dkDoD1ZFClV17bxRPtxhwEU8DzzcGlLfKJhj8IxkLoww9hqNul
Md+LwA5kUTLPBBl9irP7Rn3jfftdK1MgrNyomyZUZSI1pisbv0Zn/ru3KD3QZLE17esvHAqCfXAZ
a2vE+o+ZbomB5XkihtQpb/DYrfjAMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCH8L4C
oP9ybV7HTgtfiJbpx3F3E2DPyqthdeFjnc1/UTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMTcxNTMxMzRaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBjDJE3fr2YnqqRysO6M4KN95SkS1PMEopNc5EKjgS4
PT74cracoJNUGOvifzjxXpgr0JdiwH89xozeHFlY9m49FYAe70WcNUzNJq9rYouxFlWSgB4DRwys
GjCbNamJk+ZLbqLycuRzUOPtuF4rWxIn9Z2nMROVUQyJQiV0UCHtpEtbgp00ecAmcCS0Za70aDkw
l7j6gqF186pYLM1hUKOdJFYAw9TTUnW3CwRFsFi2I1HDkLBZINWj/JrEKMr9lPlmnpkxnb6/Yiju
t8s3lU+XgI2nFdPtQScwQjUKPwts2V+3icxjaMoTMEKcsZWhYAPY6Jez2p5xMuwcZhtiSIM0
--000000000000eed8b106607a96b9--

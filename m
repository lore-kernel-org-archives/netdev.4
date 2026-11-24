Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524500;
	b=blyiWM2SkSXIjc8xMvgEEIbDvWQj8oFIr68O7IcoGJg0gZW0HDb7qZlyR2F89rUASLD2
	 jr1SByebeyPfL1tvKfDZXvV3MRKijNX34mT10UcNWpHLTdThnsA9IkSv5r/AcMBwpCUYq
	 C26kmT14fLaWx88+A20pkeiw0Oy6KLJI6d7MU7KV1C5GxEPXgt+gASFQLFRKIM7GbMxHH
	 Yf79Mv+YhheM2uRlAyZlpwqH0Y1UUmbSkFO2yRbSfE1QVV97SeuBswvobCetw2lhZENpJ
	 9OSb5EsGU7xIH1gBd+U47f/AWGLukFYIBooq+LEjtlWVmhzgZOPePi1yNJP26+qgYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524500;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=JB2rPKX/2k95Zt0FkXGlTZj3UeFZqrmRc718KYS+BM0=;
	b=b4tpXnoG9sonFxrrlaGg4LgGZNclBl6bOsRviLQGvcwR/eS89nvMhZ5wR7gY19khonqm
	 LtY4x5GeLAN5bK8caXaykwej7L+e2G6rpQbhjQzQvwkuMS6F1kb1vIycm59vV6xGtEPVk
	 Gyty7z94V9Tt0h0lNtLo09nj9MJamkM0VNwAZLESGKmZXXTy6Vm79Xt0TbihAi6gHNz5u
	 6PDKQeeVLLNkUn01q3VxeiVFlSuwJqqO0XXBUYZYi46uV6aunHgoZ+Dl7omloDRrYO1fo
	 UPZo6MonXo2f8umDDq1SRQWEt6LjXUUScKabMQVUHLBcYTR0H9tnMiJILygm2hvZJ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=b1bFTEAo;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F8606A32C
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788F8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=b1bFTEAo
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so2359953a91.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524499; x=1796129299;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB2rPKX/2k95Zt0FkXGlTZj3UeFZqrmRc718KYS+BM0=;
        b=l/jeQ7y0TfROgv0jnie5zicVQDsZkC0zR5WNF1u9imFwwCZji/Zi23RQmE5z5HLvvZ
         dZSqc58WME261A6cs4M0o5JNSViq3hHgnq1uWrUOQfPtt28s9aOe5hP6R0MViDz/YeJe
         z3sNwPOZhbBkXs3Qu2sNVCEy7mTh2ATEjmh8vpj9gtmMzJsB6kUdggaRb3IniedWuWXc
         P1XOO0Z3e1GpFXHH/jfGKNT0FexQdsueeXGYiWg1Xa5ACCe8KNcwt4g3918QWZTl0gW0
         B8lKEA7xaDA4zDPzpqZnm/lEnGXSmh3KXCUJIIwCF2wtoNqB5GqhScz5bzqRQdcS4coX
         shog==
X-Forwarded-Encrypted: i=1; AL+hErH1wqRWU5Io6bUoKkUoCKbkrSnbqis9M2e1dhM4TcpWnoMpNOSPa8ZF7Xj3NIDy4azly7nJb3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+llF7qSTuhqOq4zlZMMRrL2QUeWMYY3MYLQixY5Lfv2hsW6T75
	lpvUCQTFn6y/Hnlbp5+gcKloqne0hfYmprwUxu8xD1o84cp8MJrkGKJpeBOfvj/JjKXdXtIsbXm
	MHbNVGRru+uVdD+WYGSGwqw25Z4nPK2BoMEuUpQStCayDpicv1QoMsClR6GP1k+GxLx5ONDtO6U
	bha/Tpzg2ErRLR2zun4UpWjheELzQ0ZJ9my78mZWCOkxgoPfhZLZB6zPgx2p9jYoRRCP7sBaz61
	8vNhSyotOIpGA==
X-Gm-Gg: AZFdTZeoEHJAHbgTBk6hQdHbC6X5a6UiqvjMKEiBC6p4+qDZudsiIUQEHBWjN602mLU
	wtq7wADA7x3NWie1ELHkuMjDFQ+EgjNWHy3IH5D9yEL3domJYfXL3sHVTXEqzQZKZZZApNmx2f+
	Sd3YkOQp1N6EooRS5FJ6WjNsK45SaiTFwzMnJ+5WHEeks8MsuntNrJEN828XxhTA5Kk/6JkhSxl
	QNwftgVKhWAlEQ8GI2TLZVle1fpOclJzytjQD/4P9WgGgk31R5yDFa+WkVP8gfgN2enG7sih6aJ
	GSPPXR+899FGdVsdeOeHf9MGCeOoGFjbGbLPchYs1Eo9TBOa4gGI1d5Wr8Y2B+FTgMMCl157eVY
	2MJLrcLHuhaAlSirw8EKXQhW+bHRkFyjFPhLXBHpK/sXqc4iW/miMWAKovqxsBJWmFe1RbHeUMZ
	RWI7FSDnqKKjxr7wVr4Au6lmS/Ddkq0TUgwWIXgg==
X-Received: by 2002:a17:90b:2e4b:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3b41c96ce70mr12325604a91.50.1795524498512;
        Tue, 24 Nov 2026 04:48:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b40625d66bsm11231984a91.4.2026.11.24.04.48.18
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:48:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8bb1a7b0e52so2993162b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795524497; x=1796129297; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JB2rPKX/2k95Zt0FkXGlTZj3UeFZqrmRc718KYS+BM0=;
        b=b1bFTEAooN4ux4NBLyjBQwviBmEfQOImhC1kIFcIF3t4Bj3WxOQWGsc1GE+GtpxI4Z
         ofNCH/84MthRUKdfldD5UHVqjKiavtgQjU3iQ09g0xqmYSlgdP/WITJMFZ8vKJDK0LNt
         7FPScUuDtV7f6UtggHe7LJG+I95dtK0/KQhKM=
X-Forwarded-Encrypted: i=1; AL+hErFrlnUOP9UZRub1PN0vb6t64AmLj1AGcrW+taVc3PYVuhyVYq7YzsS+jak5gjTX2pvEeqgIGtM=@vger.kernel.org
X-Received: by 2002:a05:6a00:a12:b0:8b2:15fd:d01 with SMTP id d2e1a72fcca58-8c87c38817amr12003657b3a.29.1795524496851;
        Tue, 24 Nov 2026 04:48:16 -0800 (PST)
X-Received: by 2002:a05:6a00:a12:b0:8b2:15fd:d01 with SMTP id
 d2e1a72fcca58-8c87c38817amr12003640b3a.29.1795524496392; Tue, 24 Nov 2026
 04:48:16 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
 <20261118105408.1076095-2-pavan.chebbi@broadcom.com> <20261124114338.GK31322@horms.kernel.org>
In-Reply-To: <20261124114338.GK31322@horms.kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Tue, 24 Nov 2026 18:18:05 +0530
X-Gm-Features: Aa3M54qnMV-r97ORiTYwgWAlz5J0JhKQlSQbd2FBv4TQeHgapnDbJfKCO3xYKXw
Message-ID: <CALs4sv18PR8cvyV-NN-M3HA7S6dQJeSa-L2TRevEO3RR3ZkBiA@mail.gmail.com>
Subject: Re: [PATCH net v3 1/3] tg3: Don't fail probe if 31-bit coherent DMA
 mask is unsupported
To: Simon Horman <horms@kernel.org>
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch, 
	andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, 
	Rui Salvaterra <rsalvaterra@gmail.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d7ecf20661051f56"

--000000000000d7ecf20661051f56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 5:13=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Nov 18, 2026 at 04:24:06PM +0530, Pavan Chebbi wrote:
> > Commit 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for
> > BCM57766 chipsets") lowered the coherent DMA mask to 31 bits as a
> > workaround for a spurious address overflow error in the hardware.
> > The result of dma_set_coherent_mask() is fatal to probe, so on
> > platforms that cannot satisfy such a mask the device fails to probe:
> >
> >   tg3 0000:01:00.0: Unable to obtain 64 bit DMA for consistent allocati=
ons
> >   tg3 0000:01:00.0: probe with driver tg3 failed with error -5
> >
> > This was reported on a Mac mini (Macmini6,2, BCM57766) running a
> > kernel built without CONFIG_ZONE_DMA and with IOMMU passthrough as
> > the default. Without CONFIG_ZONE_DMA, dma_direct_supported() only
> > accepts a mask narrower than 32 bits if it covers the highest
> > physical memory address, so with direct mapping a 31-bit coherent
> > mask is rejected whenever memory extends above 2GB.
> >
> > Treat the 31-bit mask as best effort.  If it is refused, warn and fall
> > back to the mask used before 614f4d166eee, so that the device still
> > probes.  Platforms that accept the mask are unaffected.  Where it is
> > refused, 614f4d166eee never protected the device, it only stopped it
> > from probing, so this restores the behaviour of kernels before that
> > commit.  Warn when a status block lands at an address matching the
> > pattern described in 614f4d166eee, so that a resulting TX timeout can
> > be identified.
>
> Hi Pavan,
>
> I am not following how a BCM57766 device can be used on a system that
> rejects a 31-bit mask. Is the idea that TX timeouts are infrequent
> and can be lived with in such an environment?
>

Hi Simon, thanks for the review.  The report comes from a late-2012 Mac min=
i
(Macmini6.2) with a BCM57766.  Its NIC worked until 614f4d166eee made the
31-bit coherent mask change, which that machine does not accept, so probe h=
as
failed there since.

To your question, yes,  I think it can be lived with.  The erratum is
triggered only
when the status block lands at a specific address, and if it does, the
driver's reset
logic kicks in and the warning points to the cause.  That is better
than the device
not probing at all.  Platforms that accept the mask are unaffected.

> >
> > Fixes: 614f4d166eee ("tg3: Set coherent DMA mask bits to 31 for BCM5776=
6 chipsets")
> > Reported-by: Rui Salvaterra <rsalvaterra@gmail.com>
> > Link: https://lore.kernel.org/netdev/CALjTZvYKHWrD5m+RXimjxODvpFPw7Cq_E=
OEuzRi1PZT9_JxF+g@mail.gmail.com/
> > Signed-off-by: Pavan Chebbi <pavan.chebbi@broadcom.com>
>
> ...

--000000000000d7ecf20661051f56
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCApc4AT
E8z34IwJvyqoJ2y9Wf2/63MapVkCXDTqzCubiTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjQxMjQ4MTdaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCJiSKMjJTLo4ycaVaJHDtqW0QKQzBJPq3xp14XvJeA
gFhnwjWo0fc7p68Lq0o9s1VTEKdduLQH7cX9kKbJmDSfx5JIIZAn7YZ++mdRvdm0hx/u5wAmCRKC
xF0zL6d4MCgm20xbNOqskKxWnudROH6XhzmSPcwauncG9BWUEX7M3hQkUAzLXiqyGE8NVZQBBItO
4yPYL4GXEtm1ElxqExxFsu99FDoQRXW27lli7wA89OBUTKcLSDif91yHT7NHP3Juxuf5acUJKi43
YgVBUAVLo/DTE4NMac73zIH6BVsjPo4vDpt8Lpz4uDnOudVkCQEmCh0BMjj8pNEYT75C3c7b
--000000000000d7ecf20661051f56--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795155;
	b=iavhx4wLth4SYNnl+kt7ys9QBh+1yS1cXjL+/b9kTHPz1X2oriob3+logt0CadKf3+Yw
	 07TYljQgpM7NLw8gx2YItdlacxp+6IN8Wx2jJdWLxpMh/Usvv+ukwxwi9qVDxuJ289hLI
	 5oXGO/CLgMDXOMESp/3ztPi2O6voXp3oPeW/EwU8H+bthezxLar5tamPIj1/V2diyE+88
	 3iIlX+Mknl7nG8HBfarFSmg0qCUgeHh2SHus5OQWGWs3ZPtVFfocO0yTOb/2+VGhKHM42
	 +HH38N5UqqN6KHyMSNtoTO05ZJq8e3zYiljmhph131dluoYASgmomjhX8uiZsdfPhTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795155;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=pQ2VkGTvM0vtpaJyJEYLQqrRkdMIYqMEYEnU6vYEXPE=;
	b=PeD2GS3xf3SevLHg3lI0uD3UsJ25ixhLhIrvCCCm4A0nSY8Sgb98b809c01ykE85HesA
	 j3iDkX5A71Mluso1LMHIBdNa8C4PAUAaiRcxaBl8fn8qV+oc2hlpNN5g1V121zH17/KnR
	 bErSqRZNqIiJ0CG/ODPwXSIsJxvgM2qqcbSiDYjMxQXonk8gg1RN8ugT6+FgtObmg3uod
	 COZUbqaUUKe2/olLCIj8JKTZmNSzIiQeb9687eQeEl+K7MfBphfbA4U9aGr+D7u2ajk1z
	 5x2zA15IK88t74OtNI6LT3Ux+B7xs1cL6DiZtYEMdb4bEuvZ4n04owAYYDHHEaRlrgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FFTvpYwU;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190BD606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FFTvpYwU
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1428440a91.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795154; x=1795399954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQ2VkGTvM0vtpaJyJEYLQqrRkdMIYqMEYEnU6vYEXPE=;
        b=ifSNl5anPANbMfzWmgLM+UTC6KRfJOnKDR/Od6c/YoEy9VZlX2AXtjtft2KzS+62Zc
         B6voW/JsqTY3bI4OgZPARshdsxnVgsqmRd/HVp+0ptGYx33BV6IMh8VKL+Ad5/L04K1c
         dBI7QXwbnM7phjiQg4PEBfebbeCJZKe1Hh9RZEVtvO5CSBHh22iSELCKbx1AnQ+fi89r
         5OEHjvvLFT0W/cSFUcvkGf+aWTeqcqozz3xOTNOiZ81J3BTCnmIRfrpFaJlXyfyy9pDT
         e0BM28jETgsiSl9S8X1JZ8VZuEg18vdj/NteZShA7uqOI6zKwLf/43xWLj2Z4sZWsh8u
         NaRA==
X-Forwarded-Encrypted: i=1; AL+hErH6HAcDE7zSe7BiK720BR9mNeAuBgOaP/PIlsw08F7CXSH3DgZf2XcC14bPXmn0Y3+HmU1HFpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s2s6bEmTKt5umpkYeflejPvUuEb6PPIRt2PSauIN+7AmZHtEd
	0SMMa7gd6oGCRLT69VTGtQRFjuyKquVElkeoloQVpccgd3mQBCzD/6/J6n+Y6dFb4E7U5JgT9xq
	AQjpEe/i9wvWyIgrfhJyCr/c6GsqKvWz1b5cBEQxysTFA1c2I0kMybxDrfNprasONr/oABWOwKo
	4xKpsoOElsUJnD5Or05cxTmScuQJT+geSKhHYyRrSJ3VwuSltqnwjL/vzmk1mh58F4xS34G+kAJ
	DdmSkkSffE=
X-Gm-Gg: AYBFou3f1ZvMbhPNhj/7d6JEy4AArCflkRyP5gh31nVPXygmch4rJJdYoM6m67dGlIU
	pmXrheI5/zGccwEhwBBPQIzjwBPrSUp7dFYUYyW1LuPjbG29xzXowPp5V5kjunLq0PVy7tFViOT
	8FsdkErd4O8p7bYStBtqDSDm3H6M9HkfyR4igwtSwQgGQTlCxMf8LBixeqft9h3x/UGm4C1ztsk
	b7bC0cwaB28oU9Ta8WdKZR4ti0X3G/ta8zX7aYXCqWaAwBjQ3VKypUjVk/nP7W8QLLbQfs0lUWw
	0HGjUSthw85cBsmcNvyExofbXx5lntIUzOyTp2jHMK/m5yMtsPo3TwvLB2puNFBWJ9w3WmEeM33
	k3hHNDkaI7A05ervcObv8CdSI52k92sNrR3ppkG0Dtz4ZSP4U3QzftrnrIVCbtKDWmUa8amL8N7
	m0pfP1JYOs7mabBm1xecE86AzgeQlWPv6PJLQ=
X-Received: by 2002:a17:90b:37d0:b0:3ac:aa8d:19eb with SMTP id 98e67ed59e1d1-3b1b07e9b1amr9278586a91.3.1794795154338;
        Sun, 15 Nov 2026 18:12:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da103sm10797849a91.1.2026.11.15.18.12.33
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:12:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e05d31e54so1501120b3a.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794795152; x=1795399952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQ2VkGTvM0vtpaJyJEYLQqrRkdMIYqMEYEnU6vYEXPE=;
        b=FFTvpYwU3Vf0Q+sWwiK1FWrMciqxyq5DDJX03F3iB7D1Jobw60ZsleA5N7G9fy/ljf
         YiUdpAfD1SZ5ByhsBaaVZz2HUx3OvdDuYI+JY0LJum0ipnQ77GTQfmbpnmbI20hIMPUk
         QuMKhbeVy/KFzgdflO+4zdvu3pGJeLvGVrJMM=
X-Forwarded-Encrypted: i=1; AL+hErHSGbXKjxZyQBs0TO0MRSxVtpPSUoc2ndzqkkug0+3ruCp4rR3B03TDt3cZSq4cJjRIbQTHouA=@vger.kernel.org
X-Received: by 2002:a05:6a00:2382:b0:8a0:20e0:b11f with SMTP id d2e1a72fcca58-8beb5bab1afmr6585206b3a.20.1794795152448;
        Sun, 15 Nov 2026 18:12:32 -0800 (PST)
X-Received: by 2002:a05:6a00:2382:b0:8a0:20e0:b11f with SMTP id
 d2e1a72fcca58-8beb5bab1afmr6585192b3a.20.1794795151979; Sun, 15 Nov 2026
 18:12:31 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111123917.910416-5-pavan.chebbi@broadcom.com> <179474752435.2199510.4293749857887312550@kernel.org>
In-Reply-To: <179474752435.2199510.4293749857887312550@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Mon, 16 Nov 2026 07:42:19 +0530
X-Gm-Features: AclHuK9hGYvFJbh38BCdndEPvB-U_bogO3L-NL9OYVp3udyxb4aidJUMtz4Q9FM
Message-ID: <CALs4sv2L8G9EpgpOqKs2gc69zp5L0RFBvjiS2wStkBdhD0=+BQ@mail.gmail.com>
Subject: Re: [PATCH net v2 4/4] tg3: Fix heap overflow in unbuffered NVRAM
 write path
To: netdev-bot+sashiko@kernel.org
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch, 
	andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com, 
	vishvambar.panth-s@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008712c706605b4f3e"

--0000000000008712c706605b4f3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:28=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The patch does not fully fix the bug class it names ("heap
>   overflow in unbuffered NVRAM write path"), and on SST flash its new=E2=
=80=A6

Ok will expand the check to reject any pagesize that is smaller than 4
or not a power of two

> - [Low] The commit message presents the new `if (!pagesize) return
>   -EINVAL;` check in tg3_nvram_write_block_unbuffered() only as a guard=
=E2=80=A6
>

Yes, v3 will update.

> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but in
>   tg3_nvram_write_block_unbuffered() the first WREN, the ERASE and the=E2=
=80=A6

This I believe is outside the scope of this patch.  Hence I wish to
skip addressing this as part of this series.
To address all the remaining issues:
pw-bot: cr

--0000000000008712c706605b4f3e
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCATs94Y
UJYEDJ0gOPo7qwuoe20bKjLsTdmcoX5x4E4lpDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMTYwMjEyMzJaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAqk6CgWHqFWHyd05QeBAl/i3ajqzQWieLT2ykkG7qq
lyGuzomDQIZ9PvmNM06/BF/6SSprfTCQjBaaA5mkVfuq9APw0NWNPJp9v5KjjPrl9xZY1ZcXMfg4
Qpy8qSaDBKCj2WMRcqYAoGlmQqLl879Qa/G7VoKjUkfRqn3v2utR2BFLIM/U1oAlWEjnBsgK89bX
O2pVk1tPuj6YALCSEgvZICsriHtFZfZZ6SQCYC/mlQZig4v6fV8MIpYDyVTaQR/KFeGezzOckjud
/HY5zBKOF+9lBzSa3jh4NJm3s2LR/fLkNihip7lisleCfJ1X0/kfZnwAI0dSJTG3gGel+Nqx
--0000000000008712c706605b4f3e--

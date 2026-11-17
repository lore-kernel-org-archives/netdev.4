Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956665;
	b=XwDjFuHHJs/mi65XfnXdT5IhC6ZaQDmcDDWA7c71yC03oVoIICZIb1F9dYLIy8/nvwdt
	 ElhPr22ljm0uWCqQQZl6BhAGt9B4QXS4h23vDotHNEl1/P9QzCN2Yjma1UHn4GXGYNexj
	 lROABgXbqqcp118J7UUoUdtNG8zLVNRjBFUtSYFFpW/lgYvktftUtgSpNEtw7qwoy+ICq
	 vPYSjEVwXQpgLdkZt/Ztlkn43EwvrqbBHZdjR3k/tStHzr1Ai8JVm6iT9iF45QoLtTNFs
	 8+j/LThE5MyQdJ0xrZ5yd6kC+GAXm6aPzVO0ZOXrlAlZauHWN3MPUgdY5wTHD+U4YZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956665;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:X-DetectorID-Processed:
	 Content-Type;
	bh=oTkIlMy8JmuEh82dZNaK1thlNuwlD65Nar4oya1SNLE=;
	b=y2a7NMDK3OTNwsKonDmsRxSYazL+34mm+fIW7luuvYuytqmfiNth3DBwXhrXqNLJI2og
	 ea0JxWPXV7I8bvxTdQ2XDhbx2ukG0x8k/iUsbCSZ2RkOUL+3y/KYSOKc/mvMHJWSffu3C
	 Z+zLcRhsecpXmE/wwt8YEcPgJKdOa6gqp+7clQMmpZ6hAx4jUT6Y1m0oGmzg0++LJOOHF
	 ui5/kaxj3BCGYEXkK248mfiQ0Pc6pMFRYP9eytCVejBi0RdJ625wjk24fL1cGF1o8+LZ3
	 emYC1HXI5D69RWGVH4uXmAKDi7+GEz6kurq/3UpnwyiuBh8maC1kXawhtR05n+cYcwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=frEvYmOT;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BF606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 23:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=frEvYmOT
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b37951a397so237543a91.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956664; x=1795561464;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oTkIlMy8JmuEh82dZNaK1thlNuwlD65Nar4oya1SNLE=;
        b=zBJJqVmeMEo0WCdjgAMBDjIPEOqEW2mFVWwJjx6nfpySTidG2yVbkmT062DZmyemyY
         douH9b69i3RHPp6ayg5PpGtoI92XzUjh2TAyJbsWdWKp3XsX61R3KMFA75UZ/P1e+gg2
         37mePwqI/PV9HvgZCKRFRvq382kdHEAp9VUOSS4htYZo4kqrH2TZZHtRZRFD2s+Ls62J
         Bbl7VPw+b3drH4fIlyUJfJH78SAdhCLuZvoqzpRDAadmNiBqsU6kFaxxE2GVauhSrTSs
         suKDNPimYbwpmUl51Zo7Qz+dSg9HOoYiD8IICbF1SIaO0ti15MjoevP5G2uG3UNFxNRP
         kBbg==
X-Forwarded-Encrypted: i=1; AL+hErEgr8dA/OiSJZgLuilBT1HwGdJ+OC42yjnIGA4OSeJMsmkApXvo9e0WGwcBrbZ4i8ikNB+DmAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ps6mPz2GIaSHnTwoIJ+G5CaaYtYKNINew8eJltQ6fohgfPoOx
	jr09U/P46L6s1FcmIxsdRS/AIgQfIqxm9AEphCTfmEKFjWEYCZfC4QxkjWNUPCb1kLPktGGK98D
	C5/HgN77Q0ZaLMZdQY7HSiqsviESo9FG0zz4NwV0XlkJ3HFce44iGROU89wLOx8HytDBbSSI1a4
	0f4nmtqAU/KYvaPHycUWun0nZfxF4FCnldswdeSc56rLqFNTjbmcBkq4cM741TZKepnjZhYkvm0
	p/TSvgpuG4=
X-Gm-Gg: AZFdTZdU7x78tKs6wDilWGjTgYPWagSgnZLQKrBtLY64h+yIwrjfzyMCffAA7buqMD5
	Eg8s0nNBzl8B44Gy0ZLC2O6QfZE8uQKN+8XU7MKOZjRY5o+iQ2IdO6GQL10fPTRo/IGnNuRMHEo
	YWbCAHLjZxAHBkLqRJYL07OAScK5nBQdZhAlL93bwZxikGqcT3KBXkl+dL4Ez6kWuYllrR3vyb8
	qzUqfTrkSJBpKdJendkrOZiD2nZlpphVa5ValPoX5xXXsKKfCIqE1+C4ZN8TKNvK1UsKqvPgkXx
	WrRVDsXWUlbL1vhUOX+hU93o1L6vjBKKryc0Cyf5AjxuuDHn5I4jlAM62/nJJ6HFAQMA6ImEdkh
	Ob+z1+JRYP+KWyZ74vtLibypR0PHUykPYNV5+0FdnHh1UjSwdM0HUmpp8ioE65MBXwf6MbCd9XJ
	fGMn7zVXJRPwjEEqX9wWgtvjiduybbzBEXu3dIQg==
X-Received: by 2002:a17:90a:d44b:b0:3b3:b9de:3fc7 with SMTP id 98e67ed59e1d1-3b3d07e0eb5mr802593a91.56.1794956664262;
        Tue, 17 Nov 2026 15:04:24 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d0987ac9sm592602a91.0.2026.11.17.15.04.23
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 15:04:24 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4d288b67ccso16134266b.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 15:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794956662; x=1795561462; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTkIlMy8JmuEh82dZNaK1thlNuwlD65Nar4oya1SNLE=;
        b=frEvYmOTihLtDxygJyWzX8aOlGjjHxQAVrxpopSePJ5kONxp8i7t+T9quYK/AGTOA6
         05/Bxah/2C2mtILZtMuctJ4x3x9HVVhJxDvf0fVq4TNQQ1spgRUcHejQhW+FH5jb1ZGB
         f3f6Qb4zn0TVxH8tJbheXf9td9EKDgIqTOkTM=
X-Forwarded-Encrypted: i=1; AL+hErHrdGljqhbbyHmPi3sOzfKO7Z+dVC6SEChzm7iNPNEeBz8bhuijQDfONZBf72bD4y1KeVvnz+Q=@vger.kernel.org
X-Received: by 2002:a17:906:99c4:b0:c4c:e344:ece7 with SMTP id a640c23a62f3a-c510e28f22fmr64655366b.10.1794956662294;
        Tue, 17 Nov 2026 15:04:22 -0800 (PST)
X-Received: by 2002:a17:906:99c4:b0:c4c:e344:ece7 with SMTP id
 a640c23a62f3a-c510e28f22fmr64653966b.10.1794956661964; Tue, 17 Nov 2026
 15:04:21 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106191423.4194081-1-joe@dama.to> <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
 <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com> <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>
 <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com> <CACKFLinsQdoZhEnhmZmMEMZVyGC10KZZRciBGLzA12W2iOK60Q@mail.gmail.com>
 <CAH-L+nOyNgAUMCF74OE+oU2gSCaV_tVcgm2QQFvjge10A+qAYg@mail.gmail.com> <avx8da+htUim/x9i@devvm20253.cco0.facebook.com>
In-Reply-To: <avx8da+htUim/x9i@devvm20253.cco0.facebook.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 17 Nov 2026 15:04:09 -0800
X-Gm-Features: AclHuK_lhTvmrc0AKUt11aeeoGIeMK3Voo2iK4o-egzLyh6-jM7yp1J_QRFvQ6o
Message-ID: <CACKFLimpUYgcV8VW_wFN5Bm+4cb-4eE=LGtp+9QO5dxAShBgCg@mail.gmail.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
To: Joe Damato <joe@dama.to>, 
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>, 
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org, 
	Selvin Xavier <selvin.xavier@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000041aa81066080ea21"

--00000000000041aa81066080ea21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:10=E2=80=AFAM Joe Damato <joe@dama.to> wrote:
> One more question before I put together v6.
>
> bnxt_reset() is also called for the silent reset on a VF: the
> VF_CFG_CHANGE async event sets BNXT_RESET_TASK_SILENT_SP_EVENT, and
> bnxt_sp_task() calls bnxt_reset(bp, true). With the ULP patch as planned,
> RoCE on the VF would be stopped and restarted every time the PF changes
> that VF's config.
>
> Not sure how often config changes happen with RoCE in use on VFs? If not
> often, then treating silent and non-silent resets the same should be OK.
> The cost is a brief RoCE restart on the VF for every config change.
>

VF_CFG_CHANGE is to notify the VF about changes such as default VLAN.
Unlike a TX timeout, this is a normal config change and I think we
shouldn't disrupt RoCE unnecessarily.  It's unlikely to run into
errors during the config change.  Selvin and Kalesh, please comment as
well.  Thanks.

--00000000000041aa81066080ea21
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCACrkwS
nTmP8vGkr+311Bj/R71x0ZgriH1oiNd+axATtzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMTcyMzA0MjJaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBxYW76A6B2TzzaniJ3bb3bYDsZ391+V045yQ/SgV9+
aGtUHIwn3nP1y0Q/PTykZVQZqVcdqbFpHH0MMJ9V//E1urRvsf0FRSOr7d22GoMFwZslSVej1az/
DQObkDj1ECkKsXhHJPH5dSESQA9vteO39P59j4MZhnhCeC47QAE6wQq2Q5gOCng1CRWN/+l9BKDG
nW0oqLITocV63e6Syt/2UyDacWHs1N11uBYufQkWUdigpZUZOPT3PtIY/zxuSFZHX67ofM+uD1QL
mpdGiusOBhBqjxDYF8Qw0ZCpHS+oh/VO7CHLrxnEW4wyiBCLJtjdZp/KfLVrj5J4e6psX0IS
--00000000000041aa81066080ea21--

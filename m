Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794696;
	b=TqNG2ag6Af0Ngv/1Gc+ECJuvxHU9cW3IZeyA13Mm+2eeuj8dchtLgFhObFbSEWi/ssrR
	 I41tVeSc5U6KAqZIH5g5iArbNjrKlClVh60IlLoq6/x2iB9Z0w7o6nhsJ3C/ipGd9AQUg
	 w2CCIgfncPNNegCEKGqHfvzPoSxd534kKy+oCsDfU5OnaGfr7v7wj0ZO955yTOV+MX0PB
	 Z7E8+2G10I5h9WkIBIOpBppyD9i3OnacfBWU/3TuI+VhPnzuxRL6ThUcW3chlpB75GbIU
	 dXiCpDLjitBZyjZVyaWurRZH8xHxWnIbZbbhKlBn7cRL3foiM6BOjMUcO5zdVp2bLFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794696;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=Esd8R4AcTYVAEsVFk+6lq0bbW7CfK8Jl/iPi5dLQQ8w=;
	b=bn08JmVxqlN1m/9fFFcNhz3fqRTi7uvcnP2tMVuZTY4R7dpSAZTD3OQlzR9tPkBrtY8x
	 gOm+X/kTUD7TGdhS6ILZGKCfqtROBL5kHirCsTLOWju2TLlqvR3GmNrIgo0YTt7H2NxE1
	 oy4SajbZ4oco2sfdCqrd6BeTk/zhLdH0XOaKNQlN35zKEsdPZmQ259onVHWDSEU9dFAsB
	 yRlVDBFQCllX+ce+c8ly9qTwX8VM6JaG9j0shYwAqdDNt02NwofAppD4HA2yoIPlbhgIg
	 Hbqvvrc7/1iIazDrGUZJhdaN2XKeb1UzJmiMS2yrFktXdXPWclpMClP1AsneK+1JZfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZGRLpmQY;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D550606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D550606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZGRLpmQY
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2613974a91.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794794695; x=1795399495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Esd8R4AcTYVAEsVFk+6lq0bbW7CfK8Jl/iPi5dLQQ8w=;
        b=YH10PdkOKwtXGGOX9ri6yjTRv9fiMDgF+GBA++6VNhloYeugcx2nG0NNRixGHuAQcF
         SclNauOyOWRyT2bx3hfWXxp85BKYc6gBShmBw/dLzUlDB/Yh1BLjt0qxh5wgDktDk1eW
         Tn1EVWqoBbllCbC12hPv2LUq4ZYtT/8K2vmPs+t7UASST/p+J2arClr2RJUJH8VGpF2Q
         Jt0NYEQKF7FdlwAqXV23VWZ3EJuc5QWlUPdmMMS73Rpq6MU8pfFGyzyn7Jlhp8BkP3L1
         bv8iQTjhhc2zQnkWperxQ3c/D/6jo0CT/rRyt4S2cjvVJ6Yy/YXl2vV+OQbv+2xeMWCT
         qcgA==
X-Forwarded-Encrypted: i=1; AL+hErFEiLYiCGeIOT4s3HH8XzljEa0TP4BG6Tsqe7IRg0HjObT+Ma2hI6ybV1aUW70MCnObyphV/Lw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qQERVjahIm2maahA1mE6DQ8s+pBXlofx0qcpfwdDSEhcRfCvA
	7AQezDeCZiX5CtrvQO/3MxhksnuQsBUOtywHhNiWUJgx5eHIdkQuGEDkMdivZGb2r72/CXRpnF/
	ooJBFDmD/2UmreZgYOFcieyk0IAY/F66EpE8y8QgtPx35uxw8ib6YCi6blUiMse5APMwjEK7zEM
	cE7SPeLDgTWlDMqVwXy6imvHCMS9uugXSriRPG5hGVM/dqJRrdpu+rwDqrhp4VELattpx+BPSFq
	+t0KezETio=
X-Gm-Gg: AYBFou1FE9e3ymqgydcK3Z8sf1Hl5z9MwD9DMmJsQH9BArr7mI0A1qBLEpsD/NYzWT1
	mje5t0KNOfOxil6Fi9hoJE/SvMRuYAgAzoVfUuSM1aPEt3FTzKggbgfSeuLeku8ozdZ5hRvYVpw
	q87Zl94VyoNHXIaAj/J6yYrz7B1EA4bdRyjg8vqop9L2Xva2r4pxIBhvbORq4VUCwM4ulH2iObN
	JKN6SVzoNOd2++WUcDvWMv/ibQXgbw2gif93hCWKncRUQzrBkVUxyxCW1TOB+ilYEgNUO6gvBB2
	Gk+kS1rBNConETf2c2zkTi7nMX0J7xP0pPOW9EzlwxgIw9LVhFn1xLOEjj/rpxXoHlIZKOiNNQi
	6QpNS5ePqLKhuKfIkdoaS1PyNw91e3i6+oUuOL9Yo6o9PsVlORl8zwqJENWmiwWUK7UK4K5mAhI
	CYCUwGmOlUbwFyvCACK1vgZdXGnGyb7plxGXVWqA==
X-Received: by 2002:a17:90b:586c:b0:3b0:ab34:afc8 with SMTP id 98e67ed59e1d1-3b1b0b67f13mr8010513a91.20.1794794695097;
        Sun, 15 Nov 2026 18:04:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197a330f9sm13643438a91.0.2026.11.15.18.04.54
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 18:04:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so868085b3a.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794794693; x=1795399493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Esd8R4AcTYVAEsVFk+6lq0bbW7CfK8Jl/iPi5dLQQ8w=;
        b=ZGRLpmQY/KK6i1Z83raACJ/g5fGDDmUZdG+nWNGEIvRxxAQlpGt5LvUtsE0gqP9gcO
         bjIccPBf5vK4AXGCPy/1aAj1rXyaRaJ4SDBTRSFlpdXyY1MmMobjLFaWuc+uRLnXQokf
         cuuq+8uAvkz+U3DsRI/x+EwhLBD5bpT4ePFS8=
X-Forwarded-Encrypted: i=1; AL+hErHu5YDTDHs6eW362rjLDhQ4OMWWcLYXxoP9MUhER8Lx8MI6zD6Qon9ADL7fsGRibx2n3TMGuC8=@vger.kernel.org
X-Received: by 2002:a05:6a20:2591:b0:3fb:6e73:ce4d with SMTP id adf61e73a8af0-3fb6e73d7admr1539877637.22.1794794693446;
        Sun, 15 Nov 2026 18:04:53 -0800 (PST)
X-Received: by 2002:a05:6a20:2591:b0:3fb:6e73:ce4d with SMTP id
 adf61e73a8af0-3fb6e73d7admr1539850637.22.1794794692975; Sun, 15 Nov 2026
 18:04:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111123917.910416-3-pavan.chebbi@broadcom.com> <179474752179.2199510.16313103373279878088@kernel.org>
In-Reply-To: <179474752179.2199510.16313103373279878088@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Mon, 16 Nov 2026 07:34:20 +0530
X-Gm-Features: AclHuK8fBqTyyEP9sTtIDk-OyJKquAErIn4FLLsMW_7XXkdPv8Di6AFmrLb0NvY
Message-ID: <CALs4sv3HQEOHfQG+b1j8p8_iOAYoX4iq=3odsGHFkM=wbpQm=A@mail.gmail.com>
Subject: Re: [PATCH net v2 2/4] tg3: Select PLL clock when preparing for shutdown
To: netdev-bot+sashiko@kernel.org
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch, 
	andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com, 
	vishvambar.panth-s@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002b196106605b34d7"

--0000000000002b196106605b34d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:28=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 4
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The workaround is skipped on system suspend when the interface
>   is administratively down but Wake-on-LAN is armed.
> - [Low] Claim: the commit message says the bit is set 'On system suspend
>   or power off', but tg3_power_down() is also reached from=E2=80=A6
> - [Low] The clear in tg3_resume() (line 18277) sits behind `if
>   (!netif_running(dev)) goto unlock;`.
> - [Low] In tg3_resume(), the new tg3_ncsi_pll_tlp_clk(tp, false) (line
>   18277) does a BAR0 read-modify-write of TG3_CPMU_PLL_CTRL_STAT.
> - [Low] tg3_ncsi_pll_tlp_clk() returns silently if tg3_ape_lock(tp,
>   TG3_APE_LOCK_GPIO) fails.
>
Agree with the findings. I will address in v3.

--0000000000002b196106605b34d7
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDT6BZ3
nJSEmwAiWDhSaeo9MDkGXLFWRb9qeL+/5fStiDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMTYwMjA0NTNaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCBzYbjX6CV8F3cA//P3hMdKyAPy5AC3ktcStoxW/Q5
eZW7XOf+xSfFtc17sL4YXWMI9GOa7IABbV16p/XVm+GkYusLbrKqicVgmURx3FQ2p051l4nylphF
x9qY4BIEG2SsPGvkbpxKoYrFCdu+RfJtkKZFcF8QYipkXyHdAMzAFgLNFlOnWxWq4dXtpRkDau/p
8w5mOyOMAquH8uFtsTsupEJzRw4s39M8Tz9J/2Y6JOxlErjFApy0f5G6nugBYtHkUT+6XscL7Ucb
/wzgya+SHYIevKDwNb6i2nFszL4roWzc6jXzub1v2p+UeSkDdF4XBmonm4ZBdUVKX4v+j68+
--0000000000002b196106605b34d7--

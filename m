Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149194;
	b=01gNQ2iHya1u9UfjDvLoQkRGtHzI1LlIbWGV/idPRVm8qnuXCYhbovEFZ7VZgo51JFGg
	 OttLlmJD75V2F4MOThnrhN242AtY8MQKWpMXZ+HPQFGNOndfiA2LbTCLfXVKwV9z6gHiQ
	 +UVxpGAWkGBXnCbIjkEIEUTpZ777ck58saliJgkrPtNxCkhMVTgI6g2Vnih6wRrq9k8gI
	 rVfAOfkXPU2NQt0csIEkfdMaStJQ4/qKWO5OVcH3A6af2wevkeZ6rVGMGCwCnS2G0U/0e
	 w5JL7yg1MeH1iLYh+TKyLoD9+qt/CU5tJ9ttWXgv+wUvBvcMjA8T5Wh4ztZvqYNv3Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149194;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=d5O9UucWE9TKWg9Jis0AJBUXAKU+IEf9vXup+G4RQfs=;
	b=VfEd3/AOFGhkOkOVz4txTyI5F6cISxnEXVK7xoNbXWpRjVdf2rWlH5tNkPAO35z5JqdA
	 AkSwfsh94O0hCQ2FEeDYJGjQI0bb9CBAZ+d+OP+olI+zHRDtROiUovhu/y9GLwxT3/IVz
	 Uvci+RGJsDsBcIbSxkeZDhAiEAMojBQ9Wvdp/cHdcRJ2F4afN4SngYYAfJTGhe5K1de+K
	 JcC+Z+sKvDJMyq65XjUDhEPqzV1rOm9v8Q8HsANJJ4NGLBnt9B7ZrzyMHyjDsfDsEn+4q
	 PZ8lSPQPqUuLleSc4TFPQXyXGiyGdt5NELYpJqFQX3eBNQ3NmJMwDTp5PrVvSxx02nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TR7BsgTN;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9460A2603
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC9460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TR7BsgTN
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so332613a91.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795149193; x=1795753993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5O9UucWE9TKWg9Jis0AJBUXAKU+IEf9vXup+G4RQfs=;
        b=oTq00ww8XHiOJwCDQnWll7htgk+yOo+A0swCR27DtTkA+fZQzAaN1QDJ92qs/5Pie4
         xOv5R3JBk6MGMG/AjcHYBW9UHo8lrSd/7oH+eKZVVJ1tTrwvV1Onz/CZNKxUFeNUsvLH
         sTlQvXaIix4qeIiXNqJn6yhIdvtTQV9t2txyjGm/lJEBS6y0rzh0n3SkxjQxz95bjOrN
         Tb6UQkOiDFzbnUDz9QO1DVoArKp9bYeK/Bjmbs0CkdxW/BcpawIV7e/NhjaO5koQ/+FM
         WVxa60q0RIL80HB+symXD5uwj1dhwY/LfNmiHi5TZCReWOqh1VMoG8VrnPANOcKhDcEN
         gaSQ==
X-Forwarded-Encrypted: i=1; AL+hErEt0oGi34wlnzAJeQe/H1fSSMGflZPLrC4cWYRLRaPRRwZXloFutXVLwlAbD7eLgyvsZNvobIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OfkdrSP9anijIvmpNi3Q8HMg/I+NjV0kyg9dPt0ohd3QejdCg
	n0S0rqwe5qsxWwfonU9tlQMlfJmOoCegNEu9YzKi2cGzQMpgq/zSPwe4yNfeZ1KJB2REach4382
	x6Ckx3OLsw3J8ESUJxQdeIU3UideW1OluYe53daKUqS3IvzT1CFF0wDFzQd85zK1+22mP4m132t
	GaVFJ6NrV+MRg6WNoa/tJPZB+i9N2Yd4gif7RvD7X3UY0p0QEjVR1MEpMaO+7xaDiP4kThnCwiP
	W6yMuJVDVrp3w==
X-Gm-Gg: AZFdTZdktMPCmEgbBa1il7bNzKX0kPx+1Y2v2ip/c/WevtoFRWEI3PO5APyu/n6+jLI
	IwKHuj16lY6AQOZIUSfcJGc+e0RtOYT/MW/DRi05xYjbx6erut4T15adheMZToE7yMlrgFrIEuq
	XrTuzeL2vDhZ1LtGz/b+KgYP4Fj2ctgKxURtkXCZOVnPCxyq1shHiyRxtLpN937sRMHxRE6KeA9
	Iqm96+yZC9ocbLkc0ZdWDRhnZ/YnBoIEOPFlx5Dzo9QrmaS+lFwdAxt4aNzrgtqD9pIFGds0afx
	MXZVBqgmqQnaSUg4e7kh1h9ijdDh+gLivZKfwl71WUzZ6FGP498FbMJBuSfvXVp67XSYp+8lePd
	+JjIaNFZ1s22blIVNXcGtg7igw+fTKyVqAUbZP0aky4zZTLgMMxLFYiaJfWIoxwYl8DSbyVdufm
	91MHbKriFyPzBc9tqa0gzCNB1L9Pi3Ko8ViZO/Lg==
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr1624499a91.14.1795149192963;
        Thu, 19 Nov 2026 20:33:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm755907a91.0.2026.11.19.20.33.12
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 20:33:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso738299b3a.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795149191; x=1795753991; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5O9UucWE9TKWg9Jis0AJBUXAKU+IEf9vXup+G4RQfs=;
        b=TR7BsgTNSpOCtqfJvTtlJUiQpznR+fhwhEnSsrkcp0yHvDstth1iBCFvRitIq/lKb1
         919ucLtlViefe6jo3pOxf+QBO1pmJM0b1WsXLcQAY9KvDxqjENOV0PJdQAwFQO74qafi
         PKdl4b8+058ecrc+bUq3dv35+s8+MNZ35M+48=
X-Forwarded-Encrypted: i=1; AL+hErFel2qto7D80Y3SirNZakolV5JFUcsp3wvgr/ULHWbrxqU6DXT9/c6e5Tdr3/qluA9MmEdga7Y=@vger.kernel.org
X-Received: by 2002:a05:6a20:9183:b0:3e2:2021:89c with SMTP id adf61e73a8af0-40148dca737mr2146946637.5.1795149191241;
        Thu, 19 Nov 2026 20:33:11 -0800 (PST)
X-Received: by 2002:a05:6a20:9183:b0:3e2:2021:89c with SMTP id
 adf61e73a8af0-40148dca737mr2146911637.5.1795149190779; Thu, 19 Nov 2026
 20:33:10 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120034645.364630-1-kuba@kernel.org>
In-Reply-To: <20261120034645.364630-1-kuba@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Fri, 20 Nov 2026 10:02:57 +0530
X-Gm-Features: AclHuK8Nvh-rLJ6tKBFqK4oS7kYPwIeQAGqfkus_xkmCB73QDinWd-6zJUgp3f0
Message-ID: <CALs4sv3LxZ6cvuGotXkCn2ok7d90TLb5UbwVJFpd1uabmj0OYQ@mail.gmail.com>
Subject: Re: [PATCH net 1/2] eth: bnxt_en: restore Rx coalescing after
 re-allocating the completion ring
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	michael.chan@broadcom.com, somnath.kotur@broadcom.com, 
	ajit.khaparde@broadcom.com, michal.swiatkowski@linux.intel.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e332d00660adbd98"

--000000000000e332d00660adbd98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 9:16=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> With TPH enabled, queue restart frees and re-allocates the Rx
> completion ring in the FW, to apply the new Steering Tag. The new
> FW ring starts with default interrupt coalescing parameters. The
> driver programs coalescing only at open, from ethtool and from DIM,
> so after a restart the ring ignores the configured settings, while
> ethtool keeps reporting them.
>
> Re-program Rx coalescing of the ring after allocating it. Use DIM's
> current profile if adaptive coalescing is enabled, the static
> settings otherwise. The per-ring DIM values may be stale when DIM is
> off, ethtool changes to static coalescing don't update them.
>
> With rx-usecs 1000, re-allocating the ring on a BCM57508 lowers the
> latency of a 1 byte ping-pong on that queue by ~250us. Latency goes
> back up once ethtool re-programs coalescing.
>
> Fixes: 6b6bf60fc95f ("bnxt_en: Reallocate RX completion ring for TPH supp=
ort")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>

Reviewed-by: Pavan Chebbi <pavan.chebbi@broadcom.com>

--000000000000e332d00660adbd98
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAMkBZl
S3nEeDxy7kUyO2nJBxeGRNzcYiJqo6mVDFdBBzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjAwNDMzMTFaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBA1+ZMJZe8KSUKIBWWYAfsEUi5Oe6ppNc7DZBRdchh
73oUvHxbBgtJPijzRgyxDmFvxYrNY7wZJ/0/C+XxT6PF4fGOQ5/oJ+Hv8oYMp6RTFimvKTXCiUIy
6VYV46ivAG6FLKjZEKRotwzkrwebDiZDAZVa8g/vLWW7G/MHacUpDkfmKg9T1DAMgWUuvbzH3ihi
3usnk5no0SLNDlVhqnXxFhrFV6qwW7zzL0hlQW5G/PU9ZImk1/o/rvlDdPZoro/wBUnLPFcgGrn+
t+HvhHUiTzysGmb58yOsMvFooaoTRIzEzJxVRmcmIlK9DgdJ+qWDUFofVqctvdcFl+GOIsD9
--000000000000e332d00660adbd98--

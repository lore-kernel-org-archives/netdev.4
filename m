Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511159;
	b=BE27qmOlsmCQf4LEkXjfLvfjfP8KxS6qEP/vQCjLvVSK6TfJpsN4Msc0PyrTGCcW0ds5
	 oJkGLMp7plClpHq81f+hiUqmuysVUuviVjVR64evYm1KXQ+8NFtUGohDbWuQjFr4xhX0m
	 az/9IgKYEf+XXbETQj0elk4ThdfZixovIc6ipAOGXnwOzd9OGsIwlpRYh3xYw4BhEJJM5
	 orZzM4qCqzBUpbEmCt80i22dYDljVljH5d9RPrCSaaib8oTX6tLljLpvnGeD1PmBbdE4A
	 F65YoxVVfXVG1sQMhZQdOoJ9MPe1FpQfjKSw4bIpbyWqYj7OWeYmUum6TxSh+JEf1NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511159;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=bYXDEdh2TWBSfAhXchWvHcKXCXDjc57ry44bxklMSOE=;
	b=4wEGHi7sQDedjJfutEfM0jmCeHvxxF1cb8iRhOvGDytA20jWCPvDU96UassD4AdDQ85V
	 KgBYWGkhHFs73SZmR/FDjRcLESrV9mR0gZQ8Hq+eXO6y6Ls01mPMWZbkYHZ5TMD0KTSNf
	 XwYZEpqfHMjQSzpJGoRSmK51gKWj8RTmIKvj5f/aIJr6en6xzoAzTkgfqkffO87mKJUBM
	 bc/zpUlKI3iqyp5w043CLkOTjipgrcvmsiwUmP6biXu4JidZIfXe/vpqHC4yd1f/aBNSR
	 a2t5cfMbnO+kmHIh0Br6ziwmSTO/pFqq+CW3R6gHloii5o1RLrt45YawTb4fUWAN+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GtM4OWuX;
	arc=none smtp.remote-ip=209.85.160.228
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A886A606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A886A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GtM4OWuX
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-5569551d19dso54557861cf.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511157; x=1796115957;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bYXDEdh2TWBSfAhXchWvHcKXCXDjc57ry44bxklMSOE=;
        b=wtj3JP6mdItsau9FjCP2x3CQGdhOFzT+njKghzh47cXdKaXzLv0Jq3hrObkNACj1VC
         hoRcDHc4c0+ytLKyhFY1ovEuJi8lTVUfDAzNt8/5SOQe3dVyHCOmtrvcGMMtvAgEi34/
         0i3PBQ08mJnSbTKtCm7T5TOyXUfjb+AgP2RT6bqPCtS4nXBF/U3fLb+en9mJ3x6oI4k+
         oc1M4MaIJD7PXn38M7jH/PIbT3F81a244qy5abIHmZVq1sYiTH9TeCg3uForQKuqdGvG
         TnpJs3dYCoZVMAA14U27rJCqAiNjbDHMCOavepi//X0tz+dYFXBG/JYtr1PeQGUoyp/K
         L05A==
X-Forwarded-Encrypted: i=1; AL+hErGAsokVWdL0gD9zYj/3r+rJNI/NqvymDwmnkYthr0arCj+2cFAml3J1oOyBdEtdiQGM8lxgnv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U6ZAMG1oNuFgjqomM4/EEtoO4J9fzd5XpZXWeoDV1x+R4Pjvr
	yW90KA5lUpqqU5oV2qDm6y4AYR9Sa4CNZLBCFJE5oKNIOFm8Q7PTrDOXldMmQQGNtXsgYjRp4XG
	i3z/2isNVlfMfgzlUk9YsbFwpGx2uzG6VkodpYY7f7dqUPr+S2gqQX1ocE0p2EI7TdGWyy1A1nS
	ZQsqVccBl+hdWZQomVx5YKQndyocmS+PbGCXDBLsaVGAgdXPgdbdF4f2uXhC+xoxckuPtbSRXpb
	tYw/ijF7HQ=
X-Gm-Gg: AZFdTZeDLVMjDXyle6nNUJi8D6OQwAUJCoMSerjDOn2ncvA2tQL9qeJfcPHjGlvSY/5
	xaEyJl6hQq8uwEzWzFEfsVlkZR66tg2fLlk56Hr//GBse86GB8gzOFEhdRHPcQ9cF9j7GS9CfcE
	iR12Y95cpbw6L5DJVfriM5P/p7H7Fqf5QDZAa92BzLOg79O9eS5OJL7445RiJO5KDDZCFZXuEZH
	WyUUhGtNX7nhZ4zrGUUDvnoVC+nvIPg1RPDhtEKLKqXHQm29yMcWoFyTzs//OUK3gWGCWnBfDjQ
	do06RQx/tbK/5rPbui2hEkechDN8ju8RlNdXoCmt9ecZN1FUo+guMr07C8gdorZ2gNS369sMFKt
	4KLNJk4q8bz9Yamw6j5ThT5ZuUMMkeyCgF+mdRudf/8bG08AQG5ogeo236hVB/0G5oMHlXdWRLr
	GH/tBedeKvq6dJjPZVN+GSND9Eny3YtGC4Cvo=
X-Received: by 2002:a05:622a:1aaa:b0:55c:307e:c961 with SMTP id d75a77b69052e-55d768a0566mr232579141cf.3.1795511157408;
        Tue, 24 Nov 2026 01:05:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55d7885495asm972371cf.40.2026.11.24.01.05.56
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:05:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50e035a2d5so457323066b.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795511156; x=1796115956; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYXDEdh2TWBSfAhXchWvHcKXCXDjc57ry44bxklMSOE=;
        b=GtM4OWuXGeMYJCCyyZO4a5r0dMGETDk6nrEZSZSSHWZL52FLlHq8VRqo0RqrRPPUPk
         blDXC0fPpRJvfEbacGxeP9HtjeZPgl5c0ZRaXyRfnX08sqt8qS6tCJ4L78WzOLpTKnoy
         y1QUcZfJtFcZb1iwMFxC8VCutRVdnEumt4Yl4=
X-Forwarded-Encrypted: i=1; AL+hErFYyulI3xCl6UZzIuqFpcE2joN6k2pz4YPOpb5Y1abmc37PIp/N/rA4Undp0oTeJbXwrt7+Uzo=@vger.kernel.org
X-Received: by 2002:a17:907:3c92:b0:c50:51e1:c141 with SMTP id a640c23a62f3a-c513a4aea6fmr1160737766b.2.1795511155836;
        Tue, 24 Nov 2026 01:05:55 -0800 (PST)
X-Received: by 2002:a17:907:3c92:b0:c50:51e1:c141 with SMTP id
 a640c23a62f3a-c513a4aea6fmr1160734866b.2.1795511155293; Tue, 24 Nov 2026
 01:05:55 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120012921.2537903-2-michael.chan@broadcom.com> <179548624915.3135.3359343024461356242@kernel.org>
In-Reply-To: <179548624915.3135.3359343024461356242@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Tue, 24 Nov 2026 01:05:42 -0800
X-Gm-Features: Aa3M54rhe8yXWlz7wcZwhg8gHjVLyr9IV-awRZfYluy2OwdQkLTufScw7es0LWc
Message-ID: <CACKFLim1SoTpx3wKwFKOS0MtAtTwSoxqd75bLjcQaZa3DG9kHQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/9] bnxt_en: Clear bp->total_irqs when
 disabling IRQs
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	pavan.chebbi@broadcom.com, andrew.gospodarek@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a736ad0661020490"

--000000000000a736ad0661020490
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:10=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Low]
>
> For NEW_RM firmware, MSI-X now seems to be set up earlier, in
> bnxt_open() -> __bnxt_open_nic() -> bnxt_reserve_rings(bp, true). Could
> the commit message and that comment be updated to match?

Yes, since I plan to fix at least one issue in patch #9, I will update
the commit message.

pw-bot: cr

> > +             if (edev->ulp_tbl->msix_requested && !bp->irq_tbl) {
> > +                     /* Stay stopped if there are no vectors */
> > +                     mutex_unlock(&edev->en_dev_lock);
> > +                     continue;
> > +             }
>
> [Severity: Medium]
>
> When bp->irq_tbl is NULL, this path skips adrv->resume() and leaves
> BNXT_EN_FLAG_ULP_STOPPED set. What resumes the ULP once the vectors
> come back?

Null bp->irq_tbl is an error condition, so we keep ULP stopped.  Other
existing error cases, such as an error abort during FW reset, will
also cause the ULP to stop permanently.

> [Severity: High]
>
> Is this check safe against concurrent writers of bp->irq_tbl?

...

> The lockless read of bp->irq_tbl was already there before this patch.
> But the new check is meant to stop NULL bp->irq_tbl dereferences while
> filling the ULP MSI-X entries. Would it make sense to do the check and
> copy the vectors under the netdev instance lock, or under another lock
> that the writers also take?
>

The lockless read of bp->irq_tbl is pre-existing.  The proper fix will
require locking changes in bnxt_re as well so that it will not read
stale IRQ entries.  I want to defer that to a follow-on patch.

--000000000000a736ad0661020490
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAUf7fT
lYPditGKQvdvxrEJPCXHNE6q+EcRHYm3hQy6qTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjQwOTA1NTZaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAfa9yugSwa3UXe9yjoHaD1067IVIYkR3amlhB6cTL/
B/OT9H7y0dDtSDm6WmbgIjM9Irp8A6yfp4jsfescRhJxVSn4yNjB0uVIFhuYyxvZRsUcngvm7zTu
od051K9CWNq8WpOKuM9kfcgxEjGxlDkUSo1NeooPhodMrpMZwcjNdKC+I66s9BAa6WaZ52RTGkIL
Yuo4WmWadi94+sKEuaoBPcV9AQ4Kk0PbPqjqnZeqp8o5fkeCv9yvKg1GNkIFoiuwZbXgoShY4cxh
ecgJn07kF4600LS1fTo+I3PIkOQsH6SOFcDslKooFFDQVC5xhzf2wCdJ1gqdxBoDw71QvP6S
--000000000000a736ad0661020490--

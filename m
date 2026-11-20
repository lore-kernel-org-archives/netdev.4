Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135629;
	b=VL+Qw2mjsyG8lPHd8fsMYmupvPLGGnYv16itDVORmg/xVaaRnLpEYDvkeS/nke4NBgGs
	 wG10NA6bykgqWc00gFvRqkSxwTFkLCbXFTJVbr6TMPWIx+FydorsDRvN9ipyE4WqtQsmM
	 9jFCh/B9guTY8opisNv72sP2c3pbJ4uFIDEZhJcAs0DPeUXZU+PCMKBK8AkOg21srbCIh
	 dkUJKbo3y79TedoC3T/g1eVEQ/zkI1Tzq1aUbuMZxHl/fssirjq+M9e2vabYKzs2vMeY/
	 3cKCUqr1/x3rh16w6d6TjGMwoVFRR1YSJREfsRkqVZ16hdtlAonf9/dVDfro7FgslGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135629;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=X1/n+dD4VRqPPdb4Jflt/FtrjZbrq0+diizHZc8pxNo=;
	b=ZgG26RZxObqt2eHMWZUZi/G4EoJmJXu7xMg5LR441uUF3SkZEdT/Ju7QVxy5UeV75aHW
	 hV3Ek4/xsHwbhA8z2TwuTiAFDUTK+IqJRD7xHPOzZNNSqW9BwoRVCTUh1FLS6VpT6B7l2
	 pic11gQ0o2mF8B5oOFbc/nfmBe0QtxkwO1pNvckLH2bISDFMXfSQ3xBx+3xJtq5TgadCk
	 hsWuCv9fPXVqqyZoQ1ckCBeuZEiDCWRtD6A8JaQZ7olIMc03uPk7A+AWXJ7CUfsLgTLDH
	 BfVf5xF3pldF2PKZhLsBllwazcJ5KFSQ0B/JYNYT2p/oubiDyN6wRkXEJ51P02qJdtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HXHRjyuX;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF8606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BF8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HXHRjyuX
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-94961bfe1a0so25729885a.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135628; x=1795740428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X1/n+dD4VRqPPdb4Jflt/FtrjZbrq0+diizHZc8pxNo=;
        b=GkVxsy4VI/INPDNEioClUfno6B4z7hb4eyxDz1hz1xcGlXfj5HFk3+3aLHv7BC1jcf
         GdonqDMVmzYn/ksQ8cNCr72I0i0T3rwv2BDvn/3sGoxpFEvUPv27bg+P8yctgd9c+rF7
         /w7E+8yigsH8zPqGJ+BVT3RAxO1zxYdveI2FL8mYW4qR1ZqHkAyJljeNkp4kAa4tKeYH
         8hbGBEWltpJUpKSQg6skLuGPDzS3wWG4Z7OlPBkJJZlVy2l5LC41cZmKsB/bCwTZveYE
         VEAcOrppHoehSc1sKDtJOHEkvvojkTVElXSFl1kKnU5aX2FVzJ2nEjn8mWGK2TpZTCWo
         wdJA==
X-Forwarded-Encrypted: i=1; AL+hErESYFTROaMyygRareFxt9qr55JyhwX6ooqquRkNIupEaki5xNoq+c6LxjVCqaLnzwsFtJEQz/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qdoDZ0fwZkZOUtCPJcIJwXE70QnOOCNTl3tBb7RB5J3pwi+gf
	FbTHoZJ/yFEUkbpSFyBDzyxVje7dyx4Y4qPScydk1zMA5QsTMUDNgCJsLT5ryu3nO2wie6O4pgG
	nzyETpNMDmvnqp0C9xqz8z7IbrnHeUbkrdQYCYVHdmJoXnPUxbYyxaVdNf495EiuXoE0HLksoOw
	RL/y6xKPZs60mJZlEcVlO305sH/9QZeu5USNea4f2bZV6s510IlRBBRlljjqHWQWfNc/Rysa9e8
	pmijyjpJKc=
X-Gm-Gg: AYBFou0iBxXSh09Avqq9ukltvtAvSIKt+xGZFer7RySBsjJ4WB4plG/JK41e9q6sar/
	xaeAqqyAKR/WzkpNnnbcwybew9aZyeLkC1SKxuDfkxLWe1MfwqDx0HKe6q2uOdm1K2CIWRdJgz8
	IVC0qn7zd3jUISeZvKuDVY10Kwe9Zf4K36wel5VO8mUKanXx8MyCWYKYRHlwCVAwhoV++6VVLqE
	4GKtZGj12PvwO1R6ddIeGSrfL/W96WBx6RuQieLKaTxaRXQnFdN0Uk12b4sy0KEw0PoqcQpXL3C
	BvyDu2dbbKHvqB3pF4R60UoPRoE3apvBh7P9CQcMj71s7lN5mggJQtIllWPGRaRxzEkxyOqCZ0Y
	c0RMLPRfg0JQD69KYl5XqxuZOApSzESyUYGtWWHeOJrixndlUX5nhSUQ8DWZObJS+RxObMyenGD
	Ld6UmXCtr6Dd/CGwt59dsx40XBqyzttSn+PQ4=
X-Received: by 2002:a05:620a:46a8:b0:93f:34c9:9252 with SMTP id af79cd13be357-949bab31d07mr247151185a.55.1795135627361;
        Thu, 19 Nov 2026 16:47:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb3a8486sm8708685a.14.2026.11.19.16.47.06
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 16:47:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50657eaef0so28435366b.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795135625; x=1795740425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1/n+dD4VRqPPdb4Jflt/FtrjZbrq0+diizHZc8pxNo=;
        b=HXHRjyuXZ9o1Jhe/wQpC/AqZGzvve2p51hUj3CbYf2WsTHLXsZNULIof2g/UvmszKz
         ZtIo/5T5K7W6RXNITtsad7qM6FtOdTVh2PPI7nLa2uZeZyVI8SQHOVZv+l+qKosTJpzD
         zl3KbpUR1YF6ooEe3wowgDLoRZFj2NqhSoeGw=
X-Forwarded-Encrypted: i=1; AL+hErFpX9gT8JuxLKdddT+W4ZiMgzoF7PTWziDR8J7+IgUJqMkHRcmndyPC8/WJb7kyj+ZS+k7jYxM=@vger.kernel.org
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id a640c23a62f3a-c513a8590b8mr105373466b.24.1795135625210;
        Thu, 19 Nov 2026 16:47:05 -0800 (PST)
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id
 a640c23a62f3a-c513a8590b8mr105372566b.24.1795135624883; Thu, 19 Nov 2026
 16:47:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118023905.3050661-1-kuba@kernel.org> <20261118023905.3050661-7-kuba@kernel.org>
 <CACKFLi=Zi7QBd1oNt-d99S5e6PfJ_Ym-p_-+k+iFHSU5zCi+Mw@mail.gmail.com> <20261119143027.6d8ca735@kernel.org>
In-Reply-To: <20261119143027.6d8ca735@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 19 Nov 2026 16:46:51 -0800
X-Gm-Features: Aa3M54qZPX2Jb1Y0NmMmzD-w9fcty8hY1EvYeqZvxA1uNBAvi8hrK-9nVEOKZGs
Message-ID: <CACKFLimfWNTrN8TFZ4t1np1y_oBJFVO_e3m8Sa9HMDe6L-wP7Q@mail.gmail.com>
Subject: Re: [PATCH net-next 6/6] eth: bnxt_en: restart Rx queues when their
 IRQ moves to another NUMA node
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	pavan.chebbi@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000047fd050660aa9506"

--00000000000047fd050660aa9506
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:30=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:

> I coded this up. AI review thing popped up the problem that
> re-allocating CP rings causes loss of IRQ moderation settings.
> This seems net-worthy to me :S  Attaching a memory provider
> on a machine with TPH will lead to loss of coalescing settings.
> Quite unpleasant for the -irq settings in particular.
>
> Can I send out the coal fixes for net and this series without
> the CP realloc? I'd follow up with the CP realloc after the
> net->net-next merge which we just missed :(

Sure, no objections from me.

--00000000000047fd050660aa9506
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDL3JKV
G/xP3EAhlrOmJlq2jIpVqAwI2W+1iG3XqBr5zzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjAwMDQ3MDVaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBD7E0ysvmPyraWBHGv+8IgGYn0cqdNSOYZqYLayPMk
7KgOPNUQ4JYMfJxmVKhaUNS6wsZUuzp6I2+TZCvyoQ3+B0s9mSS8chXr/paWvigbqTgI0yGH46Rq
yVC0bOxqvz/s8PwJwRAXr4CpdiY7Xf0M4HRD4+WYwTU3YwkeyTXXW05etI4PQasAz/SdRDn+KYev
D6TxHSYZ8axoRkc6QgAJUg+guQzrRgmzCYcOreXFnZbUcG88uW0rlik0xoHqoBwqpGVxcQv4xbex
c/6Gu92INmmfwSKfwr9192GwYGrFAY5eskUnufuc98ObCSzuNniYfExt+XDC1rpb1j907/iW
--00000000000047fd050660aa9506--

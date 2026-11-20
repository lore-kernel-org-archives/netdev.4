Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201971;
	b=MfHRQV+2iVuEzg0+l/pOC46zL31RAPVVI51qaPcP/o2J2WDU3sG3gt0DuolzwKqbsVvK
	 L/DggSB49fbCOI4xUARmy0swMY/F8z6mxPZG39mb3PkHWmwQYy1iaK50dRJIdG9U4N5fG
	 CQlnMrArX7lGErYNQkCJJa2hWzYIGn7PuJPLUFMYv2y4ejgYZfzc5ZE+o9BQl2bvL3Xf3
	 gZiyaNR+zw/8W5pRBTGqzw6E3J0ds/wHQiKICfDzCcOxSl9q1r6kE2TxEWJYaOsi5D8Ul
	 uQGZNGTTSqoWdjHzeFrSiWUVyywFaZ+SRnB6V1b6qthnjT8RSPLrWgUIdKVuSQjmUrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201971;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=m8EYzUnaVEGLuN8SuPA96C2/zI/DMtKnL70e6rR5SZc=;
	b=x+srWuVDcX3r2u6YHdXG4t3P6LsnBLMrRgvrT9LuursubUY9WAYHtAQAGuzPYwVtqyjk
	 NQaiodh30Eb0WfH2pJDyxl8Jh+RRwQ76PXeMPsNmDSXiwqeZL/8fMxLgYBUJJpPAgO5OG
	 URilZUg7KxrmXsqxdtrhPYtDu2ply3Z3PzbprcbMhJ7dDmOCiDSL1W98tWeAwMEW0RSze
	 RfTtDG7hZ+kt1YV/5BC2truT9EzAnhlk4mcvYBcbX10vbq2KoUt4Lwq1PaEDzsJ8OfvMz
	 2Rw4CONdzWnCunMHHwvQZ2VRVrys0auji2adlznbM4itKQgsmjl17b/oG4f2+v14lzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dz+xvD8j;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE31460A2623
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE31460A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dz+xvD8j
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-930c0f9c1b1so136006085a.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201964; x=1795806764;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8EYzUnaVEGLuN8SuPA96C2/zI/DMtKnL70e6rR5SZc=;
        b=UCOJbvgDtFN4bNoWoEJ6geMvqRe4blNqs7I11ebHBy3DEsDZgjoMDRd8ycsPbOo0hu
         9YJI7FeuVbAlR3Sd1pgLeUaBpSCXbwgtyrhlJnWKP03ayKrBNVJywUW9j0YG0AZwoJRL
         1Xl2GeKC0YWU3A/MJx9LUCfvL6uFIyJ+9VBceWjH/vUbqgpLIqWFk8foEmpbHtDuM2RE
         r9kOs52ICg5qShjN+q7xXqyreCb1W1c+x8jBOgRVbevIqiN80nStylYKmzpqHdRxkk4W
         Y4rmx66kgKIdhha7DXVHrqGtkZT7zRIPbeABOmVfee/m6bJ7GtyDc5qk4uj3MSuPA398
         bJHQ==
X-Forwarded-Encrypted: i=1; AL+hErHza3CTEpLZ3KMaHurdY+4vOJfsuFAhVwTcp7wqBriWC6citPsQWoz1nO2QkFZLVqvzKenjaEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/7SVqQs94N/xJX7aN67nWfRY5OK/NQ/67guPVhgZ8R9Pxdazz
	SJ2bIHj6X4PrxlVazbVtbbffgzmRDH3+Qjxb45Av2LWR1zMsMH1HE7JF8wmlEx+yGhEoxw0cJdO
	UqdpfroQ2ELINTp14oOzplfB4/lQql0JgFzifRRbqSN5/TFakI1PhhDw2EWWb6NWGh80bUe4jMM
	OVJf1zrvCu3zYqa6oNU0W5NG5c8tns1X2iABNyCqejDSAcVv6px6mAQVGJr3cwEW2aExEdv274y
	SHQkner+YA=
X-Gm-Gg: AYBFou0+U94azN5E1BLFJdp4XDr61DxBkwXUE+lydBnWbEDoJfFNLjymoXbFswenIGH
	RE90i2d1okKfSnJsyjp5U5UteIJDjexbp1IuhcHBSFE6RnQw52Q2xpzgsYwfcADiZdL0dEwiyxT
	JyyPYVq1zpkAWkv9QHG2xV6FCXGmrdRsOsiwUNYHjoICowMKpcScLa4+6J8Zp6BBT+3JGDGS9pH
	oodmld3tI1gynsUTLRrOtsOWeW+5VXISKif4lj1Pt3ITeb/sxXAojPxPLPMfGPhhd1VkuM8nnEv
	vf6R35J2WXtGfdSbW9uY/H2N6u19qA/XcHd4yhyIyMSKguCf/M36gIpgLIMVu0Q8zLGlT6Slada
	xRqFO4znDwn2JD9BkCDZohJcjtgPbnDnEakdMA/lGumOzMZ/ZhWLApv7rgLibDWr8oUytlULHr1
	1VATFcEIUtIayrHbIXge4SYzv/NvezbqlL5zTg8Q==
X-Received: by 2002:a05:620a:132b:b0:93b:c537:fdb8 with SMTP id af79cd13be357-949ba823192mr675331085a.6.1795201963602;
        Fri, 20 Nov 2026 11:12:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb0185cfsm26318285a.1.2026.11.20.11.12.42
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:12:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4163a5400eso169105666b.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795201961; x=1795806761; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8EYzUnaVEGLuN8SuPA96C2/zI/DMtKnL70e6rR5SZc=;
        b=dz+xvD8jJDLcgA4h+zkcXTh+AxDRul31hM+AczOQlI+XenUC8qMpUJkpoho3/Q/q1h
         92gEAbobwnYoIKKSwAFYc4+EJtngjglQQEMUUnGdxOlwZjPz67W04LB5BEq/Ehsm5+iH
         Hu6io5VWepAVx1vISoMxvwYsF0wrxn4nKJwiY=
X-Forwarded-Encrypted: i=1; AL+hErH4LcR3js5xAE8Sgio8XYNJi7CpqBkYl7j0DAiZEbroyMGQRlJAjwoekKhvs461BlXF2h8HB2Q=@vger.kernel.org
X-Received: by 2002:a17:907:60ce:b0:c25:5159:6a25 with SMTP id a640c23a62f3a-c51317e322amr586954466b.6.1795201961536;
        Fri, 20 Nov 2026 11:12:41 -0800 (PST)
X-Received: by 2002:a17:907:60ce:b0:c25:5159:6a25 with SMTP id
 a640c23a62f3a-c51317e322amr586953066b.6.1795201961188; Fri, 20 Nov 2026
 11:12:41 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119223854.3050-1-narcisav.kernel@gmail.com>
In-Reply-To: <20261119223854.3050-1-narcisav.kernel@gmail.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Fri, 20 Nov 2026 11:12:28 -0800
X-Gm-Features: Aa3M54qVjqW2OcX_IB373xboFBXq-PDyB3gJ_pRne13Y2F89UHzz-1rcEg3GYPU
Message-ID: <CACKFLinsQ6xLQMN9d_ZC+gy7S1PvXp2X6AXhwsMvqAeNs8BQ6w@mail.gmail.com>
Subject: Re: [PATCH net] eth: bnxt: split TX buffers that don't fit in a
 single BD
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Coco Li <lixiaoyan@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003b64070660ba0794"

--0000000000003b64070660ba0794
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:39=E2=80=AFPM Narcisa Vasile
<narcisav.kernel@gmail.com> wrote:

> @@ -546,8 +604,17 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff *s=
kb, struct net_device *dev)
>                 goto tx_kick_pending;
>         }
>
> +       /* Data BDs after the long BD and the extended BD */
> +       nr_bds =3D bnxt_tx_nr_data_bds(skb);
> +       if (unlikely(nr_bds > TX_MAX_FRAGS)) {
> +               /* bnxt_features_check() makes the stack segment these */
> +               netdev_warn_once(dev, "SKB needs too many (%d) TX BDs, ma=
x supported is %d\n",
> +                                nr_bds, TX_MAX_FRAGS);
> +               goto tx_free;
> +       }

Is this check just defensive or can it actually happen?

> @@ -90,6 +91,20 @@ struct tx_bd {
>
>  #define TX_MAX_FRAGS           (TX_MAX_BD_CNT - 2)
>
> +/* Largest length that fits in TX_BD_LEN. */
> +#define BNXT_TX_MAX_BD_LEN     0xffff
> +
> +/* BD length for split buffers, a multiple of 4K so that 64K frags don't
> + * end with a 1-byte BD.
> + */
> +#define BNXT_TX_SPLIT_BD_LEN   (BNXT_TX_MAX_BD_LEN & ~(SZ_4K - 1))
> +

1-byte BD should be fine.  Do you see better performance splitting it
at 60K + 4K?

--0000000000003b64070660ba0794
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAWCLXP
OdnMelDihJ1uzlps8a40tBSMo16Sa7EBCrKzUzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjAxOTEyNDFaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBvpY/2KL1jsLqFDvdvhibBdxcf5rWdSszumx8GA45C
cABYWq0f+PbsDZVDIrsTXBcNRylPGzpT3QLyyp9ejfuXqAvYzuKzXiTMkZfiz+Tax5m8UjjJKHQm
M/XSD8vBOIODaqffpOYHglHZZ3RgOqZSKIew+IZ4CElZIJDjINfY0XbWZmnWk3YGT9VeBkKYlfax
wo6uldwCAhjWys6lmwnq7R21XtsAH/8BTsHX+gTLvVqEDxsU6qUIAbrVO8eluGi1BQYVe6uo7QoR
U6Sfbg0YmryqP8ZFAJzgiFIW6YZy5AHs402dKNB+uOze5xSZPiZb2/6ARebAPdNXEHlZmr77
--0000000000003b64070660ba0794--

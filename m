Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173530;
	b=2fwoRALKwBbLLtC8r1gvUSco05S6yatmiFSAK/cq93BMNH1Nsdt+EK3+haw4jygfF7rP
	 WNK0oY2chFa+riShLtWXy20wR6WHMT9fJQtZyFpbnU7E6Yslsg+Jx7/O3Q5Fp76oJ7rSe
	 /s/aQquuW75EjFXISbQibmwZWD5OvgE3HHXe9k1pIHw39SopJQaN8nbDEkQVMgNgDukre
	 nBe4Z+3j5bEg/xIq0osWjVwk1uVD5A9tUwM8baE/EPxncp5CCTtm1eRpnWyoogiO+pWci
	 vZLgIrDcI2DnIAuCEX3w0ErFwssr6rKT6clvsQLwQD/MSo6wxRnhnQ2EX2iBDPoFfNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173530;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 X-DetectorID-Processed:Content-Type;
	bh=7ojw7t453eNdPrIRIp5GE/6vvfSdoTxrIKRAGxsqJBs=;
	b=diCmKduuNOyibRJx94/oo3tebu9KKrsedvYd+ijkF4da9r9Nv2Ti6OqVS75V7sXB1ii2
	 JDjOLdNe77r0B4xDWPDxOVFpMNyzn2rs2//nQVTzyfDpgjhwwt9QyU+cTbzHdUbkO2tlH
	 mpNu71gXQGq6Z4GoyebqTAw1f4YXxPT2TRtjK2pOUlybfpYdvaV6NH0EdbAznjHg8Pzla
	 wfi2aCnvgvqmYZcnXsWuSBEOqjlJN93iwQLo+C7RhkkGZO3UzhjAC0nEZPxGr7kAaJs7n
	 RnQGpu9EL2gYsGpRCT3E1vEQ2bqRf3hrW3W+g2ADYdd3RVH6jDJi16UKFgqM2S3qeOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ISsaeHhv;
	arc=none smtp.remote-ip=209.85.160.227
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695B606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7695B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ISsaeHhv
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-55d30c054dfso9428741cf.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173528; x=1795778328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ojw7t453eNdPrIRIp5GE/6vvfSdoTxrIKRAGxsqJBs=;
        b=m2RluT8VocGOKFFigpkP0+brXKZadJ9EAqQnrB6h43Nuvz5LVPmoADCat5hrQdWT26
         F7SAkFEZV473/aBJSJml+WnTLjPjch1H/1ZIipu6U18LbphMcQZa1UuzhfjX0Ogwchsy
         EmYcH2bkoe69bm3UeQybkQLYqR8q1hd/SoOblSiA7S7l+DKoWGc0BE+uA3eUARU9R8Zf
         8eCFKSb32H48qCMRm89VHSzlpXxjyu02chaMrgP3TjXTnnfhZ0OQ8+y2ytn3hxI4CSzC
         uKsbb2lBQGcgrhJF9kbNjcQgd6x0iFQESUqCDgvcw2ndETDcf20NXxrqOjJktg0FxDp0
         QZOQ==
X-Gm-Message-State: APuU4Z/NbX6RAZFDTf1slOKw5ZWTsm5j6ktU/d4okw1oJIn4ERHqZTPR
	BC6owJa35vXNtLYi1iQBH471rQ/GeJjVybJVVGBBm2umCmEzcA3xaSjlgaY6mgypjwy/q1IRJds
	bhQv96ga217v2u6A1SvMDcyKcq7GCUoQOawR1E0bc0Mt4MfacklWjZc4h4wFrK5eadoig8NxePo
	rIZ6CJo5UmXfQBcuknhQ2VwdBmRjlKV/uD/DpBBvzyOMk/lOG5b65MUqI7uANS9rO7+uaJeE/W2
	MJKzXgIp15sGKVPyw==
X-Gm-Gg: AYBFou1sf4WG4zuGPLWkYQ/UY+fmAXvyp2MtLKj+H5wYf57i0tYMjBAZgdtUQtq3bP6
	grFbGXHKaqEfZJ3u7nJECMFgfhBwBITn3X/3B4xe26xF2Q0p40O3Fy/tzUNf2lltZmrDQ4rc8lN
	huJiFaDrMIsTkL4AEL8mhz8GCG+fsNbENlEZ+tTf1GyP6X32WO0Oz244jqZVssQtLwc9ouVMbvm
	uwdLWFG3MtiCdCyXYBJrp/9bkfZMFBWZMXJGQsSD2j3BBlvJ9MjNGcFbwXYj98oQuXNaQQcw89x
	fvKMEUBPE+HJYAhHwjN7p10Whc1PQkYh0DTYWUhBXSfRMzJyUsuZfLWfgEoCOo0rdi+z6EOwgrt
	1Wq+XJl2Zrmt0RCykzCuF8OSlip2jFNtDGJ9t1//FgGUrvoUlqYgPNkaDfIPvypjsb09VUWFJ9U
	wXPr2T5CA8+6zqcP2EPXead0gJmXQJCfqgo3hUZEs4uWbQ
X-Received: by 2002:a05:622a:178b:b0:536:6902:daea with SMTP id d75a77b69052e-55d769e0bc4mr50284101cf.23.1795173528298;
        Fri, 20 Nov 2026 03:18:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-55d7882cffasm147781cf.25.2026.11.20.03.18.47
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:18:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1366264eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795173527; x=1795778327; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ojw7t453eNdPrIRIp5GE/6vvfSdoTxrIKRAGxsqJBs=;
        b=ISsaeHhvkJKFuJ17ZezsAZ3j7R+5mDedofKbaUqWuG1HR6jltTTWfiWRVWwC1uL3Bv
         p7Z20Yy7uJ1XdrSxwufhSos2Oyfp8hKIxG8aDwSyNkJzbW6GZVrJXcQieonaXSX69yhQ
         /bm8YhywOfIOBpkYS+xQNNrPglqU6gOK6yE/c=
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr3636541eec.21.1795173526316;
        Fri, 20 Nov 2026 03:18:46 -0800 (PST)
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id
 5a478bee46e88-3857093f077mr3636474eec.21.1795173525526; Fri, 20 Nov 2026
 03:18:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com> <20261117061641.122942-4-bhargava.marreddy@broadcom.com>
In-Reply-To: <20261117061641.122942-4-bhargava.marreddy@broadcom.com>
From: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Date: Fri, 20 Nov 2026 16:48:31 +0530
X-Gm-Features: Aa3M54qc6i-OJi32AL-WpweTIXLknpJtJaE2bl-ZVeSR8IGFqq69Lqj7KqbehfE
Message-ID: <CANXQDtZWo7Yv74HxQ7Zr9yMMe3znJy3pKNn_D51OU92bnHP54A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/5] bnge: add bnge_for_each_open_nq() iterator
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com, 
	Dharmender Garg <dharmender.garg@broadcom.com>, Kumar Mudide <kumar.mudide@broadcom.com>, 
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006402b90660b36892"

--0000000000006402b90660b36892
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Responding to Sashiko comments:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117061641.122942-1=
-bhargava.marreddy%40broadcom.com

On Tue, Nov 17, 2026 at 11:48=E2=80=AFAM Bhargava Marreddy
<bhargava.marreddy@broadcom.com> wrote:
> @@ -1255,10 +1255,11 @@ static int bnge_alloc_core(struct bnge_net *bn)
>
>         bn->bnapi =3D bnapi;
>         bnapi +=3D arr_size;
> -       for (i =3D 0; i < bd->nq_nr_rings; i++, bnapi +=3D size) {
> +       bnge_for_each_open_nq(i, bd) {
>                 bn->bnapi[i] =3D bnapi;
>                 bn->bnapi[i]->index =3D i;
>                 bn->bnapi[i]->bn =3D bn;
> +               bnapi +=3D size;
>         }

Sashiko:
Discovered by: fable-5-1, opus-5-5 =C2=B7 Missed by: sashiko-gemini
With BNGE_FIRST_OPEN_NQ at 0, this loop does the same thing as the old
one. Two things around it have not changed:
- The kzalloc() above is still sized for all bd->nq_nr_rings bnapi
  structs.
- Several unconverted loops still dereference bn->bnapi[i] starting
  from index 0. Examples are the rx_ring setup just below,
  bnge_disable_napi(), and the cp ring free loop in
  bnge_hwrm_ring_free().
Here is the rx_ring setup:
for (i =3D 0; i < bd->rx_nr_rings; i++) {
...
rxr->bnapi =3D bn->bnapi[i];
bn->bnapi[i]->rx_ring =3D &bn->rx_ring[i];
}
If BNGE_FIRST_OPEN_NQ were raised with nothing else changed, would
bn->bnapi[0..BNGE_FIRST_OPEN_NQ-1] stay NULL, so that these loops
dereference a NULL pointer?
Nothing changes at runtime in this patch. The last patch in the series,
"bnge: create NQ0 during probe and keep it active across open/close",
sets the define to 1. In the same change it adds
bn->bnapi[0] =3D bn->nq0 and sizes the allocation as
size * (bd->nq_nr_rings - BNGE_FIRST_OPEN_NQ). So no commit in the
series seems to reach the NULL case.

Response:
That is harmless in this patch. BNGE_FIRST_OPEN_NQ is 0 here, so
bnapi[0..FIRST-1] is an empty range and there is no NULL entry to hit.

The define becomes 1 only in patch 5/5. The same patch sets
bn->bnapi[0] =3D bn->nq0 and sizes the allocation as
size * (nq_nr_rings - BNGE_FIRST_OPEN_NQ). No commit in the series has
a non-zero define with a NULL bnapi[0], so bisectability is preserved.

>
>         bn->rx_ring =3D kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_=
rings);
> @@ -1976,7 +1977,7 @@ static int bnge_hwrm_ring_alloc(struct bnge_net *bn=
)
>         int i, rc =3D 0;
>
>         agg_rings =3D !!(bnge_is_agg_reqd(bd));
> -       for (i =3D 0; i < bd->nq_nr_rings; i++) {
> +       bnge_for_each_open_nq(i, bd) {
>                 struct bnge_napi *bnapi =3D bn->bnapi[i];
>                 struct bnge_ring_struct *ring =3D &bnapi->nq_ring.ring_st=
ruct;
Sashiko:
Discovered by: fable-5-1, opus-5-5 =C2=B7 Missed by: sashiko-gemini
The body of this loop still chooses the async event completion ring by a
hardcoded index:
drivers/net/ethernet/broadcom/bnge/bnge_netdev.c:bnge_hwrm_ring_alloc() {
    ...
if (!i) {
rc =3D bnge_hwrm_set_async_event_cr(bd, ring->fw_ring_id);
if (rc)
netdev_warn(bn->netdev, "Failed to set async event completion ring.\n");
}
    ...
}
Once BNGE_FIRST_OPEN_NQ is above 0, i never equals 0 in this loop. Would
bnge_hwrm_set_async_event_cr() then never be called from here?
With the define at 0 there is no change in behavior. The final patch of
the series ("bnge: create NQ0 during probe and keep it active across
open/close") removes this block. It calls bnge_hwrm_set_async_event_cr()
from the probe-time NQ0 setup instead, guarded by
BUILD_BUG_ON(BNGE_FIRST_OPEN_NQ !=3D 1). As far as I can tell, no commit in
the series has both a non-zero BNGE_FIRST_OPEN_NQ and this if (!i) block.

Response:
Same situation. With the define at 0, i =3D=3D 0 is still the first NQ in
the loop, so behavior is unchanged.

Patch 5/5 removes the if (!i) block and moves the
bnge_hwrm_set_async_event_cr() call to the probe-time NQ0 setup,
guarded by BUILD_BUG_ON(BNGE_FIRST_OPEN_NQ !=3D 1). No commit in the
series has both a non-zero define and the if (!i) check, so
bisectability is intact.

Since patch 5/5 resolves both points, I believe no change is needed
in this series.

Thanks,
Bhargava Marreddy

--0000000000006402b90660b36892
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGqjCCBJKg
AwIBAgIMFJTEEB7G+bRSFHogMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNTI1NVoXDTI3MDYyMTEzNTI1NVowge0xCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzERMA8GA1UEBBMITWFycmVkZHkxGDAWBgNVBCoTD0JoYXJnYXZhIENoZW5uYTEWMBQGA1UE
ChMNQlJPQURDT00gSU5DLjEnMCUGA1UEAwweYmhhcmdhdmEubWFycmVkZHlAYnJvYWRjb20uY29t
MS0wKwYJKoZIhvcNAQkBFh5iaGFyZ2F2YS5tYXJyZWRkeUBicm9hZGNvbS5jb20wggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCq1sbXItt9Z31lzjb1WqEEegmLi72l7kDsxOJCWBCSkART
C/LTHOEoELrltkLJnRJiEujzwxS1/cV0LQse38GKog0UmiG5Jsq4YbNxmC7s3BhuuZYSoyCQ7Jg+
BzqQDU+k9ESjiD/R/11eODWJOxHipYabn/b+qYM+7CTSlVAy7vlJ+z1E/LnygVYHkWFN+IJSuY26
OWgSyvM8/+TPOrECYbo+kLcjqZfLS9/8EDThXQgg9oCeQOD8pwExycHc9w6ohJLoK7mVWrDol6cl
vW0XPONZARkdcZ69nJIHt/aMhihlyTUEqD0R8yRHfBp9nQwoSs8z+8xZ+cczX/XvtCVJAgMBAAGj
ggHiMIIB3jAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMw
RgYIKwYBBQUHMAKGOmh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZz
bWltZWNhMjAyMy5jcnQwOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dz
Z2NjcjZzbWltZWNhMjAyMzBlBgNVHSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisG
AQQBoDIKAwIwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3Np
dG9yeS8wQQYDVR0fBDowODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2
c21pbWVjYTIwMjMuY3JsMCkGA1UdEQQiMCCBHmJoYXJnYXZhLm1hcnJlZGR5QGJyb2FkY29tLmNv
bTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAd
BgNVHQ4EFgQUkiPQZ5IKnCUHj3xJyO85n4OdVl4wDQYJKoZIhvcNAQELBQADggIBALtu8uco00Hh
dGp+c7lMOYHnFquYd6CXMYL1sBTi51PmiOKDO2xgfVvR7XI/kkqK5Iut0PYzv7kvUJUpG7zmL+XW
ABC2V9jvp5rUPlGSfP9Ugwx7yoGYEO+x42LeSKypUNV0UbBO8p32C1C/OkqikHlrQGuy8oUMNvOl
rrSoYMXdlZEravXgTAGO1PLgwVHEpXKy+D523j8B7GfDKHG7M7FjuqqyuxiDvFSoo3iEjYVzKZO9
NkcawmbO73W8o/5QE6GiIIvXyc+YUfVSNmX5/XpZFqbJ/uFhmiMmBhsT7xJA+L0NHTR7m09xCfZd
+XauyU42jyqUrgRWA36o20SMf1IURZYWgH4V7gWF2f95BiJs0uV1ddjo5ND4pejlKGkCGBfXSAWP
Ye5wAfgaC3LLKUnpYc3o6q5rUrhp9JlPey7HcnY9yJzQsw++DgKprh9TM/9jwlek8Kw1SIIiaFry
iriecfkPEiR9HVip63lbWsOrBFyroVEsNmmWQYKaDM4DLIDItDZNDw0FgM1b6R/E2M0ME1Dibn8P
alTJmpepLqlS2uwywOFZMLeiiVfTYSHwV/Gikq70KjVLNF59BWZMtRvyD5EoPHQavcOQTr7I/5Gc
GboBOYvJvkYzugiHmztSchEvGtPA10eDOxR1voXJlPH95MB73ZQwqQNpRPq04ElwMYICVzCCAlMC
AQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMf
R2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMFJTEEB7G+bRSFHogMA0GCWCGSAFlAwQC
AQUAoIHHMC8GCSqGSIb3DQEJBDEiBCD8Rg7rUfuwrYF+LS3mzELXc8oLUQEm+bmAcpEb4j6kujAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjExMjAxMTE4NDdaMFwG
CSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYI
KoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQClXCob
DJNCAQq4wXwwQMb1jKijAqyuXJMmx2kKwRZJMjLZywDO9zVScuYg44uDESfK9QXXSrV9no0mAzRS
ABIHV8DY0wehcwZb0PVdmWBNqCqr3I0ufUwye1RbBkCpbV/0IjrBZgU+xQKiBTlxhiK1ADMNzoug
tE8yOc/ag3BMsoo6dg1VnPdB0W92uTTwhoLRIY9pmj1gWaT3K2awrsCc0Ob1lRvp9OeeUW01v2eh
fuHI3BwWhbb4jSCNYOh1KDtX2NHGfr987uce6U3hO8QAIZ6wGu0pA+3onCab/ADPtDtgR933PlXn
OqQIJ0J4vnqLtQEO0gRG1tmIat7dKdWr
--0000000000006402b90660b36892--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347847;
	b=q8pDzE/xsNdhm7VhHs/N5gQ2b82k1KoGZ6+MBV8w1xnCvQpX5CP1//ntCJENw/CWmZz3
	 glW0q3oVTJbT7N2LMjfqv+4MqIrjHLe1UuGhSHV2a3FDKQ8Q4DXBsP5VJlHKV0wX/xMtX
	 sTEShln2C3nFH7T9bkKeV+SjRNqmbxzlw8mH9mVmfOMg5/neFYFfICpC/NGmPhS8iWwBX
	 xCNLlrlUANuUxmui111k1uUje9aMqCs6EQAqJoro8tmbahC1oy/FCCLyh2Opfcj6lxhvr
	 MTgnROzr+qDhsQJbkm/qP6DcRWGW/oHGfyWkZ4UYPTZc71a3KFWwnZHyJKHB/Gpbt/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347847;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=xeCTsmwzsK4X46jrJrqF+8MmBHqj0G3D8V76BK1xcBk=;
	b=dlqKKux97fuTUmzPQkv2UM4GELrEyfnkZn5iTh+1klHFR39usgelDb5xitrsWCkDz+oC
	 SvNjeD68P0VVMfKEeIsaJg3LUplMLOHp86hEzb9KN6ZTvPyV3qgj7tz30O6jv+PZcJvYR
	 5HiI48NhqfKvE0++8JGERlBF+gxwPbM0jQyE7Gjd4+/mEag4+hzOviQJyoHKYlOKbs7Z9
	 8+UYTFWqecPT+LOSPywtvUhQyE5uXxbTuI367zkjKgPA0h1AVnNmdFJf0VpV29PsSEGEp
	 /vq7iZ61gYGv2aa8ePY+hsD4x1BL3Gkp8IC3sDFoKrLpdE3zALiRmDA+mNnhuCJZjTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YBT9CV5h;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C51A606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C51A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YBT9CV5h
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so1433652a91.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 03:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347846; x=1795952646;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeCTsmwzsK4X46jrJrqF+8MmBHqj0G3D8V76BK1xcBk=;
        b=GUuTwt8T83ARqxhuWX3l3WP1+GHqSn2wFxcu5BvH3IthKhvT0URpxHPsT/gSTqI1XA
         BA06boWI2t3mrWAV1rzeWX5Tf4SxpgFc/hhqKdFmcLE8RC1WuMh+taZOL4khschFkeBp
         rYRtGZCqWAFgJzCqQm9+iji80ON5nTL/obBCxBwDXm0tZYAyDiERCNrB62oppyLvtAq6
         xUr0HRCIkXLWC3NcC5ihMe+L/p2HGFu/wm2RYNy+7O0Yl7FlOe+O9e5rWm+/IghkxiSo
         ybyD703gmRZnzc+SxywPxjQaww486Qf87GrhAo5oO+pATq0Xzp8pOjNtkkueHn8vY1j6
         gFoA==
X-Forwarded-Encrypted: i=1; AL+hErEk3RSujLJSsHYMMIdp2GI6mNQuOtGCy0LPp/i1M5o0X2HN0vuhv6Gjx1K3IRUaZbXPZ9AOJCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TQhB39bYgG2xWHVgSgYEpRobEjpiapvQApSfRZpej+ViyMm1Q
	km9nebJMCEkAn/vmzQF+AIQ9fpmTHn3Pt7egTHMg5G9L5S0p7hRXvLEE1bNlMvncdYetVSmV2fg
	LNVYrg/b1QNwMBZiaNJsSMZusW0yFXjQ15YTDMGJ12fgFVAuAzRp9XblWmY7bLgz0wB4URQJdFl
	ZbxJGvDQkGYc5yO/CtYrF3Qc6FFdFcn6KDweneecU48MqVYWDNA57QjBMiBV+0Tuy4JWjOjPHB/
	+1zSVE6vtw=
X-Gm-Gg: AZFdTZcEybLVNacvVJKtbSRk4ijFPCX7Flz5eyY7P7fh70hGfBX594bBCNWgR4QouVb
	9itNI4j5SRMw31aP0cxAH7eji8MYWMUI/J52NaYBZxLQenPXZsMPkJBtZzLqcFMX2ynjsxpBpfV
	YGHgI5ZqmIODpp/X3YTSp0Eup5mUsUeSPGzKSDTkKk2eq5Enfpa9CKiCcngUzKnKqyfVa3ka47x
	xYbPrhFEY+cEyEda09X3140UOneOfl1Q9sRBvKB/65lDvo0YbRzqjSnBF4o1GvDYJeFuyR8uE6f
	xajl7fasAPdWtqM7v0gt5LHtua4s676SwzW+++Ge66MjAJtDeY2wq2gmJPA9+1DHBD7zfa/TfYU
	hU0Hqh4FsZceccACCcsyB1l1Bj6HFjQpJ199lLbwRvJKAzfbcqh8BbEeaXHePWmlO23h2bUjFP9
	jTLR/DwNTF50XH1SbbjwUlOir9ZeE22OEvzSh+MQ==
X-Received: by 2002:a17:90b:2c87:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b41c96ed40mr7655111a91.61.1795347845539;
        Sun, 22 Nov 2026 03:44:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc5245sm2220019a91.0.2026.11.22.03.44.04
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 03:44:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso2897342b3a.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 03:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795347843; x=1795952643; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xeCTsmwzsK4X46jrJrqF+8MmBHqj0G3D8V76BK1xcBk=;
        b=YBT9CV5hGBMkBg6GuChD/wjgu09gnKdrLV1w+flo/ztm2Fx9ImOqNN5CmX/aGksBbr
         VVRzMrfrcSgHP76etCiDSiLArqN221Qlss09aKfixd48w8cqUjkvfXX7tLcS6iaGMQTK
         Iy95VJx7G+VybfJzCbsLhzbPAuN6KchzlrhFI=
X-Forwarded-Encrypted: i=1; AL+hErEW5fgwOOMOEpt3Glw8gp1EKvOInxEZIDBxmFM+GP0MHvkCEc346fIi6LJ4QDpi6uTnVxYzAmQ=@vger.kernel.org
X-Received: by 2002:a05:6a00:2d2a:b0:899:21db:3f6c with SMTP id d2e1a72fcca58-8c8794b8766mr7491966b3a.1.1795347843474;
        Sun, 22 Nov 2026 03:44:03 -0800 (PST)
X-Received: by 2002:a05:6a00:2d2a:b0:899:21db:3f6c with SMTP id
 d2e1a72fcca58-8c8794b8766mr7491956b3a.1.1795347843034; Sun, 22 Nov 2026
 03:44:03 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118105408.1076095-4-pavan.chebbi@broadcom.com> <179534562327.3135.6438737872601204289@kernel.org>
In-Reply-To: <179534562327.3135.6438737872601204289@kernel.org>
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
Date: Sun, 22 Nov 2026 17:13:51 +0530
X-Gm-Features: Aa3M54ptQ3s6lwqyCkakGjlwCyY0tlq_MIGbbRQIMHO1w3soeMSLSIAN4ijK3Ps
Message-ID: <CALs4sv1iZrM29XeJ7b=veiC1XdT=xo0wBxYm1z4PLWiOAC5N2w@mail.gmail.com>
Subject: Re: [PATCH net v3 3/3] tg3: Fix heap overflow in unbuffered NVRAM
 write path
To: netdev-bot+sashiko@kernel.org
Cc: michael.chan@broadcom.com, kuba@kernel.org, andrew+netdev@lunn.ch, 
	andrew.gospodarek@broadcom.com, davem@davemloft.net, edumazet@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shravya.k-n@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000079aeac0660dbfea2"

--00000000000079aeac0660dbfea2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 4:37=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new guard `if (pagesize < 4 || !is_power_of_2(pagesize))
>   return -EINVAL;` in tg3_nvram_write_block_unbuffered()=E2=80=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the patch only
>   partly closes it.
>
> --
>
> tg3: Fix heap overflow in unbuffered NVRAM write path
>
> This patch changes tg3_nvram_write_block_unbuffered() to clamp the copy
> size to the room left in the current page and to advance buf on each
> iteration. It also rejects an nvram_pagesize that is smaller than 4 or
> not a power of two, so ethtool -E fails with -EINVAL in those cases.
>
> > diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet=
/broadcom/tg3.c
> > index 5a0e247a4c463..12f199355984b 100644
> > --- a/drivers/net/ethernet/broadcom/tg3.c
> > +++ b/drivers/net/ethernet/broadcom/tg3.c
>
> [ ... ]
>
> > @@ -3379,6 +3380,9 @@ static int tg3_nvram_write_block_unbuffered(struc=
t tg3 *tp, u32 offset, u32 len,
> >       u32 nvram_cmd;
> >       u8 *tmp;
> >
> > +     if (pagesize < 4 || !is_power_of_2(pagesize))
> > +             return -EINVAL;
> > +
>
> [Severity: Medium]
> Will this check reject every NVRAM write on 5750/5780 boards that use SST
> flash?
>
> tg3_get_nvram_info() sets up the SST parts without NVRAM_BUFFERED:
>
> drivers/net/ethernet/broadcom/tg3.c:tg3_get_nvram_info() {
>     ...
>                 case FLASH_VENDOR_SST_SMALL:
>                 case FLASH_VENDOR_SST_LARGE:
>                         tp->nvram_jedecnum =3D JEDEC_SST;
>                         tp->nvram_pagesize =3D SST_25VF0X0_PAGE_SIZE;
>                         break;
>     ...
> }
>
> The constant is defined in tg3.h as:
>
> #define SST_25VF0X0_PAGE_SIZE           4098
>
> FLASH is set from NVRAM_CFG1_FLASHIF_ENAB. Because of that,
> tg3_nvram_write_block() sends these devices down the unbuffered path:
>
>         if (tg3_flag(tp, NVRAM_BUFFERED) || !tg3_flag(tp, FLASH)) {
>                 ret =3D tg3_nvram_write_block_buffered(tp, offset, len,
>                         buf);
>         } else {
>                 /* unbuffered writer */
>
> is_power_of_2(4098) is false. So tg3_set_eeprom() -> tg3_nvram_write_bloc=
k()
> -> tg3_nvram_write_block_unbuffered() returns -EINVAL every time.
>
> The value 4098 looks like a typo for 4096, since SST25VF0x0 parts use
> 4 KiB sectors. Before this patch these boards were already broken: pagema=
sk
> was 0x1001, and the read loop wrote 4 bytes at tmp + 4096 into a 4098 byt=
e
> buffer. The new check stops that overflow, but it does so by refusing the
> write rather than fixing the page size.
>
> The commit message says:
>
>     A page size of 0, which tg3_get_nvram_info() leaves unset for
>     an unhandled flash vendor, also made the loop issue erase commands at
>     address 0 forever with the rtnl and NVRAM locks held.  ethtool -E now
>     fails with -EINVAL in these cases.
>
> It does not say that a flash vendor the driver supports now always fails.
>
> Should SST_25VF0X0_PAGE_SIZE be changed to 4096 as part of this fix? If
> not, could the commit message mention the SST case for maintainers and
> stable backporters?
>

Yes, ethtool -E will now fail with -EINVAL on 5750/5780 boards with SST
flash, since SST_25VF0X0_PAGE_SIZE is 4098.  But the unbuffered path
cannot work correctly with a non power of two page size.  With pagemask as
0x1001, phy_addr is not always page aligned, the read loop runs to
j =3D 4096 and writes 4 bytes at tmp + 4096 of a 4098 byte kmalloc buffer,
which KASAN reports as out of bounds, the program loop then programs 4100
bytes, and NVRAM_CMD_LAST is never set because pagesize - 4 is 4094. I
have no such board to test, so I cannot say how these writes behaved
in practice,
but refusing them looks better than erasing a sector and programming past i=
t.

Also I would rather not change the constant to 4096 in this patch.  That
would enable the unbuffered erase and program sequence on SST parts for
the first time, and I cannot validate it on hardware.

--00000000000079aeac0660dbfea2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVWQYJKoZIhvcNAQcCoIIVSjCCFUYCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLGMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGjzCCBHeg
AwIBAgIMClwVCDIzIfrgd31IMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNTM1MloXDTI3MDYyMTEzNTM1MlowgdcxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEPMA0GA1UEBBMGQ2hlYmJpMQ4wDAYDVQQqEwVQYXZhbjEWMBQGA1UEChMNQlJPQURDT00g
SU5DLjEiMCAGA1UEAwwZcGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTEoMCYGCSqGSIb3DQEJARYZ
cGF2YW4uY2hlYmJpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANGpTISzTrmZguibdFYqGCCUbwwdtM+YnwrLTw7HCfW+biD/WfxA5JKBJm81QJINtFKEiB/AKz2a
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
MjAyMwIMClwVCDIzIfrgd31IMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCxHUkb
1B0b8g36AVSmcrixsa/7WLBRzp0BhdzUj0ZG5zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjIxMTQ0MDNaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA2++/I1wAkW2jIcyxPcC4UpfJfMBAnwL8HVgMmY9zA
FARHp5XhN6+X0smY5qQ/iyeFnksyc/W4YeCh3+DwpyyOCADgT1mqUusVP90mj1zpIJ3mwwV9ASn0
hPoJxwQow9kJv+IlWEmDOzfdUpO9z64+LDUniL2lCqOhMkZKTwq8zqz1Pm/AAYblakIOAKQ5TWuH
Tnn4ytKR4lwvgfwbjV/lSB4USXzQ3N1VCBuHZXwg2jFSuHt1EcrDOV9Tb6xMKmJHo7H9daGuTLPW
NKAueW7mHr07z58rqohxrnWM67jQLoaKqM6ncVQqLaEnRks1tHHSNWvr8bxI+P6zTvOYlYua
--00000000000079aeac0660dbfea2--

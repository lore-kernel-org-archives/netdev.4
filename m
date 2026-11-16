Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838452;
	b=qyAfuPJuH2JuEdqZAstf0Rbna8SSO1DzV9Zjk5Knlpk8yt43Knk6JA+PnPFsxbgtt3ZR
	 RIFTEPVOWyDK/w9BQvrf72w7gepTISoaQMxvN4ePTCNa4iaDuwhsbReYrqRKcDpMjs6tg
	 WU/c1ePvHMqV+p2nM3B6s960mzoRdlZh3R80U3NSl6d9LCztubslV8FDzDxRavUit6lt/
	 qcsqpj6Y5sSOyWEt5MfXChLWJ+A2rgqrBy07YBw8n+ONTaKZ7UIj7CPgCf2mHkZxXMBBD
	 IpTqcGWmBEcG2NVmso69yaO2J4SUjcHEeLO6tXUJqbg9n/bf7adIvic8ki2cMcqeFiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vb4ZJkfWv6+aUtGCDcEszVkftPli53KYaMyMrkK/QeY=;
	b=hQavH0PHn5W+6wXojBF+cWynbBjZTfGDfT4c5sP8VWHagaDCK+F0uTvRIl5heZP+BhaV
	 uvj8rfSolCoVb4Tdxjs1m6M91QVl96yKKa17qlx/iUZhJVAKmPED8onSjKCF84hNGUUGF
	 6SkB/8l28LADkMdU2yrUOZ5asGV4bk12UiYpV7rrXrLQ2jO6lRImqISaCsvgCwVZ0PxuE
	 9H9f38QiKuJjQyggapzdvQFYUM1S6m3Mzk7xHEWyvkiz/4r4jOx8u2AJC5vPsqNCW0ZLN
	 jOFYojTGBtQ6P9opYKl21dNUgJbVDrC3lncgm0JhzNB8f41N8QmZPoR4MpBEhCaq1kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vG+CvywM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531A606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3531A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vG+CvywM
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cddac941ed1so1596210a12.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794838451; cv=none;
        d=google.com; s=arc-20260327;
        b=CnL5Bhi8/an1TVFiXOfMjMIjl3n68CZadqy1ws+iFWBnIe82p82rcfwFRV+o8Q/F0V
         84cJXU2p5U/u+cKubAf1rd1z/G/rEwbBMZ2uSRrPw1ssVUkMrDMYe8HbvMV74O1LvQ3t
         v2T5ELQr/dAHzBPYn2oV0TLXYIYq6XNxuqYrc5fw3HEmsQgKWPcslV36Az4jei2B3OSr
         AichrH8r/mtHpoaDHWHmUeql13yVDLYUzqkUviL32eSH8eZLDbpOOzJgGXRracIoelqg
         8d0AtmW5qTlDBRzKMU0Ky/yqNPbqOrSBTBK5JF9tnHwA8XZn8LemQe6IJM9QWMvn3jdY
         sHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vb4ZJkfWv6+aUtGCDcEszVkftPli53KYaMyMrkK/QeY=;
        fh=WseyNi1SsRTtY3yDvyHmYb+OyfmfCTiLquZZwF327VQ=;
        b=sFmosMY0R59b3B4JcVwqDuKuwx1JEm16o0ESbdbqsHNfKWNxw8Ra/XUfpZZwFw3pFq
         tmyBJMZ7xWNjDBuiq4rHUxQWC/LPJW2CAjKFszjo61EjnihnvTVbMwTKtjiz8RisXr1f
         PyXr8+Zh2jB7VgXr/FztdEz8roKPOkDWk0kmu+YmTBNfZMF74Ik2slCoeq4AMYX1P2sA
         3yAtB1D6ZVk41Q89qzGhHehynoWPBBuhAtpqo8iP8OqZYluWwArABQ7PgvhXAuwIn4QC
         d8CIVfkEBRCKkOIRdZ4kAkuaW7rfbDJwh07oR7gbgFaQ7s4Q6y/3JDvpYwvnl5Z3irgR
         OA6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838451; x=1795443251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vb4ZJkfWv6+aUtGCDcEszVkftPli53KYaMyMrkK/QeY=;
        b=vG+CvywMm1ldTXvGLhdGrQ39Y1Mc0sORNZCeR4GJ1dLmKEiARwnhn6ElkivHNtn20u
         MIxt5M8bR7Qq0pXOfhvZgdnaVIzPJxi26+/t5orEtQJWPon9vzvfQwmZHPVT6HsHgswG
         +kFK5YQE6ZXGfOos/BBLIpBAEQ1G6pydqP4r4yb4imRlq6Xw6pmghrK9qQpJTaHLU8Si
         5LBETHLbSgtbfKTFp33L/Fi6Q/43vh2ETPbSiQ96Mu2rmjYlqPWhEUvkJfi/fmMGrN94
         fDfIoVK63qyENq4WmDq3kNG/MuAU50ixMb0BmbvC0NdIKa143YZt+16zHk6b3fcjOGYu
         9N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838451; x=1795443251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vb4ZJkfWv6+aUtGCDcEszVkftPli53KYaMyMrkK/QeY=;
        b=Ae5xv72GqP+7MYUMuUEowqurhO3I2wqkTjXq10HtiQ+0Y5Zt/0d+OBoggg/jf5+jHY
         AOVTdRHTsoW9SlkhCwnGr6qpS9+mCILJ+sT6FMZFQNBuQgyijlZOdoINJg1ygQaXTS+l
         h6Fj9WrB1pFpRSGGW3sDzHeWZD1kkxe8vdJH2JbxszUOj9AlGFUCWujTRIcGP1Damgcr
         Rh6njVgy35YUZiAuw4S3SW+XyPTNlKNS4l5wMPY5aHb//ciIM23F8SZUI+s6nVOgxby/
         iGFWH6FwLV0h1s9W+3lkJUA4O40vXop1srazjoY51XyExQyxHKdcIXvHbMt9TjsIZto4
         gpjA==
X-Forwarded-Encrypted: i=1; AL+hErEiiFQcHfvhFe0eZpRF6PxQP9cZxDdhv2ZhrJljra4oDo9S9kgqrcI+PkHxiNJrrwZjcpojAY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GfOILtjEqwyVMeQY1wZxrmWQ2RkXnWdeez4IrJNJ1HnTvvvzD
	pLb2U/GygCClFFS1Vj4TWV9Iq4/2Absc8x65FJqL+DfjwF/yOMQRUFoOQSzHp1E2DCUtyZlPdOY
	1vW10lxboa18Dd0JpKi433685HrTacOs=
X-Gm-Gg: AYBFou2XdXmch4T79EC6MynGXrMhKxUnUaujNJWs44Kjdi/vpv+yJxRbybXoor8yaMK
	xHhEzIOAVI46Gq9TUaQOLKnkrh7DVQrmQ+lGU5ZmMKj332GgLrcfY8XZYR1XvZeuUDdAmWDTTCF
	hjyFrMkpputm6Y74BCj7bb8aVV0LkjU9mdnudMwiIslbP9G4VUqBAzyZQ7XfVOG41oFe/KgnSez
	UdL/As+Bst+huSco8P7DGHP4R8Y8BRKT2TKtXr/6bUAqwG6sH+RKNWihypFd1sPifBlrGCplxEj
	KWciEqzYzgBSVa4Xcyl3gFRc/AT7b9M23KcjGSkcncBIGZWC0Uh3z5s1E0GvacKzZzmRkn3y8Or
	ZjFdnUESq0GvgGh8GKnmLKHugh80ivtbQ7PgNVPHynwfki70X5Mp7GSXNSdj5souAnfCOMFCku7
	P1EPUFMmmWUC4+uvSN+NnvGs8XWbYTIWMjTUrP
X-Received: by 2002:a05:6a20:9191:b0:3e0:dc12:8908 with SMTP id
 adf61e73a8af0-3f7a8dd95damr9049521637.81.1794838451265; Mon, 16 Nov 2026
 06:14:11 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADvbK_daN6zZNPckkGh=r70ooNwTz59VViJy5jPp1w18SDPrzw@mail.gmail.com>
 <20261111082313.1606366-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20261111082313.1606366-1-bsdhenrymartin@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 16 Nov 2026 09:14:00 -0500
X-Gm-Features: AclHuK_PBS5DfVRnFcTFsg2uR9KLfQjm6-Pkb_EVvsTPuHEoQpl0gvLNWQC5tqI
Message-ID: <CADvbK_dKWmcM411yC6ZKrYtduukEL_aTp3Bw0XdkqOd5Tn=sXg@mail.gmail.com>
Subject: Re: [PATCH v2] sctp: fix skb_over_panic when adding addresses with a
 pending delete of another family
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: marcelo.leitner@gmail.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, edumazet@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 3:23=E2=80=AFAM Henry Martin <bsdhenrymartin@gmail.=
com> wrote:
>
> sctp_make_asconf_update_ip() accounts for a pending DEL_IP
> parameter by reusing the length of the address being added. The
> write-back side instead serializes the pending address itself,
> with its own address family. If the pending delete is IPv6
> (20-byte parameter) while the added addresses are IPv4 (8-byte),
> the chunk is allocated 12 bytes short and sctp_addto_chunk()
> writes past the end of the skb. E.g. on mainline (05441d697f7f):
>
>     skbuff: skb_over_panic: text:ffffffff84859c77 len:392 put:20
>         tail:0x188 end:0x180 dev:<NULL>
>     kernel BUG at net/core/skbuff.c:215!
>     CPU: 0 UID: 1000 PID: 379 Comm: poc_sctp
>     Call Trace:
>      skb_panic
>      skb_put
>      sctp_addto_chunk
>      sctp_make_asconf_update_ip
>      sctp_send_asconf_add_ip
>      sctp_setsockopt_bindx
>      __x64_sys_setsockopt
>
> Requires addip enabled on the endpoint (net.sctp.addip_enable=3D1).
>
> Account for the pending delete with its own address family, as the
> write-back side already does.
>
> This issue was discovered by Tencent CodeBuddy Security.
>
> Cc: stable@vger.kernel.org
> Fixes: 8a07eb0a50ae ("sctp: Add ASCONF operation on the single-homed host=
")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> v2: move the pending-delete accounting out of the length loop and
>     drop the del_pickup flag, which no longer guards anything.
>
>  net/sctp/sm_make_chunk.c | 16 ++++++++++------
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/net/sctp/sm_make_chunk.c b/net/sctp/sm_make_chunk.c
> index 90de272842512..b8e4db81636e2 100644
> --- a/net/sctp/sm_make_chunk.c
> +++ b/net/sctp/sm_make_chunk.c
> @@ -2870,7 +2870,6 @@ struct sctp_chunk *sctp_make_asconf_update_ip(struc=
t sctp_association *asoc,
>         int addr_param_len =3D 0;
>         union sctp_addr *addr;
>         int totallen =3D 0, i;
> -       int del_pickup =3D 0;
>         struct sctp_af *af;
>         void *addr_buf;
>
> @@ -2885,16 +2884,21 @@ struct sctp_chunk *sctp_make_asconf_update_ip(str=
uct sctp_association *asoc,
>                 totallen +=3D addr_param_len;
>
>                 addr_buf +=3D af->sockaddr_len;
> -               if (asoc->asconf_addr_del_pending && !del_pickup) {
> -                       /* reuse the parameter length from the same scope=
 one */
> -                       totallen +=3D paramlen;
> -                       totallen +=3D addr_param_len;
> -                       del_pickup =3D 1;
> -
> -                       pr_debug("%s: picked same-scope del_pending addr,=
 "
> -                                "totallen for all addresses is %d\n",
> -                                __func__, totallen);
> -               }
> +       }
> +
> +       if (asoc->asconf_addr_del_pending) {
> +               /* The DEL_IP parameter is serialized from the pending ad=
dress
> +                * itself below; account for its own address family, whic=
h may
> +                * differ from the added ones.
> +                */
> +               addr =3D asoc->asconf_addr_del_pending;
> +               af =3D sctp_get_af_specific(addr->v4.sin_family);
> +               totallen +=3D paramlen;
> +               totallen +=3D af->to_addr_param(addr, &addr_param);
> +
> +               pr_debug("%s: picked del_pending addr, "
> +                        "totallen for all addresses is %d\n",
> +                        __func__, totallen);
>         }
>
>         /* Create an asconf chunk with the required length. */
> @@ -2917,7 +2921,7 @@ struct sctp_chunk *sctp_make_asconf_update_ip(struc=
t sctp_association *asoc,
>
>                 addr_buf +=3D af->sockaddr_len;
>         }
> -       if (flags =3D=3D SCTP_PARAM_ADD_IP && del_pickup) {
> +       if (flags =3D=3D SCTP_PARAM_ADD_IP && asoc->asconf_addr_del_pendi=
ng) {
>                 addr =3D asoc->asconf_addr_del_pending;
>                 af =3D sctp_get_af_specific(addr->v4.sin_family);
>                 addr_param_len =3D af->to_addr_param(addr, &addr_param);

Acked-by: Xin Long <lucien.xin@gmail.com>

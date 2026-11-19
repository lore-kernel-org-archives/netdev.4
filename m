Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126486;
	b=E1XaDV5zxOKnTw06cwqeVV+rYpZZxZYb8ihFo1QSDntn/CaSb9QF3B0gRj7VWvtIADeP
	 GWMwYOe3mEycJOQRu7+d97tS2c5nPq0WVBOXP0dcoVA9iT6aoITgP9+kpik3+wfrJOQIi
	 M5JLaA1O0PjjfWoTXk5mET40xb658nqABIJLLRZrf8ag9lzcaM+zAAv5zB0+g/486j8pL
	 ZTJuZ/7Q6Upz6k042n4z+s+7J9NbdSXrlsJynVodsr20LvaqO8B3pezH2mlfaYFxYYaLc
	 OJ4Vd5CNc1v8XZFfR0jI6zsBXUvhOsspGgmPNED/HO1mESK5LpKu5iYcrQCGoQqdhtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5quLvdk775X0CDOngoeqmA0qWzTp4nCO/5ykmUMU3f0=;
	b=kJmI/f1kA9ITFEOYc1L6TZYXx2bRlXCQ7vo0qjvgU7k6E0QbuAE1SCNKkJA4FngtzpRS
	 8e1O4PZooTLHs94P7ZC09z5RrQh/KCkF7ZZGba6HiZKd9vzYkvNek+QIuwL143OtmLWlV
	 GUj+/VyezpzfQMoe5E5NJUTWtl5NxzZZdnsFCD/v7YqRRHu0WTqOsA+1c17moOxjeLP40
	 s8Kpe55WGkXmHR8glguB4wnuYGO1AswIA54BfBYsf2c3KpqZ7ME2E+ibOgdDzt0vXa27X
	 IS1KRnur7cnWKvUbmpF1VZu10pAZyFtZ5cqS612KRweXeNPCUZt2kBiGz3ynkNSEXpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Njzv5Dw3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF7C606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF7C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Njzv5Dw3
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efc4a84e75so6465ad.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795126486; cv=none;
        d=google.com; s=arc-20260327;
        b=UiS1e2wJm5o005oli9z1sVFDRW5sifLpRxM9WMs/rBGx9RFZ3sQn/UW7k+8fHPeSy6
         9eQhcPa5Ycr5utX5cBlRAmL6Ls20dig/t9Lra40322qgKm1c0Gj6vw1XRRISHALRk0wr
         KwOCJphJu2W+PblA7KCQOHJ8EPsxcuq+RH9hLqxPsNTqXFhiC/7Z34IEouNcggKaIj1K
         vnjL4q/IZevZjQGIeL8irurDpvTLn8VCMDPlZItZd85KZTdp0R59DK4cyc0QLpOJIKLd
         p0qnFDcYomyh0nPKREGfUt+1NU9ZlliYu9biAq9ZCMDmPvmEnWZRZxeJSgLzoaAi9Ffu
         kjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5quLvdk775X0CDOngoeqmA0qWzTp4nCO/5ykmUMU3f0=;
        fh=vCTOhpdVwe1oIzVBqzWtb88IRKEsrvwmilY7ftYkEsc=;
        b=QCW/6PT2KnWZ5lvvpHonPPQGlC759gXKNHqBJDuy529lJngHUaPQMzoLkRKcJdmN2g
         yIEz7dIVfnErJjyd9U4E+qKb1rfKJwuNOfJdt77OvaKmrkpGc9qlxtINo7pmi6Hxlf54
         NWrHPzlv6MJ6tHrnIOjidH4Zfph3fFfko3D0ephXAoWbQF0LgzqHSrEdGKjJzYW5HJrs
         yHPGUNBAZ/fS0SHWrG4N0vM1z6uC6lOR5DAZsBpi4OykBJSLn6vNMQGtZPCPB/eJhP7/
         hj5rjCHh9ACzzqdQq2aTuk8epW2MywM6VVbxIqC0nL2+Eylx7130nGgebTbBeRQBFJy/
         1ozA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795126486; x=1795731286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5quLvdk775X0CDOngoeqmA0qWzTp4nCO/5ykmUMU3f0=;
        b=Njzv5Dw3Z+mntNouomiyw2TjPleQN7sR9egv9Pehd8U4JRFFoC/ouYv0Lm5+iUxsZ+
         kQSdLLNtxVZNorr4fFx7zhU+lTf8k+w5pYeJj7kgUHefPDi4qRP2XbUf/a/t8usPWfQL
         gk3jI3ml+ZliZLG7/wEz4RR2yvQuBceOmKoy1GDEjcoY6bD0XW2fIOJGSr3zWVT6E6h2
         CI4kP6sGSdIZQcf+lm09BgilzDcwOABetqwaGzudqCOeYH7/a/fLzgsoU/SyRelCtkdt
         7xZJcdtLTRxJSbuux+IDStuurIeNmQNAnPePUhxJ5tMtsf37MKi2MnV62GhU37GgZu+2
         BU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126486; x=1795731286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5quLvdk775X0CDOngoeqmA0qWzTp4nCO/5ykmUMU3f0=;
        b=DnkNHoV+R996bvb+k6g+Cwdr6K/OjEIvjOQR9mTCMpkvW6N0/zplCYJ/bTqP8UQ1IW
         rLN1JRCKDtCoVIJlDKksdjw/6hOJ1QbsoZe3lfS2SP0AlsOqOD+gd1Fed/+zgGvZDXIA
         mSRQSwcmgjUu/DSjS9Li4EtYyPlSrStRnanmmbTfYXW2NWMqK0HK+1nClfOfKJFGPRPf
         /KMxV6P/j5ofMWv7JYwjx7byIqMvr2wESDHHQ4ccTDyqidE1jgx90VIsQ2w2fymLKA7+
         SvqJlHuAKc+yln5xQH/7MBrEpS/m6mFrTQJyqOr7cY9z79i08r+G1buqMy4r7EPkdxa3
         hbcg==
X-Forwarded-Encrypted: i=1; AL+hErE33fifFMG+KAyyvmJhMHlczNtHO5R7gM07w4UtFBz+Cu+Sq0mdIWvKu3Ze6mOU9+aNM89IfzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z99R8ipRme8JwnmCpBWWB4TYHap5tekYZR5v/9R4D2fzAfM9Zzm
	SgtRZLRhvhw7Hb/T9CfR4pGXzacBj4uY+1ywOOzaM9OmoXnsw5g6Cs3u0U1ytTjyIaVQSnk2lx3
	UoQKDUMY/USlvpYvz9jfnQOjgVnboYegyb08KUyTr
X-Gm-Gg: AZFdTZeSoyKri4pTmQyuyNqnE5wUrJshhdoRrPzGDa5/6jpXwdpAX9JWeGX1hHIYJnO
	K6AxLy3rq1FYvlK4la3lA/ArwlHAOX+plCuW9YGMHm1PAi/L82WGR+NyKwSAnopLO+43N0bEqLQ
	6Rusl34QeoegsL4JZ0AZCVdB3PPTszNoB5OIwA+gg0gyu4AFimyjk5C6yoOvdB782V9dMUlbglq
	sgF8fFhyapNXxbI8q64Lo7niKuXN34zqHLTm+DluIyBF0nB6X24GH4vRfpBJCNN5IQHUQJVqHck
	ISo82HBl7O5Vtgbdvj45MeAzvBxw7hSCK88NZNdetgppAhNMj3Yi2NR7SVe+U/QdjT8SJW7lK3s
	jrd2Eon3W3HgneXm/87PEB6vCd+9ZymwNM7qgQBt/xBu5JnT8pA2LoDrwmC0jWysAWvXKXlAotq
	mNTkan+TSCLVFhknZTEIiOPEmjV5xQEQGHhOKX+4DvUMozVzliByKh8TInXg==
X-Received: by 2002:a17:902:f708:b0:2e6:d25:d874 with SMTP id
 d9443c01a7336-2f0439d84a8mr679585ad.10.1795126485206; Thu, 19 Nov 2026
 14:14:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118232315.3593731-1-kuba@kernel.org> <20261118232315.3593731-9-kuba@kernel.org>
In-Reply-To: <20261118232315.3593731-9-kuba@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 19 Nov 2026 14:14:33 -0800
X-Gm-Features: AclHuK9pJKt4rtset9qfU1mxMlcT4dQR2Nkvj5gYRiUEQFrzr0nja1ocDKAzpzU
Message-ID: <CAEAWyHdaAdvLHU5ivRSHmfoh9Lm+eNnwOYrLmkyv4ogFnqVdtQ@mail.gmail.com>
Subject: Re: [PATCH net-next 8/8] eth: gve: drop the now-dead HW-GRO vs XDP interlock
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	michael.chan@broadcom.com, manishc@marvell.com, joshwash@google.com, 
	tariqt@nvidia.com, saeedm@nvidia.com, daniel@iogearbox.net, hawk@kernel.org, 
	sdf@fomichev.me, willemb@google.com, przemyslaw.kitszel@intel.com, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:24=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> The core clears NETIF_F_GRO_HW before ndo_bpf runs and refuses to turn
> it back on while a program is attached, so neither of these can fire
> any more. That holds for a program an upper device pushes down as well,
> which is why this comes last - gve_verify_xdp_configuration() was the
> only thing standing between a bonded gve port and XDP running with RSC
> still on.
>
> The user visible behavior changes as intended: attaching XDP to a gve
> device with HW-GRO on used to fail with -EOPNOTSUPP and now succeeds
> with HW-GRO turned off, which is what bnxt and qede have always done.
> The header-data split refusal right below keys off
> priv->header_split_enabled and stays.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

Thanks!

> ---
>  drivers/net/ethernet/google/gve/gve_main.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/eth=
ernet/google/gve/gve_main.c
> index 0ee69bc11d83..8b65b8119662 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -1798,12 +1798,6 @@ static int gve_verify_xdp_configuration(struct net=
_device *dev,
>         struct gve_priv *priv =3D netdev_priv(dev);
>         u16 max_xdp_mtu;
>
> -       if (dev->features & NETIF_F_GRO_HW) {
> -               NL_SET_ERR_MSG_MOD(extack,
> -                                  "XDP is not supported when HW-GRO is o=
n.");
> -               return -EOPNOTSUPP;
> -       }
> -
>         if (priv->header_split_enabled) {
>                 NL_SET_ERR_MSG_MOD(extack,
>                                    "XDP is not supported when header-data=
 split is enabled.");
> @@ -2212,12 +2206,6 @@ static int gve_set_features(struct net_device *net=
dev,
>         if ((netdev->features & NETIF_F_GRO_HW) !=3D
>             (features & NETIF_F_GRO_HW)) {
>                 netdev->features ^=3D NETIF_F_GRO_HW;
> -               if (priv->xdp_prog && (netdev->features & NETIF_F_GRO_HW)=
) {
> -                       netdev_warn(netdev,
> -                                   "HW-GRO is not supported when XDP is =
on.");
> -                       err =3D -EOPNOTSUPP;
> -                       goto revert_features;
> -               }
>                 if (netif_running(netdev)) {
>                         err =3D gve_adjust_config(priv, &tx_alloc_cfg, &r=
x_alloc_cfg);
>                         if (err)
> --
> 2.56.1
>

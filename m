Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795045485;
	b=IoC6/t6uIfJ/oFmFgsSN/jz5n5FrkWB59chMhelkKeCgs/2Uv+qb3dLaE098sgkwGMrW
	 tt2tJzSG2mlZQHEeImvcywCmjKRcvP4iIYSW6JduC1KKpONzwcRs/KLiUzr3lOe7yoE+N
	 iHHPHcZKuDO7aieAh00P+/jFIrh58sG5HHnvHDFr/9bXkMnKHeibfvSVnbkmGFeEdSh7M
	 /4sEFcelJrU7SWrQbydMwQNpcnmTk6+lm9CM0RCM3DYZXto1dKPsvhCGOB4fltyJFpNbw
	 zWVS4OATfwMcS6YZ6nuFNZfSbhsI991cDk/6ygQG9DZIL166dZ3wl3VxnuMHhYjP8DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SGp5rjwYDX23uopvAqENY3jXGmkT0rNpBZ6WTxZ+Jjs=;
	b=IzwmgppeSAU+GMWc0u/C9jkiJBzxt7iHXXrVwlJL/3Mlto7n1SfojUuGTYrU14dKG2N4
	 arqin/CdM5QHrQbhhkfUisfIPLG0teKdcs0jNRcMJr268FD/5vpPJ2JkfLd9jWVK50Ij/
	 O6P/7UeRKrh6yao2Ht4mV0Xqf7eT+yK6LjZR9fleA1cY5Tj9PVFNjWYNJ6grTYwAcoeT3
	 M14u1GIesOwAoTjs5DNFbsUWCdlnLrDZIje3X8hC1h7umWZmQFQVWLLad/fEdyfxb1j9C
	 O3/BlCg4CAqcyveXcatpwEKZQLcsXEyhamaB4CZw1y6qNQVQWpSG8Swz2h85efceo7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JK0PcKYS;
	arc=fail smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D7606A32F
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596D7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JK0PcKYS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so256440766b.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045484; cv=none;
        d=google.com; s=arc-20260327;
        b=KePZwfwUHIuDEuZopcEPaBA159F2aTbnlkCi2IzG3EWiKaIJ4fiu4CtfrYPtLv/uvm
         Ylk7u9xJq9KarxqduGxSIYu7MkJtKUdLWU+oIHTs+EOuoyn3LbLUZlaDSw/G2QRtXGtm
         bZWL7tkF3p89oTMDO6X6X+T6iOL1YSKNFIRRrpzpuvcO+SoNVT0e3jmaAxZhklheWRNb
         FYY+pQP3Ym2+novRwOWOilJlf9iEJnrJhwsACasIU3oKTxyApA0ew7+H/fq7YfTfJUNF
         JeEsuvVMJp+nPByXDbwAOElLV+1Cp4c1DxrGJK/B6NuvqwY4MDdh5s8KZVKgBVPQVPi5
         VfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGp5rjwYDX23uopvAqENY3jXGmkT0rNpBZ6WTxZ+Jjs=;
        fh=gHBlKWtGn5xqO1KJ77+zCvTMvbgW2CT+5e1uWu0bA70=;
        b=lxLCUTOX3fcLl1OvOtUz0k8BQd9KrVb3iYnAmaZSJqGKJ3FWa6H1AdegWA2X95Kp9m
         CQ7wfRbF6vZyAMWyLNc85V4PC22H17tlogdDYYx98oXplMIeRDw9oNk+DW1HxwTp7zrI
         r9Cq2TPJlBHWRUB/J/l92SGttffLAtH1cPhmwiegpET4dnE9YpdYN9Uoi2yPNOUxoGag
         I9ZAV432xDKmIv5TVS3JZjLGnP61AtMHehxKWmvNkck0Fq+ZqzlWw2+dP6Wo2eBTP15E
         VAtlvzUiMQjMUv/A4vqEGlCVSkjsL/0iwKIJygU1A2mmjuQFDTABbj/sctGjaHgjE6DQ
         qWsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795045484; x=1795650284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGp5rjwYDX23uopvAqENY3jXGmkT0rNpBZ6WTxZ+Jjs=;
        b=JK0PcKYSHAKO+qQC/+4aNiD5nhfc763XwiPqerouNhTrKGusr/SBUtuJKcUvx2DuL6
         rOxM64cUl3V1XtkfN2bkMSRDdw8aTTfkSzcaFxK4njXz8QvtzkVhKIyVM8hiLLzFpL5B
         ATy8/PN0PgdonBHEgE51nsBudv/OwEzdH/nLG3G8PTB66MZBmAUdfXQsefwucT1w4XHq
         8BOClWx6pilsAlcc3+gW4mAu0Qkq6/auy/68Xw4fRgNf5BOXjGFOrxWQpXCgEIHezUTZ
         nifWbVLau63PAI+MhmIum9hksaj1FZtJnhVSURt12czUuD0F+u/emt/rDw0J9smgS6Vq
         rMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045484; x=1795650284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGp5rjwYDX23uopvAqENY3jXGmkT0rNpBZ6WTxZ+Jjs=;
        b=JcACIYDnV7UtAuZwplVwq46T/xqX4WCZp8TzUWZ3QZEdX7UgyKki0IE3ZIf7eNGQb0
         feHuZhXxYX3M9/oX7ZCin9rgsfJ/VrY+aFr0MDWyqvmrgpXeAjs9YoSCdhkVPvlPY/pJ
         yGdq7SqwDlWuRFHNWbqTOkHfeOcOyhpmco0zks+O4t0SzKEyKwnK6jwVLcMgzKDR5Wqv
         26T243v8jYRmew6UxyLIolu9mOxX9LoToRhMUkxx7ENFLiXXq09OwNMLmDewOjof/G8G
         LBuOdpq+V5Ha2gvridhS29wJz0Ly4fpo1WMU9uotl6Rvb80w6A8H2hcttZj4GRQXD2SF
         QMFg==
X-Forwarded-Encrypted: i=1; AL+hErGfC1TS/uHTvM5d5EXmWvtjLeJQ//uulP+GwrYpTxq7U4uRadWWssrbnqrzy0GDXT8iIt55GLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ymcrJ/E5vJqe51IiJ7EpNAQ7q5kP+x7+J2pkf8emOBoFoUdO1
	VhJDxJIrC8yOC4kMsouOfxnRZcSGk7NpGw5ssQWjgAhfQfoG8Ah1TW/eIFHu955Yd1HDhFQZaJ4
	s633RgEB5rTFP/EiROfUyH7fGBFqdcMtLmLxjBgfjNWNl0l+g1GT3S+3EoFo=
X-Gm-Gg: AYBFou1J1uFRnt42xIkogk27t4wEycb/J4cGf562h1sYnfAJ6hDZhdYrP+TzWG3rdmw
	zYjzu+jCGbuBmahB2GhbePzV2J910hckoFDWAla9wMIK7S1avd7rTwAg1oUlsLyFxCzxsd3PZ2s
	1tFx2+Hl2QLSWwTAhwGkEFTyjgXq4mmA8Yi9ktNLFs0D/hkKBSMZgX+lqeQ3hFMxU5r65vgKD3A
	dB9qsD0NHXmDHKvdli2nTD6b+W/rTt2GmJ2+onvSNK2UPSKxatirQv+V8wW0PS9MPzk1Qs+Ju/E
	3UvDnRvcoOghqZQu00/x62xgbl+ySjCQCT6dl7MsiqwUL1MJzcyjjzKic6wMU+TQFapsWSzqfK5
	+o//apmkcnvqDYbg7RE3MR18++1p/W4jwrTjtLRjUVGKQYyp1k8vOq5Vtx2htYI1ZitNGLQ==
X-Received: by 2002:a17:907:96a1:b0:c44:3006:5c3 with SMTP id
 a640c23a62f3a-c510e363cf5mr385102766b.28.1795045483213; Wed, 18 Nov 2026
 15:44:43 -0800 (PST)
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
From: Ankit Garg <nktgrg@google.com>
Date: Wed, 18 Nov 2026 15:44:31 -0800
X-Gm-Features: AclHuK8KCUSFfMVAJ2SP6DGMcg4kE8fDBiDjsO5JzsBpy68f71zpFA4ycktbcqY
Message-ID: <CAJcM6BHQtbUT+QGhKgJeWcvhWqUsmHK8yY0ZXJ=kHunF2LKOrA@mail.gmail.com>
Subject: Re: [PATCH net-next 8/8] eth: gve: drop the now-dead HW-GRO vs XDP interlock
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	michael.chan@broadcom.com, manishc@marvell.com, joshwash@google.com, 
	hramamurthy@google.com, tariqt@nvidia.com, saeedm@nvidia.com, 
	daniel@iogearbox.net, hawk@kernel.org, sdf@fomichev.me, willemb@google.com, 
	przemyslaw.kitszel@intel.com, bpf@vger.kernel.org
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

Reviewed-by: Ankit Garg <nktgrg@google.com>


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
>

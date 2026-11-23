Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442869;
	b=eu6g3r3E/kIcChX2eBLy9cRWbHto0vXVNHc6vhenRVFPM++mPalblP+qAUhucqCO4RRi
	 H4G/xyHECy67DPkyQjSE1aShSGwNEixLqJP1cDPmoNNSFjrtLAxwC5FTQZs7V/GjW51Gf
	 ROnjtD77MWsTpdfg/DJYYHh7tUpA/sGGgz7T/H5HsQmoaTS5GuMAdtYY2LVYzDORbAhW+
	 WQfrvdElJjsMWYByjt970f1TjaUMvsW6VK41LplZXS+DPKkZFs6wTAicC3lIm3Pb3YGI2
	 8pINjLhbWCHqgDtvclVBkZc2KPPPXft+sy7whq+XmYJRol3dcVs2M9sj7tyuMDQFQOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T7GzsM1fM5csZ7LhdpWY4BYMZVarBLjJGxAmOC3EEqY=;
	b=yXShCXXNNRkeytFQDSKPgpEjDpdiu+PyRk+mnUX7Q9/csNUi2yPPT4eNVsfkrpD2Ggfr
	 15NcSPv/3s6+VWqH1SSA7/SNGP3nM+YCTxP5HjiwstknJpFE/pDhJBygim/UtAY+FcYIK
	 Uato7a3mTAnGJc7AqM3mb14agB+aY7M0iWrvrp8blljCJO039ltMEo0Ist0LBThZWPVkG
	 /AHBdt5F1Gt0Kh6JwbCYDVMmTOCQRoovbpF7XOx+njNNL9X/FoSr//LFLx7xAKcTxMu5k
	 OzHcuC4DexlYAKhXEIHVzpC8X3C6vhvpr2KzGvqDHqByEDKe16FUGtfQusN/aG+oSnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jod+9PCK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641BA606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jod+9PCK
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1289830a12.3
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795442869; cv=none;
        d=google.com; s=arc-20260327;
        b=EJJfyKzkvmybyYG2JY6S5vNNnfoqogxG5uG+K0r147YFYXtztfEsJAaDaeAFUoqtz5
         VBN33wYnyfBAisBHB3QYrBuFpRMosDXrPb3d07QV4kK3OsqsKuXEYqGrDGFEeuefT+fF
         5ZPGVdtd3KhEZr7MOh5rtU3zNplsapmbbyI9EDUIH2r8hj+/Ol2M8ZHE9Y6eMa9kTT1s
         Wov2o63u3wT8mVqPoUKa2doKF5pPSzLxaiyICjBGVVRXn67xr0at2XO8YlCQxSuzv0Ny
         pJHTo/JhVvLjQBEqtBKsG2ekunLpBXwv13YxPBJZbiRQpcyCA7ngHPA1yXNmFJ/seAOz
         1+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T7GzsM1fM5csZ7LhdpWY4BYMZVarBLjJGxAmOC3EEqY=;
        fh=lQLcNQTtrdT+KvqC8/oCkHxFurFElVKad3PpNlMi4Gg=;
        b=HF6jKEmV7Udiwp4RH3m30+l4ASIpYwIVt+zRSiorSmjMcNZ4Dgl0OnzL2u9ALGolMO
         O4bK216sAyE1nB/vw4ZFSsmiMIQ7GBeYOF8q5YH9SncvU+S09Pi+8D9rtCy4OZ0QYucj
         Ji1i6FHx5X7UF7/yv+bsB1kElWokb14/FAScUSFkzy3AviDSg53mwqNR6ia9flVcXmvt
         eQjxVda5p2Xg+dq889DfkTJmcgXrXQJEDwylvHpeCgID4AB13J3w/dYRwijBj/qOQDw4
         ZWR50nknlDXpFkxQu8IIR5/oWIkfRYrp6A5SLtuOX+/FGNXvu0PMCb/BtoAPhr0Q1DTy
         ilTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442869; x=1796047669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T7GzsM1fM5csZ7LhdpWY4BYMZVarBLjJGxAmOC3EEqY=;
        b=jod+9PCKbnmQM9PgL8vHmknVt0S1H3yUpKJ5VG+PIyOrIxWQlsPWiCt9FkZ1mc1J+k
         EsyOC4b90bg/eVdQRag0K4sYqV3jTVVOrPdP3dVQVTUVyNCYJVmZZH6ghpOeNjupbIXa
         juNMlVD+fQSsZsxA1h7ozoHf6crWCEh590mqXRgDHSjVuLYbPWv9uOnKKaVoXvGJU7D7
         kreRynkiSo6eW3bJDkFCxCxy8HFzjd40N1NvBFtcsv/OsOiuPHEJHh+QQ9OP/4HunUtq
         Vu9jDTnGDAsOsUrfZmdmUccDcEJgWvpFhVbxgRPHf2f3IFKpT16bOTwYwjrRQ28sEd1H
         31Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442869; x=1796047669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7GzsM1fM5csZ7LhdpWY4BYMZVarBLjJGxAmOC3EEqY=;
        b=v8MQ0Uv2IFzDv6sqX5nANJ6iz7dqttjDifg0yp/r5zezl/hZkb6AslwLvor1k7WlEH
         DM017HfP7181qcnmYpoFBMeSfsghP+JQXi6Cw2nZ0Z/dnxHzpXB1H7dlE3dbikuZV2b+
         fgoVvCGPwZDRl51F3faNuHHedkojLRPrr9ZXgYy5k+DuGMuMYlIUP/G1XEz5arcxlmSB
         aJVsdp57WjAyFKZBJDaiOprjT6CFSHFw3Jgm8Qw2MmzBzHj5iD97/ZYTg2GEXTg3A52M
         R9pfJYbjz8aM9Nv7pZz4SvyR6KYvX85SMC/4cbUWpzrr6QYk8+yjujCYxreGHQG3uamR
         7UTg==
X-Forwarded-Encrypted: i=1; AL+hErFYSAcA7USBvCx5N661gSTJfTjx9bftAjECNIOxaWdm/lJ1k5oNIbyFE2Awi0OPwcIs5vS4/uY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ssKf3nfzX9KtseMH3kppfi6DrPeuAKkK9vIOT0q/nfn03xhDQ
	+Wdg5YFSzjtFyoEyRvvNlUKDEo8bhkivNK0pTjX2P80/nsGtlba1bnCIFQ6G4lb1UzEy2/xA4KT
	L0Fu8gXAUV0qImz8VeTixSiA6SBBJB4g=
X-Gm-Gg: AZFdTZcFgmzPOVY7OEZ/RPBQuvTQzFFfFTIeIsqGNAkogq/ZpWhhJDKYkQRz98ryY9U
	npwGIYaLKYi/TBok9tadCyxJOk7MwLSEUaAuxwn++XOFj/58TjJs41UtgnZEWgTxKDTWUCywaFR
	+bbrM1vxv7QeaVZycI805xCwtY6E0jY1d8i09C2yMzWD4298jsaxmFSKVvp7XecVzMR6fdr1Zt0
	aU0CzujVN3dhQojo6/+RRGiVKtaCtqDyzytHE7j8piZLbrgfbHGyeG0p0M16pwyxg7ZXV3syZUf
	hHHC2e3v2oviH66A+rOmlUfmBDR6SWm7gTEN+rItP08kCH47bvS0XFlskVAhW/LXPJwu0Bhn+Ji
	3QM3EJLApbAta5TkWvdZPzvITnOIHETt2ByYsXcg=
X-Received: by 2002:a17:90b:2d8a:b0:3ab:189b:6981 with SMTP id
 98e67ed59e1d1-3b41c953639mr10087547a91.48.1795442868710; Mon, 23 Nov 2026
 06:07:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
 <20261119165340.1071525-2-magnus.karlsson@intel.com> <877bi321yw.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877bi321yw.fsf@all.your.base.are.belong.to.us>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Mon, 23 Nov 2026 15:07:33 +0100
X-Gm-Features: Aa3M54oRlXnhzrgId3cP_lq2shH_unrS2otI5Gm4pK5Y2aM2Ibdh8yvJZTICByk
Message-ID: <CAJ8uoz2zy+aFC5=vR14FBz_q6KAztSEby2hNVFrBYeeSeWAw8g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] xsk: add USO support for skb path
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org, 
	maciej.fijalkowski@intel.com, sdf@fomichev.me, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	kerneljasonxing@gmail.com, intel-wired-lan@lists.osuosl.org, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	jacob.e.keller@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 at 12:59, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wrot=
e:
>
> Magnus Karlsson <magnus.karlsson@intel.com> writes:
>
> > diff --git a/net/xdp/Makefile b/net/xdp/Makefile
> > index 30cdc4315f42..b6109e0e5547 100644
> > --- a/net/xdp/Makefile
> > +++ b/net/xdp/Makefile
> > @@ -986,12 +990,62 @@ static void xsk_drop_skb(struct sk_buff *skb)
> >       xs->skb =3D NULL;
> >  }
> >
> > +static int xsk_skb_uso(struct sk_buff *skb)
> > +{
> > +     struct xsk_tx_uso_info uso =3D {
> > +             .metadata.request =3D {
> > +                     .gso_size =3D skb_shinfo(skb)->gso_size,
> > +                     .csum_start =3D skb_transport_offset(skb),
> > +                     .network_offset =3D skb_network_offset(skb),
> > +             },
> > +             .header_len =3D skb_transport_offset(skb) + sizeof(struct=
 udphdr),
> > +             .len =3D skb->len,
> > +     };
> > +     int depth, err;
> > +
> > +     /* Best effort: a bond or team device can change type while the p=
ool
> > +      * is bound, also after this check.
> > +      */
>
> What would be the effect of that? Would it make sense to be more
> restrictive?

If a bonded device changed the type to non-Ethernet, there would be a
short window in which packets would be dropped and or sent out
garbled. After that, they would be correctly counted as
tx_invalid_descs. So I think it is ok to not be more restrictive since
this should be a rare operation while you are having traffic running
with an xsk socket.

> > @@ -999,18 +1053,43 @@ static int xsk_skb_metadata(struct sk_buff *skb,=
 void *buffer,
> >
> >       meta =3D buffer - pool->tx_metadata_len;
> >       if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
> > -             return -EINVAL;
> > +             goto err;
> > +
> > +     if (flags & XDP_TXMD_FLAGS_USO) {
> > +             u16 nhoff =3D READ_ONCE(meta->request.network_offset);
> > +             u16 offset =3D READ_ONCE(meta->request.csum_offset);
> > +             u16 thoff =3D READ_ONCE(meta->request.csum_start);
> > +             u16 size =3D READ_ONCE(meta->request.gso_size);
>
> Instead of all these READ_ONCE, maybe snapshot (as in patch 3) here as
> well?

Will do.

> > @@ -1021,6 +1100,9 @@ static int xsk_skb_metadata(struct sk_buff *skb, =
void *buffer,
> >       xsk_tx_metadata_to_compl(meta, &skb_shinfo(skb)->xsk_meta);
> >
> >       return 0;
> > +
> > +err:
> > +     return flags & XDP_TXMD_FLAGS_USO ? -EOVERFLOW : err;
>
> Seems error prone? Better to set the proper error further up, or am I
> missing something?

You are not missing anything. I can move it up earlier with some restructur=
ing.

>
> Bj=C3=B6rn

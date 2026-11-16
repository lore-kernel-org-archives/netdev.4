Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794856816;
	b=i683H06H3QPHYaR+iOJdbP+QnnyplS1kQAdLC1Y93O9+CIf8M2fy/exmki8aI95K4SYL
	 lHV25Kb4VaNx2hh+YXfFSnU0ccVjvLqwJ97ciNv4e0Jz2Sm1l5ktJDNrW2+injnSNeosu
	 JdgQ8OImCwVW5paE65oFg/1ygRDJj8H8xkd7bpkptoyU7XrL2T/YbqUtbFd0tR7fZtPOn
	 URhfQblyQHGolUpzOmPjeDQ5+Q/gK3hTncsHBP3Zz6JYhelvaBhNWwHoWFLK+xnoQtovJ
	 cE4i9X+wxIZjtVQvx2yLfy/rpnQXEPJVFU8Rnq6yTSOrfzqlj6F4OL1EhyTN2Ae65AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mCe6Bp3SM314rnTJTs464tCuYj4/L9FqVj7duj6GVqA=;
	b=h5Sej2GSkWFppM0CSqYXFf1jS+nngBz3a5l3a7VSirq6r0euC75xc/Hf0AdcnbYTCPWh
	 jlNIqDs4SG9zDsZHzQ/AvBaQB1dQkwjdqTpuwHmcpZ/ZRWG6QuDfLy1zLmRPjz9VdA3NK
	 6Bn/J1kR6qKZTWIDpeukIzpAzK7zj84vqTkYK1zEgzPDNZdZnN0/sTtQzIJh8hFPGT0vs
	 /78orbLcxCw/wffd/4Jy+FZcSba+OPdpw3VMhY6hGAEAa1l49pD/IzFjfVI1AuS+4DyCr
	 Nvh5p5pRpPtmPaNP05iKtwkhyPILlGj7Cpfzk+ajz4EOsF1mwk43yJeBTW14+xOHFmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeY7gzSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DDD606A322
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 19:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27DDD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeY7gzSS
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so4032870b3a.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 11:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794856814; cv=none;
        d=google.com; s=arc-20260327;
        b=ODjlEWARpcLmJ9pECGtw5L73IArlhfabItaE04D931GIPcp/a2yPUNyzuln0IZJ8Z9
         zUFJAj2vug+82bGthrgyCCJFWFVPLGflaVhCGBiagmGw5eQiyFNi66SoFthZV3dAGw+E
         gme9zMYLnk4jCnfWj4aGvHum10bgtFEbh/bNa62a/FXdCrySQw6B8T6BrLjrJkRj8SvZ
         v4ZrhWPSsLvuVAahI6jrOiVa7zCNLuUFjy9yaHCoxLfNxdccdyjHQWtmPUsG0kl2A4pR
         iAQhMVNSy7ZWU75V48u+5AV0ekMwKb47h+fi5K0NGgdQ1nQ9u1I9FrccTHn1udmGN2CT
         mCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mCe6Bp3SM314rnTJTs464tCuYj4/L9FqVj7duj6GVqA=;
        fh=G6F0VWxSNOYeUK2Cvo4nzYG+YpAI9rXg8wYDsHVSTOI=;
        b=GAUHZyNOMC+3/XPA8NNuo5vLrZzhnFR7r7Xnn56V2rZIfjZ+08ChpJoNQyWugfLaod
         YXpembq7Ph5wYHswCgEHJqPKxQdmHO+8zp6EegJXQZZ14r+c981kYyXgmb8JWUs6xzDc
         mtP7D+f5n4+x587wQ7FxjD6A9ouBKBLlW0Gipj7UOnCCXXUtqyunPcOvdXvU4FGMRZM4
         /332qtyp9n0yjYvjqu5dqzzEloD8WxHQBLv85TOJpunn+dDJrUyHMyINXNsM8nDEnpaQ
         CWSi/u5bWzl9vyWJJkxlFzt1qWgpgM3nstXtp5iwPdGaOGEo5Q+uelVb+OYLEliegTFq
         0O/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794856814; x=1795461614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCe6Bp3SM314rnTJTs464tCuYj4/L9FqVj7duj6GVqA=;
        b=xeY7gzSSCEuVOvYjp/AC0uzzuAsYcrN6pxNfPByiT8ldwrZXRQxmFBpfDD4bhGWg01
         R4MoRCPnqnGB9JYIdLEL75YMl24QQ+etoZWZowzk9hWlZLhGqFAj2Ww/Jm71h6Vv7Rat
         kzmyKrVRwXigpWyOLSEOQKYXEG5Km8Xd8qjHGPcEbO7aO8s3QMlsQDLDWRAoVCOo9kwR
         ixPbjHWMDTY6qyVJpjdQM90un/qV9ouTiSXVT+y2OK85A5vJLivMpXS5piKQEGkBoS6c
         9xYwyQH4ZbhU4IXPg3VU2CjjYeysClKYyVA26NO6WObtbI56PCRk34P4FFyeNcke5+Ch
         yw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794856814; x=1795461614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCe6Bp3SM314rnTJTs464tCuYj4/L9FqVj7duj6GVqA=;
        b=bCSJXrkxNMtfkVx0J4LhiY/IevMG+fClW/5cJpyaLwrC+PvsvMSjv025z8tKesilZI
         xzPXIydCOnIa1MFOsd4JQo7I2ungyHFj4oXjStGhKeVgyO7lJJKZ2UOxPl/CoZabYfJb
         NXEUnBnvJxwAFXrha3Ya0QJbSQAcu8OpcnrVtFD1hKRZEhUUS0fIzEBRO8vavHVqUDOz
         ycVyDjpF66iOh9FYWjPt54stZRkYO15DMqZD7NQ2Op56itssXiP7Lu1e8A/asNg5FdOi
         AAF1lIEVak66v0MMEUqZNeZqVKIxrfaEHzWEFlPuDs5DMyPiM2IiyMiCUpBpDmBPPQQK
         T0ZA==
X-Forwarded-Encrypted: i=1; AL+hErFE4YmAGr5WmyEasoM8oec8BXiSft/p47BIZHnRk4AW9K70PN0VXNvNpvA3AMO/FDXGGIl1IcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mJNkRNCaTfFUT7kCNfrEzg+e3n2LXYi0EIt0IyDz3Pwf2WZqa
	LULnYbW8QwkULzRaOgNLBs9ukq3W5gPsWZZPTbcybaqRRRM05d1tgS3mwQw37MYQJxXzinP6xjM
	SqI2ycdyrvGabuw2beQCJZAi1L44mRRU=
X-Gm-Gg: AYBFou0mT3WsYdMkjsfzcQ9/xLE+JZyAtbGeP5CcAujf2j41F0CH9KFG8dWDfy8/NeU
	prxgoPkhwjaBgpYu4VP6M1udigIMxgx6chKPeehH+FD0H83OaCq14ZnNCePIq/h2S/j5XcRFqhn
	kOoIQCz4aHmeK+56kDXzeJAXT0RGveAeYx5s6MX9w6hQ8nPfEYmrGJ13/gWUviHJ2hyC26jcdIx
	cncjn73j1+LImcULsh+tpva7yJCp1V9+EooVG7eYP0trADWXNXItzyQHYrVVedkOErv3+MWiyHo
	WZz2LVkMNyhEdVhhgo9lqGuTYT2vsR+s839NjWWjqcf8KBqiMG06/hkZIIlJ9ASORatZAf1LkyA
	iEnuv7v0k5XPYxsaI5VS6ue4rlF/UiaBxFeVH5RAuVqYiKGhUM1w69Yd2tKShSqqhkHvLbt35jw
	4jCcV4RbymMOWmhX9FV19VeiF2PCEiiiC/poQm
X-Received: by 2002:a05:6a00:2d1b:b0:89e:37b0:d1bc with SMTP id
 d2e1a72fcca58-8beb658dfa5mr10967409b3a.28.1794856814201; Mon, 16 Nov 2026
 11:20:14 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113124625.4010206-5-edumazet@kernel.org> <179484404697.3136.10852363970744263229@kernel.org>
In-Reply-To: <179484404697.3136.10852363970744263229@kernel.org>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 16 Nov 2026 14:20:03 -0500
X-Gm-Features: AclHuK9lkGr_PDkzaRaW8fMRu4GpO2qf42caRW7hNGQP2NB-uQH93uU0ogZ3mOU
Message-ID: <CADvbK_dKiTF4gSjsRuVKUDVTJn-EVVvunmhOOEGyG7Bt6jjeVw@mail.gmail.com>
Subject: Re: [PATCH net 4/5] sctp: use skb_set_transport_header_careful() in sctp_v6_err()
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	willemdebruijn.kernel@gmail.com, marcelo.leitner@gmail.com, 
	aconole@redhat.com, echaudro@redhat.com, i.maximets@ovn.org, 
	daniel@iogearbox.net, justin.iurman@gmail.com, linus.luessing@c0d3.blue, 
	sd@queasysnail.net, sbrivio@redhat.com, imv4bel@gmail.com, 
	netdev@vger.kernel.org, linux-sctp@vger.kernel.org, dev@openvswitch.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:47=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The main part of this concern is fixed later in the series.
>
> --
>
> sctp: use skb_set_transport_header_careful() in sctp_v6_err()
>
> sctp_v6_err() now stores the ICMPv6 inner transport offset with
> skb_set_transport_header_careful(). If the offset does not fit in the
> 16-bit skb->transport_header field, the ICMPv6 error is ignored. Before,
> the offset was silently truncated and sctp_err_lookup() read the SCTP
> header from the wrong place.
>
> > diff --git a/net/sctp/ipv6.c b/net/sctp/ipv6.c
> > index 97390569c4bdc..ad5c951efdf06 100644
> > --- a/net/sctp/ipv6.c
> > +++ b/net/sctp/ipv6.c
> > @@ -170,8 +170,11 @@ static int sctp_v6_err(struct sk_buff *skb, struct=
 inet6_skb_parm *opt,
> >       /* Fix up skb to look at the embedded net header. */
> >       saveip   =3D skb->network_header;
> >       savesctp =3D skb->transport_header;
> > +     if (unlikely(!skb_set_transport_header_careful(skb, offset))) {
> > +             __ICMP6_INC_STATS(net, __in6_dev_get(skb->dev), ICMP6_MIB=
_INERRORS);
> > +             return -EINVAL;
> > +     }
> >       skb_reset_network_header(skb);
> > -     skb_set_transport_header(skb, offset);
> >       sk =3D sctp_err_lookup(net, AF_INET6, skb, sctp_hdr(skb), &asoc, =
&transport);
>
> [Severity: Medium]
>
> This covers native SCTP. Can the SCTP-over-UDPv6 handler in the same file
> still hand a wrapped transport header to sctp_err_lookup()?
>
> sctp_udp_v6_err() is installed as encap_err_lookup. It still does an
> unchecked 16-bit add:
>
> net/sctp/ipv6.c:sctp_udp_v6_err() {
>     ...
>         skb->transport_header +=3D sizeof(struct udphdr);
>         sk =3D sctp_err_lookup(net, AF_INET6, skb, sctp_hdr(skb), &asoc, =
&t);
>     ...
> }
>
> A later patch in this series ("udp: use skb_set_transport_header_careful(=
)
> in __udp6_lib_err_encap()") makes __udp6_lib_err_encap() store the UDP
> header offset carefully. That check only makes sure the UDP header offset
> itself fits and is not U16_MAX, so transport_header can still be as high
> as 0xFFFE when sctp_udp_v6_err() runs.
>
> For a UDP header offset between 0xFFF7 and 0xFFFE, adding 8 gives a bad
> value:
>
>   - 0xFFF7 becomes 0xFFFF, the "not set" value. With CONFIG_DEBUG_NET thi=
s
>     trips the DEBUG_NET_WARN_ON_ONCE() in skb_transport_header().
>   - 0xFFF8 to 0xFFFE wrap to 0..6, so sctp_hdr(skb) points at
>     skb->head + 0..6.
>
> In the wrapped case, sctp_err_lookup() reads vtag from the wrong bytes.
> sctp_v6_from_skb(), called through af->from_skb, also reads sh->source an=
d
> sh->dest from there for the association lookup. When vtag =3D=3D 0, the I=
NIT
> chunk is read with skb_header_pointer() at a negative
> skb_transport_offset().
>
> The commit message says "Should the value be truncated, sctp_err_lookup()
> would read the SCTP header at the wrong place". Would it make sense to
> also check, before the +=3D in sctp_udp_v6_err(), that transport_header +
> sizeof(struct udphdr) fits in 16 bits and is not U16_MAX? Another option
> is for __udp6_lib_err_encap() to reserve room for the payload header.
>
> This needs the same large skb->data - skb->head precondition the series
> describes, and there is no reproducer.
>
> >       /* Put back, the original pointers. */
> >       skb->network_header   =3D saveip;
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261113124625.4010206-1-edumazet%40kernel.org

The new skb->transport_header is used by sctp_hdr(skb) in af->from_skb()
in sctp_err_lookup(). I think it's better to avoid changing
skb->transport_header by passing sctphdr to af->from_skb(), which also
makes code cleaner.

Hi Eric, you can either continue with the idea, or discard this patch and
leave it to me.

Thanks.

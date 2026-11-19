Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097582;
	b=1W27bv9gPKvR1kMuIPbTwbwnsfv56hZj1b5g1ZYyfWxg1nbtM7JkMUoE5y/t7JoiAGUE
	 QYYnK02ayIHlxAlBjkiSGWmlLCBo0j/FtCHd8GzoymOEHRPi4F6lEjVegWY0vAqslIz4d
	 CZ7v6yvpjzIUEN4SMJN1eU5hBRUYvbebZ7HWP3MYjj4t9EQI40TdXFs2ZtaJrHqbtzWE1
	 HwPLMcJZ8g+44W3E081zVppMeEq1HlNZJmrw2qb42YQN/IrmljLkBLepKOkUMVnkUfSy1
	 IzwhEj4nBl4W2zkgBFIZ5BB3OUOu8Ls/NH1f3ghTlDeh3h8uEZ6tcUR4fFa8BnRGZ+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w/ilLozYd3yRSspJfrhijv1emqLes2PCX8KGijxL0l8=;
	b=2pDJg2GOCxsT3BmCxCWWQPD1aoB+sTZyLfFGGxggQvuCTvpceEan1qUBax2WwZIPUSdJ
	 qJW3BbKKVtrV01aRTaz7JpBjS3brOL0crEZrcWehNTRrdV3K9A1UQciwvh0p2MrXon1xT
	 8iavmbYEoWOJ7yJvWfJ8WhRiCK7jfFoD9lDvkBEe4tN3hsRDq7HQgKLJK29ADEqDZGeDf
	 Av1YDMUNCSjtuFc6PAjcBjZ6Qq1UJnPACNO4sBvP5p5xE2SJtY8SmikESOqYg2cJGfNJC
	 nxnxj9cQU5QOH+8TOPmh/1J5H4u2crEt/8CmzUTYAa3vTwf77SjaotghpmpSD5o+MdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pB+6HyHB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B047660A2616
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B047660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pB+6HyHB
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50aaad19fbso260973266b.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097580; cv=none;
        d=google.com; s=arc-20260327;
        b=mZRLELXGCBNW4o9+1+buidB8w3TjhnGvMEiGIOwFgrS4i6lIPY2p84jBHShSjXWm3L
         pv237YbOCTHOyHT9ZaoETodq2s1/fz5UaSx2mcDbLLUoGq9af7KDQFgurR2/u4KFXloz
         yYW+KMGuPzq9lfInHNVeW+imOkWnCWQVb77f1sVMfLgmma3JBWg47ArRGBuC5Wy/g11e
         K57Q+0C1098X6Q+KJmRqbTno4+iJbJSpv39lQcnJUwI7VBdmrr2q03PQeH6HAywi9fVf
         rUcCYIAUl3jd8/8bn6fIpliCZyPfNkyiEay62qhHuIkn8Svb0NWWCKJof0SIfZhvSBpe
         KoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/ilLozYd3yRSspJfrhijv1emqLes2PCX8KGijxL0l8=;
        fh=9e2dYtsVxnYRsZLf/fDDJ/S77N5AiitWLT6wHQM+mM0=;
        b=loZsSywYyoXj2wpW/m+mrwDVbCOz+XI0WsSkIBLdE+AbLeEuEhT6jiGslaow/pNO47
         kQI1NkcuwqaaPw7wSmgfZ5a+9c6tt+0f9inB5ODo4QHb8Cu2tQVgdFroThbWEpHWeKIl
         Ltgg+U+xKUalMhCGFY4el/J8oqpOruQJF92VCfGJEsqfu+mgVizJUCYpM5bSgAVtBlN3
         mQFrvr5IffAAsFKcWWOno1zY+ktMJF0iHgisJ+ZKcIt1vhTlYOSeslr9c8u8edfRinda
         4mDQ1pCv3LfY6KHK9wjEqySP97aMMsYPxdDuIopPlcbFnGDb8t9YsDe8UwWmZ8G+wAs1
         +zaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097580; x=1795702380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/ilLozYd3yRSspJfrhijv1emqLes2PCX8KGijxL0l8=;
        b=pB+6HyHBq795Hz10gM850FSsxP7zowkhuGNbEpeovCZdBGyaWC0s7AIXlE00N/gtcW
         Ar9oMTjXyINVaLNgnFgEJ6PpC0vNshHkeYa590GKgbrQ8+BNdFXnqgJNcyh8EjarIA23
         O2oUEEoQNkQzjt4dihOFEIRqmOUtp6IdpEyYMDi3PUWkCzWYFkLkTqgyqU0zjQz8lIu/
         zTRW2K37Mlg8hjWJuz8TlJ8bsZr8JMCKZ8i0AW8MxQmHdbM3VMZ3QkCVerxATW4opIRi
         bnX+dIkHttZIG5ljy0CUAH8SiL3py6BDHE7S9OLa7+v57idNTW3y7j9xemrcDaz3aPxu
         /YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097580; x=1795702380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/ilLozYd3yRSspJfrhijv1emqLes2PCX8KGijxL0l8=;
        b=aM2JIJpOSGhPPjXoBKxa1+gi5OnONZeK58KdrgAWT+CdF7mUuPnLnhLkCXFo3EnSS0
         KNc+n4cr0SwbeK0KOiz/GRrxXqw6cWUaMaxaSf3iavLzG/s2pEVOD9W0Ik1sLXgyGwgA
         bd3F/F1jypk0uqzFzdmYJ5HUIbHIKtSKpuGIlG1hXifsCqIvCJzoFCVdrj/muVoJwZiG
         +Cr/Za6d5xa4vYgCkPgJJG2ITWNm7dfbqoVN+tlY4TAL0VbBRZzRSuPNoRLTKe+jUSu5
         2HbSHWzTLQqH+AhlnhOrHxIsuU5rRFArAg/jFi3NbCvymAS27P3esCXn2chaJfFUs+xo
         4RJQ==
X-Forwarded-Encrypted: i=1; AL+hErG3t38SaJV+nWzQrXAa0DskOf8R7XHiUdKL2JEmvcaqvvXT6/42Vfpju0uVzUIMg3osjtFges4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fdOjUB55Rqn+U4GNHSCwtBaZZTeqa8LYnYamy2pgxdyaUGekM
	4eQeDcS22bt8HQv47vGuAs0bptAT+3F6e+v0iaiu6IoBcq5BSJYMMhv9RDB/9PlfU2g2Cy84N4X
	9Lloi0tgu2G/JLSZN4EOj15RQDVMHGBs4pfEDze3g
X-Gm-Gg: AYBFou1pY9jPTUwz1/gLEIHNNNa+o9uba3OXCLZfIvVk/XVIkv0ZA3JdzJfYFbsVdJT
	HLcpNFWMKmhnPgd31YjeTMLmlFozz3KW3vWW4wuLTb4VRRw0V2iTdX3B7HN8SSP4+dR3Ojfv3PE
	KyWf4VXfx3QvMNMc1x2fEHWdk3JlRokNVd31UrFtA3KvuheIpuvmcB1GQuP5moSqyXbWk1GCDee
	1cal70TaSJp5m3Qiyh5BgyaB2R0ahw7nrdC4BdlwmYvrY0foCKtF2pt2/jAahIwyqMGwCkKQSKZ
	GjTWnp5sOc8g4lvVPodaG6wrYR+vkqrIAavcJtRH14etLvq8VXHgQCi9iGKxMzdM/OHuLANg0fa
	ixm/rjlZKXmSJGgKoZsNB5xJdpZmAf6lEfuTLDyOtPtrQpQsxcGtc6ND+UgVSecu1HlzUR1gFTj
	pJ1uzXIeLZVqSwyno=
X-Received: by 2002:a17:906:c104:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c513a434889mr1072366b.7.1795097579236; Thu, 19 Nov 2026
 06:12:59 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116224308.986555-1-joshwash@google.com> <179495835918.3136.2006086240050992361@kernel.org>
 <CAJcM6BGpwRPm6bhRWp6BWLsaTzwYd__x=tyQqpAcbOKsBCxekQ@mail.gmail.com>
In-Reply-To: <CAJcM6BGpwRPm6bhRWp6BWLsaTzwYd__x=tyQqpAcbOKsBCxekQ@mail.gmail.com>
From: Ankit Garg <nktgrg@google.com>
Date: Thu, 19 Nov 2026 06:12:47 -0800
X-Gm-Features: AclHuK8WoTWkqmw29NUYRmt8h6v6x5oiORA3vRlTHvm3zvXH5MgdiZe-ehExt1k
Message-ID: <CAJcM6BF1HLM2MPUrsEpq+qE8H788vxn7JTNVOcd3B+0ReCtdeA@mail.gmail.com>
Subject: Re: [PATCH net v2] gve: fix checksum state and gso_segs of HW-GRO packets
To: netdev-bot+sashiko@kernel.org
Cc: joshwash@google.com, netdev@vger.kernel.org, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, jordanrhee@google.com, thostet@google.com, 
	willemb@google.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	pkaligineedi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:33=E2=80=AFPM Ankit Garg <nktgrg@google.com> wrot=
e:
>
> On Tue, Nov 17, 2026 at 3:32=E2=80=AFPM <netdev-bot+sashiko@kernel.org> w=
rote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] gve_rx_complete_rsc()
> >   (drivers/net/ethernet/google/gve/gve_rx_dqo.c) works out where the TC=
P=E2=80=A6
> >
> > --
> >
> > gve: fix checksum state and gso_segs of HW-GRO packets
> >
> > This patch makes gve_rx_complete_rsc() set the network and transport
> > headers on HW-GRO packets. For device-verified packets it also seeds
> > th->check with the TCP pseudo-header checksum and calls tcp_gro_complet=
e(),
> > so forwarded HW-GRO skbs can be resegmented correctly. IPv4 and IPv6 ar=
e
> > now told apart by EtherType, and gso_segs is computed from the TCP payl=
oad
> > length.
> >
> > > diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/n=
et/ethernet/google/gve/gve_rx_dqo.c
> > > index 82ed5e48b00ab..b4dbfb1ba39b0 100644
> > > --- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> > > +++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> >
> > [ ... ]
> >
> > > @@ -1049,10 +1061,50 @@ static int gve_rx_complete_rsc(struct sk_buff=
 *skb,
> > >               skb_frag_off_add(frag, hdr_len);
> > >               skb->data_len -=3D hdr_len;
> > >               skb->tail +=3D hdr_len;
> > > +             /* napi_gro_frags() pulls the Ethernet header later. */
> > > +             nhoff =3D ETH_HLEN;
> > > +     }
> > > +
> > > +     /* The header lengths come from the packet, so make sure the he=
aders are
> > > +      * in the linear part before reading them and writing th->check=
.
> > > +      */
> > > +     if (unlikely(skb_headlen(skb) < nhoff + sizeof(struct iphdr)))
> > > +             return -EINVAL;
> > > +
> > > +     skb_set_network_header(skb, nhoff);
> > > +     proto =3D nhoff ? ((struct ethhdr *)skb->data)->h_proto : skb->=
protocol;
> > > +     switch (proto) {
> > > +     case htons(ETH_P_IP):
> > > +             gso_type =3D SKB_GSO_TCPV4;
> > > +             thoff =3D nhoff + ip_hdrlen(skb);
> > > +             break;
> > > +     case htons(ETH_P_IPV6):
> > > +             gso_type =3D SKB_GSO_TCPV6;
> > > +             thoff =3D nhoff + sizeof(struct ipv6hdr);
> >
> > [Severity: Medium]
> > Is it safe to assume the TCP header comes right after the fixed IPv6
> > header here?
> >
> > Nothing checks ipv6_hdr(skb)->nexthdr =3D=3D IPPROTO_TCP or desc->ipv6_=
ex_add.
> > The IPv4 case above also uses ip_hdrlen() without checking
> > ip_hdr(skb)->protocol =3D=3D IPPROTO_TCP. The only sign that L4 is TCP =
is the
> > ptype.l4_type check at the top of gve_rx_complete_rsc().
> >
> > The descriptor suggests the device does parse IPv6 extension headers:
> >
> > gve_desc_dqo.h:
> >         /* Set when IPv6 packet contains a destination options header o=
r routing
> >          * header.
> >          */
> >         u8 ipv6_ex_add: 1;
> >
> > gve_rx_skb_csum() only holds back CHECKSUM_UNNECESSARY when that bit is
> > set:
> >
> >         } else if (ptype.l3_type =3D=3D GVE_L3_TYPE_IPV6) {
> >                 /* Checksum should be skipped if this flag is set. */
> >                 if (unlikely(desc->ipv6_ex_add))
> >                         return;
> >         }
> >
> > So an IPv6/TCP packet with a hop-by-hop header and a device-verified
> > checksum would still be CHECKSUM_UNNECESSARY when it gets here.
> >
> > Suppose the device coalesces such a packet, or a tunnelled packet whose
> > ptype reports the inner L4 as TCP. Then thoff would point into the
> > extension or tunnel header, and tcp_hdrlen() would read doff from the
> > wrong bytes.
> >
> > gve_rx_fixup_gro_checksum() would then write the pseudo-header seed at
> > that offset:
> >
> >         th->check =3D ~tcp_v6_check(len, &ipv6_hdr(skb)->saddr,
> >                                   &ipv6_hdr(skb)->daddr, 0);
> >
> > tcp_gro_complete() would also set csum_start, csum_offset and
> > CHECKSUM_PARTIAL at that offset.
> >
> > Wouldn't a forwarded packet then leave through TSO/GSO with a bad
> > checksum? That is the same blackholing this patch sets out to fix.
> >
> > The destination-options and routing cases are CHECKSUM_NONE, but they
> > still hit the wrong doff. That could drop a valid packet with -EINVAL o=
r
> > give it a wrong gso_segs. It could also take the new early return:
> >
> >         payload =3D skb->len - thoff - tcp_hdrlen(skb);
> >         if (payload <=3D rsc_seg_len)
> >                 return 0;
> >
> > and deliver a multi-segment coalesced packet without gso_size.
> >
> > Before this patch the RSC path never read or wrote the TCP header, so
> > this assumption is new. The changelog gives the VLAN guarantee ("The
> > device does not coalesce VLAN tagged frames"), but says nothing about
> > IPv6 extension headers or encapsulation.
> >
> > For comparison, bnx2x_set_gro_params() documents the matching hardware
> > guarantee ("TPA aggregation won't have either IP options or TCP options
> > other than timestamp or IPv6 extension headers"). The mlx5 SHAMPO path
> > checks ipv6->nexthdr =3D=3D IPPROTO_TCP.
> >
> > Could the device guarantee be documented in the changelog and in a
> > comment? Alternatively, could this check ip_hdr(skb)->protocol and
> > ipv6_hdr(skb)->nexthdr against IPPROTO_TCP (and ihl >=3D 5), and skip t=
he
> > GSO and checksum fixup otherwise?
> >
> GVE device doesn't coalesce IPv6 packets with extension headers. I
> will send a v3 documenting that guarantee in changelog.
> > --
> > Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/pat=
chset/20261116224308.986555-1-joshwash%40google.com
> pw-bot: cr

This is superseded by v3
(https://lore.kernel.org/netdev/20261118212045.3575303-1-joshwash@google.co=
m/).
Replying again to get patchwork bot to mark v2 as such.

pw-bot: cr
